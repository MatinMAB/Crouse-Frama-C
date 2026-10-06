; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/build/s32_mul_s32_s32_alarm_0107.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"val1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"val2\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"src_analysis/sources/MulHword.c\00", align 1
@.str.1.6 = private unnamed_addr constant [84 x i8] c"KLEE-ALARM-0107: signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0107.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.3 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.4 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.5 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str.1.9 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str.2.10 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1

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
  br i1 %cmp5, label %if.then6, label %if.else9, !dbg !2859

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2860
  %conv = sext i32 %5 to i64, !dbg !2863
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !2864
  %tobool = icmp ne i32 %call, 0, !dbg !2864
  br i1 %tobool, label %if.end8, label %if.then7, !dbg !2865

if.then7:                                         ; preds = %if.then6
  store i32 0, i32* %retval, align 4, !dbg !2866
  br label %return, !dbg !2866

if.end8:                                          ; preds = %if.then6
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2868
  %sub = sub nsw i32 0, %6, !dbg !2869
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2870
  br label %if.end10, !dbg !2871

if.else9:                                         ; preds = %if.end
  %7 = load i32, i32* %val1.addr, align 4, !dbg !2872
  store i32 %7, i32* %u32Temp1, align 4, !dbg !2874
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2875
  %cmp11 = icmp slt i32 %8, 0, !dbg !2877
  br i1 %cmp11, label %if.then13, label %if.else20, !dbg !2878

if.then13:                                        ; preds = %if.end10
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2879
  %conv14 = sext i32 %9 to i64, !dbg !2882
  %call15 = call i32 @klee_alarm_s32_neg_valid(i64 %conv14), !dbg !2883
  %tobool16 = icmp ne i32 %call15, 0, !dbg !2883
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !2884

if.then17:                                        ; preds = %if.then13
  store i32 0, i32* %retval, align 4, !dbg !2885
  br label %return, !dbg !2885

if.end18:                                         ; preds = %if.then13
  %10 = load i32, i32* %val2.addr, align 4, !dbg !2887
  %sub19 = sub nsw i32 0, %10, !dbg !2888
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2889
  br label %if.end21, !dbg !2890

if.else20:                                        ; preds = %if.end10
  %11 = load i32, i32* %val2.addr, align 4, !dbg !2891
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2893
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.end18
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2894
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2895
  %mul = mul i32 %12, %13, !dbg !2896
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2897
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2898
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2899
  %call22 = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2900
  store i32 %call22, i32* %u32Temp4, align 4, !dbg !2901
  store i32 0, i32* %retval, align 4, !dbg !2902
  br label %return, !dbg !2902

return:                                           ; preds = %if.end21, %if.then17, %if.then7
  %16 = load i32, i32* %retval, align 4, !dbg !2903
  ret i32 %16, !dbg !2903
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2904 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2907, metadata !DIExpression()), !dbg !2908
  %0 = load i64, i64* %value.addr, align 8, !dbg !2909
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2910
  %conv = zext i1 %cmp to i32, !dbg !2910
  ret i32 %conv, !dbg !2911
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2912 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2913, metadata !DIExpression()), !dbg !2914
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2915, metadata !DIExpression()), !dbg !2916
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2917, metadata !DIExpression()), !dbg !2918
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2919, metadata !DIExpression()), !dbg !2920
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2921, metadata !DIExpression()), !dbg !2922
  %0 = load i32, i32* %value.addr, align 4, !dbg !2923
  %cmp = icmp slt i32 %0, 0, !dbg !2925
  br i1 %cmp, label %if.then, label %if.else, !dbg !2926

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2927
  %sub = sub nsw i32 0, %1, !dbg !2929
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2930
  store i8 1, i8* %u8SignBit, align 1, !dbg !2931
  br label %if.end, !dbg !2932

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2933
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2935
  store i8 0, i8* %u8SignBit, align 1, !dbg !2936
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2937
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2938
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2939
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2940
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2941
  %shr = lshr i32 %5, 1, !dbg !2942
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2943
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2944
  %conv = zext i8 %6 to i32, !dbg !2944
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2946
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2947

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2948
  store i32 %7, i32* %retval, align 4, !dbg !2950
  br label %return, !dbg !2950

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2951
  %sub5 = sub i32 0, %8, !dbg !2953
  store i32 %sub5, i32* %retval, align 4, !dbg !2954
  br label %return, !dbg !2954

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2955
  ret i32 %9, !dbg !2955
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2956 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2957, metadata !DIExpression()), !dbg !2958
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2959, metadata !DIExpression()), !dbg !2960
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2961, metadata !DIExpression()), !dbg !2962
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2963, metadata !DIExpression()), !dbg !2964
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2965, metadata !DIExpression()), !dbg !2966
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2967, metadata !DIExpression()), !dbg !2968
  %0 = load i32, i32* %value.addr, align 4, !dbg !2969
  %cmp = icmp slt i32 %0, 0, !dbg !2971
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2972
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2972

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2973
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2974
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2975
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2975

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2976
  br label %if.end, !dbg !2978

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2979
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2981
  %cmp5 = icmp slt i32 %4, 0, !dbg !2983
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2984

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2985
  %sub = sub nsw i32 0, %5, !dbg !2987
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2988
  br label %if.end8, !dbg !2989

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2990
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2992
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2993
  %cmp9 = icmp slt i32 %7, 0, !dbg !2995
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2996

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2997
  %sub11 = sub nsw i32 0, %8, !dbg !2999
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3000
  br label %if.end13, !dbg !3001

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3002
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3004
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3005
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3006
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3007
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3008
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3009
  %conv = zext i8 %12 to i32, !dbg !3009
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3011
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3012

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3013
  store i32 %13, i32* %retval, align 4, !dbg !3015
  br label %return, !dbg !3015

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3016
  %sub18 = sub i32 0, %14, !dbg !3018
  store i32 %sub18, i32* %retval, align 4, !dbg !3019
  br label %return, !dbg !3019

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3020
  ret i32 %15, !dbg !3020
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3021 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3024, metadata !DIExpression()), !dbg !3025
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3026, metadata !DIExpression()), !dbg !3027
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3028, metadata !DIExpression()), !dbg !3029
  store i32 0, i32* %u32Temp1, align 4, !dbg !3029
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3030, metadata !DIExpression()), !dbg !3031
  store i32 0, i32* %u32Temp2, align 4, !dbg !3031
  %0 = load i32, i32* %value.addr, align 4, !dbg !3032
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3033
  %conv = zext i8 %1 to i32, !dbg !3033
  %mul = mul i32 %0, %conv, !dbg !3034
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3035
  %2 = load i32, i32* %value.addr, align 4, !dbg !3036
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3037
  %conv1 = zext i8 %3 to i32, !dbg !3037
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3038
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3039
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3040
  %shr = lshr i32 %4, 8, !dbg !3041
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3042
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3043
  %shl = shl i32 %5, 24, !dbg !3044
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3045
  %or = or i32 %6, %shl, !dbg !3045
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3045
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3046
  ret i32 %7, !dbg !3047
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3048 {
entry:
  %retval = alloca i32, align 4
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
  %shr = lshr i32 %4, 7, !dbg !3066
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3067
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3068
  %shl = shl i32 %5, 25, !dbg !3069
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3070
  %or = or i32 %6, %shl, !dbg !3070
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3070
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3071
  %shr2 = lshr i32 %7, 7, !dbg !3073
  %cmp = icmp eq i32 %shr2, 0, !dbg !3074
  br i1 %cmp, label %if.then, label %if.else, !dbg !3075

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3076
  store i32 %8, i32* %retval, align 4, !dbg !3078
  br label %return, !dbg !3078

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3079
  br label %return, !dbg !3079

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3081
  ret i32 %9, !dbg !3081
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3082 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3085, metadata !DIExpression()), !dbg !3086
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3087, metadata !DIExpression()), !dbg !3088
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3089, metadata !DIExpression()), !dbg !3090
  store i32 0, i32* %u32Temp1, align 4, !dbg !3090
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3091, metadata !DIExpression()), !dbg !3092
  store i32 0, i32* %u32Temp2, align 4, !dbg !3092
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3093
  %conv = sext i8 %0 to i32, !dbg !3093
  %cmp = icmp sgt i32 %conv, 0, !dbg !3095
  br i1 %cmp, label %if.then, label %if.else, !dbg !3096

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3097
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3099
  %conv2 = sext i8 %2 to i32, !dbg !3099
  %mul = mul i32 %1, %conv2, !dbg !3100
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3101
  %3 = load i32, i32* %value.addr, align 4, !dbg !3102
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3103
  %conv3 = sext i8 %4 to i32, !dbg !3103
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3104
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3105
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3106
  %shr = lshr i32 %5, 7, !dbg !3107
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3108
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3109
  %shl = shl i32 %6, 25, !dbg !3110
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3111
  %or = or i32 %7, %shl, !dbg !3111
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3111
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3112
  store i32 %8, i32* %retval, align 4, !dbg !3113
  br label %return, !dbg !3113

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3114
  br label %return, !dbg !3114

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3116
  ret i32 %9, !dbg !3116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3117 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3118, metadata !DIExpression()), !dbg !3119
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3120, metadata !DIExpression()), !dbg !3121
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3122, metadata !DIExpression()), !dbg !3123
  store i32 0, i32* %u32Temp1, align 4, !dbg !3123
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3124, metadata !DIExpression()), !dbg !3125
  store i32 0, i32* %u32Temp2, align 4, !dbg !3125
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3126
  %conv = sext i8 %0 to i32, !dbg !3126
  %cmp = icmp sle i32 %conv, 0, !dbg !3128
  br i1 %cmp, label %if.then, label %if.else, !dbg !3129

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3130
  br label %return, !dbg !3130

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3132
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3134
  %conv2 = sext i8 %2 to i32, !dbg !3134
  %mul = mul i32 %1, %conv2, !dbg !3135
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3136
  %3 = load i32, i32* %value.addr, align 4, !dbg !3137
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3138
  %conv3 = sext i8 %4 to i32, !dbg !3138
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3139
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3140
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3141
  %shr = lshr i32 %5, 6, !dbg !3142
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3143
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3144
  %shl = shl i32 %6, 26, !dbg !3145
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3146
  %or = or i32 %7, %shl, !dbg !3146
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3146
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3147
  %shr4 = lshr i32 %8, 6, !dbg !3149
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3150
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3151

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3152
  store i32 %9, i32* %retval, align 4, !dbg !3154
  br label %return, !dbg !3154

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3155
  br label %return, !dbg !3155

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3157
  ret i32 %10, !dbg !3157
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3158 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3159, metadata !DIExpression()), !dbg !3160
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3161, metadata !DIExpression()), !dbg !3162
  %0 = load i16, i16* %value.addr, align 2, !dbg !3163
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3164
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3165
  ret i16 %call, !dbg !3166
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3167 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3168, metadata !DIExpression()), !dbg !3169
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3170, metadata !DIExpression()), !dbg !3171
  %0 = load i16, i16* %value.addr, align 2, !dbg !3172
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3173
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3174
  ret i16 %call, !dbg !3175
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3176 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3177, metadata !DIExpression()), !dbg !3178
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3179, metadata !DIExpression()), !dbg !3180
  %0 = load i16, i16* %value.addr, align 2, !dbg !3181
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3182
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3183
  ret i16 %call, !dbg !3184
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3185 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3186, metadata !DIExpression()), !dbg !3187
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3188, metadata !DIExpression()), !dbg !3189
  %0 = load i16, i16* %value.addr, align 2, !dbg !3190
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3191
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3192
  ret i16 %call, !dbg !3193
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3194 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3195, metadata !DIExpression()), !dbg !3196
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3197, metadata !DIExpression()), !dbg !3198
  %0 = load i16, i16* %value.addr, align 2, !dbg !3199
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3200
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3201
  ret i16 %call, !dbg !3202
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3203 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3206, metadata !DIExpression()), !dbg !3207
  %0 = load i16, i16* %value.addr, align 2, !dbg !3208
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3209
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3210
  ret i16 %call, !dbg !3211
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3212 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3215, metadata !DIExpression()), !dbg !3216
  %0 = load i16, i16* %value.addr, align 2, !dbg !3217
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3218
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3219
  ret i16 %call, !dbg !3220
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3221 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3224, metadata !DIExpression()), !dbg !3225
  %0 = load i16, i16* %value.addr, align 2, !dbg !3226
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3227
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3228
  ret i16 %call, !dbg !3229
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3230 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3233, metadata !DIExpression()), !dbg !3234
  %0 = load i16, i16* %value.addr, align 2, !dbg !3235
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3236
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3237
  ret i16 %call, !dbg !3238
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3239 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3242, metadata !DIExpression()), !dbg !3243
  %0 = load i16, i16* %value.addr, align 2, !dbg !3244
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3245
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3246
  ret i16 %call, !dbg !3247
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3248 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3251, metadata !DIExpression()), !dbg !3252
  %0 = load i16, i16* %value.addr, align 2, !dbg !3253
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3254
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3255
  ret i16 %call, !dbg !3256
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3257 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3260, metadata !DIExpression()), !dbg !3261
  %0 = load i16, i16* %value.addr, align 2, !dbg !3262
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3263
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3264
  ret i16 %call, !dbg !3265
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3266 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3269, metadata !DIExpression()), !dbg !3270
  %0 = load i16, i16* %value.addr, align 2, !dbg !3271
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3272
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3273
  ret i16 %call, !dbg !3274
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3275 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3278, metadata !DIExpression()), !dbg !3279
  %0 = load i16, i16* %value.addr, align 2, !dbg !3280
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3281
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3282
  ret i16 %call, !dbg !3283
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3284 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3287, metadata !DIExpression()), !dbg !3288
  %0 = load i16, i16* %value.addr, align 2, !dbg !3289
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3290
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3291
  ret i16 %call, !dbg !3292
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3293 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3296, metadata !DIExpression()), !dbg !3297
  %0 = load i16, i16* %value.addr, align 2, !dbg !3298
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3299
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3300
  %2 = load i16, i16* %retval, align 2, !dbg !3301
  ret i16 %2, !dbg !3301
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3302 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3305, metadata !DIExpression()), !dbg !3306
  %0 = load i16, i16* %value.addr, align 2, !dbg !3307
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3308
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3309
  ret i16 %call, !dbg !3310
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3311 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3314, metadata !DIExpression()), !dbg !3315
  %0 = load i16, i16* %value.addr, align 2, !dbg !3316
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3317
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3318
  ret i16 %call, !dbg !3319
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3320 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3323, metadata !DIExpression()), !dbg !3324
  %0 = load i16, i16* %value.addr, align 2, !dbg !3325
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3326
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3327
  ret i16 %call, !dbg !3328
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3329 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3332, metadata !DIExpression()), !dbg !3333
  %0 = load i16, i16* %value.addr, align 2, !dbg !3334
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3335
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3336
  ret i16 %call, !dbg !3337
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3338 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3341, metadata !DIExpression()), !dbg !3342
  %0 = load i16, i16* %value.addr, align 2, !dbg !3343
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3344
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3345
  ret i16 %call, !dbg !3346
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3347 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3350, metadata !DIExpression()), !dbg !3351
  %0 = load i16, i16* %value.addr, align 2, !dbg !3352
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3353
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3354
  ret i16 %call, !dbg !3355
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3356 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3359, metadata !DIExpression()), !dbg !3360
  %0 = load i16, i16* %value.addr, align 2, !dbg !3361
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3362
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3363
  ret i16 %call, !dbg !3364
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3365 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3368, metadata !DIExpression()), !dbg !3369
  %0 = load i16, i16* %value.addr, align 2, !dbg !3370
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3371
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3372
  ret i16 %call, !dbg !3373
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3374 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3377, metadata !DIExpression()), !dbg !3378
  %0 = load i16, i16* %value.addr, align 2, !dbg !3379
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3380
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3381
  ret i16 %call, !dbg !3382
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3383 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3386, metadata !DIExpression()), !dbg !3387
  %0 = load i16, i16* %value.addr, align 2, !dbg !3388
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3389
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3390
  ret i16 %call, !dbg !3391
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3392 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3395, metadata !DIExpression()), !dbg !3396
  %0 = load i16, i16* %value.addr, align 2, !dbg !3397
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3398
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3399
  ret i16 %call, !dbg !3400
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3401 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3404, metadata !DIExpression()), !dbg !3405
  %0 = load i16, i16* %value.addr, align 2, !dbg !3406
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3407
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3408
  ret i16 %call, !dbg !3409
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3410 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3413, metadata !DIExpression()), !dbg !3414
  %0 = load i16, i16* %value.addr, align 2, !dbg !3415
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3416
  %conv = zext i8 %1 to i16, !dbg !3417
  %conv1 = zext i16 %conv to i32, !dbg !3417
  %shl = shl i32 %conv1, 5, !dbg !3418
  %conv2 = trunc i32 %shl to i16, !dbg !3419
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3420
  ret i16 %call, !dbg !3421
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3422 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3423, metadata !DIExpression()), !dbg !3424
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3425, metadata !DIExpression()), !dbg !3426
  %0 = load i16, i16* %value.addr, align 2, !dbg !3427
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3428
  %conv = zext i8 %1 to i16, !dbg !3429
  %conv1 = zext i16 %conv to i32, !dbg !3429
  %shl = shl i32 %conv1, 6, !dbg !3430
  %conv2 = trunc i32 %shl to i16, !dbg !3431
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3432
  ret i16 %call, !dbg !3433
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3434 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3435, metadata !DIExpression()), !dbg !3436
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3437, metadata !DIExpression()), !dbg !3438
  %0 = load i16, i16* %value.addr, align 2, !dbg !3439
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3440
  %conv = zext i8 %1 to i16, !dbg !3441
  %conv1 = zext i16 %conv to i32, !dbg !3441
  %shl = shl i32 %conv1, 7, !dbg !3442
  %conv2 = trunc i32 %shl to i16, !dbg !3443
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3444
  ret i16 %call, !dbg !3445
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3446 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3447, metadata !DIExpression()), !dbg !3448
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3449, metadata !DIExpression()), !dbg !3450
  %0 = load i16, i16* %value.addr, align 2, !dbg !3451
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3452
  %conv = zext i8 %1 to i16, !dbg !3453
  %conv1 = zext i16 %conv to i32, !dbg !3453
  %shl = shl i32 %conv1, 7, !dbg !3454
  %conv2 = trunc i32 %shl to i16, !dbg !3455
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3456
  ret i16 %call, !dbg !3457
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3458 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3459, metadata !DIExpression()), !dbg !3460
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3461, metadata !DIExpression()), !dbg !3462
  %0 = load i16, i16* %value.addr, align 2, !dbg !3463
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3464
  %conv = zext i8 %1 to i16, !dbg !3465
  %conv1 = zext i16 %conv to i32, !dbg !3465
  %shl = shl i32 %conv1, 4, !dbg !3466
  %conv2 = trunc i32 %shl to i16, !dbg !3467
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3468
  ret i16 %call, !dbg !3469
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3470 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3471, metadata !DIExpression()), !dbg !3472
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3473, metadata !DIExpression()), !dbg !3474
  %0 = load i16, i16* %value.addr, align 2, !dbg !3475
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3476
  %conv = zext i8 %1 to i16, !dbg !3477
  %conv1 = zext i16 %conv to i32, !dbg !3477
  %shl = shl i32 %conv1, 5, !dbg !3478
  %conv2 = trunc i32 %shl to i16, !dbg !3479
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3480
  ret i16 %call, !dbg !3481
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3482 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3483, metadata !DIExpression()), !dbg !3484
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3485, metadata !DIExpression()), !dbg !3486
  %0 = load i16, i16* %value.addr, align 2, !dbg !3487
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3488
  %conv = zext i8 %1 to i16, !dbg !3489
  %conv1 = zext i16 %conv to i32, !dbg !3489
  %shl = shl i32 %conv1, 2, !dbg !3490
  %conv2 = trunc i32 %shl to i16, !dbg !3491
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3492
  ret i16 %call, !dbg !3493
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3494 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3495, metadata !DIExpression()), !dbg !3496
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3497, metadata !DIExpression()), !dbg !3498
  %0 = load i16, i16* %value.addr, align 2, !dbg !3499
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3500
  %conv = zext i8 %1 to i16, !dbg !3501
  %conv1 = zext i16 %conv to i32, !dbg !3501
  %shl = shl i32 %conv1, 6, !dbg !3502
  %conv2 = trunc i32 %shl to i16, !dbg !3503
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3504
  ret i16 %call, !dbg !3505
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3506 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3507, metadata !DIExpression()), !dbg !3508
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3509, metadata !DIExpression()), !dbg !3510
  %0 = load i16, i16* %value.addr, align 2, !dbg !3511
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3512
  %conv = zext i8 %1 to i16, !dbg !3513
  %conv1 = zext i16 %conv to i32, !dbg !3513
  %shl = shl i32 %conv1, 3, !dbg !3514
  %conv2 = trunc i32 %shl to i16, !dbg !3515
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3516
  ret i16 %call, !dbg !3517
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3518 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3519, metadata !DIExpression()), !dbg !3520
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3521, metadata !DIExpression()), !dbg !3522
  %0 = load i32, i32* %value.addr, align 4, !dbg !3523
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3524
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3525
  ret i32 %call, !dbg !3526
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3527 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3530, metadata !DIExpression()), !dbg !3531
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3532, metadata !DIExpression()), !dbg !3533
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3534, metadata !DIExpression()), !dbg !3535
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3536, metadata !DIExpression()), !dbg !3537
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3538, metadata !DIExpression()), !dbg !3539
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3540, metadata !DIExpression()), !dbg !3541
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3542, metadata !DIExpression()), !dbg !3543
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3544, metadata !DIExpression()), !dbg !3545
  %0 = load i32, i32* %value.addr, align 4, !dbg !3546
  %cmp = icmp slt i32 %0, 0, !dbg !3548
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3549

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3550
  %conv = sext i16 %1 to i32, !dbg !3550
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3551
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3552

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3553
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3554
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3555

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3556
  %conv6 = sext i16 %3 to i32, !dbg !3556
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3557
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3558

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3559
  br label %if.end, !dbg !3561

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3562
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3564
  %cmp9 = icmp slt i32 %4, 0, !dbg !3566
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3567

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3568
  %sub = sub nsw i32 0, %5, !dbg !3570
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3571
  br label %if.end13, !dbg !3572

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3573
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3575
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3576
  %conv14 = sext i16 %7 to i32, !dbg !3576
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3578
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3579

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3580
  %conv18 = sext i16 %8 to i32, !dbg !3580
  %sub19 = sub nsw i32 0, %conv18, !dbg !3582
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3583
  br label %if.end22, !dbg !3584

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3585
  %conv21 = sext i16 %9 to i32, !dbg !3585
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3587
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3588
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3589
  %mul = mul i32 %10, %11, !dbg !3590
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3591
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3592
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3593
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3594
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3595
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3596
  %15 = load i32, i32* %count.addr, align 4, !dbg !3597
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3598
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3598
  %shr = lshr i32 %14, %15, !dbg !3598, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3599
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3600
  %17 = load i32, i32* %count.addr, align 4, !dbg !3601
  %sub23 = sub i32 32, %17, !dbg !3602
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3603
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3603
  %shl = shl i32 %16, %sub23, !dbg !3603, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3604
  %or = or i32 %18, %shl, !dbg !3604
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3604
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3605
  %20 = load i32, i32* %count.addr, align 4, !dbg !3607
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3608
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3608
  %shr24 = lshr i32 %19, %20, !dbg !3608, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3609
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3610

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3611
  %conv28 = zext i8 %21 to i32, !dbg !3611
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3614
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3615

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3616
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3619
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3620

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3621
  store i32 %23, i32* %retval, align 4, !dbg !3622
  br label %return, !dbg !3622

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3623
  br label %return, !dbg !3623

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3624
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3627
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3628

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3629
  %sub40 = sub i32 0, %25, !dbg !3630
  store i32 %sub40, i32* %retval, align 4, !dbg !3631
  br label %return, !dbg !3631

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3632
  br label %return, !dbg !3632

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3633
  br label %return, !dbg !3633

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3635
  ret i32 %26, !dbg !3635
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3636 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3637, metadata !DIExpression()), !dbg !3638
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3639, metadata !DIExpression()), !dbg !3640
  %0 = load i32, i32* %value.addr, align 4, !dbg !3641
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3642
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3643
  ret i32 %call, !dbg !3644
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3645 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3648, metadata !DIExpression()), !dbg !3649
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3650, metadata !DIExpression()), !dbg !3651
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3652, metadata !DIExpression()), !dbg !3653
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3654, metadata !DIExpression()), !dbg !3655
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3656, metadata !DIExpression()), !dbg !3657
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3658, metadata !DIExpression()), !dbg !3659
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3660, metadata !DIExpression()), !dbg !3661
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3662, metadata !DIExpression()), !dbg !3663
  %0 = load i32, i32* %value.addr, align 4, !dbg !3664
  %cmp = icmp slt i32 %0, 0, !dbg !3666
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3667

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3668
  %conv = sext i8 %1 to i32, !dbg !3668
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3669
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3670

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3671
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3672
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3673

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3674
  %conv6 = sext i8 %3 to i32, !dbg !3674
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3675
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3676

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3677
  br label %if.end, !dbg !3679

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3680
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3682
  %cmp9 = icmp slt i32 %4, 0, !dbg !3684
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3685

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3686
  %sub = sub nsw i32 0, %5, !dbg !3688
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3689
  br label %if.end13, !dbg !3690

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3691
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3693
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3694
  %conv14 = sext i8 %7 to i32, !dbg !3694
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3696
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3697

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3698
  %conv18 = sext i8 %8 to i32, !dbg !3698
  %sub19 = sub nsw i32 0, %conv18, !dbg !3700
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3701
  br label %if.end22, !dbg !3702

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3703
  %conv21 = sext i8 %9 to i32, !dbg !3703
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3705
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3706
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3707
  %mul = mul i32 %10, %11, !dbg !3708
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3709
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3710
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3711
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3712
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3713
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3714
  %15 = load i32, i32* %count.addr, align 4, !dbg !3715
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3716
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3716
  %shr = lshr i32 %14, %15, !dbg !3716, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3717
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3718
  %17 = load i32, i32* %count.addr, align 4, !dbg !3719
  %sub23 = sub i32 32, %17, !dbg !3720
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3721
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3721
  %shl = shl i32 %16, %sub23, !dbg !3721, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3722
  %or = or i32 %18, %shl, !dbg !3722
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3722
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3723
  %20 = load i32, i32* %count.addr, align 4, !dbg !3725
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3726
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3726
  %shr24 = lshr i32 %19, %20, !dbg !3726, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3727
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3728

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3729
  %conv28 = zext i8 %21 to i32, !dbg !3729
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3732
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3733

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3734
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3737
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3738

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3739
  store i32 %23, i32* %retval, align 4, !dbg !3740
  br label %return, !dbg !3740

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3741
  br label %return, !dbg !3741

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3742
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3745
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3746

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3747
  %sub40 = sub i32 0, %25, !dbg !3748
  store i32 %sub40, i32* %retval, align 4, !dbg !3749
  br label %return, !dbg !3749

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3750
  br label %return, !dbg !3750

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3751
  br label %return, !dbg !3751

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3753
  ret i32 %26, !dbg !3753
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3754 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3755, metadata !DIExpression()), !dbg !3756
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3757, metadata !DIExpression()), !dbg !3758
  %0 = load i32, i32* %value.addr, align 4, !dbg !3759
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3760
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3761
  ret i32 %call, !dbg !3762
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3763 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3766, metadata !DIExpression()), !dbg !3767
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3768, metadata !DIExpression()), !dbg !3769
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3770, metadata !DIExpression()), !dbg !3771
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3772, metadata !DIExpression()), !dbg !3773
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3774, metadata !DIExpression()), !dbg !3775
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3776, metadata !DIExpression()), !dbg !3777
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3778, metadata !DIExpression()), !dbg !3779
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3780, metadata !DIExpression()), !dbg !3781
  %0 = load i32, i32* %value.addr, align 4, !dbg !3782
  %cmp = icmp slt i32 %0, 0, !dbg !3784
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3785

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3786
  %conv = zext i16 %1 to i32, !dbg !3786
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3787
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3788

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3789
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3790
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3791

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3792
  %conv6 = zext i16 %3 to i32, !dbg !3792
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3793
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3794

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3795
  br label %if.end, !dbg !3797

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3798
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3800
  %cmp9 = icmp slt i32 %4, 0, !dbg !3802
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3803

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3804
  %sub = sub nsw i32 0, %5, !dbg !3806
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3807
  br label %if.end13, !dbg !3808

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3809
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3811
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3812
  %conv14 = zext i16 %7 to i32, !dbg !3812
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3814
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3815

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3816
  %conv18 = zext i16 %8 to i32, !dbg !3816
  %sub19 = sub nsw i32 0, %conv18, !dbg !3818
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3819
  br label %if.end22, !dbg !3820

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3821
  %conv21 = zext i16 %9 to i32, !dbg !3821
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3823
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3824
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3825
  %mul = mul i32 %10, %11, !dbg !3826
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3827
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3828
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3829
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3830
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3831
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3832
  %15 = load i32, i32* %count.addr, align 4, !dbg !3833
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3834
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3834
  %shr = lshr i32 %14, %15, !dbg !3834, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3835
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3836
  %17 = load i32, i32* %count.addr, align 4, !dbg !3837
  %sub23 = sub i32 32, %17, !dbg !3838
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3839
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3839
  %shl = shl i32 %16, %sub23, !dbg !3839, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3840
  %or = or i32 %18, %shl, !dbg !3840
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3840
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3841
  %20 = load i32, i32* %count.addr, align 4, !dbg !3843
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3844
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3844
  %shr24 = lshr i32 %19, %20, !dbg !3844, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3845
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3846

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3847
  %conv28 = zext i8 %21 to i32, !dbg !3847
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3850
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3851

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3852
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3855
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3856

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3857
  store i32 %23, i32* %retval, align 4, !dbg !3858
  br label %return, !dbg !3858

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3859
  br label %return, !dbg !3859

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3860
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3863
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3864

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3865
  %sub40 = sub i32 0, %25, !dbg !3866
  store i32 %sub40, i32* %retval, align 4, !dbg !3867
  br label %return, !dbg !3867

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3868
  br label %return, !dbg !3868

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3869
  br label %return, !dbg !3869

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3871
  ret i32 %26, !dbg !3871
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3872 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3873, metadata !DIExpression()), !dbg !3874
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3875, metadata !DIExpression()), !dbg !3876
  %0 = load i32, i32* %value.addr, align 4, !dbg !3877
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3878
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3879
  ret i32 %call, !dbg !3880
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3881 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3884, metadata !DIExpression()), !dbg !3885
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3886, metadata !DIExpression()), !dbg !3887
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3888, metadata !DIExpression()), !dbg !3889
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3890, metadata !DIExpression()), !dbg !3891
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3892, metadata !DIExpression()), !dbg !3893
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3894, metadata !DIExpression()), !dbg !3895
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3896, metadata !DIExpression()), !dbg !3897
  %0 = load i32, i32* %value.addr, align 4, !dbg !3898
  %cmp = icmp slt i32 %0, 0, !dbg !3900
  br i1 %cmp, label %if.then, label %if.else, !dbg !3901

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3902
  %1 = load i32, i32* %value.addr, align 4, !dbg !3904
  %sub = sub nsw i32 0, %1, !dbg !3905
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3906
  br label %if.end, !dbg !3907

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3908
  %2 = load i32, i32* %value.addr, align 4, !dbg !3910
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3911
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3912
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3913
  %conv = zext i8 %4 to i32, !dbg !3913
  %mul = mul i32 %3, %conv, !dbg !3914
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3915
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3916
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3917
  %conv1 = zext i8 %6 to i32, !dbg !3917
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3918
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3919
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3920
  %8 = load i32, i32* %count.addr, align 4, !dbg !3921
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3922
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3922
  %shr = lshr i32 %7, %8, !dbg !3922, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3923
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3924
  %10 = load i32, i32* %count.addr, align 4, !dbg !3925
  %sub2 = sub i32 32, %10, !dbg !3926
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3927
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3927
  %shl = shl i32 %9, %sub2, !dbg !3927, !klee.check.shift !261
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3928
  %or = or i32 %11, %shl, !dbg !3928
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3928
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3929
  %13 = load i32, i32* %count.addr, align 4, !dbg !3931
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3932
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3932
  %shr3 = lshr i32 %12, %13, !dbg !3932, !klee.check.shift !261
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3933
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3934

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3935
  %conv7 = zext i8 %14 to i32, !dbg !3935
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3938
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3939

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3940
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3943
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3944

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3945
  store i32 %16, i32* %retval, align 4, !dbg !3946
  br label %return, !dbg !3946

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3947
  br label %return, !dbg !3947

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3948
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3951
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3952

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3953
  %sub19 = sub i32 0, %18, !dbg !3955
  store i32 %sub19, i32* %retval, align 4, !dbg !3956
  br label %return, !dbg !3956

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3957
  br label %return, !dbg !3957

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3959
  %conv22 = zext i8 %19 to i32, !dbg !3959
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3962
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3963

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3964
  br label %return, !dbg !3964

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3966
  br label %return, !dbg !3966

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3968
  ret i32 %20, !dbg !3968
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3969 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3970, metadata !DIExpression()), !dbg !3971
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3972, metadata !DIExpression()), !dbg !3973
  %0 = load i8, i8* %value.addr, align 1, !dbg !3974
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3975
  %conv = zext i8 %1 to i16, !dbg !3976
  %conv1 = zext i16 %conv to i32, !dbg !3976
  %shl = shl i32 %conv1, 5, !dbg !3977
  %conv2 = trunc i32 %shl to i16, !dbg !3978
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3979
  ret i8 %call, !dbg !3980
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !3981 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3982, metadata !DIExpression()), !dbg !3983
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3984, metadata !DIExpression()), !dbg !3985
  %0 = load i8, i8* %value.addr, align 1, !dbg !3986
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3987
  %conv = zext i8 %1 to i16, !dbg !3988
  %conv1 = zext i16 %conv to i32, !dbg !3988
  %shl = shl i32 %conv1, 6, !dbg !3989
  %conv2 = trunc i32 %shl to i16, !dbg !3990
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3991
  ret i8 %call, !dbg !3992
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !3993 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3994, metadata !DIExpression()), !dbg !3995
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3996, metadata !DIExpression()), !dbg !3997
  %0 = load i8, i8* %value.addr, align 1, !dbg !3998
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3999
  %conv = zext i8 %1 to i16, !dbg !4000
  %conv1 = zext i16 %conv to i32, !dbg !4000
  %shl = shl i32 %conv1, 7, !dbg !4001
  %conv2 = trunc i32 %shl to i16, !dbg !4002
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4003
  ret i8 %call, !dbg !4004
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4005 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4006, metadata !DIExpression()), !dbg !4007
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4008, metadata !DIExpression()), !dbg !4009
  %0 = load i8, i8* %value.addr, align 1, !dbg !4010
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4011
  %conv = zext i8 %1 to i16, !dbg !4012
  %conv1 = zext i16 %conv to i32, !dbg !4012
  %shl = shl i32 %conv1, 7, !dbg !4013
  %conv2 = trunc i32 %shl to i16, !dbg !4014
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4015
  ret i8 %call, !dbg !4016
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4017 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4018, metadata !DIExpression()), !dbg !4019
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4020, metadata !DIExpression()), !dbg !4021
  %0 = load i8, i8* %value.addr, align 1, !dbg !4022
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4023
  %conv = zext i8 %1 to i16, !dbg !4024
  %conv1 = zext i16 %conv to i32, !dbg !4024
  %shl = shl i32 %conv1, 4, !dbg !4025
  %conv2 = trunc i32 %shl to i16, !dbg !4026
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4027
  ret i8 %call, !dbg !4028
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4029 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4030, metadata !DIExpression()), !dbg !4031
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4032, metadata !DIExpression()), !dbg !4033
  %0 = load i8, i8* %value.addr, align 1, !dbg !4034
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4035
  %conv = zext i8 %1 to i16, !dbg !4036
  %conv1 = zext i16 %conv to i32, !dbg !4036
  %shl = shl i32 %conv1, 5, !dbg !4037
  %conv2 = trunc i32 %shl to i16, !dbg !4038
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4039
  ret i8 %call, !dbg !4040
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4041 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4042, metadata !DIExpression()), !dbg !4043
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4044, metadata !DIExpression()), !dbg !4045
  %0 = load i8, i8* %value.addr, align 1, !dbg !4046
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4047
  %conv = zext i8 %1 to i16, !dbg !4048
  %conv1 = zext i16 %conv to i32, !dbg !4048
  %shl = shl i32 %conv1, 2, !dbg !4049
  %conv2 = trunc i32 %shl to i16, !dbg !4050
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4051
  ret i8 %call, !dbg !4052
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4053 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4054, metadata !DIExpression()), !dbg !4055
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4056, metadata !DIExpression()), !dbg !4057
  %0 = load i8, i8* %value.addr, align 1, !dbg !4058
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4059
  %conv = zext i8 %1 to i16, !dbg !4060
  %conv1 = zext i16 %conv to i32, !dbg !4060
  %shl = shl i32 %conv1, 6, !dbg !4061
  %conv2 = trunc i32 %shl to i16, !dbg !4062
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4063
  ret i8 %call, !dbg !4064
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4065 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4066, metadata !DIExpression()), !dbg !4067
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4068, metadata !DIExpression()), !dbg !4069
  %0 = load i8, i8* %value.addr, align 1, !dbg !4070
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4071
  %conv = zext i8 %1 to i16, !dbg !4072
  %conv1 = zext i16 %conv to i32, !dbg !4072
  %shl = shl i32 %conv1, 3, !dbg !4073
  %conv2 = trunc i32 %shl to i16, !dbg !4074
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4075
  ret i8 %call, !dbg !4076
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4077 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4078, metadata !DIExpression()), !dbg !4079
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4080, metadata !DIExpression()), !dbg !4081
  %0 = load i16, i16* %value.addr, align 2, !dbg !4082
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4083
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4084
  ret i16 %call, !dbg !4085
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4086 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4087, metadata !DIExpression()), !dbg !4088
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4089, metadata !DIExpression()), !dbg !4090
  %0 = load i16, i16* %value.addr, align 2, !dbg !4091
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4092
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4093
  ret i16 %call, !dbg !4094
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4095 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4096, metadata !DIExpression()), !dbg !4097
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4098, metadata !DIExpression()), !dbg !4099
  %0 = load i16, i16* %value.addr, align 2, !dbg !4100
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4101
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4102
  ret i16 %call, !dbg !4103
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4104 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4105, metadata !DIExpression()), !dbg !4106
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4107, metadata !DIExpression()), !dbg !4108
  %0 = load i16, i16* %value.addr, align 2, !dbg !4109
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4110
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4111
  ret i16 %call, !dbg !4112
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4113 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4114, metadata !DIExpression()), !dbg !4115
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4116, metadata !DIExpression()), !dbg !4117
  %0 = load i16, i16* %value.addr, align 2, !dbg !4118
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4119
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4120
  ret i16 %call, !dbg !4121
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4122 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4123, metadata !DIExpression()), !dbg !4124
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4125, metadata !DIExpression()), !dbg !4126
  %0 = load i16, i16* %value.addr, align 2, !dbg !4127
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4128
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4129
  ret i16 %call, !dbg !4130
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4131 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4132, metadata !DIExpression()), !dbg !4133
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4134, metadata !DIExpression()), !dbg !4135
  %0 = load i16, i16* %value.addr, align 2, !dbg !4136
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4137
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4138
  ret i16 %call, !dbg !4139
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4140 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4141, metadata !DIExpression()), !dbg !4142
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4143, metadata !DIExpression()), !dbg !4144
  %0 = load i16, i16* %value.addr, align 2, !dbg !4145
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4146
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4147
  ret i16 %call, !dbg !4148
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4149 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4150, metadata !DIExpression()), !dbg !4151
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4152, metadata !DIExpression()), !dbg !4153
  %0 = load i16, i16* %value.addr, align 2, !dbg !4154
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4155
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4156
  ret i16 %call, !dbg !4157
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4158 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4159, metadata !DIExpression()), !dbg !4160
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4161, metadata !DIExpression()), !dbg !4162
  %0 = load i16, i16* %value.addr, align 2, !dbg !4163
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4164
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4165
  ret i16 %call, !dbg !4166
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4167 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4168, metadata !DIExpression()), !dbg !4169
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4170, metadata !DIExpression()), !dbg !4171
  %0 = load i16, i16* %value.addr, align 2, !dbg !4172
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4173
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4174
  ret i16 %call, !dbg !4175
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4176 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4177, metadata !DIExpression()), !dbg !4178
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4179, metadata !DIExpression()), !dbg !4180
  %0 = load i16, i16* %value.addr, align 2, !dbg !4181
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4182
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4183
  ret i16 %call, !dbg !4184
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4185 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4186, metadata !DIExpression()), !dbg !4187
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4188, metadata !DIExpression()), !dbg !4189
  %0 = load i16, i16* %value.addr, align 2, !dbg !4190
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4191
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4192
  ret i16 %call, !dbg !4193
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4194 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4195, metadata !DIExpression()), !dbg !4196
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4197, metadata !DIExpression()), !dbg !4198
  %0 = load i16, i16* %value.addr, align 2, !dbg !4199
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4200
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4201
  ret i16 %call, !dbg !4202
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4203 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4204, metadata !DIExpression()), !dbg !4205
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4206, metadata !DIExpression()), !dbg !4207
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4208
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4209
  %conv = zext i8 %1 to i16, !dbg !4210
  %conv1 = zext i16 %conv to i32, !dbg !4210
  %shl = shl i32 %conv1, 5, !dbg !4211
  %conv2 = trunc i32 %shl to i16, !dbg !4212
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4213
  ret i16 %call, !dbg !4214
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4215 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4216, metadata !DIExpression()), !dbg !4217
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4218, metadata !DIExpression()), !dbg !4219
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4220
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4221
  %conv = zext i8 %1 to i16, !dbg !4222
  %conv1 = zext i16 %conv to i32, !dbg !4222
  %shl = shl i32 %conv1, 6, !dbg !4223
  %conv2 = trunc i32 %shl to i16, !dbg !4224
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4225
  ret i16 %call, !dbg !4226
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4227 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4228, metadata !DIExpression()), !dbg !4229
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4230, metadata !DIExpression()), !dbg !4231
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4232
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4233
  %conv = zext i8 %1 to i16, !dbg !4234
  %conv1 = zext i16 %conv to i32, !dbg !4234
  %shl = shl i32 %conv1, 7, !dbg !4235
  %conv2 = trunc i32 %shl to i16, !dbg !4236
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4237
  ret i16 %call, !dbg !4238
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4239 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4240, metadata !DIExpression()), !dbg !4241
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4242, metadata !DIExpression()), !dbg !4243
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4244
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4245
  %conv = zext i8 %1 to i16, !dbg !4246
  %conv1 = zext i16 %conv to i32, !dbg !4246
  %shl = shl i32 %conv1, 7, !dbg !4247
  %conv2 = trunc i32 %shl to i16, !dbg !4248
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4249
  ret i16 %call, !dbg !4250
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4251 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4252, metadata !DIExpression()), !dbg !4253
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4254, metadata !DIExpression()), !dbg !4255
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4256
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4257
  %conv = zext i8 %1 to i16, !dbg !4258
  %conv1 = zext i16 %conv to i32, !dbg !4258
  %shl = shl i32 %conv1, 4, !dbg !4259
  %conv2 = trunc i32 %shl to i16, !dbg !4260
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4261
  ret i16 %call, !dbg !4262
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4263 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4264, metadata !DIExpression()), !dbg !4265
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4266, metadata !DIExpression()), !dbg !4267
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4268
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4269
  %conv = zext i8 %1 to i16, !dbg !4270
  %conv1 = zext i16 %conv to i32, !dbg !4270
  %shl = shl i32 %conv1, 5, !dbg !4271
  %conv2 = trunc i32 %shl to i16, !dbg !4272
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4273
  ret i16 %call, !dbg !4274
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4275 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4276, metadata !DIExpression()), !dbg !4277
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4278, metadata !DIExpression()), !dbg !4279
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4280
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4281
  %conv = zext i8 %1 to i16, !dbg !4282
  %conv1 = zext i16 %conv to i32, !dbg !4282
  %shl = shl i32 %conv1, 2, !dbg !4283
  %conv2 = trunc i32 %shl to i16, !dbg !4284
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4285
  ret i16 %call, !dbg !4286
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4287 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4288, metadata !DIExpression()), !dbg !4289
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4290, metadata !DIExpression()), !dbg !4291
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4292
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4293
  %conv = zext i8 %1 to i16, !dbg !4294
  %conv1 = zext i16 %conv to i32, !dbg !4294
  %shl = shl i32 %conv1, 6, !dbg !4295
  %conv2 = trunc i32 %shl to i16, !dbg !4296
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4297
  ret i16 %call, !dbg !4298
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4299 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4300, metadata !DIExpression()), !dbg !4301
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4302, metadata !DIExpression()), !dbg !4303
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4304
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4305
  %conv = zext i8 %1 to i16, !dbg !4306
  %conv1 = zext i16 %conv to i32, !dbg !4306
  %shl = shl i32 %conv1, 3, !dbg !4307
  %conv2 = trunc i32 %shl to i16, !dbg !4308
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4309
  ret i16 %call, !dbg !4310
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4311 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4312, metadata !DIExpression()), !dbg !4313
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4314, metadata !DIExpression()), !dbg !4315
  %0 = load i32, i32* %value.addr, align 4, !dbg !4316
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4317
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4318
  ret i32 %call, !dbg !4319
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4320 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4323, metadata !DIExpression()), !dbg !4324
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4325, metadata !DIExpression()), !dbg !4326
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4327, metadata !DIExpression()), !dbg !4328
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4329, metadata !DIExpression()), !dbg !4330
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4331, metadata !DIExpression()), !dbg !4332
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4333, metadata !DIExpression()), !dbg !4334
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4335, metadata !DIExpression()), !dbg !4336
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4337
  %conv = sext i16 %0 to i32, !dbg !4337
  %cmp = icmp slt i32 %conv, 0, !dbg !4339
  br i1 %cmp, label %if.then, label %if.else, !dbg !4340

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4341
  br label %if.end, !dbg !4343

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4344
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4346
  %conv2 = sext i16 %1 to i32, !dbg !4346
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4348
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4349

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4350
  %conv6 = sext i16 %2 to i32, !dbg !4350
  %sub = sub nsw i32 0, %conv6, !dbg !4352
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4353
  br label %if.end9, !dbg !4354

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4355
  %conv8 = sext i16 %3 to i32, !dbg !4355
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4357
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4358
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4359
  %mul = mul i32 %4, %5, !dbg !4360
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4361
  %6 = load i32, i32* %value.addr, align 4, !dbg !4362
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4363
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4364
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4365
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4366
  %9 = load i32, i32* %count.addr, align 4, !dbg !4367
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4368
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4368
  %shr = lshr i32 %8, %9, !dbg !4368, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4369
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4370
  %11 = load i32, i32* %count.addr, align 4, !dbg !4371
  %sub10 = sub i32 32, %11, !dbg !4372
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4373
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4373
  %shl = shl i32 %10, %sub10, !dbg !4373, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4374
  %or = or i32 %12, %shl, !dbg !4374
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4374
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4375
  %14 = load i32, i32* %count.addr, align 4, !dbg !4377
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4378
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4378
  %shr11 = lshr i32 %13, %14, !dbg !4378, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4379
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4380

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4381
  %conv15 = zext i8 %15 to i32, !dbg !4381
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4384
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4385

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4386
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4389
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4390

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4391
  store i32 %17, i32* %retval, align 4, !dbg !4392
  br label %return, !dbg !4392

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4393
  br label %return, !dbg !4393

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4394
  br label %return, !dbg !4394

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4396
  br label %return, !dbg !4396

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4398
  ret i32 %18, !dbg !4398
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4399 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4400, metadata !DIExpression()), !dbg !4401
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4402, metadata !DIExpression()), !dbg !4403
  %0 = load i32, i32* %value.addr, align 4, !dbg !4404
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4405
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4406
  ret i32 %call, !dbg !4407
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4408 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4411, metadata !DIExpression()), !dbg !4412
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4413, metadata !DIExpression()), !dbg !4414
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4415, metadata !DIExpression()), !dbg !4416
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4417, metadata !DIExpression()), !dbg !4418
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4419, metadata !DIExpression()), !dbg !4420
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4421, metadata !DIExpression()), !dbg !4422
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4423
  %cmp = icmp slt i32 %0, 0, !dbg !4425
  br i1 %cmp, label %if.then, label %if.else, !dbg !4426

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4427
  br label %if.end, !dbg !4429

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4430
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4432
  %cmp1 = icmp slt i32 %1, 0, !dbg !4434
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4435

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4436
  %sub = sub nsw i32 0, %2, !dbg !4438
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4439
  br label %if.end4, !dbg !4440

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4441
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4443
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4444
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4445
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4446
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4447
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4448
  %7 = load i32, i32* %count.addr, align 4, !dbg !4449
  %sub5 = sub i32 %7, 32, !dbg !4450
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4451
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4451
  %shr = lshr i32 %6, %sub5, !dbg !4451, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4452
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4453
  %conv = zext i8 %8 to i32, !dbg !4453
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4455
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4456

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4457
  store i32 %9, i32* %retval, align 4, !dbg !4459
  br label %return, !dbg !4459

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4460
  br label %return, !dbg !4460

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4462
  ret i32 %10, !dbg !4462
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4463 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4464, metadata !DIExpression()), !dbg !4465
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4466, metadata !DIExpression()), !dbg !4467
  %0 = load i32, i32* %value.addr, align 4, !dbg !4468
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4469
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4470
  ret i32 %call, !dbg !4471
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4472 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4475, metadata !DIExpression()), !dbg !4476
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4477, metadata !DIExpression()), !dbg !4478
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4479, metadata !DIExpression()), !dbg !4480
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4481, metadata !DIExpression()), !dbg !4482
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4483, metadata !DIExpression()), !dbg !4484
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4485, metadata !DIExpression()), !dbg !4486
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4487, metadata !DIExpression()), !dbg !4488
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4489
  %conv = sext i8 %0 to i32, !dbg !4489
  %cmp = icmp slt i32 %conv, 0, !dbg !4491
  br i1 %cmp, label %if.then, label %if.else, !dbg !4492

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4493
  br label %if.end, !dbg !4495

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4496
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4498
  %conv2 = sext i8 %1 to i32, !dbg !4498
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4500
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4501

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4502
  %conv6 = sext i8 %2 to i32, !dbg !4502
  %sub = sub nsw i32 0, %conv6, !dbg !4504
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4505
  br label %if.end9, !dbg !4506

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4507
  %conv8 = sext i8 %3 to i32, !dbg !4507
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4509
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4510
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4511
  %mul = mul i32 %4, %5, !dbg !4512
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4513
  %6 = load i32, i32* %value.addr, align 4, !dbg !4514
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4515
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4516
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4517
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4518
  %9 = load i32, i32* %count.addr, align 4, !dbg !4519
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4520
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4520
  %shr = lshr i32 %8, %9, !dbg !4520, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4521
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4522
  %11 = load i32, i32* %count.addr, align 4, !dbg !4523
  %sub10 = sub i32 32, %11, !dbg !4524
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4525
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4525
  %shl = shl i32 %10, %sub10, !dbg !4525, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4526
  %or = or i32 %12, %shl, !dbg !4526
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4526
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4527
  %14 = load i32, i32* %count.addr, align 4, !dbg !4529
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4530
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4530
  %shr11 = lshr i32 %13, %14, !dbg !4530, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4531
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4532

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4533
  %conv15 = zext i8 %15 to i32, !dbg !4533
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4536
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4537

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4538
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4541
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4542

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4543
  store i32 %17, i32* %retval, align 4, !dbg !4544
  br label %return, !dbg !4544

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4545
  br label %return, !dbg !4545

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4546
  br label %return, !dbg !4546

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4548
  br label %return, !dbg !4548

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4550
  ret i32 %18, !dbg !4550
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4551 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4552, metadata !DIExpression()), !dbg !4553
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4554, metadata !DIExpression()), !dbg !4555
  %0 = load i32, i32* %value.addr, align 4, !dbg !4556
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4557
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4558
  ret i32 %call, !dbg !4559
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4560 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4561, metadata !DIExpression()), !dbg !4562
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4563, metadata !DIExpression()), !dbg !4564
  %0 = load i32, i32* %value.addr, align 4, !dbg !4565
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4566
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4567
  ret i32 %call, !dbg !4568
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4569 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4572, metadata !DIExpression()), !dbg !4573
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4574, metadata !DIExpression()), !dbg !4575
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4576, metadata !DIExpression()), !dbg !4577
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4578, metadata !DIExpression()), !dbg !4579
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4580, metadata !DIExpression()), !dbg !4581
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4582, metadata !DIExpression()), !dbg !4583
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4584, metadata !DIExpression()), !dbg !4585
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4586, metadata !DIExpression()), !dbg !4587
  %0 = load i32, i32* %value.addr, align 4, !dbg !4588
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4589
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4590
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4591
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4592
  %3 = load i32, i32* %count.addr, align 4, !dbg !4593
  %sub = sub i32 %3, 32, !dbg !4594
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4595
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4595
  %shr = lshr i32 %2, %sub, !dbg !4595, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4596
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4597
  ret i32 %4, !dbg !4598
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4599 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4600, metadata !DIExpression()), !dbg !4601
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4602, metadata !DIExpression()), !dbg !4603
  %0 = load i32, i32* %value.addr, align 4, !dbg !4604
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4605
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4606
  ret i32 %call, !dbg !4607
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4608 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4611, metadata !DIExpression()), !dbg !4612
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4613, metadata !DIExpression()), !dbg !4614
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4615, metadata !DIExpression()), !dbg !4616
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4617, metadata !DIExpression()), !dbg !4618
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4619, metadata !DIExpression()), !dbg !4620
  %0 = load i32, i32* %value.addr, align 4, !dbg !4621
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4622
  %conv = zext i8 %1 to i32, !dbg !4622
  %mul = mul i32 %0, %conv, !dbg !4623
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4624
  %2 = load i32, i32* %value.addr, align 4, !dbg !4625
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4626
  %conv1 = zext i8 %3 to i32, !dbg !4626
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4627
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4628
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4629
  %5 = load i32, i32* %count.addr, align 4, !dbg !4630
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4631
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4631
  %shr = lshr i32 %4, %5, !dbg !4631, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4632
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4633
  %7 = load i32, i32* %count.addr, align 4, !dbg !4634
  %sub = sub i32 32, %7, !dbg !4635
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4636
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4636
  %shl = shl i32 %6, %sub, !dbg !4636, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4637
  %or = or i32 %8, %shl, !dbg !4637
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4637
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4638
  %10 = load i32, i32* %count.addr, align 4, !dbg !4640
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4641
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4641
  %shr2 = lshr i32 %9, %10, !dbg !4641, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !4642
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4643

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4644
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4647
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4648

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4649
  store i32 %12, i32* %retval, align 4, !dbg !4650
  br label %return, !dbg !4650

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4651
  br label %return, !dbg !4651

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4652
  br label %return, !dbg !4652

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4654
  ret i32 %13, !dbg !4654
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4655 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4656, metadata !DIExpression()), !dbg !4657
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4658, metadata !DIExpression()), !dbg !4659
  %0 = load i8, i8* %value.addr, align 1, !dbg !4660
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4661
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4662
  ret i8 %call, !dbg !4663
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4664 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4665, metadata !DIExpression()), !dbg !4666
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4667, metadata !DIExpression()), !dbg !4668
  %0 = load i8, i8* %value.addr, align 1, !dbg !4669
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4670
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4671
  ret i8 %call, !dbg !4672
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4673 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4674, metadata !DIExpression()), !dbg !4675
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4676, metadata !DIExpression()), !dbg !4677
  %0 = load i8, i8* %value.addr, align 1, !dbg !4678
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4679
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4680
  ret i8 %call, !dbg !4681
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4682 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4683, metadata !DIExpression()), !dbg !4684
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4685, metadata !DIExpression()), !dbg !4686
  %0 = load i8, i8* %value.addr, align 1, !dbg !4687
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4688
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4689
  ret i8 %call, !dbg !4690
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4691 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4692, metadata !DIExpression()), !dbg !4693
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4694, metadata !DIExpression()), !dbg !4695
  %0 = load i8, i8* %value.addr, align 1, !dbg !4696
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4697
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4698
  ret i8 %call, !dbg !4699
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4700 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4701, metadata !DIExpression()), !dbg !4702
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4703, metadata !DIExpression()), !dbg !4704
  %0 = load i8, i8* %value.addr, align 1, !dbg !4705
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4706
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4707
  ret i8 %call, !dbg !4708
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4709 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4712, metadata !DIExpression()), !dbg !4713
  %0 = load i8, i8* %value.addr, align 1, !dbg !4714
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4715
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4716
  ret i8 %call, !dbg !4717
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4718 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4719, metadata !DIExpression()), !dbg !4720
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4721, metadata !DIExpression()), !dbg !4722
  %0 = load i8, i8* %value.addr, align 1, !dbg !4723
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4724
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4725
  ret i8 %call, !dbg !4726
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4727 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4728, metadata !DIExpression()), !dbg !4729
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4730, metadata !DIExpression()), !dbg !4731
  %0 = load i8, i8* %value.addr, align 1, !dbg !4732
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4733
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4734
  ret i8 %call, !dbg !4735
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4736 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4738, metadata !DIExpression()), !dbg !4739
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4740, metadata !DIExpression()), !dbg !4741
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4742, metadata !DIExpression()), !dbg !4743
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4744, metadata !DIExpression()), !dbg !4745
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4746, metadata !DIExpression()), !dbg !4747
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4748, metadata !DIExpression()), !dbg !4749
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4750, metadata !DIExpression()), !dbg !4751
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4752, metadata !DIExpression()), !dbg !4753
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4754, metadata !DIExpression()), !dbg !4755
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4756, metadata !DIExpression()), !dbg !4757
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4758, metadata !DIExpression()), !dbg !4759
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4760, metadata !DIExpression()), !dbg !4761
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4762
  %and = and i32 %0, 65535, !dbg !4763
  %conv = trunc i32 %and to i16, !dbg !4762
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4764
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4765
  %and1 = and i32 %1, -65536, !dbg !4766
  %shr = lshr i32 %and1, 16, !dbg !4767
  %conv2 = trunc i32 %shr to i16, !dbg !4768
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4769
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4770
  %and3 = and i32 %2, 65535, !dbg !4771
  %conv4 = trunc i32 %and3 to i16, !dbg !4770
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4772
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4773
  %and5 = and i32 %3, -65536, !dbg !4774
  %shr6 = lshr i32 %and5, 16, !dbg !4775
  %conv7 = trunc i32 %shr6 to i16, !dbg !4776
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4777
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4778
  %conv8 = zext i16 %4 to i32, !dbg !4780
  %conv9 = sext i32 %conv8 to i64, !dbg !4781
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4782
  %conv10 = zext i16 %5 to i32, !dbg !4783
  %conv11 = sext i32 %conv10 to i64, !dbg !4784
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4785
  %tobool = icmp ne i32 %call, 0, !dbg !4785
  br i1 %tobool, label %if.end, label %if.then, !dbg !4786

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0), i32 51, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !4787
  unreachable, !dbg !4787

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4789
  %conv12 = zext i16 %6 to i32, !dbg !4790
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4791
  %conv13 = zext i16 %7 to i32, !dbg !4792
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4793
  %conv14 = sext i32 %mul to i64, !dbg !4794
  store volatile i64 %conv14, i64* @klee_alarm_sink_s64, align 8, !dbg !4795
  ret i32 0, !dbg !4796
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4797 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4800, metadata !DIExpression()), !dbg !4801
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4802, metadata !DIExpression()), !dbg !4803
  %0 = load i64, i64* %left.addr, align 8, !dbg !4804
  %1 = load i64, i64* %right.addr, align 8, !dbg !4805
  %mul = mul nsw i64 %0, %1, !dbg !4806
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4807
  %conv = zext i1 %cmp to i32, !dbg !4807
  ret i32 %conv, !dbg !4808
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4809 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4810, metadata !DIExpression()), !dbg !4811
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4812, metadata !DIExpression()), !dbg !4813
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4814, metadata !DIExpression()), !dbg !4815
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4816, metadata !DIExpression()), !dbg !4817
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4818, metadata !DIExpression()), !dbg !4819
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4820, metadata !DIExpression()), !dbg !4821
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4822, metadata !DIExpression()), !dbg !4823
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4824, metadata !DIExpression()), !dbg !4825
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4826, metadata !DIExpression()), !dbg !4827
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4828, metadata !DIExpression()), !dbg !4829
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4830, metadata !DIExpression()), !dbg !4831
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4832, metadata !DIExpression()), !dbg !4833
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4834
  %and = and i32 %0, 65535, !dbg !4835
  %conv = trunc i32 %and to i16, !dbg !4834
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4836
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4837
  %and1 = and i32 %1, -65536, !dbg !4838
  %shr = lshr i32 %and1, 16, !dbg !4839
  %conv2 = trunc i32 %shr to i16, !dbg !4840
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4841
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4842
  %and3 = and i32 %2, 65535, !dbg !4843
  %conv4 = trunc i32 %and3 to i16, !dbg !4842
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4844
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4845
  %and5 = and i32 %3, -65536, !dbg !4846
  %shr6 = lshr i32 %and5, 16, !dbg !4847
  %conv7 = trunc i32 %shr6 to i16, !dbg !4848
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4849
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4850
  %conv8 = zext i16 %4 to i32, !dbg !4850
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4851
  %conv9 = zext i16 %5 to i32, !dbg !4851
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4852
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4853
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4854
  %conv10 = zext i16 %6 to i32, !dbg !4854
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4855
  %conv11 = zext i16 %7 to i32, !dbg !4855
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4856
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4857
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4858
  %conv13 = zext i16 %8 to i32, !dbg !4858
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4859
  %conv14 = zext i16 %9 to i32, !dbg !4859
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4860
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4861
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4862
  %conv16 = zext i16 %10 to i32, !dbg !4862
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4863
  %conv17 = zext i16 %11 to i32, !dbg !4863
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4864
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4865
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4866
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4867
  %and19 = and i32 %13, 65535, !dbg !4868
  %shl = shl i32 %and19, 16, !dbg !4869
  %add = add i32 %12, %shl, !dbg !4870
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4871
  %and20 = and i32 %14, 65535, !dbg !4872
  %shl21 = shl i32 %and20, 16, !dbg !4873
  %add22 = add i32 %add, %shl21, !dbg !4874
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4875
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4876
  ret i32 %15, !dbg !4877
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4878 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4884, metadata !DIExpression()), !dbg !4885
  %2 = icmp eq i64 %0, 0, !dbg !4886
  br i1 %2, label %3, label %4, !dbg !4888

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.5, i64 0, i64 0)) #6, !dbg !4889
  unreachable, !dbg !4889

4:                                                ; preds = %1
  ret void, !dbg !4890
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4891 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4897, metadata !DIExpression()), !dbg !4899
  call void @llvm.dbg.value(metadata i64 %1, metadata !4898, metadata !DIExpression()), !dbg !4899
  %3 = icmp ult i64 %1, %0, !dbg !4900
  br i1 %3, label %5, label %4, !dbg !4902

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.10, i64 0, i64 0)) #6, !dbg !4903
  unreachable, !dbg !4903

5:                                                ; preds = %2
  ret void, !dbg !4905
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!15, !17, !2, !38, !40}
!llvm.ident = !{!42, !42, !42, !43, !43}
!llvm.module.flags = !{!44, !45, !46, !47, !48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !13, line: 21, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/MulHword_alarm_0107.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!0}
!13 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!14 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107/mul_Ccode_alarm_0107.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!19 = !{!20, !25, !29, !34, !6}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !21, line: 7, baseType: !22)
!21 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !7, line: 24, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !9, line: 37, baseType: !24)
!24 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !21, line: 9, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !7, line: 25, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !9, line: 39, baseType: !28)
!28 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !21, line: 6, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !31, line: 24, baseType: !32)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 38, baseType: !33)
!33 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !21, line: 8, baseType: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !31, line: 25, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 40, baseType: !37)
!37 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
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
!49 = distinct !DISubprogram(name: "main", scope: !50, file: !50, line: 7, type: !51, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !15, retainedNodes: !4)
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!51 = !DISubroutineType(types: !52)
!52 = !{!11}
!53 = !DILocalVariable(name: "val1", scope: !49, file: !50, line: 9, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
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
!71 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !72, file: !72, line: 43, type: !73, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!72 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!73 = !DISubroutineType(types: !74)
!74 = !{!20, !20, !34}
!75 = !DILocalVariable(name: "value", arg: 1, scope: !71, file: !72, line: 43, type: !20)
!76 = !DILocation(line: 43, column: 35, scope: !71)
!77 = !DILocalVariable(name: "factor", arg: 2, scope: !71, file: !72, line: 43, type: !34)
!78 = !DILocation(line: 43, column: 46, scope: !71)
!79 = !DILocalVariable(name: "s32MulTemp1", scope: !71, file: !72, line: 45, type: !80)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !21, line: 11, baseType: !54)
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
!111 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !72, file: !72, line: 77, type: !73, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!112 = !DILocalVariable(name: "value", arg: 1, scope: !111, file: !72, line: 77, type: !20)
!113 = !DILocation(line: 77, column: 38, scope: !111)
!114 = !DILocalVariable(name: "factor", arg: 2, scope: !111, file: !72, line: 77, type: !34)
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
!158 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !72, file: !72, line: 123, type: !159, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!159 = !DISubroutineType(types: !160)
!160 = !{!20, !20, !29}
!161 = !DILocalVariable(name: "value", arg: 1, scope: !158, file: !72, line: 123, type: !20)
!162 = !DILocation(line: 123, column: 25, scope: !158)
!163 = !DILocalVariable(name: "factor", arg: 2, scope: !158, file: !72, line: 123, type: !29)
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
!196 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !72, file: !72, line: 155, type: !159, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!197 = !DILocalVariable(name: "value", arg: 1, scope: !196, file: !72, line: 155, type: !20)
!198 = !DILocation(line: 155, column: 25, scope: !196)
!199 = !DILocalVariable(name: "factor", arg: 2, scope: !196, file: !72, line: 155, type: !29)
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
!243 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !72, file: !72, line: 200, type: !244, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!244 = !DISubroutineType(types: !245)
!245 = !{!25, !25, !25, !80}
!246 = !DILocalVariable(name: "value", arg: 1, scope: !243, file: !72, line: 200, type: !25)
!247 = !DILocation(line: 200, column: 40, scope: !243)
!248 = !DILocalVariable(name: "factor", arg: 2, scope: !243, file: !72, line: 200, type: !25)
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
!265 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !72, file: !72, line: 223, type: !244, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!266 = !DILocalVariable(name: "value", arg: 1, scope: !265, file: !72, line: 223, type: !25)
!267 = !DILocation(line: 223, column: 43, scope: !265)
!268 = !DILocalVariable(name: "factor", arg: 2, scope: !265, file: !72, line: 223, type: !25)
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
!300 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !72, file: !72, line: 262, type: !301, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!301 = !DISubroutineType(types: !302)
!302 = !{!25, !25, !25}
!303 = !DILocalVariable(name: "value", arg: 1, scope: !300, file: !72, line: 262, type: !25)
!304 = !DILocation(line: 262, column: 30, scope: !300)
!305 = !DILocalVariable(name: "factor", arg: 2, scope: !300, file: !72, line: 262, type: !25)
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
!342 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !72, file: !72, line: 304, type: !301, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!343 = !DILocalVariable(name: "value", arg: 1, scope: !342, file: !72, line: 304, type: !25)
!344 = !DILocation(line: 304, column: 30, scope: !342)
!345 = !DILocalVariable(name: "factor", arg: 2, scope: !342, file: !72, line: 304, type: !25)
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
!389 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !72, file: !72, line: 350, type: !390, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!390 = !DISubroutineType(types: !391)
!391 = !{!25, !25, !34}
!392 = !DILocalVariable(name: "value", arg: 1, scope: !389, file: !72, line: 350, type: !25)
!393 = !DILocation(line: 350, column: 39, scope: !389)
!394 = !DILocalVariable(name: "factor", arg: 2, scope: !389, file: !72, line: 350, type: !34)
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
!427 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !72, file: !72, line: 386, type: !390, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!428 = !DILocalVariable(name: "value", arg: 1, scope: !427, file: !72, line: 386, type: !25)
!429 = !DILocation(line: 386, column: 42, scope: !427)
!430 = !DILocalVariable(name: "factor", arg: 2, scope: !427, file: !72, line: 386, type: !34)
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
!474 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !72, file: !72, line: 436, type: !475, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!475 = !DISubroutineType(types: !476)
!476 = !{!25, !25, !29}
!477 = !DILocalVariable(name: "value", arg: 1, scope: !474, file: !72, line: 436, type: !25)
!478 = !DILocation(line: 436, column: 29, scope: !474)
!479 = !DILocalVariable(name: "factor", arg: 2, scope: !474, file: !72, line: 436, type: !29)
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
!510 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !72, file: !72, line: 473, type: !475, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!511 = !DILocalVariable(name: "value", arg: 1, scope: !510, file: !72, line: 473, type: !25)
!512 = !DILocation(line: 473, column: 29, scope: !510)
!513 = !DILocalVariable(name: "factor", arg: 2, scope: !510, file: !72, line: 473, type: !29)
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
!557 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !72, file: !72, line: 521, type: !390, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!558 = !DILocalVariable(name: "value", arg: 1, scope: !557, file: !72, line: 521, type: !25)
!559 = !DILocation(line: 521, column: 25, scope: !557)
!560 = !DILocalVariable(name: "factor", arg: 2, scope: !557, file: !72, line: 521, type: !34)
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
!586 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !72, file: !72, line: 556, type: !587, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!587 = !DISubroutineType(types: !588)
!588 = !{!25, !25, !34, !80}
!589 = !DILocalVariable(name: "value", arg: 1, scope: !586, file: !72, line: 556, type: !25)
!590 = !DILocation(line: 556, column: 40, scope: !586)
!591 = !DILocalVariable(name: "factor", arg: 2, scope: !586, file: !72, line: 556, type: !34)
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
!608 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !72, file: !72, line: 580, type: !609, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!609 = !DISubroutineType(types: !610)
!610 = !{!25, !25, !34, !34}
!611 = !DILocalVariable(name: "value", arg: 1, scope: !608, file: !72, line: 580, type: !25)
!612 = !DILocation(line: 580, column: 43, scope: !608)
!613 = !DILocalVariable(name: "factor", arg: 2, scope: !608, file: !72, line: 580, type: !34)
!614 = !DILocation(line: 580, column: 53, scope: !608)
!615 = !DILocalVariable(name: "count", arg: 3, scope: !608, file: !72, line: 580, type: !34)
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
!645 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !72, file: !72, line: 617, type: !390, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!646 = !DILocalVariable(name: "value", arg: 1, scope: !645, file: !72, line: 617, type: !25)
!647 = !DILocation(line: 617, column: 31, scope: !645)
!648 = !DILocalVariable(name: "factor", arg: 2, scope: !645, file: !72, line: 617, type: !34)
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
!681 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !72, file: !72, line: 654, type: !390, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!682 = !DILocalVariable(name: "value", arg: 1, scope: !681, file: !72, line: 654, type: !25)
!683 = !DILocation(line: 654, column: 31, scope: !681)
!684 = !DILocalVariable(name: "factor", arg: 2, scope: !681, file: !72, line: 654, type: !34)
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
!728 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !72, file: !72, line: 704, type: !729, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!729 = !DISubroutineType(types: !730)
!730 = !{!25, !34, !34}
!731 = !DILocalVariable(name: "value", arg: 1, scope: !728, file: !72, line: 704, type: !34)
!732 = !DILocation(line: 704, column: 33, scope: !728)
!733 = !DILocalVariable(name: "factor", arg: 2, scope: !728, file: !72, line: 704, type: !34)
!734 = !DILocation(line: 704, column: 44, scope: !728)
!735 = !DILocalVariable(name: "u32MulTemp", scope: !728, file: !72, line: 706, type: !736)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !21, line: 10, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !31, line: 26, baseType: !738)
!738 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !739)
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
!759 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !72, file: !72, line: 732, type: !760, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!760 = !DISubroutineType(types: !761)
!761 = !{!80, !25, !34}
!762 = !DILocalVariable(name: "value", arg: 1, scope: !759, file: !72, line: 732, type: !25)
!763 = !DILocation(line: 732, column: 25, scope: !759)
!764 = !DILocalVariable(name: "factor", arg: 2, scope: !759, file: !72, line: 732, type: !34)
!765 = !DILocation(line: 732, column: 36, scope: !759)
!766 = !DILocalVariable(name: "s32MulTemp", scope: !759, file: !72, line: 734, type: !80)
!767 = !DILocation(line: 734, column: 6, scope: !759)
!768 = !DILocation(line: 735, column: 15, scope: !759)
!769 = !DILocation(line: 735, column: 23, scope: !759)
!770 = !DILocation(line: 735, column: 21, scope: !759)
!771 = !DILocation(line: 735, column: 13, scope: !759)
!772 = !DILocation(line: 736, column: 9, scope: !759)
!773 = !DILocation(line: 736, column: 2, scope: !759)
!774 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !72, file: !72, line: 752, type: !775, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!775 = !DISubroutineType(types: !776)
!776 = !{!80, !80, !34}
!777 = !DILocalVariable(name: "value", arg: 1, scope: !774, file: !72, line: 752, type: !80)
!778 = !DILocation(line: 752, column: 25, scope: !774)
!779 = !DILocalVariable(name: "factor", arg: 2, scope: !774, file: !72, line: 752, type: !34)
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
!832 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !72, file: !72, line: 802, type: !833, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!833 = !DISubroutineType(types: !834)
!834 = !{!29, !29, !29, !34}
!835 = !DILocalVariable(name: "value", arg: 1, scope: !832, file: !72, line: 802, type: !29)
!836 = !DILocation(line: 802, column: 35, scope: !832)
!837 = !DILocalVariable(name: "factor", arg: 2, scope: !832, file: !72, line: 802, type: !29)
!838 = !DILocation(line: 802, column: 44, scope: !832)
!839 = !DILocalVariable(name: "count", arg: 3, scope: !832, file: !72, line: 802, type: !34)
!840 = !DILocation(line: 802, column: 55, scope: !832)
!841 = !DILocalVariable(name: "u16MulTemp", scope: !832, file: !72, line: 804, type: !34)
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
!854 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !72, file: !72, line: 824, type: !855, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!855 = !DISubroutineType(types: !856)
!856 = !{!29, !29, !29, !29}
!857 = !DILocalVariable(name: "value", arg: 1, scope: !854, file: !72, line: 824, type: !29)
!858 = !DILocation(line: 824, column: 38, scope: !854)
!859 = !DILocalVariable(name: "factor", arg: 2, scope: !854, file: !72, line: 824, type: !29)
!860 = !DILocation(line: 824, column: 47, scope: !854)
!861 = !DILocalVariable(name: "count", arg: 3, scope: !854, file: !72, line: 824, type: !29)
!862 = !DILocation(line: 824, column: 57, scope: !854)
!863 = !DILocalVariable(name: "u16MulTemp", scope: !854, file: !72, line: 826, type: !34)
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
!884 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !72, file: !72, line: 854, type: !885, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!885 = !DISubroutineType(types: !886)
!886 = !{!29, !29, !29}
!887 = !DILocalVariable(name: "x_value", arg: 1, scope: !884, file: !72, line: 854, type: !29)
!888 = !DILocation(line: 854, column: 25, scope: !884)
!889 = !DILocalVariable(name: "y_value", arg: 2, scope: !884, file: !72, line: 854, type: !29)
!890 = !DILocation(line: 854, column: 36, scope: !884)
!891 = !DILocalVariable(name: "u16MulTemp", scope: !884, file: !72, line: 856, type: !34)
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
!903 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !72, file: !72, line: 878, type: !885, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!904 = !DILocalVariable(name: "value", arg: 1, scope: !903, file: !72, line: 878, type: !29)
!905 = !DILocation(line: 878, column: 26, scope: !903)
!906 = !DILocalVariable(name: "factor", arg: 2, scope: !903, file: !72, line: 878, type: !29)
!907 = !DILocation(line: 878, column: 36, scope: !903)
!908 = !DILocalVariable(name: "u16MulTemp", scope: !903, file: !72, line: 880, type: !34)
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
!928 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !72, file: !72, line: 907, type: !929, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!929 = !DISubroutineType(types: !930)
!930 = !{!34, !34, !34}
!931 = !DILocalVariable(name: "value", arg: 1, scope: !928, file: !72, line: 907, type: !34)
!932 = !DILocation(line: 907, column: 39, scope: !928)
!933 = !DILocalVariable(name: "factor", arg: 2, scope: !928, file: !72, line: 907, type: !34)
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
!947 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !72, file: !72, line: 931, type: !929, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!948 = !DILocalVariable(name: "value", arg: 1, scope: !947, file: !72, line: 931, type: !34)
!949 = !DILocation(line: 931, column: 43, scope: !947)
!950 = !DILocalVariable(name: "factor", arg: 2, scope: !947, file: !72, line: 931, type: !34)
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
!973 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !72, file: !72, line: 962, type: !974, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!974 = !DISubroutineType(types: !975)
!975 = !{!34, !34, !29}
!976 = !DILocalVariable(name: "x_value", arg: 1, scope: !973, file: !72, line: 962, type: !34)
!977 = !DILocation(line: 962, column: 29, scope: !973)
!978 = !DILocalVariable(name: "y_value", arg: 2, scope: !973, file: !72, line: 962, type: !29)
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
!992 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !72, file: !72, line: 986, type: !974, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!993 = !DILocalVariable(name: "x_value", arg: 1, scope: !992, file: !72, line: 986, type: !34)
!994 = !DILocation(line: 986, column: 29, scope: !992)
!995 = !DILocalVariable(name: "y_value", arg: 2, scope: !992, file: !72, line: 986, type: !29)
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
!1018 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !72, file: !72, line: 1015, type: !1019, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!34, !34, !34, !736}
!1021 = !DILocalVariable(name: "value", arg: 1, scope: !1018, file: !72, line: 1015, type: !34)
!1022 = !DILocation(line: 1015, column: 40, scope: !1018)
!1023 = !DILocalVariable(name: "factor", arg: 2, scope: !1018, file: !72, line: 1015, type: !34)
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
!1041 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !72, file: !72, line: 1038, type: !1042, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!34, !34, !34, !34}
!1044 = !DILocalVariable(name: "value", arg: 1, scope: !1041, file: !72, line: 1038, type: !34)
!1045 = !DILocation(line: 1038, column: 43, scope: !1041)
!1046 = !DILocalVariable(name: "factor", arg: 2, scope: !1041, file: !72, line: 1038, type: !34)
!1047 = !DILocation(line: 1038, column: 53, scope: !1041)
!1048 = !DILocalVariable(name: "count", arg: 3, scope: !1041, file: !72, line: 1038, type: !34)
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
!1072 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !72, file: !72, line: 1067, type: !929, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1073 = !DILocalVariable(name: "x_value", arg: 1, scope: !1072, file: !72, line: 1067, type: !34)
!1074 = !DILocation(line: 1067, column: 30, scope: !1072)
!1075 = !DILocalVariable(name: "y_value", arg: 2, scope: !1072, file: !72, line: 1067, type: !34)
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
!1090 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !72, file: !72, line: 1091, type: !929, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1091 = !DILocalVariable(name: "x_value", arg: 1, scope: !1090, file: !72, line: 1091, type: !34)
!1092 = !DILocation(line: 1091, column: 30, scope: !1090)
!1093 = !DILocalVariable(name: "y_value", arg: 2, scope: !1090, file: !72, line: 1091, type: !34)
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
!1116 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !72, file: !72, line: 1119, type: !1117, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1117 = !DISubroutineType(types: !1118)
!1118 = !{!736, !736, !34}
!1119 = !DILocalVariable(name: "x_value", arg: 1, scope: !1116, file: !72, line: 1119, type: !736)
!1120 = !DILocation(line: 1119, column: 26, scope: !1116)
!1121 = !DILocalVariable(name: "y_value", arg: 2, scope: !1116, file: !72, line: 1119, type: !34)
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
!1148 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !72, file: !72, line: 1157, type: !1149, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!736, !736, !34, !736}
!1151 = !DILocalVariable(name: "value", arg: 1, scope: !1148, file: !72, line: 1157, type: !736)
!1152 = !DILocation(line: 1157, column: 40, scope: !1148)
!1153 = !DILocalVariable(name: "factor", arg: 2, scope: !1148, file: !72, line: 1157, type: !34)
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
!1190 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !72, file: !72, line: 1188, type: !1191, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!29, !29, !29, !20}
!1193 = !DILocalVariable(name: "val1", arg: 1, scope: !1190, file: !72, line: 1188, type: !29)
!1194 = !DILocation(line: 1188, column: 25, scope: !1190)
!1195 = !DILocalVariable(name: "val2", arg: 2, scope: !1190, file: !72, line: 1188, type: !29)
!1196 = !DILocation(line: 1188, column: 34, scope: !1190)
!1197 = !DILocalVariable(name: "factor", arg: 3, scope: !1190, file: !72, line: 1188, type: !20)
!1198 = !DILocation(line: 1188, column: 43, scope: !1190)
!1199 = !DILocalVariable(name: "s16Temp1", scope: !1190, file: !72, line: 1190, type: !25)
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
!1229 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !72, file: !72, line: 1224, type: !1230, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1230 = !DISubroutineType(types: !1231)
!1231 = !{!34, !34, !34, !20}
!1232 = !DILocalVariable(name: "val1", arg: 1, scope: !1229, file: !72, line: 1224, type: !34)
!1233 = !DILocation(line: 1224, column: 30, scope: !1229)
!1234 = !DILocalVariable(name: "val2", arg: 2, scope: !1229, file: !72, line: 1224, type: !34)
!1235 = !DILocation(line: 1224, column: 40, scope: !1229)
!1236 = !DILocalVariable(name: "factor", arg: 3, scope: !1229, file: !72, line: 1224, type: !20)
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
!1267 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !72, file: !72, line: 1259, type: !929, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1268 = !DILocalVariable(name: "val1", arg: 1, scope: !1267, file: !72, line: 1259, type: !34)
!1269 = !DILocation(line: 1259, column: 26, scope: !1267)
!1270 = !DILocalVariable(name: "val2", arg: 2, scope: !1267, file: !72, line: 1259, type: !34)
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
!1290 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !72, file: !72, line: 1285, type: !1291, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1291 = !DISubroutineType(types: !1292)
!1292 = !{!736, !34, !34}
!1293 = !DILocalVariable(name: "x_value", arg: 1, scope: !1290, file: !72, line: 1285, type: !34)
!1294 = !DILocation(line: 1285, column: 25, scope: !1290)
!1295 = !DILocalVariable(name: "y_value", arg: 2, scope: !1290, file: !72, line: 1285, type: !34)
!1296 = !DILocation(line: 1285, column: 38, scope: !1290)
!1297 = !DILocalVariable(name: "u32Temp1", scope: !1290, file: !72, line: 1287, type: !736)
!1298 = !DILocation(line: 1287, column: 6, scope: !1290)
!1299 = !DILocation(line: 1288, column: 13, scope: !1290)
!1300 = !DILocation(line: 1288, column: 23, scope: !1290)
!1301 = !DILocation(line: 1288, column: 21, scope: !1290)
!1302 = !DILocation(line: 1288, column: 11, scope: !1290)
!1303 = !DILocation(line: 1289, column: 9, scope: !1290)
!1304 = !DILocation(line: 1289, column: 2, scope: !1290)
!1305 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !72, file: !72, line: 1307, type: !1306, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1306 = !DISubroutineType(types: !1307)
!1307 = !{!80, !25, !25}
!1308 = !DILocalVariable(name: "x_value", arg: 1, scope: !1305, file: !72, line: 1307, type: !25)
!1309 = !DILocation(line: 1307, column: 25, scope: !1305)
!1310 = !DILocalVariable(name: "y_value", arg: 2, scope: !1305, file: !72, line: 1307, type: !25)
!1311 = !DILocation(line: 1307, column: 38, scope: !1305)
!1312 = !DILocalVariable(name: "s32Temp1", scope: !1305, file: !72, line: 1309, type: !80)
!1313 = !DILocation(line: 1309, column: 6, scope: !1305)
!1314 = !DILocation(line: 1310, column: 13, scope: !1305)
!1315 = !DILocation(line: 1310, column: 23, scope: !1305)
!1316 = !DILocation(line: 1310, column: 21, scope: !1305)
!1317 = !DILocation(line: 1310, column: 11, scope: !1305)
!1318 = !DILocation(line: 1311, column: 9, scope: !1305)
!1319 = !DILocation(line: 1311, column: 2, scope: !1305)
!1320 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !72, file: !72, line: 1328, type: !1321, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1352 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !72, file: !72, line: 1362, type: !1353, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1365 = !DILocalVariable(name: "u8SignBit", scope: !1352, file: !72, line: 1365, type: !29)
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
!1411 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !72, file: !72, line: 1455, type: !1412, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1443 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !72, file: !72, line: 1501, type: !1117, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1444 = !DILocalVariable(name: "value", arg: 1, scope: !1443, file: !72, line: 1501, type: !736)
!1445 = !DILocation(line: 1501, column: 30, scope: !1443)
!1446 = !DILocalVariable(name: "factor", arg: 2, scope: !1443, file: !72, line: 1501, type: !34)
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
!1468 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !72, file: !72, line: 1527, type: !1117, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1469 = !DILocalVariable(name: "value", arg: 1, scope: !1468, file: !72, line: 1527, type: !736)
!1470 = !DILocation(line: 1527, column: 30, scope: !1468)
!1471 = !DILocalVariable(name: "factor", arg: 2, scope: !1468, file: !72, line: 1527, type: !34)
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
!1502 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !72, file: !72, line: 1560, type: !1503, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1503 = !DISubroutineType(types: !1504)
!1504 = !{!736, !736, !25}
!1505 = !DILocalVariable(name: "value", arg: 1, scope: !1502, file: !72, line: 1560, type: !736)
!1506 = !DILocation(line: 1560, column: 30, scope: !1502)
!1507 = !DILocalVariable(name: "factor", arg: 2, scope: !1502, file: !72, line: 1560, type: !25)
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
!1537 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !72, file: !72, line: 1595, type: !1503, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1538 = !DILocalVariable(name: "value", arg: 1, scope: !1537, file: !72, line: 1595, type: !736)
!1539 = !DILocation(line: 1595, column: 31, scope: !1537)
!1540 = !DILocalVariable(name: "factor", arg: 2, scope: !1537, file: !72, line: 1595, type: !25)
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
!1578 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !72, file: !72, line: 1632, type: !1412, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1579 = !DILocalVariable(name: "value", arg: 1, scope: !1578, file: !72, line: 1632, type: !736)
!1580 = !DILocation(line: 1632, column: 30, scope: !1578)
!1581 = !DILocalVariable(name: "factor", arg: 2, scope: !1578, file: !72, line: 1632, type: !736)
!1582 = !DILocation(line: 1632, column: 40, scope: !1578)
!1583 = !DILocation(line: 1634, column: 21, scope: !1578)
!1584 = !DILocation(line: 1634, column: 28, scope: !1578)
!1585 = !DILocation(line: 1634, column: 9, scope: !1578)
!1586 = !DILocation(line: 1634, column: 2, scope: !1578)
!1587 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !72, file: !72, line: 1653, type: !1412, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1621 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !72, file: !72, line: 1686, type: !1321, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1654 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !72, file: !72, line: 1720, type: !1321, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1695 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !72, file: !72, line: 1757, type: !1696, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!1753 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !72, file: !72, line: 1810, type: !775, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1754 = !DILocalVariable(name: "val1", arg: 1, scope: !1753, file: !72, line: 1810, type: !80)
!1755 = !DILocation(line: 1810, column: 30, scope: !1753)
!1756 = !DILocalVariable(name: "val2", arg: 2, scope: !1753, file: !72, line: 1810, type: !34)
!1757 = !DILocation(line: 1810, column: 39, scope: !1753)
!1758 = !DILocalVariable(name: "u32Temp1", scope: !1753, file: !72, line: 1812, type: !736)
!1759 = !DILocation(line: 1812, column: 6, scope: !1753)
!1760 = !DILocalVariable(name: "u32Temp2", scope: !1753, file: !72, line: 1812, type: !736)
!1761 = !DILocation(line: 1812, column: 17, scope: !1753)
!1762 = !DILocalVariable(name: "u32Temp3", scope: !1753, file: !72, line: 1812, type: !736)
!1763 = !DILocation(line: 1812, column: 26, scope: !1753)
!1764 = !DILocalVariable(name: "u8SignBit", scope: !1753, file: !72, line: 1813, type: !29)
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
!1806 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !72, file: !72, line: 1857, type: !775, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1807 = !DILocalVariable(name: "val1", arg: 1, scope: !1806, file: !72, line: 1857, type: !80)
!1808 = !DILocation(line: 1857, column: 30, scope: !1806)
!1809 = !DILocalVariable(name: "val2", arg: 2, scope: !1806, file: !72, line: 1857, type: !34)
!1810 = !DILocation(line: 1857, column: 39, scope: !1806)
!1811 = !DILocalVariable(name: "u32Temp1", scope: !1806, file: !72, line: 1859, type: !736)
!1812 = !DILocation(line: 1859, column: 6, scope: !1806)
!1813 = !DILocalVariable(name: "u32Temp2", scope: !1806, file: !72, line: 1859, type: !736)
!1814 = !DILocation(line: 1859, column: 17, scope: !1806)
!1815 = !DILocalVariable(name: "u32Temp3", scope: !1806, file: !72, line: 1859, type: !736)
!1816 = !DILocation(line: 1859, column: 26, scope: !1806)
!1817 = !DILocalVariable(name: "u8SignBit", scope: !1806, file: !72, line: 1860, type: !29)
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
!1869 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !72, file: !72, line: 1911, type: !1870, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!80, !80, !25}
!1872 = !DILocalVariable(name: "val1", arg: 1, scope: !1869, file: !72, line: 1911, type: !80)
!1873 = !DILocation(line: 1911, column: 30, scope: !1869)
!1874 = !DILocalVariable(name: "val2", arg: 2, scope: !1869, file: !72, line: 1911, type: !25)
!1875 = !DILocation(line: 1911, column: 39, scope: !1869)
!1876 = !DILocalVariable(name: "u32Temp1", scope: !1869, file: !72, line: 1913, type: !736)
!1877 = !DILocation(line: 1913, column: 6, scope: !1869)
!1878 = !DILocalVariable(name: "u32Temp2", scope: !1869, file: !72, line: 1913, type: !736)
!1879 = !DILocation(line: 1913, column: 17, scope: !1869)
!1880 = !DILocalVariable(name: "u32Temp3", scope: !1869, file: !72, line: 1913, type: !736)
!1881 = !DILocation(line: 1913, column: 26, scope: !1869)
!1882 = !DILocalVariable(name: "u32Temp4", scope: !1869, file: !72, line: 1913, type: !736)
!1883 = !DILocation(line: 1913, column: 35, scope: !1869)
!1884 = !DILocalVariable(name: "u8SignBit", scope: !1869, file: !72, line: 1914, type: !29)
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
!1959 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !72, file: !72, line: 1977, type: !1870, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1960 = !DILocalVariable(name: "val1", arg: 1, scope: !1959, file: !72, line: 1977, type: !80)
!1961 = !DILocation(line: 1977, column: 30, scope: !1959)
!1962 = !DILocalVariable(name: "val2", arg: 2, scope: !1959, file: !72, line: 1977, type: !25)
!1963 = !DILocation(line: 1977, column: 39, scope: !1959)
!1964 = !DILocalVariable(name: "u32Temp1", scope: !1959, file: !72, line: 1979, type: !736)
!1965 = !DILocation(line: 1979, column: 6, scope: !1959)
!1966 = !DILocalVariable(name: "u32Temp2", scope: !1959, file: !72, line: 1979, type: !736)
!1967 = !DILocation(line: 1979, column: 17, scope: !1959)
!1968 = !DILocalVariable(name: "u32Temp3", scope: !1959, file: !72, line: 1979, type: !736)
!1969 = !DILocation(line: 1979, column: 26, scope: !1959)
!1970 = !DILocalVariable(name: "u32Temp4", scope: !1959, file: !72, line: 1979, type: !736)
!1971 = !DILocation(line: 1979, column: 35, scope: !1959)
!1972 = !DILocalVariable(name: "u8SignBit", scope: !1959, file: !72, line: 1980, type: !29)
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
!2060 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !72, file: !72, line: 2049, type: !2061, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!2071 = !DILocalVariable(name: "u8SignBit", scope: !2060, file: !72, line: 2052, type: !29)
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
!2101 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !72, file: !72, line: 2089, type: !2061, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!2112 = !DILocalVariable(name: "u8SignBit", scope: !2101, file: !72, line: 2092, type: !29)
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
!2164 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !72, file: !72, line: 2141, type: !2165, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!2179 = !DILocalVariable(name: "u8SignBit", scope: !2164, file: !72, line: 2144, type: !29)
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
!2248 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !72, file: !72, line: 2207, type: !2165, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!2261 = !DILocalVariable(name: "u8SignBit", scope: !2248, file: !72, line: 2210, type: !29)
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
!2343 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !72, file: !72, line: 2282, type: !2344, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2344 = !DISubroutineType(types: !2345)
!2345 = !{!80, !80, !29}
!2346 = !DILocalVariable(name: "value", arg: 1, scope: !2343, file: !72, line: 2282, type: !80)
!2347 = !DILocation(line: 2282, column: 29, scope: !2343)
!2348 = !DILocalVariable(name: "factor", arg: 2, scope: !2343, file: !72, line: 2282, type: !29)
!2349 = !DILocation(line: 2282, column: 39, scope: !2343)
!2350 = !DILocalVariable(name: "u32Temp1", scope: !2343, file: !72, line: 2284, type: !736)
!2351 = !DILocation(line: 2284, column: 6, scope: !2343)
!2352 = !DILocalVariable(name: "u32Temp2", scope: !2343, file: !72, line: 2284, type: !736)
!2353 = !DILocation(line: 2284, column: 17, scope: !2343)
!2354 = !DILocalVariable(name: "u32Temp3", scope: !2343, file: !72, line: 2284, type: !736)
!2355 = !DILocation(line: 2284, column: 26, scope: !2343)
!2356 = !DILocalVariable(name: "u8SignBit", scope: !2343, file: !72, line: 2285, type: !29)
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
!2398 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !72, file: !72, line: 2329, type: !2344, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2399 = !DILocalVariable(name: "value", arg: 1, scope: !2398, file: !72, line: 2329, type: !80)
!2400 = !DILocation(line: 2329, column: 29, scope: !2398)
!2401 = !DILocalVariable(name: "factor", arg: 2, scope: !2398, file: !72, line: 2329, type: !29)
!2402 = !DILocation(line: 2329, column: 39, scope: !2398)
!2403 = !DILocalVariable(name: "u32Temp1", scope: !2398, file: !72, line: 2331, type: !736)
!2404 = !DILocation(line: 2331, column: 6, scope: !2398)
!2405 = !DILocalVariable(name: "u32Temp2", scope: !2398, file: !72, line: 2331, type: !736)
!2406 = !DILocation(line: 2331, column: 17, scope: !2398)
!2407 = !DILocalVariable(name: "u32Temp3", scope: !2398, file: !72, line: 2331, type: !736)
!2408 = !DILocation(line: 2331, column: 26, scope: !2398)
!2409 = !DILocalVariable(name: "u8SignBit", scope: !2398, file: !72, line: 2332, type: !29)
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
!2461 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !72, file: !72, line: 2380, type: !2462, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2462 = !DISubroutineType(types: !2463)
!2463 = !{!736, !736, !736, !29}
!2464 = !DILocalVariable(name: "value", arg: 1, scope: !2461, file: !72, line: 2380, type: !736)
!2465 = !DILocation(line: 2380, column: 39, scope: !2461)
!2466 = !DILocalVariable(name: "factor", arg: 2, scope: !2461, file: !72, line: 2380, type: !736)
!2467 = !DILocation(line: 2380, column: 49, scope: !2461)
!2468 = !DILocalVariable(name: "power", arg: 3, scope: !2461, file: !72, line: 2380, type: !29)
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
!2518 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !72, file: !72, line: 2425, type: !2519, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2519 = !DISubroutineType(types: !2520)
!2520 = !{!80, !80, !80, !29}
!2521 = !DILocalVariable(name: "value", arg: 1, scope: !2518, file: !72, line: 2425, type: !80)
!2522 = !DILocation(line: 2425, column: 39, scope: !2518)
!2523 = !DILocalVariable(name: "factor", arg: 2, scope: !2518, file: !72, line: 2425, type: !80)
!2524 = !DILocation(line: 2425, column: 50, scope: !2518)
!2525 = !DILocalVariable(name: "power", arg: 3, scope: !2518, file: !72, line: 2425, type: !29)
!2526 = !DILocation(line: 2425, column: 61, scope: !2518)
!2527 = !DILocalVariable(name: "u32Temp1", scope: !2518, file: !72, line: 2427, type: !736)
!2528 = !DILocation(line: 2427, column: 6, scope: !2518)
!2529 = !DILocalVariable(name: "u32Temp2", scope: !2518, file: !72, line: 2427, type: !736)
!2530 = !DILocation(line: 2427, column: 17, scope: !2518)
!2531 = !DILocalVariable(name: "u32Temp3", scope: !2518, file: !72, line: 2427, type: !736)
!2532 = !DILocation(line: 2427, column: 26, scope: !2518)
!2533 = !DILocalVariable(name: "u32Temp4", scope: !2518, file: !72, line: 2427, type: !736)
!2534 = !DILocation(line: 2427, column: 35, scope: !2518)
!2535 = !DILocalVariable(name: "u8SignBit", scope: !2518, file: !72, line: 2428, type: !29)
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
!2638 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !72, file: !72, line: 2518, type: !2639, scopeLine: 2519, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{!80, !80, !20}
!2641 = !DILocalVariable(name: "value", arg: 1, scope: !2638, file: !72, line: 2518, type: !80)
!2642 = !DILocation(line: 2518, column: 29, scope: !2638)
!2643 = !DILocalVariable(name: "factor", arg: 2, scope: !2638, file: !72, line: 2518, type: !20)
!2644 = !DILocation(line: 2518, column: 39, scope: !2638)
!2645 = !DILocalVariable(name: "u32Temp1", scope: !2638, file: !72, line: 2520, type: !736)
!2646 = !DILocation(line: 2520, column: 6, scope: !2638)
!2647 = !DILocalVariable(name: "u32Temp2", scope: !2638, file: !72, line: 2520, type: !736)
!2648 = !DILocation(line: 2520, column: 17, scope: !2638)
!2649 = !DILocalVariable(name: "u32Temp3", scope: !2638, file: !72, line: 2520, type: !736)
!2650 = !DILocation(line: 2520, column: 26, scope: !2638)
!2651 = !DILocalVariable(name: "u32Temp4", scope: !2638, file: !72, line: 2520, type: !736)
!2652 = !DILocation(line: 2520, column: 35, scope: !2638)
!2653 = !DILocalVariable(name: "u8SignBit", scope: !2638, file: !72, line: 2521, type: !29)
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
!2728 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !72, file: !72, line: 2584, type: !2639, scopeLine: 2585, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2729 = !DILocalVariable(name: "value", arg: 1, scope: !2728, file: !72, line: 2584, type: !80)
!2730 = !DILocation(line: 2584, column: 29, scope: !2728)
!2731 = !DILocalVariable(name: "factor", arg: 2, scope: !2728, file: !72, line: 2584, type: !20)
!2732 = !DILocation(line: 2584, column: 39, scope: !2728)
!2733 = !DILocalVariable(name: "u32Temp1", scope: !2728, file: !72, line: 2586, type: !736)
!2734 = !DILocation(line: 2586, column: 6, scope: !2728)
!2735 = !DILocalVariable(name: "u32Temp2", scope: !2728, file: !72, line: 2586, type: !736)
!2736 = !DILocation(line: 2586, column: 17, scope: !2728)
!2737 = !DILocalVariable(name: "u32Temp3", scope: !2728, file: !72, line: 2586, type: !736)
!2738 = !DILocation(line: 2586, column: 26, scope: !2728)
!2739 = !DILocalVariable(name: "u32Temp4", scope: !2728, file: !72, line: 2586, type: !736)
!2740 = !DILocation(line: 2586, column: 35, scope: !2728)
!2741 = !DILocalVariable(name: "u8SignBit", scope: !2728, file: !72, line: 2587, type: !29)
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
!2829 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !72, file: !72, line: 2656, type: !2165, scopeLine: 2657, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
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
!2842 = !DILocalVariable(name: "u8SignBit", scope: !2829, file: !72, line: 2659, type: !29)
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
!2868 = !DILocation(line: 2676, column: 15, scope: !2862)
!2869 = !DILocation(line: 2676, column: 14, scope: !2862)
!2870 = !DILocation(line: 2676, column: 12, scope: !2862)
!2871 = !DILocation(line: 2677, column: 2, scope: !2862)
!2872 = !DILocation(line: 2680, column: 14, scope: !2873)
!2873 = distinct !DILexicalBlock(scope: !2857, file: !72, line: 2679, column: 2)
!2874 = !DILocation(line: 2680, column: 12, scope: !2873)
!2875 = !DILocation(line: 2683, column: 5, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2683, column: 5)
!2877 = !DILocation(line: 2683, column: 9, scope: !2876)
!2878 = !DILocation(line: 2683, column: 5, scope: !2829)
!2879 = !DILocation(line: 2686, column: 44, scope: !2880)
!2880 = distinct !DILexicalBlock(scope: !2881, file: !72, line: 2686, column: 7)
!2881 = distinct !DILexicalBlock(scope: !2876, file: !72, line: 2684, column: 2)
!2882 = !DILocation(line: 2686, column: 34, scope: !2880)
!2883 = !DILocation(line: 2686, column: 9, scope: !2880)
!2884 = !DILocation(line: 2686, column: 7, scope: !2881)
!2885 = !DILocation(line: 2687, column: 7, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2880, file: !72, line: 2686, column: 53)
!2887 = !DILocation(line: 2689, column: 15, scope: !2881)
!2888 = !DILocation(line: 2689, column: 14, scope: !2881)
!2889 = !DILocation(line: 2689, column: 12, scope: !2881)
!2890 = !DILocation(line: 2690, column: 2, scope: !2881)
!2891 = !DILocation(line: 2693, column: 14, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2876, file: !72, line: 2692, column: 2)
!2893 = !DILocation(line: 2693, column: 12, scope: !2892)
!2894 = !DILocation(line: 2696, column: 13, scope: !2829)
!2895 = !DILocation(line: 2696, column: 24, scope: !2829)
!2896 = !DILocation(line: 2696, column: 22, scope: !2829)
!2897 = !DILocation(line: 2696, column: 11, scope: !2829)
!2898 = !DILocation(line: 2697, column: 25, scope: !2829)
!2899 = !DILocation(line: 2697, column: 35, scope: !2829)
!2900 = !DILocation(line: 2697, column: 13, scope: !2829)
!2901 = !DILocation(line: 2697, column: 11, scope: !2829)
!2902 = !DILocation(line: 2699, column: 2, scope: !2829)
!2903 = !DILocation(line: 2729, column: 1, scope: !2829)
!2904 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !13, file: !13, line: 42, type: !2905, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2905 = !DISubroutineType(types: !2906)
!2906 = !{!11, !6}
!2907 = !DILocalVariable(name: "value", arg: 1, scope: !2904, file: !13, line: 42, type: !6)
!2908 = !DILocation(line: 42, column: 38, scope: !2904)
!2909 = !DILocation(line: 44, column: 12, scope: !2904)
!2910 = !DILocation(line: 44, column: 18, scope: !2904)
!2911 = !DILocation(line: 44, column: 5, scope: !2904)
!2912 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !72, file: !72, line: 2747, type: !2061, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2913 = !DILocalVariable(name: "value", arg: 1, scope: !2912, file: !72, line: 2747, type: !80)
!2914 = !DILocation(line: 2747, column: 31, scope: !2912)
!2915 = !DILocalVariable(name: "factor", arg: 2, scope: !2912, file: !72, line: 2747, type: !736)
!2916 = !DILocation(line: 2747, column: 42, scope: !2912)
!2917 = !DILocalVariable(name: "u32Temp1", scope: !2912, file: !72, line: 2749, type: !736)
!2918 = !DILocation(line: 2749, column: 6, scope: !2912)
!2919 = !DILocalVariable(name: "u32Temp2", scope: !2912, file: !72, line: 2749, type: !736)
!2920 = !DILocation(line: 2749, column: 17, scope: !2912)
!2921 = !DILocalVariable(name: "u8SignBit", scope: !2912, file: !72, line: 2750, type: !29)
!2922 = !DILocation(line: 2750, column: 5, scope: !2912)
!2923 = !DILocation(line: 2752, column: 5, scope: !2924)
!2924 = distinct !DILexicalBlock(scope: !2912, file: !72, line: 2752, column: 5)
!2925 = !DILocation(line: 2752, column: 10, scope: !2924)
!2926 = !DILocation(line: 2752, column: 5, scope: !2912)
!2927 = !DILocation(line: 2754, column: 15, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2924, file: !72, line: 2753, column: 2)
!2929 = !DILocation(line: 2754, column: 14, scope: !2928)
!2930 = !DILocation(line: 2754, column: 12, scope: !2928)
!2931 = !DILocation(line: 2755, column: 13, scope: !2928)
!2932 = !DILocation(line: 2756, column: 2, scope: !2928)
!2933 = !DILocation(line: 2759, column: 14, scope: !2934)
!2934 = distinct !DILexicalBlock(scope: !2924, file: !72, line: 2758, column: 2)
!2935 = !DILocation(line: 2759, column: 12, scope: !2934)
!2936 = !DILocation(line: 2760, column: 13, scope: !2934)
!2937 = !DILocation(line: 2763, column: 25, scope: !2912)
!2938 = !DILocation(line: 2763, column: 35, scope: !2912)
!2939 = !DILocation(line: 2763, column: 13, scope: !2912)
!2940 = !DILocation(line: 2763, column: 11, scope: !2912)
!2941 = !DILocation(line: 2764, column: 13, scope: !2912)
!2942 = !DILocation(line: 2764, column: 22, scope: !2912)
!2943 = !DILocation(line: 2764, column: 11, scope: !2912)
!2944 = !DILocation(line: 2765, column: 5, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2912, file: !72, line: 2765, column: 5)
!2946 = !DILocation(line: 2765, column: 15, scope: !2945)
!2947 = !DILocation(line: 2765, column: 5, scope: !2912)
!2948 = !DILocation(line: 2767, column: 10, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2945, file: !72, line: 2766, column: 2)
!2950 = !DILocation(line: 2767, column: 3, scope: !2949)
!2951 = !DILocation(line: 2771, column: 11, scope: !2952)
!2952 = distinct !DILexicalBlock(scope: !2945, file: !72, line: 2770, column: 2)
!2953 = !DILocation(line: 2771, column: 10, scope: !2952)
!2954 = !DILocation(line: 2771, column: 3, scope: !2952)
!2955 = !DILocation(line: 2773, column: 1, scope: !2912)
!2956 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !72, file: !72, line: 2789, type: !2165, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2957 = !DILocalVariable(name: "value", arg: 1, scope: !2956, file: !72, line: 2789, type: !80)
!2958 = !DILocation(line: 2789, column: 31, scope: !2956)
!2959 = !DILocalVariable(name: "factor", arg: 2, scope: !2956, file: !72, line: 2789, type: !80)
!2960 = !DILocation(line: 2789, column: 42, scope: !2956)
!2961 = !DILocalVariable(name: "u32Temp1", scope: !2956, file: !72, line: 2791, type: !736)
!2962 = !DILocation(line: 2791, column: 6, scope: !2956)
!2963 = !DILocalVariable(name: "u32Temp2", scope: !2956, file: !72, line: 2791, type: !736)
!2964 = !DILocation(line: 2791, column: 17, scope: !2956)
!2965 = !DILocalVariable(name: "u32Temp3", scope: !2956, file: !72, line: 2791, type: !736)
!2966 = !DILocation(line: 2791, column: 26, scope: !2956)
!2967 = !DILocalVariable(name: "u8SignBit", scope: !2956, file: !72, line: 2792, type: !29)
!2968 = !DILocation(line: 2792, column: 5, scope: !2956)
!2969 = !DILocation(line: 2794, column: 7, scope: !2970)
!2970 = distinct !DILexicalBlock(scope: !2956, file: !72, line: 2794, column: 5)
!2971 = !DILocation(line: 2794, column: 12, scope: !2970)
!2972 = !DILocation(line: 2794, column: 16, scope: !2970)
!2973 = !DILocation(line: 2794, column: 36, scope: !2970)
!2974 = !DILocation(line: 2794, column: 41, scope: !2970)
!2975 = !DILocation(line: 2794, column: 45, scope: !2970)
!2976 = !DILocation(line: 2796, column: 13, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2970, file: !72, line: 2795, column: 2)
!2978 = !DILocation(line: 2797, column: 2, scope: !2977)
!2979 = !DILocation(line: 2800, column: 13, scope: !2980)
!2980 = distinct !DILexicalBlock(scope: !2970, file: !72, line: 2799, column: 2)
!2981 = !DILocation(line: 2803, column: 5, scope: !2982)
!2982 = distinct !DILexicalBlock(scope: !2956, file: !72, line: 2803, column: 5)
!2983 = !DILocation(line: 2803, column: 10, scope: !2982)
!2984 = !DILocation(line: 2803, column: 5, scope: !2956)
!2985 = !DILocation(line: 2805, column: 15, scope: !2986)
!2986 = distinct !DILexicalBlock(scope: !2982, file: !72, line: 2804, column: 2)
!2987 = !DILocation(line: 2805, column: 14, scope: !2986)
!2988 = !DILocation(line: 2805, column: 12, scope: !2986)
!2989 = !DILocation(line: 2806, column: 2, scope: !2986)
!2990 = !DILocation(line: 2809, column: 14, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2982, file: !72, line: 2808, column: 2)
!2992 = !DILocation(line: 2809, column: 12, scope: !2991)
!2993 = !DILocation(line: 2812, column: 5, scope: !2994)
!2994 = distinct !DILexicalBlock(scope: !2956, file: !72, line: 2812, column: 5)
!2995 = !DILocation(line: 2812, column: 11, scope: !2994)
!2996 = !DILocation(line: 2812, column: 5, scope: !2956)
!2997 = !DILocation(line: 2814, column: 15, scope: !2998)
!2998 = distinct !DILexicalBlock(scope: !2994, file: !72, line: 2813, column: 2)
!2999 = !DILocation(line: 2814, column: 14, scope: !2998)
!3000 = !DILocation(line: 2814, column: 12, scope: !2998)
!3001 = !DILocation(line: 2815, column: 2, scope: !2998)
!3002 = !DILocation(line: 2818, column: 14, scope: !3003)
!3003 = distinct !DILexicalBlock(scope: !2994, file: !72, line: 2817, column: 2)
!3004 = !DILocation(line: 2818, column: 12, scope: !3003)
!3005 = !DILocation(line: 2821, column: 25, scope: !2956)
!3006 = !DILocation(line: 2821, column: 35, scope: !2956)
!3007 = !DILocation(line: 2821, column: 13, scope: !2956)
!3008 = !DILocation(line: 2821, column: 11, scope: !2956)
!3009 = !DILocation(line: 2822, column: 5, scope: !3010)
!3010 = distinct !DILexicalBlock(scope: !2956, file: !72, line: 2822, column: 5)
!3011 = !DILocation(line: 2822, column: 15, scope: !3010)
!3012 = !DILocation(line: 2822, column: 5, scope: !2956)
!3013 = !DILocation(line: 2824, column: 10, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3010, file: !72, line: 2823, column: 2)
!3015 = !DILocation(line: 2824, column: 3, scope: !3014)
!3016 = !DILocation(line: 2828, column: 11, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !3010, file: !72, line: 2827, column: 2)
!3018 = !DILocation(line: 2828, column: 10, scope: !3017)
!3019 = !DILocation(line: 2828, column: 3, scope: !3017)
!3020 = !DILocation(line: 2830, column: 1, scope: !2956)
!3021 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !72, file: !72, line: 2847, type: !3022, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3022 = !DISubroutineType(types: !3023)
!3023 = !{!736, !736, !29}
!3024 = !DILocalVariable(name: "value", arg: 1, scope: !3021, file: !72, line: 2847, type: !736)
!3025 = !DILocation(line: 2847, column: 29, scope: !3021)
!3026 = !DILocalVariable(name: "factor", arg: 2, scope: !3021, file: !72, line: 2847, type: !29)
!3027 = !DILocation(line: 2847, column: 39, scope: !3021)
!3028 = !DILocalVariable(name: "u32Temp1", scope: !3021, file: !72, line: 2849, type: !736)
!3029 = !DILocation(line: 2849, column: 6, scope: !3021)
!3030 = !DILocalVariable(name: "u32Temp2", scope: !3021, file: !72, line: 2849, type: !736)
!3031 = !DILocation(line: 2849, column: 20, scope: !3021)
!3032 = !DILocation(line: 2850, column: 13, scope: !3021)
!3033 = !DILocation(line: 2850, column: 21, scope: !3021)
!3034 = !DILocation(line: 2850, column: 19, scope: !3021)
!3035 = !DILocation(line: 2850, column: 11, scope: !3021)
!3036 = !DILocation(line: 2851, column: 25, scope: !3021)
!3037 = !DILocation(line: 2851, column: 32, scope: !3021)
!3038 = !DILocation(line: 2851, column: 13, scope: !3021)
!3039 = !DILocation(line: 2851, column: 11, scope: !3021)
!3040 = !DILocation(line: 2852, column: 14, scope: !3021)
!3041 = !DILocation(line: 2852, column: 23, scope: !3021)
!3042 = !DILocation(line: 2852, column: 11, scope: !3021)
!3043 = !DILocation(line: 2853, column: 14, scope: !3021)
!3044 = !DILocation(line: 2853, column: 23, scope: !3021)
!3045 = !DILocation(line: 2853, column: 11, scope: !3021)
!3046 = !DILocation(line: 2854, column: 9, scope: !3021)
!3047 = !DILocation(line: 2854, column: 2, scope: !3021)
!3048 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !72, file: !72, line: 2873, type: !3022, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3049 = !DILocalVariable(name: "value", arg: 1, scope: !3048, file: !72, line: 2873, type: !736)
!3050 = !DILocation(line: 2873, column: 29, scope: !3048)
!3051 = !DILocalVariable(name: "factor", arg: 2, scope: !3048, file: !72, line: 2873, type: !29)
!3052 = !DILocation(line: 2873, column: 39, scope: !3048)
!3053 = !DILocalVariable(name: "u32Temp1", scope: !3048, file: !72, line: 2875, type: !736)
!3054 = !DILocation(line: 2875, column: 6, scope: !3048)
!3055 = !DILocalVariable(name: "u32Temp2", scope: !3048, file: !72, line: 2875, type: !736)
!3056 = !DILocation(line: 2875, column: 20, scope: !3048)
!3057 = !DILocation(line: 2876, column: 13, scope: !3048)
!3058 = !DILocation(line: 2876, column: 21, scope: !3048)
!3059 = !DILocation(line: 2876, column: 19, scope: !3048)
!3060 = !DILocation(line: 2876, column: 11, scope: !3048)
!3061 = !DILocation(line: 2877, column: 25, scope: !3048)
!3062 = !DILocation(line: 2877, column: 32, scope: !3048)
!3063 = !DILocation(line: 2877, column: 13, scope: !3048)
!3064 = !DILocation(line: 2877, column: 11, scope: !3048)
!3065 = !DILocation(line: 2878, column: 14, scope: !3048)
!3066 = !DILocation(line: 2878, column: 23, scope: !3048)
!3067 = !DILocation(line: 2878, column: 11, scope: !3048)
!3068 = !DILocation(line: 2879, column: 14, scope: !3048)
!3069 = !DILocation(line: 2879, column: 23, scope: !3048)
!3070 = !DILocation(line: 2879, column: 11, scope: !3048)
!3071 = !DILocation(line: 2880, column: 6, scope: !3072)
!3072 = distinct !DILexicalBlock(scope: !3048, file: !72, line: 2880, column: 5)
!3073 = !DILocation(line: 2880, column: 14, scope: !3072)
!3074 = !DILocation(line: 2880, column: 19, scope: !3072)
!3075 = !DILocation(line: 2880, column: 5, scope: !3048)
!3076 = !DILocation(line: 2882, column: 10, scope: !3077)
!3077 = distinct !DILexicalBlock(scope: !3072, file: !72, line: 2881, column: 2)
!3078 = !DILocation(line: 2882, column: 3, scope: !3077)
!3079 = !DILocation(line: 2886, column: 3, scope: !3080)
!3080 = distinct !DILexicalBlock(scope: !3072, file: !72, line: 2885, column: 2)
!3081 = !DILocation(line: 2889, column: 1, scope: !3048)
!3082 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !72, file: !72, line: 2908, type: !3083, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3083 = !DISubroutineType(types: !3084)
!3084 = !{!736, !736, !20}
!3085 = !DILocalVariable(name: "value", arg: 1, scope: !3082, file: !72, line: 2908, type: !736)
!3086 = !DILocation(line: 2908, column: 29, scope: !3082)
!3087 = !DILocalVariable(name: "factor", arg: 2, scope: !3082, file: !72, line: 2908, type: !20)
!3088 = !DILocation(line: 2908, column: 39, scope: !3082)
!3089 = !DILocalVariable(name: "u32Temp1", scope: !3082, file: !72, line: 2910, type: !736)
!3090 = !DILocation(line: 2910, column: 6, scope: !3082)
!3091 = !DILocalVariable(name: "u32Temp2", scope: !3082, file: !72, line: 2910, type: !736)
!3092 = !DILocation(line: 2910, column: 20, scope: !3082)
!3093 = !DILocation(line: 2911, column: 5, scope: !3094)
!3094 = distinct !DILexicalBlock(scope: !3082, file: !72, line: 2911, column: 5)
!3095 = !DILocation(line: 2911, column: 12, scope: !3094)
!3096 = !DILocation(line: 2911, column: 5, scope: !3082)
!3097 = !DILocation(line: 2914, column: 14, scope: !3098)
!3098 = distinct !DILexicalBlock(scope: !3094, file: !72, line: 2912, column: 2)
!3099 = !DILocation(line: 2914, column: 22, scope: !3098)
!3100 = !DILocation(line: 2914, column: 20, scope: !3098)
!3101 = !DILocation(line: 2914, column: 12, scope: !3098)
!3102 = !DILocation(line: 2915, column: 26, scope: !3098)
!3103 = !DILocation(line: 2915, column: 33, scope: !3098)
!3104 = !DILocation(line: 2915, column: 14, scope: !3098)
!3105 = !DILocation(line: 2915, column: 12, scope: !3098)
!3106 = !DILocation(line: 2916, column: 14, scope: !3098)
!3107 = !DILocation(line: 2916, column: 23, scope: !3098)
!3108 = !DILocation(line: 2916, column: 12, scope: !3098)
!3109 = !DILocation(line: 2917, column: 15, scope: !3098)
!3110 = !DILocation(line: 2917, column: 24, scope: !3098)
!3111 = !DILocation(line: 2917, column: 12, scope: !3098)
!3112 = !DILocation(line: 2918, column: 10, scope: !3098)
!3113 = !DILocation(line: 2918, column: 3, scope: !3098)
!3114 = !DILocation(line: 2922, column: 3, scope: !3115)
!3115 = distinct !DILexicalBlock(scope: !3094, file: !72, line: 2921, column: 2)
!3116 = !DILocation(line: 2924, column: 1, scope: !3082)
!3117 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !72, file: !72, line: 2943, type: !3083, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3118 = !DILocalVariable(name: "value", arg: 1, scope: !3117, file: !72, line: 2943, type: !736)
!3119 = !DILocation(line: 2943, column: 29, scope: !3117)
!3120 = !DILocalVariable(name: "factor", arg: 2, scope: !3117, file: !72, line: 2943, type: !20)
!3121 = !DILocation(line: 2943, column: 39, scope: !3117)
!3122 = !DILocalVariable(name: "u32Temp1", scope: !3117, file: !72, line: 2945, type: !736)
!3123 = !DILocation(line: 2945, column: 6, scope: !3117)
!3124 = !DILocalVariable(name: "u32Temp2", scope: !3117, file: !72, line: 2945, type: !736)
!3125 = !DILocation(line: 2945, column: 20, scope: !3117)
!3126 = !DILocation(line: 2946, column: 5, scope: !3127)
!3127 = distinct !DILexicalBlock(scope: !3117, file: !72, line: 2946, column: 5)
!3128 = !DILocation(line: 2946, column: 12, scope: !3127)
!3129 = !DILocation(line: 2946, column: 5, scope: !3117)
!3130 = !DILocation(line: 2948, column: 3, scope: !3131)
!3131 = distinct !DILexicalBlock(scope: !3127, file: !72, line: 2947, column: 2)
!3132 = !DILocation(line: 2952, column: 14, scope: !3133)
!3133 = distinct !DILexicalBlock(scope: !3127, file: !72, line: 2951, column: 2)
!3134 = !DILocation(line: 2952, column: 22, scope: !3133)
!3135 = !DILocation(line: 2952, column: 20, scope: !3133)
!3136 = !DILocation(line: 2952, column: 12, scope: !3133)
!3137 = !DILocation(line: 2953, column: 26, scope: !3133)
!3138 = !DILocation(line: 2953, column: 33, scope: !3133)
!3139 = !DILocation(line: 2953, column: 14, scope: !3133)
!3140 = !DILocation(line: 2953, column: 12, scope: !3133)
!3141 = !DILocation(line: 2954, column: 14, scope: !3133)
!3142 = !DILocation(line: 2954, column: 23, scope: !3133)
!3143 = !DILocation(line: 2954, column: 12, scope: !3133)
!3144 = !DILocation(line: 2955, column: 15, scope: !3133)
!3145 = !DILocation(line: 2955, column: 24, scope: !3133)
!3146 = !DILocation(line: 2955, column: 12, scope: !3133)
!3147 = !DILocation(line: 2956, column: 7, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3133, file: !72, line: 2956, column: 6)
!3149 = !DILocation(line: 2956, column: 16, scope: !3148)
!3150 = !DILocation(line: 2956, column: 22, scope: !3148)
!3151 = !DILocation(line: 2956, column: 6, scope: !3133)
!3152 = !DILocation(line: 2958, column: 11, scope: !3153)
!3153 = distinct !DILexicalBlock(scope: !3148, file: !72, line: 2957, column: 3)
!3154 = !DILocation(line: 2958, column: 4, scope: !3153)
!3155 = !DILocation(line: 2962, column: 4, scope: !3156)
!3156 = distinct !DILexicalBlock(scope: !3148, file: !72, line: 2961, column: 3)
!3157 = !DILocation(line: 2965, column: 1, scope: !3117)
!3158 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !72, file: !72, line: 2987, type: !301, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3159 = !DILocalVariable(name: "value", arg: 1, scope: !3158, file: !72, line: 2987, type: !25)
!3160 = !DILocation(line: 2987, column: 33, scope: !3158)
!3161 = !DILocalVariable(name: "factor", arg: 2, scope: !3158, file: !72, line: 2987, type: !25)
!3162 = !DILocation(line: 2987, column: 44, scope: !3158)
!3163 = !DILocation(line: 2989, column: 40, scope: !3158)
!3164 = !DILocation(line: 2989, column: 46, scope: !3158)
!3165 = !DILocation(line: 2989, column: 9, scope: !3158)
!3166 = !DILocation(line: 2989, column: 2, scope: !3158)
!3167 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !72, file: !72, line: 3011, type: !301, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3168 = !DILocalVariable(name: "value", arg: 1, scope: !3167, file: !72, line: 3011, type: !25)
!3169 = !DILocation(line: 3011, column: 33, scope: !3167)
!3170 = !DILocalVariable(name: "factor", arg: 2, scope: !3167, file: !72, line: 3011, type: !25)
!3171 = !DILocation(line: 3011, column: 44, scope: !3167)
!3172 = !DILocation(line: 3013, column: 41, scope: !3167)
!3173 = !DILocation(line: 3013, column: 47, scope: !3167)
!3174 = !DILocation(line: 3013, column: 10, scope: !3167)
!3175 = !DILocation(line: 3013, column: 3, scope: !3167)
!3176 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !72, file: !72, line: 3036, type: !301, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3177 = !DILocalVariable(name: "value", arg: 1, scope: !3176, file: !72, line: 3036, type: !25)
!3178 = !DILocation(line: 3036, column: 32, scope: !3176)
!3179 = !DILocalVariable(name: "factor", arg: 2, scope: !3176, file: !72, line: 3036, type: !25)
!3180 = !DILocation(line: 3036, column: 43, scope: !3176)
!3181 = !DILocation(line: 3038, column: 41, scope: !3176)
!3182 = !DILocation(line: 3038, column: 47, scope: !3176)
!3183 = !DILocation(line: 3038, column: 10, scope: !3176)
!3184 = !DILocation(line: 3038, column: 3, scope: !3176)
!3185 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !72, file: !72, line: 3061, type: !301, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3186 = !DILocalVariable(name: "value", arg: 1, scope: !3185, file: !72, line: 3061, type: !25)
!3187 = !DILocation(line: 3061, column: 34, scope: !3185)
!3188 = !DILocalVariable(name: "factor", arg: 2, scope: !3185, file: !72, line: 3061, type: !25)
!3189 = !DILocation(line: 3061, column: 45, scope: !3185)
!3190 = !DILocation(line: 3063, column: 44, scope: !3185)
!3191 = !DILocation(line: 3063, column: 50, scope: !3185)
!3192 = !DILocation(line: 3063, column: 10, scope: !3185)
!3193 = !DILocation(line: 3063, column: 3, scope: !3185)
!3194 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !72, file: !72, line: 3086, type: !301, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3195 = !DILocalVariable(name: "value", arg: 1, scope: !3194, file: !72, line: 3086, type: !25)
!3196 = !DILocation(line: 3086, column: 33, scope: !3194)
!3197 = !DILocalVariable(name: "factor", arg: 2, scope: !3194, file: !72, line: 3086, type: !25)
!3198 = !DILocation(line: 3086, column: 44, scope: !3194)
!3199 = !DILocation(line: 3088, column: 44, scope: !3194)
!3200 = !DILocation(line: 3088, column: 50, scope: !3194)
!3201 = !DILocation(line: 3088, column: 10, scope: !3194)
!3202 = !DILocation(line: 3088, column: 3, scope: !3194)
!3203 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !72, file: !72, line: 3111, type: !301, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3204 = !DILocalVariable(name: "value", arg: 1, scope: !3203, file: !72, line: 3111, type: !25)
!3205 = !DILocation(line: 3111, column: 31, scope: !3203)
!3206 = !DILocalVariable(name: "factor", arg: 2, scope: !3203, file: !72, line: 3111, type: !25)
!3207 = !DILocation(line: 3111, column: 42, scope: !3203)
!3208 = !DILocation(line: 3113, column: 44, scope: !3203)
!3209 = !DILocation(line: 3113, column: 50, scope: !3203)
!3210 = !DILocation(line: 3113, column: 10, scope: !3203)
!3211 = !DILocation(line: 3113, column: 3, scope: !3203)
!3212 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !72, file: !72, line: 3136, type: !301, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3213 = !DILocalVariable(name: "value", arg: 1, scope: !3212, file: !72, line: 3136, type: !25)
!3214 = !DILocation(line: 3136, column: 33, scope: !3212)
!3215 = !DILocalVariable(name: "factor", arg: 2, scope: !3212, file: !72, line: 3136, type: !25)
!3216 = !DILocation(line: 3136, column: 44, scope: !3212)
!3217 = !DILocation(line: 3138, column: 44, scope: !3212)
!3218 = !DILocation(line: 3138, column: 50, scope: !3212)
!3219 = !DILocation(line: 3138, column: 10, scope: !3212)
!3220 = !DILocation(line: 3138, column: 3, scope: !3212)
!3221 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !72, file: !72, line: 3161, type: !301, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3222 = !DILocalVariable(name: "value", arg: 1, scope: !3221, file: !72, line: 3161, type: !25)
!3223 = !DILocation(line: 3161, column: 32, scope: !3221)
!3224 = !DILocalVariable(name: "factor", arg: 2, scope: !3221, file: !72, line: 3161, type: !25)
!3225 = !DILocation(line: 3161, column: 43, scope: !3221)
!3226 = !DILocation(line: 3163, column: 44, scope: !3221)
!3227 = !DILocation(line: 3163, column: 50, scope: !3221)
!3228 = !DILocation(line: 3163, column: 10, scope: !3221)
!3229 = !DILocation(line: 3163, column: 3, scope: !3221)
!3230 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !72, file: !72, line: 3185, type: !301, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3231 = !DILocalVariable(name: "value", arg: 1, scope: !3230, file: !72, line: 3185, type: !25)
!3232 = !DILocation(line: 3185, column: 31, scope: !3230)
!3233 = !DILocalVariable(name: "factor", arg: 2, scope: !3230, file: !72, line: 3185, type: !25)
!3234 = !DILocation(line: 3185, column: 42, scope: !3230)
!3235 = !DILocation(line: 3187, column: 44, scope: !3230)
!3236 = !DILocation(line: 3187, column: 50, scope: !3230)
!3237 = !DILocation(line: 3187, column: 10, scope: !3230)
!3238 = !DILocation(line: 3187, column: 3, scope: !3230)
!3239 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !72, file: !72, line: 3209, type: !301, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3240 = !DILocalVariable(name: "value", arg: 1, scope: !3239, file: !72, line: 3209, type: !25)
!3241 = !DILocation(line: 3209, column: 30, scope: !3239)
!3242 = !DILocalVariable(name: "factor", arg: 2, scope: !3239, file: !72, line: 3209, type: !25)
!3243 = !DILocation(line: 3209, column: 41, scope: !3239)
!3244 = !DILocation(line: 3211, column: 44, scope: !3239)
!3245 = !DILocation(line: 3211, column: 50, scope: !3239)
!3246 = !DILocation(line: 3211, column: 10, scope: !3239)
!3247 = !DILocation(line: 3211, column: 3, scope: !3239)
!3248 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !72, file: !72, line: 3233, type: !301, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3249 = !DILocalVariable(name: "value", arg: 1, scope: !3248, file: !72, line: 3233, type: !25)
!3250 = !DILocation(line: 3233, column: 33, scope: !3248)
!3251 = !DILocalVariable(name: "factor", arg: 2, scope: !3248, file: !72, line: 3233, type: !25)
!3252 = !DILocation(line: 3233, column: 44, scope: !3248)
!3253 = !DILocation(line: 3235, column: 44, scope: !3248)
!3254 = !DILocation(line: 3235, column: 50, scope: !3248)
!3255 = !DILocation(line: 3235, column: 10, scope: !3248)
!3256 = !DILocation(line: 3235, column: 3, scope: !3248)
!3257 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !72, file: !72, line: 3257, type: !301, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3258 = !DILocalVariable(name: "value", arg: 1, scope: !3257, file: !72, line: 3257, type: !25)
!3259 = !DILocation(line: 3257, column: 32, scope: !3257)
!3260 = !DILocalVariable(name: "factor", arg: 2, scope: !3257, file: !72, line: 3257, type: !25)
!3261 = !DILocation(line: 3257, column: 43, scope: !3257)
!3262 = !DILocation(line: 3259, column: 44, scope: !3257)
!3263 = !DILocation(line: 3259, column: 50, scope: !3257)
!3264 = !DILocation(line: 3259, column: 10, scope: !3257)
!3265 = !DILocation(line: 3259, column: 3, scope: !3257)
!3266 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !72, file: !72, line: 3281, type: !301, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3267 = !DILocalVariable(name: "value", arg: 1, scope: !3266, file: !72, line: 3281, type: !25)
!3268 = !DILocation(line: 3281, column: 31, scope: !3266)
!3269 = !DILocalVariable(name: "factor", arg: 2, scope: !3266, file: !72, line: 3281, type: !25)
!3270 = !DILocation(line: 3281, column: 42, scope: !3266)
!3271 = !DILocation(line: 3283, column: 44, scope: !3266)
!3272 = !DILocation(line: 3283, column: 50, scope: !3266)
!3273 = !DILocation(line: 3283, column: 10, scope: !3266)
!3274 = !DILocation(line: 3283, column: 3, scope: !3266)
!3275 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !72, file: !72, line: 3305, type: !301, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3276 = !DILocalVariable(name: "value", arg: 1, scope: !3275, file: !72, line: 3305, type: !25)
!3277 = !DILocation(line: 3305, column: 30, scope: !3275)
!3278 = !DILocalVariable(name: "factor", arg: 2, scope: !3275, file: !72, line: 3305, type: !25)
!3279 = !DILocation(line: 3305, column: 41, scope: !3275)
!3280 = !DILocation(line: 3307, column: 44, scope: !3275)
!3281 = !DILocation(line: 3307, column: 50, scope: !3275)
!3282 = !DILocation(line: 3307, column: 10, scope: !3275)
!3283 = !DILocation(line: 3307, column: 3, scope: !3275)
!3284 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !72, file: !72, line: 3328, type: !390, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3285 = !DILocalVariable(name: "value", arg: 1, scope: !3284, file: !72, line: 3328, type: !25)
!3286 = !DILocation(line: 3328, column: 33, scope: !3284)
!3287 = !DILocalVariable(name: "factor", arg: 2, scope: !3284, file: !72, line: 3328, type: !34)
!3288 = !DILocation(line: 3328, column: 44, scope: !3284)
!3289 = !DILocation(line: 3330, column: 41, scope: !3284)
!3290 = !DILocation(line: 3330, column: 47, scope: !3284)
!3291 = !DILocation(line: 3330, column: 10, scope: !3284)
!3292 = !DILocation(line: 3330, column: 3, scope: !3284)
!3293 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !72, file: !72, line: 3351, type: !390, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3294 = !DILocalVariable(name: "value", arg: 1, scope: !3293, file: !72, line: 3351, type: !25)
!3295 = !DILocation(line: 3351, column: 32, scope: !3293)
!3296 = !DILocalVariable(name: "factor", arg: 2, scope: !3293, file: !72, line: 3351, type: !34)
!3297 = !DILocation(line: 3351, column: 43, scope: !3293)
!3298 = !DILocation(line: 3353, column: 33, scope: !3293)
!3299 = !DILocation(line: 3353, column: 39, scope: !3293)
!3300 = !DILocation(line: 3353, column: 2, scope: !3293)
!3301 = !DILocation(line: 3354, column: 1, scope: !3293)
!3302 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !72, file: !72, line: 3375, type: !390, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3303 = !DILocalVariable(name: "value", arg: 1, scope: !3302, file: !72, line: 3375, type: !25)
!3304 = !DILocation(line: 3375, column: 31, scope: !3302)
!3305 = !DILocalVariable(name: "factor", arg: 2, scope: !3302, file: !72, line: 3375, type: !34)
!3306 = !DILocation(line: 3375, column: 42, scope: !3302)
!3307 = !DILocation(line: 3377, column: 41, scope: !3302)
!3308 = !DILocation(line: 3377, column: 47, scope: !3302)
!3309 = !DILocation(line: 3377, column: 10, scope: !3302)
!3310 = !DILocation(line: 3377, column: 3, scope: !3302)
!3311 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !72, file: !72, line: 3400, type: !390, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3312 = !DILocalVariable(name: "value", arg: 1, scope: !3311, file: !72, line: 3400, type: !25)
!3313 = !DILocation(line: 3400, column: 33, scope: !3311)
!3314 = !DILocalVariable(name: "factor", arg: 2, scope: !3311, file: !72, line: 3400, type: !34)
!3315 = !DILocation(line: 3400, column: 44, scope: !3311)
!3316 = !DILocation(line: 3402, column: 44, scope: !3311)
!3317 = !DILocation(line: 3402, column: 50, scope: !3311)
!3318 = !DILocation(line: 3402, column: 10, scope: !3311)
!3319 = !DILocation(line: 3402, column: 3, scope: !3311)
!3320 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !72, file: !72, line: 3425, type: !390, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3321 = !DILocalVariable(name: "value", arg: 1, scope: !3320, file: !72, line: 3425, type: !25)
!3322 = !DILocation(line: 3425, column: 32, scope: !3320)
!3323 = !DILocalVariable(name: "factor", arg: 2, scope: !3320, file: !72, line: 3425, type: !34)
!3324 = !DILocation(line: 3425, column: 43, scope: !3320)
!3325 = !DILocation(line: 3427, column: 44, scope: !3320)
!3326 = !DILocation(line: 3427, column: 50, scope: !3320)
!3327 = !DILocation(line: 3427, column: 10, scope: !3320)
!3328 = !DILocation(line: 3427, column: 3, scope: !3320)
!3329 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !72, file: !72, line: 3450, type: !390, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3330 = !DILocalVariable(name: "value", arg: 1, scope: !3329, file: !72, line: 3450, type: !25)
!3331 = !DILocation(line: 3450, column: 31, scope: !3329)
!3332 = !DILocalVariable(name: "factor", arg: 2, scope: !3329, file: !72, line: 3450, type: !34)
!3333 = !DILocation(line: 3450, column: 42, scope: !3329)
!3334 = !DILocation(line: 3452, column: 44, scope: !3329)
!3335 = !DILocation(line: 3452, column: 50, scope: !3329)
!3336 = !DILocation(line: 3452, column: 10, scope: !3329)
!3337 = !DILocation(line: 3452, column: 3, scope: !3329)
!3338 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !72, file: !72, line: 3475, type: !390, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3339 = !DILocalVariable(name: "value", arg: 1, scope: !3338, file: !72, line: 3475, type: !25)
!3340 = !DILocation(line: 3475, column: 33, scope: !3338)
!3341 = !DILocalVariable(name: "factor", arg: 2, scope: !3338, file: !72, line: 3475, type: !34)
!3342 = !DILocation(line: 3475, column: 44, scope: !3338)
!3343 = !DILocation(line: 3477, column: 44, scope: !3338)
!3344 = !DILocation(line: 3477, column: 50, scope: !3338)
!3345 = !DILocation(line: 3477, column: 10, scope: !3338)
!3346 = !DILocation(line: 3477, column: 3, scope: !3338)
!3347 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !72, file: !72, line: 3500, type: !390, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3348 = !DILocalVariable(name: "value", arg: 1, scope: !3347, file: !72, line: 3500, type: !25)
!3349 = !DILocation(line: 3500, column: 32, scope: !3347)
!3350 = !DILocalVariable(name: "factor", arg: 2, scope: !3347, file: !72, line: 3500, type: !34)
!3351 = !DILocation(line: 3500, column: 43, scope: !3347)
!3352 = !DILocation(line: 3502, column: 44, scope: !3347)
!3353 = !DILocation(line: 3502, column: 50, scope: !3347)
!3354 = !DILocation(line: 3502, column: 10, scope: !3347)
!3355 = !DILocation(line: 3502, column: 3, scope: !3347)
!3356 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !72, file: !72, line: 3524, type: !390, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3357 = !DILocalVariable(name: "value", arg: 1, scope: !3356, file: !72, line: 3524, type: !25)
!3358 = !DILocation(line: 3524, column: 31, scope: !3356)
!3359 = !DILocalVariable(name: "factor", arg: 2, scope: !3356, file: !72, line: 3524, type: !34)
!3360 = !DILocation(line: 3524, column: 42, scope: !3356)
!3361 = !DILocation(line: 3526, column: 44, scope: !3356)
!3362 = !DILocation(line: 3526, column: 50, scope: !3356)
!3363 = !DILocation(line: 3526, column: 10, scope: !3356)
!3364 = !DILocation(line: 3526, column: 3, scope: !3356)
!3365 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !72, file: !72, line: 3548, type: !390, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3366 = !DILocalVariable(name: "value", arg: 1, scope: !3365, file: !72, line: 3548, type: !25)
!3367 = !DILocation(line: 3548, column: 30, scope: !3365)
!3368 = !DILocalVariable(name: "factor", arg: 2, scope: !3365, file: !72, line: 3548, type: !34)
!3369 = !DILocation(line: 3548, column: 41, scope: !3365)
!3370 = !DILocation(line: 3550, column: 44, scope: !3365)
!3371 = !DILocation(line: 3550, column: 50, scope: !3365)
!3372 = !DILocation(line: 3550, column: 10, scope: !3365)
!3373 = !DILocation(line: 3550, column: 3, scope: !3365)
!3374 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !72, file: !72, line: 3572, type: !390, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3375 = !DILocalVariable(name: "value", arg: 1, scope: !3374, file: !72, line: 3572, type: !25)
!3376 = !DILocation(line: 3572, column: 33, scope: !3374)
!3377 = !DILocalVariable(name: "factor", arg: 2, scope: !3374, file: !72, line: 3572, type: !34)
!3378 = !DILocation(line: 3572, column: 44, scope: !3374)
!3379 = !DILocation(line: 3574, column: 44, scope: !3374)
!3380 = !DILocation(line: 3574, column: 50, scope: !3374)
!3381 = !DILocation(line: 3574, column: 10, scope: !3374)
!3382 = !DILocation(line: 3574, column: 3, scope: !3374)
!3383 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !72, file: !72, line: 3596, type: !390, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3384 = !DILocalVariable(name: "value", arg: 1, scope: !3383, file: !72, line: 3596, type: !25)
!3385 = !DILocation(line: 3596, column: 32, scope: !3383)
!3386 = !DILocalVariable(name: "factor", arg: 2, scope: !3383, file: !72, line: 3596, type: !34)
!3387 = !DILocation(line: 3596, column: 43, scope: !3383)
!3388 = !DILocation(line: 3598, column: 44, scope: !3383)
!3389 = !DILocation(line: 3598, column: 50, scope: !3383)
!3390 = !DILocation(line: 3598, column: 10, scope: !3383)
!3391 = !DILocation(line: 3598, column: 3, scope: !3383)
!3392 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !72, file: !72, line: 3620, type: !390, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3393 = !DILocalVariable(name: "value", arg: 1, scope: !3392, file: !72, line: 3620, type: !25)
!3394 = !DILocation(line: 3620, column: 31, scope: !3392)
!3395 = !DILocalVariable(name: "factor", arg: 2, scope: !3392, file: !72, line: 3620, type: !34)
!3396 = !DILocation(line: 3620, column: 42, scope: !3392)
!3397 = !DILocation(line: 3622, column: 44, scope: !3392)
!3398 = !DILocation(line: 3622, column: 50, scope: !3392)
!3399 = !DILocation(line: 3622, column: 10, scope: !3392)
!3400 = !DILocation(line: 3622, column: 3, scope: !3392)
!3401 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !72, file: !72, line: 3644, type: !390, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3402 = !DILocalVariable(name: "value", arg: 1, scope: !3401, file: !72, line: 3644, type: !25)
!3403 = !DILocation(line: 3644, column: 30, scope: !3401)
!3404 = !DILocalVariable(name: "factor", arg: 2, scope: !3401, file: !72, line: 3644, type: !34)
!3405 = !DILocation(line: 3644, column: 41, scope: !3401)
!3406 = !DILocation(line: 3646, column: 44, scope: !3401)
!3407 = !DILocation(line: 3646, column: 50, scope: !3401)
!3408 = !DILocation(line: 3646, column: 10, scope: !3401)
!3409 = !DILocation(line: 3646, column: 3, scope: !3401)
!3410 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !72, file: !72, line: 3666, type: !475, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3411 = !DILocalVariable(name: "value", arg: 1, scope: !3410, file: !72, line: 3666, type: !25)
!3412 = !DILocation(line: 3666, column: 32, scope: !3410)
!3413 = !DILocalVariable(name: "factor", arg: 2, scope: !3410, file: !72, line: 3666, type: !29)
!3414 = !DILocation(line: 3666, column: 42, scope: !3410)
!3415 = !DILocation(line: 3668, column: 40, scope: !3410)
!3416 = !DILocation(line: 3668, column: 58, scope: !3410)
!3417 = !DILocation(line: 3668, column: 52, scope: !3410)
!3418 = !DILocation(line: 3668, column: 66, scope: !3410)
!3419 = !DILocation(line: 3668, column: 46, scope: !3410)
!3420 = !DILocation(line: 3668, column: 10, scope: !3410)
!3421 = !DILocation(line: 3668, column: 3, scope: !3410)
!3422 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !72, file: !72, line: 3688, type: !475, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3423 = !DILocalVariable(name: "value", arg: 1, scope: !3422, file: !72, line: 3688, type: !25)
!3424 = !DILocation(line: 3688, column: 31, scope: !3422)
!3425 = !DILocalVariable(name: "factor", arg: 2, scope: !3422, file: !72, line: 3688, type: !29)
!3426 = !DILocation(line: 3688, column: 41, scope: !3422)
!3427 = !DILocation(line: 3690, column: 40, scope: !3422)
!3428 = !DILocation(line: 3690, column: 58, scope: !3422)
!3429 = !DILocation(line: 3690, column: 52, scope: !3422)
!3430 = !DILocation(line: 3690, column: 66, scope: !3422)
!3431 = !DILocation(line: 3690, column: 46, scope: !3422)
!3432 = !DILocation(line: 3690, column: 10, scope: !3422)
!3433 = !DILocation(line: 3690, column: 3, scope: !3422)
!3434 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !72, file: !72, line: 3711, type: !475, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3435 = !DILocalVariable(name: "value", arg: 1, scope: !3434, file: !72, line: 3711, type: !25)
!3436 = !DILocation(line: 3711, column: 30, scope: !3434)
!3437 = !DILocalVariable(name: "factor", arg: 2, scope: !3434, file: !72, line: 3711, type: !29)
!3438 = !DILocation(line: 3711, column: 40, scope: !3434)
!3439 = !DILocation(line: 3713, column: 40, scope: !3434)
!3440 = !DILocation(line: 3713, column: 58, scope: !3434)
!3441 = !DILocation(line: 3713, column: 52, scope: !3434)
!3442 = !DILocation(line: 3713, column: 66, scope: !3434)
!3443 = !DILocation(line: 3713, column: 46, scope: !3434)
!3444 = !DILocation(line: 3713, column: 10, scope: !3434)
!3445 = !DILocation(line: 3713, column: 3, scope: !3434)
!3446 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !72, file: !72, line: 3734, type: !475, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3447 = !DILocalVariable(name: "value", arg: 1, scope: !3446, file: !72, line: 3734, type: !25)
!3448 = !DILocation(line: 3734, column: 31, scope: !3446)
!3449 = !DILocalVariable(name: "factor", arg: 2, scope: !3446, file: !72, line: 3734, type: !29)
!3450 = !DILocation(line: 3734, column: 41, scope: !3446)
!3451 = !DILocation(line: 3736, column: 43, scope: !3446)
!3452 = !DILocation(line: 3736, column: 61, scope: !3446)
!3453 = !DILocation(line: 3736, column: 55, scope: !3446)
!3454 = !DILocation(line: 3736, column: 69, scope: !3446)
!3455 = !DILocation(line: 3736, column: 49, scope: !3446)
!3456 = !DILocation(line: 3736, column: 10, scope: !3446)
!3457 = !DILocation(line: 3736, column: 3, scope: !3446)
!3458 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !72, file: !72, line: 3757, type: !475, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3459 = !DILocalVariable(name: "value", arg: 1, scope: !3458, file: !72, line: 3757, type: !25)
!3460 = !DILocation(line: 3757, column: 30, scope: !3458)
!3461 = !DILocalVariable(name: "factor", arg: 2, scope: !3458, file: !72, line: 3757, type: !29)
!3462 = !DILocation(line: 3757, column: 40, scope: !3458)
!3463 = !DILocation(line: 3759, column: 43, scope: !3458)
!3464 = !DILocation(line: 3759, column: 61, scope: !3458)
!3465 = !DILocation(line: 3759, column: 55, scope: !3458)
!3466 = !DILocation(line: 3759, column: 69, scope: !3458)
!3467 = !DILocation(line: 3759, column: 49, scope: !3458)
!3468 = !DILocation(line: 3759, column: 10, scope: !3458)
!3469 = !DILocation(line: 3759, column: 3, scope: !3458)
!3470 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !72, file: !72, line: 3779, type: !475, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3471 = !DILocalVariable(name: "value", arg: 1, scope: !3470, file: !72, line: 3779, type: !25)
!3472 = !DILocation(line: 3779, column: 30, scope: !3470)
!3473 = !DILocalVariable(name: "factor", arg: 2, scope: !3470, file: !72, line: 3779, type: !29)
!3474 = !DILocation(line: 3779, column: 40, scope: !3470)
!3475 = !DILocation(line: 3781, column: 43, scope: !3470)
!3476 = !DILocation(line: 3781, column: 61, scope: !3470)
!3477 = !DILocation(line: 3781, column: 55, scope: !3470)
!3478 = !DILocation(line: 3781, column: 69, scope: !3470)
!3479 = !DILocation(line: 3781, column: 49, scope: !3470)
!3480 = !DILocation(line: 3781, column: 10, scope: !3470)
!3481 = !DILocation(line: 3781, column: 3, scope: !3470)
!3482 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !72, file: !72, line: 3801, type: !475, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3483 = !DILocalVariable(name: "value", arg: 1, scope: !3482, file: !72, line: 3801, type: !25)
!3484 = !DILocation(line: 3801, column: 29, scope: !3482)
!3485 = !DILocalVariable(name: "factor", arg: 2, scope: !3482, file: !72, line: 3801, type: !29)
!3486 = !DILocation(line: 3801, column: 39, scope: !3482)
!3487 = !DILocation(line: 3803, column: 43, scope: !3482)
!3488 = !DILocation(line: 3803, column: 61, scope: !3482)
!3489 = !DILocation(line: 3803, column: 55, scope: !3482)
!3490 = !DILocation(line: 3803, column: 69, scope: !3482)
!3491 = !DILocation(line: 3803, column: 49, scope: !3482)
!3492 = !DILocation(line: 3803, column: 10, scope: !3482)
!3493 = !DILocation(line: 3803, column: 3, scope: !3482)
!3494 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !72, file: !72, line: 3823, type: !475, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3495 = !DILocalVariable(name: "value", arg: 1, scope: !3494, file: !72, line: 3823, type: !25)
!3496 = !DILocation(line: 3823, column: 30, scope: !3494)
!3497 = !DILocalVariable(name: "factor", arg: 2, scope: !3494, file: !72, line: 3823, type: !29)
!3498 = !DILocation(line: 3823, column: 40, scope: !3494)
!3499 = !DILocation(line: 3825, column: 43, scope: !3494)
!3500 = !DILocation(line: 3825, column: 61, scope: !3494)
!3501 = !DILocation(line: 3825, column: 55, scope: !3494)
!3502 = !DILocation(line: 3825, column: 69, scope: !3494)
!3503 = !DILocation(line: 3825, column: 49, scope: !3494)
!3504 = !DILocation(line: 3825, column: 10, scope: !3494)
!3505 = !DILocation(line: 3825, column: 3, scope: !3494)
!3506 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !72, file: !72, line: 3845, type: !475, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3507 = !DILocalVariable(name: "value", arg: 1, scope: !3506, file: !72, line: 3845, type: !25)
!3508 = !DILocation(line: 3845, column: 29, scope: !3506)
!3509 = !DILocalVariable(name: "factor", arg: 2, scope: !3506, file: !72, line: 3845, type: !29)
!3510 = !DILocation(line: 3845, column: 39, scope: !3506)
!3511 = !DILocation(line: 3847, column: 43, scope: !3506)
!3512 = !DILocation(line: 3847, column: 61, scope: !3506)
!3513 = !DILocation(line: 3847, column: 55, scope: !3506)
!3514 = !DILocation(line: 3847, column: 69, scope: !3506)
!3515 = !DILocation(line: 3847, column: 49, scope: !3506)
!3516 = !DILocation(line: 3847, column: 10, scope: !3506)
!3517 = !DILocation(line: 3847, column: 3, scope: !3506)
!3518 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !72, file: !72, line: 3869, type: !1870, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3519 = !DILocalVariable(name: "value", arg: 1, scope: !3518, file: !72, line: 3869, type: !80)
!3520 = !DILocation(line: 3869, column: 31, scope: !3518)
!3521 = !DILocalVariable(name: "factor", arg: 2, scope: !3518, file: !72, line: 3869, type: !25)
!3522 = !DILocation(line: 3869, column: 42, scope: !3518)
!3523 = !DILocation(line: 3871, column: 41, scope: !3518)
!3524 = !DILocation(line: 3871, column: 47, scope: !3518)
!3525 = !DILocation(line: 3871, column: 10, scope: !3518)
!3526 = !DILocation(line: 3871, column: 3, scope: !3518)
!3527 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !72, file: !72, line: 5065, type: !3528, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3528 = !DISubroutineType(types: !3529)
!3529 = !{!80, !80, !25, !736}
!3530 = !DILocalVariable(name: "value", arg: 1, scope: !3527, file: !72, line: 5065, type: !80)
!3531 = !DILocation(line: 5065, column: 40, scope: !3527)
!3532 = !DILocalVariable(name: "factor", arg: 2, scope: !3527, file: !72, line: 5065, type: !25)
!3533 = !DILocation(line: 5065, column: 51, scope: !3527)
!3534 = !DILocalVariable(name: "count", arg: 3, scope: !3527, file: !72, line: 5065, type: !736)
!3535 = !DILocation(line: 5065, column: 63, scope: !3527)
!3536 = !DILocalVariable(name: "u32Temp1", scope: !3527, file: !72, line: 5067, type: !736)
!3537 = !DILocation(line: 5067, column: 6, scope: !3527)
!3538 = !DILocalVariable(name: "u32Temp2", scope: !3527, file: !72, line: 5067, type: !736)
!3539 = !DILocation(line: 5067, column: 17, scope: !3527)
!3540 = !DILocalVariable(name: "u32Temp3", scope: !3527, file: !72, line: 5067, type: !736)
!3541 = !DILocation(line: 5067, column: 26, scope: !3527)
!3542 = !DILocalVariable(name: "u32Temp4", scope: !3527, file: !72, line: 5067, type: !736)
!3543 = !DILocation(line: 5067, column: 35, scope: !3527)
!3544 = !DILocalVariable(name: "u8SignBit", scope: !3527, file: !72, line: 5068, type: !29)
!3545 = !DILocation(line: 5068, column: 5, scope: !3527)
!3546 = !DILocation(line: 5070, column: 7, scope: !3547)
!3547 = distinct !DILexicalBlock(scope: !3527, file: !72, line: 5070, column: 5)
!3548 = !DILocation(line: 5070, column: 12, scope: !3547)
!3549 = !DILocation(line: 5070, column: 16, scope: !3547)
!3550 = !DILocation(line: 5070, column: 20, scope: !3547)
!3551 = !DILocation(line: 5070, column: 26, scope: !3547)
!3552 = !DILocation(line: 5070, column: 31, scope: !3547)
!3553 = !DILocation(line: 5070, column: 36, scope: !3547)
!3554 = !DILocation(line: 5070, column: 41, scope: !3547)
!3555 = !DILocation(line: 5070, column: 45, scope: !3547)
!3556 = !DILocation(line: 5070, column: 49, scope: !3547)
!3557 = !DILocation(line: 5070, column: 55, scope: !3547)
!3558 = !DILocation(line: 5070, column: 5, scope: !3527)
!3559 = !DILocation(line: 5072, column: 13, scope: !3560)
!3560 = distinct !DILexicalBlock(scope: !3547, file: !72, line: 5071, column: 2)
!3561 = !DILocation(line: 5073, column: 2, scope: !3560)
!3562 = !DILocation(line: 5076, column: 13, scope: !3563)
!3563 = distinct !DILexicalBlock(scope: !3547, file: !72, line: 5075, column: 2)
!3564 = !DILocation(line: 5079, column: 5, scope: !3565)
!3565 = distinct !DILexicalBlock(scope: !3527, file: !72, line: 5079, column: 5)
!3566 = !DILocation(line: 5079, column: 10, scope: !3565)
!3567 = !DILocation(line: 5079, column: 5, scope: !3527)
!3568 = !DILocation(line: 5081, column: 15, scope: !3569)
!3569 = distinct !DILexicalBlock(scope: !3565, file: !72, line: 5080, column: 2)
!3570 = !DILocation(line: 5081, column: 14, scope: !3569)
!3571 = !DILocation(line: 5081, column: 12, scope: !3569)
!3572 = !DILocation(line: 5082, column: 2, scope: !3569)
!3573 = !DILocation(line: 5085, column: 14, scope: !3574)
!3574 = distinct !DILexicalBlock(scope: !3565, file: !72, line: 5084, column: 2)
!3575 = !DILocation(line: 5085, column: 12, scope: !3574)
!3576 = !DILocation(line: 5088, column: 5, scope: !3577)
!3577 = distinct !DILexicalBlock(scope: !3527, file: !72, line: 5088, column: 5)
!3578 = !DILocation(line: 5088, column: 11, scope: !3577)
!3579 = !DILocation(line: 5088, column: 5, scope: !3527)
!3580 = !DILocation(line: 5090, column: 15, scope: !3581)
!3581 = distinct !DILexicalBlock(scope: !3577, file: !72, line: 5089, column: 2)
!3582 = !DILocation(line: 5090, column: 14, scope: !3581)
!3583 = !DILocation(line: 5090, column: 12, scope: !3581)
!3584 = !DILocation(line: 5091, column: 2, scope: !3581)
!3585 = !DILocation(line: 5094, column: 14, scope: !3586)
!3586 = distinct !DILexicalBlock(scope: !3577, file: !72, line: 5093, column: 2)
!3587 = !DILocation(line: 5094, column: 12, scope: !3586)
!3588 = !DILocation(line: 5097, column: 13, scope: !3527)
!3589 = !DILocation(line: 5097, column: 24, scope: !3527)
!3590 = !DILocation(line: 5097, column: 22, scope: !3527)
!3591 = !DILocation(line: 5097, column: 11, scope: !3527)
!3592 = !DILocation(line: 5098, column: 25, scope: !3527)
!3593 = !DILocation(line: 5098, column: 35, scope: !3527)
!3594 = !DILocation(line: 5098, column: 13, scope: !3527)
!3595 = !DILocation(line: 5098, column: 11, scope: !3527)
!3596 = !DILocation(line: 5099, column: 13, scope: !3527)
!3597 = !DILocation(line: 5099, column: 25, scope: !3527)
!3598 = !DILocation(line: 5099, column: 22, scope: !3527)
!3599 = !DILocation(line: 5099, column: 11, scope: !3527)
!3600 = !DILocation(line: 5100, column: 14, scope: !3527)
!3601 = !DILocation(line: 5100, column: 30, scope: !3527)
!3602 = !DILocation(line: 5100, column: 29, scope: !3527)
!3603 = !DILocation(line: 5100, column: 23, scope: !3527)
!3604 = !DILocation(line: 5100, column: 11, scope: !3527)
!3605 = !DILocation(line: 5101, column: 6, scope: !3606)
!3606 = distinct !DILexicalBlock(scope: !3527, file: !72, line: 5101, column: 5)
!3607 = !DILocation(line: 5101, column: 16, scope: !3606)
!3608 = !DILocation(line: 5101, column: 14, scope: !3606)
!3609 = !DILocation(line: 5101, column: 22, scope: !3606)
!3610 = !DILocation(line: 5101, column: 5, scope: !3527)
!3611 = !DILocation(line: 5103, column: 6, scope: !3612)
!3612 = distinct !DILexicalBlock(scope: !3613, file: !72, line: 5103, column: 6)
!3613 = distinct !DILexicalBlock(scope: !3606, file: !72, line: 5102, column: 2)
!3614 = !DILocation(line: 5103, column: 16, scope: !3612)
!3615 = !DILocation(line: 5103, column: 6, scope: !3613)
!3616 = !DILocation(line: 5105, column: 7, scope: !3617)
!3617 = distinct !DILexicalBlock(scope: !3618, file: !72, line: 5105, column: 7)
!3618 = distinct !DILexicalBlock(scope: !3612, file: !72, line: 5104, column: 3)
!3619 = !DILocation(line: 5105, column: 15, scope: !3617)
!3620 = !DILocation(line: 5105, column: 7, scope: !3618)
!3621 = !DILocation(line: 5106, column: 12, scope: !3617)
!3622 = !DILocation(line: 5106, column: 5, scope: !3617)
!3623 = !DILocation(line: 5108, column: 5, scope: !3617)
!3624 = !DILocation(line: 5112, column: 7, scope: !3625)
!3625 = distinct !DILexicalBlock(scope: !3626, file: !72, line: 5112, column: 7)
!3626 = distinct !DILexicalBlock(scope: !3612, file: !72, line: 5111, column: 3)
!3627 = !DILocation(line: 5112, column: 15, scope: !3625)
!3628 = !DILocation(line: 5112, column: 7, scope: !3626)
!3629 = !DILocation(line: 5113, column: 13, scope: !3625)
!3630 = !DILocation(line: 5113, column: 12, scope: !3625)
!3631 = !DILocation(line: 5113, column: 5, scope: !3625)
!3632 = !DILocation(line: 5115, column: 5, scope: !3625)
!3633 = !DILocation(line: 5120, column: 3, scope: !3634)
!3634 = distinct !DILexicalBlock(scope: !3606, file: !72, line: 5119, column: 2)
!3635 = !DILocation(line: 5122, column: 1, scope: !3527)
!3636 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !72, file: !72, line: 3893, type: !2639, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3637 = !DILocalVariable(name: "value", arg: 1, scope: !3636, file: !72, line: 3893, type: !80)
!3638 = !DILocation(line: 3893, column: 30, scope: !3636)
!3639 = !DILocalVariable(name: "factor", arg: 2, scope: !3636, file: !72, line: 3893, type: !20)
!3640 = !DILocation(line: 3893, column: 40, scope: !3636)
!3641 = !DILocation(line: 3895, column: 40, scope: !3636)
!3642 = !DILocation(line: 3895, column: 46, scope: !3636)
!3643 = !DILocation(line: 3895, column: 10, scope: !3636)
!3644 = !DILocation(line: 3895, column: 3, scope: !3636)
!3645 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !72, file: !72, line: 5217, type: !3646, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3646 = !DISubroutineType(types: !3647)
!3647 = !{!80, !80, !20, !736}
!3648 = !DILocalVariable(name: "value", arg: 1, scope: !3645, file: !72, line: 5217, type: !80)
!3649 = !DILocation(line: 5217, column: 39, scope: !3645)
!3650 = !DILocalVariable(name: "factor", arg: 2, scope: !3645, file: !72, line: 5217, type: !20)
!3651 = !DILocation(line: 5217, column: 49, scope: !3645)
!3652 = !DILocalVariable(name: "count", arg: 3, scope: !3645, file: !72, line: 5217, type: !736)
!3653 = !DILocation(line: 5217, column: 61, scope: !3645)
!3654 = !DILocalVariable(name: "u32Temp1", scope: !3645, file: !72, line: 5219, type: !736)
!3655 = !DILocation(line: 5219, column: 6, scope: !3645)
!3656 = !DILocalVariable(name: "u32Temp2", scope: !3645, file: !72, line: 5219, type: !736)
!3657 = !DILocation(line: 5219, column: 17, scope: !3645)
!3658 = !DILocalVariable(name: "u32Temp3", scope: !3645, file: !72, line: 5219, type: !736)
!3659 = !DILocation(line: 5219, column: 26, scope: !3645)
!3660 = !DILocalVariable(name: "u32Temp4", scope: !3645, file: !72, line: 5219, type: !736)
!3661 = !DILocation(line: 5219, column: 35, scope: !3645)
!3662 = !DILocalVariable(name: "u8SignBit", scope: !3645, file: !72, line: 5220, type: !29)
!3663 = !DILocation(line: 5220, column: 5, scope: !3645)
!3664 = !DILocation(line: 5222, column: 7, scope: !3665)
!3665 = distinct !DILexicalBlock(scope: !3645, file: !72, line: 5222, column: 5)
!3666 = !DILocation(line: 5222, column: 12, scope: !3665)
!3667 = !DILocation(line: 5222, column: 16, scope: !3665)
!3668 = !DILocation(line: 5222, column: 20, scope: !3665)
!3669 = !DILocation(line: 5222, column: 26, scope: !3665)
!3670 = !DILocation(line: 5222, column: 31, scope: !3665)
!3671 = !DILocation(line: 5222, column: 36, scope: !3665)
!3672 = !DILocation(line: 5222, column: 41, scope: !3665)
!3673 = !DILocation(line: 5222, column: 45, scope: !3665)
!3674 = !DILocation(line: 5222, column: 49, scope: !3665)
!3675 = !DILocation(line: 5222, column: 55, scope: !3665)
!3676 = !DILocation(line: 5222, column: 5, scope: !3645)
!3677 = !DILocation(line: 5224, column: 13, scope: !3678)
!3678 = distinct !DILexicalBlock(scope: !3665, file: !72, line: 5223, column: 2)
!3679 = !DILocation(line: 5225, column: 2, scope: !3678)
!3680 = !DILocation(line: 5228, column: 13, scope: !3681)
!3681 = distinct !DILexicalBlock(scope: !3665, file: !72, line: 5227, column: 2)
!3682 = !DILocation(line: 5231, column: 5, scope: !3683)
!3683 = distinct !DILexicalBlock(scope: !3645, file: !72, line: 5231, column: 5)
!3684 = !DILocation(line: 5231, column: 10, scope: !3683)
!3685 = !DILocation(line: 5231, column: 5, scope: !3645)
!3686 = !DILocation(line: 5233, column: 15, scope: !3687)
!3687 = distinct !DILexicalBlock(scope: !3683, file: !72, line: 5232, column: 2)
!3688 = !DILocation(line: 5233, column: 14, scope: !3687)
!3689 = !DILocation(line: 5233, column: 12, scope: !3687)
!3690 = !DILocation(line: 5234, column: 2, scope: !3687)
!3691 = !DILocation(line: 5237, column: 14, scope: !3692)
!3692 = distinct !DILexicalBlock(scope: !3683, file: !72, line: 5236, column: 2)
!3693 = !DILocation(line: 5237, column: 12, scope: !3692)
!3694 = !DILocation(line: 5240, column: 5, scope: !3695)
!3695 = distinct !DILexicalBlock(scope: !3645, file: !72, line: 5240, column: 5)
!3696 = !DILocation(line: 5240, column: 11, scope: !3695)
!3697 = !DILocation(line: 5240, column: 5, scope: !3645)
!3698 = !DILocation(line: 5242, column: 15, scope: !3699)
!3699 = distinct !DILexicalBlock(scope: !3695, file: !72, line: 5241, column: 2)
!3700 = !DILocation(line: 5242, column: 14, scope: !3699)
!3701 = !DILocation(line: 5242, column: 12, scope: !3699)
!3702 = !DILocation(line: 5243, column: 2, scope: !3699)
!3703 = !DILocation(line: 5246, column: 14, scope: !3704)
!3704 = distinct !DILexicalBlock(scope: !3695, file: !72, line: 5245, column: 2)
!3705 = !DILocation(line: 5246, column: 12, scope: !3704)
!3706 = !DILocation(line: 5249, column: 13, scope: !3645)
!3707 = !DILocation(line: 5249, column: 24, scope: !3645)
!3708 = !DILocation(line: 5249, column: 22, scope: !3645)
!3709 = !DILocation(line: 5249, column: 11, scope: !3645)
!3710 = !DILocation(line: 5250, column: 25, scope: !3645)
!3711 = !DILocation(line: 5250, column: 35, scope: !3645)
!3712 = !DILocation(line: 5250, column: 13, scope: !3645)
!3713 = !DILocation(line: 5250, column: 11, scope: !3645)
!3714 = !DILocation(line: 5251, column: 13, scope: !3645)
!3715 = !DILocation(line: 5251, column: 25, scope: !3645)
!3716 = !DILocation(line: 5251, column: 22, scope: !3645)
!3717 = !DILocation(line: 5251, column: 11, scope: !3645)
!3718 = !DILocation(line: 5252, column: 14, scope: !3645)
!3719 = !DILocation(line: 5252, column: 30, scope: !3645)
!3720 = !DILocation(line: 5252, column: 29, scope: !3645)
!3721 = !DILocation(line: 5252, column: 23, scope: !3645)
!3722 = !DILocation(line: 5252, column: 11, scope: !3645)
!3723 = !DILocation(line: 5253, column: 6, scope: !3724)
!3724 = distinct !DILexicalBlock(scope: !3645, file: !72, line: 5253, column: 5)
!3725 = !DILocation(line: 5253, column: 16, scope: !3724)
!3726 = !DILocation(line: 5253, column: 14, scope: !3724)
!3727 = !DILocation(line: 5253, column: 22, scope: !3724)
!3728 = !DILocation(line: 5253, column: 5, scope: !3645)
!3729 = !DILocation(line: 5255, column: 6, scope: !3730)
!3730 = distinct !DILexicalBlock(scope: !3731, file: !72, line: 5255, column: 6)
!3731 = distinct !DILexicalBlock(scope: !3724, file: !72, line: 5254, column: 2)
!3732 = !DILocation(line: 5255, column: 16, scope: !3730)
!3733 = !DILocation(line: 5255, column: 6, scope: !3731)
!3734 = !DILocation(line: 5257, column: 7, scope: !3735)
!3735 = distinct !DILexicalBlock(scope: !3736, file: !72, line: 5257, column: 7)
!3736 = distinct !DILexicalBlock(scope: !3730, file: !72, line: 5256, column: 3)
!3737 = !DILocation(line: 5257, column: 15, scope: !3735)
!3738 = !DILocation(line: 5257, column: 7, scope: !3736)
!3739 = !DILocation(line: 5258, column: 12, scope: !3735)
!3740 = !DILocation(line: 5258, column: 5, scope: !3735)
!3741 = !DILocation(line: 5260, column: 5, scope: !3735)
!3742 = !DILocation(line: 5264, column: 7, scope: !3743)
!3743 = distinct !DILexicalBlock(scope: !3744, file: !72, line: 5264, column: 7)
!3744 = distinct !DILexicalBlock(scope: !3730, file: !72, line: 5263, column: 3)
!3745 = !DILocation(line: 5264, column: 15, scope: !3743)
!3746 = !DILocation(line: 5264, column: 7, scope: !3744)
!3747 = !DILocation(line: 5265, column: 13, scope: !3743)
!3748 = !DILocation(line: 5265, column: 12, scope: !3743)
!3749 = !DILocation(line: 5265, column: 5, scope: !3743)
!3750 = !DILocation(line: 5267, column: 5, scope: !3743)
!3751 = !DILocation(line: 5272, column: 3, scope: !3752)
!3752 = distinct !DILexicalBlock(scope: !3724, file: !72, line: 5271, column: 2)
!3753 = !DILocation(line: 5274, column: 1, scope: !3645)
!3754 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !72, file: !72, line: 3917, type: !775, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3755 = !DILocalVariable(name: "value", arg: 1, scope: !3754, file: !72, line: 3917, type: !80)
!3756 = !DILocation(line: 3917, column: 31, scope: !3754)
!3757 = !DILocalVariable(name: "factor", arg: 2, scope: !3754, file: !72, line: 3917, type: !34)
!3758 = !DILocation(line: 3917, column: 42, scope: !3754)
!3759 = !DILocation(line: 3919, column: 41, scope: !3754)
!3760 = !DILocation(line: 3919, column: 47, scope: !3754)
!3761 = !DILocation(line: 3919, column: 10, scope: !3754)
!3762 = !DILocation(line: 3919, column: 3, scope: !3754)
!3763 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !72, file: !72, line: 5141, type: !3764, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3764 = !DISubroutineType(types: !3765)
!3765 = !{!80, !80, !34, !736}
!3766 = !DILocalVariable(name: "value", arg: 1, scope: !3763, file: !72, line: 5141, type: !80)
!3767 = !DILocation(line: 5141, column: 40, scope: !3763)
!3768 = !DILocalVariable(name: "factor", arg: 2, scope: !3763, file: !72, line: 5141, type: !34)
!3769 = !DILocation(line: 5141, column: 50, scope: !3763)
!3770 = !DILocalVariable(name: "count", arg: 3, scope: !3763, file: !72, line: 5141, type: !736)
!3771 = !DILocation(line: 5141, column: 62, scope: !3763)
!3772 = !DILocalVariable(name: "u32Temp1", scope: !3763, file: !72, line: 5143, type: !736)
!3773 = !DILocation(line: 5143, column: 6, scope: !3763)
!3774 = !DILocalVariable(name: "u32Temp2", scope: !3763, file: !72, line: 5143, type: !736)
!3775 = !DILocation(line: 5143, column: 17, scope: !3763)
!3776 = !DILocalVariable(name: "u32Temp3", scope: !3763, file: !72, line: 5143, type: !736)
!3777 = !DILocation(line: 5143, column: 26, scope: !3763)
!3778 = !DILocalVariable(name: "u32Temp4", scope: !3763, file: !72, line: 5143, type: !736)
!3779 = !DILocation(line: 5143, column: 35, scope: !3763)
!3780 = !DILocalVariable(name: "u8SignBit", scope: !3763, file: !72, line: 5144, type: !29)
!3781 = !DILocation(line: 5144, column: 5, scope: !3763)
!3782 = !DILocation(line: 5146, column: 7, scope: !3783)
!3783 = distinct !DILexicalBlock(scope: !3763, file: !72, line: 5146, column: 5)
!3784 = !DILocation(line: 5146, column: 12, scope: !3783)
!3785 = !DILocation(line: 5146, column: 16, scope: !3783)
!3786 = !DILocation(line: 5146, column: 20, scope: !3783)
!3787 = !DILocation(line: 5146, column: 26, scope: !3783)
!3788 = !DILocation(line: 5146, column: 31, scope: !3783)
!3789 = !DILocation(line: 5146, column: 36, scope: !3783)
!3790 = !DILocation(line: 5146, column: 41, scope: !3783)
!3791 = !DILocation(line: 5146, column: 45, scope: !3783)
!3792 = !DILocation(line: 5146, column: 49, scope: !3783)
!3793 = !DILocation(line: 5146, column: 55, scope: !3783)
!3794 = !DILocation(line: 5146, column: 5, scope: !3763)
!3795 = !DILocation(line: 5148, column: 13, scope: !3796)
!3796 = distinct !DILexicalBlock(scope: !3783, file: !72, line: 5147, column: 2)
!3797 = !DILocation(line: 5149, column: 2, scope: !3796)
!3798 = !DILocation(line: 5152, column: 13, scope: !3799)
!3799 = distinct !DILexicalBlock(scope: !3783, file: !72, line: 5151, column: 2)
!3800 = !DILocation(line: 5155, column: 5, scope: !3801)
!3801 = distinct !DILexicalBlock(scope: !3763, file: !72, line: 5155, column: 5)
!3802 = !DILocation(line: 5155, column: 10, scope: !3801)
!3803 = !DILocation(line: 5155, column: 5, scope: !3763)
!3804 = !DILocation(line: 5157, column: 15, scope: !3805)
!3805 = distinct !DILexicalBlock(scope: !3801, file: !72, line: 5156, column: 2)
!3806 = !DILocation(line: 5157, column: 14, scope: !3805)
!3807 = !DILocation(line: 5157, column: 12, scope: !3805)
!3808 = !DILocation(line: 5158, column: 2, scope: !3805)
!3809 = !DILocation(line: 5161, column: 14, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3801, file: !72, line: 5160, column: 2)
!3811 = !DILocation(line: 5161, column: 12, scope: !3810)
!3812 = !DILocation(line: 5164, column: 5, scope: !3813)
!3813 = distinct !DILexicalBlock(scope: !3763, file: !72, line: 5164, column: 5)
!3814 = !DILocation(line: 5164, column: 11, scope: !3813)
!3815 = !DILocation(line: 5164, column: 5, scope: !3763)
!3816 = !DILocation(line: 5166, column: 15, scope: !3817)
!3817 = distinct !DILexicalBlock(scope: !3813, file: !72, line: 5165, column: 2)
!3818 = !DILocation(line: 5166, column: 14, scope: !3817)
!3819 = !DILocation(line: 5166, column: 12, scope: !3817)
!3820 = !DILocation(line: 5167, column: 2, scope: !3817)
!3821 = !DILocation(line: 5170, column: 14, scope: !3822)
!3822 = distinct !DILexicalBlock(scope: !3813, file: !72, line: 5169, column: 2)
!3823 = !DILocation(line: 5170, column: 12, scope: !3822)
!3824 = !DILocation(line: 5173, column: 13, scope: !3763)
!3825 = !DILocation(line: 5173, column: 24, scope: !3763)
!3826 = !DILocation(line: 5173, column: 22, scope: !3763)
!3827 = !DILocation(line: 5173, column: 11, scope: !3763)
!3828 = !DILocation(line: 5174, column: 25, scope: !3763)
!3829 = !DILocation(line: 5174, column: 35, scope: !3763)
!3830 = !DILocation(line: 5174, column: 13, scope: !3763)
!3831 = !DILocation(line: 5174, column: 11, scope: !3763)
!3832 = !DILocation(line: 5175, column: 13, scope: !3763)
!3833 = !DILocation(line: 5175, column: 25, scope: !3763)
!3834 = !DILocation(line: 5175, column: 22, scope: !3763)
!3835 = !DILocation(line: 5175, column: 11, scope: !3763)
!3836 = !DILocation(line: 5176, column: 14, scope: !3763)
!3837 = !DILocation(line: 5176, column: 30, scope: !3763)
!3838 = !DILocation(line: 5176, column: 29, scope: !3763)
!3839 = !DILocation(line: 5176, column: 23, scope: !3763)
!3840 = !DILocation(line: 5176, column: 11, scope: !3763)
!3841 = !DILocation(line: 5177, column: 6, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3763, file: !72, line: 5177, column: 5)
!3843 = !DILocation(line: 5177, column: 16, scope: !3842)
!3844 = !DILocation(line: 5177, column: 14, scope: !3842)
!3845 = !DILocation(line: 5177, column: 22, scope: !3842)
!3846 = !DILocation(line: 5177, column: 5, scope: !3763)
!3847 = !DILocation(line: 5179, column: 6, scope: !3848)
!3848 = distinct !DILexicalBlock(scope: !3849, file: !72, line: 5179, column: 6)
!3849 = distinct !DILexicalBlock(scope: !3842, file: !72, line: 5178, column: 2)
!3850 = !DILocation(line: 5179, column: 16, scope: !3848)
!3851 = !DILocation(line: 5179, column: 6, scope: !3849)
!3852 = !DILocation(line: 5181, column: 7, scope: !3853)
!3853 = distinct !DILexicalBlock(scope: !3854, file: !72, line: 5181, column: 7)
!3854 = distinct !DILexicalBlock(scope: !3848, file: !72, line: 5180, column: 3)
!3855 = !DILocation(line: 5181, column: 15, scope: !3853)
!3856 = !DILocation(line: 5181, column: 7, scope: !3854)
!3857 = !DILocation(line: 5182, column: 12, scope: !3853)
!3858 = !DILocation(line: 5182, column: 5, scope: !3853)
!3859 = !DILocation(line: 5184, column: 5, scope: !3853)
!3860 = !DILocation(line: 5188, column: 7, scope: !3861)
!3861 = distinct !DILexicalBlock(scope: !3862, file: !72, line: 5188, column: 7)
!3862 = distinct !DILexicalBlock(scope: !3848, file: !72, line: 5187, column: 3)
!3863 = !DILocation(line: 5188, column: 15, scope: !3861)
!3864 = !DILocation(line: 5188, column: 7, scope: !3862)
!3865 = !DILocation(line: 5189, column: 13, scope: !3861)
!3866 = !DILocation(line: 5189, column: 12, scope: !3861)
!3867 = !DILocation(line: 5189, column: 5, scope: !3861)
!3868 = !DILocation(line: 5191, column: 5, scope: !3861)
!3869 = !DILocation(line: 5196, column: 3, scope: !3870)
!3870 = distinct !DILexicalBlock(scope: !3842, file: !72, line: 5195, column: 2)
!3871 = !DILocation(line: 5198, column: 1, scope: !3763)
!3872 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !72, file: !72, line: 3941, type: !2344, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3873 = !DILocalVariable(name: "value", arg: 1, scope: !3872, file: !72, line: 3941, type: !80)
!3874 = !DILocation(line: 3941, column: 30, scope: !3872)
!3875 = !DILocalVariable(name: "factor", arg: 2, scope: !3872, file: !72, line: 3941, type: !29)
!3876 = !DILocation(line: 3941, column: 40, scope: !3872)
!3877 = !DILocation(line: 3943, column: 40, scope: !3872)
!3878 = !DILocation(line: 3943, column: 46, scope: !3872)
!3879 = !DILocation(line: 3943, column: 10, scope: !3872)
!3880 = !DILocation(line: 3943, column: 3, scope: !3872)
!3881 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !72, file: !72, line: 5536, type: !3882, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3882 = !DISubroutineType(types: !3883)
!3883 = !{!80, !80, !29, !736}
!3884 = !DILocalVariable(name: "value", arg: 1, scope: !3881, file: !72, line: 5536, type: !80)
!3885 = !DILocation(line: 5536, column: 39, scope: !3881)
!3886 = !DILocalVariable(name: "factor", arg: 2, scope: !3881, file: !72, line: 5536, type: !29)
!3887 = !DILocation(line: 5536, column: 49, scope: !3881)
!3888 = !DILocalVariable(name: "count", arg: 3, scope: !3881, file: !72, line: 5536, type: !736)
!3889 = !DILocation(line: 5536, column: 61, scope: !3881)
!3890 = !DILocalVariable(name: "u32Temp1", scope: !3881, file: !72, line: 5538, type: !736)
!3891 = !DILocation(line: 5538, column: 6, scope: !3881)
!3892 = !DILocalVariable(name: "u32Temp2", scope: !3881, file: !72, line: 5538, type: !736)
!3893 = !DILocation(line: 5538, column: 17, scope: !3881)
!3894 = !DILocalVariable(name: "u32Temp3", scope: !3881, file: !72, line: 5538, type: !736)
!3895 = !DILocation(line: 5538, column: 26, scope: !3881)
!3896 = !DILocalVariable(name: "u8SignBit", scope: !3881, file: !72, line: 5539, type: !29)
!3897 = !DILocation(line: 5539, column: 5, scope: !3881)
!3898 = !DILocation(line: 5541, column: 5, scope: !3899)
!3899 = distinct !DILexicalBlock(scope: !3881, file: !72, line: 5541, column: 5)
!3900 = !DILocation(line: 5541, column: 10, scope: !3899)
!3901 = !DILocation(line: 5541, column: 5, scope: !3881)
!3902 = !DILocation(line: 5543, column: 13, scope: !3903)
!3903 = distinct !DILexicalBlock(scope: !3899, file: !72, line: 5542, column: 2)
!3904 = !DILocation(line: 5544, column: 15, scope: !3903)
!3905 = !DILocation(line: 5544, column: 14, scope: !3903)
!3906 = !DILocation(line: 5544, column: 12, scope: !3903)
!3907 = !DILocation(line: 5545, column: 2, scope: !3903)
!3908 = !DILocation(line: 5548, column: 13, scope: !3909)
!3909 = distinct !DILexicalBlock(scope: !3899, file: !72, line: 5547, column: 2)
!3910 = !DILocation(line: 5549, column: 14, scope: !3909)
!3911 = !DILocation(line: 5549, column: 12, scope: !3909)
!3912 = !DILocation(line: 5552, column: 13, scope: !3881)
!3913 = !DILocation(line: 5552, column: 24, scope: !3881)
!3914 = !DILocation(line: 5552, column: 22, scope: !3881)
!3915 = !DILocation(line: 5552, column: 11, scope: !3881)
!3916 = !DILocation(line: 5553, column: 25, scope: !3881)
!3917 = !DILocation(line: 5553, column: 34, scope: !3881)
!3918 = !DILocation(line: 5553, column: 13, scope: !3881)
!3919 = !DILocation(line: 5553, column: 11, scope: !3881)
!3920 = !DILocation(line: 5554, column: 13, scope: !3881)
!3921 = !DILocation(line: 5554, column: 25, scope: !3881)
!3922 = !DILocation(line: 5554, column: 22, scope: !3881)
!3923 = !DILocation(line: 5554, column: 11, scope: !3881)
!3924 = !DILocation(line: 5555, column: 14, scope: !3881)
!3925 = !DILocation(line: 5555, column: 30, scope: !3881)
!3926 = !DILocation(line: 5555, column: 29, scope: !3881)
!3927 = !DILocation(line: 5555, column: 23, scope: !3881)
!3928 = !DILocation(line: 5555, column: 11, scope: !3881)
!3929 = !DILocation(line: 5556, column: 6, scope: !3930)
!3930 = distinct !DILexicalBlock(scope: !3881, file: !72, line: 5556, column: 5)
!3931 = !DILocation(line: 5556, column: 16, scope: !3930)
!3932 = !DILocation(line: 5556, column: 14, scope: !3930)
!3933 = !DILocation(line: 5556, column: 22, scope: !3930)
!3934 = !DILocation(line: 5556, column: 5, scope: !3881)
!3935 = !DILocation(line: 5558, column: 6, scope: !3936)
!3936 = distinct !DILexicalBlock(scope: !3937, file: !72, line: 5558, column: 6)
!3937 = distinct !DILexicalBlock(scope: !3930, file: !72, line: 5557, column: 2)
!3938 = !DILocation(line: 5558, column: 16, scope: !3936)
!3939 = !DILocation(line: 5558, column: 6, scope: !3937)
!3940 = !DILocation(line: 5560, column: 7, scope: !3941)
!3941 = distinct !DILexicalBlock(scope: !3942, file: !72, line: 5560, column: 7)
!3942 = distinct !DILexicalBlock(scope: !3936, file: !72, line: 5559, column: 3)
!3943 = !DILocation(line: 5560, column: 15, scope: !3941)
!3944 = !DILocation(line: 5560, column: 7, scope: !3942)
!3945 = !DILocation(line: 5561, column: 12, scope: !3941)
!3946 = !DILocation(line: 5561, column: 5, scope: !3941)
!3947 = !DILocation(line: 5563, column: 5, scope: !3941)
!3948 = !DILocation(line: 5567, column: 7, scope: !3949)
!3949 = distinct !DILexicalBlock(scope: !3950, file: !72, line: 5567, column: 7)
!3950 = distinct !DILexicalBlock(scope: !3936, file: !72, line: 5566, column: 3)
!3951 = !DILocation(line: 5567, column: 15, scope: !3949)
!3952 = !DILocation(line: 5567, column: 7, scope: !3950)
!3953 = !DILocation(line: 5569, column: 13, scope: !3954)
!3954 = distinct !DILexicalBlock(scope: !3949, file: !72, line: 5568, column: 4)
!3955 = !DILocation(line: 5569, column: 12, scope: !3954)
!3956 = !DILocation(line: 5569, column: 5, scope: !3954)
!3957 = !DILocation(line: 5573, column: 5, scope: !3958)
!3958 = distinct !DILexicalBlock(scope: !3949, file: !72, line: 5572, column: 4)
!3959 = !DILocation(line: 5579, column: 6, scope: !3960)
!3960 = distinct !DILexicalBlock(scope: !3961, file: !72, line: 5579, column: 6)
!3961 = distinct !DILexicalBlock(scope: !3930, file: !72, line: 5578, column: 2)
!3962 = !DILocation(line: 5579, column: 16, scope: !3960)
!3963 = !DILocation(line: 5579, column: 6, scope: !3961)
!3964 = !DILocation(line: 5581, column: 4, scope: !3965)
!3965 = distinct !DILexicalBlock(scope: !3960, file: !72, line: 5580, column: 3)
!3966 = !DILocation(line: 5585, column: 4, scope: !3967)
!3967 = distinct !DILexicalBlock(scope: !3960, file: !72, line: 5584, column: 3)
!3968 = !DILocation(line: 5588, column: 1, scope: !3881)
!3969 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !72, file: !72, line: 3965, type: !159, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3970 = !DILocalVariable(name: "value", arg: 1, scope: !3969, file: !72, line: 3965, type: !20)
!3971 = !DILocation(line: 3965, column: 28, scope: !3969)
!3972 = !DILocalVariable(name: "factor", arg: 2, scope: !3969, file: !72, line: 3965, type: !29)
!3973 = !DILocation(line: 3965, column: 38, scope: !3969)
!3974 = !DILocation(line: 3967, column: 38, scope: !3969)
!3975 = !DILocation(line: 3967, column: 56, scope: !3969)
!3976 = !DILocation(line: 3967, column: 50, scope: !3969)
!3977 = !DILocation(line: 3967, column: 64, scope: !3969)
!3978 = !DILocation(line: 3967, column: 44, scope: !3969)
!3979 = !DILocation(line: 3967, column: 10, scope: !3969)
!3980 = !DILocation(line: 3967, column: 3, scope: !3969)
!3981 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !72, file: !72, line: 3989, type: !159, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3982 = !DILocalVariable(name: "value", arg: 1, scope: !3981, file: !72, line: 3989, type: !20)
!3983 = !DILocation(line: 3989, column: 27, scope: !3981)
!3984 = !DILocalVariable(name: "factor", arg: 2, scope: !3981, file: !72, line: 3989, type: !29)
!3985 = !DILocation(line: 3989, column: 37, scope: !3981)
!3986 = !DILocation(line: 3991, column: 38, scope: !3981)
!3987 = !DILocation(line: 3991, column: 56, scope: !3981)
!3988 = !DILocation(line: 3991, column: 50, scope: !3981)
!3989 = !DILocation(line: 3991, column: 64, scope: !3981)
!3990 = !DILocation(line: 3991, column: 44, scope: !3981)
!3991 = !DILocation(line: 3991, column: 10, scope: !3981)
!3992 = !DILocation(line: 3991, column: 3, scope: !3981)
!3993 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !72, file: !72, line: 4014, type: !159, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3994 = !DILocalVariable(name: "value", arg: 1, scope: !3993, file: !72, line: 4014, type: !20)
!3995 = !DILocation(line: 4014, column: 26, scope: !3993)
!3996 = !DILocalVariable(name: "factor", arg: 2, scope: !3993, file: !72, line: 4014, type: !29)
!3997 = !DILocation(line: 4014, column: 36, scope: !3993)
!3998 = !DILocation(line: 4016, column: 38, scope: !3993)
!3999 = !DILocation(line: 4016, column: 56, scope: !3993)
!4000 = !DILocation(line: 4016, column: 50, scope: !3993)
!4001 = !DILocation(line: 4016, column: 64, scope: !3993)
!4002 = !DILocation(line: 4016, column: 44, scope: !3993)
!4003 = !DILocation(line: 4016, column: 10, scope: !3993)
!4004 = !DILocation(line: 4016, column: 3, scope: !3993)
!4005 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !72, file: !72, line: 4039, type: !159, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4006 = !DILocalVariable(name: "value", arg: 1, scope: !4005, file: !72, line: 4039, type: !20)
!4007 = !DILocation(line: 4039, column: 27, scope: !4005)
!4008 = !DILocalVariable(name: "factor", arg: 2, scope: !4005, file: !72, line: 4039, type: !29)
!4009 = !DILocation(line: 4039, column: 37, scope: !4005)
!4010 = !DILocation(line: 4041, column: 41, scope: !4005)
!4011 = !DILocation(line: 4041, column: 59, scope: !4005)
!4012 = !DILocation(line: 4041, column: 53, scope: !4005)
!4013 = !DILocation(line: 4041, column: 67, scope: !4005)
!4014 = !DILocation(line: 4041, column: 47, scope: !4005)
!4015 = !DILocation(line: 4041, column: 10, scope: !4005)
!4016 = !DILocation(line: 4041, column: 3, scope: !4005)
!4017 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !72, file: !72, line: 4064, type: !159, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4018 = !DILocalVariable(name: "value", arg: 1, scope: !4017, file: !72, line: 4064, type: !20)
!4019 = !DILocation(line: 4064, column: 26, scope: !4017)
!4020 = !DILocalVariable(name: "factor", arg: 2, scope: !4017, file: !72, line: 4064, type: !29)
!4021 = !DILocation(line: 4064, column: 36, scope: !4017)
!4022 = !DILocation(line: 4066, column: 41, scope: !4017)
!4023 = !DILocation(line: 4066, column: 59, scope: !4017)
!4024 = !DILocation(line: 4066, column: 53, scope: !4017)
!4025 = !DILocation(line: 4066, column: 67, scope: !4017)
!4026 = !DILocation(line: 4066, column: 47, scope: !4017)
!4027 = !DILocation(line: 4066, column: 10, scope: !4017)
!4028 = !DILocation(line: 4066, column: 3, scope: !4017)
!4029 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !72, file: !72, line: 4088, type: !159, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4030 = !DILocalVariable(name: "value", arg: 1, scope: !4029, file: !72, line: 4088, type: !20)
!4031 = !DILocation(line: 4088, column: 26, scope: !4029)
!4032 = !DILocalVariable(name: "factor", arg: 2, scope: !4029, file: !72, line: 4088, type: !29)
!4033 = !DILocation(line: 4088, column: 36, scope: !4029)
!4034 = !DILocation(line: 4090, column: 41, scope: !4029)
!4035 = !DILocation(line: 4090, column: 59, scope: !4029)
!4036 = !DILocation(line: 4090, column: 53, scope: !4029)
!4037 = !DILocation(line: 4090, column: 67, scope: !4029)
!4038 = !DILocation(line: 4090, column: 47, scope: !4029)
!4039 = !DILocation(line: 4090, column: 10, scope: !4029)
!4040 = !DILocation(line: 4090, column: 3, scope: !4029)
!4041 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !72, file: !72, line: 4112, type: !159, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4042 = !DILocalVariable(name: "value", arg: 1, scope: !4041, file: !72, line: 4112, type: !20)
!4043 = !DILocation(line: 4112, column: 25, scope: !4041)
!4044 = !DILocalVariable(name: "factor", arg: 2, scope: !4041, file: !72, line: 4112, type: !29)
!4045 = !DILocation(line: 4112, column: 35, scope: !4041)
!4046 = !DILocation(line: 4114, column: 41, scope: !4041)
!4047 = !DILocation(line: 4114, column: 59, scope: !4041)
!4048 = !DILocation(line: 4114, column: 53, scope: !4041)
!4049 = !DILocation(line: 4114, column: 67, scope: !4041)
!4050 = !DILocation(line: 4114, column: 47, scope: !4041)
!4051 = !DILocation(line: 4114, column: 10, scope: !4041)
!4052 = !DILocation(line: 4114, column: 3, scope: !4041)
!4053 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !72, file: !72, line: 4136, type: !159, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4054 = !DILocalVariable(name: "value", arg: 1, scope: !4053, file: !72, line: 4136, type: !20)
!4055 = !DILocation(line: 4136, column: 26, scope: !4053)
!4056 = !DILocalVariable(name: "factor", arg: 2, scope: !4053, file: !72, line: 4136, type: !29)
!4057 = !DILocation(line: 4136, column: 36, scope: !4053)
!4058 = !DILocation(line: 4138, column: 41, scope: !4053)
!4059 = !DILocation(line: 4138, column: 59, scope: !4053)
!4060 = !DILocation(line: 4138, column: 53, scope: !4053)
!4061 = !DILocation(line: 4138, column: 67, scope: !4053)
!4062 = !DILocation(line: 4138, column: 47, scope: !4053)
!4063 = !DILocation(line: 4138, column: 10, scope: !4053)
!4064 = !DILocation(line: 4138, column: 3, scope: !4053)
!4065 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !72, file: !72, line: 4160, type: !159, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4066 = !DILocalVariable(name: "value", arg: 1, scope: !4065, file: !72, line: 4160, type: !20)
!4067 = !DILocation(line: 4160, column: 25, scope: !4065)
!4068 = !DILocalVariable(name: "factor", arg: 2, scope: !4065, file: !72, line: 4160, type: !29)
!4069 = !DILocation(line: 4160, column: 35, scope: !4065)
!4070 = !DILocation(line: 4162, column: 41, scope: !4065)
!4071 = !DILocation(line: 4162, column: 59, scope: !4065)
!4072 = !DILocation(line: 4162, column: 53, scope: !4065)
!4073 = !DILocation(line: 4162, column: 67, scope: !4065)
!4074 = !DILocation(line: 4162, column: 47, scope: !4065)
!4075 = !DILocation(line: 4162, column: 10, scope: !4065)
!4076 = !DILocation(line: 4162, column: 3, scope: !4065)
!4077 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !72, file: !72, line: 4183, type: !929, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4078 = !DILocalVariable(name: "value", arg: 1, scope: !4077, file: !72, line: 4183, type: !34)
!4079 = !DILocation(line: 4183, column: 33, scope: !4077)
!4080 = !DILocalVariable(name: "factor", arg: 2, scope: !4077, file: !72, line: 4183, type: !34)
!4081 = !DILocation(line: 4183, column: 44, scope: !4077)
!4082 = !DILocation(line: 4185, column: 41, scope: !4077)
!4083 = !DILocation(line: 4185, column: 47, scope: !4077)
!4084 = !DILocation(line: 4185, column: 10, scope: !4077)
!4085 = !DILocation(line: 4185, column: 3, scope: !4077)
!4086 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !72, file: !72, line: 4206, type: !929, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4087 = !DILocalVariable(name: "value", arg: 1, scope: !4086, file: !72, line: 4206, type: !34)
!4088 = !DILocation(line: 4206, column: 32, scope: !4086)
!4089 = !DILocalVariable(name: "factor", arg: 2, scope: !4086, file: !72, line: 4206, type: !34)
!4090 = !DILocation(line: 4206, column: 43, scope: !4086)
!4091 = !DILocation(line: 4208, column: 41, scope: !4086)
!4092 = !DILocation(line: 4208, column: 47, scope: !4086)
!4093 = !DILocation(line: 4208, column: 10, scope: !4086)
!4094 = !DILocation(line: 4208, column: 3, scope: !4086)
!4095 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !72, file: !72, line: 4230, type: !929, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4096 = !DILocalVariable(name: "value", arg: 1, scope: !4095, file: !72, line: 4230, type: !34)
!4097 = !DILocation(line: 4230, column: 31, scope: !4095)
!4098 = !DILocalVariable(name: "factor", arg: 2, scope: !4095, file: !72, line: 4230, type: !34)
!4099 = !DILocation(line: 4230, column: 42, scope: !4095)
!4100 = !DILocation(line: 4232, column: 41, scope: !4095)
!4101 = !DILocation(line: 4232, column: 47, scope: !4095)
!4102 = !DILocation(line: 4232, column: 10, scope: !4095)
!4103 = !DILocation(line: 4232, column: 3, scope: !4095)
!4104 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !72, file: !72, line: 4254, type: !929, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4105 = !DILocalVariable(name: "value", arg: 1, scope: !4104, file: !72, line: 4254, type: !34)
!4106 = !DILocation(line: 4254, column: 34, scope: !4104)
!4107 = !DILocalVariable(name: "factor", arg: 2, scope: !4104, file: !72, line: 4254, type: !34)
!4108 = !DILocation(line: 4254, column: 45, scope: !4104)
!4109 = !DILocation(line: 4256, column: 44, scope: !4104)
!4110 = !DILocation(line: 4256, column: 50, scope: !4104)
!4111 = !DILocation(line: 4256, column: 10, scope: !4104)
!4112 = !DILocation(line: 4256, column: 3, scope: !4104)
!4113 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !72, file: !72, line: 4278, type: !929, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4114 = !DILocalVariable(name: "value", arg: 1, scope: !4113, file: !72, line: 4278, type: !34)
!4115 = !DILocation(line: 4278, column: 32, scope: !4113)
!4116 = !DILocalVariable(name: "factor", arg: 2, scope: !4113, file: !72, line: 4278, type: !34)
!4117 = !DILocation(line: 4278, column: 43, scope: !4113)
!4118 = !DILocation(line: 4280, column: 44, scope: !4113)
!4119 = !DILocation(line: 4280, column: 50, scope: !4113)
!4120 = !DILocation(line: 4280, column: 10, scope: !4113)
!4121 = !DILocation(line: 4280, column: 3, scope: !4113)
!4122 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !72, file: !72, line: 4302, type: !929, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4123 = !DILocalVariable(name: "value", arg: 1, scope: !4122, file: !72, line: 4302, type: !34)
!4124 = !DILocation(line: 4302, column: 31, scope: !4122)
!4125 = !DILocalVariable(name: "factor", arg: 2, scope: !4122, file: !72, line: 4302, type: !34)
!4126 = !DILocation(line: 4302, column: 42, scope: !4122)
!4127 = !DILocation(line: 4304, column: 44, scope: !4122)
!4128 = !DILocation(line: 4304, column: 50, scope: !4122)
!4129 = !DILocation(line: 4304, column: 10, scope: !4122)
!4130 = !DILocation(line: 4304, column: 3, scope: !4122)
!4131 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !72, file: !72, line: 4326, type: !929, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4132 = !DILocalVariable(name: "value", arg: 1, scope: !4131, file: !72, line: 4326, type: !34)
!4133 = !DILocation(line: 4326, column: 33, scope: !4131)
!4134 = !DILocalVariable(name: "factor", arg: 2, scope: !4131, file: !72, line: 4326, type: !34)
!4135 = !DILocation(line: 4326, column: 44, scope: !4131)
!4136 = !DILocation(line: 4328, column: 44, scope: !4131)
!4137 = !DILocation(line: 4328, column: 50, scope: !4131)
!4138 = !DILocation(line: 4328, column: 10, scope: !4131)
!4139 = !DILocation(line: 4328, column: 3, scope: !4131)
!4140 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !72, file: !72, line: 4350, type: !929, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4141 = !DILocalVariable(name: "value", arg: 1, scope: !4140, file: !72, line: 4350, type: !34)
!4142 = !DILocation(line: 4350, column: 32, scope: !4140)
!4143 = !DILocalVariable(name: "factor", arg: 2, scope: !4140, file: !72, line: 4350, type: !34)
!4144 = !DILocation(line: 4350, column: 43, scope: !4140)
!4145 = !DILocation(line: 4352, column: 44, scope: !4140)
!4146 = !DILocation(line: 4352, column: 50, scope: !4140)
!4147 = !DILocation(line: 4352, column: 10, scope: !4140)
!4148 = !DILocation(line: 4352, column: 3, scope: !4140)
!4149 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !72, file: !72, line: 4373, type: !929, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4150 = !DILocalVariable(name: "value", arg: 1, scope: !4149, file: !72, line: 4373, type: !34)
!4151 = !DILocation(line: 4373, column: 31, scope: !4149)
!4152 = !DILocalVariable(name: "factor", arg: 2, scope: !4149, file: !72, line: 4373, type: !34)
!4153 = !DILocation(line: 4373, column: 42, scope: !4149)
!4154 = !DILocation(line: 4375, column: 44, scope: !4149)
!4155 = !DILocation(line: 4375, column: 50, scope: !4149)
!4156 = !DILocation(line: 4375, column: 10, scope: !4149)
!4157 = !DILocation(line: 4375, column: 3, scope: !4149)
!4158 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !72, file: !72, line: 4396, type: !929, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4159 = !DILocalVariable(name: "value", arg: 1, scope: !4158, file: !72, line: 4396, type: !34)
!4160 = !DILocation(line: 4396, column: 30, scope: !4158)
!4161 = !DILocalVariable(name: "factor", arg: 2, scope: !4158, file: !72, line: 4396, type: !34)
!4162 = !DILocation(line: 4396, column: 41, scope: !4158)
!4163 = !DILocation(line: 4398, column: 44, scope: !4158)
!4164 = !DILocation(line: 4398, column: 50, scope: !4158)
!4165 = !DILocation(line: 4398, column: 10, scope: !4158)
!4166 = !DILocation(line: 4398, column: 3, scope: !4158)
!4167 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !72, file: !72, line: 4419, type: !929, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4168 = !DILocalVariable(name: "value", arg: 1, scope: !4167, file: !72, line: 4419, type: !34)
!4169 = !DILocation(line: 4419, column: 33, scope: !4167)
!4170 = !DILocalVariable(name: "factor", arg: 2, scope: !4167, file: !72, line: 4419, type: !34)
!4171 = !DILocation(line: 4419, column: 44, scope: !4167)
!4172 = !DILocation(line: 4421, column: 44, scope: !4167)
!4173 = !DILocation(line: 4421, column: 50, scope: !4167)
!4174 = !DILocation(line: 4421, column: 10, scope: !4167)
!4175 = !DILocation(line: 4421, column: 3, scope: !4167)
!4176 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !72, file: !72, line: 4442, type: !929, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4177 = !DILocalVariable(name: "value", arg: 1, scope: !4176, file: !72, line: 4442, type: !34)
!4178 = !DILocation(line: 4442, column: 32, scope: !4176)
!4179 = !DILocalVariable(name: "factor", arg: 2, scope: !4176, file: !72, line: 4442, type: !34)
!4180 = !DILocation(line: 4442, column: 43, scope: !4176)
!4181 = !DILocation(line: 4444, column: 44, scope: !4176)
!4182 = !DILocation(line: 4444, column: 50, scope: !4176)
!4183 = !DILocation(line: 4444, column: 10, scope: !4176)
!4184 = !DILocation(line: 4444, column: 3, scope: !4176)
!4185 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !72, file: !72, line: 4465, type: !929, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4186 = !DILocalVariable(name: "value", arg: 1, scope: !4185, file: !72, line: 4465, type: !34)
!4187 = !DILocation(line: 4465, column: 31, scope: !4185)
!4188 = !DILocalVariable(name: "factor", arg: 2, scope: !4185, file: !72, line: 4465, type: !34)
!4189 = !DILocation(line: 4465, column: 42, scope: !4185)
!4190 = !DILocation(line: 4467, column: 44, scope: !4185)
!4191 = !DILocation(line: 4467, column: 50, scope: !4185)
!4192 = !DILocation(line: 4467, column: 10, scope: !4185)
!4193 = !DILocation(line: 4467, column: 3, scope: !4185)
!4194 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !72, file: !72, line: 4488, type: !929, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4195 = !DILocalVariable(name: "value", arg: 1, scope: !4194, file: !72, line: 4488, type: !34)
!4196 = !DILocation(line: 4488, column: 30, scope: !4194)
!4197 = !DILocalVariable(name: "factor", arg: 2, scope: !4194, file: !72, line: 4488, type: !34)
!4198 = !DILocation(line: 4488, column: 41, scope: !4194)
!4199 = !DILocation(line: 4490, column: 44, scope: !4194)
!4200 = !DILocation(line: 4490, column: 50, scope: !4194)
!4201 = !DILocation(line: 4490, column: 10, scope: !4194)
!4202 = !DILocation(line: 4490, column: 3, scope: !4194)
!4203 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !72, file: !72, line: 4510, type: !974, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4204 = !DILocalVariable(name: "x_value", arg: 1, scope: !4203, file: !72, line: 4510, type: !34)
!4205 = !DILocation(line: 4510, column: 32, scope: !4203)
!4206 = !DILocalVariable(name: "y_value", arg: 2, scope: !4203, file: !72, line: 4510, type: !29)
!4207 = !DILocation(line: 4510, column: 44, scope: !4203)
!4208 = !DILocation(line: 4512, column: 40, scope: !4203)
!4209 = !DILocation(line: 4512, column: 60, scope: !4203)
!4210 = !DILocation(line: 4512, column: 54, scope: !4203)
!4211 = !DILocation(line: 4512, column: 69, scope: !4203)
!4212 = !DILocation(line: 4512, column: 48, scope: !4203)
!4213 = !DILocation(line: 4512, column: 10, scope: !4203)
!4214 = !DILocation(line: 4512, column: 3, scope: !4203)
!4215 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !72, file: !72, line: 4532, type: !974, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4216 = !DILocalVariable(name: "x_value", arg: 1, scope: !4215, file: !72, line: 4532, type: !34)
!4217 = !DILocation(line: 4532, column: 31, scope: !4215)
!4218 = !DILocalVariable(name: "y_value", arg: 2, scope: !4215, file: !72, line: 4532, type: !29)
!4219 = !DILocation(line: 4532, column: 43, scope: !4215)
!4220 = !DILocation(line: 4534, column: 40, scope: !4215)
!4221 = !DILocation(line: 4534, column: 60, scope: !4215)
!4222 = !DILocation(line: 4534, column: 54, scope: !4215)
!4223 = !DILocation(line: 4534, column: 69, scope: !4215)
!4224 = !DILocation(line: 4534, column: 48, scope: !4215)
!4225 = !DILocation(line: 4534, column: 10, scope: !4215)
!4226 = !DILocation(line: 4534, column: 3, scope: !4215)
!4227 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !72, file: !72, line: 4555, type: !974, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4228 = !DILocalVariable(name: "x_value", arg: 1, scope: !4227, file: !72, line: 4555, type: !34)
!4229 = !DILocation(line: 4555, column: 30, scope: !4227)
!4230 = !DILocalVariable(name: "y_value", arg: 2, scope: !4227, file: !72, line: 4555, type: !29)
!4231 = !DILocation(line: 4555, column: 42, scope: !4227)
!4232 = !DILocation(line: 4557, column: 40, scope: !4227)
!4233 = !DILocation(line: 4557, column: 60, scope: !4227)
!4234 = !DILocation(line: 4557, column: 54, scope: !4227)
!4235 = !DILocation(line: 4557, column: 69, scope: !4227)
!4236 = !DILocation(line: 4557, column: 48, scope: !4227)
!4237 = !DILocation(line: 4557, column: 10, scope: !4227)
!4238 = !DILocation(line: 4557, column: 3, scope: !4227)
!4239 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !72, file: !72, line: 4578, type: !974, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4240 = !DILocalVariable(name: "x_value", arg: 1, scope: !4239, file: !72, line: 4578, type: !34)
!4241 = !DILocation(line: 4578, column: 31, scope: !4239)
!4242 = !DILocalVariable(name: "y_value", arg: 2, scope: !4239, file: !72, line: 4578, type: !29)
!4243 = !DILocation(line: 4578, column: 43, scope: !4239)
!4244 = !DILocation(line: 4580, column: 44, scope: !4239)
!4245 = !DILocation(line: 4580, column: 64, scope: !4239)
!4246 = !DILocation(line: 4580, column: 58, scope: !4239)
!4247 = !DILocation(line: 4580, column: 73, scope: !4239)
!4248 = !DILocation(line: 4580, column: 52, scope: !4239)
!4249 = !DILocation(line: 4580, column: 10, scope: !4239)
!4250 = !DILocation(line: 4580, column: 3, scope: !4239)
!4251 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !72, file: !72, line: 4601, type: !974, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4252 = !DILocalVariable(name: "x_value", arg: 1, scope: !4251, file: !72, line: 4601, type: !34)
!4253 = !DILocation(line: 4601, column: 30, scope: !4251)
!4254 = !DILocalVariable(name: "y_value", arg: 2, scope: !4251, file: !72, line: 4601, type: !29)
!4255 = !DILocation(line: 4601, column: 42, scope: !4251)
!4256 = !DILocation(line: 4603, column: 44, scope: !4251)
!4257 = !DILocation(line: 4603, column: 64, scope: !4251)
!4258 = !DILocation(line: 4603, column: 58, scope: !4251)
!4259 = !DILocation(line: 4603, column: 73, scope: !4251)
!4260 = !DILocation(line: 4603, column: 52, scope: !4251)
!4261 = !DILocation(line: 4603, column: 10, scope: !4251)
!4262 = !DILocation(line: 4603, column: 3, scope: !4251)
!4263 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !72, file: !72, line: 4623, type: !974, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4264 = !DILocalVariable(name: "x_value", arg: 1, scope: !4263, file: !72, line: 4623, type: !34)
!4265 = !DILocation(line: 4623, column: 30, scope: !4263)
!4266 = !DILocalVariable(name: "y_value", arg: 2, scope: !4263, file: !72, line: 4623, type: !29)
!4267 = !DILocation(line: 4623, column: 42, scope: !4263)
!4268 = !DILocation(line: 4625, column: 44, scope: !4263)
!4269 = !DILocation(line: 4625, column: 64, scope: !4263)
!4270 = !DILocation(line: 4625, column: 58, scope: !4263)
!4271 = !DILocation(line: 4625, column: 73, scope: !4263)
!4272 = !DILocation(line: 4625, column: 52, scope: !4263)
!4273 = !DILocation(line: 4625, column: 10, scope: !4263)
!4274 = !DILocation(line: 4625, column: 3, scope: !4263)
!4275 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !72, file: !72, line: 4645, type: !974, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4276 = !DILocalVariable(name: "x_value", arg: 1, scope: !4275, file: !72, line: 4645, type: !34)
!4277 = !DILocation(line: 4645, column: 29, scope: !4275)
!4278 = !DILocalVariable(name: "y_value", arg: 2, scope: !4275, file: !72, line: 4645, type: !29)
!4279 = !DILocation(line: 4645, column: 41, scope: !4275)
!4280 = !DILocation(line: 4647, column: 44, scope: !4275)
!4281 = !DILocation(line: 4647, column: 64, scope: !4275)
!4282 = !DILocation(line: 4647, column: 58, scope: !4275)
!4283 = !DILocation(line: 4647, column: 73, scope: !4275)
!4284 = !DILocation(line: 4647, column: 52, scope: !4275)
!4285 = !DILocation(line: 4647, column: 10, scope: !4275)
!4286 = !DILocation(line: 4647, column: 3, scope: !4275)
!4287 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !72, file: !72, line: 4667, type: !974, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4288 = !DILocalVariable(name: "x_value", arg: 1, scope: !4287, file: !72, line: 4667, type: !34)
!4289 = !DILocation(line: 4667, column: 30, scope: !4287)
!4290 = !DILocalVariable(name: "y_value", arg: 2, scope: !4287, file: !72, line: 4667, type: !29)
!4291 = !DILocation(line: 4667, column: 42, scope: !4287)
!4292 = !DILocation(line: 4669, column: 44, scope: !4287)
!4293 = !DILocation(line: 4669, column: 64, scope: !4287)
!4294 = !DILocation(line: 4669, column: 58, scope: !4287)
!4295 = !DILocation(line: 4669, column: 73, scope: !4287)
!4296 = !DILocation(line: 4669, column: 52, scope: !4287)
!4297 = !DILocation(line: 4669, column: 10, scope: !4287)
!4298 = !DILocation(line: 4669, column: 3, scope: !4287)
!4299 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !72, file: !72, line: 4689, type: !974, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4300 = !DILocalVariable(name: "x_value", arg: 1, scope: !4299, file: !72, line: 4689, type: !34)
!4301 = !DILocation(line: 4689, column: 29, scope: !4299)
!4302 = !DILocalVariable(name: "y_value", arg: 2, scope: !4299, file: !72, line: 4689, type: !29)
!4303 = !DILocation(line: 4689, column: 41, scope: !4299)
!4304 = !DILocation(line: 4691, column: 44, scope: !4299)
!4305 = !DILocation(line: 4691, column: 64, scope: !4299)
!4306 = !DILocation(line: 4691, column: 58, scope: !4299)
!4307 = !DILocation(line: 4691, column: 73, scope: !4299)
!4308 = !DILocation(line: 4691, column: 52, scope: !4299)
!4309 = !DILocation(line: 4691, column: 10, scope: !4299)
!4310 = !DILocation(line: 4691, column: 3, scope: !4299)
!4311 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !72, file: !72, line: 4713, type: !1503, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4312 = !DILocalVariable(name: "value", arg: 1, scope: !4311, file: !72, line: 4713, type: !736)
!4313 = !DILocation(line: 4713, column: 31, scope: !4311)
!4314 = !DILocalVariable(name: "factor", arg: 2, scope: !4311, file: !72, line: 4713, type: !25)
!4315 = !DILocation(line: 4713, column: 42, scope: !4311)
!4316 = !DILocation(line: 4715, column: 41, scope: !4311)
!4317 = !DILocation(line: 4715, column: 47, scope: !4311)
!4318 = !DILocation(line: 4715, column: 10, scope: !4311)
!4319 = !DILocation(line: 4715, column: 3, scope: !4311)
!4320 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !72, file: !72, line: 5293, type: !4321, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4321 = !DISubroutineType(types: !4322)
!4322 = !{!736, !736, !25, !736}
!4323 = !DILocalVariable(name: "value", arg: 1, scope: !4320, file: !72, line: 5293, type: !736)
!4324 = !DILocation(line: 5293, column: 40, scope: !4320)
!4325 = !DILocalVariable(name: "factor", arg: 2, scope: !4320, file: !72, line: 5293, type: !25)
!4326 = !DILocation(line: 5293, column: 50, scope: !4320)
!4327 = !DILocalVariable(name: "count", arg: 3, scope: !4320, file: !72, line: 5293, type: !736)
!4328 = !DILocation(line: 5293, column: 62, scope: !4320)
!4329 = !DILocalVariable(name: "u32Temp1", scope: !4320, file: !72, line: 5295, type: !736)
!4330 = !DILocation(line: 5295, column: 6, scope: !4320)
!4331 = !DILocalVariable(name: "u32Temp2", scope: !4320, file: !72, line: 5295, type: !736)
!4332 = !DILocation(line: 5295, column: 17, scope: !4320)
!4333 = !DILocalVariable(name: "u32Temp3", scope: !4320, file: !72, line: 5295, type: !736)
!4334 = !DILocation(line: 5295, column: 26, scope: !4320)
!4335 = !DILocalVariable(name: "u8SignBit", scope: !4320, file: !72, line: 5296, type: !29)
!4336 = !DILocation(line: 5296, column: 5, scope: !4320)
!4337 = !DILocation(line: 5298, column: 5, scope: !4338)
!4338 = distinct !DILexicalBlock(scope: !4320, file: !72, line: 5298, column: 5)
!4339 = !DILocation(line: 5298, column: 11, scope: !4338)
!4340 = !DILocation(line: 5298, column: 5, scope: !4320)
!4341 = !DILocation(line: 5300, column: 13, scope: !4342)
!4342 = distinct !DILexicalBlock(scope: !4338, file: !72, line: 5299, column: 2)
!4343 = !DILocation(line: 5301, column: 2, scope: !4342)
!4344 = !DILocation(line: 5304, column: 13, scope: !4345)
!4345 = distinct !DILexicalBlock(scope: !4338, file: !72, line: 5303, column: 2)
!4346 = !DILocation(line: 5308, column: 5, scope: !4347)
!4347 = distinct !DILexicalBlock(scope: !4320, file: !72, line: 5308, column: 5)
!4348 = !DILocation(line: 5308, column: 11, scope: !4347)
!4349 = !DILocation(line: 5308, column: 5, scope: !4320)
!4350 = !DILocation(line: 5310, column: 15, scope: !4351)
!4351 = distinct !DILexicalBlock(scope: !4347, file: !72, line: 5309, column: 2)
!4352 = !DILocation(line: 5310, column: 14, scope: !4351)
!4353 = !DILocation(line: 5310, column: 12, scope: !4351)
!4354 = !DILocation(line: 5311, column: 2, scope: !4351)
!4355 = !DILocation(line: 5314, column: 14, scope: !4356)
!4356 = distinct !DILexicalBlock(scope: !4347, file: !72, line: 5313, column: 2)
!4357 = !DILocation(line: 5314, column: 12, scope: !4356)
!4358 = !DILocation(line: 5317, column: 13, scope: !4320)
!4359 = !DILocation(line: 5317, column: 21, scope: !4320)
!4360 = !DILocation(line: 5317, column: 19, scope: !4320)
!4361 = !DILocation(line: 5317, column: 11, scope: !4320)
!4362 = !DILocation(line: 5318, column: 25, scope: !4320)
!4363 = !DILocation(line: 5318, column: 32, scope: !4320)
!4364 = !DILocation(line: 5318, column: 13, scope: !4320)
!4365 = !DILocation(line: 5318, column: 11, scope: !4320)
!4366 = !DILocation(line: 5319, column: 13, scope: !4320)
!4367 = !DILocation(line: 5319, column: 25, scope: !4320)
!4368 = !DILocation(line: 5319, column: 22, scope: !4320)
!4369 = !DILocation(line: 5319, column: 11, scope: !4320)
!4370 = !DILocation(line: 5320, column: 14, scope: !4320)
!4371 = !DILocation(line: 5320, column: 30, scope: !4320)
!4372 = !DILocation(line: 5320, column: 29, scope: !4320)
!4373 = !DILocation(line: 5320, column: 23, scope: !4320)
!4374 = !DILocation(line: 5320, column: 11, scope: !4320)
!4375 = !DILocation(line: 5321, column: 6, scope: !4376)
!4376 = distinct !DILexicalBlock(scope: !4320, file: !72, line: 5321, column: 5)
!4377 = !DILocation(line: 5321, column: 16, scope: !4376)
!4378 = !DILocation(line: 5321, column: 14, scope: !4376)
!4379 = !DILocation(line: 5321, column: 22, scope: !4376)
!4380 = !DILocation(line: 5321, column: 5, scope: !4320)
!4381 = !DILocation(line: 5323, column: 6, scope: !4382)
!4382 = distinct !DILexicalBlock(scope: !4383, file: !72, line: 5323, column: 6)
!4383 = distinct !DILexicalBlock(scope: !4376, file: !72, line: 5322, column: 2)
!4384 = !DILocation(line: 5323, column: 16, scope: !4382)
!4385 = !DILocation(line: 5323, column: 6, scope: !4383)
!4386 = !DILocation(line: 5325, column: 7, scope: !4387)
!4387 = distinct !DILexicalBlock(scope: !4388, file: !72, line: 5325, column: 7)
!4388 = distinct !DILexicalBlock(scope: !4382, file: !72, line: 5324, column: 3)
!4389 = !DILocation(line: 5325, column: 15, scope: !4387)
!4390 = !DILocation(line: 5325, column: 7, scope: !4388)
!4391 = !DILocation(line: 5326, column: 12, scope: !4387)
!4392 = !DILocation(line: 5326, column: 5, scope: !4387)
!4393 = !DILocation(line: 5328, column: 5, scope: !4387)
!4394 = !DILocation(line: 5332, column: 4, scope: !4395)
!4395 = distinct !DILexicalBlock(scope: !4382, file: !72, line: 5331, column: 3)
!4396 = !DILocation(line: 5337, column: 3, scope: !4397)
!4397 = distinct !DILexicalBlock(scope: !4376, file: !72, line: 5336, column: 2)
!4398 = !DILocation(line: 5339, column: 1, scope: !4320)
!4399 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !72, file: !72, line: 4737, type: !1321, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4400 = !DILocalVariable(name: "value", arg: 1, scope: !4399, file: !72, line: 4737, type: !736)
!4401 = !DILocation(line: 4737, column: 31, scope: !4399)
!4402 = !DILocalVariable(name: "factor", arg: 2, scope: !4399, file: !72, line: 4737, type: !80)
!4403 = !DILocation(line: 4737, column: 42, scope: !4399)
!4404 = !DILocation(line: 4739, column: 41, scope: !4399)
!4405 = !DILocation(line: 4739, column: 47, scope: !4399)
!4406 = !DILocation(line: 4739, column: 10, scope: !4399)
!4407 = !DILocation(line: 4739, column: 3, scope: !4399)
!4408 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !72, file: !72, line: 5357, type: !4409, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4409 = !DISubroutineType(types: !4410)
!4410 = !{!736, !736, !80, !736}
!4411 = !DILocalVariable(name: "value", arg: 1, scope: !4408, file: !72, line: 5357, type: !736)
!4412 = !DILocation(line: 5357, column: 40, scope: !4408)
!4413 = !DILocalVariable(name: "factor", arg: 2, scope: !4408, file: !72, line: 5357, type: !80)
!4414 = !DILocation(line: 5357, column: 51, scope: !4408)
!4415 = !DILocalVariable(name: "count", arg: 3, scope: !4408, file: !72, line: 5357, type: !736)
!4416 = !DILocation(line: 5357, column: 63, scope: !4408)
!4417 = !DILocalVariable(name: "u32Temp1", scope: !4408, file: !72, line: 5359, type: !736)
!4418 = !DILocation(line: 5359, column: 6, scope: !4408)
!4419 = !DILocalVariable(name: "u32Temp2", scope: !4408, file: !72, line: 5359, type: !736)
!4420 = !DILocation(line: 5359, column: 17, scope: !4408)
!4421 = !DILocalVariable(name: "u8SignBit", scope: !4408, file: !72, line: 5360, type: !29)
!4422 = !DILocation(line: 5360, column: 5, scope: !4408)
!4423 = !DILocation(line: 5362, column: 5, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4408, file: !72, line: 5362, column: 5)
!4425 = !DILocation(line: 5362, column: 11, scope: !4424)
!4426 = !DILocation(line: 5362, column: 5, scope: !4408)
!4427 = !DILocation(line: 5364, column: 13, scope: !4428)
!4428 = distinct !DILexicalBlock(scope: !4424, file: !72, line: 5363, column: 2)
!4429 = !DILocation(line: 5365, column: 2, scope: !4428)
!4430 = !DILocation(line: 5368, column: 13, scope: !4431)
!4431 = distinct !DILexicalBlock(scope: !4424, file: !72, line: 5367, column: 2)
!4432 = !DILocation(line: 5372, column: 5, scope: !4433)
!4433 = distinct !DILexicalBlock(scope: !4408, file: !72, line: 5372, column: 5)
!4434 = !DILocation(line: 5372, column: 11, scope: !4433)
!4435 = !DILocation(line: 5372, column: 5, scope: !4408)
!4436 = !DILocation(line: 5374, column: 15, scope: !4437)
!4437 = distinct !DILexicalBlock(scope: !4433, file: !72, line: 5373, column: 2)
!4438 = !DILocation(line: 5374, column: 14, scope: !4437)
!4439 = !DILocation(line: 5374, column: 12, scope: !4437)
!4440 = !DILocation(line: 5375, column: 2, scope: !4437)
!4441 = !DILocation(line: 5378, column: 14, scope: !4442)
!4442 = distinct !DILexicalBlock(scope: !4433, file: !72, line: 5377, column: 2)
!4443 = !DILocation(line: 5378, column: 12, scope: !4442)
!4444 = !DILocation(line: 5381, column: 25, scope: !4408)
!4445 = !DILocation(line: 5381, column: 32, scope: !4408)
!4446 = !DILocation(line: 5381, column: 13, scope: !4408)
!4447 = !DILocation(line: 5381, column: 11, scope: !4408)
!4448 = !DILocation(line: 5382, column: 13, scope: !4408)
!4449 = !DILocation(line: 5382, column: 26, scope: !4408)
!4450 = !DILocation(line: 5382, column: 31, scope: !4408)
!4451 = !DILocation(line: 5382, column: 22, scope: !4408)
!4452 = !DILocation(line: 5382, column: 11, scope: !4408)
!4453 = !DILocation(line: 5383, column: 5, scope: !4454)
!4454 = distinct !DILexicalBlock(scope: !4408, file: !72, line: 5383, column: 5)
!4455 = !DILocation(line: 5383, column: 15, scope: !4454)
!4456 = !DILocation(line: 5383, column: 5, scope: !4408)
!4457 = !DILocation(line: 5385, column: 10, scope: !4458)
!4458 = distinct !DILexicalBlock(scope: !4454, file: !72, line: 5384, column: 2)
!4459 = !DILocation(line: 5385, column: 3, scope: !4458)
!4460 = !DILocation(line: 5389, column: 3, scope: !4461)
!4461 = distinct !DILexicalBlock(scope: !4454, file: !72, line: 5388, column: 2)
!4462 = !DILocation(line: 5391, column: 1, scope: !4408)
!4463 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !72, file: !72, line: 4761, type: !3083, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4464 = !DILocalVariable(name: "value", arg: 1, scope: !4463, file: !72, line: 4761, type: !736)
!4465 = !DILocation(line: 4761, column: 30, scope: !4463)
!4466 = !DILocalVariable(name: "factor", arg: 2, scope: !4463, file: !72, line: 4761, type: !20)
!4467 = !DILocation(line: 4761, column: 40, scope: !4463)
!4468 = !DILocation(line: 4763, column: 40, scope: !4463)
!4469 = !DILocation(line: 4763, column: 46, scope: !4463)
!4470 = !DILocation(line: 4763, column: 10, scope: !4463)
!4471 = !DILocation(line: 4763, column: 3, scope: !4463)
!4472 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !72, file: !72, line: 5435, type: !4473, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4473 = !DISubroutineType(types: !4474)
!4474 = !{!736, !736, !20, !736}
!4475 = !DILocalVariable(name: "value", arg: 1, scope: !4472, file: !72, line: 5435, type: !736)
!4476 = !DILocation(line: 5435, column: 39, scope: !4472)
!4477 = !DILocalVariable(name: "factor", arg: 2, scope: !4472, file: !72, line: 5435, type: !20)
!4478 = !DILocation(line: 5435, column: 49, scope: !4472)
!4479 = !DILocalVariable(name: "count", arg: 3, scope: !4472, file: !72, line: 5435, type: !736)
!4480 = !DILocation(line: 5435, column: 61, scope: !4472)
!4481 = !DILocalVariable(name: "u32Temp1", scope: !4472, file: !72, line: 5437, type: !736)
!4482 = !DILocation(line: 5437, column: 6, scope: !4472)
!4483 = !DILocalVariable(name: "u32Temp2", scope: !4472, file: !72, line: 5437, type: !736)
!4484 = !DILocation(line: 5437, column: 17, scope: !4472)
!4485 = !DILocalVariable(name: "u32Temp3", scope: !4472, file: !72, line: 5437, type: !736)
!4486 = !DILocation(line: 5437, column: 26, scope: !4472)
!4487 = !DILocalVariable(name: "u8SignBit", scope: !4472, file: !72, line: 5438, type: !29)
!4488 = !DILocation(line: 5438, column: 5, scope: !4472)
!4489 = !DILocation(line: 5440, column: 5, scope: !4490)
!4490 = distinct !DILexicalBlock(scope: !4472, file: !72, line: 5440, column: 5)
!4491 = !DILocation(line: 5440, column: 11, scope: !4490)
!4492 = !DILocation(line: 5440, column: 5, scope: !4472)
!4493 = !DILocation(line: 5442, column: 13, scope: !4494)
!4494 = distinct !DILexicalBlock(scope: !4490, file: !72, line: 5441, column: 2)
!4495 = !DILocation(line: 5443, column: 2, scope: !4494)
!4496 = !DILocation(line: 5446, column: 13, scope: !4497)
!4497 = distinct !DILexicalBlock(scope: !4490, file: !72, line: 5445, column: 2)
!4498 = !DILocation(line: 5450, column: 5, scope: !4499)
!4499 = distinct !DILexicalBlock(scope: !4472, file: !72, line: 5450, column: 5)
!4500 = !DILocation(line: 5450, column: 11, scope: !4499)
!4501 = !DILocation(line: 5450, column: 5, scope: !4472)
!4502 = !DILocation(line: 5452, column: 15, scope: !4503)
!4503 = distinct !DILexicalBlock(scope: !4499, file: !72, line: 5451, column: 2)
!4504 = !DILocation(line: 5452, column: 14, scope: !4503)
!4505 = !DILocation(line: 5452, column: 12, scope: !4503)
!4506 = !DILocation(line: 5453, column: 2, scope: !4503)
!4507 = !DILocation(line: 5456, column: 14, scope: !4508)
!4508 = distinct !DILexicalBlock(scope: !4499, file: !72, line: 5455, column: 2)
!4509 = !DILocation(line: 5456, column: 12, scope: !4508)
!4510 = !DILocation(line: 5459, column: 13, scope: !4472)
!4511 = !DILocation(line: 5459, column: 21, scope: !4472)
!4512 = !DILocation(line: 5459, column: 19, scope: !4472)
!4513 = !DILocation(line: 5459, column: 11, scope: !4472)
!4514 = !DILocation(line: 5460, column: 25, scope: !4472)
!4515 = !DILocation(line: 5460, column: 32, scope: !4472)
!4516 = !DILocation(line: 5460, column: 13, scope: !4472)
!4517 = !DILocation(line: 5460, column: 11, scope: !4472)
!4518 = !DILocation(line: 5461, column: 13, scope: !4472)
!4519 = !DILocation(line: 5461, column: 25, scope: !4472)
!4520 = !DILocation(line: 5461, column: 22, scope: !4472)
!4521 = !DILocation(line: 5461, column: 11, scope: !4472)
!4522 = !DILocation(line: 5462, column: 14, scope: !4472)
!4523 = !DILocation(line: 5462, column: 30, scope: !4472)
!4524 = !DILocation(line: 5462, column: 29, scope: !4472)
!4525 = !DILocation(line: 5462, column: 23, scope: !4472)
!4526 = !DILocation(line: 5462, column: 11, scope: !4472)
!4527 = !DILocation(line: 5463, column: 6, scope: !4528)
!4528 = distinct !DILexicalBlock(scope: !4472, file: !72, line: 5463, column: 5)
!4529 = !DILocation(line: 5463, column: 16, scope: !4528)
!4530 = !DILocation(line: 5463, column: 14, scope: !4528)
!4531 = !DILocation(line: 5463, column: 22, scope: !4528)
!4532 = !DILocation(line: 5463, column: 5, scope: !4472)
!4533 = !DILocation(line: 5465, column: 6, scope: !4534)
!4534 = distinct !DILexicalBlock(scope: !4535, file: !72, line: 5465, column: 6)
!4535 = distinct !DILexicalBlock(scope: !4528, file: !72, line: 5464, column: 2)
!4536 = !DILocation(line: 5465, column: 16, scope: !4534)
!4537 = !DILocation(line: 5465, column: 6, scope: !4535)
!4538 = !DILocation(line: 5467, column: 7, scope: !4539)
!4539 = distinct !DILexicalBlock(scope: !4540, file: !72, line: 5467, column: 7)
!4540 = distinct !DILexicalBlock(scope: !4534, file: !72, line: 5466, column: 3)
!4541 = !DILocation(line: 5467, column: 15, scope: !4539)
!4542 = !DILocation(line: 5467, column: 7, scope: !4540)
!4543 = !DILocation(line: 5468, column: 12, scope: !4539)
!4544 = !DILocation(line: 5468, column: 5, scope: !4539)
!4545 = !DILocation(line: 5470, column: 5, scope: !4539)
!4546 = !DILocation(line: 5474, column: 4, scope: !4547)
!4547 = distinct !DILexicalBlock(scope: !4534, file: !72, line: 5473, column: 3)
!4548 = !DILocation(line: 5479, column: 3, scope: !4549)
!4549 = distinct !DILexicalBlock(scope: !4528, file: !72, line: 5478, column: 2)
!4550 = !DILocation(line: 5481, column: 1, scope: !4472)
!4551 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !72, file: !72, line: 4785, type: !1117, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4552 = !DILocalVariable(name: "value", arg: 1, scope: !4551, file: !72, line: 4785, type: !736)
!4553 = !DILocation(line: 4785, column: 31, scope: !4551)
!4554 = !DILocalVariable(name: "factor", arg: 2, scope: !4551, file: !72, line: 4785, type: !34)
!4555 = !DILocation(line: 4785, column: 42, scope: !4551)
!4556 = !DILocation(line: 4787, column: 41, scope: !4551)
!4557 = !DILocation(line: 4787, column: 47, scope: !4551)
!4558 = !DILocation(line: 4787, column: 10, scope: !4551)
!4559 = !DILocation(line: 4787, column: 3, scope: !4551)
!4560 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !72, file: !72, line: 4809, type: !1412, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4561 = !DILocalVariable(name: "value", arg: 1, scope: !4560, file: !72, line: 4809, type: !736)
!4562 = !DILocation(line: 4809, column: 31, scope: !4560)
!4563 = !DILocalVariable(name: "factor", arg: 2, scope: !4560, file: !72, line: 4809, type: !736)
!4564 = !DILocation(line: 4809, column: 42, scope: !4560)
!4565 = !DILocation(line: 4811, column: 41, scope: !4560)
!4566 = !DILocation(line: 4811, column: 47, scope: !4560)
!4567 = !DILocation(line: 4811, column: 10, scope: !4560)
!4568 = !DILocation(line: 4811, column: 3, scope: !4560)
!4569 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !72, file: !72, line: 5408, type: !4570, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4570 = !DISubroutineType(types: !4571)
!4571 = !{!736, !736, !736, !736}
!4572 = !DILocalVariable(name: "value", arg: 1, scope: !4569, file: !72, line: 5408, type: !736)
!4573 = !DILocation(line: 5408, column: 40, scope: !4569)
!4574 = !DILocalVariable(name: "factor", arg: 2, scope: !4569, file: !72, line: 5408, type: !736)
!4575 = !DILocation(line: 5408, column: 50, scope: !4569)
!4576 = !DILocalVariable(name: "count", arg: 3, scope: !4569, file: !72, line: 5408, type: !736)
!4577 = !DILocation(line: 5408, column: 62, scope: !4569)
!4578 = !DILocalVariable(name: "u32Temp1", scope: !4569, file: !72, line: 5410, type: !736)
!4579 = !DILocation(line: 5410, column: 6, scope: !4569)
!4580 = !DILocalVariable(name: "u32Temp2", scope: !4569, file: !72, line: 5410, type: !736)
!4581 = !DILocation(line: 5410, column: 17, scope: !4569)
!4582 = !DILocalVariable(name: "u32Temp3", scope: !4569, file: !72, line: 5410, type: !736)
!4583 = !DILocation(line: 5410, column: 26, scope: !4569)
!4584 = !DILocalVariable(name: "u32Temp4", scope: !4569, file: !72, line: 5410, type: !736)
!4585 = !DILocation(line: 5410, column: 35, scope: !4569)
!4586 = !DILocalVariable(name: "u8SignBit", scope: !4569, file: !72, line: 5411, type: !29)
!4587 = !DILocation(line: 5411, column: 5, scope: !4569)
!4588 = !DILocation(line: 5413, column: 25, scope: !4569)
!4589 = !DILocation(line: 5413, column: 32, scope: !4569)
!4590 = !DILocation(line: 5413, column: 13, scope: !4569)
!4591 = !DILocation(line: 5413, column: 11, scope: !4569)
!4592 = !DILocation(line: 5414, column: 13, scope: !4569)
!4593 = !DILocation(line: 5414, column: 26, scope: !4569)
!4594 = !DILocation(line: 5414, column: 31, scope: !4569)
!4595 = !DILocation(line: 5414, column: 22, scope: !4569)
!4596 = !DILocation(line: 5414, column: 11, scope: !4569)
!4597 = !DILocation(line: 5415, column: 9, scope: !4569)
!4598 = !DILocation(line: 5415, column: 2, scope: !4569)
!4599 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !72, file: !72, line: 4833, type: !3022, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4600 = !DILocalVariable(name: "value", arg: 1, scope: !4599, file: !72, line: 4833, type: !736)
!4601 = !DILocation(line: 4833, column: 30, scope: !4599)
!4602 = !DILocalVariable(name: "factor", arg: 2, scope: !4599, file: !72, line: 4833, type: !29)
!4603 = !DILocation(line: 4833, column: 40, scope: !4599)
!4604 = !DILocation(line: 4835, column: 40, scope: !4599)
!4605 = !DILocation(line: 4835, column: 46, scope: !4599)
!4606 = !DILocation(line: 4835, column: 10, scope: !4599)
!4607 = !DILocation(line: 4835, column: 3, scope: !4599)
!4608 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !72, file: !72, line: 5499, type: !4609, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4609 = !DISubroutineType(types: !4610)
!4610 = !{!736, !736, !29, !736}
!4611 = !DILocalVariable(name: "value", arg: 1, scope: !4608, file: !72, line: 5499, type: !736)
!4612 = !DILocation(line: 5499, column: 39, scope: !4608)
!4613 = !DILocalVariable(name: "factor", arg: 2, scope: !4608, file: !72, line: 5499, type: !29)
!4614 = !DILocation(line: 5499, column: 49, scope: !4608)
!4615 = !DILocalVariable(name: "count", arg: 3, scope: !4608, file: !72, line: 5499, type: !736)
!4616 = !DILocation(line: 5499, column: 61, scope: !4608)
!4617 = !DILocalVariable(name: "u32Temp1", scope: !4608, file: !72, line: 5501, type: !736)
!4618 = !DILocation(line: 5501, column: 6, scope: !4608)
!4619 = !DILocalVariable(name: "u32Temp2", scope: !4608, file: !72, line: 5501, type: !736)
!4620 = !DILocation(line: 5501, column: 17, scope: !4608)
!4621 = !DILocation(line: 5503, column: 13, scope: !4608)
!4622 = !DILocation(line: 5503, column: 21, scope: !4608)
!4623 = !DILocation(line: 5503, column: 19, scope: !4608)
!4624 = !DILocation(line: 5503, column: 11, scope: !4608)
!4625 = !DILocation(line: 5504, column: 25, scope: !4608)
!4626 = !DILocation(line: 5504, column: 32, scope: !4608)
!4627 = !DILocation(line: 5504, column: 13, scope: !4608)
!4628 = !DILocation(line: 5504, column: 11, scope: !4608)
!4629 = !DILocation(line: 5505, column: 13, scope: !4608)
!4630 = !DILocation(line: 5505, column: 25, scope: !4608)
!4631 = !DILocation(line: 5505, column: 22, scope: !4608)
!4632 = !DILocation(line: 5505, column: 11, scope: !4608)
!4633 = !DILocation(line: 5506, column: 14, scope: !4608)
!4634 = !DILocation(line: 5506, column: 30, scope: !4608)
!4635 = !DILocation(line: 5506, column: 29, scope: !4608)
!4636 = !DILocation(line: 5506, column: 23, scope: !4608)
!4637 = !DILocation(line: 5506, column: 11, scope: !4608)
!4638 = !DILocation(line: 5507, column: 6, scope: !4639)
!4639 = distinct !DILexicalBlock(scope: !4608, file: !72, line: 5507, column: 5)
!4640 = !DILocation(line: 5507, column: 16, scope: !4639)
!4641 = !DILocation(line: 5507, column: 14, scope: !4639)
!4642 = !DILocation(line: 5507, column: 22, scope: !4639)
!4643 = !DILocation(line: 5507, column: 5, scope: !4608)
!4644 = !DILocation(line: 5509, column: 6, scope: !4645)
!4645 = distinct !DILexicalBlock(scope: !4646, file: !72, line: 5509, column: 6)
!4646 = distinct !DILexicalBlock(scope: !4639, file: !72, line: 5508, column: 2)
!4647 = !DILocation(line: 5509, column: 14, scope: !4645)
!4648 = !DILocation(line: 5509, column: 6, scope: !4646)
!4649 = !DILocation(line: 5510, column: 11, scope: !4645)
!4650 = !DILocation(line: 5510, column: 4, scope: !4645)
!4651 = !DILocation(line: 5512, column: 4, scope: !4645)
!4652 = !DILocation(line: 5516, column: 3, scope: !4653)
!4653 = distinct !DILexicalBlock(scope: !4639, file: !72, line: 5515, column: 2)
!4654 = !DILocation(line: 5518, column: 1, scope: !4608)
!4655 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !72, file: !72, line: 4856, type: !885, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4656 = !DILocalVariable(name: "value", arg: 1, scope: !4655, file: !72, line: 4856, type: !29)
!4657 = !DILocation(line: 4856, column: 28, scope: !4655)
!4658 = !DILocalVariable(name: "factor", arg: 2, scope: !4655, file: !72, line: 4856, type: !29)
!4659 = !DILocation(line: 4856, column: 38, scope: !4655)
!4660 = !DILocation(line: 4858, column: 38, scope: !4655)
!4661 = !DILocation(line: 4858, column: 44, scope: !4655)
!4662 = !DILocation(line: 4858, column: 10, scope: !4655)
!4663 = !DILocation(line: 4858, column: 3, scope: !4655)
!4664 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !72, file: !72, line: 4879, type: !885, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4665 = !DILocalVariable(name: "value", arg: 1, scope: !4664, file: !72, line: 4879, type: !29)
!4666 = !DILocation(line: 4879, column: 28, scope: !4664)
!4667 = !DILocalVariable(name: "factor", arg: 2, scope: !4664, file: !72, line: 4879, type: !29)
!4668 = !DILocation(line: 4879, column: 38, scope: !4664)
!4669 = !DILocation(line: 4881, column: 38, scope: !4664)
!4670 = !DILocation(line: 4881, column: 44, scope: !4664)
!4671 = !DILocation(line: 4881, column: 10, scope: !4664)
!4672 = !DILocation(line: 4881, column: 3, scope: !4664)
!4673 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !72, file: !72, line: 4903, type: !885, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4674 = !DILocalVariable(name: "value", arg: 1, scope: !4673, file: !72, line: 4903, type: !29)
!4675 = !DILocation(line: 4903, column: 26, scope: !4673)
!4676 = !DILocalVariable(name: "factor", arg: 2, scope: !4673, file: !72, line: 4903, type: !29)
!4677 = !DILocation(line: 4903, column: 36, scope: !4673)
!4678 = !DILocation(line: 4905, column: 38, scope: !4673)
!4679 = !DILocation(line: 4905, column: 44, scope: !4673)
!4680 = !DILocation(line: 4905, column: 10, scope: !4673)
!4681 = !DILocation(line: 4905, column: 3, scope: !4673)
!4682 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !72, file: !72, line: 4927, type: !885, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4683 = !DILocalVariable(name: "value", arg: 1, scope: !4682, file: !72, line: 4927, type: !29)
!4684 = !DILocation(line: 4927, column: 28, scope: !4682)
!4685 = !DILocalVariable(name: "factor", arg: 2, scope: !4682, file: !72, line: 4927, type: !29)
!4686 = !DILocation(line: 4927, column: 38, scope: !4682)
!4687 = !DILocation(line: 4929, column: 41, scope: !4682)
!4688 = !DILocation(line: 4929, column: 47, scope: !4682)
!4689 = !DILocation(line: 4929, column: 10, scope: !4682)
!4690 = !DILocation(line: 4929, column: 3, scope: !4682)
!4691 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !72, file: !72, line: 4951, type: !885, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4692 = !DILocalVariable(name: "value", arg: 1, scope: !4691, file: !72, line: 4951, type: !29)
!4693 = !DILocation(line: 4951, column: 26, scope: !4691)
!4694 = !DILocalVariable(name: "factor", arg: 2, scope: !4691, file: !72, line: 4951, type: !29)
!4695 = !DILocation(line: 4951, column: 36, scope: !4691)
!4696 = !DILocation(line: 4953, column: 41, scope: !4691)
!4697 = !DILocation(line: 4953, column: 47, scope: !4691)
!4698 = !DILocation(line: 4953, column: 10, scope: !4691)
!4699 = !DILocation(line: 4953, column: 3, scope: !4691)
!4700 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !72, file: !72, line: 4974, type: !885, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4701 = !DILocalVariable(name: "value", arg: 1, scope: !4700, file: !72, line: 4974, type: !29)
!4702 = !DILocation(line: 4974, column: 26, scope: !4700)
!4703 = !DILocalVariable(name: "factor", arg: 2, scope: !4700, file: !72, line: 4974, type: !29)
!4704 = !DILocation(line: 4974, column: 36, scope: !4700)
!4705 = !DILocation(line: 4976, column: 41, scope: !4700)
!4706 = !DILocation(line: 4976, column: 47, scope: !4700)
!4707 = !DILocation(line: 4976, column: 10, scope: !4700)
!4708 = !DILocation(line: 4976, column: 3, scope: !4700)
!4709 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !72, file: !72, line: 4997, type: !885, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4710 = !DILocalVariable(name: "value", arg: 1, scope: !4709, file: !72, line: 4997, type: !29)
!4711 = !DILocation(line: 4997, column: 25, scope: !4709)
!4712 = !DILocalVariable(name: "factor", arg: 2, scope: !4709, file: !72, line: 4997, type: !29)
!4713 = !DILocation(line: 4997, column: 35, scope: !4709)
!4714 = !DILocation(line: 4999, column: 41, scope: !4709)
!4715 = !DILocation(line: 4999, column: 47, scope: !4709)
!4716 = !DILocation(line: 4999, column: 10, scope: !4709)
!4717 = !DILocation(line: 4999, column: 3, scope: !4709)
!4718 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !72, file: !72, line: 5020, type: !885, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4719 = !DILocalVariable(name: "value", arg: 1, scope: !4718, file: !72, line: 5020, type: !29)
!4720 = !DILocation(line: 5020, column: 26, scope: !4718)
!4721 = !DILocalVariable(name: "factor", arg: 2, scope: !4718, file: !72, line: 5020, type: !29)
!4722 = !DILocation(line: 5020, column: 35, scope: !4718)
!4723 = !DILocation(line: 5022, column: 41, scope: !4718)
!4724 = !DILocation(line: 5022, column: 47, scope: !4718)
!4725 = !DILocation(line: 5022, column: 10, scope: !4718)
!4726 = !DILocation(line: 5022, column: 3, scope: !4718)
!4727 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !72, file: !72, line: 5043, type: !885, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4728 = !DILocalVariable(name: "value", arg: 1, scope: !4727, file: !72, line: 5043, type: !29)
!4729 = !DILocation(line: 5043, column: 25, scope: !4727)
!4730 = !DILocalVariable(name: "factor", arg: 2, scope: !4727, file: !72, line: 5043, type: !29)
!4731 = !DILocation(line: 5043, column: 35, scope: !4727)
!4732 = !DILocation(line: 5045, column: 41, scope: !4727)
!4733 = !DILocation(line: 5045, column: 47, scope: !4727)
!4734 = !DILocation(line: 5045, column: 10, scope: !4727)
!4735 = !DILocation(line: 5045, column: 3, scope: !4727)
!4736 = distinct !DISubprogram(name: "MulHighWord", scope: !4737, file: !4737, line: 39, type: !1412, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4737 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32/alarm_0107")
!4738 = !DILocalVariable(name: "arg1", arg: 1, scope: !4736, file: !4737, line: 39, type: !736)
!4739 = !DILocation(line: 39, column: 30, scope: !4736)
!4740 = !DILocalVariable(name: "arg2", arg: 2, scope: !4736, file: !4737, line: 39, type: !736)
!4741 = !DILocation(line: 39, column: 48, scope: !4736)
!4742 = !DILocalVariable(name: "arg1_LW", scope: !4736, file: !4737, line: 41, type: !34)
!4743 = !DILocation(line: 41, column: 6, scope: !4736)
!4744 = !DILocalVariable(name: "arg1_HW", scope: !4736, file: !4737, line: 41, type: !34)
!4745 = !DILocation(line: 41, column: 14, scope: !4736)
!4746 = !DILocalVariable(name: "arg2_LW", scope: !4736, file: !4737, line: 41, type: !34)
!4747 = !DILocation(line: 41, column: 22, scope: !4736)
!4748 = !DILocalVariable(name: "arg2_HW", scope: !4736, file: !4737, line: 41, type: !34)
!4749 = !DILocation(line: 41, column: 30, scope: !4736)
!4750 = !DILocalVariable(name: "MulTemp1", scope: !4736, file: !4737, line: 42, type: !736)
!4751 = !DILocation(line: 42, column: 6, scope: !4736)
!4752 = !DILocalVariable(name: "MulTemp2", scope: !4736, file: !4737, line: 42, type: !736)
!4753 = !DILocation(line: 42, column: 16, scope: !4736)
!4754 = !DILocalVariable(name: "MulTemp3", scope: !4736, file: !4737, line: 42, type: !736)
!4755 = !DILocation(line: 42, column: 26, scope: !4736)
!4756 = !DILocalVariable(name: "MulTemp4", scope: !4736, file: !4737, line: 42, type: !736)
!4757 = !DILocation(line: 42, column: 36, scope: !4736)
!4758 = !DILocalVariable(name: "HIGHWORD", scope: !4736, file: !4737, line: 42, type: !736)
!4759 = !DILocation(line: 42, column: 47, scope: !4736)
!4760 = !DILocalVariable(name: "OverFlow", scope: !4736, file: !4737, line: 42, type: !736)
!4761 = !DILocation(line: 42, column: 57, scope: !4736)
!4762 = !DILocation(line: 43, column: 12, scope: !4736)
!4763 = !DILocation(line: 43, column: 17, scope: !4736)
!4764 = !DILocation(line: 43, column: 10, scope: !4736)
!4765 = !DILocation(line: 44, column: 13, scope: !4736)
!4766 = !DILocation(line: 44, column: 18, scope: !4736)
!4767 = !DILocation(line: 44, column: 31, scope: !4736)
!4768 = !DILocation(line: 44, column: 12, scope: !4736)
!4769 = !DILocation(line: 44, column: 10, scope: !4736)
!4770 = !DILocation(line: 45, column: 12, scope: !4736)
!4771 = !DILocation(line: 45, column: 17, scope: !4736)
!4772 = !DILocation(line: 45, column: 10, scope: !4736)
!4773 = !DILocation(line: 46, column: 13, scope: !4736)
!4774 = !DILocation(line: 46, column: 18, scope: !4736)
!4775 = !DILocation(line: 46, column: 31, scope: !4736)
!4776 = !DILocation(line: 46, column: 12, scope: !4736)
!4777 = !DILocation(line: 46, column: 10, scope: !4736)
!4778 = !DILocation(line: 48, column: 48, scope: !4779)
!4779 = distinct !DILexicalBlock(scope: !4736, file: !4737, line: 48, column: 6)
!4780 = !DILocation(line: 48, column: 43, scope: !4779)
!4781 = !DILocation(line: 48, column: 33, scope: !4779)
!4782 = !DILocation(line: 48, column: 73, scope: !4779)
!4783 = !DILocation(line: 48, column: 68, scope: !4779)
!4784 = !DILocation(line: 48, column: 58, scope: !4779)
!4785 = !DILocation(line: 48, column: 8, scope: !4779)
!4786 = !DILocation(line: 48, column: 6, scope: !4736)
!4787 = !DILocation(line: 49, column: 6, scope: !4788)
!4788 = distinct !DILexicalBlock(scope: !4779, file: !4737, line: 48, column: 85)
!4789 = !DILocation(line: 56, column: 39, scope: !4736)
!4790 = !DILocation(line: 56, column: 34, scope: !4736)
!4791 = !DILocation(line: 56, column: 54, scope: !4736)
!4792 = !DILocation(line: 56, column: 49, scope: !4736)
!4793 = !DILocation(line: 56, column: 47, scope: !4736)
!4794 = !DILocation(line: 56, column: 24, scope: !4736)
!4795 = !DILocation(line: 56, column: 22, scope: !4736)
!4796 = !DILocation(line: 57, column: 2, scope: !4736)
!4797 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !13, file: !13, line: 78, type: !4798, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4798 = !DISubroutineType(types: !4799)
!4799 = !{!11, !6, !6}
!4800 = !DILocalVariable(name: "left", arg: 1, scope: !4797, file: !13, line: 78, type: !6)
!4801 = !DILocation(line: 78, column: 38, scope: !4797)
!4802 = !DILocalVariable(name: "right", arg: 2, scope: !4797, file: !13, line: 78, type: !6)
!4803 = !DILocation(line: 78, column: 52, scope: !4797)
!4804 = !DILocation(line: 80, column: 12, scope: !4797)
!4805 = !DILocation(line: 80, column: 19, scope: !4797)
!4806 = !DILocation(line: 80, column: 17, scope: !4797)
!4807 = !DILocation(line: 80, column: 25, scope: !4797)
!4808 = !DILocation(line: 80, column: 5, scope: !4797)
!4809 = distinct !DISubprogram(name: "MulLowWord", scope: !4737, file: !4737, line: 88, type: !1412, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4810 = !DILocalVariable(name: "arg1", arg: 1, scope: !4809, file: !4737, line: 88, type: !736)
!4811 = !DILocation(line: 88, column: 29, scope: !4809)
!4812 = !DILocalVariable(name: "arg2", arg: 2, scope: !4809, file: !4737, line: 88, type: !736)
!4813 = !DILocation(line: 88, column: 47, scope: !4809)
!4814 = !DILocalVariable(name: "arg1_LW", scope: !4809, file: !4737, line: 90, type: !34)
!4815 = !DILocation(line: 90, column: 6, scope: !4809)
!4816 = !DILocalVariable(name: "arg1_HW", scope: !4809, file: !4737, line: 90, type: !34)
!4817 = !DILocation(line: 90, column: 14, scope: !4809)
!4818 = !DILocalVariable(name: "arg2_LW", scope: !4809, file: !4737, line: 90, type: !34)
!4819 = !DILocation(line: 90, column: 22, scope: !4809)
!4820 = !DILocalVariable(name: "arg2_HW", scope: !4809, file: !4737, line: 90, type: !34)
!4821 = !DILocation(line: 90, column: 30, scope: !4809)
!4822 = !DILocalVariable(name: "MulTemp1", scope: !4809, file: !4737, line: 91, type: !736)
!4823 = !DILocation(line: 91, column: 6, scope: !4809)
!4824 = !DILocalVariable(name: "MulTemp2", scope: !4809, file: !4737, line: 91, type: !736)
!4825 = !DILocation(line: 91, column: 16, scope: !4809)
!4826 = !DILocalVariable(name: "MulTemp3", scope: !4809, file: !4737, line: 91, type: !736)
!4827 = !DILocation(line: 91, column: 26, scope: !4809)
!4828 = !DILocalVariable(name: "MulTemp4", scope: !4809, file: !4737, line: 91, type: !736)
!4829 = !DILocation(line: 91, column: 36, scope: !4809)
!4830 = !DILocalVariable(name: "HIGHWORD", scope: !4809, file: !4737, line: 91, type: !736)
!4831 = !DILocation(line: 91, column: 47, scope: !4809)
!4832 = !DILocalVariable(name: "OverFlow", scope: !4809, file: !4737, line: 91, type: !736)
!4833 = !DILocation(line: 91, column: 57, scope: !4809)
!4834 = !DILocation(line: 92, column: 12, scope: !4809)
!4835 = !DILocation(line: 92, column: 17, scope: !4809)
!4836 = !DILocation(line: 92, column: 10, scope: !4809)
!4837 = !DILocation(line: 93, column: 13, scope: !4809)
!4838 = !DILocation(line: 93, column: 18, scope: !4809)
!4839 = !DILocation(line: 93, column: 31, scope: !4809)
!4840 = !DILocation(line: 93, column: 12, scope: !4809)
!4841 = !DILocation(line: 93, column: 10, scope: !4809)
!4842 = !DILocation(line: 94, column: 12, scope: !4809)
!4843 = !DILocation(line: 94, column: 17, scope: !4809)
!4844 = !DILocation(line: 94, column: 10, scope: !4809)
!4845 = !DILocation(line: 95, column: 13, scope: !4809)
!4846 = !DILocation(line: 95, column: 18, scope: !4809)
!4847 = !DILocation(line: 95, column: 31, scope: !4809)
!4848 = !DILocation(line: 95, column: 12, scope: !4809)
!4849 = !DILocation(line: 95, column: 10, scope: !4809)
!4850 = !DILocation(line: 96, column: 13, scope: !4809)
!4851 = !DILocation(line: 96, column: 23, scope: !4809)
!4852 = !DILocation(line: 96, column: 21, scope: !4809)
!4853 = !DILocation(line: 96, column: 11, scope: !4809)
!4854 = !DILocation(line: 97, column: 13, scope: !4809)
!4855 = !DILocation(line: 97, column: 23, scope: !4809)
!4856 = !DILocation(line: 97, column: 21, scope: !4809)
!4857 = !DILocation(line: 97, column: 11, scope: !4809)
!4858 = !DILocation(line: 98, column: 13, scope: !4809)
!4859 = !DILocation(line: 98, column: 23, scope: !4809)
!4860 = !DILocation(line: 98, column: 21, scope: !4809)
!4861 = !DILocation(line: 98, column: 11, scope: !4809)
!4862 = !DILocation(line: 99, column: 13, scope: !4809)
!4863 = !DILocation(line: 99, column: 23, scope: !4809)
!4864 = !DILocation(line: 99, column: 21, scope: !4809)
!4865 = !DILocation(line: 99, column: 11, scope: !4809)
!4866 = !DILocation(line: 100, column: 14, scope: !4809)
!4867 = !DILocation(line: 100, column: 28, scope: !4809)
!4868 = !DILocation(line: 100, column: 37, scope: !4809)
!4869 = !DILocation(line: 100, column: 46, scope: !4809)
!4870 = !DILocation(line: 100, column: 24, scope: !4809)
!4871 = !DILocation(line: 100, column: 56, scope: !4809)
!4872 = !DILocation(line: 100, column: 65, scope: !4809)
!4873 = !DILocation(line: 100, column: 74, scope: !4809)
!4874 = !DILocation(line: 100, column: 52, scope: !4809)
!4875 = !DILocation(line: 100, column: 11, scope: !4809)
!4876 = !DILocation(line: 102, column: 9, scope: !4809)
!4877 = !DILocation(line: 102, column: 2, scope: !4809)
!4878 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4879, file: !4879, line: 12, type: !4880, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4883)
!4879 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4880 = !DISubroutineType(types: !4881)
!4881 = !{null, !4882}
!4882 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4883 = !{!4884}
!4884 = !DILocalVariable(name: "z", arg: 1, scope: !4878, file: !4879, line: 12, type: !4882)
!4885 = !DILocation(line: 0, scope: !4878)
!4886 = !DILocation(line: 13, column: 9, scope: !4887)
!4887 = distinct !DILexicalBlock(scope: !4878, file: !4879, line: 13, column: 7)
!4888 = !DILocation(line: 13, column: 7, scope: !4878)
!4889 = !DILocation(line: 14, column: 5, scope: !4887)
!4890 = !DILocation(line: 15, column: 1, scope: !4878)
!4891 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4892, file: !4892, line: 20, type: !4893, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4896)
!4892 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4893 = !DISubroutineType(types: !4894)
!4894 = !{null, !4895, !4895}
!4895 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4896 = !{!4897, !4898}
!4897 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4891, file: !4892, line: 20, type: !4895)
!4898 = !DILocalVariable(name: "shift", arg: 2, scope: !4891, file: !4892, line: 20, type: !4895)
!4899 = !DILocation(line: 0, scope: !4891)
!4900 = !DILocation(line: 21, column: 13, scope: !4901)
!4901 = distinct !DILexicalBlock(scope: !4891, file: !4892, line: 21, column: 7)
!4902 = !DILocation(line: 21, column: 7, scope: !4891)
!4903 = !DILocation(line: 27, column: 5, scope: !4904)
!4904 = distinct !DILexicalBlock(scope: !4901, file: !4892, line: 21, column: 26)
!4905 = !DILocation(line: 29, column: 1, scope: !4891)
