; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/build/s32_mul_s32_s32_alarm_0108.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"val1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"val2\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [62 x i8] c"KLEE-ALARM-0108: signed overflow. assert -val1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0108.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.9 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.10 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.11 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %val1 = alloca i32, align 4
  %val2 = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %val1, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %val2, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %result, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = bitcast i32* %val1 to i8*, !dbg !61
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %1 = bitcast i32* %val2 to i8*, !dbg !63
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  %2 = load i32, i32* %val1, align 4, !dbg !65
  %3 = load i32, i32* %val2, align 4, !dbg !66
  %call = call i32 @s32_mul_s32_s32(i32 %2, i32 %3), !dbg !67
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
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !735, metadata !DIExpression()), !dbg !740
  store i32 0, i32* %u32MulTemp, align 4, !dbg !740
  %0 = load i16, i16* %value.addr, align 2, !dbg !741
  %conv = zext i16 %0 to i32, !dbg !741
  %1 = load i16, i16* %factor.addr, align 2, !dbg !742
  %conv1 = zext i16 %1 to i32, !dbg !742
  %mul = mul nsw i32 %conv, %conv1, !dbg !743
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !744
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !745
  %shr = lshr i32 %2, 8, !dbg !746
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !747
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !748
  %cmp = icmp ult i32 %3, 32767, !dbg !750
  br i1 %cmp, label %if.then, label %if.else, !dbg !751

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !752
  %conv3 = trunc i32 %4 to i16, !dbg !754
  store i16 %conv3, i16* %retval, align 2, !dbg !755
  br label %return, !dbg !755

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !756
  br label %return, !dbg !756

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !758
  ret i16 %5, !dbg !758
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !759 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !762, metadata !DIExpression()), !dbg !763
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !764, metadata !DIExpression()), !dbg !765
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !766, metadata !DIExpression()), !dbg !767
  store i32 0, i32* %s32MulTemp, align 4, !dbg !767
  %0 = load i16, i16* %value.addr, align 2, !dbg !768
  %conv = sext i16 %0 to i32, !dbg !768
  %1 = load i16, i16* %factor.addr, align 2, !dbg !769
  %conv1 = zext i16 %1 to i32, !dbg !769
  %mul = mul nsw i32 %conv, %conv1, !dbg !770
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !771
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !772
  ret i32 %2, !dbg !773
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !774 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !777, metadata !DIExpression()), !dbg !778
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !779, metadata !DIExpression()), !dbg !780
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !781, metadata !DIExpression()), !dbg !782
  store i32 0, i32* %s32Temp1, align 4, !dbg !782
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !783, metadata !DIExpression()), !dbg !784
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !784
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !785, metadata !DIExpression()), !dbg !786
  store i32 0, i32* %s32Factor, align 4, !dbg !786
  %0 = load i16, i16* %factor.addr, align 2, !dbg !787
  %conv = zext i16 %0 to i32, !dbg !787
  store i32 %conv, i32* %s32Factor, align 4, !dbg !788
  %1 = load i16, i16* %factor.addr, align 2, !dbg !789
  %conv1 = zext i16 %1 to i32, !dbg !789
  %cmp = icmp ne i32 %conv1, 0, !dbg !791
  br i1 %cmp, label %if.then, label %if.else19, !dbg !792

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !793
  %cmp3 = icmp slt i32 %2, 0, !dbg !796
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !797

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !798
  %4 = load i32, i32* %s32Factor, align 4, !dbg !800
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !801
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !801
  %div = sdiv i32 %3, %4, !dbg !801, !klee.check.div !261
  store i32 %div, i32* %s32Temp1, align 4, !dbg !802
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !803
  %6 = load i32, i32* %value.addr, align 4, !dbg !805
  %cmp6 = icmp sge i32 %5, %6, !dbg !806
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !807

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !808
  br label %return, !dbg !808

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !810
  %8 = load i16, i16* %factor.addr, align 2, !dbg !812
  %conv9 = zext i16 %8 to i32, !dbg !812
  %mul = mul nsw i32 %7, %conv9, !dbg !813
  store i32 %mul, i32* %retval, align 4, !dbg !814
  br label %return, !dbg !814

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !815
  %conv11 = zext i16 %9 to i32, !dbg !815
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !818
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !818
  %div12 = udiv i32 2147483647, %conv11, !dbg !818, !klee.check.div !261
  %10 = load i32, i32* %value.addr, align 4, !dbg !819
  %cmp13 = icmp ule i32 %div12, %10, !dbg !820
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !821

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !822
  br label %return, !dbg !822

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !824
  %12 = load i16, i16* %factor.addr, align 2, !dbg !826
  %conv17 = zext i16 %12 to i32, !dbg !826
  %mul18 = mul nsw i32 %11, %conv17, !dbg !827
  store i32 %mul18, i32* %retval, align 4, !dbg !828
  br label %return, !dbg !828

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !829
  br label %return, !dbg !829

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !831
  ret i32 %13, !dbg !831
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !832 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !835, metadata !DIExpression()), !dbg !836
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !837, metadata !DIExpression()), !dbg !838
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !839, metadata !DIExpression()), !dbg !840
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !841, metadata !DIExpression()), !dbg !842
  store i16 0, i16* %u16MulTemp, align 2, !dbg !842
  %0 = load i8, i8* %value.addr, align 1, !dbg !843
  %conv = zext i8 %0 to i32, !dbg !843
  %1 = load i8, i8* %factor.addr, align 1, !dbg !844
  %conv1 = zext i8 %1 to i32, !dbg !844
  %mul = mul nsw i32 %conv, %conv1, !dbg !845
  %conv2 = trunc i32 %mul to i16, !dbg !843
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !846
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !847
  %conv3 = zext i16 %2 to i32, !dbg !847
  %3 = load i16, i16* %count.addr, align 2, !dbg !848
  %conv4 = zext i16 %3 to i32, !dbg !848
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !849
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !849
  %div = sdiv i32 %conv3, %conv4, !dbg !849, !klee.check.div !261
  %conv5 = trunc i32 %div to i16, !dbg !847
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !850
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !851
  %conv6 = trunc i16 %4 to i8, !dbg !852
  ret i8 %conv6, !dbg !853
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !854 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !859, metadata !DIExpression()), !dbg !860
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !861, metadata !DIExpression()), !dbg !862
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !863, metadata !DIExpression()), !dbg !864
  store i16 0, i16* %u16MulTemp, align 2, !dbg !864
  %0 = load i8, i8* %value.addr, align 1, !dbg !865
  %conv = zext i8 %0 to i32, !dbg !865
  %1 = load i8, i8* %factor.addr, align 1, !dbg !866
  %conv1 = zext i8 %1 to i32, !dbg !866
  %mul = mul nsw i32 %conv, %conv1, !dbg !867
  %conv2 = trunc i32 %mul to i16, !dbg !865
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !868
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !869
  %conv3 = zext i16 %2 to i32, !dbg !869
  %3 = load i8, i8* %count.addr, align 1, !dbg !870
  %conv4 = zext i8 %3 to i32, !dbg !870
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !871
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !871
  %div = sdiv i32 %conv3, %conv4, !dbg !871, !klee.check.div !261
  %conv5 = trunc i32 %div to i16, !dbg !869
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !872
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !873
  %conv6 = zext i16 %4 to i32, !dbg !873
  %cmp = icmp sle i32 %conv6, 255, !dbg !875
  br i1 %cmp, label %if.then, label %if.else, !dbg !876

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !877
  %conv8 = zext i16 %5 to i32, !dbg !877
  %and = and i32 %conv8, 255, !dbg !879
  %conv9 = trunc i32 %and to i8, !dbg !877
  store i8 %conv9, i8* %retval, align 1, !dbg !880
  br label %return, !dbg !880

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !881
  br label %return, !dbg !881

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !883
  ret i8 %6, !dbg !883
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !884 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !887, metadata !DIExpression()), !dbg !888
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !889, metadata !DIExpression()), !dbg !890
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !891, metadata !DIExpression()), !dbg !892
  store i16 0, i16* %u16MulTemp, align 2, !dbg !892
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !893
  %conv = zext i8 %0 to i32, !dbg !893
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !894
  %conv1 = zext i8 %1 to i32, !dbg !894
  %mul = mul nsw i32 %conv, %conv1, !dbg !895
  %conv2 = trunc i32 %mul to i16, !dbg !893
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !896
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !897
  %conv3 = zext i16 %2 to i32, !dbg !897
  %shr = ashr i32 %conv3, 8, !dbg !898
  %conv4 = trunc i32 %shr to i16, !dbg !897
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !899
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !900
  %conv5 = trunc i16 %3 to i8, !dbg !901
  ret i8 %conv5, !dbg !902
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !903 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !904, metadata !DIExpression()), !dbg !905
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !906, metadata !DIExpression()), !dbg !907
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !908, metadata !DIExpression()), !dbg !909
  store i16 0, i16* %u16MulTemp, align 2, !dbg !909
  %0 = load i8, i8* %value.addr, align 1, !dbg !910
  %conv = zext i8 %0 to i32, !dbg !910
  %1 = load i8, i8* %factor.addr, align 1, !dbg !911
  %conv1 = zext i8 %1 to i32, !dbg !911
  %mul = mul nsw i32 %conv, %conv1, !dbg !912
  %conv2 = trunc i32 %mul to i16, !dbg !910
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !913
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !914
  %conv3 = zext i16 %2 to i32, !dbg !914
  %shr = ashr i32 %conv3, 7, !dbg !915
  %conv4 = trunc i32 %shr to i16, !dbg !914
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !916
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !917
  %conv5 = zext i16 %3 to i32, !dbg !917
  %cmp = icmp slt i32 %conv5, 255, !dbg !919
  br i1 %cmp, label %if.then, label %if.else, !dbg !920

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !921
  %conv7 = trunc i16 %4 to i8, !dbg !923
  store i8 %conv7, i8* %retval, align 1, !dbg !924
  br label %return, !dbg !924

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !925
  br label %return, !dbg !925

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !927
  ret i8 %5, !dbg !927
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !928 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !931, metadata !DIExpression()), !dbg !932
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !933, metadata !DIExpression()), !dbg !934
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !935, metadata !DIExpression()), !dbg !936
  store i32 0, i32* %u32MulTemp, align 4, !dbg !936
  %0 = load i16, i16* %value.addr, align 2, !dbg !937
  %conv = zext i16 %0 to i32, !dbg !937
  %1 = load i16, i16* %factor.addr, align 2, !dbg !938
  %conv1 = zext i16 %1 to i32, !dbg !938
  %mul = mul nsw i32 %conv, %conv1, !dbg !939
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !940
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !941
  %shr = lshr i32 %2, 16, !dbg !942
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !943
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !944
  %conv2 = trunc i32 %3 to i16, !dbg !945
  ret i16 %conv2, !dbg !946
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !947 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !948, metadata !DIExpression()), !dbg !949
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !950, metadata !DIExpression()), !dbg !951
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !952, metadata !DIExpression()), !dbg !953
  store i32 0, i32* %u32MulTemp, align 4, !dbg !953
  %0 = load i16, i16* %value.addr, align 2, !dbg !954
  %conv = zext i16 %0 to i32, !dbg !954
  %1 = load i16, i16* %factor.addr, align 2, !dbg !955
  %conv1 = zext i16 %1 to i32, !dbg !955
  %mul = mul nsw i32 %conv, %conv1, !dbg !956
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !957
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !958
  %shr = lshr i32 %2, 8, !dbg !959
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !960
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !961
  %cmp = icmp ult i32 %3, 65535, !dbg !963
  br i1 %cmp, label %if.then, label %if.else, !dbg !964

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !965
  %and = and i32 %4, 65535, !dbg !967
  %conv3 = trunc i32 %and to i16, !dbg !968
  store i16 %conv3, i16* %retval, align 2, !dbg !969
  br label %return, !dbg !969

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !970
  br label %return, !dbg !970

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !972
  ret i16 %5, !dbg !972
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !973 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !976, metadata !DIExpression()), !dbg !977
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !978, metadata !DIExpression()), !dbg !979
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !980, metadata !DIExpression()), !dbg !981
  store i32 0, i32* %u32MulTemp, align 4, !dbg !981
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !982
  %conv = zext i16 %0 to i32, !dbg !982
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !983
  %conv1 = zext i8 %1 to i32, !dbg !983
  %mul = mul nsw i32 %conv, %conv1, !dbg !984
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !985
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !986
  %shr = lshr i32 %2, 8, !dbg !987
  %and = and i32 %shr, 65535, !dbg !988
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !989
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !990
  %conv2 = trunc i32 %3 to i16, !dbg !990
  ret i16 %conv2, !dbg !991
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !992 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !993, metadata !DIExpression()), !dbg !994
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !995, metadata !DIExpression()), !dbg !996
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !997, metadata !DIExpression()), !dbg !998
  store i32 0, i32* %u32MulTemp, align 4, !dbg !998
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !999
  %conv = zext i16 %0 to i32, !dbg !999
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1000
  %conv1 = zext i8 %1 to i32, !dbg !1000
  %mul = mul nsw i32 %conv, %conv1, !dbg !1001
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1002
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1003
  %shr = lshr i32 %2, 7, !dbg !1004
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1005
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1006
  %cmp = icmp ult i32 %3, 65535, !dbg !1008
  br i1 %cmp, label %if.then, label %if.else, !dbg !1009

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1010
  %and = and i32 %4, 65535, !dbg !1012
  %conv3 = trunc i32 %and to i16, !dbg !1013
  store i16 %conv3, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1015
  br label %return, !dbg !1015

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1017
  ret i16 %5, !dbg !1017
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1018 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1025, metadata !DIExpression()), !dbg !1026
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1027, metadata !DIExpression()), !dbg !1028
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1028
  %0 = load i16, i16* %value.addr, align 2, !dbg !1029
  %conv = zext i16 %0 to i32, !dbg !1029
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1030
  %conv1 = zext i16 %1 to i32, !dbg !1030
  %mul = mul nsw i32 %conv, %conv1, !dbg !1031
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1032
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1033
  %3 = load i32, i32* %count.addr, align 4, !dbg !1034
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1035
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1035
  %div = udiv i32 %2, %3, !dbg !1035, !klee.check.div !261
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1036
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1037
  %and = and i32 %4, 65535, !dbg !1038
  %conv2 = trunc i32 %and to i16, !dbg !1039
  ret i16 %conv2, !dbg !1040
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1041 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1048, metadata !DIExpression()), !dbg !1049
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1050, metadata !DIExpression()), !dbg !1051
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1051
  %0 = load i16, i16* %value.addr, align 2, !dbg !1052
  %conv = zext i16 %0 to i32, !dbg !1052
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1053
  %conv1 = zext i16 %1 to i32, !dbg !1053
  %mul = mul nsw i32 %conv, %conv1, !dbg !1054
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1055
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1056
  %3 = load i16, i16* %count.addr, align 2, !dbg !1057
  %conv2 = zext i16 %3 to i32, !dbg !1057
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1058
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1058
  %div = udiv i32 %2, %conv2, !dbg !1058, !klee.check.div !261
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1059
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1060
  %cmp = icmp ule i32 %4, 65535, !dbg !1062
  br i1 %cmp, label %if.then, label %if.else, !dbg !1063

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1064
  %and = and i32 %5, 65535, !dbg !1066
  %conv4 = trunc i32 %and to i16, !dbg !1067
  store i16 %conv4, i16* %retval, align 2, !dbg !1068
  br label %return, !dbg !1068

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1069
  br label %return, !dbg !1069

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1071
  ret i16 %6, !dbg !1071
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1072 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1077, metadata !DIExpression()), !dbg !1078
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1078
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1079
  %conv = zext i16 %0 to i32, !dbg !1079
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1080
  %conv1 = zext i16 %1 to i32, !dbg !1080
  %mul = mul nsw i32 %conv, %conv1, !dbg !1081
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1082
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1083
  %shr = lshr i32 %2, 16, !dbg !1084
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1085
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1086
  %and = and i32 65535, %3, !dbg !1087
  %conv2 = trunc i32 %and to i16, !dbg !1088
  ret i16 %conv2, !dbg !1089
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1090 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1091, metadata !DIExpression()), !dbg !1092
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1093, metadata !DIExpression()), !dbg !1094
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1095, metadata !DIExpression()), !dbg !1096
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1096
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1097
  %conv = zext i16 %0 to i32, !dbg !1097
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1098
  %conv1 = zext i16 %1 to i32, !dbg !1098
  %mul = mul nsw i32 %conv, %conv1, !dbg !1099
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1100
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1101
  %shr = lshr i32 %2, 15, !dbg !1102
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1103
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1104
  %cmp = icmp ule i32 %3, 65535, !dbg !1106
  br i1 %cmp, label %if.then, label %if.else, !dbg !1107

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1108
  %and = and i32 %4, 65535, !dbg !1110
  %conv3 = trunc i32 %and to i16, !dbg !1111
  store i16 %conv3, i16* %retval, align 2, !dbg !1112
  br label %return, !dbg !1112

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1113
  br label %return, !dbg !1113

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1115
  ret i16 %5, !dbg !1115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1116 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1119, metadata !DIExpression()), !dbg !1120
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1121, metadata !DIExpression()), !dbg !1122
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1123, metadata !DIExpression()), !dbg !1124
  store i32 0, i32* %u32Temp1, align 4, !dbg !1124
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1125
  %conv = zext i16 %0 to i32, !dbg !1125
  %cmp = icmp sgt i32 %conv, 0, !dbg !1127
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1128

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1129
  %conv2 = zext i16 %1 to i32, !dbg !1129
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1131
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1131
  %div = udiv i32 -1, %conv2, !dbg !1131, !klee.check.div !261
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1132
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1133
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1135
  %cmp3 = icmp ult i32 %2, %3, !dbg !1136
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1137

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1138
  br label %return, !dbg !1138

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1140
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1142
  %conv6 = zext i16 %5 to i32, !dbg !1142
  %mul = mul i32 %4, %conv6, !dbg !1143
  store i32 %mul, i32* %retval, align 4, !dbg !1144
  br label %return, !dbg !1144

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1145
  br label %return, !dbg !1145

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1147
  ret i32 %6, !dbg !1147
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1148 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1151, metadata !DIExpression()), !dbg !1152
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1153, metadata !DIExpression()), !dbg !1154
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1155, metadata !DIExpression()), !dbg !1156
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1157, metadata !DIExpression()), !dbg !1158
  store i32 0, i32* %u32Temp1, align 4, !dbg !1158
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1159, metadata !DIExpression()), !dbg !1160
  store i32 0, i32* %u32Temp2, align 4, !dbg !1160
  %0 = load i32, i32* %value.addr, align 4, !dbg !1161
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1162
  %conv = zext i16 %1 to i32, !dbg !1162
  %mul = mul i32 %0, %conv, !dbg !1163
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1164
  %2 = load i32, i32* %value.addr, align 4, !dbg !1165
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1166
  %conv1 = zext i16 %3 to i32, !dbg !1166
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1167
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1168
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1169
  %5 = load i32, i32* %count.addr, align 4, !dbg !1170
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1171
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1171
  %shr = lshr i32 %4, %5, !dbg !1171, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1172
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1173
  %7 = load i32, i32* %count.addr, align 4, !dbg !1174
  %sub = sub i32 32, %7, !dbg !1175
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1176
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1176
  %shl = shl i32 %6, %sub, !dbg !1176, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1177
  %or = or i32 %8, %shl, !dbg !1177
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1177
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1178
  %10 = load i32, i32* %count.addr, align 4, !dbg !1180
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1181
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1181
  %shr2 = lshr i32 %9, %10, !dbg !1181, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !1182
  br i1 %cmp, label %if.then, label %if.else, !dbg !1183

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1184
  store i32 %11, i32* %retval, align 4, !dbg !1186
  br label %return, !dbg !1186

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1187
  br label %return, !dbg !1187

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1189
  ret i32 %12, !dbg !1189
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1190 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i16 0, i16* %s16Temp1, align 2, !dbg !1200
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1201
  %conv = zext i8 %0 to i32, !dbg !1201
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1202
  %conv1 = zext i8 %1 to i32, !dbg !1202
  %sub = sub nsw i32 %conv, %conv1, !dbg !1203
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1204
  %conv2 = sext i8 %2 to i32, !dbg !1204
  %mul = mul nsw i32 %sub, %conv2, !dbg !1205
  %div = sdiv i32 %mul, 32, !dbg !1206
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1207
  %conv3 = zext i8 %3 to i32, !dbg !1207
  %add = add nsw i32 %div, %conv3, !dbg !1208
  %conv4 = trunc i32 %add to i16, !dbg !1209
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1210
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1211
  %conv5 = sext i16 %4 to i32, !dbg !1211
  %cmp = icmp slt i32 %conv5, 255, !dbg !1213
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1214

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1215
  %conv7 = sext i16 %5 to i32, !dbg !1215
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1218
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1219

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1220
  %conv11 = trunc i16 %6 to i8, !dbg !1222
  store i8 %conv11, i8* %retval, align 1, !dbg !1223
  br label %return, !dbg !1223

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1224
  br label %return, !dbg !1224

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1226
  br label %return, !dbg !1226

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1228
  ret i8 %7, !dbg !1228
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1229 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1232, metadata !DIExpression()), !dbg !1233
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1234, metadata !DIExpression()), !dbg !1235
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1236, metadata !DIExpression()), !dbg !1237
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1238, metadata !DIExpression()), !dbg !1239
  store i32 0, i32* %s32Temp1, align 4, !dbg !1239
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1240
  %conv = zext i16 %0 to i32, !dbg !1240
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1241
  %conv1 = zext i16 %1 to i32, !dbg !1241
  %sub = sub nsw i32 %conv, %conv1, !dbg !1242
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1243
  %conv2 = sext i8 %2 to i32, !dbg !1243
  %mul = mul nsw i32 %sub, %conv2, !dbg !1244
  %div = sdiv i32 %mul, 32, !dbg !1245
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1246
  %conv3 = zext i16 %3 to i32, !dbg !1246
  %add = add nsw i32 %div, %conv3, !dbg !1247
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1248
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1249
  %cmp = icmp slt i32 %4, 65535, !dbg !1251
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1252

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1253
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1256
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1257

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1258
  %conv8 = trunc i32 %6 to i16, !dbg !1260
  store i16 %conv8, i16* %retval, align 2, !dbg !1261
  br label %return, !dbg !1261

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1262
  br label %return, !dbg !1262

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1264
  br label %return, !dbg !1264

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1266
  ret i16 %7, !dbg !1266
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1267 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1268, metadata !DIExpression()), !dbg !1269
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1270, metadata !DIExpression()), !dbg !1271
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1272, metadata !DIExpression()), !dbg !1273
  store i32 0, i32* %u32Temp1, align 4, !dbg !1273
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1274
  %conv = zext i16 %0 to i32, !dbg !1274
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1275
  %conv1 = zext i16 %1 to i32, !dbg !1275
  %mul = mul nsw i32 %conv, %conv1, !dbg !1276
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1277
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1278
  %cmp = icmp ule i32 %2, 65535, !dbg !1280
  br i1 %cmp, label %if.then, label %if.else, !dbg !1281

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1282
  %and = and i32 %3, 65535, !dbg !1284
  %conv3 = trunc i32 %and to i16, !dbg !1285
  store i16 %conv3, i16* %retval, align 2, !dbg !1286
  br label %return, !dbg !1286

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1287
  br label %return, !dbg !1287

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1289
  ret i16 %4, !dbg !1289
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1290 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1293, metadata !DIExpression()), !dbg !1294
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1295, metadata !DIExpression()), !dbg !1296
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1297, metadata !DIExpression()), !dbg !1298
  store i32 0, i32* %u32Temp1, align 4, !dbg !1298
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1299
  %conv = zext i16 %0 to i32, !dbg !1299
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1300
  %conv1 = zext i16 %1 to i32, !dbg !1300
  %mul = mul nsw i32 %conv, %conv1, !dbg !1301
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1302
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1303
  ret i32 %2, !dbg !1304
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1305 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1308, metadata !DIExpression()), !dbg !1309
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1310, metadata !DIExpression()), !dbg !1311
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1312, metadata !DIExpression()), !dbg !1313
  store i32 0, i32* %s32Temp1, align 4, !dbg !1313
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1314
  %conv = sext i16 %0 to i32, !dbg !1314
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1315
  %conv1 = sext i16 %1 to i32, !dbg !1315
  %mul = mul nsw i32 %conv, %conv1, !dbg !1316
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1317
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1318
  ret i32 %2, !dbg !1319
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1320 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1323, metadata !DIExpression()), !dbg !1324
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1325, metadata !DIExpression()), !dbg !1326
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1327, metadata !DIExpression()), !dbg !1328
  store i32 0, i32* %s32Temp1, align 4, !dbg !1328
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1329
  %cmp = icmp sgt i32 %0, 0, !dbg !1331
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1332

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1333
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1335
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1335
  %div = udiv i32 -1, %1, !dbg !1335, !klee.check.div !261
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1336
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1337
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1339
  %cmp1 = icmp ult i32 %2, %3, !dbg !1340
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1341

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1342
  br label %return, !dbg !1342

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1344
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1346
  %mul = mul i32 %4, %5, !dbg !1347
  store i32 %mul, i32* %retval, align 4, !dbg !1348
  br label %return, !dbg !1348

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1349
  br label %return, !dbg !1349

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1351
  ret i32 %6, !dbg !1351
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1352 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1355, metadata !DIExpression()), !dbg !1356
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1357, metadata !DIExpression()), !dbg !1358
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1359, metadata !DIExpression()), !dbg !1360
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1361, metadata !DIExpression()), !dbg !1362
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1363, metadata !DIExpression()), !dbg !1364
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1365, metadata !DIExpression()), !dbg !1366
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1367
  %cmp = icmp slt i32 %0, 0, !dbg !1369
  br i1 %cmp, label %if.then, label %if.else, !dbg !1370

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1371
  %sub = sub nsw i32 0, %1, !dbg !1372
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1373
  br label %if.end, !dbg !1374

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1375
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1376
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1377
  %cmp1 = icmp slt i32 %3, 0, !dbg !1379
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1380

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1381
  %sub3 = sub nsw i32 0, %4, !dbg !1382
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1383
  br label %if.end5, !dbg !1384

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1385
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1386
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1387
  %cmp6 = icmp slt i32 %6, 0, !dbg !1389
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1390
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1390

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1391
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1392
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1393
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1393

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1394
  br label %if.end13, !dbg !1395

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1396
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1397
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1398
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1399
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1400
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1401
  %conv = zext i8 %12 to i32, !dbg !1401
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1403
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1404

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1405
  br label %return, !dbg !1405

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1407
  store i32 %13, i32* %retval, align 4, !dbg !1409
  br label %return, !dbg !1409

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1410
  ret i32 %14, !dbg !1410
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1411 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1414, metadata !DIExpression()), !dbg !1415
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1416, metadata !DIExpression()), !dbg !1417
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1418, metadata !DIExpression()), !dbg !1419
  store i32 0, i32* %u32Temp1, align 4, !dbg !1419
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1420
  %cmp = icmp ne i32 %0, 0, !dbg !1422
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1423

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1424
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1426
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1426
  %div = udiv i32 -1, %1, !dbg !1426, !klee.check.div !261
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1427
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1428
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1430
  %cmp1 = icmp ult i32 %2, %3, !dbg !1431
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1432

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1433
  br label %return, !dbg !1433

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1435
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1437
  %mul = mul i32 %4, %5, !dbg !1438
  store i32 %mul, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1440
  br label %return, !dbg !1440

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1442
  ret i32 %6, !dbg !1442
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1443 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1444, metadata !DIExpression()), !dbg !1445
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1446, metadata !DIExpression()), !dbg !1447
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1448, metadata !DIExpression()), !dbg !1449
  store i32 0, i32* %u32Temp1, align 4, !dbg !1449
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1450, metadata !DIExpression()), !dbg !1451
  store i32 0, i32* %u32Temp2, align 4, !dbg !1451
  %0 = load i32, i32* %value.addr, align 4, !dbg !1452
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1453
  %conv = zext i16 %1 to i32, !dbg !1453
  %mul = mul i32 %0, %conv, !dbg !1454
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1455
  %2 = load i32, i32* %value.addr, align 4, !dbg !1456
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1457
  %conv1 = zext i16 %3 to i32, !dbg !1457
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1458
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1459
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1460
  %shr = lshr i32 %4, 16, !dbg !1461
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1462
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1463
  %shl = shl i32 %5, 16, !dbg !1464
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1465
  %or = or i32 %6, %shl, !dbg !1465
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1465
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1466
  ret i32 %7, !dbg !1467
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1468 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1469, metadata !DIExpression()), !dbg !1470
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1471, metadata !DIExpression()), !dbg !1472
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1473, metadata !DIExpression()), !dbg !1474
  store i32 0, i32* %u32Temp1, align 4, !dbg !1474
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1475, metadata !DIExpression()), !dbg !1476
  store i32 0, i32* %u32Temp2, align 4, !dbg !1476
  %0 = load i32, i32* %value.addr, align 4, !dbg !1477
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1478
  %conv = zext i16 %1 to i32, !dbg !1478
  %mul = mul i32 %0, %conv, !dbg !1479
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1480
  %2 = load i32, i32* %value.addr, align 4, !dbg !1481
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1482
  %conv1 = zext i16 %3 to i32, !dbg !1482
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1483
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1484
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1485
  %shr = lshr i32 %4, 15, !dbg !1486
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1487
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1488
  %shl = shl i32 %5, 17, !dbg !1489
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1490
  %or = or i32 %6, %shl, !dbg !1490
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1490
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1491
  %shr2 = lshr i32 %7, 15, !dbg !1493
  %cmp = icmp eq i32 %shr2, 0, !dbg !1494
  br i1 %cmp, label %if.then, label %if.else, !dbg !1495

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1496
  store i32 %8, i32* %retval, align 4, !dbg !1498
  br label %return, !dbg !1498

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1499
  br label %return, !dbg !1499

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1501
  ret i32 %9, !dbg !1501
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1502 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1505, metadata !DIExpression()), !dbg !1506
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1507, metadata !DIExpression()), !dbg !1508
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i32 0, i32* %u32Temp1, align 4, !dbg !1510
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i32 0, i32* %u32Temp2, align 4, !dbg !1512
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1513
  %conv = sext i16 %0 to i32, !dbg !1513
  %cmp = icmp sgt i32 %conv, 0, !dbg !1515
  br i1 %cmp, label %if.then, label %if.else, !dbg !1516

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1517
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1519
  %conv2 = sext i16 %2 to i32, !dbg !1519
  %mul = mul i32 %1, %conv2, !dbg !1520
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1521
  %3 = load i32, i32* %value.addr, align 4, !dbg !1522
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1523
  %conv3 = sext i16 %4 to i32, !dbg !1523
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1524
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1525
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1526
  %shr = lshr i32 %5, 15, !dbg !1527
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1528
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1529
  %shl = shl i32 %6, 17, !dbg !1530
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1531
  %or = or i32 %7, %shl, !dbg !1531
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1531
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1532
  store i32 %8, i32* %retval, align 4, !dbg !1533
  br label %return, !dbg !1533

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1534
  br label %return, !dbg !1534

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1536
  ret i32 %9, !dbg !1536
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1537 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1538, metadata !DIExpression()), !dbg !1539
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1540, metadata !DIExpression()), !dbg !1541
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1542, metadata !DIExpression()), !dbg !1543
  store i32 0, i32* %u32Temp1, align 4, !dbg !1543
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1544, metadata !DIExpression()), !dbg !1545
  store i32 0, i32* %u32Temp2, align 4, !dbg !1545
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1546
  %conv = sext i16 %0 to i32, !dbg !1546
  %cmp = icmp sle i32 %conv, 0, !dbg !1548
  br i1 %cmp, label %if.then, label %if.else, !dbg !1549

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1550
  br label %return, !dbg !1550

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1552
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1554
  %conv2 = sext i16 %2 to i32, !dbg !1554
  %mul = mul i32 %1, %conv2, !dbg !1555
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1556
  %3 = load i32, i32* %value.addr, align 4, !dbg !1557
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1558
  %conv3 = sext i16 %4 to i32, !dbg !1558
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1559
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1560
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1561
  %shr = lshr i32 %5, 14, !dbg !1562
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1563
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1564
  %shl = shl i32 %6, 18, !dbg !1565
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1566
  %or = or i32 %7, %shl, !dbg !1566
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1566
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1567
  %shr4 = lshr i32 %8, 14, !dbg !1569
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1570
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1571

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1572
  store i32 %9, i32* %retval, align 4, !dbg !1574
  br label %return, !dbg !1574

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1575
  br label %return, !dbg !1575

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1577
  ret i32 %10, !dbg !1577
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1578 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1579, metadata !DIExpression()), !dbg !1580
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1581, metadata !DIExpression()), !dbg !1582
  %0 = load i32, i32* %value.addr, align 4, !dbg !1583
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1584
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1585
  ret i32 %call, !dbg !1586
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1587 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1588, metadata !DIExpression()), !dbg !1589
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1590, metadata !DIExpression()), !dbg !1591
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 0, i32* %u32Temp1, align 4, !dbg !1593
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1594, metadata !DIExpression()), !dbg !1595
  store i32 0, i32* %u32Temp2, align 4, !dbg !1595
  %0 = load i32, i32* %value.addr, align 4, !dbg !1596
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1597
  %mul = mul i32 %0, %1, !dbg !1598
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1599
  %2 = load i32, i32* %value.addr, align 4, !dbg !1600
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1601
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1602
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1603
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1604
  %shr = lshr i32 %4, 31, !dbg !1605
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1606
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1607
  %shl = shl i32 %5, 1, !dbg !1608
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1609
  %or = or i32 %6, %shl, !dbg !1609
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1609
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1610
  %shr1 = lshr i32 %7, 31, !dbg !1612
  %cmp = icmp eq i32 %shr1, 0, !dbg !1613
  br i1 %cmp, label %if.then, label %if.else, !dbg !1614

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1615
  store i32 %8, i32* %retval, align 4, !dbg !1617
  br label %return, !dbg !1617

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1618
  br label %return, !dbg !1618

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1620
  ret i32 %9, !dbg !1620
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1621 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1624, metadata !DIExpression()), !dbg !1625
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1626, metadata !DIExpression()), !dbg !1627
  store i32 0, i32* %u32Temp1, align 4, !dbg !1627
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1628, metadata !DIExpression()), !dbg !1629
  store i32 0, i32* %u32Temp2, align 4, !dbg !1629
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1630
  %cmp = icmp sgt i32 %0, 0, !dbg !1632
  br i1 %cmp, label %if.then, label %if.else, !dbg !1633

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1634
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1636
  %mul = mul i32 %1, %2, !dbg !1637
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1638
  %3 = load i32, i32* %value.addr, align 4, !dbg !1639
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1640
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1641
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1642
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1643
  %shr = lshr i32 %5, 31, !dbg !1644
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1645
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1646
  %shl = shl i32 %6, 1, !dbg !1647
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1648
  %or = or i32 %7, %shl, !dbg !1648
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1648
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1649
  store i32 %8, i32* %retval, align 4, !dbg !1650
  br label %return, !dbg !1650

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1651
  br label %return, !dbg !1651

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1653
  ret i32 %9, !dbg !1653
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1654 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1655, metadata !DIExpression()), !dbg !1656
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1657, metadata !DIExpression()), !dbg !1658
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1659, metadata !DIExpression()), !dbg !1660
  store i32 0, i32* %u32Temp1, align 4, !dbg !1660
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1661, metadata !DIExpression()), !dbg !1662
  store i32 0, i32* %u32Temp2, align 4, !dbg !1662
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1663
  %cmp = icmp sle i32 %0, 0, !dbg !1665
  br i1 %cmp, label %if.then, label %if.else, !dbg !1666

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1667
  br label %return, !dbg !1667

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1669
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1671
  %mul = mul i32 %1, %2, !dbg !1672
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1673
  %3 = load i32, i32* %value.addr, align 4, !dbg !1674
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1675
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1676
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1677
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1678
  %shr = lshr i32 %5, 30, !dbg !1679
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1680
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1681
  %shl = shl i32 %6, 2, !dbg !1682
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1683
  %or = or i32 %7, %shl, !dbg !1683
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1683
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1684
  %shr1 = lshr i32 %8, 30, !dbg !1686
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1687
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1688

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1689
  store i32 %9, i32* %retval, align 4, !dbg !1691
  br label %return, !dbg !1691

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1692
  br label %return, !dbg !1692

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1694
  ret i32 %10, !dbg !1694
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1695 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1698, metadata !DIExpression()), !dbg !1699
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1700, metadata !DIExpression()), !dbg !1701
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1702, metadata !DIExpression()), !dbg !1703
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1703
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1704
  %cmp = icmp slt i32 %0, 0, !dbg !1706
  br i1 %cmp, label %if.then, label %if.end, !dbg !1707

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1708
  %sub = sub nsw i32 0, %1, !dbg !1710
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1711
  br label %if.end, !dbg !1712

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1713
  %cmp1 = icmp ne i32 %2, 0, !dbg !1715
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1716

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1717
  %cmp3 = icmp sle i32 %3, 0, !dbg !1720
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1721

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1722
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1725
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1725
  %div = udiv i32 -2147483648, %4, !dbg !1725, !klee.check.div !261
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1726
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1727
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1728

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1729
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1731
  %mul = mul i32 %6, %7, !dbg !1732
  store i32 %mul, i32* %retval, align 4, !dbg !1733
  br label %return, !dbg !1733

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1734
  br label %return, !dbg !1734

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1736
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1739
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1739
  %div8 = sdiv i32 2147483647, %8, !dbg !1739, !klee.check.div !261
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1740
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1741
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1742

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1743
  br label %return, !dbg !1743

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1745
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1747
  %mul12 = mul i32 %10, %11, !dbg !1748
  store i32 %mul12, i32* %retval, align 4, !dbg !1749
  br label %return, !dbg !1749

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1750
  br label %return, !dbg !1750

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1752
  ret i32 %12, !dbg !1752
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1753 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1754, metadata !DIExpression()), !dbg !1755
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1756, metadata !DIExpression()), !dbg !1757
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1758, metadata !DIExpression()), !dbg !1759
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1760, metadata !DIExpression()), !dbg !1761
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1762, metadata !DIExpression()), !dbg !1763
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1764, metadata !DIExpression()), !dbg !1765
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1766
  %cmp = icmp slt i32 %0, 0, !dbg !1768
  br i1 %cmp, label %if.then, label %if.else, !dbg !1769

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1770
  %sub = sub nsw i32 0, %1, !dbg !1772
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1773
  store i8 1, i8* %u8SignBit, align 1, !dbg !1774
  br label %if.end, !dbg !1775

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1776
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1778
  store i8 0, i8* %u8SignBit, align 1, !dbg !1779
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1780
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1781
  %conv = zext i16 %4 to i32, !dbg !1781
  %mul = mul i32 %3, %conv, !dbg !1782
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1783
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1784
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1785
  %conv1 = zext i16 %6 to i32, !dbg !1785
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1786
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1787
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1788
  %shr = lshr i32 %7, 16, !dbg !1789
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1790
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1791
  %shl = shl i32 %8, 16, !dbg !1792
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1793
  %or = or i32 %9, %shl, !dbg !1793
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1793
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1794
  %conv2 = zext i8 %10 to i32, !dbg !1794
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1796
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1797

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1798
  store i32 %11, i32* %retval, align 4, !dbg !1800
  br label %return, !dbg !1800

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1801
  %sub7 = sub i32 0, %12, !dbg !1803
  store i32 %sub7, i32* %retval, align 4, !dbg !1804
  br label %return, !dbg !1804

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1805
  ret i32 %13, !dbg !1805
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1806 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1807, metadata !DIExpression()), !dbg !1808
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1809, metadata !DIExpression()), !dbg !1810
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1811, metadata !DIExpression()), !dbg !1812
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1813, metadata !DIExpression()), !dbg !1814
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1815, metadata !DIExpression()), !dbg !1816
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1817, metadata !DIExpression()), !dbg !1818
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1819
  %cmp = icmp slt i32 %0, 0, !dbg !1821
  br i1 %cmp, label %if.then, label %if.else, !dbg !1822

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1823
  %sub = sub nsw i32 0, %1, !dbg !1825
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1826
  store i8 1, i8* %u8SignBit, align 1, !dbg !1827
  br label %if.end, !dbg !1828

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1829
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1831
  store i8 0, i8* %u8SignBit, align 1, !dbg !1832
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1833
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1834
  %conv = zext i16 %4 to i32, !dbg !1834
  %mul = mul i32 %3, %conv, !dbg !1835
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1836
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1837
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1838
  %conv1 = zext i16 %6 to i32, !dbg !1838
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1839
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1840
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1841
  %shr = lshr i32 %7, 15, !dbg !1842
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1843
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1844
  %shl = shl i32 %8, 17, !dbg !1845
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1846
  %or = or i32 %9, %shl, !dbg !1846
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1846
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1847
  %conv2 = zext i8 %10 to i32, !dbg !1847
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1849
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1850

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1851
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1854
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1855

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1856
  store i32 %12, i32* %retval, align 4, !dbg !1857
  br label %return, !dbg !1857

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1858
  br label %return, !dbg !1858

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1859
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1862
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1863

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1864
  %sub14 = sub i32 0, %14, !dbg !1865
  store i32 %sub14, i32* %retval, align 4, !dbg !1866
  br label %return, !dbg !1866

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1867
  br label %return, !dbg !1867

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1868
  ret i32 %15, !dbg !1868
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1869 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1872, metadata !DIExpression()), !dbg !1873
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1874, metadata !DIExpression()), !dbg !1875
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1876, metadata !DIExpression()), !dbg !1877
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1878, metadata !DIExpression()), !dbg !1879
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1880, metadata !DIExpression()), !dbg !1881
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1882, metadata !DIExpression()), !dbg !1883
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1884, metadata !DIExpression()), !dbg !1885
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1886
  %cmp = icmp slt i32 %0, 0, !dbg !1888
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1889

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1890
  %conv = sext i16 %1 to i32, !dbg !1890
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1891
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1892

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1893
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1894
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1895

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1896
  %conv6 = sext i16 %3 to i32, !dbg !1896
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1897
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1898

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1899
  br label %if.end, !dbg !1901

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1902
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1904
  %cmp9 = icmp slt i32 %4, 0, !dbg !1906
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1907

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1908
  %sub = sub nsw i32 0, %5, !dbg !1910
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1911
  br label %if.end13, !dbg !1912

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1913
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1915
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1916
  %conv14 = sext i16 %7 to i32, !dbg !1916
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1918
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1919

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1920
  %conv18 = sext i16 %8 to i32, !dbg !1920
  %sub19 = sub nsw i32 0, %conv18, !dbg !1922
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1923
  br label %if.end22, !dbg !1924

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1925
  %conv21 = sext i16 %9 to i32, !dbg !1925
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1927
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1928
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1929
  %mul = mul i32 %10, %11, !dbg !1930
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1931
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1932
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1933
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1934
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1935
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1936
  %shr = lshr i32 %14, 15, !dbg !1937
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1938
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1939
  %shl = shl i32 %15, 17, !dbg !1940
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1941
  %or = or i32 %16, %shl, !dbg !1941
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1941
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1942
  %conv23 = zext i8 %17 to i32, !dbg !1942
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1944
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1945

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1946
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1949
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1950

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1951
  store i32 %19, i32* %retval, align 4, !dbg !1952
  br label %return, !dbg !1952

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1953
  br label %return, !dbg !1953

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1954
  %sub32 = sub i32 0, %20, !dbg !1956
  store i32 %sub32, i32* %retval, align 4, !dbg !1957
  br label %return, !dbg !1957

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1958
  ret i32 %21, !dbg !1958
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1959 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1960, metadata !DIExpression()), !dbg !1961
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1962, metadata !DIExpression()), !dbg !1963
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1964, metadata !DIExpression()), !dbg !1965
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1966, metadata !DIExpression()), !dbg !1967
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1968, metadata !DIExpression()), !dbg !1969
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1970, metadata !DIExpression()), !dbg !1971
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1972, metadata !DIExpression()), !dbg !1973
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1974
  %cmp = icmp slt i32 %0, 0, !dbg !1976
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1977

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1978
  %conv = sext i16 %1 to i32, !dbg !1978
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1979
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1980

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1981
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1982
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1983

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1984
  %conv6 = sext i16 %3 to i32, !dbg !1984
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1985
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1986

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1987
  br label %if.end, !dbg !1989

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1990
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1992
  %cmp9 = icmp slt i32 %4, 0, !dbg !1994
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1995

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1996
  %sub = sub nsw i32 0, %5, !dbg !1998
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1999
  br label %if.end13, !dbg !2000

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2001
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2003
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2004
  %conv14 = sext i16 %7 to i32, !dbg !2004
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2006
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2007

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2008
  %conv18 = sext i16 %8 to i32, !dbg !2008
  %sub19 = sub nsw i32 0, %conv18, !dbg !2010
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2011
  br label %if.end22, !dbg !2012

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2013
  %conv21 = sext i16 %9 to i32, !dbg !2013
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2015
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2016
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2017
  %mul = mul i32 %10, %11, !dbg !2018
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2019
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2020
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2021
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2022
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2023
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2024
  %shr = lshr i32 %14, 14, !dbg !2025
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2026
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2027
  %shl = shl i32 %15, 18, !dbg !2028
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2029
  %or = or i32 %16, %shl, !dbg !2029
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2029
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2030
  %shr23 = lshr i32 %17, 14, !dbg !2032
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2033
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2034

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2035
  %conv27 = zext i8 %18 to i32, !dbg !2035
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2038
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2039

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2040
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2043
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2044

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2045
  store i32 %20, i32* %retval, align 4, !dbg !2046
  br label %return, !dbg !2046

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2047
  br label %return, !dbg !2047

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2048
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2051
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2052

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2053
  %sub39 = sub i32 0, %22, !dbg !2054
  store i32 %sub39, i32* %retval, align 4, !dbg !2055
  br label %return, !dbg !2055

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2056
  br label %return, !dbg !2056

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2057
  br label %return, !dbg !2057

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2059
  ret i32 %23, !dbg !2059
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2060 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2063, metadata !DIExpression()), !dbg !2064
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2065, metadata !DIExpression()), !dbg !2066
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2067, metadata !DIExpression()), !dbg !2068
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2069, metadata !DIExpression()), !dbg !2070
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2071, metadata !DIExpression()), !dbg !2072
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2073
  %cmp = icmp slt i32 %0, 0, !dbg !2075
  br i1 %cmp, label %if.then, label %if.else, !dbg !2076

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2077
  %sub = sub nsw i32 0, %1, !dbg !2079
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2080
  store i8 1, i8* %u8SignBit, align 1, !dbg !2081
  br label %if.end, !dbg !2082

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2083
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2085
  store i8 0, i8* %u8SignBit, align 1, !dbg !2086
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2087
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2088
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2089
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2090
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2091
  %conv = zext i8 %5 to i32, !dbg !2091
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2093
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2094

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2095
  store i32 %6, i32* %retval, align 4, !dbg !2096
  br label %return, !dbg !2096

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2097
  %sub5 = sub i32 0, %7, !dbg !2098
  store i32 %sub5, i32* %retval, align 4, !dbg !2099
  br label %return, !dbg !2099

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2100
  ret i32 %8, !dbg !2100
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2101 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2102, metadata !DIExpression()), !dbg !2103
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2104, metadata !DIExpression()), !dbg !2105
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2106, metadata !DIExpression()), !dbg !2107
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2108, metadata !DIExpression()), !dbg !2109
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2110, metadata !DIExpression()), !dbg !2111
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2112, metadata !DIExpression()), !dbg !2113
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2114
  %cmp = icmp slt i32 %0, 0, !dbg !2116
  br i1 %cmp, label %if.then, label %if.else, !dbg !2117

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2118
  %sub = sub nsw i32 0, %1, !dbg !2120
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2121
  store i8 1, i8* %u8SignBit, align 1, !dbg !2122
  br label %if.end, !dbg !2123

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2124
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2126
  store i8 0, i8* %u8SignBit, align 1, !dbg !2127
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2128
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2129
  %mul = mul i32 %3, %4, !dbg !2130
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2131
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2132
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2133
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2134
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2135
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2136
  %shr = lshr i32 %7, 31, !dbg !2137
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2138
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2139
  %shl = shl i32 %8, 1, !dbg !2140
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2141
  %or = or i32 %9, %shl, !dbg !2141
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2141
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2142
  %conv = zext i8 %10 to i32, !dbg !2142
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2144
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2145

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2146
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2149
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2150

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2151
  store i32 %12, i32* %retval, align 4, !dbg !2152
  br label %return, !dbg !2152

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2153
  br label %return, !dbg !2153

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2154
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2157
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2158

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2159
  %sub12 = sub i32 0, %14, !dbg !2160
  store i32 %sub12, i32* %retval, align 4, !dbg !2161
  br label %return, !dbg !2161

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2162
  br label %return, !dbg !2162

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2163
  ret i32 %15, !dbg !2163
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2164 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2167, metadata !DIExpression()), !dbg !2168
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2169, metadata !DIExpression()), !dbg !2170
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2171, metadata !DIExpression()), !dbg !2172
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2173, metadata !DIExpression()), !dbg !2174
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2175, metadata !DIExpression()), !dbg !2176
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2177, metadata !DIExpression()), !dbg !2178
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2179, metadata !DIExpression()), !dbg !2180
  %0 = load i32, i32* %value.addr, align 4, !dbg !2181
  %cmp = icmp slt i32 %0, 0, !dbg !2183
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2184
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2184

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2185
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2186
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2187
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2187

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2188
  br label %if.end, !dbg !2190

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2191
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2193
  %cmp5 = icmp slt i32 %4, 0, !dbg !2195
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2196

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2197
  %sub = sub nsw i32 0, %5, !dbg !2199
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2200
  br label %if.end8, !dbg !2201

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2202
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2204
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2205
  %cmp9 = icmp slt i32 %7, 0, !dbg !2207
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2208

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2209
  %sub11 = sub nsw i32 0, %8, !dbg !2211
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2212
  br label %if.end13, !dbg !2213

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2214
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2216
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2217
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2218
  %mul = mul i32 %10, %11, !dbg !2219
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2220
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2221
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2222
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2223
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2224
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2225
  %shr = lshr i32 %14, 31, !dbg !2226
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2227
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2228
  %shl = shl i32 %15, 1, !dbg !2229
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2230
  %or = or i32 %16, %shl, !dbg !2230
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2230
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2231
  %conv = zext i8 %17 to i32, !dbg !2231
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2233
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2234

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2235
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2238
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2239

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2240
  store i32 %19, i32* %retval, align 4, !dbg !2241
  br label %return, !dbg !2241

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2242
  br label %return, !dbg !2242

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2243
  %sub22 = sub i32 0, %20, !dbg !2245
  store i32 %sub22, i32* %retval, align 4, !dbg !2246
  br label %return, !dbg !2246

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2247
  ret i32 %21, !dbg !2247
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2248 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2249, metadata !DIExpression()), !dbg !2250
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2251, metadata !DIExpression()), !dbg !2252
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2253, metadata !DIExpression()), !dbg !2254
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2255, metadata !DIExpression()), !dbg !2256
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2257, metadata !DIExpression()), !dbg !2258
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2259, metadata !DIExpression()), !dbg !2260
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2261, metadata !DIExpression()), !dbg !2262
  %0 = load i32, i32* %value.addr, align 4, !dbg !2263
  %cmp = icmp slt i32 %0, 0, !dbg !2265
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2266
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2266

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2267
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2268
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2269
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2269

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2270
  br label %if.end, !dbg !2272

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2273
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2275
  %cmp5 = icmp slt i32 %4, 0, !dbg !2277
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2278

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2279
  %sub = sub nsw i32 0, %5, !dbg !2281
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2282
  br label %if.end8, !dbg !2283

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2284
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2286
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2287
  %cmp9 = icmp slt i32 %7, 0, !dbg !2289
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2290

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2291
  %sub11 = sub nsw i32 0, %8, !dbg !2293
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2294
  br label %if.end13, !dbg !2295

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2296
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2298
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2299
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2300
  %mul = mul i32 %10, %11, !dbg !2301
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2302
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2303
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2304
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2305
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2306
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2307
  %shr = lshr i32 %14, 30, !dbg !2308
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2309
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2310
  %shl = shl i32 %15, 2, !dbg !2311
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2312
  %or = or i32 %16, %shl, !dbg !2312
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2312
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2313
  %shr14 = lshr i32 %17, 30, !dbg !2315
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2316
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2317

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2318
  %conv = zext i8 %18 to i32, !dbg !2318
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2321
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2322

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2323
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2326
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2327

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2328
  store i32 %20, i32* %retval, align 4, !dbg !2329
  br label %return, !dbg !2329

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2330
  br label %return, !dbg !2330

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2331
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2334
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2335

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2336
  %sub28 = sub i32 0, %22, !dbg !2337
  store i32 %sub28, i32* %retval, align 4, !dbg !2338
  br label %return, !dbg !2338

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2339
  br label %return, !dbg !2339

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2340
  br label %return, !dbg !2340

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2342
  ret i32 %23, !dbg !2342
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2343 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2346, metadata !DIExpression()), !dbg !2347
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2348, metadata !DIExpression()), !dbg !2349
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2350, metadata !DIExpression()), !dbg !2351
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2352, metadata !DIExpression()), !dbg !2353
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2354, metadata !DIExpression()), !dbg !2355
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2356, metadata !DIExpression()), !dbg !2357
  %0 = load i32, i32* %value.addr, align 4, !dbg !2358
  %cmp = icmp slt i32 %0, 0, !dbg !2360
  br i1 %cmp, label %if.then, label %if.else, !dbg !2361

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2362
  %sub = sub nsw i32 0, %1, !dbg !2364
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2365
  store i8 1, i8* %u8SignBit, align 1, !dbg !2366
  br label %if.end, !dbg !2367

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2368
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2370
  store i8 0, i8* %u8SignBit, align 1, !dbg !2371
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2372
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2373
  %conv = zext i8 %4 to i32, !dbg !2373
  %mul = mul i32 %3, %conv, !dbg !2374
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2375
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2376
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2377
  %conv1 = zext i8 %6 to i32, !dbg !2377
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2378
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2379
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2380
  %shr = lshr i32 %7, 8, !dbg !2381
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2382
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2383
  %shl = shl i32 %8, 24, !dbg !2384
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2385
  %or = or i32 %9, %shl, !dbg !2385
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2385
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2386
  %conv2 = zext i8 %10 to i32, !dbg !2386
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2388
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2389

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2390
  store i32 %11, i32* %retval, align 4, !dbg !2392
  br label %return, !dbg !2392

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2393
  %sub7 = sub i32 0, %12, !dbg !2395
  store i32 %sub7, i32* %retval, align 4, !dbg !2396
  br label %return, !dbg !2396

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2397
  ret i32 %13, !dbg !2397
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2398 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2399, metadata !DIExpression()), !dbg !2400
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2401, metadata !DIExpression()), !dbg !2402
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2403, metadata !DIExpression()), !dbg !2404
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2405, metadata !DIExpression()), !dbg !2406
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2407, metadata !DIExpression()), !dbg !2408
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2409, metadata !DIExpression()), !dbg !2410
  %0 = load i32, i32* %value.addr, align 4, !dbg !2411
  %cmp = icmp slt i32 %0, 0, !dbg !2413
  br i1 %cmp, label %if.then, label %if.else, !dbg !2414

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2415
  %sub = sub nsw i32 0, %1, !dbg !2417
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2418
  store i8 1, i8* %u8SignBit, align 1, !dbg !2419
  br label %if.end, !dbg !2420

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2421
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2423
  store i8 0, i8* %u8SignBit, align 1, !dbg !2424
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2425
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2426
  %conv = zext i8 %4 to i32, !dbg !2426
  %mul = mul i32 %3, %conv, !dbg !2427
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2428
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2429
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2430
  %conv1 = zext i8 %6 to i32, !dbg !2430
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2431
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2432
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2433
  %shr = lshr i32 %7, 7, !dbg !2434
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2435
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2436
  %shl = shl i32 %8, 25, !dbg !2437
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2438
  %or = or i32 %9, %shl, !dbg !2438
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2438
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2439
  %conv2 = zext i8 %10 to i32, !dbg !2439
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2441
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2442

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2443
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2446
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2447

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2448
  store i32 %12, i32* %retval, align 4, !dbg !2449
  br label %return, !dbg !2449

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2450
  br label %return, !dbg !2450

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2451
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2454
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2455

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2456
  %sub14 = sub i32 0, %14, !dbg !2457
  store i32 %sub14, i32* %retval, align 4, !dbg !2458
  br label %return, !dbg !2458

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2459
  br label %return, !dbg !2459

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2460
  ret i32 %15, !dbg !2460
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2461 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2464, metadata !DIExpression()), !dbg !2465
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2466, metadata !DIExpression()), !dbg !2467
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2468, metadata !DIExpression()), !dbg !2469
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2470, metadata !DIExpression()), !dbg !2471
  store i32 0, i32* %u32Temp1, align 4, !dbg !2471
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2472, metadata !DIExpression()), !dbg !2473
  store i32 0, i32* %u32Temp2, align 4, !dbg !2473
  %0 = load i8, i8* %power.addr, align 1, !dbg !2474
  %conv = zext i8 %0 to i32, !dbg !2474
  %cmp = icmp sge i32 %conv, 32, !dbg !2476
  br i1 %cmp, label %if.then, label %if.else, !dbg !2477

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2478
  br label %if.end7, !dbg !2480

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2481
  %conv2 = zext i8 %1 to i32, !dbg !2481
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2483
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2484

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2485
  br label %if.end7, !dbg !2487

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2488
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2489
  %mul = mul i32 %2, %3, !dbg !2490
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2491
  %4 = load i32, i32* %value.addr, align 4, !dbg !2492
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2493
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2494
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2495
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2496
  %7 = load i8, i8* %power.addr, align 1, !dbg !2497
  %conv8 = zext i8 %7 to i32, !dbg !2497
  %sub = sub nsw i32 32, %conv8, !dbg !2498
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2499
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2499
  %shr = lshr i32 %6, %sub, !dbg !2499, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2500
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2501
  %9 = load i8, i8* %power.addr, align 1, !dbg !2502
  %conv9 = zext i8 %9 to i32, !dbg !2502
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2503
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2503
  %shl = shl i32 %8, %conv9, !dbg !2503, !klee.check.shift !261
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2504
  %or = or i32 %10, %shl, !dbg !2504
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2504
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2505
  %12 = load i8, i8* %power.addr, align 1, !dbg !2507
  %conv10 = zext i8 %12 to i32, !dbg !2507
  %sub11 = sub nsw i32 32, %conv10, !dbg !2508
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2509
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2509
  %shr12 = lshr i32 %11, %sub11, !dbg !2509, !klee.check.shift !261
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2510
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2511

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2512
  store i32 %13, i32* %retval, align 4, !dbg !2514
  br label %return, !dbg !2514

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2515
  br label %return, !dbg !2515

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2517
  ret i32 %14, !dbg !2517
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2518 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2521, metadata !DIExpression()), !dbg !2522
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2523, metadata !DIExpression()), !dbg !2524
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2525, metadata !DIExpression()), !dbg !2526
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2527, metadata !DIExpression()), !dbg !2528
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2529, metadata !DIExpression()), !dbg !2530
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2531, metadata !DIExpression()), !dbg !2532
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2533, metadata !DIExpression()), !dbg !2534
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2535, metadata !DIExpression()), !dbg !2536
  %0 = load i8, i8* %power.addr, align 1, !dbg !2537
  %conv = zext i8 %0 to i32, !dbg !2537
  %cmp = icmp sge i32 %conv, 32, !dbg !2539
  br i1 %cmp, label %if.then, label %if.else, !dbg !2540

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2541
  br label %if.end7, !dbg !2543

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2544
  %conv2 = zext i8 %1 to i32, !dbg !2544
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2546
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2547

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2548
  br label %if.end7, !dbg !2550

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2551
  %cmp8 = icmp slt i32 %2, 0, !dbg !2553
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2554
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2554

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2555
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2556
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2557
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2557

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2558
  br label %if.end19, !dbg !2560

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2561
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2563
  %cmp20 = icmp slt i32 %6, 0, !dbg !2565
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2566

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2567
  %sub = sub nsw i32 0, %7, !dbg !2569
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2570
  br label %if.end24, !dbg !2571

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2572
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2574
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2575
  %cmp25 = icmp slt i32 %9, 0, !dbg !2577
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2578

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2579
  %sub28 = sub nsw i32 0, %10, !dbg !2581
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2582
  br label %if.end30, !dbg !2583

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2584
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2586
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2587
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2588
  %mul = mul i32 %12, %13, !dbg !2589
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2590
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2591
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2592
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2593
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2594
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2595
  %17 = load i8, i8* %power.addr, align 1, !dbg !2596
  %conv31 = zext i8 %17 to i32, !dbg !2596
  %sub32 = sub nsw i32 32, %conv31, !dbg !2597
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2598
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2598
  %shr = lshr i32 %16, %sub32, !dbg !2598, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2599
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2600
  %19 = load i8, i8* %power.addr, align 1, !dbg !2601
  %conv33 = zext i8 %19 to i32, !dbg !2601
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2602
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2602
  %shl = shl i32 %18, %conv33, !dbg !2602, !klee.check.shift !261
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2603
  %or = or i32 %20, %shl, !dbg !2603
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2603
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2604
  %22 = load i8, i8* %power.addr, align 1, !dbg !2606
  %conv34 = zext i8 %22 to i32, !dbg !2606
  %sub35 = sub nsw i32 32, %conv34, !dbg !2607
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2608
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2608
  %shr36 = lshr i32 %21, %sub35, !dbg !2608, !klee.check.shift !261
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2609
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2610

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2611
  %conv40 = zext i8 %23 to i32, !dbg !2611
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2614
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2615

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2616
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2619
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2620

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2621
  store i32 %25, i32* %retval, align 4, !dbg !2622
  br label %return, !dbg !2622

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2623
  br label %return, !dbg !2623

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2624
  %sub49 = sub i32 0, %26, !dbg !2626
  store i32 %sub49, i32* %retval, align 4, !dbg !2627
  br label %return, !dbg !2627

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2628
  %conv51 = zext i8 %27 to i32, !dbg !2628
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2631
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2632

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2633
  br label %return, !dbg !2633

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2635
  br label %return, !dbg !2635

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2637
  ret i32 %28, !dbg !2637
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2638 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2641, metadata !DIExpression()), !dbg !2642
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2643, metadata !DIExpression()), !dbg !2644
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2645, metadata !DIExpression()), !dbg !2646
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2647, metadata !DIExpression()), !dbg !2648
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2649, metadata !DIExpression()), !dbg !2650
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2651, metadata !DIExpression()), !dbg !2652
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2653, metadata !DIExpression()), !dbg !2654
  %0 = load i32, i32* %value.addr, align 4, !dbg !2655
  %cmp = icmp slt i32 %0, 0, !dbg !2657
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2658

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2659
  %conv = sext i8 %1 to i32, !dbg !2659
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2660
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2661

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2662
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2663
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2664

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2665
  %conv6 = sext i8 %3 to i32, !dbg !2665
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2666
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2667

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2668
  br label %if.end, !dbg !2670

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2671
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2673
  %cmp9 = icmp slt i32 %4, 0, !dbg !2675
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2676

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2677
  %sub = sub nsw i32 0, %5, !dbg !2679
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2680
  br label %if.end13, !dbg !2681

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2682
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2684
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2685
  %conv14 = sext i8 %7 to i32, !dbg !2685
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2687
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2688

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2689
  %conv18 = sext i8 %8 to i32, !dbg !2689
  %sub19 = sub nsw i32 0, %conv18, !dbg !2691
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2692
  br label %if.end22, !dbg !2693

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2694
  %conv21 = sext i8 %9 to i32, !dbg !2694
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2696
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2697
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2698
  %mul = mul i32 %10, %11, !dbg !2699
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2700
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2701
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2702
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2703
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2704
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2705
  %shr = lshr i32 %14, 7, !dbg !2706
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2707
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2708
  %shl = shl i32 %15, 25, !dbg !2709
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2710
  %or = or i32 %16, %shl, !dbg !2710
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2710
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2711
  %conv23 = zext i8 %17 to i32, !dbg !2711
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2713
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2714

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2715
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2718
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2719

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2720
  store i32 %19, i32* %retval, align 4, !dbg !2721
  br label %return, !dbg !2721

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2722
  br label %return, !dbg !2722

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2723
  %sub32 = sub i32 0, %20, !dbg !2725
  store i32 %sub32, i32* %retval, align 4, !dbg !2726
  br label %return, !dbg !2726

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2727
  ret i32 %21, !dbg !2727
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2728 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2729, metadata !DIExpression()), !dbg !2730
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2731, metadata !DIExpression()), !dbg !2732
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2733, metadata !DIExpression()), !dbg !2734
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2735, metadata !DIExpression()), !dbg !2736
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2737, metadata !DIExpression()), !dbg !2738
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2739, metadata !DIExpression()), !dbg !2740
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2741, metadata !DIExpression()), !dbg !2742
  %0 = load i32, i32* %value.addr, align 4, !dbg !2743
  %cmp = icmp slt i32 %0, 0, !dbg !2745
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2746

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2747
  %conv = sext i8 %1 to i32, !dbg !2747
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2748
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2749

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2750
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2751
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2752

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2753
  %conv6 = sext i8 %3 to i32, !dbg !2753
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2754
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2755

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2756
  br label %if.end, !dbg !2758

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2759
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2761
  %cmp9 = icmp slt i32 %4, 0, !dbg !2763
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2764

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2765
  %sub = sub nsw i32 0, %5, !dbg !2767
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2768
  br label %if.end13, !dbg !2769

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2770
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2772
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2773
  %conv14 = sext i8 %7 to i32, !dbg !2773
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2775
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2776

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2777
  %conv18 = sext i8 %8 to i32, !dbg !2777
  %sub19 = sub nsw i32 0, %conv18, !dbg !2779
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2780
  br label %if.end22, !dbg !2781

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2782
  %conv21 = sext i8 %9 to i32, !dbg !2782
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2784
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2785
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2786
  %mul = mul i32 %10, %11, !dbg !2787
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2788
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2789
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2790
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2791
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2792
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2793
  %shr = lshr i32 %14, 6, !dbg !2794
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2795
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2796
  %shl = shl i32 %15, 26, !dbg !2797
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2798
  %or = or i32 %16, %shl, !dbg !2798
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2798
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2799
  %shr23 = lshr i32 %17, 6, !dbg !2801
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2802
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2803

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2804
  %conv27 = zext i8 %18 to i32, !dbg !2804
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2807
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2808

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2809
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2812
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2813

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2814
  store i32 %20, i32* %retval, align 4, !dbg !2815
  br label %return, !dbg !2815

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2816
  br label %return, !dbg !2816

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2817
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2820
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2821

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2822
  %sub39 = sub i32 0, %22, !dbg !2823
  store i32 %sub39, i32* %retval, align 4, !dbg !2824
  br label %return, !dbg !2824

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2825
  br label %return, !dbg !2825

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2826
  br label %return, !dbg !2826

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2828
  ret i32 %23, !dbg !2828
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2829 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2830, metadata !DIExpression()), !dbg !2831
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2832, metadata !DIExpression()), !dbg !2833
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2834, metadata !DIExpression()), !dbg !2835
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2836, metadata !DIExpression()), !dbg !2837
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2838, metadata !DIExpression()), !dbg !2839
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2840, metadata !DIExpression()), !dbg !2841
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2842, metadata !DIExpression()), !dbg !2843
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2844
  %cmp = icmp slt i32 %0, 0, !dbg !2846
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2847
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2847

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2848
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2849
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2850
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2850

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2851
  br label %if.end, !dbg !2853

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2854
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2856
  %cmp5 = icmp slt i32 %4, 0, !dbg !2858
  br i1 %cmp5, label %if.then6, label %if.else10, !dbg !2859

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2860
  %conv = sext i32 %5 to i64, !dbg !2863
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !2864
  %tobool = icmp ne i32 %call, 0, !dbg !2864
  br i1 %tobool, label %if.end8, label %if.then7, !dbg !2865

if.then7:                                         ; preds = %if.then6
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 2676, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !2866
  unreachable, !dbg !2866

if.end8:                                          ; preds = %if.then6
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2868
  %sub = sub nsw i32 0, %6, !dbg !2869
  %conv9 = sext i32 %sub to i64, !dbg !2870
  store volatile i64 %conv9, i64* @klee_alarm_sink_s64, align 8, !dbg !2871
  store i32 0, i32* %retval, align 4, !dbg !2872
  br label %return, !dbg !2872

if.else10:                                        ; preds = %if.end
  %7 = load i32, i32* %val1.addr, align 4, !dbg !2873
  store i32 %7, i32* %u32Temp1, align 4, !dbg !2875
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2876
  %cmp12 = icmp slt i32 %8, 0, !dbg !2878
  br i1 %cmp12, label %if.then14, label %if.else16, !dbg !2879

if.then14:                                        ; preds = %if.else10
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2880
  %sub15 = sub nsw i32 0, %9, !dbg !2882
  store i32 %sub15, i32* %u32Temp2, align 4, !dbg !2883
  br label %if.end17, !dbg !2884

if.else16:                                        ; preds = %if.else10
  %10 = load i32, i32* %val2.addr, align 4, !dbg !2885
  store i32 %10, i32* %u32Temp2, align 4, !dbg !2887
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then14
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !2888
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2889
  %mul = mul i32 %11, %12, !dbg !2890
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2891
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2892
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2893
  %call18 = call i32 @MulHighWord(i32 %13, i32 %14), !dbg !2894
  store i32 %call18, i32* %u32Temp4, align 4, !dbg !2895
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2896
  %cmp19 = icmp eq i32 %15, 0, !dbg !2898
  br i1 %cmp19, label %if.then21, label %if.else36, !dbg !2899

if.then21:                                        ; preds = %if.end17
  %16 = load i8, i8* %u8SignBit, align 1, !dbg !2900
  %conv22 = zext i8 %16 to i32, !dbg !2900
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !2903
  br i1 %cmp23, label %if.then25, label %if.else30, !dbg !2904

if.then25:                                        ; preds = %if.then21
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2905
  %cmp26 = icmp ule i32 %17, 2147483647, !dbg !2908
  br i1 %cmp26, label %if.then28, label %if.else29, !dbg !2909

if.then28:                                        ; preds = %if.then25
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2910
  store i32 %18, i32* %retval, align 4, !dbg !2911
  br label %return, !dbg !2911

if.else29:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !2912
  br label %return, !dbg !2912

if.else30:                                        ; preds = %if.then21
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2913
  %cmp31 = icmp ule i32 %19, -2147483648, !dbg !2916
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !2917

if.then33:                                        ; preds = %if.else30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2918
  %sub34 = sub i32 0, %20, !dbg !2919
  store i32 %sub34, i32* %retval, align 4, !dbg !2920
  br label %return, !dbg !2920

if.else35:                                        ; preds = %if.else30
  store i32 -2147483648, i32* %retval, align 4, !dbg !2921
  br label %return, !dbg !2921

if.else36:                                        ; preds = %if.end17
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !2922
  %conv37 = zext i8 %21 to i32, !dbg !2922
  %cmp38 = icmp eq i32 %conv37, 0, !dbg !2925
  br i1 %cmp38, label %if.then40, label %if.else41, !dbg !2926

if.then40:                                        ; preds = %if.else36
  store i32 2147483647, i32* %retval, align 4, !dbg !2927
  br label %return, !dbg !2927

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !2929
  br label %return, !dbg !2929

return:                                           ; preds = %if.else41, %if.then40, %if.else35, %if.then33, %if.else29, %if.then28, %if.end8
  %22 = load i32, i32* %retval, align 4, !dbg !2931
  ret i32 %22, !dbg !2931
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2932 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2935, metadata !DIExpression()), !dbg !2936
  %0 = load i64, i64* %value.addr, align 8, !dbg !2937
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2938
  %conv = zext i1 %cmp to i32, !dbg !2938
  ret i32 %conv, !dbg !2939
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2940 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2941, metadata !DIExpression()), !dbg !2942
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2943, metadata !DIExpression()), !dbg !2944
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2945, metadata !DIExpression()), !dbg !2946
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2947, metadata !DIExpression()), !dbg !2948
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2949, metadata !DIExpression()), !dbg !2950
  %0 = load i32, i32* %value.addr, align 4, !dbg !2951
  %cmp = icmp slt i32 %0, 0, !dbg !2953
  br i1 %cmp, label %if.then, label %if.else, !dbg !2954

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2955
  %sub = sub nsw i32 0, %1, !dbg !2957
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2958
  store i8 1, i8* %u8SignBit, align 1, !dbg !2959
  br label %if.end, !dbg !2960

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2961
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2963
  store i8 0, i8* %u8SignBit, align 1, !dbg !2964
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2965
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2966
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2967
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2968
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2969
  %shr = lshr i32 %5, 1, !dbg !2970
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2971
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2972
  %conv = zext i8 %6 to i32, !dbg !2972
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2974
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2975

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2976
  store i32 %7, i32* %retval, align 4, !dbg !2978
  br label %return, !dbg !2978

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2979
  %sub5 = sub i32 0, %8, !dbg !2981
  store i32 %sub5, i32* %retval, align 4, !dbg !2982
  br label %return, !dbg !2982

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2983
  ret i32 %9, !dbg !2983
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2984 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2985, metadata !DIExpression()), !dbg !2986
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2987, metadata !DIExpression()), !dbg !2988
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2989, metadata !DIExpression()), !dbg !2990
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2991, metadata !DIExpression()), !dbg !2992
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2993, metadata !DIExpression()), !dbg !2994
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2995, metadata !DIExpression()), !dbg !2996
  %0 = load i32, i32* %value.addr, align 4, !dbg !2997
  %cmp = icmp slt i32 %0, 0, !dbg !2999
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3000
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !3000

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3001
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3002
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3003
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3003

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3004
  br label %if.end, !dbg !3006

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3007
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3009
  %cmp5 = icmp slt i32 %4, 0, !dbg !3011
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3012

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3013
  %sub = sub nsw i32 0, %5, !dbg !3015
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3016
  br label %if.end8, !dbg !3017

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3018
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3020
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3021
  %cmp9 = icmp slt i32 %7, 0, !dbg !3023
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3024

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3025
  %sub11 = sub nsw i32 0, %8, !dbg !3027
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3028
  br label %if.end13, !dbg !3029

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3030
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3032
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3033
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3034
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3035
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3036
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3037
  %conv = zext i8 %12 to i32, !dbg !3037
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3039
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3040

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3041
  store i32 %13, i32* %retval, align 4, !dbg !3043
  br label %return, !dbg !3043

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3044
  %sub18 = sub i32 0, %14, !dbg !3046
  store i32 %sub18, i32* %retval, align 4, !dbg !3047
  br label %return, !dbg !3047

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3048
  ret i32 %15, !dbg !3048
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3049 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3052, metadata !DIExpression()), !dbg !3053
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3054, metadata !DIExpression()), !dbg !3055
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3056, metadata !DIExpression()), !dbg !3057
  store i32 0, i32* %u32Temp1, align 4, !dbg !3057
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3058, metadata !DIExpression()), !dbg !3059
  store i32 0, i32* %u32Temp2, align 4, !dbg !3059
  %0 = load i32, i32* %value.addr, align 4, !dbg !3060
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3061
  %conv = zext i8 %1 to i32, !dbg !3061
  %mul = mul i32 %0, %conv, !dbg !3062
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3063
  %2 = load i32, i32* %value.addr, align 4, !dbg !3064
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3065
  %conv1 = zext i8 %3 to i32, !dbg !3065
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3066
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3067
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3068
  %shr = lshr i32 %4, 8, !dbg !3069
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3070
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3071
  %shl = shl i32 %5, 24, !dbg !3072
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3073
  %or = or i32 %6, %shl, !dbg !3073
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3073
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3074
  ret i32 %7, !dbg !3075
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3076 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3077, metadata !DIExpression()), !dbg !3078
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3079, metadata !DIExpression()), !dbg !3080
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3081, metadata !DIExpression()), !dbg !3082
  store i32 0, i32* %u32Temp1, align 4, !dbg !3082
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3083, metadata !DIExpression()), !dbg !3084
  store i32 0, i32* %u32Temp2, align 4, !dbg !3084
  %0 = load i32, i32* %value.addr, align 4, !dbg !3085
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3086
  %conv = zext i8 %1 to i32, !dbg !3086
  %mul = mul i32 %0, %conv, !dbg !3087
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3088
  %2 = load i32, i32* %value.addr, align 4, !dbg !3089
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3090
  %conv1 = zext i8 %3 to i32, !dbg !3090
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3091
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3092
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3093
  %shr = lshr i32 %4, 7, !dbg !3094
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3095
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3096
  %shl = shl i32 %5, 25, !dbg !3097
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3098
  %or = or i32 %6, %shl, !dbg !3098
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3098
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3099
  %shr2 = lshr i32 %7, 7, !dbg !3101
  %cmp = icmp eq i32 %shr2, 0, !dbg !3102
  br i1 %cmp, label %if.then, label %if.else, !dbg !3103

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3104
  store i32 %8, i32* %retval, align 4, !dbg !3106
  br label %return, !dbg !3106

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3107
  br label %return, !dbg !3107

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3109
  ret i32 %9, !dbg !3109
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3110 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3113, metadata !DIExpression()), !dbg !3114
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3115, metadata !DIExpression()), !dbg !3116
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3117, metadata !DIExpression()), !dbg !3118
  store i32 0, i32* %u32Temp1, align 4, !dbg !3118
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3119, metadata !DIExpression()), !dbg !3120
  store i32 0, i32* %u32Temp2, align 4, !dbg !3120
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3121
  %conv = sext i8 %0 to i32, !dbg !3121
  %cmp = icmp sgt i32 %conv, 0, !dbg !3123
  br i1 %cmp, label %if.then, label %if.else, !dbg !3124

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3125
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3127
  %conv2 = sext i8 %2 to i32, !dbg !3127
  %mul = mul i32 %1, %conv2, !dbg !3128
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3129
  %3 = load i32, i32* %value.addr, align 4, !dbg !3130
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3131
  %conv3 = sext i8 %4 to i32, !dbg !3131
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3132
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3133
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3134
  %shr = lshr i32 %5, 7, !dbg !3135
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3136
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3137
  %shl = shl i32 %6, 25, !dbg !3138
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3139
  %or = or i32 %7, %shl, !dbg !3139
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3139
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3140
  store i32 %8, i32* %retval, align 4, !dbg !3141
  br label %return, !dbg !3141

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3142
  br label %return, !dbg !3142

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3144
  ret i32 %9, !dbg !3144
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3145 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3146, metadata !DIExpression()), !dbg !3147
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3148, metadata !DIExpression()), !dbg !3149
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3150, metadata !DIExpression()), !dbg !3151
  store i32 0, i32* %u32Temp1, align 4, !dbg !3151
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3152, metadata !DIExpression()), !dbg !3153
  store i32 0, i32* %u32Temp2, align 4, !dbg !3153
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3154
  %conv = sext i8 %0 to i32, !dbg !3154
  %cmp = icmp sle i32 %conv, 0, !dbg !3156
  br i1 %cmp, label %if.then, label %if.else, !dbg !3157

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3158
  br label %return, !dbg !3158

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3160
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3162
  %conv2 = sext i8 %2 to i32, !dbg !3162
  %mul = mul i32 %1, %conv2, !dbg !3163
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3164
  %3 = load i32, i32* %value.addr, align 4, !dbg !3165
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3166
  %conv3 = sext i8 %4 to i32, !dbg !3166
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3167
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3168
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3169
  %shr = lshr i32 %5, 6, !dbg !3170
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3171
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3172
  %shl = shl i32 %6, 26, !dbg !3173
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3174
  %or = or i32 %7, %shl, !dbg !3174
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3174
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3175
  %shr4 = lshr i32 %8, 6, !dbg !3177
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3178
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3179

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3180
  store i32 %9, i32* %retval, align 4, !dbg !3182
  br label %return, !dbg !3182

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3183
  br label %return, !dbg !3183

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3185
  ret i32 %10, !dbg !3185
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3186 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3187, metadata !DIExpression()), !dbg !3188
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3189, metadata !DIExpression()), !dbg !3190
  %0 = load i16, i16* %value.addr, align 2, !dbg !3191
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3192
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3193
  ret i16 %call, !dbg !3194
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3195 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3196, metadata !DIExpression()), !dbg !3197
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3198, metadata !DIExpression()), !dbg !3199
  %0 = load i16, i16* %value.addr, align 2, !dbg !3200
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3201
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3202
  ret i16 %call, !dbg !3203
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3204 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3205, metadata !DIExpression()), !dbg !3206
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3207, metadata !DIExpression()), !dbg !3208
  %0 = load i16, i16* %value.addr, align 2, !dbg !3209
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3210
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3211
  ret i16 %call, !dbg !3212
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3213 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3214, metadata !DIExpression()), !dbg !3215
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3216, metadata !DIExpression()), !dbg !3217
  %0 = load i16, i16* %value.addr, align 2, !dbg !3218
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3219
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3220
  ret i16 %call, !dbg !3221
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3222 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3223, metadata !DIExpression()), !dbg !3224
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3225, metadata !DIExpression()), !dbg !3226
  %0 = load i16, i16* %value.addr, align 2, !dbg !3227
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3228
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3229
  ret i16 %call, !dbg !3230
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3231 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3232, metadata !DIExpression()), !dbg !3233
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3234, metadata !DIExpression()), !dbg !3235
  %0 = load i16, i16* %value.addr, align 2, !dbg !3236
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3237
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3238
  ret i16 %call, !dbg !3239
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3240 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3241, metadata !DIExpression()), !dbg !3242
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3243, metadata !DIExpression()), !dbg !3244
  %0 = load i16, i16* %value.addr, align 2, !dbg !3245
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3246
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3247
  ret i16 %call, !dbg !3248
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3249 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3250, metadata !DIExpression()), !dbg !3251
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3252, metadata !DIExpression()), !dbg !3253
  %0 = load i16, i16* %value.addr, align 2, !dbg !3254
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3255
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3256
  ret i16 %call, !dbg !3257
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3258 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3259, metadata !DIExpression()), !dbg !3260
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3261, metadata !DIExpression()), !dbg !3262
  %0 = load i16, i16* %value.addr, align 2, !dbg !3263
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3264
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3265
  ret i16 %call, !dbg !3266
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3267 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3268, metadata !DIExpression()), !dbg !3269
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3270, metadata !DIExpression()), !dbg !3271
  %0 = load i16, i16* %value.addr, align 2, !dbg !3272
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3273
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3274
  ret i16 %call, !dbg !3275
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3276 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3277, metadata !DIExpression()), !dbg !3278
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3279, metadata !DIExpression()), !dbg !3280
  %0 = load i16, i16* %value.addr, align 2, !dbg !3281
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3282
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3283
  ret i16 %call, !dbg !3284
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3285 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3286, metadata !DIExpression()), !dbg !3287
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3288, metadata !DIExpression()), !dbg !3289
  %0 = load i16, i16* %value.addr, align 2, !dbg !3290
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3291
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3292
  ret i16 %call, !dbg !3293
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3294 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3295, metadata !DIExpression()), !dbg !3296
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3297, metadata !DIExpression()), !dbg !3298
  %0 = load i16, i16* %value.addr, align 2, !dbg !3299
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3300
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3301
  ret i16 %call, !dbg !3302
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3303 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3304, metadata !DIExpression()), !dbg !3305
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3306, metadata !DIExpression()), !dbg !3307
  %0 = load i16, i16* %value.addr, align 2, !dbg !3308
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3309
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3310
  ret i16 %call, !dbg !3311
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3312 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3313, metadata !DIExpression()), !dbg !3314
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3315, metadata !DIExpression()), !dbg !3316
  %0 = load i16, i16* %value.addr, align 2, !dbg !3317
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3318
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3319
  ret i16 %call, !dbg !3320
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3321 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3322, metadata !DIExpression()), !dbg !3323
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3324, metadata !DIExpression()), !dbg !3325
  %0 = load i16, i16* %value.addr, align 2, !dbg !3326
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3327
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3328
  %2 = load i16, i16* %retval, align 2, !dbg !3329
  ret i16 %2, !dbg !3329
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3330 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3331, metadata !DIExpression()), !dbg !3332
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3333, metadata !DIExpression()), !dbg !3334
  %0 = load i16, i16* %value.addr, align 2, !dbg !3335
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3336
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3337
  ret i16 %call, !dbg !3338
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3339 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3340, metadata !DIExpression()), !dbg !3341
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3342, metadata !DIExpression()), !dbg !3343
  %0 = load i16, i16* %value.addr, align 2, !dbg !3344
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3345
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3346
  ret i16 %call, !dbg !3347
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3348 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3349, metadata !DIExpression()), !dbg !3350
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3351, metadata !DIExpression()), !dbg !3352
  %0 = load i16, i16* %value.addr, align 2, !dbg !3353
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3354
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3355
  ret i16 %call, !dbg !3356
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3357 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3358, metadata !DIExpression()), !dbg !3359
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3360, metadata !DIExpression()), !dbg !3361
  %0 = load i16, i16* %value.addr, align 2, !dbg !3362
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3363
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3364
  ret i16 %call, !dbg !3365
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3366 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3367, metadata !DIExpression()), !dbg !3368
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3369, metadata !DIExpression()), !dbg !3370
  %0 = load i16, i16* %value.addr, align 2, !dbg !3371
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3372
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3373
  ret i16 %call, !dbg !3374
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3375 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3376, metadata !DIExpression()), !dbg !3377
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3378, metadata !DIExpression()), !dbg !3379
  %0 = load i16, i16* %value.addr, align 2, !dbg !3380
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3381
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3382
  ret i16 %call, !dbg !3383
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3384 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3385, metadata !DIExpression()), !dbg !3386
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3387, metadata !DIExpression()), !dbg !3388
  %0 = load i16, i16* %value.addr, align 2, !dbg !3389
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3390
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3391
  ret i16 %call, !dbg !3392
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3393 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3394, metadata !DIExpression()), !dbg !3395
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3396, metadata !DIExpression()), !dbg !3397
  %0 = load i16, i16* %value.addr, align 2, !dbg !3398
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3399
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3400
  ret i16 %call, !dbg !3401
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3402 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3403, metadata !DIExpression()), !dbg !3404
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3405, metadata !DIExpression()), !dbg !3406
  %0 = load i16, i16* %value.addr, align 2, !dbg !3407
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3408
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3409
  ret i16 %call, !dbg !3410
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3411 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3412, metadata !DIExpression()), !dbg !3413
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3414, metadata !DIExpression()), !dbg !3415
  %0 = load i16, i16* %value.addr, align 2, !dbg !3416
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3417
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3418
  ret i16 %call, !dbg !3419
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3420 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3421, metadata !DIExpression()), !dbg !3422
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3423, metadata !DIExpression()), !dbg !3424
  %0 = load i16, i16* %value.addr, align 2, !dbg !3425
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3426
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3427
  ret i16 %call, !dbg !3428
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3429 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3430, metadata !DIExpression()), !dbg !3431
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3432, metadata !DIExpression()), !dbg !3433
  %0 = load i16, i16* %value.addr, align 2, !dbg !3434
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3435
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3436
  ret i16 %call, !dbg !3437
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3438 {
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
  %shl = shl i32 %conv1, 5, !dbg !3446
  %conv2 = trunc i32 %shl to i16, !dbg !3447
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3448
  ret i16 %call, !dbg !3449
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3450 {
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
  %shl = shl i32 %conv1, 6, !dbg !3458
  %conv2 = trunc i32 %shl to i16, !dbg !3459
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3460
  ret i16 %call, !dbg !3461
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3462 {
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
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3472
  ret i16 %call, !dbg !3473
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3474 {
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
  %shl = shl i32 %conv1, 7, !dbg !3482
  %conv2 = trunc i32 %shl to i16, !dbg !3483
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3484
  ret i16 %call, !dbg !3485
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3486 {
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
  %shl = shl i32 %conv1, 4, !dbg !3494
  %conv2 = trunc i32 %shl to i16, !dbg !3495
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3496
  ret i16 %call, !dbg !3497
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3498 {
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
  %shl = shl i32 %conv1, 5, !dbg !3506
  %conv2 = trunc i32 %shl to i16, !dbg !3507
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3508
  ret i16 %call, !dbg !3509
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3510 {
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
  %shl = shl i32 %conv1, 2, !dbg !3518
  %conv2 = trunc i32 %shl to i16, !dbg !3519
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3520
  ret i16 %call, !dbg !3521
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3522 {
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
  %shl = shl i32 %conv1, 6, !dbg !3530
  %conv2 = trunc i32 %shl to i16, !dbg !3531
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3532
  ret i16 %call, !dbg !3533
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3534 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3535, metadata !DIExpression()), !dbg !3536
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3537, metadata !DIExpression()), !dbg !3538
  %0 = load i16, i16* %value.addr, align 2, !dbg !3539
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3540
  %conv = zext i8 %1 to i16, !dbg !3541
  %conv1 = zext i16 %conv to i32, !dbg !3541
  %shl = shl i32 %conv1, 3, !dbg !3542
  %conv2 = trunc i32 %shl to i16, !dbg !3543
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3544
  ret i16 %call, !dbg !3545
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3546 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3547, metadata !DIExpression()), !dbg !3548
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3549, metadata !DIExpression()), !dbg !3550
  %0 = load i32, i32* %value.addr, align 4, !dbg !3551
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3552
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3553
  ret i32 %call, !dbg !3554
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3555 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3558, metadata !DIExpression()), !dbg !3559
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3560, metadata !DIExpression()), !dbg !3561
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3562, metadata !DIExpression()), !dbg !3563
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3564, metadata !DIExpression()), !dbg !3565
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3566, metadata !DIExpression()), !dbg !3567
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3568, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3570, metadata !DIExpression()), !dbg !3571
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3572, metadata !DIExpression()), !dbg !3573
  %0 = load i32, i32* %value.addr, align 4, !dbg !3574
  %cmp = icmp slt i32 %0, 0, !dbg !3576
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3577

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3578
  %conv = sext i16 %1 to i32, !dbg !3578
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3579
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3580

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3581
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3582
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3583

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3584
  %conv6 = sext i16 %3 to i32, !dbg !3584
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3585
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3586

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3587
  br label %if.end, !dbg !3589

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3590
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3592
  %cmp9 = icmp slt i32 %4, 0, !dbg !3594
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3595

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3596
  %sub = sub nsw i32 0, %5, !dbg !3598
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3599
  br label %if.end13, !dbg !3600

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3601
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3603
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3604
  %conv14 = sext i16 %7 to i32, !dbg !3604
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3606
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3607

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3608
  %conv18 = sext i16 %8 to i32, !dbg !3608
  %sub19 = sub nsw i32 0, %conv18, !dbg !3610
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3611
  br label %if.end22, !dbg !3612

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3613
  %conv21 = sext i16 %9 to i32, !dbg !3613
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3615
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3616
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3617
  %mul = mul i32 %10, %11, !dbg !3618
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3619
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3620
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3621
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3622
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3623
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3624
  %15 = load i32, i32* %count.addr, align 4, !dbg !3625
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3626
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3626
  %shr = lshr i32 %14, %15, !dbg !3626, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3627
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3628
  %17 = load i32, i32* %count.addr, align 4, !dbg !3629
  %sub23 = sub i32 32, %17, !dbg !3630
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3631
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3631
  %shl = shl i32 %16, %sub23, !dbg !3631, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3632
  %or = or i32 %18, %shl, !dbg !3632
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3632
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3633
  %20 = load i32, i32* %count.addr, align 4, !dbg !3635
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3636
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3636
  %shr24 = lshr i32 %19, %20, !dbg !3636, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3637
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3638

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3639
  %conv28 = zext i8 %21 to i32, !dbg !3639
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3642
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3643

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3644
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3647
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3648

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3649
  store i32 %23, i32* %retval, align 4, !dbg !3650
  br label %return, !dbg !3650

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3651
  br label %return, !dbg !3651

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3652
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3655
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3656

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3657
  %sub40 = sub i32 0, %25, !dbg !3658
  store i32 %sub40, i32* %retval, align 4, !dbg !3659
  br label %return, !dbg !3659

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3660
  br label %return, !dbg !3660

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3661
  br label %return, !dbg !3661

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3663
  ret i32 %26, !dbg !3663
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3664 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3665, metadata !DIExpression()), !dbg !3666
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3667, metadata !DIExpression()), !dbg !3668
  %0 = load i32, i32* %value.addr, align 4, !dbg !3669
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3670
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3671
  ret i32 %call, !dbg !3672
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3673 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3676, metadata !DIExpression()), !dbg !3677
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3678, metadata !DIExpression()), !dbg !3679
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3680, metadata !DIExpression()), !dbg !3681
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3682, metadata !DIExpression()), !dbg !3683
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3684, metadata !DIExpression()), !dbg !3685
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3686, metadata !DIExpression()), !dbg !3687
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3688, metadata !DIExpression()), !dbg !3689
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3690, metadata !DIExpression()), !dbg !3691
  %0 = load i32, i32* %value.addr, align 4, !dbg !3692
  %cmp = icmp slt i32 %0, 0, !dbg !3694
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3695

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3696
  %conv = sext i8 %1 to i32, !dbg !3696
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3697
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3698

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3699
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3700
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3701

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3702
  %conv6 = sext i8 %3 to i32, !dbg !3702
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3703
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3704

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3705
  br label %if.end, !dbg !3707

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3708
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3710
  %cmp9 = icmp slt i32 %4, 0, !dbg !3712
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3713

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3714
  %sub = sub nsw i32 0, %5, !dbg !3716
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3717
  br label %if.end13, !dbg !3718

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3719
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3721
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3722
  %conv14 = sext i8 %7 to i32, !dbg !3722
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3724
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3725

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3726
  %conv18 = sext i8 %8 to i32, !dbg !3726
  %sub19 = sub nsw i32 0, %conv18, !dbg !3728
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3729
  br label %if.end22, !dbg !3730

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3731
  %conv21 = sext i8 %9 to i32, !dbg !3731
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3733
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3734
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3735
  %mul = mul i32 %10, %11, !dbg !3736
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3737
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3738
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3739
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3740
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3741
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3742
  %15 = load i32, i32* %count.addr, align 4, !dbg !3743
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3744
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3744
  %shr = lshr i32 %14, %15, !dbg !3744, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3745
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3746
  %17 = load i32, i32* %count.addr, align 4, !dbg !3747
  %sub23 = sub i32 32, %17, !dbg !3748
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3749
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3749
  %shl = shl i32 %16, %sub23, !dbg !3749, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3750
  %or = or i32 %18, %shl, !dbg !3750
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3750
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3751
  %20 = load i32, i32* %count.addr, align 4, !dbg !3753
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3754
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3754
  %shr24 = lshr i32 %19, %20, !dbg !3754, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3755
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3756

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3757
  %conv28 = zext i8 %21 to i32, !dbg !3757
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3760
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3761

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3762
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3765
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3766

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3767
  store i32 %23, i32* %retval, align 4, !dbg !3768
  br label %return, !dbg !3768

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3769
  br label %return, !dbg !3769

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3770
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3773
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3774

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3775
  %sub40 = sub i32 0, %25, !dbg !3776
  store i32 %sub40, i32* %retval, align 4, !dbg !3777
  br label %return, !dbg !3777

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3778
  br label %return, !dbg !3778

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3779
  br label %return, !dbg !3779

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3781
  ret i32 %26, !dbg !3781
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3782 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3783, metadata !DIExpression()), !dbg !3784
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3785, metadata !DIExpression()), !dbg !3786
  %0 = load i32, i32* %value.addr, align 4, !dbg !3787
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3788
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3789
  ret i32 %call, !dbg !3790
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3791 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3794, metadata !DIExpression()), !dbg !3795
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3796, metadata !DIExpression()), !dbg !3797
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3798, metadata !DIExpression()), !dbg !3799
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3800, metadata !DIExpression()), !dbg !3801
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3802, metadata !DIExpression()), !dbg !3803
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3804, metadata !DIExpression()), !dbg !3805
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3806, metadata !DIExpression()), !dbg !3807
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3808, metadata !DIExpression()), !dbg !3809
  %0 = load i32, i32* %value.addr, align 4, !dbg !3810
  %cmp = icmp slt i32 %0, 0, !dbg !3812
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3813

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3814
  %conv = zext i16 %1 to i32, !dbg !3814
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3815
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3816

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3817
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3818
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3819

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3820
  %conv6 = zext i16 %3 to i32, !dbg !3820
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3821
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3822

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3823
  br label %if.end, !dbg !3825

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3826
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3828
  %cmp9 = icmp slt i32 %4, 0, !dbg !3830
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3831

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3832
  %sub = sub nsw i32 0, %5, !dbg !3834
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3835
  br label %if.end13, !dbg !3836

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3837
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3839
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3840
  %conv14 = zext i16 %7 to i32, !dbg !3840
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3842
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3843

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3844
  %conv18 = zext i16 %8 to i32, !dbg !3844
  %sub19 = sub nsw i32 0, %conv18, !dbg !3846
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3847
  br label %if.end22, !dbg !3848

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3849
  %conv21 = zext i16 %9 to i32, !dbg !3849
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3851
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3852
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3853
  %mul = mul i32 %10, %11, !dbg !3854
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3855
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3856
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3857
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3858
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3859
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3860
  %15 = load i32, i32* %count.addr, align 4, !dbg !3861
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3862
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3862
  %shr = lshr i32 %14, %15, !dbg !3862, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3863
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3864
  %17 = load i32, i32* %count.addr, align 4, !dbg !3865
  %sub23 = sub i32 32, %17, !dbg !3866
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3867
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3867
  %shl = shl i32 %16, %sub23, !dbg !3867, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3868
  %or = or i32 %18, %shl, !dbg !3868
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3868
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3869
  %20 = load i32, i32* %count.addr, align 4, !dbg !3871
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3872
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3872
  %shr24 = lshr i32 %19, %20, !dbg !3872, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3873
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3874

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3875
  %conv28 = zext i8 %21 to i32, !dbg !3875
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3878
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3879

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3880
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3883
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3884

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3885
  store i32 %23, i32* %retval, align 4, !dbg !3886
  br label %return, !dbg !3886

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3887
  br label %return, !dbg !3887

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3888
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3891
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3892

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3893
  %sub40 = sub i32 0, %25, !dbg !3894
  store i32 %sub40, i32* %retval, align 4, !dbg !3895
  br label %return, !dbg !3895

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3896
  br label %return, !dbg !3896

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3897
  br label %return, !dbg !3897

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3899
  ret i32 %26, !dbg !3899
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3900 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3901, metadata !DIExpression()), !dbg !3902
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3903, metadata !DIExpression()), !dbg !3904
  %0 = load i32, i32* %value.addr, align 4, !dbg !3905
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3906
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3907
  ret i32 %call, !dbg !3908
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3909 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3912, metadata !DIExpression()), !dbg !3913
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3914, metadata !DIExpression()), !dbg !3915
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3916, metadata !DIExpression()), !dbg !3917
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3918, metadata !DIExpression()), !dbg !3919
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3920, metadata !DIExpression()), !dbg !3921
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3922, metadata !DIExpression()), !dbg !3923
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3924, metadata !DIExpression()), !dbg !3925
  %0 = load i32, i32* %value.addr, align 4, !dbg !3926
  %cmp = icmp slt i32 %0, 0, !dbg !3928
  br i1 %cmp, label %if.then, label %if.else, !dbg !3929

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3930
  %1 = load i32, i32* %value.addr, align 4, !dbg !3932
  %sub = sub nsw i32 0, %1, !dbg !3933
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3934
  br label %if.end, !dbg !3935

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3936
  %2 = load i32, i32* %value.addr, align 4, !dbg !3938
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3939
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3940
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3941
  %conv = zext i8 %4 to i32, !dbg !3941
  %mul = mul i32 %3, %conv, !dbg !3942
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3943
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3944
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3945
  %conv1 = zext i8 %6 to i32, !dbg !3945
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3946
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3947
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3948
  %8 = load i32, i32* %count.addr, align 4, !dbg !3949
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3950
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3950
  %shr = lshr i32 %7, %8, !dbg !3950, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3951
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3952
  %10 = load i32, i32* %count.addr, align 4, !dbg !3953
  %sub2 = sub i32 32, %10, !dbg !3954
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3955
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3955
  %shl = shl i32 %9, %sub2, !dbg !3955, !klee.check.shift !261
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3956
  %or = or i32 %11, %shl, !dbg !3956
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3956
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3957
  %13 = load i32, i32* %count.addr, align 4, !dbg !3959
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3960
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3960
  %shr3 = lshr i32 %12, %13, !dbg !3960, !klee.check.shift !261
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3961
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3962

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3963
  %conv7 = zext i8 %14 to i32, !dbg !3963
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3966
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3967

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3968
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3971
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3972

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3973
  store i32 %16, i32* %retval, align 4, !dbg !3974
  br label %return, !dbg !3974

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3975
  br label %return, !dbg !3975

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3976
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3979
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3980

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3981
  %sub19 = sub i32 0, %18, !dbg !3983
  store i32 %sub19, i32* %retval, align 4, !dbg !3984
  br label %return, !dbg !3984

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3985
  br label %return, !dbg !3985

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3987
  %conv22 = zext i8 %19 to i32, !dbg !3987
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3990
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3991

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3992
  br label %return, !dbg !3992

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3994
  br label %return, !dbg !3994

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3996
  ret i32 %20, !dbg !3996
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3997 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3998, metadata !DIExpression()), !dbg !3999
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4000, metadata !DIExpression()), !dbg !4001
  %0 = load i8, i8* %value.addr, align 1, !dbg !4002
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4003
  %conv = zext i8 %1 to i16, !dbg !4004
  %conv1 = zext i16 %conv to i32, !dbg !4004
  %shl = shl i32 %conv1, 5, !dbg !4005
  %conv2 = trunc i32 %shl to i16, !dbg !4006
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4007
  ret i8 %call, !dbg !4008
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4009 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4010, metadata !DIExpression()), !dbg !4011
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4012, metadata !DIExpression()), !dbg !4013
  %0 = load i8, i8* %value.addr, align 1, !dbg !4014
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4015
  %conv = zext i8 %1 to i16, !dbg !4016
  %conv1 = zext i16 %conv to i32, !dbg !4016
  %shl = shl i32 %conv1, 6, !dbg !4017
  %conv2 = trunc i32 %shl to i16, !dbg !4018
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4019
  ret i8 %call, !dbg !4020
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4021 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4022, metadata !DIExpression()), !dbg !4023
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4024, metadata !DIExpression()), !dbg !4025
  %0 = load i8, i8* %value.addr, align 1, !dbg !4026
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4027
  %conv = zext i8 %1 to i16, !dbg !4028
  %conv1 = zext i16 %conv to i32, !dbg !4028
  %shl = shl i32 %conv1, 7, !dbg !4029
  %conv2 = trunc i32 %shl to i16, !dbg !4030
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4031
  ret i8 %call, !dbg !4032
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4033 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4034, metadata !DIExpression()), !dbg !4035
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4036, metadata !DIExpression()), !dbg !4037
  %0 = load i8, i8* %value.addr, align 1, !dbg !4038
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4039
  %conv = zext i8 %1 to i16, !dbg !4040
  %conv1 = zext i16 %conv to i32, !dbg !4040
  %shl = shl i32 %conv1, 7, !dbg !4041
  %conv2 = trunc i32 %shl to i16, !dbg !4042
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4043
  ret i8 %call, !dbg !4044
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4045 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4046, metadata !DIExpression()), !dbg !4047
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4048, metadata !DIExpression()), !dbg !4049
  %0 = load i8, i8* %value.addr, align 1, !dbg !4050
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4051
  %conv = zext i8 %1 to i16, !dbg !4052
  %conv1 = zext i16 %conv to i32, !dbg !4052
  %shl = shl i32 %conv1, 4, !dbg !4053
  %conv2 = trunc i32 %shl to i16, !dbg !4054
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4055
  ret i8 %call, !dbg !4056
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4057 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4058, metadata !DIExpression()), !dbg !4059
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4060, metadata !DIExpression()), !dbg !4061
  %0 = load i8, i8* %value.addr, align 1, !dbg !4062
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4063
  %conv = zext i8 %1 to i16, !dbg !4064
  %conv1 = zext i16 %conv to i32, !dbg !4064
  %shl = shl i32 %conv1, 5, !dbg !4065
  %conv2 = trunc i32 %shl to i16, !dbg !4066
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4067
  ret i8 %call, !dbg !4068
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4069 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4070, metadata !DIExpression()), !dbg !4071
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4072, metadata !DIExpression()), !dbg !4073
  %0 = load i8, i8* %value.addr, align 1, !dbg !4074
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4075
  %conv = zext i8 %1 to i16, !dbg !4076
  %conv1 = zext i16 %conv to i32, !dbg !4076
  %shl = shl i32 %conv1, 2, !dbg !4077
  %conv2 = trunc i32 %shl to i16, !dbg !4078
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4079
  ret i8 %call, !dbg !4080
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4081 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4082, metadata !DIExpression()), !dbg !4083
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4084, metadata !DIExpression()), !dbg !4085
  %0 = load i8, i8* %value.addr, align 1, !dbg !4086
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4087
  %conv = zext i8 %1 to i16, !dbg !4088
  %conv1 = zext i16 %conv to i32, !dbg !4088
  %shl = shl i32 %conv1, 6, !dbg !4089
  %conv2 = trunc i32 %shl to i16, !dbg !4090
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4091
  ret i8 %call, !dbg !4092
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4093 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4094, metadata !DIExpression()), !dbg !4095
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4096, metadata !DIExpression()), !dbg !4097
  %0 = load i8, i8* %value.addr, align 1, !dbg !4098
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4099
  %conv = zext i8 %1 to i16, !dbg !4100
  %conv1 = zext i16 %conv to i32, !dbg !4100
  %shl = shl i32 %conv1, 3, !dbg !4101
  %conv2 = trunc i32 %shl to i16, !dbg !4102
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4103
  ret i8 %call, !dbg !4104
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4105 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4106, metadata !DIExpression()), !dbg !4107
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4108, metadata !DIExpression()), !dbg !4109
  %0 = load i16, i16* %value.addr, align 2, !dbg !4110
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4111
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4112
  ret i16 %call, !dbg !4113
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4114 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4115, metadata !DIExpression()), !dbg !4116
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4117, metadata !DIExpression()), !dbg !4118
  %0 = load i16, i16* %value.addr, align 2, !dbg !4119
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4120
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4121
  ret i16 %call, !dbg !4122
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4123 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4124, metadata !DIExpression()), !dbg !4125
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4126, metadata !DIExpression()), !dbg !4127
  %0 = load i16, i16* %value.addr, align 2, !dbg !4128
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4129
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4130
  ret i16 %call, !dbg !4131
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4132 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4133, metadata !DIExpression()), !dbg !4134
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4135, metadata !DIExpression()), !dbg !4136
  %0 = load i16, i16* %value.addr, align 2, !dbg !4137
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4138
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4139
  ret i16 %call, !dbg !4140
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4141 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4142, metadata !DIExpression()), !dbg !4143
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4144, metadata !DIExpression()), !dbg !4145
  %0 = load i16, i16* %value.addr, align 2, !dbg !4146
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4147
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4148
  ret i16 %call, !dbg !4149
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4150 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4151, metadata !DIExpression()), !dbg !4152
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4153, metadata !DIExpression()), !dbg !4154
  %0 = load i16, i16* %value.addr, align 2, !dbg !4155
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4156
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4157
  ret i16 %call, !dbg !4158
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4159 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4160, metadata !DIExpression()), !dbg !4161
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4162, metadata !DIExpression()), !dbg !4163
  %0 = load i16, i16* %value.addr, align 2, !dbg !4164
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4165
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4166
  ret i16 %call, !dbg !4167
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4168 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4169, metadata !DIExpression()), !dbg !4170
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4171, metadata !DIExpression()), !dbg !4172
  %0 = load i16, i16* %value.addr, align 2, !dbg !4173
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4174
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4175
  ret i16 %call, !dbg !4176
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4177 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4178, metadata !DIExpression()), !dbg !4179
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4180, metadata !DIExpression()), !dbg !4181
  %0 = load i16, i16* %value.addr, align 2, !dbg !4182
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4183
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4184
  ret i16 %call, !dbg !4185
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4186 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4187, metadata !DIExpression()), !dbg !4188
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4189, metadata !DIExpression()), !dbg !4190
  %0 = load i16, i16* %value.addr, align 2, !dbg !4191
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4192
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4193
  ret i16 %call, !dbg !4194
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4195 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4196, metadata !DIExpression()), !dbg !4197
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4198, metadata !DIExpression()), !dbg !4199
  %0 = load i16, i16* %value.addr, align 2, !dbg !4200
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4201
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4202
  ret i16 %call, !dbg !4203
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4204 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4205, metadata !DIExpression()), !dbg !4206
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4207, metadata !DIExpression()), !dbg !4208
  %0 = load i16, i16* %value.addr, align 2, !dbg !4209
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4210
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4211
  ret i16 %call, !dbg !4212
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4213 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4214, metadata !DIExpression()), !dbg !4215
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4216, metadata !DIExpression()), !dbg !4217
  %0 = load i16, i16* %value.addr, align 2, !dbg !4218
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4219
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4220
  ret i16 %call, !dbg !4221
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4222 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4223, metadata !DIExpression()), !dbg !4224
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4225, metadata !DIExpression()), !dbg !4226
  %0 = load i16, i16* %value.addr, align 2, !dbg !4227
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4228
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4229
  ret i16 %call, !dbg !4230
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4231 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4232, metadata !DIExpression()), !dbg !4233
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4234, metadata !DIExpression()), !dbg !4235
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4236
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4237
  %conv = zext i8 %1 to i16, !dbg !4238
  %conv1 = zext i16 %conv to i32, !dbg !4238
  %shl = shl i32 %conv1, 5, !dbg !4239
  %conv2 = trunc i32 %shl to i16, !dbg !4240
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4241
  ret i16 %call, !dbg !4242
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4243 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4244, metadata !DIExpression()), !dbg !4245
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4246, metadata !DIExpression()), !dbg !4247
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4248
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4249
  %conv = zext i8 %1 to i16, !dbg !4250
  %conv1 = zext i16 %conv to i32, !dbg !4250
  %shl = shl i32 %conv1, 6, !dbg !4251
  %conv2 = trunc i32 %shl to i16, !dbg !4252
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4253
  ret i16 %call, !dbg !4254
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4255 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4256, metadata !DIExpression()), !dbg !4257
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4258, metadata !DIExpression()), !dbg !4259
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4260
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4261
  %conv = zext i8 %1 to i16, !dbg !4262
  %conv1 = zext i16 %conv to i32, !dbg !4262
  %shl = shl i32 %conv1, 7, !dbg !4263
  %conv2 = trunc i32 %shl to i16, !dbg !4264
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4265
  ret i16 %call, !dbg !4266
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4267 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4268, metadata !DIExpression()), !dbg !4269
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4270, metadata !DIExpression()), !dbg !4271
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4272
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4273
  %conv = zext i8 %1 to i16, !dbg !4274
  %conv1 = zext i16 %conv to i32, !dbg !4274
  %shl = shl i32 %conv1, 7, !dbg !4275
  %conv2 = trunc i32 %shl to i16, !dbg !4276
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4277
  ret i16 %call, !dbg !4278
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4279 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4280, metadata !DIExpression()), !dbg !4281
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4282, metadata !DIExpression()), !dbg !4283
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4284
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4285
  %conv = zext i8 %1 to i16, !dbg !4286
  %conv1 = zext i16 %conv to i32, !dbg !4286
  %shl = shl i32 %conv1, 4, !dbg !4287
  %conv2 = trunc i32 %shl to i16, !dbg !4288
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4289
  ret i16 %call, !dbg !4290
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4291 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4292, metadata !DIExpression()), !dbg !4293
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4294, metadata !DIExpression()), !dbg !4295
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4296
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4297
  %conv = zext i8 %1 to i16, !dbg !4298
  %conv1 = zext i16 %conv to i32, !dbg !4298
  %shl = shl i32 %conv1, 5, !dbg !4299
  %conv2 = trunc i32 %shl to i16, !dbg !4300
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4301
  ret i16 %call, !dbg !4302
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4303 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4304, metadata !DIExpression()), !dbg !4305
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4306, metadata !DIExpression()), !dbg !4307
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4308
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4309
  %conv = zext i8 %1 to i16, !dbg !4310
  %conv1 = zext i16 %conv to i32, !dbg !4310
  %shl = shl i32 %conv1, 2, !dbg !4311
  %conv2 = trunc i32 %shl to i16, !dbg !4312
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4313
  ret i16 %call, !dbg !4314
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4315 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4316, metadata !DIExpression()), !dbg !4317
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4318, metadata !DIExpression()), !dbg !4319
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4320
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4321
  %conv = zext i8 %1 to i16, !dbg !4322
  %conv1 = zext i16 %conv to i32, !dbg !4322
  %shl = shl i32 %conv1, 6, !dbg !4323
  %conv2 = trunc i32 %shl to i16, !dbg !4324
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4325
  ret i16 %call, !dbg !4326
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4327 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4328, metadata !DIExpression()), !dbg !4329
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4330, metadata !DIExpression()), !dbg !4331
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4332
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4333
  %conv = zext i8 %1 to i16, !dbg !4334
  %conv1 = zext i16 %conv to i32, !dbg !4334
  %shl = shl i32 %conv1, 3, !dbg !4335
  %conv2 = trunc i32 %shl to i16, !dbg !4336
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4337
  ret i16 %call, !dbg !4338
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4339 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4340, metadata !DIExpression()), !dbg !4341
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4342, metadata !DIExpression()), !dbg !4343
  %0 = load i32, i32* %value.addr, align 4, !dbg !4344
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4345
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4346
  ret i32 %call, !dbg !4347
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4348 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4351, metadata !DIExpression()), !dbg !4352
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4353, metadata !DIExpression()), !dbg !4354
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4355, metadata !DIExpression()), !dbg !4356
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4357, metadata !DIExpression()), !dbg !4358
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4359, metadata !DIExpression()), !dbg !4360
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4361, metadata !DIExpression()), !dbg !4362
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4363, metadata !DIExpression()), !dbg !4364
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4365
  %conv = sext i16 %0 to i32, !dbg !4365
  %cmp = icmp slt i32 %conv, 0, !dbg !4367
  br i1 %cmp, label %if.then, label %if.else, !dbg !4368

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4369
  br label %if.end, !dbg !4371

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4372
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4374
  %conv2 = sext i16 %1 to i32, !dbg !4374
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4376
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4377

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4378
  %conv6 = sext i16 %2 to i32, !dbg !4378
  %sub = sub nsw i32 0, %conv6, !dbg !4380
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4381
  br label %if.end9, !dbg !4382

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4383
  %conv8 = sext i16 %3 to i32, !dbg !4383
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4385
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4386
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4387
  %mul = mul i32 %4, %5, !dbg !4388
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4389
  %6 = load i32, i32* %value.addr, align 4, !dbg !4390
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4391
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4392
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4393
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4394
  %9 = load i32, i32* %count.addr, align 4, !dbg !4395
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4396
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4396
  %shr = lshr i32 %8, %9, !dbg !4396, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4397
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4398
  %11 = load i32, i32* %count.addr, align 4, !dbg !4399
  %sub10 = sub i32 32, %11, !dbg !4400
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4401
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4401
  %shl = shl i32 %10, %sub10, !dbg !4401, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4402
  %or = or i32 %12, %shl, !dbg !4402
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4402
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4403
  %14 = load i32, i32* %count.addr, align 4, !dbg !4405
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4406
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4406
  %shr11 = lshr i32 %13, %14, !dbg !4406, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4407
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4408

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4409
  %conv15 = zext i8 %15 to i32, !dbg !4409
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4412
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4413

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4414
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4417
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4418

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4419
  store i32 %17, i32* %retval, align 4, !dbg !4420
  br label %return, !dbg !4420

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4421
  br label %return, !dbg !4421

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4422
  br label %return, !dbg !4422

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4424
  br label %return, !dbg !4424

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4426
  ret i32 %18, !dbg !4426
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4427 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4428, metadata !DIExpression()), !dbg !4429
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4430, metadata !DIExpression()), !dbg !4431
  %0 = load i32, i32* %value.addr, align 4, !dbg !4432
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4433
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4434
  ret i32 %call, !dbg !4435
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4436 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4439, metadata !DIExpression()), !dbg !4440
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4441, metadata !DIExpression()), !dbg !4442
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4443, metadata !DIExpression()), !dbg !4444
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4445, metadata !DIExpression()), !dbg !4446
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4447, metadata !DIExpression()), !dbg !4448
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4449, metadata !DIExpression()), !dbg !4450
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4451
  %cmp = icmp slt i32 %0, 0, !dbg !4453
  br i1 %cmp, label %if.then, label %if.else, !dbg !4454

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4455
  br label %if.end, !dbg !4457

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4458
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4460
  %cmp1 = icmp slt i32 %1, 0, !dbg !4462
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4463

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4464
  %sub = sub nsw i32 0, %2, !dbg !4466
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4467
  br label %if.end4, !dbg !4468

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4469
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4471
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4472
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4473
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4474
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4475
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4476
  %7 = load i32, i32* %count.addr, align 4, !dbg !4477
  %sub5 = sub i32 %7, 32, !dbg !4478
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4479
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4479
  %shr = lshr i32 %6, %sub5, !dbg !4479, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4480
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4481
  %conv = zext i8 %8 to i32, !dbg !4481
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4483
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4484

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4485
  store i32 %9, i32* %retval, align 4, !dbg !4487
  br label %return, !dbg !4487

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4488
  br label %return, !dbg !4488

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4490
  ret i32 %10, !dbg !4490
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4491 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4492, metadata !DIExpression()), !dbg !4493
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4494, metadata !DIExpression()), !dbg !4495
  %0 = load i32, i32* %value.addr, align 4, !dbg !4496
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4497
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4498
  ret i32 %call, !dbg !4499
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4500 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4503, metadata !DIExpression()), !dbg !4504
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4505, metadata !DIExpression()), !dbg !4506
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4507, metadata !DIExpression()), !dbg !4508
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4509, metadata !DIExpression()), !dbg !4510
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4511, metadata !DIExpression()), !dbg !4512
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4513, metadata !DIExpression()), !dbg !4514
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4515, metadata !DIExpression()), !dbg !4516
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4517
  %conv = sext i8 %0 to i32, !dbg !4517
  %cmp = icmp slt i32 %conv, 0, !dbg !4519
  br i1 %cmp, label %if.then, label %if.else, !dbg !4520

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4521
  br label %if.end, !dbg !4523

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4524
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4526
  %conv2 = sext i8 %1 to i32, !dbg !4526
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4528
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4529

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4530
  %conv6 = sext i8 %2 to i32, !dbg !4530
  %sub = sub nsw i32 0, %conv6, !dbg !4532
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4533
  br label %if.end9, !dbg !4534

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4535
  %conv8 = sext i8 %3 to i32, !dbg !4535
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4537
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4538
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4539
  %mul = mul i32 %4, %5, !dbg !4540
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4541
  %6 = load i32, i32* %value.addr, align 4, !dbg !4542
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4543
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4544
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4545
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4546
  %9 = load i32, i32* %count.addr, align 4, !dbg !4547
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4548
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4548
  %shr = lshr i32 %8, %9, !dbg !4548, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4549
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4550
  %11 = load i32, i32* %count.addr, align 4, !dbg !4551
  %sub10 = sub i32 32, %11, !dbg !4552
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4553
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4553
  %shl = shl i32 %10, %sub10, !dbg !4553, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4554
  %or = or i32 %12, %shl, !dbg !4554
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4554
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4555
  %14 = load i32, i32* %count.addr, align 4, !dbg !4557
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4558
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4558
  %shr11 = lshr i32 %13, %14, !dbg !4558, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4559
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4560

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4561
  %conv15 = zext i8 %15 to i32, !dbg !4561
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4564
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4565

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4566
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4569
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4570

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4571
  store i32 %17, i32* %retval, align 4, !dbg !4572
  br label %return, !dbg !4572

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4573
  br label %return, !dbg !4573

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4574
  br label %return, !dbg !4574

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4576
  br label %return, !dbg !4576

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4578
  ret i32 %18, !dbg !4578
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4579 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4580, metadata !DIExpression()), !dbg !4581
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4582, metadata !DIExpression()), !dbg !4583
  %0 = load i32, i32* %value.addr, align 4, !dbg !4584
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4585
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4586
  ret i32 %call, !dbg !4587
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4588 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4589, metadata !DIExpression()), !dbg !4590
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4591, metadata !DIExpression()), !dbg !4592
  %0 = load i32, i32* %value.addr, align 4, !dbg !4593
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4594
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4595
  ret i32 %call, !dbg !4596
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4597 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4600, metadata !DIExpression()), !dbg !4601
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4602, metadata !DIExpression()), !dbg !4603
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4604, metadata !DIExpression()), !dbg !4605
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4606, metadata !DIExpression()), !dbg !4607
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4608, metadata !DIExpression()), !dbg !4609
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4610, metadata !DIExpression()), !dbg !4611
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4612, metadata !DIExpression()), !dbg !4613
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4614, metadata !DIExpression()), !dbg !4615
  %0 = load i32, i32* %value.addr, align 4, !dbg !4616
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4617
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4618
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4619
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4620
  %3 = load i32, i32* %count.addr, align 4, !dbg !4621
  %sub = sub i32 %3, 32, !dbg !4622
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4623
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4623
  %shr = lshr i32 %2, %sub, !dbg !4623, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4624
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4625
  ret i32 %4, !dbg !4626
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4627 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4628, metadata !DIExpression()), !dbg !4629
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4630, metadata !DIExpression()), !dbg !4631
  %0 = load i32, i32* %value.addr, align 4, !dbg !4632
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4633
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4634
  ret i32 %call, !dbg !4635
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4636 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4639, metadata !DIExpression()), !dbg !4640
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4641, metadata !DIExpression()), !dbg !4642
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4643, metadata !DIExpression()), !dbg !4644
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4645, metadata !DIExpression()), !dbg !4646
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4647, metadata !DIExpression()), !dbg !4648
  %0 = load i32, i32* %value.addr, align 4, !dbg !4649
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4650
  %conv = zext i8 %1 to i32, !dbg !4650
  %mul = mul i32 %0, %conv, !dbg !4651
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4652
  %2 = load i32, i32* %value.addr, align 4, !dbg !4653
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4654
  %conv1 = zext i8 %3 to i32, !dbg !4654
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4655
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4656
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4657
  %5 = load i32, i32* %count.addr, align 4, !dbg !4658
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4659
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4659
  %shr = lshr i32 %4, %5, !dbg !4659, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4660
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4661
  %7 = load i32, i32* %count.addr, align 4, !dbg !4662
  %sub = sub i32 32, %7, !dbg !4663
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4664
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4664
  %shl = shl i32 %6, %sub, !dbg !4664, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4665
  %or = or i32 %8, %shl, !dbg !4665
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4665
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4666
  %10 = load i32, i32* %count.addr, align 4, !dbg !4668
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4669
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4669
  %shr2 = lshr i32 %9, %10, !dbg !4669, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !4670
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4671

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4672
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4675
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4676

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4677
  store i32 %12, i32* %retval, align 4, !dbg !4678
  br label %return, !dbg !4678

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4679
  br label %return, !dbg !4679

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4680
  br label %return, !dbg !4680

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4682
  ret i32 %13, !dbg !4682
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4683 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4684, metadata !DIExpression()), !dbg !4685
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4686, metadata !DIExpression()), !dbg !4687
  %0 = load i8, i8* %value.addr, align 1, !dbg !4688
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4689
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4690
  ret i8 %call, !dbg !4691
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4692 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4693, metadata !DIExpression()), !dbg !4694
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4695, metadata !DIExpression()), !dbg !4696
  %0 = load i8, i8* %value.addr, align 1, !dbg !4697
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4698
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4699
  ret i8 %call, !dbg !4700
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4701 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4702, metadata !DIExpression()), !dbg !4703
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4704, metadata !DIExpression()), !dbg !4705
  %0 = load i8, i8* %value.addr, align 1, !dbg !4706
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4707
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4708
  ret i8 %call, !dbg !4709
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4710 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4711, metadata !DIExpression()), !dbg !4712
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4713, metadata !DIExpression()), !dbg !4714
  %0 = load i8, i8* %value.addr, align 1, !dbg !4715
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4716
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4717
  ret i8 %call, !dbg !4718
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4719 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4720, metadata !DIExpression()), !dbg !4721
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4722, metadata !DIExpression()), !dbg !4723
  %0 = load i8, i8* %value.addr, align 1, !dbg !4724
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4725
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4726
  ret i8 %call, !dbg !4727
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4728 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4729, metadata !DIExpression()), !dbg !4730
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4731, metadata !DIExpression()), !dbg !4732
  %0 = load i8, i8* %value.addr, align 1, !dbg !4733
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4734
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4735
  ret i8 %call, !dbg !4736
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4737 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4738, metadata !DIExpression()), !dbg !4739
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4740, metadata !DIExpression()), !dbg !4741
  %0 = load i8, i8* %value.addr, align 1, !dbg !4742
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4743
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4744
  ret i8 %call, !dbg !4745
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4746 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4747, metadata !DIExpression()), !dbg !4748
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4749, metadata !DIExpression()), !dbg !4750
  %0 = load i8, i8* %value.addr, align 1, !dbg !4751
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4752
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4753
  ret i8 %call, !dbg !4754
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4755 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4756, metadata !DIExpression()), !dbg !4757
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4758, metadata !DIExpression()), !dbg !4759
  %0 = load i8, i8* %value.addr, align 1, !dbg !4760
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4761
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4762
  ret i8 %call, !dbg !4763
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4764 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4766, metadata !DIExpression()), !dbg !4767
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4768, metadata !DIExpression()), !dbg !4769
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4770, metadata !DIExpression()), !dbg !4771
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4772, metadata !DIExpression()), !dbg !4773
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4774, metadata !DIExpression()), !dbg !4775
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4776, metadata !DIExpression()), !dbg !4777
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4778, metadata !DIExpression()), !dbg !4779
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4780, metadata !DIExpression()), !dbg !4781
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4782, metadata !DIExpression()), !dbg !4783
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4784, metadata !DIExpression()), !dbg !4785
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4786, metadata !DIExpression()), !dbg !4787
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4788, metadata !DIExpression()), !dbg !4789
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4790
  %and = and i32 %0, 65535, !dbg !4791
  %conv = trunc i32 %and to i16, !dbg !4790
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4792
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4793
  %and1 = and i32 %1, -65536, !dbg !4794
  %shr = lshr i32 %and1, 16, !dbg !4795
  %conv2 = trunc i32 %shr to i16, !dbg !4796
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4797
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4798
  %and3 = and i32 %2, 65535, !dbg !4799
  %conv4 = trunc i32 %and3 to i16, !dbg !4798
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4800
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4801
  %and5 = and i32 %3, -65536, !dbg !4802
  %shr6 = lshr i32 %and5, 16, !dbg !4803
  %conv7 = trunc i32 %shr6 to i16, !dbg !4804
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4805
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4806
  %conv8 = zext i16 %4 to i32, !dbg !4808
  %conv9 = sext i32 %conv8 to i64, !dbg !4809
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4810
  %conv10 = zext i16 %5 to i32, !dbg !4811
  %conv11 = sext i32 %conv10 to i64, !dbg !4812
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4813
  %tobool = icmp ne i32 %call, 0, !dbg !4813
  br i1 %tobool, label %if.end, label %if.then, !dbg !4814

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !4815
  br label %return, !dbg !4815

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4817
  %conv12 = zext i16 %6 to i32, !dbg !4817
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4818
  %conv13 = zext i16 %7 to i32, !dbg !4818
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4819
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4820
  %8 = load i16, i16* %arg1_LW, align 2, !dbg !4821
  %conv14 = zext i16 %8 to i32, !dbg !4821
  %9 = load i16, i16* %arg2_HW, align 2, !dbg !4822
  %conv15 = zext i16 %9 to i32, !dbg !4822
  %mul16 = mul nsw i32 %conv14, %conv15, !dbg !4823
  store i32 %mul16, i32* %MulTemp2, align 4, !dbg !4824
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4825
  %conv17 = zext i16 %10 to i32, !dbg !4825
  %11 = load i16, i16* %arg2_LW, align 2, !dbg !4826
  %conv18 = zext i16 %11 to i32, !dbg !4826
  %mul19 = mul nsw i32 %conv17, %conv18, !dbg !4827
  store i32 %mul19, i32* %MulTemp3, align 4, !dbg !4828
  %12 = load i16, i16* %arg1_HW, align 2, !dbg !4829
  %conv20 = zext i16 %12 to i32, !dbg !4829
  %13 = load i16, i16* %arg2_HW, align 2, !dbg !4830
  %conv21 = zext i16 %13 to i32, !dbg !4830
  %mul22 = mul nsw i32 %conv20, %conv21, !dbg !4831
  store i32 %mul22, i32* %MulTemp4, align 4, !dbg !4832
  %14 = load i32, i32* %MulTemp2, align 4, !dbg !4833
  %shr23 = lshr i32 %14, 16, !dbg !4834
  %15 = load i32, i32* %MulTemp3, align 4, !dbg !4835
  %shr24 = lshr i32 %15, 16, !dbg !4836
  %add = add i32 %shr23, %shr24, !dbg !4837
  %16 = load i32, i32* %MulTemp4, align 4, !dbg !4838
  %add25 = add i32 %add, %16, !dbg !4839
  store i32 %add25, i32* %HIGHWORD, align 4, !dbg !4840
  %17 = load i32, i32* %MulTemp1, align 4, !dbg !4841
  %shr26 = lshr i32 %17, 16, !dbg !4842
  %18 = load i32, i32* %MulTemp2, align 4, !dbg !4843
  %and27 = and i32 %18, 65535, !dbg !4844
  %add28 = add i32 %shr26, %and27, !dbg !4845
  %19 = load i32, i32* %MulTemp3, align 4, !dbg !4846
  %and29 = and i32 %19, 65535, !dbg !4847
  %add30 = add i32 %add28, %and29, !dbg !4848
  store i32 %add30, i32* %OverFlow, align 4, !dbg !4849
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4850
  %cmp = icmp ugt i32 %20, 65535, !dbg !4852
  br i1 %cmp, label %if.then32, label %if.else, !dbg !4853

if.then32:                                        ; preds = %if.end
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4854
  %22 = load i32, i32* %OverFlow, align 4, !dbg !4856
  %shr33 = lshr i32 %22, 16, !dbg !4857
  %add34 = add i32 %21, %shr33, !dbg !4858
  store i32 %add34, i32* %retval, align 4, !dbg !4859
  br label %return, !dbg !4859

if.else:                                          ; preds = %if.end
  %23 = load i32, i32* %HIGHWORD, align 4, !dbg !4860
  store i32 %23, i32* %retval, align 4, !dbg !4862
  br label %return, !dbg !4862

return:                                           ; preds = %if.else, %if.then32, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !4863
  ret i32 %24, !dbg !4863
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4864 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4867, metadata !DIExpression()), !dbg !4868
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4869, metadata !DIExpression()), !dbg !4870
  %0 = load i64, i64* %left.addr, align 8, !dbg !4871
  %1 = load i64, i64* %right.addr, align 8, !dbg !4872
  %mul = mul nsw i64 %0, %1, !dbg !4873
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4874
  %conv = zext i1 %cmp to i32, !dbg !4874
  ret i32 %conv, !dbg !4875
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4876 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4877, metadata !DIExpression()), !dbg !4878
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4879, metadata !DIExpression()), !dbg !4880
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4881, metadata !DIExpression()), !dbg !4882
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4883, metadata !DIExpression()), !dbg !4884
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4885, metadata !DIExpression()), !dbg !4886
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4887, metadata !DIExpression()), !dbg !4888
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4889, metadata !DIExpression()), !dbg !4890
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4891, metadata !DIExpression()), !dbg !4892
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4893, metadata !DIExpression()), !dbg !4894
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4895, metadata !DIExpression()), !dbg !4896
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4897, metadata !DIExpression()), !dbg !4898
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4899, metadata !DIExpression()), !dbg !4900
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4901
  %and = and i32 %0, 65535, !dbg !4902
  %conv = trunc i32 %and to i16, !dbg !4901
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4903
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4904
  %and1 = and i32 %1, -65536, !dbg !4905
  %shr = lshr i32 %and1, 16, !dbg !4906
  %conv2 = trunc i32 %shr to i16, !dbg !4907
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4908
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4909
  %and3 = and i32 %2, 65535, !dbg !4910
  %conv4 = trunc i32 %and3 to i16, !dbg !4909
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4911
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4912
  %and5 = and i32 %3, -65536, !dbg !4913
  %shr6 = lshr i32 %and5, 16, !dbg !4914
  %conv7 = trunc i32 %shr6 to i16, !dbg !4915
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4916
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4917
  %conv8 = zext i16 %4 to i32, !dbg !4917
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4918
  %conv9 = zext i16 %5 to i32, !dbg !4918
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4919
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4920
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4921
  %conv10 = zext i16 %6 to i32, !dbg !4921
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4922
  %conv11 = zext i16 %7 to i32, !dbg !4922
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4923
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4924
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4925
  %conv13 = zext i16 %8 to i32, !dbg !4925
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4926
  %conv14 = zext i16 %9 to i32, !dbg !4926
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4927
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4928
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4929
  %conv16 = zext i16 %10 to i32, !dbg !4929
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4930
  %conv17 = zext i16 %11 to i32, !dbg !4930
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4931
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4932
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4933
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4934
  %and19 = and i32 %13, 65535, !dbg !4935
  %shl = shl i32 %and19, 16, !dbg !4936
  %add = add i32 %12, %shl, !dbg !4937
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4938
  %and20 = and i32 %14, 65535, !dbg !4939
  %shl21 = shl i32 %and20, 16, !dbg !4940
  %add22 = add i32 %add, %shl21, !dbg !4941
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4942
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4943
  ret i32 %15, !dbg !4944
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4945 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4951, metadata !DIExpression()), !dbg !4952
  %2 = icmp eq i64 %0, 0, !dbg !4953
  br i1 %2, label %3, label %4, !dbg !4955

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4956
  unreachable, !dbg !4956

4:                                                ; preds = %1
  ret void, !dbg !4957
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4958 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4964, metadata !DIExpression()), !dbg !4966
  call void @llvm.dbg.value(metadata i64 %1, metadata !4965, metadata !DIExpression()), !dbg !4966
  %3 = icmp ult i64 %1, %0, !dbg !4967
  br i1 %3, label %5, label %4, !dbg !4969

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4970
  unreachable, !dbg !4970

5:                                                ; preds = %2
  ret void, !dbg !4972
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!32, !2, !34, !38, !40}
!llvm.ident = !{!42, !42, !42, !43, !43}
!llvm.module.flags = !{!44, !45, !46, !47, !48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/mul_Ccode_alarm_0108.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !36, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108/MulHword_alarm_0108.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!36 = !{!26, !37}
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = distinct !DICompileUnit(language: DW_LANG_C89, file: !39, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!39 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!40 = distinct !DICompileUnit(language: DW_LANG_C89, file: !41, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!41 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!42 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!43 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!44 = !{i32 7, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{i32 7, !"uwtable", i32 1}
!48 = !{i32 7, !"frame-pointer", i32 2}
!49 = distinct !DISubprogram(name: "main", scope: !50, file: !50, line: 7, type: !51, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!51 = !DISubroutineType(types: !52)
!52 = !{!37}
!53 = !DILocalVariable(name: "val1", scope: !49, file: !50, line: 9, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !37)
!56 = !DILocation(line: 9, column: 13, scope: !49)
!57 = !DILocalVariable(name: "val2", scope: !49, file: !50, line: 10, type: !54)
!58 = !DILocation(line: 10, column: 13, scope: !49)
!59 = !DILocalVariable(name: "result", scope: !49, file: !50, line: 11, type: !54)
!60 = !DILocation(line: 11, column: 13, scope: !49)
!61 = !DILocation(line: 13, column: 24, scope: !49)
!62 = !DILocation(line: 13, column: 5, scope: !49)
!63 = !DILocation(line: 14, column: 24, scope: !49)
!64 = !DILocation(line: 14, column: 5, scope: !49)
!65 = !DILocation(line: 16, column: 30, scope: !49)
!66 = !DILocation(line: 16, column: 36, scope: !49)
!67 = !DILocation(line: 16, column: 14, scope: !49)
!68 = !DILocation(line: 16, column: 12, scope: !49)
!69 = !DILocation(line: 18, column: 11, scope: !49)
!70 = !DILocation(line: 19, column: 5, scope: !49)
!71 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !72, file: !72, line: 43, type: !73, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!73 = !DISubroutineType(types: !74)
!74 = !{!6, !6, !22}
!75 = !DILocalVariable(name: "value", arg: 1, scope: !71, file: !72, line: 43, type: !6)
!76 = !DILocation(line: 43, column: 35, scope: !71)
!77 = !DILocalVariable(name: "factor", arg: 2, scope: !71, file: !72, line: 43, type: !22)
!78 = !DILocation(line: 43, column: 46, scope: !71)
!79 = !DILocalVariable(name: "s32MulTemp1", scope: !71, file: !72, line: 45, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !54)
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
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !738)
!738 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !739)
!739 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!740 = !DILocation(line: 706, column: 6, scope: !728)
!741 = !DILocation(line: 707, column: 15, scope: !728)
!742 = !DILocation(line: 707, column: 23, scope: !728)
!743 = !DILocation(line: 707, column: 21, scope: !728)
!744 = !DILocation(line: 707, column: 13, scope: !728)
!745 = !DILocation(line: 708, column: 15, scope: !728)
!746 = !DILocation(line: 708, column: 26, scope: !728)
!747 = !DILocation(line: 708, column: 13, scope: !728)
!748 = !DILocation(line: 709, column: 5, scope: !749)
!749 = distinct !DILexicalBlock(scope: !728, file: !72, line: 709, column: 5)
!750 = !DILocation(line: 709, column: 16, scope: !749)
!751 = !DILocation(line: 709, column: 5, scope: !728)
!752 = !DILocation(line: 711, column: 15, scope: !753)
!753 = distinct !DILexicalBlock(scope: !749, file: !72, line: 710, column: 2)
!754 = !DILocation(line: 711, column: 10, scope: !753)
!755 = !DILocation(line: 711, column: 3, scope: !753)
!756 = !DILocation(line: 715, column: 3, scope: !757)
!757 = distinct !DILexicalBlock(scope: !749, file: !72, line: 714, column: 2)
!758 = !DILocation(line: 717, column: 1, scope: !728)
!759 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !72, file: !72, line: 732, type: !760, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!760 = !DISubroutineType(types: !761)
!761 = !{!80, !13, !22}
!762 = !DILocalVariable(name: "value", arg: 1, scope: !759, file: !72, line: 732, type: !13)
!763 = !DILocation(line: 732, column: 25, scope: !759)
!764 = !DILocalVariable(name: "factor", arg: 2, scope: !759, file: !72, line: 732, type: !22)
!765 = !DILocation(line: 732, column: 36, scope: !759)
!766 = !DILocalVariable(name: "s32MulTemp", scope: !759, file: !72, line: 734, type: !80)
!767 = !DILocation(line: 734, column: 6, scope: !759)
!768 = !DILocation(line: 735, column: 15, scope: !759)
!769 = !DILocation(line: 735, column: 23, scope: !759)
!770 = !DILocation(line: 735, column: 21, scope: !759)
!771 = !DILocation(line: 735, column: 13, scope: !759)
!772 = !DILocation(line: 736, column: 9, scope: !759)
!773 = !DILocation(line: 736, column: 2, scope: !759)
!774 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !72, file: !72, line: 752, type: !775, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!775 = !DISubroutineType(types: !776)
!776 = !{!80, !80, !22}
!777 = !DILocalVariable(name: "value", arg: 1, scope: !774, file: !72, line: 752, type: !80)
!778 = !DILocation(line: 752, column: 25, scope: !774)
!779 = !DILocalVariable(name: "factor", arg: 2, scope: !774, file: !72, line: 752, type: !22)
!780 = !DILocation(line: 752, column: 36, scope: !774)
!781 = !DILocalVariable(name: "s32Temp1", scope: !774, file: !72, line: 754, type: !80)
!782 = !DILocation(line: 754, column: 6, scope: !774)
!783 = !DILocalVariable(name: "s32Temp2", scope: !774, file: !72, line: 754, type: !80)
!784 = !DILocation(line: 754, column: 20, scope: !774)
!785 = !DILocalVariable(name: "s32Factor", scope: !774, file: !72, line: 754, type: !80)
!786 = !DILocation(line: 754, column: 44, scope: !774)
!787 = !DILocation(line: 755, column: 14, scope: !774)
!788 = !DILocation(line: 755, column: 12, scope: !774)
!789 = !DILocation(line: 756, column: 5, scope: !790)
!790 = distinct !DILexicalBlock(scope: !774, file: !72, line: 756, column: 5)
!791 = !DILocation(line: 756, column: 12, scope: !790)
!792 = !DILocation(line: 756, column: 5, scope: !774)
!793 = !DILocation(line: 758, column: 6, scope: !794)
!794 = distinct !DILexicalBlock(scope: !795, file: !72, line: 758, column: 6)
!795 = distinct !DILexicalBlock(scope: !790, file: !72, line: 757, column: 2)
!796 = !DILocation(line: 758, column: 12, scope: !794)
!797 = !DILocation(line: 758, column: 6, scope: !795)
!798 = !DILocation(line: 760, column: 15, scope: !799)
!799 = distinct !DILexicalBlock(scope: !794, file: !72, line: 759, column: 3)
!800 = !DILocation(line: 760, column: 26, scope: !799)
!801 = !DILocation(line: 760, column: 24, scope: !799)
!802 = !DILocation(line: 760, column: 13, scope: !799)
!803 = !DILocation(line: 761, column: 7, scope: !804)
!804 = distinct !DILexicalBlock(scope: !799, file: !72, line: 761, column: 7)
!805 = !DILocation(line: 761, column: 19, scope: !804)
!806 = !DILocation(line: 761, column: 16, scope: !804)
!807 = !DILocation(line: 761, column: 7, scope: !799)
!808 = !DILocation(line: 763, column: 5, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !72, line: 762, column: 4)
!810 = !DILocation(line: 767, column: 13, scope: !811)
!811 = distinct !DILexicalBlock(scope: !804, file: !72, line: 766, column: 4)
!812 = !DILocation(line: 767, column: 19, scope: !811)
!813 = !DILocation(line: 767, column: 18, scope: !811)
!814 = !DILocation(line: 767, column: 5, scope: !811)
!815 = !DILocation(line: 772, column: 20, scope: !816)
!816 = distinct !DILexicalBlock(scope: !817, file: !72, line: 772, column: 7)
!817 = distinct !DILexicalBlock(scope: !794, file: !72, line: 771, column: 3)
!818 = !DILocation(line: 772, column: 19, scope: !816)
!819 = !DILocation(line: 772, column: 31, scope: !816)
!820 = !DILocation(line: 772, column: 28, scope: !816)
!821 = !DILocation(line: 772, column: 7, scope: !817)
!822 = !DILocation(line: 774, column: 5, scope: !823)
!823 = distinct !DILexicalBlock(scope: !816, file: !72, line: 773, column: 4)
!824 = !DILocation(line: 778, column: 13, scope: !825)
!825 = distinct !DILexicalBlock(scope: !816, file: !72, line: 777, column: 4)
!826 = !DILocation(line: 778, column: 19, scope: !825)
!827 = !DILocation(line: 778, column: 18, scope: !825)
!828 = !DILocation(line: 778, column: 5, scope: !825)
!829 = !DILocation(line: 784, column: 3, scope: !830)
!830 = distinct !DILexicalBlock(scope: !790, file: !72, line: 783, column: 2)
!831 = !DILocation(line: 786, column: 1, scope: !774)
!832 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !72, file: !72, line: 802, type: !833, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!833 = !DISubroutineType(types: !834)
!834 = !{!17, !17, !17, !22}
!835 = !DILocalVariable(name: "value", arg: 1, scope: !832, file: !72, line: 802, type: !17)
!836 = !DILocation(line: 802, column: 35, scope: !832)
!837 = !DILocalVariable(name: "factor", arg: 2, scope: !832, file: !72, line: 802, type: !17)
!838 = !DILocation(line: 802, column: 44, scope: !832)
!839 = !DILocalVariable(name: "count", arg: 3, scope: !832, file: !72, line: 802, type: !22)
!840 = !DILocation(line: 802, column: 55, scope: !832)
!841 = !DILocalVariable(name: "u16MulTemp", scope: !832, file: !72, line: 804, type: !22)
!842 = !DILocation(line: 804, column: 6, scope: !832)
!843 = !DILocation(line: 805, column: 15, scope: !832)
!844 = !DILocation(line: 805, column: 23, scope: !832)
!845 = !DILocation(line: 805, column: 21, scope: !832)
!846 = !DILocation(line: 805, column: 13, scope: !832)
!847 = !DILocation(line: 806, column: 15, scope: !832)
!848 = !DILocation(line: 806, column: 26, scope: !832)
!849 = !DILocation(line: 806, column: 25, scope: !832)
!850 = !DILocation(line: 806, column: 13, scope: !832)
!851 = !DILocation(line: 807, column: 13, scope: !832)
!852 = !DILocation(line: 807, column: 9, scope: !832)
!853 = !DILocation(line: 807, column: 2, scope: !832)
!854 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !72, file: !72, line: 824, type: !855, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!855 = !DISubroutineType(types: !856)
!856 = !{!17, !17, !17, !17}
!857 = !DILocalVariable(name: "value", arg: 1, scope: !854, file: !72, line: 824, type: !17)
!858 = !DILocation(line: 824, column: 38, scope: !854)
!859 = !DILocalVariable(name: "factor", arg: 2, scope: !854, file: !72, line: 824, type: !17)
!860 = !DILocation(line: 824, column: 47, scope: !854)
!861 = !DILocalVariable(name: "count", arg: 3, scope: !854, file: !72, line: 824, type: !17)
!862 = !DILocation(line: 824, column: 57, scope: !854)
!863 = !DILocalVariable(name: "u16MulTemp", scope: !854, file: !72, line: 826, type: !22)
!864 = !DILocation(line: 826, column: 6, scope: !854)
!865 = !DILocation(line: 827, column: 15, scope: !854)
!866 = !DILocation(line: 827, column: 23, scope: !854)
!867 = !DILocation(line: 827, column: 21, scope: !854)
!868 = !DILocation(line: 827, column: 13, scope: !854)
!869 = !DILocation(line: 828, column: 15, scope: !854)
!870 = !DILocation(line: 828, column: 26, scope: !854)
!871 = !DILocation(line: 828, column: 25, scope: !854)
!872 = !DILocation(line: 828, column: 13, scope: !854)
!873 = !DILocation(line: 829, column: 5, scope: !874)
!874 = distinct !DILexicalBlock(scope: !854, file: !72, line: 829, column: 5)
!875 = !DILocation(line: 829, column: 16, scope: !874)
!876 = !DILocation(line: 829, column: 5, scope: !854)
!877 = !DILocation(line: 831, column: 10, scope: !878)
!878 = distinct !DILexicalBlock(scope: !874, file: !72, line: 830, column: 2)
!879 = !DILocation(line: 831, column: 21, scope: !878)
!880 = !DILocation(line: 831, column: 3, scope: !878)
!881 = !DILocation(line: 835, column: 3, scope: !882)
!882 = distinct !DILexicalBlock(scope: !874, file: !72, line: 834, column: 2)
!883 = !DILocation(line: 837, column: 1, scope: !854)
!884 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !72, file: !72, line: 854, type: !885, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!885 = !DISubroutineType(types: !886)
!886 = !{!17, !17, !17}
!887 = !DILocalVariable(name: "x_value", arg: 1, scope: !884, file: !72, line: 854, type: !17)
!888 = !DILocation(line: 854, column: 25, scope: !884)
!889 = !DILocalVariable(name: "y_value", arg: 2, scope: !884, file: !72, line: 854, type: !17)
!890 = !DILocation(line: 854, column: 36, scope: !884)
!891 = !DILocalVariable(name: "u16MulTemp", scope: !884, file: !72, line: 856, type: !22)
!892 = !DILocation(line: 856, column: 6, scope: !884)
!893 = !DILocation(line: 857, column: 15, scope: !884)
!894 = !DILocation(line: 857, column: 25, scope: !884)
!895 = !DILocation(line: 857, column: 23, scope: !884)
!896 = !DILocation(line: 857, column: 13, scope: !884)
!897 = !DILocation(line: 858, column: 15, scope: !884)
!898 = !DILocation(line: 858, column: 26, scope: !884)
!899 = !DILocation(line: 858, column: 13, scope: !884)
!900 = !DILocation(line: 859, column: 13, scope: !884)
!901 = !DILocation(line: 859, column: 9, scope: !884)
!902 = !DILocation(line: 859, column: 2, scope: !884)
!903 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !72, file: !72, line: 878, type: !885, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!904 = !DILocalVariable(name: "value", arg: 1, scope: !903, file: !72, line: 878, type: !17)
!905 = !DILocation(line: 878, column: 26, scope: !903)
!906 = !DILocalVariable(name: "factor", arg: 2, scope: !903, file: !72, line: 878, type: !17)
!907 = !DILocation(line: 878, column: 36, scope: !903)
!908 = !DILocalVariable(name: "u16MulTemp", scope: !903, file: !72, line: 880, type: !22)
!909 = !DILocation(line: 880, column: 6, scope: !903)
!910 = !DILocation(line: 881, column: 15, scope: !903)
!911 = !DILocation(line: 881, column: 23, scope: !903)
!912 = !DILocation(line: 881, column: 21, scope: !903)
!913 = !DILocation(line: 881, column: 13, scope: !903)
!914 = !DILocation(line: 882, column: 15, scope: !903)
!915 = !DILocation(line: 882, column: 26, scope: !903)
!916 = !DILocation(line: 882, column: 13, scope: !903)
!917 = !DILocation(line: 883, column: 5, scope: !918)
!918 = distinct !DILexicalBlock(scope: !903, file: !72, line: 883, column: 5)
!919 = !DILocation(line: 883, column: 16, scope: !918)
!920 = !DILocation(line: 883, column: 5, scope: !903)
!921 = !DILocation(line: 885, column: 14, scope: !922)
!922 = distinct !DILexicalBlock(scope: !918, file: !72, line: 884, column: 2)
!923 = !DILocation(line: 885, column: 10, scope: !922)
!924 = !DILocation(line: 885, column: 3, scope: !922)
!925 = !DILocation(line: 889, column: 3, scope: !926)
!926 = distinct !DILexicalBlock(scope: !918, file: !72, line: 888, column: 2)
!927 = !DILocation(line: 891, column: 1, scope: !903)
!928 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !72, file: !72, line: 907, type: !929, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!929 = !DISubroutineType(types: !930)
!930 = !{!22, !22, !22}
!931 = !DILocalVariable(name: "value", arg: 1, scope: !928, file: !72, line: 907, type: !22)
!932 = !DILocation(line: 907, column: 39, scope: !928)
!933 = !DILocalVariable(name: "factor", arg: 2, scope: !928, file: !72, line: 907, type: !22)
!934 = !DILocation(line: 907, column: 49, scope: !928)
!935 = !DILocalVariable(name: "u32MulTemp", scope: !928, file: !72, line: 909, type: !736)
!936 = !DILocation(line: 909, column: 6, scope: !928)
!937 = !DILocation(line: 910, column: 15, scope: !928)
!938 = !DILocation(line: 910, column: 23, scope: !928)
!939 = !DILocation(line: 910, column: 21, scope: !928)
!940 = !DILocation(line: 910, column: 13, scope: !928)
!941 = !DILocation(line: 911, column: 15, scope: !928)
!942 = !DILocation(line: 911, column: 26, scope: !928)
!943 = !DILocation(line: 911, column: 13, scope: !928)
!944 = !DILocation(line: 912, column: 14, scope: !928)
!945 = !DILocation(line: 912, column: 9, scope: !928)
!946 = !DILocation(line: 912, column: 2, scope: !928)
!947 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !72, file: !72, line: 931, type: !929, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!948 = !DILocalVariable(name: "value", arg: 1, scope: !947, file: !72, line: 931, type: !22)
!949 = !DILocation(line: 931, column: 43, scope: !947)
!950 = !DILocalVariable(name: "factor", arg: 2, scope: !947, file: !72, line: 931, type: !22)
!951 = !DILocation(line: 931, column: 53, scope: !947)
!952 = !DILocalVariable(name: "u32MulTemp", scope: !947, file: !72, line: 933, type: !736)
!953 = !DILocation(line: 933, column: 6, scope: !947)
!954 = !DILocation(line: 934, column: 15, scope: !947)
!955 = !DILocation(line: 934, column: 23, scope: !947)
!956 = !DILocation(line: 934, column: 21, scope: !947)
!957 = !DILocation(line: 934, column: 13, scope: !947)
!958 = !DILocation(line: 935, column: 15, scope: !947)
!959 = !DILocation(line: 935, column: 26, scope: !947)
!960 = !DILocation(line: 935, column: 13, scope: !947)
!961 = !DILocation(line: 936, column: 5, scope: !962)
!962 = distinct !DILexicalBlock(scope: !947, file: !72, line: 936, column: 5)
!963 = !DILocation(line: 936, column: 16, scope: !962)
!964 = !DILocation(line: 936, column: 5, scope: !947)
!965 = !DILocation(line: 938, column: 11, scope: !966)
!966 = distinct !DILexicalBlock(scope: !962, file: !72, line: 937, column: 2)
!967 = !DILocation(line: 938, column: 22, scope: !966)
!968 = !DILocation(line: 938, column: 10, scope: !966)
!969 = !DILocation(line: 938, column: 3, scope: !966)
!970 = !DILocation(line: 942, column: 3, scope: !971)
!971 = distinct !DILexicalBlock(scope: !962, file: !72, line: 941, column: 2)
!972 = !DILocation(line: 944, column: 1, scope: !947)
!973 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !72, file: !72, line: 962, type: !974, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!974 = !DISubroutineType(types: !975)
!975 = !{!22, !22, !17}
!976 = !DILocalVariable(name: "x_value", arg: 1, scope: !973, file: !72, line: 962, type: !22)
!977 = !DILocation(line: 962, column: 29, scope: !973)
!978 = !DILocalVariable(name: "y_value", arg: 2, scope: !973, file: !72, line: 962, type: !17)
!979 = !DILocation(line: 962, column: 41, scope: !973)
!980 = !DILocalVariable(name: "u32MulTemp", scope: !973, file: !72, line: 964, type: !736)
!981 = !DILocation(line: 964, column: 6, scope: !973)
!982 = !DILocation(line: 965, column: 15, scope: !973)
!983 = !DILocation(line: 965, column: 25, scope: !973)
!984 = !DILocation(line: 965, column: 23, scope: !973)
!985 = !DILocation(line: 965, column: 13, scope: !973)
!986 = !DILocation(line: 966, column: 16, scope: !973)
!987 = !DILocation(line: 966, column: 27, scope: !973)
!988 = !DILocation(line: 966, column: 33, scope: !973)
!989 = !DILocation(line: 966, column: 13, scope: !973)
!990 = !DILocation(line: 967, column: 9, scope: !973)
!991 = !DILocation(line: 967, column: 2, scope: !973)
!992 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !72, file: !72, line: 986, type: !974, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!993 = !DILocalVariable(name: "x_value", arg: 1, scope: !992, file: !72, line: 986, type: !22)
!994 = !DILocation(line: 986, column: 29, scope: !992)
!995 = !DILocalVariable(name: "y_value", arg: 2, scope: !992, file: !72, line: 986, type: !17)
!996 = !DILocation(line: 986, column: 41, scope: !992)
!997 = !DILocalVariable(name: "u32MulTemp", scope: !992, file: !72, line: 988, type: !736)
!998 = !DILocation(line: 988, column: 6, scope: !992)
!999 = !DILocation(line: 989, column: 15, scope: !992)
!1000 = !DILocation(line: 989, column: 25, scope: !992)
!1001 = !DILocation(line: 989, column: 23, scope: !992)
!1002 = !DILocation(line: 989, column: 13, scope: !992)
!1003 = !DILocation(line: 990, column: 15, scope: !992)
!1004 = !DILocation(line: 990, column: 26, scope: !992)
!1005 = !DILocation(line: 990, column: 13, scope: !992)
!1006 = !DILocation(line: 991, column: 5, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !992, file: !72, line: 991, column: 5)
!1008 = !DILocation(line: 991, column: 16, scope: !1007)
!1009 = !DILocation(line: 991, column: 5, scope: !992)
!1010 = !DILocation(line: 993, column: 11, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !1007, file: !72, line: 992, column: 2)
!1012 = !DILocation(line: 993, column: 22, scope: !1011)
!1013 = !DILocation(line: 993, column: 10, scope: !1011)
!1014 = !DILocation(line: 993, column: 3, scope: !1011)
!1015 = !DILocation(line: 997, column: 3, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !1007, file: !72, line: 996, column: 2)
!1017 = !DILocation(line: 999, column: 1, scope: !992)
!1018 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !72, file: !72, line: 1015, type: !1019, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!22, !22, !22, !736}
!1021 = !DILocalVariable(name: "value", arg: 1, scope: !1018, file: !72, line: 1015, type: !22)
!1022 = !DILocation(line: 1015, column: 40, scope: !1018)
!1023 = !DILocalVariable(name: "factor", arg: 2, scope: !1018, file: !72, line: 1015, type: !22)
!1024 = !DILocation(line: 1015, column: 50, scope: !1018)
!1025 = !DILocalVariable(name: "count", arg: 3, scope: !1018, file: !72, line: 1015, type: !736)
!1026 = !DILocation(line: 1015, column: 61, scope: !1018)
!1027 = !DILocalVariable(name: "u32MulTemp", scope: !1018, file: !72, line: 1017, type: !736)
!1028 = !DILocation(line: 1017, column: 6, scope: !1018)
!1029 = !DILocation(line: 1018, column: 15, scope: !1018)
!1030 = !DILocation(line: 1018, column: 23, scope: !1018)
!1031 = !DILocation(line: 1018, column: 21, scope: !1018)
!1032 = !DILocation(line: 1018, column: 13, scope: !1018)
!1033 = !DILocation(line: 1019, column: 15, scope: !1018)
!1034 = !DILocation(line: 1019, column: 26, scope: !1018)
!1035 = !DILocation(line: 1019, column: 25, scope: !1018)
!1036 = !DILocation(line: 1019, column: 13, scope: !1018)
!1037 = !DILocation(line: 1020, column: 10, scope: !1018)
!1038 = !DILocation(line: 1020, column: 21, scope: !1018)
!1039 = !DILocation(line: 1020, column: 9, scope: !1018)
!1040 = !DILocation(line: 1020, column: 2, scope: !1018)
!1041 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !72, file: !72, line: 1038, type: !1042, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!22, !22, !22, !22}
!1044 = !DILocalVariable(name: "value", arg: 1, scope: !1041, file: !72, line: 1038, type: !22)
!1045 = !DILocation(line: 1038, column: 43, scope: !1041)
!1046 = !DILocalVariable(name: "factor", arg: 2, scope: !1041, file: !72, line: 1038, type: !22)
!1047 = !DILocation(line: 1038, column: 53, scope: !1041)
!1048 = !DILocalVariable(name: "count", arg: 3, scope: !1041, file: !72, line: 1038, type: !22)
!1049 = !DILocation(line: 1038, column: 64, scope: !1041)
!1050 = !DILocalVariable(name: "u32MulTemp", scope: !1041, file: !72, line: 1040, type: !736)
!1051 = !DILocation(line: 1040, column: 6, scope: !1041)
!1052 = !DILocation(line: 1041, column: 15, scope: !1041)
!1053 = !DILocation(line: 1041, column: 23, scope: !1041)
!1054 = !DILocation(line: 1041, column: 21, scope: !1041)
!1055 = !DILocation(line: 1041, column: 13, scope: !1041)
!1056 = !DILocation(line: 1042, column: 15, scope: !1041)
!1057 = !DILocation(line: 1042, column: 26, scope: !1041)
!1058 = !DILocation(line: 1042, column: 25, scope: !1041)
!1059 = !DILocation(line: 1042, column: 13, scope: !1041)
!1060 = !DILocation(line: 1043, column: 5, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1041, file: !72, line: 1043, column: 5)
!1062 = !DILocation(line: 1043, column: 16, scope: !1061)
!1063 = !DILocation(line: 1043, column: 5, scope: !1041)
!1064 = !DILocation(line: 1045, column: 11, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1061, file: !72, line: 1044, column: 2)
!1066 = !DILocation(line: 1045, column: 22, scope: !1065)
!1067 = !DILocation(line: 1045, column: 10, scope: !1065)
!1068 = !DILocation(line: 1045, column: 3, scope: !1065)
!1069 = !DILocation(line: 1049, column: 3, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1061, file: !72, line: 1048, column: 2)
!1071 = !DILocation(line: 1051, column: 1, scope: !1041)
!1072 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !72, file: !72, line: 1067, type: !929, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1073 = !DILocalVariable(name: "x_value", arg: 1, scope: !1072, file: !72, line: 1067, type: !22)
!1074 = !DILocation(line: 1067, column: 30, scope: !1072)
!1075 = !DILocalVariable(name: "y_value", arg: 2, scope: !1072, file: !72, line: 1067, type: !22)
!1076 = !DILocation(line: 1067, column: 42, scope: !1072)
!1077 = !DILocalVariable(name: "u32MulTemp", scope: !1072, file: !72, line: 1069, type: !736)
!1078 = !DILocation(line: 1069, column: 6, scope: !1072)
!1079 = !DILocation(line: 1070, column: 15, scope: !1072)
!1080 = !DILocation(line: 1070, column: 25, scope: !1072)
!1081 = !DILocation(line: 1070, column: 23, scope: !1072)
!1082 = !DILocation(line: 1070, column: 13, scope: !1072)
!1083 = !DILocation(line: 1071, column: 15, scope: !1072)
!1084 = !DILocation(line: 1071, column: 26, scope: !1072)
!1085 = !DILocation(line: 1071, column: 13, scope: !1072)
!1086 = !DILocation(line: 1072, column: 19, scope: !1072)
!1087 = !DILocation(line: 1072, column: 17, scope: !1072)
!1088 = !DILocation(line: 1072, column: 9, scope: !1072)
!1089 = !DILocation(line: 1072, column: 2, scope: !1072)
!1090 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !72, file: !72, line: 1091, type: !929, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1091 = !DILocalVariable(name: "x_value", arg: 1, scope: !1090, file: !72, line: 1091, type: !22)
!1092 = !DILocation(line: 1091, column: 30, scope: !1090)
!1093 = !DILocalVariable(name: "y_value", arg: 2, scope: !1090, file: !72, line: 1091, type: !22)
!1094 = !DILocation(line: 1091, column: 42, scope: !1090)
!1095 = !DILocalVariable(name: "u32MulTemp", scope: !1090, file: !72, line: 1093, type: !736)
!1096 = !DILocation(line: 1093, column: 6, scope: !1090)
!1097 = !DILocation(line: 1094, column: 15, scope: !1090)
!1098 = !DILocation(line: 1094, column: 25, scope: !1090)
!1099 = !DILocation(line: 1094, column: 23, scope: !1090)
!1100 = !DILocation(line: 1094, column: 13, scope: !1090)
!1101 = !DILocation(line: 1095, column: 15, scope: !1090)
!1102 = !DILocation(line: 1095, column: 26, scope: !1090)
!1103 = !DILocation(line: 1095, column: 13, scope: !1090)
!1104 = !DILocation(line: 1096, column: 5, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1090, file: !72, line: 1096, column: 5)
!1106 = !DILocation(line: 1096, column: 16, scope: !1105)
!1107 = !DILocation(line: 1096, column: 5, scope: !1090)
!1108 = !DILocation(line: 1098, column: 11, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1105, file: !72, line: 1097, column: 2)
!1110 = !DILocation(line: 1098, column: 22, scope: !1109)
!1111 = !DILocation(line: 1098, column: 10, scope: !1109)
!1112 = !DILocation(line: 1098, column: 3, scope: !1109)
!1113 = !DILocation(line: 1102, column: 3, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1105, file: !72, line: 1101, column: 2)
!1115 = !DILocation(line: 1104, column: 1, scope: !1090)
!1116 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !72, file: !72, line: 1119, type: !1117, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1117 = !DISubroutineType(types: !1118)
!1118 = !{!736, !736, !22}
!1119 = !DILocalVariable(name: "x_value", arg: 1, scope: !1116, file: !72, line: 1119, type: !736)
!1120 = !DILocation(line: 1119, column: 26, scope: !1116)
!1121 = !DILocalVariable(name: "y_value", arg: 2, scope: !1116, file: !72, line: 1119, type: !22)
!1122 = !DILocation(line: 1119, column: 39, scope: !1116)
!1123 = !DILocalVariable(name: "u32Temp1", scope: !1116, file: !72, line: 1122, type: !736)
!1124 = !DILocation(line: 1122, column: 6, scope: !1116)
!1125 = !DILocation(line: 1123, column: 5, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1116, file: !72, line: 1123, column: 5)
!1127 = !DILocation(line: 1123, column: 13, scope: !1126)
!1128 = !DILocation(line: 1123, column: 5, scope: !1116)
!1129 = !DILocation(line: 1125, column: 26, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1126, file: !72, line: 1124, column: 2)
!1131 = !DILocation(line: 1125, column: 25, scope: !1130)
!1132 = !DILocation(line: 1125, column: 12, scope: !1130)
!1133 = !DILocation(line: 1126, column: 6, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1130, file: !72, line: 1126, column: 6)
!1135 = !DILocation(line: 1126, column: 17, scope: !1134)
!1136 = !DILocation(line: 1126, column: 15, scope: !1134)
!1137 = !DILocation(line: 1126, column: 6, scope: !1130)
!1138 = !DILocation(line: 1128, column: 4, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !72, line: 1127, column: 3)
!1140 = !DILocation(line: 1132, column: 12, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1134, file: !72, line: 1131, column: 3)
!1142 = !DILocation(line: 1132, column: 22, scope: !1141)
!1143 = !DILocation(line: 1132, column: 20, scope: !1141)
!1144 = !DILocation(line: 1132, column: 4, scope: !1141)
!1145 = !DILocation(line: 1137, column: 3, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1126, file: !72, line: 1136, column: 2)
!1147 = !DILocation(line: 1140, column: 2, scope: !1116)
!1148 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !72, file: !72, line: 1157, type: !1149, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!736, !736, !22, !736}
!1151 = !DILocalVariable(name: "value", arg: 1, scope: !1148, file: !72, line: 1157, type: !736)
!1152 = !DILocation(line: 1157, column: 40, scope: !1148)
!1153 = !DILocalVariable(name: "factor", arg: 2, scope: !1148, file: !72, line: 1157, type: !22)
!1154 = !DILocation(line: 1157, column: 50, scope: !1148)
!1155 = !DILocalVariable(name: "count", arg: 3, scope: !1148, file: !72, line: 1157, type: !736)
!1156 = !DILocation(line: 1157, column: 62, scope: !1148)
!1157 = !DILocalVariable(name: "u32Temp1", scope: !1148, file: !72, line: 1159, type: !736)
!1158 = !DILocation(line: 1159, column: 6, scope: !1148)
!1159 = !DILocalVariable(name: "u32Temp2", scope: !1148, file: !72, line: 1159, type: !736)
!1160 = !DILocation(line: 1159, column: 20, scope: !1148)
!1161 = !DILocation(line: 1160, column: 13, scope: !1148)
!1162 = !DILocation(line: 1160, column: 21, scope: !1148)
!1163 = !DILocation(line: 1160, column: 19, scope: !1148)
!1164 = !DILocation(line: 1160, column: 11, scope: !1148)
!1165 = !DILocation(line: 1161, column: 25, scope: !1148)
!1166 = !DILocation(line: 1161, column: 32, scope: !1148)
!1167 = !DILocation(line: 1161, column: 13, scope: !1148)
!1168 = !DILocation(line: 1161, column: 11, scope: !1148)
!1169 = !DILocation(line: 1162, column: 13, scope: !1148)
!1170 = !DILocation(line: 1162, column: 25, scope: !1148)
!1171 = !DILocation(line: 1162, column: 22, scope: !1148)
!1172 = !DILocation(line: 1162, column: 11, scope: !1148)
!1173 = !DILocation(line: 1163, column: 14, scope: !1148)
!1174 = !DILocation(line: 1163, column: 30, scope: !1148)
!1175 = !DILocation(line: 1163, column: 29, scope: !1148)
!1176 = !DILocation(line: 1163, column: 23, scope: !1148)
!1177 = !DILocation(line: 1163, column: 11, scope: !1148)
!1178 = !DILocation(line: 1164, column: 6, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1148, file: !72, line: 1164, column: 5)
!1180 = !DILocation(line: 1164, column: 16, scope: !1179)
!1181 = !DILocation(line: 1164, column: 14, scope: !1179)
!1182 = !DILocation(line: 1164, column: 23, scope: !1179)
!1183 = !DILocation(line: 1164, column: 5, scope: !1148)
!1184 = !DILocation(line: 1166, column: 10, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1179, file: !72, line: 1165, column: 2)
!1186 = !DILocation(line: 1166, column: 3, scope: !1185)
!1187 = !DILocation(line: 1170, column: 3, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1179, file: !72, line: 1169, column: 2)
!1189 = !DILocation(line: 1172, column: 1, scope: !1148)
!1190 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !72, file: !72, line: 1188, type: !1191, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!17, !17, !17, !6}
!1193 = !DILocalVariable(name: "val1", arg: 1, scope: !1190, file: !72, line: 1188, type: !17)
!1194 = !DILocation(line: 1188, column: 25, scope: !1190)
!1195 = !DILocalVariable(name: "val2", arg: 2, scope: !1190, file: !72, line: 1188, type: !17)
!1196 = !DILocation(line: 1188, column: 34, scope: !1190)
!1197 = !DILocalVariable(name: "factor", arg: 3, scope: !1190, file: !72, line: 1188, type: !6)
!1198 = !DILocation(line: 1188, column: 43, scope: !1190)
!1199 = !DILocalVariable(name: "s16Temp1", scope: !1190, file: !72, line: 1190, type: !13)
!1200 = !DILocation(line: 1190, column: 6, scope: !1190)
!1201 = !DILocation(line: 1191, column: 15, scope: !1190)
!1202 = !DILocation(line: 1191, column: 22, scope: !1190)
!1203 = !DILocation(line: 1191, column: 20, scope: !1190)
!1204 = !DILocation(line: 1191, column: 28, scope: !1190)
!1205 = !DILocation(line: 1191, column: 27, scope: !1190)
!1206 = !DILocation(line: 1191, column: 35, scope: !1190)
!1207 = !DILocation(line: 1191, column: 39, scope: !1190)
!1208 = !DILocation(line: 1191, column: 38, scope: !1190)
!1209 = !DILocation(line: 1191, column: 13, scope: !1190)
!1210 = !DILocation(line: 1191, column: 11, scope: !1190)
!1211 = !DILocation(line: 1192, column: 5, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1190, file: !72, line: 1192, column: 5)
!1213 = !DILocation(line: 1192, column: 14, scope: !1212)
!1214 = !DILocation(line: 1192, column: 5, scope: !1190)
!1215 = !DILocation(line: 1194, column: 6, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1217, file: !72, line: 1194, column: 6)
!1217 = distinct !DILexicalBlock(scope: !1212, file: !72, line: 1193, column: 2)
!1218 = !DILocation(line: 1194, column: 15, scope: !1216)
!1219 = !DILocation(line: 1194, column: 6, scope: !1217)
!1220 = !DILocation(line: 1196, column: 15, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !72, line: 1195, column: 3)
!1222 = !DILocation(line: 1196, column: 11, scope: !1221)
!1223 = !DILocation(line: 1196, column: 4, scope: !1221)
!1224 = !DILocation(line: 1200, column: 4, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1216, file: !72, line: 1199, column: 3)
!1226 = !DILocation(line: 1205, column: 3, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1212, file: !72, line: 1204, column: 2)
!1228 = !DILocation(line: 1208, column: 1, scope: !1190)
!1229 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !72, file: !72, line: 1224, type: !1230, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{!22, !22, !22, !6}
!1232 = !DILocalVariable(name: "val1", arg: 1, scope: !1229, file: !72, line: 1224, type: !22)
!1233 = !DILocation(line: 1224, column: 30, scope: !1229)
!1234 = !DILocalVariable(name: "val2", arg: 2, scope: !1229, file: !72, line: 1224, type: !22)
!1235 = !DILocation(line: 1224, column: 40, scope: !1229)
!1236 = !DILocalVariable(name: "factor", arg: 3, scope: !1229, file: !72, line: 1224, type: !6)
!1237 = !DILocation(line: 1224, column: 49, scope: !1229)
!1238 = !DILocalVariable(name: "s32Temp1", scope: !1229, file: !72, line: 1226, type: !80)
!1239 = !DILocation(line: 1226, column: 6, scope: !1229)
!1240 = !DILocation(line: 1227, column: 15, scope: !1229)
!1241 = !DILocation(line: 1227, column: 22, scope: !1229)
!1242 = !DILocation(line: 1227, column: 20, scope: !1229)
!1243 = !DILocation(line: 1227, column: 28, scope: !1229)
!1244 = !DILocation(line: 1227, column: 27, scope: !1229)
!1245 = !DILocation(line: 1227, column: 35, scope: !1229)
!1246 = !DILocation(line: 1227, column: 39, scope: !1229)
!1247 = !DILocation(line: 1227, column: 38, scope: !1229)
!1248 = !DILocation(line: 1227, column: 11, scope: !1229)
!1249 = !DILocation(line: 1228, column: 5, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1229, file: !72, line: 1228, column: 5)
!1251 = !DILocation(line: 1228, column: 14, scope: !1250)
!1252 = !DILocation(line: 1228, column: 5, scope: !1229)
!1253 = !DILocation(line: 1230, column: 6, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1255, file: !72, line: 1230, column: 6)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !72, line: 1229, column: 2)
!1256 = !DILocation(line: 1230, column: 15, scope: !1254)
!1257 = !DILocation(line: 1230, column: 6, scope: !1255)
!1258 = !DILocation(line: 1232, column: 16, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !72, line: 1231, column: 3)
!1260 = !DILocation(line: 1232, column: 11, scope: !1259)
!1261 = !DILocation(line: 1232, column: 4, scope: !1259)
!1262 = !DILocation(line: 1236, column: 4, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1254, file: !72, line: 1235, column: 3)
!1264 = !DILocation(line: 1242, column: 3, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1250, file: !72, line: 1241, column: 2)
!1266 = !DILocation(line: 1244, column: 1, scope: !1229)
!1267 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !72, file: !72, line: 1259, type: !929, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1268 = !DILocalVariable(name: "val1", arg: 1, scope: !1267, file: !72, line: 1259, type: !22)
!1269 = !DILocation(line: 1259, column: 26, scope: !1267)
!1270 = !DILocalVariable(name: "val2", arg: 2, scope: !1267, file: !72, line: 1259, type: !22)
!1271 = !DILocation(line: 1259, column: 36, scope: !1267)
!1272 = !DILocalVariable(name: "u32Temp1", scope: !1267, file: !72, line: 1261, type: !736)
!1273 = !DILocation(line: 1261, column: 6, scope: !1267)
!1274 = !DILocation(line: 1262, column: 13, scope: !1267)
!1275 = !DILocation(line: 1262, column: 20, scope: !1267)
!1276 = !DILocation(line: 1262, column: 18, scope: !1267)
!1277 = !DILocation(line: 1262, column: 11, scope: !1267)
!1278 = !DILocation(line: 1263, column: 5, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1267, file: !72, line: 1263, column: 5)
!1280 = !DILocation(line: 1263, column: 14, scope: !1279)
!1281 = !DILocation(line: 1263, column: 5, scope: !1267)
!1282 = !DILocation(line: 1265, column: 11, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1279, file: !72, line: 1264, column: 2)
!1284 = !DILocation(line: 1265, column: 20, scope: !1283)
!1285 = !DILocation(line: 1265, column: 10, scope: !1283)
!1286 = !DILocation(line: 1265, column: 3, scope: !1283)
!1287 = !DILocation(line: 1269, column: 3, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1279, file: !72, line: 1268, column: 2)
!1289 = !DILocation(line: 1271, column: 1, scope: !1267)
!1290 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !72, file: !72, line: 1285, type: !1291, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!736, !22, !22}
!1293 = !DILocalVariable(name: "x_value", arg: 1, scope: !1290, file: !72, line: 1285, type: !22)
!1294 = !DILocation(line: 1285, column: 25, scope: !1290)
!1295 = !DILocalVariable(name: "y_value", arg: 2, scope: !1290, file: !72, line: 1285, type: !22)
!1296 = !DILocation(line: 1285, column: 38, scope: !1290)
!1297 = !DILocalVariable(name: "u32Temp1", scope: !1290, file: !72, line: 1287, type: !736)
!1298 = !DILocation(line: 1287, column: 6, scope: !1290)
!1299 = !DILocation(line: 1288, column: 13, scope: !1290)
!1300 = !DILocation(line: 1288, column: 23, scope: !1290)
!1301 = !DILocation(line: 1288, column: 21, scope: !1290)
!1302 = !DILocation(line: 1288, column: 11, scope: !1290)
!1303 = !DILocation(line: 1289, column: 9, scope: !1290)
!1304 = !DILocation(line: 1289, column: 2, scope: !1290)
!1305 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !72, file: !72, line: 1307, type: !1306, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!80, !13, !13}
!1308 = !DILocalVariable(name: "x_value", arg: 1, scope: !1305, file: !72, line: 1307, type: !13)
!1309 = !DILocation(line: 1307, column: 25, scope: !1305)
!1310 = !DILocalVariable(name: "y_value", arg: 2, scope: !1305, file: !72, line: 1307, type: !13)
!1311 = !DILocation(line: 1307, column: 38, scope: !1305)
!1312 = !DILocalVariable(name: "s32Temp1", scope: !1305, file: !72, line: 1309, type: !80)
!1313 = !DILocation(line: 1309, column: 6, scope: !1305)
!1314 = !DILocation(line: 1310, column: 13, scope: !1305)
!1315 = !DILocation(line: 1310, column: 23, scope: !1305)
!1316 = !DILocation(line: 1310, column: 21, scope: !1305)
!1317 = !DILocation(line: 1310, column: 11, scope: !1305)
!1318 = !DILocation(line: 1311, column: 9, scope: !1305)
!1319 = !DILocation(line: 1311, column: 2, scope: !1305)
!1320 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !72, file: !72, line: 1328, type: !1321, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1321 = !DISubroutineType(types: !1322)
!1322 = !{!736, !736, !80}
!1323 = !DILocalVariable(name: "val1", arg: 1, scope: !1320, file: !72, line: 1328, type: !736)
!1324 = !DILocation(line: 1328, column: 25, scope: !1320)
!1325 = !DILocalVariable(name: "val2", arg: 2, scope: !1320, file: !72, line: 1328, type: !80)
!1326 = !DILocation(line: 1328, column: 35, scope: !1320)
!1327 = !DILocalVariable(name: "s32Temp1", scope: !1320, file: !72, line: 1330, type: !80)
!1328 = !DILocation(line: 1330, column: 6, scope: !1320)
!1329 = !DILocation(line: 1331, column: 5, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1320, file: !72, line: 1331, column: 5)
!1331 = !DILocation(line: 1331, column: 10, scope: !1330)
!1332 = !DILocation(line: 1331, column: 5, scope: !1320)
!1333 = !DILocation(line: 1333, column: 25, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1330, file: !72, line: 1332, column: 2)
!1335 = !DILocation(line: 1333, column: 24, scope: !1334)
!1336 = !DILocation(line: 1333, column: 12, scope: !1334)
!1337 = !DILocation(line: 1334, column: 6, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1334, file: !72, line: 1334, column: 6)
!1339 = !DILocation(line: 1334, column: 17, scope: !1338)
!1340 = !DILocation(line: 1334, column: 15, scope: !1338)
!1341 = !DILocation(line: 1334, column: 6, scope: !1334)
!1342 = !DILocation(line: 1336, column: 4, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1338, file: !72, line: 1335, column: 3)
!1344 = !DILocation(line: 1340, column: 12, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1338, file: !72, line: 1339, column: 3)
!1346 = !DILocation(line: 1340, column: 19, scope: !1345)
!1347 = !DILocation(line: 1340, column: 17, scope: !1345)
!1348 = !DILocation(line: 1340, column: 4, scope: !1345)
!1349 = !DILocation(line: 1345, column: 3, scope: !1350)
!1350 = distinct !DILexicalBlock(scope: !1330, file: !72, line: 1344, column: 2)
!1351 = !DILocation(line: 1347, column: 1, scope: !1320)
!1352 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !72, file: !72, line: 1362, type: !1353, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!736, !80, !80}
!1355 = !DILocalVariable(name: "val1", arg: 1, scope: !1352, file: !72, line: 1362, type: !80)
!1356 = !DILocation(line: 1362, column: 25, scope: !1352)
!1357 = !DILocalVariable(name: "val2", arg: 2, scope: !1352, file: !72, line: 1362, type: !80)
!1358 = !DILocation(line: 1362, column: 35, scope: !1352)
!1359 = !DILocalVariable(name: "u32Temp1", scope: !1352, file: !72, line: 1364, type: !736)
!1360 = !DILocation(line: 1364, column: 6, scope: !1352)
!1361 = !DILocalVariable(name: "u32Temp2", scope: !1352, file: !72, line: 1364, type: !736)
!1362 = !DILocation(line: 1364, column: 17, scope: !1352)
!1363 = !DILocalVariable(name: "u32Temp3", scope: !1352, file: !72, line: 1364, type: !736)
!1364 = !DILocation(line: 1364, column: 27, scope: !1352)
!1365 = !DILocalVariable(name: "u8SignBit", scope: !1352, file: !72, line: 1365, type: !17)
!1366 = !DILocation(line: 1365, column: 5, scope: !1352)
!1367 = !DILocation(line: 1367, column: 5, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1352, file: !72, line: 1367, column: 5)
!1369 = !DILocation(line: 1367, column: 9, scope: !1368)
!1370 = !DILocation(line: 1367, column: 5, scope: !1352)
!1371 = !DILocation(line: 1368, column: 15, scope: !1368)
!1372 = !DILocation(line: 1368, column: 14, scope: !1368)
!1373 = !DILocation(line: 1368, column: 12, scope: !1368)
!1374 = !DILocation(line: 1368, column: 3, scope: !1368)
!1375 = !DILocation(line: 1370, column: 14, scope: !1368)
!1376 = !DILocation(line: 1370, column: 12, scope: !1368)
!1377 = !DILocation(line: 1372, column: 5, scope: !1378)
!1378 = distinct !DILexicalBlock(scope: !1352, file: !72, line: 1372, column: 5)
!1379 = !DILocation(line: 1372, column: 9, scope: !1378)
!1380 = !DILocation(line: 1372, column: 5, scope: !1352)
!1381 = !DILocation(line: 1373, column: 15, scope: !1378)
!1382 = !DILocation(line: 1373, column: 14, scope: !1378)
!1383 = !DILocation(line: 1373, column: 12, scope: !1378)
!1384 = !DILocation(line: 1373, column: 3, scope: !1378)
!1385 = !DILocation(line: 1375, column: 14, scope: !1378)
!1386 = !DILocation(line: 1375, column: 12, scope: !1378)
!1387 = !DILocation(line: 1377, column: 6, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1352, file: !72, line: 1377, column: 5)
!1389 = !DILocation(line: 1377, column: 10, scope: !1388)
!1390 = !DILocation(line: 1377, column: 13, scope: !1388)
!1391 = !DILocation(line: 1377, column: 28, scope: !1388)
!1392 = !DILocation(line: 1377, column: 32, scope: !1388)
!1393 = !DILocation(line: 1377, column: 35, scope: !1388)
!1394 = !DILocation(line: 1378, column: 12, scope: !1388)
!1395 = !DILocation(line: 1378, column: 3, scope: !1388)
!1396 = !DILocation(line: 1380, column: 12, scope: !1388)
!1397 = !DILocation(line: 1381, column: 29, scope: !1352)
!1398 = !DILocation(line: 1381, column: 38, scope: !1352)
!1399 = !DILocation(line: 1381, column: 13, scope: !1352)
!1400 = !DILocation(line: 1381, column: 11, scope: !1352)
!1401 = !DILocation(line: 1383, column: 5, scope: !1402)
!1402 = distinct !DILexicalBlock(scope: !1352, file: !72, line: 1383, column: 5)
!1403 = !DILocation(line: 1383, column: 14, scope: !1402)
!1404 = !DILocation(line: 1383, column: 5, scope: !1352)
!1405 = !DILocation(line: 1385, column: 3, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1402, file: !72, line: 1384, column: 2)
!1407 = !DILocation(line: 1389, column: 10, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1402, file: !72, line: 1388, column: 2)
!1409 = !DILocation(line: 1389, column: 3, scope: !1408)
!1410 = !DILocation(line: 1440, column: 1, scope: !1352)
!1411 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !72, file: !72, line: 1455, type: !1412, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1412 = !DISubroutineType(types: !1413)
!1413 = !{!736, !736, !736}
!1414 = !DILocalVariable(name: "val1", arg: 1, scope: !1411, file: !72, line: 1455, type: !736)
!1415 = !DILocation(line: 1455, column: 25, scope: !1411)
!1416 = !DILocalVariable(name: "val2", arg: 2, scope: !1411, file: !72, line: 1455, type: !736)
!1417 = !DILocation(line: 1455, column: 35, scope: !1411)
!1418 = !DILocalVariable(name: "u32Temp1", scope: !1411, file: !72, line: 1457, type: !736)
!1419 = !DILocation(line: 1457, column: 6, scope: !1411)
!1420 = !DILocation(line: 1458, column: 5, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1411, file: !72, line: 1458, column: 5)
!1422 = !DILocation(line: 1458, column: 10, scope: !1421)
!1423 = !DILocation(line: 1458, column: 5, scope: !1411)
!1424 = !DILocation(line: 1460, column: 26, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1421, file: !72, line: 1459, column: 2)
!1426 = !DILocation(line: 1460, column: 25, scope: !1425)
!1427 = !DILocation(line: 1460, column: 12, scope: !1425)
!1428 = !DILocation(line: 1461, column: 6, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1425, file: !72, line: 1461, column: 6)
!1430 = !DILocation(line: 1461, column: 17, scope: !1429)
!1431 = !DILocation(line: 1461, column: 15, scope: !1429)
!1432 = !DILocation(line: 1461, column: 6, scope: !1425)
!1433 = !DILocation(line: 1463, column: 4, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1429, file: !72, line: 1462, column: 3)
!1435 = !DILocation(line: 1467, column: 12, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1429, file: !72, line: 1466, column: 3)
!1437 = !DILocation(line: 1467, column: 19, scope: !1436)
!1438 = !DILocation(line: 1467, column: 17, scope: !1436)
!1439 = !DILocation(line: 1467, column: 4, scope: !1436)
!1440 = !DILocation(line: 1472, column: 3, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1421, file: !72, line: 1471, column: 2)
!1442 = !DILocation(line: 1474, column: 1, scope: !1411)
!1443 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !72, file: !72, line: 1501, type: !1117, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1444 = !DILocalVariable(name: "value", arg: 1, scope: !1443, file: !72, line: 1501, type: !736)
!1445 = !DILocation(line: 1501, column: 30, scope: !1443)
!1446 = !DILocalVariable(name: "factor", arg: 2, scope: !1443, file: !72, line: 1501, type: !22)
!1447 = !DILocation(line: 1501, column: 41, scope: !1443)
!1448 = !DILocalVariable(name: "u32Temp1", scope: !1443, file: !72, line: 1503, type: !736)
!1449 = !DILocation(line: 1503, column: 6, scope: !1443)
!1450 = !DILocalVariable(name: "u32Temp2", scope: !1443, file: !72, line: 1503, type: !736)
!1451 = !DILocation(line: 1503, column: 20, scope: !1443)
!1452 = !DILocation(line: 1504, column: 13, scope: !1443)
!1453 = !DILocation(line: 1504, column: 21, scope: !1443)
!1454 = !DILocation(line: 1504, column: 19, scope: !1443)
!1455 = !DILocation(line: 1504, column: 11, scope: !1443)
!1456 = !DILocation(line: 1505, column: 25, scope: !1443)
!1457 = !DILocation(line: 1505, column: 32, scope: !1443)
!1458 = !DILocation(line: 1505, column: 13, scope: !1443)
!1459 = !DILocation(line: 1505, column: 11, scope: !1443)
!1460 = !DILocation(line: 1506, column: 14, scope: !1443)
!1461 = !DILocation(line: 1506, column: 23, scope: !1443)
!1462 = !DILocation(line: 1506, column: 11, scope: !1443)
!1463 = !DILocation(line: 1507, column: 14, scope: !1443)
!1464 = !DILocation(line: 1507, column: 23, scope: !1443)
!1465 = !DILocation(line: 1507, column: 11, scope: !1443)
!1466 = !DILocation(line: 1508, column: 9, scope: !1443)
!1467 = !DILocation(line: 1508, column: 2, scope: !1443)
!1468 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !72, file: !72, line: 1527, type: !1117, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1469 = !DILocalVariable(name: "value", arg: 1, scope: !1468, file: !72, line: 1527, type: !736)
!1470 = !DILocation(line: 1527, column: 30, scope: !1468)
!1471 = !DILocalVariable(name: "factor", arg: 2, scope: !1468, file: !72, line: 1527, type: !22)
!1472 = !DILocation(line: 1527, column: 41, scope: !1468)
!1473 = !DILocalVariable(name: "u32Temp1", scope: !1468, file: !72, line: 1529, type: !736)
!1474 = !DILocation(line: 1529, column: 6, scope: !1468)
!1475 = !DILocalVariable(name: "u32Temp2", scope: !1468, file: !72, line: 1529, type: !736)
!1476 = !DILocation(line: 1529, column: 20, scope: !1468)
!1477 = !DILocation(line: 1530, column: 13, scope: !1468)
!1478 = !DILocation(line: 1530, column: 21, scope: !1468)
!1479 = !DILocation(line: 1530, column: 19, scope: !1468)
!1480 = !DILocation(line: 1530, column: 11, scope: !1468)
!1481 = !DILocation(line: 1531, column: 25, scope: !1468)
!1482 = !DILocation(line: 1531, column: 32, scope: !1468)
!1483 = !DILocation(line: 1531, column: 13, scope: !1468)
!1484 = !DILocation(line: 1531, column: 11, scope: !1468)
!1485 = !DILocation(line: 1532, column: 13, scope: !1468)
!1486 = !DILocation(line: 1532, column: 22, scope: !1468)
!1487 = !DILocation(line: 1532, column: 11, scope: !1468)
!1488 = !DILocation(line: 1533, column: 14, scope: !1468)
!1489 = !DILocation(line: 1533, column: 23, scope: !1468)
!1490 = !DILocation(line: 1533, column: 11, scope: !1468)
!1491 = !DILocation(line: 1534, column: 6, scope: !1492)
!1492 = distinct !DILexicalBlock(scope: !1468, file: !72, line: 1534, column: 5)
!1493 = !DILocation(line: 1534, column: 14, scope: !1492)
!1494 = !DILocation(line: 1534, column: 20, scope: !1492)
!1495 = !DILocation(line: 1534, column: 5, scope: !1468)
!1496 = !DILocation(line: 1536, column: 10, scope: !1497)
!1497 = distinct !DILexicalBlock(scope: !1492, file: !72, line: 1535, column: 2)
!1498 = !DILocation(line: 1536, column: 3, scope: !1497)
!1499 = !DILocation(line: 1540, column: 3, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1492, file: !72, line: 1539, column: 2)
!1501 = !DILocation(line: 1542, column: 1, scope: !1468)
!1502 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !72, file: !72, line: 1560, type: !1503, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1503 = !DISubroutineType(types: !1504)
!1504 = !{!736, !736, !13}
!1505 = !DILocalVariable(name: "value", arg: 1, scope: !1502, file: !72, line: 1560, type: !736)
!1506 = !DILocation(line: 1560, column: 30, scope: !1502)
!1507 = !DILocalVariable(name: "factor", arg: 2, scope: !1502, file: !72, line: 1560, type: !13)
!1508 = !DILocation(line: 1560, column: 41, scope: !1502)
!1509 = !DILocalVariable(name: "u32Temp1", scope: !1502, file: !72, line: 1562, type: !736)
!1510 = !DILocation(line: 1562, column: 6, scope: !1502)
!1511 = !DILocalVariable(name: "u32Temp2", scope: !1502, file: !72, line: 1562, type: !736)
!1512 = !DILocation(line: 1562, column: 20, scope: !1502)
!1513 = !DILocation(line: 1563, column: 5, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1502, file: !72, line: 1563, column: 5)
!1515 = !DILocation(line: 1563, column: 12, scope: !1514)
!1516 = !DILocation(line: 1563, column: 5, scope: !1502)
!1517 = !DILocation(line: 1566, column: 14, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1514, file: !72, line: 1564, column: 2)
!1519 = !DILocation(line: 1566, column: 22, scope: !1518)
!1520 = !DILocation(line: 1566, column: 20, scope: !1518)
!1521 = !DILocation(line: 1566, column: 12, scope: !1518)
!1522 = !DILocation(line: 1567, column: 26, scope: !1518)
!1523 = !DILocation(line: 1567, column: 33, scope: !1518)
!1524 = !DILocation(line: 1567, column: 14, scope: !1518)
!1525 = !DILocation(line: 1567, column: 12, scope: !1518)
!1526 = !DILocation(line: 1568, column: 14, scope: !1518)
!1527 = !DILocation(line: 1568, column: 23, scope: !1518)
!1528 = !DILocation(line: 1568, column: 12, scope: !1518)
!1529 = !DILocation(line: 1569, column: 15, scope: !1518)
!1530 = !DILocation(line: 1569, column: 24, scope: !1518)
!1531 = !DILocation(line: 1569, column: 12, scope: !1518)
!1532 = !DILocation(line: 1570, column: 10, scope: !1518)
!1533 = !DILocation(line: 1570, column: 3, scope: !1518)
!1534 = !DILocation(line: 1574, column: 3, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1514, file: !72, line: 1573, column: 2)
!1536 = !DILocation(line: 1576, column: 1, scope: !1502)
!1537 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !72, file: !72, line: 1595, type: !1503, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1538 = !DILocalVariable(name: "value", arg: 1, scope: !1537, file: !72, line: 1595, type: !736)
!1539 = !DILocation(line: 1595, column: 31, scope: !1537)
!1540 = !DILocalVariable(name: "factor", arg: 2, scope: !1537, file: !72, line: 1595, type: !13)
!1541 = !DILocation(line: 1595, column: 42, scope: !1537)
!1542 = !DILocalVariable(name: "u32Temp1", scope: !1537, file: !72, line: 1597, type: !736)
!1543 = !DILocation(line: 1597, column: 6, scope: !1537)
!1544 = !DILocalVariable(name: "u32Temp2", scope: !1537, file: !72, line: 1597, type: !736)
!1545 = !DILocation(line: 1597, column: 20, scope: !1537)
!1546 = !DILocation(line: 1598, column: 5, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1537, file: !72, line: 1598, column: 5)
!1548 = !DILocation(line: 1598, column: 12, scope: !1547)
!1549 = !DILocation(line: 1598, column: 5, scope: !1537)
!1550 = !DILocation(line: 1600, column: 3, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1547, file: !72, line: 1599, column: 2)
!1552 = !DILocation(line: 1604, column: 14, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1547, file: !72, line: 1603, column: 2)
!1554 = !DILocation(line: 1604, column: 22, scope: !1553)
!1555 = !DILocation(line: 1604, column: 20, scope: !1553)
!1556 = !DILocation(line: 1604, column: 12, scope: !1553)
!1557 = !DILocation(line: 1605, column: 26, scope: !1553)
!1558 = !DILocation(line: 1605, column: 33, scope: !1553)
!1559 = !DILocation(line: 1605, column: 14, scope: !1553)
!1560 = !DILocation(line: 1605, column: 12, scope: !1553)
!1561 = !DILocation(line: 1606, column: 14, scope: !1553)
!1562 = !DILocation(line: 1606, column: 23, scope: !1553)
!1563 = !DILocation(line: 1606, column: 12, scope: !1553)
!1564 = !DILocation(line: 1607, column: 15, scope: !1553)
!1565 = !DILocation(line: 1607, column: 24, scope: !1553)
!1566 = !DILocation(line: 1607, column: 12, scope: !1553)
!1567 = !DILocation(line: 1608, column: 7, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1553, file: !72, line: 1608, column: 6)
!1569 = !DILocation(line: 1608, column: 16, scope: !1568)
!1570 = !DILocation(line: 1608, column: 23, scope: !1568)
!1571 = !DILocation(line: 1608, column: 6, scope: !1553)
!1572 = !DILocation(line: 1610, column: 11, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1568, file: !72, line: 1609, column: 3)
!1574 = !DILocation(line: 1610, column: 4, scope: !1573)
!1575 = !DILocation(line: 1614, column: 4, scope: !1576)
!1576 = distinct !DILexicalBlock(scope: !1568, file: !72, line: 1613, column: 3)
!1577 = !DILocation(line: 1617, column: 1, scope: !1537)
!1578 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !72, file: !72, line: 1632, type: !1412, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1579 = !DILocalVariable(name: "value", arg: 1, scope: !1578, file: !72, line: 1632, type: !736)
!1580 = !DILocation(line: 1632, column: 30, scope: !1578)
!1581 = !DILocalVariable(name: "factor", arg: 2, scope: !1578, file: !72, line: 1632, type: !736)
!1582 = !DILocation(line: 1632, column: 40, scope: !1578)
!1583 = !DILocation(line: 1634, column: 21, scope: !1578)
!1584 = !DILocation(line: 1634, column: 28, scope: !1578)
!1585 = !DILocation(line: 1634, column: 9, scope: !1578)
!1586 = !DILocation(line: 1634, column: 2, scope: !1578)
!1587 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !72, file: !72, line: 1653, type: !1412, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1588 = !DILocalVariable(name: "value", arg: 1, scope: !1587, file: !72, line: 1653, type: !736)
!1589 = !DILocation(line: 1653, column: 30, scope: !1587)
!1590 = !DILocalVariable(name: "factor", arg: 2, scope: !1587, file: !72, line: 1653, type: !736)
!1591 = !DILocation(line: 1653, column: 40, scope: !1587)
!1592 = !DILocalVariable(name: "u32Temp1", scope: !1587, file: !72, line: 1655, type: !736)
!1593 = !DILocation(line: 1655, column: 6, scope: !1587)
!1594 = !DILocalVariable(name: "u32Temp2", scope: !1587, file: !72, line: 1655, type: !736)
!1595 = !DILocation(line: 1655, column: 20, scope: !1587)
!1596 = !DILocation(line: 1656, column: 13, scope: !1587)
!1597 = !DILocation(line: 1656, column: 21, scope: !1587)
!1598 = !DILocation(line: 1656, column: 19, scope: !1587)
!1599 = !DILocation(line: 1656, column: 11, scope: !1587)
!1600 = !DILocation(line: 1657, column: 25, scope: !1587)
!1601 = !DILocation(line: 1657, column: 32, scope: !1587)
!1602 = !DILocation(line: 1657, column: 13, scope: !1587)
!1603 = !DILocation(line: 1657, column: 11, scope: !1587)
!1604 = !DILocation(line: 1658, column: 13, scope: !1587)
!1605 = !DILocation(line: 1658, column: 22, scope: !1587)
!1606 = !DILocation(line: 1658, column: 11, scope: !1587)
!1607 = !DILocation(line: 1659, column: 14, scope: !1587)
!1608 = !DILocation(line: 1659, column: 23, scope: !1587)
!1609 = !DILocation(line: 1659, column: 11, scope: !1587)
!1610 = !DILocation(line: 1660, column: 6, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1587, file: !72, line: 1660, column: 5)
!1612 = !DILocation(line: 1660, column: 14, scope: !1611)
!1613 = !DILocation(line: 1660, column: 20, scope: !1611)
!1614 = !DILocation(line: 1660, column: 5, scope: !1587)
!1615 = !DILocation(line: 1662, column: 10, scope: !1616)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !72, line: 1661, column: 2)
!1617 = !DILocation(line: 1662, column: 3, scope: !1616)
!1618 = !DILocation(line: 1666, column: 3, scope: !1619)
!1619 = distinct !DILexicalBlock(scope: !1611, file: !72, line: 1665, column: 2)
!1620 = !DILocation(line: 1668, column: 1, scope: !1587)
!1621 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !72, file: !72, line: 1686, type: !1321, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1622 = !DILocalVariable(name: "value", arg: 1, scope: !1621, file: !72, line: 1686, type: !736)
!1623 = !DILocation(line: 1686, column: 30, scope: !1621)
!1624 = !DILocalVariable(name: "factor", arg: 2, scope: !1621, file: !72, line: 1686, type: !80)
!1625 = !DILocation(line: 1686, column: 40, scope: !1621)
!1626 = !DILocalVariable(name: "u32Temp1", scope: !1621, file: !72, line: 1688, type: !736)
!1627 = !DILocation(line: 1688, column: 6, scope: !1621)
!1628 = !DILocalVariable(name: "u32Temp2", scope: !1621, file: !72, line: 1688, type: !736)
!1629 = !DILocation(line: 1688, column: 20, scope: !1621)
!1630 = !DILocation(line: 1689, column: 5, scope: !1631)
!1631 = distinct !DILexicalBlock(scope: !1621, file: !72, line: 1689, column: 5)
!1632 = !DILocation(line: 1689, column: 12, scope: !1631)
!1633 = !DILocation(line: 1689, column: 5, scope: !1621)
!1634 = !DILocation(line: 1691, column: 14, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1631, file: !72, line: 1690, column: 2)
!1636 = !DILocation(line: 1691, column: 22, scope: !1635)
!1637 = !DILocation(line: 1691, column: 20, scope: !1635)
!1638 = !DILocation(line: 1691, column: 12, scope: !1635)
!1639 = !DILocation(line: 1692, column: 26, scope: !1635)
!1640 = !DILocation(line: 1692, column: 33, scope: !1635)
!1641 = !DILocation(line: 1692, column: 14, scope: !1635)
!1642 = !DILocation(line: 1692, column: 12, scope: !1635)
!1643 = !DILocation(line: 1693, column: 14, scope: !1635)
!1644 = !DILocation(line: 1693, column: 23, scope: !1635)
!1645 = !DILocation(line: 1693, column: 12, scope: !1635)
!1646 = !DILocation(line: 1694, column: 15, scope: !1635)
!1647 = !DILocation(line: 1694, column: 24, scope: !1635)
!1648 = !DILocation(line: 1694, column: 12, scope: !1635)
!1649 = !DILocation(line: 1695, column: 10, scope: !1635)
!1650 = !DILocation(line: 1695, column: 3, scope: !1635)
!1651 = !DILocation(line: 1699, column: 3, scope: !1652)
!1652 = distinct !DILexicalBlock(scope: !1631, file: !72, line: 1698, column: 2)
!1653 = !DILocation(line: 1701, column: 1, scope: !1621)
!1654 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !72, file: !72, line: 1720, type: !1321, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1655 = !DILocalVariable(name: "value", arg: 1, scope: !1654, file: !72, line: 1720, type: !736)
!1656 = !DILocation(line: 1720, column: 30, scope: !1654)
!1657 = !DILocalVariable(name: "factor", arg: 2, scope: !1654, file: !72, line: 1720, type: !80)
!1658 = !DILocation(line: 1720, column: 40, scope: !1654)
!1659 = !DILocalVariable(name: "u32Temp1", scope: !1654, file: !72, line: 1722, type: !736)
!1660 = !DILocation(line: 1722, column: 6, scope: !1654)
!1661 = !DILocalVariable(name: "u32Temp2", scope: !1654, file: !72, line: 1722, type: !736)
!1662 = !DILocation(line: 1722, column: 20, scope: !1654)
!1663 = !DILocation(line: 1723, column: 5, scope: !1664)
!1664 = distinct !DILexicalBlock(scope: !1654, file: !72, line: 1723, column: 5)
!1665 = !DILocation(line: 1723, column: 12, scope: !1664)
!1666 = !DILocation(line: 1723, column: 5, scope: !1654)
!1667 = !DILocation(line: 1725, column: 3, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1664, file: !72, line: 1724, column: 2)
!1669 = !DILocation(line: 1729, column: 14, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1664, file: !72, line: 1728, column: 2)
!1671 = !DILocation(line: 1729, column: 22, scope: !1670)
!1672 = !DILocation(line: 1729, column: 20, scope: !1670)
!1673 = !DILocation(line: 1729, column: 12, scope: !1670)
!1674 = !DILocation(line: 1730, column: 26, scope: !1670)
!1675 = !DILocation(line: 1730, column: 33, scope: !1670)
!1676 = !DILocation(line: 1730, column: 14, scope: !1670)
!1677 = !DILocation(line: 1730, column: 12, scope: !1670)
!1678 = !DILocation(line: 1731, column: 14, scope: !1670)
!1679 = !DILocation(line: 1731, column: 23, scope: !1670)
!1680 = !DILocation(line: 1731, column: 12, scope: !1670)
!1681 = !DILocation(line: 1732, column: 15, scope: !1670)
!1682 = !DILocation(line: 1732, column: 24, scope: !1670)
!1683 = !DILocation(line: 1732, column: 12, scope: !1670)
!1684 = !DILocation(line: 1733, column: 7, scope: !1685)
!1685 = distinct !DILexicalBlock(scope: !1670, file: !72, line: 1733, column: 6)
!1686 = !DILocation(line: 1733, column: 15, scope: !1685)
!1687 = !DILocation(line: 1733, column: 21, scope: !1685)
!1688 = !DILocation(line: 1733, column: 6, scope: !1670)
!1689 = !DILocation(line: 1735, column: 11, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1685, file: !72, line: 1734, column: 3)
!1691 = !DILocation(line: 1735, column: 4, scope: !1690)
!1692 = !DILocation(line: 1739, column: 4, scope: !1693)
!1693 = distinct !DILexicalBlock(scope: !1685, file: !72, line: 1738, column: 3)
!1694 = !DILocation(line: 1742, column: 1, scope: !1654)
!1695 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !72, file: !72, line: 1757, type: !1696, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1696 = !DISubroutineType(types: !1697)
!1697 = !{!80, !736, !80}
!1698 = !DILocalVariable(name: "val1", arg: 1, scope: !1695, file: !72, line: 1757, type: !736)
!1699 = !DILocation(line: 1757, column: 25, scope: !1695)
!1700 = !DILocalVariable(name: "val2", arg: 2, scope: !1695, file: !72, line: 1757, type: !80)
!1701 = !DILocation(line: 1757, column: 35, scope: !1695)
!1702 = !DILocalVariable(name: "s32Val2prime", scope: !1695, file: !72, line: 1759, type: !80)
!1703 = !DILocation(line: 1759, column: 6, scope: !1695)
!1704 = !DILocation(line: 1760, column: 5, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1695, file: !72, line: 1760, column: 5)
!1706 = !DILocation(line: 1760, column: 10, scope: !1705)
!1707 = !DILocation(line: 1760, column: 5, scope: !1695)
!1708 = !DILocation(line: 1762, column: 19, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1705, file: !72, line: 1761, column: 2)
!1710 = !DILocation(line: 1762, column: 18, scope: !1709)
!1711 = !DILocation(line: 1762, column: 16, scope: !1709)
!1712 = !DILocation(line: 1763, column: 2, scope: !1709)
!1713 = !DILocation(line: 1764, column: 5, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1695, file: !72, line: 1764, column: 5)
!1715 = !DILocation(line: 1764, column: 10, scope: !1714)
!1716 = !DILocation(line: 1764, column: 5, scope: !1695)
!1717 = !DILocation(line: 1766, column: 6, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1719, file: !72, line: 1766, column: 6)
!1719 = distinct !DILexicalBlock(scope: !1714, file: !72, line: 1765, column: 2)
!1720 = !DILocation(line: 1766, column: 11, scope: !1718)
!1721 = !DILocation(line: 1766, column: 6, scope: !1719)
!1722 = !DILocation(line: 1768, column: 21, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !72, line: 1768, column: 7)
!1724 = distinct !DILexicalBlock(scope: !1718, file: !72, line: 1767, column: 3)
!1725 = !DILocation(line: 1768, column: 19, scope: !1723)
!1726 = !DILocation(line: 1768, column: 37, scope: !1723)
!1727 = !DILocation(line: 1768, column: 35, scope: !1723)
!1728 = !DILocation(line: 1768, column: 7, scope: !1724)
!1729 = !DILocation(line: 1770, column: 13, scope: !1730)
!1730 = distinct !DILexicalBlock(scope: !1723, file: !72, line: 1769, column: 4)
!1731 = !DILocation(line: 1770, column: 20, scope: !1730)
!1732 = !DILocation(line: 1770, column: 18, scope: !1730)
!1733 = !DILocation(line: 1770, column: 5, scope: !1730)
!1734 = !DILocation(line: 1774, column: 5, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1723, file: !72, line: 1773, column: 4)
!1736 = !DILocation(line: 1779, column: 21, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1738, file: !72, line: 1779, column: 7)
!1738 = distinct !DILexicalBlock(scope: !1718, file: !72, line: 1778, column: 3)
!1739 = !DILocation(line: 1779, column: 19, scope: !1737)
!1740 = !DILocation(line: 1779, column: 29, scope: !1737)
!1741 = !DILocation(line: 1779, column: 27, scope: !1737)
!1742 = !DILocation(line: 1779, column: 7, scope: !1738)
!1743 = !DILocation(line: 1781, column: 5, scope: !1744)
!1744 = distinct !DILexicalBlock(scope: !1737, file: !72, line: 1780, column: 4)
!1745 = !DILocation(line: 1785, column: 13, scope: !1746)
!1746 = distinct !DILexicalBlock(scope: !1737, file: !72, line: 1784, column: 4)
!1747 = !DILocation(line: 1785, column: 20, scope: !1746)
!1748 = !DILocation(line: 1785, column: 18, scope: !1746)
!1749 = !DILocation(line: 1785, column: 5, scope: !1746)
!1750 = !DILocation(line: 1791, column: 3, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1714, file: !72, line: 1790, column: 2)
!1752 = !DILocation(line: 1793, column: 1, scope: !1695)
!1753 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !72, file: !72, line: 1810, type: !775, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1754 = !DILocalVariable(name: "val1", arg: 1, scope: !1753, file: !72, line: 1810, type: !80)
!1755 = !DILocation(line: 1810, column: 30, scope: !1753)
!1756 = !DILocalVariable(name: "val2", arg: 2, scope: !1753, file: !72, line: 1810, type: !22)
!1757 = !DILocation(line: 1810, column: 39, scope: !1753)
!1758 = !DILocalVariable(name: "u32Temp1", scope: !1753, file: !72, line: 1812, type: !736)
!1759 = !DILocation(line: 1812, column: 6, scope: !1753)
!1760 = !DILocalVariable(name: "u32Temp2", scope: !1753, file: !72, line: 1812, type: !736)
!1761 = !DILocation(line: 1812, column: 17, scope: !1753)
!1762 = !DILocalVariable(name: "u32Temp3", scope: !1753, file: !72, line: 1812, type: !736)
!1763 = !DILocation(line: 1812, column: 26, scope: !1753)
!1764 = !DILocalVariable(name: "u8SignBit", scope: !1753, file: !72, line: 1813, type: !17)
!1765 = !DILocation(line: 1813, column: 5, scope: !1753)
!1766 = !DILocation(line: 1815, column: 5, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1753, file: !72, line: 1815, column: 5)
!1768 = !DILocation(line: 1815, column: 9, scope: !1767)
!1769 = !DILocation(line: 1815, column: 5, scope: !1753)
!1770 = !DILocation(line: 1817, column: 15, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1767, file: !72, line: 1816, column: 2)
!1772 = !DILocation(line: 1817, column: 14, scope: !1771)
!1773 = !DILocation(line: 1817, column: 12, scope: !1771)
!1774 = !DILocation(line: 1818, column: 13, scope: !1771)
!1775 = !DILocation(line: 1819, column: 2, scope: !1771)
!1776 = !DILocation(line: 1822, column: 14, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1767, file: !72, line: 1821, column: 2)
!1778 = !DILocation(line: 1822, column: 12, scope: !1777)
!1779 = !DILocation(line: 1823, column: 13, scope: !1777)
!1780 = !DILocation(line: 1826, column: 13, scope: !1753)
!1781 = !DILocation(line: 1826, column: 24, scope: !1753)
!1782 = !DILocation(line: 1826, column: 22, scope: !1753)
!1783 = !DILocation(line: 1826, column: 11, scope: !1753)
!1784 = !DILocation(line: 1827, column: 25, scope: !1753)
!1785 = !DILocation(line: 1827, column: 35, scope: !1753)
!1786 = !DILocation(line: 1827, column: 13, scope: !1753)
!1787 = !DILocation(line: 1827, column: 11, scope: !1753)
!1788 = !DILocation(line: 1828, column: 13, scope: !1753)
!1789 = !DILocation(line: 1828, column: 22, scope: !1753)
!1790 = !DILocation(line: 1828, column: 11, scope: !1753)
!1791 = !DILocation(line: 1829, column: 14, scope: !1753)
!1792 = !DILocation(line: 1829, column: 23, scope: !1753)
!1793 = !DILocation(line: 1829, column: 11, scope: !1753)
!1794 = !DILocation(line: 1830, column: 5, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1753, file: !72, line: 1830, column: 5)
!1796 = !DILocation(line: 1830, column: 15, scope: !1795)
!1797 = !DILocation(line: 1830, column: 5, scope: !1753)
!1798 = !DILocation(line: 1832, column: 10, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1795, file: !72, line: 1831, column: 2)
!1800 = !DILocation(line: 1832, column: 3, scope: !1799)
!1801 = !DILocation(line: 1836, column: 11, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1795, file: !72, line: 1835, column: 2)
!1803 = !DILocation(line: 1836, column: 10, scope: !1802)
!1804 = !DILocation(line: 1836, column: 3, scope: !1802)
!1805 = !DILocation(line: 1838, column: 1, scope: !1753)
!1806 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !72, file: !72, line: 1857, type: !775, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1807 = !DILocalVariable(name: "val1", arg: 1, scope: !1806, file: !72, line: 1857, type: !80)
!1808 = !DILocation(line: 1857, column: 30, scope: !1806)
!1809 = !DILocalVariable(name: "val2", arg: 2, scope: !1806, file: !72, line: 1857, type: !22)
!1810 = !DILocation(line: 1857, column: 39, scope: !1806)
!1811 = !DILocalVariable(name: "u32Temp1", scope: !1806, file: !72, line: 1859, type: !736)
!1812 = !DILocation(line: 1859, column: 6, scope: !1806)
!1813 = !DILocalVariable(name: "u32Temp2", scope: !1806, file: !72, line: 1859, type: !736)
!1814 = !DILocation(line: 1859, column: 17, scope: !1806)
!1815 = !DILocalVariable(name: "u32Temp3", scope: !1806, file: !72, line: 1859, type: !736)
!1816 = !DILocation(line: 1859, column: 26, scope: !1806)
!1817 = !DILocalVariable(name: "u8SignBit", scope: !1806, file: !72, line: 1860, type: !17)
!1818 = !DILocation(line: 1860, column: 5, scope: !1806)
!1819 = !DILocation(line: 1862, column: 5, scope: !1820)
!1820 = distinct !DILexicalBlock(scope: !1806, file: !72, line: 1862, column: 5)
!1821 = !DILocation(line: 1862, column: 9, scope: !1820)
!1822 = !DILocation(line: 1862, column: 5, scope: !1806)
!1823 = !DILocation(line: 1864, column: 15, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1820, file: !72, line: 1863, column: 2)
!1825 = !DILocation(line: 1864, column: 14, scope: !1824)
!1826 = !DILocation(line: 1864, column: 12, scope: !1824)
!1827 = !DILocation(line: 1865, column: 13, scope: !1824)
!1828 = !DILocation(line: 1866, column: 2, scope: !1824)
!1829 = !DILocation(line: 1869, column: 14, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1820, file: !72, line: 1868, column: 2)
!1831 = !DILocation(line: 1869, column: 12, scope: !1830)
!1832 = !DILocation(line: 1870, column: 13, scope: !1830)
!1833 = !DILocation(line: 1873, column: 13, scope: !1806)
!1834 = !DILocation(line: 1873, column: 24, scope: !1806)
!1835 = !DILocation(line: 1873, column: 22, scope: !1806)
!1836 = !DILocation(line: 1873, column: 11, scope: !1806)
!1837 = !DILocation(line: 1874, column: 25, scope: !1806)
!1838 = !DILocation(line: 1874, column: 35, scope: !1806)
!1839 = !DILocation(line: 1874, column: 13, scope: !1806)
!1840 = !DILocation(line: 1874, column: 11, scope: !1806)
!1841 = !DILocation(line: 1875, column: 13, scope: !1806)
!1842 = !DILocation(line: 1875, column: 22, scope: !1806)
!1843 = !DILocation(line: 1875, column: 11, scope: !1806)
!1844 = !DILocation(line: 1876, column: 14, scope: !1806)
!1845 = !DILocation(line: 1876, column: 23, scope: !1806)
!1846 = !DILocation(line: 1876, column: 11, scope: !1806)
!1847 = !DILocation(line: 1877, column: 5, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1806, file: !72, line: 1877, column: 5)
!1849 = !DILocation(line: 1877, column: 15, scope: !1848)
!1850 = !DILocation(line: 1877, column: 5, scope: !1806)
!1851 = !DILocation(line: 1879, column: 6, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1853, file: !72, line: 1879, column: 6)
!1853 = distinct !DILexicalBlock(scope: !1848, file: !72, line: 1878, column: 2)
!1854 = !DILocation(line: 1879, column: 14, scope: !1852)
!1855 = !DILocation(line: 1879, column: 6, scope: !1853)
!1856 = !DILocation(line: 1880, column: 11, scope: !1852)
!1857 = !DILocation(line: 1880, column: 4, scope: !1852)
!1858 = !DILocation(line: 1882, column: 4, scope: !1852)
!1859 = !DILocation(line: 1886, column: 6, scope: !1860)
!1860 = distinct !DILexicalBlock(scope: !1861, file: !72, line: 1886, column: 6)
!1861 = distinct !DILexicalBlock(scope: !1848, file: !72, line: 1885, column: 2)
!1862 = !DILocation(line: 1886, column: 14, scope: !1860)
!1863 = !DILocation(line: 1886, column: 6, scope: !1861)
!1864 = !DILocation(line: 1887, column: 12, scope: !1860)
!1865 = !DILocation(line: 1887, column: 11, scope: !1860)
!1866 = !DILocation(line: 1887, column: 4, scope: !1860)
!1867 = !DILocation(line: 1889, column: 4, scope: !1860)
!1868 = !DILocation(line: 1891, column: 1, scope: !1806)
!1869 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !72, file: !72, line: 1911, type: !1870, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!80, !80, !13}
!1872 = !DILocalVariable(name: "val1", arg: 1, scope: !1869, file: !72, line: 1911, type: !80)
!1873 = !DILocation(line: 1911, column: 30, scope: !1869)
!1874 = !DILocalVariable(name: "val2", arg: 2, scope: !1869, file: !72, line: 1911, type: !13)
!1875 = !DILocation(line: 1911, column: 39, scope: !1869)
!1876 = !DILocalVariable(name: "u32Temp1", scope: !1869, file: !72, line: 1913, type: !736)
!1877 = !DILocation(line: 1913, column: 6, scope: !1869)
!1878 = !DILocalVariable(name: "u32Temp2", scope: !1869, file: !72, line: 1913, type: !736)
!1879 = !DILocation(line: 1913, column: 17, scope: !1869)
!1880 = !DILocalVariable(name: "u32Temp3", scope: !1869, file: !72, line: 1913, type: !736)
!1881 = !DILocation(line: 1913, column: 26, scope: !1869)
!1882 = !DILocalVariable(name: "u32Temp4", scope: !1869, file: !72, line: 1913, type: !736)
!1883 = !DILocation(line: 1913, column: 35, scope: !1869)
!1884 = !DILocalVariable(name: "u8SignBit", scope: !1869, file: !72, line: 1914, type: !17)
!1885 = !DILocation(line: 1914, column: 5, scope: !1869)
!1886 = !DILocation(line: 1916, column: 7, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1869, file: !72, line: 1916, column: 5)
!1888 = !DILocation(line: 1916, column: 11, scope: !1887)
!1889 = !DILocation(line: 1916, column: 15, scope: !1887)
!1890 = !DILocation(line: 1916, column: 19, scope: !1887)
!1891 = !DILocation(line: 1916, column: 23, scope: !1887)
!1892 = !DILocation(line: 1916, column: 28, scope: !1887)
!1893 = !DILocation(line: 1916, column: 33, scope: !1887)
!1894 = !DILocation(line: 1916, column: 37, scope: !1887)
!1895 = !DILocation(line: 1916, column: 41, scope: !1887)
!1896 = !DILocation(line: 1916, column: 45, scope: !1887)
!1897 = !DILocation(line: 1916, column: 49, scope: !1887)
!1898 = !DILocation(line: 1916, column: 5, scope: !1869)
!1899 = !DILocation(line: 1918, column: 13, scope: !1900)
!1900 = distinct !DILexicalBlock(scope: !1887, file: !72, line: 1917, column: 2)
!1901 = !DILocation(line: 1919, column: 2, scope: !1900)
!1902 = !DILocation(line: 1922, column: 13, scope: !1903)
!1903 = distinct !DILexicalBlock(scope: !1887, file: !72, line: 1921, column: 2)
!1904 = !DILocation(line: 1925, column: 5, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1869, file: !72, line: 1925, column: 5)
!1906 = !DILocation(line: 1925, column: 9, scope: !1905)
!1907 = !DILocation(line: 1925, column: 5, scope: !1869)
!1908 = !DILocation(line: 1927, column: 15, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1905, file: !72, line: 1926, column: 2)
!1910 = !DILocation(line: 1927, column: 14, scope: !1909)
!1911 = !DILocation(line: 1927, column: 12, scope: !1909)
!1912 = !DILocation(line: 1928, column: 2, scope: !1909)
!1913 = !DILocation(line: 1931, column: 14, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1905, file: !72, line: 1930, column: 2)
!1915 = !DILocation(line: 1931, column: 12, scope: !1914)
!1916 = !DILocation(line: 1934, column: 5, scope: !1917)
!1917 = distinct !DILexicalBlock(scope: !1869, file: !72, line: 1934, column: 5)
!1918 = !DILocation(line: 1934, column: 9, scope: !1917)
!1919 = !DILocation(line: 1934, column: 5, scope: !1869)
!1920 = !DILocation(line: 1936, column: 15, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1917, file: !72, line: 1935, column: 2)
!1922 = !DILocation(line: 1936, column: 14, scope: !1921)
!1923 = !DILocation(line: 1936, column: 12, scope: !1921)
!1924 = !DILocation(line: 1937, column: 2, scope: !1921)
!1925 = !DILocation(line: 1940, column: 14, scope: !1926)
!1926 = distinct !DILexicalBlock(scope: !1917, file: !72, line: 1939, column: 2)
!1927 = !DILocation(line: 1940, column: 12, scope: !1926)
!1928 = !DILocation(line: 1943, column: 13, scope: !1869)
!1929 = !DILocation(line: 1943, column: 24, scope: !1869)
!1930 = !DILocation(line: 1943, column: 22, scope: !1869)
!1931 = !DILocation(line: 1943, column: 11, scope: !1869)
!1932 = !DILocation(line: 1944, column: 25, scope: !1869)
!1933 = !DILocation(line: 1944, column: 35, scope: !1869)
!1934 = !DILocation(line: 1944, column: 13, scope: !1869)
!1935 = !DILocation(line: 1944, column: 11, scope: !1869)
!1936 = !DILocation(line: 1945, column: 13, scope: !1869)
!1937 = !DILocation(line: 1945, column: 22, scope: !1869)
!1938 = !DILocation(line: 1945, column: 11, scope: !1869)
!1939 = !DILocation(line: 1946, column: 14, scope: !1869)
!1940 = !DILocation(line: 1946, column: 23, scope: !1869)
!1941 = !DILocation(line: 1946, column: 11, scope: !1869)
!1942 = !DILocation(line: 1947, column: 5, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1869, file: !72, line: 1947, column: 5)
!1944 = !DILocation(line: 1947, column: 15, scope: !1943)
!1945 = !DILocation(line: 1947, column: 5, scope: !1869)
!1946 = !DILocation(line: 1949, column: 6, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1948, file: !72, line: 1949, column: 6)
!1948 = distinct !DILexicalBlock(scope: !1943, file: !72, line: 1948, column: 2)
!1949 = !DILocation(line: 1949, column: 14, scope: !1947)
!1950 = !DILocation(line: 1949, column: 6, scope: !1948)
!1951 = !DILocation(line: 1950, column: 11, scope: !1947)
!1952 = !DILocation(line: 1950, column: 4, scope: !1947)
!1953 = !DILocation(line: 1952, column: 4, scope: !1947)
!1954 = !DILocation(line: 1956, column: 11, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1943, file: !72, line: 1955, column: 2)
!1956 = !DILocation(line: 1956, column: 10, scope: !1955)
!1957 = !DILocation(line: 1956, column: 3, scope: !1955)
!1958 = !DILocation(line: 1958, column: 1, scope: !1869)
!1959 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !72, file: !72, line: 1977, type: !1870, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1960 = !DILocalVariable(name: "val1", arg: 1, scope: !1959, file: !72, line: 1977, type: !80)
!1961 = !DILocation(line: 1977, column: 30, scope: !1959)
!1962 = !DILocalVariable(name: "val2", arg: 2, scope: !1959, file: !72, line: 1977, type: !13)
!1963 = !DILocation(line: 1977, column: 39, scope: !1959)
!1964 = !DILocalVariable(name: "u32Temp1", scope: !1959, file: !72, line: 1979, type: !736)
!1965 = !DILocation(line: 1979, column: 6, scope: !1959)
!1966 = !DILocalVariable(name: "u32Temp2", scope: !1959, file: !72, line: 1979, type: !736)
!1967 = !DILocation(line: 1979, column: 17, scope: !1959)
!1968 = !DILocalVariable(name: "u32Temp3", scope: !1959, file: !72, line: 1979, type: !736)
!1969 = !DILocation(line: 1979, column: 26, scope: !1959)
!1970 = !DILocalVariable(name: "u32Temp4", scope: !1959, file: !72, line: 1979, type: !736)
!1971 = !DILocation(line: 1979, column: 35, scope: !1959)
!1972 = !DILocalVariable(name: "u8SignBit", scope: !1959, file: !72, line: 1980, type: !17)
!1973 = !DILocation(line: 1980, column: 5, scope: !1959)
!1974 = !DILocation(line: 1982, column: 7, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1959, file: !72, line: 1982, column: 5)
!1976 = !DILocation(line: 1982, column: 11, scope: !1975)
!1977 = !DILocation(line: 1982, column: 15, scope: !1975)
!1978 = !DILocation(line: 1982, column: 19, scope: !1975)
!1979 = !DILocation(line: 1982, column: 23, scope: !1975)
!1980 = !DILocation(line: 1982, column: 28, scope: !1975)
!1981 = !DILocation(line: 1982, column: 33, scope: !1975)
!1982 = !DILocation(line: 1982, column: 37, scope: !1975)
!1983 = !DILocation(line: 1982, column: 41, scope: !1975)
!1984 = !DILocation(line: 1982, column: 45, scope: !1975)
!1985 = !DILocation(line: 1982, column: 49, scope: !1975)
!1986 = !DILocation(line: 1982, column: 5, scope: !1959)
!1987 = !DILocation(line: 1984, column: 13, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1975, file: !72, line: 1983, column: 2)
!1989 = !DILocation(line: 1985, column: 2, scope: !1988)
!1990 = !DILocation(line: 1988, column: 13, scope: !1991)
!1991 = distinct !DILexicalBlock(scope: !1975, file: !72, line: 1987, column: 2)
!1992 = !DILocation(line: 1991, column: 5, scope: !1993)
!1993 = distinct !DILexicalBlock(scope: !1959, file: !72, line: 1991, column: 5)
!1994 = !DILocation(line: 1991, column: 9, scope: !1993)
!1995 = !DILocation(line: 1991, column: 5, scope: !1959)
!1996 = !DILocation(line: 1993, column: 15, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1993, file: !72, line: 1992, column: 2)
!1998 = !DILocation(line: 1993, column: 14, scope: !1997)
!1999 = !DILocation(line: 1993, column: 12, scope: !1997)
!2000 = !DILocation(line: 1994, column: 2, scope: !1997)
!2001 = !DILocation(line: 1997, column: 14, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1993, file: !72, line: 1996, column: 2)
!2003 = !DILocation(line: 1997, column: 12, scope: !2002)
!2004 = !DILocation(line: 2000, column: 5, scope: !2005)
!2005 = distinct !DILexicalBlock(scope: !1959, file: !72, line: 2000, column: 5)
!2006 = !DILocation(line: 2000, column: 9, scope: !2005)
!2007 = !DILocation(line: 2000, column: 5, scope: !1959)
!2008 = !DILocation(line: 2002, column: 15, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2005, file: !72, line: 2001, column: 2)
!2010 = !DILocation(line: 2002, column: 14, scope: !2009)
!2011 = !DILocation(line: 2002, column: 12, scope: !2009)
!2012 = !DILocation(line: 2003, column: 2, scope: !2009)
!2013 = !DILocation(line: 2006, column: 14, scope: !2014)
!2014 = distinct !DILexicalBlock(scope: !2005, file: !72, line: 2005, column: 2)
!2015 = !DILocation(line: 2006, column: 12, scope: !2014)
!2016 = !DILocation(line: 2009, column: 13, scope: !1959)
!2017 = !DILocation(line: 2009, column: 24, scope: !1959)
!2018 = !DILocation(line: 2009, column: 22, scope: !1959)
!2019 = !DILocation(line: 2009, column: 11, scope: !1959)
!2020 = !DILocation(line: 2010, column: 25, scope: !1959)
!2021 = !DILocation(line: 2010, column: 35, scope: !1959)
!2022 = !DILocation(line: 2010, column: 13, scope: !1959)
!2023 = !DILocation(line: 2010, column: 11, scope: !1959)
!2024 = !DILocation(line: 2011, column: 13, scope: !1959)
!2025 = !DILocation(line: 2011, column: 22, scope: !1959)
!2026 = !DILocation(line: 2011, column: 11, scope: !1959)
!2027 = !DILocation(line: 2012, column: 14, scope: !1959)
!2028 = !DILocation(line: 2012, column: 23, scope: !1959)
!2029 = !DILocation(line: 2012, column: 11, scope: !1959)
!2030 = !DILocation(line: 2013, column: 6, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !1959, file: !72, line: 2013, column: 5)
!2032 = !DILocation(line: 2013, column: 14, scope: !2031)
!2033 = !DILocation(line: 2013, column: 19, scope: !2031)
!2034 = !DILocation(line: 2013, column: 5, scope: !1959)
!2035 = !DILocation(line: 2015, column: 6, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !2037, file: !72, line: 2015, column: 6)
!2037 = distinct !DILexicalBlock(scope: !2031, file: !72, line: 2014, column: 2)
!2038 = !DILocation(line: 2015, column: 16, scope: !2036)
!2039 = !DILocation(line: 2015, column: 6, scope: !2037)
!2040 = !DILocation(line: 2017, column: 7, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2042, file: !72, line: 2017, column: 7)
!2042 = distinct !DILexicalBlock(scope: !2036, file: !72, line: 2016, column: 3)
!2043 = !DILocation(line: 2017, column: 15, scope: !2041)
!2044 = !DILocation(line: 2017, column: 7, scope: !2042)
!2045 = !DILocation(line: 2018, column: 12, scope: !2041)
!2046 = !DILocation(line: 2018, column: 5, scope: !2041)
!2047 = !DILocation(line: 2020, column: 5, scope: !2041)
!2048 = !DILocation(line: 2024, column: 7, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2050, file: !72, line: 2024, column: 7)
!2050 = distinct !DILexicalBlock(scope: !2036, file: !72, line: 2023, column: 3)
!2051 = !DILocation(line: 2024, column: 15, scope: !2049)
!2052 = !DILocation(line: 2024, column: 7, scope: !2050)
!2053 = !DILocation(line: 2025, column: 13, scope: !2049)
!2054 = !DILocation(line: 2025, column: 12, scope: !2049)
!2055 = !DILocation(line: 2025, column: 5, scope: !2049)
!2056 = !DILocation(line: 2027, column: 5, scope: !2049)
!2057 = !DILocation(line: 2032, column: 3, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2031, file: !72, line: 2031, column: 2)
!2059 = !DILocation(line: 2034, column: 1, scope: !1959)
!2060 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !72, file: !72, line: 2049, type: !2061, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2061 = !DISubroutineType(types: !2062)
!2062 = !{!80, !80, !736}
!2063 = !DILocalVariable(name: "val1", arg: 1, scope: !2060, file: !72, line: 2049, type: !80)
!2064 = !DILocation(line: 2049, column: 30, scope: !2060)
!2065 = !DILocalVariable(name: "val2", arg: 2, scope: !2060, file: !72, line: 2049, type: !736)
!2066 = !DILocation(line: 2049, column: 39, scope: !2060)
!2067 = !DILocalVariable(name: "u32Temp1", scope: !2060, file: !72, line: 2051, type: !736)
!2068 = !DILocation(line: 2051, column: 6, scope: !2060)
!2069 = !DILocalVariable(name: "u32Temp2", scope: !2060, file: !72, line: 2051, type: !736)
!2070 = !DILocation(line: 2051, column: 17, scope: !2060)
!2071 = !DILocalVariable(name: "u8SignBit", scope: !2060, file: !72, line: 2052, type: !17)
!2072 = !DILocation(line: 2052, column: 5, scope: !2060)
!2073 = !DILocation(line: 2054, column: 5, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2060, file: !72, line: 2054, column: 5)
!2075 = !DILocation(line: 2054, column: 9, scope: !2074)
!2076 = !DILocation(line: 2054, column: 5, scope: !2060)
!2077 = !DILocation(line: 2056, column: 15, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2074, file: !72, line: 2055, column: 2)
!2079 = !DILocation(line: 2056, column: 14, scope: !2078)
!2080 = !DILocation(line: 2056, column: 12, scope: !2078)
!2081 = !DILocation(line: 2057, column: 13, scope: !2078)
!2082 = !DILocation(line: 2058, column: 2, scope: !2078)
!2083 = !DILocation(line: 2061, column: 14, scope: !2084)
!2084 = distinct !DILexicalBlock(scope: !2074, file: !72, line: 2060, column: 2)
!2085 = !DILocation(line: 2061, column: 12, scope: !2084)
!2086 = !DILocation(line: 2062, column: 13, scope: !2084)
!2087 = !DILocation(line: 2065, column: 25, scope: !2060)
!2088 = !DILocation(line: 2065, column: 35, scope: !2060)
!2089 = !DILocation(line: 2065, column: 13, scope: !2060)
!2090 = !DILocation(line: 2065, column: 11, scope: !2060)
!2091 = !DILocation(line: 2066, column: 5, scope: !2092)
!2092 = distinct !DILexicalBlock(scope: !2060, file: !72, line: 2066, column: 5)
!2093 = !DILocation(line: 2066, column: 15, scope: !2092)
!2094 = !DILocation(line: 2066, column: 5, scope: !2060)
!2095 = !DILocation(line: 2067, column: 10, scope: !2092)
!2096 = !DILocation(line: 2067, column: 3, scope: !2092)
!2097 = !DILocation(line: 2069, column: 11, scope: !2092)
!2098 = !DILocation(line: 2069, column: 10, scope: !2092)
!2099 = !DILocation(line: 2069, column: 3, scope: !2092)
!2100 = !DILocation(line: 2070, column: 1, scope: !2060)
!2101 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !72, file: !72, line: 2089, type: !2061, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2102 = !DILocalVariable(name: "val1", arg: 1, scope: !2101, file: !72, line: 2089, type: !80)
!2103 = !DILocation(line: 2089, column: 30, scope: !2101)
!2104 = !DILocalVariable(name: "val2", arg: 2, scope: !2101, file: !72, line: 2089, type: !736)
!2105 = !DILocation(line: 2089, column: 39, scope: !2101)
!2106 = !DILocalVariable(name: "u32Temp1", scope: !2101, file: !72, line: 2091, type: !736)
!2107 = !DILocation(line: 2091, column: 6, scope: !2101)
!2108 = !DILocalVariable(name: "u32Temp2", scope: !2101, file: !72, line: 2091, type: !736)
!2109 = !DILocation(line: 2091, column: 17, scope: !2101)
!2110 = !DILocalVariable(name: "u32Temp3", scope: !2101, file: !72, line: 2091, type: !736)
!2111 = !DILocation(line: 2091, column: 26, scope: !2101)
!2112 = !DILocalVariable(name: "u8SignBit", scope: !2101, file: !72, line: 2092, type: !17)
!2113 = !DILocation(line: 2092, column: 5, scope: !2101)
!2114 = !DILocation(line: 2094, column: 5, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2101, file: !72, line: 2094, column: 5)
!2116 = !DILocation(line: 2094, column: 9, scope: !2115)
!2117 = !DILocation(line: 2094, column: 5, scope: !2101)
!2118 = !DILocation(line: 2096, column: 15, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2115, file: !72, line: 2095, column: 2)
!2120 = !DILocation(line: 2096, column: 14, scope: !2119)
!2121 = !DILocation(line: 2096, column: 12, scope: !2119)
!2122 = !DILocation(line: 2097, column: 13, scope: !2119)
!2123 = !DILocation(line: 2098, column: 2, scope: !2119)
!2124 = !DILocation(line: 2101, column: 14, scope: !2125)
!2125 = distinct !DILexicalBlock(scope: !2115, file: !72, line: 2100, column: 2)
!2126 = !DILocation(line: 2101, column: 12, scope: !2125)
!2127 = !DILocation(line: 2102, column: 13, scope: !2125)
!2128 = !DILocation(line: 2105, column: 13, scope: !2101)
!2129 = !DILocation(line: 2105, column: 24, scope: !2101)
!2130 = !DILocation(line: 2105, column: 22, scope: !2101)
!2131 = !DILocation(line: 2105, column: 11, scope: !2101)
!2132 = !DILocation(line: 2106, column: 25, scope: !2101)
!2133 = !DILocation(line: 2106, column: 35, scope: !2101)
!2134 = !DILocation(line: 2106, column: 13, scope: !2101)
!2135 = !DILocation(line: 2106, column: 11, scope: !2101)
!2136 = !DILocation(line: 2107, column: 13, scope: !2101)
!2137 = !DILocation(line: 2107, column: 22, scope: !2101)
!2138 = !DILocation(line: 2107, column: 11, scope: !2101)
!2139 = !DILocation(line: 2108, column: 14, scope: !2101)
!2140 = !DILocation(line: 2108, column: 23, scope: !2101)
!2141 = !DILocation(line: 2108, column: 11, scope: !2101)
!2142 = !DILocation(line: 2109, column: 5, scope: !2143)
!2143 = distinct !DILexicalBlock(scope: !2101, file: !72, line: 2109, column: 5)
!2144 = !DILocation(line: 2109, column: 15, scope: !2143)
!2145 = !DILocation(line: 2109, column: 5, scope: !2101)
!2146 = !DILocation(line: 2111, column: 6, scope: !2147)
!2147 = distinct !DILexicalBlock(scope: !2148, file: !72, line: 2111, column: 6)
!2148 = distinct !DILexicalBlock(scope: !2143, file: !72, line: 2110, column: 2)
!2149 = !DILocation(line: 2111, column: 14, scope: !2147)
!2150 = !DILocation(line: 2111, column: 6, scope: !2148)
!2151 = !DILocation(line: 2112, column: 11, scope: !2147)
!2152 = !DILocation(line: 2112, column: 4, scope: !2147)
!2153 = !DILocation(line: 2114, column: 4, scope: !2147)
!2154 = !DILocation(line: 2118, column: 6, scope: !2155)
!2155 = distinct !DILexicalBlock(scope: !2156, file: !72, line: 2118, column: 6)
!2156 = distinct !DILexicalBlock(scope: !2143, file: !72, line: 2117, column: 2)
!2157 = !DILocation(line: 2118, column: 14, scope: !2155)
!2158 = !DILocation(line: 2118, column: 6, scope: !2156)
!2159 = !DILocation(line: 2119, column: 12, scope: !2155)
!2160 = !DILocation(line: 2119, column: 11, scope: !2155)
!2161 = !DILocation(line: 2119, column: 4, scope: !2155)
!2162 = !DILocation(line: 2121, column: 4, scope: !2155)
!2163 = !DILocation(line: 2123, column: 1, scope: !2101)
!2164 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !72, file: !72, line: 2141, type: !2165, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2165 = !DISubroutineType(types: !2166)
!2166 = !{!80, !80, !80}
!2167 = !DILocalVariable(name: "value", arg: 1, scope: !2164, file: !72, line: 2141, type: !80)
!2168 = !DILocation(line: 2141, column: 30, scope: !2164)
!2169 = !DILocalVariable(name: "factor", arg: 2, scope: !2164, file: !72, line: 2141, type: !80)
!2170 = !DILocation(line: 2141, column: 41, scope: !2164)
!2171 = !DILocalVariable(name: "u32Temp1", scope: !2164, file: !72, line: 2143, type: !736)
!2172 = !DILocation(line: 2143, column: 6, scope: !2164)
!2173 = !DILocalVariable(name: "u32Temp2", scope: !2164, file: !72, line: 2143, type: !736)
!2174 = !DILocation(line: 2143, column: 17, scope: !2164)
!2175 = !DILocalVariable(name: "u32Temp3", scope: !2164, file: !72, line: 2143, type: !736)
!2176 = !DILocation(line: 2143, column: 26, scope: !2164)
!2177 = !DILocalVariable(name: "u32Temp4", scope: !2164, file: !72, line: 2143, type: !736)
!2178 = !DILocation(line: 2143, column: 35, scope: !2164)
!2179 = !DILocalVariable(name: "u8SignBit", scope: !2164, file: !72, line: 2144, type: !17)
!2180 = !DILocation(line: 2144, column: 5, scope: !2164)
!2181 = !DILocation(line: 2146, column: 7, scope: !2182)
!2182 = distinct !DILexicalBlock(scope: !2164, file: !72, line: 2146, column: 5)
!2183 = !DILocation(line: 2146, column: 12, scope: !2182)
!2184 = !DILocation(line: 2146, column: 16, scope: !2182)
!2185 = !DILocation(line: 2146, column: 36, scope: !2182)
!2186 = !DILocation(line: 2146, column: 41, scope: !2182)
!2187 = !DILocation(line: 2146, column: 45, scope: !2182)
!2188 = !DILocation(line: 2148, column: 13, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2182, file: !72, line: 2147, column: 2)
!2190 = !DILocation(line: 2149, column: 2, scope: !2189)
!2191 = !DILocation(line: 2152, column: 13, scope: !2192)
!2192 = distinct !DILexicalBlock(scope: !2182, file: !72, line: 2151, column: 2)
!2193 = !DILocation(line: 2155, column: 5, scope: !2194)
!2194 = distinct !DILexicalBlock(scope: !2164, file: !72, line: 2155, column: 5)
!2195 = !DILocation(line: 2155, column: 10, scope: !2194)
!2196 = !DILocation(line: 2155, column: 5, scope: !2164)
!2197 = !DILocation(line: 2157, column: 15, scope: !2198)
!2198 = distinct !DILexicalBlock(scope: !2194, file: !72, line: 2156, column: 2)
!2199 = !DILocation(line: 2157, column: 14, scope: !2198)
!2200 = !DILocation(line: 2157, column: 12, scope: !2198)
!2201 = !DILocation(line: 2158, column: 2, scope: !2198)
!2202 = !DILocation(line: 2161, column: 14, scope: !2203)
!2203 = distinct !DILexicalBlock(scope: !2194, file: !72, line: 2160, column: 2)
!2204 = !DILocation(line: 2161, column: 12, scope: !2203)
!2205 = !DILocation(line: 2164, column: 5, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2164, file: !72, line: 2164, column: 5)
!2207 = !DILocation(line: 2164, column: 11, scope: !2206)
!2208 = !DILocation(line: 2164, column: 5, scope: !2164)
!2209 = !DILocation(line: 2166, column: 15, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2206, file: !72, line: 2165, column: 2)
!2211 = !DILocation(line: 2166, column: 14, scope: !2210)
!2212 = !DILocation(line: 2166, column: 12, scope: !2210)
!2213 = !DILocation(line: 2167, column: 2, scope: !2210)
!2214 = !DILocation(line: 2170, column: 14, scope: !2215)
!2215 = distinct !DILexicalBlock(scope: !2206, file: !72, line: 2169, column: 2)
!2216 = !DILocation(line: 2170, column: 12, scope: !2215)
!2217 = !DILocation(line: 2173, column: 13, scope: !2164)
!2218 = !DILocation(line: 2173, column: 24, scope: !2164)
!2219 = !DILocation(line: 2173, column: 22, scope: !2164)
!2220 = !DILocation(line: 2173, column: 11, scope: !2164)
!2221 = !DILocation(line: 2174, column: 25, scope: !2164)
!2222 = !DILocation(line: 2174, column: 35, scope: !2164)
!2223 = !DILocation(line: 2174, column: 13, scope: !2164)
!2224 = !DILocation(line: 2174, column: 11, scope: !2164)
!2225 = !DILocation(line: 2175, column: 13, scope: !2164)
!2226 = !DILocation(line: 2175, column: 22, scope: !2164)
!2227 = !DILocation(line: 2175, column: 11, scope: !2164)
!2228 = !DILocation(line: 2176, column: 14, scope: !2164)
!2229 = !DILocation(line: 2176, column: 23, scope: !2164)
!2230 = !DILocation(line: 2176, column: 11, scope: !2164)
!2231 = !DILocation(line: 2177, column: 5, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2164, file: !72, line: 2177, column: 5)
!2233 = !DILocation(line: 2177, column: 15, scope: !2232)
!2234 = !DILocation(line: 2177, column: 5, scope: !2164)
!2235 = !DILocation(line: 2179, column: 6, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2237, file: !72, line: 2179, column: 6)
!2237 = distinct !DILexicalBlock(scope: !2232, file: !72, line: 2178, column: 2)
!2238 = !DILocation(line: 2179, column: 14, scope: !2236)
!2239 = !DILocation(line: 2179, column: 6, scope: !2237)
!2240 = !DILocation(line: 2180, column: 11, scope: !2236)
!2241 = !DILocation(line: 2180, column: 4, scope: !2236)
!2242 = !DILocation(line: 2182, column: 4, scope: !2236)
!2243 = !DILocation(line: 2186, column: 11, scope: !2244)
!2244 = distinct !DILexicalBlock(scope: !2232, file: !72, line: 2185, column: 2)
!2245 = !DILocation(line: 2186, column: 10, scope: !2244)
!2246 = !DILocation(line: 2186, column: 3, scope: !2244)
!2247 = !DILocation(line: 2188, column: 1, scope: !2164)
!2248 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !72, file: !72, line: 2207, type: !2165, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2249 = !DILocalVariable(name: "value", arg: 1, scope: !2248, file: !72, line: 2207, type: !80)
!2250 = !DILocation(line: 2207, column: 30, scope: !2248)
!2251 = !DILocalVariable(name: "factor", arg: 2, scope: !2248, file: !72, line: 2207, type: !80)
!2252 = !DILocation(line: 2207, column: 41, scope: !2248)
!2253 = !DILocalVariable(name: "u32Temp1", scope: !2248, file: !72, line: 2209, type: !736)
!2254 = !DILocation(line: 2209, column: 6, scope: !2248)
!2255 = !DILocalVariable(name: "u32Temp2", scope: !2248, file: !72, line: 2209, type: !736)
!2256 = !DILocation(line: 2209, column: 17, scope: !2248)
!2257 = !DILocalVariable(name: "u32Temp3", scope: !2248, file: !72, line: 2209, type: !736)
!2258 = !DILocation(line: 2209, column: 26, scope: !2248)
!2259 = !DILocalVariable(name: "u32Temp4", scope: !2248, file: !72, line: 2209, type: !736)
!2260 = !DILocation(line: 2209, column: 35, scope: !2248)
!2261 = !DILocalVariable(name: "u8SignBit", scope: !2248, file: !72, line: 2210, type: !17)
!2262 = !DILocation(line: 2210, column: 5, scope: !2248)
!2263 = !DILocation(line: 2212, column: 7, scope: !2264)
!2264 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2212, column: 5)
!2265 = !DILocation(line: 2212, column: 12, scope: !2264)
!2266 = !DILocation(line: 2212, column: 16, scope: !2264)
!2267 = !DILocation(line: 2212, column: 36, scope: !2264)
!2268 = !DILocation(line: 2212, column: 41, scope: !2264)
!2269 = !DILocation(line: 2212, column: 45, scope: !2264)
!2270 = !DILocation(line: 2214, column: 13, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !2264, file: !72, line: 2213, column: 2)
!2272 = !DILocation(line: 2215, column: 2, scope: !2271)
!2273 = !DILocation(line: 2218, column: 13, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2264, file: !72, line: 2217, column: 2)
!2275 = !DILocation(line: 2221, column: 5, scope: !2276)
!2276 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2221, column: 5)
!2277 = !DILocation(line: 2221, column: 10, scope: !2276)
!2278 = !DILocation(line: 2221, column: 5, scope: !2248)
!2279 = !DILocation(line: 2223, column: 15, scope: !2280)
!2280 = distinct !DILexicalBlock(scope: !2276, file: !72, line: 2222, column: 2)
!2281 = !DILocation(line: 2223, column: 14, scope: !2280)
!2282 = !DILocation(line: 2223, column: 12, scope: !2280)
!2283 = !DILocation(line: 2224, column: 2, scope: !2280)
!2284 = !DILocation(line: 2227, column: 14, scope: !2285)
!2285 = distinct !DILexicalBlock(scope: !2276, file: !72, line: 2226, column: 2)
!2286 = !DILocation(line: 2227, column: 12, scope: !2285)
!2287 = !DILocation(line: 2230, column: 5, scope: !2288)
!2288 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2230, column: 5)
!2289 = !DILocation(line: 2230, column: 11, scope: !2288)
!2290 = !DILocation(line: 2230, column: 5, scope: !2248)
!2291 = !DILocation(line: 2232, column: 15, scope: !2292)
!2292 = distinct !DILexicalBlock(scope: !2288, file: !72, line: 2231, column: 2)
!2293 = !DILocation(line: 2232, column: 14, scope: !2292)
!2294 = !DILocation(line: 2232, column: 12, scope: !2292)
!2295 = !DILocation(line: 2233, column: 2, scope: !2292)
!2296 = !DILocation(line: 2236, column: 14, scope: !2297)
!2297 = distinct !DILexicalBlock(scope: !2288, file: !72, line: 2235, column: 2)
!2298 = !DILocation(line: 2236, column: 12, scope: !2297)
!2299 = !DILocation(line: 2239, column: 13, scope: !2248)
!2300 = !DILocation(line: 2239, column: 24, scope: !2248)
!2301 = !DILocation(line: 2239, column: 22, scope: !2248)
!2302 = !DILocation(line: 2239, column: 11, scope: !2248)
!2303 = !DILocation(line: 2240, column: 25, scope: !2248)
!2304 = !DILocation(line: 2240, column: 35, scope: !2248)
!2305 = !DILocation(line: 2240, column: 13, scope: !2248)
!2306 = !DILocation(line: 2240, column: 11, scope: !2248)
!2307 = !DILocation(line: 2241, column: 13, scope: !2248)
!2308 = !DILocation(line: 2241, column: 22, scope: !2248)
!2309 = !DILocation(line: 2241, column: 11, scope: !2248)
!2310 = !DILocation(line: 2242, column: 14, scope: !2248)
!2311 = !DILocation(line: 2242, column: 23, scope: !2248)
!2312 = !DILocation(line: 2242, column: 11, scope: !2248)
!2313 = !DILocation(line: 2243, column: 6, scope: !2314)
!2314 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2243, column: 5)
!2315 = !DILocation(line: 2243, column: 14, scope: !2314)
!2316 = !DILocation(line: 2243, column: 19, scope: !2314)
!2317 = !DILocation(line: 2243, column: 5, scope: !2248)
!2318 = !DILocation(line: 2245, column: 6, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2320, file: !72, line: 2245, column: 6)
!2320 = distinct !DILexicalBlock(scope: !2314, file: !72, line: 2244, column: 2)
!2321 = !DILocation(line: 2245, column: 16, scope: !2319)
!2322 = !DILocation(line: 2245, column: 6, scope: !2320)
!2323 = !DILocation(line: 2247, column: 7, scope: !2324)
!2324 = distinct !DILexicalBlock(scope: !2325, file: !72, line: 2247, column: 7)
!2325 = distinct !DILexicalBlock(scope: !2319, file: !72, line: 2246, column: 3)
!2326 = !DILocation(line: 2247, column: 15, scope: !2324)
!2327 = !DILocation(line: 2247, column: 7, scope: !2325)
!2328 = !DILocation(line: 2248, column: 12, scope: !2324)
!2329 = !DILocation(line: 2248, column: 5, scope: !2324)
!2330 = !DILocation(line: 2250, column: 5, scope: !2324)
!2331 = !DILocation(line: 2254, column: 7, scope: !2332)
!2332 = distinct !DILexicalBlock(scope: !2333, file: !72, line: 2254, column: 7)
!2333 = distinct !DILexicalBlock(scope: !2319, file: !72, line: 2253, column: 3)
!2334 = !DILocation(line: 2254, column: 15, scope: !2332)
!2335 = !DILocation(line: 2254, column: 7, scope: !2333)
!2336 = !DILocation(line: 2255, column: 13, scope: !2332)
!2337 = !DILocation(line: 2255, column: 12, scope: !2332)
!2338 = !DILocation(line: 2255, column: 5, scope: !2332)
!2339 = !DILocation(line: 2257, column: 5, scope: !2332)
!2340 = !DILocation(line: 2262, column: 4, scope: !2341)
!2341 = distinct !DILexicalBlock(scope: !2314, file: !72, line: 2261, column: 2)
!2342 = !DILocation(line: 2264, column: 1, scope: !2248)
!2343 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !72, file: !72, line: 2282, type: !2344, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2344 = !DISubroutineType(types: !2345)
!2345 = !{!80, !80, !17}
!2346 = !DILocalVariable(name: "value", arg: 1, scope: !2343, file: !72, line: 2282, type: !80)
!2347 = !DILocation(line: 2282, column: 29, scope: !2343)
!2348 = !DILocalVariable(name: "factor", arg: 2, scope: !2343, file: !72, line: 2282, type: !17)
!2349 = !DILocation(line: 2282, column: 39, scope: !2343)
!2350 = !DILocalVariable(name: "u32Temp1", scope: !2343, file: !72, line: 2284, type: !736)
!2351 = !DILocation(line: 2284, column: 6, scope: !2343)
!2352 = !DILocalVariable(name: "u32Temp2", scope: !2343, file: !72, line: 2284, type: !736)
!2353 = !DILocation(line: 2284, column: 17, scope: !2343)
!2354 = !DILocalVariable(name: "u32Temp3", scope: !2343, file: !72, line: 2284, type: !736)
!2355 = !DILocation(line: 2284, column: 26, scope: !2343)
!2356 = !DILocalVariable(name: "u8SignBit", scope: !2343, file: !72, line: 2285, type: !17)
!2357 = !DILocation(line: 2285, column: 5, scope: !2343)
!2358 = !DILocation(line: 2287, column: 5, scope: !2359)
!2359 = distinct !DILexicalBlock(scope: !2343, file: !72, line: 2287, column: 5)
!2360 = !DILocation(line: 2287, column: 10, scope: !2359)
!2361 = !DILocation(line: 2287, column: 5, scope: !2343)
!2362 = !DILocation(line: 2289, column: 15, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2359, file: !72, line: 2288, column: 2)
!2364 = !DILocation(line: 2289, column: 14, scope: !2363)
!2365 = !DILocation(line: 2289, column: 12, scope: !2363)
!2366 = !DILocation(line: 2290, column: 13, scope: !2363)
!2367 = !DILocation(line: 2291, column: 2, scope: !2363)
!2368 = !DILocation(line: 2294, column: 14, scope: !2369)
!2369 = distinct !DILexicalBlock(scope: !2359, file: !72, line: 2293, column: 2)
!2370 = !DILocation(line: 2294, column: 12, scope: !2369)
!2371 = !DILocation(line: 2295, column: 13, scope: !2369)
!2372 = !DILocation(line: 2298, column: 13, scope: !2343)
!2373 = !DILocation(line: 2298, column: 24, scope: !2343)
!2374 = !DILocation(line: 2298, column: 22, scope: !2343)
!2375 = !DILocation(line: 2298, column: 11, scope: !2343)
!2376 = !DILocation(line: 2299, column: 25, scope: !2343)
!2377 = !DILocation(line: 2299, column: 35, scope: !2343)
!2378 = !DILocation(line: 2299, column: 13, scope: !2343)
!2379 = !DILocation(line: 2299, column: 11, scope: !2343)
!2380 = !DILocation(line: 2300, column: 13, scope: !2343)
!2381 = !DILocation(line: 2300, column: 22, scope: !2343)
!2382 = !DILocation(line: 2300, column: 11, scope: !2343)
!2383 = !DILocation(line: 2301, column: 14, scope: !2343)
!2384 = !DILocation(line: 2301, column: 23, scope: !2343)
!2385 = !DILocation(line: 2301, column: 11, scope: !2343)
!2386 = !DILocation(line: 2302, column: 5, scope: !2387)
!2387 = distinct !DILexicalBlock(scope: !2343, file: !72, line: 2302, column: 5)
!2388 = !DILocation(line: 2302, column: 15, scope: !2387)
!2389 = !DILocation(line: 2302, column: 5, scope: !2343)
!2390 = !DILocation(line: 2304, column: 10, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2387, file: !72, line: 2303, column: 2)
!2392 = !DILocation(line: 2304, column: 3, scope: !2391)
!2393 = !DILocation(line: 2308, column: 11, scope: !2394)
!2394 = distinct !DILexicalBlock(scope: !2387, file: !72, line: 2307, column: 2)
!2395 = !DILocation(line: 2308, column: 10, scope: !2394)
!2396 = !DILocation(line: 2308, column: 3, scope: !2394)
!2397 = !DILocation(line: 2310, column: 1, scope: !2343)
!2398 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !72, file: !72, line: 2329, type: !2344, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2399 = !DILocalVariable(name: "value", arg: 1, scope: !2398, file: !72, line: 2329, type: !80)
!2400 = !DILocation(line: 2329, column: 29, scope: !2398)
!2401 = !DILocalVariable(name: "factor", arg: 2, scope: !2398, file: !72, line: 2329, type: !17)
!2402 = !DILocation(line: 2329, column: 39, scope: !2398)
!2403 = !DILocalVariable(name: "u32Temp1", scope: !2398, file: !72, line: 2331, type: !736)
!2404 = !DILocation(line: 2331, column: 6, scope: !2398)
!2405 = !DILocalVariable(name: "u32Temp2", scope: !2398, file: !72, line: 2331, type: !736)
!2406 = !DILocation(line: 2331, column: 17, scope: !2398)
!2407 = !DILocalVariable(name: "u32Temp3", scope: !2398, file: !72, line: 2331, type: !736)
!2408 = !DILocation(line: 2331, column: 26, scope: !2398)
!2409 = !DILocalVariable(name: "u8SignBit", scope: !2398, file: !72, line: 2332, type: !17)
!2410 = !DILocation(line: 2332, column: 5, scope: !2398)
!2411 = !DILocation(line: 2334, column: 5, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2398, file: !72, line: 2334, column: 5)
!2413 = !DILocation(line: 2334, column: 10, scope: !2412)
!2414 = !DILocation(line: 2334, column: 5, scope: !2398)
!2415 = !DILocation(line: 2336, column: 15, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2412, file: !72, line: 2335, column: 2)
!2417 = !DILocation(line: 2336, column: 14, scope: !2416)
!2418 = !DILocation(line: 2336, column: 12, scope: !2416)
!2419 = !DILocation(line: 2337, column: 13, scope: !2416)
!2420 = !DILocation(line: 2338, column: 2, scope: !2416)
!2421 = !DILocation(line: 2341, column: 14, scope: !2422)
!2422 = distinct !DILexicalBlock(scope: !2412, file: !72, line: 2340, column: 2)
!2423 = !DILocation(line: 2341, column: 12, scope: !2422)
!2424 = !DILocation(line: 2342, column: 13, scope: !2422)
!2425 = !DILocation(line: 2345, column: 13, scope: !2398)
!2426 = !DILocation(line: 2345, column: 24, scope: !2398)
!2427 = !DILocation(line: 2345, column: 22, scope: !2398)
!2428 = !DILocation(line: 2345, column: 11, scope: !2398)
!2429 = !DILocation(line: 2346, column: 25, scope: !2398)
!2430 = !DILocation(line: 2346, column: 35, scope: !2398)
!2431 = !DILocation(line: 2346, column: 13, scope: !2398)
!2432 = !DILocation(line: 2346, column: 11, scope: !2398)
!2433 = !DILocation(line: 2347, column: 13, scope: !2398)
!2434 = !DILocation(line: 2347, column: 22, scope: !2398)
!2435 = !DILocation(line: 2347, column: 11, scope: !2398)
!2436 = !DILocation(line: 2348, column: 14, scope: !2398)
!2437 = !DILocation(line: 2348, column: 23, scope: !2398)
!2438 = !DILocation(line: 2348, column: 11, scope: !2398)
!2439 = !DILocation(line: 2349, column: 5, scope: !2440)
!2440 = distinct !DILexicalBlock(scope: !2398, file: !72, line: 2349, column: 5)
!2441 = !DILocation(line: 2349, column: 15, scope: !2440)
!2442 = !DILocation(line: 2349, column: 5, scope: !2398)
!2443 = !DILocation(line: 2351, column: 6, scope: !2444)
!2444 = distinct !DILexicalBlock(scope: !2445, file: !72, line: 2351, column: 6)
!2445 = distinct !DILexicalBlock(scope: !2440, file: !72, line: 2350, column: 2)
!2446 = !DILocation(line: 2351, column: 14, scope: !2444)
!2447 = !DILocation(line: 2351, column: 6, scope: !2445)
!2448 = !DILocation(line: 2352, column: 11, scope: !2444)
!2449 = !DILocation(line: 2352, column: 4, scope: !2444)
!2450 = !DILocation(line: 2354, column: 4, scope: !2444)
!2451 = !DILocation(line: 2358, column: 6, scope: !2452)
!2452 = distinct !DILexicalBlock(scope: !2453, file: !72, line: 2358, column: 6)
!2453 = distinct !DILexicalBlock(scope: !2440, file: !72, line: 2357, column: 2)
!2454 = !DILocation(line: 2358, column: 14, scope: !2452)
!2455 = !DILocation(line: 2358, column: 6, scope: !2453)
!2456 = !DILocation(line: 2359, column: 12, scope: !2452)
!2457 = !DILocation(line: 2359, column: 11, scope: !2452)
!2458 = !DILocation(line: 2359, column: 4, scope: !2452)
!2459 = !DILocation(line: 2361, column: 4, scope: !2452)
!2460 = !DILocation(line: 2363, column: 1, scope: !2398)
!2461 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !72, file: !72, line: 2380, type: !2462, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2462 = !DISubroutineType(types: !2463)
!2463 = !{!736, !736, !736, !17}
!2464 = !DILocalVariable(name: "value", arg: 1, scope: !2461, file: !72, line: 2380, type: !736)
!2465 = !DILocation(line: 2380, column: 39, scope: !2461)
!2466 = !DILocalVariable(name: "factor", arg: 2, scope: !2461, file: !72, line: 2380, type: !736)
!2467 = !DILocation(line: 2380, column: 49, scope: !2461)
!2468 = !DILocalVariable(name: "power", arg: 3, scope: !2461, file: !72, line: 2380, type: !17)
!2469 = !DILocation(line: 2380, column: 60, scope: !2461)
!2470 = !DILocalVariable(name: "u32Temp1", scope: !2461, file: !72, line: 2382, type: !736)
!2471 = !DILocation(line: 2382, column: 6, scope: !2461)
!2472 = !DILocalVariable(name: "u32Temp2", scope: !2461, file: !72, line: 2382, type: !736)
!2473 = !DILocation(line: 2382, column: 20, scope: !2461)
!2474 = !DILocation(line: 2383, column: 5, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2461, file: !72, line: 2383, column: 5)
!2476 = !DILocation(line: 2383, column: 10, scope: !2475)
!2477 = !DILocation(line: 2383, column: 5, scope: !2461)
!2478 = !DILocation(line: 2385, column: 9, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2475, file: !72, line: 2384, column: 2)
!2480 = !DILocation(line: 2386, column: 2, scope: !2479)
!2481 = !DILocation(line: 2387, column: 10, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2475, file: !72, line: 2387, column: 10)
!2483 = !DILocation(line: 2387, column: 15, scope: !2482)
!2484 = !DILocation(line: 2387, column: 10, scope: !2475)
!2485 = !DILocation(line: 2389, column: 9, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2482, file: !72, line: 2388, column: 2)
!2487 = !DILocation(line: 2390, column: 2, scope: !2486)
!2488 = !DILocation(line: 2395, column: 13, scope: !2461)
!2489 = !DILocation(line: 2395, column: 21, scope: !2461)
!2490 = !DILocation(line: 2395, column: 19, scope: !2461)
!2491 = !DILocation(line: 2395, column: 11, scope: !2461)
!2492 = !DILocation(line: 2396, column: 25, scope: !2461)
!2493 = !DILocation(line: 2396, column: 32, scope: !2461)
!2494 = !DILocation(line: 2396, column: 13, scope: !2461)
!2495 = !DILocation(line: 2396, column: 11, scope: !2461)
!2496 = !DILocation(line: 2397, column: 13, scope: !2461)
!2497 = !DILocation(line: 2397, column: 29, scope: !2461)
!2498 = !DILocation(line: 2397, column: 28, scope: !2461)
!2499 = !DILocation(line: 2397, column: 22, scope: !2461)
!2500 = !DILocation(line: 2397, column: 11, scope: !2461)
!2501 = !DILocation(line: 2398, column: 14, scope: !2461)
!2502 = !DILocation(line: 2398, column: 26, scope: !2461)
!2503 = !DILocation(line: 2398, column: 23, scope: !2461)
!2504 = !DILocation(line: 2398, column: 11, scope: !2461)
!2505 = !DILocation(line: 2399, column: 6, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2461, file: !72, line: 2399, column: 5)
!2507 = !DILocation(line: 2399, column: 20, scope: !2506)
!2508 = !DILocation(line: 2399, column: 19, scope: !2506)
!2509 = !DILocation(line: 2399, column: 14, scope: !2506)
!2510 = !DILocation(line: 2399, column: 28, scope: !2506)
!2511 = !DILocation(line: 2399, column: 5, scope: !2461)
!2512 = !DILocation(line: 2401, column: 10, scope: !2513)
!2513 = distinct !DILexicalBlock(scope: !2506, file: !72, line: 2400, column: 2)
!2514 = !DILocation(line: 2401, column: 3, scope: !2513)
!2515 = !DILocation(line: 2405, column: 3, scope: !2516)
!2516 = distinct !DILexicalBlock(scope: !2506, file: !72, line: 2404, column: 2)
!2517 = !DILocation(line: 2407, column: 1, scope: !2461)
!2518 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !72, file: !72, line: 2425, type: !2519, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2519 = !DISubroutineType(types: !2520)
!2520 = !{!80, !80, !80, !17}
!2521 = !DILocalVariable(name: "value", arg: 1, scope: !2518, file: !72, line: 2425, type: !80)
!2522 = !DILocation(line: 2425, column: 39, scope: !2518)
!2523 = !DILocalVariable(name: "factor", arg: 2, scope: !2518, file: !72, line: 2425, type: !80)
!2524 = !DILocation(line: 2425, column: 50, scope: !2518)
!2525 = !DILocalVariable(name: "power", arg: 3, scope: !2518, file: !72, line: 2425, type: !17)
!2526 = !DILocation(line: 2425, column: 61, scope: !2518)
!2527 = !DILocalVariable(name: "u32Temp1", scope: !2518, file: !72, line: 2427, type: !736)
!2528 = !DILocation(line: 2427, column: 6, scope: !2518)
!2529 = !DILocalVariable(name: "u32Temp2", scope: !2518, file: !72, line: 2427, type: !736)
!2530 = !DILocation(line: 2427, column: 17, scope: !2518)
!2531 = !DILocalVariable(name: "u32Temp3", scope: !2518, file: !72, line: 2427, type: !736)
!2532 = !DILocation(line: 2427, column: 26, scope: !2518)
!2533 = !DILocalVariable(name: "u32Temp4", scope: !2518, file: !72, line: 2427, type: !736)
!2534 = !DILocation(line: 2427, column: 35, scope: !2518)
!2535 = !DILocalVariable(name: "u8SignBit", scope: !2518, file: !72, line: 2428, type: !17)
!2536 = !DILocation(line: 2428, column: 5, scope: !2518)
!2537 = !DILocation(line: 2430, column: 5, scope: !2538)
!2538 = distinct !DILexicalBlock(scope: !2518, file: !72, line: 2430, column: 5)
!2539 = !DILocation(line: 2430, column: 10, scope: !2538)
!2540 = !DILocation(line: 2430, column: 5, scope: !2518)
!2541 = !DILocation(line: 2432, column: 9, scope: !2542)
!2542 = distinct !DILexicalBlock(scope: !2538, file: !72, line: 2431, column: 2)
!2543 = !DILocation(line: 2433, column: 2, scope: !2542)
!2544 = !DILocation(line: 2434, column: 10, scope: !2545)
!2545 = distinct !DILexicalBlock(scope: !2538, file: !72, line: 2434, column: 10)
!2546 = !DILocation(line: 2434, column: 15, scope: !2545)
!2547 = !DILocation(line: 2434, column: 10, scope: !2538)
!2548 = !DILocation(line: 2436, column: 9, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2545, file: !72, line: 2435, column: 2)
!2550 = !DILocation(line: 2437, column: 2, scope: !2549)
!2551 = !DILocation(line: 2443, column: 7, scope: !2552)
!2552 = distinct !DILexicalBlock(scope: !2518, file: !72, line: 2443, column: 5)
!2553 = !DILocation(line: 2443, column: 12, scope: !2552)
!2554 = !DILocation(line: 2443, column: 16, scope: !2552)
!2555 = !DILocation(line: 2443, column: 36, scope: !2552)
!2556 = !DILocation(line: 2443, column: 41, scope: !2552)
!2557 = !DILocation(line: 2443, column: 45, scope: !2552)
!2558 = !DILocation(line: 2445, column: 13, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2552, file: !72, line: 2444, column: 2)
!2560 = !DILocation(line: 2446, column: 2, scope: !2559)
!2561 = !DILocation(line: 2449, column: 13, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2552, file: !72, line: 2448, column: 2)
!2563 = !DILocation(line: 2452, column: 5, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2518, file: !72, line: 2452, column: 5)
!2565 = !DILocation(line: 2452, column: 10, scope: !2564)
!2566 = !DILocation(line: 2452, column: 5, scope: !2518)
!2567 = !DILocation(line: 2454, column: 15, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2564, file: !72, line: 2453, column: 2)
!2569 = !DILocation(line: 2454, column: 14, scope: !2568)
!2570 = !DILocation(line: 2454, column: 12, scope: !2568)
!2571 = !DILocation(line: 2455, column: 2, scope: !2568)
!2572 = !DILocation(line: 2458, column: 14, scope: !2573)
!2573 = distinct !DILexicalBlock(scope: !2564, file: !72, line: 2457, column: 2)
!2574 = !DILocation(line: 2458, column: 12, scope: !2573)
!2575 = !DILocation(line: 2461, column: 5, scope: !2576)
!2576 = distinct !DILexicalBlock(scope: !2518, file: !72, line: 2461, column: 5)
!2577 = !DILocation(line: 2461, column: 11, scope: !2576)
!2578 = !DILocation(line: 2461, column: 5, scope: !2518)
!2579 = !DILocation(line: 2463, column: 15, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2576, file: !72, line: 2462, column: 2)
!2581 = !DILocation(line: 2463, column: 14, scope: !2580)
!2582 = !DILocation(line: 2463, column: 12, scope: !2580)
!2583 = !DILocation(line: 2464, column: 2, scope: !2580)
!2584 = !DILocation(line: 2467, column: 14, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2576, file: !72, line: 2466, column: 2)
!2586 = !DILocation(line: 2467, column: 12, scope: !2585)
!2587 = !DILocation(line: 2470, column: 13, scope: !2518)
!2588 = !DILocation(line: 2470, column: 24, scope: !2518)
!2589 = !DILocation(line: 2470, column: 22, scope: !2518)
!2590 = !DILocation(line: 2470, column: 11, scope: !2518)
!2591 = !DILocation(line: 2471, column: 25, scope: !2518)
!2592 = !DILocation(line: 2471, column: 35, scope: !2518)
!2593 = !DILocation(line: 2471, column: 13, scope: !2518)
!2594 = !DILocation(line: 2471, column: 11, scope: !2518)
!2595 = !DILocation(line: 2472, column: 13, scope: !2518)
!2596 = !DILocation(line: 2472, column: 29, scope: !2518)
!2597 = !DILocation(line: 2472, column: 28, scope: !2518)
!2598 = !DILocation(line: 2472, column: 22, scope: !2518)
!2599 = !DILocation(line: 2472, column: 11, scope: !2518)
!2600 = !DILocation(line: 2473, column: 14, scope: !2518)
!2601 = !DILocation(line: 2473, column: 26, scope: !2518)
!2602 = !DILocation(line: 2473, column: 23, scope: !2518)
!2603 = !DILocation(line: 2473, column: 11, scope: !2518)
!2604 = !DILocation(line: 2474, column: 6, scope: !2605)
!2605 = distinct !DILexicalBlock(scope: !2518, file: !72, line: 2474, column: 5)
!2606 = !DILocation(line: 2474, column: 20, scope: !2605)
!2607 = !DILocation(line: 2474, column: 19, scope: !2605)
!2608 = !DILocation(line: 2474, column: 14, scope: !2605)
!2609 = !DILocation(line: 2474, column: 27, scope: !2605)
!2610 = !DILocation(line: 2474, column: 5, scope: !2518)
!2611 = !DILocation(line: 2476, column: 6, scope: !2612)
!2612 = distinct !DILexicalBlock(scope: !2613, file: !72, line: 2476, column: 6)
!2613 = distinct !DILexicalBlock(scope: !2605, file: !72, line: 2475, column: 2)
!2614 = !DILocation(line: 2476, column: 16, scope: !2612)
!2615 = !DILocation(line: 2476, column: 6, scope: !2613)
!2616 = !DILocation(line: 2478, column: 7, scope: !2617)
!2617 = distinct !DILexicalBlock(scope: !2618, file: !72, line: 2478, column: 7)
!2618 = distinct !DILexicalBlock(scope: !2612, file: !72, line: 2477, column: 3)
!2619 = !DILocation(line: 2478, column: 15, scope: !2617)
!2620 = !DILocation(line: 2478, column: 7, scope: !2618)
!2621 = !DILocation(line: 2479, column: 12, scope: !2617)
!2622 = !DILocation(line: 2479, column: 5, scope: !2617)
!2623 = !DILocation(line: 2481, column: 5, scope: !2617)
!2624 = !DILocation(line: 2485, column: 12, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2612, file: !72, line: 2484, column: 3)
!2626 = !DILocation(line: 2485, column: 11, scope: !2625)
!2627 = !DILocation(line: 2485, column: 4, scope: !2625)
!2628 = !DILocation(line: 2490, column: 6, scope: !2629)
!2629 = distinct !DILexicalBlock(scope: !2630, file: !72, line: 2490, column: 6)
!2630 = distinct !DILexicalBlock(scope: !2605, file: !72, line: 2489, column: 2)
!2631 = !DILocation(line: 2490, column: 16, scope: !2629)
!2632 = !DILocation(line: 2490, column: 6, scope: !2630)
!2633 = !DILocation(line: 2492, column: 4, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2629, file: !72, line: 2491, column: 3)
!2635 = !DILocation(line: 2496, column: 4, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2629, file: !72, line: 2495, column: 3)
!2637 = !DILocation(line: 2499, column: 1, scope: !2518)
!2638 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !72, file: !72, line: 2518, type: !2639, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{!80, !80, !6}
!2641 = !DILocalVariable(name: "value", arg: 1, scope: !2638, file: !72, line: 2518, type: !80)
!2642 = !DILocation(line: 2518, column: 29, scope: !2638)
!2643 = !DILocalVariable(name: "factor", arg: 2, scope: !2638, file: !72, line: 2518, type: !6)
!2644 = !DILocation(line: 2518, column: 39, scope: !2638)
!2645 = !DILocalVariable(name: "u32Temp1", scope: !2638, file: !72, line: 2520, type: !736)
!2646 = !DILocation(line: 2520, column: 6, scope: !2638)
!2647 = !DILocalVariable(name: "u32Temp2", scope: !2638, file: !72, line: 2520, type: !736)
!2648 = !DILocation(line: 2520, column: 17, scope: !2638)
!2649 = !DILocalVariable(name: "u32Temp3", scope: !2638, file: !72, line: 2520, type: !736)
!2650 = !DILocation(line: 2520, column: 26, scope: !2638)
!2651 = !DILocalVariable(name: "u32Temp4", scope: !2638, file: !72, line: 2520, type: !736)
!2652 = !DILocation(line: 2520, column: 35, scope: !2638)
!2653 = !DILocalVariable(name: "u8SignBit", scope: !2638, file: !72, line: 2521, type: !17)
!2654 = !DILocation(line: 2521, column: 5, scope: !2638)
!2655 = !DILocation(line: 2523, column: 7, scope: !2656)
!2656 = distinct !DILexicalBlock(scope: !2638, file: !72, line: 2523, column: 5)
!2657 = !DILocation(line: 2523, column: 12, scope: !2656)
!2658 = !DILocation(line: 2523, column: 16, scope: !2656)
!2659 = !DILocation(line: 2523, column: 20, scope: !2656)
!2660 = !DILocation(line: 2523, column: 26, scope: !2656)
!2661 = !DILocation(line: 2523, column: 31, scope: !2656)
!2662 = !DILocation(line: 2523, column: 36, scope: !2656)
!2663 = !DILocation(line: 2523, column: 41, scope: !2656)
!2664 = !DILocation(line: 2523, column: 45, scope: !2656)
!2665 = !DILocation(line: 2523, column: 49, scope: !2656)
!2666 = !DILocation(line: 2523, column: 55, scope: !2656)
!2667 = !DILocation(line: 2523, column: 5, scope: !2638)
!2668 = !DILocation(line: 2525, column: 13, scope: !2669)
!2669 = distinct !DILexicalBlock(scope: !2656, file: !72, line: 2524, column: 2)
!2670 = !DILocation(line: 2526, column: 2, scope: !2669)
!2671 = !DILocation(line: 2529, column: 13, scope: !2672)
!2672 = distinct !DILexicalBlock(scope: !2656, file: !72, line: 2528, column: 2)
!2673 = !DILocation(line: 2532, column: 5, scope: !2674)
!2674 = distinct !DILexicalBlock(scope: !2638, file: !72, line: 2532, column: 5)
!2675 = !DILocation(line: 2532, column: 10, scope: !2674)
!2676 = !DILocation(line: 2532, column: 5, scope: !2638)
!2677 = !DILocation(line: 2534, column: 15, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2674, file: !72, line: 2533, column: 2)
!2679 = !DILocation(line: 2534, column: 14, scope: !2678)
!2680 = !DILocation(line: 2534, column: 12, scope: !2678)
!2681 = !DILocation(line: 2535, column: 2, scope: !2678)
!2682 = !DILocation(line: 2538, column: 14, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2674, file: !72, line: 2537, column: 2)
!2684 = !DILocation(line: 2538, column: 12, scope: !2683)
!2685 = !DILocation(line: 2541, column: 5, scope: !2686)
!2686 = distinct !DILexicalBlock(scope: !2638, file: !72, line: 2541, column: 5)
!2687 = !DILocation(line: 2541, column: 11, scope: !2686)
!2688 = !DILocation(line: 2541, column: 5, scope: !2638)
!2689 = !DILocation(line: 2543, column: 15, scope: !2690)
!2690 = distinct !DILexicalBlock(scope: !2686, file: !72, line: 2542, column: 2)
!2691 = !DILocation(line: 2543, column: 14, scope: !2690)
!2692 = !DILocation(line: 2543, column: 12, scope: !2690)
!2693 = !DILocation(line: 2544, column: 2, scope: !2690)
!2694 = !DILocation(line: 2547, column: 14, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2686, file: !72, line: 2546, column: 2)
!2696 = !DILocation(line: 2547, column: 12, scope: !2695)
!2697 = !DILocation(line: 2550, column: 13, scope: !2638)
!2698 = !DILocation(line: 2550, column: 24, scope: !2638)
!2699 = !DILocation(line: 2550, column: 22, scope: !2638)
!2700 = !DILocation(line: 2550, column: 11, scope: !2638)
!2701 = !DILocation(line: 2551, column: 25, scope: !2638)
!2702 = !DILocation(line: 2551, column: 35, scope: !2638)
!2703 = !DILocation(line: 2551, column: 13, scope: !2638)
!2704 = !DILocation(line: 2551, column: 11, scope: !2638)
!2705 = !DILocation(line: 2552, column: 13, scope: !2638)
!2706 = !DILocation(line: 2552, column: 22, scope: !2638)
!2707 = !DILocation(line: 2552, column: 11, scope: !2638)
!2708 = !DILocation(line: 2553, column: 14, scope: !2638)
!2709 = !DILocation(line: 2553, column: 23, scope: !2638)
!2710 = !DILocation(line: 2553, column: 11, scope: !2638)
!2711 = !DILocation(line: 2554, column: 5, scope: !2712)
!2712 = distinct !DILexicalBlock(scope: !2638, file: !72, line: 2554, column: 5)
!2713 = !DILocation(line: 2554, column: 15, scope: !2712)
!2714 = !DILocation(line: 2554, column: 5, scope: !2638)
!2715 = !DILocation(line: 2556, column: 6, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2717, file: !72, line: 2556, column: 6)
!2717 = distinct !DILexicalBlock(scope: !2712, file: !72, line: 2555, column: 2)
!2718 = !DILocation(line: 2556, column: 14, scope: !2716)
!2719 = !DILocation(line: 2556, column: 6, scope: !2717)
!2720 = !DILocation(line: 2557, column: 11, scope: !2716)
!2721 = !DILocation(line: 2557, column: 4, scope: !2716)
!2722 = !DILocation(line: 2559, column: 4, scope: !2716)
!2723 = !DILocation(line: 2563, column: 11, scope: !2724)
!2724 = distinct !DILexicalBlock(scope: !2712, file: !72, line: 2562, column: 2)
!2725 = !DILocation(line: 2563, column: 10, scope: !2724)
!2726 = !DILocation(line: 2563, column: 3, scope: !2724)
!2727 = !DILocation(line: 2565, column: 1, scope: !2638)
!2728 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !72, file: !72, line: 2584, type: !2639, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2729 = !DILocalVariable(name: "value", arg: 1, scope: !2728, file: !72, line: 2584, type: !80)
!2730 = !DILocation(line: 2584, column: 29, scope: !2728)
!2731 = !DILocalVariable(name: "factor", arg: 2, scope: !2728, file: !72, line: 2584, type: !6)
!2732 = !DILocation(line: 2584, column: 39, scope: !2728)
!2733 = !DILocalVariable(name: "u32Temp1", scope: !2728, file: !72, line: 2586, type: !736)
!2734 = !DILocation(line: 2586, column: 6, scope: !2728)
!2735 = !DILocalVariable(name: "u32Temp2", scope: !2728, file: !72, line: 2586, type: !736)
!2736 = !DILocation(line: 2586, column: 17, scope: !2728)
!2737 = !DILocalVariable(name: "u32Temp3", scope: !2728, file: !72, line: 2586, type: !736)
!2738 = !DILocation(line: 2586, column: 26, scope: !2728)
!2739 = !DILocalVariable(name: "u32Temp4", scope: !2728, file: !72, line: 2586, type: !736)
!2740 = !DILocation(line: 2586, column: 35, scope: !2728)
!2741 = !DILocalVariable(name: "u8SignBit", scope: !2728, file: !72, line: 2587, type: !17)
!2742 = !DILocation(line: 2587, column: 5, scope: !2728)
!2743 = !DILocation(line: 2589, column: 7, scope: !2744)
!2744 = distinct !DILexicalBlock(scope: !2728, file: !72, line: 2589, column: 5)
!2745 = !DILocation(line: 2589, column: 12, scope: !2744)
!2746 = !DILocation(line: 2589, column: 16, scope: !2744)
!2747 = !DILocation(line: 2589, column: 20, scope: !2744)
!2748 = !DILocation(line: 2589, column: 26, scope: !2744)
!2749 = !DILocation(line: 2589, column: 31, scope: !2744)
!2750 = !DILocation(line: 2589, column: 36, scope: !2744)
!2751 = !DILocation(line: 2589, column: 41, scope: !2744)
!2752 = !DILocation(line: 2589, column: 45, scope: !2744)
!2753 = !DILocation(line: 2589, column: 49, scope: !2744)
!2754 = !DILocation(line: 2589, column: 55, scope: !2744)
!2755 = !DILocation(line: 2589, column: 5, scope: !2728)
!2756 = !DILocation(line: 2591, column: 13, scope: !2757)
!2757 = distinct !DILexicalBlock(scope: !2744, file: !72, line: 2590, column: 2)
!2758 = !DILocation(line: 2592, column: 2, scope: !2757)
!2759 = !DILocation(line: 2595, column: 13, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2744, file: !72, line: 2594, column: 2)
!2761 = !DILocation(line: 2598, column: 5, scope: !2762)
!2762 = distinct !DILexicalBlock(scope: !2728, file: !72, line: 2598, column: 5)
!2763 = !DILocation(line: 2598, column: 10, scope: !2762)
!2764 = !DILocation(line: 2598, column: 5, scope: !2728)
!2765 = !DILocation(line: 2600, column: 15, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2762, file: !72, line: 2599, column: 2)
!2767 = !DILocation(line: 2600, column: 14, scope: !2766)
!2768 = !DILocation(line: 2600, column: 12, scope: !2766)
!2769 = !DILocation(line: 2601, column: 2, scope: !2766)
!2770 = !DILocation(line: 2604, column: 14, scope: !2771)
!2771 = distinct !DILexicalBlock(scope: !2762, file: !72, line: 2603, column: 2)
!2772 = !DILocation(line: 2604, column: 12, scope: !2771)
!2773 = !DILocation(line: 2607, column: 5, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2728, file: !72, line: 2607, column: 5)
!2775 = !DILocation(line: 2607, column: 11, scope: !2774)
!2776 = !DILocation(line: 2607, column: 5, scope: !2728)
!2777 = !DILocation(line: 2609, column: 15, scope: !2778)
!2778 = distinct !DILexicalBlock(scope: !2774, file: !72, line: 2608, column: 2)
!2779 = !DILocation(line: 2609, column: 14, scope: !2778)
!2780 = !DILocation(line: 2609, column: 12, scope: !2778)
!2781 = !DILocation(line: 2610, column: 2, scope: !2778)
!2782 = !DILocation(line: 2613, column: 14, scope: !2783)
!2783 = distinct !DILexicalBlock(scope: !2774, file: !72, line: 2612, column: 2)
!2784 = !DILocation(line: 2613, column: 12, scope: !2783)
!2785 = !DILocation(line: 2616, column: 13, scope: !2728)
!2786 = !DILocation(line: 2616, column: 24, scope: !2728)
!2787 = !DILocation(line: 2616, column: 22, scope: !2728)
!2788 = !DILocation(line: 2616, column: 11, scope: !2728)
!2789 = !DILocation(line: 2617, column: 25, scope: !2728)
!2790 = !DILocation(line: 2617, column: 35, scope: !2728)
!2791 = !DILocation(line: 2617, column: 13, scope: !2728)
!2792 = !DILocation(line: 2617, column: 11, scope: !2728)
!2793 = !DILocation(line: 2618, column: 13, scope: !2728)
!2794 = !DILocation(line: 2618, column: 22, scope: !2728)
!2795 = !DILocation(line: 2618, column: 11, scope: !2728)
!2796 = !DILocation(line: 2619, column: 14, scope: !2728)
!2797 = !DILocation(line: 2619, column: 23, scope: !2728)
!2798 = !DILocation(line: 2619, column: 11, scope: !2728)
!2799 = !DILocation(line: 2620, column: 6, scope: !2800)
!2800 = distinct !DILexicalBlock(scope: !2728, file: !72, line: 2620, column: 5)
!2801 = !DILocation(line: 2620, column: 14, scope: !2800)
!2802 = !DILocation(line: 2620, column: 18, scope: !2800)
!2803 = !DILocation(line: 2620, column: 5, scope: !2728)
!2804 = !DILocation(line: 2622, column: 6, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2806, file: !72, line: 2622, column: 6)
!2806 = distinct !DILexicalBlock(scope: !2800, file: !72, line: 2621, column: 2)
!2807 = !DILocation(line: 2622, column: 16, scope: !2805)
!2808 = !DILocation(line: 2622, column: 6, scope: !2806)
!2809 = !DILocation(line: 2624, column: 7, scope: !2810)
!2810 = distinct !DILexicalBlock(scope: !2811, file: !72, line: 2624, column: 7)
!2811 = distinct !DILexicalBlock(scope: !2805, file: !72, line: 2623, column: 3)
!2812 = !DILocation(line: 2624, column: 15, scope: !2810)
!2813 = !DILocation(line: 2624, column: 7, scope: !2811)
!2814 = !DILocation(line: 2625, column: 12, scope: !2810)
!2815 = !DILocation(line: 2625, column: 5, scope: !2810)
!2816 = !DILocation(line: 2627, column: 5, scope: !2810)
!2817 = !DILocation(line: 2631, column: 7, scope: !2818)
!2818 = distinct !DILexicalBlock(scope: !2819, file: !72, line: 2631, column: 7)
!2819 = distinct !DILexicalBlock(scope: !2805, file: !72, line: 2630, column: 3)
!2820 = !DILocation(line: 2631, column: 15, scope: !2818)
!2821 = !DILocation(line: 2631, column: 7, scope: !2819)
!2822 = !DILocation(line: 2632, column: 13, scope: !2818)
!2823 = !DILocation(line: 2632, column: 12, scope: !2818)
!2824 = !DILocation(line: 2632, column: 5, scope: !2818)
!2825 = !DILocation(line: 2634, column: 5, scope: !2818)
!2826 = !DILocation(line: 2639, column: 3, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2800, file: !72, line: 2638, column: 2)
!2828 = !DILocation(line: 2641, column: 1, scope: !2728)
!2829 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !72, file: !72, line: 2656, type: !2165, scopeLine: 2657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2830 = !DILocalVariable(name: "val1", arg: 1, scope: !2829, file: !72, line: 2656, type: !80)
!2831 = !DILocation(line: 2656, column: 25, scope: !2829)
!2832 = !DILocalVariable(name: "val2", arg: 2, scope: !2829, file: !72, line: 2656, type: !80)
!2833 = !DILocation(line: 2656, column: 35, scope: !2829)
!2834 = !DILocalVariable(name: "u32Temp1", scope: !2829, file: !72, line: 2658, type: !736)
!2835 = !DILocation(line: 2658, column: 6, scope: !2829)
!2836 = !DILocalVariable(name: "u32Temp2", scope: !2829, file: !72, line: 2658, type: !736)
!2837 = !DILocation(line: 2658, column: 17, scope: !2829)
!2838 = !DILocalVariable(name: "u32Temp3", scope: !2829, file: !72, line: 2658, type: !736)
!2839 = !DILocation(line: 2658, column: 26, scope: !2829)
!2840 = !DILocalVariable(name: "u32Temp4", scope: !2829, file: !72, line: 2658, type: !736)
!2841 = !DILocation(line: 2658, column: 35, scope: !2829)
!2842 = !DILocalVariable(name: "u8SignBit", scope: !2829, file: !72, line: 2659, type: !17)
!2843 = !DILocation(line: 2659, column: 5, scope: !2829)
!2844 = !DILocation(line: 2661, column: 7, scope: !2845)
!2845 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2661, column: 5)
!2846 = !DILocation(line: 2661, column: 11, scope: !2845)
!2847 = !DILocation(line: 2661, column: 15, scope: !2845)
!2848 = !DILocation(line: 2661, column: 33, scope: !2845)
!2849 = !DILocation(line: 2661, column: 37, scope: !2845)
!2850 = !DILocation(line: 2661, column: 41, scope: !2845)
!2851 = !DILocation(line: 2663, column: 13, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2845, file: !72, line: 2662, column: 2)
!2853 = !DILocation(line: 2664, column: 2, scope: !2852)
!2854 = !DILocation(line: 2667, column: 13, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2845, file: !72, line: 2666, column: 2)
!2856 = !DILocation(line: 2670, column: 5, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2670, column: 5)
!2858 = !DILocation(line: 2670, column: 9, scope: !2857)
!2859 = !DILocation(line: 2670, column: 5, scope: !2829)
!2860 = !DILocation(line: 2673, column: 44, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2862, file: !72, line: 2673, column: 7)
!2862 = distinct !DILexicalBlock(scope: !2857, file: !72, line: 2671, column: 2)
!2863 = !DILocation(line: 2673, column: 34, scope: !2861)
!2864 = !DILocation(line: 2673, column: 9, scope: !2861)
!2865 = !DILocation(line: 2673, column: 7, scope: !2862)
!2866 = !DILocation(line: 2674, column: 7, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2861, file: !72, line: 2673, column: 53)
!2868 = !DILocation(line: 2681, column: 36, scope: !2862)
!2869 = !DILocation(line: 2681, column: 35, scope: !2862)
!2870 = !DILocation(line: 2681, column: 25, scope: !2862)
!2871 = !DILocation(line: 2681, column: 23, scope: !2862)
!2872 = !DILocation(line: 2682, column: 3, scope: !2862)
!2873 = !DILocation(line: 2686, column: 14, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2857, file: !72, line: 2685, column: 2)
!2875 = !DILocation(line: 2686, column: 12, scope: !2874)
!2876 = !DILocation(line: 2689, column: 5, scope: !2877)
!2877 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2689, column: 5)
!2878 = !DILocation(line: 2689, column: 9, scope: !2877)
!2879 = !DILocation(line: 2689, column: 5, scope: !2829)
!2880 = !DILocation(line: 2691, column: 15, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2877, file: !72, line: 2690, column: 2)
!2882 = !DILocation(line: 2691, column: 14, scope: !2881)
!2883 = !DILocation(line: 2691, column: 12, scope: !2881)
!2884 = !DILocation(line: 2692, column: 2, scope: !2881)
!2885 = !DILocation(line: 2695, column: 14, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2877, file: !72, line: 2694, column: 2)
!2887 = !DILocation(line: 2695, column: 12, scope: !2886)
!2888 = !DILocation(line: 2698, column: 13, scope: !2829)
!2889 = !DILocation(line: 2698, column: 24, scope: !2829)
!2890 = !DILocation(line: 2698, column: 22, scope: !2829)
!2891 = !DILocation(line: 2698, column: 11, scope: !2829)
!2892 = !DILocation(line: 2699, column: 25, scope: !2829)
!2893 = !DILocation(line: 2699, column: 35, scope: !2829)
!2894 = !DILocation(line: 2699, column: 13, scope: !2829)
!2895 = !DILocation(line: 2699, column: 11, scope: !2829)
!2896 = !DILocation(line: 2700, column: 5, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2700, column: 5)
!2898 = !DILocation(line: 2700, column: 13, scope: !2897)
!2899 = !DILocation(line: 2700, column: 5, scope: !2829)
!2900 = !DILocation(line: 2702, column: 6, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2902, file: !72, line: 2702, column: 6)
!2902 = distinct !DILexicalBlock(scope: !2897, file: !72, line: 2701, column: 2)
!2903 = !DILocation(line: 2702, column: 16, scope: !2901)
!2904 = !DILocation(line: 2702, column: 6, scope: !2902)
!2905 = !DILocation(line: 2704, column: 7, scope: !2906)
!2906 = distinct !DILexicalBlock(scope: !2907, file: !72, line: 2704, column: 7)
!2907 = distinct !DILexicalBlock(scope: !2901, file: !72, line: 2703, column: 3)
!2908 = !DILocation(line: 2704, column: 15, scope: !2906)
!2909 = !DILocation(line: 2704, column: 7, scope: !2907)
!2910 = !DILocation(line: 2705, column: 12, scope: !2906)
!2911 = !DILocation(line: 2705, column: 5, scope: !2906)
!2912 = !DILocation(line: 2707, column: 5, scope: !2906)
!2913 = !DILocation(line: 2711, column: 7, scope: !2914)
!2914 = distinct !DILexicalBlock(scope: !2915, file: !72, line: 2711, column: 7)
!2915 = distinct !DILexicalBlock(scope: !2901, file: !72, line: 2710, column: 3)
!2916 = !DILocation(line: 2711, column: 15, scope: !2914)
!2917 = !DILocation(line: 2711, column: 7, scope: !2915)
!2918 = !DILocation(line: 2712, column: 13, scope: !2914)
!2919 = !DILocation(line: 2712, column: 12, scope: !2914)
!2920 = !DILocation(line: 2712, column: 5, scope: !2914)
!2921 = !DILocation(line: 2714, column: 5, scope: !2914)
!2922 = !DILocation(line: 2719, column: 6, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2924, file: !72, line: 2719, column: 6)
!2924 = distinct !DILexicalBlock(scope: !2897, file: !72, line: 2718, column: 2)
!2925 = !DILocation(line: 2719, column: 16, scope: !2923)
!2926 = !DILocation(line: 2719, column: 6, scope: !2924)
!2927 = !DILocation(line: 2721, column: 4, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2923, file: !72, line: 2720, column: 3)
!2929 = !DILocation(line: 2725, column: 4, scope: !2930)
!2930 = distinct !DILexicalBlock(scope: !2923, file: !72, line: 2724, column: 3)
!2931 = !DILocation(line: 2729, column: 1, scope: !2829)
!2932 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !2933, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2933 = !DISubroutineType(types: !2934)
!2934 = !{!37, !26}
!2935 = !DILocalVariable(name: "value", arg: 1, scope: !2932, file: !30, line: 42, type: !26)
!2936 = !DILocation(line: 42, column: 38, scope: !2932)
!2937 = !DILocation(line: 44, column: 12, scope: !2932)
!2938 = !DILocation(line: 44, column: 18, scope: !2932)
!2939 = !DILocation(line: 44, column: 5, scope: !2932)
!2940 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !72, file: !72, line: 2747, type: !2061, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2941 = !DILocalVariable(name: "value", arg: 1, scope: !2940, file: !72, line: 2747, type: !80)
!2942 = !DILocation(line: 2747, column: 31, scope: !2940)
!2943 = !DILocalVariable(name: "factor", arg: 2, scope: !2940, file: !72, line: 2747, type: !736)
!2944 = !DILocation(line: 2747, column: 42, scope: !2940)
!2945 = !DILocalVariable(name: "u32Temp1", scope: !2940, file: !72, line: 2749, type: !736)
!2946 = !DILocation(line: 2749, column: 6, scope: !2940)
!2947 = !DILocalVariable(name: "u32Temp2", scope: !2940, file: !72, line: 2749, type: !736)
!2948 = !DILocation(line: 2749, column: 17, scope: !2940)
!2949 = !DILocalVariable(name: "u8SignBit", scope: !2940, file: !72, line: 2750, type: !17)
!2950 = !DILocation(line: 2750, column: 5, scope: !2940)
!2951 = !DILocation(line: 2752, column: 5, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2940, file: !72, line: 2752, column: 5)
!2953 = !DILocation(line: 2752, column: 10, scope: !2952)
!2954 = !DILocation(line: 2752, column: 5, scope: !2940)
!2955 = !DILocation(line: 2754, column: 15, scope: !2956)
!2956 = distinct !DILexicalBlock(scope: !2952, file: !72, line: 2753, column: 2)
!2957 = !DILocation(line: 2754, column: 14, scope: !2956)
!2958 = !DILocation(line: 2754, column: 12, scope: !2956)
!2959 = !DILocation(line: 2755, column: 13, scope: !2956)
!2960 = !DILocation(line: 2756, column: 2, scope: !2956)
!2961 = !DILocation(line: 2759, column: 14, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2952, file: !72, line: 2758, column: 2)
!2963 = !DILocation(line: 2759, column: 12, scope: !2962)
!2964 = !DILocation(line: 2760, column: 13, scope: !2962)
!2965 = !DILocation(line: 2763, column: 25, scope: !2940)
!2966 = !DILocation(line: 2763, column: 35, scope: !2940)
!2967 = !DILocation(line: 2763, column: 13, scope: !2940)
!2968 = !DILocation(line: 2763, column: 11, scope: !2940)
!2969 = !DILocation(line: 2764, column: 13, scope: !2940)
!2970 = !DILocation(line: 2764, column: 22, scope: !2940)
!2971 = !DILocation(line: 2764, column: 11, scope: !2940)
!2972 = !DILocation(line: 2765, column: 5, scope: !2973)
!2973 = distinct !DILexicalBlock(scope: !2940, file: !72, line: 2765, column: 5)
!2974 = !DILocation(line: 2765, column: 15, scope: !2973)
!2975 = !DILocation(line: 2765, column: 5, scope: !2940)
!2976 = !DILocation(line: 2767, column: 10, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2973, file: !72, line: 2766, column: 2)
!2978 = !DILocation(line: 2767, column: 3, scope: !2977)
!2979 = !DILocation(line: 2771, column: 11, scope: !2980)
!2980 = distinct !DILexicalBlock(scope: !2973, file: !72, line: 2770, column: 2)
!2981 = !DILocation(line: 2771, column: 10, scope: !2980)
!2982 = !DILocation(line: 2771, column: 3, scope: !2980)
!2983 = !DILocation(line: 2773, column: 1, scope: !2940)
!2984 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !72, file: !72, line: 2789, type: !2165, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2985 = !DILocalVariable(name: "value", arg: 1, scope: !2984, file: !72, line: 2789, type: !80)
!2986 = !DILocation(line: 2789, column: 31, scope: !2984)
!2987 = !DILocalVariable(name: "factor", arg: 2, scope: !2984, file: !72, line: 2789, type: !80)
!2988 = !DILocation(line: 2789, column: 42, scope: !2984)
!2989 = !DILocalVariable(name: "u32Temp1", scope: !2984, file: !72, line: 2791, type: !736)
!2990 = !DILocation(line: 2791, column: 6, scope: !2984)
!2991 = !DILocalVariable(name: "u32Temp2", scope: !2984, file: !72, line: 2791, type: !736)
!2992 = !DILocation(line: 2791, column: 17, scope: !2984)
!2993 = !DILocalVariable(name: "u32Temp3", scope: !2984, file: !72, line: 2791, type: !736)
!2994 = !DILocation(line: 2791, column: 26, scope: !2984)
!2995 = !DILocalVariable(name: "u8SignBit", scope: !2984, file: !72, line: 2792, type: !17)
!2996 = !DILocation(line: 2792, column: 5, scope: !2984)
!2997 = !DILocation(line: 2794, column: 7, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2984, file: !72, line: 2794, column: 5)
!2999 = !DILocation(line: 2794, column: 12, scope: !2998)
!3000 = !DILocation(line: 2794, column: 16, scope: !2998)
!3001 = !DILocation(line: 2794, column: 36, scope: !2998)
!3002 = !DILocation(line: 2794, column: 41, scope: !2998)
!3003 = !DILocation(line: 2794, column: 45, scope: !2998)
!3004 = !DILocation(line: 2796, column: 13, scope: !3005)
!3005 = distinct !DILexicalBlock(scope: !2998, file: !72, line: 2795, column: 2)
!3006 = !DILocation(line: 2797, column: 2, scope: !3005)
!3007 = !DILocation(line: 2800, column: 13, scope: !3008)
!3008 = distinct !DILexicalBlock(scope: !2998, file: !72, line: 2799, column: 2)
!3009 = !DILocation(line: 2803, column: 5, scope: !3010)
!3010 = distinct !DILexicalBlock(scope: !2984, file: !72, line: 2803, column: 5)
!3011 = !DILocation(line: 2803, column: 10, scope: !3010)
!3012 = !DILocation(line: 2803, column: 5, scope: !2984)
!3013 = !DILocation(line: 2805, column: 15, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3010, file: !72, line: 2804, column: 2)
!3015 = !DILocation(line: 2805, column: 14, scope: !3014)
!3016 = !DILocation(line: 2805, column: 12, scope: !3014)
!3017 = !DILocation(line: 2806, column: 2, scope: !3014)
!3018 = !DILocation(line: 2809, column: 14, scope: !3019)
!3019 = distinct !DILexicalBlock(scope: !3010, file: !72, line: 2808, column: 2)
!3020 = !DILocation(line: 2809, column: 12, scope: !3019)
!3021 = !DILocation(line: 2812, column: 5, scope: !3022)
!3022 = distinct !DILexicalBlock(scope: !2984, file: !72, line: 2812, column: 5)
!3023 = !DILocation(line: 2812, column: 11, scope: !3022)
!3024 = !DILocation(line: 2812, column: 5, scope: !2984)
!3025 = !DILocation(line: 2814, column: 15, scope: !3026)
!3026 = distinct !DILexicalBlock(scope: !3022, file: !72, line: 2813, column: 2)
!3027 = !DILocation(line: 2814, column: 14, scope: !3026)
!3028 = !DILocation(line: 2814, column: 12, scope: !3026)
!3029 = !DILocation(line: 2815, column: 2, scope: !3026)
!3030 = !DILocation(line: 2818, column: 14, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3022, file: !72, line: 2817, column: 2)
!3032 = !DILocation(line: 2818, column: 12, scope: !3031)
!3033 = !DILocation(line: 2821, column: 25, scope: !2984)
!3034 = !DILocation(line: 2821, column: 35, scope: !2984)
!3035 = !DILocation(line: 2821, column: 13, scope: !2984)
!3036 = !DILocation(line: 2821, column: 11, scope: !2984)
!3037 = !DILocation(line: 2822, column: 5, scope: !3038)
!3038 = distinct !DILexicalBlock(scope: !2984, file: !72, line: 2822, column: 5)
!3039 = !DILocation(line: 2822, column: 15, scope: !3038)
!3040 = !DILocation(line: 2822, column: 5, scope: !2984)
!3041 = !DILocation(line: 2824, column: 10, scope: !3042)
!3042 = distinct !DILexicalBlock(scope: !3038, file: !72, line: 2823, column: 2)
!3043 = !DILocation(line: 2824, column: 3, scope: !3042)
!3044 = !DILocation(line: 2828, column: 11, scope: !3045)
!3045 = distinct !DILexicalBlock(scope: !3038, file: !72, line: 2827, column: 2)
!3046 = !DILocation(line: 2828, column: 10, scope: !3045)
!3047 = !DILocation(line: 2828, column: 3, scope: !3045)
!3048 = !DILocation(line: 2830, column: 1, scope: !2984)
!3049 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !72, file: !72, line: 2847, type: !3050, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3050 = !DISubroutineType(types: !3051)
!3051 = !{!736, !736, !17}
!3052 = !DILocalVariable(name: "value", arg: 1, scope: !3049, file: !72, line: 2847, type: !736)
!3053 = !DILocation(line: 2847, column: 29, scope: !3049)
!3054 = !DILocalVariable(name: "factor", arg: 2, scope: !3049, file: !72, line: 2847, type: !17)
!3055 = !DILocation(line: 2847, column: 39, scope: !3049)
!3056 = !DILocalVariable(name: "u32Temp1", scope: !3049, file: !72, line: 2849, type: !736)
!3057 = !DILocation(line: 2849, column: 6, scope: !3049)
!3058 = !DILocalVariable(name: "u32Temp2", scope: !3049, file: !72, line: 2849, type: !736)
!3059 = !DILocation(line: 2849, column: 20, scope: !3049)
!3060 = !DILocation(line: 2850, column: 13, scope: !3049)
!3061 = !DILocation(line: 2850, column: 21, scope: !3049)
!3062 = !DILocation(line: 2850, column: 19, scope: !3049)
!3063 = !DILocation(line: 2850, column: 11, scope: !3049)
!3064 = !DILocation(line: 2851, column: 25, scope: !3049)
!3065 = !DILocation(line: 2851, column: 32, scope: !3049)
!3066 = !DILocation(line: 2851, column: 13, scope: !3049)
!3067 = !DILocation(line: 2851, column: 11, scope: !3049)
!3068 = !DILocation(line: 2852, column: 14, scope: !3049)
!3069 = !DILocation(line: 2852, column: 23, scope: !3049)
!3070 = !DILocation(line: 2852, column: 11, scope: !3049)
!3071 = !DILocation(line: 2853, column: 14, scope: !3049)
!3072 = !DILocation(line: 2853, column: 23, scope: !3049)
!3073 = !DILocation(line: 2853, column: 11, scope: !3049)
!3074 = !DILocation(line: 2854, column: 9, scope: !3049)
!3075 = !DILocation(line: 2854, column: 2, scope: !3049)
!3076 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !72, file: !72, line: 2873, type: !3050, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3077 = !DILocalVariable(name: "value", arg: 1, scope: !3076, file: !72, line: 2873, type: !736)
!3078 = !DILocation(line: 2873, column: 29, scope: !3076)
!3079 = !DILocalVariable(name: "factor", arg: 2, scope: !3076, file: !72, line: 2873, type: !17)
!3080 = !DILocation(line: 2873, column: 39, scope: !3076)
!3081 = !DILocalVariable(name: "u32Temp1", scope: !3076, file: !72, line: 2875, type: !736)
!3082 = !DILocation(line: 2875, column: 6, scope: !3076)
!3083 = !DILocalVariable(name: "u32Temp2", scope: !3076, file: !72, line: 2875, type: !736)
!3084 = !DILocation(line: 2875, column: 20, scope: !3076)
!3085 = !DILocation(line: 2876, column: 13, scope: !3076)
!3086 = !DILocation(line: 2876, column: 21, scope: !3076)
!3087 = !DILocation(line: 2876, column: 19, scope: !3076)
!3088 = !DILocation(line: 2876, column: 11, scope: !3076)
!3089 = !DILocation(line: 2877, column: 25, scope: !3076)
!3090 = !DILocation(line: 2877, column: 32, scope: !3076)
!3091 = !DILocation(line: 2877, column: 13, scope: !3076)
!3092 = !DILocation(line: 2877, column: 11, scope: !3076)
!3093 = !DILocation(line: 2878, column: 14, scope: !3076)
!3094 = !DILocation(line: 2878, column: 23, scope: !3076)
!3095 = !DILocation(line: 2878, column: 11, scope: !3076)
!3096 = !DILocation(line: 2879, column: 14, scope: !3076)
!3097 = !DILocation(line: 2879, column: 23, scope: !3076)
!3098 = !DILocation(line: 2879, column: 11, scope: !3076)
!3099 = !DILocation(line: 2880, column: 6, scope: !3100)
!3100 = distinct !DILexicalBlock(scope: !3076, file: !72, line: 2880, column: 5)
!3101 = !DILocation(line: 2880, column: 14, scope: !3100)
!3102 = !DILocation(line: 2880, column: 19, scope: !3100)
!3103 = !DILocation(line: 2880, column: 5, scope: !3076)
!3104 = !DILocation(line: 2882, column: 10, scope: !3105)
!3105 = distinct !DILexicalBlock(scope: !3100, file: !72, line: 2881, column: 2)
!3106 = !DILocation(line: 2882, column: 3, scope: !3105)
!3107 = !DILocation(line: 2886, column: 3, scope: !3108)
!3108 = distinct !DILexicalBlock(scope: !3100, file: !72, line: 2885, column: 2)
!3109 = !DILocation(line: 2889, column: 1, scope: !3076)
!3110 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !72, file: !72, line: 2908, type: !3111, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3111 = !DISubroutineType(types: !3112)
!3112 = !{!736, !736, !6}
!3113 = !DILocalVariable(name: "value", arg: 1, scope: !3110, file: !72, line: 2908, type: !736)
!3114 = !DILocation(line: 2908, column: 29, scope: !3110)
!3115 = !DILocalVariable(name: "factor", arg: 2, scope: !3110, file: !72, line: 2908, type: !6)
!3116 = !DILocation(line: 2908, column: 39, scope: !3110)
!3117 = !DILocalVariable(name: "u32Temp1", scope: !3110, file: !72, line: 2910, type: !736)
!3118 = !DILocation(line: 2910, column: 6, scope: !3110)
!3119 = !DILocalVariable(name: "u32Temp2", scope: !3110, file: !72, line: 2910, type: !736)
!3120 = !DILocation(line: 2910, column: 20, scope: !3110)
!3121 = !DILocation(line: 2911, column: 5, scope: !3122)
!3122 = distinct !DILexicalBlock(scope: !3110, file: !72, line: 2911, column: 5)
!3123 = !DILocation(line: 2911, column: 12, scope: !3122)
!3124 = !DILocation(line: 2911, column: 5, scope: !3110)
!3125 = !DILocation(line: 2914, column: 14, scope: !3126)
!3126 = distinct !DILexicalBlock(scope: !3122, file: !72, line: 2912, column: 2)
!3127 = !DILocation(line: 2914, column: 22, scope: !3126)
!3128 = !DILocation(line: 2914, column: 20, scope: !3126)
!3129 = !DILocation(line: 2914, column: 12, scope: !3126)
!3130 = !DILocation(line: 2915, column: 26, scope: !3126)
!3131 = !DILocation(line: 2915, column: 33, scope: !3126)
!3132 = !DILocation(line: 2915, column: 14, scope: !3126)
!3133 = !DILocation(line: 2915, column: 12, scope: !3126)
!3134 = !DILocation(line: 2916, column: 14, scope: !3126)
!3135 = !DILocation(line: 2916, column: 23, scope: !3126)
!3136 = !DILocation(line: 2916, column: 12, scope: !3126)
!3137 = !DILocation(line: 2917, column: 15, scope: !3126)
!3138 = !DILocation(line: 2917, column: 24, scope: !3126)
!3139 = !DILocation(line: 2917, column: 12, scope: !3126)
!3140 = !DILocation(line: 2918, column: 10, scope: !3126)
!3141 = !DILocation(line: 2918, column: 3, scope: !3126)
!3142 = !DILocation(line: 2922, column: 3, scope: !3143)
!3143 = distinct !DILexicalBlock(scope: !3122, file: !72, line: 2921, column: 2)
!3144 = !DILocation(line: 2924, column: 1, scope: !3110)
!3145 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !72, file: !72, line: 2943, type: !3111, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3146 = !DILocalVariable(name: "value", arg: 1, scope: !3145, file: !72, line: 2943, type: !736)
!3147 = !DILocation(line: 2943, column: 29, scope: !3145)
!3148 = !DILocalVariable(name: "factor", arg: 2, scope: !3145, file: !72, line: 2943, type: !6)
!3149 = !DILocation(line: 2943, column: 39, scope: !3145)
!3150 = !DILocalVariable(name: "u32Temp1", scope: !3145, file: !72, line: 2945, type: !736)
!3151 = !DILocation(line: 2945, column: 6, scope: !3145)
!3152 = !DILocalVariable(name: "u32Temp2", scope: !3145, file: !72, line: 2945, type: !736)
!3153 = !DILocation(line: 2945, column: 20, scope: !3145)
!3154 = !DILocation(line: 2946, column: 5, scope: !3155)
!3155 = distinct !DILexicalBlock(scope: !3145, file: !72, line: 2946, column: 5)
!3156 = !DILocation(line: 2946, column: 12, scope: !3155)
!3157 = !DILocation(line: 2946, column: 5, scope: !3145)
!3158 = !DILocation(line: 2948, column: 3, scope: !3159)
!3159 = distinct !DILexicalBlock(scope: !3155, file: !72, line: 2947, column: 2)
!3160 = !DILocation(line: 2952, column: 14, scope: !3161)
!3161 = distinct !DILexicalBlock(scope: !3155, file: !72, line: 2951, column: 2)
!3162 = !DILocation(line: 2952, column: 22, scope: !3161)
!3163 = !DILocation(line: 2952, column: 20, scope: !3161)
!3164 = !DILocation(line: 2952, column: 12, scope: !3161)
!3165 = !DILocation(line: 2953, column: 26, scope: !3161)
!3166 = !DILocation(line: 2953, column: 33, scope: !3161)
!3167 = !DILocation(line: 2953, column: 14, scope: !3161)
!3168 = !DILocation(line: 2953, column: 12, scope: !3161)
!3169 = !DILocation(line: 2954, column: 14, scope: !3161)
!3170 = !DILocation(line: 2954, column: 23, scope: !3161)
!3171 = !DILocation(line: 2954, column: 12, scope: !3161)
!3172 = !DILocation(line: 2955, column: 15, scope: !3161)
!3173 = !DILocation(line: 2955, column: 24, scope: !3161)
!3174 = !DILocation(line: 2955, column: 12, scope: !3161)
!3175 = !DILocation(line: 2956, column: 7, scope: !3176)
!3176 = distinct !DILexicalBlock(scope: !3161, file: !72, line: 2956, column: 6)
!3177 = !DILocation(line: 2956, column: 16, scope: !3176)
!3178 = !DILocation(line: 2956, column: 22, scope: !3176)
!3179 = !DILocation(line: 2956, column: 6, scope: !3161)
!3180 = !DILocation(line: 2958, column: 11, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3176, file: !72, line: 2957, column: 3)
!3182 = !DILocation(line: 2958, column: 4, scope: !3181)
!3183 = !DILocation(line: 2962, column: 4, scope: !3184)
!3184 = distinct !DILexicalBlock(scope: !3176, file: !72, line: 2961, column: 3)
!3185 = !DILocation(line: 2965, column: 1, scope: !3145)
!3186 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !72, file: !72, line: 2987, type: !301, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3187 = !DILocalVariable(name: "value", arg: 1, scope: !3186, file: !72, line: 2987, type: !13)
!3188 = !DILocation(line: 2987, column: 33, scope: !3186)
!3189 = !DILocalVariable(name: "factor", arg: 2, scope: !3186, file: !72, line: 2987, type: !13)
!3190 = !DILocation(line: 2987, column: 44, scope: !3186)
!3191 = !DILocation(line: 2989, column: 40, scope: !3186)
!3192 = !DILocation(line: 2989, column: 46, scope: !3186)
!3193 = !DILocation(line: 2989, column: 9, scope: !3186)
!3194 = !DILocation(line: 2989, column: 2, scope: !3186)
!3195 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !72, file: !72, line: 3011, type: !301, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3196 = !DILocalVariable(name: "value", arg: 1, scope: !3195, file: !72, line: 3011, type: !13)
!3197 = !DILocation(line: 3011, column: 33, scope: !3195)
!3198 = !DILocalVariable(name: "factor", arg: 2, scope: !3195, file: !72, line: 3011, type: !13)
!3199 = !DILocation(line: 3011, column: 44, scope: !3195)
!3200 = !DILocation(line: 3013, column: 41, scope: !3195)
!3201 = !DILocation(line: 3013, column: 47, scope: !3195)
!3202 = !DILocation(line: 3013, column: 10, scope: !3195)
!3203 = !DILocation(line: 3013, column: 3, scope: !3195)
!3204 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !72, file: !72, line: 3036, type: !301, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3205 = !DILocalVariable(name: "value", arg: 1, scope: !3204, file: !72, line: 3036, type: !13)
!3206 = !DILocation(line: 3036, column: 32, scope: !3204)
!3207 = !DILocalVariable(name: "factor", arg: 2, scope: !3204, file: !72, line: 3036, type: !13)
!3208 = !DILocation(line: 3036, column: 43, scope: !3204)
!3209 = !DILocation(line: 3038, column: 41, scope: !3204)
!3210 = !DILocation(line: 3038, column: 47, scope: !3204)
!3211 = !DILocation(line: 3038, column: 10, scope: !3204)
!3212 = !DILocation(line: 3038, column: 3, scope: !3204)
!3213 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !72, file: !72, line: 3061, type: !301, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3214 = !DILocalVariable(name: "value", arg: 1, scope: !3213, file: !72, line: 3061, type: !13)
!3215 = !DILocation(line: 3061, column: 34, scope: !3213)
!3216 = !DILocalVariable(name: "factor", arg: 2, scope: !3213, file: !72, line: 3061, type: !13)
!3217 = !DILocation(line: 3061, column: 45, scope: !3213)
!3218 = !DILocation(line: 3063, column: 44, scope: !3213)
!3219 = !DILocation(line: 3063, column: 50, scope: !3213)
!3220 = !DILocation(line: 3063, column: 10, scope: !3213)
!3221 = !DILocation(line: 3063, column: 3, scope: !3213)
!3222 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !72, file: !72, line: 3086, type: !301, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3223 = !DILocalVariable(name: "value", arg: 1, scope: !3222, file: !72, line: 3086, type: !13)
!3224 = !DILocation(line: 3086, column: 33, scope: !3222)
!3225 = !DILocalVariable(name: "factor", arg: 2, scope: !3222, file: !72, line: 3086, type: !13)
!3226 = !DILocation(line: 3086, column: 44, scope: !3222)
!3227 = !DILocation(line: 3088, column: 44, scope: !3222)
!3228 = !DILocation(line: 3088, column: 50, scope: !3222)
!3229 = !DILocation(line: 3088, column: 10, scope: !3222)
!3230 = !DILocation(line: 3088, column: 3, scope: !3222)
!3231 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !72, file: !72, line: 3111, type: !301, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3232 = !DILocalVariable(name: "value", arg: 1, scope: !3231, file: !72, line: 3111, type: !13)
!3233 = !DILocation(line: 3111, column: 31, scope: !3231)
!3234 = !DILocalVariable(name: "factor", arg: 2, scope: !3231, file: !72, line: 3111, type: !13)
!3235 = !DILocation(line: 3111, column: 42, scope: !3231)
!3236 = !DILocation(line: 3113, column: 44, scope: !3231)
!3237 = !DILocation(line: 3113, column: 50, scope: !3231)
!3238 = !DILocation(line: 3113, column: 10, scope: !3231)
!3239 = !DILocation(line: 3113, column: 3, scope: !3231)
!3240 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !72, file: !72, line: 3136, type: !301, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3241 = !DILocalVariable(name: "value", arg: 1, scope: !3240, file: !72, line: 3136, type: !13)
!3242 = !DILocation(line: 3136, column: 33, scope: !3240)
!3243 = !DILocalVariable(name: "factor", arg: 2, scope: !3240, file: !72, line: 3136, type: !13)
!3244 = !DILocation(line: 3136, column: 44, scope: !3240)
!3245 = !DILocation(line: 3138, column: 44, scope: !3240)
!3246 = !DILocation(line: 3138, column: 50, scope: !3240)
!3247 = !DILocation(line: 3138, column: 10, scope: !3240)
!3248 = !DILocation(line: 3138, column: 3, scope: !3240)
!3249 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !72, file: !72, line: 3161, type: !301, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3250 = !DILocalVariable(name: "value", arg: 1, scope: !3249, file: !72, line: 3161, type: !13)
!3251 = !DILocation(line: 3161, column: 32, scope: !3249)
!3252 = !DILocalVariable(name: "factor", arg: 2, scope: !3249, file: !72, line: 3161, type: !13)
!3253 = !DILocation(line: 3161, column: 43, scope: !3249)
!3254 = !DILocation(line: 3163, column: 44, scope: !3249)
!3255 = !DILocation(line: 3163, column: 50, scope: !3249)
!3256 = !DILocation(line: 3163, column: 10, scope: !3249)
!3257 = !DILocation(line: 3163, column: 3, scope: !3249)
!3258 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !72, file: !72, line: 3185, type: !301, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3259 = !DILocalVariable(name: "value", arg: 1, scope: !3258, file: !72, line: 3185, type: !13)
!3260 = !DILocation(line: 3185, column: 31, scope: !3258)
!3261 = !DILocalVariable(name: "factor", arg: 2, scope: !3258, file: !72, line: 3185, type: !13)
!3262 = !DILocation(line: 3185, column: 42, scope: !3258)
!3263 = !DILocation(line: 3187, column: 44, scope: !3258)
!3264 = !DILocation(line: 3187, column: 50, scope: !3258)
!3265 = !DILocation(line: 3187, column: 10, scope: !3258)
!3266 = !DILocation(line: 3187, column: 3, scope: !3258)
!3267 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !72, file: !72, line: 3209, type: !301, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3268 = !DILocalVariable(name: "value", arg: 1, scope: !3267, file: !72, line: 3209, type: !13)
!3269 = !DILocation(line: 3209, column: 30, scope: !3267)
!3270 = !DILocalVariable(name: "factor", arg: 2, scope: !3267, file: !72, line: 3209, type: !13)
!3271 = !DILocation(line: 3209, column: 41, scope: !3267)
!3272 = !DILocation(line: 3211, column: 44, scope: !3267)
!3273 = !DILocation(line: 3211, column: 50, scope: !3267)
!3274 = !DILocation(line: 3211, column: 10, scope: !3267)
!3275 = !DILocation(line: 3211, column: 3, scope: !3267)
!3276 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !72, file: !72, line: 3233, type: !301, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3277 = !DILocalVariable(name: "value", arg: 1, scope: !3276, file: !72, line: 3233, type: !13)
!3278 = !DILocation(line: 3233, column: 33, scope: !3276)
!3279 = !DILocalVariable(name: "factor", arg: 2, scope: !3276, file: !72, line: 3233, type: !13)
!3280 = !DILocation(line: 3233, column: 44, scope: !3276)
!3281 = !DILocation(line: 3235, column: 44, scope: !3276)
!3282 = !DILocation(line: 3235, column: 50, scope: !3276)
!3283 = !DILocation(line: 3235, column: 10, scope: !3276)
!3284 = !DILocation(line: 3235, column: 3, scope: !3276)
!3285 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !72, file: !72, line: 3257, type: !301, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3286 = !DILocalVariable(name: "value", arg: 1, scope: !3285, file: !72, line: 3257, type: !13)
!3287 = !DILocation(line: 3257, column: 32, scope: !3285)
!3288 = !DILocalVariable(name: "factor", arg: 2, scope: !3285, file: !72, line: 3257, type: !13)
!3289 = !DILocation(line: 3257, column: 43, scope: !3285)
!3290 = !DILocation(line: 3259, column: 44, scope: !3285)
!3291 = !DILocation(line: 3259, column: 50, scope: !3285)
!3292 = !DILocation(line: 3259, column: 10, scope: !3285)
!3293 = !DILocation(line: 3259, column: 3, scope: !3285)
!3294 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !72, file: !72, line: 3281, type: !301, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3295 = !DILocalVariable(name: "value", arg: 1, scope: !3294, file: !72, line: 3281, type: !13)
!3296 = !DILocation(line: 3281, column: 31, scope: !3294)
!3297 = !DILocalVariable(name: "factor", arg: 2, scope: !3294, file: !72, line: 3281, type: !13)
!3298 = !DILocation(line: 3281, column: 42, scope: !3294)
!3299 = !DILocation(line: 3283, column: 44, scope: !3294)
!3300 = !DILocation(line: 3283, column: 50, scope: !3294)
!3301 = !DILocation(line: 3283, column: 10, scope: !3294)
!3302 = !DILocation(line: 3283, column: 3, scope: !3294)
!3303 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !72, file: !72, line: 3305, type: !301, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3304 = !DILocalVariable(name: "value", arg: 1, scope: !3303, file: !72, line: 3305, type: !13)
!3305 = !DILocation(line: 3305, column: 30, scope: !3303)
!3306 = !DILocalVariable(name: "factor", arg: 2, scope: !3303, file: !72, line: 3305, type: !13)
!3307 = !DILocation(line: 3305, column: 41, scope: !3303)
!3308 = !DILocation(line: 3307, column: 44, scope: !3303)
!3309 = !DILocation(line: 3307, column: 50, scope: !3303)
!3310 = !DILocation(line: 3307, column: 10, scope: !3303)
!3311 = !DILocation(line: 3307, column: 3, scope: !3303)
!3312 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !72, file: !72, line: 3328, type: !390, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3313 = !DILocalVariable(name: "value", arg: 1, scope: !3312, file: !72, line: 3328, type: !13)
!3314 = !DILocation(line: 3328, column: 33, scope: !3312)
!3315 = !DILocalVariable(name: "factor", arg: 2, scope: !3312, file: !72, line: 3328, type: !22)
!3316 = !DILocation(line: 3328, column: 44, scope: !3312)
!3317 = !DILocation(line: 3330, column: 41, scope: !3312)
!3318 = !DILocation(line: 3330, column: 47, scope: !3312)
!3319 = !DILocation(line: 3330, column: 10, scope: !3312)
!3320 = !DILocation(line: 3330, column: 3, scope: !3312)
!3321 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !72, file: !72, line: 3351, type: !390, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3322 = !DILocalVariable(name: "value", arg: 1, scope: !3321, file: !72, line: 3351, type: !13)
!3323 = !DILocation(line: 3351, column: 32, scope: !3321)
!3324 = !DILocalVariable(name: "factor", arg: 2, scope: !3321, file: !72, line: 3351, type: !22)
!3325 = !DILocation(line: 3351, column: 43, scope: !3321)
!3326 = !DILocation(line: 3353, column: 33, scope: !3321)
!3327 = !DILocation(line: 3353, column: 39, scope: !3321)
!3328 = !DILocation(line: 3353, column: 2, scope: !3321)
!3329 = !DILocation(line: 3354, column: 1, scope: !3321)
!3330 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !72, file: !72, line: 3375, type: !390, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3331 = !DILocalVariable(name: "value", arg: 1, scope: !3330, file: !72, line: 3375, type: !13)
!3332 = !DILocation(line: 3375, column: 31, scope: !3330)
!3333 = !DILocalVariable(name: "factor", arg: 2, scope: !3330, file: !72, line: 3375, type: !22)
!3334 = !DILocation(line: 3375, column: 42, scope: !3330)
!3335 = !DILocation(line: 3377, column: 41, scope: !3330)
!3336 = !DILocation(line: 3377, column: 47, scope: !3330)
!3337 = !DILocation(line: 3377, column: 10, scope: !3330)
!3338 = !DILocation(line: 3377, column: 3, scope: !3330)
!3339 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !72, file: !72, line: 3400, type: !390, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3340 = !DILocalVariable(name: "value", arg: 1, scope: !3339, file: !72, line: 3400, type: !13)
!3341 = !DILocation(line: 3400, column: 33, scope: !3339)
!3342 = !DILocalVariable(name: "factor", arg: 2, scope: !3339, file: !72, line: 3400, type: !22)
!3343 = !DILocation(line: 3400, column: 44, scope: !3339)
!3344 = !DILocation(line: 3402, column: 44, scope: !3339)
!3345 = !DILocation(line: 3402, column: 50, scope: !3339)
!3346 = !DILocation(line: 3402, column: 10, scope: !3339)
!3347 = !DILocation(line: 3402, column: 3, scope: !3339)
!3348 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !72, file: !72, line: 3425, type: !390, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3349 = !DILocalVariable(name: "value", arg: 1, scope: !3348, file: !72, line: 3425, type: !13)
!3350 = !DILocation(line: 3425, column: 32, scope: !3348)
!3351 = !DILocalVariable(name: "factor", arg: 2, scope: !3348, file: !72, line: 3425, type: !22)
!3352 = !DILocation(line: 3425, column: 43, scope: !3348)
!3353 = !DILocation(line: 3427, column: 44, scope: !3348)
!3354 = !DILocation(line: 3427, column: 50, scope: !3348)
!3355 = !DILocation(line: 3427, column: 10, scope: !3348)
!3356 = !DILocation(line: 3427, column: 3, scope: !3348)
!3357 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !72, file: !72, line: 3450, type: !390, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3358 = !DILocalVariable(name: "value", arg: 1, scope: !3357, file: !72, line: 3450, type: !13)
!3359 = !DILocation(line: 3450, column: 31, scope: !3357)
!3360 = !DILocalVariable(name: "factor", arg: 2, scope: !3357, file: !72, line: 3450, type: !22)
!3361 = !DILocation(line: 3450, column: 42, scope: !3357)
!3362 = !DILocation(line: 3452, column: 44, scope: !3357)
!3363 = !DILocation(line: 3452, column: 50, scope: !3357)
!3364 = !DILocation(line: 3452, column: 10, scope: !3357)
!3365 = !DILocation(line: 3452, column: 3, scope: !3357)
!3366 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !72, file: !72, line: 3475, type: !390, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3367 = !DILocalVariable(name: "value", arg: 1, scope: !3366, file: !72, line: 3475, type: !13)
!3368 = !DILocation(line: 3475, column: 33, scope: !3366)
!3369 = !DILocalVariable(name: "factor", arg: 2, scope: !3366, file: !72, line: 3475, type: !22)
!3370 = !DILocation(line: 3475, column: 44, scope: !3366)
!3371 = !DILocation(line: 3477, column: 44, scope: !3366)
!3372 = !DILocation(line: 3477, column: 50, scope: !3366)
!3373 = !DILocation(line: 3477, column: 10, scope: !3366)
!3374 = !DILocation(line: 3477, column: 3, scope: !3366)
!3375 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !72, file: !72, line: 3500, type: !390, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3376 = !DILocalVariable(name: "value", arg: 1, scope: !3375, file: !72, line: 3500, type: !13)
!3377 = !DILocation(line: 3500, column: 32, scope: !3375)
!3378 = !DILocalVariable(name: "factor", arg: 2, scope: !3375, file: !72, line: 3500, type: !22)
!3379 = !DILocation(line: 3500, column: 43, scope: !3375)
!3380 = !DILocation(line: 3502, column: 44, scope: !3375)
!3381 = !DILocation(line: 3502, column: 50, scope: !3375)
!3382 = !DILocation(line: 3502, column: 10, scope: !3375)
!3383 = !DILocation(line: 3502, column: 3, scope: !3375)
!3384 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !72, file: !72, line: 3524, type: !390, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3385 = !DILocalVariable(name: "value", arg: 1, scope: !3384, file: !72, line: 3524, type: !13)
!3386 = !DILocation(line: 3524, column: 31, scope: !3384)
!3387 = !DILocalVariable(name: "factor", arg: 2, scope: !3384, file: !72, line: 3524, type: !22)
!3388 = !DILocation(line: 3524, column: 42, scope: !3384)
!3389 = !DILocation(line: 3526, column: 44, scope: !3384)
!3390 = !DILocation(line: 3526, column: 50, scope: !3384)
!3391 = !DILocation(line: 3526, column: 10, scope: !3384)
!3392 = !DILocation(line: 3526, column: 3, scope: !3384)
!3393 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !72, file: !72, line: 3548, type: !390, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3394 = !DILocalVariable(name: "value", arg: 1, scope: !3393, file: !72, line: 3548, type: !13)
!3395 = !DILocation(line: 3548, column: 30, scope: !3393)
!3396 = !DILocalVariable(name: "factor", arg: 2, scope: !3393, file: !72, line: 3548, type: !22)
!3397 = !DILocation(line: 3548, column: 41, scope: !3393)
!3398 = !DILocation(line: 3550, column: 44, scope: !3393)
!3399 = !DILocation(line: 3550, column: 50, scope: !3393)
!3400 = !DILocation(line: 3550, column: 10, scope: !3393)
!3401 = !DILocation(line: 3550, column: 3, scope: !3393)
!3402 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !72, file: !72, line: 3572, type: !390, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3403 = !DILocalVariable(name: "value", arg: 1, scope: !3402, file: !72, line: 3572, type: !13)
!3404 = !DILocation(line: 3572, column: 33, scope: !3402)
!3405 = !DILocalVariable(name: "factor", arg: 2, scope: !3402, file: !72, line: 3572, type: !22)
!3406 = !DILocation(line: 3572, column: 44, scope: !3402)
!3407 = !DILocation(line: 3574, column: 44, scope: !3402)
!3408 = !DILocation(line: 3574, column: 50, scope: !3402)
!3409 = !DILocation(line: 3574, column: 10, scope: !3402)
!3410 = !DILocation(line: 3574, column: 3, scope: !3402)
!3411 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !72, file: !72, line: 3596, type: !390, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3412 = !DILocalVariable(name: "value", arg: 1, scope: !3411, file: !72, line: 3596, type: !13)
!3413 = !DILocation(line: 3596, column: 32, scope: !3411)
!3414 = !DILocalVariable(name: "factor", arg: 2, scope: !3411, file: !72, line: 3596, type: !22)
!3415 = !DILocation(line: 3596, column: 43, scope: !3411)
!3416 = !DILocation(line: 3598, column: 44, scope: !3411)
!3417 = !DILocation(line: 3598, column: 50, scope: !3411)
!3418 = !DILocation(line: 3598, column: 10, scope: !3411)
!3419 = !DILocation(line: 3598, column: 3, scope: !3411)
!3420 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !72, file: !72, line: 3620, type: !390, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3421 = !DILocalVariable(name: "value", arg: 1, scope: !3420, file: !72, line: 3620, type: !13)
!3422 = !DILocation(line: 3620, column: 31, scope: !3420)
!3423 = !DILocalVariable(name: "factor", arg: 2, scope: !3420, file: !72, line: 3620, type: !22)
!3424 = !DILocation(line: 3620, column: 42, scope: !3420)
!3425 = !DILocation(line: 3622, column: 44, scope: !3420)
!3426 = !DILocation(line: 3622, column: 50, scope: !3420)
!3427 = !DILocation(line: 3622, column: 10, scope: !3420)
!3428 = !DILocation(line: 3622, column: 3, scope: !3420)
!3429 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !72, file: !72, line: 3644, type: !390, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3430 = !DILocalVariable(name: "value", arg: 1, scope: !3429, file: !72, line: 3644, type: !13)
!3431 = !DILocation(line: 3644, column: 30, scope: !3429)
!3432 = !DILocalVariable(name: "factor", arg: 2, scope: !3429, file: !72, line: 3644, type: !22)
!3433 = !DILocation(line: 3644, column: 41, scope: !3429)
!3434 = !DILocation(line: 3646, column: 44, scope: !3429)
!3435 = !DILocation(line: 3646, column: 50, scope: !3429)
!3436 = !DILocation(line: 3646, column: 10, scope: !3429)
!3437 = !DILocation(line: 3646, column: 3, scope: !3429)
!3438 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !72, file: !72, line: 3666, type: !475, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3439 = !DILocalVariable(name: "value", arg: 1, scope: !3438, file: !72, line: 3666, type: !13)
!3440 = !DILocation(line: 3666, column: 32, scope: !3438)
!3441 = !DILocalVariable(name: "factor", arg: 2, scope: !3438, file: !72, line: 3666, type: !17)
!3442 = !DILocation(line: 3666, column: 42, scope: !3438)
!3443 = !DILocation(line: 3668, column: 40, scope: !3438)
!3444 = !DILocation(line: 3668, column: 58, scope: !3438)
!3445 = !DILocation(line: 3668, column: 52, scope: !3438)
!3446 = !DILocation(line: 3668, column: 66, scope: !3438)
!3447 = !DILocation(line: 3668, column: 46, scope: !3438)
!3448 = !DILocation(line: 3668, column: 10, scope: !3438)
!3449 = !DILocation(line: 3668, column: 3, scope: !3438)
!3450 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !72, file: !72, line: 3688, type: !475, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3451 = !DILocalVariable(name: "value", arg: 1, scope: !3450, file: !72, line: 3688, type: !13)
!3452 = !DILocation(line: 3688, column: 31, scope: !3450)
!3453 = !DILocalVariable(name: "factor", arg: 2, scope: !3450, file: !72, line: 3688, type: !17)
!3454 = !DILocation(line: 3688, column: 41, scope: !3450)
!3455 = !DILocation(line: 3690, column: 40, scope: !3450)
!3456 = !DILocation(line: 3690, column: 58, scope: !3450)
!3457 = !DILocation(line: 3690, column: 52, scope: !3450)
!3458 = !DILocation(line: 3690, column: 66, scope: !3450)
!3459 = !DILocation(line: 3690, column: 46, scope: !3450)
!3460 = !DILocation(line: 3690, column: 10, scope: !3450)
!3461 = !DILocation(line: 3690, column: 3, scope: !3450)
!3462 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !72, file: !72, line: 3711, type: !475, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3463 = !DILocalVariable(name: "value", arg: 1, scope: !3462, file: !72, line: 3711, type: !13)
!3464 = !DILocation(line: 3711, column: 30, scope: !3462)
!3465 = !DILocalVariable(name: "factor", arg: 2, scope: !3462, file: !72, line: 3711, type: !17)
!3466 = !DILocation(line: 3711, column: 40, scope: !3462)
!3467 = !DILocation(line: 3713, column: 40, scope: !3462)
!3468 = !DILocation(line: 3713, column: 58, scope: !3462)
!3469 = !DILocation(line: 3713, column: 52, scope: !3462)
!3470 = !DILocation(line: 3713, column: 66, scope: !3462)
!3471 = !DILocation(line: 3713, column: 46, scope: !3462)
!3472 = !DILocation(line: 3713, column: 10, scope: !3462)
!3473 = !DILocation(line: 3713, column: 3, scope: !3462)
!3474 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !72, file: !72, line: 3734, type: !475, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3475 = !DILocalVariable(name: "value", arg: 1, scope: !3474, file: !72, line: 3734, type: !13)
!3476 = !DILocation(line: 3734, column: 31, scope: !3474)
!3477 = !DILocalVariable(name: "factor", arg: 2, scope: !3474, file: !72, line: 3734, type: !17)
!3478 = !DILocation(line: 3734, column: 41, scope: !3474)
!3479 = !DILocation(line: 3736, column: 43, scope: !3474)
!3480 = !DILocation(line: 3736, column: 61, scope: !3474)
!3481 = !DILocation(line: 3736, column: 55, scope: !3474)
!3482 = !DILocation(line: 3736, column: 69, scope: !3474)
!3483 = !DILocation(line: 3736, column: 49, scope: !3474)
!3484 = !DILocation(line: 3736, column: 10, scope: !3474)
!3485 = !DILocation(line: 3736, column: 3, scope: !3474)
!3486 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !72, file: !72, line: 3757, type: !475, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3487 = !DILocalVariable(name: "value", arg: 1, scope: !3486, file: !72, line: 3757, type: !13)
!3488 = !DILocation(line: 3757, column: 30, scope: !3486)
!3489 = !DILocalVariable(name: "factor", arg: 2, scope: !3486, file: !72, line: 3757, type: !17)
!3490 = !DILocation(line: 3757, column: 40, scope: !3486)
!3491 = !DILocation(line: 3759, column: 43, scope: !3486)
!3492 = !DILocation(line: 3759, column: 61, scope: !3486)
!3493 = !DILocation(line: 3759, column: 55, scope: !3486)
!3494 = !DILocation(line: 3759, column: 69, scope: !3486)
!3495 = !DILocation(line: 3759, column: 49, scope: !3486)
!3496 = !DILocation(line: 3759, column: 10, scope: !3486)
!3497 = !DILocation(line: 3759, column: 3, scope: !3486)
!3498 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !72, file: !72, line: 3779, type: !475, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3499 = !DILocalVariable(name: "value", arg: 1, scope: !3498, file: !72, line: 3779, type: !13)
!3500 = !DILocation(line: 3779, column: 30, scope: !3498)
!3501 = !DILocalVariable(name: "factor", arg: 2, scope: !3498, file: !72, line: 3779, type: !17)
!3502 = !DILocation(line: 3779, column: 40, scope: !3498)
!3503 = !DILocation(line: 3781, column: 43, scope: !3498)
!3504 = !DILocation(line: 3781, column: 61, scope: !3498)
!3505 = !DILocation(line: 3781, column: 55, scope: !3498)
!3506 = !DILocation(line: 3781, column: 69, scope: !3498)
!3507 = !DILocation(line: 3781, column: 49, scope: !3498)
!3508 = !DILocation(line: 3781, column: 10, scope: !3498)
!3509 = !DILocation(line: 3781, column: 3, scope: !3498)
!3510 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !72, file: !72, line: 3801, type: !475, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3511 = !DILocalVariable(name: "value", arg: 1, scope: !3510, file: !72, line: 3801, type: !13)
!3512 = !DILocation(line: 3801, column: 29, scope: !3510)
!3513 = !DILocalVariable(name: "factor", arg: 2, scope: !3510, file: !72, line: 3801, type: !17)
!3514 = !DILocation(line: 3801, column: 39, scope: !3510)
!3515 = !DILocation(line: 3803, column: 43, scope: !3510)
!3516 = !DILocation(line: 3803, column: 61, scope: !3510)
!3517 = !DILocation(line: 3803, column: 55, scope: !3510)
!3518 = !DILocation(line: 3803, column: 69, scope: !3510)
!3519 = !DILocation(line: 3803, column: 49, scope: !3510)
!3520 = !DILocation(line: 3803, column: 10, scope: !3510)
!3521 = !DILocation(line: 3803, column: 3, scope: !3510)
!3522 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !72, file: !72, line: 3823, type: !475, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3523 = !DILocalVariable(name: "value", arg: 1, scope: !3522, file: !72, line: 3823, type: !13)
!3524 = !DILocation(line: 3823, column: 30, scope: !3522)
!3525 = !DILocalVariable(name: "factor", arg: 2, scope: !3522, file: !72, line: 3823, type: !17)
!3526 = !DILocation(line: 3823, column: 40, scope: !3522)
!3527 = !DILocation(line: 3825, column: 43, scope: !3522)
!3528 = !DILocation(line: 3825, column: 61, scope: !3522)
!3529 = !DILocation(line: 3825, column: 55, scope: !3522)
!3530 = !DILocation(line: 3825, column: 69, scope: !3522)
!3531 = !DILocation(line: 3825, column: 49, scope: !3522)
!3532 = !DILocation(line: 3825, column: 10, scope: !3522)
!3533 = !DILocation(line: 3825, column: 3, scope: !3522)
!3534 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !72, file: !72, line: 3845, type: !475, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3535 = !DILocalVariable(name: "value", arg: 1, scope: !3534, file: !72, line: 3845, type: !13)
!3536 = !DILocation(line: 3845, column: 29, scope: !3534)
!3537 = !DILocalVariable(name: "factor", arg: 2, scope: !3534, file: !72, line: 3845, type: !17)
!3538 = !DILocation(line: 3845, column: 39, scope: !3534)
!3539 = !DILocation(line: 3847, column: 43, scope: !3534)
!3540 = !DILocation(line: 3847, column: 61, scope: !3534)
!3541 = !DILocation(line: 3847, column: 55, scope: !3534)
!3542 = !DILocation(line: 3847, column: 69, scope: !3534)
!3543 = !DILocation(line: 3847, column: 49, scope: !3534)
!3544 = !DILocation(line: 3847, column: 10, scope: !3534)
!3545 = !DILocation(line: 3847, column: 3, scope: !3534)
!3546 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !72, file: !72, line: 3869, type: !1870, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3547 = !DILocalVariable(name: "value", arg: 1, scope: !3546, file: !72, line: 3869, type: !80)
!3548 = !DILocation(line: 3869, column: 31, scope: !3546)
!3549 = !DILocalVariable(name: "factor", arg: 2, scope: !3546, file: !72, line: 3869, type: !13)
!3550 = !DILocation(line: 3869, column: 42, scope: !3546)
!3551 = !DILocation(line: 3871, column: 41, scope: !3546)
!3552 = !DILocation(line: 3871, column: 47, scope: !3546)
!3553 = !DILocation(line: 3871, column: 10, scope: !3546)
!3554 = !DILocation(line: 3871, column: 3, scope: !3546)
!3555 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !72, file: !72, line: 5065, type: !3556, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3556 = !DISubroutineType(types: !3557)
!3557 = !{!80, !80, !13, !736}
!3558 = !DILocalVariable(name: "value", arg: 1, scope: !3555, file: !72, line: 5065, type: !80)
!3559 = !DILocation(line: 5065, column: 40, scope: !3555)
!3560 = !DILocalVariable(name: "factor", arg: 2, scope: !3555, file: !72, line: 5065, type: !13)
!3561 = !DILocation(line: 5065, column: 51, scope: !3555)
!3562 = !DILocalVariable(name: "count", arg: 3, scope: !3555, file: !72, line: 5065, type: !736)
!3563 = !DILocation(line: 5065, column: 63, scope: !3555)
!3564 = !DILocalVariable(name: "u32Temp1", scope: !3555, file: !72, line: 5067, type: !736)
!3565 = !DILocation(line: 5067, column: 6, scope: !3555)
!3566 = !DILocalVariable(name: "u32Temp2", scope: !3555, file: !72, line: 5067, type: !736)
!3567 = !DILocation(line: 5067, column: 17, scope: !3555)
!3568 = !DILocalVariable(name: "u32Temp3", scope: !3555, file: !72, line: 5067, type: !736)
!3569 = !DILocation(line: 5067, column: 26, scope: !3555)
!3570 = !DILocalVariable(name: "u32Temp4", scope: !3555, file: !72, line: 5067, type: !736)
!3571 = !DILocation(line: 5067, column: 35, scope: !3555)
!3572 = !DILocalVariable(name: "u8SignBit", scope: !3555, file: !72, line: 5068, type: !17)
!3573 = !DILocation(line: 5068, column: 5, scope: !3555)
!3574 = !DILocation(line: 5070, column: 7, scope: !3575)
!3575 = distinct !DILexicalBlock(scope: !3555, file: !72, line: 5070, column: 5)
!3576 = !DILocation(line: 5070, column: 12, scope: !3575)
!3577 = !DILocation(line: 5070, column: 16, scope: !3575)
!3578 = !DILocation(line: 5070, column: 20, scope: !3575)
!3579 = !DILocation(line: 5070, column: 26, scope: !3575)
!3580 = !DILocation(line: 5070, column: 31, scope: !3575)
!3581 = !DILocation(line: 5070, column: 36, scope: !3575)
!3582 = !DILocation(line: 5070, column: 41, scope: !3575)
!3583 = !DILocation(line: 5070, column: 45, scope: !3575)
!3584 = !DILocation(line: 5070, column: 49, scope: !3575)
!3585 = !DILocation(line: 5070, column: 55, scope: !3575)
!3586 = !DILocation(line: 5070, column: 5, scope: !3555)
!3587 = !DILocation(line: 5072, column: 13, scope: !3588)
!3588 = distinct !DILexicalBlock(scope: !3575, file: !72, line: 5071, column: 2)
!3589 = !DILocation(line: 5073, column: 2, scope: !3588)
!3590 = !DILocation(line: 5076, column: 13, scope: !3591)
!3591 = distinct !DILexicalBlock(scope: !3575, file: !72, line: 5075, column: 2)
!3592 = !DILocation(line: 5079, column: 5, scope: !3593)
!3593 = distinct !DILexicalBlock(scope: !3555, file: !72, line: 5079, column: 5)
!3594 = !DILocation(line: 5079, column: 10, scope: !3593)
!3595 = !DILocation(line: 5079, column: 5, scope: !3555)
!3596 = !DILocation(line: 5081, column: 15, scope: !3597)
!3597 = distinct !DILexicalBlock(scope: !3593, file: !72, line: 5080, column: 2)
!3598 = !DILocation(line: 5081, column: 14, scope: !3597)
!3599 = !DILocation(line: 5081, column: 12, scope: !3597)
!3600 = !DILocation(line: 5082, column: 2, scope: !3597)
!3601 = !DILocation(line: 5085, column: 14, scope: !3602)
!3602 = distinct !DILexicalBlock(scope: !3593, file: !72, line: 5084, column: 2)
!3603 = !DILocation(line: 5085, column: 12, scope: !3602)
!3604 = !DILocation(line: 5088, column: 5, scope: !3605)
!3605 = distinct !DILexicalBlock(scope: !3555, file: !72, line: 5088, column: 5)
!3606 = !DILocation(line: 5088, column: 11, scope: !3605)
!3607 = !DILocation(line: 5088, column: 5, scope: !3555)
!3608 = !DILocation(line: 5090, column: 15, scope: !3609)
!3609 = distinct !DILexicalBlock(scope: !3605, file: !72, line: 5089, column: 2)
!3610 = !DILocation(line: 5090, column: 14, scope: !3609)
!3611 = !DILocation(line: 5090, column: 12, scope: !3609)
!3612 = !DILocation(line: 5091, column: 2, scope: !3609)
!3613 = !DILocation(line: 5094, column: 14, scope: !3614)
!3614 = distinct !DILexicalBlock(scope: !3605, file: !72, line: 5093, column: 2)
!3615 = !DILocation(line: 5094, column: 12, scope: !3614)
!3616 = !DILocation(line: 5097, column: 13, scope: !3555)
!3617 = !DILocation(line: 5097, column: 24, scope: !3555)
!3618 = !DILocation(line: 5097, column: 22, scope: !3555)
!3619 = !DILocation(line: 5097, column: 11, scope: !3555)
!3620 = !DILocation(line: 5098, column: 25, scope: !3555)
!3621 = !DILocation(line: 5098, column: 35, scope: !3555)
!3622 = !DILocation(line: 5098, column: 13, scope: !3555)
!3623 = !DILocation(line: 5098, column: 11, scope: !3555)
!3624 = !DILocation(line: 5099, column: 13, scope: !3555)
!3625 = !DILocation(line: 5099, column: 25, scope: !3555)
!3626 = !DILocation(line: 5099, column: 22, scope: !3555)
!3627 = !DILocation(line: 5099, column: 11, scope: !3555)
!3628 = !DILocation(line: 5100, column: 14, scope: !3555)
!3629 = !DILocation(line: 5100, column: 30, scope: !3555)
!3630 = !DILocation(line: 5100, column: 29, scope: !3555)
!3631 = !DILocation(line: 5100, column: 23, scope: !3555)
!3632 = !DILocation(line: 5100, column: 11, scope: !3555)
!3633 = !DILocation(line: 5101, column: 6, scope: !3634)
!3634 = distinct !DILexicalBlock(scope: !3555, file: !72, line: 5101, column: 5)
!3635 = !DILocation(line: 5101, column: 16, scope: !3634)
!3636 = !DILocation(line: 5101, column: 14, scope: !3634)
!3637 = !DILocation(line: 5101, column: 22, scope: !3634)
!3638 = !DILocation(line: 5101, column: 5, scope: !3555)
!3639 = !DILocation(line: 5103, column: 6, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3641, file: !72, line: 5103, column: 6)
!3641 = distinct !DILexicalBlock(scope: !3634, file: !72, line: 5102, column: 2)
!3642 = !DILocation(line: 5103, column: 16, scope: !3640)
!3643 = !DILocation(line: 5103, column: 6, scope: !3641)
!3644 = !DILocation(line: 5105, column: 7, scope: !3645)
!3645 = distinct !DILexicalBlock(scope: !3646, file: !72, line: 5105, column: 7)
!3646 = distinct !DILexicalBlock(scope: !3640, file: !72, line: 5104, column: 3)
!3647 = !DILocation(line: 5105, column: 15, scope: !3645)
!3648 = !DILocation(line: 5105, column: 7, scope: !3646)
!3649 = !DILocation(line: 5106, column: 12, scope: !3645)
!3650 = !DILocation(line: 5106, column: 5, scope: !3645)
!3651 = !DILocation(line: 5108, column: 5, scope: !3645)
!3652 = !DILocation(line: 5112, column: 7, scope: !3653)
!3653 = distinct !DILexicalBlock(scope: !3654, file: !72, line: 5112, column: 7)
!3654 = distinct !DILexicalBlock(scope: !3640, file: !72, line: 5111, column: 3)
!3655 = !DILocation(line: 5112, column: 15, scope: !3653)
!3656 = !DILocation(line: 5112, column: 7, scope: !3654)
!3657 = !DILocation(line: 5113, column: 13, scope: !3653)
!3658 = !DILocation(line: 5113, column: 12, scope: !3653)
!3659 = !DILocation(line: 5113, column: 5, scope: !3653)
!3660 = !DILocation(line: 5115, column: 5, scope: !3653)
!3661 = !DILocation(line: 5120, column: 3, scope: !3662)
!3662 = distinct !DILexicalBlock(scope: !3634, file: !72, line: 5119, column: 2)
!3663 = !DILocation(line: 5122, column: 1, scope: !3555)
!3664 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !72, file: !72, line: 3893, type: !2639, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3665 = !DILocalVariable(name: "value", arg: 1, scope: !3664, file: !72, line: 3893, type: !80)
!3666 = !DILocation(line: 3893, column: 30, scope: !3664)
!3667 = !DILocalVariable(name: "factor", arg: 2, scope: !3664, file: !72, line: 3893, type: !6)
!3668 = !DILocation(line: 3893, column: 40, scope: !3664)
!3669 = !DILocation(line: 3895, column: 40, scope: !3664)
!3670 = !DILocation(line: 3895, column: 46, scope: !3664)
!3671 = !DILocation(line: 3895, column: 10, scope: !3664)
!3672 = !DILocation(line: 3895, column: 3, scope: !3664)
!3673 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !72, file: !72, line: 5217, type: !3674, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3674 = !DISubroutineType(types: !3675)
!3675 = !{!80, !80, !6, !736}
!3676 = !DILocalVariable(name: "value", arg: 1, scope: !3673, file: !72, line: 5217, type: !80)
!3677 = !DILocation(line: 5217, column: 39, scope: !3673)
!3678 = !DILocalVariable(name: "factor", arg: 2, scope: !3673, file: !72, line: 5217, type: !6)
!3679 = !DILocation(line: 5217, column: 49, scope: !3673)
!3680 = !DILocalVariable(name: "count", arg: 3, scope: !3673, file: !72, line: 5217, type: !736)
!3681 = !DILocation(line: 5217, column: 61, scope: !3673)
!3682 = !DILocalVariable(name: "u32Temp1", scope: !3673, file: !72, line: 5219, type: !736)
!3683 = !DILocation(line: 5219, column: 6, scope: !3673)
!3684 = !DILocalVariable(name: "u32Temp2", scope: !3673, file: !72, line: 5219, type: !736)
!3685 = !DILocation(line: 5219, column: 17, scope: !3673)
!3686 = !DILocalVariable(name: "u32Temp3", scope: !3673, file: !72, line: 5219, type: !736)
!3687 = !DILocation(line: 5219, column: 26, scope: !3673)
!3688 = !DILocalVariable(name: "u32Temp4", scope: !3673, file: !72, line: 5219, type: !736)
!3689 = !DILocation(line: 5219, column: 35, scope: !3673)
!3690 = !DILocalVariable(name: "u8SignBit", scope: !3673, file: !72, line: 5220, type: !17)
!3691 = !DILocation(line: 5220, column: 5, scope: !3673)
!3692 = !DILocation(line: 5222, column: 7, scope: !3693)
!3693 = distinct !DILexicalBlock(scope: !3673, file: !72, line: 5222, column: 5)
!3694 = !DILocation(line: 5222, column: 12, scope: !3693)
!3695 = !DILocation(line: 5222, column: 16, scope: !3693)
!3696 = !DILocation(line: 5222, column: 20, scope: !3693)
!3697 = !DILocation(line: 5222, column: 26, scope: !3693)
!3698 = !DILocation(line: 5222, column: 31, scope: !3693)
!3699 = !DILocation(line: 5222, column: 36, scope: !3693)
!3700 = !DILocation(line: 5222, column: 41, scope: !3693)
!3701 = !DILocation(line: 5222, column: 45, scope: !3693)
!3702 = !DILocation(line: 5222, column: 49, scope: !3693)
!3703 = !DILocation(line: 5222, column: 55, scope: !3693)
!3704 = !DILocation(line: 5222, column: 5, scope: !3673)
!3705 = !DILocation(line: 5224, column: 13, scope: !3706)
!3706 = distinct !DILexicalBlock(scope: !3693, file: !72, line: 5223, column: 2)
!3707 = !DILocation(line: 5225, column: 2, scope: !3706)
!3708 = !DILocation(line: 5228, column: 13, scope: !3709)
!3709 = distinct !DILexicalBlock(scope: !3693, file: !72, line: 5227, column: 2)
!3710 = !DILocation(line: 5231, column: 5, scope: !3711)
!3711 = distinct !DILexicalBlock(scope: !3673, file: !72, line: 5231, column: 5)
!3712 = !DILocation(line: 5231, column: 10, scope: !3711)
!3713 = !DILocation(line: 5231, column: 5, scope: !3673)
!3714 = !DILocation(line: 5233, column: 15, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3711, file: !72, line: 5232, column: 2)
!3716 = !DILocation(line: 5233, column: 14, scope: !3715)
!3717 = !DILocation(line: 5233, column: 12, scope: !3715)
!3718 = !DILocation(line: 5234, column: 2, scope: !3715)
!3719 = !DILocation(line: 5237, column: 14, scope: !3720)
!3720 = distinct !DILexicalBlock(scope: !3711, file: !72, line: 5236, column: 2)
!3721 = !DILocation(line: 5237, column: 12, scope: !3720)
!3722 = !DILocation(line: 5240, column: 5, scope: !3723)
!3723 = distinct !DILexicalBlock(scope: !3673, file: !72, line: 5240, column: 5)
!3724 = !DILocation(line: 5240, column: 11, scope: !3723)
!3725 = !DILocation(line: 5240, column: 5, scope: !3673)
!3726 = !DILocation(line: 5242, column: 15, scope: !3727)
!3727 = distinct !DILexicalBlock(scope: !3723, file: !72, line: 5241, column: 2)
!3728 = !DILocation(line: 5242, column: 14, scope: !3727)
!3729 = !DILocation(line: 5242, column: 12, scope: !3727)
!3730 = !DILocation(line: 5243, column: 2, scope: !3727)
!3731 = !DILocation(line: 5246, column: 14, scope: !3732)
!3732 = distinct !DILexicalBlock(scope: !3723, file: !72, line: 5245, column: 2)
!3733 = !DILocation(line: 5246, column: 12, scope: !3732)
!3734 = !DILocation(line: 5249, column: 13, scope: !3673)
!3735 = !DILocation(line: 5249, column: 24, scope: !3673)
!3736 = !DILocation(line: 5249, column: 22, scope: !3673)
!3737 = !DILocation(line: 5249, column: 11, scope: !3673)
!3738 = !DILocation(line: 5250, column: 25, scope: !3673)
!3739 = !DILocation(line: 5250, column: 35, scope: !3673)
!3740 = !DILocation(line: 5250, column: 13, scope: !3673)
!3741 = !DILocation(line: 5250, column: 11, scope: !3673)
!3742 = !DILocation(line: 5251, column: 13, scope: !3673)
!3743 = !DILocation(line: 5251, column: 25, scope: !3673)
!3744 = !DILocation(line: 5251, column: 22, scope: !3673)
!3745 = !DILocation(line: 5251, column: 11, scope: !3673)
!3746 = !DILocation(line: 5252, column: 14, scope: !3673)
!3747 = !DILocation(line: 5252, column: 30, scope: !3673)
!3748 = !DILocation(line: 5252, column: 29, scope: !3673)
!3749 = !DILocation(line: 5252, column: 23, scope: !3673)
!3750 = !DILocation(line: 5252, column: 11, scope: !3673)
!3751 = !DILocation(line: 5253, column: 6, scope: !3752)
!3752 = distinct !DILexicalBlock(scope: !3673, file: !72, line: 5253, column: 5)
!3753 = !DILocation(line: 5253, column: 16, scope: !3752)
!3754 = !DILocation(line: 5253, column: 14, scope: !3752)
!3755 = !DILocation(line: 5253, column: 22, scope: !3752)
!3756 = !DILocation(line: 5253, column: 5, scope: !3673)
!3757 = !DILocation(line: 5255, column: 6, scope: !3758)
!3758 = distinct !DILexicalBlock(scope: !3759, file: !72, line: 5255, column: 6)
!3759 = distinct !DILexicalBlock(scope: !3752, file: !72, line: 5254, column: 2)
!3760 = !DILocation(line: 5255, column: 16, scope: !3758)
!3761 = !DILocation(line: 5255, column: 6, scope: !3759)
!3762 = !DILocation(line: 5257, column: 7, scope: !3763)
!3763 = distinct !DILexicalBlock(scope: !3764, file: !72, line: 5257, column: 7)
!3764 = distinct !DILexicalBlock(scope: !3758, file: !72, line: 5256, column: 3)
!3765 = !DILocation(line: 5257, column: 15, scope: !3763)
!3766 = !DILocation(line: 5257, column: 7, scope: !3764)
!3767 = !DILocation(line: 5258, column: 12, scope: !3763)
!3768 = !DILocation(line: 5258, column: 5, scope: !3763)
!3769 = !DILocation(line: 5260, column: 5, scope: !3763)
!3770 = !DILocation(line: 5264, column: 7, scope: !3771)
!3771 = distinct !DILexicalBlock(scope: !3772, file: !72, line: 5264, column: 7)
!3772 = distinct !DILexicalBlock(scope: !3758, file: !72, line: 5263, column: 3)
!3773 = !DILocation(line: 5264, column: 15, scope: !3771)
!3774 = !DILocation(line: 5264, column: 7, scope: !3772)
!3775 = !DILocation(line: 5265, column: 13, scope: !3771)
!3776 = !DILocation(line: 5265, column: 12, scope: !3771)
!3777 = !DILocation(line: 5265, column: 5, scope: !3771)
!3778 = !DILocation(line: 5267, column: 5, scope: !3771)
!3779 = !DILocation(line: 5272, column: 3, scope: !3780)
!3780 = distinct !DILexicalBlock(scope: !3752, file: !72, line: 5271, column: 2)
!3781 = !DILocation(line: 5274, column: 1, scope: !3673)
!3782 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !72, file: !72, line: 3917, type: !775, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3783 = !DILocalVariable(name: "value", arg: 1, scope: !3782, file: !72, line: 3917, type: !80)
!3784 = !DILocation(line: 3917, column: 31, scope: !3782)
!3785 = !DILocalVariable(name: "factor", arg: 2, scope: !3782, file: !72, line: 3917, type: !22)
!3786 = !DILocation(line: 3917, column: 42, scope: !3782)
!3787 = !DILocation(line: 3919, column: 41, scope: !3782)
!3788 = !DILocation(line: 3919, column: 47, scope: !3782)
!3789 = !DILocation(line: 3919, column: 10, scope: !3782)
!3790 = !DILocation(line: 3919, column: 3, scope: !3782)
!3791 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !72, file: !72, line: 5141, type: !3792, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3792 = !DISubroutineType(types: !3793)
!3793 = !{!80, !80, !22, !736}
!3794 = !DILocalVariable(name: "value", arg: 1, scope: !3791, file: !72, line: 5141, type: !80)
!3795 = !DILocation(line: 5141, column: 40, scope: !3791)
!3796 = !DILocalVariable(name: "factor", arg: 2, scope: !3791, file: !72, line: 5141, type: !22)
!3797 = !DILocation(line: 5141, column: 50, scope: !3791)
!3798 = !DILocalVariable(name: "count", arg: 3, scope: !3791, file: !72, line: 5141, type: !736)
!3799 = !DILocation(line: 5141, column: 62, scope: !3791)
!3800 = !DILocalVariable(name: "u32Temp1", scope: !3791, file: !72, line: 5143, type: !736)
!3801 = !DILocation(line: 5143, column: 6, scope: !3791)
!3802 = !DILocalVariable(name: "u32Temp2", scope: !3791, file: !72, line: 5143, type: !736)
!3803 = !DILocation(line: 5143, column: 17, scope: !3791)
!3804 = !DILocalVariable(name: "u32Temp3", scope: !3791, file: !72, line: 5143, type: !736)
!3805 = !DILocation(line: 5143, column: 26, scope: !3791)
!3806 = !DILocalVariable(name: "u32Temp4", scope: !3791, file: !72, line: 5143, type: !736)
!3807 = !DILocation(line: 5143, column: 35, scope: !3791)
!3808 = !DILocalVariable(name: "u8SignBit", scope: !3791, file: !72, line: 5144, type: !17)
!3809 = !DILocation(line: 5144, column: 5, scope: !3791)
!3810 = !DILocation(line: 5146, column: 7, scope: !3811)
!3811 = distinct !DILexicalBlock(scope: !3791, file: !72, line: 5146, column: 5)
!3812 = !DILocation(line: 5146, column: 12, scope: !3811)
!3813 = !DILocation(line: 5146, column: 16, scope: !3811)
!3814 = !DILocation(line: 5146, column: 20, scope: !3811)
!3815 = !DILocation(line: 5146, column: 26, scope: !3811)
!3816 = !DILocation(line: 5146, column: 31, scope: !3811)
!3817 = !DILocation(line: 5146, column: 36, scope: !3811)
!3818 = !DILocation(line: 5146, column: 41, scope: !3811)
!3819 = !DILocation(line: 5146, column: 45, scope: !3811)
!3820 = !DILocation(line: 5146, column: 49, scope: !3811)
!3821 = !DILocation(line: 5146, column: 55, scope: !3811)
!3822 = !DILocation(line: 5146, column: 5, scope: !3791)
!3823 = !DILocation(line: 5148, column: 13, scope: !3824)
!3824 = distinct !DILexicalBlock(scope: !3811, file: !72, line: 5147, column: 2)
!3825 = !DILocation(line: 5149, column: 2, scope: !3824)
!3826 = !DILocation(line: 5152, column: 13, scope: !3827)
!3827 = distinct !DILexicalBlock(scope: !3811, file: !72, line: 5151, column: 2)
!3828 = !DILocation(line: 5155, column: 5, scope: !3829)
!3829 = distinct !DILexicalBlock(scope: !3791, file: !72, line: 5155, column: 5)
!3830 = !DILocation(line: 5155, column: 10, scope: !3829)
!3831 = !DILocation(line: 5155, column: 5, scope: !3791)
!3832 = !DILocation(line: 5157, column: 15, scope: !3833)
!3833 = distinct !DILexicalBlock(scope: !3829, file: !72, line: 5156, column: 2)
!3834 = !DILocation(line: 5157, column: 14, scope: !3833)
!3835 = !DILocation(line: 5157, column: 12, scope: !3833)
!3836 = !DILocation(line: 5158, column: 2, scope: !3833)
!3837 = !DILocation(line: 5161, column: 14, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3829, file: !72, line: 5160, column: 2)
!3839 = !DILocation(line: 5161, column: 12, scope: !3838)
!3840 = !DILocation(line: 5164, column: 5, scope: !3841)
!3841 = distinct !DILexicalBlock(scope: !3791, file: !72, line: 5164, column: 5)
!3842 = !DILocation(line: 5164, column: 11, scope: !3841)
!3843 = !DILocation(line: 5164, column: 5, scope: !3791)
!3844 = !DILocation(line: 5166, column: 15, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3841, file: !72, line: 5165, column: 2)
!3846 = !DILocation(line: 5166, column: 14, scope: !3845)
!3847 = !DILocation(line: 5166, column: 12, scope: !3845)
!3848 = !DILocation(line: 5167, column: 2, scope: !3845)
!3849 = !DILocation(line: 5170, column: 14, scope: !3850)
!3850 = distinct !DILexicalBlock(scope: !3841, file: !72, line: 5169, column: 2)
!3851 = !DILocation(line: 5170, column: 12, scope: !3850)
!3852 = !DILocation(line: 5173, column: 13, scope: !3791)
!3853 = !DILocation(line: 5173, column: 24, scope: !3791)
!3854 = !DILocation(line: 5173, column: 22, scope: !3791)
!3855 = !DILocation(line: 5173, column: 11, scope: !3791)
!3856 = !DILocation(line: 5174, column: 25, scope: !3791)
!3857 = !DILocation(line: 5174, column: 35, scope: !3791)
!3858 = !DILocation(line: 5174, column: 13, scope: !3791)
!3859 = !DILocation(line: 5174, column: 11, scope: !3791)
!3860 = !DILocation(line: 5175, column: 13, scope: !3791)
!3861 = !DILocation(line: 5175, column: 25, scope: !3791)
!3862 = !DILocation(line: 5175, column: 22, scope: !3791)
!3863 = !DILocation(line: 5175, column: 11, scope: !3791)
!3864 = !DILocation(line: 5176, column: 14, scope: !3791)
!3865 = !DILocation(line: 5176, column: 30, scope: !3791)
!3866 = !DILocation(line: 5176, column: 29, scope: !3791)
!3867 = !DILocation(line: 5176, column: 23, scope: !3791)
!3868 = !DILocation(line: 5176, column: 11, scope: !3791)
!3869 = !DILocation(line: 5177, column: 6, scope: !3870)
!3870 = distinct !DILexicalBlock(scope: !3791, file: !72, line: 5177, column: 5)
!3871 = !DILocation(line: 5177, column: 16, scope: !3870)
!3872 = !DILocation(line: 5177, column: 14, scope: !3870)
!3873 = !DILocation(line: 5177, column: 22, scope: !3870)
!3874 = !DILocation(line: 5177, column: 5, scope: !3791)
!3875 = !DILocation(line: 5179, column: 6, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3877, file: !72, line: 5179, column: 6)
!3877 = distinct !DILexicalBlock(scope: !3870, file: !72, line: 5178, column: 2)
!3878 = !DILocation(line: 5179, column: 16, scope: !3876)
!3879 = !DILocation(line: 5179, column: 6, scope: !3877)
!3880 = !DILocation(line: 5181, column: 7, scope: !3881)
!3881 = distinct !DILexicalBlock(scope: !3882, file: !72, line: 5181, column: 7)
!3882 = distinct !DILexicalBlock(scope: !3876, file: !72, line: 5180, column: 3)
!3883 = !DILocation(line: 5181, column: 15, scope: !3881)
!3884 = !DILocation(line: 5181, column: 7, scope: !3882)
!3885 = !DILocation(line: 5182, column: 12, scope: !3881)
!3886 = !DILocation(line: 5182, column: 5, scope: !3881)
!3887 = !DILocation(line: 5184, column: 5, scope: !3881)
!3888 = !DILocation(line: 5188, column: 7, scope: !3889)
!3889 = distinct !DILexicalBlock(scope: !3890, file: !72, line: 5188, column: 7)
!3890 = distinct !DILexicalBlock(scope: !3876, file: !72, line: 5187, column: 3)
!3891 = !DILocation(line: 5188, column: 15, scope: !3889)
!3892 = !DILocation(line: 5188, column: 7, scope: !3890)
!3893 = !DILocation(line: 5189, column: 13, scope: !3889)
!3894 = !DILocation(line: 5189, column: 12, scope: !3889)
!3895 = !DILocation(line: 5189, column: 5, scope: !3889)
!3896 = !DILocation(line: 5191, column: 5, scope: !3889)
!3897 = !DILocation(line: 5196, column: 3, scope: !3898)
!3898 = distinct !DILexicalBlock(scope: !3870, file: !72, line: 5195, column: 2)
!3899 = !DILocation(line: 5198, column: 1, scope: !3791)
!3900 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !72, file: !72, line: 3941, type: !2344, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3901 = !DILocalVariable(name: "value", arg: 1, scope: !3900, file: !72, line: 3941, type: !80)
!3902 = !DILocation(line: 3941, column: 30, scope: !3900)
!3903 = !DILocalVariable(name: "factor", arg: 2, scope: !3900, file: !72, line: 3941, type: !17)
!3904 = !DILocation(line: 3941, column: 40, scope: !3900)
!3905 = !DILocation(line: 3943, column: 40, scope: !3900)
!3906 = !DILocation(line: 3943, column: 46, scope: !3900)
!3907 = !DILocation(line: 3943, column: 10, scope: !3900)
!3908 = !DILocation(line: 3943, column: 3, scope: !3900)
!3909 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !72, file: !72, line: 5536, type: !3910, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3910 = !DISubroutineType(types: !3911)
!3911 = !{!80, !80, !17, !736}
!3912 = !DILocalVariable(name: "value", arg: 1, scope: !3909, file: !72, line: 5536, type: !80)
!3913 = !DILocation(line: 5536, column: 39, scope: !3909)
!3914 = !DILocalVariable(name: "factor", arg: 2, scope: !3909, file: !72, line: 5536, type: !17)
!3915 = !DILocation(line: 5536, column: 49, scope: !3909)
!3916 = !DILocalVariable(name: "count", arg: 3, scope: !3909, file: !72, line: 5536, type: !736)
!3917 = !DILocation(line: 5536, column: 61, scope: !3909)
!3918 = !DILocalVariable(name: "u32Temp1", scope: !3909, file: !72, line: 5538, type: !736)
!3919 = !DILocation(line: 5538, column: 6, scope: !3909)
!3920 = !DILocalVariable(name: "u32Temp2", scope: !3909, file: !72, line: 5538, type: !736)
!3921 = !DILocation(line: 5538, column: 17, scope: !3909)
!3922 = !DILocalVariable(name: "u32Temp3", scope: !3909, file: !72, line: 5538, type: !736)
!3923 = !DILocation(line: 5538, column: 26, scope: !3909)
!3924 = !DILocalVariable(name: "u8SignBit", scope: !3909, file: !72, line: 5539, type: !17)
!3925 = !DILocation(line: 5539, column: 5, scope: !3909)
!3926 = !DILocation(line: 5541, column: 5, scope: !3927)
!3927 = distinct !DILexicalBlock(scope: !3909, file: !72, line: 5541, column: 5)
!3928 = !DILocation(line: 5541, column: 10, scope: !3927)
!3929 = !DILocation(line: 5541, column: 5, scope: !3909)
!3930 = !DILocation(line: 5543, column: 13, scope: !3931)
!3931 = distinct !DILexicalBlock(scope: !3927, file: !72, line: 5542, column: 2)
!3932 = !DILocation(line: 5544, column: 15, scope: !3931)
!3933 = !DILocation(line: 5544, column: 14, scope: !3931)
!3934 = !DILocation(line: 5544, column: 12, scope: !3931)
!3935 = !DILocation(line: 5545, column: 2, scope: !3931)
!3936 = !DILocation(line: 5548, column: 13, scope: !3937)
!3937 = distinct !DILexicalBlock(scope: !3927, file: !72, line: 5547, column: 2)
!3938 = !DILocation(line: 5549, column: 14, scope: !3937)
!3939 = !DILocation(line: 5549, column: 12, scope: !3937)
!3940 = !DILocation(line: 5552, column: 13, scope: !3909)
!3941 = !DILocation(line: 5552, column: 24, scope: !3909)
!3942 = !DILocation(line: 5552, column: 22, scope: !3909)
!3943 = !DILocation(line: 5552, column: 11, scope: !3909)
!3944 = !DILocation(line: 5553, column: 25, scope: !3909)
!3945 = !DILocation(line: 5553, column: 34, scope: !3909)
!3946 = !DILocation(line: 5553, column: 13, scope: !3909)
!3947 = !DILocation(line: 5553, column: 11, scope: !3909)
!3948 = !DILocation(line: 5554, column: 13, scope: !3909)
!3949 = !DILocation(line: 5554, column: 25, scope: !3909)
!3950 = !DILocation(line: 5554, column: 22, scope: !3909)
!3951 = !DILocation(line: 5554, column: 11, scope: !3909)
!3952 = !DILocation(line: 5555, column: 14, scope: !3909)
!3953 = !DILocation(line: 5555, column: 30, scope: !3909)
!3954 = !DILocation(line: 5555, column: 29, scope: !3909)
!3955 = !DILocation(line: 5555, column: 23, scope: !3909)
!3956 = !DILocation(line: 5555, column: 11, scope: !3909)
!3957 = !DILocation(line: 5556, column: 6, scope: !3958)
!3958 = distinct !DILexicalBlock(scope: !3909, file: !72, line: 5556, column: 5)
!3959 = !DILocation(line: 5556, column: 16, scope: !3958)
!3960 = !DILocation(line: 5556, column: 14, scope: !3958)
!3961 = !DILocation(line: 5556, column: 22, scope: !3958)
!3962 = !DILocation(line: 5556, column: 5, scope: !3909)
!3963 = !DILocation(line: 5558, column: 6, scope: !3964)
!3964 = distinct !DILexicalBlock(scope: !3965, file: !72, line: 5558, column: 6)
!3965 = distinct !DILexicalBlock(scope: !3958, file: !72, line: 5557, column: 2)
!3966 = !DILocation(line: 5558, column: 16, scope: !3964)
!3967 = !DILocation(line: 5558, column: 6, scope: !3965)
!3968 = !DILocation(line: 5560, column: 7, scope: !3969)
!3969 = distinct !DILexicalBlock(scope: !3970, file: !72, line: 5560, column: 7)
!3970 = distinct !DILexicalBlock(scope: !3964, file: !72, line: 5559, column: 3)
!3971 = !DILocation(line: 5560, column: 15, scope: !3969)
!3972 = !DILocation(line: 5560, column: 7, scope: !3970)
!3973 = !DILocation(line: 5561, column: 12, scope: !3969)
!3974 = !DILocation(line: 5561, column: 5, scope: !3969)
!3975 = !DILocation(line: 5563, column: 5, scope: !3969)
!3976 = !DILocation(line: 5567, column: 7, scope: !3977)
!3977 = distinct !DILexicalBlock(scope: !3978, file: !72, line: 5567, column: 7)
!3978 = distinct !DILexicalBlock(scope: !3964, file: !72, line: 5566, column: 3)
!3979 = !DILocation(line: 5567, column: 15, scope: !3977)
!3980 = !DILocation(line: 5567, column: 7, scope: !3978)
!3981 = !DILocation(line: 5569, column: 13, scope: !3982)
!3982 = distinct !DILexicalBlock(scope: !3977, file: !72, line: 5568, column: 4)
!3983 = !DILocation(line: 5569, column: 12, scope: !3982)
!3984 = !DILocation(line: 5569, column: 5, scope: !3982)
!3985 = !DILocation(line: 5573, column: 5, scope: !3986)
!3986 = distinct !DILexicalBlock(scope: !3977, file: !72, line: 5572, column: 4)
!3987 = !DILocation(line: 5579, column: 6, scope: !3988)
!3988 = distinct !DILexicalBlock(scope: !3989, file: !72, line: 5579, column: 6)
!3989 = distinct !DILexicalBlock(scope: !3958, file: !72, line: 5578, column: 2)
!3990 = !DILocation(line: 5579, column: 16, scope: !3988)
!3991 = !DILocation(line: 5579, column: 6, scope: !3989)
!3992 = !DILocation(line: 5581, column: 4, scope: !3993)
!3993 = distinct !DILexicalBlock(scope: !3988, file: !72, line: 5580, column: 3)
!3994 = !DILocation(line: 5585, column: 4, scope: !3995)
!3995 = distinct !DILexicalBlock(scope: !3988, file: !72, line: 5584, column: 3)
!3996 = !DILocation(line: 5588, column: 1, scope: !3909)
!3997 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !72, file: !72, line: 3965, type: !159, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3998 = !DILocalVariable(name: "value", arg: 1, scope: !3997, file: !72, line: 3965, type: !6)
!3999 = !DILocation(line: 3965, column: 28, scope: !3997)
!4000 = !DILocalVariable(name: "factor", arg: 2, scope: !3997, file: !72, line: 3965, type: !17)
!4001 = !DILocation(line: 3965, column: 38, scope: !3997)
!4002 = !DILocation(line: 3967, column: 38, scope: !3997)
!4003 = !DILocation(line: 3967, column: 56, scope: !3997)
!4004 = !DILocation(line: 3967, column: 50, scope: !3997)
!4005 = !DILocation(line: 3967, column: 64, scope: !3997)
!4006 = !DILocation(line: 3967, column: 44, scope: !3997)
!4007 = !DILocation(line: 3967, column: 10, scope: !3997)
!4008 = !DILocation(line: 3967, column: 3, scope: !3997)
!4009 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !72, file: !72, line: 3989, type: !159, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4010 = !DILocalVariable(name: "value", arg: 1, scope: !4009, file: !72, line: 3989, type: !6)
!4011 = !DILocation(line: 3989, column: 27, scope: !4009)
!4012 = !DILocalVariable(name: "factor", arg: 2, scope: !4009, file: !72, line: 3989, type: !17)
!4013 = !DILocation(line: 3989, column: 37, scope: !4009)
!4014 = !DILocation(line: 3991, column: 38, scope: !4009)
!4015 = !DILocation(line: 3991, column: 56, scope: !4009)
!4016 = !DILocation(line: 3991, column: 50, scope: !4009)
!4017 = !DILocation(line: 3991, column: 64, scope: !4009)
!4018 = !DILocation(line: 3991, column: 44, scope: !4009)
!4019 = !DILocation(line: 3991, column: 10, scope: !4009)
!4020 = !DILocation(line: 3991, column: 3, scope: !4009)
!4021 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !72, file: !72, line: 4014, type: !159, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4022 = !DILocalVariable(name: "value", arg: 1, scope: !4021, file: !72, line: 4014, type: !6)
!4023 = !DILocation(line: 4014, column: 26, scope: !4021)
!4024 = !DILocalVariable(name: "factor", arg: 2, scope: !4021, file: !72, line: 4014, type: !17)
!4025 = !DILocation(line: 4014, column: 36, scope: !4021)
!4026 = !DILocation(line: 4016, column: 38, scope: !4021)
!4027 = !DILocation(line: 4016, column: 56, scope: !4021)
!4028 = !DILocation(line: 4016, column: 50, scope: !4021)
!4029 = !DILocation(line: 4016, column: 64, scope: !4021)
!4030 = !DILocation(line: 4016, column: 44, scope: !4021)
!4031 = !DILocation(line: 4016, column: 10, scope: !4021)
!4032 = !DILocation(line: 4016, column: 3, scope: !4021)
!4033 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !72, file: !72, line: 4039, type: !159, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4034 = !DILocalVariable(name: "value", arg: 1, scope: !4033, file: !72, line: 4039, type: !6)
!4035 = !DILocation(line: 4039, column: 27, scope: !4033)
!4036 = !DILocalVariable(name: "factor", arg: 2, scope: !4033, file: !72, line: 4039, type: !17)
!4037 = !DILocation(line: 4039, column: 37, scope: !4033)
!4038 = !DILocation(line: 4041, column: 41, scope: !4033)
!4039 = !DILocation(line: 4041, column: 59, scope: !4033)
!4040 = !DILocation(line: 4041, column: 53, scope: !4033)
!4041 = !DILocation(line: 4041, column: 67, scope: !4033)
!4042 = !DILocation(line: 4041, column: 47, scope: !4033)
!4043 = !DILocation(line: 4041, column: 10, scope: !4033)
!4044 = !DILocation(line: 4041, column: 3, scope: !4033)
!4045 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !72, file: !72, line: 4064, type: !159, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4046 = !DILocalVariable(name: "value", arg: 1, scope: !4045, file: !72, line: 4064, type: !6)
!4047 = !DILocation(line: 4064, column: 26, scope: !4045)
!4048 = !DILocalVariable(name: "factor", arg: 2, scope: !4045, file: !72, line: 4064, type: !17)
!4049 = !DILocation(line: 4064, column: 36, scope: !4045)
!4050 = !DILocation(line: 4066, column: 41, scope: !4045)
!4051 = !DILocation(line: 4066, column: 59, scope: !4045)
!4052 = !DILocation(line: 4066, column: 53, scope: !4045)
!4053 = !DILocation(line: 4066, column: 67, scope: !4045)
!4054 = !DILocation(line: 4066, column: 47, scope: !4045)
!4055 = !DILocation(line: 4066, column: 10, scope: !4045)
!4056 = !DILocation(line: 4066, column: 3, scope: !4045)
!4057 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !72, file: !72, line: 4088, type: !159, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4058 = !DILocalVariable(name: "value", arg: 1, scope: !4057, file: !72, line: 4088, type: !6)
!4059 = !DILocation(line: 4088, column: 26, scope: !4057)
!4060 = !DILocalVariable(name: "factor", arg: 2, scope: !4057, file: !72, line: 4088, type: !17)
!4061 = !DILocation(line: 4088, column: 36, scope: !4057)
!4062 = !DILocation(line: 4090, column: 41, scope: !4057)
!4063 = !DILocation(line: 4090, column: 59, scope: !4057)
!4064 = !DILocation(line: 4090, column: 53, scope: !4057)
!4065 = !DILocation(line: 4090, column: 67, scope: !4057)
!4066 = !DILocation(line: 4090, column: 47, scope: !4057)
!4067 = !DILocation(line: 4090, column: 10, scope: !4057)
!4068 = !DILocation(line: 4090, column: 3, scope: !4057)
!4069 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !72, file: !72, line: 4112, type: !159, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4070 = !DILocalVariable(name: "value", arg: 1, scope: !4069, file: !72, line: 4112, type: !6)
!4071 = !DILocation(line: 4112, column: 25, scope: !4069)
!4072 = !DILocalVariable(name: "factor", arg: 2, scope: !4069, file: !72, line: 4112, type: !17)
!4073 = !DILocation(line: 4112, column: 35, scope: !4069)
!4074 = !DILocation(line: 4114, column: 41, scope: !4069)
!4075 = !DILocation(line: 4114, column: 59, scope: !4069)
!4076 = !DILocation(line: 4114, column: 53, scope: !4069)
!4077 = !DILocation(line: 4114, column: 67, scope: !4069)
!4078 = !DILocation(line: 4114, column: 47, scope: !4069)
!4079 = !DILocation(line: 4114, column: 10, scope: !4069)
!4080 = !DILocation(line: 4114, column: 3, scope: !4069)
!4081 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !72, file: !72, line: 4136, type: !159, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4082 = !DILocalVariable(name: "value", arg: 1, scope: !4081, file: !72, line: 4136, type: !6)
!4083 = !DILocation(line: 4136, column: 26, scope: !4081)
!4084 = !DILocalVariable(name: "factor", arg: 2, scope: !4081, file: !72, line: 4136, type: !17)
!4085 = !DILocation(line: 4136, column: 36, scope: !4081)
!4086 = !DILocation(line: 4138, column: 41, scope: !4081)
!4087 = !DILocation(line: 4138, column: 59, scope: !4081)
!4088 = !DILocation(line: 4138, column: 53, scope: !4081)
!4089 = !DILocation(line: 4138, column: 67, scope: !4081)
!4090 = !DILocation(line: 4138, column: 47, scope: !4081)
!4091 = !DILocation(line: 4138, column: 10, scope: !4081)
!4092 = !DILocation(line: 4138, column: 3, scope: !4081)
!4093 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !72, file: !72, line: 4160, type: !159, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4094 = !DILocalVariable(name: "value", arg: 1, scope: !4093, file: !72, line: 4160, type: !6)
!4095 = !DILocation(line: 4160, column: 25, scope: !4093)
!4096 = !DILocalVariable(name: "factor", arg: 2, scope: !4093, file: !72, line: 4160, type: !17)
!4097 = !DILocation(line: 4160, column: 35, scope: !4093)
!4098 = !DILocation(line: 4162, column: 41, scope: !4093)
!4099 = !DILocation(line: 4162, column: 59, scope: !4093)
!4100 = !DILocation(line: 4162, column: 53, scope: !4093)
!4101 = !DILocation(line: 4162, column: 67, scope: !4093)
!4102 = !DILocation(line: 4162, column: 47, scope: !4093)
!4103 = !DILocation(line: 4162, column: 10, scope: !4093)
!4104 = !DILocation(line: 4162, column: 3, scope: !4093)
!4105 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !72, file: !72, line: 4183, type: !929, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4106 = !DILocalVariable(name: "value", arg: 1, scope: !4105, file: !72, line: 4183, type: !22)
!4107 = !DILocation(line: 4183, column: 33, scope: !4105)
!4108 = !DILocalVariable(name: "factor", arg: 2, scope: !4105, file: !72, line: 4183, type: !22)
!4109 = !DILocation(line: 4183, column: 44, scope: !4105)
!4110 = !DILocation(line: 4185, column: 41, scope: !4105)
!4111 = !DILocation(line: 4185, column: 47, scope: !4105)
!4112 = !DILocation(line: 4185, column: 10, scope: !4105)
!4113 = !DILocation(line: 4185, column: 3, scope: !4105)
!4114 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !72, file: !72, line: 4206, type: !929, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4115 = !DILocalVariable(name: "value", arg: 1, scope: !4114, file: !72, line: 4206, type: !22)
!4116 = !DILocation(line: 4206, column: 32, scope: !4114)
!4117 = !DILocalVariable(name: "factor", arg: 2, scope: !4114, file: !72, line: 4206, type: !22)
!4118 = !DILocation(line: 4206, column: 43, scope: !4114)
!4119 = !DILocation(line: 4208, column: 41, scope: !4114)
!4120 = !DILocation(line: 4208, column: 47, scope: !4114)
!4121 = !DILocation(line: 4208, column: 10, scope: !4114)
!4122 = !DILocation(line: 4208, column: 3, scope: !4114)
!4123 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !72, file: !72, line: 4230, type: !929, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4124 = !DILocalVariable(name: "value", arg: 1, scope: !4123, file: !72, line: 4230, type: !22)
!4125 = !DILocation(line: 4230, column: 31, scope: !4123)
!4126 = !DILocalVariable(name: "factor", arg: 2, scope: !4123, file: !72, line: 4230, type: !22)
!4127 = !DILocation(line: 4230, column: 42, scope: !4123)
!4128 = !DILocation(line: 4232, column: 41, scope: !4123)
!4129 = !DILocation(line: 4232, column: 47, scope: !4123)
!4130 = !DILocation(line: 4232, column: 10, scope: !4123)
!4131 = !DILocation(line: 4232, column: 3, scope: !4123)
!4132 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !72, file: !72, line: 4254, type: !929, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4133 = !DILocalVariable(name: "value", arg: 1, scope: !4132, file: !72, line: 4254, type: !22)
!4134 = !DILocation(line: 4254, column: 34, scope: !4132)
!4135 = !DILocalVariable(name: "factor", arg: 2, scope: !4132, file: !72, line: 4254, type: !22)
!4136 = !DILocation(line: 4254, column: 45, scope: !4132)
!4137 = !DILocation(line: 4256, column: 44, scope: !4132)
!4138 = !DILocation(line: 4256, column: 50, scope: !4132)
!4139 = !DILocation(line: 4256, column: 10, scope: !4132)
!4140 = !DILocation(line: 4256, column: 3, scope: !4132)
!4141 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !72, file: !72, line: 4278, type: !929, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4142 = !DILocalVariable(name: "value", arg: 1, scope: !4141, file: !72, line: 4278, type: !22)
!4143 = !DILocation(line: 4278, column: 32, scope: !4141)
!4144 = !DILocalVariable(name: "factor", arg: 2, scope: !4141, file: !72, line: 4278, type: !22)
!4145 = !DILocation(line: 4278, column: 43, scope: !4141)
!4146 = !DILocation(line: 4280, column: 44, scope: !4141)
!4147 = !DILocation(line: 4280, column: 50, scope: !4141)
!4148 = !DILocation(line: 4280, column: 10, scope: !4141)
!4149 = !DILocation(line: 4280, column: 3, scope: !4141)
!4150 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !72, file: !72, line: 4302, type: !929, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4151 = !DILocalVariable(name: "value", arg: 1, scope: !4150, file: !72, line: 4302, type: !22)
!4152 = !DILocation(line: 4302, column: 31, scope: !4150)
!4153 = !DILocalVariable(name: "factor", arg: 2, scope: !4150, file: !72, line: 4302, type: !22)
!4154 = !DILocation(line: 4302, column: 42, scope: !4150)
!4155 = !DILocation(line: 4304, column: 44, scope: !4150)
!4156 = !DILocation(line: 4304, column: 50, scope: !4150)
!4157 = !DILocation(line: 4304, column: 10, scope: !4150)
!4158 = !DILocation(line: 4304, column: 3, scope: !4150)
!4159 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !72, file: !72, line: 4326, type: !929, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4160 = !DILocalVariable(name: "value", arg: 1, scope: !4159, file: !72, line: 4326, type: !22)
!4161 = !DILocation(line: 4326, column: 33, scope: !4159)
!4162 = !DILocalVariable(name: "factor", arg: 2, scope: !4159, file: !72, line: 4326, type: !22)
!4163 = !DILocation(line: 4326, column: 44, scope: !4159)
!4164 = !DILocation(line: 4328, column: 44, scope: !4159)
!4165 = !DILocation(line: 4328, column: 50, scope: !4159)
!4166 = !DILocation(line: 4328, column: 10, scope: !4159)
!4167 = !DILocation(line: 4328, column: 3, scope: !4159)
!4168 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !72, file: !72, line: 4350, type: !929, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4169 = !DILocalVariable(name: "value", arg: 1, scope: !4168, file: !72, line: 4350, type: !22)
!4170 = !DILocation(line: 4350, column: 32, scope: !4168)
!4171 = !DILocalVariable(name: "factor", arg: 2, scope: !4168, file: !72, line: 4350, type: !22)
!4172 = !DILocation(line: 4350, column: 43, scope: !4168)
!4173 = !DILocation(line: 4352, column: 44, scope: !4168)
!4174 = !DILocation(line: 4352, column: 50, scope: !4168)
!4175 = !DILocation(line: 4352, column: 10, scope: !4168)
!4176 = !DILocation(line: 4352, column: 3, scope: !4168)
!4177 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !72, file: !72, line: 4373, type: !929, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4178 = !DILocalVariable(name: "value", arg: 1, scope: !4177, file: !72, line: 4373, type: !22)
!4179 = !DILocation(line: 4373, column: 31, scope: !4177)
!4180 = !DILocalVariable(name: "factor", arg: 2, scope: !4177, file: !72, line: 4373, type: !22)
!4181 = !DILocation(line: 4373, column: 42, scope: !4177)
!4182 = !DILocation(line: 4375, column: 44, scope: !4177)
!4183 = !DILocation(line: 4375, column: 50, scope: !4177)
!4184 = !DILocation(line: 4375, column: 10, scope: !4177)
!4185 = !DILocation(line: 4375, column: 3, scope: !4177)
!4186 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !72, file: !72, line: 4396, type: !929, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4187 = !DILocalVariable(name: "value", arg: 1, scope: !4186, file: !72, line: 4396, type: !22)
!4188 = !DILocation(line: 4396, column: 30, scope: !4186)
!4189 = !DILocalVariable(name: "factor", arg: 2, scope: !4186, file: !72, line: 4396, type: !22)
!4190 = !DILocation(line: 4396, column: 41, scope: !4186)
!4191 = !DILocation(line: 4398, column: 44, scope: !4186)
!4192 = !DILocation(line: 4398, column: 50, scope: !4186)
!4193 = !DILocation(line: 4398, column: 10, scope: !4186)
!4194 = !DILocation(line: 4398, column: 3, scope: !4186)
!4195 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !72, file: !72, line: 4419, type: !929, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4196 = !DILocalVariable(name: "value", arg: 1, scope: !4195, file: !72, line: 4419, type: !22)
!4197 = !DILocation(line: 4419, column: 33, scope: !4195)
!4198 = !DILocalVariable(name: "factor", arg: 2, scope: !4195, file: !72, line: 4419, type: !22)
!4199 = !DILocation(line: 4419, column: 44, scope: !4195)
!4200 = !DILocation(line: 4421, column: 44, scope: !4195)
!4201 = !DILocation(line: 4421, column: 50, scope: !4195)
!4202 = !DILocation(line: 4421, column: 10, scope: !4195)
!4203 = !DILocation(line: 4421, column: 3, scope: !4195)
!4204 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !72, file: !72, line: 4442, type: !929, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4205 = !DILocalVariable(name: "value", arg: 1, scope: !4204, file: !72, line: 4442, type: !22)
!4206 = !DILocation(line: 4442, column: 32, scope: !4204)
!4207 = !DILocalVariable(name: "factor", arg: 2, scope: !4204, file: !72, line: 4442, type: !22)
!4208 = !DILocation(line: 4442, column: 43, scope: !4204)
!4209 = !DILocation(line: 4444, column: 44, scope: !4204)
!4210 = !DILocation(line: 4444, column: 50, scope: !4204)
!4211 = !DILocation(line: 4444, column: 10, scope: !4204)
!4212 = !DILocation(line: 4444, column: 3, scope: !4204)
!4213 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !72, file: !72, line: 4465, type: !929, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4214 = !DILocalVariable(name: "value", arg: 1, scope: !4213, file: !72, line: 4465, type: !22)
!4215 = !DILocation(line: 4465, column: 31, scope: !4213)
!4216 = !DILocalVariable(name: "factor", arg: 2, scope: !4213, file: !72, line: 4465, type: !22)
!4217 = !DILocation(line: 4465, column: 42, scope: !4213)
!4218 = !DILocation(line: 4467, column: 44, scope: !4213)
!4219 = !DILocation(line: 4467, column: 50, scope: !4213)
!4220 = !DILocation(line: 4467, column: 10, scope: !4213)
!4221 = !DILocation(line: 4467, column: 3, scope: !4213)
!4222 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !72, file: !72, line: 4488, type: !929, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4223 = !DILocalVariable(name: "value", arg: 1, scope: !4222, file: !72, line: 4488, type: !22)
!4224 = !DILocation(line: 4488, column: 30, scope: !4222)
!4225 = !DILocalVariable(name: "factor", arg: 2, scope: !4222, file: !72, line: 4488, type: !22)
!4226 = !DILocation(line: 4488, column: 41, scope: !4222)
!4227 = !DILocation(line: 4490, column: 44, scope: !4222)
!4228 = !DILocation(line: 4490, column: 50, scope: !4222)
!4229 = !DILocation(line: 4490, column: 10, scope: !4222)
!4230 = !DILocation(line: 4490, column: 3, scope: !4222)
!4231 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !72, file: !72, line: 4510, type: !974, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4232 = !DILocalVariable(name: "x_value", arg: 1, scope: !4231, file: !72, line: 4510, type: !22)
!4233 = !DILocation(line: 4510, column: 32, scope: !4231)
!4234 = !DILocalVariable(name: "y_value", arg: 2, scope: !4231, file: !72, line: 4510, type: !17)
!4235 = !DILocation(line: 4510, column: 44, scope: !4231)
!4236 = !DILocation(line: 4512, column: 40, scope: !4231)
!4237 = !DILocation(line: 4512, column: 60, scope: !4231)
!4238 = !DILocation(line: 4512, column: 54, scope: !4231)
!4239 = !DILocation(line: 4512, column: 69, scope: !4231)
!4240 = !DILocation(line: 4512, column: 48, scope: !4231)
!4241 = !DILocation(line: 4512, column: 10, scope: !4231)
!4242 = !DILocation(line: 4512, column: 3, scope: !4231)
!4243 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !72, file: !72, line: 4532, type: !974, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4244 = !DILocalVariable(name: "x_value", arg: 1, scope: !4243, file: !72, line: 4532, type: !22)
!4245 = !DILocation(line: 4532, column: 31, scope: !4243)
!4246 = !DILocalVariable(name: "y_value", arg: 2, scope: !4243, file: !72, line: 4532, type: !17)
!4247 = !DILocation(line: 4532, column: 43, scope: !4243)
!4248 = !DILocation(line: 4534, column: 40, scope: !4243)
!4249 = !DILocation(line: 4534, column: 60, scope: !4243)
!4250 = !DILocation(line: 4534, column: 54, scope: !4243)
!4251 = !DILocation(line: 4534, column: 69, scope: !4243)
!4252 = !DILocation(line: 4534, column: 48, scope: !4243)
!4253 = !DILocation(line: 4534, column: 10, scope: !4243)
!4254 = !DILocation(line: 4534, column: 3, scope: !4243)
!4255 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !72, file: !72, line: 4555, type: !974, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4256 = !DILocalVariable(name: "x_value", arg: 1, scope: !4255, file: !72, line: 4555, type: !22)
!4257 = !DILocation(line: 4555, column: 30, scope: !4255)
!4258 = !DILocalVariable(name: "y_value", arg: 2, scope: !4255, file: !72, line: 4555, type: !17)
!4259 = !DILocation(line: 4555, column: 42, scope: !4255)
!4260 = !DILocation(line: 4557, column: 40, scope: !4255)
!4261 = !DILocation(line: 4557, column: 60, scope: !4255)
!4262 = !DILocation(line: 4557, column: 54, scope: !4255)
!4263 = !DILocation(line: 4557, column: 69, scope: !4255)
!4264 = !DILocation(line: 4557, column: 48, scope: !4255)
!4265 = !DILocation(line: 4557, column: 10, scope: !4255)
!4266 = !DILocation(line: 4557, column: 3, scope: !4255)
!4267 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !72, file: !72, line: 4578, type: !974, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4268 = !DILocalVariable(name: "x_value", arg: 1, scope: !4267, file: !72, line: 4578, type: !22)
!4269 = !DILocation(line: 4578, column: 31, scope: !4267)
!4270 = !DILocalVariable(name: "y_value", arg: 2, scope: !4267, file: !72, line: 4578, type: !17)
!4271 = !DILocation(line: 4578, column: 43, scope: !4267)
!4272 = !DILocation(line: 4580, column: 44, scope: !4267)
!4273 = !DILocation(line: 4580, column: 64, scope: !4267)
!4274 = !DILocation(line: 4580, column: 58, scope: !4267)
!4275 = !DILocation(line: 4580, column: 73, scope: !4267)
!4276 = !DILocation(line: 4580, column: 52, scope: !4267)
!4277 = !DILocation(line: 4580, column: 10, scope: !4267)
!4278 = !DILocation(line: 4580, column: 3, scope: !4267)
!4279 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !72, file: !72, line: 4601, type: !974, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4280 = !DILocalVariable(name: "x_value", arg: 1, scope: !4279, file: !72, line: 4601, type: !22)
!4281 = !DILocation(line: 4601, column: 30, scope: !4279)
!4282 = !DILocalVariable(name: "y_value", arg: 2, scope: !4279, file: !72, line: 4601, type: !17)
!4283 = !DILocation(line: 4601, column: 42, scope: !4279)
!4284 = !DILocation(line: 4603, column: 44, scope: !4279)
!4285 = !DILocation(line: 4603, column: 64, scope: !4279)
!4286 = !DILocation(line: 4603, column: 58, scope: !4279)
!4287 = !DILocation(line: 4603, column: 73, scope: !4279)
!4288 = !DILocation(line: 4603, column: 52, scope: !4279)
!4289 = !DILocation(line: 4603, column: 10, scope: !4279)
!4290 = !DILocation(line: 4603, column: 3, scope: !4279)
!4291 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !72, file: !72, line: 4623, type: !974, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4292 = !DILocalVariable(name: "x_value", arg: 1, scope: !4291, file: !72, line: 4623, type: !22)
!4293 = !DILocation(line: 4623, column: 30, scope: !4291)
!4294 = !DILocalVariable(name: "y_value", arg: 2, scope: !4291, file: !72, line: 4623, type: !17)
!4295 = !DILocation(line: 4623, column: 42, scope: !4291)
!4296 = !DILocation(line: 4625, column: 44, scope: !4291)
!4297 = !DILocation(line: 4625, column: 64, scope: !4291)
!4298 = !DILocation(line: 4625, column: 58, scope: !4291)
!4299 = !DILocation(line: 4625, column: 73, scope: !4291)
!4300 = !DILocation(line: 4625, column: 52, scope: !4291)
!4301 = !DILocation(line: 4625, column: 10, scope: !4291)
!4302 = !DILocation(line: 4625, column: 3, scope: !4291)
!4303 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !72, file: !72, line: 4645, type: !974, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4304 = !DILocalVariable(name: "x_value", arg: 1, scope: !4303, file: !72, line: 4645, type: !22)
!4305 = !DILocation(line: 4645, column: 29, scope: !4303)
!4306 = !DILocalVariable(name: "y_value", arg: 2, scope: !4303, file: !72, line: 4645, type: !17)
!4307 = !DILocation(line: 4645, column: 41, scope: !4303)
!4308 = !DILocation(line: 4647, column: 44, scope: !4303)
!4309 = !DILocation(line: 4647, column: 64, scope: !4303)
!4310 = !DILocation(line: 4647, column: 58, scope: !4303)
!4311 = !DILocation(line: 4647, column: 73, scope: !4303)
!4312 = !DILocation(line: 4647, column: 52, scope: !4303)
!4313 = !DILocation(line: 4647, column: 10, scope: !4303)
!4314 = !DILocation(line: 4647, column: 3, scope: !4303)
!4315 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !72, file: !72, line: 4667, type: !974, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4316 = !DILocalVariable(name: "x_value", arg: 1, scope: !4315, file: !72, line: 4667, type: !22)
!4317 = !DILocation(line: 4667, column: 30, scope: !4315)
!4318 = !DILocalVariable(name: "y_value", arg: 2, scope: !4315, file: !72, line: 4667, type: !17)
!4319 = !DILocation(line: 4667, column: 42, scope: !4315)
!4320 = !DILocation(line: 4669, column: 44, scope: !4315)
!4321 = !DILocation(line: 4669, column: 64, scope: !4315)
!4322 = !DILocation(line: 4669, column: 58, scope: !4315)
!4323 = !DILocation(line: 4669, column: 73, scope: !4315)
!4324 = !DILocation(line: 4669, column: 52, scope: !4315)
!4325 = !DILocation(line: 4669, column: 10, scope: !4315)
!4326 = !DILocation(line: 4669, column: 3, scope: !4315)
!4327 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !72, file: !72, line: 4689, type: !974, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4328 = !DILocalVariable(name: "x_value", arg: 1, scope: !4327, file: !72, line: 4689, type: !22)
!4329 = !DILocation(line: 4689, column: 29, scope: !4327)
!4330 = !DILocalVariable(name: "y_value", arg: 2, scope: !4327, file: !72, line: 4689, type: !17)
!4331 = !DILocation(line: 4689, column: 41, scope: !4327)
!4332 = !DILocation(line: 4691, column: 44, scope: !4327)
!4333 = !DILocation(line: 4691, column: 64, scope: !4327)
!4334 = !DILocation(line: 4691, column: 58, scope: !4327)
!4335 = !DILocation(line: 4691, column: 73, scope: !4327)
!4336 = !DILocation(line: 4691, column: 52, scope: !4327)
!4337 = !DILocation(line: 4691, column: 10, scope: !4327)
!4338 = !DILocation(line: 4691, column: 3, scope: !4327)
!4339 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !72, file: !72, line: 4713, type: !1503, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4340 = !DILocalVariable(name: "value", arg: 1, scope: !4339, file: !72, line: 4713, type: !736)
!4341 = !DILocation(line: 4713, column: 31, scope: !4339)
!4342 = !DILocalVariable(name: "factor", arg: 2, scope: !4339, file: !72, line: 4713, type: !13)
!4343 = !DILocation(line: 4713, column: 42, scope: !4339)
!4344 = !DILocation(line: 4715, column: 41, scope: !4339)
!4345 = !DILocation(line: 4715, column: 47, scope: !4339)
!4346 = !DILocation(line: 4715, column: 10, scope: !4339)
!4347 = !DILocation(line: 4715, column: 3, scope: !4339)
!4348 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !72, file: !72, line: 5293, type: !4349, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4349 = !DISubroutineType(types: !4350)
!4350 = !{!736, !736, !13, !736}
!4351 = !DILocalVariable(name: "value", arg: 1, scope: !4348, file: !72, line: 5293, type: !736)
!4352 = !DILocation(line: 5293, column: 40, scope: !4348)
!4353 = !DILocalVariable(name: "factor", arg: 2, scope: !4348, file: !72, line: 5293, type: !13)
!4354 = !DILocation(line: 5293, column: 50, scope: !4348)
!4355 = !DILocalVariable(name: "count", arg: 3, scope: !4348, file: !72, line: 5293, type: !736)
!4356 = !DILocation(line: 5293, column: 62, scope: !4348)
!4357 = !DILocalVariable(name: "u32Temp1", scope: !4348, file: !72, line: 5295, type: !736)
!4358 = !DILocation(line: 5295, column: 6, scope: !4348)
!4359 = !DILocalVariable(name: "u32Temp2", scope: !4348, file: !72, line: 5295, type: !736)
!4360 = !DILocation(line: 5295, column: 17, scope: !4348)
!4361 = !DILocalVariable(name: "u32Temp3", scope: !4348, file: !72, line: 5295, type: !736)
!4362 = !DILocation(line: 5295, column: 26, scope: !4348)
!4363 = !DILocalVariable(name: "u8SignBit", scope: !4348, file: !72, line: 5296, type: !17)
!4364 = !DILocation(line: 5296, column: 5, scope: !4348)
!4365 = !DILocation(line: 5298, column: 5, scope: !4366)
!4366 = distinct !DILexicalBlock(scope: !4348, file: !72, line: 5298, column: 5)
!4367 = !DILocation(line: 5298, column: 11, scope: !4366)
!4368 = !DILocation(line: 5298, column: 5, scope: !4348)
!4369 = !DILocation(line: 5300, column: 13, scope: !4370)
!4370 = distinct !DILexicalBlock(scope: !4366, file: !72, line: 5299, column: 2)
!4371 = !DILocation(line: 5301, column: 2, scope: !4370)
!4372 = !DILocation(line: 5304, column: 13, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4366, file: !72, line: 5303, column: 2)
!4374 = !DILocation(line: 5308, column: 5, scope: !4375)
!4375 = distinct !DILexicalBlock(scope: !4348, file: !72, line: 5308, column: 5)
!4376 = !DILocation(line: 5308, column: 11, scope: !4375)
!4377 = !DILocation(line: 5308, column: 5, scope: !4348)
!4378 = !DILocation(line: 5310, column: 15, scope: !4379)
!4379 = distinct !DILexicalBlock(scope: !4375, file: !72, line: 5309, column: 2)
!4380 = !DILocation(line: 5310, column: 14, scope: !4379)
!4381 = !DILocation(line: 5310, column: 12, scope: !4379)
!4382 = !DILocation(line: 5311, column: 2, scope: !4379)
!4383 = !DILocation(line: 5314, column: 14, scope: !4384)
!4384 = distinct !DILexicalBlock(scope: !4375, file: !72, line: 5313, column: 2)
!4385 = !DILocation(line: 5314, column: 12, scope: !4384)
!4386 = !DILocation(line: 5317, column: 13, scope: !4348)
!4387 = !DILocation(line: 5317, column: 21, scope: !4348)
!4388 = !DILocation(line: 5317, column: 19, scope: !4348)
!4389 = !DILocation(line: 5317, column: 11, scope: !4348)
!4390 = !DILocation(line: 5318, column: 25, scope: !4348)
!4391 = !DILocation(line: 5318, column: 32, scope: !4348)
!4392 = !DILocation(line: 5318, column: 13, scope: !4348)
!4393 = !DILocation(line: 5318, column: 11, scope: !4348)
!4394 = !DILocation(line: 5319, column: 13, scope: !4348)
!4395 = !DILocation(line: 5319, column: 25, scope: !4348)
!4396 = !DILocation(line: 5319, column: 22, scope: !4348)
!4397 = !DILocation(line: 5319, column: 11, scope: !4348)
!4398 = !DILocation(line: 5320, column: 14, scope: !4348)
!4399 = !DILocation(line: 5320, column: 30, scope: !4348)
!4400 = !DILocation(line: 5320, column: 29, scope: !4348)
!4401 = !DILocation(line: 5320, column: 23, scope: !4348)
!4402 = !DILocation(line: 5320, column: 11, scope: !4348)
!4403 = !DILocation(line: 5321, column: 6, scope: !4404)
!4404 = distinct !DILexicalBlock(scope: !4348, file: !72, line: 5321, column: 5)
!4405 = !DILocation(line: 5321, column: 16, scope: !4404)
!4406 = !DILocation(line: 5321, column: 14, scope: !4404)
!4407 = !DILocation(line: 5321, column: 22, scope: !4404)
!4408 = !DILocation(line: 5321, column: 5, scope: !4348)
!4409 = !DILocation(line: 5323, column: 6, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4411, file: !72, line: 5323, column: 6)
!4411 = distinct !DILexicalBlock(scope: !4404, file: !72, line: 5322, column: 2)
!4412 = !DILocation(line: 5323, column: 16, scope: !4410)
!4413 = !DILocation(line: 5323, column: 6, scope: !4411)
!4414 = !DILocation(line: 5325, column: 7, scope: !4415)
!4415 = distinct !DILexicalBlock(scope: !4416, file: !72, line: 5325, column: 7)
!4416 = distinct !DILexicalBlock(scope: !4410, file: !72, line: 5324, column: 3)
!4417 = !DILocation(line: 5325, column: 15, scope: !4415)
!4418 = !DILocation(line: 5325, column: 7, scope: !4416)
!4419 = !DILocation(line: 5326, column: 12, scope: !4415)
!4420 = !DILocation(line: 5326, column: 5, scope: !4415)
!4421 = !DILocation(line: 5328, column: 5, scope: !4415)
!4422 = !DILocation(line: 5332, column: 4, scope: !4423)
!4423 = distinct !DILexicalBlock(scope: !4410, file: !72, line: 5331, column: 3)
!4424 = !DILocation(line: 5337, column: 3, scope: !4425)
!4425 = distinct !DILexicalBlock(scope: !4404, file: !72, line: 5336, column: 2)
!4426 = !DILocation(line: 5339, column: 1, scope: !4348)
!4427 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !72, file: !72, line: 4737, type: !1321, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4428 = !DILocalVariable(name: "value", arg: 1, scope: !4427, file: !72, line: 4737, type: !736)
!4429 = !DILocation(line: 4737, column: 31, scope: !4427)
!4430 = !DILocalVariable(name: "factor", arg: 2, scope: !4427, file: !72, line: 4737, type: !80)
!4431 = !DILocation(line: 4737, column: 42, scope: !4427)
!4432 = !DILocation(line: 4739, column: 41, scope: !4427)
!4433 = !DILocation(line: 4739, column: 47, scope: !4427)
!4434 = !DILocation(line: 4739, column: 10, scope: !4427)
!4435 = !DILocation(line: 4739, column: 3, scope: !4427)
!4436 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !72, file: !72, line: 5357, type: !4437, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4437 = !DISubroutineType(types: !4438)
!4438 = !{!736, !736, !80, !736}
!4439 = !DILocalVariable(name: "value", arg: 1, scope: !4436, file: !72, line: 5357, type: !736)
!4440 = !DILocation(line: 5357, column: 40, scope: !4436)
!4441 = !DILocalVariable(name: "factor", arg: 2, scope: !4436, file: !72, line: 5357, type: !80)
!4442 = !DILocation(line: 5357, column: 51, scope: !4436)
!4443 = !DILocalVariable(name: "count", arg: 3, scope: !4436, file: !72, line: 5357, type: !736)
!4444 = !DILocation(line: 5357, column: 63, scope: !4436)
!4445 = !DILocalVariable(name: "u32Temp1", scope: !4436, file: !72, line: 5359, type: !736)
!4446 = !DILocation(line: 5359, column: 6, scope: !4436)
!4447 = !DILocalVariable(name: "u32Temp2", scope: !4436, file: !72, line: 5359, type: !736)
!4448 = !DILocation(line: 5359, column: 17, scope: !4436)
!4449 = !DILocalVariable(name: "u8SignBit", scope: !4436, file: !72, line: 5360, type: !17)
!4450 = !DILocation(line: 5360, column: 5, scope: !4436)
!4451 = !DILocation(line: 5362, column: 5, scope: !4452)
!4452 = distinct !DILexicalBlock(scope: !4436, file: !72, line: 5362, column: 5)
!4453 = !DILocation(line: 5362, column: 11, scope: !4452)
!4454 = !DILocation(line: 5362, column: 5, scope: !4436)
!4455 = !DILocation(line: 5364, column: 13, scope: !4456)
!4456 = distinct !DILexicalBlock(scope: !4452, file: !72, line: 5363, column: 2)
!4457 = !DILocation(line: 5365, column: 2, scope: !4456)
!4458 = !DILocation(line: 5368, column: 13, scope: !4459)
!4459 = distinct !DILexicalBlock(scope: !4452, file: !72, line: 5367, column: 2)
!4460 = !DILocation(line: 5372, column: 5, scope: !4461)
!4461 = distinct !DILexicalBlock(scope: !4436, file: !72, line: 5372, column: 5)
!4462 = !DILocation(line: 5372, column: 11, scope: !4461)
!4463 = !DILocation(line: 5372, column: 5, scope: !4436)
!4464 = !DILocation(line: 5374, column: 15, scope: !4465)
!4465 = distinct !DILexicalBlock(scope: !4461, file: !72, line: 5373, column: 2)
!4466 = !DILocation(line: 5374, column: 14, scope: !4465)
!4467 = !DILocation(line: 5374, column: 12, scope: !4465)
!4468 = !DILocation(line: 5375, column: 2, scope: !4465)
!4469 = !DILocation(line: 5378, column: 14, scope: !4470)
!4470 = distinct !DILexicalBlock(scope: !4461, file: !72, line: 5377, column: 2)
!4471 = !DILocation(line: 5378, column: 12, scope: !4470)
!4472 = !DILocation(line: 5381, column: 25, scope: !4436)
!4473 = !DILocation(line: 5381, column: 32, scope: !4436)
!4474 = !DILocation(line: 5381, column: 13, scope: !4436)
!4475 = !DILocation(line: 5381, column: 11, scope: !4436)
!4476 = !DILocation(line: 5382, column: 13, scope: !4436)
!4477 = !DILocation(line: 5382, column: 26, scope: !4436)
!4478 = !DILocation(line: 5382, column: 31, scope: !4436)
!4479 = !DILocation(line: 5382, column: 22, scope: !4436)
!4480 = !DILocation(line: 5382, column: 11, scope: !4436)
!4481 = !DILocation(line: 5383, column: 5, scope: !4482)
!4482 = distinct !DILexicalBlock(scope: !4436, file: !72, line: 5383, column: 5)
!4483 = !DILocation(line: 5383, column: 15, scope: !4482)
!4484 = !DILocation(line: 5383, column: 5, scope: !4436)
!4485 = !DILocation(line: 5385, column: 10, scope: !4486)
!4486 = distinct !DILexicalBlock(scope: !4482, file: !72, line: 5384, column: 2)
!4487 = !DILocation(line: 5385, column: 3, scope: !4486)
!4488 = !DILocation(line: 5389, column: 3, scope: !4489)
!4489 = distinct !DILexicalBlock(scope: !4482, file: !72, line: 5388, column: 2)
!4490 = !DILocation(line: 5391, column: 1, scope: !4436)
!4491 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !72, file: !72, line: 4761, type: !3111, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4492 = !DILocalVariable(name: "value", arg: 1, scope: !4491, file: !72, line: 4761, type: !736)
!4493 = !DILocation(line: 4761, column: 30, scope: !4491)
!4494 = !DILocalVariable(name: "factor", arg: 2, scope: !4491, file: !72, line: 4761, type: !6)
!4495 = !DILocation(line: 4761, column: 40, scope: !4491)
!4496 = !DILocation(line: 4763, column: 40, scope: !4491)
!4497 = !DILocation(line: 4763, column: 46, scope: !4491)
!4498 = !DILocation(line: 4763, column: 10, scope: !4491)
!4499 = !DILocation(line: 4763, column: 3, scope: !4491)
!4500 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !72, file: !72, line: 5435, type: !4501, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4501 = !DISubroutineType(types: !4502)
!4502 = !{!736, !736, !6, !736}
!4503 = !DILocalVariable(name: "value", arg: 1, scope: !4500, file: !72, line: 5435, type: !736)
!4504 = !DILocation(line: 5435, column: 39, scope: !4500)
!4505 = !DILocalVariable(name: "factor", arg: 2, scope: !4500, file: !72, line: 5435, type: !6)
!4506 = !DILocation(line: 5435, column: 49, scope: !4500)
!4507 = !DILocalVariable(name: "count", arg: 3, scope: !4500, file: !72, line: 5435, type: !736)
!4508 = !DILocation(line: 5435, column: 61, scope: !4500)
!4509 = !DILocalVariable(name: "u32Temp1", scope: !4500, file: !72, line: 5437, type: !736)
!4510 = !DILocation(line: 5437, column: 6, scope: !4500)
!4511 = !DILocalVariable(name: "u32Temp2", scope: !4500, file: !72, line: 5437, type: !736)
!4512 = !DILocation(line: 5437, column: 17, scope: !4500)
!4513 = !DILocalVariable(name: "u32Temp3", scope: !4500, file: !72, line: 5437, type: !736)
!4514 = !DILocation(line: 5437, column: 26, scope: !4500)
!4515 = !DILocalVariable(name: "u8SignBit", scope: !4500, file: !72, line: 5438, type: !17)
!4516 = !DILocation(line: 5438, column: 5, scope: !4500)
!4517 = !DILocation(line: 5440, column: 5, scope: !4518)
!4518 = distinct !DILexicalBlock(scope: !4500, file: !72, line: 5440, column: 5)
!4519 = !DILocation(line: 5440, column: 11, scope: !4518)
!4520 = !DILocation(line: 5440, column: 5, scope: !4500)
!4521 = !DILocation(line: 5442, column: 13, scope: !4522)
!4522 = distinct !DILexicalBlock(scope: !4518, file: !72, line: 5441, column: 2)
!4523 = !DILocation(line: 5443, column: 2, scope: !4522)
!4524 = !DILocation(line: 5446, column: 13, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4518, file: !72, line: 5445, column: 2)
!4526 = !DILocation(line: 5450, column: 5, scope: !4527)
!4527 = distinct !DILexicalBlock(scope: !4500, file: !72, line: 5450, column: 5)
!4528 = !DILocation(line: 5450, column: 11, scope: !4527)
!4529 = !DILocation(line: 5450, column: 5, scope: !4500)
!4530 = !DILocation(line: 5452, column: 15, scope: !4531)
!4531 = distinct !DILexicalBlock(scope: !4527, file: !72, line: 5451, column: 2)
!4532 = !DILocation(line: 5452, column: 14, scope: !4531)
!4533 = !DILocation(line: 5452, column: 12, scope: !4531)
!4534 = !DILocation(line: 5453, column: 2, scope: !4531)
!4535 = !DILocation(line: 5456, column: 14, scope: !4536)
!4536 = distinct !DILexicalBlock(scope: !4527, file: !72, line: 5455, column: 2)
!4537 = !DILocation(line: 5456, column: 12, scope: !4536)
!4538 = !DILocation(line: 5459, column: 13, scope: !4500)
!4539 = !DILocation(line: 5459, column: 21, scope: !4500)
!4540 = !DILocation(line: 5459, column: 19, scope: !4500)
!4541 = !DILocation(line: 5459, column: 11, scope: !4500)
!4542 = !DILocation(line: 5460, column: 25, scope: !4500)
!4543 = !DILocation(line: 5460, column: 32, scope: !4500)
!4544 = !DILocation(line: 5460, column: 13, scope: !4500)
!4545 = !DILocation(line: 5460, column: 11, scope: !4500)
!4546 = !DILocation(line: 5461, column: 13, scope: !4500)
!4547 = !DILocation(line: 5461, column: 25, scope: !4500)
!4548 = !DILocation(line: 5461, column: 22, scope: !4500)
!4549 = !DILocation(line: 5461, column: 11, scope: !4500)
!4550 = !DILocation(line: 5462, column: 14, scope: !4500)
!4551 = !DILocation(line: 5462, column: 30, scope: !4500)
!4552 = !DILocation(line: 5462, column: 29, scope: !4500)
!4553 = !DILocation(line: 5462, column: 23, scope: !4500)
!4554 = !DILocation(line: 5462, column: 11, scope: !4500)
!4555 = !DILocation(line: 5463, column: 6, scope: !4556)
!4556 = distinct !DILexicalBlock(scope: !4500, file: !72, line: 5463, column: 5)
!4557 = !DILocation(line: 5463, column: 16, scope: !4556)
!4558 = !DILocation(line: 5463, column: 14, scope: !4556)
!4559 = !DILocation(line: 5463, column: 22, scope: !4556)
!4560 = !DILocation(line: 5463, column: 5, scope: !4500)
!4561 = !DILocation(line: 5465, column: 6, scope: !4562)
!4562 = distinct !DILexicalBlock(scope: !4563, file: !72, line: 5465, column: 6)
!4563 = distinct !DILexicalBlock(scope: !4556, file: !72, line: 5464, column: 2)
!4564 = !DILocation(line: 5465, column: 16, scope: !4562)
!4565 = !DILocation(line: 5465, column: 6, scope: !4563)
!4566 = !DILocation(line: 5467, column: 7, scope: !4567)
!4567 = distinct !DILexicalBlock(scope: !4568, file: !72, line: 5467, column: 7)
!4568 = distinct !DILexicalBlock(scope: !4562, file: !72, line: 5466, column: 3)
!4569 = !DILocation(line: 5467, column: 15, scope: !4567)
!4570 = !DILocation(line: 5467, column: 7, scope: !4568)
!4571 = !DILocation(line: 5468, column: 12, scope: !4567)
!4572 = !DILocation(line: 5468, column: 5, scope: !4567)
!4573 = !DILocation(line: 5470, column: 5, scope: !4567)
!4574 = !DILocation(line: 5474, column: 4, scope: !4575)
!4575 = distinct !DILexicalBlock(scope: !4562, file: !72, line: 5473, column: 3)
!4576 = !DILocation(line: 5479, column: 3, scope: !4577)
!4577 = distinct !DILexicalBlock(scope: !4556, file: !72, line: 5478, column: 2)
!4578 = !DILocation(line: 5481, column: 1, scope: !4500)
!4579 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !72, file: !72, line: 4785, type: !1117, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4580 = !DILocalVariable(name: "value", arg: 1, scope: !4579, file: !72, line: 4785, type: !736)
!4581 = !DILocation(line: 4785, column: 31, scope: !4579)
!4582 = !DILocalVariable(name: "factor", arg: 2, scope: !4579, file: !72, line: 4785, type: !22)
!4583 = !DILocation(line: 4785, column: 42, scope: !4579)
!4584 = !DILocation(line: 4787, column: 41, scope: !4579)
!4585 = !DILocation(line: 4787, column: 47, scope: !4579)
!4586 = !DILocation(line: 4787, column: 10, scope: !4579)
!4587 = !DILocation(line: 4787, column: 3, scope: !4579)
!4588 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !72, file: !72, line: 4809, type: !1412, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4589 = !DILocalVariable(name: "value", arg: 1, scope: !4588, file: !72, line: 4809, type: !736)
!4590 = !DILocation(line: 4809, column: 31, scope: !4588)
!4591 = !DILocalVariable(name: "factor", arg: 2, scope: !4588, file: !72, line: 4809, type: !736)
!4592 = !DILocation(line: 4809, column: 42, scope: !4588)
!4593 = !DILocation(line: 4811, column: 41, scope: !4588)
!4594 = !DILocation(line: 4811, column: 47, scope: !4588)
!4595 = !DILocation(line: 4811, column: 10, scope: !4588)
!4596 = !DILocation(line: 4811, column: 3, scope: !4588)
!4597 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !72, file: !72, line: 5408, type: !4598, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4598 = !DISubroutineType(types: !4599)
!4599 = !{!736, !736, !736, !736}
!4600 = !DILocalVariable(name: "value", arg: 1, scope: !4597, file: !72, line: 5408, type: !736)
!4601 = !DILocation(line: 5408, column: 40, scope: !4597)
!4602 = !DILocalVariable(name: "factor", arg: 2, scope: !4597, file: !72, line: 5408, type: !736)
!4603 = !DILocation(line: 5408, column: 50, scope: !4597)
!4604 = !DILocalVariable(name: "count", arg: 3, scope: !4597, file: !72, line: 5408, type: !736)
!4605 = !DILocation(line: 5408, column: 62, scope: !4597)
!4606 = !DILocalVariable(name: "u32Temp1", scope: !4597, file: !72, line: 5410, type: !736)
!4607 = !DILocation(line: 5410, column: 6, scope: !4597)
!4608 = !DILocalVariable(name: "u32Temp2", scope: !4597, file: !72, line: 5410, type: !736)
!4609 = !DILocation(line: 5410, column: 17, scope: !4597)
!4610 = !DILocalVariable(name: "u32Temp3", scope: !4597, file: !72, line: 5410, type: !736)
!4611 = !DILocation(line: 5410, column: 26, scope: !4597)
!4612 = !DILocalVariable(name: "u32Temp4", scope: !4597, file: !72, line: 5410, type: !736)
!4613 = !DILocation(line: 5410, column: 35, scope: !4597)
!4614 = !DILocalVariable(name: "u8SignBit", scope: !4597, file: !72, line: 5411, type: !17)
!4615 = !DILocation(line: 5411, column: 5, scope: !4597)
!4616 = !DILocation(line: 5413, column: 25, scope: !4597)
!4617 = !DILocation(line: 5413, column: 32, scope: !4597)
!4618 = !DILocation(line: 5413, column: 13, scope: !4597)
!4619 = !DILocation(line: 5413, column: 11, scope: !4597)
!4620 = !DILocation(line: 5414, column: 13, scope: !4597)
!4621 = !DILocation(line: 5414, column: 26, scope: !4597)
!4622 = !DILocation(line: 5414, column: 31, scope: !4597)
!4623 = !DILocation(line: 5414, column: 22, scope: !4597)
!4624 = !DILocation(line: 5414, column: 11, scope: !4597)
!4625 = !DILocation(line: 5415, column: 9, scope: !4597)
!4626 = !DILocation(line: 5415, column: 2, scope: !4597)
!4627 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !72, file: !72, line: 4833, type: !3050, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4628 = !DILocalVariable(name: "value", arg: 1, scope: !4627, file: !72, line: 4833, type: !736)
!4629 = !DILocation(line: 4833, column: 30, scope: !4627)
!4630 = !DILocalVariable(name: "factor", arg: 2, scope: !4627, file: !72, line: 4833, type: !17)
!4631 = !DILocation(line: 4833, column: 40, scope: !4627)
!4632 = !DILocation(line: 4835, column: 40, scope: !4627)
!4633 = !DILocation(line: 4835, column: 46, scope: !4627)
!4634 = !DILocation(line: 4835, column: 10, scope: !4627)
!4635 = !DILocation(line: 4835, column: 3, scope: !4627)
!4636 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !72, file: !72, line: 5499, type: !4637, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4637 = !DISubroutineType(types: !4638)
!4638 = !{!736, !736, !17, !736}
!4639 = !DILocalVariable(name: "value", arg: 1, scope: !4636, file: !72, line: 5499, type: !736)
!4640 = !DILocation(line: 5499, column: 39, scope: !4636)
!4641 = !DILocalVariable(name: "factor", arg: 2, scope: !4636, file: !72, line: 5499, type: !17)
!4642 = !DILocation(line: 5499, column: 49, scope: !4636)
!4643 = !DILocalVariable(name: "count", arg: 3, scope: !4636, file: !72, line: 5499, type: !736)
!4644 = !DILocation(line: 5499, column: 61, scope: !4636)
!4645 = !DILocalVariable(name: "u32Temp1", scope: !4636, file: !72, line: 5501, type: !736)
!4646 = !DILocation(line: 5501, column: 6, scope: !4636)
!4647 = !DILocalVariable(name: "u32Temp2", scope: !4636, file: !72, line: 5501, type: !736)
!4648 = !DILocation(line: 5501, column: 17, scope: !4636)
!4649 = !DILocation(line: 5503, column: 13, scope: !4636)
!4650 = !DILocation(line: 5503, column: 21, scope: !4636)
!4651 = !DILocation(line: 5503, column: 19, scope: !4636)
!4652 = !DILocation(line: 5503, column: 11, scope: !4636)
!4653 = !DILocation(line: 5504, column: 25, scope: !4636)
!4654 = !DILocation(line: 5504, column: 32, scope: !4636)
!4655 = !DILocation(line: 5504, column: 13, scope: !4636)
!4656 = !DILocation(line: 5504, column: 11, scope: !4636)
!4657 = !DILocation(line: 5505, column: 13, scope: !4636)
!4658 = !DILocation(line: 5505, column: 25, scope: !4636)
!4659 = !DILocation(line: 5505, column: 22, scope: !4636)
!4660 = !DILocation(line: 5505, column: 11, scope: !4636)
!4661 = !DILocation(line: 5506, column: 14, scope: !4636)
!4662 = !DILocation(line: 5506, column: 30, scope: !4636)
!4663 = !DILocation(line: 5506, column: 29, scope: !4636)
!4664 = !DILocation(line: 5506, column: 23, scope: !4636)
!4665 = !DILocation(line: 5506, column: 11, scope: !4636)
!4666 = !DILocation(line: 5507, column: 6, scope: !4667)
!4667 = distinct !DILexicalBlock(scope: !4636, file: !72, line: 5507, column: 5)
!4668 = !DILocation(line: 5507, column: 16, scope: !4667)
!4669 = !DILocation(line: 5507, column: 14, scope: !4667)
!4670 = !DILocation(line: 5507, column: 22, scope: !4667)
!4671 = !DILocation(line: 5507, column: 5, scope: !4636)
!4672 = !DILocation(line: 5509, column: 6, scope: !4673)
!4673 = distinct !DILexicalBlock(scope: !4674, file: !72, line: 5509, column: 6)
!4674 = distinct !DILexicalBlock(scope: !4667, file: !72, line: 5508, column: 2)
!4675 = !DILocation(line: 5509, column: 14, scope: !4673)
!4676 = !DILocation(line: 5509, column: 6, scope: !4674)
!4677 = !DILocation(line: 5510, column: 11, scope: !4673)
!4678 = !DILocation(line: 5510, column: 4, scope: !4673)
!4679 = !DILocation(line: 5512, column: 4, scope: !4673)
!4680 = !DILocation(line: 5516, column: 3, scope: !4681)
!4681 = distinct !DILexicalBlock(scope: !4667, file: !72, line: 5515, column: 2)
!4682 = !DILocation(line: 5518, column: 1, scope: !4636)
!4683 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !72, file: !72, line: 4856, type: !885, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4684 = !DILocalVariable(name: "value", arg: 1, scope: !4683, file: !72, line: 4856, type: !17)
!4685 = !DILocation(line: 4856, column: 28, scope: !4683)
!4686 = !DILocalVariable(name: "factor", arg: 2, scope: !4683, file: !72, line: 4856, type: !17)
!4687 = !DILocation(line: 4856, column: 38, scope: !4683)
!4688 = !DILocation(line: 4858, column: 38, scope: !4683)
!4689 = !DILocation(line: 4858, column: 44, scope: !4683)
!4690 = !DILocation(line: 4858, column: 10, scope: !4683)
!4691 = !DILocation(line: 4858, column: 3, scope: !4683)
!4692 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !72, file: !72, line: 4879, type: !885, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4693 = !DILocalVariable(name: "value", arg: 1, scope: !4692, file: !72, line: 4879, type: !17)
!4694 = !DILocation(line: 4879, column: 28, scope: !4692)
!4695 = !DILocalVariable(name: "factor", arg: 2, scope: !4692, file: !72, line: 4879, type: !17)
!4696 = !DILocation(line: 4879, column: 38, scope: !4692)
!4697 = !DILocation(line: 4881, column: 38, scope: !4692)
!4698 = !DILocation(line: 4881, column: 44, scope: !4692)
!4699 = !DILocation(line: 4881, column: 10, scope: !4692)
!4700 = !DILocation(line: 4881, column: 3, scope: !4692)
!4701 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !72, file: !72, line: 4903, type: !885, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4702 = !DILocalVariable(name: "value", arg: 1, scope: !4701, file: !72, line: 4903, type: !17)
!4703 = !DILocation(line: 4903, column: 26, scope: !4701)
!4704 = !DILocalVariable(name: "factor", arg: 2, scope: !4701, file: !72, line: 4903, type: !17)
!4705 = !DILocation(line: 4903, column: 36, scope: !4701)
!4706 = !DILocation(line: 4905, column: 38, scope: !4701)
!4707 = !DILocation(line: 4905, column: 44, scope: !4701)
!4708 = !DILocation(line: 4905, column: 10, scope: !4701)
!4709 = !DILocation(line: 4905, column: 3, scope: !4701)
!4710 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !72, file: !72, line: 4927, type: !885, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4711 = !DILocalVariable(name: "value", arg: 1, scope: !4710, file: !72, line: 4927, type: !17)
!4712 = !DILocation(line: 4927, column: 28, scope: !4710)
!4713 = !DILocalVariable(name: "factor", arg: 2, scope: !4710, file: !72, line: 4927, type: !17)
!4714 = !DILocation(line: 4927, column: 38, scope: !4710)
!4715 = !DILocation(line: 4929, column: 41, scope: !4710)
!4716 = !DILocation(line: 4929, column: 47, scope: !4710)
!4717 = !DILocation(line: 4929, column: 10, scope: !4710)
!4718 = !DILocation(line: 4929, column: 3, scope: !4710)
!4719 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !72, file: !72, line: 4951, type: !885, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4720 = !DILocalVariable(name: "value", arg: 1, scope: !4719, file: !72, line: 4951, type: !17)
!4721 = !DILocation(line: 4951, column: 26, scope: !4719)
!4722 = !DILocalVariable(name: "factor", arg: 2, scope: !4719, file: !72, line: 4951, type: !17)
!4723 = !DILocation(line: 4951, column: 36, scope: !4719)
!4724 = !DILocation(line: 4953, column: 41, scope: !4719)
!4725 = !DILocation(line: 4953, column: 47, scope: !4719)
!4726 = !DILocation(line: 4953, column: 10, scope: !4719)
!4727 = !DILocation(line: 4953, column: 3, scope: !4719)
!4728 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !72, file: !72, line: 4974, type: !885, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4729 = !DILocalVariable(name: "value", arg: 1, scope: !4728, file: !72, line: 4974, type: !17)
!4730 = !DILocation(line: 4974, column: 26, scope: !4728)
!4731 = !DILocalVariable(name: "factor", arg: 2, scope: !4728, file: !72, line: 4974, type: !17)
!4732 = !DILocation(line: 4974, column: 36, scope: !4728)
!4733 = !DILocation(line: 4976, column: 41, scope: !4728)
!4734 = !DILocation(line: 4976, column: 47, scope: !4728)
!4735 = !DILocation(line: 4976, column: 10, scope: !4728)
!4736 = !DILocation(line: 4976, column: 3, scope: !4728)
!4737 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !72, file: !72, line: 4997, type: !885, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4738 = !DILocalVariable(name: "value", arg: 1, scope: !4737, file: !72, line: 4997, type: !17)
!4739 = !DILocation(line: 4997, column: 25, scope: !4737)
!4740 = !DILocalVariable(name: "factor", arg: 2, scope: !4737, file: !72, line: 4997, type: !17)
!4741 = !DILocation(line: 4997, column: 35, scope: !4737)
!4742 = !DILocation(line: 4999, column: 41, scope: !4737)
!4743 = !DILocation(line: 4999, column: 47, scope: !4737)
!4744 = !DILocation(line: 4999, column: 10, scope: !4737)
!4745 = !DILocation(line: 4999, column: 3, scope: !4737)
!4746 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !72, file: !72, line: 5020, type: !885, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4747 = !DILocalVariable(name: "value", arg: 1, scope: !4746, file: !72, line: 5020, type: !17)
!4748 = !DILocation(line: 5020, column: 26, scope: !4746)
!4749 = !DILocalVariable(name: "factor", arg: 2, scope: !4746, file: !72, line: 5020, type: !17)
!4750 = !DILocation(line: 5020, column: 35, scope: !4746)
!4751 = !DILocation(line: 5022, column: 41, scope: !4746)
!4752 = !DILocation(line: 5022, column: 47, scope: !4746)
!4753 = !DILocation(line: 5022, column: 10, scope: !4746)
!4754 = !DILocation(line: 5022, column: 3, scope: !4746)
!4755 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !72, file: !72, line: 5043, type: !885, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4756 = !DILocalVariable(name: "value", arg: 1, scope: !4755, file: !72, line: 5043, type: !17)
!4757 = !DILocation(line: 5043, column: 25, scope: !4755)
!4758 = !DILocalVariable(name: "factor", arg: 2, scope: !4755, file: !72, line: 5043, type: !17)
!4759 = !DILocation(line: 5043, column: 35, scope: !4755)
!4760 = !DILocation(line: 5045, column: 41, scope: !4755)
!4761 = !DILocation(line: 5045, column: 47, scope: !4755)
!4762 = !DILocation(line: 5045, column: 10, scope: !4755)
!4763 = !DILocation(line: 5045, column: 3, scope: !4755)
!4764 = distinct !DISubprogram(name: "MulHighWord", scope: !4765, file: !4765, line: 39, type: !1412, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4765 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0108")
!4766 = !DILocalVariable(name: "arg1", arg: 1, scope: !4764, file: !4765, line: 39, type: !736)
!4767 = !DILocation(line: 39, column: 30, scope: !4764)
!4768 = !DILocalVariable(name: "arg2", arg: 2, scope: !4764, file: !4765, line: 39, type: !736)
!4769 = !DILocation(line: 39, column: 48, scope: !4764)
!4770 = !DILocalVariable(name: "arg1_LW", scope: !4764, file: !4765, line: 41, type: !22)
!4771 = !DILocation(line: 41, column: 6, scope: !4764)
!4772 = !DILocalVariable(name: "arg1_HW", scope: !4764, file: !4765, line: 41, type: !22)
!4773 = !DILocation(line: 41, column: 14, scope: !4764)
!4774 = !DILocalVariable(name: "arg2_LW", scope: !4764, file: !4765, line: 41, type: !22)
!4775 = !DILocation(line: 41, column: 22, scope: !4764)
!4776 = !DILocalVariable(name: "arg2_HW", scope: !4764, file: !4765, line: 41, type: !22)
!4777 = !DILocation(line: 41, column: 30, scope: !4764)
!4778 = !DILocalVariable(name: "MulTemp1", scope: !4764, file: !4765, line: 42, type: !736)
!4779 = !DILocation(line: 42, column: 6, scope: !4764)
!4780 = !DILocalVariable(name: "MulTemp2", scope: !4764, file: !4765, line: 42, type: !736)
!4781 = !DILocation(line: 42, column: 16, scope: !4764)
!4782 = !DILocalVariable(name: "MulTemp3", scope: !4764, file: !4765, line: 42, type: !736)
!4783 = !DILocation(line: 42, column: 26, scope: !4764)
!4784 = !DILocalVariable(name: "MulTemp4", scope: !4764, file: !4765, line: 42, type: !736)
!4785 = !DILocation(line: 42, column: 36, scope: !4764)
!4786 = !DILocalVariable(name: "HIGHWORD", scope: !4764, file: !4765, line: 42, type: !736)
!4787 = !DILocation(line: 42, column: 47, scope: !4764)
!4788 = !DILocalVariable(name: "OverFlow", scope: !4764, file: !4765, line: 42, type: !736)
!4789 = !DILocation(line: 42, column: 57, scope: !4764)
!4790 = !DILocation(line: 43, column: 12, scope: !4764)
!4791 = !DILocation(line: 43, column: 17, scope: !4764)
!4792 = !DILocation(line: 43, column: 10, scope: !4764)
!4793 = !DILocation(line: 44, column: 13, scope: !4764)
!4794 = !DILocation(line: 44, column: 18, scope: !4764)
!4795 = !DILocation(line: 44, column: 31, scope: !4764)
!4796 = !DILocation(line: 44, column: 12, scope: !4764)
!4797 = !DILocation(line: 44, column: 10, scope: !4764)
!4798 = !DILocation(line: 45, column: 12, scope: !4764)
!4799 = !DILocation(line: 45, column: 17, scope: !4764)
!4800 = !DILocation(line: 45, column: 10, scope: !4764)
!4801 = !DILocation(line: 46, column: 13, scope: !4764)
!4802 = !DILocation(line: 46, column: 18, scope: !4764)
!4803 = !DILocation(line: 46, column: 31, scope: !4764)
!4804 = !DILocation(line: 46, column: 12, scope: !4764)
!4805 = !DILocation(line: 46, column: 10, scope: !4764)
!4806 = !DILocation(line: 48, column: 48, scope: !4807)
!4807 = distinct !DILexicalBlock(scope: !4764, file: !4765, line: 48, column: 6)
!4808 = !DILocation(line: 48, column: 43, scope: !4807)
!4809 = !DILocation(line: 48, column: 33, scope: !4807)
!4810 = !DILocation(line: 48, column: 73, scope: !4807)
!4811 = !DILocation(line: 48, column: 68, scope: !4807)
!4812 = !DILocation(line: 48, column: 58, scope: !4807)
!4813 = !DILocation(line: 48, column: 8, scope: !4807)
!4814 = !DILocation(line: 48, column: 6, scope: !4764)
!4815 = !DILocation(line: 49, column: 6, scope: !4816)
!4816 = distinct !DILexicalBlock(scope: !4807, file: !4765, line: 48, column: 85)
!4817 = !DILocation(line: 51, column: 13, scope: !4764)
!4818 = !DILocation(line: 51, column: 23, scope: !4764)
!4819 = !DILocation(line: 51, column: 21, scope: !4764)
!4820 = !DILocation(line: 51, column: 11, scope: !4764)
!4821 = !DILocation(line: 52, column: 13, scope: !4764)
!4822 = !DILocation(line: 52, column: 23, scope: !4764)
!4823 = !DILocation(line: 52, column: 21, scope: !4764)
!4824 = !DILocation(line: 52, column: 11, scope: !4764)
!4825 = !DILocation(line: 53, column: 13, scope: !4764)
!4826 = !DILocation(line: 53, column: 23, scope: !4764)
!4827 = !DILocation(line: 53, column: 21, scope: !4764)
!4828 = !DILocation(line: 53, column: 11, scope: !4764)
!4829 = !DILocation(line: 54, column: 13, scope: !4764)
!4830 = !DILocation(line: 54, column: 23, scope: !4764)
!4831 = !DILocation(line: 54, column: 21, scope: !4764)
!4832 = !DILocation(line: 54, column: 11, scope: !4764)
!4833 = !DILocation(line: 56, column: 14, scope: !4764)
!4834 = !DILocation(line: 56, column: 23, scope: !4764)
!4835 = !DILocation(line: 56, column: 33, scope: !4764)
!4836 = !DILocation(line: 56, column: 42, scope: !4764)
!4837 = !DILocation(line: 56, column: 30, scope: !4764)
!4838 = !DILocation(line: 56, column: 51, scope: !4764)
!4839 = !DILocation(line: 56, column: 49, scope: !4764)
!4840 = !DILocation(line: 56, column: 11, scope: !4764)
!4841 = !DILocation(line: 57, column: 14, scope: !4764)
!4842 = !DILocation(line: 57, column: 22, scope: !4764)
!4843 = !DILocation(line: 57, column: 31, scope: !4764)
!4844 = !DILocation(line: 57, column: 40, scope: !4764)
!4845 = !DILocation(line: 57, column: 28, scope: !4764)
!4846 = !DILocation(line: 57, column: 53, scope: !4764)
!4847 = !DILocation(line: 57, column: 62, scope: !4764)
!4848 = !DILocation(line: 57, column: 50, scope: !4764)
!4849 = !DILocation(line: 57, column: 11, scope: !4764)
!4850 = !DILocation(line: 58, column: 6, scope: !4851)
!4851 = distinct !DILexicalBlock(scope: !4764, file: !4765, line: 58, column: 6)
!4852 = !DILocation(line: 58, column: 15, scope: !4851)
!4853 = !DILocation(line: 58, column: 6, scope: !4764)
!4854 = !DILocation(line: 60, column: 10, scope: !4855)
!4855 = distinct !DILexicalBlock(scope: !4851, file: !4765, line: 59, column: 2)
!4856 = !DILocation(line: 60, column: 22, scope: !4855)
!4857 = !DILocation(line: 60, column: 30, scope: !4855)
!4858 = !DILocation(line: 60, column: 19, scope: !4855)
!4859 = !DILocation(line: 60, column: 3, scope: !4855)
!4860 = !DILocation(line: 64, column: 10, scope: !4861)
!4861 = distinct !DILexicalBlock(scope: !4851, file: !4765, line: 63, column: 2)
!4862 = !DILocation(line: 64, column: 3, scope: !4861)
!4863 = !DILocation(line: 66, column: 1, scope: !4764)
!4864 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !4865, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4865 = !DISubroutineType(types: !4866)
!4866 = !{!37, !26, !26}
!4867 = !DILocalVariable(name: "left", arg: 1, scope: !4864, file: !30, line: 78, type: !26)
!4868 = !DILocation(line: 78, column: 38, scope: !4864)
!4869 = !DILocalVariable(name: "right", arg: 2, scope: !4864, file: !30, line: 78, type: !26)
!4870 = !DILocation(line: 78, column: 52, scope: !4864)
!4871 = !DILocation(line: 80, column: 12, scope: !4864)
!4872 = !DILocation(line: 80, column: 19, scope: !4864)
!4873 = !DILocation(line: 80, column: 17, scope: !4864)
!4874 = !DILocation(line: 80, column: 25, scope: !4864)
!4875 = !DILocation(line: 80, column: 5, scope: !4864)
!4876 = distinct !DISubprogram(name: "MulLowWord", scope: !4765, file: !4765, line: 82, type: !1412, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4877 = !DILocalVariable(name: "arg1", arg: 1, scope: !4876, file: !4765, line: 82, type: !736)
!4878 = !DILocation(line: 82, column: 29, scope: !4876)
!4879 = !DILocalVariable(name: "arg2", arg: 2, scope: !4876, file: !4765, line: 82, type: !736)
!4880 = !DILocation(line: 82, column: 47, scope: !4876)
!4881 = !DILocalVariable(name: "arg1_LW", scope: !4876, file: !4765, line: 84, type: !22)
!4882 = !DILocation(line: 84, column: 6, scope: !4876)
!4883 = !DILocalVariable(name: "arg1_HW", scope: !4876, file: !4765, line: 84, type: !22)
!4884 = !DILocation(line: 84, column: 14, scope: !4876)
!4885 = !DILocalVariable(name: "arg2_LW", scope: !4876, file: !4765, line: 84, type: !22)
!4886 = !DILocation(line: 84, column: 22, scope: !4876)
!4887 = !DILocalVariable(name: "arg2_HW", scope: !4876, file: !4765, line: 84, type: !22)
!4888 = !DILocation(line: 84, column: 30, scope: !4876)
!4889 = !DILocalVariable(name: "MulTemp1", scope: !4876, file: !4765, line: 85, type: !736)
!4890 = !DILocation(line: 85, column: 6, scope: !4876)
!4891 = !DILocalVariable(name: "MulTemp2", scope: !4876, file: !4765, line: 85, type: !736)
!4892 = !DILocation(line: 85, column: 16, scope: !4876)
!4893 = !DILocalVariable(name: "MulTemp3", scope: !4876, file: !4765, line: 85, type: !736)
!4894 = !DILocation(line: 85, column: 26, scope: !4876)
!4895 = !DILocalVariable(name: "MulTemp4", scope: !4876, file: !4765, line: 85, type: !736)
!4896 = !DILocation(line: 85, column: 36, scope: !4876)
!4897 = !DILocalVariable(name: "HIGHWORD", scope: !4876, file: !4765, line: 85, type: !736)
!4898 = !DILocation(line: 85, column: 47, scope: !4876)
!4899 = !DILocalVariable(name: "OverFlow", scope: !4876, file: !4765, line: 85, type: !736)
!4900 = !DILocation(line: 85, column: 57, scope: !4876)
!4901 = !DILocation(line: 86, column: 12, scope: !4876)
!4902 = !DILocation(line: 86, column: 17, scope: !4876)
!4903 = !DILocation(line: 86, column: 10, scope: !4876)
!4904 = !DILocation(line: 87, column: 13, scope: !4876)
!4905 = !DILocation(line: 87, column: 18, scope: !4876)
!4906 = !DILocation(line: 87, column: 31, scope: !4876)
!4907 = !DILocation(line: 87, column: 12, scope: !4876)
!4908 = !DILocation(line: 87, column: 10, scope: !4876)
!4909 = !DILocation(line: 88, column: 12, scope: !4876)
!4910 = !DILocation(line: 88, column: 17, scope: !4876)
!4911 = !DILocation(line: 88, column: 10, scope: !4876)
!4912 = !DILocation(line: 89, column: 13, scope: !4876)
!4913 = !DILocation(line: 89, column: 18, scope: !4876)
!4914 = !DILocation(line: 89, column: 31, scope: !4876)
!4915 = !DILocation(line: 89, column: 12, scope: !4876)
!4916 = !DILocation(line: 89, column: 10, scope: !4876)
!4917 = !DILocation(line: 90, column: 13, scope: !4876)
!4918 = !DILocation(line: 90, column: 23, scope: !4876)
!4919 = !DILocation(line: 90, column: 21, scope: !4876)
!4920 = !DILocation(line: 90, column: 11, scope: !4876)
!4921 = !DILocation(line: 91, column: 13, scope: !4876)
!4922 = !DILocation(line: 91, column: 23, scope: !4876)
!4923 = !DILocation(line: 91, column: 21, scope: !4876)
!4924 = !DILocation(line: 91, column: 11, scope: !4876)
!4925 = !DILocation(line: 92, column: 13, scope: !4876)
!4926 = !DILocation(line: 92, column: 23, scope: !4876)
!4927 = !DILocation(line: 92, column: 21, scope: !4876)
!4928 = !DILocation(line: 92, column: 11, scope: !4876)
!4929 = !DILocation(line: 93, column: 13, scope: !4876)
!4930 = !DILocation(line: 93, column: 23, scope: !4876)
!4931 = !DILocation(line: 93, column: 21, scope: !4876)
!4932 = !DILocation(line: 93, column: 11, scope: !4876)
!4933 = !DILocation(line: 94, column: 14, scope: !4876)
!4934 = !DILocation(line: 94, column: 28, scope: !4876)
!4935 = !DILocation(line: 94, column: 37, scope: !4876)
!4936 = !DILocation(line: 94, column: 46, scope: !4876)
!4937 = !DILocation(line: 94, column: 24, scope: !4876)
!4938 = !DILocation(line: 94, column: 56, scope: !4876)
!4939 = !DILocation(line: 94, column: 65, scope: !4876)
!4940 = !DILocation(line: 94, column: 74, scope: !4876)
!4941 = !DILocation(line: 94, column: 52, scope: !4876)
!4942 = !DILocation(line: 94, column: 11, scope: !4876)
!4943 = !DILocation(line: 96, column: 9, scope: !4876)
!4944 = !DILocation(line: 96, column: 2, scope: !4876)
!4945 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4946, file: !4946, line: 12, type: !4947, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4950)
!4946 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4947 = !DISubroutineType(types: !4948)
!4948 = !{null, !4949}
!4949 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4950 = !{!4951}
!4951 = !DILocalVariable(name: "z", arg: 1, scope: !4945, file: !4946, line: 12, type: !4949)
!4952 = !DILocation(line: 0, scope: !4945)
!4953 = !DILocation(line: 13, column: 9, scope: !4954)
!4954 = distinct !DILexicalBlock(scope: !4945, file: !4946, line: 13, column: 7)
!4955 = !DILocation(line: 13, column: 7, scope: !4945)
!4956 = !DILocation(line: 14, column: 5, scope: !4954)
!4957 = !DILocation(line: 15, column: 1, scope: !4945)
!4958 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4959, file: !4959, line: 20, type: !4960, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4963)
!4959 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4960 = !DISubroutineType(types: !4961)
!4961 = !{null, !4962, !4962}
!4962 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4963 = !{!4964, !4965}
!4964 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4958, file: !4959, line: 20, type: !4962)
!4965 = !DILocalVariable(name: "shift", arg: 2, scope: !4958, file: !4959, line: 20, type: !4962)
!4966 = !DILocation(line: 0, scope: !4958)
!4967 = !DILocation(line: 21, column: 13, scope: !4968)
!4968 = distinct !DILexicalBlock(scope: !4958, file: !4959, line: 21, column: 7)
!4969 = !DILocation(line: 21, column: 7, scope: !4958)
!4970 = !DILocation(line: 27, column: 5, scope: !4971)
!4971 = distinct !DILexicalBlock(scope: !4968, file: !4959, line: 21, column: 26)
!4972 = !DILocation(line: 29, column: 1, scope: !4958)
