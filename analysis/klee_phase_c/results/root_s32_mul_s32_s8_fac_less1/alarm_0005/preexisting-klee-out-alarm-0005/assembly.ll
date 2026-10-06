; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/build/root_s32_mul_s32_s8_fac_less1_alarm_0005.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"count\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [72 x i8] c"KLEE-ALARM-0005: invalid RHS operand for shift. assert 0 <= count < 32;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0005.err\00", align 1
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
  %count = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i8* %factor, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %count, metadata !58, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %result, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = bitcast i32* %value to i8*, !dbg !65
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @klee_make_symbolic(i8* %factor, i64 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  %1 = bitcast i32* %count to i8*, !dbg !68
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  %2 = load i32, i32* %value, align 4, !dbg !70
  %3 = load i8, i8* %factor, align 1, !dbg !71
  %4 = load i32, i32* %count, align 4, !dbg !72
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %2, i8 signext %3, i32 %4), !dbg !73
  store i32 %call, i32* %result, align 4, !dbg !74
  %5 = load i32, i32* %result, align 4, !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !77 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !85, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !89
  %0 = load i8, i8* %value.addr, align 1, !dbg !90
  %conv = sext i8 %0 to i32, !dbg !90
  %1 = load i16, i16* %factor.addr, align 2, !dbg !91
  %conv1 = zext i16 %1 to i32, !dbg !91
  %mul = mul nsw i32 %conv, %conv1, !dbg !92
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !93
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !94
  %shr = ashr i32 %2, 16, !dbg !95
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !96
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !97
  %cmp = icmp slt i32 %3, 0, !dbg !99
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !100

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !101
  %and = and i32 %4, 65535, !dbg !102
  %cmp3 = icmp ne i32 %and, 0, !dbg !103
  br i1 %cmp3, label %if.then, label %if.else, !dbg !104

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !105
  %add = add nsw i32 %5, 1, !dbg !107
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !108
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !109
  %conv5 = trunc i32 %6 to i8, !dbg !110
  store i8 %conv5, i8* %retval, align 1, !dbg !111
  br label %return, !dbg !111

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !112
  %conv6 = trunc i32 %7 to i8, !dbg !114
  store i8 %conv6, i8* %retval, align 1, !dbg !115
  br label %return, !dbg !115

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !116
  ret i8 %8, !dbg !116
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !117 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !124, metadata !DIExpression()), !dbg !125
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !125
  %0 = load i8, i8* %value.addr, align 1, !dbg !126
  %conv = sext i8 %0 to i32, !dbg !126
  %1 = load i16, i16* %factor.addr, align 2, !dbg !127
  %conv1 = zext i16 %1 to i32, !dbg !127
  %mul = mul nsw i32 %conv, %conv1, !dbg !128
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !129
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !130
  %shr = ashr i32 %2, 8, !dbg !131
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !132
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !133
  %cmp = icmp slt i32 %3, 0, !dbg !135
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !136

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !137
  %and = and i32 %4, 255, !dbg !138
  %cmp3 = icmp ne i32 %and, 0, !dbg !139
  br i1 %cmp3, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !141
  %add = add nsw i32 %5, 1, !dbg !143
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !144
  br label %if.end, !dbg !145

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !146
  %cmp5 = icmp slt i32 %6, 127, !dbg !148
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !149

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !150
  %cmp8 = icmp sgt i32 %7, -128, !dbg !153
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !154

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !155
  %conv11 = trunc i32 %8 to i8, !dbg !157
  store i8 %conv11, i8* %retval, align 1, !dbg !158
  br label %return, !dbg !158

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !159
  br label %return, !dbg !159

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !161
  br label %return, !dbg !161

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !163
  ret i8 %9, !dbg !163
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !164 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !167, metadata !DIExpression()), !dbg !168
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !169, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !171, metadata !DIExpression()), !dbg !172
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !172
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !173, metadata !DIExpression()), !dbg !174
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !174
  %0 = load i8, i8* %value.addr, align 1, !dbg !175
  %conv = sext i8 %0 to i32, !dbg !175
  %1 = load i8, i8* %factor.addr, align 1, !dbg !176
  %conv1 = zext i8 %1 to i32, !dbg !176
  %mul = mul nsw i32 %conv, %conv1, !dbg !177
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !178
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !179
  %shr = ashr i32 %2, 8, !dbg !180
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !181
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !182
  %cmp = icmp slt i32 %3, 0, !dbg !184
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !185

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !186
  %and = and i32 %4, 255, !dbg !187
  %cmp3 = icmp ne i32 %and, 0, !dbg !188
  br i1 %cmp3, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !190
  %add = add nsw i32 %5, 1, !dbg !192
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !193
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !194
  %conv5 = trunc i32 %6 to i8, !dbg !195
  store i8 %conv5, i8* %retval, align 1, !dbg !196
  br label %return, !dbg !196

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !197
  %conv6 = trunc i32 %7 to i8, !dbg !199
  store i8 %conv6, i8* %retval, align 1, !dbg !200
  br label %return, !dbg !200

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !201
  ret i8 %8, !dbg !201
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !202 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !203, metadata !DIExpression()), !dbg !204
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !208
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !210
  %0 = load i8, i8* %value.addr, align 1, !dbg !211
  %conv = sext i8 %0 to i32, !dbg !211
  %1 = load i8, i8* %factor.addr, align 1, !dbg !212
  %conv1 = zext i8 %1 to i32, !dbg !212
  %mul = mul nsw i32 %conv, %conv1, !dbg !213
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !214
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !215
  %shr = ashr i32 %2, 7, !dbg !216
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !217
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !218
  %cmp = icmp slt i32 %3, 0, !dbg !220
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !221

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !222
  %and = and i32 %4, 127, !dbg !223
  %cmp3 = icmp ne i32 %and, 0, !dbg !224
  br i1 %cmp3, label %if.then, label %if.end, !dbg !225

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !226
  %add = add nsw i32 %5, 1, !dbg !228
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !229
  br label %if.end, !dbg !230

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !231
  %cmp5 = icmp slt i32 %6, 127, !dbg !233
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !234

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !235
  %cmp8 = icmp sgt i32 %7, -128, !dbg !238
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !239

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !240
  %conv11 = trunc i32 %8 to i8, !dbg !242
  store i8 %conv11, i8* %retval, align 1, !dbg !243
  br label %return, !dbg !243

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !244
  br label %return, !dbg !244

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !246
  br label %return, !dbg !246

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !248
  ret i8 %9, !dbg !248
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !249 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !252, metadata !DIExpression()), !dbg !253
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !254, metadata !DIExpression()), !dbg !255
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !256, metadata !DIExpression()), !dbg !257
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 0, i32* %s32MulTemp, align 4, !dbg !259
  %0 = load i16, i16* %value.addr, align 2, !dbg !260
  %conv = sext i16 %0 to i32, !dbg !260
  %1 = load i16, i16* %factor.addr, align 2, !dbg !261
  %conv1 = sext i16 %1 to i32, !dbg !261
  %mul = mul nsw i32 %conv, %conv1, !dbg !262
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !263
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !264
  %3 = load i32, i32* %count.addr, align 4, !dbg !265
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !266
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !266
  %div = sdiv i32 %2, %3, !dbg !266, !klee.check.div !267
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !268
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !269
  %conv2 = trunc i32 %4 to i16, !dbg !269
  ret i16 %conv2, !dbg !270
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !271 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !272, metadata !DIExpression()), !dbg !273
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !274, metadata !DIExpression()), !dbg !275
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !278, metadata !DIExpression()), !dbg !279
  store i32 0, i32* %s32MulTemp, align 4, !dbg !279
  %0 = load i16, i16* %value.addr, align 2, !dbg !280
  %conv = sext i16 %0 to i32, !dbg !280
  %1 = load i16, i16* %factor.addr, align 2, !dbg !281
  %conv1 = sext i16 %1 to i32, !dbg !281
  %mul = mul nsw i32 %conv, %conv1, !dbg !282
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !283
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !284
  %3 = load i32, i32* %count.addr, align 4, !dbg !285
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !286
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !286
  %div = sdiv i32 %2, %3, !dbg !286, !klee.check.div !267
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !287
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !288
  %cmp = icmp slt i32 %4, 32767, !dbg !290
  br i1 %cmp, label %if.then, label %if.else7, !dbg !291

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !292
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !295
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !296

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !297
  %conv6 = trunc i32 %6 to i16, !dbg !299
  store i16 %conv6, i16* %retval, align 2, !dbg !300
  br label %return, !dbg !300

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !301
  br label %return, !dbg !301

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !303
  br label %return, !dbg !303

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !305
  ret i16 %7, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !306 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !309, metadata !DIExpression()), !dbg !310
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !311, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !313, metadata !DIExpression()), !dbg !314
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !314
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !315, metadata !DIExpression()), !dbg !316
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !316
  %0 = load i16, i16* %value.addr, align 2, !dbg !317
  %conv = sext i16 %0 to i32, !dbg !317
  %1 = load i16, i16* %factor.addr, align 2, !dbg !318
  %conv1 = sext i16 %1 to i32, !dbg !318
  %mul = mul nsw i32 %conv, %conv1, !dbg !319
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !320
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !321
  %shr = ashr i32 %2, 15, !dbg !322
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !323
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !324
  %cmp = icmp slt i32 %3, 0, !dbg !326
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !327

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !328
  %and = and i32 %4, 32767, !dbg !329
  %cmp3 = icmp ne i32 %and, 0, !dbg !330
  br i1 %cmp3, label %if.then, label %if.end, !dbg !331

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !332
  %add = add nsw i32 %5, 1, !dbg !334
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !335
  br label %if.end, !dbg !336

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !337
  %cmp5 = icmp slt i32 %6, 32767, !dbg !339
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !340

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !341
  %conv8 = trunc i32 %7 to i16, !dbg !343
  store i16 %conv8, i16* %retval, align 2, !dbg !344
  br label %return, !dbg !344

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !345
  br label %return, !dbg !345

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !347
  ret i16 %8, !dbg !347
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !348 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !349, metadata !DIExpression()), !dbg !350
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !353, metadata !DIExpression()), !dbg !354
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !354
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !355, metadata !DIExpression()), !dbg !356
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !356
  %0 = load i16, i16* %value.addr, align 2, !dbg !357
  %conv = sext i16 %0 to i32, !dbg !357
  %1 = load i16, i16* %factor.addr, align 2, !dbg !358
  %conv1 = sext i16 %1 to i32, !dbg !358
  %mul = mul nsw i32 %conv, %conv1, !dbg !359
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !360
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !361
  %shr = ashr i32 %2, 14, !dbg !362
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !363
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !364
  %cmp = icmp slt i32 %3, 0, !dbg !366
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !367

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !368
  %and = and i32 %4, 16383, !dbg !369
  %cmp3 = icmp ne i32 %and, 0, !dbg !370
  br i1 %cmp3, label %if.then, label %if.end, !dbg !371

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !372
  %add = add nsw i32 %5, 1, !dbg !374
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !375
  br label %if.end, !dbg !376

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !377
  %cmp5 = icmp slt i32 %6, 32767, !dbg !379
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !380

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !381
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !384
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !385

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !386
  %conv11 = trunc i32 %8 to i16, !dbg !388
  store i16 %conv11, i16* %retval, align 2, !dbg !389
  br label %return, !dbg !389

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !392
  br label %return, !dbg !392

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !394
  ret i16 %9, !dbg !394
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !395 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !398, metadata !DIExpression()), !dbg !399
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !400, metadata !DIExpression()), !dbg !401
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !402, metadata !DIExpression()), !dbg !403
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !403
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !404, metadata !DIExpression()), !dbg !405
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !405
  %0 = load i16, i16* %value.addr, align 2, !dbg !406
  %conv = sext i16 %0 to i32, !dbg !406
  %1 = load i16, i16* %factor.addr, align 2, !dbg !407
  %conv1 = zext i16 %1 to i32, !dbg !407
  %mul = mul nsw i32 %conv, %conv1, !dbg !408
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !409
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !410
  %shr = ashr i32 %2, 16, !dbg !411
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !412
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !413
  %cmp = icmp slt i32 %3, 0, !dbg !415
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !416

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !417
  %and = and i32 %4, 32767, !dbg !418
  %cmp3 = icmp ne i32 %and, 0, !dbg !419
  br i1 %cmp3, label %if.then, label %if.else, !dbg !420

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !421
  %add = add nsw i32 %5, 1, !dbg !423
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !424
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !425
  %conv5 = trunc i32 %6 to i16, !dbg !426
  store i16 %conv5, i16* %retval, align 2, !dbg !427
  br label %return, !dbg !427

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !428
  %conv6 = trunc i32 %7 to i16, !dbg !430
  store i16 %conv6, i16* %retval, align 2, !dbg !431
  br label %return, !dbg !431

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !432
  ret i16 %8, !dbg !432
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !433 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !434, metadata !DIExpression()), !dbg !435
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !436, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !438, metadata !DIExpression()), !dbg !439
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !439
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !440, metadata !DIExpression()), !dbg !441
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !441
  %0 = load i16, i16* %value.addr, align 2, !dbg !442
  %conv = sext i16 %0 to i32, !dbg !442
  %1 = load i16, i16* %factor.addr, align 2, !dbg !443
  %conv1 = zext i16 %1 to i32, !dbg !443
  %mul = mul nsw i32 %conv, %conv1, !dbg !444
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !445
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !446
  %shr = ashr i32 %2, 8, !dbg !447
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !448
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !449
  %cmp = icmp slt i32 %3, 0, !dbg !451
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !452

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !453
  %and = and i32 %4, 255, !dbg !454
  %cmp3 = icmp ne i32 %and, 0, !dbg !455
  br i1 %cmp3, label %if.then, label %if.end, !dbg !456

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !457
  %add = add nsw i32 %5, 1, !dbg !459
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !460
  br label %if.end, !dbg !461

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !462
  %cmp5 = icmp slt i32 %6, 32767, !dbg !464
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !465

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !466
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !469
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !470

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !471
  %conv11 = trunc i32 %8 to i16, !dbg !473
  store i16 %conv11, i16* %retval, align 2, !dbg !474
  br label %return, !dbg !474

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !475
  br label %return, !dbg !475

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !477
  br label %return, !dbg !477

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !479
  ret i16 %9, !dbg !479
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !480 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !483, metadata !DIExpression()), !dbg !484
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !485, metadata !DIExpression()), !dbg !486
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !487, metadata !DIExpression()), !dbg !488
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !488
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !489, metadata !DIExpression()), !dbg !490
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !490
  %0 = load i16, i16* %value.addr, align 2, !dbg !491
  %conv = sext i16 %0 to i32, !dbg !491
  %1 = load i8, i8* %factor.addr, align 1, !dbg !492
  %conv1 = zext i8 %1 to i32, !dbg !492
  %mul = mul nsw i32 %conv, %conv1, !dbg !493
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !494
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !495
  %shr = ashr i32 %2, 8, !dbg !496
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !497
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !498
  %cmp = icmp slt i32 %3, 0, !dbg !500
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !501

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !502
  %and = and i32 %4, 255, !dbg !503
  %cmp3 = icmp ne i32 %and, 0, !dbg !504
  br i1 %cmp3, label %if.then, label %if.else, !dbg !505

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !506
  %add = add nsw i32 %5, 1, !dbg !508
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !509
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !510
  %conv5 = trunc i32 %6 to i16, !dbg !510
  store i16 %conv5, i16* %retval, align 2, !dbg !511
  br label %return, !dbg !511

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !512
  %conv6 = trunc i32 %7 to i16, !dbg !512
  store i16 %conv6, i16* %retval, align 2, !dbg !514
  br label %return, !dbg !514

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !515
  ret i16 %8, !dbg !515
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !516 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !517, metadata !DIExpression()), !dbg !518
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !519, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !521, metadata !DIExpression()), !dbg !522
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !522
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !523, metadata !DIExpression()), !dbg !524
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !524
  %0 = load i16, i16* %value.addr, align 2, !dbg !525
  %conv = sext i16 %0 to i32, !dbg !525
  %1 = load i8, i8* %factor.addr, align 1, !dbg !526
  %conv1 = zext i8 %1 to i32, !dbg !526
  %mul = mul nsw i32 %conv, %conv1, !dbg !527
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !528
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !529
  %shr = ashr i32 %2, 7, !dbg !530
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !531
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !532
  %cmp = icmp slt i32 %3, 0, !dbg !534
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !535

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !536
  %and = and i32 %4, 127, !dbg !537
  %cmp3 = icmp ne i32 %and, 0, !dbg !538
  br i1 %cmp3, label %if.then, label %if.end, !dbg !539

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !540
  %add = add nsw i32 %5, 1, !dbg !542
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !543
  br label %if.end, !dbg !544

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !545
  %cmp5 = icmp slt i32 %6, 32767, !dbg !547
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !548

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !549
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !552
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !553

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !554
  %conv11 = trunc i32 %8 to i16, !dbg !556
  store i16 %conv11, i16* %retval, align 2, !dbg !557
  br label %return, !dbg !557

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !560
  br label %return, !dbg !560

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !562
  ret i16 %9, !dbg !562
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !563 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !564, metadata !DIExpression()), !dbg !565
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !566, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !568, metadata !DIExpression()), !dbg !569
  store i32 0, i32* %s32MulTemp, align 4, !dbg !569
  %0 = load i16, i16* %value.addr, align 2, !dbg !570
  %conv = sext i16 %0 to i32, !dbg !570
  %1 = load i16, i16* %factor.addr, align 2, !dbg !571
  %conv1 = zext i16 %1 to i32, !dbg !571
  %mul = mul nsw i32 %conv, %conv1, !dbg !572
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !573
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !574
  %cmp = icmp slt i32 %2, 32767, !dbg !576
  br i1 %cmp, label %if.then, label %if.else7, !dbg !577

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !578
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !581
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !582

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !583
  %conv6 = trunc i32 %4 to i16, !dbg !585
  store i16 %conv6, i16* %retval, align 2, !dbg !586
  br label %return, !dbg !586

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !587
  br label %return, !dbg !587

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !589
  br label %return, !dbg !589

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !591
  ret i16 %5, !dbg !591
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !592 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !595, metadata !DIExpression()), !dbg !596
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !597, metadata !DIExpression()), !dbg !598
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !601, metadata !DIExpression()), !dbg !602
  store i32 0, i32* %s32MulTemp, align 4, !dbg !602
  %0 = load i16, i16* %value.addr, align 2, !dbg !603
  %conv = sext i16 %0 to i32, !dbg !603
  %1 = load i16, i16* %factor.addr, align 2, !dbg !604
  %conv1 = zext i16 %1 to i32, !dbg !604
  %mul = mul nsw i32 %conv, %conv1, !dbg !605
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !606
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !607
  %3 = load i32, i32* %count.addr, align 4, !dbg !608
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !609
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !609
  %div = sdiv i32 %2, %3, !dbg !609, !klee.check.div !267
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !610
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !611
  %conv2 = trunc i32 %4 to i16, !dbg !612
  ret i16 %conv2, !dbg !613
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !614 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !617, metadata !DIExpression()), !dbg !618
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !619, metadata !DIExpression()), !dbg !620
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !621, metadata !DIExpression()), !dbg !622
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !623, metadata !DIExpression()), !dbg !624
  store i32 0, i32* %s32MulTemp, align 4, !dbg !624
  %0 = load i16, i16* %value.addr, align 2, !dbg !625
  %conv = sext i16 %0 to i32, !dbg !625
  %1 = load i16, i16* %factor.addr, align 2, !dbg !626
  %conv1 = zext i16 %1 to i32, !dbg !626
  %mul = mul nsw i32 %conv, %conv1, !dbg !627
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !628
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !629
  %3 = load i16, i16* %count.addr, align 2, !dbg !630
  %conv2 = zext i16 %3 to i32, !dbg !630
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !631
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !631
  %div = sdiv i32 %2, %conv2, !dbg !631, !klee.check.div !267
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !632
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !633
  %cmp = icmp slt i32 %4, 32767, !dbg !635
  br i1 %cmp, label %if.then, label %if.else8, !dbg !636

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !637
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !640
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !641

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !642
  %conv7 = trunc i32 %6 to i16, !dbg !644
  store i16 %conv7, i16* %retval, align 2, !dbg !645
  br label %return, !dbg !645

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !646
  br label %return, !dbg !646

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !648
  br label %return, !dbg !648

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !650
  ret i16 %7, !dbg !650
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !651 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !652, metadata !DIExpression()), !dbg !653
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !654, metadata !DIExpression()), !dbg !655
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !656, metadata !DIExpression()), !dbg !657
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !657
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !658, metadata !DIExpression()), !dbg !659
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !659
  %0 = load i16, i16* %value.addr, align 2, !dbg !660
  %conv = sext i16 %0 to i32, !dbg !660
  %1 = load i16, i16* %factor.addr, align 2, !dbg !661
  %conv1 = zext i16 %1 to i32, !dbg !661
  %mul = mul nsw i32 %conv, %conv1, !dbg !662
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !663
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !664
  %shr = ashr i32 %2, 16, !dbg !665
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !666
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !667
  %cmp = icmp slt i32 %3, 0, !dbg !669
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !670

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !671
  %and = and i32 %4, 65535, !dbg !672
  %cmp3 = icmp ne i32 %and, 0, !dbg !673
  br i1 %cmp3, label %if.then, label %if.else, !dbg !674

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !675
  %add = add nsw i32 %5, 1, !dbg !677
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !678
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !679
  %conv5 = trunc i32 %6 to i16, !dbg !680
  store i16 %conv5, i16* %retval, align 2, !dbg !681
  br label %return, !dbg !681

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !682
  %conv6 = trunc i32 %7 to i16, !dbg !684
  store i16 %conv6, i16* %retval, align 2, !dbg !685
  br label %return, !dbg !685

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !686
  ret i16 %8, !dbg !686
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !687 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !688, metadata !DIExpression()), !dbg !689
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !690, metadata !DIExpression()), !dbg !691
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !692, metadata !DIExpression()), !dbg !693
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !693
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !694, metadata !DIExpression()), !dbg !695
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !695
  %0 = load i16, i16* %value.addr, align 2, !dbg !696
  %conv = sext i16 %0 to i32, !dbg !696
  %1 = load i16, i16* %factor.addr, align 2, !dbg !697
  %conv1 = zext i16 %1 to i32, !dbg !697
  %mul = mul nsw i32 %conv, %conv1, !dbg !698
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !699
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !700
  %shr = ashr i32 %2, 15, !dbg !701
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !702
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !703
  %cmp = icmp slt i32 %3, 0, !dbg !705
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !706

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !707
  %and = and i32 %4, 32767, !dbg !708
  %cmp3 = icmp ne i32 %and, 0, !dbg !709
  br i1 %cmp3, label %if.then, label %if.end, !dbg !710

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !711
  %add = add nsw i32 %5, 1, !dbg !713
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !714
  br label %if.end, !dbg !715

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !716
  %cmp5 = icmp slt i32 %6, 32767, !dbg !718
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !719

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !720
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !723
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !724

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !725
  %conv11 = trunc i32 %8 to i16, !dbg !727
  store i16 %conv11, i16* %retval, align 2, !dbg !728
  br label %return, !dbg !728

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !731
  br label %return, !dbg !731

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !733
  ret i16 %9, !dbg !733
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !734 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !737, metadata !DIExpression()), !dbg !738
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !739, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !741, metadata !DIExpression()), !dbg !743
  store i32 0, i32* %u32MulTemp, align 4, !dbg !743
  %0 = load i16, i16* %value.addr, align 2, !dbg !744
  %conv = zext i16 %0 to i32, !dbg !744
  %1 = load i16, i16* %factor.addr, align 2, !dbg !745
  %conv1 = zext i16 %1 to i32, !dbg !745
  %mul = mul nsw i32 %conv, %conv1, !dbg !746
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !747
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !748
  %shr = lshr i32 %2, 8, !dbg !749
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !750
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !751
  %cmp = icmp ult i32 %3, 32767, !dbg !753
  br i1 %cmp, label %if.then, label %if.else, !dbg !754

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !755
  %conv3 = trunc i32 %4 to i16, !dbg !757
  store i16 %conv3, i16* %retval, align 2, !dbg !758
  br label %return, !dbg !758

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !759
  br label %return, !dbg !759

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !761
  ret i16 %5, !dbg !761
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !762 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !765, metadata !DIExpression()), !dbg !766
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !767, metadata !DIExpression()), !dbg !768
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !769, metadata !DIExpression()), !dbg !770
  store i32 0, i32* %s32MulTemp, align 4, !dbg !770
  %0 = load i16, i16* %value.addr, align 2, !dbg !771
  %conv = sext i16 %0 to i32, !dbg !771
  %1 = load i16, i16* %factor.addr, align 2, !dbg !772
  %conv1 = zext i16 %1 to i32, !dbg !772
  %mul = mul nsw i32 %conv, %conv1, !dbg !773
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !774
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !775
  ret i32 %2, !dbg !776
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !777 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !780, metadata !DIExpression()), !dbg !781
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !782, metadata !DIExpression()), !dbg !783
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !784, metadata !DIExpression()), !dbg !785
  store i32 0, i32* %s32Temp1, align 4, !dbg !785
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !786, metadata !DIExpression()), !dbg !787
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !787
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !788, metadata !DIExpression()), !dbg !789
  store i32 0, i32* %s32Factor, align 4, !dbg !789
  %0 = load i16, i16* %factor.addr, align 2, !dbg !790
  %conv = zext i16 %0 to i32, !dbg !790
  store i32 %conv, i32* %s32Factor, align 4, !dbg !791
  %1 = load i16, i16* %factor.addr, align 2, !dbg !792
  %conv1 = zext i16 %1 to i32, !dbg !792
  %cmp = icmp ne i32 %conv1, 0, !dbg !794
  br i1 %cmp, label %if.then, label %if.else19, !dbg !795

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !796
  %cmp3 = icmp slt i32 %2, 0, !dbg !799
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !800

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !801
  %4 = load i32, i32* %s32Factor, align 4, !dbg !803
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !804
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !804
  %div = sdiv i32 %3, %4, !dbg !804, !klee.check.div !267
  store i32 %div, i32* %s32Temp1, align 4, !dbg !805
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !806
  %6 = load i32, i32* %value.addr, align 4, !dbg !808
  %cmp6 = icmp sge i32 %5, %6, !dbg !809
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !810

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !811
  br label %return, !dbg !811

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !813
  %8 = load i16, i16* %factor.addr, align 2, !dbg !815
  %conv9 = zext i16 %8 to i32, !dbg !815
  %mul = mul nsw i32 %7, %conv9, !dbg !816
  store i32 %mul, i32* %retval, align 4, !dbg !817
  br label %return, !dbg !817

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !818
  %conv11 = zext i16 %9 to i32, !dbg !818
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !821
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !821
  %div12 = udiv i32 2147483647, %conv11, !dbg !821, !klee.check.div !267
  %10 = load i32, i32* %value.addr, align 4, !dbg !822
  %cmp13 = icmp ule i32 %div12, %10, !dbg !823
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !824

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !825
  br label %return, !dbg !825

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !827
  %12 = load i16, i16* %factor.addr, align 2, !dbg !829
  %conv17 = zext i16 %12 to i32, !dbg !829
  %mul18 = mul nsw i32 %11, %conv17, !dbg !830
  store i32 %mul18, i32* %retval, align 4, !dbg !831
  br label %return, !dbg !831

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !832
  br label %return, !dbg !832

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !834
  ret i32 %13, !dbg !834
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !835 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !838, metadata !DIExpression()), !dbg !839
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !840, metadata !DIExpression()), !dbg !841
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !842, metadata !DIExpression()), !dbg !843
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !844, metadata !DIExpression()), !dbg !845
  store i16 0, i16* %u16MulTemp, align 2, !dbg !845
  %0 = load i8, i8* %value.addr, align 1, !dbg !846
  %conv = zext i8 %0 to i32, !dbg !846
  %1 = load i8, i8* %factor.addr, align 1, !dbg !847
  %conv1 = zext i8 %1 to i32, !dbg !847
  %mul = mul nsw i32 %conv, %conv1, !dbg !848
  %conv2 = trunc i32 %mul to i16, !dbg !846
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !849
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !850
  %conv3 = zext i16 %2 to i32, !dbg !850
  %3 = load i16, i16* %count.addr, align 2, !dbg !851
  %conv4 = zext i16 %3 to i32, !dbg !851
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !852
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !852
  %div = sdiv i32 %conv3, %conv4, !dbg !852, !klee.check.div !267
  %conv5 = trunc i32 %div to i16, !dbg !850
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !853
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !854
  %conv6 = trunc i16 %4 to i8, !dbg !855
  ret i8 %conv6, !dbg !856
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !857 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !860, metadata !DIExpression()), !dbg !861
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !862, metadata !DIExpression()), !dbg !863
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !864, metadata !DIExpression()), !dbg !865
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !866, metadata !DIExpression()), !dbg !867
  store i16 0, i16* %u16MulTemp, align 2, !dbg !867
  %0 = load i8, i8* %value.addr, align 1, !dbg !868
  %conv = zext i8 %0 to i32, !dbg !868
  %1 = load i8, i8* %factor.addr, align 1, !dbg !869
  %conv1 = zext i8 %1 to i32, !dbg !869
  %mul = mul nsw i32 %conv, %conv1, !dbg !870
  %conv2 = trunc i32 %mul to i16, !dbg !868
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !871
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !872
  %conv3 = zext i16 %2 to i32, !dbg !872
  %3 = load i8, i8* %count.addr, align 1, !dbg !873
  %conv4 = zext i8 %3 to i32, !dbg !873
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !874
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !874
  %div = sdiv i32 %conv3, %conv4, !dbg !874, !klee.check.div !267
  %conv5 = trunc i32 %div to i16, !dbg !872
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !875
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !876
  %conv6 = zext i16 %4 to i32, !dbg !876
  %cmp = icmp sle i32 %conv6, 255, !dbg !878
  br i1 %cmp, label %if.then, label %if.else, !dbg !879

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !880
  %conv8 = zext i16 %5 to i32, !dbg !880
  %and = and i32 %conv8, 255, !dbg !882
  %conv9 = trunc i32 %and to i8, !dbg !880
  store i8 %conv9, i8* %retval, align 1, !dbg !883
  br label %return, !dbg !883

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !884
  br label %return, !dbg !884

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !886
  ret i8 %6, !dbg !886
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !887 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !890, metadata !DIExpression()), !dbg !891
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !892, metadata !DIExpression()), !dbg !893
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !894, metadata !DIExpression()), !dbg !895
  store i16 0, i16* %u16MulTemp, align 2, !dbg !895
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !896
  %conv = zext i8 %0 to i32, !dbg !896
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !897
  %conv1 = zext i8 %1 to i32, !dbg !897
  %mul = mul nsw i32 %conv, %conv1, !dbg !898
  %conv2 = trunc i32 %mul to i16, !dbg !896
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !899
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !900
  %conv3 = zext i16 %2 to i32, !dbg !900
  %shr = ashr i32 %conv3, 8, !dbg !901
  %conv4 = trunc i32 %shr to i16, !dbg !900
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !902
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !903
  %conv5 = trunc i16 %3 to i8, !dbg !904
  ret i8 %conv5, !dbg !905
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !906 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !907, metadata !DIExpression()), !dbg !908
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !909, metadata !DIExpression()), !dbg !910
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !911, metadata !DIExpression()), !dbg !912
  store i16 0, i16* %u16MulTemp, align 2, !dbg !912
  %0 = load i8, i8* %value.addr, align 1, !dbg !913
  %conv = zext i8 %0 to i32, !dbg !913
  %1 = load i8, i8* %factor.addr, align 1, !dbg !914
  %conv1 = zext i8 %1 to i32, !dbg !914
  %mul = mul nsw i32 %conv, %conv1, !dbg !915
  %conv2 = trunc i32 %mul to i16, !dbg !913
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !916
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !917
  %conv3 = zext i16 %2 to i32, !dbg !917
  %shr = ashr i32 %conv3, 7, !dbg !918
  %conv4 = trunc i32 %shr to i16, !dbg !917
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !919
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !920
  %conv5 = zext i16 %3 to i32, !dbg !920
  %cmp = icmp slt i32 %conv5, 255, !dbg !922
  br i1 %cmp, label %if.then, label %if.else, !dbg !923

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !924
  %conv7 = trunc i16 %4 to i8, !dbg !926
  store i8 %conv7, i8* %retval, align 1, !dbg !927
  br label %return, !dbg !927

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !928
  br label %return, !dbg !928

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !930
  ret i8 %5, !dbg !930
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !931 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !934, metadata !DIExpression()), !dbg !935
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !936, metadata !DIExpression()), !dbg !937
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !938, metadata !DIExpression()), !dbg !939
  store i32 0, i32* %u32MulTemp, align 4, !dbg !939
  %0 = load i16, i16* %value.addr, align 2, !dbg !940
  %conv = zext i16 %0 to i32, !dbg !940
  %1 = load i16, i16* %factor.addr, align 2, !dbg !941
  %conv1 = zext i16 %1 to i32, !dbg !941
  %mul = mul nsw i32 %conv, %conv1, !dbg !942
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !943
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !944
  %shr = lshr i32 %2, 16, !dbg !945
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !946
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !947
  %conv2 = trunc i32 %3 to i16, !dbg !948
  ret i16 %conv2, !dbg !949
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !950 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !951, metadata !DIExpression()), !dbg !952
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !953, metadata !DIExpression()), !dbg !954
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !955, metadata !DIExpression()), !dbg !956
  store i32 0, i32* %u32MulTemp, align 4, !dbg !956
  %0 = load i16, i16* %value.addr, align 2, !dbg !957
  %conv = zext i16 %0 to i32, !dbg !957
  %1 = load i16, i16* %factor.addr, align 2, !dbg !958
  %conv1 = zext i16 %1 to i32, !dbg !958
  %mul = mul nsw i32 %conv, %conv1, !dbg !959
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !960
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !961
  %shr = lshr i32 %2, 8, !dbg !962
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !963
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !964
  %cmp = icmp ult i32 %3, 65535, !dbg !966
  br i1 %cmp, label %if.then, label %if.else, !dbg !967

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !968
  %and = and i32 %4, 65535, !dbg !970
  %conv3 = trunc i32 %and to i16, !dbg !971
  store i16 %conv3, i16* %retval, align 2, !dbg !972
  br label %return, !dbg !972

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !973
  br label %return, !dbg !973

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !975
  ret i16 %5, !dbg !975
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !976 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !979, metadata !DIExpression()), !dbg !980
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !981, metadata !DIExpression()), !dbg !982
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !983, metadata !DIExpression()), !dbg !984
  store i32 0, i32* %u32MulTemp, align 4, !dbg !984
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !985
  %conv = zext i16 %0 to i32, !dbg !985
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !986
  %conv1 = zext i8 %1 to i32, !dbg !986
  %mul = mul nsw i32 %conv, %conv1, !dbg !987
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !988
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !989
  %shr = lshr i32 %2, 8, !dbg !990
  %and = and i32 %shr, 65535, !dbg !991
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !992
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !993
  %conv2 = trunc i32 %3 to i16, !dbg !993
  ret i16 %conv2, !dbg !994
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !995 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !996, metadata !DIExpression()), !dbg !997
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !998, metadata !DIExpression()), !dbg !999
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1000, metadata !DIExpression()), !dbg !1001
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1001
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1002
  %conv = zext i16 %0 to i32, !dbg !1002
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1003
  %conv1 = zext i8 %1 to i32, !dbg !1003
  %mul = mul nsw i32 %conv, %conv1, !dbg !1004
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1005
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1006
  %shr = lshr i32 %2, 7, !dbg !1007
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1008
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1009
  %cmp = icmp ult i32 %3, 65535, !dbg !1011
  br i1 %cmp, label %if.then, label %if.else, !dbg !1012

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1013
  %and = and i32 %4, 65535, !dbg !1015
  %conv3 = trunc i32 %and to i16, !dbg !1016
  store i16 %conv3, i16* %retval, align 2, !dbg !1017
  br label %return, !dbg !1017

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1018
  br label %return, !dbg !1018

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1020
  ret i16 %5, !dbg !1020
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1021 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1028, metadata !DIExpression()), !dbg !1029
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1030, metadata !DIExpression()), !dbg !1031
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1031
  %0 = load i16, i16* %value.addr, align 2, !dbg !1032
  %conv = zext i16 %0 to i32, !dbg !1032
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1033
  %conv1 = zext i16 %1 to i32, !dbg !1033
  %mul = mul nsw i32 %conv, %conv1, !dbg !1034
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1035
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1036
  %3 = load i32, i32* %count.addr, align 4, !dbg !1037
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1038
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1038
  %div = udiv i32 %2, %3, !dbg !1038, !klee.check.div !267
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1039
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1040
  %and = and i32 %4, 65535, !dbg !1041
  %conv2 = trunc i32 %and to i16, !dbg !1042
  ret i16 %conv2, !dbg !1043
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1044 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1053, metadata !DIExpression()), !dbg !1054
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1054
  %0 = load i16, i16* %value.addr, align 2, !dbg !1055
  %conv = zext i16 %0 to i32, !dbg !1055
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1056
  %conv1 = zext i16 %1 to i32, !dbg !1056
  %mul = mul nsw i32 %conv, %conv1, !dbg !1057
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1058
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1059
  %3 = load i16, i16* %count.addr, align 2, !dbg !1060
  %conv2 = zext i16 %3 to i32, !dbg !1060
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1061
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1061
  %div = udiv i32 %2, %conv2, !dbg !1061, !klee.check.div !267
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1062
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1063
  %cmp = icmp ule i32 %4, 65535, !dbg !1065
  br i1 %cmp, label %if.then, label %if.else, !dbg !1066

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1067
  %and = and i32 %5, 65535, !dbg !1069
  %conv4 = trunc i32 %and to i16, !dbg !1070
  store i16 %conv4, i16* %retval, align 2, !dbg !1071
  br label %return, !dbg !1071

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1074
  ret i16 %6, !dbg !1074
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1075 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1076, metadata !DIExpression()), !dbg !1077
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1078, metadata !DIExpression()), !dbg !1079
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1080, metadata !DIExpression()), !dbg !1081
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1081
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1082
  %conv = zext i16 %0 to i32, !dbg !1082
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1083
  %conv1 = zext i16 %1 to i32, !dbg !1083
  %mul = mul nsw i32 %conv, %conv1, !dbg !1084
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1085
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1086
  %shr = lshr i32 %2, 16, !dbg !1087
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1088
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1089
  %and = and i32 65535, %3, !dbg !1090
  %conv2 = trunc i32 %and to i16, !dbg !1091
  ret i16 %conv2, !dbg !1092
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1093 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1094, metadata !DIExpression()), !dbg !1095
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1096, metadata !DIExpression()), !dbg !1097
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1098, metadata !DIExpression()), !dbg !1099
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1099
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1100
  %conv = zext i16 %0 to i32, !dbg !1100
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1101
  %conv1 = zext i16 %1 to i32, !dbg !1101
  %mul = mul nsw i32 %conv, %conv1, !dbg !1102
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1103
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1104
  %shr = lshr i32 %2, 15, !dbg !1105
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1106
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1107
  %cmp = icmp ule i32 %3, 65535, !dbg !1109
  br i1 %cmp, label %if.then, label %if.else, !dbg !1110

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1111
  %and = and i32 %4, 65535, !dbg !1113
  %conv3 = trunc i32 %and to i16, !dbg !1114
  store i16 %conv3, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1116
  br label %return, !dbg !1116

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1118
  ret i16 %5, !dbg !1118
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1119 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1124, metadata !DIExpression()), !dbg !1125
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1126, metadata !DIExpression()), !dbg !1127
  store i32 0, i32* %u32Temp1, align 4, !dbg !1127
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1128
  %conv = zext i16 %0 to i32, !dbg !1128
  %cmp = icmp sgt i32 %conv, 0, !dbg !1130
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1131

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1132
  %conv2 = zext i16 %1 to i32, !dbg !1132
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1134
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1134
  %div = udiv i32 -1, %conv2, !dbg !1134, !klee.check.div !267
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1135
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1136
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1138
  %cmp3 = icmp ult i32 %2, %3, !dbg !1139
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1140

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1141
  br label %return, !dbg !1141

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1143
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1145
  %conv6 = zext i16 %5 to i32, !dbg !1145
  %mul = mul i32 %4, %conv6, !dbg !1146
  store i32 %mul, i32* %retval, align 4, !dbg !1147
  br label %return, !dbg !1147

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1148
  br label %return, !dbg !1148

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1150
  ret i32 %6, !dbg !1150
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1151 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1154, metadata !DIExpression()), !dbg !1155
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1158, metadata !DIExpression()), !dbg !1159
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1160, metadata !DIExpression()), !dbg !1161
  store i32 0, i32* %u32Temp1, align 4, !dbg !1161
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1162, metadata !DIExpression()), !dbg !1163
  store i32 0, i32* %u32Temp2, align 4, !dbg !1163
  %0 = load i32, i32* %value.addr, align 4, !dbg !1164
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1165
  %conv = zext i16 %1 to i32, !dbg !1165
  %mul = mul i32 %0, %conv, !dbg !1166
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1167
  %2 = load i32, i32* %value.addr, align 4, !dbg !1168
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1169
  %conv1 = zext i16 %3 to i32, !dbg !1169
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1170
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1171
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1172
  %5 = load i32, i32* %count.addr, align 4, !dbg !1173
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1174
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1174
  %shr = lshr i32 %4, %5, !dbg !1174, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1175
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1176
  %7 = load i32, i32* %count.addr, align 4, !dbg !1177
  %sub = sub i32 32, %7, !dbg !1178
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1179
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1179
  %shl = shl i32 %6, %sub, !dbg !1179, !klee.check.shift !267
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1180
  %or = or i32 %8, %shl, !dbg !1180
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1180
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1181
  %10 = load i32, i32* %count.addr, align 4, !dbg !1183
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1184
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1184
  %shr2 = lshr i32 %9, %10, !dbg !1184, !klee.check.shift !267
  %cmp = icmp eq i32 %shr2, 0, !dbg !1185
  br i1 %cmp, label %if.then, label %if.else, !dbg !1186

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1187
  store i32 %11, i32* %retval, align 4, !dbg !1189
  br label %return, !dbg !1189

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1190
  br label %return, !dbg !1190

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1192
  ret i32 %12, !dbg !1192
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1193 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1196, metadata !DIExpression()), !dbg !1197
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1198, metadata !DIExpression()), !dbg !1199
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1200, metadata !DIExpression()), !dbg !1201
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1202, metadata !DIExpression()), !dbg !1203
  store i16 0, i16* %s16Temp1, align 2, !dbg !1203
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1204
  %conv = zext i8 %0 to i32, !dbg !1204
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1205
  %conv1 = zext i8 %1 to i32, !dbg !1205
  %sub = sub nsw i32 %conv, %conv1, !dbg !1206
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1207
  %conv2 = sext i8 %2 to i32, !dbg !1207
  %mul = mul nsw i32 %sub, %conv2, !dbg !1208
  %div = sdiv i32 %mul, 32, !dbg !1209
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1210
  %conv3 = zext i8 %3 to i32, !dbg !1210
  %add = add nsw i32 %div, %conv3, !dbg !1211
  %conv4 = trunc i32 %add to i16, !dbg !1212
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1213
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1214
  %conv5 = sext i16 %4 to i32, !dbg !1214
  %cmp = icmp slt i32 %conv5, 255, !dbg !1216
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1217

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1218
  %conv7 = sext i16 %5 to i32, !dbg !1218
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1221
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1222

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1223
  %conv11 = trunc i16 %6 to i8, !dbg !1225
  store i8 %conv11, i8* %retval, align 1, !dbg !1226
  br label %return, !dbg !1226

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1227
  br label %return, !dbg !1227

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1229
  br label %return, !dbg !1229

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1231
  ret i8 %7, !dbg !1231
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1232 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1235, metadata !DIExpression()), !dbg !1236
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1237, metadata !DIExpression()), !dbg !1238
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1239, metadata !DIExpression()), !dbg !1240
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i32 0, i32* %s32Temp1, align 4, !dbg !1242
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1243
  %conv = zext i16 %0 to i32, !dbg !1243
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1244
  %conv1 = zext i16 %1 to i32, !dbg !1244
  %sub = sub nsw i32 %conv, %conv1, !dbg !1245
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1246
  %conv2 = sext i8 %2 to i32, !dbg !1246
  %mul = mul nsw i32 %sub, %conv2, !dbg !1247
  %div = sdiv i32 %mul, 32, !dbg !1248
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1249
  %conv3 = zext i16 %3 to i32, !dbg !1249
  %add = add nsw i32 %div, %conv3, !dbg !1250
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1251
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1252
  %cmp = icmp slt i32 %4, 65535, !dbg !1254
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1255

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1256
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1259
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1260

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1261
  %conv8 = trunc i32 %6 to i16, !dbg !1263
  store i16 %conv8, i16* %retval, align 2, !dbg !1264
  br label %return, !dbg !1264

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1265
  br label %return, !dbg !1265

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1267
  br label %return, !dbg !1267

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1269
  ret i16 %7, !dbg !1269
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1270 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1271, metadata !DIExpression()), !dbg !1272
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1273, metadata !DIExpression()), !dbg !1274
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1275, metadata !DIExpression()), !dbg !1276
  store i32 0, i32* %u32Temp1, align 4, !dbg !1276
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1277
  %conv = zext i16 %0 to i32, !dbg !1277
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1278
  %conv1 = zext i16 %1 to i32, !dbg !1278
  %mul = mul nsw i32 %conv, %conv1, !dbg !1279
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1280
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1281
  %cmp = icmp ule i32 %2, 65535, !dbg !1283
  br i1 %cmp, label %if.then, label %if.else, !dbg !1284

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1285
  %and = and i32 %3, 65535, !dbg !1287
  %conv3 = trunc i32 %and to i16, !dbg !1288
  store i16 %conv3, i16* %retval, align 2, !dbg !1289
  br label %return, !dbg !1289

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1290
  br label %return, !dbg !1290

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1292
  ret i16 %4, !dbg !1292
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1293 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1296, metadata !DIExpression()), !dbg !1297
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1298, metadata !DIExpression()), !dbg !1299
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1300, metadata !DIExpression()), !dbg !1301
  store i32 0, i32* %u32Temp1, align 4, !dbg !1301
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1302
  %conv = zext i16 %0 to i32, !dbg !1302
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1303
  %conv1 = zext i16 %1 to i32, !dbg !1303
  %mul = mul nsw i32 %conv, %conv1, !dbg !1304
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1305
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1306
  ret i32 %2, !dbg !1307
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1308 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1311, metadata !DIExpression()), !dbg !1312
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1313, metadata !DIExpression()), !dbg !1314
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1315, metadata !DIExpression()), !dbg !1316
  store i32 0, i32* %s32Temp1, align 4, !dbg !1316
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1317
  %conv = sext i16 %0 to i32, !dbg !1317
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1318
  %conv1 = sext i16 %1 to i32, !dbg !1318
  %mul = mul nsw i32 %conv, %conv1, !dbg !1319
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1320
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1321
  ret i32 %2, !dbg !1322
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1323 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1328, metadata !DIExpression()), !dbg !1329
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1330, metadata !DIExpression()), !dbg !1331
  store i32 0, i32* %s32Temp1, align 4, !dbg !1331
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1332
  %cmp = icmp sgt i32 %0, 0, !dbg !1334
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1335

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1336
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1338
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1338
  %div = udiv i32 -1, %1, !dbg !1338, !klee.check.div !267
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1339
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1340
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1342
  %cmp1 = icmp ult i32 %2, %3, !dbg !1343
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1344

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1347
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1349
  %mul = mul i32 %4, %5, !dbg !1350
  store i32 %mul, i32* %retval, align 4, !dbg !1351
  br label %return, !dbg !1351

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1352
  br label %return, !dbg !1352

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1354
  ret i32 %6, !dbg !1354
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1355 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1358, metadata !DIExpression()), !dbg !1359
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1360, metadata !DIExpression()), !dbg !1361
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1362, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1364, metadata !DIExpression()), !dbg !1365
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1366, metadata !DIExpression()), !dbg !1367
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1368, metadata !DIExpression()), !dbg !1369
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1370
  %cmp = icmp slt i32 %0, 0, !dbg !1372
  br i1 %cmp, label %if.then, label %if.else, !dbg !1373

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1374
  %sub = sub nsw i32 0, %1, !dbg !1375
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1376
  br label %if.end, !dbg !1377

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1378
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1379
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1380
  %cmp1 = icmp slt i32 %3, 0, !dbg !1382
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1383

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1384
  %sub3 = sub nsw i32 0, %4, !dbg !1385
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1386
  br label %if.end5, !dbg !1387

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1388
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1389
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1390
  %cmp6 = icmp slt i32 %6, 0, !dbg !1392
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1393
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1393

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1394
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1395
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1396
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1396

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1397
  br label %if.end13, !dbg !1398

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1399
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1400
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1401
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1402
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1403
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1404
  %conv = zext i8 %12 to i32, !dbg !1404
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1406
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1407

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1408
  br label %return, !dbg !1408

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1410
  store i32 %13, i32* %retval, align 4, !dbg !1412
  br label %return, !dbg !1412

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1413
  ret i32 %14, !dbg !1413
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1414 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1417, metadata !DIExpression()), !dbg !1418
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1419, metadata !DIExpression()), !dbg !1420
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1421, metadata !DIExpression()), !dbg !1422
  store i32 0, i32* %u32Temp1, align 4, !dbg !1422
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1423
  %cmp = icmp ne i32 %0, 0, !dbg !1425
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1426

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1427
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1429
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1429
  %div = udiv i32 -1, %1, !dbg !1429, !klee.check.div !267
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1430
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1431
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1433
  %cmp1 = icmp ult i32 %2, %3, !dbg !1434
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1435

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1436
  br label %return, !dbg !1436

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1438
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1440
  %mul = mul i32 %4, %5, !dbg !1441
  store i32 %mul, i32* %retval, align 4, !dbg !1442
  br label %return, !dbg !1442

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1443
  br label %return, !dbg !1443

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1445
  ret i32 %6, !dbg !1445
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1446 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1447, metadata !DIExpression()), !dbg !1448
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1449, metadata !DIExpression()), !dbg !1450
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1451, metadata !DIExpression()), !dbg !1452
  store i32 0, i32* %u32Temp1, align 4, !dbg !1452
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1453, metadata !DIExpression()), !dbg !1454
  store i32 0, i32* %u32Temp2, align 4, !dbg !1454
  %0 = load i32, i32* %value.addr, align 4, !dbg !1455
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1456
  %conv = zext i16 %1 to i32, !dbg !1456
  %mul = mul i32 %0, %conv, !dbg !1457
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1458
  %2 = load i32, i32* %value.addr, align 4, !dbg !1459
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1460
  %conv1 = zext i16 %3 to i32, !dbg !1460
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1461
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1462
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1463
  %shr = lshr i32 %4, 16, !dbg !1464
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1465
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1466
  %shl = shl i32 %5, 16, !dbg !1467
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1468
  %or = or i32 %6, %shl, !dbg !1468
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1468
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1469
  ret i32 %7, !dbg !1470
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1471 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1472, metadata !DIExpression()), !dbg !1473
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1474, metadata !DIExpression()), !dbg !1475
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1476, metadata !DIExpression()), !dbg !1477
  store i32 0, i32* %u32Temp1, align 4, !dbg !1477
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1478, metadata !DIExpression()), !dbg !1479
  store i32 0, i32* %u32Temp2, align 4, !dbg !1479
  %0 = load i32, i32* %value.addr, align 4, !dbg !1480
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1481
  %conv = zext i16 %1 to i32, !dbg !1481
  %mul = mul i32 %0, %conv, !dbg !1482
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1483
  %2 = load i32, i32* %value.addr, align 4, !dbg !1484
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1485
  %conv1 = zext i16 %3 to i32, !dbg !1485
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1486
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1487
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %shr = lshr i32 %4, 15, !dbg !1489
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1490
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1491
  %shl = shl i32 %5, 17, !dbg !1492
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  %or = or i32 %6, %shl, !dbg !1493
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1493
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1494
  %shr2 = lshr i32 %7, 15, !dbg !1496
  %cmp = icmp eq i32 %shr2, 0, !dbg !1497
  br i1 %cmp, label %if.then, label %if.else, !dbg !1498

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1499
  store i32 %8, i32* %retval, align 4, !dbg !1501
  br label %return, !dbg !1501

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1502
  br label %return, !dbg !1502

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1504
  ret i32 %9, !dbg !1504
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1505 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1510, metadata !DIExpression()), !dbg !1511
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1512, metadata !DIExpression()), !dbg !1513
  store i32 0, i32* %u32Temp1, align 4, !dbg !1513
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1514, metadata !DIExpression()), !dbg !1515
  store i32 0, i32* %u32Temp2, align 4, !dbg !1515
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1516
  %conv = sext i16 %0 to i32, !dbg !1516
  %cmp = icmp sgt i32 %conv, 0, !dbg !1518
  br i1 %cmp, label %if.then, label %if.else, !dbg !1519

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1520
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1522
  %conv2 = sext i16 %2 to i32, !dbg !1522
  %mul = mul i32 %1, %conv2, !dbg !1523
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1524
  %3 = load i32, i32* %value.addr, align 4, !dbg !1525
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1526
  %conv3 = sext i16 %4 to i32, !dbg !1526
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1527
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1528
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %shr = lshr i32 %5, 15, !dbg !1530
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1531
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1532
  %shl = shl i32 %6, 17, !dbg !1533
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1534
  %or = or i32 %7, %shl, !dbg !1534
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1534
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1535
  store i32 %8, i32* %retval, align 4, !dbg !1536
  br label %return, !dbg !1536

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1537
  br label %return, !dbg !1537

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1539
  ret i32 %9, !dbg !1539
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1540 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1541, metadata !DIExpression()), !dbg !1542
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1543, metadata !DIExpression()), !dbg !1544
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1545, metadata !DIExpression()), !dbg !1546
  store i32 0, i32* %u32Temp1, align 4, !dbg !1546
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1547, metadata !DIExpression()), !dbg !1548
  store i32 0, i32* %u32Temp2, align 4, !dbg !1548
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1549
  %conv = sext i16 %0 to i32, !dbg !1549
  %cmp = icmp sle i32 %conv, 0, !dbg !1551
  br i1 %cmp, label %if.then, label %if.else, !dbg !1552

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1553
  br label %return, !dbg !1553

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1555
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1557
  %conv2 = sext i16 %2 to i32, !dbg !1557
  %mul = mul i32 %1, %conv2, !dbg !1558
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1559
  %3 = load i32, i32* %value.addr, align 4, !dbg !1560
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1561
  %conv3 = sext i16 %4 to i32, !dbg !1561
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1562
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1563
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1564
  %shr = lshr i32 %5, 14, !dbg !1565
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1566
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1567
  %shl = shl i32 %6, 18, !dbg !1568
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1569
  %or = or i32 %7, %shl, !dbg !1569
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1569
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1570
  %shr4 = lshr i32 %8, 14, !dbg !1572
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1573
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1574

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1575
  store i32 %9, i32* %retval, align 4, !dbg !1577
  br label %return, !dbg !1577

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1578
  br label %return, !dbg !1578

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1580
  ret i32 %10, !dbg !1580
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1581 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1582, metadata !DIExpression()), !dbg !1583
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1584, metadata !DIExpression()), !dbg !1585
  %0 = load i32, i32* %value.addr, align 4, !dbg !1586
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1587
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1588
  ret i32 %call, !dbg !1589
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1590 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1593, metadata !DIExpression()), !dbg !1594
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1595, metadata !DIExpression()), !dbg !1596
  store i32 0, i32* %u32Temp1, align 4, !dbg !1596
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1597, metadata !DIExpression()), !dbg !1598
  store i32 0, i32* %u32Temp2, align 4, !dbg !1598
  %0 = load i32, i32* %value.addr, align 4, !dbg !1599
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1600
  %mul = mul i32 %0, %1, !dbg !1601
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1602
  %2 = load i32, i32* %value.addr, align 4, !dbg !1603
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1604
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1605
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1606
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1607
  %shr = lshr i32 %4, 31, !dbg !1608
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1609
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1610
  %shl = shl i32 %5, 1, !dbg !1611
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1612
  %or = or i32 %6, %shl, !dbg !1612
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1612
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1613
  %shr1 = lshr i32 %7, 31, !dbg !1615
  %cmp = icmp eq i32 %shr1, 0, !dbg !1616
  br i1 %cmp, label %if.then, label %if.else, !dbg !1617

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1618
  store i32 %8, i32* %retval, align 4, !dbg !1620
  br label %return, !dbg !1620

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1621
  br label %return, !dbg !1621

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1623
  ret i32 %9, !dbg !1623
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1624 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1627, metadata !DIExpression()), !dbg !1628
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1629, metadata !DIExpression()), !dbg !1630
  store i32 0, i32* %u32Temp1, align 4, !dbg !1630
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1631, metadata !DIExpression()), !dbg !1632
  store i32 0, i32* %u32Temp2, align 4, !dbg !1632
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1633
  %cmp = icmp sgt i32 %0, 0, !dbg !1635
  br i1 %cmp, label %if.then, label %if.else, !dbg !1636

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1637
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1639
  %mul = mul i32 %1, %2, !dbg !1640
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1641
  %3 = load i32, i32* %value.addr, align 4, !dbg !1642
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1643
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1644
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1645
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1646
  %shr = lshr i32 %5, 31, !dbg !1647
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1648
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1649
  %shl = shl i32 %6, 1, !dbg !1650
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1651
  %or = or i32 %7, %shl, !dbg !1651
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1651
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1652
  store i32 %8, i32* %retval, align 4, !dbg !1653
  br label %return, !dbg !1653

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1654
  br label %return, !dbg !1654

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1656
  ret i32 %9, !dbg !1656
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1657 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1658, metadata !DIExpression()), !dbg !1659
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1660, metadata !DIExpression()), !dbg !1661
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1662, metadata !DIExpression()), !dbg !1663
  store i32 0, i32* %u32Temp1, align 4, !dbg !1663
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 0, i32* %u32Temp2, align 4, !dbg !1665
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1666
  %cmp = icmp sle i32 %0, 0, !dbg !1668
  br i1 %cmp, label %if.then, label %if.else, !dbg !1669

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1670
  br label %return, !dbg !1670

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1672
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1674
  %mul = mul i32 %1, %2, !dbg !1675
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1676
  %3 = load i32, i32* %value.addr, align 4, !dbg !1677
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1678
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1679
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1680
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1681
  %shr = lshr i32 %5, 30, !dbg !1682
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1683
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1684
  %shl = shl i32 %6, 2, !dbg !1685
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1686
  %or = or i32 %7, %shl, !dbg !1686
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1686
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1687
  %shr1 = lshr i32 %8, 30, !dbg !1689
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1690
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1691

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1692
  store i32 %9, i32* %retval, align 4, !dbg !1694
  br label %return, !dbg !1694

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1695
  br label %return, !dbg !1695

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1697
  ret i32 %10, !dbg !1697
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1698 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1701, metadata !DIExpression()), !dbg !1702
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1703, metadata !DIExpression()), !dbg !1704
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1705, metadata !DIExpression()), !dbg !1706
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1706
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1707
  %cmp = icmp slt i32 %0, 0, !dbg !1709
  br i1 %cmp, label %if.then, label %if.end, !dbg !1710

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1711
  %sub = sub nsw i32 0, %1, !dbg !1713
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1714
  br label %if.end, !dbg !1715

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1716
  %cmp1 = icmp ne i32 %2, 0, !dbg !1718
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1719

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1720
  %cmp3 = icmp sle i32 %3, 0, !dbg !1723
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1724

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1725
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1728
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1728
  %div = udiv i32 -2147483648, %4, !dbg !1728, !klee.check.div !267
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1729
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1730
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1731

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1732
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1734
  %mul = mul i32 %6, %7, !dbg !1735
  store i32 %mul, i32* %retval, align 4, !dbg !1736
  br label %return, !dbg !1736

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1737
  br label %return, !dbg !1737

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1739
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1742
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1742
  %div8 = sdiv i32 2147483647, %8, !dbg !1742, !klee.check.div !267
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1743
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1744
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1745

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1746
  br label %return, !dbg !1746

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1748
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1750
  %mul12 = mul i32 %10, %11, !dbg !1751
  store i32 %mul12, i32* %retval, align 4, !dbg !1752
  br label %return, !dbg !1752

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1753
  br label %return, !dbg !1753

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1755
  ret i32 %12, !dbg !1755
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1756 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1757, metadata !DIExpression()), !dbg !1758
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1759, metadata !DIExpression()), !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1761, metadata !DIExpression()), !dbg !1762
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1763, metadata !DIExpression()), !dbg !1764
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1765, metadata !DIExpression()), !dbg !1766
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1767, metadata !DIExpression()), !dbg !1768
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1769
  %cmp = icmp slt i32 %0, 0, !dbg !1771
  br i1 %cmp, label %if.then, label %if.else, !dbg !1772

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1773
  %sub = sub nsw i32 0, %1, !dbg !1775
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1776
  store i8 1, i8* %u8SignBit, align 1, !dbg !1777
  br label %if.end, !dbg !1778

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1779
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1781
  store i8 0, i8* %u8SignBit, align 1, !dbg !1782
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1783
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1784
  %conv = zext i16 %4 to i32, !dbg !1784
  %mul = mul i32 %3, %conv, !dbg !1785
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1786
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1787
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1788
  %conv1 = zext i16 %6 to i32, !dbg !1788
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1789
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1790
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1791
  %shr = lshr i32 %7, 16, !dbg !1792
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1793
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1794
  %shl = shl i32 %8, 16, !dbg !1795
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1796
  %or = or i32 %9, %shl, !dbg !1796
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1796
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1797
  %conv2 = zext i8 %10 to i32, !dbg !1797
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1799
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1800

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1801
  store i32 %11, i32* %retval, align 4, !dbg !1803
  br label %return, !dbg !1803

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1804
  %sub7 = sub i32 0, %12, !dbg !1806
  store i32 %sub7, i32* %retval, align 4, !dbg !1807
  br label %return, !dbg !1807

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1808
  ret i32 %13, !dbg !1808
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1809 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1810, metadata !DIExpression()), !dbg !1811
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1812, metadata !DIExpression()), !dbg !1813
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1814, metadata !DIExpression()), !dbg !1815
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1816, metadata !DIExpression()), !dbg !1817
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1818, metadata !DIExpression()), !dbg !1819
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1820, metadata !DIExpression()), !dbg !1821
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1822
  %cmp = icmp slt i32 %0, 0, !dbg !1824
  br i1 %cmp, label %if.then, label %if.else, !dbg !1825

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1826
  %sub = sub nsw i32 0, %1, !dbg !1828
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1829
  store i8 1, i8* %u8SignBit, align 1, !dbg !1830
  br label %if.end, !dbg !1831

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1832
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1834
  store i8 0, i8* %u8SignBit, align 1, !dbg !1835
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1836
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1837
  %conv = zext i16 %4 to i32, !dbg !1837
  %mul = mul i32 %3, %conv, !dbg !1838
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1839
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1840
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1841
  %conv1 = zext i16 %6 to i32, !dbg !1841
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1842
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1843
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1844
  %shr = lshr i32 %7, 15, !dbg !1845
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1846
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1847
  %shl = shl i32 %8, 17, !dbg !1848
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1849
  %or = or i32 %9, %shl, !dbg !1849
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1849
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1850
  %conv2 = zext i8 %10 to i32, !dbg !1850
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1852
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1853

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1854
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1857
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1858

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1859
  store i32 %12, i32* %retval, align 4, !dbg !1860
  br label %return, !dbg !1860

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1861
  br label %return, !dbg !1861

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1862
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1865
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1866

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1867
  %sub14 = sub i32 0, %14, !dbg !1868
  store i32 %sub14, i32* %retval, align 4, !dbg !1869
  br label %return, !dbg !1869

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1870
  br label %return, !dbg !1870

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1871
  ret i32 %15, !dbg !1871
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1872 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1875, metadata !DIExpression()), !dbg !1876
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1877, metadata !DIExpression()), !dbg !1878
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1879, metadata !DIExpression()), !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1881, metadata !DIExpression()), !dbg !1882
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1883, metadata !DIExpression()), !dbg !1884
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1885, metadata !DIExpression()), !dbg !1886
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1887, metadata !DIExpression()), !dbg !1888
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1889
  %cmp = icmp slt i32 %0, 0, !dbg !1891
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1892

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1893
  %conv = sext i16 %1 to i32, !dbg !1893
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1894
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1895

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1896
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1897
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1898

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1899
  %conv6 = sext i16 %3 to i32, !dbg !1899
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1900
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1901

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1902
  br label %if.end, !dbg !1904

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1905
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1907
  %cmp9 = icmp slt i32 %4, 0, !dbg !1909
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1910

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1911
  %sub = sub nsw i32 0, %5, !dbg !1913
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1914
  br label %if.end13, !dbg !1915

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1916
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1918
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1919
  %conv14 = sext i16 %7 to i32, !dbg !1919
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1921
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1922

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1923
  %conv18 = sext i16 %8 to i32, !dbg !1923
  %sub19 = sub nsw i32 0, %conv18, !dbg !1925
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1926
  br label %if.end22, !dbg !1927

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1928
  %conv21 = sext i16 %9 to i32, !dbg !1928
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1930
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1931
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1932
  %mul = mul i32 %10, %11, !dbg !1933
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1934
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1935
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1936
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1937
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1938
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1939
  %shr = lshr i32 %14, 15, !dbg !1940
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1941
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1942
  %shl = shl i32 %15, 17, !dbg !1943
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1944
  %or = or i32 %16, %shl, !dbg !1944
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1944
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1945
  %conv23 = zext i8 %17 to i32, !dbg !1945
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1947
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1948

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1949
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1952
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1953

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1954
  store i32 %19, i32* %retval, align 4, !dbg !1955
  br label %return, !dbg !1955

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1956
  br label %return, !dbg !1956

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1957
  %sub32 = sub i32 0, %20, !dbg !1959
  store i32 %sub32, i32* %retval, align 4, !dbg !1960
  br label %return, !dbg !1960

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1961
  ret i32 %21, !dbg !1961
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1962 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1963, metadata !DIExpression()), !dbg !1964
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1965, metadata !DIExpression()), !dbg !1966
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1967, metadata !DIExpression()), !dbg !1968
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1969, metadata !DIExpression()), !dbg !1970
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1971, metadata !DIExpression()), !dbg !1972
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1973, metadata !DIExpression()), !dbg !1974
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1975, metadata !DIExpression()), !dbg !1976
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1977
  %cmp = icmp slt i32 %0, 0, !dbg !1979
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1980

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1981
  %conv = sext i16 %1 to i32, !dbg !1981
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1982
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1983

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1984
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1985
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1986

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1987
  %conv6 = sext i16 %3 to i32, !dbg !1987
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1988
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1989

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1990
  br label %if.end, !dbg !1992

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1993
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1995
  %cmp9 = icmp slt i32 %4, 0, !dbg !1997
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1998

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1999
  %sub = sub nsw i32 0, %5, !dbg !2001
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2002
  br label %if.end13, !dbg !2003

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2004
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2006
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2007
  %conv14 = sext i16 %7 to i32, !dbg !2007
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2009
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2010

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2011
  %conv18 = sext i16 %8 to i32, !dbg !2011
  %sub19 = sub nsw i32 0, %conv18, !dbg !2013
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2014
  br label %if.end22, !dbg !2015

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2016
  %conv21 = sext i16 %9 to i32, !dbg !2016
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2018
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2019
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2020
  %mul = mul i32 %10, %11, !dbg !2021
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2022
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2023
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2024
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2025
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2026
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2027
  %shr = lshr i32 %14, 14, !dbg !2028
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2029
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2030
  %shl = shl i32 %15, 18, !dbg !2031
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2032
  %or = or i32 %16, %shl, !dbg !2032
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2032
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2033
  %shr23 = lshr i32 %17, 14, !dbg !2035
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2036
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2037

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2038
  %conv27 = zext i8 %18 to i32, !dbg !2038
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2041
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2042

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2043
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2046
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2047

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2048
  store i32 %20, i32* %retval, align 4, !dbg !2049
  br label %return, !dbg !2049

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2050
  br label %return, !dbg !2050

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2051
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2054
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2055

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2056
  %sub39 = sub i32 0, %22, !dbg !2057
  store i32 %sub39, i32* %retval, align 4, !dbg !2058
  br label %return, !dbg !2058

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2059
  br label %return, !dbg !2059

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2060
  br label %return, !dbg !2060

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2062
  ret i32 %23, !dbg !2062
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2063 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2066, metadata !DIExpression()), !dbg !2067
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2068, metadata !DIExpression()), !dbg !2069
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2070, metadata !DIExpression()), !dbg !2071
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2072, metadata !DIExpression()), !dbg !2073
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2074, metadata !DIExpression()), !dbg !2075
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2076
  %cmp = icmp slt i32 %0, 0, !dbg !2078
  br i1 %cmp, label %if.then, label %if.else, !dbg !2079

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2080
  %sub = sub nsw i32 0, %1, !dbg !2082
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2083
  store i8 1, i8* %u8SignBit, align 1, !dbg !2084
  br label %if.end, !dbg !2085

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2086
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2088
  store i8 0, i8* %u8SignBit, align 1, !dbg !2089
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2090
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2091
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2092
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2093
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2094
  %conv = zext i8 %5 to i32, !dbg !2094
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2096
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2097

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2098
  store i32 %6, i32* %retval, align 4, !dbg !2099
  br label %return, !dbg !2099

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2100
  %sub5 = sub i32 0, %7, !dbg !2101
  store i32 %sub5, i32* %retval, align 4, !dbg !2102
  br label %return, !dbg !2102

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2103
  ret i32 %8, !dbg !2103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2104 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2105, metadata !DIExpression()), !dbg !2106
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2107, metadata !DIExpression()), !dbg !2108
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2109, metadata !DIExpression()), !dbg !2110
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2111, metadata !DIExpression()), !dbg !2112
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2113, metadata !DIExpression()), !dbg !2114
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2115, metadata !DIExpression()), !dbg !2116
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2117
  %cmp = icmp slt i32 %0, 0, !dbg !2119
  br i1 %cmp, label %if.then, label %if.else, !dbg !2120

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2121
  %sub = sub nsw i32 0, %1, !dbg !2123
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2124
  store i8 1, i8* %u8SignBit, align 1, !dbg !2125
  br label %if.end, !dbg !2126

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2127
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2129
  store i8 0, i8* %u8SignBit, align 1, !dbg !2130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2131
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2132
  %mul = mul i32 %3, %4, !dbg !2133
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2134
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2135
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2136
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2137
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2138
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2139
  %shr = lshr i32 %7, 31, !dbg !2140
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2141
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2142
  %shl = shl i32 %8, 1, !dbg !2143
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2144
  %or = or i32 %9, %shl, !dbg !2144
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2144
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2145
  %conv = zext i8 %10 to i32, !dbg !2145
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2147
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2148

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2149
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2152
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2153

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2154
  store i32 %12, i32* %retval, align 4, !dbg !2155
  br label %return, !dbg !2155

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2156
  br label %return, !dbg !2156

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2157
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2160
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2161

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2162
  %sub12 = sub i32 0, %14, !dbg !2163
  store i32 %sub12, i32* %retval, align 4, !dbg !2164
  br label %return, !dbg !2164

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2165
  br label %return, !dbg !2165

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2166
  ret i32 %15, !dbg !2166
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2167 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2170, metadata !DIExpression()), !dbg !2171
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2172, metadata !DIExpression()), !dbg !2173
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2174, metadata !DIExpression()), !dbg !2175
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2176, metadata !DIExpression()), !dbg !2177
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2178, metadata !DIExpression()), !dbg !2179
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2180, metadata !DIExpression()), !dbg !2181
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2182, metadata !DIExpression()), !dbg !2183
  %0 = load i32, i32* %value.addr, align 4, !dbg !2184
  %cmp = icmp slt i32 %0, 0, !dbg !2186
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2187
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2187

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2188
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2189
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2190
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2190

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2191
  br label %if.end, !dbg !2193

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2194
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2196
  %cmp5 = icmp slt i32 %4, 0, !dbg !2198
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2199

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2200
  %sub = sub nsw i32 0, %5, !dbg !2202
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2203
  br label %if.end8, !dbg !2204

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2205
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2207
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2208
  %cmp9 = icmp slt i32 %7, 0, !dbg !2210
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2211

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2212
  %sub11 = sub nsw i32 0, %8, !dbg !2214
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2215
  br label %if.end13, !dbg !2216

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2217
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2219
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2220
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2221
  %mul = mul i32 %10, %11, !dbg !2222
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2223
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2224
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2225
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2226
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2227
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2228
  %shr = lshr i32 %14, 31, !dbg !2229
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2230
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2231
  %shl = shl i32 %15, 1, !dbg !2232
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2233
  %or = or i32 %16, %shl, !dbg !2233
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2233
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2234
  %conv = zext i8 %17 to i32, !dbg !2234
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2236
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2237

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2238
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2241
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2242

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2243
  store i32 %19, i32* %retval, align 4, !dbg !2244
  br label %return, !dbg !2244

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2245
  br label %return, !dbg !2245

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2246
  %sub22 = sub i32 0, %20, !dbg !2248
  store i32 %sub22, i32* %retval, align 4, !dbg !2249
  br label %return, !dbg !2249

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2250
  ret i32 %21, !dbg !2250
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2251 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2252, metadata !DIExpression()), !dbg !2253
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2254, metadata !DIExpression()), !dbg !2255
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2256, metadata !DIExpression()), !dbg !2257
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2258, metadata !DIExpression()), !dbg !2259
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2260, metadata !DIExpression()), !dbg !2261
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2262, metadata !DIExpression()), !dbg !2263
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2264, metadata !DIExpression()), !dbg !2265
  %0 = load i32, i32* %value.addr, align 4, !dbg !2266
  %cmp = icmp slt i32 %0, 0, !dbg !2268
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2269
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2269

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2270
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2271
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2272
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2272

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2273
  br label %if.end, !dbg !2275

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2276
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2278
  %cmp5 = icmp slt i32 %4, 0, !dbg !2280
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2281

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2282
  %sub = sub nsw i32 0, %5, !dbg !2284
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2285
  br label %if.end8, !dbg !2286

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2287
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2289
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2290
  %cmp9 = icmp slt i32 %7, 0, !dbg !2292
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2293

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2294
  %sub11 = sub nsw i32 0, %8, !dbg !2296
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2297
  br label %if.end13, !dbg !2298

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2299
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2301
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2302
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2303
  %mul = mul i32 %10, %11, !dbg !2304
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2305
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2306
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2307
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2308
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2309
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2310
  %shr = lshr i32 %14, 30, !dbg !2311
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2312
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2313
  %shl = shl i32 %15, 2, !dbg !2314
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2315
  %or = or i32 %16, %shl, !dbg !2315
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2315
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2316
  %shr14 = lshr i32 %17, 30, !dbg !2318
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2319
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2320

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2321
  %conv = zext i8 %18 to i32, !dbg !2321
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2324
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2325

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2326
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2329
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2330

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2331
  store i32 %20, i32* %retval, align 4, !dbg !2332
  br label %return, !dbg !2332

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2333
  br label %return, !dbg !2333

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2334
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2337
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2338

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2339
  %sub28 = sub i32 0, %22, !dbg !2340
  store i32 %sub28, i32* %retval, align 4, !dbg !2341
  br label %return, !dbg !2341

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2342
  br label %return, !dbg !2342

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2343
  br label %return, !dbg !2343

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2345
  ret i32 %23, !dbg !2345
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2346 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2349, metadata !DIExpression()), !dbg !2350
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2351, metadata !DIExpression()), !dbg !2352
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2353, metadata !DIExpression()), !dbg !2354
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2355, metadata !DIExpression()), !dbg !2356
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2357, metadata !DIExpression()), !dbg !2358
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2359, metadata !DIExpression()), !dbg !2360
  %0 = load i32, i32* %value.addr, align 4, !dbg !2361
  %cmp = icmp slt i32 %0, 0, !dbg !2363
  br i1 %cmp, label %if.then, label %if.else, !dbg !2364

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2365
  %sub = sub nsw i32 0, %1, !dbg !2367
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2368
  store i8 1, i8* %u8SignBit, align 1, !dbg !2369
  br label %if.end, !dbg !2370

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2371
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2373
  store i8 0, i8* %u8SignBit, align 1, !dbg !2374
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2375
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2376
  %conv = zext i8 %4 to i32, !dbg !2376
  %mul = mul i32 %3, %conv, !dbg !2377
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2378
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2379
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2380
  %conv1 = zext i8 %6 to i32, !dbg !2380
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2381
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2382
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2383
  %shr = lshr i32 %7, 8, !dbg !2384
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2385
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2386
  %shl = shl i32 %8, 24, !dbg !2387
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2388
  %or = or i32 %9, %shl, !dbg !2388
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2388
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2389
  %conv2 = zext i8 %10 to i32, !dbg !2389
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2391
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2392

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2393
  store i32 %11, i32* %retval, align 4, !dbg !2395
  br label %return, !dbg !2395

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2396
  %sub7 = sub i32 0, %12, !dbg !2398
  store i32 %sub7, i32* %retval, align 4, !dbg !2399
  br label %return, !dbg !2399

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2400
  ret i32 %13, !dbg !2400
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2401 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2402, metadata !DIExpression()), !dbg !2403
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2404, metadata !DIExpression()), !dbg !2405
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2406, metadata !DIExpression()), !dbg !2407
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2408, metadata !DIExpression()), !dbg !2409
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2410, metadata !DIExpression()), !dbg !2411
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2412, metadata !DIExpression()), !dbg !2413
  %0 = load i32, i32* %value.addr, align 4, !dbg !2414
  %cmp = icmp slt i32 %0, 0, !dbg !2416
  br i1 %cmp, label %if.then, label %if.else, !dbg !2417

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2418
  %sub = sub nsw i32 0, %1, !dbg !2420
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2421
  store i8 1, i8* %u8SignBit, align 1, !dbg !2422
  br label %if.end, !dbg !2423

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2424
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2426
  store i8 0, i8* %u8SignBit, align 1, !dbg !2427
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2428
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2429
  %conv = zext i8 %4 to i32, !dbg !2429
  %mul = mul i32 %3, %conv, !dbg !2430
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2431
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2432
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2433
  %conv1 = zext i8 %6 to i32, !dbg !2433
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2434
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2435
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2436
  %shr = lshr i32 %7, 7, !dbg !2437
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2438
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2439
  %shl = shl i32 %8, 25, !dbg !2440
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2441
  %or = or i32 %9, %shl, !dbg !2441
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2441
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2442
  %conv2 = zext i8 %10 to i32, !dbg !2442
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2444
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2445

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2446
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2449
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2450

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2451
  store i32 %12, i32* %retval, align 4, !dbg !2452
  br label %return, !dbg !2452

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2453
  br label %return, !dbg !2453

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2454
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2457
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2458

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2459
  %sub14 = sub i32 0, %14, !dbg !2460
  store i32 %sub14, i32* %retval, align 4, !dbg !2461
  br label %return, !dbg !2461

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2462
  br label %return, !dbg !2462

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2463
  ret i32 %15, !dbg !2463
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2464 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2467, metadata !DIExpression()), !dbg !2468
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2469, metadata !DIExpression()), !dbg !2470
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2471, metadata !DIExpression()), !dbg !2472
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2473, metadata !DIExpression()), !dbg !2474
  store i32 0, i32* %u32Temp1, align 4, !dbg !2474
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2475, metadata !DIExpression()), !dbg !2476
  store i32 0, i32* %u32Temp2, align 4, !dbg !2476
  %0 = load i8, i8* %power.addr, align 1, !dbg !2477
  %conv = zext i8 %0 to i32, !dbg !2477
  %cmp = icmp sge i32 %conv, 32, !dbg !2479
  br i1 %cmp, label %if.then, label %if.else, !dbg !2480

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2481
  br label %if.end7, !dbg !2483

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2484
  %conv2 = zext i8 %1 to i32, !dbg !2484
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2486
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2487

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2488
  br label %if.end7, !dbg !2490

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2491
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2492
  %mul = mul i32 %2, %3, !dbg !2493
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2494
  %4 = load i32, i32* %value.addr, align 4, !dbg !2495
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2496
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2497
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2498
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2499
  %7 = load i8, i8* %power.addr, align 1, !dbg !2500
  %conv8 = zext i8 %7 to i32, !dbg !2500
  %sub = sub nsw i32 32, %conv8, !dbg !2501
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2502
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2502
  %shr = lshr i32 %6, %sub, !dbg !2502, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2503
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2504
  %9 = load i8, i8* %power.addr, align 1, !dbg !2505
  %conv9 = zext i8 %9 to i32, !dbg !2505
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2506
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2506
  %shl = shl i32 %8, %conv9, !dbg !2506, !klee.check.shift !267
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2507
  %or = or i32 %10, %shl, !dbg !2507
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2507
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2508
  %12 = load i8, i8* %power.addr, align 1, !dbg !2510
  %conv10 = zext i8 %12 to i32, !dbg !2510
  %sub11 = sub nsw i32 32, %conv10, !dbg !2511
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2512
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2512
  %shr12 = lshr i32 %11, %sub11, !dbg !2512, !klee.check.shift !267
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2513
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2514

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2515
  store i32 %13, i32* %retval, align 4, !dbg !2517
  br label %return, !dbg !2517

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2518
  br label %return, !dbg !2518

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2520
  ret i32 %14, !dbg !2520
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2521 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2524, metadata !DIExpression()), !dbg !2525
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2526, metadata !DIExpression()), !dbg !2527
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2528, metadata !DIExpression()), !dbg !2529
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2530, metadata !DIExpression()), !dbg !2531
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2532, metadata !DIExpression()), !dbg !2533
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2534, metadata !DIExpression()), !dbg !2535
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2536, metadata !DIExpression()), !dbg !2537
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2538, metadata !DIExpression()), !dbg !2539
  %0 = load i8, i8* %power.addr, align 1, !dbg !2540
  %conv = zext i8 %0 to i32, !dbg !2540
  %cmp = icmp sge i32 %conv, 32, !dbg !2542
  br i1 %cmp, label %if.then, label %if.else, !dbg !2543

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2544
  br label %if.end7, !dbg !2546

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2547
  %conv2 = zext i8 %1 to i32, !dbg !2547
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2549
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2550

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2551
  br label %if.end7, !dbg !2553

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2554
  %cmp8 = icmp slt i32 %2, 0, !dbg !2556
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2557
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2557

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2558
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2559
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2560
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2560

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2561
  br label %if.end19, !dbg !2563

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2564
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2566
  %cmp20 = icmp slt i32 %6, 0, !dbg !2568
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2569

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2570
  %sub = sub nsw i32 0, %7, !dbg !2572
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2573
  br label %if.end24, !dbg !2574

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2575
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2577
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2578
  %cmp25 = icmp slt i32 %9, 0, !dbg !2580
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2581

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2582
  %sub28 = sub nsw i32 0, %10, !dbg !2584
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2585
  br label %if.end30, !dbg !2586

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2587
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2589
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2590
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2591
  %mul = mul i32 %12, %13, !dbg !2592
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2593
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2594
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2595
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2596
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2597
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2598
  %17 = load i8, i8* %power.addr, align 1, !dbg !2599
  %conv31 = zext i8 %17 to i32, !dbg !2599
  %sub32 = sub nsw i32 32, %conv31, !dbg !2600
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2601
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2601
  %shr = lshr i32 %16, %sub32, !dbg !2601, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2602
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2603
  %19 = load i8, i8* %power.addr, align 1, !dbg !2604
  %conv33 = zext i8 %19 to i32, !dbg !2604
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2605
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2605
  %shl = shl i32 %18, %conv33, !dbg !2605, !klee.check.shift !267
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2606
  %or = or i32 %20, %shl, !dbg !2606
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2606
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2607
  %22 = load i8, i8* %power.addr, align 1, !dbg !2609
  %conv34 = zext i8 %22 to i32, !dbg !2609
  %sub35 = sub nsw i32 32, %conv34, !dbg !2610
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2611
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2611
  %shr36 = lshr i32 %21, %sub35, !dbg !2611, !klee.check.shift !267
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2612
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2613

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2614
  %conv40 = zext i8 %23 to i32, !dbg !2614
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2617
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2618

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2619
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2622
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2623

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2624
  store i32 %25, i32* %retval, align 4, !dbg !2625
  br label %return, !dbg !2625

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2626
  br label %return, !dbg !2626

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2627
  %sub49 = sub i32 0, %26, !dbg !2629
  store i32 %sub49, i32* %retval, align 4, !dbg !2630
  br label %return, !dbg !2630

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2631
  %conv51 = zext i8 %27 to i32, !dbg !2631
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2634
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2635

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2636
  br label %return, !dbg !2636

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2638
  br label %return, !dbg !2638

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2640
  ret i32 %28, !dbg !2640
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2641 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2644, metadata !DIExpression()), !dbg !2645
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2646, metadata !DIExpression()), !dbg !2647
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2648, metadata !DIExpression()), !dbg !2649
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2650, metadata !DIExpression()), !dbg !2651
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2652, metadata !DIExpression()), !dbg !2653
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2654, metadata !DIExpression()), !dbg !2655
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2656, metadata !DIExpression()), !dbg !2657
  %0 = load i32, i32* %value.addr, align 4, !dbg !2658
  %cmp = icmp slt i32 %0, 0, !dbg !2660
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2661

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2662
  %conv = sext i8 %1 to i32, !dbg !2662
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2663
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2664

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2665
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2666
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2667

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2668
  %conv6 = sext i8 %3 to i32, !dbg !2668
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2669
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2670

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2671
  br label %if.end, !dbg !2673

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2674
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2676
  %cmp9 = icmp slt i32 %4, 0, !dbg !2678
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2679

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2680
  %sub = sub nsw i32 0, %5, !dbg !2682
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2683
  br label %if.end13, !dbg !2684

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2685
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2687
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2688
  %conv14 = sext i8 %7 to i32, !dbg !2688
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2690
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2691

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2692
  %conv18 = sext i8 %8 to i32, !dbg !2692
  %sub19 = sub nsw i32 0, %conv18, !dbg !2694
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2695
  br label %if.end22, !dbg !2696

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2697
  %conv21 = sext i8 %9 to i32, !dbg !2697
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2699
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2700
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2701
  %mul = mul i32 %10, %11, !dbg !2702
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2703
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2704
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2705
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2706
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2707
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2708
  %shr = lshr i32 %14, 7, !dbg !2709
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2710
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2711
  %shl = shl i32 %15, 25, !dbg !2712
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2713
  %or = or i32 %16, %shl, !dbg !2713
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2713
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2714
  %conv23 = zext i8 %17 to i32, !dbg !2714
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2716
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2717

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2718
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2721
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2722

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2723
  store i32 %19, i32* %retval, align 4, !dbg !2724
  br label %return, !dbg !2724

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2725
  br label %return, !dbg !2725

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2726
  %sub32 = sub i32 0, %20, !dbg !2728
  store i32 %sub32, i32* %retval, align 4, !dbg !2729
  br label %return, !dbg !2729

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2730
  ret i32 %21, !dbg !2730
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2731 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2732, metadata !DIExpression()), !dbg !2733
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2734, metadata !DIExpression()), !dbg !2735
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2736, metadata !DIExpression()), !dbg !2737
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2738, metadata !DIExpression()), !dbg !2739
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2740, metadata !DIExpression()), !dbg !2741
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2742, metadata !DIExpression()), !dbg !2743
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2744, metadata !DIExpression()), !dbg !2745
  %0 = load i32, i32* %value.addr, align 4, !dbg !2746
  %cmp = icmp slt i32 %0, 0, !dbg !2748
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2749

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2750
  %conv = sext i8 %1 to i32, !dbg !2750
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2751
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2752

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2753
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2754
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2755

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2756
  %conv6 = sext i8 %3 to i32, !dbg !2756
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2757
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2758

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2759
  br label %if.end, !dbg !2761

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2762
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2764
  %cmp9 = icmp slt i32 %4, 0, !dbg !2766
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2767

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2768
  %sub = sub nsw i32 0, %5, !dbg !2770
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2771
  br label %if.end13, !dbg !2772

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2773
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2775
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2776
  %conv14 = sext i8 %7 to i32, !dbg !2776
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2778
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2779

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2780
  %conv18 = sext i8 %8 to i32, !dbg !2780
  %sub19 = sub nsw i32 0, %conv18, !dbg !2782
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2783
  br label %if.end22, !dbg !2784

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2785
  %conv21 = sext i8 %9 to i32, !dbg !2785
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2787
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2788
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2789
  %mul = mul i32 %10, %11, !dbg !2790
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2791
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2792
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2793
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2794
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2795
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2796
  %shr = lshr i32 %14, 6, !dbg !2797
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2798
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2799
  %shl = shl i32 %15, 26, !dbg !2800
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2801
  %or = or i32 %16, %shl, !dbg !2801
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2801
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2802
  %shr23 = lshr i32 %17, 6, !dbg !2804
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2805
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2806

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2807
  %conv27 = zext i8 %18 to i32, !dbg !2807
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2810
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2811

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2812
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2815
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2816

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2817
  store i32 %20, i32* %retval, align 4, !dbg !2818
  br label %return, !dbg !2818

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2819
  br label %return, !dbg !2819

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2820
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2823
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2824

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2825
  %sub39 = sub i32 0, %22, !dbg !2826
  store i32 %sub39, i32* %retval, align 4, !dbg !2827
  br label %return, !dbg !2827

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2828
  br label %return, !dbg !2828

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2829
  br label %return, !dbg !2829

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2831
  ret i32 %23, !dbg !2831
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2832 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2833, metadata !DIExpression()), !dbg !2834
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2835, metadata !DIExpression()), !dbg !2836
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2837, metadata !DIExpression()), !dbg !2838
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2839, metadata !DIExpression()), !dbg !2840
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2841, metadata !DIExpression()), !dbg !2842
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2843, metadata !DIExpression()), !dbg !2844
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2845, metadata !DIExpression()), !dbg !2846
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2847
  %cmp = icmp slt i32 %0, 0, !dbg !2849
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2850
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2850

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2851
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2852
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2853
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2853

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2854
  br label %if.end, !dbg !2856

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2857
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2859
  %cmp5 = icmp slt i32 %4, 0, !dbg !2861
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2862

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2863
  %sub = sub nsw i32 0, %5, !dbg !2865
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2866
  br label %if.end8, !dbg !2867

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2868
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2870
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2871
  %cmp9 = icmp slt i32 %7, 0, !dbg !2873
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2874

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2875
  %sub11 = sub nsw i32 0, %8, !dbg !2877
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2878
  br label %if.end13, !dbg !2879

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2880
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2882
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2883
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2884
  %mul = mul i32 %10, %11, !dbg !2885
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2886
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2887
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2888
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2889
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2890
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2891
  %cmp14 = icmp eq i32 %14, 0, !dbg !2893
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2894

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2895
  %conv = zext i8 %15 to i32, !dbg !2895
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2898
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2899

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2900
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2903
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2904

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2905
  store i32 %17, i32* %retval, align 4, !dbg !2906
  br label %return, !dbg !2906

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2907
  br label %return, !dbg !2907

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2908
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2911
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2912

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2913
  %sub27 = sub i32 0, %19, !dbg !2914
  store i32 %sub27, i32* %retval, align 4, !dbg !2915
  br label %return, !dbg !2915

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2916
  br label %return, !dbg !2916

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2917
  %conv30 = zext i8 %20 to i32, !dbg !2917
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2920
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2921

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2922
  br label %return, !dbg !2922

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2924
  br label %return, !dbg !2924

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2926
  ret i32 %21, !dbg !2926
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2927 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2928, metadata !DIExpression()), !dbg !2929
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2930, metadata !DIExpression()), !dbg !2931
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2932, metadata !DIExpression()), !dbg !2933
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2934, metadata !DIExpression()), !dbg !2935
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2936, metadata !DIExpression()), !dbg !2937
  %0 = load i32, i32* %value.addr, align 4, !dbg !2938
  %cmp = icmp slt i32 %0, 0, !dbg !2940
  br i1 %cmp, label %if.then, label %if.else, !dbg !2941

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2942
  %sub = sub nsw i32 0, %1, !dbg !2944
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2945
  store i8 1, i8* %u8SignBit, align 1, !dbg !2946
  br label %if.end, !dbg !2947

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2948
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2950
  store i8 0, i8* %u8SignBit, align 1, !dbg !2951
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2952
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2953
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2954
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2955
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2956
  %shr = lshr i32 %5, 1, !dbg !2957
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2958
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2959
  %conv = zext i8 %6 to i32, !dbg !2959
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2961
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2962

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2963
  store i32 %7, i32* %retval, align 4, !dbg !2965
  br label %return, !dbg !2965

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2966
  %sub5 = sub i32 0, %8, !dbg !2968
  store i32 %sub5, i32* %retval, align 4, !dbg !2969
  br label %return, !dbg !2969

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2970
  ret i32 %9, !dbg !2970
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2971 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2972, metadata !DIExpression()), !dbg !2973
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2974, metadata !DIExpression()), !dbg !2975
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2976, metadata !DIExpression()), !dbg !2977
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2978, metadata !DIExpression()), !dbg !2979
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2980, metadata !DIExpression()), !dbg !2981
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2982, metadata !DIExpression()), !dbg !2983
  %0 = load i32, i32* %value.addr, align 4, !dbg !2984
  %cmp = icmp slt i32 %0, 0, !dbg !2986
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2987
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2987

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2988
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2989
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2990
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2990

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2991
  br label %if.end, !dbg !2993

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2994
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2996
  %cmp5 = icmp slt i32 %4, 0, !dbg !2998
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2999

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3000
  %sub = sub nsw i32 0, %5, !dbg !3002
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3003
  br label %if.end8, !dbg !3004

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3005
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3007
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3008
  %cmp9 = icmp slt i32 %7, 0, !dbg !3010
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3011

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3012
  %sub11 = sub nsw i32 0, %8, !dbg !3014
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3015
  br label %if.end13, !dbg !3016

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3017
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3019
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3020
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3021
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3022
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3023
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3024
  %conv = zext i8 %12 to i32, !dbg !3024
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3026
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3027

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3028
  store i32 %13, i32* %retval, align 4, !dbg !3030
  br label %return, !dbg !3030

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3031
  %sub18 = sub i32 0, %14, !dbg !3033
  store i32 %sub18, i32* %retval, align 4, !dbg !3034
  br label %return, !dbg !3034

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3035
  ret i32 %15, !dbg !3035
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3036 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3039, metadata !DIExpression()), !dbg !3040
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3041, metadata !DIExpression()), !dbg !3042
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3043, metadata !DIExpression()), !dbg !3044
  store i32 0, i32* %u32Temp1, align 4, !dbg !3044
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3045, metadata !DIExpression()), !dbg !3046
  store i32 0, i32* %u32Temp2, align 4, !dbg !3046
  %0 = load i32, i32* %value.addr, align 4, !dbg !3047
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3048
  %conv = zext i8 %1 to i32, !dbg !3048
  %mul = mul i32 %0, %conv, !dbg !3049
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3050
  %2 = load i32, i32* %value.addr, align 4, !dbg !3051
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3052
  %conv1 = zext i8 %3 to i32, !dbg !3052
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3053
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3054
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3055
  %shr = lshr i32 %4, 8, !dbg !3056
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3057
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3058
  %shl = shl i32 %5, 24, !dbg !3059
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3060
  %or = or i32 %6, %shl, !dbg !3060
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3060
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3061
  ret i32 %7, !dbg !3062
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3063 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3064, metadata !DIExpression()), !dbg !3065
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3066, metadata !DIExpression()), !dbg !3067
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3068, metadata !DIExpression()), !dbg !3069
  store i32 0, i32* %u32Temp1, align 4, !dbg !3069
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3070, metadata !DIExpression()), !dbg !3071
  store i32 0, i32* %u32Temp2, align 4, !dbg !3071
  %0 = load i32, i32* %value.addr, align 4, !dbg !3072
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3073
  %conv = zext i8 %1 to i32, !dbg !3073
  %mul = mul i32 %0, %conv, !dbg !3074
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3075
  %2 = load i32, i32* %value.addr, align 4, !dbg !3076
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3077
  %conv1 = zext i8 %3 to i32, !dbg !3077
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3078
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3079
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3080
  %shr = lshr i32 %4, 7, !dbg !3081
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3082
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3083
  %shl = shl i32 %5, 25, !dbg !3084
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3085
  %or = or i32 %6, %shl, !dbg !3085
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3085
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3086
  %shr2 = lshr i32 %7, 7, !dbg !3088
  %cmp = icmp eq i32 %shr2, 0, !dbg !3089
  br i1 %cmp, label %if.then, label %if.else, !dbg !3090

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3091
  store i32 %8, i32* %retval, align 4, !dbg !3093
  br label %return, !dbg !3093

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3094
  br label %return, !dbg !3094

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3096
  ret i32 %9, !dbg !3096
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3097 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3100, metadata !DIExpression()), !dbg !3101
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3102, metadata !DIExpression()), !dbg !3103
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3104, metadata !DIExpression()), !dbg !3105
  store i32 0, i32* %u32Temp1, align 4, !dbg !3105
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3106, metadata !DIExpression()), !dbg !3107
  store i32 0, i32* %u32Temp2, align 4, !dbg !3107
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3108
  %conv = sext i8 %0 to i32, !dbg !3108
  %cmp = icmp sgt i32 %conv, 0, !dbg !3110
  br i1 %cmp, label %if.then, label %if.else, !dbg !3111

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3112
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3114
  %conv2 = sext i8 %2 to i32, !dbg !3114
  %mul = mul i32 %1, %conv2, !dbg !3115
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3116
  %3 = load i32, i32* %value.addr, align 4, !dbg !3117
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3118
  %conv3 = sext i8 %4 to i32, !dbg !3118
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3119
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3120
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3121
  %shr = lshr i32 %5, 7, !dbg !3122
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3123
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3124
  %shl = shl i32 %6, 25, !dbg !3125
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3126
  %or = or i32 %7, %shl, !dbg !3126
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3126
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3127
  store i32 %8, i32* %retval, align 4, !dbg !3128
  br label %return, !dbg !3128

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3129
  br label %return, !dbg !3129

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3131
  ret i32 %9, !dbg !3131
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3132 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3133, metadata !DIExpression()), !dbg !3134
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3135, metadata !DIExpression()), !dbg !3136
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3137, metadata !DIExpression()), !dbg !3138
  store i32 0, i32* %u32Temp1, align 4, !dbg !3138
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3139, metadata !DIExpression()), !dbg !3140
  store i32 0, i32* %u32Temp2, align 4, !dbg !3140
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3141
  %conv = sext i8 %0 to i32, !dbg !3141
  %cmp = icmp sle i32 %conv, 0, !dbg !3143
  br i1 %cmp, label %if.then, label %if.else, !dbg !3144

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3145
  br label %return, !dbg !3145

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3147
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3149
  %conv2 = sext i8 %2 to i32, !dbg !3149
  %mul = mul i32 %1, %conv2, !dbg !3150
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3151
  %3 = load i32, i32* %value.addr, align 4, !dbg !3152
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3153
  %conv3 = sext i8 %4 to i32, !dbg !3153
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3154
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3155
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3156
  %shr = lshr i32 %5, 6, !dbg !3157
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3158
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3159
  %shl = shl i32 %6, 26, !dbg !3160
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3161
  %or = or i32 %7, %shl, !dbg !3161
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3161
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3162
  %shr4 = lshr i32 %8, 6, !dbg !3164
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3165
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3166

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3167
  store i32 %9, i32* %retval, align 4, !dbg !3169
  br label %return, !dbg !3169

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3170
  br label %return, !dbg !3170

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3172
  ret i32 %10, !dbg !3172
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3173 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3174, metadata !DIExpression()), !dbg !3175
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3176, metadata !DIExpression()), !dbg !3177
  %0 = load i16, i16* %value.addr, align 2, !dbg !3178
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3179
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3180
  ret i16 %call, !dbg !3181
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3182 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3183, metadata !DIExpression()), !dbg !3184
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3185, metadata !DIExpression()), !dbg !3186
  %0 = load i16, i16* %value.addr, align 2, !dbg !3187
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3188
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3189
  ret i16 %call, !dbg !3190
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3191 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3192, metadata !DIExpression()), !dbg !3193
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3194, metadata !DIExpression()), !dbg !3195
  %0 = load i16, i16* %value.addr, align 2, !dbg !3196
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3197
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3198
  ret i16 %call, !dbg !3199
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3200 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3201, metadata !DIExpression()), !dbg !3202
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3203, metadata !DIExpression()), !dbg !3204
  %0 = load i16, i16* %value.addr, align 2, !dbg !3205
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3206
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3207
  ret i16 %call, !dbg !3208
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3209 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3210, metadata !DIExpression()), !dbg !3211
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  %0 = load i16, i16* %value.addr, align 2, !dbg !3214
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3215
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3216
  ret i16 %call, !dbg !3217
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3218 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3219, metadata !DIExpression()), !dbg !3220
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3221, metadata !DIExpression()), !dbg !3222
  %0 = load i16, i16* %value.addr, align 2, !dbg !3223
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3224
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3225
  ret i16 %call, !dbg !3226
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3227 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3228, metadata !DIExpression()), !dbg !3229
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3230, metadata !DIExpression()), !dbg !3231
  %0 = load i16, i16* %value.addr, align 2, !dbg !3232
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3233
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3234
  ret i16 %call, !dbg !3235
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3236 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3237, metadata !DIExpression()), !dbg !3238
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3239, metadata !DIExpression()), !dbg !3240
  %0 = load i16, i16* %value.addr, align 2, !dbg !3241
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3242
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3243
  ret i16 %call, !dbg !3244
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3245 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3246, metadata !DIExpression()), !dbg !3247
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3248, metadata !DIExpression()), !dbg !3249
  %0 = load i16, i16* %value.addr, align 2, !dbg !3250
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3251
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3252
  ret i16 %call, !dbg !3253
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3254 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3255, metadata !DIExpression()), !dbg !3256
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3257, metadata !DIExpression()), !dbg !3258
  %0 = load i16, i16* %value.addr, align 2, !dbg !3259
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3260
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3261
  ret i16 %call, !dbg !3262
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3263 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3264, metadata !DIExpression()), !dbg !3265
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3266, metadata !DIExpression()), !dbg !3267
  %0 = load i16, i16* %value.addr, align 2, !dbg !3268
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3269
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3270
  ret i16 %call, !dbg !3271
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3272 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3273, metadata !DIExpression()), !dbg !3274
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3275, metadata !DIExpression()), !dbg !3276
  %0 = load i16, i16* %value.addr, align 2, !dbg !3277
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3278
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3279
  ret i16 %call, !dbg !3280
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3281 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3282, metadata !DIExpression()), !dbg !3283
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3284, metadata !DIExpression()), !dbg !3285
  %0 = load i16, i16* %value.addr, align 2, !dbg !3286
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3287
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3288
  ret i16 %call, !dbg !3289
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3290 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3291, metadata !DIExpression()), !dbg !3292
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3293, metadata !DIExpression()), !dbg !3294
  %0 = load i16, i16* %value.addr, align 2, !dbg !3295
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3296
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3297
  ret i16 %call, !dbg !3298
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3299 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3300, metadata !DIExpression()), !dbg !3301
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3302, metadata !DIExpression()), !dbg !3303
  %0 = load i16, i16* %value.addr, align 2, !dbg !3304
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3305
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3306
  ret i16 %call, !dbg !3307
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3308 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3309, metadata !DIExpression()), !dbg !3310
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  %0 = load i16, i16* %value.addr, align 2, !dbg !3313
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3314
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3315
  %2 = load i16, i16* %retval, align 2, !dbg !3316
  ret i16 %2, !dbg !3316
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3317 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3318, metadata !DIExpression()), !dbg !3319
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3320, metadata !DIExpression()), !dbg !3321
  %0 = load i16, i16* %value.addr, align 2, !dbg !3322
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3323
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3324
  ret i16 %call, !dbg !3325
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3326 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3327, metadata !DIExpression()), !dbg !3328
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3329, metadata !DIExpression()), !dbg !3330
  %0 = load i16, i16* %value.addr, align 2, !dbg !3331
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3332
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3333
  ret i16 %call, !dbg !3334
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3335 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3336, metadata !DIExpression()), !dbg !3337
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3338, metadata !DIExpression()), !dbg !3339
  %0 = load i16, i16* %value.addr, align 2, !dbg !3340
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3341
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3342
  ret i16 %call, !dbg !3343
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3344 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3345, metadata !DIExpression()), !dbg !3346
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3347, metadata !DIExpression()), !dbg !3348
  %0 = load i16, i16* %value.addr, align 2, !dbg !3349
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3350
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3351
  ret i16 %call, !dbg !3352
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3353 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3354, metadata !DIExpression()), !dbg !3355
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3356, metadata !DIExpression()), !dbg !3357
  %0 = load i16, i16* %value.addr, align 2, !dbg !3358
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3359
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3360
  ret i16 %call, !dbg !3361
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3362 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3363, metadata !DIExpression()), !dbg !3364
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3365, metadata !DIExpression()), !dbg !3366
  %0 = load i16, i16* %value.addr, align 2, !dbg !3367
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3368
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3369
  ret i16 %call, !dbg !3370
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3371 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3372, metadata !DIExpression()), !dbg !3373
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3374, metadata !DIExpression()), !dbg !3375
  %0 = load i16, i16* %value.addr, align 2, !dbg !3376
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3377
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3378
  ret i16 %call, !dbg !3379
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3380 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3381, metadata !DIExpression()), !dbg !3382
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3383, metadata !DIExpression()), !dbg !3384
  %0 = load i16, i16* %value.addr, align 2, !dbg !3385
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3386
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3387
  ret i16 %call, !dbg !3388
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3389 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3390, metadata !DIExpression()), !dbg !3391
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3392, metadata !DIExpression()), !dbg !3393
  %0 = load i16, i16* %value.addr, align 2, !dbg !3394
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3395
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3396
  ret i16 %call, !dbg !3397
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3398 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3399, metadata !DIExpression()), !dbg !3400
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3401, metadata !DIExpression()), !dbg !3402
  %0 = load i16, i16* %value.addr, align 2, !dbg !3403
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3404
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3405
  ret i16 %call, !dbg !3406
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3407 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3408, metadata !DIExpression()), !dbg !3409
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3410, metadata !DIExpression()), !dbg !3411
  %0 = load i16, i16* %value.addr, align 2, !dbg !3412
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3413
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3414
  ret i16 %call, !dbg !3415
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3416 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3417, metadata !DIExpression()), !dbg !3418
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3419, metadata !DIExpression()), !dbg !3420
  %0 = load i16, i16* %value.addr, align 2, !dbg !3421
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3422
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3423
  ret i16 %call, !dbg !3424
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3425 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3426, metadata !DIExpression()), !dbg !3427
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3428, metadata !DIExpression()), !dbg !3429
  %0 = load i16, i16* %value.addr, align 2, !dbg !3430
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3431
  %conv = zext i8 %1 to i16, !dbg !3432
  %conv1 = zext i16 %conv to i32, !dbg !3432
  %shl = shl i32 %conv1, 5, !dbg !3433
  %conv2 = trunc i32 %shl to i16, !dbg !3434
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3435
  ret i16 %call, !dbg !3436
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3437 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3438, metadata !DIExpression()), !dbg !3439
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3440, metadata !DIExpression()), !dbg !3441
  %0 = load i16, i16* %value.addr, align 2, !dbg !3442
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3443
  %conv = zext i8 %1 to i16, !dbg !3444
  %conv1 = zext i16 %conv to i32, !dbg !3444
  %shl = shl i32 %conv1, 6, !dbg !3445
  %conv2 = trunc i32 %shl to i16, !dbg !3446
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3447
  ret i16 %call, !dbg !3448
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3449 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3450, metadata !DIExpression()), !dbg !3451
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3452, metadata !DIExpression()), !dbg !3453
  %0 = load i16, i16* %value.addr, align 2, !dbg !3454
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3455
  %conv = zext i8 %1 to i16, !dbg !3456
  %conv1 = zext i16 %conv to i32, !dbg !3456
  %shl = shl i32 %conv1, 7, !dbg !3457
  %conv2 = trunc i32 %shl to i16, !dbg !3458
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3459
  ret i16 %call, !dbg !3460
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3461 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3462, metadata !DIExpression()), !dbg !3463
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3464, metadata !DIExpression()), !dbg !3465
  %0 = load i16, i16* %value.addr, align 2, !dbg !3466
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3467
  %conv = zext i8 %1 to i16, !dbg !3468
  %conv1 = zext i16 %conv to i32, !dbg !3468
  %shl = shl i32 %conv1, 7, !dbg !3469
  %conv2 = trunc i32 %shl to i16, !dbg !3470
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3471
  ret i16 %call, !dbg !3472
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3473 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3474, metadata !DIExpression()), !dbg !3475
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3476, metadata !DIExpression()), !dbg !3477
  %0 = load i16, i16* %value.addr, align 2, !dbg !3478
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3479
  %conv = zext i8 %1 to i16, !dbg !3480
  %conv1 = zext i16 %conv to i32, !dbg !3480
  %shl = shl i32 %conv1, 4, !dbg !3481
  %conv2 = trunc i32 %shl to i16, !dbg !3482
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3483
  ret i16 %call, !dbg !3484
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3485 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3486, metadata !DIExpression()), !dbg !3487
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3488, metadata !DIExpression()), !dbg !3489
  %0 = load i16, i16* %value.addr, align 2, !dbg !3490
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3491
  %conv = zext i8 %1 to i16, !dbg !3492
  %conv1 = zext i16 %conv to i32, !dbg !3492
  %shl = shl i32 %conv1, 5, !dbg !3493
  %conv2 = trunc i32 %shl to i16, !dbg !3494
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3495
  ret i16 %call, !dbg !3496
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3497 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3498, metadata !DIExpression()), !dbg !3499
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3500, metadata !DIExpression()), !dbg !3501
  %0 = load i16, i16* %value.addr, align 2, !dbg !3502
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3503
  %conv = zext i8 %1 to i16, !dbg !3504
  %conv1 = zext i16 %conv to i32, !dbg !3504
  %shl = shl i32 %conv1, 2, !dbg !3505
  %conv2 = trunc i32 %shl to i16, !dbg !3506
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3507
  ret i16 %call, !dbg !3508
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3509 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3510, metadata !DIExpression()), !dbg !3511
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3512, metadata !DIExpression()), !dbg !3513
  %0 = load i16, i16* %value.addr, align 2, !dbg !3514
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3515
  %conv = zext i8 %1 to i16, !dbg !3516
  %conv1 = zext i16 %conv to i32, !dbg !3516
  %shl = shl i32 %conv1, 6, !dbg !3517
  %conv2 = trunc i32 %shl to i16, !dbg !3518
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3519
  ret i16 %call, !dbg !3520
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3521 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3522, metadata !DIExpression()), !dbg !3523
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3524, metadata !DIExpression()), !dbg !3525
  %0 = load i16, i16* %value.addr, align 2, !dbg !3526
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3527
  %conv = zext i8 %1 to i16, !dbg !3528
  %conv1 = zext i16 %conv to i32, !dbg !3528
  %shl = shl i32 %conv1, 3, !dbg !3529
  %conv2 = trunc i32 %shl to i16, !dbg !3530
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3531
  ret i16 %call, !dbg !3532
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3533 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3534, metadata !DIExpression()), !dbg !3535
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3536, metadata !DIExpression()), !dbg !3537
  %0 = load i32, i32* %value.addr, align 4, !dbg !3538
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3539
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3540
  ret i32 %call, !dbg !3541
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3542 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3545, metadata !DIExpression()), !dbg !3546
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3547, metadata !DIExpression()), !dbg !3548
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3549, metadata !DIExpression()), !dbg !3550
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3551, metadata !DIExpression()), !dbg !3552
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3553, metadata !DIExpression()), !dbg !3554
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3555, metadata !DIExpression()), !dbg !3556
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3557, metadata !DIExpression()), !dbg !3558
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3559, metadata !DIExpression()), !dbg !3560
  %0 = load i32, i32* %value.addr, align 4, !dbg !3561
  %cmp = icmp slt i32 %0, 0, !dbg !3563
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3564

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3565
  %conv = sext i16 %1 to i32, !dbg !3565
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3566
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3567

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3568
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3569
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3570

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3571
  %conv6 = sext i16 %3 to i32, !dbg !3571
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3572
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3573

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3574
  br label %if.end, !dbg !3576

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3577
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3579
  %cmp9 = icmp slt i32 %4, 0, !dbg !3581
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3582

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3583
  %sub = sub nsw i32 0, %5, !dbg !3585
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3586
  br label %if.end13, !dbg !3587

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3588
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3590
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3591
  %conv14 = sext i16 %7 to i32, !dbg !3591
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3593
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3594

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3595
  %conv18 = sext i16 %8 to i32, !dbg !3595
  %sub19 = sub nsw i32 0, %conv18, !dbg !3597
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3598
  br label %if.end22, !dbg !3599

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3600
  %conv21 = sext i16 %9 to i32, !dbg !3600
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3602
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3603
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3604
  %mul = mul i32 %10, %11, !dbg !3605
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3606
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3607
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3608
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3609
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3610
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3611
  %15 = load i32, i32* %count.addr, align 4, !dbg !3612
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3613
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3613
  %shr = lshr i32 %14, %15, !dbg !3613, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3614
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3615
  %17 = load i32, i32* %count.addr, align 4, !dbg !3616
  %sub23 = sub i32 32, %17, !dbg !3617
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3618
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3618
  %shl = shl i32 %16, %sub23, !dbg !3618, !klee.check.shift !267
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3619
  %or = or i32 %18, %shl, !dbg !3619
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3619
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3620
  %20 = load i32, i32* %count.addr, align 4, !dbg !3622
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3623
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3623
  %shr24 = lshr i32 %19, %20, !dbg !3623, !klee.check.shift !267
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3624
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3625

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3626
  %conv28 = zext i8 %21 to i32, !dbg !3626
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3629
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3630

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3631
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3634
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3635

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3636
  store i32 %23, i32* %retval, align 4, !dbg !3637
  br label %return, !dbg !3637

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3638
  br label %return, !dbg !3638

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3639
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3642
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3643

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3644
  %sub40 = sub i32 0, %25, !dbg !3645
  store i32 %sub40, i32* %retval, align 4, !dbg !3646
  br label %return, !dbg !3646

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3647
  br label %return, !dbg !3647

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3648
  br label %return, !dbg !3648

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3650
  ret i32 %26, !dbg !3650
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3651 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3652, metadata !DIExpression()), !dbg !3653
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3654, metadata !DIExpression()), !dbg !3655
  %0 = load i32, i32* %value.addr, align 4, !dbg !3656
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3657
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3658
  ret i32 %call, !dbg !3659
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3660 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3663, metadata !DIExpression()), !dbg !3664
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3665, metadata !DIExpression()), !dbg !3666
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3667, metadata !DIExpression()), !dbg !3668
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3669, metadata !DIExpression()), !dbg !3670
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3671, metadata !DIExpression()), !dbg !3672
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3673, metadata !DIExpression()), !dbg !3674
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3675, metadata !DIExpression()), !dbg !3676
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3677, metadata !DIExpression()), !dbg !3678
  %0 = load i32, i32* %value.addr, align 4, !dbg !3679
  %cmp = icmp slt i32 %0, 0, !dbg !3681
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3682

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3683
  %conv = sext i8 %1 to i32, !dbg !3683
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3684
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3685

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3686
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3687
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3688

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3689
  %conv6 = sext i8 %3 to i32, !dbg !3689
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3690
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3691

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3692
  br label %if.end, !dbg !3694

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3695
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3697
  %cmp9 = icmp slt i32 %4, 0, !dbg !3699
  br i1 %cmp9, label %if.then11, label %if.else15, !dbg !3700

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3701
  %conv12 = sext i32 %5 to i64, !dbg !3704
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv12), !dbg !3705
  %tobool = icmp ne i32 %call, 0, !dbg !3705
  br i1 %tobool, label %if.end14, label %if.then13, !dbg !3706

if.then13:                                        ; preds = %if.then11
  store i32 0, i32* %retval, align 4, !dbg !3707
  br label %return, !dbg !3707

if.end14:                                         ; preds = %if.then11
  %6 = load i32, i32* %value.addr, align 4, !dbg !3709
  %sub = sub nsw i32 0, %6, !dbg !3710
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3711
  br label %if.end16, !dbg !3712

if.else15:                                        ; preds = %if.end
  %7 = load i32, i32* %value.addr, align 4, !dbg !3713
  store i32 %7, i32* %u32Temp1, align 4, !dbg !3715
  br label %if.end16

if.end16:                                         ; preds = %if.else15, %if.end14
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3716
  %conv17 = sext i8 %8 to i32, !dbg !3716
  %cmp18 = icmp slt i32 %conv17, 0, !dbg !3718
  br i1 %cmp18, label %if.then20, label %if.else23, !dbg !3719

if.then20:                                        ; preds = %if.end16
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3720
  %conv21 = sext i8 %9 to i32, !dbg !3720
  %sub22 = sub nsw i32 0, %conv21, !dbg !3722
  store i32 %sub22, i32* %u32Temp2, align 4, !dbg !3723
  br label %if.end25, !dbg !3724

if.else23:                                        ; preds = %if.end16
  %10 = load i8, i8* %factor.addr, align 1, !dbg !3725
  %conv24 = sext i8 %10 to i32, !dbg !3725
  store i32 %conv24, i32* %u32Temp2, align 4, !dbg !3727
  br label %if.end25

if.end25:                                         ; preds = %if.else23, %if.then20
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !3728
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !3729
  %mul = mul i32 %11, %12, !dbg !3730
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3731
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !3732
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !3733
  %call26 = call i32 @MulHighWord(i32 %13, i32 %14), !dbg !3734
  store i32 %call26, i32* %u32Temp4, align 4, !dbg !3735
  %15 = load i32, i32* %count.addr, align 4, !dbg !3736
  %conv27 = zext i32 %15 to i64, !dbg !3738
  %call28 = call i32 @klee_alarm_shift_count_valid(i64 %conv27, i64 32), !dbg !3739
  %tobool29 = icmp ne i32 %call28, 0, !dbg !3739
  br i1 %tobool29, label %if.end31, label %if.then30, !dbg !3740

if.then30:                                        ; preds = %if.end25
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 5249, i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !3741
  unreachable, !dbg !3741

if.end31:                                         ; preds = %if.end25
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !3743
  %17 = load i32, i32* %count.addr, align 4, !dbg !3744
  %int_cast_to_i64 = zext i32 %17 to i64, !dbg !3745
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3745
  %shr = lshr i32 %16, %17, !dbg !3745, !klee.check.shift !267
  %conv32 = zext i32 %shr to i64, !dbg !3746
  store volatile i64 %conv32, i64* @klee_alarm_sink_s64, align 8, !dbg !3747
  store i32 0, i32* %retval, align 4, !dbg !3748
  br label %return, !dbg !3748

return:                                           ; preds = %if.end31, %if.then13
  %18 = load i32, i32* %retval, align 4, !dbg !3749
  ret i32 %18, !dbg !3749
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !3750 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !3753, metadata !DIExpression()), !dbg !3754
  %0 = load i64, i64* %value.addr, align 8, !dbg !3755
  %cmp = icmp ne i64 %0, -2147483648, !dbg !3756
  %conv = zext i1 %cmp to i32, !dbg !3756
  ret i32 %conv, !dbg !3757
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_shift_count_valid(i64 %count, i64 %width) #0 !dbg !3758 {
entry:
  %count.addr = alloca i64, align 8
  %width.addr = alloca i64, align 8
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !3761, metadata !DIExpression()), !dbg !3762
  store i64 %width, i64* %width.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %width.addr, metadata !3763, metadata !DIExpression()), !dbg !3764
  %0 = load i64, i64* %count.addr, align 8, !dbg !3765
  %cmp = icmp sge i64 %0, 0, !dbg !3766
  %1 = load i64, i64* %count.addr, align 8, !dbg !3767
  %2 = load i64, i64* %width.addr, align 8, !dbg !3767
  %cmp1 = icmp slt i64 %1, %2, !dbg !3767
  %3 = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3767
  %land.ext = zext i1 %3 to i32, !dbg !3767
  ret i32 %land.ext, !dbg !3768
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3769 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3770, metadata !DIExpression()), !dbg !3771
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3772, metadata !DIExpression()), !dbg !3773
  %0 = load i32, i32* %value.addr, align 4, !dbg !3774
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3775
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3776
  ret i32 %call, !dbg !3777
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3778 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3781, metadata !DIExpression()), !dbg !3782
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3783, metadata !DIExpression()), !dbg !3784
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3785, metadata !DIExpression()), !dbg !3786
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3787, metadata !DIExpression()), !dbg !3788
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3789, metadata !DIExpression()), !dbg !3790
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3791, metadata !DIExpression()), !dbg !3792
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3793, metadata !DIExpression()), !dbg !3794
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3795, metadata !DIExpression()), !dbg !3796
  %0 = load i32, i32* %value.addr, align 4, !dbg !3797
  %cmp = icmp slt i32 %0, 0, !dbg !3799
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3800

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3801
  %conv = zext i16 %1 to i32, !dbg !3801
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3802
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3803

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3804
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3805
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3806

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3807
  %conv6 = zext i16 %3 to i32, !dbg !3807
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3808
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3809

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3810
  br label %if.end, !dbg !3812

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3813
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3815
  %cmp9 = icmp slt i32 %4, 0, !dbg !3817
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3818

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3819
  %sub = sub nsw i32 0, %5, !dbg !3821
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3822
  br label %if.end13, !dbg !3823

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3824
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3826
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3827
  %conv14 = zext i16 %7 to i32, !dbg !3827
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3829
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3830

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3831
  %conv18 = zext i16 %8 to i32, !dbg !3831
  %sub19 = sub nsw i32 0, %conv18, !dbg !3833
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3834
  br label %if.end22, !dbg !3835

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3836
  %conv21 = zext i16 %9 to i32, !dbg !3836
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3838
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3839
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3840
  %mul = mul i32 %10, %11, !dbg !3841
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3842
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3843
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3844
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3845
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3846
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3847
  %15 = load i32, i32* %count.addr, align 4, !dbg !3848
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3849
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3849
  %shr = lshr i32 %14, %15, !dbg !3849, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3850
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3851
  %17 = load i32, i32* %count.addr, align 4, !dbg !3852
  %sub23 = sub i32 32, %17, !dbg !3853
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3854
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3854
  %shl = shl i32 %16, %sub23, !dbg !3854, !klee.check.shift !267
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3855
  %or = or i32 %18, %shl, !dbg !3855
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3855
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3856
  %20 = load i32, i32* %count.addr, align 4, !dbg !3858
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3859
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3859
  %shr24 = lshr i32 %19, %20, !dbg !3859, !klee.check.shift !267
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3860
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3861

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3862
  %conv28 = zext i8 %21 to i32, !dbg !3862
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3865
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3866

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3867
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3870
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3871

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3872
  store i32 %23, i32* %retval, align 4, !dbg !3873
  br label %return, !dbg !3873

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3874
  br label %return, !dbg !3874

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3875
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3878
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3879

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3880
  %sub40 = sub i32 0, %25, !dbg !3881
  store i32 %sub40, i32* %retval, align 4, !dbg !3882
  br label %return, !dbg !3882

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3883
  br label %return, !dbg !3883

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3884
  br label %return, !dbg !3884

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3886
  ret i32 %26, !dbg !3886
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3887 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3888, metadata !DIExpression()), !dbg !3889
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3890, metadata !DIExpression()), !dbg !3891
  %0 = load i32, i32* %value.addr, align 4, !dbg !3892
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3893
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3894
  ret i32 %call, !dbg !3895
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3896 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3899, metadata !DIExpression()), !dbg !3900
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3901, metadata !DIExpression()), !dbg !3902
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3903, metadata !DIExpression()), !dbg !3904
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3905, metadata !DIExpression()), !dbg !3906
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3907, metadata !DIExpression()), !dbg !3908
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3909, metadata !DIExpression()), !dbg !3910
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3911, metadata !DIExpression()), !dbg !3912
  %0 = load i32, i32* %value.addr, align 4, !dbg !3913
  %cmp = icmp slt i32 %0, 0, !dbg !3915
  br i1 %cmp, label %if.then, label %if.else, !dbg !3916

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3917
  %1 = load i32, i32* %value.addr, align 4, !dbg !3919
  %sub = sub nsw i32 0, %1, !dbg !3920
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3921
  br label %if.end, !dbg !3922

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3923
  %2 = load i32, i32* %value.addr, align 4, !dbg !3925
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3926
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3927
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3928
  %conv = zext i8 %4 to i32, !dbg !3928
  %mul = mul i32 %3, %conv, !dbg !3929
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3930
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3931
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3932
  %conv1 = zext i8 %6 to i32, !dbg !3932
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3933
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3934
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3935
  %8 = load i32, i32* %count.addr, align 4, !dbg !3936
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3937
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3937
  %shr = lshr i32 %7, %8, !dbg !3937, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3938
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3939
  %10 = load i32, i32* %count.addr, align 4, !dbg !3940
  %sub2 = sub i32 32, %10, !dbg !3941
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3942
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3942
  %shl = shl i32 %9, %sub2, !dbg !3942, !klee.check.shift !267
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3943
  %or = or i32 %11, %shl, !dbg !3943
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3943
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3944
  %13 = load i32, i32* %count.addr, align 4, !dbg !3946
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3947
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3947
  %shr3 = lshr i32 %12, %13, !dbg !3947, !klee.check.shift !267
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3948
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3949

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3950
  %conv7 = zext i8 %14 to i32, !dbg !3950
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3953
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3954

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3955
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3958
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3959

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3960
  store i32 %16, i32* %retval, align 4, !dbg !3961
  br label %return, !dbg !3961

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3962
  br label %return, !dbg !3962

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3963
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3966
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3967

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3968
  %sub19 = sub i32 0, %18, !dbg !3970
  store i32 %sub19, i32* %retval, align 4, !dbg !3971
  br label %return, !dbg !3971

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3972
  br label %return, !dbg !3972

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3974
  %conv22 = zext i8 %19 to i32, !dbg !3974
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3977
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3978

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3979
  br label %return, !dbg !3979

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3981
  br label %return, !dbg !3981

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3983
  ret i32 %20, !dbg !3983
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3984 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3985, metadata !DIExpression()), !dbg !3986
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3987, metadata !DIExpression()), !dbg !3988
  %0 = load i8, i8* %value.addr, align 1, !dbg !3989
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3990
  %conv = zext i8 %1 to i16, !dbg !3991
  %conv1 = zext i16 %conv to i32, !dbg !3991
  %shl = shl i32 %conv1, 5, !dbg !3992
  %conv2 = trunc i32 %shl to i16, !dbg !3993
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3994
  ret i8 %call, !dbg !3995
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !3996 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3997, metadata !DIExpression()), !dbg !3998
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3999, metadata !DIExpression()), !dbg !4000
  %0 = load i8, i8* %value.addr, align 1, !dbg !4001
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4002
  %conv = zext i8 %1 to i16, !dbg !4003
  %conv1 = zext i16 %conv to i32, !dbg !4003
  %shl = shl i32 %conv1, 6, !dbg !4004
  %conv2 = trunc i32 %shl to i16, !dbg !4005
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4006
  ret i8 %call, !dbg !4007
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4008 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4009, metadata !DIExpression()), !dbg !4010
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4011, metadata !DIExpression()), !dbg !4012
  %0 = load i8, i8* %value.addr, align 1, !dbg !4013
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4014
  %conv = zext i8 %1 to i16, !dbg !4015
  %conv1 = zext i16 %conv to i32, !dbg !4015
  %shl = shl i32 %conv1, 7, !dbg !4016
  %conv2 = trunc i32 %shl to i16, !dbg !4017
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4018
  ret i8 %call, !dbg !4019
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4020 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4021, metadata !DIExpression()), !dbg !4022
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4023, metadata !DIExpression()), !dbg !4024
  %0 = load i8, i8* %value.addr, align 1, !dbg !4025
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4026
  %conv = zext i8 %1 to i16, !dbg !4027
  %conv1 = zext i16 %conv to i32, !dbg !4027
  %shl = shl i32 %conv1, 7, !dbg !4028
  %conv2 = trunc i32 %shl to i16, !dbg !4029
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4030
  ret i8 %call, !dbg !4031
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4032 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4033, metadata !DIExpression()), !dbg !4034
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4035, metadata !DIExpression()), !dbg !4036
  %0 = load i8, i8* %value.addr, align 1, !dbg !4037
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4038
  %conv = zext i8 %1 to i16, !dbg !4039
  %conv1 = zext i16 %conv to i32, !dbg !4039
  %shl = shl i32 %conv1, 4, !dbg !4040
  %conv2 = trunc i32 %shl to i16, !dbg !4041
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4042
  ret i8 %call, !dbg !4043
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4044 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4045, metadata !DIExpression()), !dbg !4046
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4047, metadata !DIExpression()), !dbg !4048
  %0 = load i8, i8* %value.addr, align 1, !dbg !4049
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4050
  %conv = zext i8 %1 to i16, !dbg !4051
  %conv1 = zext i16 %conv to i32, !dbg !4051
  %shl = shl i32 %conv1, 5, !dbg !4052
  %conv2 = trunc i32 %shl to i16, !dbg !4053
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4054
  ret i8 %call, !dbg !4055
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4056 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4057, metadata !DIExpression()), !dbg !4058
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4059, metadata !DIExpression()), !dbg !4060
  %0 = load i8, i8* %value.addr, align 1, !dbg !4061
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4062
  %conv = zext i8 %1 to i16, !dbg !4063
  %conv1 = zext i16 %conv to i32, !dbg !4063
  %shl = shl i32 %conv1, 2, !dbg !4064
  %conv2 = trunc i32 %shl to i16, !dbg !4065
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4066
  ret i8 %call, !dbg !4067
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4068 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4069, metadata !DIExpression()), !dbg !4070
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4071, metadata !DIExpression()), !dbg !4072
  %0 = load i8, i8* %value.addr, align 1, !dbg !4073
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4074
  %conv = zext i8 %1 to i16, !dbg !4075
  %conv1 = zext i16 %conv to i32, !dbg !4075
  %shl = shl i32 %conv1, 6, !dbg !4076
  %conv2 = trunc i32 %shl to i16, !dbg !4077
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4078
  ret i8 %call, !dbg !4079
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4080 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4081, metadata !DIExpression()), !dbg !4082
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4083, metadata !DIExpression()), !dbg !4084
  %0 = load i8, i8* %value.addr, align 1, !dbg !4085
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4086
  %conv = zext i8 %1 to i16, !dbg !4087
  %conv1 = zext i16 %conv to i32, !dbg !4087
  %shl = shl i32 %conv1, 3, !dbg !4088
  %conv2 = trunc i32 %shl to i16, !dbg !4089
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4090
  ret i8 %call, !dbg !4091
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4092 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4093, metadata !DIExpression()), !dbg !4094
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4095, metadata !DIExpression()), !dbg !4096
  %0 = load i16, i16* %value.addr, align 2, !dbg !4097
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4098
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4099
  ret i16 %call, !dbg !4100
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4101 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4102, metadata !DIExpression()), !dbg !4103
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4104, metadata !DIExpression()), !dbg !4105
  %0 = load i16, i16* %value.addr, align 2, !dbg !4106
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4107
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4108
  ret i16 %call, !dbg !4109
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4110 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4111, metadata !DIExpression()), !dbg !4112
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4113, metadata !DIExpression()), !dbg !4114
  %0 = load i16, i16* %value.addr, align 2, !dbg !4115
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4116
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4117
  ret i16 %call, !dbg !4118
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4119 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4120, metadata !DIExpression()), !dbg !4121
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  %0 = load i16, i16* %value.addr, align 2, !dbg !4124
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4125
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4126
  ret i16 %call, !dbg !4127
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4128 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4129, metadata !DIExpression()), !dbg !4130
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4131, metadata !DIExpression()), !dbg !4132
  %0 = load i16, i16* %value.addr, align 2, !dbg !4133
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4134
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4135
  ret i16 %call, !dbg !4136
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4137 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4138, metadata !DIExpression()), !dbg !4139
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4140, metadata !DIExpression()), !dbg !4141
  %0 = load i16, i16* %value.addr, align 2, !dbg !4142
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4143
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4144
  ret i16 %call, !dbg !4145
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4146 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4147, metadata !DIExpression()), !dbg !4148
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4149, metadata !DIExpression()), !dbg !4150
  %0 = load i16, i16* %value.addr, align 2, !dbg !4151
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4152
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4153
  ret i16 %call, !dbg !4154
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4155 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4156, metadata !DIExpression()), !dbg !4157
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4158, metadata !DIExpression()), !dbg !4159
  %0 = load i16, i16* %value.addr, align 2, !dbg !4160
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4161
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4162
  ret i16 %call, !dbg !4163
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4164 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4165, metadata !DIExpression()), !dbg !4166
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4167, metadata !DIExpression()), !dbg !4168
  %0 = load i16, i16* %value.addr, align 2, !dbg !4169
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4170
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4171
  ret i16 %call, !dbg !4172
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4173 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4174, metadata !DIExpression()), !dbg !4175
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4176, metadata !DIExpression()), !dbg !4177
  %0 = load i16, i16* %value.addr, align 2, !dbg !4178
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4179
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4180
  ret i16 %call, !dbg !4181
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4182 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4183, metadata !DIExpression()), !dbg !4184
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4185, metadata !DIExpression()), !dbg !4186
  %0 = load i16, i16* %value.addr, align 2, !dbg !4187
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4188
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4189
  ret i16 %call, !dbg !4190
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4191 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4192, metadata !DIExpression()), !dbg !4193
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4194, metadata !DIExpression()), !dbg !4195
  %0 = load i16, i16* %value.addr, align 2, !dbg !4196
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4197
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4198
  ret i16 %call, !dbg !4199
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4200 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4201, metadata !DIExpression()), !dbg !4202
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4203, metadata !DIExpression()), !dbg !4204
  %0 = load i16, i16* %value.addr, align 2, !dbg !4205
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4206
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4207
  ret i16 %call, !dbg !4208
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4209 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4210, metadata !DIExpression()), !dbg !4211
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4212, metadata !DIExpression()), !dbg !4213
  %0 = load i16, i16* %value.addr, align 2, !dbg !4214
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4215
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4216
  ret i16 %call, !dbg !4217
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4218 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4219, metadata !DIExpression()), !dbg !4220
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4221, metadata !DIExpression()), !dbg !4222
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4223
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4224
  %conv = zext i8 %1 to i16, !dbg !4225
  %conv1 = zext i16 %conv to i32, !dbg !4225
  %shl = shl i32 %conv1, 5, !dbg !4226
  %conv2 = trunc i32 %shl to i16, !dbg !4227
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4228
  ret i16 %call, !dbg !4229
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4230 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4231, metadata !DIExpression()), !dbg !4232
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4233, metadata !DIExpression()), !dbg !4234
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4235
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4236
  %conv = zext i8 %1 to i16, !dbg !4237
  %conv1 = zext i16 %conv to i32, !dbg !4237
  %shl = shl i32 %conv1, 6, !dbg !4238
  %conv2 = trunc i32 %shl to i16, !dbg !4239
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4240
  ret i16 %call, !dbg !4241
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4242 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4243, metadata !DIExpression()), !dbg !4244
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4245, metadata !DIExpression()), !dbg !4246
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4247
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4248
  %conv = zext i8 %1 to i16, !dbg !4249
  %conv1 = zext i16 %conv to i32, !dbg !4249
  %shl = shl i32 %conv1, 7, !dbg !4250
  %conv2 = trunc i32 %shl to i16, !dbg !4251
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4252
  ret i16 %call, !dbg !4253
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4254 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4255, metadata !DIExpression()), !dbg !4256
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4257, metadata !DIExpression()), !dbg !4258
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4259
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4260
  %conv = zext i8 %1 to i16, !dbg !4261
  %conv1 = zext i16 %conv to i32, !dbg !4261
  %shl = shl i32 %conv1, 7, !dbg !4262
  %conv2 = trunc i32 %shl to i16, !dbg !4263
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4264
  ret i16 %call, !dbg !4265
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4266 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4267, metadata !DIExpression()), !dbg !4268
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4269, metadata !DIExpression()), !dbg !4270
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4271
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4272
  %conv = zext i8 %1 to i16, !dbg !4273
  %conv1 = zext i16 %conv to i32, !dbg !4273
  %shl = shl i32 %conv1, 4, !dbg !4274
  %conv2 = trunc i32 %shl to i16, !dbg !4275
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4276
  ret i16 %call, !dbg !4277
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4278 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4279, metadata !DIExpression()), !dbg !4280
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4281, metadata !DIExpression()), !dbg !4282
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4283
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4284
  %conv = zext i8 %1 to i16, !dbg !4285
  %conv1 = zext i16 %conv to i32, !dbg !4285
  %shl = shl i32 %conv1, 5, !dbg !4286
  %conv2 = trunc i32 %shl to i16, !dbg !4287
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4288
  ret i16 %call, !dbg !4289
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4290 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4291, metadata !DIExpression()), !dbg !4292
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4293, metadata !DIExpression()), !dbg !4294
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4295
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4296
  %conv = zext i8 %1 to i16, !dbg !4297
  %conv1 = zext i16 %conv to i32, !dbg !4297
  %shl = shl i32 %conv1, 2, !dbg !4298
  %conv2 = trunc i32 %shl to i16, !dbg !4299
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4300
  ret i16 %call, !dbg !4301
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4302 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4303, metadata !DIExpression()), !dbg !4304
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4305, metadata !DIExpression()), !dbg !4306
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4307
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4308
  %conv = zext i8 %1 to i16, !dbg !4309
  %conv1 = zext i16 %conv to i32, !dbg !4309
  %shl = shl i32 %conv1, 6, !dbg !4310
  %conv2 = trunc i32 %shl to i16, !dbg !4311
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4312
  ret i16 %call, !dbg !4313
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4314 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4315, metadata !DIExpression()), !dbg !4316
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4317, metadata !DIExpression()), !dbg !4318
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4319
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4320
  %conv = zext i8 %1 to i16, !dbg !4321
  %conv1 = zext i16 %conv to i32, !dbg !4321
  %shl = shl i32 %conv1, 3, !dbg !4322
  %conv2 = trunc i32 %shl to i16, !dbg !4323
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4324
  ret i16 %call, !dbg !4325
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4326 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4327, metadata !DIExpression()), !dbg !4328
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4329, metadata !DIExpression()), !dbg !4330
  %0 = load i32, i32* %value.addr, align 4, !dbg !4331
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4332
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4333
  ret i32 %call, !dbg !4334
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4335 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4338, metadata !DIExpression()), !dbg !4339
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4340, metadata !DIExpression()), !dbg !4341
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4342, metadata !DIExpression()), !dbg !4343
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4344, metadata !DIExpression()), !dbg !4345
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4346, metadata !DIExpression()), !dbg !4347
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4348, metadata !DIExpression()), !dbg !4349
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4350, metadata !DIExpression()), !dbg !4351
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4352
  %conv = sext i16 %0 to i32, !dbg !4352
  %cmp = icmp slt i32 %conv, 0, !dbg !4354
  br i1 %cmp, label %if.then, label %if.else, !dbg !4355

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4356
  br label %if.end, !dbg !4358

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4359
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4361
  %conv2 = sext i16 %1 to i32, !dbg !4361
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4363
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4364

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4365
  %conv6 = sext i16 %2 to i32, !dbg !4365
  %sub = sub nsw i32 0, %conv6, !dbg !4367
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4368
  br label %if.end9, !dbg !4369

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4370
  %conv8 = sext i16 %3 to i32, !dbg !4370
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4372
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4373
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4374
  %mul = mul i32 %4, %5, !dbg !4375
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4376
  %6 = load i32, i32* %value.addr, align 4, !dbg !4377
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4378
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4379
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4380
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4381
  %9 = load i32, i32* %count.addr, align 4, !dbg !4382
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4383
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4383
  %shr = lshr i32 %8, %9, !dbg !4383, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4384
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4385
  %11 = load i32, i32* %count.addr, align 4, !dbg !4386
  %sub10 = sub i32 32, %11, !dbg !4387
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4388
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4388
  %shl = shl i32 %10, %sub10, !dbg !4388, !klee.check.shift !267
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4389
  %or = or i32 %12, %shl, !dbg !4389
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4389
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4390
  %14 = load i32, i32* %count.addr, align 4, !dbg !4392
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4393
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4393
  %shr11 = lshr i32 %13, %14, !dbg !4393, !klee.check.shift !267
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4394
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4395

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4396
  %conv15 = zext i8 %15 to i32, !dbg !4396
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4399
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4400

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4401
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4404
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4405

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4406
  store i32 %17, i32* %retval, align 4, !dbg !4407
  br label %return, !dbg !4407

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4408
  br label %return, !dbg !4408

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4409
  br label %return, !dbg !4409

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4411
  br label %return, !dbg !4411

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4413
  ret i32 %18, !dbg !4413
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4414 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4415, metadata !DIExpression()), !dbg !4416
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4417, metadata !DIExpression()), !dbg !4418
  %0 = load i32, i32* %value.addr, align 4, !dbg !4419
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4420
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4421
  ret i32 %call, !dbg !4422
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4423 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4426, metadata !DIExpression()), !dbg !4427
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4428, metadata !DIExpression()), !dbg !4429
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4430, metadata !DIExpression()), !dbg !4431
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4432, metadata !DIExpression()), !dbg !4433
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4434, metadata !DIExpression()), !dbg !4435
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4436, metadata !DIExpression()), !dbg !4437
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4438
  %cmp = icmp slt i32 %0, 0, !dbg !4440
  br i1 %cmp, label %if.then, label %if.else, !dbg !4441

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4442
  br label %if.end, !dbg !4444

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4445
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4447
  %cmp1 = icmp slt i32 %1, 0, !dbg !4449
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4450

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4451
  %sub = sub nsw i32 0, %2, !dbg !4453
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4454
  br label %if.end4, !dbg !4455

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4456
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4458
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4459
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4460
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4461
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4462
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4463
  %7 = load i32, i32* %count.addr, align 4, !dbg !4464
  %sub5 = sub i32 %7, 32, !dbg !4465
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4466
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4466
  %shr = lshr i32 %6, %sub5, !dbg !4466, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4467
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4468
  %conv = zext i8 %8 to i32, !dbg !4468
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4470
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4471

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4472
  store i32 %9, i32* %retval, align 4, !dbg !4474
  br label %return, !dbg !4474

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4475
  br label %return, !dbg !4475

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4477
  ret i32 %10, !dbg !4477
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4478 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4479, metadata !DIExpression()), !dbg !4480
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4481, metadata !DIExpression()), !dbg !4482
  %0 = load i32, i32* %value.addr, align 4, !dbg !4483
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4484
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4485
  ret i32 %call, !dbg !4486
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4487 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4490, metadata !DIExpression()), !dbg !4491
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4492, metadata !DIExpression()), !dbg !4493
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4494, metadata !DIExpression()), !dbg !4495
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4496, metadata !DIExpression()), !dbg !4497
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4498, metadata !DIExpression()), !dbg !4499
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4500, metadata !DIExpression()), !dbg !4501
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4502, metadata !DIExpression()), !dbg !4503
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4504
  %conv = sext i8 %0 to i32, !dbg !4504
  %cmp = icmp slt i32 %conv, 0, !dbg !4506
  br i1 %cmp, label %if.then, label %if.else, !dbg !4507

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4508
  br label %if.end, !dbg !4510

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4511
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4513
  %conv2 = sext i8 %1 to i32, !dbg !4513
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4515
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4516

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4517
  %conv6 = sext i8 %2 to i32, !dbg !4517
  %sub = sub nsw i32 0, %conv6, !dbg !4519
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4520
  br label %if.end9, !dbg !4521

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4522
  %conv8 = sext i8 %3 to i32, !dbg !4522
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4524
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4525
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4526
  %mul = mul i32 %4, %5, !dbg !4527
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4528
  %6 = load i32, i32* %value.addr, align 4, !dbg !4529
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4530
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4531
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4532
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4533
  %9 = load i32, i32* %count.addr, align 4, !dbg !4534
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4535
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4535
  %shr = lshr i32 %8, %9, !dbg !4535, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4536
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4537
  %11 = load i32, i32* %count.addr, align 4, !dbg !4538
  %sub10 = sub i32 32, %11, !dbg !4539
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4540
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4540
  %shl = shl i32 %10, %sub10, !dbg !4540, !klee.check.shift !267
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4541
  %or = or i32 %12, %shl, !dbg !4541
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4541
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4542
  %14 = load i32, i32* %count.addr, align 4, !dbg !4544
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4545
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4545
  %shr11 = lshr i32 %13, %14, !dbg !4545, !klee.check.shift !267
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4546
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4547

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4548
  %conv15 = zext i8 %15 to i32, !dbg !4548
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4551
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4552

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4553
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4556
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4557

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4558
  store i32 %17, i32* %retval, align 4, !dbg !4559
  br label %return, !dbg !4559

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4560
  br label %return, !dbg !4560

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4561
  br label %return, !dbg !4561

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4563
  br label %return, !dbg !4563

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4565
  ret i32 %18, !dbg !4565
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4566 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4567, metadata !DIExpression()), !dbg !4568
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4569, metadata !DIExpression()), !dbg !4570
  %0 = load i32, i32* %value.addr, align 4, !dbg !4571
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4572
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4573
  ret i32 %call, !dbg !4574
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4575 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4576, metadata !DIExpression()), !dbg !4577
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4578, metadata !DIExpression()), !dbg !4579
  %0 = load i32, i32* %value.addr, align 4, !dbg !4580
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4581
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4582
  ret i32 %call, !dbg !4583
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4584 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4587, metadata !DIExpression()), !dbg !4588
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4589, metadata !DIExpression()), !dbg !4590
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4591, metadata !DIExpression()), !dbg !4592
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4593, metadata !DIExpression()), !dbg !4594
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4595, metadata !DIExpression()), !dbg !4596
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4597, metadata !DIExpression()), !dbg !4598
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4599, metadata !DIExpression()), !dbg !4600
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4601, metadata !DIExpression()), !dbg !4602
  %0 = load i32, i32* %value.addr, align 4, !dbg !4603
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4604
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4605
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4606
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4607
  %3 = load i32, i32* %count.addr, align 4, !dbg !4608
  %sub = sub i32 %3, 32, !dbg !4609
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4610
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4610
  %shr = lshr i32 %2, %sub, !dbg !4610, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4611
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4612
  ret i32 %4, !dbg !4613
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4614 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4615, metadata !DIExpression()), !dbg !4616
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4617, metadata !DIExpression()), !dbg !4618
  %0 = load i32, i32* %value.addr, align 4, !dbg !4619
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4620
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4621
  ret i32 %call, !dbg !4622
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4623 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4626, metadata !DIExpression()), !dbg !4627
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4628, metadata !DIExpression()), !dbg !4629
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4630, metadata !DIExpression()), !dbg !4631
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4632, metadata !DIExpression()), !dbg !4633
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4634, metadata !DIExpression()), !dbg !4635
  %0 = load i32, i32* %value.addr, align 4, !dbg !4636
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4637
  %conv = zext i8 %1 to i32, !dbg !4637
  %mul = mul i32 %0, %conv, !dbg !4638
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4639
  %2 = load i32, i32* %value.addr, align 4, !dbg !4640
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4641
  %conv1 = zext i8 %3 to i32, !dbg !4641
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4642
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4643
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4644
  %5 = load i32, i32* %count.addr, align 4, !dbg !4645
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4646
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4646
  %shr = lshr i32 %4, %5, !dbg !4646, !klee.check.shift !267
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4647
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4648
  %7 = load i32, i32* %count.addr, align 4, !dbg !4649
  %sub = sub i32 32, %7, !dbg !4650
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4651
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4651
  %shl = shl i32 %6, %sub, !dbg !4651, !klee.check.shift !267
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4652
  %or = or i32 %8, %shl, !dbg !4652
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4652
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4653
  %10 = load i32, i32* %count.addr, align 4, !dbg !4655
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4656
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4656
  %shr2 = lshr i32 %9, %10, !dbg !4656, !klee.check.shift !267
  %cmp = icmp eq i32 %shr2, 0, !dbg !4657
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4658

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4659
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4662
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4663

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4664
  store i32 %12, i32* %retval, align 4, !dbg !4665
  br label %return, !dbg !4665

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4666
  br label %return, !dbg !4666

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4667
  br label %return, !dbg !4667

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4669
  ret i32 %13, !dbg !4669
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4670 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4671, metadata !DIExpression()), !dbg !4672
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4673, metadata !DIExpression()), !dbg !4674
  %0 = load i8, i8* %value.addr, align 1, !dbg !4675
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4676
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4677
  ret i8 %call, !dbg !4678
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4679 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4680, metadata !DIExpression()), !dbg !4681
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4682, metadata !DIExpression()), !dbg !4683
  %0 = load i8, i8* %value.addr, align 1, !dbg !4684
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4685
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4686
  ret i8 %call, !dbg !4687
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4688 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4689, metadata !DIExpression()), !dbg !4690
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4691, metadata !DIExpression()), !dbg !4692
  %0 = load i8, i8* %value.addr, align 1, !dbg !4693
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4694
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4695
  ret i8 %call, !dbg !4696
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4697 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4698, metadata !DIExpression()), !dbg !4699
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  %0 = load i8, i8* %value.addr, align 1, !dbg !4702
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4703
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4704
  ret i8 %call, !dbg !4705
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4706 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4707, metadata !DIExpression()), !dbg !4708
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  %0 = load i8, i8* %value.addr, align 1, !dbg !4711
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4712
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4713
  ret i8 %call, !dbg !4714
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4715 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4716, metadata !DIExpression()), !dbg !4717
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4718, metadata !DIExpression()), !dbg !4719
  %0 = load i8, i8* %value.addr, align 1, !dbg !4720
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4721
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4722
  ret i8 %call, !dbg !4723
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4724 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4725, metadata !DIExpression()), !dbg !4726
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4727, metadata !DIExpression()), !dbg !4728
  %0 = load i8, i8* %value.addr, align 1, !dbg !4729
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4730
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4731
  ret i8 %call, !dbg !4732
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4733 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4734, metadata !DIExpression()), !dbg !4735
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4736, metadata !DIExpression()), !dbg !4737
  %0 = load i8, i8* %value.addr, align 1, !dbg !4738
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4739
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4740
  ret i8 %call, !dbg !4741
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4742 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4743, metadata !DIExpression()), !dbg !4744
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4745, metadata !DIExpression()), !dbg !4746
  %0 = load i8, i8* %value.addr, align 1, !dbg !4747
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4748
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4749
  ret i8 %call, !dbg !4750
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4751 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4753, metadata !DIExpression()), !dbg !4754
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4755, metadata !DIExpression()), !dbg !4756
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4757, metadata !DIExpression()), !dbg !4758
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4759, metadata !DIExpression()), !dbg !4760
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4761, metadata !DIExpression()), !dbg !4762
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4763, metadata !DIExpression()), !dbg !4764
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4765, metadata !DIExpression()), !dbg !4766
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4767, metadata !DIExpression()), !dbg !4768
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4769, metadata !DIExpression()), !dbg !4770
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4771, metadata !DIExpression()), !dbg !4772
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4773, metadata !DIExpression()), !dbg !4774
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4775, metadata !DIExpression()), !dbg !4776
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4777
  %and = and i32 %0, 65535, !dbg !4778
  %conv = trunc i32 %and to i16, !dbg !4777
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4779
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4780
  %and1 = and i32 %1, -65536, !dbg !4781
  %shr = lshr i32 %and1, 16, !dbg !4782
  %conv2 = trunc i32 %shr to i16, !dbg !4783
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4784
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4785
  %and3 = and i32 %2, 65535, !dbg !4786
  %conv4 = trunc i32 %and3 to i16, !dbg !4785
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4787
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4788
  %and5 = and i32 %3, -65536, !dbg !4789
  %shr6 = lshr i32 %and5, 16, !dbg !4790
  %conv7 = trunc i32 %shr6 to i16, !dbg !4791
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4792
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4793
  %conv8 = zext i16 %4 to i32, !dbg !4793
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4794
  %conv9 = zext i16 %5 to i32, !dbg !4794
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4795
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4796
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4797
  %conv10 = zext i16 %6 to i32, !dbg !4797
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4798
  %conv11 = zext i16 %7 to i32, !dbg !4798
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4799
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4800
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4801
  %conv13 = zext i16 %8 to i32, !dbg !4801
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4802
  %conv14 = zext i16 %9 to i32, !dbg !4802
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4803
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4804
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4805
  %conv16 = zext i16 %10 to i32, !dbg !4805
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4806
  %conv17 = zext i16 %11 to i32, !dbg !4806
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4807
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4808
  %12 = load i32, i32* %MulTemp2, align 4, !dbg !4809
  %shr19 = lshr i32 %12, 16, !dbg !4810
  %13 = load i32, i32* %MulTemp3, align 4, !dbg !4811
  %shr20 = lshr i32 %13, 16, !dbg !4812
  %add = add i32 %shr19, %shr20, !dbg !4813
  %14 = load i32, i32* %MulTemp4, align 4, !dbg !4814
  %add21 = add i32 %add, %14, !dbg !4815
  store i32 %add21, i32* %HIGHWORD, align 4, !dbg !4816
  %15 = load i32, i32* %MulTemp1, align 4, !dbg !4817
  %shr22 = lshr i32 %15, 16, !dbg !4818
  %16 = load i32, i32* %MulTemp2, align 4, !dbg !4819
  %and23 = and i32 %16, 65535, !dbg !4820
  %add24 = add i32 %shr22, %and23, !dbg !4821
  %17 = load i32, i32* %MulTemp3, align 4, !dbg !4822
  %and25 = and i32 %17, 65535, !dbg !4823
  %add26 = add i32 %add24, %and25, !dbg !4824
  store i32 %add26, i32* %OverFlow, align 4, !dbg !4825
  %18 = load i32, i32* %OverFlow, align 4, !dbg !4826
  %cmp = icmp ugt i32 %18, 65535, !dbg !4828
  br i1 %cmp, label %if.then, label %if.else, !dbg !4829

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %HIGHWORD, align 4, !dbg !4830
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4832
  %shr28 = lshr i32 %20, 16, !dbg !4833
  %add29 = add i32 %19, %shr28, !dbg !4834
  store i32 %add29, i32* %retval, align 4, !dbg !4835
  br label %return, !dbg !4835

if.else:                                          ; preds = %entry
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4836
  store i32 %21, i32* %retval, align 4, !dbg !4838
  br label %return, !dbg !4838

return:                                           ; preds = %if.else, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !4839
  ret i32 %22, !dbg !4839
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4840 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4841, metadata !DIExpression()), !dbg !4842
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4843, metadata !DIExpression()), !dbg !4844
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4845, metadata !DIExpression()), !dbg !4846
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4847, metadata !DIExpression()), !dbg !4848
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4849, metadata !DIExpression()), !dbg !4850
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4851, metadata !DIExpression()), !dbg !4852
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4853, metadata !DIExpression()), !dbg !4854
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4855, metadata !DIExpression()), !dbg !4856
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4857, metadata !DIExpression()), !dbg !4858
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4859, metadata !DIExpression()), !dbg !4860
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4861, metadata !DIExpression()), !dbg !4862
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4863, metadata !DIExpression()), !dbg !4864
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4865
  %and = and i32 %0, 65535, !dbg !4866
  %conv = trunc i32 %and to i16, !dbg !4865
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4867
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4868
  %and1 = and i32 %1, -65536, !dbg !4869
  %shr = lshr i32 %and1, 16, !dbg !4870
  %conv2 = trunc i32 %shr to i16, !dbg !4871
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4872
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4873
  %and3 = and i32 %2, 65535, !dbg !4874
  %conv4 = trunc i32 %and3 to i16, !dbg !4873
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4875
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4876
  %and5 = and i32 %3, -65536, !dbg !4877
  %shr6 = lshr i32 %and5, 16, !dbg !4878
  %conv7 = trunc i32 %shr6 to i16, !dbg !4879
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4880
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4881
  %conv8 = zext i16 %4 to i32, !dbg !4881
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4882
  %conv9 = zext i16 %5 to i32, !dbg !4882
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4883
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4884
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4885
  %conv10 = zext i16 %6 to i32, !dbg !4885
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4886
  %conv11 = zext i16 %7 to i32, !dbg !4886
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4887
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4888
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4889
  %conv13 = zext i16 %8 to i32, !dbg !4889
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4890
  %conv14 = zext i16 %9 to i32, !dbg !4890
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4891
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4892
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4893
  %conv16 = zext i16 %10 to i32, !dbg !4893
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4894
  %conv17 = zext i16 %11 to i32, !dbg !4894
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4895
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4896
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4897
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4898
  %and19 = and i32 %13, 65535, !dbg !4899
  %shl = shl i32 %and19, 16, !dbg !4900
  %add = add i32 %12, %shl, !dbg !4901
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4902
  %and20 = and i32 %14, 65535, !dbg !4903
  %shl21 = shl i32 %and20, 16, !dbg !4904
  %add22 = add i32 %add, %shl21, !dbg !4905
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4906
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4907
  ret i32 %15, !dbg !4908
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4909 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4915, metadata !DIExpression()), !dbg !4916
  %2 = icmp eq i64 %0, 0, !dbg !4917
  br i1 %2, label %3, label %4, !dbg !4919

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4920
  unreachable, !dbg !4920

4:                                                ; preds = %1
  ret void, !dbg !4921
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4922 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4928, metadata !DIExpression()), !dbg !4930
  call void @llvm.dbg.value(metadata i64 %1, metadata !4929, metadata !DIExpression()), !dbg !4930
  %3 = icmp ult i64 %1, %0, !dbg !4931
  br i1 %3, label %5, label %4, !dbg !4933

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4934
  unreachable, !dbg !4934

5:                                                ; preds = %2
  ret void, !dbg !4936
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/mul_Ccode_alarm_0005.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005/MulHword_alarm_0005.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
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
!48 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!49 = !DISubroutineType(types: !50)
!50 = !{!51}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DILocalVariable(name: "value", scope: !47, file: !48, line: 9, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !51)
!55 = !DILocation(line: 9, column: 13, scope: !47)
!56 = !DILocalVariable(name: "factor", scope: !47, file: !48, line: 10, type: !8)
!57 = !DILocation(line: 10, column: 12, scope: !47)
!58 = !DILocalVariable(name: "count", scope: !47, file: !48, line: 11, type: !59)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !61)
!61 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 11, column: 14, scope: !47)
!63 = !DILocalVariable(name: "result", scope: !47, file: !48, line: 12, type: !53)
!64 = !DILocation(line: 12, column: 13, scope: !47)
!65 = !DILocation(line: 14, column: 24, scope: !47)
!66 = !DILocation(line: 14, column: 5, scope: !47)
!67 = !DILocation(line: 15, column: 5, scope: !47)
!68 = !DILocation(line: 16, column: 24, scope: !47)
!69 = !DILocation(line: 16, column: 5, scope: !47)
!70 = !DILocation(line: 18, column: 44, scope: !47)
!71 = !DILocation(line: 18, column: 51, scope: !47)
!72 = !DILocation(line: 18, column: 59, scope: !47)
!73 = !DILocation(line: 18, column: 14, scope: !47)
!74 = !DILocation(line: 18, column: 12, scope: !47)
!75 = !DILocation(line: 20, column: 11, scope: !47)
!76 = !DILocation(line: 21, column: 5, scope: !47)
!77 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !78, file: !78, line: 43, type: !79, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !6, !22}
!81 = !DILocalVariable(name: "value", arg: 1, scope: !77, file: !78, line: 43, type: !6)
!82 = !DILocation(line: 43, column: 35, scope: !77)
!83 = !DILocalVariable(name: "factor", arg: 2, scope: !77, file: !78, line: 43, type: !22)
!84 = !DILocation(line: 43, column: 46, scope: !77)
!85 = !DILocalVariable(name: "s32MulTemp1", scope: !77, file: !78, line: 45, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !53)
!87 = !DILocation(line: 45, column: 6, scope: !77)
!88 = !DILocalVariable(name: "s32MulTemp2", scope: !77, file: !78, line: 45, type: !86)
!89 = !DILocation(line: 45, column: 24, scope: !77)
!90 = !DILocation(line: 46, column: 16, scope: !77)
!91 = !DILocation(line: 46, column: 24, scope: !77)
!92 = !DILocation(line: 46, column: 22, scope: !77)
!93 = !DILocation(line: 46, column: 14, scope: !77)
!94 = !DILocation(line: 48, column: 16, scope: !77)
!95 = !DILocation(line: 48, column: 28, scope: !77)
!96 = !DILocation(line: 48, column: 14, scope: !77)
!97 = !DILocation(line: 50, column: 6, scope: !98)
!98 = distinct !DILexicalBlock(scope: !77, file: !78, line: 50, column: 5)
!99 = !DILocation(line: 50, column: 17, scope: !98)
!100 = !DILocation(line: 50, column: 21, scope: !98)
!101 = !DILocation(line: 50, column: 25, scope: !98)
!102 = !DILocation(line: 50, column: 37, scope: !98)
!103 = !DILocation(line: 50, column: 46, scope: !98)
!104 = !DILocation(line: 50, column: 5, scope: !77)
!105 = !DILocation(line: 52, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !78, line: 51, column: 2)
!107 = !DILocation(line: 52, column: 29, scope: !106)
!108 = !DILocation(line: 52, column: 15, scope: !106)
!109 = !DILocation(line: 53, column: 14, scope: !106)
!110 = !DILocation(line: 53, column: 10, scope: !106)
!111 = !DILocation(line: 53, column: 3, scope: !106)
!112 = !DILocation(line: 57, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !98, file: !78, line: 56, column: 2)
!114 = !DILocation(line: 57, column: 10, scope: !113)
!115 = !DILocation(line: 57, column: 3, scope: !113)
!116 = !DILocation(line: 59, column: 1, scope: !77)
!117 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !78, file: !78, line: 77, type: !79, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!118 = !DILocalVariable(name: "value", arg: 1, scope: !117, file: !78, line: 77, type: !6)
!119 = !DILocation(line: 77, column: 38, scope: !117)
!120 = !DILocalVariable(name: "factor", arg: 2, scope: !117, file: !78, line: 77, type: !22)
!121 = !DILocation(line: 77, column: 49, scope: !117)
!122 = !DILocalVariable(name: "s32MulTemp1", scope: !117, file: !78, line: 79, type: !86)
!123 = !DILocation(line: 79, column: 6, scope: !117)
!124 = !DILocalVariable(name: "s32MulTemp2", scope: !117, file: !78, line: 79, type: !86)
!125 = !DILocation(line: 79, column: 24, scope: !117)
!126 = !DILocation(line: 80, column: 16, scope: !117)
!127 = !DILocation(line: 80, column: 24, scope: !117)
!128 = !DILocation(line: 80, column: 22, scope: !117)
!129 = !DILocation(line: 80, column: 14, scope: !117)
!130 = !DILocation(line: 81, column: 16, scope: !117)
!131 = !DILocation(line: 81, column: 28, scope: !117)
!132 = !DILocation(line: 81, column: 14, scope: !117)
!133 = !DILocation(line: 82, column: 6, scope: !134)
!134 = distinct !DILexicalBlock(scope: !117, file: !78, line: 82, column: 5)
!135 = !DILocation(line: 82, column: 17, scope: !134)
!136 = !DILocation(line: 82, column: 21, scope: !134)
!137 = !DILocation(line: 82, column: 25, scope: !134)
!138 = !DILocation(line: 82, column: 37, scope: !134)
!139 = !DILocation(line: 82, column: 44, scope: !134)
!140 = !DILocation(line: 82, column: 5, scope: !117)
!141 = !DILocation(line: 84, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !134, file: !78, line: 83, column: 2)
!143 = !DILocation(line: 84, column: 29, scope: !142)
!144 = !DILocation(line: 84, column: 15, scope: !142)
!145 = !DILocation(line: 85, column: 2, scope: !142)
!146 = !DILocation(line: 91, column: 5, scope: !147)
!147 = distinct !DILexicalBlock(scope: !117, file: !78, line: 91, column: 5)
!148 = !DILocation(line: 91, column: 17, scope: !147)
!149 = !DILocation(line: 91, column: 5, scope: !117)
!150 = !DILocation(line: 93, column: 6, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !78, line: 93, column: 6)
!152 = distinct !DILexicalBlock(scope: !147, file: !78, line: 92, column: 2)
!153 = !DILocation(line: 93, column: 18, scope: !151)
!154 = !DILocation(line: 93, column: 6, scope: !152)
!155 = !DILocation(line: 95, column: 15, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !78, line: 94, column: 3)
!157 = !DILocation(line: 95, column: 11, scope: !156)
!158 = !DILocation(line: 95, column: 4, scope: !156)
!159 = !DILocation(line: 99, column: 4, scope: !160)
!160 = distinct !DILexicalBlock(scope: !151, file: !78, line: 98, column: 3)
!161 = !DILocation(line: 104, column: 3, scope: !162)
!162 = distinct !DILexicalBlock(scope: !147, file: !78, line: 103, column: 2)
!163 = !DILocation(line: 106, column: 1, scope: !117)
!164 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !78, file: !78, line: 123, type: !165, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!165 = !DISubroutineType(types: !166)
!166 = !{!6, !6, !17}
!167 = !DILocalVariable(name: "value", arg: 1, scope: !164, file: !78, line: 123, type: !6)
!168 = !DILocation(line: 123, column: 25, scope: !164)
!169 = !DILocalVariable(name: "factor", arg: 2, scope: !164, file: !78, line: 123, type: !17)
!170 = !DILocation(line: 123, column: 35, scope: !164)
!171 = !DILocalVariable(name: "s32MulTemp1", scope: !164, file: !78, line: 125, type: !86)
!172 = !DILocation(line: 125, column: 6, scope: !164)
!173 = !DILocalVariable(name: "s32MulTemp2", scope: !164, file: !78, line: 125, type: !86)
!174 = !DILocation(line: 125, column: 24, scope: !164)
!175 = !DILocation(line: 126, column: 16, scope: !164)
!176 = !DILocation(line: 126, column: 24, scope: !164)
!177 = !DILocation(line: 126, column: 22, scope: !164)
!178 = !DILocation(line: 126, column: 14, scope: !164)
!179 = !DILocation(line: 127, column: 16, scope: !164)
!180 = !DILocation(line: 127, column: 28, scope: !164)
!181 = !DILocation(line: 127, column: 14, scope: !164)
!182 = !DILocation(line: 128, column: 6, scope: !183)
!183 = distinct !DILexicalBlock(scope: !164, file: !78, line: 128, column: 5)
!184 = !DILocation(line: 128, column: 17, scope: !183)
!185 = !DILocation(line: 128, column: 21, scope: !183)
!186 = !DILocation(line: 128, column: 25, scope: !183)
!187 = !DILocation(line: 128, column: 37, scope: !183)
!188 = !DILocation(line: 128, column: 44, scope: !183)
!189 = !DILocation(line: 128, column: 5, scope: !164)
!190 = !DILocation(line: 130, column: 17, scope: !191)
!191 = distinct !DILexicalBlock(scope: !183, file: !78, line: 129, column: 2)
!192 = !DILocation(line: 130, column: 29, scope: !191)
!193 = !DILocation(line: 130, column: 15, scope: !191)
!194 = !DILocation(line: 131, column: 14, scope: !191)
!195 = !DILocation(line: 131, column: 10, scope: !191)
!196 = !DILocation(line: 131, column: 3, scope: !191)
!197 = !DILocation(line: 135, column: 14, scope: !198)
!198 = distinct !DILexicalBlock(scope: !183, file: !78, line: 134, column: 2)
!199 = !DILocation(line: 135, column: 10, scope: !198)
!200 = !DILocation(line: 135, column: 3, scope: !198)
!201 = !DILocation(line: 137, column: 1, scope: !164)
!202 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !78, file: !78, line: 155, type: !165, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocalVariable(name: "value", arg: 1, scope: !202, file: !78, line: 155, type: !6)
!204 = !DILocation(line: 155, column: 25, scope: !202)
!205 = !DILocalVariable(name: "factor", arg: 2, scope: !202, file: !78, line: 155, type: !17)
!206 = !DILocation(line: 155, column: 35, scope: !202)
!207 = !DILocalVariable(name: "s32MulTemp1", scope: !202, file: !78, line: 157, type: !86)
!208 = !DILocation(line: 157, column: 6, scope: !202)
!209 = !DILocalVariable(name: "s32MulTemp2", scope: !202, file: !78, line: 157, type: !86)
!210 = !DILocation(line: 157, column: 24, scope: !202)
!211 = !DILocation(line: 158, column: 16, scope: !202)
!212 = !DILocation(line: 158, column: 24, scope: !202)
!213 = !DILocation(line: 158, column: 22, scope: !202)
!214 = !DILocation(line: 158, column: 14, scope: !202)
!215 = !DILocation(line: 159, column: 16, scope: !202)
!216 = !DILocation(line: 159, column: 28, scope: !202)
!217 = !DILocation(line: 159, column: 14, scope: !202)
!218 = !DILocation(line: 160, column: 6, scope: !219)
!219 = distinct !DILexicalBlock(scope: !202, file: !78, line: 160, column: 5)
!220 = !DILocation(line: 160, column: 17, scope: !219)
!221 = !DILocation(line: 160, column: 21, scope: !219)
!222 = !DILocation(line: 160, column: 25, scope: !219)
!223 = !DILocation(line: 160, column: 37, scope: !219)
!224 = !DILocation(line: 160, column: 44, scope: !219)
!225 = !DILocation(line: 160, column: 5, scope: !202)
!226 = !DILocation(line: 162, column: 17, scope: !227)
!227 = distinct !DILexicalBlock(scope: !219, file: !78, line: 161, column: 2)
!228 = !DILocation(line: 162, column: 29, scope: !227)
!229 = !DILocation(line: 162, column: 15, scope: !227)
!230 = !DILocation(line: 163, column: 2, scope: !227)
!231 = !DILocation(line: 169, column: 5, scope: !232)
!232 = distinct !DILexicalBlock(scope: !202, file: !78, line: 169, column: 5)
!233 = !DILocation(line: 169, column: 17, scope: !232)
!234 = !DILocation(line: 169, column: 5, scope: !202)
!235 = !DILocation(line: 171, column: 6, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !78, line: 171, column: 6)
!237 = distinct !DILexicalBlock(scope: !232, file: !78, line: 170, column: 2)
!238 = !DILocation(line: 171, column: 18, scope: !236)
!239 = !DILocation(line: 171, column: 6, scope: !237)
!240 = !DILocation(line: 173, column: 15, scope: !241)
!241 = distinct !DILexicalBlock(scope: !236, file: !78, line: 172, column: 3)
!242 = !DILocation(line: 173, column: 11, scope: !241)
!243 = !DILocation(line: 173, column: 4, scope: !241)
!244 = !DILocation(line: 177, column: 4, scope: !245)
!245 = distinct !DILexicalBlock(scope: !236, file: !78, line: 176, column: 3)
!246 = !DILocation(line: 182, column: 3, scope: !247)
!247 = distinct !DILexicalBlock(scope: !232, file: !78, line: 181, column: 2)
!248 = !DILocation(line: 184, column: 1, scope: !202)
!249 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !78, file: !78, line: 200, type: !250, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!250 = !DISubroutineType(types: !251)
!251 = !{!13, !13, !13, !86}
!252 = !DILocalVariable(name: "value", arg: 1, scope: !249, file: !78, line: 200, type: !13)
!253 = !DILocation(line: 200, column: 40, scope: !249)
!254 = !DILocalVariable(name: "factor", arg: 2, scope: !249, file: !78, line: 200, type: !13)
!255 = !DILocation(line: 200, column: 51, scope: !249)
!256 = !DILocalVariable(name: "count", arg: 3, scope: !249, file: !78, line: 200, type: !86)
!257 = !DILocation(line: 200, column: 63, scope: !249)
!258 = !DILocalVariable(name: "s32MulTemp", scope: !249, file: !78, line: 202, type: !86)
!259 = !DILocation(line: 202, column: 6, scope: !249)
!260 = !DILocation(line: 203, column: 15, scope: !249)
!261 = !DILocation(line: 203, column: 23, scope: !249)
!262 = !DILocation(line: 203, column: 21, scope: !249)
!263 = !DILocation(line: 203, column: 13, scope: !249)
!264 = !DILocation(line: 204, column: 15, scope: !249)
!265 = !DILocation(line: 204, column: 26, scope: !249)
!266 = !DILocation(line: 204, column: 25, scope: !249)
!267 = !{!"True"}
!268 = !DILocation(line: 204, column: 13, scope: !249)
!269 = !DILocation(line: 205, column: 9, scope: !249)
!270 = !DILocation(line: 205, column: 2, scope: !249)
!271 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !78, file: !78, line: 223, type: !250, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DILocalVariable(name: "value", arg: 1, scope: !271, file: !78, line: 223, type: !13)
!273 = !DILocation(line: 223, column: 43, scope: !271)
!274 = !DILocalVariable(name: "factor", arg: 2, scope: !271, file: !78, line: 223, type: !13)
!275 = !DILocation(line: 223, column: 54, scope: !271)
!276 = !DILocalVariable(name: "count", arg: 3, scope: !271, file: !78, line: 223, type: !86)
!277 = !DILocation(line: 223, column: 66, scope: !271)
!278 = !DILocalVariable(name: "s32MulTemp", scope: !271, file: !78, line: 225, type: !86)
!279 = !DILocation(line: 225, column: 6, scope: !271)
!280 = !DILocation(line: 226, column: 15, scope: !271)
!281 = !DILocation(line: 226, column: 23, scope: !271)
!282 = !DILocation(line: 226, column: 21, scope: !271)
!283 = !DILocation(line: 226, column: 13, scope: !271)
!284 = !DILocation(line: 227, column: 15, scope: !271)
!285 = !DILocation(line: 227, column: 26, scope: !271)
!286 = !DILocation(line: 227, column: 25, scope: !271)
!287 = !DILocation(line: 227, column: 13, scope: !271)
!288 = !DILocation(line: 228, column: 5, scope: !289)
!289 = distinct !DILexicalBlock(scope: !271, file: !78, line: 228, column: 5)
!290 = !DILocation(line: 228, column: 16, scope: !289)
!291 = !DILocation(line: 228, column: 5, scope: !271)
!292 = !DILocation(line: 230, column: 6, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !78, line: 230, column: 6)
!294 = distinct !DILexicalBlock(scope: !289, file: !78, line: 229, column: 2)
!295 = !DILocation(line: 230, column: 17, scope: !293)
!296 = !DILocation(line: 230, column: 6, scope: !294)
!297 = !DILocation(line: 232, column: 16, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !78, line: 231, column: 3)
!299 = !DILocation(line: 232, column: 11, scope: !298)
!300 = !DILocation(line: 232, column: 4, scope: !298)
!301 = !DILocation(line: 236, column: 4, scope: !302)
!302 = distinct !DILexicalBlock(scope: !293, file: !78, line: 235, column: 3)
!303 = !DILocation(line: 241, column: 3, scope: !304)
!304 = distinct !DILexicalBlock(scope: !289, file: !78, line: 240, column: 2)
!305 = !DILocation(line: 243, column: 1, scope: !271)
!306 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !78, file: !78, line: 262, type: !307, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!307 = !DISubroutineType(types: !308)
!308 = !{!13, !13, !13}
!309 = !DILocalVariable(name: "value", arg: 1, scope: !306, file: !78, line: 262, type: !13)
!310 = !DILocation(line: 262, column: 30, scope: !306)
!311 = !DILocalVariable(name: "factor", arg: 2, scope: !306, file: !78, line: 262, type: !13)
!312 = !DILocation(line: 262, column: 41, scope: !306)
!313 = !DILocalVariable(name: "s32MulTemp1", scope: !306, file: !78, line: 264, type: !86)
!314 = !DILocation(line: 264, column: 6, scope: !306)
!315 = !DILocalVariable(name: "s32MulTemp2", scope: !306, file: !78, line: 264, type: !86)
!316 = !DILocation(line: 264, column: 24, scope: !306)
!317 = !DILocation(line: 265, column: 16, scope: !306)
!318 = !DILocation(line: 265, column: 24, scope: !306)
!319 = !DILocation(line: 265, column: 22, scope: !306)
!320 = !DILocation(line: 265, column: 14, scope: !306)
!321 = !DILocation(line: 266, column: 16, scope: !306)
!322 = !DILocation(line: 266, column: 28, scope: !306)
!323 = !DILocation(line: 266, column: 14, scope: !306)
!324 = !DILocation(line: 267, column: 6, scope: !325)
!325 = distinct !DILexicalBlock(scope: !306, file: !78, line: 267, column: 5)
!326 = !DILocation(line: 267, column: 17, scope: !325)
!327 = !DILocation(line: 267, column: 21, scope: !325)
!328 = !DILocation(line: 267, column: 25, scope: !325)
!329 = !DILocation(line: 267, column: 37, scope: !325)
!330 = !DILocation(line: 267, column: 46, scope: !325)
!331 = !DILocation(line: 267, column: 5, scope: !306)
!332 = !DILocation(line: 269, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !325, file: !78, line: 268, column: 2)
!334 = !DILocation(line: 269, column: 29, scope: !333)
!335 = !DILocation(line: 269, column: 15, scope: !333)
!336 = !DILocation(line: 271, column: 2, scope: !333)
!337 = !DILocation(line: 277, column: 5, scope: !338)
!338 = distinct !DILexicalBlock(scope: !306, file: !78, line: 277, column: 5)
!339 = !DILocation(line: 277, column: 17, scope: !338)
!340 = !DILocation(line: 277, column: 5, scope: !306)
!341 = !DILocation(line: 279, column: 15, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !78, line: 278, column: 2)
!343 = !DILocation(line: 279, column: 10, scope: !342)
!344 = !DILocation(line: 279, column: 3, scope: !342)
!345 = !DILocation(line: 283, column: 3, scope: !346)
!346 = distinct !DILexicalBlock(scope: !338, file: !78, line: 282, column: 2)
!347 = !DILocation(line: 285, column: 1, scope: !306)
!348 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !78, file: !78, line: 304, type: !307, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!349 = !DILocalVariable(name: "value", arg: 1, scope: !348, file: !78, line: 304, type: !13)
!350 = !DILocation(line: 304, column: 30, scope: !348)
!351 = !DILocalVariable(name: "factor", arg: 2, scope: !348, file: !78, line: 304, type: !13)
!352 = !DILocation(line: 304, column: 41, scope: !348)
!353 = !DILocalVariable(name: "s32MulTemp1", scope: !348, file: !78, line: 306, type: !86)
!354 = !DILocation(line: 306, column: 6, scope: !348)
!355 = !DILocalVariable(name: "s32MulTemp2", scope: !348, file: !78, line: 306, type: !86)
!356 = !DILocation(line: 306, column: 24, scope: !348)
!357 = !DILocation(line: 307, column: 16, scope: !348)
!358 = !DILocation(line: 307, column: 24, scope: !348)
!359 = !DILocation(line: 307, column: 22, scope: !348)
!360 = !DILocation(line: 307, column: 14, scope: !348)
!361 = !DILocation(line: 308, column: 16, scope: !348)
!362 = !DILocation(line: 308, column: 28, scope: !348)
!363 = !DILocation(line: 308, column: 14, scope: !348)
!364 = !DILocation(line: 309, column: 6, scope: !365)
!365 = distinct !DILexicalBlock(scope: !348, file: !78, line: 309, column: 5)
!366 = !DILocation(line: 309, column: 17, scope: !365)
!367 = !DILocation(line: 309, column: 21, scope: !365)
!368 = !DILocation(line: 309, column: 25, scope: !365)
!369 = !DILocation(line: 309, column: 37, scope: !365)
!370 = !DILocation(line: 309, column: 46, scope: !365)
!371 = !DILocation(line: 309, column: 5, scope: !348)
!372 = !DILocation(line: 311, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !365, file: !78, line: 310, column: 2)
!374 = !DILocation(line: 311, column: 29, scope: !373)
!375 = !DILocation(line: 311, column: 15, scope: !373)
!376 = !DILocation(line: 312, column: 2, scope: !373)
!377 = !DILocation(line: 318, column: 6, scope: !378)
!378 = distinct !DILexicalBlock(scope: !348, file: !78, line: 318, column: 6)
!379 = !DILocation(line: 318, column: 18, scope: !378)
!380 = !DILocation(line: 318, column: 6, scope: !348)
!381 = !DILocation(line: 320, column: 6, scope: !382)
!382 = distinct !DILexicalBlock(scope: !383, file: !78, line: 320, column: 6)
!383 = distinct !DILexicalBlock(scope: !378, file: !78, line: 319, column: 2)
!384 = !DILocation(line: 320, column: 18, scope: !382)
!385 = !DILocation(line: 320, column: 6, scope: !383)
!386 = !DILocation(line: 322, column: 16, scope: !387)
!387 = distinct !DILexicalBlock(scope: !382, file: !78, line: 321, column: 3)
!388 = !DILocation(line: 322, column: 11, scope: !387)
!389 = !DILocation(line: 322, column: 4, scope: !387)
!390 = !DILocation(line: 326, column: 4, scope: !391)
!391 = distinct !DILexicalBlock(scope: !382, file: !78, line: 325, column: 3)
!392 = !DILocation(line: 331, column: 3, scope: !393)
!393 = distinct !DILexicalBlock(scope: !378, file: !78, line: 330, column: 2)
!394 = !DILocation(line: 333, column: 1, scope: !348)
!395 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !78, file: !78, line: 350, type: !396, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!396 = !DISubroutineType(types: !397)
!397 = !{!13, !13, !22}
!398 = !DILocalVariable(name: "value", arg: 1, scope: !395, file: !78, line: 350, type: !13)
!399 = !DILocation(line: 350, column: 39, scope: !395)
!400 = !DILocalVariable(name: "factor", arg: 2, scope: !395, file: !78, line: 350, type: !22)
!401 = !DILocation(line: 350, column: 50, scope: !395)
!402 = !DILocalVariable(name: "s32MulTemp1", scope: !395, file: !78, line: 352, type: !86)
!403 = !DILocation(line: 352, column: 6, scope: !395)
!404 = !DILocalVariable(name: "s32MulTemp2", scope: !395, file: !78, line: 352, type: !86)
!405 = !DILocation(line: 352, column: 24, scope: !395)
!406 = !DILocation(line: 353, column: 16, scope: !395)
!407 = !DILocation(line: 353, column: 24, scope: !395)
!408 = !DILocation(line: 353, column: 22, scope: !395)
!409 = !DILocation(line: 353, column: 14, scope: !395)
!410 = !DILocation(line: 354, column: 16, scope: !395)
!411 = !DILocation(line: 354, column: 28, scope: !395)
!412 = !DILocation(line: 354, column: 14, scope: !395)
!413 = !DILocation(line: 355, column: 6, scope: !414)
!414 = distinct !DILexicalBlock(scope: !395, file: !78, line: 355, column: 5)
!415 = !DILocation(line: 355, column: 17, scope: !414)
!416 = !DILocation(line: 355, column: 21, scope: !414)
!417 = !DILocation(line: 355, column: 25, scope: !414)
!418 = !DILocation(line: 355, column: 37, scope: !414)
!419 = !DILocation(line: 355, column: 46, scope: !414)
!420 = !DILocation(line: 355, column: 5, scope: !395)
!421 = !DILocation(line: 361, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !414, file: !78, line: 360, column: 2)
!423 = !DILocation(line: 361, column: 29, scope: !422)
!424 = !DILocation(line: 361, column: 15, scope: !422)
!425 = !DILocation(line: 362, column: 15, scope: !422)
!426 = !DILocation(line: 362, column: 10, scope: !422)
!427 = !DILocation(line: 362, column: 3, scope: !422)
!428 = !DILocation(line: 366, column: 15, scope: !429)
!429 = distinct !DILexicalBlock(scope: !414, file: !78, line: 365, column: 2)
!430 = !DILocation(line: 366, column: 10, scope: !429)
!431 = !DILocation(line: 366, column: 3, scope: !429)
!432 = !DILocation(line: 368, column: 1, scope: !395)
!433 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !78, file: !78, line: 386, type: !396, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!434 = !DILocalVariable(name: "value", arg: 1, scope: !433, file: !78, line: 386, type: !13)
!435 = !DILocation(line: 386, column: 42, scope: !433)
!436 = !DILocalVariable(name: "factor", arg: 2, scope: !433, file: !78, line: 386, type: !22)
!437 = !DILocation(line: 386, column: 53, scope: !433)
!438 = !DILocalVariable(name: "s32MulTemp1", scope: !433, file: !78, line: 388, type: !86)
!439 = !DILocation(line: 388, column: 6, scope: !433)
!440 = !DILocalVariable(name: "s32MulTemp2", scope: !433, file: !78, line: 388, type: !86)
!441 = !DILocation(line: 388, column: 24, scope: !433)
!442 = !DILocation(line: 389, column: 16, scope: !433)
!443 = !DILocation(line: 389, column: 24, scope: !433)
!444 = !DILocation(line: 389, column: 22, scope: !433)
!445 = !DILocation(line: 389, column: 14, scope: !433)
!446 = !DILocation(line: 390, column: 16, scope: !433)
!447 = !DILocation(line: 390, column: 28, scope: !433)
!448 = !DILocation(line: 390, column: 14, scope: !433)
!449 = !DILocation(line: 391, column: 6, scope: !450)
!450 = distinct !DILexicalBlock(scope: !433, file: !78, line: 391, column: 5)
!451 = !DILocation(line: 391, column: 17, scope: !450)
!452 = !DILocation(line: 391, column: 21, scope: !450)
!453 = !DILocation(line: 391, column: 25, scope: !450)
!454 = !DILocation(line: 391, column: 37, scope: !450)
!455 = !DILocation(line: 391, column: 44, scope: !450)
!456 = !DILocation(line: 391, column: 5, scope: !433)
!457 = !DILocation(line: 398, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !450, file: !78, line: 397, column: 2)
!459 = !DILocation(line: 398, column: 29, scope: !458)
!460 = !DILocation(line: 398, column: 15, scope: !458)
!461 = !DILocation(line: 399, column: 2, scope: !458)
!462 = !DILocation(line: 404, column: 5, scope: !463)
!463 = distinct !DILexicalBlock(scope: !433, file: !78, line: 404, column: 5)
!464 = !DILocation(line: 404, column: 17, scope: !463)
!465 = !DILocation(line: 404, column: 5, scope: !433)
!466 = !DILocation(line: 406, column: 6, scope: !467)
!467 = distinct !DILexicalBlock(scope: !468, file: !78, line: 406, column: 6)
!468 = distinct !DILexicalBlock(scope: !463, file: !78, line: 405, column: 2)
!469 = !DILocation(line: 406, column: 18, scope: !467)
!470 = !DILocation(line: 406, column: 6, scope: !468)
!471 = !DILocation(line: 408, column: 16, scope: !472)
!472 = distinct !DILexicalBlock(scope: !467, file: !78, line: 407, column: 3)
!473 = !DILocation(line: 408, column: 11, scope: !472)
!474 = !DILocation(line: 408, column: 4, scope: !472)
!475 = !DILocation(line: 412, column: 4, scope: !476)
!476 = distinct !DILexicalBlock(scope: !467, file: !78, line: 411, column: 3)
!477 = !DILocation(line: 417, column: 3, scope: !478)
!478 = distinct !DILexicalBlock(scope: !463, file: !78, line: 416, column: 2)
!479 = !DILocation(line: 419, column: 1, scope: !433)
!480 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !78, file: !78, line: 436, type: !481, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!481 = !DISubroutineType(types: !482)
!482 = !{!13, !13, !17}
!483 = !DILocalVariable(name: "value", arg: 1, scope: !480, file: !78, line: 436, type: !13)
!484 = !DILocation(line: 436, column: 29, scope: !480)
!485 = !DILocalVariable(name: "factor", arg: 2, scope: !480, file: !78, line: 436, type: !17)
!486 = !DILocation(line: 436, column: 39, scope: !480)
!487 = !DILocalVariable(name: "s32MulTemp1", scope: !480, file: !78, line: 438, type: !86)
!488 = !DILocation(line: 438, column: 6, scope: !480)
!489 = !DILocalVariable(name: "s32MulTemp2", scope: !480, file: !78, line: 438, type: !86)
!490 = !DILocation(line: 438, column: 24, scope: !480)
!491 = !DILocation(line: 439, column: 16, scope: !480)
!492 = !DILocation(line: 439, column: 24, scope: !480)
!493 = !DILocation(line: 439, column: 22, scope: !480)
!494 = !DILocation(line: 439, column: 14, scope: !480)
!495 = !DILocation(line: 440, column: 16, scope: !480)
!496 = !DILocation(line: 440, column: 28, scope: !480)
!497 = !DILocation(line: 440, column: 14, scope: !480)
!498 = !DILocation(line: 441, column: 6, scope: !499)
!499 = distinct !DILexicalBlock(scope: !480, file: !78, line: 441, column: 5)
!500 = !DILocation(line: 441, column: 17, scope: !499)
!501 = !DILocation(line: 441, column: 21, scope: !499)
!502 = !DILocation(line: 441, column: 25, scope: !499)
!503 = !DILocation(line: 441, column: 37, scope: !499)
!504 = !DILocation(line: 441, column: 44, scope: !499)
!505 = !DILocation(line: 441, column: 5, scope: !480)
!506 = !DILocation(line: 448, column: 17, scope: !507)
!507 = distinct !DILexicalBlock(scope: !499, file: !78, line: 447, column: 2)
!508 = !DILocation(line: 448, column: 29, scope: !507)
!509 = !DILocation(line: 448, column: 15, scope: !507)
!510 = !DILocation(line: 449, column: 10, scope: !507)
!511 = !DILocation(line: 449, column: 3, scope: !507)
!512 = !DILocation(line: 453, column: 10, scope: !513)
!513 = distinct !DILexicalBlock(scope: !499, file: !78, line: 452, column: 2)
!514 = !DILocation(line: 453, column: 3, scope: !513)
!515 = !DILocation(line: 455, column: 1, scope: !480)
!516 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !78, file: !78, line: 473, type: !481, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!517 = !DILocalVariable(name: "value", arg: 1, scope: !516, file: !78, line: 473, type: !13)
!518 = !DILocation(line: 473, column: 29, scope: !516)
!519 = !DILocalVariable(name: "factor", arg: 2, scope: !516, file: !78, line: 473, type: !17)
!520 = !DILocation(line: 473, column: 39, scope: !516)
!521 = !DILocalVariable(name: "s32MulTemp1", scope: !516, file: !78, line: 475, type: !86)
!522 = !DILocation(line: 475, column: 6, scope: !516)
!523 = !DILocalVariable(name: "s32MulTemp2", scope: !516, file: !78, line: 475, type: !86)
!524 = !DILocation(line: 475, column: 24, scope: !516)
!525 = !DILocation(line: 476, column: 16, scope: !516)
!526 = !DILocation(line: 476, column: 24, scope: !516)
!527 = !DILocation(line: 476, column: 22, scope: !516)
!528 = !DILocation(line: 476, column: 14, scope: !516)
!529 = !DILocation(line: 477, column: 16, scope: !516)
!530 = !DILocation(line: 477, column: 28, scope: !516)
!531 = !DILocation(line: 477, column: 14, scope: !516)
!532 = !DILocation(line: 478, column: 6, scope: !533)
!533 = distinct !DILexicalBlock(scope: !516, file: !78, line: 478, column: 5)
!534 = !DILocation(line: 478, column: 17, scope: !533)
!535 = !DILocation(line: 478, column: 21, scope: !533)
!536 = !DILocation(line: 478, column: 25, scope: !533)
!537 = !DILocation(line: 478, column: 37, scope: !533)
!538 = !DILocation(line: 478, column: 44, scope: !533)
!539 = !DILocation(line: 478, column: 5, scope: !516)
!540 = !DILocation(line: 484, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !533, file: !78, line: 483, column: 2)
!542 = !DILocation(line: 484, column: 29, scope: !541)
!543 = !DILocation(line: 484, column: 15, scope: !541)
!544 = !DILocation(line: 485, column: 2, scope: !541)
!545 = !DILocation(line: 491, column: 6, scope: !546)
!546 = distinct !DILexicalBlock(scope: !516, file: !78, line: 491, column: 6)
!547 = !DILocation(line: 491, column: 18, scope: !546)
!548 = !DILocation(line: 491, column: 6, scope: !516)
!549 = !DILocation(line: 493, column: 6, scope: !550)
!550 = distinct !DILexicalBlock(scope: !551, file: !78, line: 493, column: 6)
!551 = distinct !DILexicalBlock(scope: !546, file: !78, line: 492, column: 2)
!552 = !DILocation(line: 493, column: 18, scope: !550)
!553 = !DILocation(line: 493, column: 6, scope: !551)
!554 = !DILocation(line: 495, column: 16, scope: !555)
!555 = distinct !DILexicalBlock(scope: !550, file: !78, line: 494, column: 3)
!556 = !DILocation(line: 495, column: 11, scope: !555)
!557 = !DILocation(line: 495, column: 4, scope: !555)
!558 = !DILocation(line: 499, column: 4, scope: !559)
!559 = distinct !DILexicalBlock(scope: !550, file: !78, line: 498, column: 3)
!560 = !DILocation(line: 504, column: 3, scope: !561)
!561 = distinct !DILexicalBlock(scope: !546, file: !78, line: 503, column: 2)
!562 = !DILocation(line: 506, column: 1, scope: !516)
!563 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !78, file: !78, line: 521, type: !396, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!564 = !DILocalVariable(name: "value", arg: 1, scope: !563, file: !78, line: 521, type: !13)
!565 = !DILocation(line: 521, column: 25, scope: !563)
!566 = !DILocalVariable(name: "factor", arg: 2, scope: !563, file: !78, line: 521, type: !22)
!567 = !DILocation(line: 521, column: 36, scope: !563)
!568 = !DILocalVariable(name: "s32MulTemp", scope: !563, file: !78, line: 523, type: !86)
!569 = !DILocation(line: 523, column: 6, scope: !563)
!570 = !DILocation(line: 524, column: 15, scope: !563)
!571 = !DILocation(line: 524, column: 23, scope: !563)
!572 = !DILocation(line: 524, column: 21, scope: !563)
!573 = !DILocation(line: 524, column: 13, scope: !563)
!574 = !DILocation(line: 525, column: 5, scope: !575)
!575 = distinct !DILexicalBlock(scope: !563, file: !78, line: 525, column: 5)
!576 = !DILocation(line: 525, column: 16, scope: !575)
!577 = !DILocation(line: 525, column: 5, scope: !563)
!578 = !DILocation(line: 527, column: 6, scope: !579)
!579 = distinct !DILexicalBlock(scope: !580, file: !78, line: 527, column: 6)
!580 = distinct !DILexicalBlock(scope: !575, file: !78, line: 526, column: 2)
!581 = !DILocation(line: 527, column: 17, scope: !579)
!582 = !DILocation(line: 527, column: 6, scope: !580)
!583 = !DILocation(line: 529, column: 16, scope: !584)
!584 = distinct !DILexicalBlock(scope: !579, file: !78, line: 528, column: 3)
!585 = !DILocation(line: 529, column: 11, scope: !584)
!586 = !DILocation(line: 529, column: 4, scope: !584)
!587 = !DILocation(line: 533, column: 4, scope: !588)
!588 = distinct !DILexicalBlock(scope: !579, file: !78, line: 532, column: 3)
!589 = !DILocation(line: 538, column: 3, scope: !590)
!590 = distinct !DILexicalBlock(scope: !575, file: !78, line: 537, column: 2)
!591 = !DILocation(line: 540, column: 1, scope: !563)
!592 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !78, file: !78, line: 556, type: !593, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!593 = !DISubroutineType(types: !594)
!594 = !{!13, !13, !22, !86}
!595 = !DILocalVariable(name: "value", arg: 1, scope: !592, file: !78, line: 556, type: !13)
!596 = !DILocation(line: 556, column: 40, scope: !592)
!597 = !DILocalVariable(name: "factor", arg: 2, scope: !592, file: !78, line: 556, type: !22)
!598 = !DILocation(line: 556, column: 50, scope: !592)
!599 = !DILocalVariable(name: "count", arg: 3, scope: !592, file: !78, line: 556, type: !86)
!600 = !DILocation(line: 556, column: 61, scope: !592)
!601 = !DILocalVariable(name: "s32MulTemp", scope: !592, file: !78, line: 558, type: !86)
!602 = !DILocation(line: 558, column: 6, scope: !592)
!603 = !DILocation(line: 559, column: 15, scope: !592)
!604 = !DILocation(line: 559, column: 23, scope: !592)
!605 = !DILocation(line: 559, column: 21, scope: !592)
!606 = !DILocation(line: 559, column: 13, scope: !592)
!607 = !DILocation(line: 560, column: 15, scope: !592)
!608 = !DILocation(line: 560, column: 26, scope: !592)
!609 = !DILocation(line: 560, column: 25, scope: !592)
!610 = !DILocation(line: 560, column: 13, scope: !592)
!611 = !DILocation(line: 561, column: 14, scope: !592)
!612 = !DILocation(line: 561, column: 9, scope: !592)
!613 = !DILocation(line: 561, column: 2, scope: !592)
!614 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !78, file: !78, line: 580, type: !615, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!615 = !DISubroutineType(types: !616)
!616 = !{!13, !13, !22, !22}
!617 = !DILocalVariable(name: "value", arg: 1, scope: !614, file: !78, line: 580, type: !13)
!618 = !DILocation(line: 580, column: 43, scope: !614)
!619 = !DILocalVariable(name: "factor", arg: 2, scope: !614, file: !78, line: 580, type: !22)
!620 = !DILocation(line: 580, column: 53, scope: !614)
!621 = !DILocalVariable(name: "count", arg: 3, scope: !614, file: !78, line: 580, type: !22)
!622 = !DILocation(line: 580, column: 64, scope: !614)
!623 = !DILocalVariable(name: "s32MulTemp", scope: !614, file: !78, line: 582, type: !86)
!624 = !DILocation(line: 582, column: 6, scope: !614)
!625 = !DILocation(line: 583, column: 15, scope: !614)
!626 = !DILocation(line: 583, column: 23, scope: !614)
!627 = !DILocation(line: 583, column: 21, scope: !614)
!628 = !DILocation(line: 583, column: 13, scope: !614)
!629 = !DILocation(line: 584, column: 15, scope: !614)
!630 = !DILocation(line: 584, column: 26, scope: !614)
!631 = !DILocation(line: 584, column: 25, scope: !614)
!632 = !DILocation(line: 584, column: 13, scope: !614)
!633 = !DILocation(line: 585, column: 5, scope: !634)
!634 = distinct !DILexicalBlock(scope: !614, file: !78, line: 585, column: 5)
!635 = !DILocation(line: 585, column: 16, scope: !634)
!636 = !DILocation(line: 585, column: 5, scope: !614)
!637 = !DILocation(line: 587, column: 6, scope: !638)
!638 = distinct !DILexicalBlock(scope: !639, file: !78, line: 587, column: 6)
!639 = distinct !DILexicalBlock(scope: !634, file: !78, line: 586, column: 2)
!640 = !DILocation(line: 587, column: 17, scope: !638)
!641 = !DILocation(line: 587, column: 6, scope: !639)
!642 = !DILocation(line: 589, column: 16, scope: !643)
!643 = distinct !DILexicalBlock(scope: !638, file: !78, line: 588, column: 3)
!644 = !DILocation(line: 589, column: 11, scope: !643)
!645 = !DILocation(line: 589, column: 4, scope: !643)
!646 = !DILocation(line: 593, column: 4, scope: !647)
!647 = distinct !DILexicalBlock(scope: !638, file: !78, line: 592, column: 3)
!648 = !DILocation(line: 598, column: 3, scope: !649)
!649 = distinct !DILexicalBlock(scope: !634, file: !78, line: 597, column: 2)
!650 = !DILocation(line: 600, column: 1, scope: !614)
!651 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !78, file: !78, line: 617, type: !396, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!652 = !DILocalVariable(name: "value", arg: 1, scope: !651, file: !78, line: 617, type: !13)
!653 = !DILocation(line: 617, column: 31, scope: !651)
!654 = !DILocalVariable(name: "factor", arg: 2, scope: !651, file: !78, line: 617, type: !22)
!655 = !DILocation(line: 617, column: 42, scope: !651)
!656 = !DILocalVariable(name: "s32MulTemp1", scope: !651, file: !78, line: 619, type: !86)
!657 = !DILocation(line: 619, column: 6, scope: !651)
!658 = !DILocalVariable(name: "s32MulTemp2", scope: !651, file: !78, line: 619, type: !86)
!659 = !DILocation(line: 619, column: 24, scope: !651)
!660 = !DILocation(line: 620, column: 16, scope: !651)
!661 = !DILocation(line: 620, column: 24, scope: !651)
!662 = !DILocation(line: 620, column: 22, scope: !651)
!663 = !DILocation(line: 620, column: 14, scope: !651)
!664 = !DILocation(line: 621, column: 16, scope: !651)
!665 = !DILocation(line: 621, column: 28, scope: !651)
!666 = !DILocation(line: 621, column: 14, scope: !651)
!667 = !DILocation(line: 622, column: 6, scope: !668)
!668 = distinct !DILexicalBlock(scope: !651, file: !78, line: 622, column: 5)
!669 = !DILocation(line: 622, column: 17, scope: !668)
!670 = !DILocation(line: 622, column: 21, scope: !668)
!671 = !DILocation(line: 622, column: 25, scope: !668)
!672 = !DILocation(line: 622, column: 37, scope: !668)
!673 = !DILocation(line: 622, column: 46, scope: !668)
!674 = !DILocation(line: 622, column: 5, scope: !651)
!675 = !DILocation(line: 629, column: 17, scope: !676)
!676 = distinct !DILexicalBlock(scope: !668, file: !78, line: 628, column: 2)
!677 = !DILocation(line: 629, column: 29, scope: !676)
!678 = !DILocation(line: 629, column: 15, scope: !676)
!679 = !DILocation(line: 630, column: 15, scope: !676)
!680 = !DILocation(line: 630, column: 10, scope: !676)
!681 = !DILocation(line: 630, column: 3, scope: !676)
!682 = !DILocation(line: 634, column: 15, scope: !683)
!683 = distinct !DILexicalBlock(scope: !668, file: !78, line: 633, column: 2)
!684 = !DILocation(line: 634, column: 10, scope: !683)
!685 = !DILocation(line: 634, column: 3, scope: !683)
!686 = !DILocation(line: 636, column: 1, scope: !651)
!687 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !78, file: !78, line: 654, type: !396, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!688 = !DILocalVariable(name: "value", arg: 1, scope: !687, file: !78, line: 654, type: !13)
!689 = !DILocation(line: 654, column: 31, scope: !687)
!690 = !DILocalVariable(name: "factor", arg: 2, scope: !687, file: !78, line: 654, type: !22)
!691 = !DILocation(line: 654, column: 42, scope: !687)
!692 = !DILocalVariable(name: "s32MulTemp1", scope: !687, file: !78, line: 656, type: !86)
!693 = !DILocation(line: 656, column: 6, scope: !687)
!694 = !DILocalVariable(name: "s32MulTemp2", scope: !687, file: !78, line: 656, type: !86)
!695 = !DILocation(line: 656, column: 24, scope: !687)
!696 = !DILocation(line: 657, column: 16, scope: !687)
!697 = !DILocation(line: 657, column: 24, scope: !687)
!698 = !DILocation(line: 657, column: 22, scope: !687)
!699 = !DILocation(line: 657, column: 14, scope: !687)
!700 = !DILocation(line: 658, column: 16, scope: !687)
!701 = !DILocation(line: 658, column: 28, scope: !687)
!702 = !DILocation(line: 658, column: 14, scope: !687)
!703 = !DILocation(line: 659, column: 6, scope: !704)
!704 = distinct !DILexicalBlock(scope: !687, file: !78, line: 659, column: 5)
!705 = !DILocation(line: 659, column: 17, scope: !704)
!706 = !DILocation(line: 659, column: 21, scope: !704)
!707 = !DILocation(line: 659, column: 25, scope: !704)
!708 = !DILocation(line: 659, column: 37, scope: !704)
!709 = !DILocation(line: 659, column: 46, scope: !704)
!710 = !DILocation(line: 659, column: 5, scope: !687)
!711 = !DILocation(line: 665, column: 17, scope: !712)
!712 = distinct !DILexicalBlock(scope: !704, file: !78, line: 664, column: 2)
!713 = !DILocation(line: 665, column: 29, scope: !712)
!714 = !DILocation(line: 665, column: 15, scope: !712)
!715 = !DILocation(line: 666, column: 2, scope: !712)
!716 = !DILocation(line: 672, column: 6, scope: !717)
!717 = distinct !DILexicalBlock(scope: !687, file: !78, line: 672, column: 6)
!718 = !DILocation(line: 672, column: 18, scope: !717)
!719 = !DILocation(line: 672, column: 6, scope: !687)
!720 = !DILocation(line: 674, column: 6, scope: !721)
!721 = distinct !DILexicalBlock(scope: !722, file: !78, line: 674, column: 6)
!722 = distinct !DILexicalBlock(scope: !717, file: !78, line: 673, column: 2)
!723 = !DILocation(line: 674, column: 18, scope: !721)
!724 = !DILocation(line: 674, column: 6, scope: !722)
!725 = !DILocation(line: 676, column: 16, scope: !726)
!726 = distinct !DILexicalBlock(scope: !721, file: !78, line: 675, column: 3)
!727 = !DILocation(line: 676, column: 11, scope: !726)
!728 = !DILocation(line: 676, column: 4, scope: !726)
!729 = !DILocation(line: 680, column: 4, scope: !730)
!730 = distinct !DILexicalBlock(scope: !721, file: !78, line: 679, column: 3)
!731 = !DILocation(line: 685, column: 3, scope: !732)
!732 = distinct !DILexicalBlock(scope: !717, file: !78, line: 684, column: 2)
!733 = !DILocation(line: 687, column: 1, scope: !687)
!734 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !78, file: !78, line: 704, type: !735, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!735 = !DISubroutineType(types: !736)
!736 = !{!13, !22, !22}
!737 = !DILocalVariable(name: "value", arg: 1, scope: !734, file: !78, line: 704, type: !22)
!738 = !DILocation(line: 704, column: 33, scope: !734)
!739 = !DILocalVariable(name: "factor", arg: 2, scope: !734, file: !78, line: 704, type: !22)
!740 = !DILocation(line: 704, column: 44, scope: !734)
!741 = !DILocalVariable(name: "u32MulTemp", scope: !734, file: !78, line: 706, type: !742)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !59)
!743 = !DILocation(line: 706, column: 6, scope: !734)
!744 = !DILocation(line: 707, column: 15, scope: !734)
!745 = !DILocation(line: 707, column: 23, scope: !734)
!746 = !DILocation(line: 707, column: 21, scope: !734)
!747 = !DILocation(line: 707, column: 13, scope: !734)
!748 = !DILocation(line: 708, column: 15, scope: !734)
!749 = !DILocation(line: 708, column: 26, scope: !734)
!750 = !DILocation(line: 708, column: 13, scope: !734)
!751 = !DILocation(line: 709, column: 5, scope: !752)
!752 = distinct !DILexicalBlock(scope: !734, file: !78, line: 709, column: 5)
!753 = !DILocation(line: 709, column: 16, scope: !752)
!754 = !DILocation(line: 709, column: 5, scope: !734)
!755 = !DILocation(line: 711, column: 15, scope: !756)
!756 = distinct !DILexicalBlock(scope: !752, file: !78, line: 710, column: 2)
!757 = !DILocation(line: 711, column: 10, scope: !756)
!758 = !DILocation(line: 711, column: 3, scope: !756)
!759 = !DILocation(line: 715, column: 3, scope: !760)
!760 = distinct !DILexicalBlock(scope: !752, file: !78, line: 714, column: 2)
!761 = !DILocation(line: 717, column: 1, scope: !734)
!762 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !78, file: !78, line: 732, type: !763, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!763 = !DISubroutineType(types: !764)
!764 = !{!86, !13, !22}
!765 = !DILocalVariable(name: "value", arg: 1, scope: !762, file: !78, line: 732, type: !13)
!766 = !DILocation(line: 732, column: 25, scope: !762)
!767 = !DILocalVariable(name: "factor", arg: 2, scope: !762, file: !78, line: 732, type: !22)
!768 = !DILocation(line: 732, column: 36, scope: !762)
!769 = !DILocalVariable(name: "s32MulTemp", scope: !762, file: !78, line: 734, type: !86)
!770 = !DILocation(line: 734, column: 6, scope: !762)
!771 = !DILocation(line: 735, column: 15, scope: !762)
!772 = !DILocation(line: 735, column: 23, scope: !762)
!773 = !DILocation(line: 735, column: 21, scope: !762)
!774 = !DILocation(line: 735, column: 13, scope: !762)
!775 = !DILocation(line: 736, column: 9, scope: !762)
!776 = !DILocation(line: 736, column: 2, scope: !762)
!777 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !78, file: !78, line: 752, type: !778, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!778 = !DISubroutineType(types: !779)
!779 = !{!86, !86, !22}
!780 = !DILocalVariable(name: "value", arg: 1, scope: !777, file: !78, line: 752, type: !86)
!781 = !DILocation(line: 752, column: 25, scope: !777)
!782 = !DILocalVariable(name: "factor", arg: 2, scope: !777, file: !78, line: 752, type: !22)
!783 = !DILocation(line: 752, column: 36, scope: !777)
!784 = !DILocalVariable(name: "s32Temp1", scope: !777, file: !78, line: 754, type: !86)
!785 = !DILocation(line: 754, column: 6, scope: !777)
!786 = !DILocalVariable(name: "s32Temp2", scope: !777, file: !78, line: 754, type: !86)
!787 = !DILocation(line: 754, column: 20, scope: !777)
!788 = !DILocalVariable(name: "s32Factor", scope: !777, file: !78, line: 754, type: !86)
!789 = !DILocation(line: 754, column: 44, scope: !777)
!790 = !DILocation(line: 755, column: 14, scope: !777)
!791 = !DILocation(line: 755, column: 12, scope: !777)
!792 = !DILocation(line: 756, column: 5, scope: !793)
!793 = distinct !DILexicalBlock(scope: !777, file: !78, line: 756, column: 5)
!794 = !DILocation(line: 756, column: 12, scope: !793)
!795 = !DILocation(line: 756, column: 5, scope: !777)
!796 = !DILocation(line: 758, column: 6, scope: !797)
!797 = distinct !DILexicalBlock(scope: !798, file: !78, line: 758, column: 6)
!798 = distinct !DILexicalBlock(scope: !793, file: !78, line: 757, column: 2)
!799 = !DILocation(line: 758, column: 12, scope: !797)
!800 = !DILocation(line: 758, column: 6, scope: !798)
!801 = !DILocation(line: 760, column: 15, scope: !802)
!802 = distinct !DILexicalBlock(scope: !797, file: !78, line: 759, column: 3)
!803 = !DILocation(line: 760, column: 26, scope: !802)
!804 = !DILocation(line: 760, column: 24, scope: !802)
!805 = !DILocation(line: 760, column: 13, scope: !802)
!806 = !DILocation(line: 761, column: 7, scope: !807)
!807 = distinct !DILexicalBlock(scope: !802, file: !78, line: 761, column: 7)
!808 = !DILocation(line: 761, column: 19, scope: !807)
!809 = !DILocation(line: 761, column: 16, scope: !807)
!810 = !DILocation(line: 761, column: 7, scope: !802)
!811 = !DILocation(line: 763, column: 5, scope: !812)
!812 = distinct !DILexicalBlock(scope: !807, file: !78, line: 762, column: 4)
!813 = !DILocation(line: 767, column: 13, scope: !814)
!814 = distinct !DILexicalBlock(scope: !807, file: !78, line: 766, column: 4)
!815 = !DILocation(line: 767, column: 19, scope: !814)
!816 = !DILocation(line: 767, column: 18, scope: !814)
!817 = !DILocation(line: 767, column: 5, scope: !814)
!818 = !DILocation(line: 772, column: 20, scope: !819)
!819 = distinct !DILexicalBlock(scope: !820, file: !78, line: 772, column: 7)
!820 = distinct !DILexicalBlock(scope: !797, file: !78, line: 771, column: 3)
!821 = !DILocation(line: 772, column: 19, scope: !819)
!822 = !DILocation(line: 772, column: 31, scope: !819)
!823 = !DILocation(line: 772, column: 28, scope: !819)
!824 = !DILocation(line: 772, column: 7, scope: !820)
!825 = !DILocation(line: 774, column: 5, scope: !826)
!826 = distinct !DILexicalBlock(scope: !819, file: !78, line: 773, column: 4)
!827 = !DILocation(line: 778, column: 13, scope: !828)
!828 = distinct !DILexicalBlock(scope: !819, file: !78, line: 777, column: 4)
!829 = !DILocation(line: 778, column: 19, scope: !828)
!830 = !DILocation(line: 778, column: 18, scope: !828)
!831 = !DILocation(line: 778, column: 5, scope: !828)
!832 = !DILocation(line: 784, column: 3, scope: !833)
!833 = distinct !DILexicalBlock(scope: !793, file: !78, line: 783, column: 2)
!834 = !DILocation(line: 786, column: 1, scope: !777)
!835 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !78, file: !78, line: 802, type: !836, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!836 = !DISubroutineType(types: !837)
!837 = !{!17, !17, !17, !22}
!838 = !DILocalVariable(name: "value", arg: 1, scope: !835, file: !78, line: 802, type: !17)
!839 = !DILocation(line: 802, column: 35, scope: !835)
!840 = !DILocalVariable(name: "factor", arg: 2, scope: !835, file: !78, line: 802, type: !17)
!841 = !DILocation(line: 802, column: 44, scope: !835)
!842 = !DILocalVariable(name: "count", arg: 3, scope: !835, file: !78, line: 802, type: !22)
!843 = !DILocation(line: 802, column: 55, scope: !835)
!844 = !DILocalVariable(name: "u16MulTemp", scope: !835, file: !78, line: 804, type: !22)
!845 = !DILocation(line: 804, column: 6, scope: !835)
!846 = !DILocation(line: 805, column: 15, scope: !835)
!847 = !DILocation(line: 805, column: 23, scope: !835)
!848 = !DILocation(line: 805, column: 21, scope: !835)
!849 = !DILocation(line: 805, column: 13, scope: !835)
!850 = !DILocation(line: 806, column: 15, scope: !835)
!851 = !DILocation(line: 806, column: 26, scope: !835)
!852 = !DILocation(line: 806, column: 25, scope: !835)
!853 = !DILocation(line: 806, column: 13, scope: !835)
!854 = !DILocation(line: 807, column: 13, scope: !835)
!855 = !DILocation(line: 807, column: 9, scope: !835)
!856 = !DILocation(line: 807, column: 2, scope: !835)
!857 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !78, file: !78, line: 824, type: !858, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!858 = !DISubroutineType(types: !859)
!859 = !{!17, !17, !17, !17}
!860 = !DILocalVariable(name: "value", arg: 1, scope: !857, file: !78, line: 824, type: !17)
!861 = !DILocation(line: 824, column: 38, scope: !857)
!862 = !DILocalVariable(name: "factor", arg: 2, scope: !857, file: !78, line: 824, type: !17)
!863 = !DILocation(line: 824, column: 47, scope: !857)
!864 = !DILocalVariable(name: "count", arg: 3, scope: !857, file: !78, line: 824, type: !17)
!865 = !DILocation(line: 824, column: 57, scope: !857)
!866 = !DILocalVariable(name: "u16MulTemp", scope: !857, file: !78, line: 826, type: !22)
!867 = !DILocation(line: 826, column: 6, scope: !857)
!868 = !DILocation(line: 827, column: 15, scope: !857)
!869 = !DILocation(line: 827, column: 23, scope: !857)
!870 = !DILocation(line: 827, column: 21, scope: !857)
!871 = !DILocation(line: 827, column: 13, scope: !857)
!872 = !DILocation(line: 828, column: 15, scope: !857)
!873 = !DILocation(line: 828, column: 26, scope: !857)
!874 = !DILocation(line: 828, column: 25, scope: !857)
!875 = !DILocation(line: 828, column: 13, scope: !857)
!876 = !DILocation(line: 829, column: 5, scope: !877)
!877 = distinct !DILexicalBlock(scope: !857, file: !78, line: 829, column: 5)
!878 = !DILocation(line: 829, column: 16, scope: !877)
!879 = !DILocation(line: 829, column: 5, scope: !857)
!880 = !DILocation(line: 831, column: 10, scope: !881)
!881 = distinct !DILexicalBlock(scope: !877, file: !78, line: 830, column: 2)
!882 = !DILocation(line: 831, column: 21, scope: !881)
!883 = !DILocation(line: 831, column: 3, scope: !881)
!884 = !DILocation(line: 835, column: 3, scope: !885)
!885 = distinct !DILexicalBlock(scope: !877, file: !78, line: 834, column: 2)
!886 = !DILocation(line: 837, column: 1, scope: !857)
!887 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !78, file: !78, line: 854, type: !888, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!888 = !DISubroutineType(types: !889)
!889 = !{!17, !17, !17}
!890 = !DILocalVariable(name: "x_value", arg: 1, scope: !887, file: !78, line: 854, type: !17)
!891 = !DILocation(line: 854, column: 25, scope: !887)
!892 = !DILocalVariable(name: "y_value", arg: 2, scope: !887, file: !78, line: 854, type: !17)
!893 = !DILocation(line: 854, column: 36, scope: !887)
!894 = !DILocalVariable(name: "u16MulTemp", scope: !887, file: !78, line: 856, type: !22)
!895 = !DILocation(line: 856, column: 6, scope: !887)
!896 = !DILocation(line: 857, column: 15, scope: !887)
!897 = !DILocation(line: 857, column: 25, scope: !887)
!898 = !DILocation(line: 857, column: 23, scope: !887)
!899 = !DILocation(line: 857, column: 13, scope: !887)
!900 = !DILocation(line: 858, column: 15, scope: !887)
!901 = !DILocation(line: 858, column: 26, scope: !887)
!902 = !DILocation(line: 858, column: 13, scope: !887)
!903 = !DILocation(line: 859, column: 13, scope: !887)
!904 = !DILocation(line: 859, column: 9, scope: !887)
!905 = !DILocation(line: 859, column: 2, scope: !887)
!906 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !78, file: !78, line: 878, type: !888, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!907 = !DILocalVariable(name: "value", arg: 1, scope: !906, file: !78, line: 878, type: !17)
!908 = !DILocation(line: 878, column: 26, scope: !906)
!909 = !DILocalVariable(name: "factor", arg: 2, scope: !906, file: !78, line: 878, type: !17)
!910 = !DILocation(line: 878, column: 36, scope: !906)
!911 = !DILocalVariable(name: "u16MulTemp", scope: !906, file: !78, line: 880, type: !22)
!912 = !DILocation(line: 880, column: 6, scope: !906)
!913 = !DILocation(line: 881, column: 15, scope: !906)
!914 = !DILocation(line: 881, column: 23, scope: !906)
!915 = !DILocation(line: 881, column: 21, scope: !906)
!916 = !DILocation(line: 881, column: 13, scope: !906)
!917 = !DILocation(line: 882, column: 15, scope: !906)
!918 = !DILocation(line: 882, column: 26, scope: !906)
!919 = !DILocation(line: 882, column: 13, scope: !906)
!920 = !DILocation(line: 883, column: 5, scope: !921)
!921 = distinct !DILexicalBlock(scope: !906, file: !78, line: 883, column: 5)
!922 = !DILocation(line: 883, column: 16, scope: !921)
!923 = !DILocation(line: 883, column: 5, scope: !906)
!924 = !DILocation(line: 885, column: 14, scope: !925)
!925 = distinct !DILexicalBlock(scope: !921, file: !78, line: 884, column: 2)
!926 = !DILocation(line: 885, column: 10, scope: !925)
!927 = !DILocation(line: 885, column: 3, scope: !925)
!928 = !DILocation(line: 889, column: 3, scope: !929)
!929 = distinct !DILexicalBlock(scope: !921, file: !78, line: 888, column: 2)
!930 = !DILocation(line: 891, column: 1, scope: !906)
!931 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !78, file: !78, line: 907, type: !932, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!932 = !DISubroutineType(types: !933)
!933 = !{!22, !22, !22}
!934 = !DILocalVariable(name: "value", arg: 1, scope: !931, file: !78, line: 907, type: !22)
!935 = !DILocation(line: 907, column: 39, scope: !931)
!936 = !DILocalVariable(name: "factor", arg: 2, scope: !931, file: !78, line: 907, type: !22)
!937 = !DILocation(line: 907, column: 49, scope: !931)
!938 = !DILocalVariable(name: "u32MulTemp", scope: !931, file: !78, line: 909, type: !742)
!939 = !DILocation(line: 909, column: 6, scope: !931)
!940 = !DILocation(line: 910, column: 15, scope: !931)
!941 = !DILocation(line: 910, column: 23, scope: !931)
!942 = !DILocation(line: 910, column: 21, scope: !931)
!943 = !DILocation(line: 910, column: 13, scope: !931)
!944 = !DILocation(line: 911, column: 15, scope: !931)
!945 = !DILocation(line: 911, column: 26, scope: !931)
!946 = !DILocation(line: 911, column: 13, scope: !931)
!947 = !DILocation(line: 912, column: 14, scope: !931)
!948 = !DILocation(line: 912, column: 9, scope: !931)
!949 = !DILocation(line: 912, column: 2, scope: !931)
!950 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !78, file: !78, line: 931, type: !932, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!951 = !DILocalVariable(name: "value", arg: 1, scope: !950, file: !78, line: 931, type: !22)
!952 = !DILocation(line: 931, column: 43, scope: !950)
!953 = !DILocalVariable(name: "factor", arg: 2, scope: !950, file: !78, line: 931, type: !22)
!954 = !DILocation(line: 931, column: 53, scope: !950)
!955 = !DILocalVariable(name: "u32MulTemp", scope: !950, file: !78, line: 933, type: !742)
!956 = !DILocation(line: 933, column: 6, scope: !950)
!957 = !DILocation(line: 934, column: 15, scope: !950)
!958 = !DILocation(line: 934, column: 23, scope: !950)
!959 = !DILocation(line: 934, column: 21, scope: !950)
!960 = !DILocation(line: 934, column: 13, scope: !950)
!961 = !DILocation(line: 935, column: 15, scope: !950)
!962 = !DILocation(line: 935, column: 26, scope: !950)
!963 = !DILocation(line: 935, column: 13, scope: !950)
!964 = !DILocation(line: 936, column: 5, scope: !965)
!965 = distinct !DILexicalBlock(scope: !950, file: !78, line: 936, column: 5)
!966 = !DILocation(line: 936, column: 16, scope: !965)
!967 = !DILocation(line: 936, column: 5, scope: !950)
!968 = !DILocation(line: 938, column: 11, scope: !969)
!969 = distinct !DILexicalBlock(scope: !965, file: !78, line: 937, column: 2)
!970 = !DILocation(line: 938, column: 22, scope: !969)
!971 = !DILocation(line: 938, column: 10, scope: !969)
!972 = !DILocation(line: 938, column: 3, scope: !969)
!973 = !DILocation(line: 942, column: 3, scope: !974)
!974 = distinct !DILexicalBlock(scope: !965, file: !78, line: 941, column: 2)
!975 = !DILocation(line: 944, column: 1, scope: !950)
!976 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !78, file: !78, line: 962, type: !977, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!977 = !DISubroutineType(types: !978)
!978 = !{!22, !22, !17}
!979 = !DILocalVariable(name: "x_value", arg: 1, scope: !976, file: !78, line: 962, type: !22)
!980 = !DILocation(line: 962, column: 29, scope: !976)
!981 = !DILocalVariable(name: "y_value", arg: 2, scope: !976, file: !78, line: 962, type: !17)
!982 = !DILocation(line: 962, column: 41, scope: !976)
!983 = !DILocalVariable(name: "u32MulTemp", scope: !976, file: !78, line: 964, type: !742)
!984 = !DILocation(line: 964, column: 6, scope: !976)
!985 = !DILocation(line: 965, column: 15, scope: !976)
!986 = !DILocation(line: 965, column: 25, scope: !976)
!987 = !DILocation(line: 965, column: 23, scope: !976)
!988 = !DILocation(line: 965, column: 13, scope: !976)
!989 = !DILocation(line: 966, column: 16, scope: !976)
!990 = !DILocation(line: 966, column: 27, scope: !976)
!991 = !DILocation(line: 966, column: 33, scope: !976)
!992 = !DILocation(line: 966, column: 13, scope: !976)
!993 = !DILocation(line: 967, column: 9, scope: !976)
!994 = !DILocation(line: 967, column: 2, scope: !976)
!995 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !78, file: !78, line: 986, type: !977, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!996 = !DILocalVariable(name: "x_value", arg: 1, scope: !995, file: !78, line: 986, type: !22)
!997 = !DILocation(line: 986, column: 29, scope: !995)
!998 = !DILocalVariable(name: "y_value", arg: 2, scope: !995, file: !78, line: 986, type: !17)
!999 = !DILocation(line: 986, column: 41, scope: !995)
!1000 = !DILocalVariable(name: "u32MulTemp", scope: !995, file: !78, line: 988, type: !742)
!1001 = !DILocation(line: 988, column: 6, scope: !995)
!1002 = !DILocation(line: 989, column: 15, scope: !995)
!1003 = !DILocation(line: 989, column: 25, scope: !995)
!1004 = !DILocation(line: 989, column: 23, scope: !995)
!1005 = !DILocation(line: 989, column: 13, scope: !995)
!1006 = !DILocation(line: 990, column: 15, scope: !995)
!1007 = !DILocation(line: 990, column: 26, scope: !995)
!1008 = !DILocation(line: 990, column: 13, scope: !995)
!1009 = !DILocation(line: 991, column: 5, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !995, file: !78, line: 991, column: 5)
!1011 = !DILocation(line: 991, column: 16, scope: !1010)
!1012 = !DILocation(line: 991, column: 5, scope: !995)
!1013 = !DILocation(line: 993, column: 11, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1010, file: !78, line: 992, column: 2)
!1015 = !DILocation(line: 993, column: 22, scope: !1014)
!1016 = !DILocation(line: 993, column: 10, scope: !1014)
!1017 = !DILocation(line: 993, column: 3, scope: !1014)
!1018 = !DILocation(line: 997, column: 3, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1010, file: !78, line: 996, column: 2)
!1020 = !DILocation(line: 999, column: 1, scope: !995)
!1021 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !78, file: !78, line: 1015, type: !1022, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1022 = !DISubroutineType(types: !1023)
!1023 = !{!22, !22, !22, !742}
!1024 = !DILocalVariable(name: "value", arg: 1, scope: !1021, file: !78, line: 1015, type: !22)
!1025 = !DILocation(line: 1015, column: 40, scope: !1021)
!1026 = !DILocalVariable(name: "factor", arg: 2, scope: !1021, file: !78, line: 1015, type: !22)
!1027 = !DILocation(line: 1015, column: 50, scope: !1021)
!1028 = !DILocalVariable(name: "count", arg: 3, scope: !1021, file: !78, line: 1015, type: !742)
!1029 = !DILocation(line: 1015, column: 61, scope: !1021)
!1030 = !DILocalVariable(name: "u32MulTemp", scope: !1021, file: !78, line: 1017, type: !742)
!1031 = !DILocation(line: 1017, column: 6, scope: !1021)
!1032 = !DILocation(line: 1018, column: 15, scope: !1021)
!1033 = !DILocation(line: 1018, column: 23, scope: !1021)
!1034 = !DILocation(line: 1018, column: 21, scope: !1021)
!1035 = !DILocation(line: 1018, column: 13, scope: !1021)
!1036 = !DILocation(line: 1019, column: 15, scope: !1021)
!1037 = !DILocation(line: 1019, column: 26, scope: !1021)
!1038 = !DILocation(line: 1019, column: 25, scope: !1021)
!1039 = !DILocation(line: 1019, column: 13, scope: !1021)
!1040 = !DILocation(line: 1020, column: 10, scope: !1021)
!1041 = !DILocation(line: 1020, column: 21, scope: !1021)
!1042 = !DILocation(line: 1020, column: 9, scope: !1021)
!1043 = !DILocation(line: 1020, column: 2, scope: !1021)
!1044 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !78, file: !78, line: 1038, type: !1045, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1045 = !DISubroutineType(types: !1046)
!1046 = !{!22, !22, !22, !22}
!1047 = !DILocalVariable(name: "value", arg: 1, scope: !1044, file: !78, line: 1038, type: !22)
!1048 = !DILocation(line: 1038, column: 43, scope: !1044)
!1049 = !DILocalVariable(name: "factor", arg: 2, scope: !1044, file: !78, line: 1038, type: !22)
!1050 = !DILocation(line: 1038, column: 53, scope: !1044)
!1051 = !DILocalVariable(name: "count", arg: 3, scope: !1044, file: !78, line: 1038, type: !22)
!1052 = !DILocation(line: 1038, column: 64, scope: !1044)
!1053 = !DILocalVariable(name: "u32MulTemp", scope: !1044, file: !78, line: 1040, type: !742)
!1054 = !DILocation(line: 1040, column: 6, scope: !1044)
!1055 = !DILocation(line: 1041, column: 15, scope: !1044)
!1056 = !DILocation(line: 1041, column: 23, scope: !1044)
!1057 = !DILocation(line: 1041, column: 21, scope: !1044)
!1058 = !DILocation(line: 1041, column: 13, scope: !1044)
!1059 = !DILocation(line: 1042, column: 15, scope: !1044)
!1060 = !DILocation(line: 1042, column: 26, scope: !1044)
!1061 = !DILocation(line: 1042, column: 25, scope: !1044)
!1062 = !DILocation(line: 1042, column: 13, scope: !1044)
!1063 = !DILocation(line: 1043, column: 5, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1044, file: !78, line: 1043, column: 5)
!1065 = !DILocation(line: 1043, column: 16, scope: !1064)
!1066 = !DILocation(line: 1043, column: 5, scope: !1044)
!1067 = !DILocation(line: 1045, column: 11, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1064, file: !78, line: 1044, column: 2)
!1069 = !DILocation(line: 1045, column: 22, scope: !1068)
!1070 = !DILocation(line: 1045, column: 10, scope: !1068)
!1071 = !DILocation(line: 1045, column: 3, scope: !1068)
!1072 = !DILocation(line: 1049, column: 3, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1064, file: !78, line: 1048, column: 2)
!1074 = !DILocation(line: 1051, column: 1, scope: !1044)
!1075 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !78, file: !78, line: 1067, type: !932, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1076 = !DILocalVariable(name: "x_value", arg: 1, scope: !1075, file: !78, line: 1067, type: !22)
!1077 = !DILocation(line: 1067, column: 30, scope: !1075)
!1078 = !DILocalVariable(name: "y_value", arg: 2, scope: !1075, file: !78, line: 1067, type: !22)
!1079 = !DILocation(line: 1067, column: 42, scope: !1075)
!1080 = !DILocalVariable(name: "u32MulTemp", scope: !1075, file: !78, line: 1069, type: !742)
!1081 = !DILocation(line: 1069, column: 6, scope: !1075)
!1082 = !DILocation(line: 1070, column: 15, scope: !1075)
!1083 = !DILocation(line: 1070, column: 25, scope: !1075)
!1084 = !DILocation(line: 1070, column: 23, scope: !1075)
!1085 = !DILocation(line: 1070, column: 13, scope: !1075)
!1086 = !DILocation(line: 1071, column: 15, scope: !1075)
!1087 = !DILocation(line: 1071, column: 26, scope: !1075)
!1088 = !DILocation(line: 1071, column: 13, scope: !1075)
!1089 = !DILocation(line: 1072, column: 19, scope: !1075)
!1090 = !DILocation(line: 1072, column: 17, scope: !1075)
!1091 = !DILocation(line: 1072, column: 9, scope: !1075)
!1092 = !DILocation(line: 1072, column: 2, scope: !1075)
!1093 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !78, file: !78, line: 1091, type: !932, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1094 = !DILocalVariable(name: "x_value", arg: 1, scope: !1093, file: !78, line: 1091, type: !22)
!1095 = !DILocation(line: 1091, column: 30, scope: !1093)
!1096 = !DILocalVariable(name: "y_value", arg: 2, scope: !1093, file: !78, line: 1091, type: !22)
!1097 = !DILocation(line: 1091, column: 42, scope: !1093)
!1098 = !DILocalVariable(name: "u32MulTemp", scope: !1093, file: !78, line: 1093, type: !742)
!1099 = !DILocation(line: 1093, column: 6, scope: !1093)
!1100 = !DILocation(line: 1094, column: 15, scope: !1093)
!1101 = !DILocation(line: 1094, column: 25, scope: !1093)
!1102 = !DILocation(line: 1094, column: 23, scope: !1093)
!1103 = !DILocation(line: 1094, column: 13, scope: !1093)
!1104 = !DILocation(line: 1095, column: 15, scope: !1093)
!1105 = !DILocation(line: 1095, column: 26, scope: !1093)
!1106 = !DILocation(line: 1095, column: 13, scope: !1093)
!1107 = !DILocation(line: 1096, column: 5, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1093, file: !78, line: 1096, column: 5)
!1109 = !DILocation(line: 1096, column: 16, scope: !1108)
!1110 = !DILocation(line: 1096, column: 5, scope: !1093)
!1111 = !DILocation(line: 1098, column: 11, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1108, file: !78, line: 1097, column: 2)
!1113 = !DILocation(line: 1098, column: 22, scope: !1112)
!1114 = !DILocation(line: 1098, column: 10, scope: !1112)
!1115 = !DILocation(line: 1098, column: 3, scope: !1112)
!1116 = !DILocation(line: 1102, column: 3, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1108, file: !78, line: 1101, column: 2)
!1118 = !DILocation(line: 1104, column: 1, scope: !1093)
!1119 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !78, file: !78, line: 1119, type: !1120, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!742, !742, !22}
!1122 = !DILocalVariable(name: "x_value", arg: 1, scope: !1119, file: !78, line: 1119, type: !742)
!1123 = !DILocation(line: 1119, column: 26, scope: !1119)
!1124 = !DILocalVariable(name: "y_value", arg: 2, scope: !1119, file: !78, line: 1119, type: !22)
!1125 = !DILocation(line: 1119, column: 39, scope: !1119)
!1126 = !DILocalVariable(name: "u32Temp1", scope: !1119, file: !78, line: 1122, type: !742)
!1127 = !DILocation(line: 1122, column: 6, scope: !1119)
!1128 = !DILocation(line: 1123, column: 5, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1119, file: !78, line: 1123, column: 5)
!1130 = !DILocation(line: 1123, column: 13, scope: !1129)
!1131 = !DILocation(line: 1123, column: 5, scope: !1119)
!1132 = !DILocation(line: 1125, column: 26, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1129, file: !78, line: 1124, column: 2)
!1134 = !DILocation(line: 1125, column: 25, scope: !1133)
!1135 = !DILocation(line: 1125, column: 12, scope: !1133)
!1136 = !DILocation(line: 1126, column: 6, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1133, file: !78, line: 1126, column: 6)
!1138 = !DILocation(line: 1126, column: 17, scope: !1137)
!1139 = !DILocation(line: 1126, column: 15, scope: !1137)
!1140 = !DILocation(line: 1126, column: 6, scope: !1133)
!1141 = !DILocation(line: 1128, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1137, file: !78, line: 1127, column: 3)
!1143 = !DILocation(line: 1132, column: 12, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1137, file: !78, line: 1131, column: 3)
!1145 = !DILocation(line: 1132, column: 22, scope: !1144)
!1146 = !DILocation(line: 1132, column: 20, scope: !1144)
!1147 = !DILocation(line: 1132, column: 4, scope: !1144)
!1148 = !DILocation(line: 1137, column: 3, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1129, file: !78, line: 1136, column: 2)
!1150 = !DILocation(line: 1140, column: 2, scope: !1119)
!1151 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !78, file: !78, line: 1157, type: !1152, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!742, !742, !22, !742}
!1154 = !DILocalVariable(name: "value", arg: 1, scope: !1151, file: !78, line: 1157, type: !742)
!1155 = !DILocation(line: 1157, column: 40, scope: !1151)
!1156 = !DILocalVariable(name: "factor", arg: 2, scope: !1151, file: !78, line: 1157, type: !22)
!1157 = !DILocation(line: 1157, column: 50, scope: !1151)
!1158 = !DILocalVariable(name: "count", arg: 3, scope: !1151, file: !78, line: 1157, type: !742)
!1159 = !DILocation(line: 1157, column: 62, scope: !1151)
!1160 = !DILocalVariable(name: "u32Temp1", scope: !1151, file: !78, line: 1159, type: !742)
!1161 = !DILocation(line: 1159, column: 6, scope: !1151)
!1162 = !DILocalVariable(name: "u32Temp2", scope: !1151, file: !78, line: 1159, type: !742)
!1163 = !DILocation(line: 1159, column: 20, scope: !1151)
!1164 = !DILocation(line: 1160, column: 13, scope: !1151)
!1165 = !DILocation(line: 1160, column: 21, scope: !1151)
!1166 = !DILocation(line: 1160, column: 19, scope: !1151)
!1167 = !DILocation(line: 1160, column: 11, scope: !1151)
!1168 = !DILocation(line: 1161, column: 25, scope: !1151)
!1169 = !DILocation(line: 1161, column: 32, scope: !1151)
!1170 = !DILocation(line: 1161, column: 13, scope: !1151)
!1171 = !DILocation(line: 1161, column: 11, scope: !1151)
!1172 = !DILocation(line: 1162, column: 13, scope: !1151)
!1173 = !DILocation(line: 1162, column: 25, scope: !1151)
!1174 = !DILocation(line: 1162, column: 22, scope: !1151)
!1175 = !DILocation(line: 1162, column: 11, scope: !1151)
!1176 = !DILocation(line: 1163, column: 14, scope: !1151)
!1177 = !DILocation(line: 1163, column: 30, scope: !1151)
!1178 = !DILocation(line: 1163, column: 29, scope: !1151)
!1179 = !DILocation(line: 1163, column: 23, scope: !1151)
!1180 = !DILocation(line: 1163, column: 11, scope: !1151)
!1181 = !DILocation(line: 1164, column: 6, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1151, file: !78, line: 1164, column: 5)
!1183 = !DILocation(line: 1164, column: 16, scope: !1182)
!1184 = !DILocation(line: 1164, column: 14, scope: !1182)
!1185 = !DILocation(line: 1164, column: 23, scope: !1182)
!1186 = !DILocation(line: 1164, column: 5, scope: !1151)
!1187 = !DILocation(line: 1166, column: 10, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1182, file: !78, line: 1165, column: 2)
!1189 = !DILocation(line: 1166, column: 3, scope: !1188)
!1190 = !DILocation(line: 1170, column: 3, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1182, file: !78, line: 1169, column: 2)
!1192 = !DILocation(line: 1172, column: 1, scope: !1151)
!1193 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !78, file: !78, line: 1188, type: !1194, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!17, !17, !17, !6}
!1196 = !DILocalVariable(name: "val1", arg: 1, scope: !1193, file: !78, line: 1188, type: !17)
!1197 = !DILocation(line: 1188, column: 25, scope: !1193)
!1198 = !DILocalVariable(name: "val2", arg: 2, scope: !1193, file: !78, line: 1188, type: !17)
!1199 = !DILocation(line: 1188, column: 34, scope: !1193)
!1200 = !DILocalVariable(name: "factor", arg: 3, scope: !1193, file: !78, line: 1188, type: !6)
!1201 = !DILocation(line: 1188, column: 43, scope: !1193)
!1202 = !DILocalVariable(name: "s16Temp1", scope: !1193, file: !78, line: 1190, type: !13)
!1203 = !DILocation(line: 1190, column: 6, scope: !1193)
!1204 = !DILocation(line: 1191, column: 15, scope: !1193)
!1205 = !DILocation(line: 1191, column: 22, scope: !1193)
!1206 = !DILocation(line: 1191, column: 20, scope: !1193)
!1207 = !DILocation(line: 1191, column: 28, scope: !1193)
!1208 = !DILocation(line: 1191, column: 27, scope: !1193)
!1209 = !DILocation(line: 1191, column: 35, scope: !1193)
!1210 = !DILocation(line: 1191, column: 39, scope: !1193)
!1211 = !DILocation(line: 1191, column: 38, scope: !1193)
!1212 = !DILocation(line: 1191, column: 13, scope: !1193)
!1213 = !DILocation(line: 1191, column: 11, scope: !1193)
!1214 = !DILocation(line: 1192, column: 5, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1193, file: !78, line: 1192, column: 5)
!1216 = !DILocation(line: 1192, column: 14, scope: !1215)
!1217 = !DILocation(line: 1192, column: 5, scope: !1193)
!1218 = !DILocation(line: 1194, column: 6, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !78, line: 1194, column: 6)
!1220 = distinct !DILexicalBlock(scope: !1215, file: !78, line: 1193, column: 2)
!1221 = !DILocation(line: 1194, column: 15, scope: !1219)
!1222 = !DILocation(line: 1194, column: 6, scope: !1220)
!1223 = !DILocation(line: 1196, column: 15, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !78, line: 1195, column: 3)
!1225 = !DILocation(line: 1196, column: 11, scope: !1224)
!1226 = !DILocation(line: 1196, column: 4, scope: !1224)
!1227 = !DILocation(line: 1200, column: 4, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1219, file: !78, line: 1199, column: 3)
!1229 = !DILocation(line: 1205, column: 3, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1215, file: !78, line: 1204, column: 2)
!1231 = !DILocation(line: 1208, column: 1, scope: !1193)
!1232 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !78, file: !78, line: 1224, type: !1233, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!22, !22, !22, !6}
!1235 = !DILocalVariable(name: "val1", arg: 1, scope: !1232, file: !78, line: 1224, type: !22)
!1236 = !DILocation(line: 1224, column: 30, scope: !1232)
!1237 = !DILocalVariable(name: "val2", arg: 2, scope: !1232, file: !78, line: 1224, type: !22)
!1238 = !DILocation(line: 1224, column: 40, scope: !1232)
!1239 = !DILocalVariable(name: "factor", arg: 3, scope: !1232, file: !78, line: 1224, type: !6)
!1240 = !DILocation(line: 1224, column: 49, scope: !1232)
!1241 = !DILocalVariable(name: "s32Temp1", scope: !1232, file: !78, line: 1226, type: !86)
!1242 = !DILocation(line: 1226, column: 6, scope: !1232)
!1243 = !DILocation(line: 1227, column: 15, scope: !1232)
!1244 = !DILocation(line: 1227, column: 22, scope: !1232)
!1245 = !DILocation(line: 1227, column: 20, scope: !1232)
!1246 = !DILocation(line: 1227, column: 28, scope: !1232)
!1247 = !DILocation(line: 1227, column: 27, scope: !1232)
!1248 = !DILocation(line: 1227, column: 35, scope: !1232)
!1249 = !DILocation(line: 1227, column: 39, scope: !1232)
!1250 = !DILocation(line: 1227, column: 38, scope: !1232)
!1251 = !DILocation(line: 1227, column: 11, scope: !1232)
!1252 = !DILocation(line: 1228, column: 5, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1232, file: !78, line: 1228, column: 5)
!1254 = !DILocation(line: 1228, column: 14, scope: !1253)
!1255 = !DILocation(line: 1228, column: 5, scope: !1232)
!1256 = !DILocation(line: 1230, column: 6, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1258, file: !78, line: 1230, column: 6)
!1258 = distinct !DILexicalBlock(scope: !1253, file: !78, line: 1229, column: 2)
!1259 = !DILocation(line: 1230, column: 15, scope: !1257)
!1260 = !DILocation(line: 1230, column: 6, scope: !1258)
!1261 = !DILocation(line: 1232, column: 16, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1257, file: !78, line: 1231, column: 3)
!1263 = !DILocation(line: 1232, column: 11, scope: !1262)
!1264 = !DILocation(line: 1232, column: 4, scope: !1262)
!1265 = !DILocation(line: 1236, column: 4, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1257, file: !78, line: 1235, column: 3)
!1267 = !DILocation(line: 1242, column: 3, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1253, file: !78, line: 1241, column: 2)
!1269 = !DILocation(line: 1244, column: 1, scope: !1232)
!1270 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !78, file: !78, line: 1259, type: !932, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1271 = !DILocalVariable(name: "val1", arg: 1, scope: !1270, file: !78, line: 1259, type: !22)
!1272 = !DILocation(line: 1259, column: 26, scope: !1270)
!1273 = !DILocalVariable(name: "val2", arg: 2, scope: !1270, file: !78, line: 1259, type: !22)
!1274 = !DILocation(line: 1259, column: 36, scope: !1270)
!1275 = !DILocalVariable(name: "u32Temp1", scope: !1270, file: !78, line: 1261, type: !742)
!1276 = !DILocation(line: 1261, column: 6, scope: !1270)
!1277 = !DILocation(line: 1262, column: 13, scope: !1270)
!1278 = !DILocation(line: 1262, column: 20, scope: !1270)
!1279 = !DILocation(line: 1262, column: 18, scope: !1270)
!1280 = !DILocation(line: 1262, column: 11, scope: !1270)
!1281 = !DILocation(line: 1263, column: 5, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1270, file: !78, line: 1263, column: 5)
!1283 = !DILocation(line: 1263, column: 14, scope: !1282)
!1284 = !DILocation(line: 1263, column: 5, scope: !1270)
!1285 = !DILocation(line: 1265, column: 11, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1282, file: !78, line: 1264, column: 2)
!1287 = !DILocation(line: 1265, column: 20, scope: !1286)
!1288 = !DILocation(line: 1265, column: 10, scope: !1286)
!1289 = !DILocation(line: 1265, column: 3, scope: !1286)
!1290 = !DILocation(line: 1269, column: 3, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1282, file: !78, line: 1268, column: 2)
!1292 = !DILocation(line: 1271, column: 1, scope: !1270)
!1293 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !78, file: !78, line: 1285, type: !1294, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1294 = !DISubroutineType(types: !1295)
!1295 = !{!742, !22, !22}
!1296 = !DILocalVariable(name: "x_value", arg: 1, scope: !1293, file: !78, line: 1285, type: !22)
!1297 = !DILocation(line: 1285, column: 25, scope: !1293)
!1298 = !DILocalVariable(name: "y_value", arg: 2, scope: !1293, file: !78, line: 1285, type: !22)
!1299 = !DILocation(line: 1285, column: 38, scope: !1293)
!1300 = !DILocalVariable(name: "u32Temp1", scope: !1293, file: !78, line: 1287, type: !742)
!1301 = !DILocation(line: 1287, column: 6, scope: !1293)
!1302 = !DILocation(line: 1288, column: 13, scope: !1293)
!1303 = !DILocation(line: 1288, column: 23, scope: !1293)
!1304 = !DILocation(line: 1288, column: 21, scope: !1293)
!1305 = !DILocation(line: 1288, column: 11, scope: !1293)
!1306 = !DILocation(line: 1289, column: 9, scope: !1293)
!1307 = !DILocation(line: 1289, column: 2, scope: !1293)
!1308 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !78, file: !78, line: 1307, type: !1309, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1309 = !DISubroutineType(types: !1310)
!1310 = !{!86, !13, !13}
!1311 = !DILocalVariable(name: "x_value", arg: 1, scope: !1308, file: !78, line: 1307, type: !13)
!1312 = !DILocation(line: 1307, column: 25, scope: !1308)
!1313 = !DILocalVariable(name: "y_value", arg: 2, scope: !1308, file: !78, line: 1307, type: !13)
!1314 = !DILocation(line: 1307, column: 38, scope: !1308)
!1315 = !DILocalVariable(name: "s32Temp1", scope: !1308, file: !78, line: 1309, type: !86)
!1316 = !DILocation(line: 1309, column: 6, scope: !1308)
!1317 = !DILocation(line: 1310, column: 13, scope: !1308)
!1318 = !DILocation(line: 1310, column: 23, scope: !1308)
!1319 = !DILocation(line: 1310, column: 21, scope: !1308)
!1320 = !DILocation(line: 1310, column: 11, scope: !1308)
!1321 = !DILocation(line: 1311, column: 9, scope: !1308)
!1322 = !DILocation(line: 1311, column: 2, scope: !1308)
!1323 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !78, file: !78, line: 1328, type: !1324, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1324 = !DISubroutineType(types: !1325)
!1325 = !{!742, !742, !86}
!1326 = !DILocalVariable(name: "val1", arg: 1, scope: !1323, file: !78, line: 1328, type: !742)
!1327 = !DILocation(line: 1328, column: 25, scope: !1323)
!1328 = !DILocalVariable(name: "val2", arg: 2, scope: !1323, file: !78, line: 1328, type: !86)
!1329 = !DILocation(line: 1328, column: 35, scope: !1323)
!1330 = !DILocalVariable(name: "s32Temp1", scope: !1323, file: !78, line: 1330, type: !86)
!1331 = !DILocation(line: 1330, column: 6, scope: !1323)
!1332 = !DILocation(line: 1331, column: 5, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1323, file: !78, line: 1331, column: 5)
!1334 = !DILocation(line: 1331, column: 10, scope: !1333)
!1335 = !DILocation(line: 1331, column: 5, scope: !1323)
!1336 = !DILocation(line: 1333, column: 25, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1333, file: !78, line: 1332, column: 2)
!1338 = !DILocation(line: 1333, column: 24, scope: !1337)
!1339 = !DILocation(line: 1333, column: 12, scope: !1337)
!1340 = !DILocation(line: 1334, column: 6, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1337, file: !78, line: 1334, column: 6)
!1342 = !DILocation(line: 1334, column: 17, scope: !1341)
!1343 = !DILocation(line: 1334, column: 15, scope: !1341)
!1344 = !DILocation(line: 1334, column: 6, scope: !1337)
!1345 = !DILocation(line: 1336, column: 4, scope: !1346)
!1346 = distinct !DILexicalBlock(scope: !1341, file: !78, line: 1335, column: 3)
!1347 = !DILocation(line: 1340, column: 12, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1341, file: !78, line: 1339, column: 3)
!1349 = !DILocation(line: 1340, column: 19, scope: !1348)
!1350 = !DILocation(line: 1340, column: 17, scope: !1348)
!1351 = !DILocation(line: 1340, column: 4, scope: !1348)
!1352 = !DILocation(line: 1345, column: 3, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1333, file: !78, line: 1344, column: 2)
!1354 = !DILocation(line: 1347, column: 1, scope: !1323)
!1355 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !78, file: !78, line: 1362, type: !1356, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1356 = !DISubroutineType(types: !1357)
!1357 = !{!742, !86, !86}
!1358 = !DILocalVariable(name: "val1", arg: 1, scope: !1355, file: !78, line: 1362, type: !86)
!1359 = !DILocation(line: 1362, column: 25, scope: !1355)
!1360 = !DILocalVariable(name: "val2", arg: 2, scope: !1355, file: !78, line: 1362, type: !86)
!1361 = !DILocation(line: 1362, column: 35, scope: !1355)
!1362 = !DILocalVariable(name: "u32Temp1", scope: !1355, file: !78, line: 1364, type: !742)
!1363 = !DILocation(line: 1364, column: 6, scope: !1355)
!1364 = !DILocalVariable(name: "u32Temp2", scope: !1355, file: !78, line: 1364, type: !742)
!1365 = !DILocation(line: 1364, column: 17, scope: !1355)
!1366 = !DILocalVariable(name: "u32Temp3", scope: !1355, file: !78, line: 1364, type: !742)
!1367 = !DILocation(line: 1364, column: 27, scope: !1355)
!1368 = !DILocalVariable(name: "u8SignBit", scope: !1355, file: !78, line: 1365, type: !17)
!1369 = !DILocation(line: 1365, column: 5, scope: !1355)
!1370 = !DILocation(line: 1367, column: 5, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1355, file: !78, line: 1367, column: 5)
!1372 = !DILocation(line: 1367, column: 9, scope: !1371)
!1373 = !DILocation(line: 1367, column: 5, scope: !1355)
!1374 = !DILocation(line: 1368, column: 15, scope: !1371)
!1375 = !DILocation(line: 1368, column: 14, scope: !1371)
!1376 = !DILocation(line: 1368, column: 12, scope: !1371)
!1377 = !DILocation(line: 1368, column: 3, scope: !1371)
!1378 = !DILocation(line: 1370, column: 14, scope: !1371)
!1379 = !DILocation(line: 1370, column: 12, scope: !1371)
!1380 = !DILocation(line: 1372, column: 5, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1355, file: !78, line: 1372, column: 5)
!1382 = !DILocation(line: 1372, column: 9, scope: !1381)
!1383 = !DILocation(line: 1372, column: 5, scope: !1355)
!1384 = !DILocation(line: 1373, column: 15, scope: !1381)
!1385 = !DILocation(line: 1373, column: 14, scope: !1381)
!1386 = !DILocation(line: 1373, column: 12, scope: !1381)
!1387 = !DILocation(line: 1373, column: 3, scope: !1381)
!1388 = !DILocation(line: 1375, column: 14, scope: !1381)
!1389 = !DILocation(line: 1375, column: 12, scope: !1381)
!1390 = !DILocation(line: 1377, column: 6, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1355, file: !78, line: 1377, column: 5)
!1392 = !DILocation(line: 1377, column: 10, scope: !1391)
!1393 = !DILocation(line: 1377, column: 13, scope: !1391)
!1394 = !DILocation(line: 1377, column: 28, scope: !1391)
!1395 = !DILocation(line: 1377, column: 32, scope: !1391)
!1396 = !DILocation(line: 1377, column: 35, scope: !1391)
!1397 = !DILocation(line: 1378, column: 12, scope: !1391)
!1398 = !DILocation(line: 1378, column: 3, scope: !1391)
!1399 = !DILocation(line: 1380, column: 12, scope: !1391)
!1400 = !DILocation(line: 1381, column: 29, scope: !1355)
!1401 = !DILocation(line: 1381, column: 38, scope: !1355)
!1402 = !DILocation(line: 1381, column: 13, scope: !1355)
!1403 = !DILocation(line: 1381, column: 11, scope: !1355)
!1404 = !DILocation(line: 1383, column: 5, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1355, file: !78, line: 1383, column: 5)
!1406 = !DILocation(line: 1383, column: 14, scope: !1405)
!1407 = !DILocation(line: 1383, column: 5, scope: !1355)
!1408 = !DILocation(line: 1385, column: 3, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1405, file: !78, line: 1384, column: 2)
!1410 = !DILocation(line: 1389, column: 10, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1405, file: !78, line: 1388, column: 2)
!1412 = !DILocation(line: 1389, column: 3, scope: !1411)
!1413 = !DILocation(line: 1440, column: 1, scope: !1355)
!1414 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !78, file: !78, line: 1455, type: !1415, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!742, !742, !742}
!1417 = !DILocalVariable(name: "val1", arg: 1, scope: !1414, file: !78, line: 1455, type: !742)
!1418 = !DILocation(line: 1455, column: 25, scope: !1414)
!1419 = !DILocalVariable(name: "val2", arg: 2, scope: !1414, file: !78, line: 1455, type: !742)
!1420 = !DILocation(line: 1455, column: 35, scope: !1414)
!1421 = !DILocalVariable(name: "u32Temp1", scope: !1414, file: !78, line: 1457, type: !742)
!1422 = !DILocation(line: 1457, column: 6, scope: !1414)
!1423 = !DILocation(line: 1458, column: 5, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1414, file: !78, line: 1458, column: 5)
!1425 = !DILocation(line: 1458, column: 10, scope: !1424)
!1426 = !DILocation(line: 1458, column: 5, scope: !1414)
!1427 = !DILocation(line: 1460, column: 26, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !78, line: 1459, column: 2)
!1429 = !DILocation(line: 1460, column: 25, scope: !1428)
!1430 = !DILocation(line: 1460, column: 12, scope: !1428)
!1431 = !DILocation(line: 1461, column: 6, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1428, file: !78, line: 1461, column: 6)
!1433 = !DILocation(line: 1461, column: 17, scope: !1432)
!1434 = !DILocation(line: 1461, column: 15, scope: !1432)
!1435 = !DILocation(line: 1461, column: 6, scope: !1428)
!1436 = !DILocation(line: 1463, column: 4, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1432, file: !78, line: 1462, column: 3)
!1438 = !DILocation(line: 1467, column: 12, scope: !1439)
!1439 = distinct !DILexicalBlock(scope: !1432, file: !78, line: 1466, column: 3)
!1440 = !DILocation(line: 1467, column: 19, scope: !1439)
!1441 = !DILocation(line: 1467, column: 17, scope: !1439)
!1442 = !DILocation(line: 1467, column: 4, scope: !1439)
!1443 = !DILocation(line: 1472, column: 3, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1424, file: !78, line: 1471, column: 2)
!1445 = !DILocation(line: 1474, column: 1, scope: !1414)
!1446 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !78, file: !78, line: 1501, type: !1120, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1447 = !DILocalVariable(name: "value", arg: 1, scope: !1446, file: !78, line: 1501, type: !742)
!1448 = !DILocation(line: 1501, column: 30, scope: !1446)
!1449 = !DILocalVariable(name: "factor", arg: 2, scope: !1446, file: !78, line: 1501, type: !22)
!1450 = !DILocation(line: 1501, column: 41, scope: !1446)
!1451 = !DILocalVariable(name: "u32Temp1", scope: !1446, file: !78, line: 1503, type: !742)
!1452 = !DILocation(line: 1503, column: 6, scope: !1446)
!1453 = !DILocalVariable(name: "u32Temp2", scope: !1446, file: !78, line: 1503, type: !742)
!1454 = !DILocation(line: 1503, column: 20, scope: !1446)
!1455 = !DILocation(line: 1504, column: 13, scope: !1446)
!1456 = !DILocation(line: 1504, column: 21, scope: !1446)
!1457 = !DILocation(line: 1504, column: 19, scope: !1446)
!1458 = !DILocation(line: 1504, column: 11, scope: !1446)
!1459 = !DILocation(line: 1505, column: 25, scope: !1446)
!1460 = !DILocation(line: 1505, column: 32, scope: !1446)
!1461 = !DILocation(line: 1505, column: 13, scope: !1446)
!1462 = !DILocation(line: 1505, column: 11, scope: !1446)
!1463 = !DILocation(line: 1506, column: 14, scope: !1446)
!1464 = !DILocation(line: 1506, column: 23, scope: !1446)
!1465 = !DILocation(line: 1506, column: 11, scope: !1446)
!1466 = !DILocation(line: 1507, column: 14, scope: !1446)
!1467 = !DILocation(line: 1507, column: 23, scope: !1446)
!1468 = !DILocation(line: 1507, column: 11, scope: !1446)
!1469 = !DILocation(line: 1508, column: 9, scope: !1446)
!1470 = !DILocation(line: 1508, column: 2, scope: !1446)
!1471 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !78, file: !78, line: 1527, type: !1120, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1472 = !DILocalVariable(name: "value", arg: 1, scope: !1471, file: !78, line: 1527, type: !742)
!1473 = !DILocation(line: 1527, column: 30, scope: !1471)
!1474 = !DILocalVariable(name: "factor", arg: 2, scope: !1471, file: !78, line: 1527, type: !22)
!1475 = !DILocation(line: 1527, column: 41, scope: !1471)
!1476 = !DILocalVariable(name: "u32Temp1", scope: !1471, file: !78, line: 1529, type: !742)
!1477 = !DILocation(line: 1529, column: 6, scope: !1471)
!1478 = !DILocalVariable(name: "u32Temp2", scope: !1471, file: !78, line: 1529, type: !742)
!1479 = !DILocation(line: 1529, column: 20, scope: !1471)
!1480 = !DILocation(line: 1530, column: 13, scope: !1471)
!1481 = !DILocation(line: 1530, column: 21, scope: !1471)
!1482 = !DILocation(line: 1530, column: 19, scope: !1471)
!1483 = !DILocation(line: 1530, column: 11, scope: !1471)
!1484 = !DILocation(line: 1531, column: 25, scope: !1471)
!1485 = !DILocation(line: 1531, column: 32, scope: !1471)
!1486 = !DILocation(line: 1531, column: 13, scope: !1471)
!1487 = !DILocation(line: 1531, column: 11, scope: !1471)
!1488 = !DILocation(line: 1532, column: 13, scope: !1471)
!1489 = !DILocation(line: 1532, column: 22, scope: !1471)
!1490 = !DILocation(line: 1532, column: 11, scope: !1471)
!1491 = !DILocation(line: 1533, column: 14, scope: !1471)
!1492 = !DILocation(line: 1533, column: 23, scope: !1471)
!1493 = !DILocation(line: 1533, column: 11, scope: !1471)
!1494 = !DILocation(line: 1534, column: 6, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1471, file: !78, line: 1534, column: 5)
!1496 = !DILocation(line: 1534, column: 14, scope: !1495)
!1497 = !DILocation(line: 1534, column: 20, scope: !1495)
!1498 = !DILocation(line: 1534, column: 5, scope: !1471)
!1499 = !DILocation(line: 1536, column: 10, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1495, file: !78, line: 1535, column: 2)
!1501 = !DILocation(line: 1536, column: 3, scope: !1500)
!1502 = !DILocation(line: 1540, column: 3, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1495, file: !78, line: 1539, column: 2)
!1504 = !DILocation(line: 1542, column: 1, scope: !1471)
!1505 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !78, file: !78, line: 1560, type: !1506, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1506 = !DISubroutineType(types: !1507)
!1507 = !{!742, !742, !13}
!1508 = !DILocalVariable(name: "value", arg: 1, scope: !1505, file: !78, line: 1560, type: !742)
!1509 = !DILocation(line: 1560, column: 30, scope: !1505)
!1510 = !DILocalVariable(name: "factor", arg: 2, scope: !1505, file: !78, line: 1560, type: !13)
!1511 = !DILocation(line: 1560, column: 41, scope: !1505)
!1512 = !DILocalVariable(name: "u32Temp1", scope: !1505, file: !78, line: 1562, type: !742)
!1513 = !DILocation(line: 1562, column: 6, scope: !1505)
!1514 = !DILocalVariable(name: "u32Temp2", scope: !1505, file: !78, line: 1562, type: !742)
!1515 = !DILocation(line: 1562, column: 20, scope: !1505)
!1516 = !DILocation(line: 1563, column: 5, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1505, file: !78, line: 1563, column: 5)
!1518 = !DILocation(line: 1563, column: 12, scope: !1517)
!1519 = !DILocation(line: 1563, column: 5, scope: !1505)
!1520 = !DILocation(line: 1566, column: 14, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1517, file: !78, line: 1564, column: 2)
!1522 = !DILocation(line: 1566, column: 22, scope: !1521)
!1523 = !DILocation(line: 1566, column: 20, scope: !1521)
!1524 = !DILocation(line: 1566, column: 12, scope: !1521)
!1525 = !DILocation(line: 1567, column: 26, scope: !1521)
!1526 = !DILocation(line: 1567, column: 33, scope: !1521)
!1527 = !DILocation(line: 1567, column: 14, scope: !1521)
!1528 = !DILocation(line: 1567, column: 12, scope: !1521)
!1529 = !DILocation(line: 1568, column: 14, scope: !1521)
!1530 = !DILocation(line: 1568, column: 23, scope: !1521)
!1531 = !DILocation(line: 1568, column: 12, scope: !1521)
!1532 = !DILocation(line: 1569, column: 15, scope: !1521)
!1533 = !DILocation(line: 1569, column: 24, scope: !1521)
!1534 = !DILocation(line: 1569, column: 12, scope: !1521)
!1535 = !DILocation(line: 1570, column: 10, scope: !1521)
!1536 = !DILocation(line: 1570, column: 3, scope: !1521)
!1537 = !DILocation(line: 1574, column: 3, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1517, file: !78, line: 1573, column: 2)
!1539 = !DILocation(line: 1576, column: 1, scope: !1505)
!1540 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !78, file: !78, line: 1595, type: !1506, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1541 = !DILocalVariable(name: "value", arg: 1, scope: !1540, file: !78, line: 1595, type: !742)
!1542 = !DILocation(line: 1595, column: 31, scope: !1540)
!1543 = !DILocalVariable(name: "factor", arg: 2, scope: !1540, file: !78, line: 1595, type: !13)
!1544 = !DILocation(line: 1595, column: 42, scope: !1540)
!1545 = !DILocalVariable(name: "u32Temp1", scope: !1540, file: !78, line: 1597, type: !742)
!1546 = !DILocation(line: 1597, column: 6, scope: !1540)
!1547 = !DILocalVariable(name: "u32Temp2", scope: !1540, file: !78, line: 1597, type: !742)
!1548 = !DILocation(line: 1597, column: 20, scope: !1540)
!1549 = !DILocation(line: 1598, column: 5, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1540, file: !78, line: 1598, column: 5)
!1551 = !DILocation(line: 1598, column: 12, scope: !1550)
!1552 = !DILocation(line: 1598, column: 5, scope: !1540)
!1553 = !DILocation(line: 1600, column: 3, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1550, file: !78, line: 1599, column: 2)
!1555 = !DILocation(line: 1604, column: 14, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1550, file: !78, line: 1603, column: 2)
!1557 = !DILocation(line: 1604, column: 22, scope: !1556)
!1558 = !DILocation(line: 1604, column: 20, scope: !1556)
!1559 = !DILocation(line: 1604, column: 12, scope: !1556)
!1560 = !DILocation(line: 1605, column: 26, scope: !1556)
!1561 = !DILocation(line: 1605, column: 33, scope: !1556)
!1562 = !DILocation(line: 1605, column: 14, scope: !1556)
!1563 = !DILocation(line: 1605, column: 12, scope: !1556)
!1564 = !DILocation(line: 1606, column: 14, scope: !1556)
!1565 = !DILocation(line: 1606, column: 23, scope: !1556)
!1566 = !DILocation(line: 1606, column: 12, scope: !1556)
!1567 = !DILocation(line: 1607, column: 15, scope: !1556)
!1568 = !DILocation(line: 1607, column: 24, scope: !1556)
!1569 = !DILocation(line: 1607, column: 12, scope: !1556)
!1570 = !DILocation(line: 1608, column: 7, scope: !1571)
!1571 = distinct !DILexicalBlock(scope: !1556, file: !78, line: 1608, column: 6)
!1572 = !DILocation(line: 1608, column: 16, scope: !1571)
!1573 = !DILocation(line: 1608, column: 23, scope: !1571)
!1574 = !DILocation(line: 1608, column: 6, scope: !1556)
!1575 = !DILocation(line: 1610, column: 11, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1571, file: !78, line: 1609, column: 3)
!1577 = !DILocation(line: 1610, column: 4, scope: !1576)
!1578 = !DILocation(line: 1614, column: 4, scope: !1579)
!1579 = distinct !DILexicalBlock(scope: !1571, file: !78, line: 1613, column: 3)
!1580 = !DILocation(line: 1617, column: 1, scope: !1540)
!1581 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !78, file: !78, line: 1632, type: !1415, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1582 = !DILocalVariable(name: "value", arg: 1, scope: !1581, file: !78, line: 1632, type: !742)
!1583 = !DILocation(line: 1632, column: 30, scope: !1581)
!1584 = !DILocalVariable(name: "factor", arg: 2, scope: !1581, file: !78, line: 1632, type: !742)
!1585 = !DILocation(line: 1632, column: 40, scope: !1581)
!1586 = !DILocation(line: 1634, column: 21, scope: !1581)
!1587 = !DILocation(line: 1634, column: 28, scope: !1581)
!1588 = !DILocation(line: 1634, column: 9, scope: !1581)
!1589 = !DILocation(line: 1634, column: 2, scope: !1581)
!1590 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !78, file: !78, line: 1653, type: !1415, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1591 = !DILocalVariable(name: "value", arg: 1, scope: !1590, file: !78, line: 1653, type: !742)
!1592 = !DILocation(line: 1653, column: 30, scope: !1590)
!1593 = !DILocalVariable(name: "factor", arg: 2, scope: !1590, file: !78, line: 1653, type: !742)
!1594 = !DILocation(line: 1653, column: 40, scope: !1590)
!1595 = !DILocalVariable(name: "u32Temp1", scope: !1590, file: !78, line: 1655, type: !742)
!1596 = !DILocation(line: 1655, column: 6, scope: !1590)
!1597 = !DILocalVariable(name: "u32Temp2", scope: !1590, file: !78, line: 1655, type: !742)
!1598 = !DILocation(line: 1655, column: 20, scope: !1590)
!1599 = !DILocation(line: 1656, column: 13, scope: !1590)
!1600 = !DILocation(line: 1656, column: 21, scope: !1590)
!1601 = !DILocation(line: 1656, column: 19, scope: !1590)
!1602 = !DILocation(line: 1656, column: 11, scope: !1590)
!1603 = !DILocation(line: 1657, column: 25, scope: !1590)
!1604 = !DILocation(line: 1657, column: 32, scope: !1590)
!1605 = !DILocation(line: 1657, column: 13, scope: !1590)
!1606 = !DILocation(line: 1657, column: 11, scope: !1590)
!1607 = !DILocation(line: 1658, column: 13, scope: !1590)
!1608 = !DILocation(line: 1658, column: 22, scope: !1590)
!1609 = !DILocation(line: 1658, column: 11, scope: !1590)
!1610 = !DILocation(line: 1659, column: 14, scope: !1590)
!1611 = !DILocation(line: 1659, column: 23, scope: !1590)
!1612 = !DILocation(line: 1659, column: 11, scope: !1590)
!1613 = !DILocation(line: 1660, column: 6, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1590, file: !78, line: 1660, column: 5)
!1615 = !DILocation(line: 1660, column: 14, scope: !1614)
!1616 = !DILocation(line: 1660, column: 20, scope: !1614)
!1617 = !DILocation(line: 1660, column: 5, scope: !1590)
!1618 = !DILocation(line: 1662, column: 10, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1614, file: !78, line: 1661, column: 2)
!1620 = !DILocation(line: 1662, column: 3, scope: !1619)
!1621 = !DILocation(line: 1666, column: 3, scope: !1622)
!1622 = distinct !DILexicalBlock(scope: !1614, file: !78, line: 1665, column: 2)
!1623 = !DILocation(line: 1668, column: 1, scope: !1590)
!1624 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !78, file: !78, line: 1686, type: !1324, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1625 = !DILocalVariable(name: "value", arg: 1, scope: !1624, file: !78, line: 1686, type: !742)
!1626 = !DILocation(line: 1686, column: 30, scope: !1624)
!1627 = !DILocalVariable(name: "factor", arg: 2, scope: !1624, file: !78, line: 1686, type: !86)
!1628 = !DILocation(line: 1686, column: 40, scope: !1624)
!1629 = !DILocalVariable(name: "u32Temp1", scope: !1624, file: !78, line: 1688, type: !742)
!1630 = !DILocation(line: 1688, column: 6, scope: !1624)
!1631 = !DILocalVariable(name: "u32Temp2", scope: !1624, file: !78, line: 1688, type: !742)
!1632 = !DILocation(line: 1688, column: 20, scope: !1624)
!1633 = !DILocation(line: 1689, column: 5, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1624, file: !78, line: 1689, column: 5)
!1635 = !DILocation(line: 1689, column: 12, scope: !1634)
!1636 = !DILocation(line: 1689, column: 5, scope: !1624)
!1637 = !DILocation(line: 1691, column: 14, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1634, file: !78, line: 1690, column: 2)
!1639 = !DILocation(line: 1691, column: 22, scope: !1638)
!1640 = !DILocation(line: 1691, column: 20, scope: !1638)
!1641 = !DILocation(line: 1691, column: 12, scope: !1638)
!1642 = !DILocation(line: 1692, column: 26, scope: !1638)
!1643 = !DILocation(line: 1692, column: 33, scope: !1638)
!1644 = !DILocation(line: 1692, column: 14, scope: !1638)
!1645 = !DILocation(line: 1692, column: 12, scope: !1638)
!1646 = !DILocation(line: 1693, column: 14, scope: !1638)
!1647 = !DILocation(line: 1693, column: 23, scope: !1638)
!1648 = !DILocation(line: 1693, column: 12, scope: !1638)
!1649 = !DILocation(line: 1694, column: 15, scope: !1638)
!1650 = !DILocation(line: 1694, column: 24, scope: !1638)
!1651 = !DILocation(line: 1694, column: 12, scope: !1638)
!1652 = !DILocation(line: 1695, column: 10, scope: !1638)
!1653 = !DILocation(line: 1695, column: 3, scope: !1638)
!1654 = !DILocation(line: 1699, column: 3, scope: !1655)
!1655 = distinct !DILexicalBlock(scope: !1634, file: !78, line: 1698, column: 2)
!1656 = !DILocation(line: 1701, column: 1, scope: !1624)
!1657 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !78, file: !78, line: 1720, type: !1324, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1658 = !DILocalVariable(name: "value", arg: 1, scope: !1657, file: !78, line: 1720, type: !742)
!1659 = !DILocation(line: 1720, column: 30, scope: !1657)
!1660 = !DILocalVariable(name: "factor", arg: 2, scope: !1657, file: !78, line: 1720, type: !86)
!1661 = !DILocation(line: 1720, column: 40, scope: !1657)
!1662 = !DILocalVariable(name: "u32Temp1", scope: !1657, file: !78, line: 1722, type: !742)
!1663 = !DILocation(line: 1722, column: 6, scope: !1657)
!1664 = !DILocalVariable(name: "u32Temp2", scope: !1657, file: !78, line: 1722, type: !742)
!1665 = !DILocation(line: 1722, column: 20, scope: !1657)
!1666 = !DILocation(line: 1723, column: 5, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1657, file: !78, line: 1723, column: 5)
!1668 = !DILocation(line: 1723, column: 12, scope: !1667)
!1669 = !DILocation(line: 1723, column: 5, scope: !1657)
!1670 = !DILocation(line: 1725, column: 3, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1667, file: !78, line: 1724, column: 2)
!1672 = !DILocation(line: 1729, column: 14, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1667, file: !78, line: 1728, column: 2)
!1674 = !DILocation(line: 1729, column: 22, scope: !1673)
!1675 = !DILocation(line: 1729, column: 20, scope: !1673)
!1676 = !DILocation(line: 1729, column: 12, scope: !1673)
!1677 = !DILocation(line: 1730, column: 26, scope: !1673)
!1678 = !DILocation(line: 1730, column: 33, scope: !1673)
!1679 = !DILocation(line: 1730, column: 14, scope: !1673)
!1680 = !DILocation(line: 1730, column: 12, scope: !1673)
!1681 = !DILocation(line: 1731, column: 14, scope: !1673)
!1682 = !DILocation(line: 1731, column: 23, scope: !1673)
!1683 = !DILocation(line: 1731, column: 12, scope: !1673)
!1684 = !DILocation(line: 1732, column: 15, scope: !1673)
!1685 = !DILocation(line: 1732, column: 24, scope: !1673)
!1686 = !DILocation(line: 1732, column: 12, scope: !1673)
!1687 = !DILocation(line: 1733, column: 7, scope: !1688)
!1688 = distinct !DILexicalBlock(scope: !1673, file: !78, line: 1733, column: 6)
!1689 = !DILocation(line: 1733, column: 15, scope: !1688)
!1690 = !DILocation(line: 1733, column: 21, scope: !1688)
!1691 = !DILocation(line: 1733, column: 6, scope: !1673)
!1692 = !DILocation(line: 1735, column: 11, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1688, file: !78, line: 1734, column: 3)
!1694 = !DILocation(line: 1735, column: 4, scope: !1693)
!1695 = !DILocation(line: 1739, column: 4, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1688, file: !78, line: 1738, column: 3)
!1697 = !DILocation(line: 1742, column: 1, scope: !1657)
!1698 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !78, file: !78, line: 1757, type: !1699, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1699 = !DISubroutineType(types: !1700)
!1700 = !{!86, !742, !86}
!1701 = !DILocalVariable(name: "val1", arg: 1, scope: !1698, file: !78, line: 1757, type: !742)
!1702 = !DILocation(line: 1757, column: 25, scope: !1698)
!1703 = !DILocalVariable(name: "val2", arg: 2, scope: !1698, file: !78, line: 1757, type: !86)
!1704 = !DILocation(line: 1757, column: 35, scope: !1698)
!1705 = !DILocalVariable(name: "s32Val2prime", scope: !1698, file: !78, line: 1759, type: !86)
!1706 = !DILocation(line: 1759, column: 6, scope: !1698)
!1707 = !DILocation(line: 1760, column: 5, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1698, file: !78, line: 1760, column: 5)
!1709 = !DILocation(line: 1760, column: 10, scope: !1708)
!1710 = !DILocation(line: 1760, column: 5, scope: !1698)
!1711 = !DILocation(line: 1762, column: 19, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1708, file: !78, line: 1761, column: 2)
!1713 = !DILocation(line: 1762, column: 18, scope: !1712)
!1714 = !DILocation(line: 1762, column: 16, scope: !1712)
!1715 = !DILocation(line: 1763, column: 2, scope: !1712)
!1716 = !DILocation(line: 1764, column: 5, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1698, file: !78, line: 1764, column: 5)
!1718 = !DILocation(line: 1764, column: 10, scope: !1717)
!1719 = !DILocation(line: 1764, column: 5, scope: !1698)
!1720 = !DILocation(line: 1766, column: 6, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1722, file: !78, line: 1766, column: 6)
!1722 = distinct !DILexicalBlock(scope: !1717, file: !78, line: 1765, column: 2)
!1723 = !DILocation(line: 1766, column: 11, scope: !1721)
!1724 = !DILocation(line: 1766, column: 6, scope: !1722)
!1725 = !DILocation(line: 1768, column: 21, scope: !1726)
!1726 = distinct !DILexicalBlock(scope: !1727, file: !78, line: 1768, column: 7)
!1727 = distinct !DILexicalBlock(scope: !1721, file: !78, line: 1767, column: 3)
!1728 = !DILocation(line: 1768, column: 19, scope: !1726)
!1729 = !DILocation(line: 1768, column: 37, scope: !1726)
!1730 = !DILocation(line: 1768, column: 35, scope: !1726)
!1731 = !DILocation(line: 1768, column: 7, scope: !1727)
!1732 = !DILocation(line: 1770, column: 13, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1726, file: !78, line: 1769, column: 4)
!1734 = !DILocation(line: 1770, column: 20, scope: !1733)
!1735 = !DILocation(line: 1770, column: 18, scope: !1733)
!1736 = !DILocation(line: 1770, column: 5, scope: !1733)
!1737 = !DILocation(line: 1774, column: 5, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1726, file: !78, line: 1773, column: 4)
!1739 = !DILocation(line: 1779, column: 21, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1741, file: !78, line: 1779, column: 7)
!1741 = distinct !DILexicalBlock(scope: !1721, file: !78, line: 1778, column: 3)
!1742 = !DILocation(line: 1779, column: 19, scope: !1740)
!1743 = !DILocation(line: 1779, column: 29, scope: !1740)
!1744 = !DILocation(line: 1779, column: 27, scope: !1740)
!1745 = !DILocation(line: 1779, column: 7, scope: !1741)
!1746 = !DILocation(line: 1781, column: 5, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1740, file: !78, line: 1780, column: 4)
!1748 = !DILocation(line: 1785, column: 13, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1740, file: !78, line: 1784, column: 4)
!1750 = !DILocation(line: 1785, column: 20, scope: !1749)
!1751 = !DILocation(line: 1785, column: 18, scope: !1749)
!1752 = !DILocation(line: 1785, column: 5, scope: !1749)
!1753 = !DILocation(line: 1791, column: 3, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1717, file: !78, line: 1790, column: 2)
!1755 = !DILocation(line: 1793, column: 1, scope: !1698)
!1756 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !78, file: !78, line: 1810, type: !778, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1757 = !DILocalVariable(name: "val1", arg: 1, scope: !1756, file: !78, line: 1810, type: !86)
!1758 = !DILocation(line: 1810, column: 30, scope: !1756)
!1759 = !DILocalVariable(name: "val2", arg: 2, scope: !1756, file: !78, line: 1810, type: !22)
!1760 = !DILocation(line: 1810, column: 39, scope: !1756)
!1761 = !DILocalVariable(name: "u32Temp1", scope: !1756, file: !78, line: 1812, type: !742)
!1762 = !DILocation(line: 1812, column: 6, scope: !1756)
!1763 = !DILocalVariable(name: "u32Temp2", scope: !1756, file: !78, line: 1812, type: !742)
!1764 = !DILocation(line: 1812, column: 17, scope: !1756)
!1765 = !DILocalVariable(name: "u32Temp3", scope: !1756, file: !78, line: 1812, type: !742)
!1766 = !DILocation(line: 1812, column: 26, scope: !1756)
!1767 = !DILocalVariable(name: "u8SignBit", scope: !1756, file: !78, line: 1813, type: !17)
!1768 = !DILocation(line: 1813, column: 5, scope: !1756)
!1769 = !DILocation(line: 1815, column: 5, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1756, file: !78, line: 1815, column: 5)
!1771 = !DILocation(line: 1815, column: 9, scope: !1770)
!1772 = !DILocation(line: 1815, column: 5, scope: !1756)
!1773 = !DILocation(line: 1817, column: 15, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1770, file: !78, line: 1816, column: 2)
!1775 = !DILocation(line: 1817, column: 14, scope: !1774)
!1776 = !DILocation(line: 1817, column: 12, scope: !1774)
!1777 = !DILocation(line: 1818, column: 13, scope: !1774)
!1778 = !DILocation(line: 1819, column: 2, scope: !1774)
!1779 = !DILocation(line: 1822, column: 14, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1770, file: !78, line: 1821, column: 2)
!1781 = !DILocation(line: 1822, column: 12, scope: !1780)
!1782 = !DILocation(line: 1823, column: 13, scope: !1780)
!1783 = !DILocation(line: 1826, column: 13, scope: !1756)
!1784 = !DILocation(line: 1826, column: 24, scope: !1756)
!1785 = !DILocation(line: 1826, column: 22, scope: !1756)
!1786 = !DILocation(line: 1826, column: 11, scope: !1756)
!1787 = !DILocation(line: 1827, column: 25, scope: !1756)
!1788 = !DILocation(line: 1827, column: 35, scope: !1756)
!1789 = !DILocation(line: 1827, column: 13, scope: !1756)
!1790 = !DILocation(line: 1827, column: 11, scope: !1756)
!1791 = !DILocation(line: 1828, column: 13, scope: !1756)
!1792 = !DILocation(line: 1828, column: 22, scope: !1756)
!1793 = !DILocation(line: 1828, column: 11, scope: !1756)
!1794 = !DILocation(line: 1829, column: 14, scope: !1756)
!1795 = !DILocation(line: 1829, column: 23, scope: !1756)
!1796 = !DILocation(line: 1829, column: 11, scope: !1756)
!1797 = !DILocation(line: 1830, column: 5, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1756, file: !78, line: 1830, column: 5)
!1799 = !DILocation(line: 1830, column: 15, scope: !1798)
!1800 = !DILocation(line: 1830, column: 5, scope: !1756)
!1801 = !DILocation(line: 1832, column: 10, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1798, file: !78, line: 1831, column: 2)
!1803 = !DILocation(line: 1832, column: 3, scope: !1802)
!1804 = !DILocation(line: 1836, column: 11, scope: !1805)
!1805 = distinct !DILexicalBlock(scope: !1798, file: !78, line: 1835, column: 2)
!1806 = !DILocation(line: 1836, column: 10, scope: !1805)
!1807 = !DILocation(line: 1836, column: 3, scope: !1805)
!1808 = !DILocation(line: 1838, column: 1, scope: !1756)
!1809 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !78, file: !78, line: 1857, type: !778, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1810 = !DILocalVariable(name: "val1", arg: 1, scope: !1809, file: !78, line: 1857, type: !86)
!1811 = !DILocation(line: 1857, column: 30, scope: !1809)
!1812 = !DILocalVariable(name: "val2", arg: 2, scope: !1809, file: !78, line: 1857, type: !22)
!1813 = !DILocation(line: 1857, column: 39, scope: !1809)
!1814 = !DILocalVariable(name: "u32Temp1", scope: !1809, file: !78, line: 1859, type: !742)
!1815 = !DILocation(line: 1859, column: 6, scope: !1809)
!1816 = !DILocalVariable(name: "u32Temp2", scope: !1809, file: !78, line: 1859, type: !742)
!1817 = !DILocation(line: 1859, column: 17, scope: !1809)
!1818 = !DILocalVariable(name: "u32Temp3", scope: !1809, file: !78, line: 1859, type: !742)
!1819 = !DILocation(line: 1859, column: 26, scope: !1809)
!1820 = !DILocalVariable(name: "u8SignBit", scope: !1809, file: !78, line: 1860, type: !17)
!1821 = !DILocation(line: 1860, column: 5, scope: !1809)
!1822 = !DILocation(line: 1862, column: 5, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1809, file: !78, line: 1862, column: 5)
!1824 = !DILocation(line: 1862, column: 9, scope: !1823)
!1825 = !DILocation(line: 1862, column: 5, scope: !1809)
!1826 = !DILocation(line: 1864, column: 15, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1823, file: !78, line: 1863, column: 2)
!1828 = !DILocation(line: 1864, column: 14, scope: !1827)
!1829 = !DILocation(line: 1864, column: 12, scope: !1827)
!1830 = !DILocation(line: 1865, column: 13, scope: !1827)
!1831 = !DILocation(line: 1866, column: 2, scope: !1827)
!1832 = !DILocation(line: 1869, column: 14, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1823, file: !78, line: 1868, column: 2)
!1834 = !DILocation(line: 1869, column: 12, scope: !1833)
!1835 = !DILocation(line: 1870, column: 13, scope: !1833)
!1836 = !DILocation(line: 1873, column: 13, scope: !1809)
!1837 = !DILocation(line: 1873, column: 24, scope: !1809)
!1838 = !DILocation(line: 1873, column: 22, scope: !1809)
!1839 = !DILocation(line: 1873, column: 11, scope: !1809)
!1840 = !DILocation(line: 1874, column: 25, scope: !1809)
!1841 = !DILocation(line: 1874, column: 35, scope: !1809)
!1842 = !DILocation(line: 1874, column: 13, scope: !1809)
!1843 = !DILocation(line: 1874, column: 11, scope: !1809)
!1844 = !DILocation(line: 1875, column: 13, scope: !1809)
!1845 = !DILocation(line: 1875, column: 22, scope: !1809)
!1846 = !DILocation(line: 1875, column: 11, scope: !1809)
!1847 = !DILocation(line: 1876, column: 14, scope: !1809)
!1848 = !DILocation(line: 1876, column: 23, scope: !1809)
!1849 = !DILocation(line: 1876, column: 11, scope: !1809)
!1850 = !DILocation(line: 1877, column: 5, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1809, file: !78, line: 1877, column: 5)
!1852 = !DILocation(line: 1877, column: 15, scope: !1851)
!1853 = !DILocation(line: 1877, column: 5, scope: !1809)
!1854 = !DILocation(line: 1879, column: 6, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1856, file: !78, line: 1879, column: 6)
!1856 = distinct !DILexicalBlock(scope: !1851, file: !78, line: 1878, column: 2)
!1857 = !DILocation(line: 1879, column: 14, scope: !1855)
!1858 = !DILocation(line: 1879, column: 6, scope: !1856)
!1859 = !DILocation(line: 1880, column: 11, scope: !1855)
!1860 = !DILocation(line: 1880, column: 4, scope: !1855)
!1861 = !DILocation(line: 1882, column: 4, scope: !1855)
!1862 = !DILocation(line: 1886, column: 6, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1864, file: !78, line: 1886, column: 6)
!1864 = distinct !DILexicalBlock(scope: !1851, file: !78, line: 1885, column: 2)
!1865 = !DILocation(line: 1886, column: 14, scope: !1863)
!1866 = !DILocation(line: 1886, column: 6, scope: !1864)
!1867 = !DILocation(line: 1887, column: 12, scope: !1863)
!1868 = !DILocation(line: 1887, column: 11, scope: !1863)
!1869 = !DILocation(line: 1887, column: 4, scope: !1863)
!1870 = !DILocation(line: 1889, column: 4, scope: !1863)
!1871 = !DILocation(line: 1891, column: 1, scope: !1809)
!1872 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !78, file: !78, line: 1911, type: !1873, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1873 = !DISubroutineType(types: !1874)
!1874 = !{!86, !86, !13}
!1875 = !DILocalVariable(name: "val1", arg: 1, scope: !1872, file: !78, line: 1911, type: !86)
!1876 = !DILocation(line: 1911, column: 30, scope: !1872)
!1877 = !DILocalVariable(name: "val2", arg: 2, scope: !1872, file: !78, line: 1911, type: !13)
!1878 = !DILocation(line: 1911, column: 39, scope: !1872)
!1879 = !DILocalVariable(name: "u32Temp1", scope: !1872, file: !78, line: 1913, type: !742)
!1880 = !DILocation(line: 1913, column: 6, scope: !1872)
!1881 = !DILocalVariable(name: "u32Temp2", scope: !1872, file: !78, line: 1913, type: !742)
!1882 = !DILocation(line: 1913, column: 17, scope: !1872)
!1883 = !DILocalVariable(name: "u32Temp3", scope: !1872, file: !78, line: 1913, type: !742)
!1884 = !DILocation(line: 1913, column: 26, scope: !1872)
!1885 = !DILocalVariable(name: "u32Temp4", scope: !1872, file: !78, line: 1913, type: !742)
!1886 = !DILocation(line: 1913, column: 35, scope: !1872)
!1887 = !DILocalVariable(name: "u8SignBit", scope: !1872, file: !78, line: 1914, type: !17)
!1888 = !DILocation(line: 1914, column: 5, scope: !1872)
!1889 = !DILocation(line: 1916, column: 7, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1872, file: !78, line: 1916, column: 5)
!1891 = !DILocation(line: 1916, column: 11, scope: !1890)
!1892 = !DILocation(line: 1916, column: 15, scope: !1890)
!1893 = !DILocation(line: 1916, column: 19, scope: !1890)
!1894 = !DILocation(line: 1916, column: 23, scope: !1890)
!1895 = !DILocation(line: 1916, column: 28, scope: !1890)
!1896 = !DILocation(line: 1916, column: 33, scope: !1890)
!1897 = !DILocation(line: 1916, column: 37, scope: !1890)
!1898 = !DILocation(line: 1916, column: 41, scope: !1890)
!1899 = !DILocation(line: 1916, column: 45, scope: !1890)
!1900 = !DILocation(line: 1916, column: 49, scope: !1890)
!1901 = !DILocation(line: 1916, column: 5, scope: !1872)
!1902 = !DILocation(line: 1918, column: 13, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1890, file: !78, line: 1917, column: 2)
!1904 = !DILocation(line: 1919, column: 2, scope: !1903)
!1905 = !DILocation(line: 1922, column: 13, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1890, file: !78, line: 1921, column: 2)
!1907 = !DILocation(line: 1925, column: 5, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1872, file: !78, line: 1925, column: 5)
!1909 = !DILocation(line: 1925, column: 9, scope: !1908)
!1910 = !DILocation(line: 1925, column: 5, scope: !1872)
!1911 = !DILocation(line: 1927, column: 15, scope: !1912)
!1912 = distinct !DILexicalBlock(scope: !1908, file: !78, line: 1926, column: 2)
!1913 = !DILocation(line: 1927, column: 14, scope: !1912)
!1914 = !DILocation(line: 1927, column: 12, scope: !1912)
!1915 = !DILocation(line: 1928, column: 2, scope: !1912)
!1916 = !DILocation(line: 1931, column: 14, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1908, file: !78, line: 1930, column: 2)
!1918 = !DILocation(line: 1931, column: 12, scope: !1917)
!1919 = !DILocation(line: 1934, column: 5, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1872, file: !78, line: 1934, column: 5)
!1921 = !DILocation(line: 1934, column: 9, scope: !1920)
!1922 = !DILocation(line: 1934, column: 5, scope: !1872)
!1923 = !DILocation(line: 1936, column: 15, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1920, file: !78, line: 1935, column: 2)
!1925 = !DILocation(line: 1936, column: 14, scope: !1924)
!1926 = !DILocation(line: 1936, column: 12, scope: !1924)
!1927 = !DILocation(line: 1937, column: 2, scope: !1924)
!1928 = !DILocation(line: 1940, column: 14, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1920, file: !78, line: 1939, column: 2)
!1930 = !DILocation(line: 1940, column: 12, scope: !1929)
!1931 = !DILocation(line: 1943, column: 13, scope: !1872)
!1932 = !DILocation(line: 1943, column: 24, scope: !1872)
!1933 = !DILocation(line: 1943, column: 22, scope: !1872)
!1934 = !DILocation(line: 1943, column: 11, scope: !1872)
!1935 = !DILocation(line: 1944, column: 25, scope: !1872)
!1936 = !DILocation(line: 1944, column: 35, scope: !1872)
!1937 = !DILocation(line: 1944, column: 13, scope: !1872)
!1938 = !DILocation(line: 1944, column: 11, scope: !1872)
!1939 = !DILocation(line: 1945, column: 13, scope: !1872)
!1940 = !DILocation(line: 1945, column: 22, scope: !1872)
!1941 = !DILocation(line: 1945, column: 11, scope: !1872)
!1942 = !DILocation(line: 1946, column: 14, scope: !1872)
!1943 = !DILocation(line: 1946, column: 23, scope: !1872)
!1944 = !DILocation(line: 1946, column: 11, scope: !1872)
!1945 = !DILocation(line: 1947, column: 5, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1872, file: !78, line: 1947, column: 5)
!1947 = !DILocation(line: 1947, column: 15, scope: !1946)
!1948 = !DILocation(line: 1947, column: 5, scope: !1872)
!1949 = !DILocation(line: 1949, column: 6, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1951, file: !78, line: 1949, column: 6)
!1951 = distinct !DILexicalBlock(scope: !1946, file: !78, line: 1948, column: 2)
!1952 = !DILocation(line: 1949, column: 14, scope: !1950)
!1953 = !DILocation(line: 1949, column: 6, scope: !1951)
!1954 = !DILocation(line: 1950, column: 11, scope: !1950)
!1955 = !DILocation(line: 1950, column: 4, scope: !1950)
!1956 = !DILocation(line: 1952, column: 4, scope: !1950)
!1957 = !DILocation(line: 1956, column: 11, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1946, file: !78, line: 1955, column: 2)
!1959 = !DILocation(line: 1956, column: 10, scope: !1958)
!1960 = !DILocation(line: 1956, column: 3, scope: !1958)
!1961 = !DILocation(line: 1958, column: 1, scope: !1872)
!1962 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !78, file: !78, line: 1977, type: !1873, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1963 = !DILocalVariable(name: "val1", arg: 1, scope: !1962, file: !78, line: 1977, type: !86)
!1964 = !DILocation(line: 1977, column: 30, scope: !1962)
!1965 = !DILocalVariable(name: "val2", arg: 2, scope: !1962, file: !78, line: 1977, type: !13)
!1966 = !DILocation(line: 1977, column: 39, scope: !1962)
!1967 = !DILocalVariable(name: "u32Temp1", scope: !1962, file: !78, line: 1979, type: !742)
!1968 = !DILocation(line: 1979, column: 6, scope: !1962)
!1969 = !DILocalVariable(name: "u32Temp2", scope: !1962, file: !78, line: 1979, type: !742)
!1970 = !DILocation(line: 1979, column: 17, scope: !1962)
!1971 = !DILocalVariable(name: "u32Temp3", scope: !1962, file: !78, line: 1979, type: !742)
!1972 = !DILocation(line: 1979, column: 26, scope: !1962)
!1973 = !DILocalVariable(name: "u32Temp4", scope: !1962, file: !78, line: 1979, type: !742)
!1974 = !DILocation(line: 1979, column: 35, scope: !1962)
!1975 = !DILocalVariable(name: "u8SignBit", scope: !1962, file: !78, line: 1980, type: !17)
!1976 = !DILocation(line: 1980, column: 5, scope: !1962)
!1977 = !DILocation(line: 1982, column: 7, scope: !1978)
!1978 = distinct !DILexicalBlock(scope: !1962, file: !78, line: 1982, column: 5)
!1979 = !DILocation(line: 1982, column: 11, scope: !1978)
!1980 = !DILocation(line: 1982, column: 15, scope: !1978)
!1981 = !DILocation(line: 1982, column: 19, scope: !1978)
!1982 = !DILocation(line: 1982, column: 23, scope: !1978)
!1983 = !DILocation(line: 1982, column: 28, scope: !1978)
!1984 = !DILocation(line: 1982, column: 33, scope: !1978)
!1985 = !DILocation(line: 1982, column: 37, scope: !1978)
!1986 = !DILocation(line: 1982, column: 41, scope: !1978)
!1987 = !DILocation(line: 1982, column: 45, scope: !1978)
!1988 = !DILocation(line: 1982, column: 49, scope: !1978)
!1989 = !DILocation(line: 1982, column: 5, scope: !1962)
!1990 = !DILocation(line: 1984, column: 13, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1978, file: !78, line: 1983, column: 2)
!1992 = !DILocation(line: 1985, column: 2, scope: !1991)
!1993 = !DILocation(line: 1988, column: 13, scope: !1994)
!1994 = distinct !DILexicalBlock(scope: !1978, file: !78, line: 1987, column: 2)
!1995 = !DILocation(line: 1991, column: 5, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1962, file: !78, line: 1991, column: 5)
!1997 = !DILocation(line: 1991, column: 9, scope: !1996)
!1998 = !DILocation(line: 1991, column: 5, scope: !1962)
!1999 = !DILocation(line: 1993, column: 15, scope: !2000)
!2000 = distinct !DILexicalBlock(scope: !1996, file: !78, line: 1992, column: 2)
!2001 = !DILocation(line: 1993, column: 14, scope: !2000)
!2002 = !DILocation(line: 1993, column: 12, scope: !2000)
!2003 = !DILocation(line: 1994, column: 2, scope: !2000)
!2004 = !DILocation(line: 1997, column: 14, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1996, file: !78, line: 1996, column: 2)
!2006 = !DILocation(line: 1997, column: 12, scope: !2005)
!2007 = !DILocation(line: 2000, column: 5, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !1962, file: !78, line: 2000, column: 5)
!2009 = !DILocation(line: 2000, column: 9, scope: !2008)
!2010 = !DILocation(line: 2000, column: 5, scope: !1962)
!2011 = !DILocation(line: 2002, column: 15, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !2008, file: !78, line: 2001, column: 2)
!2013 = !DILocation(line: 2002, column: 14, scope: !2012)
!2014 = !DILocation(line: 2002, column: 12, scope: !2012)
!2015 = !DILocation(line: 2003, column: 2, scope: !2012)
!2016 = !DILocation(line: 2006, column: 14, scope: !2017)
!2017 = distinct !DILexicalBlock(scope: !2008, file: !78, line: 2005, column: 2)
!2018 = !DILocation(line: 2006, column: 12, scope: !2017)
!2019 = !DILocation(line: 2009, column: 13, scope: !1962)
!2020 = !DILocation(line: 2009, column: 24, scope: !1962)
!2021 = !DILocation(line: 2009, column: 22, scope: !1962)
!2022 = !DILocation(line: 2009, column: 11, scope: !1962)
!2023 = !DILocation(line: 2010, column: 25, scope: !1962)
!2024 = !DILocation(line: 2010, column: 35, scope: !1962)
!2025 = !DILocation(line: 2010, column: 13, scope: !1962)
!2026 = !DILocation(line: 2010, column: 11, scope: !1962)
!2027 = !DILocation(line: 2011, column: 13, scope: !1962)
!2028 = !DILocation(line: 2011, column: 22, scope: !1962)
!2029 = !DILocation(line: 2011, column: 11, scope: !1962)
!2030 = !DILocation(line: 2012, column: 14, scope: !1962)
!2031 = !DILocation(line: 2012, column: 23, scope: !1962)
!2032 = !DILocation(line: 2012, column: 11, scope: !1962)
!2033 = !DILocation(line: 2013, column: 6, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !1962, file: !78, line: 2013, column: 5)
!2035 = !DILocation(line: 2013, column: 14, scope: !2034)
!2036 = !DILocation(line: 2013, column: 19, scope: !2034)
!2037 = !DILocation(line: 2013, column: 5, scope: !1962)
!2038 = !DILocation(line: 2015, column: 6, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2040, file: !78, line: 2015, column: 6)
!2040 = distinct !DILexicalBlock(scope: !2034, file: !78, line: 2014, column: 2)
!2041 = !DILocation(line: 2015, column: 16, scope: !2039)
!2042 = !DILocation(line: 2015, column: 6, scope: !2040)
!2043 = !DILocation(line: 2017, column: 7, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2045, file: !78, line: 2017, column: 7)
!2045 = distinct !DILexicalBlock(scope: !2039, file: !78, line: 2016, column: 3)
!2046 = !DILocation(line: 2017, column: 15, scope: !2044)
!2047 = !DILocation(line: 2017, column: 7, scope: !2045)
!2048 = !DILocation(line: 2018, column: 12, scope: !2044)
!2049 = !DILocation(line: 2018, column: 5, scope: !2044)
!2050 = !DILocation(line: 2020, column: 5, scope: !2044)
!2051 = !DILocation(line: 2024, column: 7, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2053, file: !78, line: 2024, column: 7)
!2053 = distinct !DILexicalBlock(scope: !2039, file: !78, line: 2023, column: 3)
!2054 = !DILocation(line: 2024, column: 15, scope: !2052)
!2055 = !DILocation(line: 2024, column: 7, scope: !2053)
!2056 = !DILocation(line: 2025, column: 13, scope: !2052)
!2057 = !DILocation(line: 2025, column: 12, scope: !2052)
!2058 = !DILocation(line: 2025, column: 5, scope: !2052)
!2059 = !DILocation(line: 2027, column: 5, scope: !2052)
!2060 = !DILocation(line: 2032, column: 3, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2034, file: !78, line: 2031, column: 2)
!2062 = !DILocation(line: 2034, column: 1, scope: !1962)
!2063 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !78, file: !78, line: 2049, type: !2064, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2064 = !DISubroutineType(types: !2065)
!2065 = !{!86, !86, !742}
!2066 = !DILocalVariable(name: "val1", arg: 1, scope: !2063, file: !78, line: 2049, type: !86)
!2067 = !DILocation(line: 2049, column: 30, scope: !2063)
!2068 = !DILocalVariable(name: "val2", arg: 2, scope: !2063, file: !78, line: 2049, type: !742)
!2069 = !DILocation(line: 2049, column: 39, scope: !2063)
!2070 = !DILocalVariable(name: "u32Temp1", scope: !2063, file: !78, line: 2051, type: !742)
!2071 = !DILocation(line: 2051, column: 6, scope: !2063)
!2072 = !DILocalVariable(name: "u32Temp2", scope: !2063, file: !78, line: 2051, type: !742)
!2073 = !DILocation(line: 2051, column: 17, scope: !2063)
!2074 = !DILocalVariable(name: "u8SignBit", scope: !2063, file: !78, line: 2052, type: !17)
!2075 = !DILocation(line: 2052, column: 5, scope: !2063)
!2076 = !DILocation(line: 2054, column: 5, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2063, file: !78, line: 2054, column: 5)
!2078 = !DILocation(line: 2054, column: 9, scope: !2077)
!2079 = !DILocation(line: 2054, column: 5, scope: !2063)
!2080 = !DILocation(line: 2056, column: 15, scope: !2081)
!2081 = distinct !DILexicalBlock(scope: !2077, file: !78, line: 2055, column: 2)
!2082 = !DILocation(line: 2056, column: 14, scope: !2081)
!2083 = !DILocation(line: 2056, column: 12, scope: !2081)
!2084 = !DILocation(line: 2057, column: 13, scope: !2081)
!2085 = !DILocation(line: 2058, column: 2, scope: !2081)
!2086 = !DILocation(line: 2061, column: 14, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2077, file: !78, line: 2060, column: 2)
!2088 = !DILocation(line: 2061, column: 12, scope: !2087)
!2089 = !DILocation(line: 2062, column: 13, scope: !2087)
!2090 = !DILocation(line: 2065, column: 25, scope: !2063)
!2091 = !DILocation(line: 2065, column: 35, scope: !2063)
!2092 = !DILocation(line: 2065, column: 13, scope: !2063)
!2093 = !DILocation(line: 2065, column: 11, scope: !2063)
!2094 = !DILocation(line: 2066, column: 5, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2063, file: !78, line: 2066, column: 5)
!2096 = !DILocation(line: 2066, column: 15, scope: !2095)
!2097 = !DILocation(line: 2066, column: 5, scope: !2063)
!2098 = !DILocation(line: 2067, column: 10, scope: !2095)
!2099 = !DILocation(line: 2067, column: 3, scope: !2095)
!2100 = !DILocation(line: 2069, column: 11, scope: !2095)
!2101 = !DILocation(line: 2069, column: 10, scope: !2095)
!2102 = !DILocation(line: 2069, column: 3, scope: !2095)
!2103 = !DILocation(line: 2070, column: 1, scope: !2063)
!2104 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !78, file: !78, line: 2089, type: !2064, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2105 = !DILocalVariable(name: "val1", arg: 1, scope: !2104, file: !78, line: 2089, type: !86)
!2106 = !DILocation(line: 2089, column: 30, scope: !2104)
!2107 = !DILocalVariable(name: "val2", arg: 2, scope: !2104, file: !78, line: 2089, type: !742)
!2108 = !DILocation(line: 2089, column: 39, scope: !2104)
!2109 = !DILocalVariable(name: "u32Temp1", scope: !2104, file: !78, line: 2091, type: !742)
!2110 = !DILocation(line: 2091, column: 6, scope: !2104)
!2111 = !DILocalVariable(name: "u32Temp2", scope: !2104, file: !78, line: 2091, type: !742)
!2112 = !DILocation(line: 2091, column: 17, scope: !2104)
!2113 = !DILocalVariable(name: "u32Temp3", scope: !2104, file: !78, line: 2091, type: !742)
!2114 = !DILocation(line: 2091, column: 26, scope: !2104)
!2115 = !DILocalVariable(name: "u8SignBit", scope: !2104, file: !78, line: 2092, type: !17)
!2116 = !DILocation(line: 2092, column: 5, scope: !2104)
!2117 = !DILocation(line: 2094, column: 5, scope: !2118)
!2118 = distinct !DILexicalBlock(scope: !2104, file: !78, line: 2094, column: 5)
!2119 = !DILocation(line: 2094, column: 9, scope: !2118)
!2120 = !DILocation(line: 2094, column: 5, scope: !2104)
!2121 = !DILocation(line: 2096, column: 15, scope: !2122)
!2122 = distinct !DILexicalBlock(scope: !2118, file: !78, line: 2095, column: 2)
!2123 = !DILocation(line: 2096, column: 14, scope: !2122)
!2124 = !DILocation(line: 2096, column: 12, scope: !2122)
!2125 = !DILocation(line: 2097, column: 13, scope: !2122)
!2126 = !DILocation(line: 2098, column: 2, scope: !2122)
!2127 = !DILocation(line: 2101, column: 14, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2118, file: !78, line: 2100, column: 2)
!2129 = !DILocation(line: 2101, column: 12, scope: !2128)
!2130 = !DILocation(line: 2102, column: 13, scope: !2128)
!2131 = !DILocation(line: 2105, column: 13, scope: !2104)
!2132 = !DILocation(line: 2105, column: 24, scope: !2104)
!2133 = !DILocation(line: 2105, column: 22, scope: !2104)
!2134 = !DILocation(line: 2105, column: 11, scope: !2104)
!2135 = !DILocation(line: 2106, column: 25, scope: !2104)
!2136 = !DILocation(line: 2106, column: 35, scope: !2104)
!2137 = !DILocation(line: 2106, column: 13, scope: !2104)
!2138 = !DILocation(line: 2106, column: 11, scope: !2104)
!2139 = !DILocation(line: 2107, column: 13, scope: !2104)
!2140 = !DILocation(line: 2107, column: 22, scope: !2104)
!2141 = !DILocation(line: 2107, column: 11, scope: !2104)
!2142 = !DILocation(line: 2108, column: 14, scope: !2104)
!2143 = !DILocation(line: 2108, column: 23, scope: !2104)
!2144 = !DILocation(line: 2108, column: 11, scope: !2104)
!2145 = !DILocation(line: 2109, column: 5, scope: !2146)
!2146 = distinct !DILexicalBlock(scope: !2104, file: !78, line: 2109, column: 5)
!2147 = !DILocation(line: 2109, column: 15, scope: !2146)
!2148 = !DILocation(line: 2109, column: 5, scope: !2104)
!2149 = !DILocation(line: 2111, column: 6, scope: !2150)
!2150 = distinct !DILexicalBlock(scope: !2151, file: !78, line: 2111, column: 6)
!2151 = distinct !DILexicalBlock(scope: !2146, file: !78, line: 2110, column: 2)
!2152 = !DILocation(line: 2111, column: 14, scope: !2150)
!2153 = !DILocation(line: 2111, column: 6, scope: !2151)
!2154 = !DILocation(line: 2112, column: 11, scope: !2150)
!2155 = !DILocation(line: 2112, column: 4, scope: !2150)
!2156 = !DILocation(line: 2114, column: 4, scope: !2150)
!2157 = !DILocation(line: 2118, column: 6, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2159, file: !78, line: 2118, column: 6)
!2159 = distinct !DILexicalBlock(scope: !2146, file: !78, line: 2117, column: 2)
!2160 = !DILocation(line: 2118, column: 14, scope: !2158)
!2161 = !DILocation(line: 2118, column: 6, scope: !2159)
!2162 = !DILocation(line: 2119, column: 12, scope: !2158)
!2163 = !DILocation(line: 2119, column: 11, scope: !2158)
!2164 = !DILocation(line: 2119, column: 4, scope: !2158)
!2165 = !DILocation(line: 2121, column: 4, scope: !2158)
!2166 = !DILocation(line: 2123, column: 1, scope: !2104)
!2167 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !78, file: !78, line: 2141, type: !2168, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2168 = !DISubroutineType(types: !2169)
!2169 = !{!86, !86, !86}
!2170 = !DILocalVariable(name: "value", arg: 1, scope: !2167, file: !78, line: 2141, type: !86)
!2171 = !DILocation(line: 2141, column: 30, scope: !2167)
!2172 = !DILocalVariable(name: "factor", arg: 2, scope: !2167, file: !78, line: 2141, type: !86)
!2173 = !DILocation(line: 2141, column: 41, scope: !2167)
!2174 = !DILocalVariable(name: "u32Temp1", scope: !2167, file: !78, line: 2143, type: !742)
!2175 = !DILocation(line: 2143, column: 6, scope: !2167)
!2176 = !DILocalVariable(name: "u32Temp2", scope: !2167, file: !78, line: 2143, type: !742)
!2177 = !DILocation(line: 2143, column: 17, scope: !2167)
!2178 = !DILocalVariable(name: "u32Temp3", scope: !2167, file: !78, line: 2143, type: !742)
!2179 = !DILocation(line: 2143, column: 26, scope: !2167)
!2180 = !DILocalVariable(name: "u32Temp4", scope: !2167, file: !78, line: 2143, type: !742)
!2181 = !DILocation(line: 2143, column: 35, scope: !2167)
!2182 = !DILocalVariable(name: "u8SignBit", scope: !2167, file: !78, line: 2144, type: !17)
!2183 = !DILocation(line: 2144, column: 5, scope: !2167)
!2184 = !DILocation(line: 2146, column: 7, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2167, file: !78, line: 2146, column: 5)
!2186 = !DILocation(line: 2146, column: 12, scope: !2185)
!2187 = !DILocation(line: 2146, column: 16, scope: !2185)
!2188 = !DILocation(line: 2146, column: 36, scope: !2185)
!2189 = !DILocation(line: 2146, column: 41, scope: !2185)
!2190 = !DILocation(line: 2146, column: 45, scope: !2185)
!2191 = !DILocation(line: 2148, column: 13, scope: !2192)
!2192 = distinct !DILexicalBlock(scope: !2185, file: !78, line: 2147, column: 2)
!2193 = !DILocation(line: 2149, column: 2, scope: !2192)
!2194 = !DILocation(line: 2152, column: 13, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2185, file: !78, line: 2151, column: 2)
!2196 = !DILocation(line: 2155, column: 5, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2167, file: !78, line: 2155, column: 5)
!2198 = !DILocation(line: 2155, column: 10, scope: !2197)
!2199 = !DILocation(line: 2155, column: 5, scope: !2167)
!2200 = !DILocation(line: 2157, column: 15, scope: !2201)
!2201 = distinct !DILexicalBlock(scope: !2197, file: !78, line: 2156, column: 2)
!2202 = !DILocation(line: 2157, column: 14, scope: !2201)
!2203 = !DILocation(line: 2157, column: 12, scope: !2201)
!2204 = !DILocation(line: 2158, column: 2, scope: !2201)
!2205 = !DILocation(line: 2161, column: 14, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2197, file: !78, line: 2160, column: 2)
!2207 = !DILocation(line: 2161, column: 12, scope: !2206)
!2208 = !DILocation(line: 2164, column: 5, scope: !2209)
!2209 = distinct !DILexicalBlock(scope: !2167, file: !78, line: 2164, column: 5)
!2210 = !DILocation(line: 2164, column: 11, scope: !2209)
!2211 = !DILocation(line: 2164, column: 5, scope: !2167)
!2212 = !DILocation(line: 2166, column: 15, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2209, file: !78, line: 2165, column: 2)
!2214 = !DILocation(line: 2166, column: 14, scope: !2213)
!2215 = !DILocation(line: 2166, column: 12, scope: !2213)
!2216 = !DILocation(line: 2167, column: 2, scope: !2213)
!2217 = !DILocation(line: 2170, column: 14, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2209, file: !78, line: 2169, column: 2)
!2219 = !DILocation(line: 2170, column: 12, scope: !2218)
!2220 = !DILocation(line: 2173, column: 13, scope: !2167)
!2221 = !DILocation(line: 2173, column: 24, scope: !2167)
!2222 = !DILocation(line: 2173, column: 22, scope: !2167)
!2223 = !DILocation(line: 2173, column: 11, scope: !2167)
!2224 = !DILocation(line: 2174, column: 25, scope: !2167)
!2225 = !DILocation(line: 2174, column: 35, scope: !2167)
!2226 = !DILocation(line: 2174, column: 13, scope: !2167)
!2227 = !DILocation(line: 2174, column: 11, scope: !2167)
!2228 = !DILocation(line: 2175, column: 13, scope: !2167)
!2229 = !DILocation(line: 2175, column: 22, scope: !2167)
!2230 = !DILocation(line: 2175, column: 11, scope: !2167)
!2231 = !DILocation(line: 2176, column: 14, scope: !2167)
!2232 = !DILocation(line: 2176, column: 23, scope: !2167)
!2233 = !DILocation(line: 2176, column: 11, scope: !2167)
!2234 = !DILocation(line: 2177, column: 5, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2167, file: !78, line: 2177, column: 5)
!2236 = !DILocation(line: 2177, column: 15, scope: !2235)
!2237 = !DILocation(line: 2177, column: 5, scope: !2167)
!2238 = !DILocation(line: 2179, column: 6, scope: !2239)
!2239 = distinct !DILexicalBlock(scope: !2240, file: !78, line: 2179, column: 6)
!2240 = distinct !DILexicalBlock(scope: !2235, file: !78, line: 2178, column: 2)
!2241 = !DILocation(line: 2179, column: 14, scope: !2239)
!2242 = !DILocation(line: 2179, column: 6, scope: !2240)
!2243 = !DILocation(line: 2180, column: 11, scope: !2239)
!2244 = !DILocation(line: 2180, column: 4, scope: !2239)
!2245 = !DILocation(line: 2182, column: 4, scope: !2239)
!2246 = !DILocation(line: 2186, column: 11, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2235, file: !78, line: 2185, column: 2)
!2248 = !DILocation(line: 2186, column: 10, scope: !2247)
!2249 = !DILocation(line: 2186, column: 3, scope: !2247)
!2250 = !DILocation(line: 2188, column: 1, scope: !2167)
!2251 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !78, file: !78, line: 2207, type: !2168, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2252 = !DILocalVariable(name: "value", arg: 1, scope: !2251, file: !78, line: 2207, type: !86)
!2253 = !DILocation(line: 2207, column: 30, scope: !2251)
!2254 = !DILocalVariable(name: "factor", arg: 2, scope: !2251, file: !78, line: 2207, type: !86)
!2255 = !DILocation(line: 2207, column: 41, scope: !2251)
!2256 = !DILocalVariable(name: "u32Temp1", scope: !2251, file: !78, line: 2209, type: !742)
!2257 = !DILocation(line: 2209, column: 6, scope: !2251)
!2258 = !DILocalVariable(name: "u32Temp2", scope: !2251, file: !78, line: 2209, type: !742)
!2259 = !DILocation(line: 2209, column: 17, scope: !2251)
!2260 = !DILocalVariable(name: "u32Temp3", scope: !2251, file: !78, line: 2209, type: !742)
!2261 = !DILocation(line: 2209, column: 26, scope: !2251)
!2262 = !DILocalVariable(name: "u32Temp4", scope: !2251, file: !78, line: 2209, type: !742)
!2263 = !DILocation(line: 2209, column: 35, scope: !2251)
!2264 = !DILocalVariable(name: "u8SignBit", scope: !2251, file: !78, line: 2210, type: !17)
!2265 = !DILocation(line: 2210, column: 5, scope: !2251)
!2266 = !DILocation(line: 2212, column: 7, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2251, file: !78, line: 2212, column: 5)
!2268 = !DILocation(line: 2212, column: 12, scope: !2267)
!2269 = !DILocation(line: 2212, column: 16, scope: !2267)
!2270 = !DILocation(line: 2212, column: 36, scope: !2267)
!2271 = !DILocation(line: 2212, column: 41, scope: !2267)
!2272 = !DILocation(line: 2212, column: 45, scope: !2267)
!2273 = !DILocation(line: 2214, column: 13, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2267, file: !78, line: 2213, column: 2)
!2275 = !DILocation(line: 2215, column: 2, scope: !2274)
!2276 = !DILocation(line: 2218, column: 13, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2267, file: !78, line: 2217, column: 2)
!2278 = !DILocation(line: 2221, column: 5, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2251, file: !78, line: 2221, column: 5)
!2280 = !DILocation(line: 2221, column: 10, scope: !2279)
!2281 = !DILocation(line: 2221, column: 5, scope: !2251)
!2282 = !DILocation(line: 2223, column: 15, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2279, file: !78, line: 2222, column: 2)
!2284 = !DILocation(line: 2223, column: 14, scope: !2283)
!2285 = !DILocation(line: 2223, column: 12, scope: !2283)
!2286 = !DILocation(line: 2224, column: 2, scope: !2283)
!2287 = !DILocation(line: 2227, column: 14, scope: !2288)
!2288 = distinct !DILexicalBlock(scope: !2279, file: !78, line: 2226, column: 2)
!2289 = !DILocation(line: 2227, column: 12, scope: !2288)
!2290 = !DILocation(line: 2230, column: 5, scope: !2291)
!2291 = distinct !DILexicalBlock(scope: !2251, file: !78, line: 2230, column: 5)
!2292 = !DILocation(line: 2230, column: 11, scope: !2291)
!2293 = !DILocation(line: 2230, column: 5, scope: !2251)
!2294 = !DILocation(line: 2232, column: 15, scope: !2295)
!2295 = distinct !DILexicalBlock(scope: !2291, file: !78, line: 2231, column: 2)
!2296 = !DILocation(line: 2232, column: 14, scope: !2295)
!2297 = !DILocation(line: 2232, column: 12, scope: !2295)
!2298 = !DILocation(line: 2233, column: 2, scope: !2295)
!2299 = !DILocation(line: 2236, column: 14, scope: !2300)
!2300 = distinct !DILexicalBlock(scope: !2291, file: !78, line: 2235, column: 2)
!2301 = !DILocation(line: 2236, column: 12, scope: !2300)
!2302 = !DILocation(line: 2239, column: 13, scope: !2251)
!2303 = !DILocation(line: 2239, column: 24, scope: !2251)
!2304 = !DILocation(line: 2239, column: 22, scope: !2251)
!2305 = !DILocation(line: 2239, column: 11, scope: !2251)
!2306 = !DILocation(line: 2240, column: 25, scope: !2251)
!2307 = !DILocation(line: 2240, column: 35, scope: !2251)
!2308 = !DILocation(line: 2240, column: 13, scope: !2251)
!2309 = !DILocation(line: 2240, column: 11, scope: !2251)
!2310 = !DILocation(line: 2241, column: 13, scope: !2251)
!2311 = !DILocation(line: 2241, column: 22, scope: !2251)
!2312 = !DILocation(line: 2241, column: 11, scope: !2251)
!2313 = !DILocation(line: 2242, column: 14, scope: !2251)
!2314 = !DILocation(line: 2242, column: 23, scope: !2251)
!2315 = !DILocation(line: 2242, column: 11, scope: !2251)
!2316 = !DILocation(line: 2243, column: 6, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2251, file: !78, line: 2243, column: 5)
!2318 = !DILocation(line: 2243, column: 14, scope: !2317)
!2319 = !DILocation(line: 2243, column: 19, scope: !2317)
!2320 = !DILocation(line: 2243, column: 5, scope: !2251)
!2321 = !DILocation(line: 2245, column: 6, scope: !2322)
!2322 = distinct !DILexicalBlock(scope: !2323, file: !78, line: 2245, column: 6)
!2323 = distinct !DILexicalBlock(scope: !2317, file: !78, line: 2244, column: 2)
!2324 = !DILocation(line: 2245, column: 16, scope: !2322)
!2325 = !DILocation(line: 2245, column: 6, scope: !2323)
!2326 = !DILocation(line: 2247, column: 7, scope: !2327)
!2327 = distinct !DILexicalBlock(scope: !2328, file: !78, line: 2247, column: 7)
!2328 = distinct !DILexicalBlock(scope: !2322, file: !78, line: 2246, column: 3)
!2329 = !DILocation(line: 2247, column: 15, scope: !2327)
!2330 = !DILocation(line: 2247, column: 7, scope: !2328)
!2331 = !DILocation(line: 2248, column: 12, scope: !2327)
!2332 = !DILocation(line: 2248, column: 5, scope: !2327)
!2333 = !DILocation(line: 2250, column: 5, scope: !2327)
!2334 = !DILocation(line: 2254, column: 7, scope: !2335)
!2335 = distinct !DILexicalBlock(scope: !2336, file: !78, line: 2254, column: 7)
!2336 = distinct !DILexicalBlock(scope: !2322, file: !78, line: 2253, column: 3)
!2337 = !DILocation(line: 2254, column: 15, scope: !2335)
!2338 = !DILocation(line: 2254, column: 7, scope: !2336)
!2339 = !DILocation(line: 2255, column: 13, scope: !2335)
!2340 = !DILocation(line: 2255, column: 12, scope: !2335)
!2341 = !DILocation(line: 2255, column: 5, scope: !2335)
!2342 = !DILocation(line: 2257, column: 5, scope: !2335)
!2343 = !DILocation(line: 2262, column: 4, scope: !2344)
!2344 = distinct !DILexicalBlock(scope: !2317, file: !78, line: 2261, column: 2)
!2345 = !DILocation(line: 2264, column: 1, scope: !2251)
!2346 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !78, file: !78, line: 2282, type: !2347, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2347 = !DISubroutineType(types: !2348)
!2348 = !{!86, !86, !17}
!2349 = !DILocalVariable(name: "value", arg: 1, scope: !2346, file: !78, line: 2282, type: !86)
!2350 = !DILocation(line: 2282, column: 29, scope: !2346)
!2351 = !DILocalVariable(name: "factor", arg: 2, scope: !2346, file: !78, line: 2282, type: !17)
!2352 = !DILocation(line: 2282, column: 39, scope: !2346)
!2353 = !DILocalVariable(name: "u32Temp1", scope: !2346, file: !78, line: 2284, type: !742)
!2354 = !DILocation(line: 2284, column: 6, scope: !2346)
!2355 = !DILocalVariable(name: "u32Temp2", scope: !2346, file: !78, line: 2284, type: !742)
!2356 = !DILocation(line: 2284, column: 17, scope: !2346)
!2357 = !DILocalVariable(name: "u32Temp3", scope: !2346, file: !78, line: 2284, type: !742)
!2358 = !DILocation(line: 2284, column: 26, scope: !2346)
!2359 = !DILocalVariable(name: "u8SignBit", scope: !2346, file: !78, line: 2285, type: !17)
!2360 = !DILocation(line: 2285, column: 5, scope: !2346)
!2361 = !DILocation(line: 2287, column: 5, scope: !2362)
!2362 = distinct !DILexicalBlock(scope: !2346, file: !78, line: 2287, column: 5)
!2363 = !DILocation(line: 2287, column: 10, scope: !2362)
!2364 = !DILocation(line: 2287, column: 5, scope: !2346)
!2365 = !DILocation(line: 2289, column: 15, scope: !2366)
!2366 = distinct !DILexicalBlock(scope: !2362, file: !78, line: 2288, column: 2)
!2367 = !DILocation(line: 2289, column: 14, scope: !2366)
!2368 = !DILocation(line: 2289, column: 12, scope: !2366)
!2369 = !DILocation(line: 2290, column: 13, scope: !2366)
!2370 = !DILocation(line: 2291, column: 2, scope: !2366)
!2371 = !DILocation(line: 2294, column: 14, scope: !2372)
!2372 = distinct !DILexicalBlock(scope: !2362, file: !78, line: 2293, column: 2)
!2373 = !DILocation(line: 2294, column: 12, scope: !2372)
!2374 = !DILocation(line: 2295, column: 13, scope: !2372)
!2375 = !DILocation(line: 2298, column: 13, scope: !2346)
!2376 = !DILocation(line: 2298, column: 24, scope: !2346)
!2377 = !DILocation(line: 2298, column: 22, scope: !2346)
!2378 = !DILocation(line: 2298, column: 11, scope: !2346)
!2379 = !DILocation(line: 2299, column: 25, scope: !2346)
!2380 = !DILocation(line: 2299, column: 35, scope: !2346)
!2381 = !DILocation(line: 2299, column: 13, scope: !2346)
!2382 = !DILocation(line: 2299, column: 11, scope: !2346)
!2383 = !DILocation(line: 2300, column: 13, scope: !2346)
!2384 = !DILocation(line: 2300, column: 22, scope: !2346)
!2385 = !DILocation(line: 2300, column: 11, scope: !2346)
!2386 = !DILocation(line: 2301, column: 14, scope: !2346)
!2387 = !DILocation(line: 2301, column: 23, scope: !2346)
!2388 = !DILocation(line: 2301, column: 11, scope: !2346)
!2389 = !DILocation(line: 2302, column: 5, scope: !2390)
!2390 = distinct !DILexicalBlock(scope: !2346, file: !78, line: 2302, column: 5)
!2391 = !DILocation(line: 2302, column: 15, scope: !2390)
!2392 = !DILocation(line: 2302, column: 5, scope: !2346)
!2393 = !DILocation(line: 2304, column: 10, scope: !2394)
!2394 = distinct !DILexicalBlock(scope: !2390, file: !78, line: 2303, column: 2)
!2395 = !DILocation(line: 2304, column: 3, scope: !2394)
!2396 = !DILocation(line: 2308, column: 11, scope: !2397)
!2397 = distinct !DILexicalBlock(scope: !2390, file: !78, line: 2307, column: 2)
!2398 = !DILocation(line: 2308, column: 10, scope: !2397)
!2399 = !DILocation(line: 2308, column: 3, scope: !2397)
!2400 = !DILocation(line: 2310, column: 1, scope: !2346)
!2401 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !78, file: !78, line: 2329, type: !2347, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2402 = !DILocalVariable(name: "value", arg: 1, scope: !2401, file: !78, line: 2329, type: !86)
!2403 = !DILocation(line: 2329, column: 29, scope: !2401)
!2404 = !DILocalVariable(name: "factor", arg: 2, scope: !2401, file: !78, line: 2329, type: !17)
!2405 = !DILocation(line: 2329, column: 39, scope: !2401)
!2406 = !DILocalVariable(name: "u32Temp1", scope: !2401, file: !78, line: 2331, type: !742)
!2407 = !DILocation(line: 2331, column: 6, scope: !2401)
!2408 = !DILocalVariable(name: "u32Temp2", scope: !2401, file: !78, line: 2331, type: !742)
!2409 = !DILocation(line: 2331, column: 17, scope: !2401)
!2410 = !DILocalVariable(name: "u32Temp3", scope: !2401, file: !78, line: 2331, type: !742)
!2411 = !DILocation(line: 2331, column: 26, scope: !2401)
!2412 = !DILocalVariable(name: "u8SignBit", scope: !2401, file: !78, line: 2332, type: !17)
!2413 = !DILocation(line: 2332, column: 5, scope: !2401)
!2414 = !DILocation(line: 2334, column: 5, scope: !2415)
!2415 = distinct !DILexicalBlock(scope: !2401, file: !78, line: 2334, column: 5)
!2416 = !DILocation(line: 2334, column: 10, scope: !2415)
!2417 = !DILocation(line: 2334, column: 5, scope: !2401)
!2418 = !DILocation(line: 2336, column: 15, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2415, file: !78, line: 2335, column: 2)
!2420 = !DILocation(line: 2336, column: 14, scope: !2419)
!2421 = !DILocation(line: 2336, column: 12, scope: !2419)
!2422 = !DILocation(line: 2337, column: 13, scope: !2419)
!2423 = !DILocation(line: 2338, column: 2, scope: !2419)
!2424 = !DILocation(line: 2341, column: 14, scope: !2425)
!2425 = distinct !DILexicalBlock(scope: !2415, file: !78, line: 2340, column: 2)
!2426 = !DILocation(line: 2341, column: 12, scope: !2425)
!2427 = !DILocation(line: 2342, column: 13, scope: !2425)
!2428 = !DILocation(line: 2345, column: 13, scope: !2401)
!2429 = !DILocation(line: 2345, column: 24, scope: !2401)
!2430 = !DILocation(line: 2345, column: 22, scope: !2401)
!2431 = !DILocation(line: 2345, column: 11, scope: !2401)
!2432 = !DILocation(line: 2346, column: 25, scope: !2401)
!2433 = !DILocation(line: 2346, column: 35, scope: !2401)
!2434 = !DILocation(line: 2346, column: 13, scope: !2401)
!2435 = !DILocation(line: 2346, column: 11, scope: !2401)
!2436 = !DILocation(line: 2347, column: 13, scope: !2401)
!2437 = !DILocation(line: 2347, column: 22, scope: !2401)
!2438 = !DILocation(line: 2347, column: 11, scope: !2401)
!2439 = !DILocation(line: 2348, column: 14, scope: !2401)
!2440 = !DILocation(line: 2348, column: 23, scope: !2401)
!2441 = !DILocation(line: 2348, column: 11, scope: !2401)
!2442 = !DILocation(line: 2349, column: 5, scope: !2443)
!2443 = distinct !DILexicalBlock(scope: !2401, file: !78, line: 2349, column: 5)
!2444 = !DILocation(line: 2349, column: 15, scope: !2443)
!2445 = !DILocation(line: 2349, column: 5, scope: !2401)
!2446 = !DILocation(line: 2351, column: 6, scope: !2447)
!2447 = distinct !DILexicalBlock(scope: !2448, file: !78, line: 2351, column: 6)
!2448 = distinct !DILexicalBlock(scope: !2443, file: !78, line: 2350, column: 2)
!2449 = !DILocation(line: 2351, column: 14, scope: !2447)
!2450 = !DILocation(line: 2351, column: 6, scope: !2448)
!2451 = !DILocation(line: 2352, column: 11, scope: !2447)
!2452 = !DILocation(line: 2352, column: 4, scope: !2447)
!2453 = !DILocation(line: 2354, column: 4, scope: !2447)
!2454 = !DILocation(line: 2358, column: 6, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2456, file: !78, line: 2358, column: 6)
!2456 = distinct !DILexicalBlock(scope: !2443, file: !78, line: 2357, column: 2)
!2457 = !DILocation(line: 2358, column: 14, scope: !2455)
!2458 = !DILocation(line: 2358, column: 6, scope: !2456)
!2459 = !DILocation(line: 2359, column: 12, scope: !2455)
!2460 = !DILocation(line: 2359, column: 11, scope: !2455)
!2461 = !DILocation(line: 2359, column: 4, scope: !2455)
!2462 = !DILocation(line: 2361, column: 4, scope: !2455)
!2463 = !DILocation(line: 2363, column: 1, scope: !2401)
!2464 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !78, file: !78, line: 2380, type: !2465, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2465 = !DISubroutineType(types: !2466)
!2466 = !{!742, !742, !742, !17}
!2467 = !DILocalVariable(name: "value", arg: 1, scope: !2464, file: !78, line: 2380, type: !742)
!2468 = !DILocation(line: 2380, column: 39, scope: !2464)
!2469 = !DILocalVariable(name: "factor", arg: 2, scope: !2464, file: !78, line: 2380, type: !742)
!2470 = !DILocation(line: 2380, column: 49, scope: !2464)
!2471 = !DILocalVariable(name: "power", arg: 3, scope: !2464, file: !78, line: 2380, type: !17)
!2472 = !DILocation(line: 2380, column: 60, scope: !2464)
!2473 = !DILocalVariable(name: "u32Temp1", scope: !2464, file: !78, line: 2382, type: !742)
!2474 = !DILocation(line: 2382, column: 6, scope: !2464)
!2475 = !DILocalVariable(name: "u32Temp2", scope: !2464, file: !78, line: 2382, type: !742)
!2476 = !DILocation(line: 2382, column: 20, scope: !2464)
!2477 = !DILocation(line: 2383, column: 5, scope: !2478)
!2478 = distinct !DILexicalBlock(scope: !2464, file: !78, line: 2383, column: 5)
!2479 = !DILocation(line: 2383, column: 10, scope: !2478)
!2480 = !DILocation(line: 2383, column: 5, scope: !2464)
!2481 = !DILocation(line: 2385, column: 9, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2478, file: !78, line: 2384, column: 2)
!2483 = !DILocation(line: 2386, column: 2, scope: !2482)
!2484 = !DILocation(line: 2387, column: 10, scope: !2485)
!2485 = distinct !DILexicalBlock(scope: !2478, file: !78, line: 2387, column: 10)
!2486 = !DILocation(line: 2387, column: 15, scope: !2485)
!2487 = !DILocation(line: 2387, column: 10, scope: !2478)
!2488 = !DILocation(line: 2389, column: 9, scope: !2489)
!2489 = distinct !DILexicalBlock(scope: !2485, file: !78, line: 2388, column: 2)
!2490 = !DILocation(line: 2390, column: 2, scope: !2489)
!2491 = !DILocation(line: 2395, column: 13, scope: !2464)
!2492 = !DILocation(line: 2395, column: 21, scope: !2464)
!2493 = !DILocation(line: 2395, column: 19, scope: !2464)
!2494 = !DILocation(line: 2395, column: 11, scope: !2464)
!2495 = !DILocation(line: 2396, column: 25, scope: !2464)
!2496 = !DILocation(line: 2396, column: 32, scope: !2464)
!2497 = !DILocation(line: 2396, column: 13, scope: !2464)
!2498 = !DILocation(line: 2396, column: 11, scope: !2464)
!2499 = !DILocation(line: 2397, column: 13, scope: !2464)
!2500 = !DILocation(line: 2397, column: 29, scope: !2464)
!2501 = !DILocation(line: 2397, column: 28, scope: !2464)
!2502 = !DILocation(line: 2397, column: 22, scope: !2464)
!2503 = !DILocation(line: 2397, column: 11, scope: !2464)
!2504 = !DILocation(line: 2398, column: 14, scope: !2464)
!2505 = !DILocation(line: 2398, column: 26, scope: !2464)
!2506 = !DILocation(line: 2398, column: 23, scope: !2464)
!2507 = !DILocation(line: 2398, column: 11, scope: !2464)
!2508 = !DILocation(line: 2399, column: 6, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2464, file: !78, line: 2399, column: 5)
!2510 = !DILocation(line: 2399, column: 20, scope: !2509)
!2511 = !DILocation(line: 2399, column: 19, scope: !2509)
!2512 = !DILocation(line: 2399, column: 14, scope: !2509)
!2513 = !DILocation(line: 2399, column: 28, scope: !2509)
!2514 = !DILocation(line: 2399, column: 5, scope: !2464)
!2515 = !DILocation(line: 2401, column: 10, scope: !2516)
!2516 = distinct !DILexicalBlock(scope: !2509, file: !78, line: 2400, column: 2)
!2517 = !DILocation(line: 2401, column: 3, scope: !2516)
!2518 = !DILocation(line: 2405, column: 3, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2509, file: !78, line: 2404, column: 2)
!2520 = !DILocation(line: 2407, column: 1, scope: !2464)
!2521 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !78, file: !78, line: 2425, type: !2522, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2522 = !DISubroutineType(types: !2523)
!2523 = !{!86, !86, !86, !17}
!2524 = !DILocalVariable(name: "value", arg: 1, scope: !2521, file: !78, line: 2425, type: !86)
!2525 = !DILocation(line: 2425, column: 39, scope: !2521)
!2526 = !DILocalVariable(name: "factor", arg: 2, scope: !2521, file: !78, line: 2425, type: !86)
!2527 = !DILocation(line: 2425, column: 50, scope: !2521)
!2528 = !DILocalVariable(name: "power", arg: 3, scope: !2521, file: !78, line: 2425, type: !17)
!2529 = !DILocation(line: 2425, column: 61, scope: !2521)
!2530 = !DILocalVariable(name: "u32Temp1", scope: !2521, file: !78, line: 2427, type: !742)
!2531 = !DILocation(line: 2427, column: 6, scope: !2521)
!2532 = !DILocalVariable(name: "u32Temp2", scope: !2521, file: !78, line: 2427, type: !742)
!2533 = !DILocation(line: 2427, column: 17, scope: !2521)
!2534 = !DILocalVariable(name: "u32Temp3", scope: !2521, file: !78, line: 2427, type: !742)
!2535 = !DILocation(line: 2427, column: 26, scope: !2521)
!2536 = !DILocalVariable(name: "u32Temp4", scope: !2521, file: !78, line: 2427, type: !742)
!2537 = !DILocation(line: 2427, column: 35, scope: !2521)
!2538 = !DILocalVariable(name: "u8SignBit", scope: !2521, file: !78, line: 2428, type: !17)
!2539 = !DILocation(line: 2428, column: 5, scope: !2521)
!2540 = !DILocation(line: 2430, column: 5, scope: !2541)
!2541 = distinct !DILexicalBlock(scope: !2521, file: !78, line: 2430, column: 5)
!2542 = !DILocation(line: 2430, column: 10, scope: !2541)
!2543 = !DILocation(line: 2430, column: 5, scope: !2521)
!2544 = !DILocation(line: 2432, column: 9, scope: !2545)
!2545 = distinct !DILexicalBlock(scope: !2541, file: !78, line: 2431, column: 2)
!2546 = !DILocation(line: 2433, column: 2, scope: !2545)
!2547 = !DILocation(line: 2434, column: 10, scope: !2548)
!2548 = distinct !DILexicalBlock(scope: !2541, file: !78, line: 2434, column: 10)
!2549 = !DILocation(line: 2434, column: 15, scope: !2548)
!2550 = !DILocation(line: 2434, column: 10, scope: !2541)
!2551 = !DILocation(line: 2436, column: 9, scope: !2552)
!2552 = distinct !DILexicalBlock(scope: !2548, file: !78, line: 2435, column: 2)
!2553 = !DILocation(line: 2437, column: 2, scope: !2552)
!2554 = !DILocation(line: 2443, column: 7, scope: !2555)
!2555 = distinct !DILexicalBlock(scope: !2521, file: !78, line: 2443, column: 5)
!2556 = !DILocation(line: 2443, column: 12, scope: !2555)
!2557 = !DILocation(line: 2443, column: 16, scope: !2555)
!2558 = !DILocation(line: 2443, column: 36, scope: !2555)
!2559 = !DILocation(line: 2443, column: 41, scope: !2555)
!2560 = !DILocation(line: 2443, column: 45, scope: !2555)
!2561 = !DILocation(line: 2445, column: 13, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2555, file: !78, line: 2444, column: 2)
!2563 = !DILocation(line: 2446, column: 2, scope: !2562)
!2564 = !DILocation(line: 2449, column: 13, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2555, file: !78, line: 2448, column: 2)
!2566 = !DILocation(line: 2452, column: 5, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2521, file: !78, line: 2452, column: 5)
!2568 = !DILocation(line: 2452, column: 10, scope: !2567)
!2569 = !DILocation(line: 2452, column: 5, scope: !2521)
!2570 = !DILocation(line: 2454, column: 15, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2567, file: !78, line: 2453, column: 2)
!2572 = !DILocation(line: 2454, column: 14, scope: !2571)
!2573 = !DILocation(line: 2454, column: 12, scope: !2571)
!2574 = !DILocation(line: 2455, column: 2, scope: !2571)
!2575 = !DILocation(line: 2458, column: 14, scope: !2576)
!2576 = distinct !DILexicalBlock(scope: !2567, file: !78, line: 2457, column: 2)
!2577 = !DILocation(line: 2458, column: 12, scope: !2576)
!2578 = !DILocation(line: 2461, column: 5, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2521, file: !78, line: 2461, column: 5)
!2580 = !DILocation(line: 2461, column: 11, scope: !2579)
!2581 = !DILocation(line: 2461, column: 5, scope: !2521)
!2582 = !DILocation(line: 2463, column: 15, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2579, file: !78, line: 2462, column: 2)
!2584 = !DILocation(line: 2463, column: 14, scope: !2583)
!2585 = !DILocation(line: 2463, column: 12, scope: !2583)
!2586 = !DILocation(line: 2464, column: 2, scope: !2583)
!2587 = !DILocation(line: 2467, column: 14, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2579, file: !78, line: 2466, column: 2)
!2589 = !DILocation(line: 2467, column: 12, scope: !2588)
!2590 = !DILocation(line: 2470, column: 13, scope: !2521)
!2591 = !DILocation(line: 2470, column: 24, scope: !2521)
!2592 = !DILocation(line: 2470, column: 22, scope: !2521)
!2593 = !DILocation(line: 2470, column: 11, scope: !2521)
!2594 = !DILocation(line: 2471, column: 25, scope: !2521)
!2595 = !DILocation(line: 2471, column: 35, scope: !2521)
!2596 = !DILocation(line: 2471, column: 13, scope: !2521)
!2597 = !DILocation(line: 2471, column: 11, scope: !2521)
!2598 = !DILocation(line: 2472, column: 13, scope: !2521)
!2599 = !DILocation(line: 2472, column: 29, scope: !2521)
!2600 = !DILocation(line: 2472, column: 28, scope: !2521)
!2601 = !DILocation(line: 2472, column: 22, scope: !2521)
!2602 = !DILocation(line: 2472, column: 11, scope: !2521)
!2603 = !DILocation(line: 2473, column: 14, scope: !2521)
!2604 = !DILocation(line: 2473, column: 26, scope: !2521)
!2605 = !DILocation(line: 2473, column: 23, scope: !2521)
!2606 = !DILocation(line: 2473, column: 11, scope: !2521)
!2607 = !DILocation(line: 2474, column: 6, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2521, file: !78, line: 2474, column: 5)
!2609 = !DILocation(line: 2474, column: 20, scope: !2608)
!2610 = !DILocation(line: 2474, column: 19, scope: !2608)
!2611 = !DILocation(line: 2474, column: 14, scope: !2608)
!2612 = !DILocation(line: 2474, column: 27, scope: !2608)
!2613 = !DILocation(line: 2474, column: 5, scope: !2521)
!2614 = !DILocation(line: 2476, column: 6, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2616, file: !78, line: 2476, column: 6)
!2616 = distinct !DILexicalBlock(scope: !2608, file: !78, line: 2475, column: 2)
!2617 = !DILocation(line: 2476, column: 16, scope: !2615)
!2618 = !DILocation(line: 2476, column: 6, scope: !2616)
!2619 = !DILocation(line: 2478, column: 7, scope: !2620)
!2620 = distinct !DILexicalBlock(scope: !2621, file: !78, line: 2478, column: 7)
!2621 = distinct !DILexicalBlock(scope: !2615, file: !78, line: 2477, column: 3)
!2622 = !DILocation(line: 2478, column: 15, scope: !2620)
!2623 = !DILocation(line: 2478, column: 7, scope: !2621)
!2624 = !DILocation(line: 2479, column: 12, scope: !2620)
!2625 = !DILocation(line: 2479, column: 5, scope: !2620)
!2626 = !DILocation(line: 2481, column: 5, scope: !2620)
!2627 = !DILocation(line: 2485, column: 12, scope: !2628)
!2628 = distinct !DILexicalBlock(scope: !2615, file: !78, line: 2484, column: 3)
!2629 = !DILocation(line: 2485, column: 11, scope: !2628)
!2630 = !DILocation(line: 2485, column: 4, scope: !2628)
!2631 = !DILocation(line: 2490, column: 6, scope: !2632)
!2632 = distinct !DILexicalBlock(scope: !2633, file: !78, line: 2490, column: 6)
!2633 = distinct !DILexicalBlock(scope: !2608, file: !78, line: 2489, column: 2)
!2634 = !DILocation(line: 2490, column: 16, scope: !2632)
!2635 = !DILocation(line: 2490, column: 6, scope: !2633)
!2636 = !DILocation(line: 2492, column: 4, scope: !2637)
!2637 = distinct !DILexicalBlock(scope: !2632, file: !78, line: 2491, column: 3)
!2638 = !DILocation(line: 2496, column: 4, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2632, file: !78, line: 2495, column: 3)
!2640 = !DILocation(line: 2499, column: 1, scope: !2521)
!2641 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !78, file: !78, line: 2518, type: !2642, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2642 = !DISubroutineType(types: !2643)
!2643 = !{!86, !86, !6}
!2644 = !DILocalVariable(name: "value", arg: 1, scope: !2641, file: !78, line: 2518, type: !86)
!2645 = !DILocation(line: 2518, column: 29, scope: !2641)
!2646 = !DILocalVariable(name: "factor", arg: 2, scope: !2641, file: !78, line: 2518, type: !6)
!2647 = !DILocation(line: 2518, column: 39, scope: !2641)
!2648 = !DILocalVariable(name: "u32Temp1", scope: !2641, file: !78, line: 2520, type: !742)
!2649 = !DILocation(line: 2520, column: 6, scope: !2641)
!2650 = !DILocalVariable(name: "u32Temp2", scope: !2641, file: !78, line: 2520, type: !742)
!2651 = !DILocation(line: 2520, column: 17, scope: !2641)
!2652 = !DILocalVariable(name: "u32Temp3", scope: !2641, file: !78, line: 2520, type: !742)
!2653 = !DILocation(line: 2520, column: 26, scope: !2641)
!2654 = !DILocalVariable(name: "u32Temp4", scope: !2641, file: !78, line: 2520, type: !742)
!2655 = !DILocation(line: 2520, column: 35, scope: !2641)
!2656 = !DILocalVariable(name: "u8SignBit", scope: !2641, file: !78, line: 2521, type: !17)
!2657 = !DILocation(line: 2521, column: 5, scope: !2641)
!2658 = !DILocation(line: 2523, column: 7, scope: !2659)
!2659 = distinct !DILexicalBlock(scope: !2641, file: !78, line: 2523, column: 5)
!2660 = !DILocation(line: 2523, column: 12, scope: !2659)
!2661 = !DILocation(line: 2523, column: 16, scope: !2659)
!2662 = !DILocation(line: 2523, column: 20, scope: !2659)
!2663 = !DILocation(line: 2523, column: 26, scope: !2659)
!2664 = !DILocation(line: 2523, column: 31, scope: !2659)
!2665 = !DILocation(line: 2523, column: 36, scope: !2659)
!2666 = !DILocation(line: 2523, column: 41, scope: !2659)
!2667 = !DILocation(line: 2523, column: 45, scope: !2659)
!2668 = !DILocation(line: 2523, column: 49, scope: !2659)
!2669 = !DILocation(line: 2523, column: 55, scope: !2659)
!2670 = !DILocation(line: 2523, column: 5, scope: !2641)
!2671 = !DILocation(line: 2525, column: 13, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2659, file: !78, line: 2524, column: 2)
!2673 = !DILocation(line: 2526, column: 2, scope: !2672)
!2674 = !DILocation(line: 2529, column: 13, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2659, file: !78, line: 2528, column: 2)
!2676 = !DILocation(line: 2532, column: 5, scope: !2677)
!2677 = distinct !DILexicalBlock(scope: !2641, file: !78, line: 2532, column: 5)
!2678 = !DILocation(line: 2532, column: 10, scope: !2677)
!2679 = !DILocation(line: 2532, column: 5, scope: !2641)
!2680 = !DILocation(line: 2534, column: 15, scope: !2681)
!2681 = distinct !DILexicalBlock(scope: !2677, file: !78, line: 2533, column: 2)
!2682 = !DILocation(line: 2534, column: 14, scope: !2681)
!2683 = !DILocation(line: 2534, column: 12, scope: !2681)
!2684 = !DILocation(line: 2535, column: 2, scope: !2681)
!2685 = !DILocation(line: 2538, column: 14, scope: !2686)
!2686 = distinct !DILexicalBlock(scope: !2677, file: !78, line: 2537, column: 2)
!2687 = !DILocation(line: 2538, column: 12, scope: !2686)
!2688 = !DILocation(line: 2541, column: 5, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2641, file: !78, line: 2541, column: 5)
!2690 = !DILocation(line: 2541, column: 11, scope: !2689)
!2691 = !DILocation(line: 2541, column: 5, scope: !2641)
!2692 = !DILocation(line: 2543, column: 15, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2689, file: !78, line: 2542, column: 2)
!2694 = !DILocation(line: 2543, column: 14, scope: !2693)
!2695 = !DILocation(line: 2543, column: 12, scope: !2693)
!2696 = !DILocation(line: 2544, column: 2, scope: !2693)
!2697 = !DILocation(line: 2547, column: 14, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2689, file: !78, line: 2546, column: 2)
!2699 = !DILocation(line: 2547, column: 12, scope: !2698)
!2700 = !DILocation(line: 2550, column: 13, scope: !2641)
!2701 = !DILocation(line: 2550, column: 24, scope: !2641)
!2702 = !DILocation(line: 2550, column: 22, scope: !2641)
!2703 = !DILocation(line: 2550, column: 11, scope: !2641)
!2704 = !DILocation(line: 2551, column: 25, scope: !2641)
!2705 = !DILocation(line: 2551, column: 35, scope: !2641)
!2706 = !DILocation(line: 2551, column: 13, scope: !2641)
!2707 = !DILocation(line: 2551, column: 11, scope: !2641)
!2708 = !DILocation(line: 2552, column: 13, scope: !2641)
!2709 = !DILocation(line: 2552, column: 22, scope: !2641)
!2710 = !DILocation(line: 2552, column: 11, scope: !2641)
!2711 = !DILocation(line: 2553, column: 14, scope: !2641)
!2712 = !DILocation(line: 2553, column: 23, scope: !2641)
!2713 = !DILocation(line: 2553, column: 11, scope: !2641)
!2714 = !DILocation(line: 2554, column: 5, scope: !2715)
!2715 = distinct !DILexicalBlock(scope: !2641, file: !78, line: 2554, column: 5)
!2716 = !DILocation(line: 2554, column: 15, scope: !2715)
!2717 = !DILocation(line: 2554, column: 5, scope: !2641)
!2718 = !DILocation(line: 2556, column: 6, scope: !2719)
!2719 = distinct !DILexicalBlock(scope: !2720, file: !78, line: 2556, column: 6)
!2720 = distinct !DILexicalBlock(scope: !2715, file: !78, line: 2555, column: 2)
!2721 = !DILocation(line: 2556, column: 14, scope: !2719)
!2722 = !DILocation(line: 2556, column: 6, scope: !2720)
!2723 = !DILocation(line: 2557, column: 11, scope: !2719)
!2724 = !DILocation(line: 2557, column: 4, scope: !2719)
!2725 = !DILocation(line: 2559, column: 4, scope: !2719)
!2726 = !DILocation(line: 2563, column: 11, scope: !2727)
!2727 = distinct !DILexicalBlock(scope: !2715, file: !78, line: 2562, column: 2)
!2728 = !DILocation(line: 2563, column: 10, scope: !2727)
!2729 = !DILocation(line: 2563, column: 3, scope: !2727)
!2730 = !DILocation(line: 2565, column: 1, scope: !2641)
!2731 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !78, file: !78, line: 2584, type: !2642, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2732 = !DILocalVariable(name: "value", arg: 1, scope: !2731, file: !78, line: 2584, type: !86)
!2733 = !DILocation(line: 2584, column: 29, scope: !2731)
!2734 = !DILocalVariable(name: "factor", arg: 2, scope: !2731, file: !78, line: 2584, type: !6)
!2735 = !DILocation(line: 2584, column: 39, scope: !2731)
!2736 = !DILocalVariable(name: "u32Temp1", scope: !2731, file: !78, line: 2586, type: !742)
!2737 = !DILocation(line: 2586, column: 6, scope: !2731)
!2738 = !DILocalVariable(name: "u32Temp2", scope: !2731, file: !78, line: 2586, type: !742)
!2739 = !DILocation(line: 2586, column: 17, scope: !2731)
!2740 = !DILocalVariable(name: "u32Temp3", scope: !2731, file: !78, line: 2586, type: !742)
!2741 = !DILocation(line: 2586, column: 26, scope: !2731)
!2742 = !DILocalVariable(name: "u32Temp4", scope: !2731, file: !78, line: 2586, type: !742)
!2743 = !DILocation(line: 2586, column: 35, scope: !2731)
!2744 = !DILocalVariable(name: "u8SignBit", scope: !2731, file: !78, line: 2587, type: !17)
!2745 = !DILocation(line: 2587, column: 5, scope: !2731)
!2746 = !DILocation(line: 2589, column: 7, scope: !2747)
!2747 = distinct !DILexicalBlock(scope: !2731, file: !78, line: 2589, column: 5)
!2748 = !DILocation(line: 2589, column: 12, scope: !2747)
!2749 = !DILocation(line: 2589, column: 16, scope: !2747)
!2750 = !DILocation(line: 2589, column: 20, scope: !2747)
!2751 = !DILocation(line: 2589, column: 26, scope: !2747)
!2752 = !DILocation(line: 2589, column: 31, scope: !2747)
!2753 = !DILocation(line: 2589, column: 36, scope: !2747)
!2754 = !DILocation(line: 2589, column: 41, scope: !2747)
!2755 = !DILocation(line: 2589, column: 45, scope: !2747)
!2756 = !DILocation(line: 2589, column: 49, scope: !2747)
!2757 = !DILocation(line: 2589, column: 55, scope: !2747)
!2758 = !DILocation(line: 2589, column: 5, scope: !2731)
!2759 = !DILocation(line: 2591, column: 13, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2747, file: !78, line: 2590, column: 2)
!2761 = !DILocation(line: 2592, column: 2, scope: !2760)
!2762 = !DILocation(line: 2595, column: 13, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2747, file: !78, line: 2594, column: 2)
!2764 = !DILocation(line: 2598, column: 5, scope: !2765)
!2765 = distinct !DILexicalBlock(scope: !2731, file: !78, line: 2598, column: 5)
!2766 = !DILocation(line: 2598, column: 10, scope: !2765)
!2767 = !DILocation(line: 2598, column: 5, scope: !2731)
!2768 = !DILocation(line: 2600, column: 15, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2765, file: !78, line: 2599, column: 2)
!2770 = !DILocation(line: 2600, column: 14, scope: !2769)
!2771 = !DILocation(line: 2600, column: 12, scope: !2769)
!2772 = !DILocation(line: 2601, column: 2, scope: !2769)
!2773 = !DILocation(line: 2604, column: 14, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2765, file: !78, line: 2603, column: 2)
!2775 = !DILocation(line: 2604, column: 12, scope: !2774)
!2776 = !DILocation(line: 2607, column: 5, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2731, file: !78, line: 2607, column: 5)
!2778 = !DILocation(line: 2607, column: 11, scope: !2777)
!2779 = !DILocation(line: 2607, column: 5, scope: !2731)
!2780 = !DILocation(line: 2609, column: 15, scope: !2781)
!2781 = distinct !DILexicalBlock(scope: !2777, file: !78, line: 2608, column: 2)
!2782 = !DILocation(line: 2609, column: 14, scope: !2781)
!2783 = !DILocation(line: 2609, column: 12, scope: !2781)
!2784 = !DILocation(line: 2610, column: 2, scope: !2781)
!2785 = !DILocation(line: 2613, column: 14, scope: !2786)
!2786 = distinct !DILexicalBlock(scope: !2777, file: !78, line: 2612, column: 2)
!2787 = !DILocation(line: 2613, column: 12, scope: !2786)
!2788 = !DILocation(line: 2616, column: 13, scope: !2731)
!2789 = !DILocation(line: 2616, column: 24, scope: !2731)
!2790 = !DILocation(line: 2616, column: 22, scope: !2731)
!2791 = !DILocation(line: 2616, column: 11, scope: !2731)
!2792 = !DILocation(line: 2617, column: 25, scope: !2731)
!2793 = !DILocation(line: 2617, column: 35, scope: !2731)
!2794 = !DILocation(line: 2617, column: 13, scope: !2731)
!2795 = !DILocation(line: 2617, column: 11, scope: !2731)
!2796 = !DILocation(line: 2618, column: 13, scope: !2731)
!2797 = !DILocation(line: 2618, column: 22, scope: !2731)
!2798 = !DILocation(line: 2618, column: 11, scope: !2731)
!2799 = !DILocation(line: 2619, column: 14, scope: !2731)
!2800 = !DILocation(line: 2619, column: 23, scope: !2731)
!2801 = !DILocation(line: 2619, column: 11, scope: !2731)
!2802 = !DILocation(line: 2620, column: 6, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2731, file: !78, line: 2620, column: 5)
!2804 = !DILocation(line: 2620, column: 14, scope: !2803)
!2805 = !DILocation(line: 2620, column: 18, scope: !2803)
!2806 = !DILocation(line: 2620, column: 5, scope: !2731)
!2807 = !DILocation(line: 2622, column: 6, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2809, file: !78, line: 2622, column: 6)
!2809 = distinct !DILexicalBlock(scope: !2803, file: !78, line: 2621, column: 2)
!2810 = !DILocation(line: 2622, column: 16, scope: !2808)
!2811 = !DILocation(line: 2622, column: 6, scope: !2809)
!2812 = !DILocation(line: 2624, column: 7, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2814, file: !78, line: 2624, column: 7)
!2814 = distinct !DILexicalBlock(scope: !2808, file: !78, line: 2623, column: 3)
!2815 = !DILocation(line: 2624, column: 15, scope: !2813)
!2816 = !DILocation(line: 2624, column: 7, scope: !2814)
!2817 = !DILocation(line: 2625, column: 12, scope: !2813)
!2818 = !DILocation(line: 2625, column: 5, scope: !2813)
!2819 = !DILocation(line: 2627, column: 5, scope: !2813)
!2820 = !DILocation(line: 2631, column: 7, scope: !2821)
!2821 = distinct !DILexicalBlock(scope: !2822, file: !78, line: 2631, column: 7)
!2822 = distinct !DILexicalBlock(scope: !2808, file: !78, line: 2630, column: 3)
!2823 = !DILocation(line: 2631, column: 15, scope: !2821)
!2824 = !DILocation(line: 2631, column: 7, scope: !2822)
!2825 = !DILocation(line: 2632, column: 13, scope: !2821)
!2826 = !DILocation(line: 2632, column: 12, scope: !2821)
!2827 = !DILocation(line: 2632, column: 5, scope: !2821)
!2828 = !DILocation(line: 2634, column: 5, scope: !2821)
!2829 = !DILocation(line: 2639, column: 3, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2803, file: !78, line: 2638, column: 2)
!2831 = !DILocation(line: 2641, column: 1, scope: !2731)
!2832 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !78, file: !78, line: 2656, type: !2168, scopeLine: 2657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2833 = !DILocalVariable(name: "val1", arg: 1, scope: !2832, file: !78, line: 2656, type: !86)
!2834 = !DILocation(line: 2656, column: 25, scope: !2832)
!2835 = !DILocalVariable(name: "val2", arg: 2, scope: !2832, file: !78, line: 2656, type: !86)
!2836 = !DILocation(line: 2656, column: 35, scope: !2832)
!2837 = !DILocalVariable(name: "u32Temp1", scope: !2832, file: !78, line: 2658, type: !742)
!2838 = !DILocation(line: 2658, column: 6, scope: !2832)
!2839 = !DILocalVariable(name: "u32Temp2", scope: !2832, file: !78, line: 2658, type: !742)
!2840 = !DILocation(line: 2658, column: 17, scope: !2832)
!2841 = !DILocalVariable(name: "u32Temp3", scope: !2832, file: !78, line: 2658, type: !742)
!2842 = !DILocation(line: 2658, column: 26, scope: !2832)
!2843 = !DILocalVariable(name: "u32Temp4", scope: !2832, file: !78, line: 2658, type: !742)
!2844 = !DILocation(line: 2658, column: 35, scope: !2832)
!2845 = !DILocalVariable(name: "u8SignBit", scope: !2832, file: !78, line: 2659, type: !17)
!2846 = !DILocation(line: 2659, column: 5, scope: !2832)
!2847 = !DILocation(line: 2661, column: 7, scope: !2848)
!2848 = distinct !DILexicalBlock(scope: !2832, file: !78, line: 2661, column: 5)
!2849 = !DILocation(line: 2661, column: 11, scope: !2848)
!2850 = !DILocation(line: 2661, column: 15, scope: !2848)
!2851 = !DILocation(line: 2661, column: 33, scope: !2848)
!2852 = !DILocation(line: 2661, column: 37, scope: !2848)
!2853 = !DILocation(line: 2661, column: 41, scope: !2848)
!2854 = !DILocation(line: 2663, column: 13, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2848, file: !78, line: 2662, column: 2)
!2856 = !DILocation(line: 2664, column: 2, scope: !2855)
!2857 = !DILocation(line: 2667, column: 13, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2848, file: !78, line: 2666, column: 2)
!2859 = !DILocation(line: 2670, column: 5, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2832, file: !78, line: 2670, column: 5)
!2861 = !DILocation(line: 2670, column: 9, scope: !2860)
!2862 = !DILocation(line: 2670, column: 5, scope: !2832)
!2863 = !DILocation(line: 2672, column: 15, scope: !2864)
!2864 = distinct !DILexicalBlock(scope: !2860, file: !78, line: 2671, column: 2)
!2865 = !DILocation(line: 2672, column: 14, scope: !2864)
!2866 = !DILocation(line: 2672, column: 12, scope: !2864)
!2867 = !DILocation(line: 2673, column: 2, scope: !2864)
!2868 = !DILocation(line: 2676, column: 14, scope: !2869)
!2869 = distinct !DILexicalBlock(scope: !2860, file: !78, line: 2675, column: 2)
!2870 = !DILocation(line: 2676, column: 12, scope: !2869)
!2871 = !DILocation(line: 2679, column: 5, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2832, file: !78, line: 2679, column: 5)
!2873 = !DILocation(line: 2679, column: 9, scope: !2872)
!2874 = !DILocation(line: 2679, column: 5, scope: !2832)
!2875 = !DILocation(line: 2681, column: 15, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2872, file: !78, line: 2680, column: 2)
!2877 = !DILocation(line: 2681, column: 14, scope: !2876)
!2878 = !DILocation(line: 2681, column: 12, scope: !2876)
!2879 = !DILocation(line: 2682, column: 2, scope: !2876)
!2880 = !DILocation(line: 2685, column: 14, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2872, file: !78, line: 2684, column: 2)
!2882 = !DILocation(line: 2685, column: 12, scope: !2881)
!2883 = !DILocation(line: 2688, column: 13, scope: !2832)
!2884 = !DILocation(line: 2688, column: 24, scope: !2832)
!2885 = !DILocation(line: 2688, column: 22, scope: !2832)
!2886 = !DILocation(line: 2688, column: 11, scope: !2832)
!2887 = !DILocation(line: 2689, column: 25, scope: !2832)
!2888 = !DILocation(line: 2689, column: 35, scope: !2832)
!2889 = !DILocation(line: 2689, column: 13, scope: !2832)
!2890 = !DILocation(line: 2689, column: 11, scope: !2832)
!2891 = !DILocation(line: 2690, column: 5, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2832, file: !78, line: 2690, column: 5)
!2893 = !DILocation(line: 2690, column: 13, scope: !2892)
!2894 = !DILocation(line: 2690, column: 5, scope: !2832)
!2895 = !DILocation(line: 2692, column: 6, scope: !2896)
!2896 = distinct !DILexicalBlock(scope: !2897, file: !78, line: 2692, column: 6)
!2897 = distinct !DILexicalBlock(scope: !2892, file: !78, line: 2691, column: 2)
!2898 = !DILocation(line: 2692, column: 16, scope: !2896)
!2899 = !DILocation(line: 2692, column: 6, scope: !2897)
!2900 = !DILocation(line: 2694, column: 7, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2902, file: !78, line: 2694, column: 7)
!2902 = distinct !DILexicalBlock(scope: !2896, file: !78, line: 2693, column: 3)
!2903 = !DILocation(line: 2694, column: 15, scope: !2901)
!2904 = !DILocation(line: 2694, column: 7, scope: !2902)
!2905 = !DILocation(line: 2695, column: 12, scope: !2901)
!2906 = !DILocation(line: 2695, column: 5, scope: !2901)
!2907 = !DILocation(line: 2697, column: 5, scope: !2901)
!2908 = !DILocation(line: 2701, column: 7, scope: !2909)
!2909 = distinct !DILexicalBlock(scope: !2910, file: !78, line: 2701, column: 7)
!2910 = distinct !DILexicalBlock(scope: !2896, file: !78, line: 2700, column: 3)
!2911 = !DILocation(line: 2701, column: 15, scope: !2909)
!2912 = !DILocation(line: 2701, column: 7, scope: !2910)
!2913 = !DILocation(line: 2702, column: 13, scope: !2909)
!2914 = !DILocation(line: 2702, column: 12, scope: !2909)
!2915 = !DILocation(line: 2702, column: 5, scope: !2909)
!2916 = !DILocation(line: 2704, column: 5, scope: !2909)
!2917 = !DILocation(line: 2709, column: 6, scope: !2918)
!2918 = distinct !DILexicalBlock(scope: !2919, file: !78, line: 2709, column: 6)
!2919 = distinct !DILexicalBlock(scope: !2892, file: !78, line: 2708, column: 2)
!2920 = !DILocation(line: 2709, column: 16, scope: !2918)
!2921 = !DILocation(line: 2709, column: 6, scope: !2919)
!2922 = !DILocation(line: 2711, column: 4, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2918, file: !78, line: 2710, column: 3)
!2924 = !DILocation(line: 2715, column: 4, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2918, file: !78, line: 2714, column: 3)
!2926 = !DILocation(line: 2719, column: 1, scope: !2832)
!2927 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !78, file: !78, line: 2737, type: !2064, scopeLine: 2738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2928 = !DILocalVariable(name: "value", arg: 1, scope: !2927, file: !78, line: 2737, type: !86)
!2929 = !DILocation(line: 2737, column: 31, scope: !2927)
!2930 = !DILocalVariable(name: "factor", arg: 2, scope: !2927, file: !78, line: 2737, type: !742)
!2931 = !DILocation(line: 2737, column: 42, scope: !2927)
!2932 = !DILocalVariable(name: "u32Temp1", scope: !2927, file: !78, line: 2739, type: !742)
!2933 = !DILocation(line: 2739, column: 6, scope: !2927)
!2934 = !DILocalVariable(name: "u32Temp2", scope: !2927, file: !78, line: 2739, type: !742)
!2935 = !DILocation(line: 2739, column: 17, scope: !2927)
!2936 = !DILocalVariable(name: "u8SignBit", scope: !2927, file: !78, line: 2740, type: !17)
!2937 = !DILocation(line: 2740, column: 5, scope: !2927)
!2938 = !DILocation(line: 2742, column: 5, scope: !2939)
!2939 = distinct !DILexicalBlock(scope: !2927, file: !78, line: 2742, column: 5)
!2940 = !DILocation(line: 2742, column: 10, scope: !2939)
!2941 = !DILocation(line: 2742, column: 5, scope: !2927)
!2942 = !DILocation(line: 2744, column: 15, scope: !2943)
!2943 = distinct !DILexicalBlock(scope: !2939, file: !78, line: 2743, column: 2)
!2944 = !DILocation(line: 2744, column: 14, scope: !2943)
!2945 = !DILocation(line: 2744, column: 12, scope: !2943)
!2946 = !DILocation(line: 2745, column: 13, scope: !2943)
!2947 = !DILocation(line: 2746, column: 2, scope: !2943)
!2948 = !DILocation(line: 2749, column: 14, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2939, file: !78, line: 2748, column: 2)
!2950 = !DILocation(line: 2749, column: 12, scope: !2949)
!2951 = !DILocation(line: 2750, column: 13, scope: !2949)
!2952 = !DILocation(line: 2753, column: 25, scope: !2927)
!2953 = !DILocation(line: 2753, column: 35, scope: !2927)
!2954 = !DILocation(line: 2753, column: 13, scope: !2927)
!2955 = !DILocation(line: 2753, column: 11, scope: !2927)
!2956 = !DILocation(line: 2754, column: 13, scope: !2927)
!2957 = !DILocation(line: 2754, column: 22, scope: !2927)
!2958 = !DILocation(line: 2754, column: 11, scope: !2927)
!2959 = !DILocation(line: 2755, column: 5, scope: !2960)
!2960 = distinct !DILexicalBlock(scope: !2927, file: !78, line: 2755, column: 5)
!2961 = !DILocation(line: 2755, column: 15, scope: !2960)
!2962 = !DILocation(line: 2755, column: 5, scope: !2927)
!2963 = !DILocation(line: 2757, column: 10, scope: !2964)
!2964 = distinct !DILexicalBlock(scope: !2960, file: !78, line: 2756, column: 2)
!2965 = !DILocation(line: 2757, column: 3, scope: !2964)
!2966 = !DILocation(line: 2761, column: 11, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2960, file: !78, line: 2760, column: 2)
!2968 = !DILocation(line: 2761, column: 10, scope: !2967)
!2969 = !DILocation(line: 2761, column: 3, scope: !2967)
!2970 = !DILocation(line: 2763, column: 1, scope: !2927)
!2971 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !78, file: !78, line: 2779, type: !2168, scopeLine: 2780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2972 = !DILocalVariable(name: "value", arg: 1, scope: !2971, file: !78, line: 2779, type: !86)
!2973 = !DILocation(line: 2779, column: 31, scope: !2971)
!2974 = !DILocalVariable(name: "factor", arg: 2, scope: !2971, file: !78, line: 2779, type: !86)
!2975 = !DILocation(line: 2779, column: 42, scope: !2971)
!2976 = !DILocalVariable(name: "u32Temp1", scope: !2971, file: !78, line: 2781, type: !742)
!2977 = !DILocation(line: 2781, column: 6, scope: !2971)
!2978 = !DILocalVariable(name: "u32Temp2", scope: !2971, file: !78, line: 2781, type: !742)
!2979 = !DILocation(line: 2781, column: 17, scope: !2971)
!2980 = !DILocalVariable(name: "u32Temp3", scope: !2971, file: !78, line: 2781, type: !742)
!2981 = !DILocation(line: 2781, column: 26, scope: !2971)
!2982 = !DILocalVariable(name: "u8SignBit", scope: !2971, file: !78, line: 2782, type: !17)
!2983 = !DILocation(line: 2782, column: 5, scope: !2971)
!2984 = !DILocation(line: 2784, column: 7, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2971, file: !78, line: 2784, column: 5)
!2986 = !DILocation(line: 2784, column: 12, scope: !2985)
!2987 = !DILocation(line: 2784, column: 16, scope: !2985)
!2988 = !DILocation(line: 2784, column: 36, scope: !2985)
!2989 = !DILocation(line: 2784, column: 41, scope: !2985)
!2990 = !DILocation(line: 2784, column: 45, scope: !2985)
!2991 = !DILocation(line: 2786, column: 13, scope: !2992)
!2992 = distinct !DILexicalBlock(scope: !2985, file: !78, line: 2785, column: 2)
!2993 = !DILocation(line: 2787, column: 2, scope: !2992)
!2994 = !DILocation(line: 2790, column: 13, scope: !2995)
!2995 = distinct !DILexicalBlock(scope: !2985, file: !78, line: 2789, column: 2)
!2996 = !DILocation(line: 2793, column: 5, scope: !2997)
!2997 = distinct !DILexicalBlock(scope: !2971, file: !78, line: 2793, column: 5)
!2998 = !DILocation(line: 2793, column: 10, scope: !2997)
!2999 = !DILocation(line: 2793, column: 5, scope: !2971)
!3000 = !DILocation(line: 2795, column: 15, scope: !3001)
!3001 = distinct !DILexicalBlock(scope: !2997, file: !78, line: 2794, column: 2)
!3002 = !DILocation(line: 2795, column: 14, scope: !3001)
!3003 = !DILocation(line: 2795, column: 12, scope: !3001)
!3004 = !DILocation(line: 2796, column: 2, scope: !3001)
!3005 = !DILocation(line: 2799, column: 14, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2997, file: !78, line: 2798, column: 2)
!3007 = !DILocation(line: 2799, column: 12, scope: !3006)
!3008 = !DILocation(line: 2802, column: 5, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !2971, file: !78, line: 2802, column: 5)
!3010 = !DILocation(line: 2802, column: 11, scope: !3009)
!3011 = !DILocation(line: 2802, column: 5, scope: !2971)
!3012 = !DILocation(line: 2804, column: 15, scope: !3013)
!3013 = distinct !DILexicalBlock(scope: !3009, file: !78, line: 2803, column: 2)
!3014 = !DILocation(line: 2804, column: 14, scope: !3013)
!3015 = !DILocation(line: 2804, column: 12, scope: !3013)
!3016 = !DILocation(line: 2805, column: 2, scope: !3013)
!3017 = !DILocation(line: 2808, column: 14, scope: !3018)
!3018 = distinct !DILexicalBlock(scope: !3009, file: !78, line: 2807, column: 2)
!3019 = !DILocation(line: 2808, column: 12, scope: !3018)
!3020 = !DILocation(line: 2811, column: 25, scope: !2971)
!3021 = !DILocation(line: 2811, column: 35, scope: !2971)
!3022 = !DILocation(line: 2811, column: 13, scope: !2971)
!3023 = !DILocation(line: 2811, column: 11, scope: !2971)
!3024 = !DILocation(line: 2812, column: 5, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !2971, file: !78, line: 2812, column: 5)
!3026 = !DILocation(line: 2812, column: 15, scope: !3025)
!3027 = !DILocation(line: 2812, column: 5, scope: !2971)
!3028 = !DILocation(line: 2814, column: 10, scope: !3029)
!3029 = distinct !DILexicalBlock(scope: !3025, file: !78, line: 2813, column: 2)
!3030 = !DILocation(line: 2814, column: 3, scope: !3029)
!3031 = !DILocation(line: 2818, column: 11, scope: !3032)
!3032 = distinct !DILexicalBlock(scope: !3025, file: !78, line: 2817, column: 2)
!3033 = !DILocation(line: 2818, column: 10, scope: !3032)
!3034 = !DILocation(line: 2818, column: 3, scope: !3032)
!3035 = !DILocation(line: 2820, column: 1, scope: !2971)
!3036 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !78, file: !78, line: 2837, type: !3037, scopeLine: 2838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3037 = !DISubroutineType(types: !3038)
!3038 = !{!742, !742, !17}
!3039 = !DILocalVariable(name: "value", arg: 1, scope: !3036, file: !78, line: 2837, type: !742)
!3040 = !DILocation(line: 2837, column: 29, scope: !3036)
!3041 = !DILocalVariable(name: "factor", arg: 2, scope: !3036, file: !78, line: 2837, type: !17)
!3042 = !DILocation(line: 2837, column: 39, scope: !3036)
!3043 = !DILocalVariable(name: "u32Temp1", scope: !3036, file: !78, line: 2839, type: !742)
!3044 = !DILocation(line: 2839, column: 6, scope: !3036)
!3045 = !DILocalVariable(name: "u32Temp2", scope: !3036, file: !78, line: 2839, type: !742)
!3046 = !DILocation(line: 2839, column: 20, scope: !3036)
!3047 = !DILocation(line: 2840, column: 13, scope: !3036)
!3048 = !DILocation(line: 2840, column: 21, scope: !3036)
!3049 = !DILocation(line: 2840, column: 19, scope: !3036)
!3050 = !DILocation(line: 2840, column: 11, scope: !3036)
!3051 = !DILocation(line: 2841, column: 25, scope: !3036)
!3052 = !DILocation(line: 2841, column: 32, scope: !3036)
!3053 = !DILocation(line: 2841, column: 13, scope: !3036)
!3054 = !DILocation(line: 2841, column: 11, scope: !3036)
!3055 = !DILocation(line: 2842, column: 14, scope: !3036)
!3056 = !DILocation(line: 2842, column: 23, scope: !3036)
!3057 = !DILocation(line: 2842, column: 11, scope: !3036)
!3058 = !DILocation(line: 2843, column: 14, scope: !3036)
!3059 = !DILocation(line: 2843, column: 23, scope: !3036)
!3060 = !DILocation(line: 2843, column: 11, scope: !3036)
!3061 = !DILocation(line: 2844, column: 9, scope: !3036)
!3062 = !DILocation(line: 2844, column: 2, scope: !3036)
!3063 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !78, file: !78, line: 2863, type: !3037, scopeLine: 2864, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3064 = !DILocalVariable(name: "value", arg: 1, scope: !3063, file: !78, line: 2863, type: !742)
!3065 = !DILocation(line: 2863, column: 29, scope: !3063)
!3066 = !DILocalVariable(name: "factor", arg: 2, scope: !3063, file: !78, line: 2863, type: !17)
!3067 = !DILocation(line: 2863, column: 39, scope: !3063)
!3068 = !DILocalVariable(name: "u32Temp1", scope: !3063, file: !78, line: 2865, type: !742)
!3069 = !DILocation(line: 2865, column: 6, scope: !3063)
!3070 = !DILocalVariable(name: "u32Temp2", scope: !3063, file: !78, line: 2865, type: !742)
!3071 = !DILocation(line: 2865, column: 20, scope: !3063)
!3072 = !DILocation(line: 2866, column: 13, scope: !3063)
!3073 = !DILocation(line: 2866, column: 21, scope: !3063)
!3074 = !DILocation(line: 2866, column: 19, scope: !3063)
!3075 = !DILocation(line: 2866, column: 11, scope: !3063)
!3076 = !DILocation(line: 2867, column: 25, scope: !3063)
!3077 = !DILocation(line: 2867, column: 32, scope: !3063)
!3078 = !DILocation(line: 2867, column: 13, scope: !3063)
!3079 = !DILocation(line: 2867, column: 11, scope: !3063)
!3080 = !DILocation(line: 2868, column: 14, scope: !3063)
!3081 = !DILocation(line: 2868, column: 23, scope: !3063)
!3082 = !DILocation(line: 2868, column: 11, scope: !3063)
!3083 = !DILocation(line: 2869, column: 14, scope: !3063)
!3084 = !DILocation(line: 2869, column: 23, scope: !3063)
!3085 = !DILocation(line: 2869, column: 11, scope: !3063)
!3086 = !DILocation(line: 2870, column: 6, scope: !3087)
!3087 = distinct !DILexicalBlock(scope: !3063, file: !78, line: 2870, column: 5)
!3088 = !DILocation(line: 2870, column: 14, scope: !3087)
!3089 = !DILocation(line: 2870, column: 19, scope: !3087)
!3090 = !DILocation(line: 2870, column: 5, scope: !3063)
!3091 = !DILocation(line: 2872, column: 10, scope: !3092)
!3092 = distinct !DILexicalBlock(scope: !3087, file: !78, line: 2871, column: 2)
!3093 = !DILocation(line: 2872, column: 3, scope: !3092)
!3094 = !DILocation(line: 2876, column: 3, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3087, file: !78, line: 2875, column: 2)
!3096 = !DILocation(line: 2879, column: 1, scope: !3063)
!3097 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !78, file: !78, line: 2898, type: !3098, scopeLine: 2899, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3098 = !DISubroutineType(types: !3099)
!3099 = !{!742, !742, !6}
!3100 = !DILocalVariable(name: "value", arg: 1, scope: !3097, file: !78, line: 2898, type: !742)
!3101 = !DILocation(line: 2898, column: 29, scope: !3097)
!3102 = !DILocalVariable(name: "factor", arg: 2, scope: !3097, file: !78, line: 2898, type: !6)
!3103 = !DILocation(line: 2898, column: 39, scope: !3097)
!3104 = !DILocalVariable(name: "u32Temp1", scope: !3097, file: !78, line: 2900, type: !742)
!3105 = !DILocation(line: 2900, column: 6, scope: !3097)
!3106 = !DILocalVariable(name: "u32Temp2", scope: !3097, file: !78, line: 2900, type: !742)
!3107 = !DILocation(line: 2900, column: 20, scope: !3097)
!3108 = !DILocation(line: 2901, column: 5, scope: !3109)
!3109 = distinct !DILexicalBlock(scope: !3097, file: !78, line: 2901, column: 5)
!3110 = !DILocation(line: 2901, column: 12, scope: !3109)
!3111 = !DILocation(line: 2901, column: 5, scope: !3097)
!3112 = !DILocation(line: 2904, column: 14, scope: !3113)
!3113 = distinct !DILexicalBlock(scope: !3109, file: !78, line: 2902, column: 2)
!3114 = !DILocation(line: 2904, column: 22, scope: !3113)
!3115 = !DILocation(line: 2904, column: 20, scope: !3113)
!3116 = !DILocation(line: 2904, column: 12, scope: !3113)
!3117 = !DILocation(line: 2905, column: 26, scope: !3113)
!3118 = !DILocation(line: 2905, column: 33, scope: !3113)
!3119 = !DILocation(line: 2905, column: 14, scope: !3113)
!3120 = !DILocation(line: 2905, column: 12, scope: !3113)
!3121 = !DILocation(line: 2906, column: 14, scope: !3113)
!3122 = !DILocation(line: 2906, column: 23, scope: !3113)
!3123 = !DILocation(line: 2906, column: 12, scope: !3113)
!3124 = !DILocation(line: 2907, column: 15, scope: !3113)
!3125 = !DILocation(line: 2907, column: 24, scope: !3113)
!3126 = !DILocation(line: 2907, column: 12, scope: !3113)
!3127 = !DILocation(line: 2908, column: 10, scope: !3113)
!3128 = !DILocation(line: 2908, column: 3, scope: !3113)
!3129 = !DILocation(line: 2912, column: 3, scope: !3130)
!3130 = distinct !DILexicalBlock(scope: !3109, file: !78, line: 2911, column: 2)
!3131 = !DILocation(line: 2914, column: 1, scope: !3097)
!3132 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !78, file: !78, line: 2933, type: !3098, scopeLine: 2934, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3133 = !DILocalVariable(name: "value", arg: 1, scope: !3132, file: !78, line: 2933, type: !742)
!3134 = !DILocation(line: 2933, column: 29, scope: !3132)
!3135 = !DILocalVariable(name: "factor", arg: 2, scope: !3132, file: !78, line: 2933, type: !6)
!3136 = !DILocation(line: 2933, column: 39, scope: !3132)
!3137 = !DILocalVariable(name: "u32Temp1", scope: !3132, file: !78, line: 2935, type: !742)
!3138 = !DILocation(line: 2935, column: 6, scope: !3132)
!3139 = !DILocalVariable(name: "u32Temp2", scope: !3132, file: !78, line: 2935, type: !742)
!3140 = !DILocation(line: 2935, column: 20, scope: !3132)
!3141 = !DILocation(line: 2936, column: 5, scope: !3142)
!3142 = distinct !DILexicalBlock(scope: !3132, file: !78, line: 2936, column: 5)
!3143 = !DILocation(line: 2936, column: 12, scope: !3142)
!3144 = !DILocation(line: 2936, column: 5, scope: !3132)
!3145 = !DILocation(line: 2938, column: 3, scope: !3146)
!3146 = distinct !DILexicalBlock(scope: !3142, file: !78, line: 2937, column: 2)
!3147 = !DILocation(line: 2942, column: 14, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3142, file: !78, line: 2941, column: 2)
!3149 = !DILocation(line: 2942, column: 22, scope: !3148)
!3150 = !DILocation(line: 2942, column: 20, scope: !3148)
!3151 = !DILocation(line: 2942, column: 12, scope: !3148)
!3152 = !DILocation(line: 2943, column: 26, scope: !3148)
!3153 = !DILocation(line: 2943, column: 33, scope: !3148)
!3154 = !DILocation(line: 2943, column: 14, scope: !3148)
!3155 = !DILocation(line: 2943, column: 12, scope: !3148)
!3156 = !DILocation(line: 2944, column: 14, scope: !3148)
!3157 = !DILocation(line: 2944, column: 23, scope: !3148)
!3158 = !DILocation(line: 2944, column: 12, scope: !3148)
!3159 = !DILocation(line: 2945, column: 15, scope: !3148)
!3160 = !DILocation(line: 2945, column: 24, scope: !3148)
!3161 = !DILocation(line: 2945, column: 12, scope: !3148)
!3162 = !DILocation(line: 2946, column: 7, scope: !3163)
!3163 = distinct !DILexicalBlock(scope: !3148, file: !78, line: 2946, column: 6)
!3164 = !DILocation(line: 2946, column: 16, scope: !3163)
!3165 = !DILocation(line: 2946, column: 22, scope: !3163)
!3166 = !DILocation(line: 2946, column: 6, scope: !3148)
!3167 = !DILocation(line: 2948, column: 11, scope: !3168)
!3168 = distinct !DILexicalBlock(scope: !3163, file: !78, line: 2947, column: 3)
!3169 = !DILocation(line: 2948, column: 4, scope: !3168)
!3170 = !DILocation(line: 2952, column: 4, scope: !3171)
!3171 = distinct !DILexicalBlock(scope: !3163, file: !78, line: 2951, column: 3)
!3172 = !DILocation(line: 2955, column: 1, scope: !3132)
!3173 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !78, file: !78, line: 2977, type: !307, scopeLine: 2978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3174 = !DILocalVariable(name: "value", arg: 1, scope: !3173, file: !78, line: 2977, type: !13)
!3175 = !DILocation(line: 2977, column: 33, scope: !3173)
!3176 = !DILocalVariable(name: "factor", arg: 2, scope: !3173, file: !78, line: 2977, type: !13)
!3177 = !DILocation(line: 2977, column: 44, scope: !3173)
!3178 = !DILocation(line: 2979, column: 40, scope: !3173)
!3179 = !DILocation(line: 2979, column: 46, scope: !3173)
!3180 = !DILocation(line: 2979, column: 9, scope: !3173)
!3181 = !DILocation(line: 2979, column: 2, scope: !3173)
!3182 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !78, file: !78, line: 3001, type: !307, scopeLine: 3002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3183 = !DILocalVariable(name: "value", arg: 1, scope: !3182, file: !78, line: 3001, type: !13)
!3184 = !DILocation(line: 3001, column: 33, scope: !3182)
!3185 = !DILocalVariable(name: "factor", arg: 2, scope: !3182, file: !78, line: 3001, type: !13)
!3186 = !DILocation(line: 3001, column: 44, scope: !3182)
!3187 = !DILocation(line: 3003, column: 41, scope: !3182)
!3188 = !DILocation(line: 3003, column: 47, scope: !3182)
!3189 = !DILocation(line: 3003, column: 10, scope: !3182)
!3190 = !DILocation(line: 3003, column: 3, scope: !3182)
!3191 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !78, file: !78, line: 3026, type: !307, scopeLine: 3027, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3192 = !DILocalVariable(name: "value", arg: 1, scope: !3191, file: !78, line: 3026, type: !13)
!3193 = !DILocation(line: 3026, column: 32, scope: !3191)
!3194 = !DILocalVariable(name: "factor", arg: 2, scope: !3191, file: !78, line: 3026, type: !13)
!3195 = !DILocation(line: 3026, column: 43, scope: !3191)
!3196 = !DILocation(line: 3028, column: 41, scope: !3191)
!3197 = !DILocation(line: 3028, column: 47, scope: !3191)
!3198 = !DILocation(line: 3028, column: 10, scope: !3191)
!3199 = !DILocation(line: 3028, column: 3, scope: !3191)
!3200 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !78, file: !78, line: 3051, type: !307, scopeLine: 3052, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3201 = !DILocalVariable(name: "value", arg: 1, scope: !3200, file: !78, line: 3051, type: !13)
!3202 = !DILocation(line: 3051, column: 34, scope: !3200)
!3203 = !DILocalVariable(name: "factor", arg: 2, scope: !3200, file: !78, line: 3051, type: !13)
!3204 = !DILocation(line: 3051, column: 45, scope: !3200)
!3205 = !DILocation(line: 3053, column: 44, scope: !3200)
!3206 = !DILocation(line: 3053, column: 50, scope: !3200)
!3207 = !DILocation(line: 3053, column: 10, scope: !3200)
!3208 = !DILocation(line: 3053, column: 3, scope: !3200)
!3209 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !78, file: !78, line: 3076, type: !307, scopeLine: 3077, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3210 = !DILocalVariable(name: "value", arg: 1, scope: !3209, file: !78, line: 3076, type: !13)
!3211 = !DILocation(line: 3076, column: 33, scope: !3209)
!3212 = !DILocalVariable(name: "factor", arg: 2, scope: !3209, file: !78, line: 3076, type: !13)
!3213 = !DILocation(line: 3076, column: 44, scope: !3209)
!3214 = !DILocation(line: 3078, column: 44, scope: !3209)
!3215 = !DILocation(line: 3078, column: 50, scope: !3209)
!3216 = !DILocation(line: 3078, column: 10, scope: !3209)
!3217 = !DILocation(line: 3078, column: 3, scope: !3209)
!3218 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !78, file: !78, line: 3101, type: !307, scopeLine: 3102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3219 = !DILocalVariable(name: "value", arg: 1, scope: !3218, file: !78, line: 3101, type: !13)
!3220 = !DILocation(line: 3101, column: 31, scope: !3218)
!3221 = !DILocalVariable(name: "factor", arg: 2, scope: !3218, file: !78, line: 3101, type: !13)
!3222 = !DILocation(line: 3101, column: 42, scope: !3218)
!3223 = !DILocation(line: 3103, column: 44, scope: !3218)
!3224 = !DILocation(line: 3103, column: 50, scope: !3218)
!3225 = !DILocation(line: 3103, column: 10, scope: !3218)
!3226 = !DILocation(line: 3103, column: 3, scope: !3218)
!3227 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !78, file: !78, line: 3126, type: !307, scopeLine: 3127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3228 = !DILocalVariable(name: "value", arg: 1, scope: !3227, file: !78, line: 3126, type: !13)
!3229 = !DILocation(line: 3126, column: 33, scope: !3227)
!3230 = !DILocalVariable(name: "factor", arg: 2, scope: !3227, file: !78, line: 3126, type: !13)
!3231 = !DILocation(line: 3126, column: 44, scope: !3227)
!3232 = !DILocation(line: 3128, column: 44, scope: !3227)
!3233 = !DILocation(line: 3128, column: 50, scope: !3227)
!3234 = !DILocation(line: 3128, column: 10, scope: !3227)
!3235 = !DILocation(line: 3128, column: 3, scope: !3227)
!3236 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !78, file: !78, line: 3151, type: !307, scopeLine: 3152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3237 = !DILocalVariable(name: "value", arg: 1, scope: !3236, file: !78, line: 3151, type: !13)
!3238 = !DILocation(line: 3151, column: 32, scope: !3236)
!3239 = !DILocalVariable(name: "factor", arg: 2, scope: !3236, file: !78, line: 3151, type: !13)
!3240 = !DILocation(line: 3151, column: 43, scope: !3236)
!3241 = !DILocation(line: 3153, column: 44, scope: !3236)
!3242 = !DILocation(line: 3153, column: 50, scope: !3236)
!3243 = !DILocation(line: 3153, column: 10, scope: !3236)
!3244 = !DILocation(line: 3153, column: 3, scope: !3236)
!3245 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !78, file: !78, line: 3175, type: !307, scopeLine: 3176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3246 = !DILocalVariable(name: "value", arg: 1, scope: !3245, file: !78, line: 3175, type: !13)
!3247 = !DILocation(line: 3175, column: 31, scope: !3245)
!3248 = !DILocalVariable(name: "factor", arg: 2, scope: !3245, file: !78, line: 3175, type: !13)
!3249 = !DILocation(line: 3175, column: 42, scope: !3245)
!3250 = !DILocation(line: 3177, column: 44, scope: !3245)
!3251 = !DILocation(line: 3177, column: 50, scope: !3245)
!3252 = !DILocation(line: 3177, column: 10, scope: !3245)
!3253 = !DILocation(line: 3177, column: 3, scope: !3245)
!3254 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !78, file: !78, line: 3199, type: !307, scopeLine: 3200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3255 = !DILocalVariable(name: "value", arg: 1, scope: !3254, file: !78, line: 3199, type: !13)
!3256 = !DILocation(line: 3199, column: 30, scope: !3254)
!3257 = !DILocalVariable(name: "factor", arg: 2, scope: !3254, file: !78, line: 3199, type: !13)
!3258 = !DILocation(line: 3199, column: 41, scope: !3254)
!3259 = !DILocation(line: 3201, column: 44, scope: !3254)
!3260 = !DILocation(line: 3201, column: 50, scope: !3254)
!3261 = !DILocation(line: 3201, column: 10, scope: !3254)
!3262 = !DILocation(line: 3201, column: 3, scope: !3254)
!3263 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !78, file: !78, line: 3223, type: !307, scopeLine: 3224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3264 = !DILocalVariable(name: "value", arg: 1, scope: !3263, file: !78, line: 3223, type: !13)
!3265 = !DILocation(line: 3223, column: 33, scope: !3263)
!3266 = !DILocalVariable(name: "factor", arg: 2, scope: !3263, file: !78, line: 3223, type: !13)
!3267 = !DILocation(line: 3223, column: 44, scope: !3263)
!3268 = !DILocation(line: 3225, column: 44, scope: !3263)
!3269 = !DILocation(line: 3225, column: 50, scope: !3263)
!3270 = !DILocation(line: 3225, column: 10, scope: !3263)
!3271 = !DILocation(line: 3225, column: 3, scope: !3263)
!3272 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !78, file: !78, line: 3247, type: !307, scopeLine: 3248, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3273 = !DILocalVariable(name: "value", arg: 1, scope: !3272, file: !78, line: 3247, type: !13)
!3274 = !DILocation(line: 3247, column: 32, scope: !3272)
!3275 = !DILocalVariable(name: "factor", arg: 2, scope: !3272, file: !78, line: 3247, type: !13)
!3276 = !DILocation(line: 3247, column: 43, scope: !3272)
!3277 = !DILocation(line: 3249, column: 44, scope: !3272)
!3278 = !DILocation(line: 3249, column: 50, scope: !3272)
!3279 = !DILocation(line: 3249, column: 10, scope: !3272)
!3280 = !DILocation(line: 3249, column: 3, scope: !3272)
!3281 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !78, file: !78, line: 3271, type: !307, scopeLine: 3272, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3282 = !DILocalVariable(name: "value", arg: 1, scope: !3281, file: !78, line: 3271, type: !13)
!3283 = !DILocation(line: 3271, column: 31, scope: !3281)
!3284 = !DILocalVariable(name: "factor", arg: 2, scope: !3281, file: !78, line: 3271, type: !13)
!3285 = !DILocation(line: 3271, column: 42, scope: !3281)
!3286 = !DILocation(line: 3273, column: 44, scope: !3281)
!3287 = !DILocation(line: 3273, column: 50, scope: !3281)
!3288 = !DILocation(line: 3273, column: 10, scope: !3281)
!3289 = !DILocation(line: 3273, column: 3, scope: !3281)
!3290 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !78, file: !78, line: 3295, type: !307, scopeLine: 3296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3291 = !DILocalVariable(name: "value", arg: 1, scope: !3290, file: !78, line: 3295, type: !13)
!3292 = !DILocation(line: 3295, column: 30, scope: !3290)
!3293 = !DILocalVariable(name: "factor", arg: 2, scope: !3290, file: !78, line: 3295, type: !13)
!3294 = !DILocation(line: 3295, column: 41, scope: !3290)
!3295 = !DILocation(line: 3297, column: 44, scope: !3290)
!3296 = !DILocation(line: 3297, column: 50, scope: !3290)
!3297 = !DILocation(line: 3297, column: 10, scope: !3290)
!3298 = !DILocation(line: 3297, column: 3, scope: !3290)
!3299 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !78, file: !78, line: 3318, type: !396, scopeLine: 3319, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3300 = !DILocalVariable(name: "value", arg: 1, scope: !3299, file: !78, line: 3318, type: !13)
!3301 = !DILocation(line: 3318, column: 33, scope: !3299)
!3302 = !DILocalVariable(name: "factor", arg: 2, scope: !3299, file: !78, line: 3318, type: !22)
!3303 = !DILocation(line: 3318, column: 44, scope: !3299)
!3304 = !DILocation(line: 3320, column: 41, scope: !3299)
!3305 = !DILocation(line: 3320, column: 47, scope: !3299)
!3306 = !DILocation(line: 3320, column: 10, scope: !3299)
!3307 = !DILocation(line: 3320, column: 3, scope: !3299)
!3308 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !78, file: !78, line: 3341, type: !396, scopeLine: 3342, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3309 = !DILocalVariable(name: "value", arg: 1, scope: !3308, file: !78, line: 3341, type: !13)
!3310 = !DILocation(line: 3341, column: 32, scope: !3308)
!3311 = !DILocalVariable(name: "factor", arg: 2, scope: !3308, file: !78, line: 3341, type: !22)
!3312 = !DILocation(line: 3341, column: 43, scope: !3308)
!3313 = !DILocation(line: 3343, column: 33, scope: !3308)
!3314 = !DILocation(line: 3343, column: 39, scope: !3308)
!3315 = !DILocation(line: 3343, column: 2, scope: !3308)
!3316 = !DILocation(line: 3344, column: 1, scope: !3308)
!3317 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !78, file: !78, line: 3365, type: !396, scopeLine: 3366, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3318 = !DILocalVariable(name: "value", arg: 1, scope: !3317, file: !78, line: 3365, type: !13)
!3319 = !DILocation(line: 3365, column: 31, scope: !3317)
!3320 = !DILocalVariable(name: "factor", arg: 2, scope: !3317, file: !78, line: 3365, type: !22)
!3321 = !DILocation(line: 3365, column: 42, scope: !3317)
!3322 = !DILocation(line: 3367, column: 41, scope: !3317)
!3323 = !DILocation(line: 3367, column: 47, scope: !3317)
!3324 = !DILocation(line: 3367, column: 10, scope: !3317)
!3325 = !DILocation(line: 3367, column: 3, scope: !3317)
!3326 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !78, file: !78, line: 3390, type: !396, scopeLine: 3391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3327 = !DILocalVariable(name: "value", arg: 1, scope: !3326, file: !78, line: 3390, type: !13)
!3328 = !DILocation(line: 3390, column: 33, scope: !3326)
!3329 = !DILocalVariable(name: "factor", arg: 2, scope: !3326, file: !78, line: 3390, type: !22)
!3330 = !DILocation(line: 3390, column: 44, scope: !3326)
!3331 = !DILocation(line: 3392, column: 44, scope: !3326)
!3332 = !DILocation(line: 3392, column: 50, scope: !3326)
!3333 = !DILocation(line: 3392, column: 10, scope: !3326)
!3334 = !DILocation(line: 3392, column: 3, scope: !3326)
!3335 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !78, file: !78, line: 3415, type: !396, scopeLine: 3416, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3336 = !DILocalVariable(name: "value", arg: 1, scope: !3335, file: !78, line: 3415, type: !13)
!3337 = !DILocation(line: 3415, column: 32, scope: !3335)
!3338 = !DILocalVariable(name: "factor", arg: 2, scope: !3335, file: !78, line: 3415, type: !22)
!3339 = !DILocation(line: 3415, column: 43, scope: !3335)
!3340 = !DILocation(line: 3417, column: 44, scope: !3335)
!3341 = !DILocation(line: 3417, column: 50, scope: !3335)
!3342 = !DILocation(line: 3417, column: 10, scope: !3335)
!3343 = !DILocation(line: 3417, column: 3, scope: !3335)
!3344 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !78, file: !78, line: 3440, type: !396, scopeLine: 3441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3345 = !DILocalVariable(name: "value", arg: 1, scope: !3344, file: !78, line: 3440, type: !13)
!3346 = !DILocation(line: 3440, column: 31, scope: !3344)
!3347 = !DILocalVariable(name: "factor", arg: 2, scope: !3344, file: !78, line: 3440, type: !22)
!3348 = !DILocation(line: 3440, column: 42, scope: !3344)
!3349 = !DILocation(line: 3442, column: 44, scope: !3344)
!3350 = !DILocation(line: 3442, column: 50, scope: !3344)
!3351 = !DILocation(line: 3442, column: 10, scope: !3344)
!3352 = !DILocation(line: 3442, column: 3, scope: !3344)
!3353 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !78, file: !78, line: 3465, type: !396, scopeLine: 3466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3354 = !DILocalVariable(name: "value", arg: 1, scope: !3353, file: !78, line: 3465, type: !13)
!3355 = !DILocation(line: 3465, column: 33, scope: !3353)
!3356 = !DILocalVariable(name: "factor", arg: 2, scope: !3353, file: !78, line: 3465, type: !22)
!3357 = !DILocation(line: 3465, column: 44, scope: !3353)
!3358 = !DILocation(line: 3467, column: 44, scope: !3353)
!3359 = !DILocation(line: 3467, column: 50, scope: !3353)
!3360 = !DILocation(line: 3467, column: 10, scope: !3353)
!3361 = !DILocation(line: 3467, column: 3, scope: !3353)
!3362 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !78, file: !78, line: 3490, type: !396, scopeLine: 3491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3363 = !DILocalVariable(name: "value", arg: 1, scope: !3362, file: !78, line: 3490, type: !13)
!3364 = !DILocation(line: 3490, column: 32, scope: !3362)
!3365 = !DILocalVariable(name: "factor", arg: 2, scope: !3362, file: !78, line: 3490, type: !22)
!3366 = !DILocation(line: 3490, column: 43, scope: !3362)
!3367 = !DILocation(line: 3492, column: 44, scope: !3362)
!3368 = !DILocation(line: 3492, column: 50, scope: !3362)
!3369 = !DILocation(line: 3492, column: 10, scope: !3362)
!3370 = !DILocation(line: 3492, column: 3, scope: !3362)
!3371 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !78, file: !78, line: 3514, type: !396, scopeLine: 3515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3372 = !DILocalVariable(name: "value", arg: 1, scope: !3371, file: !78, line: 3514, type: !13)
!3373 = !DILocation(line: 3514, column: 31, scope: !3371)
!3374 = !DILocalVariable(name: "factor", arg: 2, scope: !3371, file: !78, line: 3514, type: !22)
!3375 = !DILocation(line: 3514, column: 42, scope: !3371)
!3376 = !DILocation(line: 3516, column: 44, scope: !3371)
!3377 = !DILocation(line: 3516, column: 50, scope: !3371)
!3378 = !DILocation(line: 3516, column: 10, scope: !3371)
!3379 = !DILocation(line: 3516, column: 3, scope: !3371)
!3380 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !78, file: !78, line: 3538, type: !396, scopeLine: 3539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3381 = !DILocalVariable(name: "value", arg: 1, scope: !3380, file: !78, line: 3538, type: !13)
!3382 = !DILocation(line: 3538, column: 30, scope: !3380)
!3383 = !DILocalVariable(name: "factor", arg: 2, scope: !3380, file: !78, line: 3538, type: !22)
!3384 = !DILocation(line: 3538, column: 41, scope: !3380)
!3385 = !DILocation(line: 3540, column: 44, scope: !3380)
!3386 = !DILocation(line: 3540, column: 50, scope: !3380)
!3387 = !DILocation(line: 3540, column: 10, scope: !3380)
!3388 = !DILocation(line: 3540, column: 3, scope: !3380)
!3389 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !78, file: !78, line: 3562, type: !396, scopeLine: 3563, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3390 = !DILocalVariable(name: "value", arg: 1, scope: !3389, file: !78, line: 3562, type: !13)
!3391 = !DILocation(line: 3562, column: 33, scope: !3389)
!3392 = !DILocalVariable(name: "factor", arg: 2, scope: !3389, file: !78, line: 3562, type: !22)
!3393 = !DILocation(line: 3562, column: 44, scope: !3389)
!3394 = !DILocation(line: 3564, column: 44, scope: !3389)
!3395 = !DILocation(line: 3564, column: 50, scope: !3389)
!3396 = !DILocation(line: 3564, column: 10, scope: !3389)
!3397 = !DILocation(line: 3564, column: 3, scope: !3389)
!3398 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !78, file: !78, line: 3586, type: !396, scopeLine: 3587, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3399 = !DILocalVariable(name: "value", arg: 1, scope: !3398, file: !78, line: 3586, type: !13)
!3400 = !DILocation(line: 3586, column: 32, scope: !3398)
!3401 = !DILocalVariable(name: "factor", arg: 2, scope: !3398, file: !78, line: 3586, type: !22)
!3402 = !DILocation(line: 3586, column: 43, scope: !3398)
!3403 = !DILocation(line: 3588, column: 44, scope: !3398)
!3404 = !DILocation(line: 3588, column: 50, scope: !3398)
!3405 = !DILocation(line: 3588, column: 10, scope: !3398)
!3406 = !DILocation(line: 3588, column: 3, scope: !3398)
!3407 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !78, file: !78, line: 3610, type: !396, scopeLine: 3611, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3408 = !DILocalVariable(name: "value", arg: 1, scope: !3407, file: !78, line: 3610, type: !13)
!3409 = !DILocation(line: 3610, column: 31, scope: !3407)
!3410 = !DILocalVariable(name: "factor", arg: 2, scope: !3407, file: !78, line: 3610, type: !22)
!3411 = !DILocation(line: 3610, column: 42, scope: !3407)
!3412 = !DILocation(line: 3612, column: 44, scope: !3407)
!3413 = !DILocation(line: 3612, column: 50, scope: !3407)
!3414 = !DILocation(line: 3612, column: 10, scope: !3407)
!3415 = !DILocation(line: 3612, column: 3, scope: !3407)
!3416 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !78, file: !78, line: 3634, type: !396, scopeLine: 3635, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3417 = !DILocalVariable(name: "value", arg: 1, scope: !3416, file: !78, line: 3634, type: !13)
!3418 = !DILocation(line: 3634, column: 30, scope: !3416)
!3419 = !DILocalVariable(name: "factor", arg: 2, scope: !3416, file: !78, line: 3634, type: !22)
!3420 = !DILocation(line: 3634, column: 41, scope: !3416)
!3421 = !DILocation(line: 3636, column: 44, scope: !3416)
!3422 = !DILocation(line: 3636, column: 50, scope: !3416)
!3423 = !DILocation(line: 3636, column: 10, scope: !3416)
!3424 = !DILocation(line: 3636, column: 3, scope: !3416)
!3425 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !78, file: !78, line: 3656, type: !481, scopeLine: 3657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3426 = !DILocalVariable(name: "value", arg: 1, scope: !3425, file: !78, line: 3656, type: !13)
!3427 = !DILocation(line: 3656, column: 32, scope: !3425)
!3428 = !DILocalVariable(name: "factor", arg: 2, scope: !3425, file: !78, line: 3656, type: !17)
!3429 = !DILocation(line: 3656, column: 42, scope: !3425)
!3430 = !DILocation(line: 3658, column: 40, scope: !3425)
!3431 = !DILocation(line: 3658, column: 58, scope: !3425)
!3432 = !DILocation(line: 3658, column: 52, scope: !3425)
!3433 = !DILocation(line: 3658, column: 66, scope: !3425)
!3434 = !DILocation(line: 3658, column: 46, scope: !3425)
!3435 = !DILocation(line: 3658, column: 10, scope: !3425)
!3436 = !DILocation(line: 3658, column: 3, scope: !3425)
!3437 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !78, file: !78, line: 3678, type: !481, scopeLine: 3679, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3438 = !DILocalVariable(name: "value", arg: 1, scope: !3437, file: !78, line: 3678, type: !13)
!3439 = !DILocation(line: 3678, column: 31, scope: !3437)
!3440 = !DILocalVariable(name: "factor", arg: 2, scope: !3437, file: !78, line: 3678, type: !17)
!3441 = !DILocation(line: 3678, column: 41, scope: !3437)
!3442 = !DILocation(line: 3680, column: 40, scope: !3437)
!3443 = !DILocation(line: 3680, column: 58, scope: !3437)
!3444 = !DILocation(line: 3680, column: 52, scope: !3437)
!3445 = !DILocation(line: 3680, column: 66, scope: !3437)
!3446 = !DILocation(line: 3680, column: 46, scope: !3437)
!3447 = !DILocation(line: 3680, column: 10, scope: !3437)
!3448 = !DILocation(line: 3680, column: 3, scope: !3437)
!3449 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !78, file: !78, line: 3701, type: !481, scopeLine: 3702, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3450 = !DILocalVariable(name: "value", arg: 1, scope: !3449, file: !78, line: 3701, type: !13)
!3451 = !DILocation(line: 3701, column: 30, scope: !3449)
!3452 = !DILocalVariable(name: "factor", arg: 2, scope: !3449, file: !78, line: 3701, type: !17)
!3453 = !DILocation(line: 3701, column: 40, scope: !3449)
!3454 = !DILocation(line: 3703, column: 40, scope: !3449)
!3455 = !DILocation(line: 3703, column: 58, scope: !3449)
!3456 = !DILocation(line: 3703, column: 52, scope: !3449)
!3457 = !DILocation(line: 3703, column: 66, scope: !3449)
!3458 = !DILocation(line: 3703, column: 46, scope: !3449)
!3459 = !DILocation(line: 3703, column: 10, scope: !3449)
!3460 = !DILocation(line: 3703, column: 3, scope: !3449)
!3461 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !78, file: !78, line: 3724, type: !481, scopeLine: 3725, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3462 = !DILocalVariable(name: "value", arg: 1, scope: !3461, file: !78, line: 3724, type: !13)
!3463 = !DILocation(line: 3724, column: 31, scope: !3461)
!3464 = !DILocalVariable(name: "factor", arg: 2, scope: !3461, file: !78, line: 3724, type: !17)
!3465 = !DILocation(line: 3724, column: 41, scope: !3461)
!3466 = !DILocation(line: 3726, column: 43, scope: !3461)
!3467 = !DILocation(line: 3726, column: 61, scope: !3461)
!3468 = !DILocation(line: 3726, column: 55, scope: !3461)
!3469 = !DILocation(line: 3726, column: 69, scope: !3461)
!3470 = !DILocation(line: 3726, column: 49, scope: !3461)
!3471 = !DILocation(line: 3726, column: 10, scope: !3461)
!3472 = !DILocation(line: 3726, column: 3, scope: !3461)
!3473 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !78, file: !78, line: 3747, type: !481, scopeLine: 3748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3474 = !DILocalVariable(name: "value", arg: 1, scope: !3473, file: !78, line: 3747, type: !13)
!3475 = !DILocation(line: 3747, column: 30, scope: !3473)
!3476 = !DILocalVariable(name: "factor", arg: 2, scope: !3473, file: !78, line: 3747, type: !17)
!3477 = !DILocation(line: 3747, column: 40, scope: !3473)
!3478 = !DILocation(line: 3749, column: 43, scope: !3473)
!3479 = !DILocation(line: 3749, column: 61, scope: !3473)
!3480 = !DILocation(line: 3749, column: 55, scope: !3473)
!3481 = !DILocation(line: 3749, column: 69, scope: !3473)
!3482 = !DILocation(line: 3749, column: 49, scope: !3473)
!3483 = !DILocation(line: 3749, column: 10, scope: !3473)
!3484 = !DILocation(line: 3749, column: 3, scope: !3473)
!3485 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !78, file: !78, line: 3769, type: !481, scopeLine: 3770, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3486 = !DILocalVariable(name: "value", arg: 1, scope: !3485, file: !78, line: 3769, type: !13)
!3487 = !DILocation(line: 3769, column: 30, scope: !3485)
!3488 = !DILocalVariable(name: "factor", arg: 2, scope: !3485, file: !78, line: 3769, type: !17)
!3489 = !DILocation(line: 3769, column: 40, scope: !3485)
!3490 = !DILocation(line: 3771, column: 43, scope: !3485)
!3491 = !DILocation(line: 3771, column: 61, scope: !3485)
!3492 = !DILocation(line: 3771, column: 55, scope: !3485)
!3493 = !DILocation(line: 3771, column: 69, scope: !3485)
!3494 = !DILocation(line: 3771, column: 49, scope: !3485)
!3495 = !DILocation(line: 3771, column: 10, scope: !3485)
!3496 = !DILocation(line: 3771, column: 3, scope: !3485)
!3497 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !78, file: !78, line: 3791, type: !481, scopeLine: 3792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3498 = !DILocalVariable(name: "value", arg: 1, scope: !3497, file: !78, line: 3791, type: !13)
!3499 = !DILocation(line: 3791, column: 29, scope: !3497)
!3500 = !DILocalVariable(name: "factor", arg: 2, scope: !3497, file: !78, line: 3791, type: !17)
!3501 = !DILocation(line: 3791, column: 39, scope: !3497)
!3502 = !DILocation(line: 3793, column: 43, scope: !3497)
!3503 = !DILocation(line: 3793, column: 61, scope: !3497)
!3504 = !DILocation(line: 3793, column: 55, scope: !3497)
!3505 = !DILocation(line: 3793, column: 69, scope: !3497)
!3506 = !DILocation(line: 3793, column: 49, scope: !3497)
!3507 = !DILocation(line: 3793, column: 10, scope: !3497)
!3508 = !DILocation(line: 3793, column: 3, scope: !3497)
!3509 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !78, file: !78, line: 3813, type: !481, scopeLine: 3814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3510 = !DILocalVariable(name: "value", arg: 1, scope: !3509, file: !78, line: 3813, type: !13)
!3511 = !DILocation(line: 3813, column: 30, scope: !3509)
!3512 = !DILocalVariable(name: "factor", arg: 2, scope: !3509, file: !78, line: 3813, type: !17)
!3513 = !DILocation(line: 3813, column: 40, scope: !3509)
!3514 = !DILocation(line: 3815, column: 43, scope: !3509)
!3515 = !DILocation(line: 3815, column: 61, scope: !3509)
!3516 = !DILocation(line: 3815, column: 55, scope: !3509)
!3517 = !DILocation(line: 3815, column: 69, scope: !3509)
!3518 = !DILocation(line: 3815, column: 49, scope: !3509)
!3519 = !DILocation(line: 3815, column: 10, scope: !3509)
!3520 = !DILocation(line: 3815, column: 3, scope: !3509)
!3521 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !78, file: !78, line: 3835, type: !481, scopeLine: 3836, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3522 = !DILocalVariable(name: "value", arg: 1, scope: !3521, file: !78, line: 3835, type: !13)
!3523 = !DILocation(line: 3835, column: 29, scope: !3521)
!3524 = !DILocalVariable(name: "factor", arg: 2, scope: !3521, file: !78, line: 3835, type: !17)
!3525 = !DILocation(line: 3835, column: 39, scope: !3521)
!3526 = !DILocation(line: 3837, column: 43, scope: !3521)
!3527 = !DILocation(line: 3837, column: 61, scope: !3521)
!3528 = !DILocation(line: 3837, column: 55, scope: !3521)
!3529 = !DILocation(line: 3837, column: 69, scope: !3521)
!3530 = !DILocation(line: 3837, column: 49, scope: !3521)
!3531 = !DILocation(line: 3837, column: 10, scope: !3521)
!3532 = !DILocation(line: 3837, column: 3, scope: !3521)
!3533 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !78, file: !78, line: 3859, type: !1873, scopeLine: 3860, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3534 = !DILocalVariable(name: "value", arg: 1, scope: !3533, file: !78, line: 3859, type: !86)
!3535 = !DILocation(line: 3859, column: 31, scope: !3533)
!3536 = !DILocalVariable(name: "factor", arg: 2, scope: !3533, file: !78, line: 3859, type: !13)
!3537 = !DILocation(line: 3859, column: 42, scope: !3533)
!3538 = !DILocation(line: 3861, column: 41, scope: !3533)
!3539 = !DILocation(line: 3861, column: 47, scope: !3533)
!3540 = !DILocation(line: 3861, column: 10, scope: !3533)
!3541 = !DILocation(line: 3861, column: 3, scope: !3533)
!3542 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !78, file: !78, line: 5055, type: !3543, scopeLine: 5056, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3543 = !DISubroutineType(types: !3544)
!3544 = !{!86, !86, !13, !742}
!3545 = !DILocalVariable(name: "value", arg: 1, scope: !3542, file: !78, line: 5055, type: !86)
!3546 = !DILocation(line: 5055, column: 40, scope: !3542)
!3547 = !DILocalVariable(name: "factor", arg: 2, scope: !3542, file: !78, line: 5055, type: !13)
!3548 = !DILocation(line: 5055, column: 51, scope: !3542)
!3549 = !DILocalVariable(name: "count", arg: 3, scope: !3542, file: !78, line: 5055, type: !742)
!3550 = !DILocation(line: 5055, column: 63, scope: !3542)
!3551 = !DILocalVariable(name: "u32Temp1", scope: !3542, file: !78, line: 5057, type: !742)
!3552 = !DILocation(line: 5057, column: 6, scope: !3542)
!3553 = !DILocalVariable(name: "u32Temp2", scope: !3542, file: !78, line: 5057, type: !742)
!3554 = !DILocation(line: 5057, column: 17, scope: !3542)
!3555 = !DILocalVariable(name: "u32Temp3", scope: !3542, file: !78, line: 5057, type: !742)
!3556 = !DILocation(line: 5057, column: 26, scope: !3542)
!3557 = !DILocalVariable(name: "u32Temp4", scope: !3542, file: !78, line: 5057, type: !742)
!3558 = !DILocation(line: 5057, column: 35, scope: !3542)
!3559 = !DILocalVariable(name: "u8SignBit", scope: !3542, file: !78, line: 5058, type: !17)
!3560 = !DILocation(line: 5058, column: 5, scope: !3542)
!3561 = !DILocation(line: 5060, column: 7, scope: !3562)
!3562 = distinct !DILexicalBlock(scope: !3542, file: !78, line: 5060, column: 5)
!3563 = !DILocation(line: 5060, column: 12, scope: !3562)
!3564 = !DILocation(line: 5060, column: 16, scope: !3562)
!3565 = !DILocation(line: 5060, column: 20, scope: !3562)
!3566 = !DILocation(line: 5060, column: 26, scope: !3562)
!3567 = !DILocation(line: 5060, column: 31, scope: !3562)
!3568 = !DILocation(line: 5060, column: 36, scope: !3562)
!3569 = !DILocation(line: 5060, column: 41, scope: !3562)
!3570 = !DILocation(line: 5060, column: 45, scope: !3562)
!3571 = !DILocation(line: 5060, column: 49, scope: !3562)
!3572 = !DILocation(line: 5060, column: 55, scope: !3562)
!3573 = !DILocation(line: 5060, column: 5, scope: !3542)
!3574 = !DILocation(line: 5062, column: 13, scope: !3575)
!3575 = distinct !DILexicalBlock(scope: !3562, file: !78, line: 5061, column: 2)
!3576 = !DILocation(line: 5063, column: 2, scope: !3575)
!3577 = !DILocation(line: 5066, column: 13, scope: !3578)
!3578 = distinct !DILexicalBlock(scope: !3562, file: !78, line: 5065, column: 2)
!3579 = !DILocation(line: 5069, column: 5, scope: !3580)
!3580 = distinct !DILexicalBlock(scope: !3542, file: !78, line: 5069, column: 5)
!3581 = !DILocation(line: 5069, column: 10, scope: !3580)
!3582 = !DILocation(line: 5069, column: 5, scope: !3542)
!3583 = !DILocation(line: 5071, column: 15, scope: !3584)
!3584 = distinct !DILexicalBlock(scope: !3580, file: !78, line: 5070, column: 2)
!3585 = !DILocation(line: 5071, column: 14, scope: !3584)
!3586 = !DILocation(line: 5071, column: 12, scope: !3584)
!3587 = !DILocation(line: 5072, column: 2, scope: !3584)
!3588 = !DILocation(line: 5075, column: 14, scope: !3589)
!3589 = distinct !DILexicalBlock(scope: !3580, file: !78, line: 5074, column: 2)
!3590 = !DILocation(line: 5075, column: 12, scope: !3589)
!3591 = !DILocation(line: 5078, column: 5, scope: !3592)
!3592 = distinct !DILexicalBlock(scope: !3542, file: !78, line: 5078, column: 5)
!3593 = !DILocation(line: 5078, column: 11, scope: !3592)
!3594 = !DILocation(line: 5078, column: 5, scope: !3542)
!3595 = !DILocation(line: 5080, column: 15, scope: !3596)
!3596 = distinct !DILexicalBlock(scope: !3592, file: !78, line: 5079, column: 2)
!3597 = !DILocation(line: 5080, column: 14, scope: !3596)
!3598 = !DILocation(line: 5080, column: 12, scope: !3596)
!3599 = !DILocation(line: 5081, column: 2, scope: !3596)
!3600 = !DILocation(line: 5084, column: 14, scope: !3601)
!3601 = distinct !DILexicalBlock(scope: !3592, file: !78, line: 5083, column: 2)
!3602 = !DILocation(line: 5084, column: 12, scope: !3601)
!3603 = !DILocation(line: 5087, column: 13, scope: !3542)
!3604 = !DILocation(line: 5087, column: 24, scope: !3542)
!3605 = !DILocation(line: 5087, column: 22, scope: !3542)
!3606 = !DILocation(line: 5087, column: 11, scope: !3542)
!3607 = !DILocation(line: 5088, column: 25, scope: !3542)
!3608 = !DILocation(line: 5088, column: 35, scope: !3542)
!3609 = !DILocation(line: 5088, column: 13, scope: !3542)
!3610 = !DILocation(line: 5088, column: 11, scope: !3542)
!3611 = !DILocation(line: 5089, column: 13, scope: !3542)
!3612 = !DILocation(line: 5089, column: 25, scope: !3542)
!3613 = !DILocation(line: 5089, column: 22, scope: !3542)
!3614 = !DILocation(line: 5089, column: 11, scope: !3542)
!3615 = !DILocation(line: 5090, column: 14, scope: !3542)
!3616 = !DILocation(line: 5090, column: 30, scope: !3542)
!3617 = !DILocation(line: 5090, column: 29, scope: !3542)
!3618 = !DILocation(line: 5090, column: 23, scope: !3542)
!3619 = !DILocation(line: 5090, column: 11, scope: !3542)
!3620 = !DILocation(line: 5091, column: 6, scope: !3621)
!3621 = distinct !DILexicalBlock(scope: !3542, file: !78, line: 5091, column: 5)
!3622 = !DILocation(line: 5091, column: 16, scope: !3621)
!3623 = !DILocation(line: 5091, column: 14, scope: !3621)
!3624 = !DILocation(line: 5091, column: 22, scope: !3621)
!3625 = !DILocation(line: 5091, column: 5, scope: !3542)
!3626 = !DILocation(line: 5093, column: 6, scope: !3627)
!3627 = distinct !DILexicalBlock(scope: !3628, file: !78, line: 5093, column: 6)
!3628 = distinct !DILexicalBlock(scope: !3621, file: !78, line: 5092, column: 2)
!3629 = !DILocation(line: 5093, column: 16, scope: !3627)
!3630 = !DILocation(line: 5093, column: 6, scope: !3628)
!3631 = !DILocation(line: 5095, column: 7, scope: !3632)
!3632 = distinct !DILexicalBlock(scope: !3633, file: !78, line: 5095, column: 7)
!3633 = distinct !DILexicalBlock(scope: !3627, file: !78, line: 5094, column: 3)
!3634 = !DILocation(line: 5095, column: 15, scope: !3632)
!3635 = !DILocation(line: 5095, column: 7, scope: !3633)
!3636 = !DILocation(line: 5096, column: 12, scope: !3632)
!3637 = !DILocation(line: 5096, column: 5, scope: !3632)
!3638 = !DILocation(line: 5098, column: 5, scope: !3632)
!3639 = !DILocation(line: 5102, column: 7, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3641, file: !78, line: 5102, column: 7)
!3641 = distinct !DILexicalBlock(scope: !3627, file: !78, line: 5101, column: 3)
!3642 = !DILocation(line: 5102, column: 15, scope: !3640)
!3643 = !DILocation(line: 5102, column: 7, scope: !3641)
!3644 = !DILocation(line: 5103, column: 13, scope: !3640)
!3645 = !DILocation(line: 5103, column: 12, scope: !3640)
!3646 = !DILocation(line: 5103, column: 5, scope: !3640)
!3647 = !DILocation(line: 5105, column: 5, scope: !3640)
!3648 = !DILocation(line: 5110, column: 3, scope: !3649)
!3649 = distinct !DILexicalBlock(scope: !3621, file: !78, line: 5109, column: 2)
!3650 = !DILocation(line: 5112, column: 1, scope: !3542)
!3651 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !78, file: !78, line: 3883, type: !2642, scopeLine: 3884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3652 = !DILocalVariable(name: "value", arg: 1, scope: !3651, file: !78, line: 3883, type: !86)
!3653 = !DILocation(line: 3883, column: 30, scope: !3651)
!3654 = !DILocalVariable(name: "factor", arg: 2, scope: !3651, file: !78, line: 3883, type: !6)
!3655 = !DILocation(line: 3883, column: 40, scope: !3651)
!3656 = !DILocation(line: 3885, column: 40, scope: !3651)
!3657 = !DILocation(line: 3885, column: 46, scope: !3651)
!3658 = !DILocation(line: 3885, column: 10, scope: !3651)
!3659 = !DILocation(line: 3885, column: 3, scope: !3651)
!3660 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !78, file: !78, line: 5207, type: !3661, scopeLine: 5208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3661 = !DISubroutineType(types: !3662)
!3662 = !{!86, !86, !6, !742}
!3663 = !DILocalVariable(name: "value", arg: 1, scope: !3660, file: !78, line: 5207, type: !86)
!3664 = !DILocation(line: 5207, column: 39, scope: !3660)
!3665 = !DILocalVariable(name: "factor", arg: 2, scope: !3660, file: !78, line: 5207, type: !6)
!3666 = !DILocation(line: 5207, column: 49, scope: !3660)
!3667 = !DILocalVariable(name: "count", arg: 3, scope: !3660, file: !78, line: 5207, type: !742)
!3668 = !DILocation(line: 5207, column: 61, scope: !3660)
!3669 = !DILocalVariable(name: "u32Temp1", scope: !3660, file: !78, line: 5209, type: !742)
!3670 = !DILocation(line: 5209, column: 6, scope: !3660)
!3671 = !DILocalVariable(name: "u32Temp2", scope: !3660, file: !78, line: 5209, type: !742)
!3672 = !DILocation(line: 5209, column: 17, scope: !3660)
!3673 = !DILocalVariable(name: "u32Temp3", scope: !3660, file: !78, line: 5209, type: !742)
!3674 = !DILocation(line: 5209, column: 26, scope: !3660)
!3675 = !DILocalVariable(name: "u32Temp4", scope: !3660, file: !78, line: 5209, type: !742)
!3676 = !DILocation(line: 5209, column: 35, scope: !3660)
!3677 = !DILocalVariable(name: "u8SignBit", scope: !3660, file: !78, line: 5210, type: !17)
!3678 = !DILocation(line: 5210, column: 5, scope: !3660)
!3679 = !DILocation(line: 5212, column: 7, scope: !3680)
!3680 = distinct !DILexicalBlock(scope: !3660, file: !78, line: 5212, column: 5)
!3681 = !DILocation(line: 5212, column: 12, scope: !3680)
!3682 = !DILocation(line: 5212, column: 16, scope: !3680)
!3683 = !DILocation(line: 5212, column: 20, scope: !3680)
!3684 = !DILocation(line: 5212, column: 26, scope: !3680)
!3685 = !DILocation(line: 5212, column: 31, scope: !3680)
!3686 = !DILocation(line: 5212, column: 36, scope: !3680)
!3687 = !DILocation(line: 5212, column: 41, scope: !3680)
!3688 = !DILocation(line: 5212, column: 45, scope: !3680)
!3689 = !DILocation(line: 5212, column: 49, scope: !3680)
!3690 = !DILocation(line: 5212, column: 55, scope: !3680)
!3691 = !DILocation(line: 5212, column: 5, scope: !3660)
!3692 = !DILocation(line: 5214, column: 13, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3680, file: !78, line: 5213, column: 2)
!3694 = !DILocation(line: 5215, column: 2, scope: !3693)
!3695 = !DILocation(line: 5218, column: 13, scope: !3696)
!3696 = distinct !DILexicalBlock(scope: !3680, file: !78, line: 5217, column: 2)
!3697 = !DILocation(line: 5221, column: 5, scope: !3698)
!3698 = distinct !DILexicalBlock(scope: !3660, file: !78, line: 5221, column: 5)
!3699 = !DILocation(line: 5221, column: 10, scope: !3698)
!3700 = !DILocation(line: 5221, column: 5, scope: !3660)
!3701 = !DILocation(line: 5224, column: 44, scope: !3702)
!3702 = distinct !DILexicalBlock(scope: !3703, file: !78, line: 5224, column: 7)
!3703 = distinct !DILexicalBlock(scope: !3698, file: !78, line: 5222, column: 2)
!3704 = !DILocation(line: 5224, column: 34, scope: !3702)
!3705 = !DILocation(line: 5224, column: 9, scope: !3702)
!3706 = !DILocation(line: 5224, column: 7, scope: !3703)
!3707 = !DILocation(line: 5225, column: 7, scope: !3708)
!3708 = distinct !DILexicalBlock(scope: !3702, file: !78, line: 5224, column: 54)
!3709 = !DILocation(line: 5227, column: 15, scope: !3703)
!3710 = !DILocation(line: 5227, column: 14, scope: !3703)
!3711 = !DILocation(line: 5227, column: 12, scope: !3703)
!3712 = !DILocation(line: 5228, column: 2, scope: !3703)
!3713 = !DILocation(line: 5231, column: 14, scope: !3714)
!3714 = distinct !DILexicalBlock(scope: !3698, file: !78, line: 5230, column: 2)
!3715 = !DILocation(line: 5231, column: 12, scope: !3714)
!3716 = !DILocation(line: 5234, column: 5, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3660, file: !78, line: 5234, column: 5)
!3718 = !DILocation(line: 5234, column: 11, scope: !3717)
!3719 = !DILocation(line: 5234, column: 5, scope: !3660)
!3720 = !DILocation(line: 5236, column: 15, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3717, file: !78, line: 5235, column: 2)
!3722 = !DILocation(line: 5236, column: 14, scope: !3721)
!3723 = !DILocation(line: 5236, column: 12, scope: !3721)
!3724 = !DILocation(line: 5237, column: 2, scope: !3721)
!3725 = !DILocation(line: 5240, column: 14, scope: !3726)
!3726 = distinct !DILexicalBlock(scope: !3717, file: !78, line: 5239, column: 2)
!3727 = !DILocation(line: 5240, column: 12, scope: !3726)
!3728 = !DILocation(line: 5243, column: 13, scope: !3660)
!3729 = !DILocation(line: 5243, column: 24, scope: !3660)
!3730 = !DILocation(line: 5243, column: 22, scope: !3660)
!3731 = !DILocation(line: 5243, column: 11, scope: !3660)
!3732 = !DILocation(line: 5244, column: 25, scope: !3660)
!3733 = !DILocation(line: 5244, column: 35, scope: !3660)
!3734 = !DILocation(line: 5244, column: 13, scope: !3660)
!3735 = !DILocation(line: 5244, column: 11, scope: !3660)
!3736 = !DILocation(line: 5246, column: 47, scope: !3737)
!3737 = distinct !DILexicalBlock(scope: !3660, file: !78, line: 5246, column: 6)
!3738 = !DILocation(line: 5246, column: 37, scope: !3737)
!3739 = !DILocation(line: 5246, column: 8, scope: !3737)
!3740 = !DILocation(line: 5246, column: 6, scope: !3660)
!3741 = !DILocation(line: 5247, column: 6, scope: !3742)
!3742 = distinct !DILexicalBlock(scope: !3737, file: !78, line: 5246, column: 61)
!3743 = !DILocation(line: 5254, column: 34, scope: !3660)
!3744 = !DILocation(line: 5254, column: 46, scope: !3660)
!3745 = !DILocation(line: 5254, column: 43, scope: !3660)
!3746 = !DILocation(line: 5254, column: 24, scope: !3660)
!3747 = !DILocation(line: 5254, column: 22, scope: !3660)
!3748 = !DILocation(line: 5255, column: 2, scope: !3660)
!3749 = !DILocation(line: 5278, column: 1, scope: !3660)
!3750 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !3751, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3751 = !DISubroutineType(types: !3752)
!3752 = !{!51, !26}
!3753 = !DILocalVariable(name: "value", arg: 1, scope: !3750, file: !30, line: 42, type: !26)
!3754 = !DILocation(line: 42, column: 38, scope: !3750)
!3755 = !DILocation(line: 44, column: 12, scope: !3750)
!3756 = !DILocation(line: 44, column: 18, scope: !3750)
!3757 = !DILocation(line: 44, column: 5, scope: !3750)
!3758 = distinct !DISubprogram(name: "klee_alarm_shift_count_valid", scope: !30, file: !30, line: 36, type: !3759, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3759 = !DISubroutineType(types: !3760)
!3760 = !{!51, !26, !26}
!3761 = !DILocalVariable(name: "count", arg: 1, scope: !3758, file: !30, line: 36, type: !26)
!3762 = !DILocation(line: 36, column: 42, scope: !3758)
!3763 = !DILocalVariable(name: "width", arg: 2, scope: !3758, file: !30, line: 36, type: !26)
!3764 = !DILocation(line: 36, column: 57, scope: !3758)
!3765 = !DILocation(line: 38, column: 12, scope: !3758)
!3766 = !DILocation(line: 38, column: 18, scope: !3758)
!3767 = !DILocation(line: 38, column: 32, scope: !3758)
!3768 = !DILocation(line: 38, column: 5, scope: !3758)
!3769 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !78, file: !78, line: 3907, type: !778, scopeLine: 3908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3770 = !DILocalVariable(name: "value", arg: 1, scope: !3769, file: !78, line: 3907, type: !86)
!3771 = !DILocation(line: 3907, column: 31, scope: !3769)
!3772 = !DILocalVariable(name: "factor", arg: 2, scope: !3769, file: !78, line: 3907, type: !22)
!3773 = !DILocation(line: 3907, column: 42, scope: !3769)
!3774 = !DILocation(line: 3909, column: 41, scope: !3769)
!3775 = !DILocation(line: 3909, column: 47, scope: !3769)
!3776 = !DILocation(line: 3909, column: 10, scope: !3769)
!3777 = !DILocation(line: 3909, column: 3, scope: !3769)
!3778 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !78, file: !78, line: 5131, type: !3779, scopeLine: 5132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3779 = !DISubroutineType(types: !3780)
!3780 = !{!86, !86, !22, !742}
!3781 = !DILocalVariable(name: "value", arg: 1, scope: !3778, file: !78, line: 5131, type: !86)
!3782 = !DILocation(line: 5131, column: 40, scope: !3778)
!3783 = !DILocalVariable(name: "factor", arg: 2, scope: !3778, file: !78, line: 5131, type: !22)
!3784 = !DILocation(line: 5131, column: 50, scope: !3778)
!3785 = !DILocalVariable(name: "count", arg: 3, scope: !3778, file: !78, line: 5131, type: !742)
!3786 = !DILocation(line: 5131, column: 62, scope: !3778)
!3787 = !DILocalVariable(name: "u32Temp1", scope: !3778, file: !78, line: 5133, type: !742)
!3788 = !DILocation(line: 5133, column: 6, scope: !3778)
!3789 = !DILocalVariable(name: "u32Temp2", scope: !3778, file: !78, line: 5133, type: !742)
!3790 = !DILocation(line: 5133, column: 17, scope: !3778)
!3791 = !DILocalVariable(name: "u32Temp3", scope: !3778, file: !78, line: 5133, type: !742)
!3792 = !DILocation(line: 5133, column: 26, scope: !3778)
!3793 = !DILocalVariable(name: "u32Temp4", scope: !3778, file: !78, line: 5133, type: !742)
!3794 = !DILocation(line: 5133, column: 35, scope: !3778)
!3795 = !DILocalVariable(name: "u8SignBit", scope: !3778, file: !78, line: 5134, type: !17)
!3796 = !DILocation(line: 5134, column: 5, scope: !3778)
!3797 = !DILocation(line: 5136, column: 7, scope: !3798)
!3798 = distinct !DILexicalBlock(scope: !3778, file: !78, line: 5136, column: 5)
!3799 = !DILocation(line: 5136, column: 12, scope: !3798)
!3800 = !DILocation(line: 5136, column: 16, scope: !3798)
!3801 = !DILocation(line: 5136, column: 20, scope: !3798)
!3802 = !DILocation(line: 5136, column: 26, scope: !3798)
!3803 = !DILocation(line: 5136, column: 31, scope: !3798)
!3804 = !DILocation(line: 5136, column: 36, scope: !3798)
!3805 = !DILocation(line: 5136, column: 41, scope: !3798)
!3806 = !DILocation(line: 5136, column: 45, scope: !3798)
!3807 = !DILocation(line: 5136, column: 49, scope: !3798)
!3808 = !DILocation(line: 5136, column: 55, scope: !3798)
!3809 = !DILocation(line: 5136, column: 5, scope: !3778)
!3810 = !DILocation(line: 5138, column: 13, scope: !3811)
!3811 = distinct !DILexicalBlock(scope: !3798, file: !78, line: 5137, column: 2)
!3812 = !DILocation(line: 5139, column: 2, scope: !3811)
!3813 = !DILocation(line: 5142, column: 13, scope: !3814)
!3814 = distinct !DILexicalBlock(scope: !3798, file: !78, line: 5141, column: 2)
!3815 = !DILocation(line: 5145, column: 5, scope: !3816)
!3816 = distinct !DILexicalBlock(scope: !3778, file: !78, line: 5145, column: 5)
!3817 = !DILocation(line: 5145, column: 10, scope: !3816)
!3818 = !DILocation(line: 5145, column: 5, scope: !3778)
!3819 = !DILocation(line: 5147, column: 15, scope: !3820)
!3820 = distinct !DILexicalBlock(scope: !3816, file: !78, line: 5146, column: 2)
!3821 = !DILocation(line: 5147, column: 14, scope: !3820)
!3822 = !DILocation(line: 5147, column: 12, scope: !3820)
!3823 = !DILocation(line: 5148, column: 2, scope: !3820)
!3824 = !DILocation(line: 5151, column: 14, scope: !3825)
!3825 = distinct !DILexicalBlock(scope: !3816, file: !78, line: 5150, column: 2)
!3826 = !DILocation(line: 5151, column: 12, scope: !3825)
!3827 = !DILocation(line: 5154, column: 5, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3778, file: !78, line: 5154, column: 5)
!3829 = !DILocation(line: 5154, column: 11, scope: !3828)
!3830 = !DILocation(line: 5154, column: 5, scope: !3778)
!3831 = !DILocation(line: 5156, column: 15, scope: !3832)
!3832 = distinct !DILexicalBlock(scope: !3828, file: !78, line: 5155, column: 2)
!3833 = !DILocation(line: 5156, column: 14, scope: !3832)
!3834 = !DILocation(line: 5156, column: 12, scope: !3832)
!3835 = !DILocation(line: 5157, column: 2, scope: !3832)
!3836 = !DILocation(line: 5160, column: 14, scope: !3837)
!3837 = distinct !DILexicalBlock(scope: !3828, file: !78, line: 5159, column: 2)
!3838 = !DILocation(line: 5160, column: 12, scope: !3837)
!3839 = !DILocation(line: 5163, column: 13, scope: !3778)
!3840 = !DILocation(line: 5163, column: 24, scope: !3778)
!3841 = !DILocation(line: 5163, column: 22, scope: !3778)
!3842 = !DILocation(line: 5163, column: 11, scope: !3778)
!3843 = !DILocation(line: 5164, column: 25, scope: !3778)
!3844 = !DILocation(line: 5164, column: 35, scope: !3778)
!3845 = !DILocation(line: 5164, column: 13, scope: !3778)
!3846 = !DILocation(line: 5164, column: 11, scope: !3778)
!3847 = !DILocation(line: 5165, column: 13, scope: !3778)
!3848 = !DILocation(line: 5165, column: 25, scope: !3778)
!3849 = !DILocation(line: 5165, column: 22, scope: !3778)
!3850 = !DILocation(line: 5165, column: 11, scope: !3778)
!3851 = !DILocation(line: 5166, column: 14, scope: !3778)
!3852 = !DILocation(line: 5166, column: 30, scope: !3778)
!3853 = !DILocation(line: 5166, column: 29, scope: !3778)
!3854 = !DILocation(line: 5166, column: 23, scope: !3778)
!3855 = !DILocation(line: 5166, column: 11, scope: !3778)
!3856 = !DILocation(line: 5167, column: 6, scope: !3857)
!3857 = distinct !DILexicalBlock(scope: !3778, file: !78, line: 5167, column: 5)
!3858 = !DILocation(line: 5167, column: 16, scope: !3857)
!3859 = !DILocation(line: 5167, column: 14, scope: !3857)
!3860 = !DILocation(line: 5167, column: 22, scope: !3857)
!3861 = !DILocation(line: 5167, column: 5, scope: !3778)
!3862 = !DILocation(line: 5169, column: 6, scope: !3863)
!3863 = distinct !DILexicalBlock(scope: !3864, file: !78, line: 5169, column: 6)
!3864 = distinct !DILexicalBlock(scope: !3857, file: !78, line: 5168, column: 2)
!3865 = !DILocation(line: 5169, column: 16, scope: !3863)
!3866 = !DILocation(line: 5169, column: 6, scope: !3864)
!3867 = !DILocation(line: 5171, column: 7, scope: !3868)
!3868 = distinct !DILexicalBlock(scope: !3869, file: !78, line: 5171, column: 7)
!3869 = distinct !DILexicalBlock(scope: !3863, file: !78, line: 5170, column: 3)
!3870 = !DILocation(line: 5171, column: 15, scope: !3868)
!3871 = !DILocation(line: 5171, column: 7, scope: !3869)
!3872 = !DILocation(line: 5172, column: 12, scope: !3868)
!3873 = !DILocation(line: 5172, column: 5, scope: !3868)
!3874 = !DILocation(line: 5174, column: 5, scope: !3868)
!3875 = !DILocation(line: 5178, column: 7, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3877, file: !78, line: 5178, column: 7)
!3877 = distinct !DILexicalBlock(scope: !3863, file: !78, line: 5177, column: 3)
!3878 = !DILocation(line: 5178, column: 15, scope: !3876)
!3879 = !DILocation(line: 5178, column: 7, scope: !3877)
!3880 = !DILocation(line: 5179, column: 13, scope: !3876)
!3881 = !DILocation(line: 5179, column: 12, scope: !3876)
!3882 = !DILocation(line: 5179, column: 5, scope: !3876)
!3883 = !DILocation(line: 5181, column: 5, scope: !3876)
!3884 = !DILocation(line: 5186, column: 3, scope: !3885)
!3885 = distinct !DILexicalBlock(scope: !3857, file: !78, line: 5185, column: 2)
!3886 = !DILocation(line: 5188, column: 1, scope: !3778)
!3887 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !78, file: !78, line: 3931, type: !2347, scopeLine: 3932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3888 = !DILocalVariable(name: "value", arg: 1, scope: !3887, file: !78, line: 3931, type: !86)
!3889 = !DILocation(line: 3931, column: 30, scope: !3887)
!3890 = !DILocalVariable(name: "factor", arg: 2, scope: !3887, file: !78, line: 3931, type: !17)
!3891 = !DILocation(line: 3931, column: 40, scope: !3887)
!3892 = !DILocation(line: 3933, column: 40, scope: !3887)
!3893 = !DILocation(line: 3933, column: 46, scope: !3887)
!3894 = !DILocation(line: 3933, column: 10, scope: !3887)
!3895 = !DILocation(line: 3933, column: 3, scope: !3887)
!3896 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !78, file: !78, line: 5540, type: !3897, scopeLine: 5541, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3897 = !DISubroutineType(types: !3898)
!3898 = !{!86, !86, !17, !742}
!3899 = !DILocalVariable(name: "value", arg: 1, scope: !3896, file: !78, line: 5540, type: !86)
!3900 = !DILocation(line: 5540, column: 39, scope: !3896)
!3901 = !DILocalVariable(name: "factor", arg: 2, scope: !3896, file: !78, line: 5540, type: !17)
!3902 = !DILocation(line: 5540, column: 49, scope: !3896)
!3903 = !DILocalVariable(name: "count", arg: 3, scope: !3896, file: !78, line: 5540, type: !742)
!3904 = !DILocation(line: 5540, column: 61, scope: !3896)
!3905 = !DILocalVariable(name: "u32Temp1", scope: !3896, file: !78, line: 5542, type: !742)
!3906 = !DILocation(line: 5542, column: 6, scope: !3896)
!3907 = !DILocalVariable(name: "u32Temp2", scope: !3896, file: !78, line: 5542, type: !742)
!3908 = !DILocation(line: 5542, column: 17, scope: !3896)
!3909 = !DILocalVariable(name: "u32Temp3", scope: !3896, file: !78, line: 5542, type: !742)
!3910 = !DILocation(line: 5542, column: 26, scope: !3896)
!3911 = !DILocalVariable(name: "u8SignBit", scope: !3896, file: !78, line: 5543, type: !17)
!3912 = !DILocation(line: 5543, column: 5, scope: !3896)
!3913 = !DILocation(line: 5545, column: 5, scope: !3914)
!3914 = distinct !DILexicalBlock(scope: !3896, file: !78, line: 5545, column: 5)
!3915 = !DILocation(line: 5545, column: 10, scope: !3914)
!3916 = !DILocation(line: 5545, column: 5, scope: !3896)
!3917 = !DILocation(line: 5547, column: 13, scope: !3918)
!3918 = distinct !DILexicalBlock(scope: !3914, file: !78, line: 5546, column: 2)
!3919 = !DILocation(line: 5548, column: 15, scope: !3918)
!3920 = !DILocation(line: 5548, column: 14, scope: !3918)
!3921 = !DILocation(line: 5548, column: 12, scope: !3918)
!3922 = !DILocation(line: 5549, column: 2, scope: !3918)
!3923 = !DILocation(line: 5552, column: 13, scope: !3924)
!3924 = distinct !DILexicalBlock(scope: !3914, file: !78, line: 5551, column: 2)
!3925 = !DILocation(line: 5553, column: 14, scope: !3924)
!3926 = !DILocation(line: 5553, column: 12, scope: !3924)
!3927 = !DILocation(line: 5556, column: 13, scope: !3896)
!3928 = !DILocation(line: 5556, column: 24, scope: !3896)
!3929 = !DILocation(line: 5556, column: 22, scope: !3896)
!3930 = !DILocation(line: 5556, column: 11, scope: !3896)
!3931 = !DILocation(line: 5557, column: 25, scope: !3896)
!3932 = !DILocation(line: 5557, column: 34, scope: !3896)
!3933 = !DILocation(line: 5557, column: 13, scope: !3896)
!3934 = !DILocation(line: 5557, column: 11, scope: !3896)
!3935 = !DILocation(line: 5558, column: 13, scope: !3896)
!3936 = !DILocation(line: 5558, column: 25, scope: !3896)
!3937 = !DILocation(line: 5558, column: 22, scope: !3896)
!3938 = !DILocation(line: 5558, column: 11, scope: !3896)
!3939 = !DILocation(line: 5559, column: 14, scope: !3896)
!3940 = !DILocation(line: 5559, column: 30, scope: !3896)
!3941 = !DILocation(line: 5559, column: 29, scope: !3896)
!3942 = !DILocation(line: 5559, column: 23, scope: !3896)
!3943 = !DILocation(line: 5559, column: 11, scope: !3896)
!3944 = !DILocation(line: 5560, column: 6, scope: !3945)
!3945 = distinct !DILexicalBlock(scope: !3896, file: !78, line: 5560, column: 5)
!3946 = !DILocation(line: 5560, column: 16, scope: !3945)
!3947 = !DILocation(line: 5560, column: 14, scope: !3945)
!3948 = !DILocation(line: 5560, column: 22, scope: !3945)
!3949 = !DILocation(line: 5560, column: 5, scope: !3896)
!3950 = !DILocation(line: 5562, column: 6, scope: !3951)
!3951 = distinct !DILexicalBlock(scope: !3952, file: !78, line: 5562, column: 6)
!3952 = distinct !DILexicalBlock(scope: !3945, file: !78, line: 5561, column: 2)
!3953 = !DILocation(line: 5562, column: 16, scope: !3951)
!3954 = !DILocation(line: 5562, column: 6, scope: !3952)
!3955 = !DILocation(line: 5564, column: 7, scope: !3956)
!3956 = distinct !DILexicalBlock(scope: !3957, file: !78, line: 5564, column: 7)
!3957 = distinct !DILexicalBlock(scope: !3951, file: !78, line: 5563, column: 3)
!3958 = !DILocation(line: 5564, column: 15, scope: !3956)
!3959 = !DILocation(line: 5564, column: 7, scope: !3957)
!3960 = !DILocation(line: 5565, column: 12, scope: !3956)
!3961 = !DILocation(line: 5565, column: 5, scope: !3956)
!3962 = !DILocation(line: 5567, column: 5, scope: !3956)
!3963 = !DILocation(line: 5571, column: 7, scope: !3964)
!3964 = distinct !DILexicalBlock(scope: !3965, file: !78, line: 5571, column: 7)
!3965 = distinct !DILexicalBlock(scope: !3951, file: !78, line: 5570, column: 3)
!3966 = !DILocation(line: 5571, column: 15, scope: !3964)
!3967 = !DILocation(line: 5571, column: 7, scope: !3965)
!3968 = !DILocation(line: 5573, column: 13, scope: !3969)
!3969 = distinct !DILexicalBlock(scope: !3964, file: !78, line: 5572, column: 4)
!3970 = !DILocation(line: 5573, column: 12, scope: !3969)
!3971 = !DILocation(line: 5573, column: 5, scope: !3969)
!3972 = !DILocation(line: 5577, column: 5, scope: !3973)
!3973 = distinct !DILexicalBlock(scope: !3964, file: !78, line: 5576, column: 4)
!3974 = !DILocation(line: 5583, column: 6, scope: !3975)
!3975 = distinct !DILexicalBlock(scope: !3976, file: !78, line: 5583, column: 6)
!3976 = distinct !DILexicalBlock(scope: !3945, file: !78, line: 5582, column: 2)
!3977 = !DILocation(line: 5583, column: 16, scope: !3975)
!3978 = !DILocation(line: 5583, column: 6, scope: !3976)
!3979 = !DILocation(line: 5585, column: 4, scope: !3980)
!3980 = distinct !DILexicalBlock(scope: !3975, file: !78, line: 5584, column: 3)
!3981 = !DILocation(line: 5589, column: 4, scope: !3982)
!3982 = distinct !DILexicalBlock(scope: !3975, file: !78, line: 5588, column: 3)
!3983 = !DILocation(line: 5592, column: 1, scope: !3896)
!3984 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !78, file: !78, line: 3955, type: !165, scopeLine: 3956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3985 = !DILocalVariable(name: "value", arg: 1, scope: !3984, file: !78, line: 3955, type: !6)
!3986 = !DILocation(line: 3955, column: 28, scope: !3984)
!3987 = !DILocalVariable(name: "factor", arg: 2, scope: !3984, file: !78, line: 3955, type: !17)
!3988 = !DILocation(line: 3955, column: 38, scope: !3984)
!3989 = !DILocation(line: 3957, column: 38, scope: !3984)
!3990 = !DILocation(line: 3957, column: 56, scope: !3984)
!3991 = !DILocation(line: 3957, column: 50, scope: !3984)
!3992 = !DILocation(line: 3957, column: 64, scope: !3984)
!3993 = !DILocation(line: 3957, column: 44, scope: !3984)
!3994 = !DILocation(line: 3957, column: 10, scope: !3984)
!3995 = !DILocation(line: 3957, column: 3, scope: !3984)
!3996 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !78, file: !78, line: 3979, type: !165, scopeLine: 3980, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3997 = !DILocalVariable(name: "value", arg: 1, scope: !3996, file: !78, line: 3979, type: !6)
!3998 = !DILocation(line: 3979, column: 27, scope: !3996)
!3999 = !DILocalVariable(name: "factor", arg: 2, scope: !3996, file: !78, line: 3979, type: !17)
!4000 = !DILocation(line: 3979, column: 37, scope: !3996)
!4001 = !DILocation(line: 3981, column: 38, scope: !3996)
!4002 = !DILocation(line: 3981, column: 56, scope: !3996)
!4003 = !DILocation(line: 3981, column: 50, scope: !3996)
!4004 = !DILocation(line: 3981, column: 64, scope: !3996)
!4005 = !DILocation(line: 3981, column: 44, scope: !3996)
!4006 = !DILocation(line: 3981, column: 10, scope: !3996)
!4007 = !DILocation(line: 3981, column: 3, scope: !3996)
!4008 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !78, file: !78, line: 4004, type: !165, scopeLine: 4005, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4009 = !DILocalVariable(name: "value", arg: 1, scope: !4008, file: !78, line: 4004, type: !6)
!4010 = !DILocation(line: 4004, column: 26, scope: !4008)
!4011 = !DILocalVariable(name: "factor", arg: 2, scope: !4008, file: !78, line: 4004, type: !17)
!4012 = !DILocation(line: 4004, column: 36, scope: !4008)
!4013 = !DILocation(line: 4006, column: 38, scope: !4008)
!4014 = !DILocation(line: 4006, column: 56, scope: !4008)
!4015 = !DILocation(line: 4006, column: 50, scope: !4008)
!4016 = !DILocation(line: 4006, column: 64, scope: !4008)
!4017 = !DILocation(line: 4006, column: 44, scope: !4008)
!4018 = !DILocation(line: 4006, column: 10, scope: !4008)
!4019 = !DILocation(line: 4006, column: 3, scope: !4008)
!4020 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !78, file: !78, line: 4029, type: !165, scopeLine: 4030, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4021 = !DILocalVariable(name: "value", arg: 1, scope: !4020, file: !78, line: 4029, type: !6)
!4022 = !DILocation(line: 4029, column: 27, scope: !4020)
!4023 = !DILocalVariable(name: "factor", arg: 2, scope: !4020, file: !78, line: 4029, type: !17)
!4024 = !DILocation(line: 4029, column: 37, scope: !4020)
!4025 = !DILocation(line: 4031, column: 41, scope: !4020)
!4026 = !DILocation(line: 4031, column: 59, scope: !4020)
!4027 = !DILocation(line: 4031, column: 53, scope: !4020)
!4028 = !DILocation(line: 4031, column: 67, scope: !4020)
!4029 = !DILocation(line: 4031, column: 47, scope: !4020)
!4030 = !DILocation(line: 4031, column: 10, scope: !4020)
!4031 = !DILocation(line: 4031, column: 3, scope: !4020)
!4032 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !78, file: !78, line: 4054, type: !165, scopeLine: 4055, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4033 = !DILocalVariable(name: "value", arg: 1, scope: !4032, file: !78, line: 4054, type: !6)
!4034 = !DILocation(line: 4054, column: 26, scope: !4032)
!4035 = !DILocalVariable(name: "factor", arg: 2, scope: !4032, file: !78, line: 4054, type: !17)
!4036 = !DILocation(line: 4054, column: 36, scope: !4032)
!4037 = !DILocation(line: 4056, column: 41, scope: !4032)
!4038 = !DILocation(line: 4056, column: 59, scope: !4032)
!4039 = !DILocation(line: 4056, column: 53, scope: !4032)
!4040 = !DILocation(line: 4056, column: 67, scope: !4032)
!4041 = !DILocation(line: 4056, column: 47, scope: !4032)
!4042 = !DILocation(line: 4056, column: 10, scope: !4032)
!4043 = !DILocation(line: 4056, column: 3, scope: !4032)
!4044 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !78, file: !78, line: 4078, type: !165, scopeLine: 4079, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4045 = !DILocalVariable(name: "value", arg: 1, scope: !4044, file: !78, line: 4078, type: !6)
!4046 = !DILocation(line: 4078, column: 26, scope: !4044)
!4047 = !DILocalVariable(name: "factor", arg: 2, scope: !4044, file: !78, line: 4078, type: !17)
!4048 = !DILocation(line: 4078, column: 36, scope: !4044)
!4049 = !DILocation(line: 4080, column: 41, scope: !4044)
!4050 = !DILocation(line: 4080, column: 59, scope: !4044)
!4051 = !DILocation(line: 4080, column: 53, scope: !4044)
!4052 = !DILocation(line: 4080, column: 67, scope: !4044)
!4053 = !DILocation(line: 4080, column: 47, scope: !4044)
!4054 = !DILocation(line: 4080, column: 10, scope: !4044)
!4055 = !DILocation(line: 4080, column: 3, scope: !4044)
!4056 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !78, file: !78, line: 4102, type: !165, scopeLine: 4103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4057 = !DILocalVariable(name: "value", arg: 1, scope: !4056, file: !78, line: 4102, type: !6)
!4058 = !DILocation(line: 4102, column: 25, scope: !4056)
!4059 = !DILocalVariable(name: "factor", arg: 2, scope: !4056, file: !78, line: 4102, type: !17)
!4060 = !DILocation(line: 4102, column: 35, scope: !4056)
!4061 = !DILocation(line: 4104, column: 41, scope: !4056)
!4062 = !DILocation(line: 4104, column: 59, scope: !4056)
!4063 = !DILocation(line: 4104, column: 53, scope: !4056)
!4064 = !DILocation(line: 4104, column: 67, scope: !4056)
!4065 = !DILocation(line: 4104, column: 47, scope: !4056)
!4066 = !DILocation(line: 4104, column: 10, scope: !4056)
!4067 = !DILocation(line: 4104, column: 3, scope: !4056)
!4068 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !78, file: !78, line: 4126, type: !165, scopeLine: 4127, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4069 = !DILocalVariable(name: "value", arg: 1, scope: !4068, file: !78, line: 4126, type: !6)
!4070 = !DILocation(line: 4126, column: 26, scope: !4068)
!4071 = !DILocalVariable(name: "factor", arg: 2, scope: !4068, file: !78, line: 4126, type: !17)
!4072 = !DILocation(line: 4126, column: 36, scope: !4068)
!4073 = !DILocation(line: 4128, column: 41, scope: !4068)
!4074 = !DILocation(line: 4128, column: 59, scope: !4068)
!4075 = !DILocation(line: 4128, column: 53, scope: !4068)
!4076 = !DILocation(line: 4128, column: 67, scope: !4068)
!4077 = !DILocation(line: 4128, column: 47, scope: !4068)
!4078 = !DILocation(line: 4128, column: 10, scope: !4068)
!4079 = !DILocation(line: 4128, column: 3, scope: !4068)
!4080 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !78, file: !78, line: 4150, type: !165, scopeLine: 4151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4081 = !DILocalVariable(name: "value", arg: 1, scope: !4080, file: !78, line: 4150, type: !6)
!4082 = !DILocation(line: 4150, column: 25, scope: !4080)
!4083 = !DILocalVariable(name: "factor", arg: 2, scope: !4080, file: !78, line: 4150, type: !17)
!4084 = !DILocation(line: 4150, column: 35, scope: !4080)
!4085 = !DILocation(line: 4152, column: 41, scope: !4080)
!4086 = !DILocation(line: 4152, column: 59, scope: !4080)
!4087 = !DILocation(line: 4152, column: 53, scope: !4080)
!4088 = !DILocation(line: 4152, column: 67, scope: !4080)
!4089 = !DILocation(line: 4152, column: 47, scope: !4080)
!4090 = !DILocation(line: 4152, column: 10, scope: !4080)
!4091 = !DILocation(line: 4152, column: 3, scope: !4080)
!4092 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !78, file: !78, line: 4173, type: !932, scopeLine: 4174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4093 = !DILocalVariable(name: "value", arg: 1, scope: !4092, file: !78, line: 4173, type: !22)
!4094 = !DILocation(line: 4173, column: 33, scope: !4092)
!4095 = !DILocalVariable(name: "factor", arg: 2, scope: !4092, file: !78, line: 4173, type: !22)
!4096 = !DILocation(line: 4173, column: 44, scope: !4092)
!4097 = !DILocation(line: 4175, column: 41, scope: !4092)
!4098 = !DILocation(line: 4175, column: 47, scope: !4092)
!4099 = !DILocation(line: 4175, column: 10, scope: !4092)
!4100 = !DILocation(line: 4175, column: 3, scope: !4092)
!4101 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !78, file: !78, line: 4196, type: !932, scopeLine: 4197, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4102 = !DILocalVariable(name: "value", arg: 1, scope: !4101, file: !78, line: 4196, type: !22)
!4103 = !DILocation(line: 4196, column: 32, scope: !4101)
!4104 = !DILocalVariable(name: "factor", arg: 2, scope: !4101, file: !78, line: 4196, type: !22)
!4105 = !DILocation(line: 4196, column: 43, scope: !4101)
!4106 = !DILocation(line: 4198, column: 41, scope: !4101)
!4107 = !DILocation(line: 4198, column: 47, scope: !4101)
!4108 = !DILocation(line: 4198, column: 10, scope: !4101)
!4109 = !DILocation(line: 4198, column: 3, scope: !4101)
!4110 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !78, file: !78, line: 4220, type: !932, scopeLine: 4221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4111 = !DILocalVariable(name: "value", arg: 1, scope: !4110, file: !78, line: 4220, type: !22)
!4112 = !DILocation(line: 4220, column: 31, scope: !4110)
!4113 = !DILocalVariable(name: "factor", arg: 2, scope: !4110, file: !78, line: 4220, type: !22)
!4114 = !DILocation(line: 4220, column: 42, scope: !4110)
!4115 = !DILocation(line: 4222, column: 41, scope: !4110)
!4116 = !DILocation(line: 4222, column: 47, scope: !4110)
!4117 = !DILocation(line: 4222, column: 10, scope: !4110)
!4118 = !DILocation(line: 4222, column: 3, scope: !4110)
!4119 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !78, file: !78, line: 4244, type: !932, scopeLine: 4245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4120 = !DILocalVariable(name: "value", arg: 1, scope: !4119, file: !78, line: 4244, type: !22)
!4121 = !DILocation(line: 4244, column: 34, scope: !4119)
!4122 = !DILocalVariable(name: "factor", arg: 2, scope: !4119, file: !78, line: 4244, type: !22)
!4123 = !DILocation(line: 4244, column: 45, scope: !4119)
!4124 = !DILocation(line: 4246, column: 44, scope: !4119)
!4125 = !DILocation(line: 4246, column: 50, scope: !4119)
!4126 = !DILocation(line: 4246, column: 10, scope: !4119)
!4127 = !DILocation(line: 4246, column: 3, scope: !4119)
!4128 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !78, file: !78, line: 4268, type: !932, scopeLine: 4269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4129 = !DILocalVariable(name: "value", arg: 1, scope: !4128, file: !78, line: 4268, type: !22)
!4130 = !DILocation(line: 4268, column: 32, scope: !4128)
!4131 = !DILocalVariable(name: "factor", arg: 2, scope: !4128, file: !78, line: 4268, type: !22)
!4132 = !DILocation(line: 4268, column: 43, scope: !4128)
!4133 = !DILocation(line: 4270, column: 44, scope: !4128)
!4134 = !DILocation(line: 4270, column: 50, scope: !4128)
!4135 = !DILocation(line: 4270, column: 10, scope: !4128)
!4136 = !DILocation(line: 4270, column: 3, scope: !4128)
!4137 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !78, file: !78, line: 4292, type: !932, scopeLine: 4293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4138 = !DILocalVariable(name: "value", arg: 1, scope: !4137, file: !78, line: 4292, type: !22)
!4139 = !DILocation(line: 4292, column: 31, scope: !4137)
!4140 = !DILocalVariable(name: "factor", arg: 2, scope: !4137, file: !78, line: 4292, type: !22)
!4141 = !DILocation(line: 4292, column: 42, scope: !4137)
!4142 = !DILocation(line: 4294, column: 44, scope: !4137)
!4143 = !DILocation(line: 4294, column: 50, scope: !4137)
!4144 = !DILocation(line: 4294, column: 10, scope: !4137)
!4145 = !DILocation(line: 4294, column: 3, scope: !4137)
!4146 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !78, file: !78, line: 4316, type: !932, scopeLine: 4317, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4147 = !DILocalVariable(name: "value", arg: 1, scope: !4146, file: !78, line: 4316, type: !22)
!4148 = !DILocation(line: 4316, column: 33, scope: !4146)
!4149 = !DILocalVariable(name: "factor", arg: 2, scope: !4146, file: !78, line: 4316, type: !22)
!4150 = !DILocation(line: 4316, column: 44, scope: !4146)
!4151 = !DILocation(line: 4318, column: 44, scope: !4146)
!4152 = !DILocation(line: 4318, column: 50, scope: !4146)
!4153 = !DILocation(line: 4318, column: 10, scope: !4146)
!4154 = !DILocation(line: 4318, column: 3, scope: !4146)
!4155 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !78, file: !78, line: 4340, type: !932, scopeLine: 4341, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4156 = !DILocalVariable(name: "value", arg: 1, scope: !4155, file: !78, line: 4340, type: !22)
!4157 = !DILocation(line: 4340, column: 32, scope: !4155)
!4158 = !DILocalVariable(name: "factor", arg: 2, scope: !4155, file: !78, line: 4340, type: !22)
!4159 = !DILocation(line: 4340, column: 43, scope: !4155)
!4160 = !DILocation(line: 4342, column: 44, scope: !4155)
!4161 = !DILocation(line: 4342, column: 50, scope: !4155)
!4162 = !DILocation(line: 4342, column: 10, scope: !4155)
!4163 = !DILocation(line: 4342, column: 3, scope: !4155)
!4164 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !78, file: !78, line: 4363, type: !932, scopeLine: 4364, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4165 = !DILocalVariable(name: "value", arg: 1, scope: !4164, file: !78, line: 4363, type: !22)
!4166 = !DILocation(line: 4363, column: 31, scope: !4164)
!4167 = !DILocalVariable(name: "factor", arg: 2, scope: !4164, file: !78, line: 4363, type: !22)
!4168 = !DILocation(line: 4363, column: 42, scope: !4164)
!4169 = !DILocation(line: 4365, column: 44, scope: !4164)
!4170 = !DILocation(line: 4365, column: 50, scope: !4164)
!4171 = !DILocation(line: 4365, column: 10, scope: !4164)
!4172 = !DILocation(line: 4365, column: 3, scope: !4164)
!4173 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !78, file: !78, line: 4386, type: !932, scopeLine: 4387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4174 = !DILocalVariable(name: "value", arg: 1, scope: !4173, file: !78, line: 4386, type: !22)
!4175 = !DILocation(line: 4386, column: 30, scope: !4173)
!4176 = !DILocalVariable(name: "factor", arg: 2, scope: !4173, file: !78, line: 4386, type: !22)
!4177 = !DILocation(line: 4386, column: 41, scope: !4173)
!4178 = !DILocation(line: 4388, column: 44, scope: !4173)
!4179 = !DILocation(line: 4388, column: 50, scope: !4173)
!4180 = !DILocation(line: 4388, column: 10, scope: !4173)
!4181 = !DILocation(line: 4388, column: 3, scope: !4173)
!4182 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !78, file: !78, line: 4409, type: !932, scopeLine: 4410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4183 = !DILocalVariable(name: "value", arg: 1, scope: !4182, file: !78, line: 4409, type: !22)
!4184 = !DILocation(line: 4409, column: 33, scope: !4182)
!4185 = !DILocalVariable(name: "factor", arg: 2, scope: !4182, file: !78, line: 4409, type: !22)
!4186 = !DILocation(line: 4409, column: 44, scope: !4182)
!4187 = !DILocation(line: 4411, column: 44, scope: !4182)
!4188 = !DILocation(line: 4411, column: 50, scope: !4182)
!4189 = !DILocation(line: 4411, column: 10, scope: !4182)
!4190 = !DILocation(line: 4411, column: 3, scope: !4182)
!4191 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !78, file: !78, line: 4432, type: !932, scopeLine: 4433, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4192 = !DILocalVariable(name: "value", arg: 1, scope: !4191, file: !78, line: 4432, type: !22)
!4193 = !DILocation(line: 4432, column: 32, scope: !4191)
!4194 = !DILocalVariable(name: "factor", arg: 2, scope: !4191, file: !78, line: 4432, type: !22)
!4195 = !DILocation(line: 4432, column: 43, scope: !4191)
!4196 = !DILocation(line: 4434, column: 44, scope: !4191)
!4197 = !DILocation(line: 4434, column: 50, scope: !4191)
!4198 = !DILocation(line: 4434, column: 10, scope: !4191)
!4199 = !DILocation(line: 4434, column: 3, scope: !4191)
!4200 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !78, file: !78, line: 4455, type: !932, scopeLine: 4456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4201 = !DILocalVariable(name: "value", arg: 1, scope: !4200, file: !78, line: 4455, type: !22)
!4202 = !DILocation(line: 4455, column: 31, scope: !4200)
!4203 = !DILocalVariable(name: "factor", arg: 2, scope: !4200, file: !78, line: 4455, type: !22)
!4204 = !DILocation(line: 4455, column: 42, scope: !4200)
!4205 = !DILocation(line: 4457, column: 44, scope: !4200)
!4206 = !DILocation(line: 4457, column: 50, scope: !4200)
!4207 = !DILocation(line: 4457, column: 10, scope: !4200)
!4208 = !DILocation(line: 4457, column: 3, scope: !4200)
!4209 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !78, file: !78, line: 4478, type: !932, scopeLine: 4479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4210 = !DILocalVariable(name: "value", arg: 1, scope: !4209, file: !78, line: 4478, type: !22)
!4211 = !DILocation(line: 4478, column: 30, scope: !4209)
!4212 = !DILocalVariable(name: "factor", arg: 2, scope: !4209, file: !78, line: 4478, type: !22)
!4213 = !DILocation(line: 4478, column: 41, scope: !4209)
!4214 = !DILocation(line: 4480, column: 44, scope: !4209)
!4215 = !DILocation(line: 4480, column: 50, scope: !4209)
!4216 = !DILocation(line: 4480, column: 10, scope: !4209)
!4217 = !DILocation(line: 4480, column: 3, scope: !4209)
!4218 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !78, file: !78, line: 4500, type: !977, scopeLine: 4501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4219 = !DILocalVariable(name: "x_value", arg: 1, scope: !4218, file: !78, line: 4500, type: !22)
!4220 = !DILocation(line: 4500, column: 32, scope: !4218)
!4221 = !DILocalVariable(name: "y_value", arg: 2, scope: !4218, file: !78, line: 4500, type: !17)
!4222 = !DILocation(line: 4500, column: 44, scope: !4218)
!4223 = !DILocation(line: 4502, column: 40, scope: !4218)
!4224 = !DILocation(line: 4502, column: 60, scope: !4218)
!4225 = !DILocation(line: 4502, column: 54, scope: !4218)
!4226 = !DILocation(line: 4502, column: 69, scope: !4218)
!4227 = !DILocation(line: 4502, column: 48, scope: !4218)
!4228 = !DILocation(line: 4502, column: 10, scope: !4218)
!4229 = !DILocation(line: 4502, column: 3, scope: !4218)
!4230 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !78, file: !78, line: 4522, type: !977, scopeLine: 4523, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4231 = !DILocalVariable(name: "x_value", arg: 1, scope: !4230, file: !78, line: 4522, type: !22)
!4232 = !DILocation(line: 4522, column: 31, scope: !4230)
!4233 = !DILocalVariable(name: "y_value", arg: 2, scope: !4230, file: !78, line: 4522, type: !17)
!4234 = !DILocation(line: 4522, column: 43, scope: !4230)
!4235 = !DILocation(line: 4524, column: 40, scope: !4230)
!4236 = !DILocation(line: 4524, column: 60, scope: !4230)
!4237 = !DILocation(line: 4524, column: 54, scope: !4230)
!4238 = !DILocation(line: 4524, column: 69, scope: !4230)
!4239 = !DILocation(line: 4524, column: 48, scope: !4230)
!4240 = !DILocation(line: 4524, column: 10, scope: !4230)
!4241 = !DILocation(line: 4524, column: 3, scope: !4230)
!4242 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !78, file: !78, line: 4545, type: !977, scopeLine: 4546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4243 = !DILocalVariable(name: "x_value", arg: 1, scope: !4242, file: !78, line: 4545, type: !22)
!4244 = !DILocation(line: 4545, column: 30, scope: !4242)
!4245 = !DILocalVariable(name: "y_value", arg: 2, scope: !4242, file: !78, line: 4545, type: !17)
!4246 = !DILocation(line: 4545, column: 42, scope: !4242)
!4247 = !DILocation(line: 4547, column: 40, scope: !4242)
!4248 = !DILocation(line: 4547, column: 60, scope: !4242)
!4249 = !DILocation(line: 4547, column: 54, scope: !4242)
!4250 = !DILocation(line: 4547, column: 69, scope: !4242)
!4251 = !DILocation(line: 4547, column: 48, scope: !4242)
!4252 = !DILocation(line: 4547, column: 10, scope: !4242)
!4253 = !DILocation(line: 4547, column: 3, scope: !4242)
!4254 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !78, file: !78, line: 4568, type: !977, scopeLine: 4569, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4255 = !DILocalVariable(name: "x_value", arg: 1, scope: !4254, file: !78, line: 4568, type: !22)
!4256 = !DILocation(line: 4568, column: 31, scope: !4254)
!4257 = !DILocalVariable(name: "y_value", arg: 2, scope: !4254, file: !78, line: 4568, type: !17)
!4258 = !DILocation(line: 4568, column: 43, scope: !4254)
!4259 = !DILocation(line: 4570, column: 44, scope: !4254)
!4260 = !DILocation(line: 4570, column: 64, scope: !4254)
!4261 = !DILocation(line: 4570, column: 58, scope: !4254)
!4262 = !DILocation(line: 4570, column: 73, scope: !4254)
!4263 = !DILocation(line: 4570, column: 52, scope: !4254)
!4264 = !DILocation(line: 4570, column: 10, scope: !4254)
!4265 = !DILocation(line: 4570, column: 3, scope: !4254)
!4266 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !78, file: !78, line: 4591, type: !977, scopeLine: 4592, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4267 = !DILocalVariable(name: "x_value", arg: 1, scope: !4266, file: !78, line: 4591, type: !22)
!4268 = !DILocation(line: 4591, column: 30, scope: !4266)
!4269 = !DILocalVariable(name: "y_value", arg: 2, scope: !4266, file: !78, line: 4591, type: !17)
!4270 = !DILocation(line: 4591, column: 42, scope: !4266)
!4271 = !DILocation(line: 4593, column: 44, scope: !4266)
!4272 = !DILocation(line: 4593, column: 64, scope: !4266)
!4273 = !DILocation(line: 4593, column: 58, scope: !4266)
!4274 = !DILocation(line: 4593, column: 73, scope: !4266)
!4275 = !DILocation(line: 4593, column: 52, scope: !4266)
!4276 = !DILocation(line: 4593, column: 10, scope: !4266)
!4277 = !DILocation(line: 4593, column: 3, scope: !4266)
!4278 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !78, file: !78, line: 4613, type: !977, scopeLine: 4614, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4279 = !DILocalVariable(name: "x_value", arg: 1, scope: !4278, file: !78, line: 4613, type: !22)
!4280 = !DILocation(line: 4613, column: 30, scope: !4278)
!4281 = !DILocalVariable(name: "y_value", arg: 2, scope: !4278, file: !78, line: 4613, type: !17)
!4282 = !DILocation(line: 4613, column: 42, scope: !4278)
!4283 = !DILocation(line: 4615, column: 44, scope: !4278)
!4284 = !DILocation(line: 4615, column: 64, scope: !4278)
!4285 = !DILocation(line: 4615, column: 58, scope: !4278)
!4286 = !DILocation(line: 4615, column: 73, scope: !4278)
!4287 = !DILocation(line: 4615, column: 52, scope: !4278)
!4288 = !DILocation(line: 4615, column: 10, scope: !4278)
!4289 = !DILocation(line: 4615, column: 3, scope: !4278)
!4290 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !78, file: !78, line: 4635, type: !977, scopeLine: 4636, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4291 = !DILocalVariable(name: "x_value", arg: 1, scope: !4290, file: !78, line: 4635, type: !22)
!4292 = !DILocation(line: 4635, column: 29, scope: !4290)
!4293 = !DILocalVariable(name: "y_value", arg: 2, scope: !4290, file: !78, line: 4635, type: !17)
!4294 = !DILocation(line: 4635, column: 41, scope: !4290)
!4295 = !DILocation(line: 4637, column: 44, scope: !4290)
!4296 = !DILocation(line: 4637, column: 64, scope: !4290)
!4297 = !DILocation(line: 4637, column: 58, scope: !4290)
!4298 = !DILocation(line: 4637, column: 73, scope: !4290)
!4299 = !DILocation(line: 4637, column: 52, scope: !4290)
!4300 = !DILocation(line: 4637, column: 10, scope: !4290)
!4301 = !DILocation(line: 4637, column: 3, scope: !4290)
!4302 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !78, file: !78, line: 4657, type: !977, scopeLine: 4658, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4303 = !DILocalVariable(name: "x_value", arg: 1, scope: !4302, file: !78, line: 4657, type: !22)
!4304 = !DILocation(line: 4657, column: 30, scope: !4302)
!4305 = !DILocalVariable(name: "y_value", arg: 2, scope: !4302, file: !78, line: 4657, type: !17)
!4306 = !DILocation(line: 4657, column: 42, scope: !4302)
!4307 = !DILocation(line: 4659, column: 44, scope: !4302)
!4308 = !DILocation(line: 4659, column: 64, scope: !4302)
!4309 = !DILocation(line: 4659, column: 58, scope: !4302)
!4310 = !DILocation(line: 4659, column: 73, scope: !4302)
!4311 = !DILocation(line: 4659, column: 52, scope: !4302)
!4312 = !DILocation(line: 4659, column: 10, scope: !4302)
!4313 = !DILocation(line: 4659, column: 3, scope: !4302)
!4314 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !78, file: !78, line: 4679, type: !977, scopeLine: 4680, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4315 = !DILocalVariable(name: "x_value", arg: 1, scope: !4314, file: !78, line: 4679, type: !22)
!4316 = !DILocation(line: 4679, column: 29, scope: !4314)
!4317 = !DILocalVariable(name: "y_value", arg: 2, scope: !4314, file: !78, line: 4679, type: !17)
!4318 = !DILocation(line: 4679, column: 41, scope: !4314)
!4319 = !DILocation(line: 4681, column: 44, scope: !4314)
!4320 = !DILocation(line: 4681, column: 64, scope: !4314)
!4321 = !DILocation(line: 4681, column: 58, scope: !4314)
!4322 = !DILocation(line: 4681, column: 73, scope: !4314)
!4323 = !DILocation(line: 4681, column: 52, scope: !4314)
!4324 = !DILocation(line: 4681, column: 10, scope: !4314)
!4325 = !DILocation(line: 4681, column: 3, scope: !4314)
!4326 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !78, file: !78, line: 4703, type: !1506, scopeLine: 4704, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4327 = !DILocalVariable(name: "value", arg: 1, scope: !4326, file: !78, line: 4703, type: !742)
!4328 = !DILocation(line: 4703, column: 31, scope: !4326)
!4329 = !DILocalVariable(name: "factor", arg: 2, scope: !4326, file: !78, line: 4703, type: !13)
!4330 = !DILocation(line: 4703, column: 42, scope: !4326)
!4331 = !DILocation(line: 4705, column: 41, scope: !4326)
!4332 = !DILocation(line: 4705, column: 47, scope: !4326)
!4333 = !DILocation(line: 4705, column: 10, scope: !4326)
!4334 = !DILocation(line: 4705, column: 3, scope: !4326)
!4335 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !78, file: !78, line: 5297, type: !4336, scopeLine: 5298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4336 = !DISubroutineType(types: !4337)
!4337 = !{!742, !742, !13, !742}
!4338 = !DILocalVariable(name: "value", arg: 1, scope: !4335, file: !78, line: 5297, type: !742)
!4339 = !DILocation(line: 5297, column: 40, scope: !4335)
!4340 = !DILocalVariable(name: "factor", arg: 2, scope: !4335, file: !78, line: 5297, type: !13)
!4341 = !DILocation(line: 5297, column: 50, scope: !4335)
!4342 = !DILocalVariable(name: "count", arg: 3, scope: !4335, file: !78, line: 5297, type: !742)
!4343 = !DILocation(line: 5297, column: 62, scope: !4335)
!4344 = !DILocalVariable(name: "u32Temp1", scope: !4335, file: !78, line: 5299, type: !742)
!4345 = !DILocation(line: 5299, column: 6, scope: !4335)
!4346 = !DILocalVariable(name: "u32Temp2", scope: !4335, file: !78, line: 5299, type: !742)
!4347 = !DILocation(line: 5299, column: 17, scope: !4335)
!4348 = !DILocalVariable(name: "u32Temp3", scope: !4335, file: !78, line: 5299, type: !742)
!4349 = !DILocation(line: 5299, column: 26, scope: !4335)
!4350 = !DILocalVariable(name: "u8SignBit", scope: !4335, file: !78, line: 5300, type: !17)
!4351 = !DILocation(line: 5300, column: 5, scope: !4335)
!4352 = !DILocation(line: 5302, column: 5, scope: !4353)
!4353 = distinct !DILexicalBlock(scope: !4335, file: !78, line: 5302, column: 5)
!4354 = !DILocation(line: 5302, column: 11, scope: !4353)
!4355 = !DILocation(line: 5302, column: 5, scope: !4335)
!4356 = !DILocation(line: 5304, column: 13, scope: !4357)
!4357 = distinct !DILexicalBlock(scope: !4353, file: !78, line: 5303, column: 2)
!4358 = !DILocation(line: 5305, column: 2, scope: !4357)
!4359 = !DILocation(line: 5308, column: 13, scope: !4360)
!4360 = distinct !DILexicalBlock(scope: !4353, file: !78, line: 5307, column: 2)
!4361 = !DILocation(line: 5312, column: 5, scope: !4362)
!4362 = distinct !DILexicalBlock(scope: !4335, file: !78, line: 5312, column: 5)
!4363 = !DILocation(line: 5312, column: 11, scope: !4362)
!4364 = !DILocation(line: 5312, column: 5, scope: !4335)
!4365 = !DILocation(line: 5314, column: 15, scope: !4366)
!4366 = distinct !DILexicalBlock(scope: !4362, file: !78, line: 5313, column: 2)
!4367 = !DILocation(line: 5314, column: 14, scope: !4366)
!4368 = !DILocation(line: 5314, column: 12, scope: !4366)
!4369 = !DILocation(line: 5315, column: 2, scope: !4366)
!4370 = !DILocation(line: 5318, column: 14, scope: !4371)
!4371 = distinct !DILexicalBlock(scope: !4362, file: !78, line: 5317, column: 2)
!4372 = !DILocation(line: 5318, column: 12, scope: !4371)
!4373 = !DILocation(line: 5321, column: 13, scope: !4335)
!4374 = !DILocation(line: 5321, column: 21, scope: !4335)
!4375 = !DILocation(line: 5321, column: 19, scope: !4335)
!4376 = !DILocation(line: 5321, column: 11, scope: !4335)
!4377 = !DILocation(line: 5322, column: 25, scope: !4335)
!4378 = !DILocation(line: 5322, column: 32, scope: !4335)
!4379 = !DILocation(line: 5322, column: 13, scope: !4335)
!4380 = !DILocation(line: 5322, column: 11, scope: !4335)
!4381 = !DILocation(line: 5323, column: 13, scope: !4335)
!4382 = !DILocation(line: 5323, column: 25, scope: !4335)
!4383 = !DILocation(line: 5323, column: 22, scope: !4335)
!4384 = !DILocation(line: 5323, column: 11, scope: !4335)
!4385 = !DILocation(line: 5324, column: 14, scope: !4335)
!4386 = !DILocation(line: 5324, column: 30, scope: !4335)
!4387 = !DILocation(line: 5324, column: 29, scope: !4335)
!4388 = !DILocation(line: 5324, column: 23, scope: !4335)
!4389 = !DILocation(line: 5324, column: 11, scope: !4335)
!4390 = !DILocation(line: 5325, column: 6, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !4335, file: !78, line: 5325, column: 5)
!4392 = !DILocation(line: 5325, column: 16, scope: !4391)
!4393 = !DILocation(line: 5325, column: 14, scope: !4391)
!4394 = !DILocation(line: 5325, column: 22, scope: !4391)
!4395 = !DILocation(line: 5325, column: 5, scope: !4335)
!4396 = !DILocation(line: 5327, column: 6, scope: !4397)
!4397 = distinct !DILexicalBlock(scope: !4398, file: !78, line: 5327, column: 6)
!4398 = distinct !DILexicalBlock(scope: !4391, file: !78, line: 5326, column: 2)
!4399 = !DILocation(line: 5327, column: 16, scope: !4397)
!4400 = !DILocation(line: 5327, column: 6, scope: !4398)
!4401 = !DILocation(line: 5329, column: 7, scope: !4402)
!4402 = distinct !DILexicalBlock(scope: !4403, file: !78, line: 5329, column: 7)
!4403 = distinct !DILexicalBlock(scope: !4397, file: !78, line: 5328, column: 3)
!4404 = !DILocation(line: 5329, column: 15, scope: !4402)
!4405 = !DILocation(line: 5329, column: 7, scope: !4403)
!4406 = !DILocation(line: 5330, column: 12, scope: !4402)
!4407 = !DILocation(line: 5330, column: 5, scope: !4402)
!4408 = !DILocation(line: 5332, column: 5, scope: !4402)
!4409 = !DILocation(line: 5336, column: 4, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4397, file: !78, line: 5335, column: 3)
!4411 = !DILocation(line: 5341, column: 3, scope: !4412)
!4412 = distinct !DILexicalBlock(scope: !4391, file: !78, line: 5340, column: 2)
!4413 = !DILocation(line: 5343, column: 1, scope: !4335)
!4414 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !78, file: !78, line: 4727, type: !1324, scopeLine: 4728, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4415 = !DILocalVariable(name: "value", arg: 1, scope: !4414, file: !78, line: 4727, type: !742)
!4416 = !DILocation(line: 4727, column: 31, scope: !4414)
!4417 = !DILocalVariable(name: "factor", arg: 2, scope: !4414, file: !78, line: 4727, type: !86)
!4418 = !DILocation(line: 4727, column: 42, scope: !4414)
!4419 = !DILocation(line: 4729, column: 41, scope: !4414)
!4420 = !DILocation(line: 4729, column: 47, scope: !4414)
!4421 = !DILocation(line: 4729, column: 10, scope: !4414)
!4422 = !DILocation(line: 4729, column: 3, scope: !4414)
!4423 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !78, file: !78, line: 5361, type: !4424, scopeLine: 5362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4424 = !DISubroutineType(types: !4425)
!4425 = !{!742, !742, !86, !742}
!4426 = !DILocalVariable(name: "value", arg: 1, scope: !4423, file: !78, line: 5361, type: !742)
!4427 = !DILocation(line: 5361, column: 40, scope: !4423)
!4428 = !DILocalVariable(name: "factor", arg: 2, scope: !4423, file: !78, line: 5361, type: !86)
!4429 = !DILocation(line: 5361, column: 51, scope: !4423)
!4430 = !DILocalVariable(name: "count", arg: 3, scope: !4423, file: !78, line: 5361, type: !742)
!4431 = !DILocation(line: 5361, column: 63, scope: !4423)
!4432 = !DILocalVariable(name: "u32Temp1", scope: !4423, file: !78, line: 5363, type: !742)
!4433 = !DILocation(line: 5363, column: 6, scope: !4423)
!4434 = !DILocalVariable(name: "u32Temp2", scope: !4423, file: !78, line: 5363, type: !742)
!4435 = !DILocation(line: 5363, column: 17, scope: !4423)
!4436 = !DILocalVariable(name: "u8SignBit", scope: !4423, file: !78, line: 5364, type: !17)
!4437 = !DILocation(line: 5364, column: 5, scope: !4423)
!4438 = !DILocation(line: 5366, column: 5, scope: !4439)
!4439 = distinct !DILexicalBlock(scope: !4423, file: !78, line: 5366, column: 5)
!4440 = !DILocation(line: 5366, column: 11, scope: !4439)
!4441 = !DILocation(line: 5366, column: 5, scope: !4423)
!4442 = !DILocation(line: 5368, column: 13, scope: !4443)
!4443 = distinct !DILexicalBlock(scope: !4439, file: !78, line: 5367, column: 2)
!4444 = !DILocation(line: 5369, column: 2, scope: !4443)
!4445 = !DILocation(line: 5372, column: 13, scope: !4446)
!4446 = distinct !DILexicalBlock(scope: !4439, file: !78, line: 5371, column: 2)
!4447 = !DILocation(line: 5376, column: 5, scope: !4448)
!4448 = distinct !DILexicalBlock(scope: !4423, file: !78, line: 5376, column: 5)
!4449 = !DILocation(line: 5376, column: 11, scope: !4448)
!4450 = !DILocation(line: 5376, column: 5, scope: !4423)
!4451 = !DILocation(line: 5378, column: 15, scope: !4452)
!4452 = distinct !DILexicalBlock(scope: !4448, file: !78, line: 5377, column: 2)
!4453 = !DILocation(line: 5378, column: 14, scope: !4452)
!4454 = !DILocation(line: 5378, column: 12, scope: !4452)
!4455 = !DILocation(line: 5379, column: 2, scope: !4452)
!4456 = !DILocation(line: 5382, column: 14, scope: !4457)
!4457 = distinct !DILexicalBlock(scope: !4448, file: !78, line: 5381, column: 2)
!4458 = !DILocation(line: 5382, column: 12, scope: !4457)
!4459 = !DILocation(line: 5385, column: 25, scope: !4423)
!4460 = !DILocation(line: 5385, column: 32, scope: !4423)
!4461 = !DILocation(line: 5385, column: 13, scope: !4423)
!4462 = !DILocation(line: 5385, column: 11, scope: !4423)
!4463 = !DILocation(line: 5386, column: 13, scope: !4423)
!4464 = !DILocation(line: 5386, column: 26, scope: !4423)
!4465 = !DILocation(line: 5386, column: 31, scope: !4423)
!4466 = !DILocation(line: 5386, column: 22, scope: !4423)
!4467 = !DILocation(line: 5386, column: 11, scope: !4423)
!4468 = !DILocation(line: 5387, column: 5, scope: !4469)
!4469 = distinct !DILexicalBlock(scope: !4423, file: !78, line: 5387, column: 5)
!4470 = !DILocation(line: 5387, column: 15, scope: !4469)
!4471 = !DILocation(line: 5387, column: 5, scope: !4423)
!4472 = !DILocation(line: 5389, column: 10, scope: !4473)
!4473 = distinct !DILexicalBlock(scope: !4469, file: !78, line: 5388, column: 2)
!4474 = !DILocation(line: 5389, column: 3, scope: !4473)
!4475 = !DILocation(line: 5393, column: 3, scope: !4476)
!4476 = distinct !DILexicalBlock(scope: !4469, file: !78, line: 5392, column: 2)
!4477 = !DILocation(line: 5395, column: 1, scope: !4423)
!4478 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !78, file: !78, line: 4751, type: !3098, scopeLine: 4752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4479 = !DILocalVariable(name: "value", arg: 1, scope: !4478, file: !78, line: 4751, type: !742)
!4480 = !DILocation(line: 4751, column: 30, scope: !4478)
!4481 = !DILocalVariable(name: "factor", arg: 2, scope: !4478, file: !78, line: 4751, type: !6)
!4482 = !DILocation(line: 4751, column: 40, scope: !4478)
!4483 = !DILocation(line: 4753, column: 40, scope: !4478)
!4484 = !DILocation(line: 4753, column: 46, scope: !4478)
!4485 = !DILocation(line: 4753, column: 10, scope: !4478)
!4486 = !DILocation(line: 4753, column: 3, scope: !4478)
!4487 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !78, file: !78, line: 5439, type: !4488, scopeLine: 5440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4488 = !DISubroutineType(types: !4489)
!4489 = !{!742, !742, !6, !742}
!4490 = !DILocalVariable(name: "value", arg: 1, scope: !4487, file: !78, line: 5439, type: !742)
!4491 = !DILocation(line: 5439, column: 39, scope: !4487)
!4492 = !DILocalVariable(name: "factor", arg: 2, scope: !4487, file: !78, line: 5439, type: !6)
!4493 = !DILocation(line: 5439, column: 49, scope: !4487)
!4494 = !DILocalVariable(name: "count", arg: 3, scope: !4487, file: !78, line: 5439, type: !742)
!4495 = !DILocation(line: 5439, column: 61, scope: !4487)
!4496 = !DILocalVariable(name: "u32Temp1", scope: !4487, file: !78, line: 5441, type: !742)
!4497 = !DILocation(line: 5441, column: 6, scope: !4487)
!4498 = !DILocalVariable(name: "u32Temp2", scope: !4487, file: !78, line: 5441, type: !742)
!4499 = !DILocation(line: 5441, column: 17, scope: !4487)
!4500 = !DILocalVariable(name: "u32Temp3", scope: !4487, file: !78, line: 5441, type: !742)
!4501 = !DILocation(line: 5441, column: 26, scope: !4487)
!4502 = !DILocalVariable(name: "u8SignBit", scope: !4487, file: !78, line: 5442, type: !17)
!4503 = !DILocation(line: 5442, column: 5, scope: !4487)
!4504 = !DILocation(line: 5444, column: 5, scope: !4505)
!4505 = distinct !DILexicalBlock(scope: !4487, file: !78, line: 5444, column: 5)
!4506 = !DILocation(line: 5444, column: 11, scope: !4505)
!4507 = !DILocation(line: 5444, column: 5, scope: !4487)
!4508 = !DILocation(line: 5446, column: 13, scope: !4509)
!4509 = distinct !DILexicalBlock(scope: !4505, file: !78, line: 5445, column: 2)
!4510 = !DILocation(line: 5447, column: 2, scope: !4509)
!4511 = !DILocation(line: 5450, column: 13, scope: !4512)
!4512 = distinct !DILexicalBlock(scope: !4505, file: !78, line: 5449, column: 2)
!4513 = !DILocation(line: 5454, column: 5, scope: !4514)
!4514 = distinct !DILexicalBlock(scope: !4487, file: !78, line: 5454, column: 5)
!4515 = !DILocation(line: 5454, column: 11, scope: !4514)
!4516 = !DILocation(line: 5454, column: 5, scope: !4487)
!4517 = !DILocation(line: 5456, column: 15, scope: !4518)
!4518 = distinct !DILexicalBlock(scope: !4514, file: !78, line: 5455, column: 2)
!4519 = !DILocation(line: 5456, column: 14, scope: !4518)
!4520 = !DILocation(line: 5456, column: 12, scope: !4518)
!4521 = !DILocation(line: 5457, column: 2, scope: !4518)
!4522 = !DILocation(line: 5460, column: 14, scope: !4523)
!4523 = distinct !DILexicalBlock(scope: !4514, file: !78, line: 5459, column: 2)
!4524 = !DILocation(line: 5460, column: 12, scope: !4523)
!4525 = !DILocation(line: 5463, column: 13, scope: !4487)
!4526 = !DILocation(line: 5463, column: 21, scope: !4487)
!4527 = !DILocation(line: 5463, column: 19, scope: !4487)
!4528 = !DILocation(line: 5463, column: 11, scope: !4487)
!4529 = !DILocation(line: 5464, column: 25, scope: !4487)
!4530 = !DILocation(line: 5464, column: 32, scope: !4487)
!4531 = !DILocation(line: 5464, column: 13, scope: !4487)
!4532 = !DILocation(line: 5464, column: 11, scope: !4487)
!4533 = !DILocation(line: 5465, column: 13, scope: !4487)
!4534 = !DILocation(line: 5465, column: 25, scope: !4487)
!4535 = !DILocation(line: 5465, column: 22, scope: !4487)
!4536 = !DILocation(line: 5465, column: 11, scope: !4487)
!4537 = !DILocation(line: 5466, column: 14, scope: !4487)
!4538 = !DILocation(line: 5466, column: 30, scope: !4487)
!4539 = !DILocation(line: 5466, column: 29, scope: !4487)
!4540 = !DILocation(line: 5466, column: 23, scope: !4487)
!4541 = !DILocation(line: 5466, column: 11, scope: !4487)
!4542 = !DILocation(line: 5467, column: 6, scope: !4543)
!4543 = distinct !DILexicalBlock(scope: !4487, file: !78, line: 5467, column: 5)
!4544 = !DILocation(line: 5467, column: 16, scope: !4543)
!4545 = !DILocation(line: 5467, column: 14, scope: !4543)
!4546 = !DILocation(line: 5467, column: 22, scope: !4543)
!4547 = !DILocation(line: 5467, column: 5, scope: !4487)
!4548 = !DILocation(line: 5469, column: 6, scope: !4549)
!4549 = distinct !DILexicalBlock(scope: !4550, file: !78, line: 5469, column: 6)
!4550 = distinct !DILexicalBlock(scope: !4543, file: !78, line: 5468, column: 2)
!4551 = !DILocation(line: 5469, column: 16, scope: !4549)
!4552 = !DILocation(line: 5469, column: 6, scope: !4550)
!4553 = !DILocation(line: 5471, column: 7, scope: !4554)
!4554 = distinct !DILexicalBlock(scope: !4555, file: !78, line: 5471, column: 7)
!4555 = distinct !DILexicalBlock(scope: !4549, file: !78, line: 5470, column: 3)
!4556 = !DILocation(line: 5471, column: 15, scope: !4554)
!4557 = !DILocation(line: 5471, column: 7, scope: !4555)
!4558 = !DILocation(line: 5472, column: 12, scope: !4554)
!4559 = !DILocation(line: 5472, column: 5, scope: !4554)
!4560 = !DILocation(line: 5474, column: 5, scope: !4554)
!4561 = !DILocation(line: 5478, column: 4, scope: !4562)
!4562 = distinct !DILexicalBlock(scope: !4549, file: !78, line: 5477, column: 3)
!4563 = !DILocation(line: 5483, column: 3, scope: !4564)
!4564 = distinct !DILexicalBlock(scope: !4543, file: !78, line: 5482, column: 2)
!4565 = !DILocation(line: 5485, column: 1, scope: !4487)
!4566 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !78, file: !78, line: 4775, type: !1120, scopeLine: 4776, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4567 = !DILocalVariable(name: "value", arg: 1, scope: !4566, file: !78, line: 4775, type: !742)
!4568 = !DILocation(line: 4775, column: 31, scope: !4566)
!4569 = !DILocalVariable(name: "factor", arg: 2, scope: !4566, file: !78, line: 4775, type: !22)
!4570 = !DILocation(line: 4775, column: 42, scope: !4566)
!4571 = !DILocation(line: 4777, column: 41, scope: !4566)
!4572 = !DILocation(line: 4777, column: 47, scope: !4566)
!4573 = !DILocation(line: 4777, column: 10, scope: !4566)
!4574 = !DILocation(line: 4777, column: 3, scope: !4566)
!4575 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !78, file: !78, line: 4799, type: !1415, scopeLine: 4800, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4576 = !DILocalVariable(name: "value", arg: 1, scope: !4575, file: !78, line: 4799, type: !742)
!4577 = !DILocation(line: 4799, column: 31, scope: !4575)
!4578 = !DILocalVariable(name: "factor", arg: 2, scope: !4575, file: !78, line: 4799, type: !742)
!4579 = !DILocation(line: 4799, column: 42, scope: !4575)
!4580 = !DILocation(line: 4801, column: 41, scope: !4575)
!4581 = !DILocation(line: 4801, column: 47, scope: !4575)
!4582 = !DILocation(line: 4801, column: 10, scope: !4575)
!4583 = !DILocation(line: 4801, column: 3, scope: !4575)
!4584 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !78, file: !78, line: 5412, type: !4585, scopeLine: 5413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4585 = !DISubroutineType(types: !4586)
!4586 = !{!742, !742, !742, !742}
!4587 = !DILocalVariable(name: "value", arg: 1, scope: !4584, file: !78, line: 5412, type: !742)
!4588 = !DILocation(line: 5412, column: 40, scope: !4584)
!4589 = !DILocalVariable(name: "factor", arg: 2, scope: !4584, file: !78, line: 5412, type: !742)
!4590 = !DILocation(line: 5412, column: 50, scope: !4584)
!4591 = !DILocalVariable(name: "count", arg: 3, scope: !4584, file: !78, line: 5412, type: !742)
!4592 = !DILocation(line: 5412, column: 62, scope: !4584)
!4593 = !DILocalVariable(name: "u32Temp1", scope: !4584, file: !78, line: 5414, type: !742)
!4594 = !DILocation(line: 5414, column: 6, scope: !4584)
!4595 = !DILocalVariable(name: "u32Temp2", scope: !4584, file: !78, line: 5414, type: !742)
!4596 = !DILocation(line: 5414, column: 17, scope: !4584)
!4597 = !DILocalVariable(name: "u32Temp3", scope: !4584, file: !78, line: 5414, type: !742)
!4598 = !DILocation(line: 5414, column: 26, scope: !4584)
!4599 = !DILocalVariable(name: "u32Temp4", scope: !4584, file: !78, line: 5414, type: !742)
!4600 = !DILocation(line: 5414, column: 35, scope: !4584)
!4601 = !DILocalVariable(name: "u8SignBit", scope: !4584, file: !78, line: 5415, type: !17)
!4602 = !DILocation(line: 5415, column: 5, scope: !4584)
!4603 = !DILocation(line: 5417, column: 25, scope: !4584)
!4604 = !DILocation(line: 5417, column: 32, scope: !4584)
!4605 = !DILocation(line: 5417, column: 13, scope: !4584)
!4606 = !DILocation(line: 5417, column: 11, scope: !4584)
!4607 = !DILocation(line: 5418, column: 13, scope: !4584)
!4608 = !DILocation(line: 5418, column: 26, scope: !4584)
!4609 = !DILocation(line: 5418, column: 31, scope: !4584)
!4610 = !DILocation(line: 5418, column: 22, scope: !4584)
!4611 = !DILocation(line: 5418, column: 11, scope: !4584)
!4612 = !DILocation(line: 5419, column: 9, scope: !4584)
!4613 = !DILocation(line: 5419, column: 2, scope: !4584)
!4614 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !78, file: !78, line: 4823, type: !3037, scopeLine: 4824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4615 = !DILocalVariable(name: "value", arg: 1, scope: !4614, file: !78, line: 4823, type: !742)
!4616 = !DILocation(line: 4823, column: 30, scope: !4614)
!4617 = !DILocalVariable(name: "factor", arg: 2, scope: !4614, file: !78, line: 4823, type: !17)
!4618 = !DILocation(line: 4823, column: 40, scope: !4614)
!4619 = !DILocation(line: 4825, column: 40, scope: !4614)
!4620 = !DILocation(line: 4825, column: 46, scope: !4614)
!4621 = !DILocation(line: 4825, column: 10, scope: !4614)
!4622 = !DILocation(line: 4825, column: 3, scope: !4614)
!4623 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !78, file: !78, line: 5503, type: !4624, scopeLine: 5504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4624 = !DISubroutineType(types: !4625)
!4625 = !{!742, !742, !17, !742}
!4626 = !DILocalVariable(name: "value", arg: 1, scope: !4623, file: !78, line: 5503, type: !742)
!4627 = !DILocation(line: 5503, column: 39, scope: !4623)
!4628 = !DILocalVariable(name: "factor", arg: 2, scope: !4623, file: !78, line: 5503, type: !17)
!4629 = !DILocation(line: 5503, column: 49, scope: !4623)
!4630 = !DILocalVariable(name: "count", arg: 3, scope: !4623, file: !78, line: 5503, type: !742)
!4631 = !DILocation(line: 5503, column: 61, scope: !4623)
!4632 = !DILocalVariable(name: "u32Temp1", scope: !4623, file: !78, line: 5505, type: !742)
!4633 = !DILocation(line: 5505, column: 6, scope: !4623)
!4634 = !DILocalVariable(name: "u32Temp2", scope: !4623, file: !78, line: 5505, type: !742)
!4635 = !DILocation(line: 5505, column: 17, scope: !4623)
!4636 = !DILocation(line: 5507, column: 13, scope: !4623)
!4637 = !DILocation(line: 5507, column: 21, scope: !4623)
!4638 = !DILocation(line: 5507, column: 19, scope: !4623)
!4639 = !DILocation(line: 5507, column: 11, scope: !4623)
!4640 = !DILocation(line: 5508, column: 25, scope: !4623)
!4641 = !DILocation(line: 5508, column: 32, scope: !4623)
!4642 = !DILocation(line: 5508, column: 13, scope: !4623)
!4643 = !DILocation(line: 5508, column: 11, scope: !4623)
!4644 = !DILocation(line: 5509, column: 13, scope: !4623)
!4645 = !DILocation(line: 5509, column: 25, scope: !4623)
!4646 = !DILocation(line: 5509, column: 22, scope: !4623)
!4647 = !DILocation(line: 5509, column: 11, scope: !4623)
!4648 = !DILocation(line: 5510, column: 14, scope: !4623)
!4649 = !DILocation(line: 5510, column: 30, scope: !4623)
!4650 = !DILocation(line: 5510, column: 29, scope: !4623)
!4651 = !DILocation(line: 5510, column: 23, scope: !4623)
!4652 = !DILocation(line: 5510, column: 11, scope: !4623)
!4653 = !DILocation(line: 5511, column: 6, scope: !4654)
!4654 = distinct !DILexicalBlock(scope: !4623, file: !78, line: 5511, column: 5)
!4655 = !DILocation(line: 5511, column: 16, scope: !4654)
!4656 = !DILocation(line: 5511, column: 14, scope: !4654)
!4657 = !DILocation(line: 5511, column: 22, scope: !4654)
!4658 = !DILocation(line: 5511, column: 5, scope: !4623)
!4659 = !DILocation(line: 5513, column: 6, scope: !4660)
!4660 = distinct !DILexicalBlock(scope: !4661, file: !78, line: 5513, column: 6)
!4661 = distinct !DILexicalBlock(scope: !4654, file: !78, line: 5512, column: 2)
!4662 = !DILocation(line: 5513, column: 14, scope: !4660)
!4663 = !DILocation(line: 5513, column: 6, scope: !4661)
!4664 = !DILocation(line: 5514, column: 11, scope: !4660)
!4665 = !DILocation(line: 5514, column: 4, scope: !4660)
!4666 = !DILocation(line: 5516, column: 4, scope: !4660)
!4667 = !DILocation(line: 5520, column: 3, scope: !4668)
!4668 = distinct !DILexicalBlock(scope: !4654, file: !78, line: 5519, column: 2)
!4669 = !DILocation(line: 5522, column: 1, scope: !4623)
!4670 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !78, file: !78, line: 4846, type: !888, scopeLine: 4847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4671 = !DILocalVariable(name: "value", arg: 1, scope: !4670, file: !78, line: 4846, type: !17)
!4672 = !DILocation(line: 4846, column: 28, scope: !4670)
!4673 = !DILocalVariable(name: "factor", arg: 2, scope: !4670, file: !78, line: 4846, type: !17)
!4674 = !DILocation(line: 4846, column: 38, scope: !4670)
!4675 = !DILocation(line: 4848, column: 38, scope: !4670)
!4676 = !DILocation(line: 4848, column: 44, scope: !4670)
!4677 = !DILocation(line: 4848, column: 10, scope: !4670)
!4678 = !DILocation(line: 4848, column: 3, scope: !4670)
!4679 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !78, file: !78, line: 4869, type: !888, scopeLine: 4870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4680 = !DILocalVariable(name: "value", arg: 1, scope: !4679, file: !78, line: 4869, type: !17)
!4681 = !DILocation(line: 4869, column: 28, scope: !4679)
!4682 = !DILocalVariable(name: "factor", arg: 2, scope: !4679, file: !78, line: 4869, type: !17)
!4683 = !DILocation(line: 4869, column: 38, scope: !4679)
!4684 = !DILocation(line: 4871, column: 38, scope: !4679)
!4685 = !DILocation(line: 4871, column: 44, scope: !4679)
!4686 = !DILocation(line: 4871, column: 10, scope: !4679)
!4687 = !DILocation(line: 4871, column: 3, scope: !4679)
!4688 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !78, file: !78, line: 4893, type: !888, scopeLine: 4894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4689 = !DILocalVariable(name: "value", arg: 1, scope: !4688, file: !78, line: 4893, type: !17)
!4690 = !DILocation(line: 4893, column: 26, scope: !4688)
!4691 = !DILocalVariable(name: "factor", arg: 2, scope: !4688, file: !78, line: 4893, type: !17)
!4692 = !DILocation(line: 4893, column: 36, scope: !4688)
!4693 = !DILocation(line: 4895, column: 38, scope: !4688)
!4694 = !DILocation(line: 4895, column: 44, scope: !4688)
!4695 = !DILocation(line: 4895, column: 10, scope: !4688)
!4696 = !DILocation(line: 4895, column: 3, scope: !4688)
!4697 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !78, file: !78, line: 4917, type: !888, scopeLine: 4918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4698 = !DILocalVariable(name: "value", arg: 1, scope: !4697, file: !78, line: 4917, type: !17)
!4699 = !DILocation(line: 4917, column: 28, scope: !4697)
!4700 = !DILocalVariable(name: "factor", arg: 2, scope: !4697, file: !78, line: 4917, type: !17)
!4701 = !DILocation(line: 4917, column: 38, scope: !4697)
!4702 = !DILocation(line: 4919, column: 41, scope: !4697)
!4703 = !DILocation(line: 4919, column: 47, scope: !4697)
!4704 = !DILocation(line: 4919, column: 10, scope: !4697)
!4705 = !DILocation(line: 4919, column: 3, scope: !4697)
!4706 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !78, file: !78, line: 4941, type: !888, scopeLine: 4942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4707 = !DILocalVariable(name: "value", arg: 1, scope: !4706, file: !78, line: 4941, type: !17)
!4708 = !DILocation(line: 4941, column: 26, scope: !4706)
!4709 = !DILocalVariable(name: "factor", arg: 2, scope: !4706, file: !78, line: 4941, type: !17)
!4710 = !DILocation(line: 4941, column: 36, scope: !4706)
!4711 = !DILocation(line: 4943, column: 41, scope: !4706)
!4712 = !DILocation(line: 4943, column: 47, scope: !4706)
!4713 = !DILocation(line: 4943, column: 10, scope: !4706)
!4714 = !DILocation(line: 4943, column: 3, scope: !4706)
!4715 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !78, file: !78, line: 4964, type: !888, scopeLine: 4965, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4716 = !DILocalVariable(name: "value", arg: 1, scope: !4715, file: !78, line: 4964, type: !17)
!4717 = !DILocation(line: 4964, column: 26, scope: !4715)
!4718 = !DILocalVariable(name: "factor", arg: 2, scope: !4715, file: !78, line: 4964, type: !17)
!4719 = !DILocation(line: 4964, column: 36, scope: !4715)
!4720 = !DILocation(line: 4966, column: 41, scope: !4715)
!4721 = !DILocation(line: 4966, column: 47, scope: !4715)
!4722 = !DILocation(line: 4966, column: 10, scope: !4715)
!4723 = !DILocation(line: 4966, column: 3, scope: !4715)
!4724 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !78, file: !78, line: 4987, type: !888, scopeLine: 4988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4725 = !DILocalVariable(name: "value", arg: 1, scope: !4724, file: !78, line: 4987, type: !17)
!4726 = !DILocation(line: 4987, column: 25, scope: !4724)
!4727 = !DILocalVariable(name: "factor", arg: 2, scope: !4724, file: !78, line: 4987, type: !17)
!4728 = !DILocation(line: 4987, column: 35, scope: !4724)
!4729 = !DILocation(line: 4989, column: 41, scope: !4724)
!4730 = !DILocation(line: 4989, column: 47, scope: !4724)
!4731 = !DILocation(line: 4989, column: 10, scope: !4724)
!4732 = !DILocation(line: 4989, column: 3, scope: !4724)
!4733 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !78, file: !78, line: 5010, type: !888, scopeLine: 5011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4734 = !DILocalVariable(name: "value", arg: 1, scope: !4733, file: !78, line: 5010, type: !17)
!4735 = !DILocation(line: 5010, column: 26, scope: !4733)
!4736 = !DILocalVariable(name: "factor", arg: 2, scope: !4733, file: !78, line: 5010, type: !17)
!4737 = !DILocation(line: 5010, column: 35, scope: !4733)
!4738 = !DILocation(line: 5012, column: 41, scope: !4733)
!4739 = !DILocation(line: 5012, column: 47, scope: !4733)
!4740 = !DILocation(line: 5012, column: 10, scope: !4733)
!4741 = !DILocation(line: 5012, column: 3, scope: !4733)
!4742 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !78, file: !78, line: 5033, type: !888, scopeLine: 5034, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4743 = !DILocalVariable(name: "value", arg: 1, scope: !4742, file: !78, line: 5033, type: !17)
!4744 = !DILocation(line: 5033, column: 25, scope: !4742)
!4745 = !DILocalVariable(name: "factor", arg: 2, scope: !4742, file: !78, line: 5033, type: !17)
!4746 = !DILocation(line: 5033, column: 35, scope: !4742)
!4747 = !DILocation(line: 5035, column: 41, scope: !4742)
!4748 = !DILocation(line: 5035, column: 47, scope: !4742)
!4749 = !DILocation(line: 5035, column: 10, scope: !4742)
!4750 = !DILocation(line: 5035, column: 3, scope: !4742)
!4751 = distinct !DISubprogram(name: "MulHighWord", scope: !4752, file: !4752, line: 39, type: !1415, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4752 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/root_s32_mul_s32_s8_fac_less1/alarm_0005")
!4753 = !DILocalVariable(name: "arg1", arg: 1, scope: !4751, file: !4752, line: 39, type: !742)
!4754 = !DILocation(line: 39, column: 30, scope: !4751)
!4755 = !DILocalVariable(name: "arg2", arg: 2, scope: !4751, file: !4752, line: 39, type: !742)
!4756 = !DILocation(line: 39, column: 48, scope: !4751)
!4757 = !DILocalVariable(name: "arg1_LW", scope: !4751, file: !4752, line: 41, type: !22)
!4758 = !DILocation(line: 41, column: 6, scope: !4751)
!4759 = !DILocalVariable(name: "arg1_HW", scope: !4751, file: !4752, line: 41, type: !22)
!4760 = !DILocation(line: 41, column: 14, scope: !4751)
!4761 = !DILocalVariable(name: "arg2_LW", scope: !4751, file: !4752, line: 41, type: !22)
!4762 = !DILocation(line: 41, column: 22, scope: !4751)
!4763 = !DILocalVariable(name: "arg2_HW", scope: !4751, file: !4752, line: 41, type: !22)
!4764 = !DILocation(line: 41, column: 30, scope: !4751)
!4765 = !DILocalVariable(name: "MulTemp1", scope: !4751, file: !4752, line: 42, type: !742)
!4766 = !DILocation(line: 42, column: 6, scope: !4751)
!4767 = !DILocalVariable(name: "MulTemp2", scope: !4751, file: !4752, line: 42, type: !742)
!4768 = !DILocation(line: 42, column: 16, scope: !4751)
!4769 = !DILocalVariable(name: "MulTemp3", scope: !4751, file: !4752, line: 42, type: !742)
!4770 = !DILocation(line: 42, column: 26, scope: !4751)
!4771 = !DILocalVariable(name: "MulTemp4", scope: !4751, file: !4752, line: 42, type: !742)
!4772 = !DILocation(line: 42, column: 36, scope: !4751)
!4773 = !DILocalVariable(name: "HIGHWORD", scope: !4751, file: !4752, line: 42, type: !742)
!4774 = !DILocation(line: 42, column: 47, scope: !4751)
!4775 = !DILocalVariable(name: "OverFlow", scope: !4751, file: !4752, line: 42, type: !742)
!4776 = !DILocation(line: 42, column: 57, scope: !4751)
!4777 = !DILocation(line: 43, column: 12, scope: !4751)
!4778 = !DILocation(line: 43, column: 17, scope: !4751)
!4779 = !DILocation(line: 43, column: 10, scope: !4751)
!4780 = !DILocation(line: 44, column: 13, scope: !4751)
!4781 = !DILocation(line: 44, column: 18, scope: !4751)
!4782 = !DILocation(line: 44, column: 31, scope: !4751)
!4783 = !DILocation(line: 44, column: 12, scope: !4751)
!4784 = !DILocation(line: 44, column: 10, scope: !4751)
!4785 = !DILocation(line: 45, column: 12, scope: !4751)
!4786 = !DILocation(line: 45, column: 17, scope: !4751)
!4787 = !DILocation(line: 45, column: 10, scope: !4751)
!4788 = !DILocation(line: 46, column: 13, scope: !4751)
!4789 = !DILocation(line: 46, column: 18, scope: !4751)
!4790 = !DILocation(line: 46, column: 31, scope: !4751)
!4791 = !DILocation(line: 46, column: 12, scope: !4751)
!4792 = !DILocation(line: 46, column: 10, scope: !4751)
!4793 = !DILocation(line: 47, column: 13, scope: !4751)
!4794 = !DILocation(line: 47, column: 23, scope: !4751)
!4795 = !DILocation(line: 47, column: 21, scope: !4751)
!4796 = !DILocation(line: 47, column: 11, scope: !4751)
!4797 = !DILocation(line: 48, column: 13, scope: !4751)
!4798 = !DILocation(line: 48, column: 23, scope: !4751)
!4799 = !DILocation(line: 48, column: 21, scope: !4751)
!4800 = !DILocation(line: 48, column: 11, scope: !4751)
!4801 = !DILocation(line: 49, column: 13, scope: !4751)
!4802 = !DILocation(line: 49, column: 23, scope: !4751)
!4803 = !DILocation(line: 49, column: 21, scope: !4751)
!4804 = !DILocation(line: 49, column: 11, scope: !4751)
!4805 = !DILocation(line: 50, column: 13, scope: !4751)
!4806 = !DILocation(line: 50, column: 23, scope: !4751)
!4807 = !DILocation(line: 50, column: 21, scope: !4751)
!4808 = !DILocation(line: 50, column: 11, scope: !4751)
!4809 = !DILocation(line: 52, column: 14, scope: !4751)
!4810 = !DILocation(line: 52, column: 23, scope: !4751)
!4811 = !DILocation(line: 52, column: 33, scope: !4751)
!4812 = !DILocation(line: 52, column: 42, scope: !4751)
!4813 = !DILocation(line: 52, column: 30, scope: !4751)
!4814 = !DILocation(line: 52, column: 51, scope: !4751)
!4815 = !DILocation(line: 52, column: 49, scope: !4751)
!4816 = !DILocation(line: 52, column: 11, scope: !4751)
!4817 = !DILocation(line: 53, column: 14, scope: !4751)
!4818 = !DILocation(line: 53, column: 22, scope: !4751)
!4819 = !DILocation(line: 53, column: 31, scope: !4751)
!4820 = !DILocation(line: 53, column: 40, scope: !4751)
!4821 = !DILocation(line: 53, column: 28, scope: !4751)
!4822 = !DILocation(line: 53, column: 53, scope: !4751)
!4823 = !DILocation(line: 53, column: 62, scope: !4751)
!4824 = !DILocation(line: 53, column: 50, scope: !4751)
!4825 = !DILocation(line: 53, column: 11, scope: !4751)
!4826 = !DILocation(line: 54, column: 6, scope: !4827)
!4827 = distinct !DILexicalBlock(scope: !4751, file: !4752, line: 54, column: 6)
!4828 = !DILocation(line: 54, column: 15, scope: !4827)
!4829 = !DILocation(line: 54, column: 6, scope: !4751)
!4830 = !DILocation(line: 56, column: 10, scope: !4831)
!4831 = distinct !DILexicalBlock(scope: !4827, file: !4752, line: 55, column: 2)
!4832 = !DILocation(line: 56, column: 22, scope: !4831)
!4833 = !DILocation(line: 56, column: 30, scope: !4831)
!4834 = !DILocation(line: 56, column: 19, scope: !4831)
!4835 = !DILocation(line: 56, column: 3, scope: !4831)
!4836 = !DILocation(line: 60, column: 10, scope: !4837)
!4837 = distinct !DILexicalBlock(scope: !4827, file: !4752, line: 59, column: 2)
!4838 = !DILocation(line: 60, column: 3, scope: !4837)
!4839 = !DILocation(line: 62, column: 1, scope: !4751)
!4840 = distinct !DISubprogram(name: "MulLowWord", scope: !4752, file: !4752, line: 78, type: !1415, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4841 = !DILocalVariable(name: "arg1", arg: 1, scope: !4840, file: !4752, line: 78, type: !742)
!4842 = !DILocation(line: 78, column: 29, scope: !4840)
!4843 = !DILocalVariable(name: "arg2", arg: 2, scope: !4840, file: !4752, line: 78, type: !742)
!4844 = !DILocation(line: 78, column: 47, scope: !4840)
!4845 = !DILocalVariable(name: "arg1_LW", scope: !4840, file: !4752, line: 80, type: !22)
!4846 = !DILocation(line: 80, column: 6, scope: !4840)
!4847 = !DILocalVariable(name: "arg1_HW", scope: !4840, file: !4752, line: 80, type: !22)
!4848 = !DILocation(line: 80, column: 14, scope: !4840)
!4849 = !DILocalVariable(name: "arg2_LW", scope: !4840, file: !4752, line: 80, type: !22)
!4850 = !DILocation(line: 80, column: 22, scope: !4840)
!4851 = !DILocalVariable(name: "arg2_HW", scope: !4840, file: !4752, line: 80, type: !22)
!4852 = !DILocation(line: 80, column: 30, scope: !4840)
!4853 = !DILocalVariable(name: "MulTemp1", scope: !4840, file: !4752, line: 81, type: !742)
!4854 = !DILocation(line: 81, column: 6, scope: !4840)
!4855 = !DILocalVariable(name: "MulTemp2", scope: !4840, file: !4752, line: 81, type: !742)
!4856 = !DILocation(line: 81, column: 16, scope: !4840)
!4857 = !DILocalVariable(name: "MulTemp3", scope: !4840, file: !4752, line: 81, type: !742)
!4858 = !DILocation(line: 81, column: 26, scope: !4840)
!4859 = !DILocalVariable(name: "MulTemp4", scope: !4840, file: !4752, line: 81, type: !742)
!4860 = !DILocation(line: 81, column: 36, scope: !4840)
!4861 = !DILocalVariable(name: "HIGHWORD", scope: !4840, file: !4752, line: 81, type: !742)
!4862 = !DILocation(line: 81, column: 47, scope: !4840)
!4863 = !DILocalVariable(name: "OverFlow", scope: !4840, file: !4752, line: 81, type: !742)
!4864 = !DILocation(line: 81, column: 57, scope: !4840)
!4865 = !DILocation(line: 82, column: 12, scope: !4840)
!4866 = !DILocation(line: 82, column: 17, scope: !4840)
!4867 = !DILocation(line: 82, column: 10, scope: !4840)
!4868 = !DILocation(line: 83, column: 13, scope: !4840)
!4869 = !DILocation(line: 83, column: 18, scope: !4840)
!4870 = !DILocation(line: 83, column: 31, scope: !4840)
!4871 = !DILocation(line: 83, column: 12, scope: !4840)
!4872 = !DILocation(line: 83, column: 10, scope: !4840)
!4873 = !DILocation(line: 84, column: 12, scope: !4840)
!4874 = !DILocation(line: 84, column: 17, scope: !4840)
!4875 = !DILocation(line: 84, column: 10, scope: !4840)
!4876 = !DILocation(line: 85, column: 13, scope: !4840)
!4877 = !DILocation(line: 85, column: 18, scope: !4840)
!4878 = !DILocation(line: 85, column: 31, scope: !4840)
!4879 = !DILocation(line: 85, column: 12, scope: !4840)
!4880 = !DILocation(line: 85, column: 10, scope: !4840)
!4881 = !DILocation(line: 86, column: 13, scope: !4840)
!4882 = !DILocation(line: 86, column: 23, scope: !4840)
!4883 = !DILocation(line: 86, column: 21, scope: !4840)
!4884 = !DILocation(line: 86, column: 11, scope: !4840)
!4885 = !DILocation(line: 87, column: 13, scope: !4840)
!4886 = !DILocation(line: 87, column: 23, scope: !4840)
!4887 = !DILocation(line: 87, column: 21, scope: !4840)
!4888 = !DILocation(line: 87, column: 11, scope: !4840)
!4889 = !DILocation(line: 88, column: 13, scope: !4840)
!4890 = !DILocation(line: 88, column: 23, scope: !4840)
!4891 = !DILocation(line: 88, column: 21, scope: !4840)
!4892 = !DILocation(line: 88, column: 11, scope: !4840)
!4893 = !DILocation(line: 89, column: 13, scope: !4840)
!4894 = !DILocation(line: 89, column: 23, scope: !4840)
!4895 = !DILocation(line: 89, column: 21, scope: !4840)
!4896 = !DILocation(line: 89, column: 11, scope: !4840)
!4897 = !DILocation(line: 90, column: 14, scope: !4840)
!4898 = !DILocation(line: 90, column: 28, scope: !4840)
!4899 = !DILocation(line: 90, column: 37, scope: !4840)
!4900 = !DILocation(line: 90, column: 46, scope: !4840)
!4901 = !DILocation(line: 90, column: 24, scope: !4840)
!4902 = !DILocation(line: 90, column: 56, scope: !4840)
!4903 = !DILocation(line: 90, column: 65, scope: !4840)
!4904 = !DILocation(line: 90, column: 74, scope: !4840)
!4905 = !DILocation(line: 90, column: 52, scope: !4840)
!4906 = !DILocation(line: 90, column: 11, scope: !4840)
!4907 = !DILocation(line: 92, column: 9, scope: !4840)
!4908 = !DILocation(line: 92, column: 2, scope: !4840)
!4909 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4910, file: !4910, line: 12, type: !4911, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !4914)
!4910 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4911 = !DISubroutineType(types: !4912)
!4912 = !{null, !4913}
!4913 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4914 = !{!4915}
!4915 = !DILocalVariable(name: "z", arg: 1, scope: !4909, file: !4910, line: 12, type: !4913)
!4916 = !DILocation(line: 0, scope: !4909)
!4917 = !DILocation(line: 13, column: 9, scope: !4918)
!4918 = distinct !DILexicalBlock(scope: !4909, file: !4910, line: 13, column: 7)
!4919 = !DILocation(line: 13, column: 7, scope: !4909)
!4920 = !DILocation(line: 14, column: 5, scope: !4918)
!4921 = !DILocation(line: 15, column: 1, scope: !4909)
!4922 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4923, file: !4923, line: 20, type: !4924, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4927)
!4923 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4924 = !DISubroutineType(types: !4925)
!4925 = !{null, !4926, !4926}
!4926 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4927 = !{!4928, !4929}
!4928 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4922, file: !4923, line: 20, type: !4926)
!4929 = !DILocalVariable(name: "shift", arg: 2, scope: !4922, file: !4923, line: 20, type: !4926)
!4930 = !DILocation(line: 0, scope: !4922)
!4931 = !DILocation(line: 21, column: 13, scope: !4932)
!4932 = distinct !DILexicalBlock(scope: !4922, file: !4923, line: 21, column: 7)
!4933 = !DILocation(line: 21, column: 7, scope: !4922)
!4934 = !DILocation(line: 27, column: 5, scope: !4935)
!4935 = distinct !DILexicalBlock(scope: !4932, file: !4923, line: 21, column: 26)
!4936 = !DILocation(line: 29, column: 1, scope: !4922)
