; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119/build/s32_mul_u32_s32_alarm_0119.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"val1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"val2\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [62 x i8] c"KLEE-ALARM-0119: signed overflow. assert -val2 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0119.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %val1 = alloca i32, align 4
  %val2 = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %val1, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %val2, metadata !55, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %result, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = bitcast i32* %val1 to i8*, !dbg !61
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %1 = bitcast i32* %val2 to i8*, !dbg !63
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  %2 = load i32, i32* %val1, align 4, !dbg !65
  %3 = load i32, i32* %val2, align 4, !dbg !66
  %call = call i32 @s32_mul_u32_s32(i32 %2, i32 %3), !dbg !67
  store i32 %call, i32* %result, align 4, !dbg !68
  %4 = load i32, i32* %result, align 4, !dbg !69
  ret i32 0, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !71 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !79, metadata !DIExpression()), !dbg !81
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !81
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !83
  %0 = load i8, i8* %value.addr, align 1, !dbg !84
  %conv = sext i8 %0 to i32, !dbg !84
  %1 = load i16, i16* %factor.addr, align 2, !dbg !85
  %conv1 = zext i16 %1 to i32, !dbg !85
  %mul = mul nsw i32 %conv, %conv1, !dbg !86
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !87
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !88
  %shr = ashr i32 %2, 16, !dbg !89
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !90
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !91
  %cmp = icmp slt i32 %3, 0, !dbg !93
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !94

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !95
  %and = and i32 %4, 65535, !dbg !96
  %cmp3 = icmp ne i32 %and, 0, !dbg !97
  br i1 %cmp3, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !99
  %add = add nsw i32 %5, 1, !dbg !101
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !102
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !103
  %conv5 = trunc i32 %6 to i8, !dbg !104
  store i8 %conv5, i8* %retval, align 1, !dbg !105
  br label %return, !dbg !105

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !106
  %conv6 = trunc i32 %7 to i8, !dbg !108
  store i8 %conv6, i8* %retval, align 1, !dbg !109
  br label %return, !dbg !109

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !110
  ret i8 %8, !dbg !110
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !111 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !116, metadata !DIExpression()), !dbg !117
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !118, metadata !DIExpression()), !dbg !119
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !119
  %0 = load i8, i8* %value.addr, align 1, !dbg !120
  %conv = sext i8 %0 to i32, !dbg !120
  %1 = load i16, i16* %factor.addr, align 2, !dbg !121
  %conv1 = zext i16 %1 to i32, !dbg !121
  %mul = mul nsw i32 %conv, %conv1, !dbg !122
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !123
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !124
  %shr = ashr i32 %2, 8, !dbg !125
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !126
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !127
  %cmp = icmp slt i32 %3, 0, !dbg !129
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !130

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !131
  %and = and i32 %4, 255, !dbg !132
  %cmp3 = icmp ne i32 %and, 0, !dbg !133
  br i1 %cmp3, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !135
  %add = add nsw i32 %5, 1, !dbg !137
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !138
  br label %if.end, !dbg !139

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !140
  %cmp5 = icmp slt i32 %6, 127, !dbg !142
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !143

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !144
  %cmp8 = icmp sgt i32 %7, -128, !dbg !147
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !148

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !149
  %conv11 = trunc i32 %8 to i8, !dbg !151
  store i8 %conv11, i8* %retval, align 1, !dbg !152
  br label %return, !dbg !152

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !153
  br label %return, !dbg !153

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !155
  br label %return, !dbg !155

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !157
  ret i8 %9, !dbg !157
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !158 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !161, metadata !DIExpression()), !dbg !162
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !165, metadata !DIExpression()), !dbg !166
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !166
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !167, metadata !DIExpression()), !dbg !168
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !168
  %0 = load i8, i8* %value.addr, align 1, !dbg !169
  %conv = sext i8 %0 to i32, !dbg !169
  %1 = load i8, i8* %factor.addr, align 1, !dbg !170
  %conv1 = zext i8 %1 to i32, !dbg !170
  %mul = mul nsw i32 %conv, %conv1, !dbg !171
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !172
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !173
  %shr = ashr i32 %2, 8, !dbg !174
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !175
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !176
  %cmp = icmp slt i32 %3, 0, !dbg !178
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !179

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !180
  %and = and i32 %4, 255, !dbg !181
  %cmp3 = icmp ne i32 %and, 0, !dbg !182
  br i1 %cmp3, label %if.then, label %if.else, !dbg !183

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !184
  %add = add nsw i32 %5, 1, !dbg !186
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !187
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !188
  %conv5 = trunc i32 %6 to i8, !dbg !189
  store i8 %conv5, i8* %retval, align 1, !dbg !190
  br label %return, !dbg !190

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !191
  %conv6 = trunc i32 %7 to i8, !dbg !193
  store i8 %conv6, i8* %retval, align 1, !dbg !194
  br label %return, !dbg !194

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !195
  ret i8 %8, !dbg !195
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !196 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !197, metadata !DIExpression()), !dbg !198
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !201, metadata !DIExpression()), !dbg !202
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !202
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !203, metadata !DIExpression()), !dbg !204
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !204
  %0 = load i8, i8* %value.addr, align 1, !dbg !205
  %conv = sext i8 %0 to i32, !dbg !205
  %1 = load i8, i8* %factor.addr, align 1, !dbg !206
  %conv1 = zext i8 %1 to i32, !dbg !206
  %mul = mul nsw i32 %conv, %conv1, !dbg !207
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !208
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !209
  %shr = ashr i32 %2, 7, !dbg !210
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !211
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !212
  %cmp = icmp slt i32 %3, 0, !dbg !214
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !215

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !216
  %and = and i32 %4, 127, !dbg !217
  %cmp3 = icmp ne i32 %and, 0, !dbg !218
  br i1 %cmp3, label %if.then, label %if.end, !dbg !219

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !220
  %add = add nsw i32 %5, 1, !dbg !222
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !223
  br label %if.end, !dbg !224

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !225
  %cmp5 = icmp slt i32 %6, 127, !dbg !227
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !228

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !229
  %cmp8 = icmp sgt i32 %7, -128, !dbg !232
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !233

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !234
  %conv11 = trunc i32 %8 to i8, !dbg !236
  store i8 %conv11, i8* %retval, align 1, !dbg !237
  br label %return, !dbg !237

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !238
  br label %return, !dbg !238

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !240
  br label %return, !dbg !240

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !242
  ret i8 %9, !dbg !242
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !243 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !246, metadata !DIExpression()), !dbg !247
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !248, metadata !DIExpression()), !dbg !249
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !250, metadata !DIExpression()), !dbg !251
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 0, i32* %s32MulTemp, align 4, !dbg !253
  %0 = load i16, i16* %value.addr, align 2, !dbg !254
  %conv = sext i16 %0 to i32, !dbg !254
  %1 = load i16, i16* %factor.addr, align 2, !dbg !255
  %conv1 = sext i16 %1 to i32, !dbg !255
  %mul = mul nsw i32 %conv, %conv1, !dbg !256
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !257
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !258
  %3 = load i32, i32* %count.addr, align 4, !dbg !259
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !260
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !260
  %div = sdiv i32 %2, %3, !dbg !260, !klee.check.div !261
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !262
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !263
  %conv2 = trunc i32 %4 to i16, !dbg !263
  ret i16 %conv2, !dbg !264
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !265 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !266, metadata !DIExpression()), !dbg !267
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !268, metadata !DIExpression()), !dbg !269
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !270, metadata !DIExpression()), !dbg !271
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !272, metadata !DIExpression()), !dbg !273
  store i32 0, i32* %s32MulTemp, align 4, !dbg !273
  %0 = load i16, i16* %value.addr, align 2, !dbg !274
  %conv = sext i16 %0 to i32, !dbg !274
  %1 = load i16, i16* %factor.addr, align 2, !dbg !275
  %conv1 = sext i16 %1 to i32, !dbg !275
  %mul = mul nsw i32 %conv, %conv1, !dbg !276
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !277
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !278
  %3 = load i32, i32* %count.addr, align 4, !dbg !279
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !280
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !280
  %div = sdiv i32 %2, %3, !dbg !280, !klee.check.div !261
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !281
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !282
  %cmp = icmp slt i32 %4, 32767, !dbg !284
  br i1 %cmp, label %if.then, label %if.else7, !dbg !285

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !286
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !289
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !290

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !291
  %conv6 = trunc i32 %6 to i16, !dbg !293
  store i16 %conv6, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !295
  br label %return, !dbg !295

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !297
  br label %return, !dbg !297

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !299
  ret i16 %7, !dbg !299
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !300 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !303, metadata !DIExpression()), !dbg !304
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !305, metadata !DIExpression()), !dbg !306
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !307, metadata !DIExpression()), !dbg !308
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !308
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !309, metadata !DIExpression()), !dbg !310
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !310
  %0 = load i16, i16* %value.addr, align 2, !dbg !311
  %conv = sext i16 %0 to i32, !dbg !311
  %1 = load i16, i16* %factor.addr, align 2, !dbg !312
  %conv1 = sext i16 %1 to i32, !dbg !312
  %mul = mul nsw i32 %conv, %conv1, !dbg !313
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !314
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !315
  %shr = ashr i32 %2, 15, !dbg !316
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !317
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !318
  %cmp = icmp slt i32 %3, 0, !dbg !320
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !321

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !322
  %and = and i32 %4, 32767, !dbg !323
  %cmp3 = icmp ne i32 %and, 0, !dbg !324
  br i1 %cmp3, label %if.then, label %if.end, !dbg !325

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !326
  %add = add nsw i32 %5, 1, !dbg !328
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !329
  br label %if.end, !dbg !330

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !331
  %cmp5 = icmp slt i32 %6, 32767, !dbg !333
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !334

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !335
  %conv8 = trunc i32 %7 to i16, !dbg !337
  store i16 %conv8, i16* %retval, align 2, !dbg !338
  br label %return, !dbg !338

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !339
  br label %return, !dbg !339

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !341
  ret i16 %8, !dbg !341
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !342 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !343, metadata !DIExpression()), !dbg !344
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !348
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !350
  %0 = load i16, i16* %value.addr, align 2, !dbg !351
  %conv = sext i16 %0 to i32, !dbg !351
  %1 = load i16, i16* %factor.addr, align 2, !dbg !352
  %conv1 = sext i16 %1 to i32, !dbg !352
  %mul = mul nsw i32 %conv, %conv1, !dbg !353
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !354
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !355
  %shr = ashr i32 %2, 14, !dbg !356
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !357
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !358
  %cmp = icmp slt i32 %3, 0, !dbg !360
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !361

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !362
  %and = and i32 %4, 16383, !dbg !363
  %cmp3 = icmp ne i32 %and, 0, !dbg !364
  br i1 %cmp3, label %if.then, label %if.end, !dbg !365

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !366
  %add = add nsw i32 %5, 1, !dbg !368
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !369
  br label %if.end, !dbg !370

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !371
  %cmp5 = icmp slt i32 %6, 32767, !dbg !373
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !374

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !375
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !378
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !379

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !380
  %conv11 = trunc i32 %8 to i16, !dbg !382
  store i16 %conv11, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !384
  br label %return, !dbg !384

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !386
  br label %return, !dbg !386

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !388
  ret i16 %9, !dbg !388
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !389 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !392, metadata !DIExpression()), !dbg !393
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !394, metadata !DIExpression()), !dbg !395
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !396, metadata !DIExpression()), !dbg !397
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !397
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !398, metadata !DIExpression()), !dbg !399
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !399
  %0 = load i16, i16* %value.addr, align 2, !dbg !400
  %conv = sext i16 %0 to i32, !dbg !400
  %1 = load i16, i16* %factor.addr, align 2, !dbg !401
  %conv1 = zext i16 %1 to i32, !dbg !401
  %mul = mul nsw i32 %conv, %conv1, !dbg !402
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !403
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !404
  %shr = ashr i32 %2, 16, !dbg !405
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !406
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !407
  %cmp = icmp slt i32 %3, 0, !dbg !409
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !410

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !411
  %and = and i32 %4, 32767, !dbg !412
  %cmp3 = icmp ne i32 %and, 0, !dbg !413
  br i1 %cmp3, label %if.then, label %if.else, !dbg !414

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !415
  %add = add nsw i32 %5, 1, !dbg !417
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !418
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !419
  %conv5 = trunc i32 %6 to i16, !dbg !420
  store i16 %conv5, i16* %retval, align 2, !dbg !421
  br label %return, !dbg !421

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !422
  %conv6 = trunc i32 %7 to i16, !dbg !424
  store i16 %conv6, i16* %retval, align 2, !dbg !425
  br label %return, !dbg !425

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !426
  ret i16 %8, !dbg !426
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !427 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !428, metadata !DIExpression()), !dbg !429
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !432, metadata !DIExpression()), !dbg !433
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !433
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !434, metadata !DIExpression()), !dbg !435
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !435
  %0 = load i16, i16* %value.addr, align 2, !dbg !436
  %conv = sext i16 %0 to i32, !dbg !436
  %1 = load i16, i16* %factor.addr, align 2, !dbg !437
  %conv1 = zext i16 %1 to i32, !dbg !437
  %mul = mul nsw i32 %conv, %conv1, !dbg !438
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !439
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !440
  %shr = ashr i32 %2, 8, !dbg !441
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !442
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !443
  %cmp = icmp slt i32 %3, 0, !dbg !445
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !446

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !447
  %and = and i32 %4, 255, !dbg !448
  %cmp3 = icmp ne i32 %and, 0, !dbg !449
  br i1 %cmp3, label %if.then, label %if.end, !dbg !450

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !451
  %add = add nsw i32 %5, 1, !dbg !453
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !454
  br label %if.end, !dbg !455

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !456
  %cmp5 = icmp slt i32 %6, 32767, !dbg !458
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !459

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !460
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !463
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !464

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !465
  %conv11 = trunc i32 %8 to i16, !dbg !467
  store i16 %conv11, i16* %retval, align 2, !dbg !468
  br label %return, !dbg !468

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !469
  br label %return, !dbg !469

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !471
  br label %return, !dbg !471

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !473
  ret i16 %9, !dbg !473
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !474 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !477, metadata !DIExpression()), !dbg !478
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !479, metadata !DIExpression()), !dbg !480
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !482
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !483, metadata !DIExpression()), !dbg !484
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !484
  %0 = load i16, i16* %value.addr, align 2, !dbg !485
  %conv = sext i16 %0 to i32, !dbg !485
  %1 = load i8, i8* %factor.addr, align 1, !dbg !486
  %conv1 = zext i8 %1 to i32, !dbg !486
  %mul = mul nsw i32 %conv, %conv1, !dbg !487
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !488
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !489
  %shr = ashr i32 %2, 8, !dbg !490
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !491
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !492
  %cmp = icmp slt i32 %3, 0, !dbg !494
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !495

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !496
  %and = and i32 %4, 255, !dbg !497
  %cmp3 = icmp ne i32 %and, 0, !dbg !498
  br i1 %cmp3, label %if.then, label %if.else, !dbg !499

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !500
  %add = add nsw i32 %5, 1, !dbg !502
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !503
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !504
  %conv5 = trunc i32 %6 to i16, !dbg !504
  store i16 %conv5, i16* %retval, align 2, !dbg !505
  br label %return, !dbg !505

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !506
  %conv6 = trunc i32 %7 to i16, !dbg !506
  store i16 %conv6, i16* %retval, align 2, !dbg !508
  br label %return, !dbg !508

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !509
  ret i16 %8, !dbg !509
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !510 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !513, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !515, metadata !DIExpression()), !dbg !516
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !516
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !517, metadata !DIExpression()), !dbg !518
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !518
  %0 = load i16, i16* %value.addr, align 2, !dbg !519
  %conv = sext i16 %0 to i32, !dbg !519
  %1 = load i8, i8* %factor.addr, align 1, !dbg !520
  %conv1 = zext i8 %1 to i32, !dbg !520
  %mul = mul nsw i32 %conv, %conv1, !dbg !521
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !522
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !523
  %shr = ashr i32 %2, 7, !dbg !524
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !525
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !526
  %cmp = icmp slt i32 %3, 0, !dbg !528
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !529

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !530
  %and = and i32 %4, 127, !dbg !531
  %cmp3 = icmp ne i32 %and, 0, !dbg !532
  br i1 %cmp3, label %if.then, label %if.end, !dbg !533

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !534
  %add = add nsw i32 %5, 1, !dbg !536
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !537
  br label %if.end, !dbg !538

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !539
  %cmp5 = icmp slt i32 %6, 32767, !dbg !541
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !542

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !543
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !546
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !547

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !548
  %conv11 = trunc i32 %8 to i16, !dbg !550
  store i16 %conv11, i16* %retval, align 2, !dbg !551
  br label %return, !dbg !551

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !552
  br label %return, !dbg !552

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !554
  br label %return, !dbg !554

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !556
  ret i16 %9, !dbg !556
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !557 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !558, metadata !DIExpression()), !dbg !559
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !560, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !562, metadata !DIExpression()), !dbg !563
  store i32 0, i32* %s32MulTemp, align 4, !dbg !563
  %0 = load i16, i16* %value.addr, align 2, !dbg !564
  %conv = sext i16 %0 to i32, !dbg !564
  %1 = load i16, i16* %factor.addr, align 2, !dbg !565
  %conv1 = zext i16 %1 to i32, !dbg !565
  %mul = mul nsw i32 %conv, %conv1, !dbg !566
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !567
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !568
  %cmp = icmp slt i32 %2, 32767, !dbg !570
  br i1 %cmp, label %if.then, label %if.else7, !dbg !571

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !572
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !575
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !576

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !577
  %conv6 = trunc i32 %4 to i16, !dbg !579
  store i16 %conv6, i16* %retval, align 2, !dbg !580
  br label %return, !dbg !580

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !583
  br label %return, !dbg !583

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !585
  ret i16 %5, !dbg !585
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !586 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !589, metadata !DIExpression()), !dbg !590
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !591, metadata !DIExpression()), !dbg !592
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !595, metadata !DIExpression()), !dbg !596
  store i32 0, i32* %s32MulTemp, align 4, !dbg !596
  %0 = load i16, i16* %value.addr, align 2, !dbg !597
  %conv = sext i16 %0 to i32, !dbg !597
  %1 = load i16, i16* %factor.addr, align 2, !dbg !598
  %conv1 = zext i16 %1 to i32, !dbg !598
  %mul = mul nsw i32 %conv, %conv1, !dbg !599
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !600
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !601
  %3 = load i32, i32* %count.addr, align 4, !dbg !602
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !603
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !603
  %div = sdiv i32 %2, %3, !dbg !603, !klee.check.div !261
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !604
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !605
  %conv2 = trunc i32 %4 to i16, !dbg !606
  ret i16 %conv2, !dbg !607
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !608 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !611, metadata !DIExpression()), !dbg !612
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !613, metadata !DIExpression()), !dbg !614
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !615, metadata !DIExpression()), !dbg !616
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !617, metadata !DIExpression()), !dbg !618
  store i32 0, i32* %s32MulTemp, align 4, !dbg !618
  %0 = load i16, i16* %value.addr, align 2, !dbg !619
  %conv = sext i16 %0 to i32, !dbg !619
  %1 = load i16, i16* %factor.addr, align 2, !dbg !620
  %conv1 = zext i16 %1 to i32, !dbg !620
  %mul = mul nsw i32 %conv, %conv1, !dbg !621
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !622
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !623
  %3 = load i16, i16* %count.addr, align 2, !dbg !624
  %conv2 = zext i16 %3 to i32, !dbg !624
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !625
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !625
  %div = sdiv i32 %2, %conv2, !dbg !625, !klee.check.div !261
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !626
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !627
  %cmp = icmp slt i32 %4, 32767, !dbg !629
  br i1 %cmp, label %if.then, label %if.else8, !dbg !630

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !631
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !634
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !635

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !636
  %conv7 = trunc i32 %6 to i16, !dbg !638
  store i16 %conv7, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !640
  br label %return, !dbg !640

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !642
  br label %return, !dbg !642

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !644
  ret i16 %7, !dbg !644
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !645 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !646, metadata !DIExpression()), !dbg !647
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !648, metadata !DIExpression()), !dbg !649
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !650, metadata !DIExpression()), !dbg !651
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !651
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !652, metadata !DIExpression()), !dbg !653
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !653
  %0 = load i16, i16* %value.addr, align 2, !dbg !654
  %conv = sext i16 %0 to i32, !dbg !654
  %1 = load i16, i16* %factor.addr, align 2, !dbg !655
  %conv1 = zext i16 %1 to i32, !dbg !655
  %mul = mul nsw i32 %conv, %conv1, !dbg !656
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !657
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !658
  %shr = ashr i32 %2, 16, !dbg !659
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !660
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !661
  %cmp = icmp slt i32 %3, 0, !dbg !663
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !664

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !665
  %and = and i32 %4, 65535, !dbg !666
  %cmp3 = icmp ne i32 %and, 0, !dbg !667
  br i1 %cmp3, label %if.then, label %if.else, !dbg !668

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !669
  %add = add nsw i32 %5, 1, !dbg !671
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !672
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !673
  %conv5 = trunc i32 %6 to i16, !dbg !674
  store i16 %conv5, i16* %retval, align 2, !dbg !675
  br label %return, !dbg !675

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !676
  %conv6 = trunc i32 %7 to i16, !dbg !678
  store i16 %conv6, i16* %retval, align 2, !dbg !679
  br label %return, !dbg !679

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !680
  ret i16 %8, !dbg !680
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !681 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !684, metadata !DIExpression()), !dbg !685
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !686, metadata !DIExpression()), !dbg !687
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !687
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !688, metadata !DIExpression()), !dbg !689
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !689
  %0 = load i16, i16* %value.addr, align 2, !dbg !690
  %conv = sext i16 %0 to i32, !dbg !690
  %1 = load i16, i16* %factor.addr, align 2, !dbg !691
  %conv1 = zext i16 %1 to i32, !dbg !691
  %mul = mul nsw i32 %conv, %conv1, !dbg !692
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !693
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !694
  %shr = ashr i32 %2, 15, !dbg !695
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !696
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !697
  %cmp = icmp slt i32 %3, 0, !dbg !699
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !700

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !701
  %and = and i32 %4, 32767, !dbg !702
  %cmp3 = icmp ne i32 %and, 0, !dbg !703
  br i1 %cmp3, label %if.then, label %if.end, !dbg !704

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !705
  %add = add nsw i32 %5, 1, !dbg !707
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !708
  br label %if.end, !dbg !709

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !710
  %cmp5 = icmp slt i32 %6, 32767, !dbg !712
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !713

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !714
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !717
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !718

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !719
  %conv11 = trunc i32 %8 to i16, !dbg !721
  store i16 %conv11, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !723
  br label %return, !dbg !723

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !725
  br label %return, !dbg !725

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !727
  ret i16 %9, !dbg !727
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !728 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !731, metadata !DIExpression()), !dbg !732
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !733, metadata !DIExpression()), !dbg !734
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !735, metadata !DIExpression()), !dbg !737
  store i32 0, i32* %u32MulTemp, align 4, !dbg !737
  %0 = load i16, i16* %value.addr, align 2, !dbg !738
  %conv = zext i16 %0 to i32, !dbg !738
  %1 = load i16, i16* %factor.addr, align 2, !dbg !739
  %conv1 = zext i16 %1 to i32, !dbg !739
  %mul = mul nsw i32 %conv, %conv1, !dbg !740
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !741
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !742
  %shr = lshr i32 %2, 8, !dbg !743
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !744
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !745
  %cmp = icmp ult i32 %3, 32767, !dbg !747
  br i1 %cmp, label %if.then, label %if.else, !dbg !748

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !749
  %conv3 = trunc i32 %4 to i16, !dbg !751
  store i16 %conv3, i16* %retval, align 2, !dbg !752
  br label %return, !dbg !752

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !753
  br label %return, !dbg !753

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !755
  ret i16 %5, !dbg !755
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !756 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !759, metadata !DIExpression()), !dbg !760
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !761, metadata !DIExpression()), !dbg !762
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !763, metadata !DIExpression()), !dbg !764
  store i32 0, i32* %s32MulTemp, align 4, !dbg !764
  %0 = load i16, i16* %value.addr, align 2, !dbg !765
  %conv = sext i16 %0 to i32, !dbg !765
  %1 = load i16, i16* %factor.addr, align 2, !dbg !766
  %conv1 = zext i16 %1 to i32, !dbg !766
  %mul = mul nsw i32 %conv, %conv1, !dbg !767
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !768
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !769
  ret i32 %2, !dbg !770
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !771 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !774, metadata !DIExpression()), !dbg !775
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !778, metadata !DIExpression()), !dbg !779
  store i32 0, i32* %s32Temp1, align 4, !dbg !779
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !780, metadata !DIExpression()), !dbg !781
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !781
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !782, metadata !DIExpression()), !dbg !783
  store i32 0, i32* %s32Factor, align 4, !dbg !783
  %0 = load i16, i16* %factor.addr, align 2, !dbg !784
  %conv = zext i16 %0 to i32, !dbg !784
  store i32 %conv, i32* %s32Factor, align 4, !dbg !785
  %1 = load i16, i16* %factor.addr, align 2, !dbg !786
  %conv1 = zext i16 %1 to i32, !dbg !786
  %cmp = icmp ne i32 %conv1, 0, !dbg !788
  br i1 %cmp, label %if.then, label %if.else19, !dbg !789

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !790
  %cmp3 = icmp slt i32 %2, 0, !dbg !793
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !794

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !795
  %4 = load i32, i32* %s32Factor, align 4, !dbg !797
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !798
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !798
  %div = sdiv i32 %3, %4, !dbg !798, !klee.check.div !261
  store i32 %div, i32* %s32Temp1, align 4, !dbg !799
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !800
  %6 = load i32, i32* %value.addr, align 4, !dbg !802
  %cmp6 = icmp sge i32 %5, %6, !dbg !803
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !804

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !805
  br label %return, !dbg !805

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !807
  %8 = load i16, i16* %factor.addr, align 2, !dbg !809
  %conv9 = zext i16 %8 to i32, !dbg !809
  %mul = mul nsw i32 %7, %conv9, !dbg !810
  store i32 %mul, i32* %retval, align 4, !dbg !811
  br label %return, !dbg !811

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !812
  %conv11 = zext i16 %9 to i32, !dbg !812
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !815
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !815
  %div12 = udiv i32 2147483647, %conv11, !dbg !815, !klee.check.div !261
  %10 = load i32, i32* %value.addr, align 4, !dbg !816
  %cmp13 = icmp ule i32 %div12, %10, !dbg !817
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !818

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !819
  br label %return, !dbg !819

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !821
  %12 = load i16, i16* %factor.addr, align 2, !dbg !823
  %conv17 = zext i16 %12 to i32, !dbg !823
  %mul18 = mul nsw i32 %11, %conv17, !dbg !824
  store i32 %mul18, i32* %retval, align 4, !dbg !825
  br label %return, !dbg !825

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !826
  br label %return, !dbg !826

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !828
  ret i32 %13, !dbg !828
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !829 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !832, metadata !DIExpression()), !dbg !833
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !834, metadata !DIExpression()), !dbg !835
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !836, metadata !DIExpression()), !dbg !837
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !838, metadata !DIExpression()), !dbg !839
  store i16 0, i16* %u16MulTemp, align 2, !dbg !839
  %0 = load i8, i8* %value.addr, align 1, !dbg !840
  %conv = zext i8 %0 to i32, !dbg !840
  %1 = load i8, i8* %factor.addr, align 1, !dbg !841
  %conv1 = zext i8 %1 to i32, !dbg !841
  %mul = mul nsw i32 %conv, %conv1, !dbg !842
  %conv2 = trunc i32 %mul to i16, !dbg !840
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !843
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !844
  %conv3 = zext i16 %2 to i32, !dbg !844
  %3 = load i16, i16* %count.addr, align 2, !dbg !845
  %conv4 = zext i16 %3 to i32, !dbg !845
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !846
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !846
  %div = sdiv i32 %conv3, %conv4, !dbg !846, !klee.check.div !261
  %conv5 = trunc i32 %div to i16, !dbg !844
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !847
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !848
  %conv6 = trunc i16 %4 to i8, !dbg !849
  ret i8 %conv6, !dbg !850
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !851 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !854, metadata !DIExpression()), !dbg !855
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !856, metadata !DIExpression()), !dbg !857
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !858, metadata !DIExpression()), !dbg !859
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !860, metadata !DIExpression()), !dbg !861
  store i16 0, i16* %u16MulTemp, align 2, !dbg !861
  %0 = load i8, i8* %value.addr, align 1, !dbg !862
  %conv = zext i8 %0 to i32, !dbg !862
  %1 = load i8, i8* %factor.addr, align 1, !dbg !863
  %conv1 = zext i8 %1 to i32, !dbg !863
  %mul = mul nsw i32 %conv, %conv1, !dbg !864
  %conv2 = trunc i32 %mul to i16, !dbg !862
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !865
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !866
  %conv3 = zext i16 %2 to i32, !dbg !866
  %3 = load i8, i8* %count.addr, align 1, !dbg !867
  %conv4 = zext i8 %3 to i32, !dbg !867
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !868
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !868
  %div = sdiv i32 %conv3, %conv4, !dbg !868, !klee.check.div !261
  %conv5 = trunc i32 %div to i16, !dbg !866
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !869
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !870
  %conv6 = zext i16 %4 to i32, !dbg !870
  %cmp = icmp sle i32 %conv6, 255, !dbg !872
  br i1 %cmp, label %if.then, label %if.else, !dbg !873

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !874
  %conv8 = zext i16 %5 to i32, !dbg !874
  %and = and i32 %conv8, 255, !dbg !876
  %conv9 = trunc i32 %and to i8, !dbg !874
  store i8 %conv9, i8* %retval, align 1, !dbg !877
  br label %return, !dbg !877

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !878
  br label %return, !dbg !878

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !880
  ret i8 %6, !dbg !880
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !881 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !884, metadata !DIExpression()), !dbg !885
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !886, metadata !DIExpression()), !dbg !887
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !888, metadata !DIExpression()), !dbg !889
  store i16 0, i16* %u16MulTemp, align 2, !dbg !889
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !890
  %conv = zext i8 %0 to i32, !dbg !890
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !891
  %conv1 = zext i8 %1 to i32, !dbg !891
  %mul = mul nsw i32 %conv, %conv1, !dbg !892
  %conv2 = trunc i32 %mul to i16, !dbg !890
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !893
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !894
  %conv3 = zext i16 %2 to i32, !dbg !894
  %shr = ashr i32 %conv3, 8, !dbg !895
  %conv4 = trunc i32 %shr to i16, !dbg !894
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !896
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !897
  %conv5 = trunc i16 %3 to i8, !dbg !898
  ret i8 %conv5, !dbg !899
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !900 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !903, metadata !DIExpression()), !dbg !904
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !905, metadata !DIExpression()), !dbg !906
  store i16 0, i16* %u16MulTemp, align 2, !dbg !906
  %0 = load i8, i8* %value.addr, align 1, !dbg !907
  %conv = zext i8 %0 to i32, !dbg !907
  %1 = load i8, i8* %factor.addr, align 1, !dbg !908
  %conv1 = zext i8 %1 to i32, !dbg !908
  %mul = mul nsw i32 %conv, %conv1, !dbg !909
  %conv2 = trunc i32 %mul to i16, !dbg !907
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !910
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !911
  %conv3 = zext i16 %2 to i32, !dbg !911
  %shr = ashr i32 %conv3, 7, !dbg !912
  %conv4 = trunc i32 %shr to i16, !dbg !911
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !913
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !914
  %conv5 = zext i16 %3 to i32, !dbg !914
  %cmp = icmp slt i32 %conv5, 255, !dbg !916
  br i1 %cmp, label %if.then, label %if.else, !dbg !917

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !918
  %conv7 = trunc i16 %4 to i8, !dbg !920
  store i8 %conv7, i8* %retval, align 1, !dbg !921
  br label %return, !dbg !921

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !922
  br label %return, !dbg !922

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !924
  ret i8 %5, !dbg !924
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !925 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !928, metadata !DIExpression()), !dbg !929
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !930, metadata !DIExpression()), !dbg !931
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !932, metadata !DIExpression()), !dbg !933
  store i32 0, i32* %u32MulTemp, align 4, !dbg !933
  %0 = load i16, i16* %value.addr, align 2, !dbg !934
  %conv = zext i16 %0 to i32, !dbg !934
  %1 = load i16, i16* %factor.addr, align 2, !dbg !935
  %conv1 = zext i16 %1 to i32, !dbg !935
  %mul = mul nsw i32 %conv, %conv1, !dbg !936
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !937
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !938
  %shr = lshr i32 %2, 16, !dbg !939
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !940
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !941
  %conv2 = trunc i32 %3 to i16, !dbg !942
  ret i16 %conv2, !dbg !943
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !944 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !947, metadata !DIExpression()), !dbg !948
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !949, metadata !DIExpression()), !dbg !950
  store i32 0, i32* %u32MulTemp, align 4, !dbg !950
  %0 = load i16, i16* %value.addr, align 2, !dbg !951
  %conv = zext i16 %0 to i32, !dbg !951
  %1 = load i16, i16* %factor.addr, align 2, !dbg !952
  %conv1 = zext i16 %1 to i32, !dbg !952
  %mul = mul nsw i32 %conv, %conv1, !dbg !953
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !954
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !955
  %shr = lshr i32 %2, 8, !dbg !956
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !957
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !958
  %cmp = icmp ult i32 %3, 65535, !dbg !960
  br i1 %cmp, label %if.then, label %if.else, !dbg !961

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !962
  %and = and i32 %4, 65535, !dbg !964
  %conv3 = trunc i32 %and to i16, !dbg !965
  store i16 %conv3, i16* %retval, align 2, !dbg !966
  br label %return, !dbg !966

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !969
  ret i16 %5, !dbg !969
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !970 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !975, metadata !DIExpression()), !dbg !976
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !977, metadata !DIExpression()), !dbg !978
  store i32 0, i32* %u32MulTemp, align 4, !dbg !978
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !979
  %conv = zext i16 %0 to i32, !dbg !979
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !980
  %conv1 = zext i8 %1 to i32, !dbg !980
  %mul = mul nsw i32 %conv, %conv1, !dbg !981
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !982
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !983
  %shr = lshr i32 %2, 8, !dbg !984
  %and = and i32 %shr, 65535, !dbg !985
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !986
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !987
  %conv2 = trunc i32 %3 to i16, !dbg !987
  ret i16 %conv2, !dbg !988
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !989 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !990, metadata !DIExpression()), !dbg !991
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !992, metadata !DIExpression()), !dbg !993
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !994, metadata !DIExpression()), !dbg !995
  store i32 0, i32* %u32MulTemp, align 4, !dbg !995
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !996
  %conv = zext i16 %0 to i32, !dbg !996
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !997
  %conv1 = zext i8 %1 to i32, !dbg !997
  %mul = mul nsw i32 %conv, %conv1, !dbg !998
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !999
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1000
  %shr = lshr i32 %2, 7, !dbg !1001
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1002
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1003
  %cmp = icmp ult i32 %3, 65535, !dbg !1005
  br i1 %cmp, label %if.then, label %if.else, !dbg !1006

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1007
  %and = and i32 %4, 65535, !dbg !1009
  %conv3 = trunc i32 %and to i16, !dbg !1010
  store i16 %conv3, i16* %retval, align 2, !dbg !1011
  br label %return, !dbg !1011

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1012
  br label %return, !dbg !1012

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1014
  ret i16 %5, !dbg !1014
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1015 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1025
  %0 = load i16, i16* %value.addr, align 2, !dbg !1026
  %conv = zext i16 %0 to i32, !dbg !1026
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1027
  %conv1 = zext i16 %1 to i32, !dbg !1027
  %mul = mul nsw i32 %conv, %conv1, !dbg !1028
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1029
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1030
  %3 = load i32, i32* %count.addr, align 4, !dbg !1031
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1032
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1032
  %div = udiv i32 %2, %3, !dbg !1032, !klee.check.div !261
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1033
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1034
  %and = and i32 %4, 65535, !dbg !1035
  %conv2 = trunc i32 %and to i16, !dbg !1036
  ret i16 %conv2, !dbg !1037
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1038 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1041, metadata !DIExpression()), !dbg !1042
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1047, metadata !DIExpression()), !dbg !1048
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1048
  %0 = load i16, i16* %value.addr, align 2, !dbg !1049
  %conv = zext i16 %0 to i32, !dbg !1049
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1050
  %conv1 = zext i16 %1 to i32, !dbg !1050
  %mul = mul nsw i32 %conv, %conv1, !dbg !1051
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1052
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1053
  %3 = load i16, i16* %count.addr, align 2, !dbg !1054
  %conv2 = zext i16 %3 to i32, !dbg !1054
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1055
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1055
  %div = udiv i32 %2, %conv2, !dbg !1055, !klee.check.div !261
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1056
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1057
  %cmp = icmp ule i32 %4, 65535, !dbg !1059
  br i1 %cmp, label %if.then, label %if.else, !dbg !1060

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1061
  %and = and i32 %5, 65535, !dbg !1063
  %conv4 = trunc i32 %and to i16, !dbg !1064
  store i16 %conv4, i16* %retval, align 2, !dbg !1065
  br label %return, !dbg !1065

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1066
  br label %return, !dbg !1066

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1068
  ret i16 %6, !dbg !1068
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1069 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1070, metadata !DIExpression()), !dbg !1071
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1074, metadata !DIExpression()), !dbg !1075
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1075
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1076
  %conv = zext i16 %0 to i32, !dbg !1076
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1077
  %conv1 = zext i16 %1 to i32, !dbg !1077
  %mul = mul nsw i32 %conv, %conv1, !dbg !1078
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1079
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1080
  %shr = lshr i32 %2, 16, !dbg !1081
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1082
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1083
  %and = and i32 65535, %3, !dbg !1084
  %conv2 = trunc i32 %and to i16, !dbg !1085
  ret i16 %conv2, !dbg !1086
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1087 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1093
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1094
  %conv = zext i16 %0 to i32, !dbg !1094
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1095
  %conv1 = zext i16 %1 to i32, !dbg !1095
  %mul = mul nsw i32 %conv, %conv1, !dbg !1096
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1097
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1098
  %shr = lshr i32 %2, 15, !dbg !1099
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1100
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1101
  %cmp = icmp ule i32 %3, 65535, !dbg !1103
  br i1 %cmp, label %if.then, label %if.else, !dbg !1104

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1105
  %and = and i32 %4, 65535, !dbg !1107
  %conv3 = trunc i32 %and to i16, !dbg !1108
  store i16 %conv3, i16* %retval, align 2, !dbg !1109
  br label %return, !dbg !1109

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1110
  br label %return, !dbg !1110

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1112
  ret i16 %5, !dbg !1112
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1113 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1120, metadata !DIExpression()), !dbg !1121
  store i32 0, i32* %u32Temp1, align 4, !dbg !1121
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1122
  %conv = zext i16 %0 to i32, !dbg !1122
  %cmp = icmp sgt i32 %conv, 0, !dbg !1124
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1125

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1126
  %conv2 = zext i16 %1 to i32, !dbg !1126
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1128
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1128
  %div = udiv i32 -1, %conv2, !dbg !1128, !klee.check.div !261
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1129
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1130
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1132
  %cmp3 = icmp ult i32 %2, %3, !dbg !1133
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1134

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1135
  br label %return, !dbg !1135

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1137
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1139
  %conv6 = zext i16 %5 to i32, !dbg !1139
  %mul = mul i32 %4, %conv6, !dbg !1140
  store i32 %mul, i32* %retval, align 4, !dbg !1141
  br label %return, !dbg !1141

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1142
  br label %return, !dbg !1142

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1144
  ret i32 %6, !dbg !1144
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1145 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1148, metadata !DIExpression()), !dbg !1149
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1150, metadata !DIExpression()), !dbg !1151
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1152, metadata !DIExpression()), !dbg !1153
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1154, metadata !DIExpression()), !dbg !1155
  store i32 0, i32* %u32Temp1, align 4, !dbg !1155
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 0, i32* %u32Temp2, align 4, !dbg !1157
  %0 = load i32, i32* %value.addr, align 4, !dbg !1158
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1159
  %conv = zext i16 %1 to i32, !dbg !1159
  %mul = mul i32 %0, %conv, !dbg !1160
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1161
  %2 = load i32, i32* %value.addr, align 4, !dbg !1162
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1163
  %conv1 = zext i16 %3 to i32, !dbg !1163
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1164
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1165
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1166
  %5 = load i32, i32* %count.addr, align 4, !dbg !1167
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1168
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1168
  %shr = lshr i32 %4, %5, !dbg !1168, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1169
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1170
  %7 = load i32, i32* %count.addr, align 4, !dbg !1171
  %sub = sub i32 32, %7, !dbg !1172
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1173
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1173
  %shl = shl i32 %6, %sub, !dbg !1173, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1174
  %or = or i32 %8, %shl, !dbg !1174
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1174
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1175
  %10 = load i32, i32* %count.addr, align 4, !dbg !1177
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1178
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1178
  %shr2 = lshr i32 %9, %10, !dbg !1178, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !1179
  br i1 %cmp, label %if.then, label %if.else, !dbg !1180

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1181
  store i32 %11, i32* %retval, align 4, !dbg !1183
  br label %return, !dbg !1183

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1184
  br label %return, !dbg !1184

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1186
  ret i32 %12, !dbg !1186
}

declare dso_local i32 @MulHighWord(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1187 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1190, metadata !DIExpression()), !dbg !1191
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1194, metadata !DIExpression()), !dbg !1195
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1196, metadata !DIExpression()), !dbg !1197
  store i16 0, i16* %s16Temp1, align 2, !dbg !1197
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1198
  %conv = zext i8 %0 to i32, !dbg !1198
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1199
  %conv1 = zext i8 %1 to i32, !dbg !1199
  %sub = sub nsw i32 %conv, %conv1, !dbg !1200
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1201
  %conv2 = sext i8 %2 to i32, !dbg !1201
  %mul = mul nsw i32 %sub, %conv2, !dbg !1202
  %div = sdiv i32 %mul, 32, !dbg !1203
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1204
  %conv3 = zext i8 %3 to i32, !dbg !1204
  %add = add nsw i32 %div, %conv3, !dbg !1205
  %conv4 = trunc i32 %add to i16, !dbg !1206
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1207
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1208
  %conv5 = sext i16 %4 to i32, !dbg !1208
  %cmp = icmp slt i32 %conv5, 255, !dbg !1210
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1211

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1212
  %conv7 = sext i16 %5 to i32, !dbg !1212
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1215
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1216

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1217
  %conv11 = trunc i16 %6 to i8, !dbg !1219
  store i8 %conv11, i8* %retval, align 1, !dbg !1220
  br label %return, !dbg !1220

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1221
  br label %return, !dbg !1221

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1223
  br label %return, !dbg !1223

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1225
  ret i8 %7, !dbg !1225
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1226 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1229, metadata !DIExpression()), !dbg !1230
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1231, metadata !DIExpression()), !dbg !1232
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1233, metadata !DIExpression()), !dbg !1234
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1235, metadata !DIExpression()), !dbg !1236
  store i32 0, i32* %s32Temp1, align 4, !dbg !1236
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1237
  %conv = zext i16 %0 to i32, !dbg !1237
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1238
  %conv1 = zext i16 %1 to i32, !dbg !1238
  %sub = sub nsw i32 %conv, %conv1, !dbg !1239
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1240
  %conv2 = sext i8 %2 to i32, !dbg !1240
  %mul = mul nsw i32 %sub, %conv2, !dbg !1241
  %div = sdiv i32 %mul, 32, !dbg !1242
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1243
  %conv3 = zext i16 %3 to i32, !dbg !1243
  %add = add nsw i32 %div, %conv3, !dbg !1244
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1245
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1246
  %cmp = icmp slt i32 %4, 65535, !dbg !1248
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1249

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1250
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1253
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1254

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1255
  %conv8 = trunc i32 %6 to i16, !dbg !1257
  store i16 %conv8, i16* %retval, align 2, !dbg !1258
  br label %return, !dbg !1258

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1259
  br label %return, !dbg !1259

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1261
  br label %return, !dbg !1261

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1263
  ret i16 %7, !dbg !1263
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1264 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1265, metadata !DIExpression()), !dbg !1266
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1267, metadata !DIExpression()), !dbg !1268
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1269, metadata !DIExpression()), !dbg !1270
  store i32 0, i32* %u32Temp1, align 4, !dbg !1270
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1271
  %conv = zext i16 %0 to i32, !dbg !1271
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1272
  %conv1 = zext i16 %1 to i32, !dbg !1272
  %mul = mul nsw i32 %conv, %conv1, !dbg !1273
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1274
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1275
  %cmp = icmp ule i32 %2, 65535, !dbg !1277
  br i1 %cmp, label %if.then, label %if.else, !dbg !1278

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1279
  %and = and i32 %3, 65535, !dbg !1281
  %conv3 = trunc i32 %and to i16, !dbg !1282
  store i16 %conv3, i16* %retval, align 2, !dbg !1283
  br label %return, !dbg !1283

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1284
  br label %return, !dbg !1284

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1286
  ret i16 %4, !dbg !1286
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1287 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1290, metadata !DIExpression()), !dbg !1291
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1292, metadata !DIExpression()), !dbg !1293
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1294, metadata !DIExpression()), !dbg !1295
  store i32 0, i32* %u32Temp1, align 4, !dbg !1295
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1296
  %conv = zext i16 %0 to i32, !dbg !1296
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1297
  %conv1 = zext i16 %1 to i32, !dbg !1297
  %mul = mul nsw i32 %conv, %conv1, !dbg !1298
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1299
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1300
  ret i32 %2, !dbg !1301
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1302 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1305, metadata !DIExpression()), !dbg !1306
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1307, metadata !DIExpression()), !dbg !1308
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1309, metadata !DIExpression()), !dbg !1310
  store i32 0, i32* %s32Temp1, align 4, !dbg !1310
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1311
  %conv = sext i16 %0 to i32, !dbg !1311
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1312
  %conv1 = sext i16 %1 to i32, !dbg !1312
  %mul = mul nsw i32 %conv, %conv1, !dbg !1313
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1314
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1315
  ret i32 %2, !dbg !1316
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1317 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1320, metadata !DIExpression()), !dbg !1321
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1322, metadata !DIExpression()), !dbg !1323
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1324, metadata !DIExpression()), !dbg !1325
  store i32 0, i32* %s32Temp1, align 4, !dbg !1325
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1326
  %cmp = icmp sgt i32 %0, 0, !dbg !1328
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1329

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1330
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1332
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1332
  %div = udiv i32 -1, %1, !dbg !1332, !klee.check.div !261
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1333
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1334
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1336
  %cmp1 = icmp ult i32 %2, %3, !dbg !1337
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1338

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1339
  br label %return, !dbg !1339

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1341
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1343
  %mul = mul i32 %4, %5, !dbg !1344
  store i32 %mul, i32* %retval, align 4, !dbg !1345
  br label %return, !dbg !1345

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1346
  br label %return, !dbg !1346

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1348
  ret i32 %6, !dbg !1348
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1349 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1352, metadata !DIExpression()), !dbg !1353
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1354, metadata !DIExpression()), !dbg !1355
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1356, metadata !DIExpression()), !dbg !1357
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1358, metadata !DIExpression()), !dbg !1359
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1360, metadata !DIExpression()), !dbg !1361
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1362, metadata !DIExpression()), !dbg !1363
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1364
  %cmp = icmp slt i32 %0, 0, !dbg !1366
  br i1 %cmp, label %if.then, label %if.else, !dbg !1367

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1368
  %sub = sub nsw i32 0, %1, !dbg !1369
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1370
  br label %if.end, !dbg !1371

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1372
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1373
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1374
  %cmp1 = icmp slt i32 %3, 0, !dbg !1376
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1377

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1378
  %sub3 = sub nsw i32 0, %4, !dbg !1379
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1380
  br label %if.end5, !dbg !1381

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1382
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1383
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1384
  %cmp6 = icmp slt i32 %6, 0, !dbg !1386
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1387
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1387

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1388
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1389
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1390
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1390

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1391
  br label %if.end13, !dbg !1392

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1393
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1394
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1395
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1396
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1397
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1398
  %conv = zext i8 %12 to i32, !dbg !1398
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1400
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1401

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1402
  br label %return, !dbg !1402

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1404
  store i32 %13, i32* %retval, align 4, !dbg !1406
  br label %return, !dbg !1406

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1407
  ret i32 %14, !dbg !1407
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1408 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1411, metadata !DIExpression()), !dbg !1412
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1413, metadata !DIExpression()), !dbg !1414
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1415, metadata !DIExpression()), !dbg !1416
  store i32 0, i32* %u32Temp1, align 4, !dbg !1416
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1417
  %cmp = icmp ne i32 %0, 0, !dbg !1419
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1420

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1421
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1423
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1423
  %div = udiv i32 -1, %1, !dbg !1423, !klee.check.div !261
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1424
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1425
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1427
  %cmp1 = icmp ult i32 %2, %3, !dbg !1428
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1429

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1430
  br label %return, !dbg !1430

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1432
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1434
  %mul = mul i32 %4, %5, !dbg !1435
  store i32 %mul, i32* %retval, align 4, !dbg !1436
  br label %return, !dbg !1436

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1437
  br label %return, !dbg !1437

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1439
  ret i32 %6, !dbg !1439
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1440 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1441, metadata !DIExpression()), !dbg !1442
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1443, metadata !DIExpression()), !dbg !1444
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1445, metadata !DIExpression()), !dbg !1446
  store i32 0, i32* %u32Temp1, align 4, !dbg !1446
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1447, metadata !DIExpression()), !dbg !1448
  store i32 0, i32* %u32Temp2, align 4, !dbg !1448
  %0 = load i32, i32* %value.addr, align 4, !dbg !1449
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1450
  %conv = zext i16 %1 to i32, !dbg !1450
  %mul = mul i32 %0, %conv, !dbg !1451
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1452
  %2 = load i32, i32* %value.addr, align 4, !dbg !1453
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1454
  %conv1 = zext i16 %3 to i32, !dbg !1454
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1455
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1456
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1457
  %shr = lshr i32 %4, 16, !dbg !1458
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1459
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1460
  %shl = shl i32 %5, 16, !dbg !1461
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1462
  %or = or i32 %6, %shl, !dbg !1462
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1462
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1463
  ret i32 %7, !dbg !1464
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1465 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1466, metadata !DIExpression()), !dbg !1467
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1468, metadata !DIExpression()), !dbg !1469
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1470, metadata !DIExpression()), !dbg !1471
  store i32 0, i32* %u32Temp1, align 4, !dbg !1471
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1472, metadata !DIExpression()), !dbg !1473
  store i32 0, i32* %u32Temp2, align 4, !dbg !1473
  %0 = load i32, i32* %value.addr, align 4, !dbg !1474
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1475
  %conv = zext i16 %1 to i32, !dbg !1475
  %mul = mul i32 %0, %conv, !dbg !1476
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1477
  %2 = load i32, i32* %value.addr, align 4, !dbg !1478
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1479
  %conv1 = zext i16 %3 to i32, !dbg !1479
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1480
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1481
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1482
  %shr = lshr i32 %4, 15, !dbg !1483
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1484
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1485
  %shl = shl i32 %5, 17, !dbg !1486
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1487
  %or = or i32 %6, %shl, !dbg !1487
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1487
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1488
  %shr2 = lshr i32 %7, 15, !dbg !1490
  %cmp = icmp eq i32 %shr2, 0, !dbg !1491
  br i1 %cmp, label %if.then, label %if.else, !dbg !1492

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  store i32 %8, i32* %retval, align 4, !dbg !1495
  br label %return, !dbg !1495

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1496
  br label %return, !dbg !1496

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1498
  ret i32 %9, !dbg !1498
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1499 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1502, metadata !DIExpression()), !dbg !1503
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1504, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1506, metadata !DIExpression()), !dbg !1507
  store i32 0, i32* %u32Temp1, align 4, !dbg !1507
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i32 0, i32* %u32Temp2, align 4, !dbg !1509
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1510
  %conv = sext i16 %0 to i32, !dbg !1510
  %cmp = icmp sgt i32 %conv, 0, !dbg !1512
  br i1 %cmp, label %if.then, label %if.else, !dbg !1513

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1514
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1516
  %conv2 = sext i16 %2 to i32, !dbg !1516
  %mul = mul i32 %1, %conv2, !dbg !1517
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1518
  %3 = load i32, i32* %value.addr, align 4, !dbg !1519
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1520
  %conv3 = sext i16 %4 to i32, !dbg !1520
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1521
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1522
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1523
  %shr = lshr i32 %5, 15, !dbg !1524
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1525
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1526
  %shl = shl i32 %6, 17, !dbg !1527
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1528
  %or = or i32 %7, %shl, !dbg !1528
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1528
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  store i32 %8, i32* %retval, align 4, !dbg !1530
  br label %return, !dbg !1530

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1531
  br label %return, !dbg !1531

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1533
  ret i32 %9, !dbg !1533
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1534 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1535, metadata !DIExpression()), !dbg !1536
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1537, metadata !DIExpression()), !dbg !1538
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1539, metadata !DIExpression()), !dbg !1540
  store i32 0, i32* %u32Temp1, align 4, !dbg !1540
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1541, metadata !DIExpression()), !dbg !1542
  store i32 0, i32* %u32Temp2, align 4, !dbg !1542
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1543
  %conv = sext i16 %0 to i32, !dbg !1543
  %cmp = icmp sle i32 %conv, 0, !dbg !1545
  br i1 %cmp, label %if.then, label %if.else, !dbg !1546

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1547
  br label %return, !dbg !1547

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1549
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1551
  %conv2 = sext i16 %2 to i32, !dbg !1551
  %mul = mul i32 %1, %conv2, !dbg !1552
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1553
  %3 = load i32, i32* %value.addr, align 4, !dbg !1554
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1555
  %conv3 = sext i16 %4 to i32, !dbg !1555
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1556
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1557
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1558
  %shr = lshr i32 %5, 14, !dbg !1559
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1560
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1561
  %shl = shl i32 %6, 18, !dbg !1562
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1563
  %or = or i32 %7, %shl, !dbg !1563
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1563
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1564
  %shr4 = lshr i32 %8, 14, !dbg !1566
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1567
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1568

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1569
  store i32 %9, i32* %retval, align 4, !dbg !1571
  br label %return, !dbg !1571

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1572
  br label %return, !dbg !1572

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1574
  ret i32 %10, !dbg !1574
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1575 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1576, metadata !DIExpression()), !dbg !1577
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  %0 = load i32, i32* %value.addr, align 4, !dbg !1580
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1581
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1582
  ret i32 %call, !dbg !1583
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1584 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1585, metadata !DIExpression()), !dbg !1586
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1587, metadata !DIExpression()), !dbg !1588
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1589, metadata !DIExpression()), !dbg !1590
  store i32 0, i32* %u32Temp1, align 4, !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %u32Temp2, align 4, !dbg !1592
  %0 = load i32, i32* %value.addr, align 4, !dbg !1593
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1594
  %mul = mul i32 %0, %1, !dbg !1595
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1596
  %2 = load i32, i32* %value.addr, align 4, !dbg !1597
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1598
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1599
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1600
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1601
  %shr = lshr i32 %4, 31, !dbg !1602
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1603
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1604
  %shl = shl i32 %5, 1, !dbg !1605
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1606
  %or = or i32 %6, %shl, !dbg !1606
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1606
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1607
  %shr1 = lshr i32 %7, 31, !dbg !1609
  %cmp = icmp eq i32 %shr1, 0, !dbg !1610
  br i1 %cmp, label %if.then, label %if.else, !dbg !1611

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1612
  store i32 %8, i32* %retval, align 4, !dbg !1614
  br label %return, !dbg !1614

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1615
  br label %return, !dbg !1615

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1617
  ret i32 %9, !dbg !1617
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1618 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1619, metadata !DIExpression()), !dbg !1620
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1623, metadata !DIExpression()), !dbg !1624
  store i32 0, i32* %u32Temp1, align 4, !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 0, i32* %u32Temp2, align 4, !dbg !1626
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1627
  %cmp = icmp sgt i32 %0, 0, !dbg !1629
  br i1 %cmp, label %if.then, label %if.else, !dbg !1630

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1631
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1633
  %mul = mul i32 %1, %2, !dbg !1634
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1635
  %3 = load i32, i32* %value.addr, align 4, !dbg !1636
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1637
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1638
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1639
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1640
  %shr = lshr i32 %5, 31, !dbg !1641
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1642
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1643
  %shl = shl i32 %6, 1, !dbg !1644
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1645
  %or = or i32 %7, %shl, !dbg !1645
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1645
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1646
  store i32 %8, i32* %retval, align 4, !dbg !1647
  br label %return, !dbg !1647

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1650
  ret i32 %9, !dbg !1650
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1651 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1652, metadata !DIExpression()), !dbg !1653
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1654, metadata !DIExpression()), !dbg !1655
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1656, metadata !DIExpression()), !dbg !1657
  store i32 0, i32* %u32Temp1, align 4, !dbg !1657
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1658, metadata !DIExpression()), !dbg !1659
  store i32 0, i32* %u32Temp2, align 4, !dbg !1659
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1660
  %cmp = icmp sle i32 %0, 0, !dbg !1662
  br i1 %cmp, label %if.then, label %if.else, !dbg !1663

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1664
  br label %return, !dbg !1664

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1666
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1668
  %mul = mul i32 %1, %2, !dbg !1669
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1670
  %3 = load i32, i32* %value.addr, align 4, !dbg !1671
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1672
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1673
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1674
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1675
  %shr = lshr i32 %5, 30, !dbg !1676
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1677
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1678
  %shl = shl i32 %6, 2, !dbg !1679
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1680
  %or = or i32 %7, %shl, !dbg !1680
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1680
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1681
  %shr1 = lshr i32 %8, 30, !dbg !1683
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1684
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1685

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1686
  store i32 %9, i32* %retval, align 4, !dbg !1688
  br label %return, !dbg !1688

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1689
  br label %return, !dbg !1689

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1691
  ret i32 %10, !dbg !1691
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1692 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1695, metadata !DIExpression()), !dbg !1696
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1699, metadata !DIExpression()), !dbg !1700
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1700
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1701
  %cmp = icmp slt i32 %0, 0, !dbg !1703
  br i1 %cmp, label %if.then, label %if.end3, !dbg !1704

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1705
  %conv = sext i32 %1 to i64, !dbg !1708
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !1709
  %tobool = icmp ne i32 %call, 0, !dbg !1709
  br i1 %tobool, label %if.end, label %if.then1, !dbg !1710

if.then1:                                         ; preds = %if.then
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1766, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !1711
  unreachable, !dbg !1711

if.end:                                           ; preds = %if.then
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1713
  %sub = sub nsw i32 0, %2, !dbg !1714
  %conv2 = sext i32 %sub to i64, !dbg !1715
  store volatile i64 %conv2, i64* @klee_alarm_sink_s64, align 8, !dbg !1716
  store i32 0, i32* %retval, align 4, !dbg !1717
  br label %return, !dbg !1717

if.end3:                                          ; preds = %entry
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1718
  %cmp4 = icmp ne i32 %3, 0, !dbg !1720
  br i1 %cmp4, label %if.then6, label %if.else20, !dbg !1721

if.then6:                                         ; preds = %if.end3
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1722
  %cmp7 = icmp sle i32 %4, 0, !dbg !1725
  br i1 %cmp7, label %if.then9, label %if.else13, !dbg !1726

if.then9:                                         ; preds = %if.then6
  %5 = load i32, i32* %s32Val2prime, align 4, !dbg !1727
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1730
  %div = udiv i32 -2147483648, %5, !dbg !1730, !klee.check.div !261
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1731
  %cmp10 = icmp ugt i32 %div, %6, !dbg !1732
  br i1 %cmp10, label %if.then12, label %if.else, !dbg !1733

if.then12:                                        ; preds = %if.then9
  %7 = load i32, i32* %val1.addr, align 4, !dbg !1734
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1736
  %mul = mul i32 %7, %8, !dbg !1737
  store i32 %mul, i32* %retval, align 4, !dbg !1738
  br label %return, !dbg !1738

if.else:                                          ; preds = %if.then9
  store i32 -2147483648, i32* %retval, align 4, !dbg !1739
  br label %return, !dbg !1739

if.else13:                                        ; preds = %if.then6
  %9 = load i32, i32* %val2.addr, align 4, !dbg !1741
  %int_cast_to_i641 = zext i32 %9 to i64, !dbg !1744
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1744
  %div14 = sdiv i32 2147483647, %9, !dbg !1744, !klee.check.div !261
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1745
  %cmp15 = icmp ult i32 %div14, %10, !dbg !1746
  br i1 %cmp15, label %if.then17, label %if.else18, !dbg !1747

if.then17:                                        ; preds = %if.else13
  store i32 2147483647, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

if.else18:                                        ; preds = %if.else13
  %11 = load i32, i32* %val1.addr, align 4, !dbg !1750
  %12 = load i32, i32* %val2.addr, align 4, !dbg !1752
  %mul19 = mul i32 %11, %12, !dbg !1753
  store i32 %mul19, i32* %retval, align 4, !dbg !1754
  br label %return, !dbg !1754

if.else20:                                        ; preds = %if.end3
  store i32 0, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

return:                                           ; preds = %if.else20, %if.else18, %if.then17, %if.else, %if.then12, %if.end
  %13 = load i32, i32* %retval, align 4, !dbg !1757
  ret i32 %13, !dbg !1757
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !1758 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !1761, metadata !DIExpression()), !dbg !1762
  %0 = load i64, i64* %value.addr, align 8, !dbg !1763
  %cmp = icmp ne i64 %0, -2147483648, !dbg !1764
  %conv = zext i1 %cmp to i32, !dbg !1764
  ret i32 %conv, !dbg !1765
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1766 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1767, metadata !DIExpression()), !dbg !1768
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1769, metadata !DIExpression()), !dbg !1770
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1771, metadata !DIExpression()), !dbg !1772
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1773, metadata !DIExpression()), !dbg !1774
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1775, metadata !DIExpression()), !dbg !1776
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1777, metadata !DIExpression()), !dbg !1778
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1779
  %cmp = icmp slt i32 %0, 0, !dbg !1781
  br i1 %cmp, label %if.then, label %if.else, !dbg !1782

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1783
  %sub = sub nsw i32 0, %1, !dbg !1785
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1786
  store i8 1, i8* %u8SignBit, align 1, !dbg !1787
  br label %if.end, !dbg !1788

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1789
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1791
  store i8 0, i8* %u8SignBit, align 1, !dbg !1792
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1793
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1794
  %conv = zext i16 %4 to i32, !dbg !1794
  %mul = mul i32 %3, %conv, !dbg !1795
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1796
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1797
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1798
  %conv1 = zext i16 %6 to i32, !dbg !1798
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1799
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1800
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1801
  %shr = lshr i32 %7, 16, !dbg !1802
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1803
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1804
  %shl = shl i32 %8, 16, !dbg !1805
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1806
  %or = or i32 %9, %shl, !dbg !1806
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1806
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1807
  %conv2 = zext i8 %10 to i32, !dbg !1807
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1809
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1810

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1811
  store i32 %11, i32* %retval, align 4, !dbg !1813
  br label %return, !dbg !1813

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1814
  %sub7 = sub i32 0, %12, !dbg !1816
  store i32 %sub7, i32* %retval, align 4, !dbg !1817
  br label %return, !dbg !1817

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1818
  ret i32 %13, !dbg !1818
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1819 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1820, metadata !DIExpression()), !dbg !1821
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1822, metadata !DIExpression()), !dbg !1823
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1824, metadata !DIExpression()), !dbg !1825
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1826, metadata !DIExpression()), !dbg !1827
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1828, metadata !DIExpression()), !dbg !1829
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1830, metadata !DIExpression()), !dbg !1831
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1832
  %cmp = icmp slt i32 %0, 0, !dbg !1834
  br i1 %cmp, label %if.then, label %if.else, !dbg !1835

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1836
  %sub = sub nsw i32 0, %1, !dbg !1838
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1839
  store i8 1, i8* %u8SignBit, align 1, !dbg !1840
  br label %if.end, !dbg !1841

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1842
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1844
  store i8 0, i8* %u8SignBit, align 1, !dbg !1845
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1846
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1847
  %conv = zext i16 %4 to i32, !dbg !1847
  %mul = mul i32 %3, %conv, !dbg !1848
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1849
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1850
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1851
  %conv1 = zext i16 %6 to i32, !dbg !1851
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1852
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1853
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1854
  %shr = lshr i32 %7, 15, !dbg !1855
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1856
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1857
  %shl = shl i32 %8, 17, !dbg !1858
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1859
  %or = or i32 %9, %shl, !dbg !1859
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1859
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1860
  %conv2 = zext i8 %10 to i32, !dbg !1860
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1862
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1863

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1864
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1867
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1868

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1869
  store i32 %12, i32* %retval, align 4, !dbg !1870
  br label %return, !dbg !1870

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1871
  br label %return, !dbg !1871

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1872
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1875
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1876

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1877
  %sub14 = sub i32 0, %14, !dbg !1878
  store i32 %sub14, i32* %retval, align 4, !dbg !1879
  br label %return, !dbg !1879

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1880
  br label %return, !dbg !1880

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1881
  ret i32 %15, !dbg !1881
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1882 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1885, metadata !DIExpression()), !dbg !1886
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1887, metadata !DIExpression()), !dbg !1888
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1889, metadata !DIExpression()), !dbg !1890
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1891, metadata !DIExpression()), !dbg !1892
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1893, metadata !DIExpression()), !dbg !1894
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1895, metadata !DIExpression()), !dbg !1896
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1897, metadata !DIExpression()), !dbg !1898
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1899
  %cmp = icmp slt i32 %0, 0, !dbg !1901
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1902

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1903
  %conv = sext i16 %1 to i32, !dbg !1903
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1904
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1905

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1906
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1907
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1908

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1909
  %conv6 = sext i16 %3 to i32, !dbg !1909
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1910
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1911

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1912
  br label %if.end, !dbg !1914

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1915
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1917
  %cmp9 = icmp slt i32 %4, 0, !dbg !1919
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1920

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1921
  %sub = sub nsw i32 0, %5, !dbg !1923
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1924
  br label %if.end13, !dbg !1925

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1926
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1928
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1929
  %conv14 = sext i16 %7 to i32, !dbg !1929
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1931
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1932

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1933
  %conv18 = sext i16 %8 to i32, !dbg !1933
  %sub19 = sub nsw i32 0, %conv18, !dbg !1935
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1936
  br label %if.end22, !dbg !1937

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1938
  %conv21 = sext i16 %9 to i32, !dbg !1938
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1940
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1941
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1942
  %mul = mul i32 %10, %11, !dbg !1943
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1944
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1945
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1946
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1947
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1948
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1949
  %shr = lshr i32 %14, 15, !dbg !1950
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1951
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1952
  %shl = shl i32 %15, 17, !dbg !1953
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1954
  %or = or i32 %16, %shl, !dbg !1954
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1954
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1955
  %conv23 = zext i8 %17 to i32, !dbg !1955
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1957
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1958

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1959
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1962
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1963

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1964
  store i32 %19, i32* %retval, align 4, !dbg !1965
  br label %return, !dbg !1965

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1966
  br label %return, !dbg !1966

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1967
  %sub32 = sub i32 0, %20, !dbg !1969
  store i32 %sub32, i32* %retval, align 4, !dbg !1970
  br label %return, !dbg !1970

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1971
  ret i32 %21, !dbg !1971
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1972 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1973, metadata !DIExpression()), !dbg !1974
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1975, metadata !DIExpression()), !dbg !1976
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1977, metadata !DIExpression()), !dbg !1978
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1979, metadata !DIExpression()), !dbg !1980
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1981, metadata !DIExpression()), !dbg !1982
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1983, metadata !DIExpression()), !dbg !1984
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1985, metadata !DIExpression()), !dbg !1986
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1987
  %cmp = icmp slt i32 %0, 0, !dbg !1989
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1990

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1991
  %conv = sext i16 %1 to i32, !dbg !1991
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1992
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1993

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1994
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1995
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1996

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1997
  %conv6 = sext i16 %3 to i32, !dbg !1997
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1998
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1999

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2000
  br label %if.end, !dbg !2002

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2003
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2005
  %cmp9 = icmp slt i32 %4, 0, !dbg !2007
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2008

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2009
  %sub = sub nsw i32 0, %5, !dbg !2011
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2012
  br label %if.end13, !dbg !2013

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2014
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2016
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2017
  %conv14 = sext i16 %7 to i32, !dbg !2017
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2019
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2020

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2021
  %conv18 = sext i16 %8 to i32, !dbg !2021
  %sub19 = sub nsw i32 0, %conv18, !dbg !2023
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2024
  br label %if.end22, !dbg !2025

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2026
  %conv21 = sext i16 %9 to i32, !dbg !2026
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2028
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2029
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2030
  %mul = mul i32 %10, %11, !dbg !2031
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2032
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2033
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2034
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2035
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2036
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2037
  %shr = lshr i32 %14, 14, !dbg !2038
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2039
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2040
  %shl = shl i32 %15, 18, !dbg !2041
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2042
  %or = or i32 %16, %shl, !dbg !2042
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2042
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2043
  %shr23 = lshr i32 %17, 14, !dbg !2045
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2046
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2047

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2048
  %conv27 = zext i8 %18 to i32, !dbg !2048
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2051
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2052

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2053
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2056
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2057

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2058
  store i32 %20, i32* %retval, align 4, !dbg !2059
  br label %return, !dbg !2059

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2060
  br label %return, !dbg !2060

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2061
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2064
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2065

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2066
  %sub39 = sub i32 0, %22, !dbg !2067
  store i32 %sub39, i32* %retval, align 4, !dbg !2068
  br label %return, !dbg !2068

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2069
  br label %return, !dbg !2069

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2070
  br label %return, !dbg !2070

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2072
  ret i32 %23, !dbg !2072
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2073 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2076, metadata !DIExpression()), !dbg !2077
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2078, metadata !DIExpression()), !dbg !2079
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2080, metadata !DIExpression()), !dbg !2081
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2082, metadata !DIExpression()), !dbg !2083
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2084, metadata !DIExpression()), !dbg !2085
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2086
  %cmp = icmp slt i32 %0, 0, !dbg !2088
  br i1 %cmp, label %if.then, label %if.else, !dbg !2089

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2090
  %sub = sub nsw i32 0, %1, !dbg !2092
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2093
  store i8 1, i8* %u8SignBit, align 1, !dbg !2094
  br label %if.end, !dbg !2095

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2096
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2098
  store i8 0, i8* %u8SignBit, align 1, !dbg !2099
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2100
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2101
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2102
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2103
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2104
  %conv = zext i8 %5 to i32, !dbg !2104
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2106
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2107

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2108
  store i32 %6, i32* %retval, align 4, !dbg !2109
  br label %return, !dbg !2109

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2110
  %sub5 = sub i32 0, %7, !dbg !2111
  store i32 %sub5, i32* %retval, align 4, !dbg !2112
  br label %return, !dbg !2112

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2113
  ret i32 %8, !dbg !2113
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2114 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2115, metadata !DIExpression()), !dbg !2116
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2117, metadata !DIExpression()), !dbg !2118
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2119, metadata !DIExpression()), !dbg !2120
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2121, metadata !DIExpression()), !dbg !2122
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2123, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2125, metadata !DIExpression()), !dbg !2126
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2127
  %cmp = icmp slt i32 %0, 0, !dbg !2129
  br i1 %cmp, label %if.then, label %if.else, !dbg !2130

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2131
  %sub = sub nsw i32 0, %1, !dbg !2133
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2134
  store i8 1, i8* %u8SignBit, align 1, !dbg !2135
  br label %if.end, !dbg !2136

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2137
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2139
  store i8 0, i8* %u8SignBit, align 1, !dbg !2140
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2141
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2142
  %mul = mul i32 %3, %4, !dbg !2143
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2144
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2145
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2146
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2147
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2148
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2149
  %shr = lshr i32 %7, 31, !dbg !2150
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2151
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2152
  %shl = shl i32 %8, 1, !dbg !2153
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2154
  %or = or i32 %9, %shl, !dbg !2154
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2154
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2155
  %conv = zext i8 %10 to i32, !dbg !2155
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2157
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2158

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2159
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2162
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2163

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2164
  store i32 %12, i32* %retval, align 4, !dbg !2165
  br label %return, !dbg !2165

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2166
  br label %return, !dbg !2166

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2167
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2170
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2171

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2172
  %sub12 = sub i32 0, %14, !dbg !2173
  store i32 %sub12, i32* %retval, align 4, !dbg !2174
  br label %return, !dbg !2174

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2175
  br label %return, !dbg !2175

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2176
  ret i32 %15, !dbg !2176
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2177 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2180, metadata !DIExpression()), !dbg !2181
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2182, metadata !DIExpression()), !dbg !2183
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2184, metadata !DIExpression()), !dbg !2185
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2186, metadata !DIExpression()), !dbg !2187
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2188, metadata !DIExpression()), !dbg !2189
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2190, metadata !DIExpression()), !dbg !2191
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2192, metadata !DIExpression()), !dbg !2193
  %0 = load i32, i32* %value.addr, align 4, !dbg !2194
  %cmp = icmp slt i32 %0, 0, !dbg !2196
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2197
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2197

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2198
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2199
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2200
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2200

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2201
  br label %if.end, !dbg !2203

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2204
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2206
  %cmp5 = icmp slt i32 %4, 0, !dbg !2208
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2209

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2210
  %sub = sub nsw i32 0, %5, !dbg !2212
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2213
  br label %if.end8, !dbg !2214

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2215
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2217
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2218
  %cmp9 = icmp slt i32 %7, 0, !dbg !2220
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2221

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2222
  %sub11 = sub nsw i32 0, %8, !dbg !2224
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2225
  br label %if.end13, !dbg !2226

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2227
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2229
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2230
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2231
  %mul = mul i32 %10, %11, !dbg !2232
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2233
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2234
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2235
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2236
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2237
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2238
  %shr = lshr i32 %14, 31, !dbg !2239
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2240
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2241
  %shl = shl i32 %15, 1, !dbg !2242
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2243
  %or = or i32 %16, %shl, !dbg !2243
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2243
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2244
  %conv = zext i8 %17 to i32, !dbg !2244
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2246
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2247

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2248
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2251
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2252

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2253
  store i32 %19, i32* %retval, align 4, !dbg !2254
  br label %return, !dbg !2254

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2255
  br label %return, !dbg !2255

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2256
  %sub22 = sub i32 0, %20, !dbg !2258
  store i32 %sub22, i32* %retval, align 4, !dbg !2259
  br label %return, !dbg !2259

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2260
  ret i32 %21, !dbg !2260
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2261 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2262, metadata !DIExpression()), !dbg !2263
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2264, metadata !DIExpression()), !dbg !2265
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2266, metadata !DIExpression()), !dbg !2267
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2268, metadata !DIExpression()), !dbg !2269
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2270, metadata !DIExpression()), !dbg !2271
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2272, metadata !DIExpression()), !dbg !2273
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2274, metadata !DIExpression()), !dbg !2275
  %0 = load i32, i32* %value.addr, align 4, !dbg !2276
  %cmp = icmp slt i32 %0, 0, !dbg !2278
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2279
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2279

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2280
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2281
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2282
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2282

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2283
  br label %if.end, !dbg !2285

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2286
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2288
  %cmp5 = icmp slt i32 %4, 0, !dbg !2290
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2291

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2292
  %sub = sub nsw i32 0, %5, !dbg !2294
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2295
  br label %if.end8, !dbg !2296

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2297
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2299
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2300
  %cmp9 = icmp slt i32 %7, 0, !dbg !2302
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2303

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2304
  %sub11 = sub nsw i32 0, %8, !dbg !2306
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2307
  br label %if.end13, !dbg !2308

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2309
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2311
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2312
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2313
  %mul = mul i32 %10, %11, !dbg !2314
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2315
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2316
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2317
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2318
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2319
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2320
  %shr = lshr i32 %14, 30, !dbg !2321
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2322
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2323
  %shl = shl i32 %15, 2, !dbg !2324
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2325
  %or = or i32 %16, %shl, !dbg !2325
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2325
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2326
  %shr14 = lshr i32 %17, 30, !dbg !2328
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2329
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2330

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2331
  %conv = zext i8 %18 to i32, !dbg !2331
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2334
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2335

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2336
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2339
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2340

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2341
  store i32 %20, i32* %retval, align 4, !dbg !2342
  br label %return, !dbg !2342

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2343
  br label %return, !dbg !2343

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2344
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2347
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2348

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2349
  %sub28 = sub i32 0, %22, !dbg !2350
  store i32 %sub28, i32* %retval, align 4, !dbg !2351
  br label %return, !dbg !2351

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2352
  br label %return, !dbg !2352

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2353
  br label %return, !dbg !2353

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2355
  ret i32 %23, !dbg !2355
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2356 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2359, metadata !DIExpression()), !dbg !2360
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2361, metadata !DIExpression()), !dbg !2362
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2363, metadata !DIExpression()), !dbg !2364
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2365, metadata !DIExpression()), !dbg !2366
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2367, metadata !DIExpression()), !dbg !2368
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2369, metadata !DIExpression()), !dbg !2370
  %0 = load i32, i32* %value.addr, align 4, !dbg !2371
  %cmp = icmp slt i32 %0, 0, !dbg !2373
  br i1 %cmp, label %if.then, label %if.else, !dbg !2374

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2375
  %sub = sub nsw i32 0, %1, !dbg !2377
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2378
  store i8 1, i8* %u8SignBit, align 1, !dbg !2379
  br label %if.end, !dbg !2380

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2381
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2383
  store i8 0, i8* %u8SignBit, align 1, !dbg !2384
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2385
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2386
  %conv = zext i8 %4 to i32, !dbg !2386
  %mul = mul i32 %3, %conv, !dbg !2387
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2388
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2389
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2390
  %conv1 = zext i8 %6 to i32, !dbg !2390
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2391
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2392
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2393
  %shr = lshr i32 %7, 8, !dbg !2394
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2395
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2396
  %shl = shl i32 %8, 24, !dbg !2397
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2398
  %or = or i32 %9, %shl, !dbg !2398
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2398
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2399
  %conv2 = zext i8 %10 to i32, !dbg !2399
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2401
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2402

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2403
  store i32 %11, i32* %retval, align 4, !dbg !2405
  br label %return, !dbg !2405

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2406
  %sub7 = sub i32 0, %12, !dbg !2408
  store i32 %sub7, i32* %retval, align 4, !dbg !2409
  br label %return, !dbg !2409

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2410
  ret i32 %13, !dbg !2410
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2411 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2412, metadata !DIExpression()), !dbg !2413
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2414, metadata !DIExpression()), !dbg !2415
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2416, metadata !DIExpression()), !dbg !2417
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2418, metadata !DIExpression()), !dbg !2419
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2420, metadata !DIExpression()), !dbg !2421
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2422, metadata !DIExpression()), !dbg !2423
  %0 = load i32, i32* %value.addr, align 4, !dbg !2424
  %cmp = icmp slt i32 %0, 0, !dbg !2426
  br i1 %cmp, label %if.then, label %if.else, !dbg !2427

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2428
  %sub = sub nsw i32 0, %1, !dbg !2430
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2431
  store i8 1, i8* %u8SignBit, align 1, !dbg !2432
  br label %if.end, !dbg !2433

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2434
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2436
  store i8 0, i8* %u8SignBit, align 1, !dbg !2437
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2438
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2439
  %conv = zext i8 %4 to i32, !dbg !2439
  %mul = mul i32 %3, %conv, !dbg !2440
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2441
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2442
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2443
  %conv1 = zext i8 %6 to i32, !dbg !2443
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2444
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2445
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2446
  %shr = lshr i32 %7, 7, !dbg !2447
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2448
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2449
  %shl = shl i32 %8, 25, !dbg !2450
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2451
  %or = or i32 %9, %shl, !dbg !2451
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2451
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2452
  %conv2 = zext i8 %10 to i32, !dbg !2452
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2454
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2455

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2456
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2459
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2460

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2461
  store i32 %12, i32* %retval, align 4, !dbg !2462
  br label %return, !dbg !2462

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2463
  br label %return, !dbg !2463

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2464
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2467
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2468

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2469
  %sub14 = sub i32 0, %14, !dbg !2470
  store i32 %sub14, i32* %retval, align 4, !dbg !2471
  br label %return, !dbg !2471

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2472
  br label %return, !dbg !2472

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2473
  ret i32 %15, !dbg !2473
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2474 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2477, metadata !DIExpression()), !dbg !2478
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2479, metadata !DIExpression()), !dbg !2480
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2481, metadata !DIExpression()), !dbg !2482
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2483, metadata !DIExpression()), !dbg !2484
  store i32 0, i32* %u32Temp1, align 4, !dbg !2484
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2485, metadata !DIExpression()), !dbg !2486
  store i32 0, i32* %u32Temp2, align 4, !dbg !2486
  %0 = load i8, i8* %power.addr, align 1, !dbg !2487
  %conv = zext i8 %0 to i32, !dbg !2487
  %cmp = icmp sge i32 %conv, 32, !dbg !2489
  br i1 %cmp, label %if.then, label %if.else, !dbg !2490

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2491
  br label %if.end7, !dbg !2493

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2494
  %conv2 = zext i8 %1 to i32, !dbg !2494
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2496
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2497

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2498
  br label %if.end7, !dbg !2500

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2501
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2502
  %mul = mul i32 %2, %3, !dbg !2503
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2504
  %4 = load i32, i32* %value.addr, align 4, !dbg !2505
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2506
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2507
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2508
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2509
  %7 = load i8, i8* %power.addr, align 1, !dbg !2510
  %conv8 = zext i8 %7 to i32, !dbg !2510
  %sub = sub nsw i32 32, %conv8, !dbg !2511
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2512
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2512
  %shr = lshr i32 %6, %sub, !dbg !2512, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2513
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2514
  %9 = load i8, i8* %power.addr, align 1, !dbg !2515
  %conv9 = zext i8 %9 to i32, !dbg !2515
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2516
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2516
  %shl = shl i32 %8, %conv9, !dbg !2516, !klee.check.shift !261
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2517
  %or = or i32 %10, %shl, !dbg !2517
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2517
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2518
  %12 = load i8, i8* %power.addr, align 1, !dbg !2520
  %conv10 = zext i8 %12 to i32, !dbg !2520
  %sub11 = sub nsw i32 32, %conv10, !dbg !2521
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2522
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2522
  %shr12 = lshr i32 %11, %sub11, !dbg !2522, !klee.check.shift !261
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2523
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2524

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2525
  store i32 %13, i32* %retval, align 4, !dbg !2527
  br label %return, !dbg !2527

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2528
  br label %return, !dbg !2528

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2530
  ret i32 %14, !dbg !2530
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2531 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2534, metadata !DIExpression()), !dbg !2535
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2536, metadata !DIExpression()), !dbg !2537
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2538, metadata !DIExpression()), !dbg !2539
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2540, metadata !DIExpression()), !dbg !2541
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2542, metadata !DIExpression()), !dbg !2543
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2544, metadata !DIExpression()), !dbg !2545
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2546, metadata !DIExpression()), !dbg !2547
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2548, metadata !DIExpression()), !dbg !2549
  %0 = load i8, i8* %power.addr, align 1, !dbg !2550
  %conv = zext i8 %0 to i32, !dbg !2550
  %cmp = icmp sge i32 %conv, 32, !dbg !2552
  br i1 %cmp, label %if.then, label %if.else, !dbg !2553

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2554
  br label %if.end7, !dbg !2556

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2557
  %conv2 = zext i8 %1 to i32, !dbg !2557
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2559
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2560

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2561
  br label %if.end7, !dbg !2563

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2564
  %cmp8 = icmp slt i32 %2, 0, !dbg !2566
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2567
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2567

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2568
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2569
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2570
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2570

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2571
  br label %if.end19, !dbg !2573

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2574
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2576
  %cmp20 = icmp slt i32 %6, 0, !dbg !2578
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2579

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2580
  %sub = sub nsw i32 0, %7, !dbg !2582
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2583
  br label %if.end24, !dbg !2584

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2585
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2587
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2588
  %cmp25 = icmp slt i32 %9, 0, !dbg !2590
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2591

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2592
  %sub28 = sub nsw i32 0, %10, !dbg !2594
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2595
  br label %if.end30, !dbg !2596

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2597
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2599
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2600
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2601
  %mul = mul i32 %12, %13, !dbg !2602
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2603
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2604
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2605
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2606
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2607
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2608
  %17 = load i8, i8* %power.addr, align 1, !dbg !2609
  %conv31 = zext i8 %17 to i32, !dbg !2609
  %sub32 = sub nsw i32 32, %conv31, !dbg !2610
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2611
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2611
  %shr = lshr i32 %16, %sub32, !dbg !2611, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2612
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2613
  %19 = load i8, i8* %power.addr, align 1, !dbg !2614
  %conv33 = zext i8 %19 to i32, !dbg !2614
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2615
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2615
  %shl = shl i32 %18, %conv33, !dbg !2615, !klee.check.shift !261
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2616
  %or = or i32 %20, %shl, !dbg !2616
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2616
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2617
  %22 = load i8, i8* %power.addr, align 1, !dbg !2619
  %conv34 = zext i8 %22 to i32, !dbg !2619
  %sub35 = sub nsw i32 32, %conv34, !dbg !2620
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2621
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2621
  %shr36 = lshr i32 %21, %sub35, !dbg !2621, !klee.check.shift !261
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2622
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2623

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2624
  %conv40 = zext i8 %23 to i32, !dbg !2624
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2627
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2628

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2629
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2632
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2633

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2634
  store i32 %25, i32* %retval, align 4, !dbg !2635
  br label %return, !dbg !2635

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2636
  br label %return, !dbg !2636

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2637
  %sub49 = sub i32 0, %26, !dbg !2639
  store i32 %sub49, i32* %retval, align 4, !dbg !2640
  br label %return, !dbg !2640

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2641
  %conv51 = zext i8 %27 to i32, !dbg !2641
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2644
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2645

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2646
  br label %return, !dbg !2646

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2648
  br label %return, !dbg !2648

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2650
  ret i32 %28, !dbg !2650
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2651 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2654, metadata !DIExpression()), !dbg !2655
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2656, metadata !DIExpression()), !dbg !2657
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2658, metadata !DIExpression()), !dbg !2659
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2660, metadata !DIExpression()), !dbg !2661
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2662, metadata !DIExpression()), !dbg !2663
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2664, metadata !DIExpression()), !dbg !2665
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2666, metadata !DIExpression()), !dbg !2667
  %0 = load i32, i32* %value.addr, align 4, !dbg !2668
  %cmp = icmp slt i32 %0, 0, !dbg !2670
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2671

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2672
  %conv = sext i8 %1 to i32, !dbg !2672
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2673
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2674

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2675
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2676
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2677

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2678
  %conv6 = sext i8 %3 to i32, !dbg !2678
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2679
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2680

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2681
  br label %if.end, !dbg !2683

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2684
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2686
  %cmp9 = icmp slt i32 %4, 0, !dbg !2688
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2689

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2690
  %sub = sub nsw i32 0, %5, !dbg !2692
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2693
  br label %if.end13, !dbg !2694

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2695
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2697
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2698
  %conv14 = sext i8 %7 to i32, !dbg !2698
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2700
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2701

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2702
  %conv18 = sext i8 %8 to i32, !dbg !2702
  %sub19 = sub nsw i32 0, %conv18, !dbg !2704
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2705
  br label %if.end22, !dbg !2706

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2707
  %conv21 = sext i8 %9 to i32, !dbg !2707
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2709
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2710
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2711
  %mul = mul i32 %10, %11, !dbg !2712
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2713
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2714
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2715
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2716
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2717
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2718
  %shr = lshr i32 %14, 7, !dbg !2719
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2720
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2721
  %shl = shl i32 %15, 25, !dbg !2722
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2723
  %or = or i32 %16, %shl, !dbg !2723
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2723
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2724
  %conv23 = zext i8 %17 to i32, !dbg !2724
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2726
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2727

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2728
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2731
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2732

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2733
  store i32 %19, i32* %retval, align 4, !dbg !2734
  br label %return, !dbg !2734

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2735
  br label %return, !dbg !2735

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2736
  %sub32 = sub i32 0, %20, !dbg !2738
  store i32 %sub32, i32* %retval, align 4, !dbg !2739
  br label %return, !dbg !2739

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2740
  ret i32 %21, !dbg !2740
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2741 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2742, metadata !DIExpression()), !dbg !2743
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2744, metadata !DIExpression()), !dbg !2745
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2746, metadata !DIExpression()), !dbg !2747
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2748, metadata !DIExpression()), !dbg !2749
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2750, metadata !DIExpression()), !dbg !2751
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2752, metadata !DIExpression()), !dbg !2753
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2754, metadata !DIExpression()), !dbg !2755
  %0 = load i32, i32* %value.addr, align 4, !dbg !2756
  %cmp = icmp slt i32 %0, 0, !dbg !2758
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2759

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2760
  %conv = sext i8 %1 to i32, !dbg !2760
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2761
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2762

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2763
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2764
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2765

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2766
  %conv6 = sext i8 %3 to i32, !dbg !2766
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2767
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2768

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2769
  br label %if.end, !dbg !2771

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2772
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2774
  %cmp9 = icmp slt i32 %4, 0, !dbg !2776
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2777

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2778
  %sub = sub nsw i32 0, %5, !dbg !2780
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2781
  br label %if.end13, !dbg !2782

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2783
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2785
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2786
  %conv14 = sext i8 %7 to i32, !dbg !2786
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2788
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2789

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2790
  %conv18 = sext i8 %8 to i32, !dbg !2790
  %sub19 = sub nsw i32 0, %conv18, !dbg !2792
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2793
  br label %if.end22, !dbg !2794

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2795
  %conv21 = sext i8 %9 to i32, !dbg !2795
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2797
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2798
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2799
  %mul = mul i32 %10, %11, !dbg !2800
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2801
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2802
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2803
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2804
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2805
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2806
  %shr = lshr i32 %14, 6, !dbg !2807
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2808
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2809
  %shl = shl i32 %15, 26, !dbg !2810
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2811
  %or = or i32 %16, %shl, !dbg !2811
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2811
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2812
  %shr23 = lshr i32 %17, 6, !dbg !2814
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2815
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2816

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2817
  %conv27 = zext i8 %18 to i32, !dbg !2817
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2820
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2821

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2822
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2825
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2826

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2827
  store i32 %20, i32* %retval, align 4, !dbg !2828
  br label %return, !dbg !2828

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2829
  br label %return, !dbg !2829

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2830
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2833
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2834

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2835
  %sub39 = sub i32 0, %22, !dbg !2836
  store i32 %sub39, i32* %retval, align 4, !dbg !2837
  br label %return, !dbg !2837

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2838
  br label %return, !dbg !2838

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2839
  br label %return, !dbg !2839

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2841
  ret i32 %23, !dbg !2841
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2842 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2843, metadata !DIExpression()), !dbg !2844
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2845, metadata !DIExpression()), !dbg !2846
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2847, metadata !DIExpression()), !dbg !2848
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2849, metadata !DIExpression()), !dbg !2850
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2851, metadata !DIExpression()), !dbg !2852
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2853, metadata !DIExpression()), !dbg !2854
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2855, metadata !DIExpression()), !dbg !2856
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2857
  %cmp = icmp slt i32 %0, 0, !dbg !2859
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2860
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2860

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2861
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2862
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2863
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2863

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2864
  br label %if.end, !dbg !2866

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2867
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2869
  %cmp5 = icmp slt i32 %4, 0, !dbg !2871
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2872

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2873
  %sub = sub nsw i32 0, %5, !dbg !2875
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2876
  br label %if.end8, !dbg !2877

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2878
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2880
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2881
  %cmp9 = icmp slt i32 %7, 0, !dbg !2883
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2884

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2885
  %sub11 = sub nsw i32 0, %8, !dbg !2887
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2888
  br label %if.end13, !dbg !2889

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2890
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2892
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2893
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2894
  %mul = mul i32 %10, %11, !dbg !2895
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2896
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2897
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2898
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2899
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2900
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2901
  %cmp14 = icmp eq i32 %14, 0, !dbg !2903
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2904

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2905
  %conv = zext i8 %15 to i32, !dbg !2905
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2908
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2909

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2910
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2913
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2914

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2915
  store i32 %17, i32* %retval, align 4, !dbg !2916
  br label %return, !dbg !2916

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2917
  br label %return, !dbg !2917

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2918
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2921
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2922

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2923
  %sub27 = sub i32 0, %19, !dbg !2924
  store i32 %sub27, i32* %retval, align 4, !dbg !2925
  br label %return, !dbg !2925

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2926
  br label %return, !dbg !2926

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2927
  %conv30 = zext i8 %20 to i32, !dbg !2927
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2930
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2931

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2932
  br label %return, !dbg !2932

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2934
  br label %return, !dbg !2934

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2936
  ret i32 %21, !dbg !2936
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2937 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2938, metadata !DIExpression()), !dbg !2939
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2940, metadata !DIExpression()), !dbg !2941
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2942, metadata !DIExpression()), !dbg !2943
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2944, metadata !DIExpression()), !dbg !2945
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2946, metadata !DIExpression()), !dbg !2947
  %0 = load i32, i32* %value.addr, align 4, !dbg !2948
  %cmp = icmp slt i32 %0, 0, !dbg !2950
  br i1 %cmp, label %if.then, label %if.else, !dbg !2951

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2952
  %sub = sub nsw i32 0, %1, !dbg !2954
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2955
  store i8 1, i8* %u8SignBit, align 1, !dbg !2956
  br label %if.end, !dbg !2957

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2958
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2960
  store i8 0, i8* %u8SignBit, align 1, !dbg !2961
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2962
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2963
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2964
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2965
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2966
  %shr = lshr i32 %5, 1, !dbg !2967
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2968
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2969
  %conv = zext i8 %6 to i32, !dbg !2969
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2971
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2972

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2973
  store i32 %7, i32* %retval, align 4, !dbg !2975
  br label %return, !dbg !2975

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2976
  %sub5 = sub i32 0, %8, !dbg !2978
  store i32 %sub5, i32* %retval, align 4, !dbg !2979
  br label %return, !dbg !2979

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2980
  ret i32 %9, !dbg !2980
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2981 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2982, metadata !DIExpression()), !dbg !2983
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2984, metadata !DIExpression()), !dbg !2985
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2986, metadata !DIExpression()), !dbg !2987
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2988, metadata !DIExpression()), !dbg !2989
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2990, metadata !DIExpression()), !dbg !2991
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2992, metadata !DIExpression()), !dbg !2993
  %0 = load i32, i32* %value.addr, align 4, !dbg !2994
  %cmp = icmp slt i32 %0, 0, !dbg !2996
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2997
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2997

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2998
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2999
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3000
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3000

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3001
  br label %if.end, !dbg !3003

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3004
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3006
  %cmp5 = icmp slt i32 %4, 0, !dbg !3008
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3009

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3010
  %sub = sub nsw i32 0, %5, !dbg !3012
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3013
  br label %if.end8, !dbg !3014

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3015
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3017
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3018
  %cmp9 = icmp slt i32 %7, 0, !dbg !3020
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3021

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3022
  %sub11 = sub nsw i32 0, %8, !dbg !3024
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3025
  br label %if.end13, !dbg !3026

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3027
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3029
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3030
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3031
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3032
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3033
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3034
  %conv = zext i8 %12 to i32, !dbg !3034
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3036
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3037

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3038
  store i32 %13, i32* %retval, align 4, !dbg !3040
  br label %return, !dbg !3040

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3041
  %sub18 = sub i32 0, %14, !dbg !3043
  store i32 %sub18, i32* %retval, align 4, !dbg !3044
  br label %return, !dbg !3044

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3045
  ret i32 %15, !dbg !3045
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3046 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3049, metadata !DIExpression()), !dbg !3050
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3051, metadata !DIExpression()), !dbg !3052
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3053, metadata !DIExpression()), !dbg !3054
  store i32 0, i32* %u32Temp1, align 4, !dbg !3054
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3055, metadata !DIExpression()), !dbg !3056
  store i32 0, i32* %u32Temp2, align 4, !dbg !3056
  %0 = load i32, i32* %value.addr, align 4, !dbg !3057
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3058
  %conv = zext i8 %1 to i32, !dbg !3058
  %mul = mul i32 %0, %conv, !dbg !3059
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3060
  %2 = load i32, i32* %value.addr, align 4, !dbg !3061
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3062
  %conv1 = zext i8 %3 to i32, !dbg !3062
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3063
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3064
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3065
  %shr = lshr i32 %4, 8, !dbg !3066
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3067
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3068
  %shl = shl i32 %5, 24, !dbg !3069
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3070
  %or = or i32 %6, %shl, !dbg !3070
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3070
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3071
  ret i32 %7, !dbg !3072
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3073 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3074, metadata !DIExpression()), !dbg !3075
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3076, metadata !DIExpression()), !dbg !3077
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3078, metadata !DIExpression()), !dbg !3079
  store i32 0, i32* %u32Temp1, align 4, !dbg !3079
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3080, metadata !DIExpression()), !dbg !3081
  store i32 0, i32* %u32Temp2, align 4, !dbg !3081
  %0 = load i32, i32* %value.addr, align 4, !dbg !3082
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3083
  %conv = zext i8 %1 to i32, !dbg !3083
  %mul = mul i32 %0, %conv, !dbg !3084
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3085
  %2 = load i32, i32* %value.addr, align 4, !dbg !3086
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3087
  %conv1 = zext i8 %3 to i32, !dbg !3087
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3088
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3089
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3090
  %shr = lshr i32 %4, 7, !dbg !3091
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3092
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3093
  %shl = shl i32 %5, 25, !dbg !3094
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3095
  %or = or i32 %6, %shl, !dbg !3095
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3095
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3096
  %shr2 = lshr i32 %7, 7, !dbg !3098
  %cmp = icmp eq i32 %shr2, 0, !dbg !3099
  br i1 %cmp, label %if.then, label %if.else, !dbg !3100

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3101
  store i32 %8, i32* %retval, align 4, !dbg !3103
  br label %return, !dbg !3103

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3104
  br label %return, !dbg !3104

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3106
  ret i32 %9, !dbg !3106
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3107 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3110, metadata !DIExpression()), !dbg !3111
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3112, metadata !DIExpression()), !dbg !3113
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3114, metadata !DIExpression()), !dbg !3115
  store i32 0, i32* %u32Temp1, align 4, !dbg !3115
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3116, metadata !DIExpression()), !dbg !3117
  store i32 0, i32* %u32Temp2, align 4, !dbg !3117
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3118
  %conv = sext i8 %0 to i32, !dbg !3118
  %cmp = icmp sgt i32 %conv, 0, !dbg !3120
  br i1 %cmp, label %if.then, label %if.else, !dbg !3121

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3122
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3124
  %conv2 = sext i8 %2 to i32, !dbg !3124
  %mul = mul i32 %1, %conv2, !dbg !3125
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3126
  %3 = load i32, i32* %value.addr, align 4, !dbg !3127
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3128
  %conv3 = sext i8 %4 to i32, !dbg !3128
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3129
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3130
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3131
  %shr = lshr i32 %5, 7, !dbg !3132
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3133
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3134
  %shl = shl i32 %6, 25, !dbg !3135
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3136
  %or = or i32 %7, %shl, !dbg !3136
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3136
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3137
  store i32 %8, i32* %retval, align 4, !dbg !3138
  br label %return, !dbg !3138

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3139
  br label %return, !dbg !3139

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3141
  ret i32 %9, !dbg !3141
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3142 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3143, metadata !DIExpression()), !dbg !3144
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3145, metadata !DIExpression()), !dbg !3146
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3147, metadata !DIExpression()), !dbg !3148
  store i32 0, i32* %u32Temp1, align 4, !dbg !3148
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3149, metadata !DIExpression()), !dbg !3150
  store i32 0, i32* %u32Temp2, align 4, !dbg !3150
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3151
  %conv = sext i8 %0 to i32, !dbg !3151
  %cmp = icmp sle i32 %conv, 0, !dbg !3153
  br i1 %cmp, label %if.then, label %if.else, !dbg !3154

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3155
  br label %return, !dbg !3155

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3157
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3159
  %conv2 = sext i8 %2 to i32, !dbg !3159
  %mul = mul i32 %1, %conv2, !dbg !3160
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3161
  %3 = load i32, i32* %value.addr, align 4, !dbg !3162
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3163
  %conv3 = sext i8 %4 to i32, !dbg !3163
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3164
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3165
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3166
  %shr = lshr i32 %5, 6, !dbg !3167
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3168
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3169
  %shl = shl i32 %6, 26, !dbg !3170
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3171
  %or = or i32 %7, %shl, !dbg !3171
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3171
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3172
  %shr4 = lshr i32 %8, 6, !dbg !3174
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3175
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3176

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3177
  store i32 %9, i32* %retval, align 4, !dbg !3179
  br label %return, !dbg !3179

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3180
  br label %return, !dbg !3180

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3182
  ret i32 %10, !dbg !3182
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3183 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3184, metadata !DIExpression()), !dbg !3185
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3186, metadata !DIExpression()), !dbg !3187
  %0 = load i16, i16* %value.addr, align 2, !dbg !3188
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3189
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3190
  ret i16 %call, !dbg !3191
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3192 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3193, metadata !DIExpression()), !dbg !3194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3195, metadata !DIExpression()), !dbg !3196
  %0 = load i16, i16* %value.addr, align 2, !dbg !3197
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3198
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3199
  ret i16 %call, !dbg !3200
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3201 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3202, metadata !DIExpression()), !dbg !3203
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  %0 = load i16, i16* %value.addr, align 2, !dbg !3206
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3207
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3208
  ret i16 %call, !dbg !3209
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3210 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3211, metadata !DIExpression()), !dbg !3212
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  %0 = load i16, i16* %value.addr, align 2, !dbg !3215
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3216
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3217
  ret i16 %call, !dbg !3218
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3219 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3220, metadata !DIExpression()), !dbg !3221
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  %0 = load i16, i16* %value.addr, align 2, !dbg !3224
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3225
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3226
  ret i16 %call, !dbg !3227
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3228 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3229, metadata !DIExpression()), !dbg !3230
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  %0 = load i16, i16* %value.addr, align 2, !dbg !3233
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3234
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3235
  ret i16 %call, !dbg !3236
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3237 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3238, metadata !DIExpression()), !dbg !3239
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  %0 = load i16, i16* %value.addr, align 2, !dbg !3242
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3243
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3244
  ret i16 %call, !dbg !3245
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3246 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3247, metadata !DIExpression()), !dbg !3248
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  %0 = load i16, i16* %value.addr, align 2, !dbg !3251
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3252
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3253
  ret i16 %call, !dbg !3254
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3255 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3256, metadata !DIExpression()), !dbg !3257
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  %0 = load i16, i16* %value.addr, align 2, !dbg !3260
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3261
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3262
  ret i16 %call, !dbg !3263
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3264 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3265, metadata !DIExpression()), !dbg !3266
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  %0 = load i16, i16* %value.addr, align 2, !dbg !3269
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3270
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3271
  ret i16 %call, !dbg !3272
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3273 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3274, metadata !DIExpression()), !dbg !3275
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  %0 = load i16, i16* %value.addr, align 2, !dbg !3278
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3279
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3280
  ret i16 %call, !dbg !3281
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3282 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3283, metadata !DIExpression()), !dbg !3284
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  %0 = load i16, i16* %value.addr, align 2, !dbg !3287
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3288
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3289
  ret i16 %call, !dbg !3290
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3291 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3292, metadata !DIExpression()), !dbg !3293
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  %0 = load i16, i16* %value.addr, align 2, !dbg !3296
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3297
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3298
  ret i16 %call, !dbg !3299
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3300 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3301, metadata !DIExpression()), !dbg !3302
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  %0 = load i16, i16* %value.addr, align 2, !dbg !3305
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3306
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3307
  ret i16 %call, !dbg !3308
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3309 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3310, metadata !DIExpression()), !dbg !3311
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  %0 = load i16, i16* %value.addr, align 2, !dbg !3314
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3315
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3316
  ret i16 %call, !dbg !3317
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3318 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3319, metadata !DIExpression()), !dbg !3320
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  %0 = load i16, i16* %value.addr, align 2, !dbg !3323
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3324
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3325
  %2 = load i16, i16* %retval, align 2, !dbg !3326
  ret i16 %2, !dbg !3326
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3327 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3328, metadata !DIExpression()), !dbg !3329
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  %0 = load i16, i16* %value.addr, align 2, !dbg !3332
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3333
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3334
  ret i16 %call, !dbg !3335
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3336 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3337, metadata !DIExpression()), !dbg !3338
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  %0 = load i16, i16* %value.addr, align 2, !dbg !3341
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3342
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3343
  ret i16 %call, !dbg !3344
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3345 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3346, metadata !DIExpression()), !dbg !3347
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  %0 = load i16, i16* %value.addr, align 2, !dbg !3350
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3351
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3352
  ret i16 %call, !dbg !3353
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3354 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3355, metadata !DIExpression()), !dbg !3356
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  %0 = load i16, i16* %value.addr, align 2, !dbg !3359
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3360
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3361
  ret i16 %call, !dbg !3362
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3363 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3364, metadata !DIExpression()), !dbg !3365
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  %0 = load i16, i16* %value.addr, align 2, !dbg !3368
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3369
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3370
  ret i16 %call, !dbg !3371
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3372 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3373, metadata !DIExpression()), !dbg !3374
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  %0 = load i16, i16* %value.addr, align 2, !dbg !3377
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3378
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3379
  ret i16 %call, !dbg !3380
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3381 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3382, metadata !DIExpression()), !dbg !3383
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  %0 = load i16, i16* %value.addr, align 2, !dbg !3386
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3387
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3388
  ret i16 %call, !dbg !3389
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3390 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3391, metadata !DIExpression()), !dbg !3392
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  %0 = load i16, i16* %value.addr, align 2, !dbg !3395
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3396
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3397
  ret i16 %call, !dbg !3398
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3399 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3400, metadata !DIExpression()), !dbg !3401
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  %0 = load i16, i16* %value.addr, align 2, !dbg !3404
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3405
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3406
  ret i16 %call, !dbg !3407
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3408 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3409, metadata !DIExpression()), !dbg !3410
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  %0 = load i16, i16* %value.addr, align 2, !dbg !3413
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3414
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3415
  ret i16 %call, !dbg !3416
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3417 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3418, metadata !DIExpression()), !dbg !3419
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  %0 = load i16, i16* %value.addr, align 2, !dbg !3422
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3423
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3424
  ret i16 %call, !dbg !3425
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3426 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3427, metadata !DIExpression()), !dbg !3428
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3429, metadata !DIExpression()), !dbg !3430
  %0 = load i16, i16* %value.addr, align 2, !dbg !3431
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3432
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3433
  ret i16 %call, !dbg !3434
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3435 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3436, metadata !DIExpression()), !dbg !3437
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3438, metadata !DIExpression()), !dbg !3439
  %0 = load i16, i16* %value.addr, align 2, !dbg !3440
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3441
  %conv = zext i8 %1 to i16, !dbg !3442
  %conv1 = zext i16 %conv to i32, !dbg !3442
  %shl = shl i32 %conv1, 5, !dbg !3443
  %conv2 = trunc i32 %shl to i16, !dbg !3444
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3445
  ret i16 %call, !dbg !3446
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3447 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3448, metadata !DIExpression()), !dbg !3449
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3450, metadata !DIExpression()), !dbg !3451
  %0 = load i16, i16* %value.addr, align 2, !dbg !3452
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3453
  %conv = zext i8 %1 to i16, !dbg !3454
  %conv1 = zext i16 %conv to i32, !dbg !3454
  %shl = shl i32 %conv1, 6, !dbg !3455
  %conv2 = trunc i32 %shl to i16, !dbg !3456
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3457
  ret i16 %call, !dbg !3458
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3459 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3460, metadata !DIExpression()), !dbg !3461
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3462, metadata !DIExpression()), !dbg !3463
  %0 = load i16, i16* %value.addr, align 2, !dbg !3464
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3465
  %conv = zext i8 %1 to i16, !dbg !3466
  %conv1 = zext i16 %conv to i32, !dbg !3466
  %shl = shl i32 %conv1, 7, !dbg !3467
  %conv2 = trunc i32 %shl to i16, !dbg !3468
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3469
  ret i16 %call, !dbg !3470
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3471 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3472, metadata !DIExpression()), !dbg !3473
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3474, metadata !DIExpression()), !dbg !3475
  %0 = load i16, i16* %value.addr, align 2, !dbg !3476
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3477
  %conv = zext i8 %1 to i16, !dbg !3478
  %conv1 = zext i16 %conv to i32, !dbg !3478
  %shl = shl i32 %conv1, 7, !dbg !3479
  %conv2 = trunc i32 %shl to i16, !dbg !3480
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3481
  ret i16 %call, !dbg !3482
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3483 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3484, metadata !DIExpression()), !dbg !3485
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3486, metadata !DIExpression()), !dbg !3487
  %0 = load i16, i16* %value.addr, align 2, !dbg !3488
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3489
  %conv = zext i8 %1 to i16, !dbg !3490
  %conv1 = zext i16 %conv to i32, !dbg !3490
  %shl = shl i32 %conv1, 4, !dbg !3491
  %conv2 = trunc i32 %shl to i16, !dbg !3492
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3493
  ret i16 %call, !dbg !3494
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3495 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3496, metadata !DIExpression()), !dbg !3497
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3498, metadata !DIExpression()), !dbg !3499
  %0 = load i16, i16* %value.addr, align 2, !dbg !3500
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3501
  %conv = zext i8 %1 to i16, !dbg !3502
  %conv1 = zext i16 %conv to i32, !dbg !3502
  %shl = shl i32 %conv1, 5, !dbg !3503
  %conv2 = trunc i32 %shl to i16, !dbg !3504
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3505
  ret i16 %call, !dbg !3506
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3507 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3508, metadata !DIExpression()), !dbg !3509
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3510, metadata !DIExpression()), !dbg !3511
  %0 = load i16, i16* %value.addr, align 2, !dbg !3512
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3513
  %conv = zext i8 %1 to i16, !dbg !3514
  %conv1 = zext i16 %conv to i32, !dbg !3514
  %shl = shl i32 %conv1, 2, !dbg !3515
  %conv2 = trunc i32 %shl to i16, !dbg !3516
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3517
  ret i16 %call, !dbg !3518
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3519 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3520, metadata !DIExpression()), !dbg !3521
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3522, metadata !DIExpression()), !dbg !3523
  %0 = load i16, i16* %value.addr, align 2, !dbg !3524
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3525
  %conv = zext i8 %1 to i16, !dbg !3526
  %conv1 = zext i16 %conv to i32, !dbg !3526
  %shl = shl i32 %conv1, 6, !dbg !3527
  %conv2 = trunc i32 %shl to i16, !dbg !3528
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3529
  ret i16 %call, !dbg !3530
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3531 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3532, metadata !DIExpression()), !dbg !3533
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3534, metadata !DIExpression()), !dbg !3535
  %0 = load i16, i16* %value.addr, align 2, !dbg !3536
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3537
  %conv = zext i8 %1 to i16, !dbg !3538
  %conv1 = zext i16 %conv to i32, !dbg !3538
  %shl = shl i32 %conv1, 3, !dbg !3539
  %conv2 = trunc i32 %shl to i16, !dbg !3540
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3541
  ret i16 %call, !dbg !3542
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3543 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3544, metadata !DIExpression()), !dbg !3545
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3546, metadata !DIExpression()), !dbg !3547
  %0 = load i32, i32* %value.addr, align 4, !dbg !3548
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3549
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3550
  ret i32 %call, !dbg !3551
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3552 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3555, metadata !DIExpression()), !dbg !3556
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3557, metadata !DIExpression()), !dbg !3558
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3559, metadata !DIExpression()), !dbg !3560
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3561, metadata !DIExpression()), !dbg !3562
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3563, metadata !DIExpression()), !dbg !3564
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3565, metadata !DIExpression()), !dbg !3566
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3567, metadata !DIExpression()), !dbg !3568
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3569, metadata !DIExpression()), !dbg !3570
  %0 = load i32, i32* %value.addr, align 4, !dbg !3571
  %cmp = icmp slt i32 %0, 0, !dbg !3573
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3574

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3575
  %conv = sext i16 %1 to i32, !dbg !3575
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3576
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3577

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3578
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3579
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3580

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3581
  %conv6 = sext i16 %3 to i32, !dbg !3581
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3582
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3583

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3584
  br label %if.end, !dbg !3586

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3587
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3589
  %cmp9 = icmp slt i32 %4, 0, !dbg !3591
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3592

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3593
  %sub = sub nsw i32 0, %5, !dbg !3595
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3596
  br label %if.end13, !dbg !3597

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3598
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3600
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3601
  %conv14 = sext i16 %7 to i32, !dbg !3601
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3603
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3604

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3605
  %conv18 = sext i16 %8 to i32, !dbg !3605
  %sub19 = sub nsw i32 0, %conv18, !dbg !3607
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3608
  br label %if.end22, !dbg !3609

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3610
  %conv21 = sext i16 %9 to i32, !dbg !3610
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3612
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3613
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3614
  %mul = mul i32 %10, %11, !dbg !3615
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3616
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3617
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3618
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3619
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3620
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3621
  %15 = load i32, i32* %count.addr, align 4, !dbg !3622
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3623
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3623
  %shr = lshr i32 %14, %15, !dbg !3623, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3624
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3625
  %17 = load i32, i32* %count.addr, align 4, !dbg !3626
  %sub23 = sub i32 32, %17, !dbg !3627
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3628
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3628
  %shl = shl i32 %16, %sub23, !dbg !3628, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3629
  %or = or i32 %18, %shl, !dbg !3629
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3629
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3630
  %20 = load i32, i32* %count.addr, align 4, !dbg !3632
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3633
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3633
  %shr24 = lshr i32 %19, %20, !dbg !3633, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3634
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3635

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3636
  %conv28 = zext i8 %21 to i32, !dbg !3636
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3639
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3640

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3641
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3644
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3645

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3646
  store i32 %23, i32* %retval, align 4, !dbg !3647
  br label %return, !dbg !3647

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3648
  br label %return, !dbg !3648

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3649
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3652
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3653

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3654
  %sub40 = sub i32 0, %25, !dbg !3655
  store i32 %sub40, i32* %retval, align 4, !dbg !3656
  br label %return, !dbg !3656

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3657
  br label %return, !dbg !3657

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3658
  br label %return, !dbg !3658

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3660
  ret i32 %26, !dbg !3660
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3661 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3662, metadata !DIExpression()), !dbg !3663
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3664, metadata !DIExpression()), !dbg !3665
  %0 = load i32, i32* %value.addr, align 4, !dbg !3666
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3667
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3668
  ret i32 %call, !dbg !3669
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3670 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3673, metadata !DIExpression()), !dbg !3674
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3675, metadata !DIExpression()), !dbg !3676
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3677, metadata !DIExpression()), !dbg !3678
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3679, metadata !DIExpression()), !dbg !3680
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3681, metadata !DIExpression()), !dbg !3682
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3683, metadata !DIExpression()), !dbg !3684
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3685, metadata !DIExpression()), !dbg !3686
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3687, metadata !DIExpression()), !dbg !3688
  %0 = load i32, i32* %value.addr, align 4, !dbg !3689
  %cmp = icmp slt i32 %0, 0, !dbg !3691
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3692

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3693
  %conv = sext i8 %1 to i32, !dbg !3693
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3694
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3695

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3696
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3697
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3698

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3699
  %conv6 = sext i8 %3 to i32, !dbg !3699
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3700
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3701

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3702
  br label %if.end, !dbg !3704

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3705
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3707
  %cmp9 = icmp slt i32 %4, 0, !dbg !3709
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3710

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3711
  %sub = sub nsw i32 0, %5, !dbg !3713
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3714
  br label %if.end13, !dbg !3715

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3716
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3718
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3719
  %conv14 = sext i8 %7 to i32, !dbg !3719
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3721
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3722

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3723
  %conv18 = sext i8 %8 to i32, !dbg !3723
  %sub19 = sub nsw i32 0, %conv18, !dbg !3725
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3726
  br label %if.end22, !dbg !3727

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3728
  %conv21 = sext i8 %9 to i32, !dbg !3728
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3730
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3731
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3732
  %mul = mul i32 %10, %11, !dbg !3733
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3734
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3735
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3736
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3737
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3738
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3739
  %15 = load i32, i32* %count.addr, align 4, !dbg !3740
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3741
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3741
  %shr = lshr i32 %14, %15, !dbg !3741, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3742
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3743
  %17 = load i32, i32* %count.addr, align 4, !dbg !3744
  %sub23 = sub i32 32, %17, !dbg !3745
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3746
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3746
  %shl = shl i32 %16, %sub23, !dbg !3746, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3747
  %or = or i32 %18, %shl, !dbg !3747
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3747
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3748
  %20 = load i32, i32* %count.addr, align 4, !dbg !3750
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3751
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3751
  %shr24 = lshr i32 %19, %20, !dbg !3751, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3752
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3753

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3754
  %conv28 = zext i8 %21 to i32, !dbg !3754
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3757
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3758

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3759
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3762
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3763

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3764
  store i32 %23, i32* %retval, align 4, !dbg !3765
  br label %return, !dbg !3765

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3766
  br label %return, !dbg !3766

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3767
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3770
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3771

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3772
  %sub40 = sub i32 0, %25, !dbg !3773
  store i32 %sub40, i32* %retval, align 4, !dbg !3774
  br label %return, !dbg !3774

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3775
  br label %return, !dbg !3775

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3776
  br label %return, !dbg !3776

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3778
  ret i32 %26, !dbg !3778
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3779 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3780, metadata !DIExpression()), !dbg !3781
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3782, metadata !DIExpression()), !dbg !3783
  %0 = load i32, i32* %value.addr, align 4, !dbg !3784
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3785
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3786
  ret i32 %call, !dbg !3787
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3788 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3791, metadata !DIExpression()), !dbg !3792
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3793, metadata !DIExpression()), !dbg !3794
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3795, metadata !DIExpression()), !dbg !3796
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3797, metadata !DIExpression()), !dbg !3798
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3799, metadata !DIExpression()), !dbg !3800
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3801, metadata !DIExpression()), !dbg !3802
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3803, metadata !DIExpression()), !dbg !3804
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3805, metadata !DIExpression()), !dbg !3806
  %0 = load i32, i32* %value.addr, align 4, !dbg !3807
  %cmp = icmp slt i32 %0, 0, !dbg !3809
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3810

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3811
  %conv = zext i16 %1 to i32, !dbg !3811
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3812
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3813

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3814
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3815
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3816

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3817
  %conv6 = zext i16 %3 to i32, !dbg !3817
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3818
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3819

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3820
  br label %if.end, !dbg !3822

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3823
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3825
  %cmp9 = icmp slt i32 %4, 0, !dbg !3827
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3828

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3829
  %sub = sub nsw i32 0, %5, !dbg !3831
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3832
  br label %if.end13, !dbg !3833

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3834
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3836
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3837
  %conv14 = zext i16 %7 to i32, !dbg !3837
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3839
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3840

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3841
  %conv18 = zext i16 %8 to i32, !dbg !3841
  %sub19 = sub nsw i32 0, %conv18, !dbg !3843
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3844
  br label %if.end22, !dbg !3845

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3846
  %conv21 = zext i16 %9 to i32, !dbg !3846
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3848
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3849
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3850
  %mul = mul i32 %10, %11, !dbg !3851
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3852
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3853
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3854
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3855
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3856
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3857
  %15 = load i32, i32* %count.addr, align 4, !dbg !3858
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3859
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3859
  %shr = lshr i32 %14, %15, !dbg !3859, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3860
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3861
  %17 = load i32, i32* %count.addr, align 4, !dbg !3862
  %sub23 = sub i32 32, %17, !dbg !3863
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3864
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3864
  %shl = shl i32 %16, %sub23, !dbg !3864, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3865
  %or = or i32 %18, %shl, !dbg !3865
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3865
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3866
  %20 = load i32, i32* %count.addr, align 4, !dbg !3868
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3869
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3869
  %shr24 = lshr i32 %19, %20, !dbg !3869, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3870
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3871

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3872
  %conv28 = zext i8 %21 to i32, !dbg !3872
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3875
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3876

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3877
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3880
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3881

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3882
  store i32 %23, i32* %retval, align 4, !dbg !3883
  br label %return, !dbg !3883

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3884
  br label %return, !dbg !3884

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3885
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3888
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3889

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3890
  %sub40 = sub i32 0, %25, !dbg !3891
  store i32 %sub40, i32* %retval, align 4, !dbg !3892
  br label %return, !dbg !3892

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3893
  br label %return, !dbg !3893

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3894
  br label %return, !dbg !3894

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3896
  ret i32 %26, !dbg !3896
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3897 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3898, metadata !DIExpression()), !dbg !3899
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3900, metadata !DIExpression()), !dbg !3901
  %0 = load i32, i32* %value.addr, align 4, !dbg !3902
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3903
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3904
  ret i32 %call, !dbg !3905
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3906 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3909, metadata !DIExpression()), !dbg !3910
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3911, metadata !DIExpression()), !dbg !3912
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3913, metadata !DIExpression()), !dbg !3914
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3915, metadata !DIExpression()), !dbg !3916
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3917, metadata !DIExpression()), !dbg !3918
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3919, metadata !DIExpression()), !dbg !3920
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3921, metadata !DIExpression()), !dbg !3922
  %0 = load i32, i32* %value.addr, align 4, !dbg !3923
  %cmp = icmp slt i32 %0, 0, !dbg !3925
  br i1 %cmp, label %if.then, label %if.else, !dbg !3926

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3927
  %1 = load i32, i32* %value.addr, align 4, !dbg !3929
  %sub = sub nsw i32 0, %1, !dbg !3930
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3931
  br label %if.end, !dbg !3932

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3933
  %2 = load i32, i32* %value.addr, align 4, !dbg !3935
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3936
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3937
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3938
  %conv = zext i8 %4 to i32, !dbg !3938
  %mul = mul i32 %3, %conv, !dbg !3939
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3940
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3941
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3942
  %conv1 = zext i8 %6 to i32, !dbg !3942
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3943
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3944
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3945
  %8 = load i32, i32* %count.addr, align 4, !dbg !3946
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3947
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3947
  %shr = lshr i32 %7, %8, !dbg !3947, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3948
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3949
  %10 = load i32, i32* %count.addr, align 4, !dbg !3950
  %sub2 = sub i32 32, %10, !dbg !3951
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3952
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3952
  %shl = shl i32 %9, %sub2, !dbg !3952, !klee.check.shift !261
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3953
  %or = or i32 %11, %shl, !dbg !3953
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3953
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3954
  %13 = load i32, i32* %count.addr, align 4, !dbg !3956
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3957
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3957
  %shr3 = lshr i32 %12, %13, !dbg !3957, !klee.check.shift !261
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3958
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3959

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3960
  %conv7 = zext i8 %14 to i32, !dbg !3960
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3963
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3964

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3965
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3968
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3969

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3970
  store i32 %16, i32* %retval, align 4, !dbg !3971
  br label %return, !dbg !3971

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3972
  br label %return, !dbg !3972

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3973
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3976
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3977

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3978
  %sub19 = sub i32 0, %18, !dbg !3980
  store i32 %sub19, i32* %retval, align 4, !dbg !3981
  br label %return, !dbg !3981

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3982
  br label %return, !dbg !3982

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3984
  %conv22 = zext i8 %19 to i32, !dbg !3984
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3987
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3988

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3989
  br label %return, !dbg !3989

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3991
  br label %return, !dbg !3991

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3993
  ret i32 %20, !dbg !3993
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3994 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3995, metadata !DIExpression()), !dbg !3996
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3997, metadata !DIExpression()), !dbg !3998
  %0 = load i8, i8* %value.addr, align 1, !dbg !3999
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4000
  %conv = zext i8 %1 to i16, !dbg !4001
  %conv1 = zext i16 %conv to i32, !dbg !4001
  %shl = shl i32 %conv1, 5, !dbg !4002
  %conv2 = trunc i32 %shl to i16, !dbg !4003
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4004
  ret i8 %call, !dbg !4005
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4006 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4007, metadata !DIExpression()), !dbg !4008
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4009, metadata !DIExpression()), !dbg !4010
  %0 = load i8, i8* %value.addr, align 1, !dbg !4011
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4012
  %conv = zext i8 %1 to i16, !dbg !4013
  %conv1 = zext i16 %conv to i32, !dbg !4013
  %shl = shl i32 %conv1, 6, !dbg !4014
  %conv2 = trunc i32 %shl to i16, !dbg !4015
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4016
  ret i8 %call, !dbg !4017
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4018 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4019, metadata !DIExpression()), !dbg !4020
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4021, metadata !DIExpression()), !dbg !4022
  %0 = load i8, i8* %value.addr, align 1, !dbg !4023
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4024
  %conv = zext i8 %1 to i16, !dbg !4025
  %conv1 = zext i16 %conv to i32, !dbg !4025
  %shl = shl i32 %conv1, 7, !dbg !4026
  %conv2 = trunc i32 %shl to i16, !dbg !4027
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4028
  ret i8 %call, !dbg !4029
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4030 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4031, metadata !DIExpression()), !dbg !4032
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4033, metadata !DIExpression()), !dbg !4034
  %0 = load i8, i8* %value.addr, align 1, !dbg !4035
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4036
  %conv = zext i8 %1 to i16, !dbg !4037
  %conv1 = zext i16 %conv to i32, !dbg !4037
  %shl = shl i32 %conv1, 7, !dbg !4038
  %conv2 = trunc i32 %shl to i16, !dbg !4039
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4040
  ret i8 %call, !dbg !4041
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4042 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4043, metadata !DIExpression()), !dbg !4044
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4045, metadata !DIExpression()), !dbg !4046
  %0 = load i8, i8* %value.addr, align 1, !dbg !4047
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4048
  %conv = zext i8 %1 to i16, !dbg !4049
  %conv1 = zext i16 %conv to i32, !dbg !4049
  %shl = shl i32 %conv1, 4, !dbg !4050
  %conv2 = trunc i32 %shl to i16, !dbg !4051
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4052
  ret i8 %call, !dbg !4053
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4054 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4055, metadata !DIExpression()), !dbg !4056
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4057, metadata !DIExpression()), !dbg !4058
  %0 = load i8, i8* %value.addr, align 1, !dbg !4059
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4060
  %conv = zext i8 %1 to i16, !dbg !4061
  %conv1 = zext i16 %conv to i32, !dbg !4061
  %shl = shl i32 %conv1, 5, !dbg !4062
  %conv2 = trunc i32 %shl to i16, !dbg !4063
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4064
  ret i8 %call, !dbg !4065
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4066 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4067, metadata !DIExpression()), !dbg !4068
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4069, metadata !DIExpression()), !dbg !4070
  %0 = load i8, i8* %value.addr, align 1, !dbg !4071
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4072
  %conv = zext i8 %1 to i16, !dbg !4073
  %conv1 = zext i16 %conv to i32, !dbg !4073
  %shl = shl i32 %conv1, 2, !dbg !4074
  %conv2 = trunc i32 %shl to i16, !dbg !4075
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4076
  ret i8 %call, !dbg !4077
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4078 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4079, metadata !DIExpression()), !dbg !4080
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4081, metadata !DIExpression()), !dbg !4082
  %0 = load i8, i8* %value.addr, align 1, !dbg !4083
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4084
  %conv = zext i8 %1 to i16, !dbg !4085
  %conv1 = zext i16 %conv to i32, !dbg !4085
  %shl = shl i32 %conv1, 6, !dbg !4086
  %conv2 = trunc i32 %shl to i16, !dbg !4087
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4088
  ret i8 %call, !dbg !4089
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4090 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4091, metadata !DIExpression()), !dbg !4092
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4093, metadata !DIExpression()), !dbg !4094
  %0 = load i8, i8* %value.addr, align 1, !dbg !4095
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4096
  %conv = zext i8 %1 to i16, !dbg !4097
  %conv1 = zext i16 %conv to i32, !dbg !4097
  %shl = shl i32 %conv1, 3, !dbg !4098
  %conv2 = trunc i32 %shl to i16, !dbg !4099
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4100
  ret i8 %call, !dbg !4101
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4102 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4103, metadata !DIExpression()), !dbg !4104
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4105, metadata !DIExpression()), !dbg !4106
  %0 = load i16, i16* %value.addr, align 2, !dbg !4107
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4108
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4109
  ret i16 %call, !dbg !4110
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4111 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4112, metadata !DIExpression()), !dbg !4113
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4114, metadata !DIExpression()), !dbg !4115
  %0 = load i16, i16* %value.addr, align 2, !dbg !4116
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4117
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4118
  ret i16 %call, !dbg !4119
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4120 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4121, metadata !DIExpression()), !dbg !4122
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4123, metadata !DIExpression()), !dbg !4124
  %0 = load i16, i16* %value.addr, align 2, !dbg !4125
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4126
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4127
  ret i16 %call, !dbg !4128
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4129 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4130, metadata !DIExpression()), !dbg !4131
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4132, metadata !DIExpression()), !dbg !4133
  %0 = load i16, i16* %value.addr, align 2, !dbg !4134
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4135
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4136
  ret i16 %call, !dbg !4137
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4138 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4139, metadata !DIExpression()), !dbg !4140
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4141, metadata !DIExpression()), !dbg !4142
  %0 = load i16, i16* %value.addr, align 2, !dbg !4143
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4144
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4145
  ret i16 %call, !dbg !4146
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4147 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4148, metadata !DIExpression()), !dbg !4149
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4150, metadata !DIExpression()), !dbg !4151
  %0 = load i16, i16* %value.addr, align 2, !dbg !4152
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4153
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4154
  ret i16 %call, !dbg !4155
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4156 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4157, metadata !DIExpression()), !dbg !4158
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4159, metadata !DIExpression()), !dbg !4160
  %0 = load i16, i16* %value.addr, align 2, !dbg !4161
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4162
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4163
  ret i16 %call, !dbg !4164
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4165 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4166, metadata !DIExpression()), !dbg !4167
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4168, metadata !DIExpression()), !dbg !4169
  %0 = load i16, i16* %value.addr, align 2, !dbg !4170
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4171
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4172
  ret i16 %call, !dbg !4173
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4174 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4175, metadata !DIExpression()), !dbg !4176
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4177, metadata !DIExpression()), !dbg !4178
  %0 = load i16, i16* %value.addr, align 2, !dbg !4179
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4180
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4181
  ret i16 %call, !dbg !4182
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4183 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4184, metadata !DIExpression()), !dbg !4185
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4186, metadata !DIExpression()), !dbg !4187
  %0 = load i16, i16* %value.addr, align 2, !dbg !4188
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4189
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4190
  ret i16 %call, !dbg !4191
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4192 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4193, metadata !DIExpression()), !dbg !4194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4195, metadata !DIExpression()), !dbg !4196
  %0 = load i16, i16* %value.addr, align 2, !dbg !4197
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4198
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4199
  ret i16 %call, !dbg !4200
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4201 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4202, metadata !DIExpression()), !dbg !4203
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4204, metadata !DIExpression()), !dbg !4205
  %0 = load i16, i16* %value.addr, align 2, !dbg !4206
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4207
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4208
  ret i16 %call, !dbg !4209
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4210 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4211, metadata !DIExpression()), !dbg !4212
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4213, metadata !DIExpression()), !dbg !4214
  %0 = load i16, i16* %value.addr, align 2, !dbg !4215
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4216
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4217
  ret i16 %call, !dbg !4218
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4219 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4220, metadata !DIExpression()), !dbg !4221
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4222, metadata !DIExpression()), !dbg !4223
  %0 = load i16, i16* %value.addr, align 2, !dbg !4224
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4225
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4226
  ret i16 %call, !dbg !4227
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4228 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4229, metadata !DIExpression()), !dbg !4230
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4231, metadata !DIExpression()), !dbg !4232
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4233
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4234
  %conv = zext i8 %1 to i16, !dbg !4235
  %conv1 = zext i16 %conv to i32, !dbg !4235
  %shl = shl i32 %conv1, 5, !dbg !4236
  %conv2 = trunc i32 %shl to i16, !dbg !4237
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4238
  ret i16 %call, !dbg !4239
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4240 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4241, metadata !DIExpression()), !dbg !4242
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4243, metadata !DIExpression()), !dbg !4244
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4245
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4246
  %conv = zext i8 %1 to i16, !dbg !4247
  %conv1 = zext i16 %conv to i32, !dbg !4247
  %shl = shl i32 %conv1, 6, !dbg !4248
  %conv2 = trunc i32 %shl to i16, !dbg !4249
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4250
  ret i16 %call, !dbg !4251
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4252 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4253, metadata !DIExpression()), !dbg !4254
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4255, metadata !DIExpression()), !dbg !4256
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4257
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4258
  %conv = zext i8 %1 to i16, !dbg !4259
  %conv1 = zext i16 %conv to i32, !dbg !4259
  %shl = shl i32 %conv1, 7, !dbg !4260
  %conv2 = trunc i32 %shl to i16, !dbg !4261
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4262
  ret i16 %call, !dbg !4263
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4264 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4265, metadata !DIExpression()), !dbg !4266
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4267, metadata !DIExpression()), !dbg !4268
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4269
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4270
  %conv = zext i8 %1 to i16, !dbg !4271
  %conv1 = zext i16 %conv to i32, !dbg !4271
  %shl = shl i32 %conv1, 7, !dbg !4272
  %conv2 = trunc i32 %shl to i16, !dbg !4273
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4274
  ret i16 %call, !dbg !4275
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4276 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4277, metadata !DIExpression()), !dbg !4278
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4279, metadata !DIExpression()), !dbg !4280
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4281
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4282
  %conv = zext i8 %1 to i16, !dbg !4283
  %conv1 = zext i16 %conv to i32, !dbg !4283
  %shl = shl i32 %conv1, 4, !dbg !4284
  %conv2 = trunc i32 %shl to i16, !dbg !4285
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4286
  ret i16 %call, !dbg !4287
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4288 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4289, metadata !DIExpression()), !dbg !4290
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4291, metadata !DIExpression()), !dbg !4292
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4293
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4294
  %conv = zext i8 %1 to i16, !dbg !4295
  %conv1 = zext i16 %conv to i32, !dbg !4295
  %shl = shl i32 %conv1, 5, !dbg !4296
  %conv2 = trunc i32 %shl to i16, !dbg !4297
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4298
  ret i16 %call, !dbg !4299
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4300 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4301, metadata !DIExpression()), !dbg !4302
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4303, metadata !DIExpression()), !dbg !4304
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4305
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4306
  %conv = zext i8 %1 to i16, !dbg !4307
  %conv1 = zext i16 %conv to i32, !dbg !4307
  %shl = shl i32 %conv1, 2, !dbg !4308
  %conv2 = trunc i32 %shl to i16, !dbg !4309
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4310
  ret i16 %call, !dbg !4311
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4312 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4313, metadata !DIExpression()), !dbg !4314
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4315, metadata !DIExpression()), !dbg !4316
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4317
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4318
  %conv = zext i8 %1 to i16, !dbg !4319
  %conv1 = zext i16 %conv to i32, !dbg !4319
  %shl = shl i32 %conv1, 6, !dbg !4320
  %conv2 = trunc i32 %shl to i16, !dbg !4321
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4322
  ret i16 %call, !dbg !4323
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4324 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4325, metadata !DIExpression()), !dbg !4326
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4327, metadata !DIExpression()), !dbg !4328
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4329
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4330
  %conv = zext i8 %1 to i16, !dbg !4331
  %conv1 = zext i16 %conv to i32, !dbg !4331
  %shl = shl i32 %conv1, 3, !dbg !4332
  %conv2 = trunc i32 %shl to i16, !dbg !4333
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4334
  ret i16 %call, !dbg !4335
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4336 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4337, metadata !DIExpression()), !dbg !4338
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4339, metadata !DIExpression()), !dbg !4340
  %0 = load i32, i32* %value.addr, align 4, !dbg !4341
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4342
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4343
  ret i32 %call, !dbg !4344
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4345 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4348, metadata !DIExpression()), !dbg !4349
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4350, metadata !DIExpression()), !dbg !4351
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4352, metadata !DIExpression()), !dbg !4353
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4354, metadata !DIExpression()), !dbg !4355
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4356, metadata !DIExpression()), !dbg !4357
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4358, metadata !DIExpression()), !dbg !4359
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4360, metadata !DIExpression()), !dbg !4361
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4362
  %conv = sext i16 %0 to i32, !dbg !4362
  %cmp = icmp slt i32 %conv, 0, !dbg !4364
  br i1 %cmp, label %if.then, label %if.else, !dbg !4365

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4366
  br label %if.end, !dbg !4368

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4369
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4371
  %conv2 = sext i16 %1 to i32, !dbg !4371
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4373
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4374

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4375
  %conv6 = sext i16 %2 to i32, !dbg !4375
  %sub = sub nsw i32 0, %conv6, !dbg !4377
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4378
  br label %if.end9, !dbg !4379

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4380
  %conv8 = sext i16 %3 to i32, !dbg !4380
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4382
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4383
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4384
  %mul = mul i32 %4, %5, !dbg !4385
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4386
  %6 = load i32, i32* %value.addr, align 4, !dbg !4387
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4388
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4389
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4390
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4391
  %9 = load i32, i32* %count.addr, align 4, !dbg !4392
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4393
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4393
  %shr = lshr i32 %8, %9, !dbg !4393, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4394
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4395
  %11 = load i32, i32* %count.addr, align 4, !dbg !4396
  %sub10 = sub i32 32, %11, !dbg !4397
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4398
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4398
  %shl = shl i32 %10, %sub10, !dbg !4398, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4399
  %or = or i32 %12, %shl, !dbg !4399
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4399
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4400
  %14 = load i32, i32* %count.addr, align 4, !dbg !4402
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4403
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4403
  %shr11 = lshr i32 %13, %14, !dbg !4403, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4404
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4405

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4406
  %conv15 = zext i8 %15 to i32, !dbg !4406
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4409
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4410

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4411
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4414
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4415

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4416
  store i32 %17, i32* %retval, align 4, !dbg !4417
  br label %return, !dbg !4417

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4418
  br label %return, !dbg !4418

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4419
  br label %return, !dbg !4419

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4421
  br label %return, !dbg !4421

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4423
  ret i32 %18, !dbg !4423
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4424 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4425, metadata !DIExpression()), !dbg !4426
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4427, metadata !DIExpression()), !dbg !4428
  %0 = load i32, i32* %value.addr, align 4, !dbg !4429
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4430
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4431
  ret i32 %call, !dbg !4432
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4433 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4436, metadata !DIExpression()), !dbg !4437
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4438, metadata !DIExpression()), !dbg !4439
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4440, metadata !DIExpression()), !dbg !4441
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4442, metadata !DIExpression()), !dbg !4443
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4444, metadata !DIExpression()), !dbg !4445
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4446, metadata !DIExpression()), !dbg !4447
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4448
  %cmp = icmp slt i32 %0, 0, !dbg !4450
  br i1 %cmp, label %if.then, label %if.else, !dbg !4451

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4452
  br label %if.end, !dbg !4454

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4455
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4457
  %cmp1 = icmp slt i32 %1, 0, !dbg !4459
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4460

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4461
  %sub = sub nsw i32 0, %2, !dbg !4463
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4464
  br label %if.end4, !dbg !4465

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4466
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4468
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4469
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4470
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4471
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4472
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4473
  %7 = load i32, i32* %count.addr, align 4, !dbg !4474
  %sub5 = sub i32 %7, 32, !dbg !4475
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4476
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4476
  %shr = lshr i32 %6, %sub5, !dbg !4476, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4477
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4478
  %conv = zext i8 %8 to i32, !dbg !4478
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4480
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4481

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4482
  store i32 %9, i32* %retval, align 4, !dbg !4484
  br label %return, !dbg !4484

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4485
  br label %return, !dbg !4485

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4487
  ret i32 %10, !dbg !4487
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4488 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4489, metadata !DIExpression()), !dbg !4490
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4491, metadata !DIExpression()), !dbg !4492
  %0 = load i32, i32* %value.addr, align 4, !dbg !4493
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4494
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4495
  ret i32 %call, !dbg !4496
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4497 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4500, metadata !DIExpression()), !dbg !4501
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4502, metadata !DIExpression()), !dbg !4503
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4504, metadata !DIExpression()), !dbg !4505
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4506, metadata !DIExpression()), !dbg !4507
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4508, metadata !DIExpression()), !dbg !4509
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4510, metadata !DIExpression()), !dbg !4511
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4512, metadata !DIExpression()), !dbg !4513
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4514
  %conv = sext i8 %0 to i32, !dbg !4514
  %cmp = icmp slt i32 %conv, 0, !dbg !4516
  br i1 %cmp, label %if.then, label %if.else, !dbg !4517

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4518
  br label %if.end, !dbg !4520

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4521
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4523
  %conv2 = sext i8 %1 to i32, !dbg !4523
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4525
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4526

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4527
  %conv6 = sext i8 %2 to i32, !dbg !4527
  %sub = sub nsw i32 0, %conv6, !dbg !4529
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4530
  br label %if.end9, !dbg !4531

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4532
  %conv8 = sext i8 %3 to i32, !dbg !4532
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4534
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4535
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4536
  %mul = mul i32 %4, %5, !dbg !4537
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4538
  %6 = load i32, i32* %value.addr, align 4, !dbg !4539
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4540
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4541
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4542
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4543
  %9 = load i32, i32* %count.addr, align 4, !dbg !4544
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4545
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4545
  %shr = lshr i32 %8, %9, !dbg !4545, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4546
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4547
  %11 = load i32, i32* %count.addr, align 4, !dbg !4548
  %sub10 = sub i32 32, %11, !dbg !4549
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4550
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4550
  %shl = shl i32 %10, %sub10, !dbg !4550, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4551
  %or = or i32 %12, %shl, !dbg !4551
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4551
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4552
  %14 = load i32, i32* %count.addr, align 4, !dbg !4554
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4555
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4555
  %shr11 = lshr i32 %13, %14, !dbg !4555, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4556
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4557

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4558
  %conv15 = zext i8 %15 to i32, !dbg !4558
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4561
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4562

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4563
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4566
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4567

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4568
  store i32 %17, i32* %retval, align 4, !dbg !4569
  br label %return, !dbg !4569

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4570
  br label %return, !dbg !4570

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4571
  br label %return, !dbg !4571

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4573
  br label %return, !dbg !4573

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4575
  ret i32 %18, !dbg !4575
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4576 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4577, metadata !DIExpression()), !dbg !4578
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4579, metadata !DIExpression()), !dbg !4580
  %0 = load i32, i32* %value.addr, align 4, !dbg !4581
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4582
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4583
  ret i32 %call, !dbg !4584
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4585 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4586, metadata !DIExpression()), !dbg !4587
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4588, metadata !DIExpression()), !dbg !4589
  %0 = load i32, i32* %value.addr, align 4, !dbg !4590
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4591
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4592
  ret i32 %call, !dbg !4593
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4594 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4597, metadata !DIExpression()), !dbg !4598
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4599, metadata !DIExpression()), !dbg !4600
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4601, metadata !DIExpression()), !dbg !4602
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4603, metadata !DIExpression()), !dbg !4604
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4605, metadata !DIExpression()), !dbg !4606
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4607, metadata !DIExpression()), !dbg !4608
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4609, metadata !DIExpression()), !dbg !4610
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4611, metadata !DIExpression()), !dbg !4612
  %0 = load i32, i32* %value.addr, align 4, !dbg !4613
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4614
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4615
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4616
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4617
  %3 = load i32, i32* %count.addr, align 4, !dbg !4618
  %sub = sub i32 %3, 32, !dbg !4619
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4620
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4620
  %shr = lshr i32 %2, %sub, !dbg !4620, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4621
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4622
  ret i32 %4, !dbg !4623
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4624 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4625, metadata !DIExpression()), !dbg !4626
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4627, metadata !DIExpression()), !dbg !4628
  %0 = load i32, i32* %value.addr, align 4, !dbg !4629
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4630
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4631
  ret i32 %call, !dbg !4632
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4633 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4636, metadata !DIExpression()), !dbg !4637
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4638, metadata !DIExpression()), !dbg !4639
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4640, metadata !DIExpression()), !dbg !4641
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4642, metadata !DIExpression()), !dbg !4643
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4644, metadata !DIExpression()), !dbg !4645
  %0 = load i32, i32* %value.addr, align 4, !dbg !4646
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4647
  %conv = zext i8 %1 to i32, !dbg !4647
  %mul = mul i32 %0, %conv, !dbg !4648
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4649
  %2 = load i32, i32* %value.addr, align 4, !dbg !4650
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4651
  %conv1 = zext i8 %3 to i32, !dbg !4651
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4652
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4653
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4654
  %5 = load i32, i32* %count.addr, align 4, !dbg !4655
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4656
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4656
  %shr = lshr i32 %4, %5, !dbg !4656, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4657
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4658
  %7 = load i32, i32* %count.addr, align 4, !dbg !4659
  %sub = sub i32 32, %7, !dbg !4660
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4661
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4661
  %shl = shl i32 %6, %sub, !dbg !4661, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4662
  %or = or i32 %8, %shl, !dbg !4662
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4662
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4663
  %10 = load i32, i32* %count.addr, align 4, !dbg !4665
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4666
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4666
  %shr2 = lshr i32 %9, %10, !dbg !4666, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !4667
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4668

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4669
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4672
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4673

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4674
  store i32 %12, i32* %retval, align 4, !dbg !4675
  br label %return, !dbg !4675

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4676
  br label %return, !dbg !4676

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4677
  br label %return, !dbg !4677

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4679
  ret i32 %13, !dbg !4679
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4680 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4681, metadata !DIExpression()), !dbg !4682
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4683, metadata !DIExpression()), !dbg !4684
  %0 = load i8, i8* %value.addr, align 1, !dbg !4685
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4686
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4687
  ret i8 %call, !dbg !4688
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4689 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4690, metadata !DIExpression()), !dbg !4691
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4692, metadata !DIExpression()), !dbg !4693
  %0 = load i8, i8* %value.addr, align 1, !dbg !4694
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4695
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4696
  ret i8 %call, !dbg !4697
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4698 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4699, metadata !DIExpression()), !dbg !4700
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4701, metadata !DIExpression()), !dbg !4702
  %0 = load i8, i8* %value.addr, align 1, !dbg !4703
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4704
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4705
  ret i8 %call, !dbg !4706
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4707 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4708, metadata !DIExpression()), !dbg !4709
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  %0 = load i8, i8* %value.addr, align 1, !dbg !4712
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4713
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4714
  ret i8 %call, !dbg !4715
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4716 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4717, metadata !DIExpression()), !dbg !4718
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4719, metadata !DIExpression()), !dbg !4720
  %0 = load i8, i8* %value.addr, align 1, !dbg !4721
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4722
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4723
  ret i8 %call, !dbg !4724
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4725 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4726, metadata !DIExpression()), !dbg !4727
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4728, metadata !DIExpression()), !dbg !4729
  %0 = load i8, i8* %value.addr, align 1, !dbg !4730
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4731
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4732
  ret i8 %call, !dbg !4733
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4734 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4735, metadata !DIExpression()), !dbg !4736
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4737, metadata !DIExpression()), !dbg !4738
  %0 = load i8, i8* %value.addr, align 1, !dbg !4739
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4740
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4741
  ret i8 %call, !dbg !4742
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4743 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4744, metadata !DIExpression()), !dbg !4745
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4746, metadata !DIExpression()), !dbg !4747
  %0 = load i8, i8* %value.addr, align 1, !dbg !4748
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4749
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4750
  ret i8 %call, !dbg !4751
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4752 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4753, metadata !DIExpression()), !dbg !4754
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4755, metadata !DIExpression()), !dbg !4756
  %0 = load i8, i8* %value.addr, align 1, !dbg !4757
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4758
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4759
  ret i8 %call, !dbg !4760
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4761 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4767, metadata !DIExpression()), !dbg !4768
  %2 = icmp eq i64 %0, 0, !dbg !4769
  br i1 %2, label %3, label %4, !dbg !4771

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4772
  unreachable, !dbg !4772

4:                                                ; preds = %1
  ret void, !dbg !4773
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4774 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4780, metadata !DIExpression()), !dbg !4782
  call void @llvm.dbg.value(metadata i64 %1, metadata !4781, metadata !DIExpression()), !dbg !4782
  %3 = icmp ult i64 %1, %0, !dbg !4783
  br i1 %3, label %5, label %4, !dbg !4785

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4786
  unreachable, !dbg !4786

5:                                                ; preds = %2
  ret void, !dbg !4788
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!32, !2, !34, !36}
!llvm.ident = !{!38, !38, !39, !39}
!llvm.module.flags = !{!40, !41, !42, !43, !44}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119/mul_Ccode_alarm_0119.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
!34 = distinct !DICompileUnit(language: DW_LANG_C89, file: !35, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!36 = distinct !DICompileUnit(language: DW_LANG_C89, file: !37, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!38 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!39 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!40 = !{i32 7, !"Dwarf Version", i32 4}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = !{i32 7, !"uwtable", i32 1}
!44 = !{i32 7, !"frame-pointer", i32 2}
!45 = distinct !DISubprogram(name: "main", scope: !46, file: !46, line: 7, type: !47, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!46 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
!47 = !DISubroutineType(types: !48)
!48 = !{!49}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DILocalVariable(name: "val1", scope: !45, file: !46, line: 9, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !53)
!53 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 9, column: 14, scope: !45)
!55 = !DILocalVariable(name: "val2", scope: !45, file: !46, line: 10, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !49)
!58 = !DILocation(line: 10, column: 13, scope: !45)
!59 = !DILocalVariable(name: "result", scope: !45, file: !46, line: 11, type: !56)
!60 = !DILocation(line: 11, column: 13, scope: !45)
!61 = !DILocation(line: 13, column: 24, scope: !45)
!62 = !DILocation(line: 13, column: 5, scope: !45)
!63 = !DILocation(line: 14, column: 24, scope: !45)
!64 = !DILocation(line: 14, column: 5, scope: !45)
!65 = !DILocation(line: 16, column: 30, scope: !45)
!66 = !DILocation(line: 16, column: 36, scope: !45)
!67 = !DILocation(line: 16, column: 14, scope: !45)
!68 = !DILocation(line: 16, column: 12, scope: !45)
!69 = !DILocation(line: 18, column: 11, scope: !45)
!70 = !DILocation(line: 19, column: 5, scope: !45)
!71 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !72, file: !72, line: 43, type: !73, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_u32_s32/alarm_0119")
!73 = !DISubroutineType(types: !74)
!74 = !{!6, !6, !22}
!75 = !DILocalVariable(name: "value", arg: 1, scope: !71, file: !72, line: 43, type: !6)
!76 = !DILocation(line: 43, column: 35, scope: !71)
!77 = !DILocalVariable(name: "factor", arg: 2, scope: !71, file: !72, line: 43, type: !22)
!78 = !DILocation(line: 43, column: 46, scope: !71)
!79 = !DILocalVariable(name: "s32MulTemp1", scope: !71, file: !72, line: 45, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !56)
!81 = !DILocation(line: 45, column: 6, scope: !71)
!82 = !DILocalVariable(name: "s32MulTemp2", scope: !71, file: !72, line: 45, type: !80)
!83 = !DILocation(line: 45, column: 24, scope: !71)
!84 = !DILocation(line: 46, column: 16, scope: !71)
!85 = !DILocation(line: 46, column: 24, scope: !71)
!86 = !DILocation(line: 46, column: 22, scope: !71)
!87 = !DILocation(line: 46, column: 14, scope: !71)
!88 = !DILocation(line: 48, column: 16, scope: !71)
!89 = !DILocation(line: 48, column: 28, scope: !71)
!90 = !DILocation(line: 48, column: 14, scope: !71)
!91 = !DILocation(line: 50, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !71, file: !72, line: 50, column: 5)
!93 = !DILocation(line: 50, column: 17, scope: !92)
!94 = !DILocation(line: 50, column: 21, scope: !92)
!95 = !DILocation(line: 50, column: 25, scope: !92)
!96 = !DILocation(line: 50, column: 37, scope: !92)
!97 = !DILocation(line: 50, column: 46, scope: !92)
!98 = !DILocation(line: 50, column: 5, scope: !71)
!99 = !DILocation(line: 52, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !72, line: 51, column: 2)
!101 = !DILocation(line: 52, column: 29, scope: !100)
!102 = !DILocation(line: 52, column: 15, scope: !100)
!103 = !DILocation(line: 53, column: 14, scope: !100)
!104 = !DILocation(line: 53, column: 10, scope: !100)
!105 = !DILocation(line: 53, column: 3, scope: !100)
!106 = !DILocation(line: 57, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !92, file: !72, line: 56, column: 2)
!108 = !DILocation(line: 57, column: 10, scope: !107)
!109 = !DILocation(line: 57, column: 3, scope: !107)
!110 = !DILocation(line: 59, column: 1, scope: !71)
!111 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !72, file: !72, line: 77, type: !73, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocalVariable(name: "value", arg: 1, scope: !111, file: !72, line: 77, type: !6)
!113 = !DILocation(line: 77, column: 38, scope: !111)
!114 = !DILocalVariable(name: "factor", arg: 2, scope: !111, file: !72, line: 77, type: !22)
!115 = !DILocation(line: 77, column: 49, scope: !111)
!116 = !DILocalVariable(name: "s32MulTemp1", scope: !111, file: !72, line: 79, type: !80)
!117 = !DILocation(line: 79, column: 6, scope: !111)
!118 = !DILocalVariable(name: "s32MulTemp2", scope: !111, file: !72, line: 79, type: !80)
!119 = !DILocation(line: 79, column: 24, scope: !111)
!120 = !DILocation(line: 80, column: 16, scope: !111)
!121 = !DILocation(line: 80, column: 24, scope: !111)
!122 = !DILocation(line: 80, column: 22, scope: !111)
!123 = !DILocation(line: 80, column: 14, scope: !111)
!124 = !DILocation(line: 81, column: 16, scope: !111)
!125 = !DILocation(line: 81, column: 28, scope: !111)
!126 = !DILocation(line: 81, column: 14, scope: !111)
!127 = !DILocation(line: 82, column: 6, scope: !128)
!128 = distinct !DILexicalBlock(scope: !111, file: !72, line: 82, column: 5)
!129 = !DILocation(line: 82, column: 17, scope: !128)
!130 = !DILocation(line: 82, column: 21, scope: !128)
!131 = !DILocation(line: 82, column: 25, scope: !128)
!132 = !DILocation(line: 82, column: 37, scope: !128)
!133 = !DILocation(line: 82, column: 44, scope: !128)
!134 = !DILocation(line: 82, column: 5, scope: !111)
!135 = !DILocation(line: 84, column: 17, scope: !136)
!136 = distinct !DILexicalBlock(scope: !128, file: !72, line: 83, column: 2)
!137 = !DILocation(line: 84, column: 29, scope: !136)
!138 = !DILocation(line: 84, column: 15, scope: !136)
!139 = !DILocation(line: 85, column: 2, scope: !136)
!140 = !DILocation(line: 91, column: 5, scope: !141)
!141 = distinct !DILexicalBlock(scope: !111, file: !72, line: 91, column: 5)
!142 = !DILocation(line: 91, column: 17, scope: !141)
!143 = !DILocation(line: 91, column: 5, scope: !111)
!144 = !DILocation(line: 93, column: 6, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !72, line: 93, column: 6)
!146 = distinct !DILexicalBlock(scope: !141, file: !72, line: 92, column: 2)
!147 = !DILocation(line: 93, column: 18, scope: !145)
!148 = !DILocation(line: 93, column: 6, scope: !146)
!149 = !DILocation(line: 95, column: 15, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !72, line: 94, column: 3)
!151 = !DILocation(line: 95, column: 11, scope: !150)
!152 = !DILocation(line: 95, column: 4, scope: !150)
!153 = !DILocation(line: 99, column: 4, scope: !154)
!154 = distinct !DILexicalBlock(scope: !145, file: !72, line: 98, column: 3)
!155 = !DILocation(line: 104, column: 3, scope: !156)
!156 = distinct !DILexicalBlock(scope: !141, file: !72, line: 103, column: 2)
!157 = !DILocation(line: 106, column: 1, scope: !111)
!158 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !72, file: !72, line: 123, type: !159, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DISubroutineType(types: !160)
!160 = !{!6, !6, !17}
!161 = !DILocalVariable(name: "value", arg: 1, scope: !158, file: !72, line: 123, type: !6)
!162 = !DILocation(line: 123, column: 25, scope: !158)
!163 = !DILocalVariable(name: "factor", arg: 2, scope: !158, file: !72, line: 123, type: !17)
!164 = !DILocation(line: 123, column: 35, scope: !158)
!165 = !DILocalVariable(name: "s32MulTemp1", scope: !158, file: !72, line: 125, type: !80)
!166 = !DILocation(line: 125, column: 6, scope: !158)
!167 = !DILocalVariable(name: "s32MulTemp2", scope: !158, file: !72, line: 125, type: !80)
!168 = !DILocation(line: 125, column: 24, scope: !158)
!169 = !DILocation(line: 126, column: 16, scope: !158)
!170 = !DILocation(line: 126, column: 24, scope: !158)
!171 = !DILocation(line: 126, column: 22, scope: !158)
!172 = !DILocation(line: 126, column: 14, scope: !158)
!173 = !DILocation(line: 127, column: 16, scope: !158)
!174 = !DILocation(line: 127, column: 28, scope: !158)
!175 = !DILocation(line: 127, column: 14, scope: !158)
!176 = !DILocation(line: 128, column: 6, scope: !177)
!177 = distinct !DILexicalBlock(scope: !158, file: !72, line: 128, column: 5)
!178 = !DILocation(line: 128, column: 17, scope: !177)
!179 = !DILocation(line: 128, column: 21, scope: !177)
!180 = !DILocation(line: 128, column: 25, scope: !177)
!181 = !DILocation(line: 128, column: 37, scope: !177)
!182 = !DILocation(line: 128, column: 44, scope: !177)
!183 = !DILocation(line: 128, column: 5, scope: !158)
!184 = !DILocation(line: 130, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !177, file: !72, line: 129, column: 2)
!186 = !DILocation(line: 130, column: 29, scope: !185)
!187 = !DILocation(line: 130, column: 15, scope: !185)
!188 = !DILocation(line: 131, column: 14, scope: !185)
!189 = !DILocation(line: 131, column: 10, scope: !185)
!190 = !DILocation(line: 131, column: 3, scope: !185)
!191 = !DILocation(line: 135, column: 14, scope: !192)
!192 = distinct !DILexicalBlock(scope: !177, file: !72, line: 134, column: 2)
!193 = !DILocation(line: 135, column: 10, scope: !192)
!194 = !DILocation(line: 135, column: 3, scope: !192)
!195 = !DILocation(line: 137, column: 1, scope: !158)
!196 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !72, file: !72, line: 155, type: !159, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!197 = !DILocalVariable(name: "value", arg: 1, scope: !196, file: !72, line: 155, type: !6)
!198 = !DILocation(line: 155, column: 25, scope: !196)
!199 = !DILocalVariable(name: "factor", arg: 2, scope: !196, file: !72, line: 155, type: !17)
!200 = !DILocation(line: 155, column: 35, scope: !196)
!201 = !DILocalVariable(name: "s32MulTemp1", scope: !196, file: !72, line: 157, type: !80)
!202 = !DILocation(line: 157, column: 6, scope: !196)
!203 = !DILocalVariable(name: "s32MulTemp2", scope: !196, file: !72, line: 157, type: !80)
!204 = !DILocation(line: 157, column: 24, scope: !196)
!205 = !DILocation(line: 158, column: 16, scope: !196)
!206 = !DILocation(line: 158, column: 24, scope: !196)
!207 = !DILocation(line: 158, column: 22, scope: !196)
!208 = !DILocation(line: 158, column: 14, scope: !196)
!209 = !DILocation(line: 159, column: 16, scope: !196)
!210 = !DILocation(line: 159, column: 28, scope: !196)
!211 = !DILocation(line: 159, column: 14, scope: !196)
!212 = !DILocation(line: 160, column: 6, scope: !213)
!213 = distinct !DILexicalBlock(scope: !196, file: !72, line: 160, column: 5)
!214 = !DILocation(line: 160, column: 17, scope: !213)
!215 = !DILocation(line: 160, column: 21, scope: !213)
!216 = !DILocation(line: 160, column: 25, scope: !213)
!217 = !DILocation(line: 160, column: 37, scope: !213)
!218 = !DILocation(line: 160, column: 44, scope: !213)
!219 = !DILocation(line: 160, column: 5, scope: !196)
!220 = !DILocation(line: 162, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !213, file: !72, line: 161, column: 2)
!222 = !DILocation(line: 162, column: 29, scope: !221)
!223 = !DILocation(line: 162, column: 15, scope: !221)
!224 = !DILocation(line: 163, column: 2, scope: !221)
!225 = !DILocation(line: 169, column: 5, scope: !226)
!226 = distinct !DILexicalBlock(scope: !196, file: !72, line: 169, column: 5)
!227 = !DILocation(line: 169, column: 17, scope: !226)
!228 = !DILocation(line: 169, column: 5, scope: !196)
!229 = !DILocation(line: 171, column: 6, scope: !230)
!230 = distinct !DILexicalBlock(scope: !231, file: !72, line: 171, column: 6)
!231 = distinct !DILexicalBlock(scope: !226, file: !72, line: 170, column: 2)
!232 = !DILocation(line: 171, column: 18, scope: !230)
!233 = !DILocation(line: 171, column: 6, scope: !231)
!234 = !DILocation(line: 173, column: 15, scope: !235)
!235 = distinct !DILexicalBlock(scope: !230, file: !72, line: 172, column: 3)
!236 = !DILocation(line: 173, column: 11, scope: !235)
!237 = !DILocation(line: 173, column: 4, scope: !235)
!238 = !DILocation(line: 177, column: 4, scope: !239)
!239 = distinct !DILexicalBlock(scope: !230, file: !72, line: 176, column: 3)
!240 = !DILocation(line: 182, column: 3, scope: !241)
!241 = distinct !DILexicalBlock(scope: !226, file: !72, line: 181, column: 2)
!242 = !DILocation(line: 184, column: 1, scope: !196)
!243 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !72, file: !72, line: 200, type: !244, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!244 = !DISubroutineType(types: !245)
!245 = !{!13, !13, !13, !80}
!246 = !DILocalVariable(name: "value", arg: 1, scope: !243, file: !72, line: 200, type: !13)
!247 = !DILocation(line: 200, column: 40, scope: !243)
!248 = !DILocalVariable(name: "factor", arg: 2, scope: !243, file: !72, line: 200, type: !13)
!249 = !DILocation(line: 200, column: 51, scope: !243)
!250 = !DILocalVariable(name: "count", arg: 3, scope: !243, file: !72, line: 200, type: !80)
!251 = !DILocation(line: 200, column: 63, scope: !243)
!252 = !DILocalVariable(name: "s32MulTemp", scope: !243, file: !72, line: 202, type: !80)
!253 = !DILocation(line: 202, column: 6, scope: !243)
!254 = !DILocation(line: 203, column: 15, scope: !243)
!255 = !DILocation(line: 203, column: 23, scope: !243)
!256 = !DILocation(line: 203, column: 21, scope: !243)
!257 = !DILocation(line: 203, column: 13, scope: !243)
!258 = !DILocation(line: 204, column: 15, scope: !243)
!259 = !DILocation(line: 204, column: 26, scope: !243)
!260 = !DILocation(line: 204, column: 25, scope: !243)
!261 = !{!"True"}
!262 = !DILocation(line: 204, column: 13, scope: !243)
!263 = !DILocation(line: 205, column: 9, scope: !243)
!264 = !DILocation(line: 205, column: 2, scope: !243)
!265 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !72, file: !72, line: 223, type: !244, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!266 = !DILocalVariable(name: "value", arg: 1, scope: !265, file: !72, line: 223, type: !13)
!267 = !DILocation(line: 223, column: 43, scope: !265)
!268 = !DILocalVariable(name: "factor", arg: 2, scope: !265, file: !72, line: 223, type: !13)
!269 = !DILocation(line: 223, column: 54, scope: !265)
!270 = !DILocalVariable(name: "count", arg: 3, scope: !265, file: !72, line: 223, type: !80)
!271 = !DILocation(line: 223, column: 66, scope: !265)
!272 = !DILocalVariable(name: "s32MulTemp", scope: !265, file: !72, line: 225, type: !80)
!273 = !DILocation(line: 225, column: 6, scope: !265)
!274 = !DILocation(line: 226, column: 15, scope: !265)
!275 = !DILocation(line: 226, column: 23, scope: !265)
!276 = !DILocation(line: 226, column: 21, scope: !265)
!277 = !DILocation(line: 226, column: 13, scope: !265)
!278 = !DILocation(line: 227, column: 15, scope: !265)
!279 = !DILocation(line: 227, column: 26, scope: !265)
!280 = !DILocation(line: 227, column: 25, scope: !265)
!281 = !DILocation(line: 227, column: 13, scope: !265)
!282 = !DILocation(line: 228, column: 5, scope: !283)
!283 = distinct !DILexicalBlock(scope: !265, file: !72, line: 228, column: 5)
!284 = !DILocation(line: 228, column: 16, scope: !283)
!285 = !DILocation(line: 228, column: 5, scope: !265)
!286 = !DILocation(line: 230, column: 6, scope: !287)
!287 = distinct !DILexicalBlock(scope: !288, file: !72, line: 230, column: 6)
!288 = distinct !DILexicalBlock(scope: !283, file: !72, line: 229, column: 2)
!289 = !DILocation(line: 230, column: 17, scope: !287)
!290 = !DILocation(line: 230, column: 6, scope: !288)
!291 = !DILocation(line: 232, column: 16, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !72, line: 231, column: 3)
!293 = !DILocation(line: 232, column: 11, scope: !292)
!294 = !DILocation(line: 232, column: 4, scope: !292)
!295 = !DILocation(line: 236, column: 4, scope: !296)
!296 = distinct !DILexicalBlock(scope: !287, file: !72, line: 235, column: 3)
!297 = !DILocation(line: 241, column: 3, scope: !298)
!298 = distinct !DILexicalBlock(scope: !283, file: !72, line: 240, column: 2)
!299 = !DILocation(line: 243, column: 1, scope: !265)
!300 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !72, file: !72, line: 262, type: !301, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!301 = !DISubroutineType(types: !302)
!302 = !{!13, !13, !13}
!303 = !DILocalVariable(name: "value", arg: 1, scope: !300, file: !72, line: 262, type: !13)
!304 = !DILocation(line: 262, column: 30, scope: !300)
!305 = !DILocalVariable(name: "factor", arg: 2, scope: !300, file: !72, line: 262, type: !13)
!306 = !DILocation(line: 262, column: 41, scope: !300)
!307 = !DILocalVariable(name: "s32MulTemp1", scope: !300, file: !72, line: 264, type: !80)
!308 = !DILocation(line: 264, column: 6, scope: !300)
!309 = !DILocalVariable(name: "s32MulTemp2", scope: !300, file: !72, line: 264, type: !80)
!310 = !DILocation(line: 264, column: 24, scope: !300)
!311 = !DILocation(line: 265, column: 16, scope: !300)
!312 = !DILocation(line: 265, column: 24, scope: !300)
!313 = !DILocation(line: 265, column: 22, scope: !300)
!314 = !DILocation(line: 265, column: 14, scope: !300)
!315 = !DILocation(line: 266, column: 16, scope: !300)
!316 = !DILocation(line: 266, column: 28, scope: !300)
!317 = !DILocation(line: 266, column: 14, scope: !300)
!318 = !DILocation(line: 267, column: 6, scope: !319)
!319 = distinct !DILexicalBlock(scope: !300, file: !72, line: 267, column: 5)
!320 = !DILocation(line: 267, column: 17, scope: !319)
!321 = !DILocation(line: 267, column: 21, scope: !319)
!322 = !DILocation(line: 267, column: 25, scope: !319)
!323 = !DILocation(line: 267, column: 37, scope: !319)
!324 = !DILocation(line: 267, column: 46, scope: !319)
!325 = !DILocation(line: 267, column: 5, scope: !300)
!326 = !DILocation(line: 269, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !319, file: !72, line: 268, column: 2)
!328 = !DILocation(line: 269, column: 29, scope: !327)
!329 = !DILocation(line: 269, column: 15, scope: !327)
!330 = !DILocation(line: 271, column: 2, scope: !327)
!331 = !DILocation(line: 277, column: 5, scope: !332)
!332 = distinct !DILexicalBlock(scope: !300, file: !72, line: 277, column: 5)
!333 = !DILocation(line: 277, column: 17, scope: !332)
!334 = !DILocation(line: 277, column: 5, scope: !300)
!335 = !DILocation(line: 279, column: 15, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !72, line: 278, column: 2)
!337 = !DILocation(line: 279, column: 10, scope: !336)
!338 = !DILocation(line: 279, column: 3, scope: !336)
!339 = !DILocation(line: 283, column: 3, scope: !340)
!340 = distinct !DILexicalBlock(scope: !332, file: !72, line: 282, column: 2)
!341 = !DILocation(line: 285, column: 1, scope: !300)
!342 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !72, file: !72, line: 304, type: !301, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!343 = !DILocalVariable(name: "value", arg: 1, scope: !342, file: !72, line: 304, type: !13)
!344 = !DILocation(line: 304, column: 30, scope: !342)
!345 = !DILocalVariable(name: "factor", arg: 2, scope: !342, file: !72, line: 304, type: !13)
!346 = !DILocation(line: 304, column: 41, scope: !342)
!347 = !DILocalVariable(name: "s32MulTemp1", scope: !342, file: !72, line: 306, type: !80)
!348 = !DILocation(line: 306, column: 6, scope: !342)
!349 = !DILocalVariable(name: "s32MulTemp2", scope: !342, file: !72, line: 306, type: !80)
!350 = !DILocation(line: 306, column: 24, scope: !342)
!351 = !DILocation(line: 307, column: 16, scope: !342)
!352 = !DILocation(line: 307, column: 24, scope: !342)
!353 = !DILocation(line: 307, column: 22, scope: !342)
!354 = !DILocation(line: 307, column: 14, scope: !342)
!355 = !DILocation(line: 308, column: 16, scope: !342)
!356 = !DILocation(line: 308, column: 28, scope: !342)
!357 = !DILocation(line: 308, column: 14, scope: !342)
!358 = !DILocation(line: 309, column: 6, scope: !359)
!359 = distinct !DILexicalBlock(scope: !342, file: !72, line: 309, column: 5)
!360 = !DILocation(line: 309, column: 17, scope: !359)
!361 = !DILocation(line: 309, column: 21, scope: !359)
!362 = !DILocation(line: 309, column: 25, scope: !359)
!363 = !DILocation(line: 309, column: 37, scope: !359)
!364 = !DILocation(line: 309, column: 46, scope: !359)
!365 = !DILocation(line: 309, column: 5, scope: !342)
!366 = !DILocation(line: 311, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !359, file: !72, line: 310, column: 2)
!368 = !DILocation(line: 311, column: 29, scope: !367)
!369 = !DILocation(line: 311, column: 15, scope: !367)
!370 = !DILocation(line: 312, column: 2, scope: !367)
!371 = !DILocation(line: 318, column: 6, scope: !372)
!372 = distinct !DILexicalBlock(scope: !342, file: !72, line: 318, column: 6)
!373 = !DILocation(line: 318, column: 18, scope: !372)
!374 = !DILocation(line: 318, column: 6, scope: !342)
!375 = !DILocation(line: 320, column: 6, scope: !376)
!376 = distinct !DILexicalBlock(scope: !377, file: !72, line: 320, column: 6)
!377 = distinct !DILexicalBlock(scope: !372, file: !72, line: 319, column: 2)
!378 = !DILocation(line: 320, column: 18, scope: !376)
!379 = !DILocation(line: 320, column: 6, scope: !377)
!380 = !DILocation(line: 322, column: 16, scope: !381)
!381 = distinct !DILexicalBlock(scope: !376, file: !72, line: 321, column: 3)
!382 = !DILocation(line: 322, column: 11, scope: !381)
!383 = !DILocation(line: 322, column: 4, scope: !381)
!384 = !DILocation(line: 326, column: 4, scope: !385)
!385 = distinct !DILexicalBlock(scope: !376, file: !72, line: 325, column: 3)
!386 = !DILocation(line: 331, column: 3, scope: !387)
!387 = distinct !DILexicalBlock(scope: !372, file: !72, line: 330, column: 2)
!388 = !DILocation(line: 333, column: 1, scope: !342)
!389 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !72, file: !72, line: 350, type: !390, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!390 = !DISubroutineType(types: !391)
!391 = !{!13, !13, !22}
!392 = !DILocalVariable(name: "value", arg: 1, scope: !389, file: !72, line: 350, type: !13)
!393 = !DILocation(line: 350, column: 39, scope: !389)
!394 = !DILocalVariable(name: "factor", arg: 2, scope: !389, file: !72, line: 350, type: !22)
!395 = !DILocation(line: 350, column: 50, scope: !389)
!396 = !DILocalVariable(name: "s32MulTemp1", scope: !389, file: !72, line: 352, type: !80)
!397 = !DILocation(line: 352, column: 6, scope: !389)
!398 = !DILocalVariable(name: "s32MulTemp2", scope: !389, file: !72, line: 352, type: !80)
!399 = !DILocation(line: 352, column: 24, scope: !389)
!400 = !DILocation(line: 353, column: 16, scope: !389)
!401 = !DILocation(line: 353, column: 24, scope: !389)
!402 = !DILocation(line: 353, column: 22, scope: !389)
!403 = !DILocation(line: 353, column: 14, scope: !389)
!404 = !DILocation(line: 354, column: 16, scope: !389)
!405 = !DILocation(line: 354, column: 28, scope: !389)
!406 = !DILocation(line: 354, column: 14, scope: !389)
!407 = !DILocation(line: 355, column: 6, scope: !408)
!408 = distinct !DILexicalBlock(scope: !389, file: !72, line: 355, column: 5)
!409 = !DILocation(line: 355, column: 17, scope: !408)
!410 = !DILocation(line: 355, column: 21, scope: !408)
!411 = !DILocation(line: 355, column: 25, scope: !408)
!412 = !DILocation(line: 355, column: 37, scope: !408)
!413 = !DILocation(line: 355, column: 46, scope: !408)
!414 = !DILocation(line: 355, column: 5, scope: !389)
!415 = !DILocation(line: 361, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !408, file: !72, line: 360, column: 2)
!417 = !DILocation(line: 361, column: 29, scope: !416)
!418 = !DILocation(line: 361, column: 15, scope: !416)
!419 = !DILocation(line: 362, column: 15, scope: !416)
!420 = !DILocation(line: 362, column: 10, scope: !416)
!421 = !DILocation(line: 362, column: 3, scope: !416)
!422 = !DILocation(line: 366, column: 15, scope: !423)
!423 = distinct !DILexicalBlock(scope: !408, file: !72, line: 365, column: 2)
!424 = !DILocation(line: 366, column: 10, scope: !423)
!425 = !DILocation(line: 366, column: 3, scope: !423)
!426 = !DILocation(line: 368, column: 1, scope: !389)
!427 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !72, file: !72, line: 386, type: !390, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!428 = !DILocalVariable(name: "value", arg: 1, scope: !427, file: !72, line: 386, type: !13)
!429 = !DILocation(line: 386, column: 42, scope: !427)
!430 = !DILocalVariable(name: "factor", arg: 2, scope: !427, file: !72, line: 386, type: !22)
!431 = !DILocation(line: 386, column: 53, scope: !427)
!432 = !DILocalVariable(name: "s32MulTemp1", scope: !427, file: !72, line: 388, type: !80)
!433 = !DILocation(line: 388, column: 6, scope: !427)
!434 = !DILocalVariable(name: "s32MulTemp2", scope: !427, file: !72, line: 388, type: !80)
!435 = !DILocation(line: 388, column: 24, scope: !427)
!436 = !DILocation(line: 389, column: 16, scope: !427)
!437 = !DILocation(line: 389, column: 24, scope: !427)
!438 = !DILocation(line: 389, column: 22, scope: !427)
!439 = !DILocation(line: 389, column: 14, scope: !427)
!440 = !DILocation(line: 390, column: 16, scope: !427)
!441 = !DILocation(line: 390, column: 28, scope: !427)
!442 = !DILocation(line: 390, column: 14, scope: !427)
!443 = !DILocation(line: 391, column: 6, scope: !444)
!444 = distinct !DILexicalBlock(scope: !427, file: !72, line: 391, column: 5)
!445 = !DILocation(line: 391, column: 17, scope: !444)
!446 = !DILocation(line: 391, column: 21, scope: !444)
!447 = !DILocation(line: 391, column: 25, scope: !444)
!448 = !DILocation(line: 391, column: 37, scope: !444)
!449 = !DILocation(line: 391, column: 44, scope: !444)
!450 = !DILocation(line: 391, column: 5, scope: !427)
!451 = !DILocation(line: 398, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !444, file: !72, line: 397, column: 2)
!453 = !DILocation(line: 398, column: 29, scope: !452)
!454 = !DILocation(line: 398, column: 15, scope: !452)
!455 = !DILocation(line: 399, column: 2, scope: !452)
!456 = !DILocation(line: 404, column: 5, scope: !457)
!457 = distinct !DILexicalBlock(scope: !427, file: !72, line: 404, column: 5)
!458 = !DILocation(line: 404, column: 17, scope: !457)
!459 = !DILocation(line: 404, column: 5, scope: !427)
!460 = !DILocation(line: 406, column: 6, scope: !461)
!461 = distinct !DILexicalBlock(scope: !462, file: !72, line: 406, column: 6)
!462 = distinct !DILexicalBlock(scope: !457, file: !72, line: 405, column: 2)
!463 = !DILocation(line: 406, column: 18, scope: !461)
!464 = !DILocation(line: 406, column: 6, scope: !462)
!465 = !DILocation(line: 408, column: 16, scope: !466)
!466 = distinct !DILexicalBlock(scope: !461, file: !72, line: 407, column: 3)
!467 = !DILocation(line: 408, column: 11, scope: !466)
!468 = !DILocation(line: 408, column: 4, scope: !466)
!469 = !DILocation(line: 412, column: 4, scope: !470)
!470 = distinct !DILexicalBlock(scope: !461, file: !72, line: 411, column: 3)
!471 = !DILocation(line: 417, column: 3, scope: !472)
!472 = distinct !DILexicalBlock(scope: !457, file: !72, line: 416, column: 2)
!473 = !DILocation(line: 419, column: 1, scope: !427)
!474 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !72, file: !72, line: 436, type: !475, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!475 = !DISubroutineType(types: !476)
!476 = !{!13, !13, !17}
!477 = !DILocalVariable(name: "value", arg: 1, scope: !474, file: !72, line: 436, type: !13)
!478 = !DILocation(line: 436, column: 29, scope: !474)
!479 = !DILocalVariable(name: "factor", arg: 2, scope: !474, file: !72, line: 436, type: !17)
!480 = !DILocation(line: 436, column: 39, scope: !474)
!481 = !DILocalVariable(name: "s32MulTemp1", scope: !474, file: !72, line: 438, type: !80)
!482 = !DILocation(line: 438, column: 6, scope: !474)
!483 = !DILocalVariable(name: "s32MulTemp2", scope: !474, file: !72, line: 438, type: !80)
!484 = !DILocation(line: 438, column: 24, scope: !474)
!485 = !DILocation(line: 439, column: 16, scope: !474)
!486 = !DILocation(line: 439, column: 24, scope: !474)
!487 = !DILocation(line: 439, column: 22, scope: !474)
!488 = !DILocation(line: 439, column: 14, scope: !474)
!489 = !DILocation(line: 440, column: 16, scope: !474)
!490 = !DILocation(line: 440, column: 28, scope: !474)
!491 = !DILocation(line: 440, column: 14, scope: !474)
!492 = !DILocation(line: 441, column: 6, scope: !493)
!493 = distinct !DILexicalBlock(scope: !474, file: !72, line: 441, column: 5)
!494 = !DILocation(line: 441, column: 17, scope: !493)
!495 = !DILocation(line: 441, column: 21, scope: !493)
!496 = !DILocation(line: 441, column: 25, scope: !493)
!497 = !DILocation(line: 441, column: 37, scope: !493)
!498 = !DILocation(line: 441, column: 44, scope: !493)
!499 = !DILocation(line: 441, column: 5, scope: !474)
!500 = !DILocation(line: 448, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !493, file: !72, line: 447, column: 2)
!502 = !DILocation(line: 448, column: 29, scope: !501)
!503 = !DILocation(line: 448, column: 15, scope: !501)
!504 = !DILocation(line: 449, column: 10, scope: !501)
!505 = !DILocation(line: 449, column: 3, scope: !501)
!506 = !DILocation(line: 453, column: 10, scope: !507)
!507 = distinct !DILexicalBlock(scope: !493, file: !72, line: 452, column: 2)
!508 = !DILocation(line: 453, column: 3, scope: !507)
!509 = !DILocation(line: 455, column: 1, scope: !474)
!510 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !72, file: !72, line: 473, type: !475, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!511 = !DILocalVariable(name: "value", arg: 1, scope: !510, file: !72, line: 473, type: !13)
!512 = !DILocation(line: 473, column: 29, scope: !510)
!513 = !DILocalVariable(name: "factor", arg: 2, scope: !510, file: !72, line: 473, type: !17)
!514 = !DILocation(line: 473, column: 39, scope: !510)
!515 = !DILocalVariable(name: "s32MulTemp1", scope: !510, file: !72, line: 475, type: !80)
!516 = !DILocation(line: 475, column: 6, scope: !510)
!517 = !DILocalVariable(name: "s32MulTemp2", scope: !510, file: !72, line: 475, type: !80)
!518 = !DILocation(line: 475, column: 24, scope: !510)
!519 = !DILocation(line: 476, column: 16, scope: !510)
!520 = !DILocation(line: 476, column: 24, scope: !510)
!521 = !DILocation(line: 476, column: 22, scope: !510)
!522 = !DILocation(line: 476, column: 14, scope: !510)
!523 = !DILocation(line: 477, column: 16, scope: !510)
!524 = !DILocation(line: 477, column: 28, scope: !510)
!525 = !DILocation(line: 477, column: 14, scope: !510)
!526 = !DILocation(line: 478, column: 6, scope: !527)
!527 = distinct !DILexicalBlock(scope: !510, file: !72, line: 478, column: 5)
!528 = !DILocation(line: 478, column: 17, scope: !527)
!529 = !DILocation(line: 478, column: 21, scope: !527)
!530 = !DILocation(line: 478, column: 25, scope: !527)
!531 = !DILocation(line: 478, column: 37, scope: !527)
!532 = !DILocation(line: 478, column: 44, scope: !527)
!533 = !DILocation(line: 478, column: 5, scope: !510)
!534 = !DILocation(line: 484, column: 17, scope: !535)
!535 = distinct !DILexicalBlock(scope: !527, file: !72, line: 483, column: 2)
!536 = !DILocation(line: 484, column: 29, scope: !535)
!537 = !DILocation(line: 484, column: 15, scope: !535)
!538 = !DILocation(line: 485, column: 2, scope: !535)
!539 = !DILocation(line: 491, column: 6, scope: !540)
!540 = distinct !DILexicalBlock(scope: !510, file: !72, line: 491, column: 6)
!541 = !DILocation(line: 491, column: 18, scope: !540)
!542 = !DILocation(line: 491, column: 6, scope: !510)
!543 = !DILocation(line: 493, column: 6, scope: !544)
!544 = distinct !DILexicalBlock(scope: !545, file: !72, line: 493, column: 6)
!545 = distinct !DILexicalBlock(scope: !540, file: !72, line: 492, column: 2)
!546 = !DILocation(line: 493, column: 18, scope: !544)
!547 = !DILocation(line: 493, column: 6, scope: !545)
!548 = !DILocation(line: 495, column: 16, scope: !549)
!549 = distinct !DILexicalBlock(scope: !544, file: !72, line: 494, column: 3)
!550 = !DILocation(line: 495, column: 11, scope: !549)
!551 = !DILocation(line: 495, column: 4, scope: !549)
!552 = !DILocation(line: 499, column: 4, scope: !553)
!553 = distinct !DILexicalBlock(scope: !544, file: !72, line: 498, column: 3)
!554 = !DILocation(line: 504, column: 3, scope: !555)
!555 = distinct !DILexicalBlock(scope: !540, file: !72, line: 503, column: 2)
!556 = !DILocation(line: 506, column: 1, scope: !510)
!557 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !72, file: !72, line: 521, type: !390, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!558 = !DILocalVariable(name: "value", arg: 1, scope: !557, file: !72, line: 521, type: !13)
!559 = !DILocation(line: 521, column: 25, scope: !557)
!560 = !DILocalVariable(name: "factor", arg: 2, scope: !557, file: !72, line: 521, type: !22)
!561 = !DILocation(line: 521, column: 36, scope: !557)
!562 = !DILocalVariable(name: "s32MulTemp", scope: !557, file: !72, line: 523, type: !80)
!563 = !DILocation(line: 523, column: 6, scope: !557)
!564 = !DILocation(line: 524, column: 15, scope: !557)
!565 = !DILocation(line: 524, column: 23, scope: !557)
!566 = !DILocation(line: 524, column: 21, scope: !557)
!567 = !DILocation(line: 524, column: 13, scope: !557)
!568 = !DILocation(line: 525, column: 5, scope: !569)
!569 = distinct !DILexicalBlock(scope: !557, file: !72, line: 525, column: 5)
!570 = !DILocation(line: 525, column: 16, scope: !569)
!571 = !DILocation(line: 525, column: 5, scope: !557)
!572 = !DILocation(line: 527, column: 6, scope: !573)
!573 = distinct !DILexicalBlock(scope: !574, file: !72, line: 527, column: 6)
!574 = distinct !DILexicalBlock(scope: !569, file: !72, line: 526, column: 2)
!575 = !DILocation(line: 527, column: 17, scope: !573)
!576 = !DILocation(line: 527, column: 6, scope: !574)
!577 = !DILocation(line: 529, column: 16, scope: !578)
!578 = distinct !DILexicalBlock(scope: !573, file: !72, line: 528, column: 3)
!579 = !DILocation(line: 529, column: 11, scope: !578)
!580 = !DILocation(line: 529, column: 4, scope: !578)
!581 = !DILocation(line: 533, column: 4, scope: !582)
!582 = distinct !DILexicalBlock(scope: !573, file: !72, line: 532, column: 3)
!583 = !DILocation(line: 538, column: 3, scope: !584)
!584 = distinct !DILexicalBlock(scope: !569, file: !72, line: 537, column: 2)
!585 = !DILocation(line: 540, column: 1, scope: !557)
!586 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !72, file: !72, line: 556, type: !587, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!587 = !DISubroutineType(types: !588)
!588 = !{!13, !13, !22, !80}
!589 = !DILocalVariable(name: "value", arg: 1, scope: !586, file: !72, line: 556, type: !13)
!590 = !DILocation(line: 556, column: 40, scope: !586)
!591 = !DILocalVariable(name: "factor", arg: 2, scope: !586, file: !72, line: 556, type: !22)
!592 = !DILocation(line: 556, column: 50, scope: !586)
!593 = !DILocalVariable(name: "count", arg: 3, scope: !586, file: !72, line: 556, type: !80)
!594 = !DILocation(line: 556, column: 61, scope: !586)
!595 = !DILocalVariable(name: "s32MulTemp", scope: !586, file: !72, line: 558, type: !80)
!596 = !DILocation(line: 558, column: 6, scope: !586)
!597 = !DILocation(line: 559, column: 15, scope: !586)
!598 = !DILocation(line: 559, column: 23, scope: !586)
!599 = !DILocation(line: 559, column: 21, scope: !586)
!600 = !DILocation(line: 559, column: 13, scope: !586)
!601 = !DILocation(line: 560, column: 15, scope: !586)
!602 = !DILocation(line: 560, column: 26, scope: !586)
!603 = !DILocation(line: 560, column: 25, scope: !586)
!604 = !DILocation(line: 560, column: 13, scope: !586)
!605 = !DILocation(line: 561, column: 14, scope: !586)
!606 = !DILocation(line: 561, column: 9, scope: !586)
!607 = !DILocation(line: 561, column: 2, scope: !586)
!608 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !72, file: !72, line: 580, type: !609, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!609 = !DISubroutineType(types: !610)
!610 = !{!13, !13, !22, !22}
!611 = !DILocalVariable(name: "value", arg: 1, scope: !608, file: !72, line: 580, type: !13)
!612 = !DILocation(line: 580, column: 43, scope: !608)
!613 = !DILocalVariable(name: "factor", arg: 2, scope: !608, file: !72, line: 580, type: !22)
!614 = !DILocation(line: 580, column: 53, scope: !608)
!615 = !DILocalVariable(name: "count", arg: 3, scope: !608, file: !72, line: 580, type: !22)
!616 = !DILocation(line: 580, column: 64, scope: !608)
!617 = !DILocalVariable(name: "s32MulTemp", scope: !608, file: !72, line: 582, type: !80)
!618 = !DILocation(line: 582, column: 6, scope: !608)
!619 = !DILocation(line: 583, column: 15, scope: !608)
!620 = !DILocation(line: 583, column: 23, scope: !608)
!621 = !DILocation(line: 583, column: 21, scope: !608)
!622 = !DILocation(line: 583, column: 13, scope: !608)
!623 = !DILocation(line: 584, column: 15, scope: !608)
!624 = !DILocation(line: 584, column: 26, scope: !608)
!625 = !DILocation(line: 584, column: 25, scope: !608)
!626 = !DILocation(line: 584, column: 13, scope: !608)
!627 = !DILocation(line: 585, column: 5, scope: !628)
!628 = distinct !DILexicalBlock(scope: !608, file: !72, line: 585, column: 5)
!629 = !DILocation(line: 585, column: 16, scope: !628)
!630 = !DILocation(line: 585, column: 5, scope: !608)
!631 = !DILocation(line: 587, column: 6, scope: !632)
!632 = distinct !DILexicalBlock(scope: !633, file: !72, line: 587, column: 6)
!633 = distinct !DILexicalBlock(scope: !628, file: !72, line: 586, column: 2)
!634 = !DILocation(line: 587, column: 17, scope: !632)
!635 = !DILocation(line: 587, column: 6, scope: !633)
!636 = !DILocation(line: 589, column: 16, scope: !637)
!637 = distinct !DILexicalBlock(scope: !632, file: !72, line: 588, column: 3)
!638 = !DILocation(line: 589, column: 11, scope: !637)
!639 = !DILocation(line: 589, column: 4, scope: !637)
!640 = !DILocation(line: 593, column: 4, scope: !641)
!641 = distinct !DILexicalBlock(scope: !632, file: !72, line: 592, column: 3)
!642 = !DILocation(line: 598, column: 3, scope: !643)
!643 = distinct !DILexicalBlock(scope: !628, file: !72, line: 597, column: 2)
!644 = !DILocation(line: 600, column: 1, scope: !608)
!645 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !72, file: !72, line: 617, type: !390, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!646 = !DILocalVariable(name: "value", arg: 1, scope: !645, file: !72, line: 617, type: !13)
!647 = !DILocation(line: 617, column: 31, scope: !645)
!648 = !DILocalVariable(name: "factor", arg: 2, scope: !645, file: !72, line: 617, type: !22)
!649 = !DILocation(line: 617, column: 42, scope: !645)
!650 = !DILocalVariable(name: "s32MulTemp1", scope: !645, file: !72, line: 619, type: !80)
!651 = !DILocation(line: 619, column: 6, scope: !645)
!652 = !DILocalVariable(name: "s32MulTemp2", scope: !645, file: !72, line: 619, type: !80)
!653 = !DILocation(line: 619, column: 24, scope: !645)
!654 = !DILocation(line: 620, column: 16, scope: !645)
!655 = !DILocation(line: 620, column: 24, scope: !645)
!656 = !DILocation(line: 620, column: 22, scope: !645)
!657 = !DILocation(line: 620, column: 14, scope: !645)
!658 = !DILocation(line: 621, column: 16, scope: !645)
!659 = !DILocation(line: 621, column: 28, scope: !645)
!660 = !DILocation(line: 621, column: 14, scope: !645)
!661 = !DILocation(line: 622, column: 6, scope: !662)
!662 = distinct !DILexicalBlock(scope: !645, file: !72, line: 622, column: 5)
!663 = !DILocation(line: 622, column: 17, scope: !662)
!664 = !DILocation(line: 622, column: 21, scope: !662)
!665 = !DILocation(line: 622, column: 25, scope: !662)
!666 = !DILocation(line: 622, column: 37, scope: !662)
!667 = !DILocation(line: 622, column: 46, scope: !662)
!668 = !DILocation(line: 622, column: 5, scope: !645)
!669 = !DILocation(line: 629, column: 17, scope: !670)
!670 = distinct !DILexicalBlock(scope: !662, file: !72, line: 628, column: 2)
!671 = !DILocation(line: 629, column: 29, scope: !670)
!672 = !DILocation(line: 629, column: 15, scope: !670)
!673 = !DILocation(line: 630, column: 15, scope: !670)
!674 = !DILocation(line: 630, column: 10, scope: !670)
!675 = !DILocation(line: 630, column: 3, scope: !670)
!676 = !DILocation(line: 634, column: 15, scope: !677)
!677 = distinct !DILexicalBlock(scope: !662, file: !72, line: 633, column: 2)
!678 = !DILocation(line: 634, column: 10, scope: !677)
!679 = !DILocation(line: 634, column: 3, scope: !677)
!680 = !DILocation(line: 636, column: 1, scope: !645)
!681 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !72, file: !72, line: 654, type: !390, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!682 = !DILocalVariable(name: "value", arg: 1, scope: !681, file: !72, line: 654, type: !13)
!683 = !DILocation(line: 654, column: 31, scope: !681)
!684 = !DILocalVariable(name: "factor", arg: 2, scope: !681, file: !72, line: 654, type: !22)
!685 = !DILocation(line: 654, column: 42, scope: !681)
!686 = !DILocalVariable(name: "s32MulTemp1", scope: !681, file: !72, line: 656, type: !80)
!687 = !DILocation(line: 656, column: 6, scope: !681)
!688 = !DILocalVariable(name: "s32MulTemp2", scope: !681, file: !72, line: 656, type: !80)
!689 = !DILocation(line: 656, column: 24, scope: !681)
!690 = !DILocation(line: 657, column: 16, scope: !681)
!691 = !DILocation(line: 657, column: 24, scope: !681)
!692 = !DILocation(line: 657, column: 22, scope: !681)
!693 = !DILocation(line: 657, column: 14, scope: !681)
!694 = !DILocation(line: 658, column: 16, scope: !681)
!695 = !DILocation(line: 658, column: 28, scope: !681)
!696 = !DILocation(line: 658, column: 14, scope: !681)
!697 = !DILocation(line: 659, column: 6, scope: !698)
!698 = distinct !DILexicalBlock(scope: !681, file: !72, line: 659, column: 5)
!699 = !DILocation(line: 659, column: 17, scope: !698)
!700 = !DILocation(line: 659, column: 21, scope: !698)
!701 = !DILocation(line: 659, column: 25, scope: !698)
!702 = !DILocation(line: 659, column: 37, scope: !698)
!703 = !DILocation(line: 659, column: 46, scope: !698)
!704 = !DILocation(line: 659, column: 5, scope: !681)
!705 = !DILocation(line: 665, column: 17, scope: !706)
!706 = distinct !DILexicalBlock(scope: !698, file: !72, line: 664, column: 2)
!707 = !DILocation(line: 665, column: 29, scope: !706)
!708 = !DILocation(line: 665, column: 15, scope: !706)
!709 = !DILocation(line: 666, column: 2, scope: !706)
!710 = !DILocation(line: 672, column: 6, scope: !711)
!711 = distinct !DILexicalBlock(scope: !681, file: !72, line: 672, column: 6)
!712 = !DILocation(line: 672, column: 18, scope: !711)
!713 = !DILocation(line: 672, column: 6, scope: !681)
!714 = !DILocation(line: 674, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !72, line: 674, column: 6)
!716 = distinct !DILexicalBlock(scope: !711, file: !72, line: 673, column: 2)
!717 = !DILocation(line: 674, column: 18, scope: !715)
!718 = !DILocation(line: 674, column: 6, scope: !716)
!719 = !DILocation(line: 676, column: 16, scope: !720)
!720 = distinct !DILexicalBlock(scope: !715, file: !72, line: 675, column: 3)
!721 = !DILocation(line: 676, column: 11, scope: !720)
!722 = !DILocation(line: 676, column: 4, scope: !720)
!723 = !DILocation(line: 680, column: 4, scope: !724)
!724 = distinct !DILexicalBlock(scope: !715, file: !72, line: 679, column: 3)
!725 = !DILocation(line: 685, column: 3, scope: !726)
!726 = distinct !DILexicalBlock(scope: !711, file: !72, line: 684, column: 2)
!727 = !DILocation(line: 687, column: 1, scope: !681)
!728 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !72, file: !72, line: 704, type: !729, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!729 = !DISubroutineType(types: !730)
!730 = !{!13, !22, !22}
!731 = !DILocalVariable(name: "value", arg: 1, scope: !728, file: !72, line: 704, type: !22)
!732 = !DILocation(line: 704, column: 33, scope: !728)
!733 = !DILocalVariable(name: "factor", arg: 2, scope: !728, file: !72, line: 704, type: !22)
!734 = !DILocation(line: 704, column: 44, scope: !728)
!735 = !DILocalVariable(name: "u32MulTemp", scope: !728, file: !72, line: 706, type: !736)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !51)
!737 = !DILocation(line: 706, column: 6, scope: !728)
!738 = !DILocation(line: 707, column: 15, scope: !728)
!739 = !DILocation(line: 707, column: 23, scope: !728)
!740 = !DILocation(line: 707, column: 21, scope: !728)
!741 = !DILocation(line: 707, column: 13, scope: !728)
!742 = !DILocation(line: 708, column: 15, scope: !728)
!743 = !DILocation(line: 708, column: 26, scope: !728)
!744 = !DILocation(line: 708, column: 13, scope: !728)
!745 = !DILocation(line: 709, column: 5, scope: !746)
!746 = distinct !DILexicalBlock(scope: !728, file: !72, line: 709, column: 5)
!747 = !DILocation(line: 709, column: 16, scope: !746)
!748 = !DILocation(line: 709, column: 5, scope: !728)
!749 = !DILocation(line: 711, column: 15, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !72, line: 710, column: 2)
!751 = !DILocation(line: 711, column: 10, scope: !750)
!752 = !DILocation(line: 711, column: 3, scope: !750)
!753 = !DILocation(line: 715, column: 3, scope: !754)
!754 = distinct !DILexicalBlock(scope: !746, file: !72, line: 714, column: 2)
!755 = !DILocation(line: 717, column: 1, scope: !728)
!756 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !72, file: !72, line: 732, type: !757, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!757 = !DISubroutineType(types: !758)
!758 = !{!80, !13, !22}
!759 = !DILocalVariable(name: "value", arg: 1, scope: !756, file: !72, line: 732, type: !13)
!760 = !DILocation(line: 732, column: 25, scope: !756)
!761 = !DILocalVariable(name: "factor", arg: 2, scope: !756, file: !72, line: 732, type: !22)
!762 = !DILocation(line: 732, column: 36, scope: !756)
!763 = !DILocalVariable(name: "s32MulTemp", scope: !756, file: !72, line: 734, type: !80)
!764 = !DILocation(line: 734, column: 6, scope: !756)
!765 = !DILocation(line: 735, column: 15, scope: !756)
!766 = !DILocation(line: 735, column: 23, scope: !756)
!767 = !DILocation(line: 735, column: 21, scope: !756)
!768 = !DILocation(line: 735, column: 13, scope: !756)
!769 = !DILocation(line: 736, column: 9, scope: !756)
!770 = !DILocation(line: 736, column: 2, scope: !756)
!771 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !72, file: !72, line: 752, type: !772, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!772 = !DISubroutineType(types: !773)
!773 = !{!80, !80, !22}
!774 = !DILocalVariable(name: "value", arg: 1, scope: !771, file: !72, line: 752, type: !80)
!775 = !DILocation(line: 752, column: 25, scope: !771)
!776 = !DILocalVariable(name: "factor", arg: 2, scope: !771, file: !72, line: 752, type: !22)
!777 = !DILocation(line: 752, column: 36, scope: !771)
!778 = !DILocalVariable(name: "s32Temp1", scope: !771, file: !72, line: 754, type: !80)
!779 = !DILocation(line: 754, column: 6, scope: !771)
!780 = !DILocalVariable(name: "s32Temp2", scope: !771, file: !72, line: 754, type: !80)
!781 = !DILocation(line: 754, column: 20, scope: !771)
!782 = !DILocalVariable(name: "s32Factor", scope: !771, file: !72, line: 754, type: !80)
!783 = !DILocation(line: 754, column: 44, scope: !771)
!784 = !DILocation(line: 755, column: 14, scope: !771)
!785 = !DILocation(line: 755, column: 12, scope: !771)
!786 = !DILocation(line: 756, column: 5, scope: !787)
!787 = distinct !DILexicalBlock(scope: !771, file: !72, line: 756, column: 5)
!788 = !DILocation(line: 756, column: 12, scope: !787)
!789 = !DILocation(line: 756, column: 5, scope: !771)
!790 = !DILocation(line: 758, column: 6, scope: !791)
!791 = distinct !DILexicalBlock(scope: !792, file: !72, line: 758, column: 6)
!792 = distinct !DILexicalBlock(scope: !787, file: !72, line: 757, column: 2)
!793 = !DILocation(line: 758, column: 12, scope: !791)
!794 = !DILocation(line: 758, column: 6, scope: !792)
!795 = !DILocation(line: 760, column: 15, scope: !796)
!796 = distinct !DILexicalBlock(scope: !791, file: !72, line: 759, column: 3)
!797 = !DILocation(line: 760, column: 26, scope: !796)
!798 = !DILocation(line: 760, column: 24, scope: !796)
!799 = !DILocation(line: 760, column: 13, scope: !796)
!800 = !DILocation(line: 761, column: 7, scope: !801)
!801 = distinct !DILexicalBlock(scope: !796, file: !72, line: 761, column: 7)
!802 = !DILocation(line: 761, column: 19, scope: !801)
!803 = !DILocation(line: 761, column: 16, scope: !801)
!804 = !DILocation(line: 761, column: 7, scope: !796)
!805 = !DILocation(line: 763, column: 5, scope: !806)
!806 = distinct !DILexicalBlock(scope: !801, file: !72, line: 762, column: 4)
!807 = !DILocation(line: 767, column: 13, scope: !808)
!808 = distinct !DILexicalBlock(scope: !801, file: !72, line: 766, column: 4)
!809 = !DILocation(line: 767, column: 19, scope: !808)
!810 = !DILocation(line: 767, column: 18, scope: !808)
!811 = !DILocation(line: 767, column: 5, scope: !808)
!812 = !DILocation(line: 772, column: 20, scope: !813)
!813 = distinct !DILexicalBlock(scope: !814, file: !72, line: 772, column: 7)
!814 = distinct !DILexicalBlock(scope: !791, file: !72, line: 771, column: 3)
!815 = !DILocation(line: 772, column: 19, scope: !813)
!816 = !DILocation(line: 772, column: 31, scope: !813)
!817 = !DILocation(line: 772, column: 28, scope: !813)
!818 = !DILocation(line: 772, column: 7, scope: !814)
!819 = !DILocation(line: 774, column: 5, scope: !820)
!820 = distinct !DILexicalBlock(scope: !813, file: !72, line: 773, column: 4)
!821 = !DILocation(line: 778, column: 13, scope: !822)
!822 = distinct !DILexicalBlock(scope: !813, file: !72, line: 777, column: 4)
!823 = !DILocation(line: 778, column: 19, scope: !822)
!824 = !DILocation(line: 778, column: 18, scope: !822)
!825 = !DILocation(line: 778, column: 5, scope: !822)
!826 = !DILocation(line: 784, column: 3, scope: !827)
!827 = distinct !DILexicalBlock(scope: !787, file: !72, line: 783, column: 2)
!828 = !DILocation(line: 786, column: 1, scope: !771)
!829 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !72, file: !72, line: 802, type: !830, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!830 = !DISubroutineType(types: !831)
!831 = !{!17, !17, !17, !22}
!832 = !DILocalVariable(name: "value", arg: 1, scope: !829, file: !72, line: 802, type: !17)
!833 = !DILocation(line: 802, column: 35, scope: !829)
!834 = !DILocalVariable(name: "factor", arg: 2, scope: !829, file: !72, line: 802, type: !17)
!835 = !DILocation(line: 802, column: 44, scope: !829)
!836 = !DILocalVariable(name: "count", arg: 3, scope: !829, file: !72, line: 802, type: !22)
!837 = !DILocation(line: 802, column: 55, scope: !829)
!838 = !DILocalVariable(name: "u16MulTemp", scope: !829, file: !72, line: 804, type: !22)
!839 = !DILocation(line: 804, column: 6, scope: !829)
!840 = !DILocation(line: 805, column: 15, scope: !829)
!841 = !DILocation(line: 805, column: 23, scope: !829)
!842 = !DILocation(line: 805, column: 21, scope: !829)
!843 = !DILocation(line: 805, column: 13, scope: !829)
!844 = !DILocation(line: 806, column: 15, scope: !829)
!845 = !DILocation(line: 806, column: 26, scope: !829)
!846 = !DILocation(line: 806, column: 25, scope: !829)
!847 = !DILocation(line: 806, column: 13, scope: !829)
!848 = !DILocation(line: 807, column: 13, scope: !829)
!849 = !DILocation(line: 807, column: 9, scope: !829)
!850 = !DILocation(line: 807, column: 2, scope: !829)
!851 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !72, file: !72, line: 824, type: !852, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!852 = !DISubroutineType(types: !853)
!853 = !{!17, !17, !17, !17}
!854 = !DILocalVariable(name: "value", arg: 1, scope: !851, file: !72, line: 824, type: !17)
!855 = !DILocation(line: 824, column: 38, scope: !851)
!856 = !DILocalVariable(name: "factor", arg: 2, scope: !851, file: !72, line: 824, type: !17)
!857 = !DILocation(line: 824, column: 47, scope: !851)
!858 = !DILocalVariable(name: "count", arg: 3, scope: !851, file: !72, line: 824, type: !17)
!859 = !DILocation(line: 824, column: 57, scope: !851)
!860 = !DILocalVariable(name: "u16MulTemp", scope: !851, file: !72, line: 826, type: !22)
!861 = !DILocation(line: 826, column: 6, scope: !851)
!862 = !DILocation(line: 827, column: 15, scope: !851)
!863 = !DILocation(line: 827, column: 23, scope: !851)
!864 = !DILocation(line: 827, column: 21, scope: !851)
!865 = !DILocation(line: 827, column: 13, scope: !851)
!866 = !DILocation(line: 828, column: 15, scope: !851)
!867 = !DILocation(line: 828, column: 26, scope: !851)
!868 = !DILocation(line: 828, column: 25, scope: !851)
!869 = !DILocation(line: 828, column: 13, scope: !851)
!870 = !DILocation(line: 829, column: 5, scope: !871)
!871 = distinct !DILexicalBlock(scope: !851, file: !72, line: 829, column: 5)
!872 = !DILocation(line: 829, column: 16, scope: !871)
!873 = !DILocation(line: 829, column: 5, scope: !851)
!874 = !DILocation(line: 831, column: 10, scope: !875)
!875 = distinct !DILexicalBlock(scope: !871, file: !72, line: 830, column: 2)
!876 = !DILocation(line: 831, column: 21, scope: !875)
!877 = !DILocation(line: 831, column: 3, scope: !875)
!878 = !DILocation(line: 835, column: 3, scope: !879)
!879 = distinct !DILexicalBlock(scope: !871, file: !72, line: 834, column: 2)
!880 = !DILocation(line: 837, column: 1, scope: !851)
!881 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !72, file: !72, line: 854, type: !882, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!882 = !DISubroutineType(types: !883)
!883 = !{!17, !17, !17}
!884 = !DILocalVariable(name: "x_value", arg: 1, scope: !881, file: !72, line: 854, type: !17)
!885 = !DILocation(line: 854, column: 25, scope: !881)
!886 = !DILocalVariable(name: "y_value", arg: 2, scope: !881, file: !72, line: 854, type: !17)
!887 = !DILocation(line: 854, column: 36, scope: !881)
!888 = !DILocalVariable(name: "u16MulTemp", scope: !881, file: !72, line: 856, type: !22)
!889 = !DILocation(line: 856, column: 6, scope: !881)
!890 = !DILocation(line: 857, column: 15, scope: !881)
!891 = !DILocation(line: 857, column: 25, scope: !881)
!892 = !DILocation(line: 857, column: 23, scope: !881)
!893 = !DILocation(line: 857, column: 13, scope: !881)
!894 = !DILocation(line: 858, column: 15, scope: !881)
!895 = !DILocation(line: 858, column: 26, scope: !881)
!896 = !DILocation(line: 858, column: 13, scope: !881)
!897 = !DILocation(line: 859, column: 13, scope: !881)
!898 = !DILocation(line: 859, column: 9, scope: !881)
!899 = !DILocation(line: 859, column: 2, scope: !881)
!900 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !72, file: !72, line: 878, type: !882, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!901 = !DILocalVariable(name: "value", arg: 1, scope: !900, file: !72, line: 878, type: !17)
!902 = !DILocation(line: 878, column: 26, scope: !900)
!903 = !DILocalVariable(name: "factor", arg: 2, scope: !900, file: !72, line: 878, type: !17)
!904 = !DILocation(line: 878, column: 36, scope: !900)
!905 = !DILocalVariable(name: "u16MulTemp", scope: !900, file: !72, line: 880, type: !22)
!906 = !DILocation(line: 880, column: 6, scope: !900)
!907 = !DILocation(line: 881, column: 15, scope: !900)
!908 = !DILocation(line: 881, column: 23, scope: !900)
!909 = !DILocation(line: 881, column: 21, scope: !900)
!910 = !DILocation(line: 881, column: 13, scope: !900)
!911 = !DILocation(line: 882, column: 15, scope: !900)
!912 = !DILocation(line: 882, column: 26, scope: !900)
!913 = !DILocation(line: 882, column: 13, scope: !900)
!914 = !DILocation(line: 883, column: 5, scope: !915)
!915 = distinct !DILexicalBlock(scope: !900, file: !72, line: 883, column: 5)
!916 = !DILocation(line: 883, column: 16, scope: !915)
!917 = !DILocation(line: 883, column: 5, scope: !900)
!918 = !DILocation(line: 885, column: 14, scope: !919)
!919 = distinct !DILexicalBlock(scope: !915, file: !72, line: 884, column: 2)
!920 = !DILocation(line: 885, column: 10, scope: !919)
!921 = !DILocation(line: 885, column: 3, scope: !919)
!922 = !DILocation(line: 889, column: 3, scope: !923)
!923 = distinct !DILexicalBlock(scope: !915, file: !72, line: 888, column: 2)
!924 = !DILocation(line: 891, column: 1, scope: !900)
!925 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !72, file: !72, line: 907, type: !926, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!926 = !DISubroutineType(types: !927)
!927 = !{!22, !22, !22}
!928 = !DILocalVariable(name: "value", arg: 1, scope: !925, file: !72, line: 907, type: !22)
!929 = !DILocation(line: 907, column: 39, scope: !925)
!930 = !DILocalVariable(name: "factor", arg: 2, scope: !925, file: !72, line: 907, type: !22)
!931 = !DILocation(line: 907, column: 49, scope: !925)
!932 = !DILocalVariable(name: "u32MulTemp", scope: !925, file: !72, line: 909, type: !736)
!933 = !DILocation(line: 909, column: 6, scope: !925)
!934 = !DILocation(line: 910, column: 15, scope: !925)
!935 = !DILocation(line: 910, column: 23, scope: !925)
!936 = !DILocation(line: 910, column: 21, scope: !925)
!937 = !DILocation(line: 910, column: 13, scope: !925)
!938 = !DILocation(line: 911, column: 15, scope: !925)
!939 = !DILocation(line: 911, column: 26, scope: !925)
!940 = !DILocation(line: 911, column: 13, scope: !925)
!941 = !DILocation(line: 912, column: 14, scope: !925)
!942 = !DILocation(line: 912, column: 9, scope: !925)
!943 = !DILocation(line: 912, column: 2, scope: !925)
!944 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !72, file: !72, line: 931, type: !926, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!945 = !DILocalVariable(name: "value", arg: 1, scope: !944, file: !72, line: 931, type: !22)
!946 = !DILocation(line: 931, column: 43, scope: !944)
!947 = !DILocalVariable(name: "factor", arg: 2, scope: !944, file: !72, line: 931, type: !22)
!948 = !DILocation(line: 931, column: 53, scope: !944)
!949 = !DILocalVariable(name: "u32MulTemp", scope: !944, file: !72, line: 933, type: !736)
!950 = !DILocation(line: 933, column: 6, scope: !944)
!951 = !DILocation(line: 934, column: 15, scope: !944)
!952 = !DILocation(line: 934, column: 23, scope: !944)
!953 = !DILocation(line: 934, column: 21, scope: !944)
!954 = !DILocation(line: 934, column: 13, scope: !944)
!955 = !DILocation(line: 935, column: 15, scope: !944)
!956 = !DILocation(line: 935, column: 26, scope: !944)
!957 = !DILocation(line: 935, column: 13, scope: !944)
!958 = !DILocation(line: 936, column: 5, scope: !959)
!959 = distinct !DILexicalBlock(scope: !944, file: !72, line: 936, column: 5)
!960 = !DILocation(line: 936, column: 16, scope: !959)
!961 = !DILocation(line: 936, column: 5, scope: !944)
!962 = !DILocation(line: 938, column: 11, scope: !963)
!963 = distinct !DILexicalBlock(scope: !959, file: !72, line: 937, column: 2)
!964 = !DILocation(line: 938, column: 22, scope: !963)
!965 = !DILocation(line: 938, column: 10, scope: !963)
!966 = !DILocation(line: 938, column: 3, scope: !963)
!967 = !DILocation(line: 942, column: 3, scope: !968)
!968 = distinct !DILexicalBlock(scope: !959, file: !72, line: 941, column: 2)
!969 = !DILocation(line: 944, column: 1, scope: !944)
!970 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !72, file: !72, line: 962, type: !971, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!971 = !DISubroutineType(types: !972)
!972 = !{!22, !22, !17}
!973 = !DILocalVariable(name: "x_value", arg: 1, scope: !970, file: !72, line: 962, type: !22)
!974 = !DILocation(line: 962, column: 29, scope: !970)
!975 = !DILocalVariable(name: "y_value", arg: 2, scope: !970, file: !72, line: 962, type: !17)
!976 = !DILocation(line: 962, column: 41, scope: !970)
!977 = !DILocalVariable(name: "u32MulTemp", scope: !970, file: !72, line: 964, type: !736)
!978 = !DILocation(line: 964, column: 6, scope: !970)
!979 = !DILocation(line: 965, column: 15, scope: !970)
!980 = !DILocation(line: 965, column: 25, scope: !970)
!981 = !DILocation(line: 965, column: 23, scope: !970)
!982 = !DILocation(line: 965, column: 13, scope: !970)
!983 = !DILocation(line: 966, column: 16, scope: !970)
!984 = !DILocation(line: 966, column: 27, scope: !970)
!985 = !DILocation(line: 966, column: 33, scope: !970)
!986 = !DILocation(line: 966, column: 13, scope: !970)
!987 = !DILocation(line: 967, column: 9, scope: !970)
!988 = !DILocation(line: 967, column: 2, scope: !970)
!989 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !72, file: !72, line: 986, type: !971, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!990 = !DILocalVariable(name: "x_value", arg: 1, scope: !989, file: !72, line: 986, type: !22)
!991 = !DILocation(line: 986, column: 29, scope: !989)
!992 = !DILocalVariable(name: "y_value", arg: 2, scope: !989, file: !72, line: 986, type: !17)
!993 = !DILocation(line: 986, column: 41, scope: !989)
!994 = !DILocalVariable(name: "u32MulTemp", scope: !989, file: !72, line: 988, type: !736)
!995 = !DILocation(line: 988, column: 6, scope: !989)
!996 = !DILocation(line: 989, column: 15, scope: !989)
!997 = !DILocation(line: 989, column: 25, scope: !989)
!998 = !DILocation(line: 989, column: 23, scope: !989)
!999 = !DILocation(line: 989, column: 13, scope: !989)
!1000 = !DILocation(line: 990, column: 15, scope: !989)
!1001 = !DILocation(line: 990, column: 26, scope: !989)
!1002 = !DILocation(line: 990, column: 13, scope: !989)
!1003 = !DILocation(line: 991, column: 5, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !989, file: !72, line: 991, column: 5)
!1005 = !DILocation(line: 991, column: 16, scope: !1004)
!1006 = !DILocation(line: 991, column: 5, scope: !989)
!1007 = !DILocation(line: 993, column: 11, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1004, file: !72, line: 992, column: 2)
!1009 = !DILocation(line: 993, column: 22, scope: !1008)
!1010 = !DILocation(line: 993, column: 10, scope: !1008)
!1011 = !DILocation(line: 993, column: 3, scope: !1008)
!1012 = !DILocation(line: 997, column: 3, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1004, file: !72, line: 996, column: 2)
!1014 = !DILocation(line: 999, column: 1, scope: !989)
!1015 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !72, file: !72, line: 1015, type: !1016, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!22, !22, !22, !736}
!1018 = !DILocalVariable(name: "value", arg: 1, scope: !1015, file: !72, line: 1015, type: !22)
!1019 = !DILocation(line: 1015, column: 40, scope: !1015)
!1020 = !DILocalVariable(name: "factor", arg: 2, scope: !1015, file: !72, line: 1015, type: !22)
!1021 = !DILocation(line: 1015, column: 50, scope: !1015)
!1022 = !DILocalVariable(name: "count", arg: 3, scope: !1015, file: !72, line: 1015, type: !736)
!1023 = !DILocation(line: 1015, column: 61, scope: !1015)
!1024 = !DILocalVariable(name: "u32MulTemp", scope: !1015, file: !72, line: 1017, type: !736)
!1025 = !DILocation(line: 1017, column: 6, scope: !1015)
!1026 = !DILocation(line: 1018, column: 15, scope: !1015)
!1027 = !DILocation(line: 1018, column: 23, scope: !1015)
!1028 = !DILocation(line: 1018, column: 21, scope: !1015)
!1029 = !DILocation(line: 1018, column: 13, scope: !1015)
!1030 = !DILocation(line: 1019, column: 15, scope: !1015)
!1031 = !DILocation(line: 1019, column: 26, scope: !1015)
!1032 = !DILocation(line: 1019, column: 25, scope: !1015)
!1033 = !DILocation(line: 1019, column: 13, scope: !1015)
!1034 = !DILocation(line: 1020, column: 10, scope: !1015)
!1035 = !DILocation(line: 1020, column: 21, scope: !1015)
!1036 = !DILocation(line: 1020, column: 9, scope: !1015)
!1037 = !DILocation(line: 1020, column: 2, scope: !1015)
!1038 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !72, file: !72, line: 1038, type: !1039, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1039 = !DISubroutineType(types: !1040)
!1040 = !{!22, !22, !22, !22}
!1041 = !DILocalVariable(name: "value", arg: 1, scope: !1038, file: !72, line: 1038, type: !22)
!1042 = !DILocation(line: 1038, column: 43, scope: !1038)
!1043 = !DILocalVariable(name: "factor", arg: 2, scope: !1038, file: !72, line: 1038, type: !22)
!1044 = !DILocation(line: 1038, column: 53, scope: !1038)
!1045 = !DILocalVariable(name: "count", arg: 3, scope: !1038, file: !72, line: 1038, type: !22)
!1046 = !DILocation(line: 1038, column: 64, scope: !1038)
!1047 = !DILocalVariable(name: "u32MulTemp", scope: !1038, file: !72, line: 1040, type: !736)
!1048 = !DILocation(line: 1040, column: 6, scope: !1038)
!1049 = !DILocation(line: 1041, column: 15, scope: !1038)
!1050 = !DILocation(line: 1041, column: 23, scope: !1038)
!1051 = !DILocation(line: 1041, column: 21, scope: !1038)
!1052 = !DILocation(line: 1041, column: 13, scope: !1038)
!1053 = !DILocation(line: 1042, column: 15, scope: !1038)
!1054 = !DILocation(line: 1042, column: 26, scope: !1038)
!1055 = !DILocation(line: 1042, column: 25, scope: !1038)
!1056 = !DILocation(line: 1042, column: 13, scope: !1038)
!1057 = !DILocation(line: 1043, column: 5, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1038, file: !72, line: 1043, column: 5)
!1059 = !DILocation(line: 1043, column: 16, scope: !1058)
!1060 = !DILocation(line: 1043, column: 5, scope: !1038)
!1061 = !DILocation(line: 1045, column: 11, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1058, file: !72, line: 1044, column: 2)
!1063 = !DILocation(line: 1045, column: 22, scope: !1062)
!1064 = !DILocation(line: 1045, column: 10, scope: !1062)
!1065 = !DILocation(line: 1045, column: 3, scope: !1062)
!1066 = !DILocation(line: 1049, column: 3, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1058, file: !72, line: 1048, column: 2)
!1068 = !DILocation(line: 1051, column: 1, scope: !1038)
!1069 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !72, file: !72, line: 1067, type: !926, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1070 = !DILocalVariable(name: "x_value", arg: 1, scope: !1069, file: !72, line: 1067, type: !22)
!1071 = !DILocation(line: 1067, column: 30, scope: !1069)
!1072 = !DILocalVariable(name: "y_value", arg: 2, scope: !1069, file: !72, line: 1067, type: !22)
!1073 = !DILocation(line: 1067, column: 42, scope: !1069)
!1074 = !DILocalVariable(name: "u32MulTemp", scope: !1069, file: !72, line: 1069, type: !736)
!1075 = !DILocation(line: 1069, column: 6, scope: !1069)
!1076 = !DILocation(line: 1070, column: 15, scope: !1069)
!1077 = !DILocation(line: 1070, column: 25, scope: !1069)
!1078 = !DILocation(line: 1070, column: 23, scope: !1069)
!1079 = !DILocation(line: 1070, column: 13, scope: !1069)
!1080 = !DILocation(line: 1071, column: 15, scope: !1069)
!1081 = !DILocation(line: 1071, column: 26, scope: !1069)
!1082 = !DILocation(line: 1071, column: 13, scope: !1069)
!1083 = !DILocation(line: 1072, column: 19, scope: !1069)
!1084 = !DILocation(line: 1072, column: 17, scope: !1069)
!1085 = !DILocation(line: 1072, column: 9, scope: !1069)
!1086 = !DILocation(line: 1072, column: 2, scope: !1069)
!1087 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !72, file: !72, line: 1091, type: !926, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1088 = !DILocalVariable(name: "x_value", arg: 1, scope: !1087, file: !72, line: 1091, type: !22)
!1089 = !DILocation(line: 1091, column: 30, scope: !1087)
!1090 = !DILocalVariable(name: "y_value", arg: 2, scope: !1087, file: !72, line: 1091, type: !22)
!1091 = !DILocation(line: 1091, column: 42, scope: !1087)
!1092 = !DILocalVariable(name: "u32MulTemp", scope: !1087, file: !72, line: 1093, type: !736)
!1093 = !DILocation(line: 1093, column: 6, scope: !1087)
!1094 = !DILocation(line: 1094, column: 15, scope: !1087)
!1095 = !DILocation(line: 1094, column: 25, scope: !1087)
!1096 = !DILocation(line: 1094, column: 23, scope: !1087)
!1097 = !DILocation(line: 1094, column: 13, scope: !1087)
!1098 = !DILocation(line: 1095, column: 15, scope: !1087)
!1099 = !DILocation(line: 1095, column: 26, scope: !1087)
!1100 = !DILocation(line: 1095, column: 13, scope: !1087)
!1101 = !DILocation(line: 1096, column: 5, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1087, file: !72, line: 1096, column: 5)
!1103 = !DILocation(line: 1096, column: 16, scope: !1102)
!1104 = !DILocation(line: 1096, column: 5, scope: !1087)
!1105 = !DILocation(line: 1098, column: 11, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1102, file: !72, line: 1097, column: 2)
!1107 = !DILocation(line: 1098, column: 22, scope: !1106)
!1108 = !DILocation(line: 1098, column: 10, scope: !1106)
!1109 = !DILocation(line: 1098, column: 3, scope: !1106)
!1110 = !DILocation(line: 1102, column: 3, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1102, file: !72, line: 1101, column: 2)
!1112 = !DILocation(line: 1104, column: 1, scope: !1087)
!1113 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !72, file: !72, line: 1119, type: !1114, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1114 = !DISubroutineType(types: !1115)
!1115 = !{!736, !736, !22}
!1116 = !DILocalVariable(name: "x_value", arg: 1, scope: !1113, file: !72, line: 1119, type: !736)
!1117 = !DILocation(line: 1119, column: 26, scope: !1113)
!1118 = !DILocalVariable(name: "y_value", arg: 2, scope: !1113, file: !72, line: 1119, type: !22)
!1119 = !DILocation(line: 1119, column: 39, scope: !1113)
!1120 = !DILocalVariable(name: "u32Temp1", scope: !1113, file: !72, line: 1122, type: !736)
!1121 = !DILocation(line: 1122, column: 6, scope: !1113)
!1122 = !DILocation(line: 1123, column: 5, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1113, file: !72, line: 1123, column: 5)
!1124 = !DILocation(line: 1123, column: 13, scope: !1123)
!1125 = !DILocation(line: 1123, column: 5, scope: !1113)
!1126 = !DILocation(line: 1125, column: 26, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1123, file: !72, line: 1124, column: 2)
!1128 = !DILocation(line: 1125, column: 25, scope: !1127)
!1129 = !DILocation(line: 1125, column: 12, scope: !1127)
!1130 = !DILocation(line: 1126, column: 6, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1127, file: !72, line: 1126, column: 6)
!1132 = !DILocation(line: 1126, column: 17, scope: !1131)
!1133 = !DILocation(line: 1126, column: 15, scope: !1131)
!1134 = !DILocation(line: 1126, column: 6, scope: !1127)
!1135 = !DILocation(line: 1128, column: 4, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1131, file: !72, line: 1127, column: 3)
!1137 = !DILocation(line: 1132, column: 12, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1131, file: !72, line: 1131, column: 3)
!1139 = !DILocation(line: 1132, column: 22, scope: !1138)
!1140 = !DILocation(line: 1132, column: 20, scope: !1138)
!1141 = !DILocation(line: 1132, column: 4, scope: !1138)
!1142 = !DILocation(line: 1137, column: 3, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1123, file: !72, line: 1136, column: 2)
!1144 = !DILocation(line: 1140, column: 2, scope: !1113)
!1145 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !72, file: !72, line: 1157, type: !1146, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1146 = !DISubroutineType(types: !1147)
!1147 = !{!736, !736, !22, !736}
!1148 = !DILocalVariable(name: "value", arg: 1, scope: !1145, file: !72, line: 1157, type: !736)
!1149 = !DILocation(line: 1157, column: 40, scope: !1145)
!1150 = !DILocalVariable(name: "factor", arg: 2, scope: !1145, file: !72, line: 1157, type: !22)
!1151 = !DILocation(line: 1157, column: 50, scope: !1145)
!1152 = !DILocalVariable(name: "count", arg: 3, scope: !1145, file: !72, line: 1157, type: !736)
!1153 = !DILocation(line: 1157, column: 62, scope: !1145)
!1154 = !DILocalVariable(name: "u32Temp1", scope: !1145, file: !72, line: 1159, type: !736)
!1155 = !DILocation(line: 1159, column: 6, scope: !1145)
!1156 = !DILocalVariable(name: "u32Temp2", scope: !1145, file: !72, line: 1159, type: !736)
!1157 = !DILocation(line: 1159, column: 20, scope: !1145)
!1158 = !DILocation(line: 1160, column: 13, scope: !1145)
!1159 = !DILocation(line: 1160, column: 21, scope: !1145)
!1160 = !DILocation(line: 1160, column: 19, scope: !1145)
!1161 = !DILocation(line: 1160, column: 11, scope: !1145)
!1162 = !DILocation(line: 1161, column: 25, scope: !1145)
!1163 = !DILocation(line: 1161, column: 32, scope: !1145)
!1164 = !DILocation(line: 1161, column: 13, scope: !1145)
!1165 = !DILocation(line: 1161, column: 11, scope: !1145)
!1166 = !DILocation(line: 1162, column: 13, scope: !1145)
!1167 = !DILocation(line: 1162, column: 25, scope: !1145)
!1168 = !DILocation(line: 1162, column: 22, scope: !1145)
!1169 = !DILocation(line: 1162, column: 11, scope: !1145)
!1170 = !DILocation(line: 1163, column: 14, scope: !1145)
!1171 = !DILocation(line: 1163, column: 30, scope: !1145)
!1172 = !DILocation(line: 1163, column: 29, scope: !1145)
!1173 = !DILocation(line: 1163, column: 23, scope: !1145)
!1174 = !DILocation(line: 1163, column: 11, scope: !1145)
!1175 = !DILocation(line: 1164, column: 6, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1145, file: !72, line: 1164, column: 5)
!1177 = !DILocation(line: 1164, column: 16, scope: !1176)
!1178 = !DILocation(line: 1164, column: 14, scope: !1176)
!1179 = !DILocation(line: 1164, column: 23, scope: !1176)
!1180 = !DILocation(line: 1164, column: 5, scope: !1145)
!1181 = !DILocation(line: 1166, column: 10, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1176, file: !72, line: 1165, column: 2)
!1183 = !DILocation(line: 1166, column: 3, scope: !1182)
!1184 = !DILocation(line: 1170, column: 3, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1176, file: !72, line: 1169, column: 2)
!1186 = !DILocation(line: 1172, column: 1, scope: !1145)
!1187 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !72, file: !72, line: 1188, type: !1188, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1188 = !DISubroutineType(types: !1189)
!1189 = !{!17, !17, !17, !6}
!1190 = !DILocalVariable(name: "val1", arg: 1, scope: !1187, file: !72, line: 1188, type: !17)
!1191 = !DILocation(line: 1188, column: 25, scope: !1187)
!1192 = !DILocalVariable(name: "val2", arg: 2, scope: !1187, file: !72, line: 1188, type: !17)
!1193 = !DILocation(line: 1188, column: 34, scope: !1187)
!1194 = !DILocalVariable(name: "factor", arg: 3, scope: !1187, file: !72, line: 1188, type: !6)
!1195 = !DILocation(line: 1188, column: 43, scope: !1187)
!1196 = !DILocalVariable(name: "s16Temp1", scope: !1187, file: !72, line: 1190, type: !13)
!1197 = !DILocation(line: 1190, column: 6, scope: !1187)
!1198 = !DILocation(line: 1191, column: 15, scope: !1187)
!1199 = !DILocation(line: 1191, column: 22, scope: !1187)
!1200 = !DILocation(line: 1191, column: 20, scope: !1187)
!1201 = !DILocation(line: 1191, column: 28, scope: !1187)
!1202 = !DILocation(line: 1191, column: 27, scope: !1187)
!1203 = !DILocation(line: 1191, column: 35, scope: !1187)
!1204 = !DILocation(line: 1191, column: 39, scope: !1187)
!1205 = !DILocation(line: 1191, column: 38, scope: !1187)
!1206 = !DILocation(line: 1191, column: 13, scope: !1187)
!1207 = !DILocation(line: 1191, column: 11, scope: !1187)
!1208 = !DILocation(line: 1192, column: 5, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1187, file: !72, line: 1192, column: 5)
!1210 = !DILocation(line: 1192, column: 14, scope: !1209)
!1211 = !DILocation(line: 1192, column: 5, scope: !1187)
!1212 = !DILocation(line: 1194, column: 6, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1214, file: !72, line: 1194, column: 6)
!1214 = distinct !DILexicalBlock(scope: !1209, file: !72, line: 1193, column: 2)
!1215 = !DILocation(line: 1194, column: 15, scope: !1213)
!1216 = !DILocation(line: 1194, column: 6, scope: !1214)
!1217 = !DILocation(line: 1196, column: 15, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1213, file: !72, line: 1195, column: 3)
!1219 = !DILocation(line: 1196, column: 11, scope: !1218)
!1220 = !DILocation(line: 1196, column: 4, scope: !1218)
!1221 = !DILocation(line: 1200, column: 4, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1213, file: !72, line: 1199, column: 3)
!1223 = !DILocation(line: 1205, column: 3, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1209, file: !72, line: 1204, column: 2)
!1225 = !DILocation(line: 1208, column: 1, scope: !1187)
!1226 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !72, file: !72, line: 1224, type: !1227, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1227 = !DISubroutineType(types: !1228)
!1228 = !{!22, !22, !22, !6}
!1229 = !DILocalVariable(name: "val1", arg: 1, scope: !1226, file: !72, line: 1224, type: !22)
!1230 = !DILocation(line: 1224, column: 30, scope: !1226)
!1231 = !DILocalVariable(name: "val2", arg: 2, scope: !1226, file: !72, line: 1224, type: !22)
!1232 = !DILocation(line: 1224, column: 40, scope: !1226)
!1233 = !DILocalVariable(name: "factor", arg: 3, scope: !1226, file: !72, line: 1224, type: !6)
!1234 = !DILocation(line: 1224, column: 49, scope: !1226)
!1235 = !DILocalVariable(name: "s32Temp1", scope: !1226, file: !72, line: 1226, type: !80)
!1236 = !DILocation(line: 1226, column: 6, scope: !1226)
!1237 = !DILocation(line: 1227, column: 15, scope: !1226)
!1238 = !DILocation(line: 1227, column: 22, scope: !1226)
!1239 = !DILocation(line: 1227, column: 20, scope: !1226)
!1240 = !DILocation(line: 1227, column: 28, scope: !1226)
!1241 = !DILocation(line: 1227, column: 27, scope: !1226)
!1242 = !DILocation(line: 1227, column: 35, scope: !1226)
!1243 = !DILocation(line: 1227, column: 39, scope: !1226)
!1244 = !DILocation(line: 1227, column: 38, scope: !1226)
!1245 = !DILocation(line: 1227, column: 11, scope: !1226)
!1246 = !DILocation(line: 1228, column: 5, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1226, file: !72, line: 1228, column: 5)
!1248 = !DILocation(line: 1228, column: 14, scope: !1247)
!1249 = !DILocation(line: 1228, column: 5, scope: !1226)
!1250 = !DILocation(line: 1230, column: 6, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !72, line: 1230, column: 6)
!1252 = distinct !DILexicalBlock(scope: !1247, file: !72, line: 1229, column: 2)
!1253 = !DILocation(line: 1230, column: 15, scope: !1251)
!1254 = !DILocation(line: 1230, column: 6, scope: !1252)
!1255 = !DILocation(line: 1232, column: 16, scope: !1256)
!1256 = distinct !DILexicalBlock(scope: !1251, file: !72, line: 1231, column: 3)
!1257 = !DILocation(line: 1232, column: 11, scope: !1256)
!1258 = !DILocation(line: 1232, column: 4, scope: !1256)
!1259 = !DILocation(line: 1236, column: 4, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1251, file: !72, line: 1235, column: 3)
!1261 = !DILocation(line: 1242, column: 3, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1247, file: !72, line: 1241, column: 2)
!1263 = !DILocation(line: 1244, column: 1, scope: !1226)
!1264 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !72, file: !72, line: 1259, type: !926, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1265 = !DILocalVariable(name: "val1", arg: 1, scope: !1264, file: !72, line: 1259, type: !22)
!1266 = !DILocation(line: 1259, column: 26, scope: !1264)
!1267 = !DILocalVariable(name: "val2", arg: 2, scope: !1264, file: !72, line: 1259, type: !22)
!1268 = !DILocation(line: 1259, column: 36, scope: !1264)
!1269 = !DILocalVariable(name: "u32Temp1", scope: !1264, file: !72, line: 1261, type: !736)
!1270 = !DILocation(line: 1261, column: 6, scope: !1264)
!1271 = !DILocation(line: 1262, column: 13, scope: !1264)
!1272 = !DILocation(line: 1262, column: 20, scope: !1264)
!1273 = !DILocation(line: 1262, column: 18, scope: !1264)
!1274 = !DILocation(line: 1262, column: 11, scope: !1264)
!1275 = !DILocation(line: 1263, column: 5, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1264, file: !72, line: 1263, column: 5)
!1277 = !DILocation(line: 1263, column: 14, scope: !1276)
!1278 = !DILocation(line: 1263, column: 5, scope: !1264)
!1279 = !DILocation(line: 1265, column: 11, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1276, file: !72, line: 1264, column: 2)
!1281 = !DILocation(line: 1265, column: 20, scope: !1280)
!1282 = !DILocation(line: 1265, column: 10, scope: !1280)
!1283 = !DILocation(line: 1265, column: 3, scope: !1280)
!1284 = !DILocation(line: 1269, column: 3, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1276, file: !72, line: 1268, column: 2)
!1286 = !DILocation(line: 1271, column: 1, scope: !1264)
!1287 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !72, file: !72, line: 1285, type: !1288, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1288 = !DISubroutineType(types: !1289)
!1289 = !{!736, !22, !22}
!1290 = !DILocalVariable(name: "x_value", arg: 1, scope: !1287, file: !72, line: 1285, type: !22)
!1291 = !DILocation(line: 1285, column: 25, scope: !1287)
!1292 = !DILocalVariable(name: "y_value", arg: 2, scope: !1287, file: !72, line: 1285, type: !22)
!1293 = !DILocation(line: 1285, column: 38, scope: !1287)
!1294 = !DILocalVariable(name: "u32Temp1", scope: !1287, file: !72, line: 1287, type: !736)
!1295 = !DILocation(line: 1287, column: 6, scope: !1287)
!1296 = !DILocation(line: 1288, column: 13, scope: !1287)
!1297 = !DILocation(line: 1288, column: 23, scope: !1287)
!1298 = !DILocation(line: 1288, column: 21, scope: !1287)
!1299 = !DILocation(line: 1288, column: 11, scope: !1287)
!1300 = !DILocation(line: 1289, column: 9, scope: !1287)
!1301 = !DILocation(line: 1289, column: 2, scope: !1287)
!1302 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !72, file: !72, line: 1307, type: !1303, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1303 = !DISubroutineType(types: !1304)
!1304 = !{!80, !13, !13}
!1305 = !DILocalVariable(name: "x_value", arg: 1, scope: !1302, file: !72, line: 1307, type: !13)
!1306 = !DILocation(line: 1307, column: 25, scope: !1302)
!1307 = !DILocalVariable(name: "y_value", arg: 2, scope: !1302, file: !72, line: 1307, type: !13)
!1308 = !DILocation(line: 1307, column: 38, scope: !1302)
!1309 = !DILocalVariable(name: "s32Temp1", scope: !1302, file: !72, line: 1309, type: !80)
!1310 = !DILocation(line: 1309, column: 6, scope: !1302)
!1311 = !DILocation(line: 1310, column: 13, scope: !1302)
!1312 = !DILocation(line: 1310, column: 23, scope: !1302)
!1313 = !DILocation(line: 1310, column: 21, scope: !1302)
!1314 = !DILocation(line: 1310, column: 11, scope: !1302)
!1315 = !DILocation(line: 1311, column: 9, scope: !1302)
!1316 = !DILocation(line: 1311, column: 2, scope: !1302)
!1317 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !72, file: !72, line: 1328, type: !1318, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1318 = !DISubroutineType(types: !1319)
!1319 = !{!736, !736, !80}
!1320 = !DILocalVariable(name: "val1", arg: 1, scope: !1317, file: !72, line: 1328, type: !736)
!1321 = !DILocation(line: 1328, column: 25, scope: !1317)
!1322 = !DILocalVariable(name: "val2", arg: 2, scope: !1317, file: !72, line: 1328, type: !80)
!1323 = !DILocation(line: 1328, column: 35, scope: !1317)
!1324 = !DILocalVariable(name: "s32Temp1", scope: !1317, file: !72, line: 1330, type: !80)
!1325 = !DILocation(line: 1330, column: 6, scope: !1317)
!1326 = !DILocation(line: 1331, column: 5, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1317, file: !72, line: 1331, column: 5)
!1328 = !DILocation(line: 1331, column: 10, scope: !1327)
!1329 = !DILocation(line: 1331, column: 5, scope: !1317)
!1330 = !DILocation(line: 1333, column: 25, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1327, file: !72, line: 1332, column: 2)
!1332 = !DILocation(line: 1333, column: 24, scope: !1331)
!1333 = !DILocation(line: 1333, column: 12, scope: !1331)
!1334 = !DILocation(line: 1334, column: 6, scope: !1335)
!1335 = distinct !DILexicalBlock(scope: !1331, file: !72, line: 1334, column: 6)
!1336 = !DILocation(line: 1334, column: 17, scope: !1335)
!1337 = !DILocation(line: 1334, column: 15, scope: !1335)
!1338 = !DILocation(line: 1334, column: 6, scope: !1331)
!1339 = !DILocation(line: 1336, column: 4, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1335, file: !72, line: 1335, column: 3)
!1341 = !DILocation(line: 1340, column: 12, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1335, file: !72, line: 1339, column: 3)
!1343 = !DILocation(line: 1340, column: 19, scope: !1342)
!1344 = !DILocation(line: 1340, column: 17, scope: !1342)
!1345 = !DILocation(line: 1340, column: 4, scope: !1342)
!1346 = !DILocation(line: 1345, column: 3, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1327, file: !72, line: 1344, column: 2)
!1348 = !DILocation(line: 1347, column: 1, scope: !1317)
!1349 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !72, file: !72, line: 1362, type: !1350, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1350 = !DISubroutineType(types: !1351)
!1351 = !{!736, !80, !80}
!1352 = !DILocalVariable(name: "val1", arg: 1, scope: !1349, file: !72, line: 1362, type: !80)
!1353 = !DILocation(line: 1362, column: 25, scope: !1349)
!1354 = !DILocalVariable(name: "val2", arg: 2, scope: !1349, file: !72, line: 1362, type: !80)
!1355 = !DILocation(line: 1362, column: 35, scope: !1349)
!1356 = !DILocalVariable(name: "u32Temp1", scope: !1349, file: !72, line: 1364, type: !736)
!1357 = !DILocation(line: 1364, column: 6, scope: !1349)
!1358 = !DILocalVariable(name: "u32Temp2", scope: !1349, file: !72, line: 1364, type: !736)
!1359 = !DILocation(line: 1364, column: 17, scope: !1349)
!1360 = !DILocalVariable(name: "u32Temp3", scope: !1349, file: !72, line: 1364, type: !736)
!1361 = !DILocation(line: 1364, column: 27, scope: !1349)
!1362 = !DILocalVariable(name: "u8SignBit", scope: !1349, file: !72, line: 1365, type: !17)
!1363 = !DILocation(line: 1365, column: 5, scope: !1349)
!1364 = !DILocation(line: 1367, column: 5, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1349, file: !72, line: 1367, column: 5)
!1366 = !DILocation(line: 1367, column: 9, scope: !1365)
!1367 = !DILocation(line: 1367, column: 5, scope: !1349)
!1368 = !DILocation(line: 1368, column: 15, scope: !1365)
!1369 = !DILocation(line: 1368, column: 14, scope: !1365)
!1370 = !DILocation(line: 1368, column: 12, scope: !1365)
!1371 = !DILocation(line: 1368, column: 3, scope: !1365)
!1372 = !DILocation(line: 1370, column: 14, scope: !1365)
!1373 = !DILocation(line: 1370, column: 12, scope: !1365)
!1374 = !DILocation(line: 1372, column: 5, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1349, file: !72, line: 1372, column: 5)
!1376 = !DILocation(line: 1372, column: 9, scope: !1375)
!1377 = !DILocation(line: 1372, column: 5, scope: !1349)
!1378 = !DILocation(line: 1373, column: 15, scope: !1375)
!1379 = !DILocation(line: 1373, column: 14, scope: !1375)
!1380 = !DILocation(line: 1373, column: 12, scope: !1375)
!1381 = !DILocation(line: 1373, column: 3, scope: !1375)
!1382 = !DILocation(line: 1375, column: 14, scope: !1375)
!1383 = !DILocation(line: 1375, column: 12, scope: !1375)
!1384 = !DILocation(line: 1377, column: 6, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1349, file: !72, line: 1377, column: 5)
!1386 = !DILocation(line: 1377, column: 10, scope: !1385)
!1387 = !DILocation(line: 1377, column: 13, scope: !1385)
!1388 = !DILocation(line: 1377, column: 28, scope: !1385)
!1389 = !DILocation(line: 1377, column: 32, scope: !1385)
!1390 = !DILocation(line: 1377, column: 35, scope: !1385)
!1391 = !DILocation(line: 1378, column: 12, scope: !1385)
!1392 = !DILocation(line: 1378, column: 3, scope: !1385)
!1393 = !DILocation(line: 1380, column: 12, scope: !1385)
!1394 = !DILocation(line: 1381, column: 29, scope: !1349)
!1395 = !DILocation(line: 1381, column: 38, scope: !1349)
!1396 = !DILocation(line: 1381, column: 13, scope: !1349)
!1397 = !DILocation(line: 1381, column: 11, scope: !1349)
!1398 = !DILocation(line: 1383, column: 5, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1349, file: !72, line: 1383, column: 5)
!1400 = !DILocation(line: 1383, column: 14, scope: !1399)
!1401 = !DILocation(line: 1383, column: 5, scope: !1349)
!1402 = !DILocation(line: 1385, column: 3, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1399, file: !72, line: 1384, column: 2)
!1404 = !DILocation(line: 1389, column: 10, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1399, file: !72, line: 1388, column: 2)
!1406 = !DILocation(line: 1389, column: 3, scope: !1405)
!1407 = !DILocation(line: 1440, column: 1, scope: !1349)
!1408 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !72, file: !72, line: 1455, type: !1409, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{!736, !736, !736}
!1411 = !DILocalVariable(name: "val1", arg: 1, scope: !1408, file: !72, line: 1455, type: !736)
!1412 = !DILocation(line: 1455, column: 25, scope: !1408)
!1413 = !DILocalVariable(name: "val2", arg: 2, scope: !1408, file: !72, line: 1455, type: !736)
!1414 = !DILocation(line: 1455, column: 35, scope: !1408)
!1415 = !DILocalVariable(name: "u32Temp1", scope: !1408, file: !72, line: 1457, type: !736)
!1416 = !DILocation(line: 1457, column: 6, scope: !1408)
!1417 = !DILocation(line: 1458, column: 5, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1408, file: !72, line: 1458, column: 5)
!1419 = !DILocation(line: 1458, column: 10, scope: !1418)
!1420 = !DILocation(line: 1458, column: 5, scope: !1408)
!1421 = !DILocation(line: 1460, column: 26, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1418, file: !72, line: 1459, column: 2)
!1423 = !DILocation(line: 1460, column: 25, scope: !1422)
!1424 = !DILocation(line: 1460, column: 12, scope: !1422)
!1425 = !DILocation(line: 1461, column: 6, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1422, file: !72, line: 1461, column: 6)
!1427 = !DILocation(line: 1461, column: 17, scope: !1426)
!1428 = !DILocation(line: 1461, column: 15, scope: !1426)
!1429 = !DILocation(line: 1461, column: 6, scope: !1422)
!1430 = !DILocation(line: 1463, column: 4, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1426, file: !72, line: 1462, column: 3)
!1432 = !DILocation(line: 1467, column: 12, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1426, file: !72, line: 1466, column: 3)
!1434 = !DILocation(line: 1467, column: 19, scope: !1433)
!1435 = !DILocation(line: 1467, column: 17, scope: !1433)
!1436 = !DILocation(line: 1467, column: 4, scope: !1433)
!1437 = !DILocation(line: 1472, column: 3, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1418, file: !72, line: 1471, column: 2)
!1439 = !DILocation(line: 1474, column: 1, scope: !1408)
!1440 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !72, file: !72, line: 1501, type: !1114, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1441 = !DILocalVariable(name: "value", arg: 1, scope: !1440, file: !72, line: 1501, type: !736)
!1442 = !DILocation(line: 1501, column: 30, scope: !1440)
!1443 = !DILocalVariable(name: "factor", arg: 2, scope: !1440, file: !72, line: 1501, type: !22)
!1444 = !DILocation(line: 1501, column: 41, scope: !1440)
!1445 = !DILocalVariable(name: "u32Temp1", scope: !1440, file: !72, line: 1503, type: !736)
!1446 = !DILocation(line: 1503, column: 6, scope: !1440)
!1447 = !DILocalVariable(name: "u32Temp2", scope: !1440, file: !72, line: 1503, type: !736)
!1448 = !DILocation(line: 1503, column: 20, scope: !1440)
!1449 = !DILocation(line: 1504, column: 13, scope: !1440)
!1450 = !DILocation(line: 1504, column: 21, scope: !1440)
!1451 = !DILocation(line: 1504, column: 19, scope: !1440)
!1452 = !DILocation(line: 1504, column: 11, scope: !1440)
!1453 = !DILocation(line: 1505, column: 25, scope: !1440)
!1454 = !DILocation(line: 1505, column: 32, scope: !1440)
!1455 = !DILocation(line: 1505, column: 13, scope: !1440)
!1456 = !DILocation(line: 1505, column: 11, scope: !1440)
!1457 = !DILocation(line: 1506, column: 14, scope: !1440)
!1458 = !DILocation(line: 1506, column: 23, scope: !1440)
!1459 = !DILocation(line: 1506, column: 11, scope: !1440)
!1460 = !DILocation(line: 1507, column: 14, scope: !1440)
!1461 = !DILocation(line: 1507, column: 23, scope: !1440)
!1462 = !DILocation(line: 1507, column: 11, scope: !1440)
!1463 = !DILocation(line: 1508, column: 9, scope: !1440)
!1464 = !DILocation(line: 1508, column: 2, scope: !1440)
!1465 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !72, file: !72, line: 1527, type: !1114, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1466 = !DILocalVariable(name: "value", arg: 1, scope: !1465, file: !72, line: 1527, type: !736)
!1467 = !DILocation(line: 1527, column: 30, scope: !1465)
!1468 = !DILocalVariable(name: "factor", arg: 2, scope: !1465, file: !72, line: 1527, type: !22)
!1469 = !DILocation(line: 1527, column: 41, scope: !1465)
!1470 = !DILocalVariable(name: "u32Temp1", scope: !1465, file: !72, line: 1529, type: !736)
!1471 = !DILocation(line: 1529, column: 6, scope: !1465)
!1472 = !DILocalVariable(name: "u32Temp2", scope: !1465, file: !72, line: 1529, type: !736)
!1473 = !DILocation(line: 1529, column: 20, scope: !1465)
!1474 = !DILocation(line: 1530, column: 13, scope: !1465)
!1475 = !DILocation(line: 1530, column: 21, scope: !1465)
!1476 = !DILocation(line: 1530, column: 19, scope: !1465)
!1477 = !DILocation(line: 1530, column: 11, scope: !1465)
!1478 = !DILocation(line: 1531, column: 25, scope: !1465)
!1479 = !DILocation(line: 1531, column: 32, scope: !1465)
!1480 = !DILocation(line: 1531, column: 13, scope: !1465)
!1481 = !DILocation(line: 1531, column: 11, scope: !1465)
!1482 = !DILocation(line: 1532, column: 13, scope: !1465)
!1483 = !DILocation(line: 1532, column: 22, scope: !1465)
!1484 = !DILocation(line: 1532, column: 11, scope: !1465)
!1485 = !DILocation(line: 1533, column: 14, scope: !1465)
!1486 = !DILocation(line: 1533, column: 23, scope: !1465)
!1487 = !DILocation(line: 1533, column: 11, scope: !1465)
!1488 = !DILocation(line: 1534, column: 6, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1465, file: !72, line: 1534, column: 5)
!1490 = !DILocation(line: 1534, column: 14, scope: !1489)
!1491 = !DILocation(line: 1534, column: 20, scope: !1489)
!1492 = !DILocation(line: 1534, column: 5, scope: !1465)
!1493 = !DILocation(line: 1536, column: 10, scope: !1494)
!1494 = distinct !DILexicalBlock(scope: !1489, file: !72, line: 1535, column: 2)
!1495 = !DILocation(line: 1536, column: 3, scope: !1494)
!1496 = !DILocation(line: 1540, column: 3, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1489, file: !72, line: 1539, column: 2)
!1498 = !DILocation(line: 1542, column: 1, scope: !1465)
!1499 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !72, file: !72, line: 1560, type: !1500, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1500 = !DISubroutineType(types: !1501)
!1501 = !{!736, !736, !13}
!1502 = !DILocalVariable(name: "value", arg: 1, scope: !1499, file: !72, line: 1560, type: !736)
!1503 = !DILocation(line: 1560, column: 30, scope: !1499)
!1504 = !DILocalVariable(name: "factor", arg: 2, scope: !1499, file: !72, line: 1560, type: !13)
!1505 = !DILocation(line: 1560, column: 41, scope: !1499)
!1506 = !DILocalVariable(name: "u32Temp1", scope: !1499, file: !72, line: 1562, type: !736)
!1507 = !DILocation(line: 1562, column: 6, scope: !1499)
!1508 = !DILocalVariable(name: "u32Temp2", scope: !1499, file: !72, line: 1562, type: !736)
!1509 = !DILocation(line: 1562, column: 20, scope: !1499)
!1510 = !DILocation(line: 1563, column: 5, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1499, file: !72, line: 1563, column: 5)
!1512 = !DILocation(line: 1563, column: 12, scope: !1511)
!1513 = !DILocation(line: 1563, column: 5, scope: !1499)
!1514 = !DILocation(line: 1566, column: 14, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1511, file: !72, line: 1564, column: 2)
!1516 = !DILocation(line: 1566, column: 22, scope: !1515)
!1517 = !DILocation(line: 1566, column: 20, scope: !1515)
!1518 = !DILocation(line: 1566, column: 12, scope: !1515)
!1519 = !DILocation(line: 1567, column: 26, scope: !1515)
!1520 = !DILocation(line: 1567, column: 33, scope: !1515)
!1521 = !DILocation(line: 1567, column: 14, scope: !1515)
!1522 = !DILocation(line: 1567, column: 12, scope: !1515)
!1523 = !DILocation(line: 1568, column: 14, scope: !1515)
!1524 = !DILocation(line: 1568, column: 23, scope: !1515)
!1525 = !DILocation(line: 1568, column: 12, scope: !1515)
!1526 = !DILocation(line: 1569, column: 15, scope: !1515)
!1527 = !DILocation(line: 1569, column: 24, scope: !1515)
!1528 = !DILocation(line: 1569, column: 12, scope: !1515)
!1529 = !DILocation(line: 1570, column: 10, scope: !1515)
!1530 = !DILocation(line: 1570, column: 3, scope: !1515)
!1531 = !DILocation(line: 1574, column: 3, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1511, file: !72, line: 1573, column: 2)
!1533 = !DILocation(line: 1576, column: 1, scope: !1499)
!1534 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !72, file: !72, line: 1595, type: !1500, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1535 = !DILocalVariable(name: "value", arg: 1, scope: !1534, file: !72, line: 1595, type: !736)
!1536 = !DILocation(line: 1595, column: 31, scope: !1534)
!1537 = !DILocalVariable(name: "factor", arg: 2, scope: !1534, file: !72, line: 1595, type: !13)
!1538 = !DILocation(line: 1595, column: 42, scope: !1534)
!1539 = !DILocalVariable(name: "u32Temp1", scope: !1534, file: !72, line: 1597, type: !736)
!1540 = !DILocation(line: 1597, column: 6, scope: !1534)
!1541 = !DILocalVariable(name: "u32Temp2", scope: !1534, file: !72, line: 1597, type: !736)
!1542 = !DILocation(line: 1597, column: 20, scope: !1534)
!1543 = !DILocation(line: 1598, column: 5, scope: !1544)
!1544 = distinct !DILexicalBlock(scope: !1534, file: !72, line: 1598, column: 5)
!1545 = !DILocation(line: 1598, column: 12, scope: !1544)
!1546 = !DILocation(line: 1598, column: 5, scope: !1534)
!1547 = !DILocation(line: 1600, column: 3, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1544, file: !72, line: 1599, column: 2)
!1549 = !DILocation(line: 1604, column: 14, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1544, file: !72, line: 1603, column: 2)
!1551 = !DILocation(line: 1604, column: 22, scope: !1550)
!1552 = !DILocation(line: 1604, column: 20, scope: !1550)
!1553 = !DILocation(line: 1604, column: 12, scope: !1550)
!1554 = !DILocation(line: 1605, column: 26, scope: !1550)
!1555 = !DILocation(line: 1605, column: 33, scope: !1550)
!1556 = !DILocation(line: 1605, column: 14, scope: !1550)
!1557 = !DILocation(line: 1605, column: 12, scope: !1550)
!1558 = !DILocation(line: 1606, column: 14, scope: !1550)
!1559 = !DILocation(line: 1606, column: 23, scope: !1550)
!1560 = !DILocation(line: 1606, column: 12, scope: !1550)
!1561 = !DILocation(line: 1607, column: 15, scope: !1550)
!1562 = !DILocation(line: 1607, column: 24, scope: !1550)
!1563 = !DILocation(line: 1607, column: 12, scope: !1550)
!1564 = !DILocation(line: 1608, column: 7, scope: !1565)
!1565 = distinct !DILexicalBlock(scope: !1550, file: !72, line: 1608, column: 6)
!1566 = !DILocation(line: 1608, column: 16, scope: !1565)
!1567 = !DILocation(line: 1608, column: 23, scope: !1565)
!1568 = !DILocation(line: 1608, column: 6, scope: !1550)
!1569 = !DILocation(line: 1610, column: 11, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1565, file: !72, line: 1609, column: 3)
!1571 = !DILocation(line: 1610, column: 4, scope: !1570)
!1572 = !DILocation(line: 1614, column: 4, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1565, file: !72, line: 1613, column: 3)
!1574 = !DILocation(line: 1617, column: 1, scope: !1534)
!1575 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !72, file: !72, line: 1632, type: !1409, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1576 = !DILocalVariable(name: "value", arg: 1, scope: !1575, file: !72, line: 1632, type: !736)
!1577 = !DILocation(line: 1632, column: 30, scope: !1575)
!1578 = !DILocalVariable(name: "factor", arg: 2, scope: !1575, file: !72, line: 1632, type: !736)
!1579 = !DILocation(line: 1632, column: 40, scope: !1575)
!1580 = !DILocation(line: 1634, column: 21, scope: !1575)
!1581 = !DILocation(line: 1634, column: 28, scope: !1575)
!1582 = !DILocation(line: 1634, column: 9, scope: !1575)
!1583 = !DILocation(line: 1634, column: 2, scope: !1575)
!1584 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !72, file: !72, line: 1653, type: !1409, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1585 = !DILocalVariable(name: "value", arg: 1, scope: !1584, file: !72, line: 1653, type: !736)
!1586 = !DILocation(line: 1653, column: 30, scope: !1584)
!1587 = !DILocalVariable(name: "factor", arg: 2, scope: !1584, file: !72, line: 1653, type: !736)
!1588 = !DILocation(line: 1653, column: 40, scope: !1584)
!1589 = !DILocalVariable(name: "u32Temp1", scope: !1584, file: !72, line: 1655, type: !736)
!1590 = !DILocation(line: 1655, column: 6, scope: !1584)
!1591 = !DILocalVariable(name: "u32Temp2", scope: !1584, file: !72, line: 1655, type: !736)
!1592 = !DILocation(line: 1655, column: 20, scope: !1584)
!1593 = !DILocation(line: 1656, column: 13, scope: !1584)
!1594 = !DILocation(line: 1656, column: 21, scope: !1584)
!1595 = !DILocation(line: 1656, column: 19, scope: !1584)
!1596 = !DILocation(line: 1656, column: 11, scope: !1584)
!1597 = !DILocation(line: 1657, column: 25, scope: !1584)
!1598 = !DILocation(line: 1657, column: 32, scope: !1584)
!1599 = !DILocation(line: 1657, column: 13, scope: !1584)
!1600 = !DILocation(line: 1657, column: 11, scope: !1584)
!1601 = !DILocation(line: 1658, column: 13, scope: !1584)
!1602 = !DILocation(line: 1658, column: 22, scope: !1584)
!1603 = !DILocation(line: 1658, column: 11, scope: !1584)
!1604 = !DILocation(line: 1659, column: 14, scope: !1584)
!1605 = !DILocation(line: 1659, column: 23, scope: !1584)
!1606 = !DILocation(line: 1659, column: 11, scope: !1584)
!1607 = !DILocation(line: 1660, column: 6, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1584, file: !72, line: 1660, column: 5)
!1609 = !DILocation(line: 1660, column: 14, scope: !1608)
!1610 = !DILocation(line: 1660, column: 20, scope: !1608)
!1611 = !DILocation(line: 1660, column: 5, scope: !1584)
!1612 = !DILocation(line: 1662, column: 10, scope: !1613)
!1613 = distinct !DILexicalBlock(scope: !1608, file: !72, line: 1661, column: 2)
!1614 = !DILocation(line: 1662, column: 3, scope: !1613)
!1615 = !DILocation(line: 1666, column: 3, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1608, file: !72, line: 1665, column: 2)
!1617 = !DILocation(line: 1668, column: 1, scope: !1584)
!1618 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !72, file: !72, line: 1686, type: !1318, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1619 = !DILocalVariable(name: "value", arg: 1, scope: !1618, file: !72, line: 1686, type: !736)
!1620 = !DILocation(line: 1686, column: 30, scope: !1618)
!1621 = !DILocalVariable(name: "factor", arg: 2, scope: !1618, file: !72, line: 1686, type: !80)
!1622 = !DILocation(line: 1686, column: 40, scope: !1618)
!1623 = !DILocalVariable(name: "u32Temp1", scope: !1618, file: !72, line: 1688, type: !736)
!1624 = !DILocation(line: 1688, column: 6, scope: !1618)
!1625 = !DILocalVariable(name: "u32Temp2", scope: !1618, file: !72, line: 1688, type: !736)
!1626 = !DILocation(line: 1688, column: 20, scope: !1618)
!1627 = !DILocation(line: 1689, column: 5, scope: !1628)
!1628 = distinct !DILexicalBlock(scope: !1618, file: !72, line: 1689, column: 5)
!1629 = !DILocation(line: 1689, column: 12, scope: !1628)
!1630 = !DILocation(line: 1689, column: 5, scope: !1618)
!1631 = !DILocation(line: 1691, column: 14, scope: !1632)
!1632 = distinct !DILexicalBlock(scope: !1628, file: !72, line: 1690, column: 2)
!1633 = !DILocation(line: 1691, column: 22, scope: !1632)
!1634 = !DILocation(line: 1691, column: 20, scope: !1632)
!1635 = !DILocation(line: 1691, column: 12, scope: !1632)
!1636 = !DILocation(line: 1692, column: 26, scope: !1632)
!1637 = !DILocation(line: 1692, column: 33, scope: !1632)
!1638 = !DILocation(line: 1692, column: 14, scope: !1632)
!1639 = !DILocation(line: 1692, column: 12, scope: !1632)
!1640 = !DILocation(line: 1693, column: 14, scope: !1632)
!1641 = !DILocation(line: 1693, column: 23, scope: !1632)
!1642 = !DILocation(line: 1693, column: 12, scope: !1632)
!1643 = !DILocation(line: 1694, column: 15, scope: !1632)
!1644 = !DILocation(line: 1694, column: 24, scope: !1632)
!1645 = !DILocation(line: 1694, column: 12, scope: !1632)
!1646 = !DILocation(line: 1695, column: 10, scope: !1632)
!1647 = !DILocation(line: 1695, column: 3, scope: !1632)
!1648 = !DILocation(line: 1699, column: 3, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1628, file: !72, line: 1698, column: 2)
!1650 = !DILocation(line: 1701, column: 1, scope: !1618)
!1651 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !72, file: !72, line: 1720, type: !1318, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1652 = !DILocalVariable(name: "value", arg: 1, scope: !1651, file: !72, line: 1720, type: !736)
!1653 = !DILocation(line: 1720, column: 30, scope: !1651)
!1654 = !DILocalVariable(name: "factor", arg: 2, scope: !1651, file: !72, line: 1720, type: !80)
!1655 = !DILocation(line: 1720, column: 40, scope: !1651)
!1656 = !DILocalVariable(name: "u32Temp1", scope: !1651, file: !72, line: 1722, type: !736)
!1657 = !DILocation(line: 1722, column: 6, scope: !1651)
!1658 = !DILocalVariable(name: "u32Temp2", scope: !1651, file: !72, line: 1722, type: !736)
!1659 = !DILocation(line: 1722, column: 20, scope: !1651)
!1660 = !DILocation(line: 1723, column: 5, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1651, file: !72, line: 1723, column: 5)
!1662 = !DILocation(line: 1723, column: 12, scope: !1661)
!1663 = !DILocation(line: 1723, column: 5, scope: !1651)
!1664 = !DILocation(line: 1725, column: 3, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1661, file: !72, line: 1724, column: 2)
!1666 = !DILocation(line: 1729, column: 14, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1661, file: !72, line: 1728, column: 2)
!1668 = !DILocation(line: 1729, column: 22, scope: !1667)
!1669 = !DILocation(line: 1729, column: 20, scope: !1667)
!1670 = !DILocation(line: 1729, column: 12, scope: !1667)
!1671 = !DILocation(line: 1730, column: 26, scope: !1667)
!1672 = !DILocation(line: 1730, column: 33, scope: !1667)
!1673 = !DILocation(line: 1730, column: 14, scope: !1667)
!1674 = !DILocation(line: 1730, column: 12, scope: !1667)
!1675 = !DILocation(line: 1731, column: 14, scope: !1667)
!1676 = !DILocation(line: 1731, column: 23, scope: !1667)
!1677 = !DILocation(line: 1731, column: 12, scope: !1667)
!1678 = !DILocation(line: 1732, column: 15, scope: !1667)
!1679 = !DILocation(line: 1732, column: 24, scope: !1667)
!1680 = !DILocation(line: 1732, column: 12, scope: !1667)
!1681 = !DILocation(line: 1733, column: 7, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1667, file: !72, line: 1733, column: 6)
!1683 = !DILocation(line: 1733, column: 15, scope: !1682)
!1684 = !DILocation(line: 1733, column: 21, scope: !1682)
!1685 = !DILocation(line: 1733, column: 6, scope: !1667)
!1686 = !DILocation(line: 1735, column: 11, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !72, line: 1734, column: 3)
!1688 = !DILocation(line: 1735, column: 4, scope: !1687)
!1689 = !DILocation(line: 1739, column: 4, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1682, file: !72, line: 1738, column: 3)
!1691 = !DILocation(line: 1742, column: 1, scope: !1651)
!1692 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !72, file: !72, line: 1757, type: !1693, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1693 = !DISubroutineType(types: !1694)
!1694 = !{!80, !736, !80}
!1695 = !DILocalVariable(name: "val1", arg: 1, scope: !1692, file: !72, line: 1757, type: !736)
!1696 = !DILocation(line: 1757, column: 25, scope: !1692)
!1697 = !DILocalVariable(name: "val2", arg: 2, scope: !1692, file: !72, line: 1757, type: !80)
!1698 = !DILocation(line: 1757, column: 35, scope: !1692)
!1699 = !DILocalVariable(name: "s32Val2prime", scope: !1692, file: !72, line: 1759, type: !80)
!1700 = !DILocation(line: 1759, column: 6, scope: !1692)
!1701 = !DILocation(line: 1760, column: 5, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1692, file: !72, line: 1760, column: 5)
!1703 = !DILocation(line: 1760, column: 10, scope: !1702)
!1704 = !DILocation(line: 1760, column: 5, scope: !1692)
!1705 = !DILocation(line: 1763, column: 44, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1707, file: !72, line: 1763, column: 7)
!1707 = distinct !DILexicalBlock(scope: !1702, file: !72, line: 1761, column: 2)
!1708 = !DILocation(line: 1763, column: 34, scope: !1706)
!1709 = !DILocation(line: 1763, column: 9, scope: !1706)
!1710 = !DILocation(line: 1763, column: 7, scope: !1707)
!1711 = !DILocation(line: 1764, column: 7, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !72, line: 1763, column: 53)
!1713 = !DILocation(line: 1771, column: 36, scope: !1707)
!1714 = !DILocation(line: 1771, column: 35, scope: !1707)
!1715 = !DILocation(line: 1771, column: 25, scope: !1707)
!1716 = !DILocation(line: 1771, column: 23, scope: !1707)
!1717 = !DILocation(line: 1772, column: 3, scope: !1707)
!1718 = !DILocation(line: 1774, column: 5, scope: !1719)
!1719 = distinct !DILexicalBlock(scope: !1692, file: !72, line: 1774, column: 5)
!1720 = !DILocation(line: 1774, column: 10, scope: !1719)
!1721 = !DILocation(line: 1774, column: 5, scope: !1692)
!1722 = !DILocation(line: 1776, column: 6, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !72, line: 1776, column: 6)
!1724 = distinct !DILexicalBlock(scope: !1719, file: !72, line: 1775, column: 2)
!1725 = !DILocation(line: 1776, column: 11, scope: !1723)
!1726 = !DILocation(line: 1776, column: 6, scope: !1724)
!1727 = !DILocation(line: 1778, column: 21, scope: !1728)
!1728 = distinct !DILexicalBlock(scope: !1729, file: !72, line: 1778, column: 7)
!1729 = distinct !DILexicalBlock(scope: !1723, file: !72, line: 1777, column: 3)
!1730 = !DILocation(line: 1778, column: 19, scope: !1728)
!1731 = !DILocation(line: 1778, column: 37, scope: !1728)
!1732 = !DILocation(line: 1778, column: 35, scope: !1728)
!1733 = !DILocation(line: 1778, column: 7, scope: !1729)
!1734 = !DILocation(line: 1780, column: 13, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1728, file: !72, line: 1779, column: 4)
!1736 = !DILocation(line: 1780, column: 20, scope: !1735)
!1737 = !DILocation(line: 1780, column: 18, scope: !1735)
!1738 = !DILocation(line: 1780, column: 5, scope: !1735)
!1739 = !DILocation(line: 1784, column: 5, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1728, file: !72, line: 1783, column: 4)
!1741 = !DILocation(line: 1789, column: 21, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !72, line: 1789, column: 7)
!1743 = distinct !DILexicalBlock(scope: !1723, file: !72, line: 1788, column: 3)
!1744 = !DILocation(line: 1789, column: 19, scope: !1742)
!1745 = !DILocation(line: 1789, column: 29, scope: !1742)
!1746 = !DILocation(line: 1789, column: 27, scope: !1742)
!1747 = !DILocation(line: 1789, column: 7, scope: !1743)
!1748 = !DILocation(line: 1791, column: 5, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1742, file: !72, line: 1790, column: 4)
!1750 = !DILocation(line: 1795, column: 13, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1742, file: !72, line: 1794, column: 4)
!1752 = !DILocation(line: 1795, column: 20, scope: !1751)
!1753 = !DILocation(line: 1795, column: 18, scope: !1751)
!1754 = !DILocation(line: 1795, column: 5, scope: !1751)
!1755 = !DILocation(line: 1801, column: 3, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1719, file: !72, line: 1800, column: 2)
!1757 = !DILocation(line: 1803, column: 1, scope: !1692)
!1758 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !1759, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1759 = !DISubroutineType(types: !1760)
!1760 = !{!49, !26}
!1761 = !DILocalVariable(name: "value", arg: 1, scope: !1758, file: !30, line: 42, type: !26)
!1762 = !DILocation(line: 42, column: 38, scope: !1758)
!1763 = !DILocation(line: 44, column: 12, scope: !1758)
!1764 = !DILocation(line: 44, column: 18, scope: !1758)
!1765 = !DILocation(line: 44, column: 5, scope: !1758)
!1766 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !72, file: !72, line: 1820, type: !772, scopeLine: 1821, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1767 = !DILocalVariable(name: "val1", arg: 1, scope: !1766, file: !72, line: 1820, type: !80)
!1768 = !DILocation(line: 1820, column: 30, scope: !1766)
!1769 = !DILocalVariable(name: "val2", arg: 2, scope: !1766, file: !72, line: 1820, type: !22)
!1770 = !DILocation(line: 1820, column: 39, scope: !1766)
!1771 = !DILocalVariable(name: "u32Temp1", scope: !1766, file: !72, line: 1822, type: !736)
!1772 = !DILocation(line: 1822, column: 6, scope: !1766)
!1773 = !DILocalVariable(name: "u32Temp2", scope: !1766, file: !72, line: 1822, type: !736)
!1774 = !DILocation(line: 1822, column: 17, scope: !1766)
!1775 = !DILocalVariable(name: "u32Temp3", scope: !1766, file: !72, line: 1822, type: !736)
!1776 = !DILocation(line: 1822, column: 26, scope: !1766)
!1777 = !DILocalVariable(name: "u8SignBit", scope: !1766, file: !72, line: 1823, type: !17)
!1778 = !DILocation(line: 1823, column: 5, scope: !1766)
!1779 = !DILocation(line: 1825, column: 5, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1766, file: !72, line: 1825, column: 5)
!1781 = !DILocation(line: 1825, column: 9, scope: !1780)
!1782 = !DILocation(line: 1825, column: 5, scope: !1766)
!1783 = !DILocation(line: 1827, column: 15, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1780, file: !72, line: 1826, column: 2)
!1785 = !DILocation(line: 1827, column: 14, scope: !1784)
!1786 = !DILocation(line: 1827, column: 12, scope: !1784)
!1787 = !DILocation(line: 1828, column: 13, scope: !1784)
!1788 = !DILocation(line: 1829, column: 2, scope: !1784)
!1789 = !DILocation(line: 1832, column: 14, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1780, file: !72, line: 1831, column: 2)
!1791 = !DILocation(line: 1832, column: 12, scope: !1790)
!1792 = !DILocation(line: 1833, column: 13, scope: !1790)
!1793 = !DILocation(line: 1836, column: 13, scope: !1766)
!1794 = !DILocation(line: 1836, column: 24, scope: !1766)
!1795 = !DILocation(line: 1836, column: 22, scope: !1766)
!1796 = !DILocation(line: 1836, column: 11, scope: !1766)
!1797 = !DILocation(line: 1837, column: 25, scope: !1766)
!1798 = !DILocation(line: 1837, column: 35, scope: !1766)
!1799 = !DILocation(line: 1837, column: 13, scope: !1766)
!1800 = !DILocation(line: 1837, column: 11, scope: !1766)
!1801 = !DILocation(line: 1838, column: 13, scope: !1766)
!1802 = !DILocation(line: 1838, column: 22, scope: !1766)
!1803 = !DILocation(line: 1838, column: 11, scope: !1766)
!1804 = !DILocation(line: 1839, column: 14, scope: !1766)
!1805 = !DILocation(line: 1839, column: 23, scope: !1766)
!1806 = !DILocation(line: 1839, column: 11, scope: !1766)
!1807 = !DILocation(line: 1840, column: 5, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1766, file: !72, line: 1840, column: 5)
!1809 = !DILocation(line: 1840, column: 15, scope: !1808)
!1810 = !DILocation(line: 1840, column: 5, scope: !1766)
!1811 = !DILocation(line: 1842, column: 10, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1808, file: !72, line: 1841, column: 2)
!1813 = !DILocation(line: 1842, column: 3, scope: !1812)
!1814 = !DILocation(line: 1846, column: 11, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1808, file: !72, line: 1845, column: 2)
!1816 = !DILocation(line: 1846, column: 10, scope: !1815)
!1817 = !DILocation(line: 1846, column: 3, scope: !1815)
!1818 = !DILocation(line: 1848, column: 1, scope: !1766)
!1819 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !72, file: !72, line: 1867, type: !772, scopeLine: 1868, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1820 = !DILocalVariable(name: "val1", arg: 1, scope: !1819, file: !72, line: 1867, type: !80)
!1821 = !DILocation(line: 1867, column: 30, scope: !1819)
!1822 = !DILocalVariable(name: "val2", arg: 2, scope: !1819, file: !72, line: 1867, type: !22)
!1823 = !DILocation(line: 1867, column: 39, scope: !1819)
!1824 = !DILocalVariable(name: "u32Temp1", scope: !1819, file: !72, line: 1869, type: !736)
!1825 = !DILocation(line: 1869, column: 6, scope: !1819)
!1826 = !DILocalVariable(name: "u32Temp2", scope: !1819, file: !72, line: 1869, type: !736)
!1827 = !DILocation(line: 1869, column: 17, scope: !1819)
!1828 = !DILocalVariable(name: "u32Temp3", scope: !1819, file: !72, line: 1869, type: !736)
!1829 = !DILocation(line: 1869, column: 26, scope: !1819)
!1830 = !DILocalVariable(name: "u8SignBit", scope: !1819, file: !72, line: 1870, type: !17)
!1831 = !DILocation(line: 1870, column: 5, scope: !1819)
!1832 = !DILocation(line: 1872, column: 5, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1819, file: !72, line: 1872, column: 5)
!1834 = !DILocation(line: 1872, column: 9, scope: !1833)
!1835 = !DILocation(line: 1872, column: 5, scope: !1819)
!1836 = !DILocation(line: 1874, column: 15, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1833, file: !72, line: 1873, column: 2)
!1838 = !DILocation(line: 1874, column: 14, scope: !1837)
!1839 = !DILocation(line: 1874, column: 12, scope: !1837)
!1840 = !DILocation(line: 1875, column: 13, scope: !1837)
!1841 = !DILocation(line: 1876, column: 2, scope: !1837)
!1842 = !DILocation(line: 1879, column: 14, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1833, file: !72, line: 1878, column: 2)
!1844 = !DILocation(line: 1879, column: 12, scope: !1843)
!1845 = !DILocation(line: 1880, column: 13, scope: !1843)
!1846 = !DILocation(line: 1883, column: 13, scope: !1819)
!1847 = !DILocation(line: 1883, column: 24, scope: !1819)
!1848 = !DILocation(line: 1883, column: 22, scope: !1819)
!1849 = !DILocation(line: 1883, column: 11, scope: !1819)
!1850 = !DILocation(line: 1884, column: 25, scope: !1819)
!1851 = !DILocation(line: 1884, column: 35, scope: !1819)
!1852 = !DILocation(line: 1884, column: 13, scope: !1819)
!1853 = !DILocation(line: 1884, column: 11, scope: !1819)
!1854 = !DILocation(line: 1885, column: 13, scope: !1819)
!1855 = !DILocation(line: 1885, column: 22, scope: !1819)
!1856 = !DILocation(line: 1885, column: 11, scope: !1819)
!1857 = !DILocation(line: 1886, column: 14, scope: !1819)
!1858 = !DILocation(line: 1886, column: 23, scope: !1819)
!1859 = !DILocation(line: 1886, column: 11, scope: !1819)
!1860 = !DILocation(line: 1887, column: 5, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1819, file: !72, line: 1887, column: 5)
!1862 = !DILocation(line: 1887, column: 15, scope: !1861)
!1863 = !DILocation(line: 1887, column: 5, scope: !1819)
!1864 = !DILocation(line: 1889, column: 6, scope: !1865)
!1865 = distinct !DILexicalBlock(scope: !1866, file: !72, line: 1889, column: 6)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !72, line: 1888, column: 2)
!1867 = !DILocation(line: 1889, column: 14, scope: !1865)
!1868 = !DILocation(line: 1889, column: 6, scope: !1866)
!1869 = !DILocation(line: 1890, column: 11, scope: !1865)
!1870 = !DILocation(line: 1890, column: 4, scope: !1865)
!1871 = !DILocation(line: 1892, column: 4, scope: !1865)
!1872 = !DILocation(line: 1896, column: 6, scope: !1873)
!1873 = distinct !DILexicalBlock(scope: !1874, file: !72, line: 1896, column: 6)
!1874 = distinct !DILexicalBlock(scope: !1861, file: !72, line: 1895, column: 2)
!1875 = !DILocation(line: 1896, column: 14, scope: !1873)
!1876 = !DILocation(line: 1896, column: 6, scope: !1874)
!1877 = !DILocation(line: 1897, column: 12, scope: !1873)
!1878 = !DILocation(line: 1897, column: 11, scope: !1873)
!1879 = !DILocation(line: 1897, column: 4, scope: !1873)
!1880 = !DILocation(line: 1899, column: 4, scope: !1873)
!1881 = !DILocation(line: 1901, column: 1, scope: !1819)
!1882 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !72, file: !72, line: 1921, type: !1883, scopeLine: 1922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1883 = !DISubroutineType(types: !1884)
!1884 = !{!80, !80, !13}
!1885 = !DILocalVariable(name: "val1", arg: 1, scope: !1882, file: !72, line: 1921, type: !80)
!1886 = !DILocation(line: 1921, column: 30, scope: !1882)
!1887 = !DILocalVariable(name: "val2", arg: 2, scope: !1882, file: !72, line: 1921, type: !13)
!1888 = !DILocation(line: 1921, column: 39, scope: !1882)
!1889 = !DILocalVariable(name: "u32Temp1", scope: !1882, file: !72, line: 1923, type: !736)
!1890 = !DILocation(line: 1923, column: 6, scope: !1882)
!1891 = !DILocalVariable(name: "u32Temp2", scope: !1882, file: !72, line: 1923, type: !736)
!1892 = !DILocation(line: 1923, column: 17, scope: !1882)
!1893 = !DILocalVariable(name: "u32Temp3", scope: !1882, file: !72, line: 1923, type: !736)
!1894 = !DILocation(line: 1923, column: 26, scope: !1882)
!1895 = !DILocalVariable(name: "u32Temp4", scope: !1882, file: !72, line: 1923, type: !736)
!1896 = !DILocation(line: 1923, column: 35, scope: !1882)
!1897 = !DILocalVariable(name: "u8SignBit", scope: !1882, file: !72, line: 1924, type: !17)
!1898 = !DILocation(line: 1924, column: 5, scope: !1882)
!1899 = !DILocation(line: 1926, column: 7, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1882, file: !72, line: 1926, column: 5)
!1901 = !DILocation(line: 1926, column: 11, scope: !1900)
!1902 = !DILocation(line: 1926, column: 15, scope: !1900)
!1903 = !DILocation(line: 1926, column: 19, scope: !1900)
!1904 = !DILocation(line: 1926, column: 23, scope: !1900)
!1905 = !DILocation(line: 1926, column: 28, scope: !1900)
!1906 = !DILocation(line: 1926, column: 33, scope: !1900)
!1907 = !DILocation(line: 1926, column: 37, scope: !1900)
!1908 = !DILocation(line: 1926, column: 41, scope: !1900)
!1909 = !DILocation(line: 1926, column: 45, scope: !1900)
!1910 = !DILocation(line: 1926, column: 49, scope: !1900)
!1911 = !DILocation(line: 1926, column: 5, scope: !1882)
!1912 = !DILocation(line: 1928, column: 13, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1900, file: !72, line: 1927, column: 2)
!1914 = !DILocation(line: 1929, column: 2, scope: !1913)
!1915 = !DILocation(line: 1932, column: 13, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1900, file: !72, line: 1931, column: 2)
!1917 = !DILocation(line: 1935, column: 5, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1882, file: !72, line: 1935, column: 5)
!1919 = !DILocation(line: 1935, column: 9, scope: !1918)
!1920 = !DILocation(line: 1935, column: 5, scope: !1882)
!1921 = !DILocation(line: 1937, column: 15, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1918, file: !72, line: 1936, column: 2)
!1923 = !DILocation(line: 1937, column: 14, scope: !1922)
!1924 = !DILocation(line: 1937, column: 12, scope: !1922)
!1925 = !DILocation(line: 1938, column: 2, scope: !1922)
!1926 = !DILocation(line: 1941, column: 14, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1918, file: !72, line: 1940, column: 2)
!1928 = !DILocation(line: 1941, column: 12, scope: !1927)
!1929 = !DILocation(line: 1944, column: 5, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1882, file: !72, line: 1944, column: 5)
!1931 = !DILocation(line: 1944, column: 9, scope: !1930)
!1932 = !DILocation(line: 1944, column: 5, scope: !1882)
!1933 = !DILocation(line: 1946, column: 15, scope: !1934)
!1934 = distinct !DILexicalBlock(scope: !1930, file: !72, line: 1945, column: 2)
!1935 = !DILocation(line: 1946, column: 14, scope: !1934)
!1936 = !DILocation(line: 1946, column: 12, scope: !1934)
!1937 = !DILocation(line: 1947, column: 2, scope: !1934)
!1938 = !DILocation(line: 1950, column: 14, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1930, file: !72, line: 1949, column: 2)
!1940 = !DILocation(line: 1950, column: 12, scope: !1939)
!1941 = !DILocation(line: 1953, column: 13, scope: !1882)
!1942 = !DILocation(line: 1953, column: 24, scope: !1882)
!1943 = !DILocation(line: 1953, column: 22, scope: !1882)
!1944 = !DILocation(line: 1953, column: 11, scope: !1882)
!1945 = !DILocation(line: 1954, column: 25, scope: !1882)
!1946 = !DILocation(line: 1954, column: 35, scope: !1882)
!1947 = !DILocation(line: 1954, column: 13, scope: !1882)
!1948 = !DILocation(line: 1954, column: 11, scope: !1882)
!1949 = !DILocation(line: 1955, column: 13, scope: !1882)
!1950 = !DILocation(line: 1955, column: 22, scope: !1882)
!1951 = !DILocation(line: 1955, column: 11, scope: !1882)
!1952 = !DILocation(line: 1956, column: 14, scope: !1882)
!1953 = !DILocation(line: 1956, column: 23, scope: !1882)
!1954 = !DILocation(line: 1956, column: 11, scope: !1882)
!1955 = !DILocation(line: 1957, column: 5, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1882, file: !72, line: 1957, column: 5)
!1957 = !DILocation(line: 1957, column: 15, scope: !1956)
!1958 = !DILocation(line: 1957, column: 5, scope: !1882)
!1959 = !DILocation(line: 1959, column: 6, scope: !1960)
!1960 = distinct !DILexicalBlock(scope: !1961, file: !72, line: 1959, column: 6)
!1961 = distinct !DILexicalBlock(scope: !1956, file: !72, line: 1958, column: 2)
!1962 = !DILocation(line: 1959, column: 14, scope: !1960)
!1963 = !DILocation(line: 1959, column: 6, scope: !1961)
!1964 = !DILocation(line: 1960, column: 11, scope: !1960)
!1965 = !DILocation(line: 1960, column: 4, scope: !1960)
!1966 = !DILocation(line: 1962, column: 4, scope: !1960)
!1967 = !DILocation(line: 1966, column: 11, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1956, file: !72, line: 1965, column: 2)
!1969 = !DILocation(line: 1966, column: 10, scope: !1968)
!1970 = !DILocation(line: 1966, column: 3, scope: !1968)
!1971 = !DILocation(line: 1968, column: 1, scope: !1882)
!1972 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !72, file: !72, line: 1987, type: !1883, scopeLine: 1988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1973 = !DILocalVariable(name: "val1", arg: 1, scope: !1972, file: !72, line: 1987, type: !80)
!1974 = !DILocation(line: 1987, column: 30, scope: !1972)
!1975 = !DILocalVariable(name: "val2", arg: 2, scope: !1972, file: !72, line: 1987, type: !13)
!1976 = !DILocation(line: 1987, column: 39, scope: !1972)
!1977 = !DILocalVariable(name: "u32Temp1", scope: !1972, file: !72, line: 1989, type: !736)
!1978 = !DILocation(line: 1989, column: 6, scope: !1972)
!1979 = !DILocalVariable(name: "u32Temp2", scope: !1972, file: !72, line: 1989, type: !736)
!1980 = !DILocation(line: 1989, column: 17, scope: !1972)
!1981 = !DILocalVariable(name: "u32Temp3", scope: !1972, file: !72, line: 1989, type: !736)
!1982 = !DILocation(line: 1989, column: 26, scope: !1972)
!1983 = !DILocalVariable(name: "u32Temp4", scope: !1972, file: !72, line: 1989, type: !736)
!1984 = !DILocation(line: 1989, column: 35, scope: !1972)
!1985 = !DILocalVariable(name: "u8SignBit", scope: !1972, file: !72, line: 1990, type: !17)
!1986 = !DILocation(line: 1990, column: 5, scope: !1972)
!1987 = !DILocation(line: 1992, column: 7, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1972, file: !72, line: 1992, column: 5)
!1989 = !DILocation(line: 1992, column: 11, scope: !1988)
!1990 = !DILocation(line: 1992, column: 15, scope: !1988)
!1991 = !DILocation(line: 1992, column: 19, scope: !1988)
!1992 = !DILocation(line: 1992, column: 23, scope: !1988)
!1993 = !DILocation(line: 1992, column: 28, scope: !1988)
!1994 = !DILocation(line: 1992, column: 33, scope: !1988)
!1995 = !DILocation(line: 1992, column: 37, scope: !1988)
!1996 = !DILocation(line: 1992, column: 41, scope: !1988)
!1997 = !DILocation(line: 1992, column: 45, scope: !1988)
!1998 = !DILocation(line: 1992, column: 49, scope: !1988)
!1999 = !DILocation(line: 1992, column: 5, scope: !1972)
!2000 = !DILocation(line: 1994, column: 13, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1988, file: !72, line: 1993, column: 2)
!2002 = !DILocation(line: 1995, column: 2, scope: !2001)
!2003 = !DILocation(line: 1998, column: 13, scope: !2004)
!2004 = distinct !DILexicalBlock(scope: !1988, file: !72, line: 1997, column: 2)
!2005 = !DILocation(line: 2001, column: 5, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1972, file: !72, line: 2001, column: 5)
!2007 = !DILocation(line: 2001, column: 9, scope: !2006)
!2008 = !DILocation(line: 2001, column: 5, scope: !1972)
!2009 = !DILocation(line: 2003, column: 15, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !2006, file: !72, line: 2002, column: 2)
!2011 = !DILocation(line: 2003, column: 14, scope: !2010)
!2012 = !DILocation(line: 2003, column: 12, scope: !2010)
!2013 = !DILocation(line: 2004, column: 2, scope: !2010)
!2014 = !DILocation(line: 2007, column: 14, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !2006, file: !72, line: 2006, column: 2)
!2016 = !DILocation(line: 2007, column: 12, scope: !2015)
!2017 = !DILocation(line: 2010, column: 5, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !1972, file: !72, line: 2010, column: 5)
!2019 = !DILocation(line: 2010, column: 9, scope: !2018)
!2020 = !DILocation(line: 2010, column: 5, scope: !1972)
!2021 = !DILocation(line: 2012, column: 15, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2018, file: !72, line: 2011, column: 2)
!2023 = !DILocation(line: 2012, column: 14, scope: !2022)
!2024 = !DILocation(line: 2012, column: 12, scope: !2022)
!2025 = !DILocation(line: 2013, column: 2, scope: !2022)
!2026 = !DILocation(line: 2016, column: 14, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !2018, file: !72, line: 2015, column: 2)
!2028 = !DILocation(line: 2016, column: 12, scope: !2027)
!2029 = !DILocation(line: 2019, column: 13, scope: !1972)
!2030 = !DILocation(line: 2019, column: 24, scope: !1972)
!2031 = !DILocation(line: 2019, column: 22, scope: !1972)
!2032 = !DILocation(line: 2019, column: 11, scope: !1972)
!2033 = !DILocation(line: 2020, column: 25, scope: !1972)
!2034 = !DILocation(line: 2020, column: 35, scope: !1972)
!2035 = !DILocation(line: 2020, column: 13, scope: !1972)
!2036 = !DILocation(line: 2020, column: 11, scope: !1972)
!2037 = !DILocation(line: 2021, column: 13, scope: !1972)
!2038 = !DILocation(line: 2021, column: 22, scope: !1972)
!2039 = !DILocation(line: 2021, column: 11, scope: !1972)
!2040 = !DILocation(line: 2022, column: 14, scope: !1972)
!2041 = !DILocation(line: 2022, column: 23, scope: !1972)
!2042 = !DILocation(line: 2022, column: 11, scope: !1972)
!2043 = !DILocation(line: 2023, column: 6, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !1972, file: !72, line: 2023, column: 5)
!2045 = !DILocation(line: 2023, column: 14, scope: !2044)
!2046 = !DILocation(line: 2023, column: 19, scope: !2044)
!2047 = !DILocation(line: 2023, column: 5, scope: !1972)
!2048 = !DILocation(line: 2025, column: 6, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2050, file: !72, line: 2025, column: 6)
!2050 = distinct !DILexicalBlock(scope: !2044, file: !72, line: 2024, column: 2)
!2051 = !DILocation(line: 2025, column: 16, scope: !2049)
!2052 = !DILocation(line: 2025, column: 6, scope: !2050)
!2053 = !DILocation(line: 2027, column: 7, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2055, file: !72, line: 2027, column: 7)
!2055 = distinct !DILexicalBlock(scope: !2049, file: !72, line: 2026, column: 3)
!2056 = !DILocation(line: 2027, column: 15, scope: !2054)
!2057 = !DILocation(line: 2027, column: 7, scope: !2055)
!2058 = !DILocation(line: 2028, column: 12, scope: !2054)
!2059 = !DILocation(line: 2028, column: 5, scope: !2054)
!2060 = !DILocation(line: 2030, column: 5, scope: !2054)
!2061 = !DILocation(line: 2034, column: 7, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2063, file: !72, line: 2034, column: 7)
!2063 = distinct !DILexicalBlock(scope: !2049, file: !72, line: 2033, column: 3)
!2064 = !DILocation(line: 2034, column: 15, scope: !2062)
!2065 = !DILocation(line: 2034, column: 7, scope: !2063)
!2066 = !DILocation(line: 2035, column: 13, scope: !2062)
!2067 = !DILocation(line: 2035, column: 12, scope: !2062)
!2068 = !DILocation(line: 2035, column: 5, scope: !2062)
!2069 = !DILocation(line: 2037, column: 5, scope: !2062)
!2070 = !DILocation(line: 2042, column: 3, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2044, file: !72, line: 2041, column: 2)
!2072 = !DILocation(line: 2044, column: 1, scope: !1972)
!2073 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !72, file: !72, line: 2059, type: !2074, scopeLine: 2060, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2074 = !DISubroutineType(types: !2075)
!2075 = !{!80, !80, !736}
!2076 = !DILocalVariable(name: "val1", arg: 1, scope: !2073, file: !72, line: 2059, type: !80)
!2077 = !DILocation(line: 2059, column: 30, scope: !2073)
!2078 = !DILocalVariable(name: "val2", arg: 2, scope: !2073, file: !72, line: 2059, type: !736)
!2079 = !DILocation(line: 2059, column: 39, scope: !2073)
!2080 = !DILocalVariable(name: "u32Temp1", scope: !2073, file: !72, line: 2061, type: !736)
!2081 = !DILocation(line: 2061, column: 6, scope: !2073)
!2082 = !DILocalVariable(name: "u32Temp2", scope: !2073, file: !72, line: 2061, type: !736)
!2083 = !DILocation(line: 2061, column: 17, scope: !2073)
!2084 = !DILocalVariable(name: "u8SignBit", scope: !2073, file: !72, line: 2062, type: !17)
!2085 = !DILocation(line: 2062, column: 5, scope: !2073)
!2086 = !DILocation(line: 2064, column: 5, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2073, file: !72, line: 2064, column: 5)
!2088 = !DILocation(line: 2064, column: 9, scope: !2087)
!2089 = !DILocation(line: 2064, column: 5, scope: !2073)
!2090 = !DILocation(line: 2066, column: 15, scope: !2091)
!2091 = distinct !DILexicalBlock(scope: !2087, file: !72, line: 2065, column: 2)
!2092 = !DILocation(line: 2066, column: 14, scope: !2091)
!2093 = !DILocation(line: 2066, column: 12, scope: !2091)
!2094 = !DILocation(line: 2067, column: 13, scope: !2091)
!2095 = !DILocation(line: 2068, column: 2, scope: !2091)
!2096 = !DILocation(line: 2071, column: 14, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2087, file: !72, line: 2070, column: 2)
!2098 = !DILocation(line: 2071, column: 12, scope: !2097)
!2099 = !DILocation(line: 2072, column: 13, scope: !2097)
!2100 = !DILocation(line: 2075, column: 25, scope: !2073)
!2101 = !DILocation(line: 2075, column: 35, scope: !2073)
!2102 = !DILocation(line: 2075, column: 13, scope: !2073)
!2103 = !DILocation(line: 2075, column: 11, scope: !2073)
!2104 = !DILocation(line: 2076, column: 5, scope: !2105)
!2105 = distinct !DILexicalBlock(scope: !2073, file: !72, line: 2076, column: 5)
!2106 = !DILocation(line: 2076, column: 15, scope: !2105)
!2107 = !DILocation(line: 2076, column: 5, scope: !2073)
!2108 = !DILocation(line: 2077, column: 10, scope: !2105)
!2109 = !DILocation(line: 2077, column: 3, scope: !2105)
!2110 = !DILocation(line: 2079, column: 11, scope: !2105)
!2111 = !DILocation(line: 2079, column: 10, scope: !2105)
!2112 = !DILocation(line: 2079, column: 3, scope: !2105)
!2113 = !DILocation(line: 2080, column: 1, scope: !2073)
!2114 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !72, file: !72, line: 2099, type: !2074, scopeLine: 2100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2115 = !DILocalVariable(name: "val1", arg: 1, scope: !2114, file: !72, line: 2099, type: !80)
!2116 = !DILocation(line: 2099, column: 30, scope: !2114)
!2117 = !DILocalVariable(name: "val2", arg: 2, scope: !2114, file: !72, line: 2099, type: !736)
!2118 = !DILocation(line: 2099, column: 39, scope: !2114)
!2119 = !DILocalVariable(name: "u32Temp1", scope: !2114, file: !72, line: 2101, type: !736)
!2120 = !DILocation(line: 2101, column: 6, scope: !2114)
!2121 = !DILocalVariable(name: "u32Temp2", scope: !2114, file: !72, line: 2101, type: !736)
!2122 = !DILocation(line: 2101, column: 17, scope: !2114)
!2123 = !DILocalVariable(name: "u32Temp3", scope: !2114, file: !72, line: 2101, type: !736)
!2124 = !DILocation(line: 2101, column: 26, scope: !2114)
!2125 = !DILocalVariable(name: "u8SignBit", scope: !2114, file: !72, line: 2102, type: !17)
!2126 = !DILocation(line: 2102, column: 5, scope: !2114)
!2127 = !DILocation(line: 2104, column: 5, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2114, file: !72, line: 2104, column: 5)
!2129 = !DILocation(line: 2104, column: 9, scope: !2128)
!2130 = !DILocation(line: 2104, column: 5, scope: !2114)
!2131 = !DILocation(line: 2106, column: 15, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2128, file: !72, line: 2105, column: 2)
!2133 = !DILocation(line: 2106, column: 14, scope: !2132)
!2134 = !DILocation(line: 2106, column: 12, scope: !2132)
!2135 = !DILocation(line: 2107, column: 13, scope: !2132)
!2136 = !DILocation(line: 2108, column: 2, scope: !2132)
!2137 = !DILocation(line: 2111, column: 14, scope: !2138)
!2138 = distinct !DILexicalBlock(scope: !2128, file: !72, line: 2110, column: 2)
!2139 = !DILocation(line: 2111, column: 12, scope: !2138)
!2140 = !DILocation(line: 2112, column: 13, scope: !2138)
!2141 = !DILocation(line: 2115, column: 13, scope: !2114)
!2142 = !DILocation(line: 2115, column: 24, scope: !2114)
!2143 = !DILocation(line: 2115, column: 22, scope: !2114)
!2144 = !DILocation(line: 2115, column: 11, scope: !2114)
!2145 = !DILocation(line: 2116, column: 25, scope: !2114)
!2146 = !DILocation(line: 2116, column: 35, scope: !2114)
!2147 = !DILocation(line: 2116, column: 13, scope: !2114)
!2148 = !DILocation(line: 2116, column: 11, scope: !2114)
!2149 = !DILocation(line: 2117, column: 13, scope: !2114)
!2150 = !DILocation(line: 2117, column: 22, scope: !2114)
!2151 = !DILocation(line: 2117, column: 11, scope: !2114)
!2152 = !DILocation(line: 2118, column: 14, scope: !2114)
!2153 = !DILocation(line: 2118, column: 23, scope: !2114)
!2154 = !DILocation(line: 2118, column: 11, scope: !2114)
!2155 = !DILocation(line: 2119, column: 5, scope: !2156)
!2156 = distinct !DILexicalBlock(scope: !2114, file: !72, line: 2119, column: 5)
!2157 = !DILocation(line: 2119, column: 15, scope: !2156)
!2158 = !DILocation(line: 2119, column: 5, scope: !2114)
!2159 = !DILocation(line: 2121, column: 6, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2161, file: !72, line: 2121, column: 6)
!2161 = distinct !DILexicalBlock(scope: !2156, file: !72, line: 2120, column: 2)
!2162 = !DILocation(line: 2121, column: 14, scope: !2160)
!2163 = !DILocation(line: 2121, column: 6, scope: !2161)
!2164 = !DILocation(line: 2122, column: 11, scope: !2160)
!2165 = !DILocation(line: 2122, column: 4, scope: !2160)
!2166 = !DILocation(line: 2124, column: 4, scope: !2160)
!2167 = !DILocation(line: 2128, column: 6, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2169, file: !72, line: 2128, column: 6)
!2169 = distinct !DILexicalBlock(scope: !2156, file: !72, line: 2127, column: 2)
!2170 = !DILocation(line: 2128, column: 14, scope: !2168)
!2171 = !DILocation(line: 2128, column: 6, scope: !2169)
!2172 = !DILocation(line: 2129, column: 12, scope: !2168)
!2173 = !DILocation(line: 2129, column: 11, scope: !2168)
!2174 = !DILocation(line: 2129, column: 4, scope: !2168)
!2175 = !DILocation(line: 2131, column: 4, scope: !2168)
!2176 = !DILocation(line: 2133, column: 1, scope: !2114)
!2177 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !72, file: !72, line: 2151, type: !2178, scopeLine: 2152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2178 = !DISubroutineType(types: !2179)
!2179 = !{!80, !80, !80}
!2180 = !DILocalVariable(name: "value", arg: 1, scope: !2177, file: !72, line: 2151, type: !80)
!2181 = !DILocation(line: 2151, column: 30, scope: !2177)
!2182 = !DILocalVariable(name: "factor", arg: 2, scope: !2177, file: !72, line: 2151, type: !80)
!2183 = !DILocation(line: 2151, column: 41, scope: !2177)
!2184 = !DILocalVariable(name: "u32Temp1", scope: !2177, file: !72, line: 2153, type: !736)
!2185 = !DILocation(line: 2153, column: 6, scope: !2177)
!2186 = !DILocalVariable(name: "u32Temp2", scope: !2177, file: !72, line: 2153, type: !736)
!2187 = !DILocation(line: 2153, column: 17, scope: !2177)
!2188 = !DILocalVariable(name: "u32Temp3", scope: !2177, file: !72, line: 2153, type: !736)
!2189 = !DILocation(line: 2153, column: 26, scope: !2177)
!2190 = !DILocalVariable(name: "u32Temp4", scope: !2177, file: !72, line: 2153, type: !736)
!2191 = !DILocation(line: 2153, column: 35, scope: !2177)
!2192 = !DILocalVariable(name: "u8SignBit", scope: !2177, file: !72, line: 2154, type: !17)
!2193 = !DILocation(line: 2154, column: 5, scope: !2177)
!2194 = !DILocation(line: 2156, column: 7, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2177, file: !72, line: 2156, column: 5)
!2196 = !DILocation(line: 2156, column: 12, scope: !2195)
!2197 = !DILocation(line: 2156, column: 16, scope: !2195)
!2198 = !DILocation(line: 2156, column: 36, scope: !2195)
!2199 = !DILocation(line: 2156, column: 41, scope: !2195)
!2200 = !DILocation(line: 2156, column: 45, scope: !2195)
!2201 = !DILocation(line: 2158, column: 13, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2195, file: !72, line: 2157, column: 2)
!2203 = !DILocation(line: 2159, column: 2, scope: !2202)
!2204 = !DILocation(line: 2162, column: 13, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2195, file: !72, line: 2161, column: 2)
!2206 = !DILocation(line: 2165, column: 5, scope: !2207)
!2207 = distinct !DILexicalBlock(scope: !2177, file: !72, line: 2165, column: 5)
!2208 = !DILocation(line: 2165, column: 10, scope: !2207)
!2209 = !DILocation(line: 2165, column: 5, scope: !2177)
!2210 = !DILocation(line: 2167, column: 15, scope: !2211)
!2211 = distinct !DILexicalBlock(scope: !2207, file: !72, line: 2166, column: 2)
!2212 = !DILocation(line: 2167, column: 14, scope: !2211)
!2213 = !DILocation(line: 2167, column: 12, scope: !2211)
!2214 = !DILocation(line: 2168, column: 2, scope: !2211)
!2215 = !DILocation(line: 2171, column: 14, scope: !2216)
!2216 = distinct !DILexicalBlock(scope: !2207, file: !72, line: 2170, column: 2)
!2217 = !DILocation(line: 2171, column: 12, scope: !2216)
!2218 = !DILocation(line: 2174, column: 5, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2177, file: !72, line: 2174, column: 5)
!2220 = !DILocation(line: 2174, column: 11, scope: !2219)
!2221 = !DILocation(line: 2174, column: 5, scope: !2177)
!2222 = !DILocation(line: 2176, column: 15, scope: !2223)
!2223 = distinct !DILexicalBlock(scope: !2219, file: !72, line: 2175, column: 2)
!2224 = !DILocation(line: 2176, column: 14, scope: !2223)
!2225 = !DILocation(line: 2176, column: 12, scope: !2223)
!2226 = !DILocation(line: 2177, column: 2, scope: !2223)
!2227 = !DILocation(line: 2180, column: 14, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2219, file: !72, line: 2179, column: 2)
!2229 = !DILocation(line: 2180, column: 12, scope: !2228)
!2230 = !DILocation(line: 2183, column: 13, scope: !2177)
!2231 = !DILocation(line: 2183, column: 24, scope: !2177)
!2232 = !DILocation(line: 2183, column: 22, scope: !2177)
!2233 = !DILocation(line: 2183, column: 11, scope: !2177)
!2234 = !DILocation(line: 2184, column: 25, scope: !2177)
!2235 = !DILocation(line: 2184, column: 35, scope: !2177)
!2236 = !DILocation(line: 2184, column: 13, scope: !2177)
!2237 = !DILocation(line: 2184, column: 11, scope: !2177)
!2238 = !DILocation(line: 2185, column: 13, scope: !2177)
!2239 = !DILocation(line: 2185, column: 22, scope: !2177)
!2240 = !DILocation(line: 2185, column: 11, scope: !2177)
!2241 = !DILocation(line: 2186, column: 14, scope: !2177)
!2242 = !DILocation(line: 2186, column: 23, scope: !2177)
!2243 = !DILocation(line: 2186, column: 11, scope: !2177)
!2244 = !DILocation(line: 2187, column: 5, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2177, file: !72, line: 2187, column: 5)
!2246 = !DILocation(line: 2187, column: 15, scope: !2245)
!2247 = !DILocation(line: 2187, column: 5, scope: !2177)
!2248 = !DILocation(line: 2189, column: 6, scope: !2249)
!2249 = distinct !DILexicalBlock(scope: !2250, file: !72, line: 2189, column: 6)
!2250 = distinct !DILexicalBlock(scope: !2245, file: !72, line: 2188, column: 2)
!2251 = !DILocation(line: 2189, column: 14, scope: !2249)
!2252 = !DILocation(line: 2189, column: 6, scope: !2250)
!2253 = !DILocation(line: 2190, column: 11, scope: !2249)
!2254 = !DILocation(line: 2190, column: 4, scope: !2249)
!2255 = !DILocation(line: 2192, column: 4, scope: !2249)
!2256 = !DILocation(line: 2196, column: 11, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2245, file: !72, line: 2195, column: 2)
!2258 = !DILocation(line: 2196, column: 10, scope: !2257)
!2259 = !DILocation(line: 2196, column: 3, scope: !2257)
!2260 = !DILocation(line: 2198, column: 1, scope: !2177)
!2261 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !72, file: !72, line: 2217, type: !2178, scopeLine: 2218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2262 = !DILocalVariable(name: "value", arg: 1, scope: !2261, file: !72, line: 2217, type: !80)
!2263 = !DILocation(line: 2217, column: 30, scope: !2261)
!2264 = !DILocalVariable(name: "factor", arg: 2, scope: !2261, file: !72, line: 2217, type: !80)
!2265 = !DILocation(line: 2217, column: 41, scope: !2261)
!2266 = !DILocalVariable(name: "u32Temp1", scope: !2261, file: !72, line: 2219, type: !736)
!2267 = !DILocation(line: 2219, column: 6, scope: !2261)
!2268 = !DILocalVariable(name: "u32Temp2", scope: !2261, file: !72, line: 2219, type: !736)
!2269 = !DILocation(line: 2219, column: 17, scope: !2261)
!2270 = !DILocalVariable(name: "u32Temp3", scope: !2261, file: !72, line: 2219, type: !736)
!2271 = !DILocation(line: 2219, column: 26, scope: !2261)
!2272 = !DILocalVariable(name: "u32Temp4", scope: !2261, file: !72, line: 2219, type: !736)
!2273 = !DILocation(line: 2219, column: 35, scope: !2261)
!2274 = !DILocalVariable(name: "u8SignBit", scope: !2261, file: !72, line: 2220, type: !17)
!2275 = !DILocation(line: 2220, column: 5, scope: !2261)
!2276 = !DILocation(line: 2222, column: 7, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2261, file: !72, line: 2222, column: 5)
!2278 = !DILocation(line: 2222, column: 12, scope: !2277)
!2279 = !DILocation(line: 2222, column: 16, scope: !2277)
!2280 = !DILocation(line: 2222, column: 36, scope: !2277)
!2281 = !DILocation(line: 2222, column: 41, scope: !2277)
!2282 = !DILocation(line: 2222, column: 45, scope: !2277)
!2283 = !DILocation(line: 2224, column: 13, scope: !2284)
!2284 = distinct !DILexicalBlock(scope: !2277, file: !72, line: 2223, column: 2)
!2285 = !DILocation(line: 2225, column: 2, scope: !2284)
!2286 = !DILocation(line: 2228, column: 13, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2277, file: !72, line: 2227, column: 2)
!2288 = !DILocation(line: 2231, column: 5, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2261, file: !72, line: 2231, column: 5)
!2290 = !DILocation(line: 2231, column: 10, scope: !2289)
!2291 = !DILocation(line: 2231, column: 5, scope: !2261)
!2292 = !DILocation(line: 2233, column: 15, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2289, file: !72, line: 2232, column: 2)
!2294 = !DILocation(line: 2233, column: 14, scope: !2293)
!2295 = !DILocation(line: 2233, column: 12, scope: !2293)
!2296 = !DILocation(line: 2234, column: 2, scope: !2293)
!2297 = !DILocation(line: 2237, column: 14, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2289, file: !72, line: 2236, column: 2)
!2299 = !DILocation(line: 2237, column: 12, scope: !2298)
!2300 = !DILocation(line: 2240, column: 5, scope: !2301)
!2301 = distinct !DILexicalBlock(scope: !2261, file: !72, line: 2240, column: 5)
!2302 = !DILocation(line: 2240, column: 11, scope: !2301)
!2303 = !DILocation(line: 2240, column: 5, scope: !2261)
!2304 = !DILocation(line: 2242, column: 15, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2301, file: !72, line: 2241, column: 2)
!2306 = !DILocation(line: 2242, column: 14, scope: !2305)
!2307 = !DILocation(line: 2242, column: 12, scope: !2305)
!2308 = !DILocation(line: 2243, column: 2, scope: !2305)
!2309 = !DILocation(line: 2246, column: 14, scope: !2310)
!2310 = distinct !DILexicalBlock(scope: !2301, file: !72, line: 2245, column: 2)
!2311 = !DILocation(line: 2246, column: 12, scope: !2310)
!2312 = !DILocation(line: 2249, column: 13, scope: !2261)
!2313 = !DILocation(line: 2249, column: 24, scope: !2261)
!2314 = !DILocation(line: 2249, column: 22, scope: !2261)
!2315 = !DILocation(line: 2249, column: 11, scope: !2261)
!2316 = !DILocation(line: 2250, column: 25, scope: !2261)
!2317 = !DILocation(line: 2250, column: 35, scope: !2261)
!2318 = !DILocation(line: 2250, column: 13, scope: !2261)
!2319 = !DILocation(line: 2250, column: 11, scope: !2261)
!2320 = !DILocation(line: 2251, column: 13, scope: !2261)
!2321 = !DILocation(line: 2251, column: 22, scope: !2261)
!2322 = !DILocation(line: 2251, column: 11, scope: !2261)
!2323 = !DILocation(line: 2252, column: 14, scope: !2261)
!2324 = !DILocation(line: 2252, column: 23, scope: !2261)
!2325 = !DILocation(line: 2252, column: 11, scope: !2261)
!2326 = !DILocation(line: 2253, column: 6, scope: !2327)
!2327 = distinct !DILexicalBlock(scope: !2261, file: !72, line: 2253, column: 5)
!2328 = !DILocation(line: 2253, column: 14, scope: !2327)
!2329 = !DILocation(line: 2253, column: 19, scope: !2327)
!2330 = !DILocation(line: 2253, column: 5, scope: !2261)
!2331 = !DILocation(line: 2255, column: 6, scope: !2332)
!2332 = distinct !DILexicalBlock(scope: !2333, file: !72, line: 2255, column: 6)
!2333 = distinct !DILexicalBlock(scope: !2327, file: !72, line: 2254, column: 2)
!2334 = !DILocation(line: 2255, column: 16, scope: !2332)
!2335 = !DILocation(line: 2255, column: 6, scope: !2333)
!2336 = !DILocation(line: 2257, column: 7, scope: !2337)
!2337 = distinct !DILexicalBlock(scope: !2338, file: !72, line: 2257, column: 7)
!2338 = distinct !DILexicalBlock(scope: !2332, file: !72, line: 2256, column: 3)
!2339 = !DILocation(line: 2257, column: 15, scope: !2337)
!2340 = !DILocation(line: 2257, column: 7, scope: !2338)
!2341 = !DILocation(line: 2258, column: 12, scope: !2337)
!2342 = !DILocation(line: 2258, column: 5, scope: !2337)
!2343 = !DILocation(line: 2260, column: 5, scope: !2337)
!2344 = !DILocation(line: 2264, column: 7, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2346, file: !72, line: 2264, column: 7)
!2346 = distinct !DILexicalBlock(scope: !2332, file: !72, line: 2263, column: 3)
!2347 = !DILocation(line: 2264, column: 15, scope: !2345)
!2348 = !DILocation(line: 2264, column: 7, scope: !2346)
!2349 = !DILocation(line: 2265, column: 13, scope: !2345)
!2350 = !DILocation(line: 2265, column: 12, scope: !2345)
!2351 = !DILocation(line: 2265, column: 5, scope: !2345)
!2352 = !DILocation(line: 2267, column: 5, scope: !2345)
!2353 = !DILocation(line: 2272, column: 4, scope: !2354)
!2354 = distinct !DILexicalBlock(scope: !2327, file: !72, line: 2271, column: 2)
!2355 = !DILocation(line: 2274, column: 1, scope: !2261)
!2356 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !72, file: !72, line: 2292, type: !2357, scopeLine: 2293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2357 = !DISubroutineType(types: !2358)
!2358 = !{!80, !80, !17}
!2359 = !DILocalVariable(name: "value", arg: 1, scope: !2356, file: !72, line: 2292, type: !80)
!2360 = !DILocation(line: 2292, column: 29, scope: !2356)
!2361 = !DILocalVariable(name: "factor", arg: 2, scope: !2356, file: !72, line: 2292, type: !17)
!2362 = !DILocation(line: 2292, column: 39, scope: !2356)
!2363 = !DILocalVariable(name: "u32Temp1", scope: !2356, file: !72, line: 2294, type: !736)
!2364 = !DILocation(line: 2294, column: 6, scope: !2356)
!2365 = !DILocalVariable(name: "u32Temp2", scope: !2356, file: !72, line: 2294, type: !736)
!2366 = !DILocation(line: 2294, column: 17, scope: !2356)
!2367 = !DILocalVariable(name: "u32Temp3", scope: !2356, file: !72, line: 2294, type: !736)
!2368 = !DILocation(line: 2294, column: 26, scope: !2356)
!2369 = !DILocalVariable(name: "u8SignBit", scope: !2356, file: !72, line: 2295, type: !17)
!2370 = !DILocation(line: 2295, column: 5, scope: !2356)
!2371 = !DILocation(line: 2297, column: 5, scope: !2372)
!2372 = distinct !DILexicalBlock(scope: !2356, file: !72, line: 2297, column: 5)
!2373 = !DILocation(line: 2297, column: 10, scope: !2372)
!2374 = !DILocation(line: 2297, column: 5, scope: !2356)
!2375 = !DILocation(line: 2299, column: 15, scope: !2376)
!2376 = distinct !DILexicalBlock(scope: !2372, file: !72, line: 2298, column: 2)
!2377 = !DILocation(line: 2299, column: 14, scope: !2376)
!2378 = !DILocation(line: 2299, column: 12, scope: !2376)
!2379 = !DILocation(line: 2300, column: 13, scope: !2376)
!2380 = !DILocation(line: 2301, column: 2, scope: !2376)
!2381 = !DILocation(line: 2304, column: 14, scope: !2382)
!2382 = distinct !DILexicalBlock(scope: !2372, file: !72, line: 2303, column: 2)
!2383 = !DILocation(line: 2304, column: 12, scope: !2382)
!2384 = !DILocation(line: 2305, column: 13, scope: !2382)
!2385 = !DILocation(line: 2308, column: 13, scope: !2356)
!2386 = !DILocation(line: 2308, column: 24, scope: !2356)
!2387 = !DILocation(line: 2308, column: 22, scope: !2356)
!2388 = !DILocation(line: 2308, column: 11, scope: !2356)
!2389 = !DILocation(line: 2309, column: 25, scope: !2356)
!2390 = !DILocation(line: 2309, column: 35, scope: !2356)
!2391 = !DILocation(line: 2309, column: 13, scope: !2356)
!2392 = !DILocation(line: 2309, column: 11, scope: !2356)
!2393 = !DILocation(line: 2310, column: 13, scope: !2356)
!2394 = !DILocation(line: 2310, column: 22, scope: !2356)
!2395 = !DILocation(line: 2310, column: 11, scope: !2356)
!2396 = !DILocation(line: 2311, column: 14, scope: !2356)
!2397 = !DILocation(line: 2311, column: 23, scope: !2356)
!2398 = !DILocation(line: 2311, column: 11, scope: !2356)
!2399 = !DILocation(line: 2312, column: 5, scope: !2400)
!2400 = distinct !DILexicalBlock(scope: !2356, file: !72, line: 2312, column: 5)
!2401 = !DILocation(line: 2312, column: 15, scope: !2400)
!2402 = !DILocation(line: 2312, column: 5, scope: !2356)
!2403 = !DILocation(line: 2314, column: 10, scope: !2404)
!2404 = distinct !DILexicalBlock(scope: !2400, file: !72, line: 2313, column: 2)
!2405 = !DILocation(line: 2314, column: 3, scope: !2404)
!2406 = !DILocation(line: 2318, column: 11, scope: !2407)
!2407 = distinct !DILexicalBlock(scope: !2400, file: !72, line: 2317, column: 2)
!2408 = !DILocation(line: 2318, column: 10, scope: !2407)
!2409 = !DILocation(line: 2318, column: 3, scope: !2407)
!2410 = !DILocation(line: 2320, column: 1, scope: !2356)
!2411 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !72, file: !72, line: 2339, type: !2357, scopeLine: 2340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2412 = !DILocalVariable(name: "value", arg: 1, scope: !2411, file: !72, line: 2339, type: !80)
!2413 = !DILocation(line: 2339, column: 29, scope: !2411)
!2414 = !DILocalVariable(name: "factor", arg: 2, scope: !2411, file: !72, line: 2339, type: !17)
!2415 = !DILocation(line: 2339, column: 39, scope: !2411)
!2416 = !DILocalVariable(name: "u32Temp1", scope: !2411, file: !72, line: 2341, type: !736)
!2417 = !DILocation(line: 2341, column: 6, scope: !2411)
!2418 = !DILocalVariable(name: "u32Temp2", scope: !2411, file: !72, line: 2341, type: !736)
!2419 = !DILocation(line: 2341, column: 17, scope: !2411)
!2420 = !DILocalVariable(name: "u32Temp3", scope: !2411, file: !72, line: 2341, type: !736)
!2421 = !DILocation(line: 2341, column: 26, scope: !2411)
!2422 = !DILocalVariable(name: "u8SignBit", scope: !2411, file: !72, line: 2342, type: !17)
!2423 = !DILocation(line: 2342, column: 5, scope: !2411)
!2424 = !DILocation(line: 2344, column: 5, scope: !2425)
!2425 = distinct !DILexicalBlock(scope: !2411, file: !72, line: 2344, column: 5)
!2426 = !DILocation(line: 2344, column: 10, scope: !2425)
!2427 = !DILocation(line: 2344, column: 5, scope: !2411)
!2428 = !DILocation(line: 2346, column: 15, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !2425, file: !72, line: 2345, column: 2)
!2430 = !DILocation(line: 2346, column: 14, scope: !2429)
!2431 = !DILocation(line: 2346, column: 12, scope: !2429)
!2432 = !DILocation(line: 2347, column: 13, scope: !2429)
!2433 = !DILocation(line: 2348, column: 2, scope: !2429)
!2434 = !DILocation(line: 2351, column: 14, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2425, file: !72, line: 2350, column: 2)
!2436 = !DILocation(line: 2351, column: 12, scope: !2435)
!2437 = !DILocation(line: 2352, column: 13, scope: !2435)
!2438 = !DILocation(line: 2355, column: 13, scope: !2411)
!2439 = !DILocation(line: 2355, column: 24, scope: !2411)
!2440 = !DILocation(line: 2355, column: 22, scope: !2411)
!2441 = !DILocation(line: 2355, column: 11, scope: !2411)
!2442 = !DILocation(line: 2356, column: 25, scope: !2411)
!2443 = !DILocation(line: 2356, column: 35, scope: !2411)
!2444 = !DILocation(line: 2356, column: 13, scope: !2411)
!2445 = !DILocation(line: 2356, column: 11, scope: !2411)
!2446 = !DILocation(line: 2357, column: 13, scope: !2411)
!2447 = !DILocation(line: 2357, column: 22, scope: !2411)
!2448 = !DILocation(line: 2357, column: 11, scope: !2411)
!2449 = !DILocation(line: 2358, column: 14, scope: !2411)
!2450 = !DILocation(line: 2358, column: 23, scope: !2411)
!2451 = !DILocation(line: 2358, column: 11, scope: !2411)
!2452 = !DILocation(line: 2359, column: 5, scope: !2453)
!2453 = distinct !DILexicalBlock(scope: !2411, file: !72, line: 2359, column: 5)
!2454 = !DILocation(line: 2359, column: 15, scope: !2453)
!2455 = !DILocation(line: 2359, column: 5, scope: !2411)
!2456 = !DILocation(line: 2361, column: 6, scope: !2457)
!2457 = distinct !DILexicalBlock(scope: !2458, file: !72, line: 2361, column: 6)
!2458 = distinct !DILexicalBlock(scope: !2453, file: !72, line: 2360, column: 2)
!2459 = !DILocation(line: 2361, column: 14, scope: !2457)
!2460 = !DILocation(line: 2361, column: 6, scope: !2458)
!2461 = !DILocation(line: 2362, column: 11, scope: !2457)
!2462 = !DILocation(line: 2362, column: 4, scope: !2457)
!2463 = !DILocation(line: 2364, column: 4, scope: !2457)
!2464 = !DILocation(line: 2368, column: 6, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2466, file: !72, line: 2368, column: 6)
!2466 = distinct !DILexicalBlock(scope: !2453, file: !72, line: 2367, column: 2)
!2467 = !DILocation(line: 2368, column: 14, scope: !2465)
!2468 = !DILocation(line: 2368, column: 6, scope: !2466)
!2469 = !DILocation(line: 2369, column: 12, scope: !2465)
!2470 = !DILocation(line: 2369, column: 11, scope: !2465)
!2471 = !DILocation(line: 2369, column: 4, scope: !2465)
!2472 = !DILocation(line: 2371, column: 4, scope: !2465)
!2473 = !DILocation(line: 2373, column: 1, scope: !2411)
!2474 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !72, file: !72, line: 2390, type: !2475, scopeLine: 2391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2475 = !DISubroutineType(types: !2476)
!2476 = !{!736, !736, !736, !17}
!2477 = !DILocalVariable(name: "value", arg: 1, scope: !2474, file: !72, line: 2390, type: !736)
!2478 = !DILocation(line: 2390, column: 39, scope: !2474)
!2479 = !DILocalVariable(name: "factor", arg: 2, scope: !2474, file: !72, line: 2390, type: !736)
!2480 = !DILocation(line: 2390, column: 49, scope: !2474)
!2481 = !DILocalVariable(name: "power", arg: 3, scope: !2474, file: !72, line: 2390, type: !17)
!2482 = !DILocation(line: 2390, column: 60, scope: !2474)
!2483 = !DILocalVariable(name: "u32Temp1", scope: !2474, file: !72, line: 2392, type: !736)
!2484 = !DILocation(line: 2392, column: 6, scope: !2474)
!2485 = !DILocalVariable(name: "u32Temp2", scope: !2474, file: !72, line: 2392, type: !736)
!2486 = !DILocation(line: 2392, column: 20, scope: !2474)
!2487 = !DILocation(line: 2393, column: 5, scope: !2488)
!2488 = distinct !DILexicalBlock(scope: !2474, file: !72, line: 2393, column: 5)
!2489 = !DILocation(line: 2393, column: 10, scope: !2488)
!2490 = !DILocation(line: 2393, column: 5, scope: !2474)
!2491 = !DILocation(line: 2395, column: 9, scope: !2492)
!2492 = distinct !DILexicalBlock(scope: !2488, file: !72, line: 2394, column: 2)
!2493 = !DILocation(line: 2396, column: 2, scope: !2492)
!2494 = !DILocation(line: 2397, column: 10, scope: !2495)
!2495 = distinct !DILexicalBlock(scope: !2488, file: !72, line: 2397, column: 10)
!2496 = !DILocation(line: 2397, column: 15, scope: !2495)
!2497 = !DILocation(line: 2397, column: 10, scope: !2488)
!2498 = !DILocation(line: 2399, column: 9, scope: !2499)
!2499 = distinct !DILexicalBlock(scope: !2495, file: !72, line: 2398, column: 2)
!2500 = !DILocation(line: 2400, column: 2, scope: !2499)
!2501 = !DILocation(line: 2405, column: 13, scope: !2474)
!2502 = !DILocation(line: 2405, column: 21, scope: !2474)
!2503 = !DILocation(line: 2405, column: 19, scope: !2474)
!2504 = !DILocation(line: 2405, column: 11, scope: !2474)
!2505 = !DILocation(line: 2406, column: 25, scope: !2474)
!2506 = !DILocation(line: 2406, column: 32, scope: !2474)
!2507 = !DILocation(line: 2406, column: 13, scope: !2474)
!2508 = !DILocation(line: 2406, column: 11, scope: !2474)
!2509 = !DILocation(line: 2407, column: 13, scope: !2474)
!2510 = !DILocation(line: 2407, column: 29, scope: !2474)
!2511 = !DILocation(line: 2407, column: 28, scope: !2474)
!2512 = !DILocation(line: 2407, column: 22, scope: !2474)
!2513 = !DILocation(line: 2407, column: 11, scope: !2474)
!2514 = !DILocation(line: 2408, column: 14, scope: !2474)
!2515 = !DILocation(line: 2408, column: 26, scope: !2474)
!2516 = !DILocation(line: 2408, column: 23, scope: !2474)
!2517 = !DILocation(line: 2408, column: 11, scope: !2474)
!2518 = !DILocation(line: 2409, column: 6, scope: !2519)
!2519 = distinct !DILexicalBlock(scope: !2474, file: !72, line: 2409, column: 5)
!2520 = !DILocation(line: 2409, column: 20, scope: !2519)
!2521 = !DILocation(line: 2409, column: 19, scope: !2519)
!2522 = !DILocation(line: 2409, column: 14, scope: !2519)
!2523 = !DILocation(line: 2409, column: 28, scope: !2519)
!2524 = !DILocation(line: 2409, column: 5, scope: !2474)
!2525 = !DILocation(line: 2411, column: 10, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2519, file: !72, line: 2410, column: 2)
!2527 = !DILocation(line: 2411, column: 3, scope: !2526)
!2528 = !DILocation(line: 2415, column: 3, scope: !2529)
!2529 = distinct !DILexicalBlock(scope: !2519, file: !72, line: 2414, column: 2)
!2530 = !DILocation(line: 2417, column: 1, scope: !2474)
!2531 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !72, file: !72, line: 2435, type: !2532, scopeLine: 2436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2532 = !DISubroutineType(types: !2533)
!2533 = !{!80, !80, !80, !17}
!2534 = !DILocalVariable(name: "value", arg: 1, scope: !2531, file: !72, line: 2435, type: !80)
!2535 = !DILocation(line: 2435, column: 39, scope: !2531)
!2536 = !DILocalVariable(name: "factor", arg: 2, scope: !2531, file: !72, line: 2435, type: !80)
!2537 = !DILocation(line: 2435, column: 50, scope: !2531)
!2538 = !DILocalVariable(name: "power", arg: 3, scope: !2531, file: !72, line: 2435, type: !17)
!2539 = !DILocation(line: 2435, column: 61, scope: !2531)
!2540 = !DILocalVariable(name: "u32Temp1", scope: !2531, file: !72, line: 2437, type: !736)
!2541 = !DILocation(line: 2437, column: 6, scope: !2531)
!2542 = !DILocalVariable(name: "u32Temp2", scope: !2531, file: !72, line: 2437, type: !736)
!2543 = !DILocation(line: 2437, column: 17, scope: !2531)
!2544 = !DILocalVariable(name: "u32Temp3", scope: !2531, file: !72, line: 2437, type: !736)
!2545 = !DILocation(line: 2437, column: 26, scope: !2531)
!2546 = !DILocalVariable(name: "u32Temp4", scope: !2531, file: !72, line: 2437, type: !736)
!2547 = !DILocation(line: 2437, column: 35, scope: !2531)
!2548 = !DILocalVariable(name: "u8SignBit", scope: !2531, file: !72, line: 2438, type: !17)
!2549 = !DILocation(line: 2438, column: 5, scope: !2531)
!2550 = !DILocation(line: 2440, column: 5, scope: !2551)
!2551 = distinct !DILexicalBlock(scope: !2531, file: !72, line: 2440, column: 5)
!2552 = !DILocation(line: 2440, column: 10, scope: !2551)
!2553 = !DILocation(line: 2440, column: 5, scope: !2531)
!2554 = !DILocation(line: 2442, column: 9, scope: !2555)
!2555 = distinct !DILexicalBlock(scope: !2551, file: !72, line: 2441, column: 2)
!2556 = !DILocation(line: 2443, column: 2, scope: !2555)
!2557 = !DILocation(line: 2444, column: 10, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2551, file: !72, line: 2444, column: 10)
!2559 = !DILocation(line: 2444, column: 15, scope: !2558)
!2560 = !DILocation(line: 2444, column: 10, scope: !2551)
!2561 = !DILocation(line: 2446, column: 9, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2558, file: !72, line: 2445, column: 2)
!2563 = !DILocation(line: 2447, column: 2, scope: !2562)
!2564 = !DILocation(line: 2453, column: 7, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2531, file: !72, line: 2453, column: 5)
!2566 = !DILocation(line: 2453, column: 12, scope: !2565)
!2567 = !DILocation(line: 2453, column: 16, scope: !2565)
!2568 = !DILocation(line: 2453, column: 36, scope: !2565)
!2569 = !DILocation(line: 2453, column: 41, scope: !2565)
!2570 = !DILocation(line: 2453, column: 45, scope: !2565)
!2571 = !DILocation(line: 2455, column: 13, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2565, file: !72, line: 2454, column: 2)
!2573 = !DILocation(line: 2456, column: 2, scope: !2572)
!2574 = !DILocation(line: 2459, column: 13, scope: !2575)
!2575 = distinct !DILexicalBlock(scope: !2565, file: !72, line: 2458, column: 2)
!2576 = !DILocation(line: 2462, column: 5, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2531, file: !72, line: 2462, column: 5)
!2578 = !DILocation(line: 2462, column: 10, scope: !2577)
!2579 = !DILocation(line: 2462, column: 5, scope: !2531)
!2580 = !DILocation(line: 2464, column: 15, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2577, file: !72, line: 2463, column: 2)
!2582 = !DILocation(line: 2464, column: 14, scope: !2581)
!2583 = !DILocation(line: 2464, column: 12, scope: !2581)
!2584 = !DILocation(line: 2465, column: 2, scope: !2581)
!2585 = !DILocation(line: 2468, column: 14, scope: !2586)
!2586 = distinct !DILexicalBlock(scope: !2577, file: !72, line: 2467, column: 2)
!2587 = !DILocation(line: 2468, column: 12, scope: !2586)
!2588 = !DILocation(line: 2471, column: 5, scope: !2589)
!2589 = distinct !DILexicalBlock(scope: !2531, file: !72, line: 2471, column: 5)
!2590 = !DILocation(line: 2471, column: 11, scope: !2589)
!2591 = !DILocation(line: 2471, column: 5, scope: !2531)
!2592 = !DILocation(line: 2473, column: 15, scope: !2593)
!2593 = distinct !DILexicalBlock(scope: !2589, file: !72, line: 2472, column: 2)
!2594 = !DILocation(line: 2473, column: 14, scope: !2593)
!2595 = !DILocation(line: 2473, column: 12, scope: !2593)
!2596 = !DILocation(line: 2474, column: 2, scope: !2593)
!2597 = !DILocation(line: 2477, column: 14, scope: !2598)
!2598 = distinct !DILexicalBlock(scope: !2589, file: !72, line: 2476, column: 2)
!2599 = !DILocation(line: 2477, column: 12, scope: !2598)
!2600 = !DILocation(line: 2480, column: 13, scope: !2531)
!2601 = !DILocation(line: 2480, column: 24, scope: !2531)
!2602 = !DILocation(line: 2480, column: 22, scope: !2531)
!2603 = !DILocation(line: 2480, column: 11, scope: !2531)
!2604 = !DILocation(line: 2481, column: 25, scope: !2531)
!2605 = !DILocation(line: 2481, column: 35, scope: !2531)
!2606 = !DILocation(line: 2481, column: 13, scope: !2531)
!2607 = !DILocation(line: 2481, column: 11, scope: !2531)
!2608 = !DILocation(line: 2482, column: 13, scope: !2531)
!2609 = !DILocation(line: 2482, column: 29, scope: !2531)
!2610 = !DILocation(line: 2482, column: 28, scope: !2531)
!2611 = !DILocation(line: 2482, column: 22, scope: !2531)
!2612 = !DILocation(line: 2482, column: 11, scope: !2531)
!2613 = !DILocation(line: 2483, column: 14, scope: !2531)
!2614 = !DILocation(line: 2483, column: 26, scope: !2531)
!2615 = !DILocation(line: 2483, column: 23, scope: !2531)
!2616 = !DILocation(line: 2483, column: 11, scope: !2531)
!2617 = !DILocation(line: 2484, column: 6, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2531, file: !72, line: 2484, column: 5)
!2619 = !DILocation(line: 2484, column: 20, scope: !2618)
!2620 = !DILocation(line: 2484, column: 19, scope: !2618)
!2621 = !DILocation(line: 2484, column: 14, scope: !2618)
!2622 = !DILocation(line: 2484, column: 27, scope: !2618)
!2623 = !DILocation(line: 2484, column: 5, scope: !2531)
!2624 = !DILocation(line: 2486, column: 6, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2626, file: !72, line: 2486, column: 6)
!2626 = distinct !DILexicalBlock(scope: !2618, file: !72, line: 2485, column: 2)
!2627 = !DILocation(line: 2486, column: 16, scope: !2625)
!2628 = !DILocation(line: 2486, column: 6, scope: !2626)
!2629 = !DILocation(line: 2488, column: 7, scope: !2630)
!2630 = distinct !DILexicalBlock(scope: !2631, file: !72, line: 2488, column: 7)
!2631 = distinct !DILexicalBlock(scope: !2625, file: !72, line: 2487, column: 3)
!2632 = !DILocation(line: 2488, column: 15, scope: !2630)
!2633 = !DILocation(line: 2488, column: 7, scope: !2631)
!2634 = !DILocation(line: 2489, column: 12, scope: !2630)
!2635 = !DILocation(line: 2489, column: 5, scope: !2630)
!2636 = !DILocation(line: 2491, column: 5, scope: !2630)
!2637 = !DILocation(line: 2495, column: 12, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2625, file: !72, line: 2494, column: 3)
!2639 = !DILocation(line: 2495, column: 11, scope: !2638)
!2640 = !DILocation(line: 2495, column: 4, scope: !2638)
!2641 = !DILocation(line: 2500, column: 6, scope: !2642)
!2642 = distinct !DILexicalBlock(scope: !2643, file: !72, line: 2500, column: 6)
!2643 = distinct !DILexicalBlock(scope: !2618, file: !72, line: 2499, column: 2)
!2644 = !DILocation(line: 2500, column: 16, scope: !2642)
!2645 = !DILocation(line: 2500, column: 6, scope: !2643)
!2646 = !DILocation(line: 2502, column: 4, scope: !2647)
!2647 = distinct !DILexicalBlock(scope: !2642, file: !72, line: 2501, column: 3)
!2648 = !DILocation(line: 2506, column: 4, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2642, file: !72, line: 2505, column: 3)
!2650 = !DILocation(line: 2509, column: 1, scope: !2531)
!2651 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !72, file: !72, line: 2528, type: !2652, scopeLine: 2529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2652 = !DISubroutineType(types: !2653)
!2653 = !{!80, !80, !6}
!2654 = !DILocalVariable(name: "value", arg: 1, scope: !2651, file: !72, line: 2528, type: !80)
!2655 = !DILocation(line: 2528, column: 29, scope: !2651)
!2656 = !DILocalVariable(name: "factor", arg: 2, scope: !2651, file: !72, line: 2528, type: !6)
!2657 = !DILocation(line: 2528, column: 39, scope: !2651)
!2658 = !DILocalVariable(name: "u32Temp1", scope: !2651, file: !72, line: 2530, type: !736)
!2659 = !DILocation(line: 2530, column: 6, scope: !2651)
!2660 = !DILocalVariable(name: "u32Temp2", scope: !2651, file: !72, line: 2530, type: !736)
!2661 = !DILocation(line: 2530, column: 17, scope: !2651)
!2662 = !DILocalVariable(name: "u32Temp3", scope: !2651, file: !72, line: 2530, type: !736)
!2663 = !DILocation(line: 2530, column: 26, scope: !2651)
!2664 = !DILocalVariable(name: "u32Temp4", scope: !2651, file: !72, line: 2530, type: !736)
!2665 = !DILocation(line: 2530, column: 35, scope: !2651)
!2666 = !DILocalVariable(name: "u8SignBit", scope: !2651, file: !72, line: 2531, type: !17)
!2667 = !DILocation(line: 2531, column: 5, scope: !2651)
!2668 = !DILocation(line: 2533, column: 7, scope: !2669)
!2669 = distinct !DILexicalBlock(scope: !2651, file: !72, line: 2533, column: 5)
!2670 = !DILocation(line: 2533, column: 12, scope: !2669)
!2671 = !DILocation(line: 2533, column: 16, scope: !2669)
!2672 = !DILocation(line: 2533, column: 20, scope: !2669)
!2673 = !DILocation(line: 2533, column: 26, scope: !2669)
!2674 = !DILocation(line: 2533, column: 31, scope: !2669)
!2675 = !DILocation(line: 2533, column: 36, scope: !2669)
!2676 = !DILocation(line: 2533, column: 41, scope: !2669)
!2677 = !DILocation(line: 2533, column: 45, scope: !2669)
!2678 = !DILocation(line: 2533, column: 49, scope: !2669)
!2679 = !DILocation(line: 2533, column: 55, scope: !2669)
!2680 = !DILocation(line: 2533, column: 5, scope: !2651)
!2681 = !DILocation(line: 2535, column: 13, scope: !2682)
!2682 = distinct !DILexicalBlock(scope: !2669, file: !72, line: 2534, column: 2)
!2683 = !DILocation(line: 2536, column: 2, scope: !2682)
!2684 = !DILocation(line: 2539, column: 13, scope: !2685)
!2685 = distinct !DILexicalBlock(scope: !2669, file: !72, line: 2538, column: 2)
!2686 = !DILocation(line: 2542, column: 5, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2651, file: !72, line: 2542, column: 5)
!2688 = !DILocation(line: 2542, column: 10, scope: !2687)
!2689 = !DILocation(line: 2542, column: 5, scope: !2651)
!2690 = !DILocation(line: 2544, column: 15, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2687, file: !72, line: 2543, column: 2)
!2692 = !DILocation(line: 2544, column: 14, scope: !2691)
!2693 = !DILocation(line: 2544, column: 12, scope: !2691)
!2694 = !DILocation(line: 2545, column: 2, scope: !2691)
!2695 = !DILocation(line: 2548, column: 14, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2687, file: !72, line: 2547, column: 2)
!2697 = !DILocation(line: 2548, column: 12, scope: !2696)
!2698 = !DILocation(line: 2551, column: 5, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2651, file: !72, line: 2551, column: 5)
!2700 = !DILocation(line: 2551, column: 11, scope: !2699)
!2701 = !DILocation(line: 2551, column: 5, scope: !2651)
!2702 = !DILocation(line: 2553, column: 15, scope: !2703)
!2703 = distinct !DILexicalBlock(scope: !2699, file: !72, line: 2552, column: 2)
!2704 = !DILocation(line: 2553, column: 14, scope: !2703)
!2705 = !DILocation(line: 2553, column: 12, scope: !2703)
!2706 = !DILocation(line: 2554, column: 2, scope: !2703)
!2707 = !DILocation(line: 2557, column: 14, scope: !2708)
!2708 = distinct !DILexicalBlock(scope: !2699, file: !72, line: 2556, column: 2)
!2709 = !DILocation(line: 2557, column: 12, scope: !2708)
!2710 = !DILocation(line: 2560, column: 13, scope: !2651)
!2711 = !DILocation(line: 2560, column: 24, scope: !2651)
!2712 = !DILocation(line: 2560, column: 22, scope: !2651)
!2713 = !DILocation(line: 2560, column: 11, scope: !2651)
!2714 = !DILocation(line: 2561, column: 25, scope: !2651)
!2715 = !DILocation(line: 2561, column: 35, scope: !2651)
!2716 = !DILocation(line: 2561, column: 13, scope: !2651)
!2717 = !DILocation(line: 2561, column: 11, scope: !2651)
!2718 = !DILocation(line: 2562, column: 13, scope: !2651)
!2719 = !DILocation(line: 2562, column: 22, scope: !2651)
!2720 = !DILocation(line: 2562, column: 11, scope: !2651)
!2721 = !DILocation(line: 2563, column: 14, scope: !2651)
!2722 = !DILocation(line: 2563, column: 23, scope: !2651)
!2723 = !DILocation(line: 2563, column: 11, scope: !2651)
!2724 = !DILocation(line: 2564, column: 5, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2651, file: !72, line: 2564, column: 5)
!2726 = !DILocation(line: 2564, column: 15, scope: !2725)
!2727 = !DILocation(line: 2564, column: 5, scope: !2651)
!2728 = !DILocation(line: 2566, column: 6, scope: !2729)
!2729 = distinct !DILexicalBlock(scope: !2730, file: !72, line: 2566, column: 6)
!2730 = distinct !DILexicalBlock(scope: !2725, file: !72, line: 2565, column: 2)
!2731 = !DILocation(line: 2566, column: 14, scope: !2729)
!2732 = !DILocation(line: 2566, column: 6, scope: !2730)
!2733 = !DILocation(line: 2567, column: 11, scope: !2729)
!2734 = !DILocation(line: 2567, column: 4, scope: !2729)
!2735 = !DILocation(line: 2569, column: 4, scope: !2729)
!2736 = !DILocation(line: 2573, column: 11, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2725, file: !72, line: 2572, column: 2)
!2738 = !DILocation(line: 2573, column: 10, scope: !2737)
!2739 = !DILocation(line: 2573, column: 3, scope: !2737)
!2740 = !DILocation(line: 2575, column: 1, scope: !2651)
!2741 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !72, file: !72, line: 2594, type: !2652, scopeLine: 2595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2742 = !DILocalVariable(name: "value", arg: 1, scope: !2741, file: !72, line: 2594, type: !80)
!2743 = !DILocation(line: 2594, column: 29, scope: !2741)
!2744 = !DILocalVariable(name: "factor", arg: 2, scope: !2741, file: !72, line: 2594, type: !6)
!2745 = !DILocation(line: 2594, column: 39, scope: !2741)
!2746 = !DILocalVariable(name: "u32Temp1", scope: !2741, file: !72, line: 2596, type: !736)
!2747 = !DILocation(line: 2596, column: 6, scope: !2741)
!2748 = !DILocalVariable(name: "u32Temp2", scope: !2741, file: !72, line: 2596, type: !736)
!2749 = !DILocation(line: 2596, column: 17, scope: !2741)
!2750 = !DILocalVariable(name: "u32Temp3", scope: !2741, file: !72, line: 2596, type: !736)
!2751 = !DILocation(line: 2596, column: 26, scope: !2741)
!2752 = !DILocalVariable(name: "u32Temp4", scope: !2741, file: !72, line: 2596, type: !736)
!2753 = !DILocation(line: 2596, column: 35, scope: !2741)
!2754 = !DILocalVariable(name: "u8SignBit", scope: !2741, file: !72, line: 2597, type: !17)
!2755 = !DILocation(line: 2597, column: 5, scope: !2741)
!2756 = !DILocation(line: 2599, column: 7, scope: !2757)
!2757 = distinct !DILexicalBlock(scope: !2741, file: !72, line: 2599, column: 5)
!2758 = !DILocation(line: 2599, column: 12, scope: !2757)
!2759 = !DILocation(line: 2599, column: 16, scope: !2757)
!2760 = !DILocation(line: 2599, column: 20, scope: !2757)
!2761 = !DILocation(line: 2599, column: 26, scope: !2757)
!2762 = !DILocation(line: 2599, column: 31, scope: !2757)
!2763 = !DILocation(line: 2599, column: 36, scope: !2757)
!2764 = !DILocation(line: 2599, column: 41, scope: !2757)
!2765 = !DILocation(line: 2599, column: 45, scope: !2757)
!2766 = !DILocation(line: 2599, column: 49, scope: !2757)
!2767 = !DILocation(line: 2599, column: 55, scope: !2757)
!2768 = !DILocation(line: 2599, column: 5, scope: !2741)
!2769 = !DILocation(line: 2601, column: 13, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2757, file: !72, line: 2600, column: 2)
!2771 = !DILocation(line: 2602, column: 2, scope: !2770)
!2772 = !DILocation(line: 2605, column: 13, scope: !2773)
!2773 = distinct !DILexicalBlock(scope: !2757, file: !72, line: 2604, column: 2)
!2774 = !DILocation(line: 2608, column: 5, scope: !2775)
!2775 = distinct !DILexicalBlock(scope: !2741, file: !72, line: 2608, column: 5)
!2776 = !DILocation(line: 2608, column: 10, scope: !2775)
!2777 = !DILocation(line: 2608, column: 5, scope: !2741)
!2778 = !DILocation(line: 2610, column: 15, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2775, file: !72, line: 2609, column: 2)
!2780 = !DILocation(line: 2610, column: 14, scope: !2779)
!2781 = !DILocation(line: 2610, column: 12, scope: !2779)
!2782 = !DILocation(line: 2611, column: 2, scope: !2779)
!2783 = !DILocation(line: 2614, column: 14, scope: !2784)
!2784 = distinct !DILexicalBlock(scope: !2775, file: !72, line: 2613, column: 2)
!2785 = !DILocation(line: 2614, column: 12, scope: !2784)
!2786 = !DILocation(line: 2617, column: 5, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2741, file: !72, line: 2617, column: 5)
!2788 = !DILocation(line: 2617, column: 11, scope: !2787)
!2789 = !DILocation(line: 2617, column: 5, scope: !2741)
!2790 = !DILocation(line: 2619, column: 15, scope: !2791)
!2791 = distinct !DILexicalBlock(scope: !2787, file: !72, line: 2618, column: 2)
!2792 = !DILocation(line: 2619, column: 14, scope: !2791)
!2793 = !DILocation(line: 2619, column: 12, scope: !2791)
!2794 = !DILocation(line: 2620, column: 2, scope: !2791)
!2795 = !DILocation(line: 2623, column: 14, scope: !2796)
!2796 = distinct !DILexicalBlock(scope: !2787, file: !72, line: 2622, column: 2)
!2797 = !DILocation(line: 2623, column: 12, scope: !2796)
!2798 = !DILocation(line: 2626, column: 13, scope: !2741)
!2799 = !DILocation(line: 2626, column: 24, scope: !2741)
!2800 = !DILocation(line: 2626, column: 22, scope: !2741)
!2801 = !DILocation(line: 2626, column: 11, scope: !2741)
!2802 = !DILocation(line: 2627, column: 25, scope: !2741)
!2803 = !DILocation(line: 2627, column: 35, scope: !2741)
!2804 = !DILocation(line: 2627, column: 13, scope: !2741)
!2805 = !DILocation(line: 2627, column: 11, scope: !2741)
!2806 = !DILocation(line: 2628, column: 13, scope: !2741)
!2807 = !DILocation(line: 2628, column: 22, scope: !2741)
!2808 = !DILocation(line: 2628, column: 11, scope: !2741)
!2809 = !DILocation(line: 2629, column: 14, scope: !2741)
!2810 = !DILocation(line: 2629, column: 23, scope: !2741)
!2811 = !DILocation(line: 2629, column: 11, scope: !2741)
!2812 = !DILocation(line: 2630, column: 6, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2741, file: !72, line: 2630, column: 5)
!2814 = !DILocation(line: 2630, column: 14, scope: !2813)
!2815 = !DILocation(line: 2630, column: 18, scope: !2813)
!2816 = !DILocation(line: 2630, column: 5, scope: !2741)
!2817 = !DILocation(line: 2632, column: 6, scope: !2818)
!2818 = distinct !DILexicalBlock(scope: !2819, file: !72, line: 2632, column: 6)
!2819 = distinct !DILexicalBlock(scope: !2813, file: !72, line: 2631, column: 2)
!2820 = !DILocation(line: 2632, column: 16, scope: !2818)
!2821 = !DILocation(line: 2632, column: 6, scope: !2819)
!2822 = !DILocation(line: 2634, column: 7, scope: !2823)
!2823 = distinct !DILexicalBlock(scope: !2824, file: !72, line: 2634, column: 7)
!2824 = distinct !DILexicalBlock(scope: !2818, file: !72, line: 2633, column: 3)
!2825 = !DILocation(line: 2634, column: 15, scope: !2823)
!2826 = !DILocation(line: 2634, column: 7, scope: !2824)
!2827 = !DILocation(line: 2635, column: 12, scope: !2823)
!2828 = !DILocation(line: 2635, column: 5, scope: !2823)
!2829 = !DILocation(line: 2637, column: 5, scope: !2823)
!2830 = !DILocation(line: 2641, column: 7, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2832, file: !72, line: 2641, column: 7)
!2832 = distinct !DILexicalBlock(scope: !2818, file: !72, line: 2640, column: 3)
!2833 = !DILocation(line: 2641, column: 15, scope: !2831)
!2834 = !DILocation(line: 2641, column: 7, scope: !2832)
!2835 = !DILocation(line: 2642, column: 13, scope: !2831)
!2836 = !DILocation(line: 2642, column: 12, scope: !2831)
!2837 = !DILocation(line: 2642, column: 5, scope: !2831)
!2838 = !DILocation(line: 2644, column: 5, scope: !2831)
!2839 = !DILocation(line: 2649, column: 3, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2813, file: !72, line: 2648, column: 2)
!2841 = !DILocation(line: 2651, column: 1, scope: !2741)
!2842 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !72, file: !72, line: 2666, type: !2178, scopeLine: 2667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2843 = !DILocalVariable(name: "val1", arg: 1, scope: !2842, file: !72, line: 2666, type: !80)
!2844 = !DILocation(line: 2666, column: 25, scope: !2842)
!2845 = !DILocalVariable(name: "val2", arg: 2, scope: !2842, file: !72, line: 2666, type: !80)
!2846 = !DILocation(line: 2666, column: 35, scope: !2842)
!2847 = !DILocalVariable(name: "u32Temp1", scope: !2842, file: !72, line: 2668, type: !736)
!2848 = !DILocation(line: 2668, column: 6, scope: !2842)
!2849 = !DILocalVariable(name: "u32Temp2", scope: !2842, file: !72, line: 2668, type: !736)
!2850 = !DILocation(line: 2668, column: 17, scope: !2842)
!2851 = !DILocalVariable(name: "u32Temp3", scope: !2842, file: !72, line: 2668, type: !736)
!2852 = !DILocation(line: 2668, column: 26, scope: !2842)
!2853 = !DILocalVariable(name: "u32Temp4", scope: !2842, file: !72, line: 2668, type: !736)
!2854 = !DILocation(line: 2668, column: 35, scope: !2842)
!2855 = !DILocalVariable(name: "u8SignBit", scope: !2842, file: !72, line: 2669, type: !17)
!2856 = !DILocation(line: 2669, column: 5, scope: !2842)
!2857 = !DILocation(line: 2671, column: 7, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2842, file: !72, line: 2671, column: 5)
!2859 = !DILocation(line: 2671, column: 11, scope: !2858)
!2860 = !DILocation(line: 2671, column: 15, scope: !2858)
!2861 = !DILocation(line: 2671, column: 33, scope: !2858)
!2862 = !DILocation(line: 2671, column: 37, scope: !2858)
!2863 = !DILocation(line: 2671, column: 41, scope: !2858)
!2864 = !DILocation(line: 2673, column: 13, scope: !2865)
!2865 = distinct !DILexicalBlock(scope: !2858, file: !72, line: 2672, column: 2)
!2866 = !DILocation(line: 2674, column: 2, scope: !2865)
!2867 = !DILocation(line: 2677, column: 13, scope: !2868)
!2868 = distinct !DILexicalBlock(scope: !2858, file: !72, line: 2676, column: 2)
!2869 = !DILocation(line: 2680, column: 5, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2842, file: !72, line: 2680, column: 5)
!2871 = !DILocation(line: 2680, column: 9, scope: !2870)
!2872 = !DILocation(line: 2680, column: 5, scope: !2842)
!2873 = !DILocation(line: 2682, column: 15, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2870, file: !72, line: 2681, column: 2)
!2875 = !DILocation(line: 2682, column: 14, scope: !2874)
!2876 = !DILocation(line: 2682, column: 12, scope: !2874)
!2877 = !DILocation(line: 2683, column: 2, scope: !2874)
!2878 = !DILocation(line: 2686, column: 14, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2870, file: !72, line: 2685, column: 2)
!2880 = !DILocation(line: 2686, column: 12, scope: !2879)
!2881 = !DILocation(line: 2689, column: 5, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2842, file: !72, line: 2689, column: 5)
!2883 = !DILocation(line: 2689, column: 9, scope: !2882)
!2884 = !DILocation(line: 2689, column: 5, scope: !2842)
!2885 = !DILocation(line: 2691, column: 15, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2882, file: !72, line: 2690, column: 2)
!2887 = !DILocation(line: 2691, column: 14, scope: !2886)
!2888 = !DILocation(line: 2691, column: 12, scope: !2886)
!2889 = !DILocation(line: 2692, column: 2, scope: !2886)
!2890 = !DILocation(line: 2695, column: 14, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2882, file: !72, line: 2694, column: 2)
!2892 = !DILocation(line: 2695, column: 12, scope: !2891)
!2893 = !DILocation(line: 2698, column: 13, scope: !2842)
!2894 = !DILocation(line: 2698, column: 24, scope: !2842)
!2895 = !DILocation(line: 2698, column: 22, scope: !2842)
!2896 = !DILocation(line: 2698, column: 11, scope: !2842)
!2897 = !DILocation(line: 2699, column: 25, scope: !2842)
!2898 = !DILocation(line: 2699, column: 35, scope: !2842)
!2899 = !DILocation(line: 2699, column: 13, scope: !2842)
!2900 = !DILocation(line: 2699, column: 11, scope: !2842)
!2901 = !DILocation(line: 2700, column: 5, scope: !2902)
!2902 = distinct !DILexicalBlock(scope: !2842, file: !72, line: 2700, column: 5)
!2903 = !DILocation(line: 2700, column: 13, scope: !2902)
!2904 = !DILocation(line: 2700, column: 5, scope: !2842)
!2905 = !DILocation(line: 2702, column: 6, scope: !2906)
!2906 = distinct !DILexicalBlock(scope: !2907, file: !72, line: 2702, column: 6)
!2907 = distinct !DILexicalBlock(scope: !2902, file: !72, line: 2701, column: 2)
!2908 = !DILocation(line: 2702, column: 16, scope: !2906)
!2909 = !DILocation(line: 2702, column: 6, scope: !2907)
!2910 = !DILocation(line: 2704, column: 7, scope: !2911)
!2911 = distinct !DILexicalBlock(scope: !2912, file: !72, line: 2704, column: 7)
!2912 = distinct !DILexicalBlock(scope: !2906, file: !72, line: 2703, column: 3)
!2913 = !DILocation(line: 2704, column: 15, scope: !2911)
!2914 = !DILocation(line: 2704, column: 7, scope: !2912)
!2915 = !DILocation(line: 2705, column: 12, scope: !2911)
!2916 = !DILocation(line: 2705, column: 5, scope: !2911)
!2917 = !DILocation(line: 2707, column: 5, scope: !2911)
!2918 = !DILocation(line: 2711, column: 7, scope: !2919)
!2919 = distinct !DILexicalBlock(scope: !2920, file: !72, line: 2711, column: 7)
!2920 = distinct !DILexicalBlock(scope: !2906, file: !72, line: 2710, column: 3)
!2921 = !DILocation(line: 2711, column: 15, scope: !2919)
!2922 = !DILocation(line: 2711, column: 7, scope: !2920)
!2923 = !DILocation(line: 2712, column: 13, scope: !2919)
!2924 = !DILocation(line: 2712, column: 12, scope: !2919)
!2925 = !DILocation(line: 2712, column: 5, scope: !2919)
!2926 = !DILocation(line: 2714, column: 5, scope: !2919)
!2927 = !DILocation(line: 2719, column: 6, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2929, file: !72, line: 2719, column: 6)
!2929 = distinct !DILexicalBlock(scope: !2902, file: !72, line: 2718, column: 2)
!2930 = !DILocation(line: 2719, column: 16, scope: !2928)
!2931 = !DILocation(line: 2719, column: 6, scope: !2929)
!2932 = !DILocation(line: 2721, column: 4, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2928, file: !72, line: 2720, column: 3)
!2934 = !DILocation(line: 2725, column: 4, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2928, file: !72, line: 2724, column: 3)
!2936 = !DILocation(line: 2729, column: 1, scope: !2842)
!2937 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !72, file: !72, line: 2747, type: !2074, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2938 = !DILocalVariable(name: "value", arg: 1, scope: !2937, file: !72, line: 2747, type: !80)
!2939 = !DILocation(line: 2747, column: 31, scope: !2937)
!2940 = !DILocalVariable(name: "factor", arg: 2, scope: !2937, file: !72, line: 2747, type: !736)
!2941 = !DILocation(line: 2747, column: 42, scope: !2937)
!2942 = !DILocalVariable(name: "u32Temp1", scope: !2937, file: !72, line: 2749, type: !736)
!2943 = !DILocation(line: 2749, column: 6, scope: !2937)
!2944 = !DILocalVariable(name: "u32Temp2", scope: !2937, file: !72, line: 2749, type: !736)
!2945 = !DILocation(line: 2749, column: 17, scope: !2937)
!2946 = !DILocalVariable(name: "u8SignBit", scope: !2937, file: !72, line: 2750, type: !17)
!2947 = !DILocation(line: 2750, column: 5, scope: !2937)
!2948 = !DILocation(line: 2752, column: 5, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2937, file: !72, line: 2752, column: 5)
!2950 = !DILocation(line: 2752, column: 10, scope: !2949)
!2951 = !DILocation(line: 2752, column: 5, scope: !2937)
!2952 = !DILocation(line: 2754, column: 15, scope: !2953)
!2953 = distinct !DILexicalBlock(scope: !2949, file: !72, line: 2753, column: 2)
!2954 = !DILocation(line: 2754, column: 14, scope: !2953)
!2955 = !DILocation(line: 2754, column: 12, scope: !2953)
!2956 = !DILocation(line: 2755, column: 13, scope: !2953)
!2957 = !DILocation(line: 2756, column: 2, scope: !2953)
!2958 = !DILocation(line: 2759, column: 14, scope: !2959)
!2959 = distinct !DILexicalBlock(scope: !2949, file: !72, line: 2758, column: 2)
!2960 = !DILocation(line: 2759, column: 12, scope: !2959)
!2961 = !DILocation(line: 2760, column: 13, scope: !2959)
!2962 = !DILocation(line: 2763, column: 25, scope: !2937)
!2963 = !DILocation(line: 2763, column: 35, scope: !2937)
!2964 = !DILocation(line: 2763, column: 13, scope: !2937)
!2965 = !DILocation(line: 2763, column: 11, scope: !2937)
!2966 = !DILocation(line: 2764, column: 13, scope: !2937)
!2967 = !DILocation(line: 2764, column: 22, scope: !2937)
!2968 = !DILocation(line: 2764, column: 11, scope: !2937)
!2969 = !DILocation(line: 2765, column: 5, scope: !2970)
!2970 = distinct !DILexicalBlock(scope: !2937, file: !72, line: 2765, column: 5)
!2971 = !DILocation(line: 2765, column: 15, scope: !2970)
!2972 = !DILocation(line: 2765, column: 5, scope: !2937)
!2973 = !DILocation(line: 2767, column: 10, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2970, file: !72, line: 2766, column: 2)
!2975 = !DILocation(line: 2767, column: 3, scope: !2974)
!2976 = !DILocation(line: 2771, column: 11, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2970, file: !72, line: 2770, column: 2)
!2978 = !DILocation(line: 2771, column: 10, scope: !2977)
!2979 = !DILocation(line: 2771, column: 3, scope: !2977)
!2980 = !DILocation(line: 2773, column: 1, scope: !2937)
!2981 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !72, file: !72, line: 2789, type: !2178, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2982 = !DILocalVariable(name: "value", arg: 1, scope: !2981, file: !72, line: 2789, type: !80)
!2983 = !DILocation(line: 2789, column: 31, scope: !2981)
!2984 = !DILocalVariable(name: "factor", arg: 2, scope: !2981, file: !72, line: 2789, type: !80)
!2985 = !DILocation(line: 2789, column: 42, scope: !2981)
!2986 = !DILocalVariable(name: "u32Temp1", scope: !2981, file: !72, line: 2791, type: !736)
!2987 = !DILocation(line: 2791, column: 6, scope: !2981)
!2988 = !DILocalVariable(name: "u32Temp2", scope: !2981, file: !72, line: 2791, type: !736)
!2989 = !DILocation(line: 2791, column: 17, scope: !2981)
!2990 = !DILocalVariable(name: "u32Temp3", scope: !2981, file: !72, line: 2791, type: !736)
!2991 = !DILocation(line: 2791, column: 26, scope: !2981)
!2992 = !DILocalVariable(name: "u8SignBit", scope: !2981, file: !72, line: 2792, type: !17)
!2993 = !DILocation(line: 2792, column: 5, scope: !2981)
!2994 = !DILocation(line: 2794, column: 7, scope: !2995)
!2995 = distinct !DILexicalBlock(scope: !2981, file: !72, line: 2794, column: 5)
!2996 = !DILocation(line: 2794, column: 12, scope: !2995)
!2997 = !DILocation(line: 2794, column: 16, scope: !2995)
!2998 = !DILocation(line: 2794, column: 36, scope: !2995)
!2999 = !DILocation(line: 2794, column: 41, scope: !2995)
!3000 = !DILocation(line: 2794, column: 45, scope: !2995)
!3001 = !DILocation(line: 2796, column: 13, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !2995, file: !72, line: 2795, column: 2)
!3003 = !DILocation(line: 2797, column: 2, scope: !3002)
!3004 = !DILocation(line: 2800, column: 13, scope: !3005)
!3005 = distinct !DILexicalBlock(scope: !2995, file: !72, line: 2799, column: 2)
!3006 = !DILocation(line: 2803, column: 5, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2981, file: !72, line: 2803, column: 5)
!3008 = !DILocation(line: 2803, column: 10, scope: !3007)
!3009 = !DILocation(line: 2803, column: 5, scope: !2981)
!3010 = !DILocation(line: 2805, column: 15, scope: !3011)
!3011 = distinct !DILexicalBlock(scope: !3007, file: !72, line: 2804, column: 2)
!3012 = !DILocation(line: 2805, column: 14, scope: !3011)
!3013 = !DILocation(line: 2805, column: 12, scope: !3011)
!3014 = !DILocation(line: 2806, column: 2, scope: !3011)
!3015 = !DILocation(line: 2809, column: 14, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !3007, file: !72, line: 2808, column: 2)
!3017 = !DILocation(line: 2809, column: 12, scope: !3016)
!3018 = !DILocation(line: 2812, column: 5, scope: !3019)
!3019 = distinct !DILexicalBlock(scope: !2981, file: !72, line: 2812, column: 5)
!3020 = !DILocation(line: 2812, column: 11, scope: !3019)
!3021 = !DILocation(line: 2812, column: 5, scope: !2981)
!3022 = !DILocation(line: 2814, column: 15, scope: !3023)
!3023 = distinct !DILexicalBlock(scope: !3019, file: !72, line: 2813, column: 2)
!3024 = !DILocation(line: 2814, column: 14, scope: !3023)
!3025 = !DILocation(line: 2814, column: 12, scope: !3023)
!3026 = !DILocation(line: 2815, column: 2, scope: !3023)
!3027 = !DILocation(line: 2818, column: 14, scope: !3028)
!3028 = distinct !DILexicalBlock(scope: !3019, file: !72, line: 2817, column: 2)
!3029 = !DILocation(line: 2818, column: 12, scope: !3028)
!3030 = !DILocation(line: 2821, column: 25, scope: !2981)
!3031 = !DILocation(line: 2821, column: 35, scope: !2981)
!3032 = !DILocation(line: 2821, column: 13, scope: !2981)
!3033 = !DILocation(line: 2821, column: 11, scope: !2981)
!3034 = !DILocation(line: 2822, column: 5, scope: !3035)
!3035 = distinct !DILexicalBlock(scope: !2981, file: !72, line: 2822, column: 5)
!3036 = !DILocation(line: 2822, column: 15, scope: !3035)
!3037 = !DILocation(line: 2822, column: 5, scope: !2981)
!3038 = !DILocation(line: 2824, column: 10, scope: !3039)
!3039 = distinct !DILexicalBlock(scope: !3035, file: !72, line: 2823, column: 2)
!3040 = !DILocation(line: 2824, column: 3, scope: !3039)
!3041 = !DILocation(line: 2828, column: 11, scope: !3042)
!3042 = distinct !DILexicalBlock(scope: !3035, file: !72, line: 2827, column: 2)
!3043 = !DILocation(line: 2828, column: 10, scope: !3042)
!3044 = !DILocation(line: 2828, column: 3, scope: !3042)
!3045 = !DILocation(line: 2830, column: 1, scope: !2981)
!3046 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !72, file: !72, line: 2847, type: !3047, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3047 = !DISubroutineType(types: !3048)
!3048 = !{!736, !736, !17}
!3049 = !DILocalVariable(name: "value", arg: 1, scope: !3046, file: !72, line: 2847, type: !736)
!3050 = !DILocation(line: 2847, column: 29, scope: !3046)
!3051 = !DILocalVariable(name: "factor", arg: 2, scope: !3046, file: !72, line: 2847, type: !17)
!3052 = !DILocation(line: 2847, column: 39, scope: !3046)
!3053 = !DILocalVariable(name: "u32Temp1", scope: !3046, file: !72, line: 2849, type: !736)
!3054 = !DILocation(line: 2849, column: 6, scope: !3046)
!3055 = !DILocalVariable(name: "u32Temp2", scope: !3046, file: !72, line: 2849, type: !736)
!3056 = !DILocation(line: 2849, column: 20, scope: !3046)
!3057 = !DILocation(line: 2850, column: 13, scope: !3046)
!3058 = !DILocation(line: 2850, column: 21, scope: !3046)
!3059 = !DILocation(line: 2850, column: 19, scope: !3046)
!3060 = !DILocation(line: 2850, column: 11, scope: !3046)
!3061 = !DILocation(line: 2851, column: 25, scope: !3046)
!3062 = !DILocation(line: 2851, column: 32, scope: !3046)
!3063 = !DILocation(line: 2851, column: 13, scope: !3046)
!3064 = !DILocation(line: 2851, column: 11, scope: !3046)
!3065 = !DILocation(line: 2852, column: 14, scope: !3046)
!3066 = !DILocation(line: 2852, column: 23, scope: !3046)
!3067 = !DILocation(line: 2852, column: 11, scope: !3046)
!3068 = !DILocation(line: 2853, column: 14, scope: !3046)
!3069 = !DILocation(line: 2853, column: 23, scope: !3046)
!3070 = !DILocation(line: 2853, column: 11, scope: !3046)
!3071 = !DILocation(line: 2854, column: 9, scope: !3046)
!3072 = !DILocation(line: 2854, column: 2, scope: !3046)
!3073 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !72, file: !72, line: 2873, type: !3047, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3074 = !DILocalVariable(name: "value", arg: 1, scope: !3073, file: !72, line: 2873, type: !736)
!3075 = !DILocation(line: 2873, column: 29, scope: !3073)
!3076 = !DILocalVariable(name: "factor", arg: 2, scope: !3073, file: !72, line: 2873, type: !17)
!3077 = !DILocation(line: 2873, column: 39, scope: !3073)
!3078 = !DILocalVariable(name: "u32Temp1", scope: !3073, file: !72, line: 2875, type: !736)
!3079 = !DILocation(line: 2875, column: 6, scope: !3073)
!3080 = !DILocalVariable(name: "u32Temp2", scope: !3073, file: !72, line: 2875, type: !736)
!3081 = !DILocation(line: 2875, column: 20, scope: !3073)
!3082 = !DILocation(line: 2876, column: 13, scope: !3073)
!3083 = !DILocation(line: 2876, column: 21, scope: !3073)
!3084 = !DILocation(line: 2876, column: 19, scope: !3073)
!3085 = !DILocation(line: 2876, column: 11, scope: !3073)
!3086 = !DILocation(line: 2877, column: 25, scope: !3073)
!3087 = !DILocation(line: 2877, column: 32, scope: !3073)
!3088 = !DILocation(line: 2877, column: 13, scope: !3073)
!3089 = !DILocation(line: 2877, column: 11, scope: !3073)
!3090 = !DILocation(line: 2878, column: 14, scope: !3073)
!3091 = !DILocation(line: 2878, column: 23, scope: !3073)
!3092 = !DILocation(line: 2878, column: 11, scope: !3073)
!3093 = !DILocation(line: 2879, column: 14, scope: !3073)
!3094 = !DILocation(line: 2879, column: 23, scope: !3073)
!3095 = !DILocation(line: 2879, column: 11, scope: !3073)
!3096 = !DILocation(line: 2880, column: 6, scope: !3097)
!3097 = distinct !DILexicalBlock(scope: !3073, file: !72, line: 2880, column: 5)
!3098 = !DILocation(line: 2880, column: 14, scope: !3097)
!3099 = !DILocation(line: 2880, column: 19, scope: !3097)
!3100 = !DILocation(line: 2880, column: 5, scope: !3073)
!3101 = !DILocation(line: 2882, column: 10, scope: !3102)
!3102 = distinct !DILexicalBlock(scope: !3097, file: !72, line: 2881, column: 2)
!3103 = !DILocation(line: 2882, column: 3, scope: !3102)
!3104 = !DILocation(line: 2886, column: 3, scope: !3105)
!3105 = distinct !DILexicalBlock(scope: !3097, file: !72, line: 2885, column: 2)
!3106 = !DILocation(line: 2889, column: 1, scope: !3073)
!3107 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !72, file: !72, line: 2908, type: !3108, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3108 = !DISubroutineType(types: !3109)
!3109 = !{!736, !736, !6}
!3110 = !DILocalVariable(name: "value", arg: 1, scope: !3107, file: !72, line: 2908, type: !736)
!3111 = !DILocation(line: 2908, column: 29, scope: !3107)
!3112 = !DILocalVariable(name: "factor", arg: 2, scope: !3107, file: !72, line: 2908, type: !6)
!3113 = !DILocation(line: 2908, column: 39, scope: !3107)
!3114 = !DILocalVariable(name: "u32Temp1", scope: !3107, file: !72, line: 2910, type: !736)
!3115 = !DILocation(line: 2910, column: 6, scope: !3107)
!3116 = !DILocalVariable(name: "u32Temp2", scope: !3107, file: !72, line: 2910, type: !736)
!3117 = !DILocation(line: 2910, column: 20, scope: !3107)
!3118 = !DILocation(line: 2911, column: 5, scope: !3119)
!3119 = distinct !DILexicalBlock(scope: !3107, file: !72, line: 2911, column: 5)
!3120 = !DILocation(line: 2911, column: 12, scope: !3119)
!3121 = !DILocation(line: 2911, column: 5, scope: !3107)
!3122 = !DILocation(line: 2914, column: 14, scope: !3123)
!3123 = distinct !DILexicalBlock(scope: !3119, file: !72, line: 2912, column: 2)
!3124 = !DILocation(line: 2914, column: 22, scope: !3123)
!3125 = !DILocation(line: 2914, column: 20, scope: !3123)
!3126 = !DILocation(line: 2914, column: 12, scope: !3123)
!3127 = !DILocation(line: 2915, column: 26, scope: !3123)
!3128 = !DILocation(line: 2915, column: 33, scope: !3123)
!3129 = !DILocation(line: 2915, column: 14, scope: !3123)
!3130 = !DILocation(line: 2915, column: 12, scope: !3123)
!3131 = !DILocation(line: 2916, column: 14, scope: !3123)
!3132 = !DILocation(line: 2916, column: 23, scope: !3123)
!3133 = !DILocation(line: 2916, column: 12, scope: !3123)
!3134 = !DILocation(line: 2917, column: 15, scope: !3123)
!3135 = !DILocation(line: 2917, column: 24, scope: !3123)
!3136 = !DILocation(line: 2917, column: 12, scope: !3123)
!3137 = !DILocation(line: 2918, column: 10, scope: !3123)
!3138 = !DILocation(line: 2918, column: 3, scope: !3123)
!3139 = !DILocation(line: 2922, column: 3, scope: !3140)
!3140 = distinct !DILexicalBlock(scope: !3119, file: !72, line: 2921, column: 2)
!3141 = !DILocation(line: 2924, column: 1, scope: !3107)
!3142 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !72, file: !72, line: 2943, type: !3108, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3143 = !DILocalVariable(name: "value", arg: 1, scope: !3142, file: !72, line: 2943, type: !736)
!3144 = !DILocation(line: 2943, column: 29, scope: !3142)
!3145 = !DILocalVariable(name: "factor", arg: 2, scope: !3142, file: !72, line: 2943, type: !6)
!3146 = !DILocation(line: 2943, column: 39, scope: !3142)
!3147 = !DILocalVariable(name: "u32Temp1", scope: !3142, file: !72, line: 2945, type: !736)
!3148 = !DILocation(line: 2945, column: 6, scope: !3142)
!3149 = !DILocalVariable(name: "u32Temp2", scope: !3142, file: !72, line: 2945, type: !736)
!3150 = !DILocation(line: 2945, column: 20, scope: !3142)
!3151 = !DILocation(line: 2946, column: 5, scope: !3152)
!3152 = distinct !DILexicalBlock(scope: !3142, file: !72, line: 2946, column: 5)
!3153 = !DILocation(line: 2946, column: 12, scope: !3152)
!3154 = !DILocation(line: 2946, column: 5, scope: !3142)
!3155 = !DILocation(line: 2948, column: 3, scope: !3156)
!3156 = distinct !DILexicalBlock(scope: !3152, file: !72, line: 2947, column: 2)
!3157 = !DILocation(line: 2952, column: 14, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3152, file: !72, line: 2951, column: 2)
!3159 = !DILocation(line: 2952, column: 22, scope: !3158)
!3160 = !DILocation(line: 2952, column: 20, scope: !3158)
!3161 = !DILocation(line: 2952, column: 12, scope: !3158)
!3162 = !DILocation(line: 2953, column: 26, scope: !3158)
!3163 = !DILocation(line: 2953, column: 33, scope: !3158)
!3164 = !DILocation(line: 2953, column: 14, scope: !3158)
!3165 = !DILocation(line: 2953, column: 12, scope: !3158)
!3166 = !DILocation(line: 2954, column: 14, scope: !3158)
!3167 = !DILocation(line: 2954, column: 23, scope: !3158)
!3168 = !DILocation(line: 2954, column: 12, scope: !3158)
!3169 = !DILocation(line: 2955, column: 15, scope: !3158)
!3170 = !DILocation(line: 2955, column: 24, scope: !3158)
!3171 = !DILocation(line: 2955, column: 12, scope: !3158)
!3172 = !DILocation(line: 2956, column: 7, scope: !3173)
!3173 = distinct !DILexicalBlock(scope: !3158, file: !72, line: 2956, column: 6)
!3174 = !DILocation(line: 2956, column: 16, scope: !3173)
!3175 = !DILocation(line: 2956, column: 22, scope: !3173)
!3176 = !DILocation(line: 2956, column: 6, scope: !3158)
!3177 = !DILocation(line: 2958, column: 11, scope: !3178)
!3178 = distinct !DILexicalBlock(scope: !3173, file: !72, line: 2957, column: 3)
!3179 = !DILocation(line: 2958, column: 4, scope: !3178)
!3180 = !DILocation(line: 2962, column: 4, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3173, file: !72, line: 2961, column: 3)
!3182 = !DILocation(line: 2965, column: 1, scope: !3142)
!3183 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !72, file: !72, line: 2987, type: !301, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3184 = !DILocalVariable(name: "value", arg: 1, scope: !3183, file: !72, line: 2987, type: !13)
!3185 = !DILocation(line: 2987, column: 33, scope: !3183)
!3186 = !DILocalVariable(name: "factor", arg: 2, scope: !3183, file: !72, line: 2987, type: !13)
!3187 = !DILocation(line: 2987, column: 44, scope: !3183)
!3188 = !DILocation(line: 2989, column: 40, scope: !3183)
!3189 = !DILocation(line: 2989, column: 46, scope: !3183)
!3190 = !DILocation(line: 2989, column: 9, scope: !3183)
!3191 = !DILocation(line: 2989, column: 2, scope: !3183)
!3192 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !72, file: !72, line: 3011, type: !301, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3193 = !DILocalVariable(name: "value", arg: 1, scope: !3192, file: !72, line: 3011, type: !13)
!3194 = !DILocation(line: 3011, column: 33, scope: !3192)
!3195 = !DILocalVariable(name: "factor", arg: 2, scope: !3192, file: !72, line: 3011, type: !13)
!3196 = !DILocation(line: 3011, column: 44, scope: !3192)
!3197 = !DILocation(line: 3013, column: 41, scope: !3192)
!3198 = !DILocation(line: 3013, column: 47, scope: !3192)
!3199 = !DILocation(line: 3013, column: 10, scope: !3192)
!3200 = !DILocation(line: 3013, column: 3, scope: !3192)
!3201 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !72, file: !72, line: 3036, type: !301, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3202 = !DILocalVariable(name: "value", arg: 1, scope: !3201, file: !72, line: 3036, type: !13)
!3203 = !DILocation(line: 3036, column: 32, scope: !3201)
!3204 = !DILocalVariable(name: "factor", arg: 2, scope: !3201, file: !72, line: 3036, type: !13)
!3205 = !DILocation(line: 3036, column: 43, scope: !3201)
!3206 = !DILocation(line: 3038, column: 41, scope: !3201)
!3207 = !DILocation(line: 3038, column: 47, scope: !3201)
!3208 = !DILocation(line: 3038, column: 10, scope: !3201)
!3209 = !DILocation(line: 3038, column: 3, scope: !3201)
!3210 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !72, file: !72, line: 3061, type: !301, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3211 = !DILocalVariable(name: "value", arg: 1, scope: !3210, file: !72, line: 3061, type: !13)
!3212 = !DILocation(line: 3061, column: 34, scope: !3210)
!3213 = !DILocalVariable(name: "factor", arg: 2, scope: !3210, file: !72, line: 3061, type: !13)
!3214 = !DILocation(line: 3061, column: 45, scope: !3210)
!3215 = !DILocation(line: 3063, column: 44, scope: !3210)
!3216 = !DILocation(line: 3063, column: 50, scope: !3210)
!3217 = !DILocation(line: 3063, column: 10, scope: !3210)
!3218 = !DILocation(line: 3063, column: 3, scope: !3210)
!3219 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !72, file: !72, line: 3086, type: !301, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3220 = !DILocalVariable(name: "value", arg: 1, scope: !3219, file: !72, line: 3086, type: !13)
!3221 = !DILocation(line: 3086, column: 33, scope: !3219)
!3222 = !DILocalVariable(name: "factor", arg: 2, scope: !3219, file: !72, line: 3086, type: !13)
!3223 = !DILocation(line: 3086, column: 44, scope: !3219)
!3224 = !DILocation(line: 3088, column: 44, scope: !3219)
!3225 = !DILocation(line: 3088, column: 50, scope: !3219)
!3226 = !DILocation(line: 3088, column: 10, scope: !3219)
!3227 = !DILocation(line: 3088, column: 3, scope: !3219)
!3228 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !72, file: !72, line: 3111, type: !301, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3229 = !DILocalVariable(name: "value", arg: 1, scope: !3228, file: !72, line: 3111, type: !13)
!3230 = !DILocation(line: 3111, column: 31, scope: !3228)
!3231 = !DILocalVariable(name: "factor", arg: 2, scope: !3228, file: !72, line: 3111, type: !13)
!3232 = !DILocation(line: 3111, column: 42, scope: !3228)
!3233 = !DILocation(line: 3113, column: 44, scope: !3228)
!3234 = !DILocation(line: 3113, column: 50, scope: !3228)
!3235 = !DILocation(line: 3113, column: 10, scope: !3228)
!3236 = !DILocation(line: 3113, column: 3, scope: !3228)
!3237 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !72, file: !72, line: 3136, type: !301, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3238 = !DILocalVariable(name: "value", arg: 1, scope: !3237, file: !72, line: 3136, type: !13)
!3239 = !DILocation(line: 3136, column: 33, scope: !3237)
!3240 = !DILocalVariable(name: "factor", arg: 2, scope: !3237, file: !72, line: 3136, type: !13)
!3241 = !DILocation(line: 3136, column: 44, scope: !3237)
!3242 = !DILocation(line: 3138, column: 44, scope: !3237)
!3243 = !DILocation(line: 3138, column: 50, scope: !3237)
!3244 = !DILocation(line: 3138, column: 10, scope: !3237)
!3245 = !DILocation(line: 3138, column: 3, scope: !3237)
!3246 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !72, file: !72, line: 3161, type: !301, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3247 = !DILocalVariable(name: "value", arg: 1, scope: !3246, file: !72, line: 3161, type: !13)
!3248 = !DILocation(line: 3161, column: 32, scope: !3246)
!3249 = !DILocalVariable(name: "factor", arg: 2, scope: !3246, file: !72, line: 3161, type: !13)
!3250 = !DILocation(line: 3161, column: 43, scope: !3246)
!3251 = !DILocation(line: 3163, column: 44, scope: !3246)
!3252 = !DILocation(line: 3163, column: 50, scope: !3246)
!3253 = !DILocation(line: 3163, column: 10, scope: !3246)
!3254 = !DILocation(line: 3163, column: 3, scope: !3246)
!3255 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !72, file: !72, line: 3185, type: !301, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3256 = !DILocalVariable(name: "value", arg: 1, scope: !3255, file: !72, line: 3185, type: !13)
!3257 = !DILocation(line: 3185, column: 31, scope: !3255)
!3258 = !DILocalVariable(name: "factor", arg: 2, scope: !3255, file: !72, line: 3185, type: !13)
!3259 = !DILocation(line: 3185, column: 42, scope: !3255)
!3260 = !DILocation(line: 3187, column: 44, scope: !3255)
!3261 = !DILocation(line: 3187, column: 50, scope: !3255)
!3262 = !DILocation(line: 3187, column: 10, scope: !3255)
!3263 = !DILocation(line: 3187, column: 3, scope: !3255)
!3264 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !72, file: !72, line: 3209, type: !301, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3265 = !DILocalVariable(name: "value", arg: 1, scope: !3264, file: !72, line: 3209, type: !13)
!3266 = !DILocation(line: 3209, column: 30, scope: !3264)
!3267 = !DILocalVariable(name: "factor", arg: 2, scope: !3264, file: !72, line: 3209, type: !13)
!3268 = !DILocation(line: 3209, column: 41, scope: !3264)
!3269 = !DILocation(line: 3211, column: 44, scope: !3264)
!3270 = !DILocation(line: 3211, column: 50, scope: !3264)
!3271 = !DILocation(line: 3211, column: 10, scope: !3264)
!3272 = !DILocation(line: 3211, column: 3, scope: !3264)
!3273 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !72, file: !72, line: 3233, type: !301, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3274 = !DILocalVariable(name: "value", arg: 1, scope: !3273, file: !72, line: 3233, type: !13)
!3275 = !DILocation(line: 3233, column: 33, scope: !3273)
!3276 = !DILocalVariable(name: "factor", arg: 2, scope: !3273, file: !72, line: 3233, type: !13)
!3277 = !DILocation(line: 3233, column: 44, scope: !3273)
!3278 = !DILocation(line: 3235, column: 44, scope: !3273)
!3279 = !DILocation(line: 3235, column: 50, scope: !3273)
!3280 = !DILocation(line: 3235, column: 10, scope: !3273)
!3281 = !DILocation(line: 3235, column: 3, scope: !3273)
!3282 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !72, file: !72, line: 3257, type: !301, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3283 = !DILocalVariable(name: "value", arg: 1, scope: !3282, file: !72, line: 3257, type: !13)
!3284 = !DILocation(line: 3257, column: 32, scope: !3282)
!3285 = !DILocalVariable(name: "factor", arg: 2, scope: !3282, file: !72, line: 3257, type: !13)
!3286 = !DILocation(line: 3257, column: 43, scope: !3282)
!3287 = !DILocation(line: 3259, column: 44, scope: !3282)
!3288 = !DILocation(line: 3259, column: 50, scope: !3282)
!3289 = !DILocation(line: 3259, column: 10, scope: !3282)
!3290 = !DILocation(line: 3259, column: 3, scope: !3282)
!3291 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !72, file: !72, line: 3281, type: !301, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3292 = !DILocalVariable(name: "value", arg: 1, scope: !3291, file: !72, line: 3281, type: !13)
!3293 = !DILocation(line: 3281, column: 31, scope: !3291)
!3294 = !DILocalVariable(name: "factor", arg: 2, scope: !3291, file: !72, line: 3281, type: !13)
!3295 = !DILocation(line: 3281, column: 42, scope: !3291)
!3296 = !DILocation(line: 3283, column: 44, scope: !3291)
!3297 = !DILocation(line: 3283, column: 50, scope: !3291)
!3298 = !DILocation(line: 3283, column: 10, scope: !3291)
!3299 = !DILocation(line: 3283, column: 3, scope: !3291)
!3300 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !72, file: !72, line: 3305, type: !301, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3301 = !DILocalVariable(name: "value", arg: 1, scope: !3300, file: !72, line: 3305, type: !13)
!3302 = !DILocation(line: 3305, column: 30, scope: !3300)
!3303 = !DILocalVariable(name: "factor", arg: 2, scope: !3300, file: !72, line: 3305, type: !13)
!3304 = !DILocation(line: 3305, column: 41, scope: !3300)
!3305 = !DILocation(line: 3307, column: 44, scope: !3300)
!3306 = !DILocation(line: 3307, column: 50, scope: !3300)
!3307 = !DILocation(line: 3307, column: 10, scope: !3300)
!3308 = !DILocation(line: 3307, column: 3, scope: !3300)
!3309 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !72, file: !72, line: 3328, type: !390, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3310 = !DILocalVariable(name: "value", arg: 1, scope: !3309, file: !72, line: 3328, type: !13)
!3311 = !DILocation(line: 3328, column: 33, scope: !3309)
!3312 = !DILocalVariable(name: "factor", arg: 2, scope: !3309, file: !72, line: 3328, type: !22)
!3313 = !DILocation(line: 3328, column: 44, scope: !3309)
!3314 = !DILocation(line: 3330, column: 41, scope: !3309)
!3315 = !DILocation(line: 3330, column: 47, scope: !3309)
!3316 = !DILocation(line: 3330, column: 10, scope: !3309)
!3317 = !DILocation(line: 3330, column: 3, scope: !3309)
!3318 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !72, file: !72, line: 3351, type: !390, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3319 = !DILocalVariable(name: "value", arg: 1, scope: !3318, file: !72, line: 3351, type: !13)
!3320 = !DILocation(line: 3351, column: 32, scope: !3318)
!3321 = !DILocalVariable(name: "factor", arg: 2, scope: !3318, file: !72, line: 3351, type: !22)
!3322 = !DILocation(line: 3351, column: 43, scope: !3318)
!3323 = !DILocation(line: 3353, column: 33, scope: !3318)
!3324 = !DILocation(line: 3353, column: 39, scope: !3318)
!3325 = !DILocation(line: 3353, column: 2, scope: !3318)
!3326 = !DILocation(line: 3354, column: 1, scope: !3318)
!3327 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !72, file: !72, line: 3375, type: !390, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3328 = !DILocalVariable(name: "value", arg: 1, scope: !3327, file: !72, line: 3375, type: !13)
!3329 = !DILocation(line: 3375, column: 31, scope: !3327)
!3330 = !DILocalVariable(name: "factor", arg: 2, scope: !3327, file: !72, line: 3375, type: !22)
!3331 = !DILocation(line: 3375, column: 42, scope: !3327)
!3332 = !DILocation(line: 3377, column: 41, scope: !3327)
!3333 = !DILocation(line: 3377, column: 47, scope: !3327)
!3334 = !DILocation(line: 3377, column: 10, scope: !3327)
!3335 = !DILocation(line: 3377, column: 3, scope: !3327)
!3336 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !72, file: !72, line: 3400, type: !390, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3337 = !DILocalVariable(name: "value", arg: 1, scope: !3336, file: !72, line: 3400, type: !13)
!3338 = !DILocation(line: 3400, column: 33, scope: !3336)
!3339 = !DILocalVariable(name: "factor", arg: 2, scope: !3336, file: !72, line: 3400, type: !22)
!3340 = !DILocation(line: 3400, column: 44, scope: !3336)
!3341 = !DILocation(line: 3402, column: 44, scope: !3336)
!3342 = !DILocation(line: 3402, column: 50, scope: !3336)
!3343 = !DILocation(line: 3402, column: 10, scope: !3336)
!3344 = !DILocation(line: 3402, column: 3, scope: !3336)
!3345 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !72, file: !72, line: 3425, type: !390, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3346 = !DILocalVariable(name: "value", arg: 1, scope: !3345, file: !72, line: 3425, type: !13)
!3347 = !DILocation(line: 3425, column: 32, scope: !3345)
!3348 = !DILocalVariable(name: "factor", arg: 2, scope: !3345, file: !72, line: 3425, type: !22)
!3349 = !DILocation(line: 3425, column: 43, scope: !3345)
!3350 = !DILocation(line: 3427, column: 44, scope: !3345)
!3351 = !DILocation(line: 3427, column: 50, scope: !3345)
!3352 = !DILocation(line: 3427, column: 10, scope: !3345)
!3353 = !DILocation(line: 3427, column: 3, scope: !3345)
!3354 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !72, file: !72, line: 3450, type: !390, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3355 = !DILocalVariable(name: "value", arg: 1, scope: !3354, file: !72, line: 3450, type: !13)
!3356 = !DILocation(line: 3450, column: 31, scope: !3354)
!3357 = !DILocalVariable(name: "factor", arg: 2, scope: !3354, file: !72, line: 3450, type: !22)
!3358 = !DILocation(line: 3450, column: 42, scope: !3354)
!3359 = !DILocation(line: 3452, column: 44, scope: !3354)
!3360 = !DILocation(line: 3452, column: 50, scope: !3354)
!3361 = !DILocation(line: 3452, column: 10, scope: !3354)
!3362 = !DILocation(line: 3452, column: 3, scope: !3354)
!3363 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !72, file: !72, line: 3475, type: !390, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3364 = !DILocalVariable(name: "value", arg: 1, scope: !3363, file: !72, line: 3475, type: !13)
!3365 = !DILocation(line: 3475, column: 33, scope: !3363)
!3366 = !DILocalVariable(name: "factor", arg: 2, scope: !3363, file: !72, line: 3475, type: !22)
!3367 = !DILocation(line: 3475, column: 44, scope: !3363)
!3368 = !DILocation(line: 3477, column: 44, scope: !3363)
!3369 = !DILocation(line: 3477, column: 50, scope: !3363)
!3370 = !DILocation(line: 3477, column: 10, scope: !3363)
!3371 = !DILocation(line: 3477, column: 3, scope: !3363)
!3372 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !72, file: !72, line: 3500, type: !390, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3373 = !DILocalVariable(name: "value", arg: 1, scope: !3372, file: !72, line: 3500, type: !13)
!3374 = !DILocation(line: 3500, column: 32, scope: !3372)
!3375 = !DILocalVariable(name: "factor", arg: 2, scope: !3372, file: !72, line: 3500, type: !22)
!3376 = !DILocation(line: 3500, column: 43, scope: !3372)
!3377 = !DILocation(line: 3502, column: 44, scope: !3372)
!3378 = !DILocation(line: 3502, column: 50, scope: !3372)
!3379 = !DILocation(line: 3502, column: 10, scope: !3372)
!3380 = !DILocation(line: 3502, column: 3, scope: !3372)
!3381 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !72, file: !72, line: 3524, type: !390, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3382 = !DILocalVariable(name: "value", arg: 1, scope: !3381, file: !72, line: 3524, type: !13)
!3383 = !DILocation(line: 3524, column: 31, scope: !3381)
!3384 = !DILocalVariable(name: "factor", arg: 2, scope: !3381, file: !72, line: 3524, type: !22)
!3385 = !DILocation(line: 3524, column: 42, scope: !3381)
!3386 = !DILocation(line: 3526, column: 44, scope: !3381)
!3387 = !DILocation(line: 3526, column: 50, scope: !3381)
!3388 = !DILocation(line: 3526, column: 10, scope: !3381)
!3389 = !DILocation(line: 3526, column: 3, scope: !3381)
!3390 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !72, file: !72, line: 3548, type: !390, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3391 = !DILocalVariable(name: "value", arg: 1, scope: !3390, file: !72, line: 3548, type: !13)
!3392 = !DILocation(line: 3548, column: 30, scope: !3390)
!3393 = !DILocalVariable(name: "factor", arg: 2, scope: !3390, file: !72, line: 3548, type: !22)
!3394 = !DILocation(line: 3548, column: 41, scope: !3390)
!3395 = !DILocation(line: 3550, column: 44, scope: !3390)
!3396 = !DILocation(line: 3550, column: 50, scope: !3390)
!3397 = !DILocation(line: 3550, column: 10, scope: !3390)
!3398 = !DILocation(line: 3550, column: 3, scope: !3390)
!3399 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !72, file: !72, line: 3572, type: !390, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3400 = !DILocalVariable(name: "value", arg: 1, scope: !3399, file: !72, line: 3572, type: !13)
!3401 = !DILocation(line: 3572, column: 33, scope: !3399)
!3402 = !DILocalVariable(name: "factor", arg: 2, scope: !3399, file: !72, line: 3572, type: !22)
!3403 = !DILocation(line: 3572, column: 44, scope: !3399)
!3404 = !DILocation(line: 3574, column: 44, scope: !3399)
!3405 = !DILocation(line: 3574, column: 50, scope: !3399)
!3406 = !DILocation(line: 3574, column: 10, scope: !3399)
!3407 = !DILocation(line: 3574, column: 3, scope: !3399)
!3408 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !72, file: !72, line: 3596, type: !390, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3409 = !DILocalVariable(name: "value", arg: 1, scope: !3408, file: !72, line: 3596, type: !13)
!3410 = !DILocation(line: 3596, column: 32, scope: !3408)
!3411 = !DILocalVariable(name: "factor", arg: 2, scope: !3408, file: !72, line: 3596, type: !22)
!3412 = !DILocation(line: 3596, column: 43, scope: !3408)
!3413 = !DILocation(line: 3598, column: 44, scope: !3408)
!3414 = !DILocation(line: 3598, column: 50, scope: !3408)
!3415 = !DILocation(line: 3598, column: 10, scope: !3408)
!3416 = !DILocation(line: 3598, column: 3, scope: !3408)
!3417 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !72, file: !72, line: 3620, type: !390, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3418 = !DILocalVariable(name: "value", arg: 1, scope: !3417, file: !72, line: 3620, type: !13)
!3419 = !DILocation(line: 3620, column: 31, scope: !3417)
!3420 = !DILocalVariable(name: "factor", arg: 2, scope: !3417, file: !72, line: 3620, type: !22)
!3421 = !DILocation(line: 3620, column: 42, scope: !3417)
!3422 = !DILocation(line: 3622, column: 44, scope: !3417)
!3423 = !DILocation(line: 3622, column: 50, scope: !3417)
!3424 = !DILocation(line: 3622, column: 10, scope: !3417)
!3425 = !DILocation(line: 3622, column: 3, scope: !3417)
!3426 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !72, file: !72, line: 3644, type: !390, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3427 = !DILocalVariable(name: "value", arg: 1, scope: !3426, file: !72, line: 3644, type: !13)
!3428 = !DILocation(line: 3644, column: 30, scope: !3426)
!3429 = !DILocalVariable(name: "factor", arg: 2, scope: !3426, file: !72, line: 3644, type: !22)
!3430 = !DILocation(line: 3644, column: 41, scope: !3426)
!3431 = !DILocation(line: 3646, column: 44, scope: !3426)
!3432 = !DILocation(line: 3646, column: 50, scope: !3426)
!3433 = !DILocation(line: 3646, column: 10, scope: !3426)
!3434 = !DILocation(line: 3646, column: 3, scope: !3426)
!3435 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !72, file: !72, line: 3666, type: !475, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3436 = !DILocalVariable(name: "value", arg: 1, scope: !3435, file: !72, line: 3666, type: !13)
!3437 = !DILocation(line: 3666, column: 32, scope: !3435)
!3438 = !DILocalVariable(name: "factor", arg: 2, scope: !3435, file: !72, line: 3666, type: !17)
!3439 = !DILocation(line: 3666, column: 42, scope: !3435)
!3440 = !DILocation(line: 3668, column: 40, scope: !3435)
!3441 = !DILocation(line: 3668, column: 58, scope: !3435)
!3442 = !DILocation(line: 3668, column: 52, scope: !3435)
!3443 = !DILocation(line: 3668, column: 66, scope: !3435)
!3444 = !DILocation(line: 3668, column: 46, scope: !3435)
!3445 = !DILocation(line: 3668, column: 10, scope: !3435)
!3446 = !DILocation(line: 3668, column: 3, scope: !3435)
!3447 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !72, file: !72, line: 3688, type: !475, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3448 = !DILocalVariable(name: "value", arg: 1, scope: !3447, file: !72, line: 3688, type: !13)
!3449 = !DILocation(line: 3688, column: 31, scope: !3447)
!3450 = !DILocalVariable(name: "factor", arg: 2, scope: !3447, file: !72, line: 3688, type: !17)
!3451 = !DILocation(line: 3688, column: 41, scope: !3447)
!3452 = !DILocation(line: 3690, column: 40, scope: !3447)
!3453 = !DILocation(line: 3690, column: 58, scope: !3447)
!3454 = !DILocation(line: 3690, column: 52, scope: !3447)
!3455 = !DILocation(line: 3690, column: 66, scope: !3447)
!3456 = !DILocation(line: 3690, column: 46, scope: !3447)
!3457 = !DILocation(line: 3690, column: 10, scope: !3447)
!3458 = !DILocation(line: 3690, column: 3, scope: !3447)
!3459 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !72, file: !72, line: 3711, type: !475, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3460 = !DILocalVariable(name: "value", arg: 1, scope: !3459, file: !72, line: 3711, type: !13)
!3461 = !DILocation(line: 3711, column: 30, scope: !3459)
!3462 = !DILocalVariable(name: "factor", arg: 2, scope: !3459, file: !72, line: 3711, type: !17)
!3463 = !DILocation(line: 3711, column: 40, scope: !3459)
!3464 = !DILocation(line: 3713, column: 40, scope: !3459)
!3465 = !DILocation(line: 3713, column: 58, scope: !3459)
!3466 = !DILocation(line: 3713, column: 52, scope: !3459)
!3467 = !DILocation(line: 3713, column: 66, scope: !3459)
!3468 = !DILocation(line: 3713, column: 46, scope: !3459)
!3469 = !DILocation(line: 3713, column: 10, scope: !3459)
!3470 = !DILocation(line: 3713, column: 3, scope: !3459)
!3471 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !72, file: !72, line: 3734, type: !475, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3472 = !DILocalVariable(name: "value", arg: 1, scope: !3471, file: !72, line: 3734, type: !13)
!3473 = !DILocation(line: 3734, column: 31, scope: !3471)
!3474 = !DILocalVariable(name: "factor", arg: 2, scope: !3471, file: !72, line: 3734, type: !17)
!3475 = !DILocation(line: 3734, column: 41, scope: !3471)
!3476 = !DILocation(line: 3736, column: 43, scope: !3471)
!3477 = !DILocation(line: 3736, column: 61, scope: !3471)
!3478 = !DILocation(line: 3736, column: 55, scope: !3471)
!3479 = !DILocation(line: 3736, column: 69, scope: !3471)
!3480 = !DILocation(line: 3736, column: 49, scope: !3471)
!3481 = !DILocation(line: 3736, column: 10, scope: !3471)
!3482 = !DILocation(line: 3736, column: 3, scope: !3471)
!3483 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !72, file: !72, line: 3757, type: !475, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3484 = !DILocalVariable(name: "value", arg: 1, scope: !3483, file: !72, line: 3757, type: !13)
!3485 = !DILocation(line: 3757, column: 30, scope: !3483)
!3486 = !DILocalVariable(name: "factor", arg: 2, scope: !3483, file: !72, line: 3757, type: !17)
!3487 = !DILocation(line: 3757, column: 40, scope: !3483)
!3488 = !DILocation(line: 3759, column: 43, scope: !3483)
!3489 = !DILocation(line: 3759, column: 61, scope: !3483)
!3490 = !DILocation(line: 3759, column: 55, scope: !3483)
!3491 = !DILocation(line: 3759, column: 69, scope: !3483)
!3492 = !DILocation(line: 3759, column: 49, scope: !3483)
!3493 = !DILocation(line: 3759, column: 10, scope: !3483)
!3494 = !DILocation(line: 3759, column: 3, scope: !3483)
!3495 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !72, file: !72, line: 3779, type: !475, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3496 = !DILocalVariable(name: "value", arg: 1, scope: !3495, file: !72, line: 3779, type: !13)
!3497 = !DILocation(line: 3779, column: 30, scope: !3495)
!3498 = !DILocalVariable(name: "factor", arg: 2, scope: !3495, file: !72, line: 3779, type: !17)
!3499 = !DILocation(line: 3779, column: 40, scope: !3495)
!3500 = !DILocation(line: 3781, column: 43, scope: !3495)
!3501 = !DILocation(line: 3781, column: 61, scope: !3495)
!3502 = !DILocation(line: 3781, column: 55, scope: !3495)
!3503 = !DILocation(line: 3781, column: 69, scope: !3495)
!3504 = !DILocation(line: 3781, column: 49, scope: !3495)
!3505 = !DILocation(line: 3781, column: 10, scope: !3495)
!3506 = !DILocation(line: 3781, column: 3, scope: !3495)
!3507 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !72, file: !72, line: 3801, type: !475, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3508 = !DILocalVariable(name: "value", arg: 1, scope: !3507, file: !72, line: 3801, type: !13)
!3509 = !DILocation(line: 3801, column: 29, scope: !3507)
!3510 = !DILocalVariable(name: "factor", arg: 2, scope: !3507, file: !72, line: 3801, type: !17)
!3511 = !DILocation(line: 3801, column: 39, scope: !3507)
!3512 = !DILocation(line: 3803, column: 43, scope: !3507)
!3513 = !DILocation(line: 3803, column: 61, scope: !3507)
!3514 = !DILocation(line: 3803, column: 55, scope: !3507)
!3515 = !DILocation(line: 3803, column: 69, scope: !3507)
!3516 = !DILocation(line: 3803, column: 49, scope: !3507)
!3517 = !DILocation(line: 3803, column: 10, scope: !3507)
!3518 = !DILocation(line: 3803, column: 3, scope: !3507)
!3519 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !72, file: !72, line: 3823, type: !475, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3520 = !DILocalVariable(name: "value", arg: 1, scope: !3519, file: !72, line: 3823, type: !13)
!3521 = !DILocation(line: 3823, column: 30, scope: !3519)
!3522 = !DILocalVariable(name: "factor", arg: 2, scope: !3519, file: !72, line: 3823, type: !17)
!3523 = !DILocation(line: 3823, column: 40, scope: !3519)
!3524 = !DILocation(line: 3825, column: 43, scope: !3519)
!3525 = !DILocation(line: 3825, column: 61, scope: !3519)
!3526 = !DILocation(line: 3825, column: 55, scope: !3519)
!3527 = !DILocation(line: 3825, column: 69, scope: !3519)
!3528 = !DILocation(line: 3825, column: 49, scope: !3519)
!3529 = !DILocation(line: 3825, column: 10, scope: !3519)
!3530 = !DILocation(line: 3825, column: 3, scope: !3519)
!3531 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !72, file: !72, line: 3845, type: !475, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3532 = !DILocalVariable(name: "value", arg: 1, scope: !3531, file: !72, line: 3845, type: !13)
!3533 = !DILocation(line: 3845, column: 29, scope: !3531)
!3534 = !DILocalVariable(name: "factor", arg: 2, scope: !3531, file: !72, line: 3845, type: !17)
!3535 = !DILocation(line: 3845, column: 39, scope: !3531)
!3536 = !DILocation(line: 3847, column: 43, scope: !3531)
!3537 = !DILocation(line: 3847, column: 61, scope: !3531)
!3538 = !DILocation(line: 3847, column: 55, scope: !3531)
!3539 = !DILocation(line: 3847, column: 69, scope: !3531)
!3540 = !DILocation(line: 3847, column: 49, scope: !3531)
!3541 = !DILocation(line: 3847, column: 10, scope: !3531)
!3542 = !DILocation(line: 3847, column: 3, scope: !3531)
!3543 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !72, file: !72, line: 3869, type: !1883, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3544 = !DILocalVariable(name: "value", arg: 1, scope: !3543, file: !72, line: 3869, type: !80)
!3545 = !DILocation(line: 3869, column: 31, scope: !3543)
!3546 = !DILocalVariable(name: "factor", arg: 2, scope: !3543, file: !72, line: 3869, type: !13)
!3547 = !DILocation(line: 3869, column: 42, scope: !3543)
!3548 = !DILocation(line: 3871, column: 41, scope: !3543)
!3549 = !DILocation(line: 3871, column: 47, scope: !3543)
!3550 = !DILocation(line: 3871, column: 10, scope: !3543)
!3551 = !DILocation(line: 3871, column: 3, scope: !3543)
!3552 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !72, file: !72, line: 5065, type: !3553, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3553 = !DISubroutineType(types: !3554)
!3554 = !{!80, !80, !13, !736}
!3555 = !DILocalVariable(name: "value", arg: 1, scope: !3552, file: !72, line: 5065, type: !80)
!3556 = !DILocation(line: 5065, column: 40, scope: !3552)
!3557 = !DILocalVariable(name: "factor", arg: 2, scope: !3552, file: !72, line: 5065, type: !13)
!3558 = !DILocation(line: 5065, column: 51, scope: !3552)
!3559 = !DILocalVariable(name: "count", arg: 3, scope: !3552, file: !72, line: 5065, type: !736)
!3560 = !DILocation(line: 5065, column: 63, scope: !3552)
!3561 = !DILocalVariable(name: "u32Temp1", scope: !3552, file: !72, line: 5067, type: !736)
!3562 = !DILocation(line: 5067, column: 6, scope: !3552)
!3563 = !DILocalVariable(name: "u32Temp2", scope: !3552, file: !72, line: 5067, type: !736)
!3564 = !DILocation(line: 5067, column: 17, scope: !3552)
!3565 = !DILocalVariable(name: "u32Temp3", scope: !3552, file: !72, line: 5067, type: !736)
!3566 = !DILocation(line: 5067, column: 26, scope: !3552)
!3567 = !DILocalVariable(name: "u32Temp4", scope: !3552, file: !72, line: 5067, type: !736)
!3568 = !DILocation(line: 5067, column: 35, scope: !3552)
!3569 = !DILocalVariable(name: "u8SignBit", scope: !3552, file: !72, line: 5068, type: !17)
!3570 = !DILocation(line: 5068, column: 5, scope: !3552)
!3571 = !DILocation(line: 5070, column: 7, scope: !3572)
!3572 = distinct !DILexicalBlock(scope: !3552, file: !72, line: 5070, column: 5)
!3573 = !DILocation(line: 5070, column: 12, scope: !3572)
!3574 = !DILocation(line: 5070, column: 16, scope: !3572)
!3575 = !DILocation(line: 5070, column: 20, scope: !3572)
!3576 = !DILocation(line: 5070, column: 26, scope: !3572)
!3577 = !DILocation(line: 5070, column: 31, scope: !3572)
!3578 = !DILocation(line: 5070, column: 36, scope: !3572)
!3579 = !DILocation(line: 5070, column: 41, scope: !3572)
!3580 = !DILocation(line: 5070, column: 45, scope: !3572)
!3581 = !DILocation(line: 5070, column: 49, scope: !3572)
!3582 = !DILocation(line: 5070, column: 55, scope: !3572)
!3583 = !DILocation(line: 5070, column: 5, scope: !3552)
!3584 = !DILocation(line: 5072, column: 13, scope: !3585)
!3585 = distinct !DILexicalBlock(scope: !3572, file: !72, line: 5071, column: 2)
!3586 = !DILocation(line: 5073, column: 2, scope: !3585)
!3587 = !DILocation(line: 5076, column: 13, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3572, file: !72, line: 5075, column: 2)
!3589 = !DILocation(line: 5079, column: 5, scope: !3590)
!3590 = distinct !DILexicalBlock(scope: !3552, file: !72, line: 5079, column: 5)
!3591 = !DILocation(line: 5079, column: 10, scope: !3590)
!3592 = !DILocation(line: 5079, column: 5, scope: !3552)
!3593 = !DILocation(line: 5081, column: 15, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3590, file: !72, line: 5080, column: 2)
!3595 = !DILocation(line: 5081, column: 14, scope: !3594)
!3596 = !DILocation(line: 5081, column: 12, scope: !3594)
!3597 = !DILocation(line: 5082, column: 2, scope: !3594)
!3598 = !DILocation(line: 5085, column: 14, scope: !3599)
!3599 = distinct !DILexicalBlock(scope: !3590, file: !72, line: 5084, column: 2)
!3600 = !DILocation(line: 5085, column: 12, scope: !3599)
!3601 = !DILocation(line: 5088, column: 5, scope: !3602)
!3602 = distinct !DILexicalBlock(scope: !3552, file: !72, line: 5088, column: 5)
!3603 = !DILocation(line: 5088, column: 11, scope: !3602)
!3604 = !DILocation(line: 5088, column: 5, scope: !3552)
!3605 = !DILocation(line: 5090, column: 15, scope: !3606)
!3606 = distinct !DILexicalBlock(scope: !3602, file: !72, line: 5089, column: 2)
!3607 = !DILocation(line: 5090, column: 14, scope: !3606)
!3608 = !DILocation(line: 5090, column: 12, scope: !3606)
!3609 = !DILocation(line: 5091, column: 2, scope: !3606)
!3610 = !DILocation(line: 5094, column: 14, scope: !3611)
!3611 = distinct !DILexicalBlock(scope: !3602, file: !72, line: 5093, column: 2)
!3612 = !DILocation(line: 5094, column: 12, scope: !3611)
!3613 = !DILocation(line: 5097, column: 13, scope: !3552)
!3614 = !DILocation(line: 5097, column: 24, scope: !3552)
!3615 = !DILocation(line: 5097, column: 22, scope: !3552)
!3616 = !DILocation(line: 5097, column: 11, scope: !3552)
!3617 = !DILocation(line: 5098, column: 25, scope: !3552)
!3618 = !DILocation(line: 5098, column: 35, scope: !3552)
!3619 = !DILocation(line: 5098, column: 13, scope: !3552)
!3620 = !DILocation(line: 5098, column: 11, scope: !3552)
!3621 = !DILocation(line: 5099, column: 13, scope: !3552)
!3622 = !DILocation(line: 5099, column: 25, scope: !3552)
!3623 = !DILocation(line: 5099, column: 22, scope: !3552)
!3624 = !DILocation(line: 5099, column: 11, scope: !3552)
!3625 = !DILocation(line: 5100, column: 14, scope: !3552)
!3626 = !DILocation(line: 5100, column: 30, scope: !3552)
!3627 = !DILocation(line: 5100, column: 29, scope: !3552)
!3628 = !DILocation(line: 5100, column: 23, scope: !3552)
!3629 = !DILocation(line: 5100, column: 11, scope: !3552)
!3630 = !DILocation(line: 5101, column: 6, scope: !3631)
!3631 = distinct !DILexicalBlock(scope: !3552, file: !72, line: 5101, column: 5)
!3632 = !DILocation(line: 5101, column: 16, scope: !3631)
!3633 = !DILocation(line: 5101, column: 14, scope: !3631)
!3634 = !DILocation(line: 5101, column: 22, scope: !3631)
!3635 = !DILocation(line: 5101, column: 5, scope: !3552)
!3636 = !DILocation(line: 5103, column: 6, scope: !3637)
!3637 = distinct !DILexicalBlock(scope: !3638, file: !72, line: 5103, column: 6)
!3638 = distinct !DILexicalBlock(scope: !3631, file: !72, line: 5102, column: 2)
!3639 = !DILocation(line: 5103, column: 16, scope: !3637)
!3640 = !DILocation(line: 5103, column: 6, scope: !3638)
!3641 = !DILocation(line: 5105, column: 7, scope: !3642)
!3642 = distinct !DILexicalBlock(scope: !3643, file: !72, line: 5105, column: 7)
!3643 = distinct !DILexicalBlock(scope: !3637, file: !72, line: 5104, column: 3)
!3644 = !DILocation(line: 5105, column: 15, scope: !3642)
!3645 = !DILocation(line: 5105, column: 7, scope: !3643)
!3646 = !DILocation(line: 5106, column: 12, scope: !3642)
!3647 = !DILocation(line: 5106, column: 5, scope: !3642)
!3648 = !DILocation(line: 5108, column: 5, scope: !3642)
!3649 = !DILocation(line: 5112, column: 7, scope: !3650)
!3650 = distinct !DILexicalBlock(scope: !3651, file: !72, line: 5112, column: 7)
!3651 = distinct !DILexicalBlock(scope: !3637, file: !72, line: 5111, column: 3)
!3652 = !DILocation(line: 5112, column: 15, scope: !3650)
!3653 = !DILocation(line: 5112, column: 7, scope: !3651)
!3654 = !DILocation(line: 5113, column: 13, scope: !3650)
!3655 = !DILocation(line: 5113, column: 12, scope: !3650)
!3656 = !DILocation(line: 5113, column: 5, scope: !3650)
!3657 = !DILocation(line: 5115, column: 5, scope: !3650)
!3658 = !DILocation(line: 5120, column: 3, scope: !3659)
!3659 = distinct !DILexicalBlock(scope: !3631, file: !72, line: 5119, column: 2)
!3660 = !DILocation(line: 5122, column: 1, scope: !3552)
!3661 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !72, file: !72, line: 3893, type: !2652, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3662 = !DILocalVariable(name: "value", arg: 1, scope: !3661, file: !72, line: 3893, type: !80)
!3663 = !DILocation(line: 3893, column: 30, scope: !3661)
!3664 = !DILocalVariable(name: "factor", arg: 2, scope: !3661, file: !72, line: 3893, type: !6)
!3665 = !DILocation(line: 3893, column: 40, scope: !3661)
!3666 = !DILocation(line: 3895, column: 40, scope: !3661)
!3667 = !DILocation(line: 3895, column: 46, scope: !3661)
!3668 = !DILocation(line: 3895, column: 10, scope: !3661)
!3669 = !DILocation(line: 3895, column: 3, scope: !3661)
!3670 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !72, file: !72, line: 5217, type: !3671, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3671 = !DISubroutineType(types: !3672)
!3672 = !{!80, !80, !6, !736}
!3673 = !DILocalVariable(name: "value", arg: 1, scope: !3670, file: !72, line: 5217, type: !80)
!3674 = !DILocation(line: 5217, column: 39, scope: !3670)
!3675 = !DILocalVariable(name: "factor", arg: 2, scope: !3670, file: !72, line: 5217, type: !6)
!3676 = !DILocation(line: 5217, column: 49, scope: !3670)
!3677 = !DILocalVariable(name: "count", arg: 3, scope: !3670, file: !72, line: 5217, type: !736)
!3678 = !DILocation(line: 5217, column: 61, scope: !3670)
!3679 = !DILocalVariable(name: "u32Temp1", scope: !3670, file: !72, line: 5219, type: !736)
!3680 = !DILocation(line: 5219, column: 6, scope: !3670)
!3681 = !DILocalVariable(name: "u32Temp2", scope: !3670, file: !72, line: 5219, type: !736)
!3682 = !DILocation(line: 5219, column: 17, scope: !3670)
!3683 = !DILocalVariable(name: "u32Temp3", scope: !3670, file: !72, line: 5219, type: !736)
!3684 = !DILocation(line: 5219, column: 26, scope: !3670)
!3685 = !DILocalVariable(name: "u32Temp4", scope: !3670, file: !72, line: 5219, type: !736)
!3686 = !DILocation(line: 5219, column: 35, scope: !3670)
!3687 = !DILocalVariable(name: "u8SignBit", scope: !3670, file: !72, line: 5220, type: !17)
!3688 = !DILocation(line: 5220, column: 5, scope: !3670)
!3689 = !DILocation(line: 5222, column: 7, scope: !3690)
!3690 = distinct !DILexicalBlock(scope: !3670, file: !72, line: 5222, column: 5)
!3691 = !DILocation(line: 5222, column: 12, scope: !3690)
!3692 = !DILocation(line: 5222, column: 16, scope: !3690)
!3693 = !DILocation(line: 5222, column: 20, scope: !3690)
!3694 = !DILocation(line: 5222, column: 26, scope: !3690)
!3695 = !DILocation(line: 5222, column: 31, scope: !3690)
!3696 = !DILocation(line: 5222, column: 36, scope: !3690)
!3697 = !DILocation(line: 5222, column: 41, scope: !3690)
!3698 = !DILocation(line: 5222, column: 45, scope: !3690)
!3699 = !DILocation(line: 5222, column: 49, scope: !3690)
!3700 = !DILocation(line: 5222, column: 55, scope: !3690)
!3701 = !DILocation(line: 5222, column: 5, scope: !3670)
!3702 = !DILocation(line: 5224, column: 13, scope: !3703)
!3703 = distinct !DILexicalBlock(scope: !3690, file: !72, line: 5223, column: 2)
!3704 = !DILocation(line: 5225, column: 2, scope: !3703)
!3705 = !DILocation(line: 5228, column: 13, scope: !3706)
!3706 = distinct !DILexicalBlock(scope: !3690, file: !72, line: 5227, column: 2)
!3707 = !DILocation(line: 5231, column: 5, scope: !3708)
!3708 = distinct !DILexicalBlock(scope: !3670, file: !72, line: 5231, column: 5)
!3709 = !DILocation(line: 5231, column: 10, scope: !3708)
!3710 = !DILocation(line: 5231, column: 5, scope: !3670)
!3711 = !DILocation(line: 5233, column: 15, scope: !3712)
!3712 = distinct !DILexicalBlock(scope: !3708, file: !72, line: 5232, column: 2)
!3713 = !DILocation(line: 5233, column: 14, scope: !3712)
!3714 = !DILocation(line: 5233, column: 12, scope: !3712)
!3715 = !DILocation(line: 5234, column: 2, scope: !3712)
!3716 = !DILocation(line: 5237, column: 14, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3708, file: !72, line: 5236, column: 2)
!3718 = !DILocation(line: 5237, column: 12, scope: !3717)
!3719 = !DILocation(line: 5240, column: 5, scope: !3720)
!3720 = distinct !DILexicalBlock(scope: !3670, file: !72, line: 5240, column: 5)
!3721 = !DILocation(line: 5240, column: 11, scope: !3720)
!3722 = !DILocation(line: 5240, column: 5, scope: !3670)
!3723 = !DILocation(line: 5242, column: 15, scope: !3724)
!3724 = distinct !DILexicalBlock(scope: !3720, file: !72, line: 5241, column: 2)
!3725 = !DILocation(line: 5242, column: 14, scope: !3724)
!3726 = !DILocation(line: 5242, column: 12, scope: !3724)
!3727 = !DILocation(line: 5243, column: 2, scope: !3724)
!3728 = !DILocation(line: 5246, column: 14, scope: !3729)
!3729 = distinct !DILexicalBlock(scope: !3720, file: !72, line: 5245, column: 2)
!3730 = !DILocation(line: 5246, column: 12, scope: !3729)
!3731 = !DILocation(line: 5249, column: 13, scope: !3670)
!3732 = !DILocation(line: 5249, column: 24, scope: !3670)
!3733 = !DILocation(line: 5249, column: 22, scope: !3670)
!3734 = !DILocation(line: 5249, column: 11, scope: !3670)
!3735 = !DILocation(line: 5250, column: 25, scope: !3670)
!3736 = !DILocation(line: 5250, column: 35, scope: !3670)
!3737 = !DILocation(line: 5250, column: 13, scope: !3670)
!3738 = !DILocation(line: 5250, column: 11, scope: !3670)
!3739 = !DILocation(line: 5251, column: 13, scope: !3670)
!3740 = !DILocation(line: 5251, column: 25, scope: !3670)
!3741 = !DILocation(line: 5251, column: 22, scope: !3670)
!3742 = !DILocation(line: 5251, column: 11, scope: !3670)
!3743 = !DILocation(line: 5252, column: 14, scope: !3670)
!3744 = !DILocation(line: 5252, column: 30, scope: !3670)
!3745 = !DILocation(line: 5252, column: 29, scope: !3670)
!3746 = !DILocation(line: 5252, column: 23, scope: !3670)
!3747 = !DILocation(line: 5252, column: 11, scope: !3670)
!3748 = !DILocation(line: 5253, column: 6, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3670, file: !72, line: 5253, column: 5)
!3750 = !DILocation(line: 5253, column: 16, scope: !3749)
!3751 = !DILocation(line: 5253, column: 14, scope: !3749)
!3752 = !DILocation(line: 5253, column: 22, scope: !3749)
!3753 = !DILocation(line: 5253, column: 5, scope: !3670)
!3754 = !DILocation(line: 5255, column: 6, scope: !3755)
!3755 = distinct !DILexicalBlock(scope: !3756, file: !72, line: 5255, column: 6)
!3756 = distinct !DILexicalBlock(scope: !3749, file: !72, line: 5254, column: 2)
!3757 = !DILocation(line: 5255, column: 16, scope: !3755)
!3758 = !DILocation(line: 5255, column: 6, scope: !3756)
!3759 = !DILocation(line: 5257, column: 7, scope: !3760)
!3760 = distinct !DILexicalBlock(scope: !3761, file: !72, line: 5257, column: 7)
!3761 = distinct !DILexicalBlock(scope: !3755, file: !72, line: 5256, column: 3)
!3762 = !DILocation(line: 5257, column: 15, scope: !3760)
!3763 = !DILocation(line: 5257, column: 7, scope: !3761)
!3764 = !DILocation(line: 5258, column: 12, scope: !3760)
!3765 = !DILocation(line: 5258, column: 5, scope: !3760)
!3766 = !DILocation(line: 5260, column: 5, scope: !3760)
!3767 = !DILocation(line: 5264, column: 7, scope: !3768)
!3768 = distinct !DILexicalBlock(scope: !3769, file: !72, line: 5264, column: 7)
!3769 = distinct !DILexicalBlock(scope: !3755, file: !72, line: 5263, column: 3)
!3770 = !DILocation(line: 5264, column: 15, scope: !3768)
!3771 = !DILocation(line: 5264, column: 7, scope: !3769)
!3772 = !DILocation(line: 5265, column: 13, scope: !3768)
!3773 = !DILocation(line: 5265, column: 12, scope: !3768)
!3774 = !DILocation(line: 5265, column: 5, scope: !3768)
!3775 = !DILocation(line: 5267, column: 5, scope: !3768)
!3776 = !DILocation(line: 5272, column: 3, scope: !3777)
!3777 = distinct !DILexicalBlock(scope: !3749, file: !72, line: 5271, column: 2)
!3778 = !DILocation(line: 5274, column: 1, scope: !3670)
!3779 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !72, file: !72, line: 3917, type: !772, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3780 = !DILocalVariable(name: "value", arg: 1, scope: !3779, file: !72, line: 3917, type: !80)
!3781 = !DILocation(line: 3917, column: 31, scope: !3779)
!3782 = !DILocalVariable(name: "factor", arg: 2, scope: !3779, file: !72, line: 3917, type: !22)
!3783 = !DILocation(line: 3917, column: 42, scope: !3779)
!3784 = !DILocation(line: 3919, column: 41, scope: !3779)
!3785 = !DILocation(line: 3919, column: 47, scope: !3779)
!3786 = !DILocation(line: 3919, column: 10, scope: !3779)
!3787 = !DILocation(line: 3919, column: 3, scope: !3779)
!3788 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !72, file: !72, line: 5141, type: !3789, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3789 = !DISubroutineType(types: !3790)
!3790 = !{!80, !80, !22, !736}
!3791 = !DILocalVariable(name: "value", arg: 1, scope: !3788, file: !72, line: 5141, type: !80)
!3792 = !DILocation(line: 5141, column: 40, scope: !3788)
!3793 = !DILocalVariable(name: "factor", arg: 2, scope: !3788, file: !72, line: 5141, type: !22)
!3794 = !DILocation(line: 5141, column: 50, scope: !3788)
!3795 = !DILocalVariable(name: "count", arg: 3, scope: !3788, file: !72, line: 5141, type: !736)
!3796 = !DILocation(line: 5141, column: 62, scope: !3788)
!3797 = !DILocalVariable(name: "u32Temp1", scope: !3788, file: !72, line: 5143, type: !736)
!3798 = !DILocation(line: 5143, column: 6, scope: !3788)
!3799 = !DILocalVariable(name: "u32Temp2", scope: !3788, file: !72, line: 5143, type: !736)
!3800 = !DILocation(line: 5143, column: 17, scope: !3788)
!3801 = !DILocalVariable(name: "u32Temp3", scope: !3788, file: !72, line: 5143, type: !736)
!3802 = !DILocation(line: 5143, column: 26, scope: !3788)
!3803 = !DILocalVariable(name: "u32Temp4", scope: !3788, file: !72, line: 5143, type: !736)
!3804 = !DILocation(line: 5143, column: 35, scope: !3788)
!3805 = !DILocalVariable(name: "u8SignBit", scope: !3788, file: !72, line: 5144, type: !17)
!3806 = !DILocation(line: 5144, column: 5, scope: !3788)
!3807 = !DILocation(line: 5146, column: 7, scope: !3808)
!3808 = distinct !DILexicalBlock(scope: !3788, file: !72, line: 5146, column: 5)
!3809 = !DILocation(line: 5146, column: 12, scope: !3808)
!3810 = !DILocation(line: 5146, column: 16, scope: !3808)
!3811 = !DILocation(line: 5146, column: 20, scope: !3808)
!3812 = !DILocation(line: 5146, column: 26, scope: !3808)
!3813 = !DILocation(line: 5146, column: 31, scope: !3808)
!3814 = !DILocation(line: 5146, column: 36, scope: !3808)
!3815 = !DILocation(line: 5146, column: 41, scope: !3808)
!3816 = !DILocation(line: 5146, column: 45, scope: !3808)
!3817 = !DILocation(line: 5146, column: 49, scope: !3808)
!3818 = !DILocation(line: 5146, column: 55, scope: !3808)
!3819 = !DILocation(line: 5146, column: 5, scope: !3788)
!3820 = !DILocation(line: 5148, column: 13, scope: !3821)
!3821 = distinct !DILexicalBlock(scope: !3808, file: !72, line: 5147, column: 2)
!3822 = !DILocation(line: 5149, column: 2, scope: !3821)
!3823 = !DILocation(line: 5152, column: 13, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3808, file: !72, line: 5151, column: 2)
!3825 = !DILocation(line: 5155, column: 5, scope: !3826)
!3826 = distinct !DILexicalBlock(scope: !3788, file: !72, line: 5155, column: 5)
!3827 = !DILocation(line: 5155, column: 10, scope: !3826)
!3828 = !DILocation(line: 5155, column: 5, scope: !3788)
!3829 = !DILocation(line: 5157, column: 15, scope: !3830)
!3830 = distinct !DILexicalBlock(scope: !3826, file: !72, line: 5156, column: 2)
!3831 = !DILocation(line: 5157, column: 14, scope: !3830)
!3832 = !DILocation(line: 5157, column: 12, scope: !3830)
!3833 = !DILocation(line: 5158, column: 2, scope: !3830)
!3834 = !DILocation(line: 5161, column: 14, scope: !3835)
!3835 = distinct !DILexicalBlock(scope: !3826, file: !72, line: 5160, column: 2)
!3836 = !DILocation(line: 5161, column: 12, scope: !3835)
!3837 = !DILocation(line: 5164, column: 5, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3788, file: !72, line: 5164, column: 5)
!3839 = !DILocation(line: 5164, column: 11, scope: !3838)
!3840 = !DILocation(line: 5164, column: 5, scope: !3788)
!3841 = !DILocation(line: 5166, column: 15, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3838, file: !72, line: 5165, column: 2)
!3843 = !DILocation(line: 5166, column: 14, scope: !3842)
!3844 = !DILocation(line: 5166, column: 12, scope: !3842)
!3845 = !DILocation(line: 5167, column: 2, scope: !3842)
!3846 = !DILocation(line: 5170, column: 14, scope: !3847)
!3847 = distinct !DILexicalBlock(scope: !3838, file: !72, line: 5169, column: 2)
!3848 = !DILocation(line: 5170, column: 12, scope: !3847)
!3849 = !DILocation(line: 5173, column: 13, scope: !3788)
!3850 = !DILocation(line: 5173, column: 24, scope: !3788)
!3851 = !DILocation(line: 5173, column: 22, scope: !3788)
!3852 = !DILocation(line: 5173, column: 11, scope: !3788)
!3853 = !DILocation(line: 5174, column: 25, scope: !3788)
!3854 = !DILocation(line: 5174, column: 35, scope: !3788)
!3855 = !DILocation(line: 5174, column: 13, scope: !3788)
!3856 = !DILocation(line: 5174, column: 11, scope: !3788)
!3857 = !DILocation(line: 5175, column: 13, scope: !3788)
!3858 = !DILocation(line: 5175, column: 25, scope: !3788)
!3859 = !DILocation(line: 5175, column: 22, scope: !3788)
!3860 = !DILocation(line: 5175, column: 11, scope: !3788)
!3861 = !DILocation(line: 5176, column: 14, scope: !3788)
!3862 = !DILocation(line: 5176, column: 30, scope: !3788)
!3863 = !DILocation(line: 5176, column: 29, scope: !3788)
!3864 = !DILocation(line: 5176, column: 23, scope: !3788)
!3865 = !DILocation(line: 5176, column: 11, scope: !3788)
!3866 = !DILocation(line: 5177, column: 6, scope: !3867)
!3867 = distinct !DILexicalBlock(scope: !3788, file: !72, line: 5177, column: 5)
!3868 = !DILocation(line: 5177, column: 16, scope: !3867)
!3869 = !DILocation(line: 5177, column: 14, scope: !3867)
!3870 = !DILocation(line: 5177, column: 22, scope: !3867)
!3871 = !DILocation(line: 5177, column: 5, scope: !3788)
!3872 = !DILocation(line: 5179, column: 6, scope: !3873)
!3873 = distinct !DILexicalBlock(scope: !3874, file: !72, line: 5179, column: 6)
!3874 = distinct !DILexicalBlock(scope: !3867, file: !72, line: 5178, column: 2)
!3875 = !DILocation(line: 5179, column: 16, scope: !3873)
!3876 = !DILocation(line: 5179, column: 6, scope: !3874)
!3877 = !DILocation(line: 5181, column: 7, scope: !3878)
!3878 = distinct !DILexicalBlock(scope: !3879, file: !72, line: 5181, column: 7)
!3879 = distinct !DILexicalBlock(scope: !3873, file: !72, line: 5180, column: 3)
!3880 = !DILocation(line: 5181, column: 15, scope: !3878)
!3881 = !DILocation(line: 5181, column: 7, scope: !3879)
!3882 = !DILocation(line: 5182, column: 12, scope: !3878)
!3883 = !DILocation(line: 5182, column: 5, scope: !3878)
!3884 = !DILocation(line: 5184, column: 5, scope: !3878)
!3885 = !DILocation(line: 5188, column: 7, scope: !3886)
!3886 = distinct !DILexicalBlock(scope: !3887, file: !72, line: 5188, column: 7)
!3887 = distinct !DILexicalBlock(scope: !3873, file: !72, line: 5187, column: 3)
!3888 = !DILocation(line: 5188, column: 15, scope: !3886)
!3889 = !DILocation(line: 5188, column: 7, scope: !3887)
!3890 = !DILocation(line: 5189, column: 13, scope: !3886)
!3891 = !DILocation(line: 5189, column: 12, scope: !3886)
!3892 = !DILocation(line: 5189, column: 5, scope: !3886)
!3893 = !DILocation(line: 5191, column: 5, scope: !3886)
!3894 = !DILocation(line: 5196, column: 3, scope: !3895)
!3895 = distinct !DILexicalBlock(scope: !3867, file: !72, line: 5195, column: 2)
!3896 = !DILocation(line: 5198, column: 1, scope: !3788)
!3897 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !72, file: !72, line: 3941, type: !2357, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3898 = !DILocalVariable(name: "value", arg: 1, scope: !3897, file: !72, line: 3941, type: !80)
!3899 = !DILocation(line: 3941, column: 30, scope: !3897)
!3900 = !DILocalVariable(name: "factor", arg: 2, scope: !3897, file: !72, line: 3941, type: !17)
!3901 = !DILocation(line: 3941, column: 40, scope: !3897)
!3902 = !DILocation(line: 3943, column: 40, scope: !3897)
!3903 = !DILocation(line: 3943, column: 46, scope: !3897)
!3904 = !DILocation(line: 3943, column: 10, scope: !3897)
!3905 = !DILocation(line: 3943, column: 3, scope: !3897)
!3906 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !72, file: !72, line: 5536, type: !3907, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3907 = !DISubroutineType(types: !3908)
!3908 = !{!80, !80, !17, !736}
!3909 = !DILocalVariable(name: "value", arg: 1, scope: !3906, file: !72, line: 5536, type: !80)
!3910 = !DILocation(line: 5536, column: 39, scope: !3906)
!3911 = !DILocalVariable(name: "factor", arg: 2, scope: !3906, file: !72, line: 5536, type: !17)
!3912 = !DILocation(line: 5536, column: 49, scope: !3906)
!3913 = !DILocalVariable(name: "count", arg: 3, scope: !3906, file: !72, line: 5536, type: !736)
!3914 = !DILocation(line: 5536, column: 61, scope: !3906)
!3915 = !DILocalVariable(name: "u32Temp1", scope: !3906, file: !72, line: 5538, type: !736)
!3916 = !DILocation(line: 5538, column: 6, scope: !3906)
!3917 = !DILocalVariable(name: "u32Temp2", scope: !3906, file: !72, line: 5538, type: !736)
!3918 = !DILocation(line: 5538, column: 17, scope: !3906)
!3919 = !DILocalVariable(name: "u32Temp3", scope: !3906, file: !72, line: 5538, type: !736)
!3920 = !DILocation(line: 5538, column: 26, scope: !3906)
!3921 = !DILocalVariable(name: "u8SignBit", scope: !3906, file: !72, line: 5539, type: !17)
!3922 = !DILocation(line: 5539, column: 5, scope: !3906)
!3923 = !DILocation(line: 5541, column: 5, scope: !3924)
!3924 = distinct !DILexicalBlock(scope: !3906, file: !72, line: 5541, column: 5)
!3925 = !DILocation(line: 5541, column: 10, scope: !3924)
!3926 = !DILocation(line: 5541, column: 5, scope: !3906)
!3927 = !DILocation(line: 5543, column: 13, scope: !3928)
!3928 = distinct !DILexicalBlock(scope: !3924, file: !72, line: 5542, column: 2)
!3929 = !DILocation(line: 5544, column: 15, scope: !3928)
!3930 = !DILocation(line: 5544, column: 14, scope: !3928)
!3931 = !DILocation(line: 5544, column: 12, scope: !3928)
!3932 = !DILocation(line: 5545, column: 2, scope: !3928)
!3933 = !DILocation(line: 5548, column: 13, scope: !3934)
!3934 = distinct !DILexicalBlock(scope: !3924, file: !72, line: 5547, column: 2)
!3935 = !DILocation(line: 5549, column: 14, scope: !3934)
!3936 = !DILocation(line: 5549, column: 12, scope: !3934)
!3937 = !DILocation(line: 5552, column: 13, scope: !3906)
!3938 = !DILocation(line: 5552, column: 24, scope: !3906)
!3939 = !DILocation(line: 5552, column: 22, scope: !3906)
!3940 = !DILocation(line: 5552, column: 11, scope: !3906)
!3941 = !DILocation(line: 5553, column: 25, scope: !3906)
!3942 = !DILocation(line: 5553, column: 34, scope: !3906)
!3943 = !DILocation(line: 5553, column: 13, scope: !3906)
!3944 = !DILocation(line: 5553, column: 11, scope: !3906)
!3945 = !DILocation(line: 5554, column: 13, scope: !3906)
!3946 = !DILocation(line: 5554, column: 25, scope: !3906)
!3947 = !DILocation(line: 5554, column: 22, scope: !3906)
!3948 = !DILocation(line: 5554, column: 11, scope: !3906)
!3949 = !DILocation(line: 5555, column: 14, scope: !3906)
!3950 = !DILocation(line: 5555, column: 30, scope: !3906)
!3951 = !DILocation(line: 5555, column: 29, scope: !3906)
!3952 = !DILocation(line: 5555, column: 23, scope: !3906)
!3953 = !DILocation(line: 5555, column: 11, scope: !3906)
!3954 = !DILocation(line: 5556, column: 6, scope: !3955)
!3955 = distinct !DILexicalBlock(scope: !3906, file: !72, line: 5556, column: 5)
!3956 = !DILocation(line: 5556, column: 16, scope: !3955)
!3957 = !DILocation(line: 5556, column: 14, scope: !3955)
!3958 = !DILocation(line: 5556, column: 22, scope: !3955)
!3959 = !DILocation(line: 5556, column: 5, scope: !3906)
!3960 = !DILocation(line: 5558, column: 6, scope: !3961)
!3961 = distinct !DILexicalBlock(scope: !3962, file: !72, line: 5558, column: 6)
!3962 = distinct !DILexicalBlock(scope: !3955, file: !72, line: 5557, column: 2)
!3963 = !DILocation(line: 5558, column: 16, scope: !3961)
!3964 = !DILocation(line: 5558, column: 6, scope: !3962)
!3965 = !DILocation(line: 5560, column: 7, scope: !3966)
!3966 = distinct !DILexicalBlock(scope: !3967, file: !72, line: 5560, column: 7)
!3967 = distinct !DILexicalBlock(scope: !3961, file: !72, line: 5559, column: 3)
!3968 = !DILocation(line: 5560, column: 15, scope: !3966)
!3969 = !DILocation(line: 5560, column: 7, scope: !3967)
!3970 = !DILocation(line: 5561, column: 12, scope: !3966)
!3971 = !DILocation(line: 5561, column: 5, scope: !3966)
!3972 = !DILocation(line: 5563, column: 5, scope: !3966)
!3973 = !DILocation(line: 5567, column: 7, scope: !3974)
!3974 = distinct !DILexicalBlock(scope: !3975, file: !72, line: 5567, column: 7)
!3975 = distinct !DILexicalBlock(scope: !3961, file: !72, line: 5566, column: 3)
!3976 = !DILocation(line: 5567, column: 15, scope: !3974)
!3977 = !DILocation(line: 5567, column: 7, scope: !3975)
!3978 = !DILocation(line: 5569, column: 13, scope: !3979)
!3979 = distinct !DILexicalBlock(scope: !3974, file: !72, line: 5568, column: 4)
!3980 = !DILocation(line: 5569, column: 12, scope: !3979)
!3981 = !DILocation(line: 5569, column: 5, scope: !3979)
!3982 = !DILocation(line: 5573, column: 5, scope: !3983)
!3983 = distinct !DILexicalBlock(scope: !3974, file: !72, line: 5572, column: 4)
!3984 = !DILocation(line: 5579, column: 6, scope: !3985)
!3985 = distinct !DILexicalBlock(scope: !3986, file: !72, line: 5579, column: 6)
!3986 = distinct !DILexicalBlock(scope: !3955, file: !72, line: 5578, column: 2)
!3987 = !DILocation(line: 5579, column: 16, scope: !3985)
!3988 = !DILocation(line: 5579, column: 6, scope: !3986)
!3989 = !DILocation(line: 5581, column: 4, scope: !3990)
!3990 = distinct !DILexicalBlock(scope: !3985, file: !72, line: 5580, column: 3)
!3991 = !DILocation(line: 5585, column: 4, scope: !3992)
!3992 = distinct !DILexicalBlock(scope: !3985, file: !72, line: 5584, column: 3)
!3993 = !DILocation(line: 5588, column: 1, scope: !3906)
!3994 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !72, file: !72, line: 3965, type: !159, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3995 = !DILocalVariable(name: "value", arg: 1, scope: !3994, file: !72, line: 3965, type: !6)
!3996 = !DILocation(line: 3965, column: 28, scope: !3994)
!3997 = !DILocalVariable(name: "factor", arg: 2, scope: !3994, file: !72, line: 3965, type: !17)
!3998 = !DILocation(line: 3965, column: 38, scope: !3994)
!3999 = !DILocation(line: 3967, column: 38, scope: !3994)
!4000 = !DILocation(line: 3967, column: 56, scope: !3994)
!4001 = !DILocation(line: 3967, column: 50, scope: !3994)
!4002 = !DILocation(line: 3967, column: 64, scope: !3994)
!4003 = !DILocation(line: 3967, column: 44, scope: !3994)
!4004 = !DILocation(line: 3967, column: 10, scope: !3994)
!4005 = !DILocation(line: 3967, column: 3, scope: !3994)
!4006 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !72, file: !72, line: 3989, type: !159, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4007 = !DILocalVariable(name: "value", arg: 1, scope: !4006, file: !72, line: 3989, type: !6)
!4008 = !DILocation(line: 3989, column: 27, scope: !4006)
!4009 = !DILocalVariable(name: "factor", arg: 2, scope: !4006, file: !72, line: 3989, type: !17)
!4010 = !DILocation(line: 3989, column: 37, scope: !4006)
!4011 = !DILocation(line: 3991, column: 38, scope: !4006)
!4012 = !DILocation(line: 3991, column: 56, scope: !4006)
!4013 = !DILocation(line: 3991, column: 50, scope: !4006)
!4014 = !DILocation(line: 3991, column: 64, scope: !4006)
!4015 = !DILocation(line: 3991, column: 44, scope: !4006)
!4016 = !DILocation(line: 3991, column: 10, scope: !4006)
!4017 = !DILocation(line: 3991, column: 3, scope: !4006)
!4018 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !72, file: !72, line: 4014, type: !159, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4019 = !DILocalVariable(name: "value", arg: 1, scope: !4018, file: !72, line: 4014, type: !6)
!4020 = !DILocation(line: 4014, column: 26, scope: !4018)
!4021 = !DILocalVariable(name: "factor", arg: 2, scope: !4018, file: !72, line: 4014, type: !17)
!4022 = !DILocation(line: 4014, column: 36, scope: !4018)
!4023 = !DILocation(line: 4016, column: 38, scope: !4018)
!4024 = !DILocation(line: 4016, column: 56, scope: !4018)
!4025 = !DILocation(line: 4016, column: 50, scope: !4018)
!4026 = !DILocation(line: 4016, column: 64, scope: !4018)
!4027 = !DILocation(line: 4016, column: 44, scope: !4018)
!4028 = !DILocation(line: 4016, column: 10, scope: !4018)
!4029 = !DILocation(line: 4016, column: 3, scope: !4018)
!4030 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !72, file: !72, line: 4039, type: !159, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4031 = !DILocalVariable(name: "value", arg: 1, scope: !4030, file: !72, line: 4039, type: !6)
!4032 = !DILocation(line: 4039, column: 27, scope: !4030)
!4033 = !DILocalVariable(name: "factor", arg: 2, scope: !4030, file: !72, line: 4039, type: !17)
!4034 = !DILocation(line: 4039, column: 37, scope: !4030)
!4035 = !DILocation(line: 4041, column: 41, scope: !4030)
!4036 = !DILocation(line: 4041, column: 59, scope: !4030)
!4037 = !DILocation(line: 4041, column: 53, scope: !4030)
!4038 = !DILocation(line: 4041, column: 67, scope: !4030)
!4039 = !DILocation(line: 4041, column: 47, scope: !4030)
!4040 = !DILocation(line: 4041, column: 10, scope: !4030)
!4041 = !DILocation(line: 4041, column: 3, scope: !4030)
!4042 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !72, file: !72, line: 4064, type: !159, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4043 = !DILocalVariable(name: "value", arg: 1, scope: !4042, file: !72, line: 4064, type: !6)
!4044 = !DILocation(line: 4064, column: 26, scope: !4042)
!4045 = !DILocalVariable(name: "factor", arg: 2, scope: !4042, file: !72, line: 4064, type: !17)
!4046 = !DILocation(line: 4064, column: 36, scope: !4042)
!4047 = !DILocation(line: 4066, column: 41, scope: !4042)
!4048 = !DILocation(line: 4066, column: 59, scope: !4042)
!4049 = !DILocation(line: 4066, column: 53, scope: !4042)
!4050 = !DILocation(line: 4066, column: 67, scope: !4042)
!4051 = !DILocation(line: 4066, column: 47, scope: !4042)
!4052 = !DILocation(line: 4066, column: 10, scope: !4042)
!4053 = !DILocation(line: 4066, column: 3, scope: !4042)
!4054 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !72, file: !72, line: 4088, type: !159, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4055 = !DILocalVariable(name: "value", arg: 1, scope: !4054, file: !72, line: 4088, type: !6)
!4056 = !DILocation(line: 4088, column: 26, scope: !4054)
!4057 = !DILocalVariable(name: "factor", arg: 2, scope: !4054, file: !72, line: 4088, type: !17)
!4058 = !DILocation(line: 4088, column: 36, scope: !4054)
!4059 = !DILocation(line: 4090, column: 41, scope: !4054)
!4060 = !DILocation(line: 4090, column: 59, scope: !4054)
!4061 = !DILocation(line: 4090, column: 53, scope: !4054)
!4062 = !DILocation(line: 4090, column: 67, scope: !4054)
!4063 = !DILocation(line: 4090, column: 47, scope: !4054)
!4064 = !DILocation(line: 4090, column: 10, scope: !4054)
!4065 = !DILocation(line: 4090, column: 3, scope: !4054)
!4066 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !72, file: !72, line: 4112, type: !159, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4067 = !DILocalVariable(name: "value", arg: 1, scope: !4066, file: !72, line: 4112, type: !6)
!4068 = !DILocation(line: 4112, column: 25, scope: !4066)
!4069 = !DILocalVariable(name: "factor", arg: 2, scope: !4066, file: !72, line: 4112, type: !17)
!4070 = !DILocation(line: 4112, column: 35, scope: !4066)
!4071 = !DILocation(line: 4114, column: 41, scope: !4066)
!4072 = !DILocation(line: 4114, column: 59, scope: !4066)
!4073 = !DILocation(line: 4114, column: 53, scope: !4066)
!4074 = !DILocation(line: 4114, column: 67, scope: !4066)
!4075 = !DILocation(line: 4114, column: 47, scope: !4066)
!4076 = !DILocation(line: 4114, column: 10, scope: !4066)
!4077 = !DILocation(line: 4114, column: 3, scope: !4066)
!4078 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !72, file: !72, line: 4136, type: !159, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4079 = !DILocalVariable(name: "value", arg: 1, scope: !4078, file: !72, line: 4136, type: !6)
!4080 = !DILocation(line: 4136, column: 26, scope: !4078)
!4081 = !DILocalVariable(name: "factor", arg: 2, scope: !4078, file: !72, line: 4136, type: !17)
!4082 = !DILocation(line: 4136, column: 36, scope: !4078)
!4083 = !DILocation(line: 4138, column: 41, scope: !4078)
!4084 = !DILocation(line: 4138, column: 59, scope: !4078)
!4085 = !DILocation(line: 4138, column: 53, scope: !4078)
!4086 = !DILocation(line: 4138, column: 67, scope: !4078)
!4087 = !DILocation(line: 4138, column: 47, scope: !4078)
!4088 = !DILocation(line: 4138, column: 10, scope: !4078)
!4089 = !DILocation(line: 4138, column: 3, scope: !4078)
!4090 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !72, file: !72, line: 4160, type: !159, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4091 = !DILocalVariable(name: "value", arg: 1, scope: !4090, file: !72, line: 4160, type: !6)
!4092 = !DILocation(line: 4160, column: 25, scope: !4090)
!4093 = !DILocalVariable(name: "factor", arg: 2, scope: !4090, file: !72, line: 4160, type: !17)
!4094 = !DILocation(line: 4160, column: 35, scope: !4090)
!4095 = !DILocation(line: 4162, column: 41, scope: !4090)
!4096 = !DILocation(line: 4162, column: 59, scope: !4090)
!4097 = !DILocation(line: 4162, column: 53, scope: !4090)
!4098 = !DILocation(line: 4162, column: 67, scope: !4090)
!4099 = !DILocation(line: 4162, column: 47, scope: !4090)
!4100 = !DILocation(line: 4162, column: 10, scope: !4090)
!4101 = !DILocation(line: 4162, column: 3, scope: !4090)
!4102 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !72, file: !72, line: 4183, type: !926, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4103 = !DILocalVariable(name: "value", arg: 1, scope: !4102, file: !72, line: 4183, type: !22)
!4104 = !DILocation(line: 4183, column: 33, scope: !4102)
!4105 = !DILocalVariable(name: "factor", arg: 2, scope: !4102, file: !72, line: 4183, type: !22)
!4106 = !DILocation(line: 4183, column: 44, scope: !4102)
!4107 = !DILocation(line: 4185, column: 41, scope: !4102)
!4108 = !DILocation(line: 4185, column: 47, scope: !4102)
!4109 = !DILocation(line: 4185, column: 10, scope: !4102)
!4110 = !DILocation(line: 4185, column: 3, scope: !4102)
!4111 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !72, file: !72, line: 4206, type: !926, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4112 = !DILocalVariable(name: "value", arg: 1, scope: !4111, file: !72, line: 4206, type: !22)
!4113 = !DILocation(line: 4206, column: 32, scope: !4111)
!4114 = !DILocalVariable(name: "factor", arg: 2, scope: !4111, file: !72, line: 4206, type: !22)
!4115 = !DILocation(line: 4206, column: 43, scope: !4111)
!4116 = !DILocation(line: 4208, column: 41, scope: !4111)
!4117 = !DILocation(line: 4208, column: 47, scope: !4111)
!4118 = !DILocation(line: 4208, column: 10, scope: !4111)
!4119 = !DILocation(line: 4208, column: 3, scope: !4111)
!4120 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !72, file: !72, line: 4230, type: !926, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4121 = !DILocalVariable(name: "value", arg: 1, scope: !4120, file: !72, line: 4230, type: !22)
!4122 = !DILocation(line: 4230, column: 31, scope: !4120)
!4123 = !DILocalVariable(name: "factor", arg: 2, scope: !4120, file: !72, line: 4230, type: !22)
!4124 = !DILocation(line: 4230, column: 42, scope: !4120)
!4125 = !DILocation(line: 4232, column: 41, scope: !4120)
!4126 = !DILocation(line: 4232, column: 47, scope: !4120)
!4127 = !DILocation(line: 4232, column: 10, scope: !4120)
!4128 = !DILocation(line: 4232, column: 3, scope: !4120)
!4129 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !72, file: !72, line: 4254, type: !926, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4130 = !DILocalVariable(name: "value", arg: 1, scope: !4129, file: !72, line: 4254, type: !22)
!4131 = !DILocation(line: 4254, column: 34, scope: !4129)
!4132 = !DILocalVariable(name: "factor", arg: 2, scope: !4129, file: !72, line: 4254, type: !22)
!4133 = !DILocation(line: 4254, column: 45, scope: !4129)
!4134 = !DILocation(line: 4256, column: 44, scope: !4129)
!4135 = !DILocation(line: 4256, column: 50, scope: !4129)
!4136 = !DILocation(line: 4256, column: 10, scope: !4129)
!4137 = !DILocation(line: 4256, column: 3, scope: !4129)
!4138 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !72, file: !72, line: 4278, type: !926, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4139 = !DILocalVariable(name: "value", arg: 1, scope: !4138, file: !72, line: 4278, type: !22)
!4140 = !DILocation(line: 4278, column: 32, scope: !4138)
!4141 = !DILocalVariable(name: "factor", arg: 2, scope: !4138, file: !72, line: 4278, type: !22)
!4142 = !DILocation(line: 4278, column: 43, scope: !4138)
!4143 = !DILocation(line: 4280, column: 44, scope: !4138)
!4144 = !DILocation(line: 4280, column: 50, scope: !4138)
!4145 = !DILocation(line: 4280, column: 10, scope: !4138)
!4146 = !DILocation(line: 4280, column: 3, scope: !4138)
!4147 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !72, file: !72, line: 4302, type: !926, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4148 = !DILocalVariable(name: "value", arg: 1, scope: !4147, file: !72, line: 4302, type: !22)
!4149 = !DILocation(line: 4302, column: 31, scope: !4147)
!4150 = !DILocalVariable(name: "factor", arg: 2, scope: !4147, file: !72, line: 4302, type: !22)
!4151 = !DILocation(line: 4302, column: 42, scope: !4147)
!4152 = !DILocation(line: 4304, column: 44, scope: !4147)
!4153 = !DILocation(line: 4304, column: 50, scope: !4147)
!4154 = !DILocation(line: 4304, column: 10, scope: !4147)
!4155 = !DILocation(line: 4304, column: 3, scope: !4147)
!4156 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !72, file: !72, line: 4326, type: !926, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4157 = !DILocalVariable(name: "value", arg: 1, scope: !4156, file: !72, line: 4326, type: !22)
!4158 = !DILocation(line: 4326, column: 33, scope: !4156)
!4159 = !DILocalVariable(name: "factor", arg: 2, scope: !4156, file: !72, line: 4326, type: !22)
!4160 = !DILocation(line: 4326, column: 44, scope: !4156)
!4161 = !DILocation(line: 4328, column: 44, scope: !4156)
!4162 = !DILocation(line: 4328, column: 50, scope: !4156)
!4163 = !DILocation(line: 4328, column: 10, scope: !4156)
!4164 = !DILocation(line: 4328, column: 3, scope: !4156)
!4165 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !72, file: !72, line: 4350, type: !926, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4166 = !DILocalVariable(name: "value", arg: 1, scope: !4165, file: !72, line: 4350, type: !22)
!4167 = !DILocation(line: 4350, column: 32, scope: !4165)
!4168 = !DILocalVariable(name: "factor", arg: 2, scope: !4165, file: !72, line: 4350, type: !22)
!4169 = !DILocation(line: 4350, column: 43, scope: !4165)
!4170 = !DILocation(line: 4352, column: 44, scope: !4165)
!4171 = !DILocation(line: 4352, column: 50, scope: !4165)
!4172 = !DILocation(line: 4352, column: 10, scope: !4165)
!4173 = !DILocation(line: 4352, column: 3, scope: !4165)
!4174 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !72, file: !72, line: 4373, type: !926, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4175 = !DILocalVariable(name: "value", arg: 1, scope: !4174, file: !72, line: 4373, type: !22)
!4176 = !DILocation(line: 4373, column: 31, scope: !4174)
!4177 = !DILocalVariable(name: "factor", arg: 2, scope: !4174, file: !72, line: 4373, type: !22)
!4178 = !DILocation(line: 4373, column: 42, scope: !4174)
!4179 = !DILocation(line: 4375, column: 44, scope: !4174)
!4180 = !DILocation(line: 4375, column: 50, scope: !4174)
!4181 = !DILocation(line: 4375, column: 10, scope: !4174)
!4182 = !DILocation(line: 4375, column: 3, scope: !4174)
!4183 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !72, file: !72, line: 4396, type: !926, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4184 = !DILocalVariable(name: "value", arg: 1, scope: !4183, file: !72, line: 4396, type: !22)
!4185 = !DILocation(line: 4396, column: 30, scope: !4183)
!4186 = !DILocalVariable(name: "factor", arg: 2, scope: !4183, file: !72, line: 4396, type: !22)
!4187 = !DILocation(line: 4396, column: 41, scope: !4183)
!4188 = !DILocation(line: 4398, column: 44, scope: !4183)
!4189 = !DILocation(line: 4398, column: 50, scope: !4183)
!4190 = !DILocation(line: 4398, column: 10, scope: !4183)
!4191 = !DILocation(line: 4398, column: 3, scope: !4183)
!4192 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !72, file: !72, line: 4419, type: !926, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4193 = !DILocalVariable(name: "value", arg: 1, scope: !4192, file: !72, line: 4419, type: !22)
!4194 = !DILocation(line: 4419, column: 33, scope: !4192)
!4195 = !DILocalVariable(name: "factor", arg: 2, scope: !4192, file: !72, line: 4419, type: !22)
!4196 = !DILocation(line: 4419, column: 44, scope: !4192)
!4197 = !DILocation(line: 4421, column: 44, scope: !4192)
!4198 = !DILocation(line: 4421, column: 50, scope: !4192)
!4199 = !DILocation(line: 4421, column: 10, scope: !4192)
!4200 = !DILocation(line: 4421, column: 3, scope: !4192)
!4201 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !72, file: !72, line: 4442, type: !926, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4202 = !DILocalVariable(name: "value", arg: 1, scope: !4201, file: !72, line: 4442, type: !22)
!4203 = !DILocation(line: 4442, column: 32, scope: !4201)
!4204 = !DILocalVariable(name: "factor", arg: 2, scope: !4201, file: !72, line: 4442, type: !22)
!4205 = !DILocation(line: 4442, column: 43, scope: !4201)
!4206 = !DILocation(line: 4444, column: 44, scope: !4201)
!4207 = !DILocation(line: 4444, column: 50, scope: !4201)
!4208 = !DILocation(line: 4444, column: 10, scope: !4201)
!4209 = !DILocation(line: 4444, column: 3, scope: !4201)
!4210 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !72, file: !72, line: 4465, type: !926, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4211 = !DILocalVariable(name: "value", arg: 1, scope: !4210, file: !72, line: 4465, type: !22)
!4212 = !DILocation(line: 4465, column: 31, scope: !4210)
!4213 = !DILocalVariable(name: "factor", arg: 2, scope: !4210, file: !72, line: 4465, type: !22)
!4214 = !DILocation(line: 4465, column: 42, scope: !4210)
!4215 = !DILocation(line: 4467, column: 44, scope: !4210)
!4216 = !DILocation(line: 4467, column: 50, scope: !4210)
!4217 = !DILocation(line: 4467, column: 10, scope: !4210)
!4218 = !DILocation(line: 4467, column: 3, scope: !4210)
!4219 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !72, file: !72, line: 4488, type: !926, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4220 = !DILocalVariable(name: "value", arg: 1, scope: !4219, file: !72, line: 4488, type: !22)
!4221 = !DILocation(line: 4488, column: 30, scope: !4219)
!4222 = !DILocalVariable(name: "factor", arg: 2, scope: !4219, file: !72, line: 4488, type: !22)
!4223 = !DILocation(line: 4488, column: 41, scope: !4219)
!4224 = !DILocation(line: 4490, column: 44, scope: !4219)
!4225 = !DILocation(line: 4490, column: 50, scope: !4219)
!4226 = !DILocation(line: 4490, column: 10, scope: !4219)
!4227 = !DILocation(line: 4490, column: 3, scope: !4219)
!4228 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !72, file: !72, line: 4510, type: !971, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4229 = !DILocalVariable(name: "x_value", arg: 1, scope: !4228, file: !72, line: 4510, type: !22)
!4230 = !DILocation(line: 4510, column: 32, scope: !4228)
!4231 = !DILocalVariable(name: "y_value", arg: 2, scope: !4228, file: !72, line: 4510, type: !17)
!4232 = !DILocation(line: 4510, column: 44, scope: !4228)
!4233 = !DILocation(line: 4512, column: 40, scope: !4228)
!4234 = !DILocation(line: 4512, column: 60, scope: !4228)
!4235 = !DILocation(line: 4512, column: 54, scope: !4228)
!4236 = !DILocation(line: 4512, column: 69, scope: !4228)
!4237 = !DILocation(line: 4512, column: 48, scope: !4228)
!4238 = !DILocation(line: 4512, column: 10, scope: !4228)
!4239 = !DILocation(line: 4512, column: 3, scope: !4228)
!4240 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !72, file: !72, line: 4532, type: !971, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4241 = !DILocalVariable(name: "x_value", arg: 1, scope: !4240, file: !72, line: 4532, type: !22)
!4242 = !DILocation(line: 4532, column: 31, scope: !4240)
!4243 = !DILocalVariable(name: "y_value", arg: 2, scope: !4240, file: !72, line: 4532, type: !17)
!4244 = !DILocation(line: 4532, column: 43, scope: !4240)
!4245 = !DILocation(line: 4534, column: 40, scope: !4240)
!4246 = !DILocation(line: 4534, column: 60, scope: !4240)
!4247 = !DILocation(line: 4534, column: 54, scope: !4240)
!4248 = !DILocation(line: 4534, column: 69, scope: !4240)
!4249 = !DILocation(line: 4534, column: 48, scope: !4240)
!4250 = !DILocation(line: 4534, column: 10, scope: !4240)
!4251 = !DILocation(line: 4534, column: 3, scope: !4240)
!4252 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !72, file: !72, line: 4555, type: !971, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4253 = !DILocalVariable(name: "x_value", arg: 1, scope: !4252, file: !72, line: 4555, type: !22)
!4254 = !DILocation(line: 4555, column: 30, scope: !4252)
!4255 = !DILocalVariable(name: "y_value", arg: 2, scope: !4252, file: !72, line: 4555, type: !17)
!4256 = !DILocation(line: 4555, column: 42, scope: !4252)
!4257 = !DILocation(line: 4557, column: 40, scope: !4252)
!4258 = !DILocation(line: 4557, column: 60, scope: !4252)
!4259 = !DILocation(line: 4557, column: 54, scope: !4252)
!4260 = !DILocation(line: 4557, column: 69, scope: !4252)
!4261 = !DILocation(line: 4557, column: 48, scope: !4252)
!4262 = !DILocation(line: 4557, column: 10, scope: !4252)
!4263 = !DILocation(line: 4557, column: 3, scope: !4252)
!4264 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !72, file: !72, line: 4578, type: !971, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4265 = !DILocalVariable(name: "x_value", arg: 1, scope: !4264, file: !72, line: 4578, type: !22)
!4266 = !DILocation(line: 4578, column: 31, scope: !4264)
!4267 = !DILocalVariable(name: "y_value", arg: 2, scope: !4264, file: !72, line: 4578, type: !17)
!4268 = !DILocation(line: 4578, column: 43, scope: !4264)
!4269 = !DILocation(line: 4580, column: 44, scope: !4264)
!4270 = !DILocation(line: 4580, column: 64, scope: !4264)
!4271 = !DILocation(line: 4580, column: 58, scope: !4264)
!4272 = !DILocation(line: 4580, column: 73, scope: !4264)
!4273 = !DILocation(line: 4580, column: 52, scope: !4264)
!4274 = !DILocation(line: 4580, column: 10, scope: !4264)
!4275 = !DILocation(line: 4580, column: 3, scope: !4264)
!4276 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !72, file: !72, line: 4601, type: !971, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4277 = !DILocalVariable(name: "x_value", arg: 1, scope: !4276, file: !72, line: 4601, type: !22)
!4278 = !DILocation(line: 4601, column: 30, scope: !4276)
!4279 = !DILocalVariable(name: "y_value", arg: 2, scope: !4276, file: !72, line: 4601, type: !17)
!4280 = !DILocation(line: 4601, column: 42, scope: !4276)
!4281 = !DILocation(line: 4603, column: 44, scope: !4276)
!4282 = !DILocation(line: 4603, column: 64, scope: !4276)
!4283 = !DILocation(line: 4603, column: 58, scope: !4276)
!4284 = !DILocation(line: 4603, column: 73, scope: !4276)
!4285 = !DILocation(line: 4603, column: 52, scope: !4276)
!4286 = !DILocation(line: 4603, column: 10, scope: !4276)
!4287 = !DILocation(line: 4603, column: 3, scope: !4276)
!4288 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !72, file: !72, line: 4623, type: !971, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4289 = !DILocalVariable(name: "x_value", arg: 1, scope: !4288, file: !72, line: 4623, type: !22)
!4290 = !DILocation(line: 4623, column: 30, scope: !4288)
!4291 = !DILocalVariable(name: "y_value", arg: 2, scope: !4288, file: !72, line: 4623, type: !17)
!4292 = !DILocation(line: 4623, column: 42, scope: !4288)
!4293 = !DILocation(line: 4625, column: 44, scope: !4288)
!4294 = !DILocation(line: 4625, column: 64, scope: !4288)
!4295 = !DILocation(line: 4625, column: 58, scope: !4288)
!4296 = !DILocation(line: 4625, column: 73, scope: !4288)
!4297 = !DILocation(line: 4625, column: 52, scope: !4288)
!4298 = !DILocation(line: 4625, column: 10, scope: !4288)
!4299 = !DILocation(line: 4625, column: 3, scope: !4288)
!4300 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !72, file: !72, line: 4645, type: !971, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4301 = !DILocalVariable(name: "x_value", arg: 1, scope: !4300, file: !72, line: 4645, type: !22)
!4302 = !DILocation(line: 4645, column: 29, scope: !4300)
!4303 = !DILocalVariable(name: "y_value", arg: 2, scope: !4300, file: !72, line: 4645, type: !17)
!4304 = !DILocation(line: 4645, column: 41, scope: !4300)
!4305 = !DILocation(line: 4647, column: 44, scope: !4300)
!4306 = !DILocation(line: 4647, column: 64, scope: !4300)
!4307 = !DILocation(line: 4647, column: 58, scope: !4300)
!4308 = !DILocation(line: 4647, column: 73, scope: !4300)
!4309 = !DILocation(line: 4647, column: 52, scope: !4300)
!4310 = !DILocation(line: 4647, column: 10, scope: !4300)
!4311 = !DILocation(line: 4647, column: 3, scope: !4300)
!4312 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !72, file: !72, line: 4667, type: !971, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4313 = !DILocalVariable(name: "x_value", arg: 1, scope: !4312, file: !72, line: 4667, type: !22)
!4314 = !DILocation(line: 4667, column: 30, scope: !4312)
!4315 = !DILocalVariable(name: "y_value", arg: 2, scope: !4312, file: !72, line: 4667, type: !17)
!4316 = !DILocation(line: 4667, column: 42, scope: !4312)
!4317 = !DILocation(line: 4669, column: 44, scope: !4312)
!4318 = !DILocation(line: 4669, column: 64, scope: !4312)
!4319 = !DILocation(line: 4669, column: 58, scope: !4312)
!4320 = !DILocation(line: 4669, column: 73, scope: !4312)
!4321 = !DILocation(line: 4669, column: 52, scope: !4312)
!4322 = !DILocation(line: 4669, column: 10, scope: !4312)
!4323 = !DILocation(line: 4669, column: 3, scope: !4312)
!4324 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !72, file: !72, line: 4689, type: !971, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4325 = !DILocalVariable(name: "x_value", arg: 1, scope: !4324, file: !72, line: 4689, type: !22)
!4326 = !DILocation(line: 4689, column: 29, scope: !4324)
!4327 = !DILocalVariable(name: "y_value", arg: 2, scope: !4324, file: !72, line: 4689, type: !17)
!4328 = !DILocation(line: 4689, column: 41, scope: !4324)
!4329 = !DILocation(line: 4691, column: 44, scope: !4324)
!4330 = !DILocation(line: 4691, column: 64, scope: !4324)
!4331 = !DILocation(line: 4691, column: 58, scope: !4324)
!4332 = !DILocation(line: 4691, column: 73, scope: !4324)
!4333 = !DILocation(line: 4691, column: 52, scope: !4324)
!4334 = !DILocation(line: 4691, column: 10, scope: !4324)
!4335 = !DILocation(line: 4691, column: 3, scope: !4324)
!4336 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !72, file: !72, line: 4713, type: !1500, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4337 = !DILocalVariable(name: "value", arg: 1, scope: !4336, file: !72, line: 4713, type: !736)
!4338 = !DILocation(line: 4713, column: 31, scope: !4336)
!4339 = !DILocalVariable(name: "factor", arg: 2, scope: !4336, file: !72, line: 4713, type: !13)
!4340 = !DILocation(line: 4713, column: 42, scope: !4336)
!4341 = !DILocation(line: 4715, column: 41, scope: !4336)
!4342 = !DILocation(line: 4715, column: 47, scope: !4336)
!4343 = !DILocation(line: 4715, column: 10, scope: !4336)
!4344 = !DILocation(line: 4715, column: 3, scope: !4336)
!4345 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !72, file: !72, line: 5293, type: !4346, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4346 = !DISubroutineType(types: !4347)
!4347 = !{!736, !736, !13, !736}
!4348 = !DILocalVariable(name: "value", arg: 1, scope: !4345, file: !72, line: 5293, type: !736)
!4349 = !DILocation(line: 5293, column: 40, scope: !4345)
!4350 = !DILocalVariable(name: "factor", arg: 2, scope: !4345, file: !72, line: 5293, type: !13)
!4351 = !DILocation(line: 5293, column: 50, scope: !4345)
!4352 = !DILocalVariable(name: "count", arg: 3, scope: !4345, file: !72, line: 5293, type: !736)
!4353 = !DILocation(line: 5293, column: 62, scope: !4345)
!4354 = !DILocalVariable(name: "u32Temp1", scope: !4345, file: !72, line: 5295, type: !736)
!4355 = !DILocation(line: 5295, column: 6, scope: !4345)
!4356 = !DILocalVariable(name: "u32Temp2", scope: !4345, file: !72, line: 5295, type: !736)
!4357 = !DILocation(line: 5295, column: 17, scope: !4345)
!4358 = !DILocalVariable(name: "u32Temp3", scope: !4345, file: !72, line: 5295, type: !736)
!4359 = !DILocation(line: 5295, column: 26, scope: !4345)
!4360 = !DILocalVariable(name: "u8SignBit", scope: !4345, file: !72, line: 5296, type: !17)
!4361 = !DILocation(line: 5296, column: 5, scope: !4345)
!4362 = !DILocation(line: 5298, column: 5, scope: !4363)
!4363 = distinct !DILexicalBlock(scope: !4345, file: !72, line: 5298, column: 5)
!4364 = !DILocation(line: 5298, column: 11, scope: !4363)
!4365 = !DILocation(line: 5298, column: 5, scope: !4345)
!4366 = !DILocation(line: 5300, column: 13, scope: !4367)
!4367 = distinct !DILexicalBlock(scope: !4363, file: !72, line: 5299, column: 2)
!4368 = !DILocation(line: 5301, column: 2, scope: !4367)
!4369 = !DILocation(line: 5304, column: 13, scope: !4370)
!4370 = distinct !DILexicalBlock(scope: !4363, file: !72, line: 5303, column: 2)
!4371 = !DILocation(line: 5308, column: 5, scope: !4372)
!4372 = distinct !DILexicalBlock(scope: !4345, file: !72, line: 5308, column: 5)
!4373 = !DILocation(line: 5308, column: 11, scope: !4372)
!4374 = !DILocation(line: 5308, column: 5, scope: !4345)
!4375 = !DILocation(line: 5310, column: 15, scope: !4376)
!4376 = distinct !DILexicalBlock(scope: !4372, file: !72, line: 5309, column: 2)
!4377 = !DILocation(line: 5310, column: 14, scope: !4376)
!4378 = !DILocation(line: 5310, column: 12, scope: !4376)
!4379 = !DILocation(line: 5311, column: 2, scope: !4376)
!4380 = !DILocation(line: 5314, column: 14, scope: !4381)
!4381 = distinct !DILexicalBlock(scope: !4372, file: !72, line: 5313, column: 2)
!4382 = !DILocation(line: 5314, column: 12, scope: !4381)
!4383 = !DILocation(line: 5317, column: 13, scope: !4345)
!4384 = !DILocation(line: 5317, column: 21, scope: !4345)
!4385 = !DILocation(line: 5317, column: 19, scope: !4345)
!4386 = !DILocation(line: 5317, column: 11, scope: !4345)
!4387 = !DILocation(line: 5318, column: 25, scope: !4345)
!4388 = !DILocation(line: 5318, column: 32, scope: !4345)
!4389 = !DILocation(line: 5318, column: 13, scope: !4345)
!4390 = !DILocation(line: 5318, column: 11, scope: !4345)
!4391 = !DILocation(line: 5319, column: 13, scope: !4345)
!4392 = !DILocation(line: 5319, column: 25, scope: !4345)
!4393 = !DILocation(line: 5319, column: 22, scope: !4345)
!4394 = !DILocation(line: 5319, column: 11, scope: !4345)
!4395 = !DILocation(line: 5320, column: 14, scope: !4345)
!4396 = !DILocation(line: 5320, column: 30, scope: !4345)
!4397 = !DILocation(line: 5320, column: 29, scope: !4345)
!4398 = !DILocation(line: 5320, column: 23, scope: !4345)
!4399 = !DILocation(line: 5320, column: 11, scope: !4345)
!4400 = !DILocation(line: 5321, column: 6, scope: !4401)
!4401 = distinct !DILexicalBlock(scope: !4345, file: !72, line: 5321, column: 5)
!4402 = !DILocation(line: 5321, column: 16, scope: !4401)
!4403 = !DILocation(line: 5321, column: 14, scope: !4401)
!4404 = !DILocation(line: 5321, column: 22, scope: !4401)
!4405 = !DILocation(line: 5321, column: 5, scope: !4345)
!4406 = !DILocation(line: 5323, column: 6, scope: !4407)
!4407 = distinct !DILexicalBlock(scope: !4408, file: !72, line: 5323, column: 6)
!4408 = distinct !DILexicalBlock(scope: !4401, file: !72, line: 5322, column: 2)
!4409 = !DILocation(line: 5323, column: 16, scope: !4407)
!4410 = !DILocation(line: 5323, column: 6, scope: !4408)
!4411 = !DILocation(line: 5325, column: 7, scope: !4412)
!4412 = distinct !DILexicalBlock(scope: !4413, file: !72, line: 5325, column: 7)
!4413 = distinct !DILexicalBlock(scope: !4407, file: !72, line: 5324, column: 3)
!4414 = !DILocation(line: 5325, column: 15, scope: !4412)
!4415 = !DILocation(line: 5325, column: 7, scope: !4413)
!4416 = !DILocation(line: 5326, column: 12, scope: !4412)
!4417 = !DILocation(line: 5326, column: 5, scope: !4412)
!4418 = !DILocation(line: 5328, column: 5, scope: !4412)
!4419 = !DILocation(line: 5332, column: 4, scope: !4420)
!4420 = distinct !DILexicalBlock(scope: !4407, file: !72, line: 5331, column: 3)
!4421 = !DILocation(line: 5337, column: 3, scope: !4422)
!4422 = distinct !DILexicalBlock(scope: !4401, file: !72, line: 5336, column: 2)
!4423 = !DILocation(line: 5339, column: 1, scope: !4345)
!4424 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !72, file: !72, line: 4737, type: !1318, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4425 = !DILocalVariable(name: "value", arg: 1, scope: !4424, file: !72, line: 4737, type: !736)
!4426 = !DILocation(line: 4737, column: 31, scope: !4424)
!4427 = !DILocalVariable(name: "factor", arg: 2, scope: !4424, file: !72, line: 4737, type: !80)
!4428 = !DILocation(line: 4737, column: 42, scope: !4424)
!4429 = !DILocation(line: 4739, column: 41, scope: !4424)
!4430 = !DILocation(line: 4739, column: 47, scope: !4424)
!4431 = !DILocation(line: 4739, column: 10, scope: !4424)
!4432 = !DILocation(line: 4739, column: 3, scope: !4424)
!4433 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !72, file: !72, line: 5357, type: !4434, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4434 = !DISubroutineType(types: !4435)
!4435 = !{!736, !736, !80, !736}
!4436 = !DILocalVariable(name: "value", arg: 1, scope: !4433, file: !72, line: 5357, type: !736)
!4437 = !DILocation(line: 5357, column: 40, scope: !4433)
!4438 = !DILocalVariable(name: "factor", arg: 2, scope: !4433, file: !72, line: 5357, type: !80)
!4439 = !DILocation(line: 5357, column: 51, scope: !4433)
!4440 = !DILocalVariable(name: "count", arg: 3, scope: !4433, file: !72, line: 5357, type: !736)
!4441 = !DILocation(line: 5357, column: 63, scope: !4433)
!4442 = !DILocalVariable(name: "u32Temp1", scope: !4433, file: !72, line: 5359, type: !736)
!4443 = !DILocation(line: 5359, column: 6, scope: !4433)
!4444 = !DILocalVariable(name: "u32Temp2", scope: !4433, file: !72, line: 5359, type: !736)
!4445 = !DILocation(line: 5359, column: 17, scope: !4433)
!4446 = !DILocalVariable(name: "u8SignBit", scope: !4433, file: !72, line: 5360, type: !17)
!4447 = !DILocation(line: 5360, column: 5, scope: !4433)
!4448 = !DILocation(line: 5362, column: 5, scope: !4449)
!4449 = distinct !DILexicalBlock(scope: !4433, file: !72, line: 5362, column: 5)
!4450 = !DILocation(line: 5362, column: 11, scope: !4449)
!4451 = !DILocation(line: 5362, column: 5, scope: !4433)
!4452 = !DILocation(line: 5364, column: 13, scope: !4453)
!4453 = distinct !DILexicalBlock(scope: !4449, file: !72, line: 5363, column: 2)
!4454 = !DILocation(line: 5365, column: 2, scope: !4453)
!4455 = !DILocation(line: 5368, column: 13, scope: !4456)
!4456 = distinct !DILexicalBlock(scope: !4449, file: !72, line: 5367, column: 2)
!4457 = !DILocation(line: 5372, column: 5, scope: !4458)
!4458 = distinct !DILexicalBlock(scope: !4433, file: !72, line: 5372, column: 5)
!4459 = !DILocation(line: 5372, column: 11, scope: !4458)
!4460 = !DILocation(line: 5372, column: 5, scope: !4433)
!4461 = !DILocation(line: 5374, column: 15, scope: !4462)
!4462 = distinct !DILexicalBlock(scope: !4458, file: !72, line: 5373, column: 2)
!4463 = !DILocation(line: 5374, column: 14, scope: !4462)
!4464 = !DILocation(line: 5374, column: 12, scope: !4462)
!4465 = !DILocation(line: 5375, column: 2, scope: !4462)
!4466 = !DILocation(line: 5378, column: 14, scope: !4467)
!4467 = distinct !DILexicalBlock(scope: !4458, file: !72, line: 5377, column: 2)
!4468 = !DILocation(line: 5378, column: 12, scope: !4467)
!4469 = !DILocation(line: 5381, column: 25, scope: !4433)
!4470 = !DILocation(line: 5381, column: 32, scope: !4433)
!4471 = !DILocation(line: 5381, column: 13, scope: !4433)
!4472 = !DILocation(line: 5381, column: 11, scope: !4433)
!4473 = !DILocation(line: 5382, column: 13, scope: !4433)
!4474 = !DILocation(line: 5382, column: 26, scope: !4433)
!4475 = !DILocation(line: 5382, column: 31, scope: !4433)
!4476 = !DILocation(line: 5382, column: 22, scope: !4433)
!4477 = !DILocation(line: 5382, column: 11, scope: !4433)
!4478 = !DILocation(line: 5383, column: 5, scope: !4479)
!4479 = distinct !DILexicalBlock(scope: !4433, file: !72, line: 5383, column: 5)
!4480 = !DILocation(line: 5383, column: 15, scope: !4479)
!4481 = !DILocation(line: 5383, column: 5, scope: !4433)
!4482 = !DILocation(line: 5385, column: 10, scope: !4483)
!4483 = distinct !DILexicalBlock(scope: !4479, file: !72, line: 5384, column: 2)
!4484 = !DILocation(line: 5385, column: 3, scope: !4483)
!4485 = !DILocation(line: 5389, column: 3, scope: !4486)
!4486 = distinct !DILexicalBlock(scope: !4479, file: !72, line: 5388, column: 2)
!4487 = !DILocation(line: 5391, column: 1, scope: !4433)
!4488 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !72, file: !72, line: 4761, type: !3108, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4489 = !DILocalVariable(name: "value", arg: 1, scope: !4488, file: !72, line: 4761, type: !736)
!4490 = !DILocation(line: 4761, column: 30, scope: !4488)
!4491 = !DILocalVariable(name: "factor", arg: 2, scope: !4488, file: !72, line: 4761, type: !6)
!4492 = !DILocation(line: 4761, column: 40, scope: !4488)
!4493 = !DILocation(line: 4763, column: 40, scope: !4488)
!4494 = !DILocation(line: 4763, column: 46, scope: !4488)
!4495 = !DILocation(line: 4763, column: 10, scope: !4488)
!4496 = !DILocation(line: 4763, column: 3, scope: !4488)
!4497 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !72, file: !72, line: 5435, type: !4498, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4498 = !DISubroutineType(types: !4499)
!4499 = !{!736, !736, !6, !736}
!4500 = !DILocalVariable(name: "value", arg: 1, scope: !4497, file: !72, line: 5435, type: !736)
!4501 = !DILocation(line: 5435, column: 39, scope: !4497)
!4502 = !DILocalVariable(name: "factor", arg: 2, scope: !4497, file: !72, line: 5435, type: !6)
!4503 = !DILocation(line: 5435, column: 49, scope: !4497)
!4504 = !DILocalVariable(name: "count", arg: 3, scope: !4497, file: !72, line: 5435, type: !736)
!4505 = !DILocation(line: 5435, column: 61, scope: !4497)
!4506 = !DILocalVariable(name: "u32Temp1", scope: !4497, file: !72, line: 5437, type: !736)
!4507 = !DILocation(line: 5437, column: 6, scope: !4497)
!4508 = !DILocalVariable(name: "u32Temp2", scope: !4497, file: !72, line: 5437, type: !736)
!4509 = !DILocation(line: 5437, column: 17, scope: !4497)
!4510 = !DILocalVariable(name: "u32Temp3", scope: !4497, file: !72, line: 5437, type: !736)
!4511 = !DILocation(line: 5437, column: 26, scope: !4497)
!4512 = !DILocalVariable(name: "u8SignBit", scope: !4497, file: !72, line: 5438, type: !17)
!4513 = !DILocation(line: 5438, column: 5, scope: !4497)
!4514 = !DILocation(line: 5440, column: 5, scope: !4515)
!4515 = distinct !DILexicalBlock(scope: !4497, file: !72, line: 5440, column: 5)
!4516 = !DILocation(line: 5440, column: 11, scope: !4515)
!4517 = !DILocation(line: 5440, column: 5, scope: !4497)
!4518 = !DILocation(line: 5442, column: 13, scope: !4519)
!4519 = distinct !DILexicalBlock(scope: !4515, file: !72, line: 5441, column: 2)
!4520 = !DILocation(line: 5443, column: 2, scope: !4519)
!4521 = !DILocation(line: 5446, column: 13, scope: !4522)
!4522 = distinct !DILexicalBlock(scope: !4515, file: !72, line: 5445, column: 2)
!4523 = !DILocation(line: 5450, column: 5, scope: !4524)
!4524 = distinct !DILexicalBlock(scope: !4497, file: !72, line: 5450, column: 5)
!4525 = !DILocation(line: 5450, column: 11, scope: !4524)
!4526 = !DILocation(line: 5450, column: 5, scope: !4497)
!4527 = !DILocation(line: 5452, column: 15, scope: !4528)
!4528 = distinct !DILexicalBlock(scope: !4524, file: !72, line: 5451, column: 2)
!4529 = !DILocation(line: 5452, column: 14, scope: !4528)
!4530 = !DILocation(line: 5452, column: 12, scope: !4528)
!4531 = !DILocation(line: 5453, column: 2, scope: !4528)
!4532 = !DILocation(line: 5456, column: 14, scope: !4533)
!4533 = distinct !DILexicalBlock(scope: !4524, file: !72, line: 5455, column: 2)
!4534 = !DILocation(line: 5456, column: 12, scope: !4533)
!4535 = !DILocation(line: 5459, column: 13, scope: !4497)
!4536 = !DILocation(line: 5459, column: 21, scope: !4497)
!4537 = !DILocation(line: 5459, column: 19, scope: !4497)
!4538 = !DILocation(line: 5459, column: 11, scope: !4497)
!4539 = !DILocation(line: 5460, column: 25, scope: !4497)
!4540 = !DILocation(line: 5460, column: 32, scope: !4497)
!4541 = !DILocation(line: 5460, column: 13, scope: !4497)
!4542 = !DILocation(line: 5460, column: 11, scope: !4497)
!4543 = !DILocation(line: 5461, column: 13, scope: !4497)
!4544 = !DILocation(line: 5461, column: 25, scope: !4497)
!4545 = !DILocation(line: 5461, column: 22, scope: !4497)
!4546 = !DILocation(line: 5461, column: 11, scope: !4497)
!4547 = !DILocation(line: 5462, column: 14, scope: !4497)
!4548 = !DILocation(line: 5462, column: 30, scope: !4497)
!4549 = !DILocation(line: 5462, column: 29, scope: !4497)
!4550 = !DILocation(line: 5462, column: 23, scope: !4497)
!4551 = !DILocation(line: 5462, column: 11, scope: !4497)
!4552 = !DILocation(line: 5463, column: 6, scope: !4553)
!4553 = distinct !DILexicalBlock(scope: !4497, file: !72, line: 5463, column: 5)
!4554 = !DILocation(line: 5463, column: 16, scope: !4553)
!4555 = !DILocation(line: 5463, column: 14, scope: !4553)
!4556 = !DILocation(line: 5463, column: 22, scope: !4553)
!4557 = !DILocation(line: 5463, column: 5, scope: !4497)
!4558 = !DILocation(line: 5465, column: 6, scope: !4559)
!4559 = distinct !DILexicalBlock(scope: !4560, file: !72, line: 5465, column: 6)
!4560 = distinct !DILexicalBlock(scope: !4553, file: !72, line: 5464, column: 2)
!4561 = !DILocation(line: 5465, column: 16, scope: !4559)
!4562 = !DILocation(line: 5465, column: 6, scope: !4560)
!4563 = !DILocation(line: 5467, column: 7, scope: !4564)
!4564 = distinct !DILexicalBlock(scope: !4565, file: !72, line: 5467, column: 7)
!4565 = distinct !DILexicalBlock(scope: !4559, file: !72, line: 5466, column: 3)
!4566 = !DILocation(line: 5467, column: 15, scope: !4564)
!4567 = !DILocation(line: 5467, column: 7, scope: !4565)
!4568 = !DILocation(line: 5468, column: 12, scope: !4564)
!4569 = !DILocation(line: 5468, column: 5, scope: !4564)
!4570 = !DILocation(line: 5470, column: 5, scope: !4564)
!4571 = !DILocation(line: 5474, column: 4, scope: !4572)
!4572 = distinct !DILexicalBlock(scope: !4559, file: !72, line: 5473, column: 3)
!4573 = !DILocation(line: 5479, column: 3, scope: !4574)
!4574 = distinct !DILexicalBlock(scope: !4553, file: !72, line: 5478, column: 2)
!4575 = !DILocation(line: 5481, column: 1, scope: !4497)
!4576 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !72, file: !72, line: 4785, type: !1114, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4577 = !DILocalVariable(name: "value", arg: 1, scope: !4576, file: !72, line: 4785, type: !736)
!4578 = !DILocation(line: 4785, column: 31, scope: !4576)
!4579 = !DILocalVariable(name: "factor", arg: 2, scope: !4576, file: !72, line: 4785, type: !22)
!4580 = !DILocation(line: 4785, column: 42, scope: !4576)
!4581 = !DILocation(line: 4787, column: 41, scope: !4576)
!4582 = !DILocation(line: 4787, column: 47, scope: !4576)
!4583 = !DILocation(line: 4787, column: 10, scope: !4576)
!4584 = !DILocation(line: 4787, column: 3, scope: !4576)
!4585 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !72, file: !72, line: 4809, type: !1409, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4586 = !DILocalVariable(name: "value", arg: 1, scope: !4585, file: !72, line: 4809, type: !736)
!4587 = !DILocation(line: 4809, column: 31, scope: !4585)
!4588 = !DILocalVariable(name: "factor", arg: 2, scope: !4585, file: !72, line: 4809, type: !736)
!4589 = !DILocation(line: 4809, column: 42, scope: !4585)
!4590 = !DILocation(line: 4811, column: 41, scope: !4585)
!4591 = !DILocation(line: 4811, column: 47, scope: !4585)
!4592 = !DILocation(line: 4811, column: 10, scope: !4585)
!4593 = !DILocation(line: 4811, column: 3, scope: !4585)
!4594 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !72, file: !72, line: 5408, type: !4595, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4595 = !DISubroutineType(types: !4596)
!4596 = !{!736, !736, !736, !736}
!4597 = !DILocalVariable(name: "value", arg: 1, scope: !4594, file: !72, line: 5408, type: !736)
!4598 = !DILocation(line: 5408, column: 40, scope: !4594)
!4599 = !DILocalVariable(name: "factor", arg: 2, scope: !4594, file: !72, line: 5408, type: !736)
!4600 = !DILocation(line: 5408, column: 50, scope: !4594)
!4601 = !DILocalVariable(name: "count", arg: 3, scope: !4594, file: !72, line: 5408, type: !736)
!4602 = !DILocation(line: 5408, column: 62, scope: !4594)
!4603 = !DILocalVariable(name: "u32Temp1", scope: !4594, file: !72, line: 5410, type: !736)
!4604 = !DILocation(line: 5410, column: 6, scope: !4594)
!4605 = !DILocalVariable(name: "u32Temp2", scope: !4594, file: !72, line: 5410, type: !736)
!4606 = !DILocation(line: 5410, column: 17, scope: !4594)
!4607 = !DILocalVariable(name: "u32Temp3", scope: !4594, file: !72, line: 5410, type: !736)
!4608 = !DILocation(line: 5410, column: 26, scope: !4594)
!4609 = !DILocalVariable(name: "u32Temp4", scope: !4594, file: !72, line: 5410, type: !736)
!4610 = !DILocation(line: 5410, column: 35, scope: !4594)
!4611 = !DILocalVariable(name: "u8SignBit", scope: !4594, file: !72, line: 5411, type: !17)
!4612 = !DILocation(line: 5411, column: 5, scope: !4594)
!4613 = !DILocation(line: 5413, column: 25, scope: !4594)
!4614 = !DILocation(line: 5413, column: 32, scope: !4594)
!4615 = !DILocation(line: 5413, column: 13, scope: !4594)
!4616 = !DILocation(line: 5413, column: 11, scope: !4594)
!4617 = !DILocation(line: 5414, column: 13, scope: !4594)
!4618 = !DILocation(line: 5414, column: 26, scope: !4594)
!4619 = !DILocation(line: 5414, column: 31, scope: !4594)
!4620 = !DILocation(line: 5414, column: 22, scope: !4594)
!4621 = !DILocation(line: 5414, column: 11, scope: !4594)
!4622 = !DILocation(line: 5415, column: 9, scope: !4594)
!4623 = !DILocation(line: 5415, column: 2, scope: !4594)
!4624 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !72, file: !72, line: 4833, type: !3047, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4625 = !DILocalVariable(name: "value", arg: 1, scope: !4624, file: !72, line: 4833, type: !736)
!4626 = !DILocation(line: 4833, column: 30, scope: !4624)
!4627 = !DILocalVariable(name: "factor", arg: 2, scope: !4624, file: !72, line: 4833, type: !17)
!4628 = !DILocation(line: 4833, column: 40, scope: !4624)
!4629 = !DILocation(line: 4835, column: 40, scope: !4624)
!4630 = !DILocation(line: 4835, column: 46, scope: !4624)
!4631 = !DILocation(line: 4835, column: 10, scope: !4624)
!4632 = !DILocation(line: 4835, column: 3, scope: !4624)
!4633 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !72, file: !72, line: 5499, type: !4634, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4634 = !DISubroutineType(types: !4635)
!4635 = !{!736, !736, !17, !736}
!4636 = !DILocalVariable(name: "value", arg: 1, scope: !4633, file: !72, line: 5499, type: !736)
!4637 = !DILocation(line: 5499, column: 39, scope: !4633)
!4638 = !DILocalVariable(name: "factor", arg: 2, scope: !4633, file: !72, line: 5499, type: !17)
!4639 = !DILocation(line: 5499, column: 49, scope: !4633)
!4640 = !DILocalVariable(name: "count", arg: 3, scope: !4633, file: !72, line: 5499, type: !736)
!4641 = !DILocation(line: 5499, column: 61, scope: !4633)
!4642 = !DILocalVariable(name: "u32Temp1", scope: !4633, file: !72, line: 5501, type: !736)
!4643 = !DILocation(line: 5501, column: 6, scope: !4633)
!4644 = !DILocalVariable(name: "u32Temp2", scope: !4633, file: !72, line: 5501, type: !736)
!4645 = !DILocation(line: 5501, column: 17, scope: !4633)
!4646 = !DILocation(line: 5503, column: 13, scope: !4633)
!4647 = !DILocation(line: 5503, column: 21, scope: !4633)
!4648 = !DILocation(line: 5503, column: 19, scope: !4633)
!4649 = !DILocation(line: 5503, column: 11, scope: !4633)
!4650 = !DILocation(line: 5504, column: 25, scope: !4633)
!4651 = !DILocation(line: 5504, column: 32, scope: !4633)
!4652 = !DILocation(line: 5504, column: 13, scope: !4633)
!4653 = !DILocation(line: 5504, column: 11, scope: !4633)
!4654 = !DILocation(line: 5505, column: 13, scope: !4633)
!4655 = !DILocation(line: 5505, column: 25, scope: !4633)
!4656 = !DILocation(line: 5505, column: 22, scope: !4633)
!4657 = !DILocation(line: 5505, column: 11, scope: !4633)
!4658 = !DILocation(line: 5506, column: 14, scope: !4633)
!4659 = !DILocation(line: 5506, column: 30, scope: !4633)
!4660 = !DILocation(line: 5506, column: 29, scope: !4633)
!4661 = !DILocation(line: 5506, column: 23, scope: !4633)
!4662 = !DILocation(line: 5506, column: 11, scope: !4633)
!4663 = !DILocation(line: 5507, column: 6, scope: !4664)
!4664 = distinct !DILexicalBlock(scope: !4633, file: !72, line: 5507, column: 5)
!4665 = !DILocation(line: 5507, column: 16, scope: !4664)
!4666 = !DILocation(line: 5507, column: 14, scope: !4664)
!4667 = !DILocation(line: 5507, column: 22, scope: !4664)
!4668 = !DILocation(line: 5507, column: 5, scope: !4633)
!4669 = !DILocation(line: 5509, column: 6, scope: !4670)
!4670 = distinct !DILexicalBlock(scope: !4671, file: !72, line: 5509, column: 6)
!4671 = distinct !DILexicalBlock(scope: !4664, file: !72, line: 5508, column: 2)
!4672 = !DILocation(line: 5509, column: 14, scope: !4670)
!4673 = !DILocation(line: 5509, column: 6, scope: !4671)
!4674 = !DILocation(line: 5510, column: 11, scope: !4670)
!4675 = !DILocation(line: 5510, column: 4, scope: !4670)
!4676 = !DILocation(line: 5512, column: 4, scope: !4670)
!4677 = !DILocation(line: 5516, column: 3, scope: !4678)
!4678 = distinct !DILexicalBlock(scope: !4664, file: !72, line: 5515, column: 2)
!4679 = !DILocation(line: 5518, column: 1, scope: !4633)
!4680 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !72, file: !72, line: 4856, type: !882, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4681 = !DILocalVariable(name: "value", arg: 1, scope: !4680, file: !72, line: 4856, type: !17)
!4682 = !DILocation(line: 4856, column: 28, scope: !4680)
!4683 = !DILocalVariable(name: "factor", arg: 2, scope: !4680, file: !72, line: 4856, type: !17)
!4684 = !DILocation(line: 4856, column: 38, scope: !4680)
!4685 = !DILocation(line: 4858, column: 38, scope: !4680)
!4686 = !DILocation(line: 4858, column: 44, scope: !4680)
!4687 = !DILocation(line: 4858, column: 10, scope: !4680)
!4688 = !DILocation(line: 4858, column: 3, scope: !4680)
!4689 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !72, file: !72, line: 4879, type: !882, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4690 = !DILocalVariable(name: "value", arg: 1, scope: !4689, file: !72, line: 4879, type: !17)
!4691 = !DILocation(line: 4879, column: 28, scope: !4689)
!4692 = !DILocalVariable(name: "factor", arg: 2, scope: !4689, file: !72, line: 4879, type: !17)
!4693 = !DILocation(line: 4879, column: 38, scope: !4689)
!4694 = !DILocation(line: 4881, column: 38, scope: !4689)
!4695 = !DILocation(line: 4881, column: 44, scope: !4689)
!4696 = !DILocation(line: 4881, column: 10, scope: !4689)
!4697 = !DILocation(line: 4881, column: 3, scope: !4689)
!4698 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !72, file: !72, line: 4903, type: !882, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4699 = !DILocalVariable(name: "value", arg: 1, scope: !4698, file: !72, line: 4903, type: !17)
!4700 = !DILocation(line: 4903, column: 26, scope: !4698)
!4701 = !DILocalVariable(name: "factor", arg: 2, scope: !4698, file: !72, line: 4903, type: !17)
!4702 = !DILocation(line: 4903, column: 36, scope: !4698)
!4703 = !DILocation(line: 4905, column: 38, scope: !4698)
!4704 = !DILocation(line: 4905, column: 44, scope: !4698)
!4705 = !DILocation(line: 4905, column: 10, scope: !4698)
!4706 = !DILocation(line: 4905, column: 3, scope: !4698)
!4707 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !72, file: !72, line: 4927, type: !882, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4708 = !DILocalVariable(name: "value", arg: 1, scope: !4707, file: !72, line: 4927, type: !17)
!4709 = !DILocation(line: 4927, column: 28, scope: !4707)
!4710 = !DILocalVariable(name: "factor", arg: 2, scope: !4707, file: !72, line: 4927, type: !17)
!4711 = !DILocation(line: 4927, column: 38, scope: !4707)
!4712 = !DILocation(line: 4929, column: 41, scope: !4707)
!4713 = !DILocation(line: 4929, column: 47, scope: !4707)
!4714 = !DILocation(line: 4929, column: 10, scope: !4707)
!4715 = !DILocation(line: 4929, column: 3, scope: !4707)
!4716 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !72, file: !72, line: 4951, type: !882, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4717 = !DILocalVariable(name: "value", arg: 1, scope: !4716, file: !72, line: 4951, type: !17)
!4718 = !DILocation(line: 4951, column: 26, scope: !4716)
!4719 = !DILocalVariable(name: "factor", arg: 2, scope: !4716, file: !72, line: 4951, type: !17)
!4720 = !DILocation(line: 4951, column: 36, scope: !4716)
!4721 = !DILocation(line: 4953, column: 41, scope: !4716)
!4722 = !DILocation(line: 4953, column: 47, scope: !4716)
!4723 = !DILocation(line: 4953, column: 10, scope: !4716)
!4724 = !DILocation(line: 4953, column: 3, scope: !4716)
!4725 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !72, file: !72, line: 4974, type: !882, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4726 = !DILocalVariable(name: "value", arg: 1, scope: !4725, file: !72, line: 4974, type: !17)
!4727 = !DILocation(line: 4974, column: 26, scope: !4725)
!4728 = !DILocalVariable(name: "factor", arg: 2, scope: !4725, file: !72, line: 4974, type: !17)
!4729 = !DILocation(line: 4974, column: 36, scope: !4725)
!4730 = !DILocation(line: 4976, column: 41, scope: !4725)
!4731 = !DILocation(line: 4976, column: 47, scope: !4725)
!4732 = !DILocation(line: 4976, column: 10, scope: !4725)
!4733 = !DILocation(line: 4976, column: 3, scope: !4725)
!4734 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !72, file: !72, line: 4997, type: !882, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4735 = !DILocalVariable(name: "value", arg: 1, scope: !4734, file: !72, line: 4997, type: !17)
!4736 = !DILocation(line: 4997, column: 25, scope: !4734)
!4737 = !DILocalVariable(name: "factor", arg: 2, scope: !4734, file: !72, line: 4997, type: !17)
!4738 = !DILocation(line: 4997, column: 35, scope: !4734)
!4739 = !DILocation(line: 4999, column: 41, scope: !4734)
!4740 = !DILocation(line: 4999, column: 47, scope: !4734)
!4741 = !DILocation(line: 4999, column: 10, scope: !4734)
!4742 = !DILocation(line: 4999, column: 3, scope: !4734)
!4743 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !72, file: !72, line: 5020, type: !882, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4744 = !DILocalVariable(name: "value", arg: 1, scope: !4743, file: !72, line: 5020, type: !17)
!4745 = !DILocation(line: 5020, column: 26, scope: !4743)
!4746 = !DILocalVariable(name: "factor", arg: 2, scope: !4743, file: !72, line: 5020, type: !17)
!4747 = !DILocation(line: 5020, column: 35, scope: !4743)
!4748 = !DILocation(line: 5022, column: 41, scope: !4743)
!4749 = !DILocation(line: 5022, column: 47, scope: !4743)
!4750 = !DILocation(line: 5022, column: 10, scope: !4743)
!4751 = !DILocation(line: 5022, column: 3, scope: !4743)
!4752 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !72, file: !72, line: 5043, type: !882, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4753 = !DILocalVariable(name: "value", arg: 1, scope: !4752, file: !72, line: 5043, type: !17)
!4754 = !DILocation(line: 5043, column: 25, scope: !4752)
!4755 = !DILocalVariable(name: "factor", arg: 2, scope: !4752, file: !72, line: 5043, type: !17)
!4756 = !DILocation(line: 5043, column: 35, scope: !4752)
!4757 = !DILocation(line: 5045, column: 41, scope: !4752)
!4758 = !DILocation(line: 5045, column: 47, scope: !4752)
!4759 = !DILocation(line: 5045, column: 10, scope: !4752)
!4760 = !DILocation(line: 5045, column: 3, scope: !4752)
!4761 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4762, file: !4762, line: 12, type: !4763, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !4766)
!4762 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4763 = !DISubroutineType(types: !4764)
!4764 = !{null, !4765}
!4765 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4766 = !{!4767}
!4767 = !DILocalVariable(name: "z", arg: 1, scope: !4761, file: !4762, line: 12, type: !4765)
!4768 = !DILocation(line: 0, scope: !4761)
!4769 = !DILocation(line: 13, column: 9, scope: !4770)
!4770 = distinct !DILexicalBlock(scope: !4761, file: !4762, line: 13, column: 7)
!4771 = !DILocation(line: 13, column: 7, scope: !4761)
!4772 = !DILocation(line: 14, column: 5, scope: !4770)
!4773 = !DILocation(line: 15, column: 1, scope: !4761)
!4774 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4775, file: !4775, line: 20, type: !4776, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !4779)
!4775 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4776 = !DISubroutineType(types: !4777)
!4777 = !{null, !4778, !4778}
!4778 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4779 = !{!4780, !4781}
!4780 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4774, file: !4775, line: 20, type: !4778)
!4781 = !DILocalVariable(name: "shift", arg: 2, scope: !4774, file: !4775, line: 20, type: !4778)
!4782 = !DILocation(line: 0, scope: !4774)
!4783 = !DILocation(line: 21, column: 13, scope: !4784)
!4784 = distinct !DILexicalBlock(scope: !4774, file: !4775, line: 21, column: 7)
!4785 = !DILocation(line: 21, column: 7, scope: !4774)
!4786 = !DILocation(line: 27, column: 5, scope: !4787)
!4787 = distinct !DILexicalBlock(scope: !4784, file: !4775, line: 21, column: 26)
!4788 = !DILocation(line: 29, column: 1, scope: !4774)
