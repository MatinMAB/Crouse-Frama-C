; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/build/s32_mul_s32_s32_fac2_alarm_0112.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [64 x i8] c"KLEE-ALARM-0112: signed overflow. assert -factor <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0112.err\00", align 1
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
  %value = alloca i32, align 4
  %factor = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %factor, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i32* %result, metadata !59, metadata !DIExpression()), !dbg !60
  %0 = bitcast i32* %value to i8*, !dbg !61
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !62
  %1 = bitcast i32* %factor to i8*, !dbg !63
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  %2 = load i32, i32* %value, align 4, !dbg !65
  %3 = load i32, i32* %factor, align 4, !dbg !66
  %call = call i32 @s32_mul_s32_s32_fac2(i32 %2, i32 %3), !dbg !67
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
  br i1 %cmp5, label %if.then6, label %if.else9, !dbg !2278

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2279
  %conv = sext i32 %5 to i64, !dbg !2282
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !2283
  %tobool = icmp ne i32 %call, 0, !dbg !2283
  br i1 %tobool, label %if.end8, label %if.then7, !dbg !2284

if.then7:                                         ; preds = %if.then6
  store i32 0, i32* %retval, align 4, !dbg !2285
  br label %return, !dbg !2285

if.end8:                                          ; preds = %if.then6
  %6 = load i32, i32* %value.addr, align 4, !dbg !2287
  %sub = sub nsw i32 0, %6, !dbg !2288
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2289
  br label %if.end10, !dbg !2290

if.else9:                                         ; preds = %if.end
  %7 = load i32, i32* %value.addr, align 4, !dbg !2291
  store i32 %7, i32* %u32Temp1, align 4, !dbg !2293
  br label %if.end10

if.end10:                                         ; preds = %if.else9, %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2294
  %cmp11 = icmp slt i32 %8, 0, !dbg !2296
  br i1 %cmp11, label %if.then13, label %if.else21, !dbg !2297

if.then13:                                        ; preds = %if.end10
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2298
  %conv14 = sext i32 %9 to i64, !dbg !2301
  %call15 = call i32 @klee_alarm_s32_neg_valid(i64 %conv14), !dbg !2302
  %tobool16 = icmp ne i32 %call15, 0, !dbg !2302
  br i1 %tobool16, label %if.end18, label %if.then17, !dbg !2303

if.then17:                                        ; preds = %if.then13
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 2240, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !2304
  unreachable, !dbg !2304

if.end18:                                         ; preds = %if.then13
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2306
  %sub19 = sub nsw i32 0, %10, !dbg !2307
  %conv20 = sext i32 %sub19 to i64, !dbg !2308
  store volatile i64 %conv20, i64* @klee_alarm_sink_s64, align 8, !dbg !2309
  store i32 0, i32* %retval, align 4, !dbg !2310
  br label %return, !dbg !2310

if.else21:                                        ; preds = %if.end10
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2311
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2313
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2314
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2315
  %mul = mul i32 %12, %13, !dbg !2316
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2317
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2318
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2319
  %call23 = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2320
  store i32 %call23, i32* %u32Temp4, align 4, !dbg !2321
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2322
  %shr = lshr i32 %16, 30, !dbg !2323
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2324
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2325
  %shl = shl i32 %17, 2, !dbg !2326
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2327
  %or = or i32 %18, %shl, !dbg !2327
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2327
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !2328
  %shr24 = lshr i32 %19, 30, !dbg !2330
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !2331
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !2332

if.then27:                                        ; preds = %if.else21
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2333
  %conv28 = zext i8 %20 to i32, !dbg !2333
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !2336
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !2337

if.then31:                                        ; preds = %if.then27
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2338
  %cmp32 = icmp ule i32 %21, 2147483647, !dbg !2341
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !2342

if.then34:                                        ; preds = %if.then31
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2343
  store i32 %22, i32* %retval, align 4, !dbg !2344
  br label %return, !dbg !2344

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !2345
  br label %return, !dbg !2345

if.else36:                                        ; preds = %if.then27
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !2346
  %cmp37 = icmp ule i32 %23, -2147483648, !dbg !2349
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !2350

if.then39:                                        ; preds = %if.else36
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2351
  %sub40 = sub i32 0, %24, !dbg !2352
  store i32 %sub40, i32* %retval, align 4, !dbg !2353
  br label %return, !dbg !2353

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !2354
  br label %return, !dbg !2354

if.else42:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !2355
  br label %return, !dbg !2355

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34, %if.end18, %if.then7
  %25 = load i32, i32* %retval, align 4, !dbg !2357
  ret i32 %25, !dbg !2357
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2358 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2361, metadata !DIExpression()), !dbg !2362
  %0 = load i64, i64* %value.addr, align 8, !dbg !2363
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2364
  %conv = zext i1 %cmp to i32, !dbg !2364
  ret i32 %conv, !dbg !2365
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2366 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2369, metadata !DIExpression()), !dbg !2370
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2371, metadata !DIExpression()), !dbg !2372
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2373, metadata !DIExpression()), !dbg !2374
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2375, metadata !DIExpression()), !dbg !2376
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2377, metadata !DIExpression()), !dbg !2378
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2379, metadata !DIExpression()), !dbg !2380
  %0 = load i32, i32* %value.addr, align 4, !dbg !2381
  %cmp = icmp slt i32 %0, 0, !dbg !2383
  br i1 %cmp, label %if.then, label %if.else, !dbg !2384

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2385
  %sub = sub nsw i32 0, %1, !dbg !2387
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2388
  store i8 1, i8* %u8SignBit, align 1, !dbg !2389
  br label %if.end, !dbg !2390

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2391
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2393
  store i8 0, i8* %u8SignBit, align 1, !dbg !2394
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2395
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2396
  %conv = zext i8 %4 to i32, !dbg !2396
  %mul = mul i32 %3, %conv, !dbg !2397
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2398
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2399
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2400
  %conv1 = zext i8 %6 to i32, !dbg !2400
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2401
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2402
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2403
  %shr = lshr i32 %7, 8, !dbg !2404
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2405
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2406
  %shl = shl i32 %8, 24, !dbg !2407
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2408
  %or = or i32 %9, %shl, !dbg !2408
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2408
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2409
  %conv2 = zext i8 %10 to i32, !dbg !2409
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2411
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2412

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2413
  store i32 %11, i32* %retval, align 4, !dbg !2415
  br label %return, !dbg !2415

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2416
  %sub7 = sub i32 0, %12, !dbg !2418
  store i32 %sub7, i32* %retval, align 4, !dbg !2419
  br label %return, !dbg !2419

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2420
  ret i32 %13, !dbg !2420
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2421 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2422, metadata !DIExpression()), !dbg !2423
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2424, metadata !DIExpression()), !dbg !2425
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2426, metadata !DIExpression()), !dbg !2427
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2428, metadata !DIExpression()), !dbg !2429
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2430, metadata !DIExpression()), !dbg !2431
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2432, metadata !DIExpression()), !dbg !2433
  %0 = load i32, i32* %value.addr, align 4, !dbg !2434
  %cmp = icmp slt i32 %0, 0, !dbg !2436
  br i1 %cmp, label %if.then, label %if.else, !dbg !2437

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2438
  %sub = sub nsw i32 0, %1, !dbg !2440
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2441
  store i8 1, i8* %u8SignBit, align 1, !dbg !2442
  br label %if.end, !dbg !2443

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2444
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2446
  store i8 0, i8* %u8SignBit, align 1, !dbg !2447
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2448
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2449
  %conv = zext i8 %4 to i32, !dbg !2449
  %mul = mul i32 %3, %conv, !dbg !2450
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2451
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2452
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2453
  %conv1 = zext i8 %6 to i32, !dbg !2453
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2454
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2455
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2456
  %shr = lshr i32 %7, 7, !dbg !2457
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2458
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2459
  %shl = shl i32 %8, 25, !dbg !2460
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2461
  %or = or i32 %9, %shl, !dbg !2461
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2461
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2462
  %conv2 = zext i8 %10 to i32, !dbg !2462
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2464
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2465

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2466
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2469
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2470

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2471
  store i32 %12, i32* %retval, align 4, !dbg !2472
  br label %return, !dbg !2472

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2473
  br label %return, !dbg !2473

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2474
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2477
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2478

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2479
  %sub14 = sub i32 0, %14, !dbg !2480
  store i32 %sub14, i32* %retval, align 4, !dbg !2481
  br label %return, !dbg !2481

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2482
  br label %return, !dbg !2482

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2483
  ret i32 %15, !dbg !2483
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2484 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2487, metadata !DIExpression()), !dbg !2488
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2489, metadata !DIExpression()), !dbg !2490
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2491, metadata !DIExpression()), !dbg !2492
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2493, metadata !DIExpression()), !dbg !2494
  store i32 0, i32* %u32Temp1, align 4, !dbg !2494
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2495, metadata !DIExpression()), !dbg !2496
  store i32 0, i32* %u32Temp2, align 4, !dbg !2496
  %0 = load i8, i8* %power.addr, align 1, !dbg !2497
  %conv = zext i8 %0 to i32, !dbg !2497
  %cmp = icmp sge i32 %conv, 32, !dbg !2499
  br i1 %cmp, label %if.then, label %if.else, !dbg !2500

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2501
  br label %if.end7, !dbg !2503

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2504
  %conv2 = zext i8 %1 to i32, !dbg !2504
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2506
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2507

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2508
  br label %if.end7, !dbg !2510

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2511
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2512
  %mul = mul i32 %2, %3, !dbg !2513
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2514
  %4 = load i32, i32* %value.addr, align 4, !dbg !2515
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2516
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2517
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2518
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2519
  %7 = load i8, i8* %power.addr, align 1, !dbg !2520
  %conv8 = zext i8 %7 to i32, !dbg !2520
  %sub = sub nsw i32 32, %conv8, !dbg !2521
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2522
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2522
  %shr = lshr i32 %6, %sub, !dbg !2522, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2523
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2524
  %9 = load i8, i8* %power.addr, align 1, !dbg !2525
  %conv9 = zext i8 %9 to i32, !dbg !2525
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2526
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2526
  %shl = shl i32 %8, %conv9, !dbg !2526, !klee.check.shift !261
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2527
  %or = or i32 %10, %shl, !dbg !2527
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2527
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2528
  %12 = load i8, i8* %power.addr, align 1, !dbg !2530
  %conv10 = zext i8 %12 to i32, !dbg !2530
  %sub11 = sub nsw i32 32, %conv10, !dbg !2531
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2532
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2532
  %shr12 = lshr i32 %11, %sub11, !dbg !2532, !klee.check.shift !261
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2533
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2534

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2535
  store i32 %13, i32* %retval, align 4, !dbg !2537
  br label %return, !dbg !2537

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2538
  br label %return, !dbg !2538

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2540
  ret i32 %14, !dbg !2540
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2541 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2544, metadata !DIExpression()), !dbg !2545
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2546, metadata !DIExpression()), !dbg !2547
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2548, metadata !DIExpression()), !dbg !2549
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2550, metadata !DIExpression()), !dbg !2551
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2552, metadata !DIExpression()), !dbg !2553
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2554, metadata !DIExpression()), !dbg !2555
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2556, metadata !DIExpression()), !dbg !2557
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2558, metadata !DIExpression()), !dbg !2559
  %0 = load i8, i8* %power.addr, align 1, !dbg !2560
  %conv = zext i8 %0 to i32, !dbg !2560
  %cmp = icmp sge i32 %conv, 32, !dbg !2562
  br i1 %cmp, label %if.then, label %if.else, !dbg !2563

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2564
  br label %if.end7, !dbg !2566

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2567
  %conv2 = zext i8 %1 to i32, !dbg !2567
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2569
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2570

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2571
  br label %if.end7, !dbg !2573

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2574
  %cmp8 = icmp slt i32 %2, 0, !dbg !2576
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2577
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2577

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2578
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2579
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2580
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2580

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2581
  br label %if.end19, !dbg !2583

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2584
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2586
  %cmp20 = icmp slt i32 %6, 0, !dbg !2588
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2589

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2590
  %sub = sub nsw i32 0, %7, !dbg !2592
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2593
  br label %if.end24, !dbg !2594

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2595
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2597
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2598
  %cmp25 = icmp slt i32 %9, 0, !dbg !2600
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2601

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2602
  %sub28 = sub nsw i32 0, %10, !dbg !2604
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2605
  br label %if.end30, !dbg !2606

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2607
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2609
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2610
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2611
  %mul = mul i32 %12, %13, !dbg !2612
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2613
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2614
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2615
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2616
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2617
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2618
  %17 = load i8, i8* %power.addr, align 1, !dbg !2619
  %conv31 = zext i8 %17 to i32, !dbg !2619
  %sub32 = sub nsw i32 32, %conv31, !dbg !2620
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2621
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2621
  %shr = lshr i32 %16, %sub32, !dbg !2621, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2622
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2623
  %19 = load i8, i8* %power.addr, align 1, !dbg !2624
  %conv33 = zext i8 %19 to i32, !dbg !2624
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2625
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2625
  %shl = shl i32 %18, %conv33, !dbg !2625, !klee.check.shift !261
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2626
  %or = or i32 %20, %shl, !dbg !2626
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2626
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2627
  %22 = load i8, i8* %power.addr, align 1, !dbg !2629
  %conv34 = zext i8 %22 to i32, !dbg !2629
  %sub35 = sub nsw i32 32, %conv34, !dbg !2630
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2631
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2631
  %shr36 = lshr i32 %21, %sub35, !dbg !2631, !klee.check.shift !261
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2632
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2633

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2634
  %conv40 = zext i8 %23 to i32, !dbg !2634
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2637
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2638

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2639
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2642
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2643

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2644
  store i32 %25, i32* %retval, align 4, !dbg !2645
  br label %return, !dbg !2645

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2646
  br label %return, !dbg !2646

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2647
  %sub49 = sub i32 0, %26, !dbg !2649
  store i32 %sub49, i32* %retval, align 4, !dbg !2650
  br label %return, !dbg !2650

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2651
  %conv51 = zext i8 %27 to i32, !dbg !2651
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2654
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2655

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2656
  br label %return, !dbg !2656

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2658
  br label %return, !dbg !2658

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2660
  ret i32 %28, !dbg !2660
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2661 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2664, metadata !DIExpression()), !dbg !2665
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2666, metadata !DIExpression()), !dbg !2667
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2668, metadata !DIExpression()), !dbg !2669
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2670, metadata !DIExpression()), !dbg !2671
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2672, metadata !DIExpression()), !dbg !2673
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2674, metadata !DIExpression()), !dbg !2675
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2676, metadata !DIExpression()), !dbg !2677
  %0 = load i32, i32* %value.addr, align 4, !dbg !2678
  %cmp = icmp slt i32 %0, 0, !dbg !2680
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2681

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2682
  %conv = sext i8 %1 to i32, !dbg !2682
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2683
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2684

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2685
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2686
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2687

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2688
  %conv6 = sext i8 %3 to i32, !dbg !2688
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2689
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2690

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2691
  br label %if.end, !dbg !2693

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2694
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2696
  %cmp9 = icmp slt i32 %4, 0, !dbg !2698
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2699

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2700
  %sub = sub nsw i32 0, %5, !dbg !2702
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2703
  br label %if.end13, !dbg !2704

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2705
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2707
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2708
  %conv14 = sext i8 %7 to i32, !dbg !2708
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2710
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2711

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2712
  %conv18 = sext i8 %8 to i32, !dbg !2712
  %sub19 = sub nsw i32 0, %conv18, !dbg !2714
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2715
  br label %if.end22, !dbg !2716

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2717
  %conv21 = sext i8 %9 to i32, !dbg !2717
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2719
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2720
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2721
  %mul = mul i32 %10, %11, !dbg !2722
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2723
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2724
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2725
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2726
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2727
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2728
  %shr = lshr i32 %14, 7, !dbg !2729
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2730
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2731
  %shl = shl i32 %15, 25, !dbg !2732
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2733
  %or = or i32 %16, %shl, !dbg !2733
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2733
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2734
  %conv23 = zext i8 %17 to i32, !dbg !2734
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2736
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2737

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2738
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2741
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2742

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2743
  store i32 %19, i32* %retval, align 4, !dbg !2744
  br label %return, !dbg !2744

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2745
  br label %return, !dbg !2745

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2746
  %sub32 = sub i32 0, %20, !dbg !2748
  store i32 %sub32, i32* %retval, align 4, !dbg !2749
  br label %return, !dbg !2749

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2750
  ret i32 %21, !dbg !2750
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2751 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2752, metadata !DIExpression()), !dbg !2753
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2754, metadata !DIExpression()), !dbg !2755
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2756, metadata !DIExpression()), !dbg !2757
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2758, metadata !DIExpression()), !dbg !2759
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2760, metadata !DIExpression()), !dbg !2761
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2762, metadata !DIExpression()), !dbg !2763
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2764, metadata !DIExpression()), !dbg !2765
  %0 = load i32, i32* %value.addr, align 4, !dbg !2766
  %cmp = icmp slt i32 %0, 0, !dbg !2768
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2769

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2770
  %conv = sext i8 %1 to i32, !dbg !2770
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2771
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2772

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2773
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2774
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2775

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2776
  %conv6 = sext i8 %3 to i32, !dbg !2776
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2777
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2778

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2779
  br label %if.end, !dbg !2781

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2782
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2784
  %cmp9 = icmp slt i32 %4, 0, !dbg !2786
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2787

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2788
  %sub = sub nsw i32 0, %5, !dbg !2790
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2791
  br label %if.end13, !dbg !2792

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2793
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2795
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2796
  %conv14 = sext i8 %7 to i32, !dbg !2796
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2798
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2799

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2800
  %conv18 = sext i8 %8 to i32, !dbg !2800
  %sub19 = sub nsw i32 0, %conv18, !dbg !2802
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2803
  br label %if.end22, !dbg !2804

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2805
  %conv21 = sext i8 %9 to i32, !dbg !2805
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2807
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2808
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2809
  %mul = mul i32 %10, %11, !dbg !2810
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2811
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2812
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2813
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2814
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2815
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2816
  %shr = lshr i32 %14, 6, !dbg !2817
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2818
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2819
  %shl = shl i32 %15, 26, !dbg !2820
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2821
  %or = or i32 %16, %shl, !dbg !2821
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2821
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2822
  %shr23 = lshr i32 %17, 6, !dbg !2824
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2825
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2826

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2827
  %conv27 = zext i8 %18 to i32, !dbg !2827
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2830
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2831

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2832
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2835
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2836

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2837
  store i32 %20, i32* %retval, align 4, !dbg !2838
  br label %return, !dbg !2838

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2839
  br label %return, !dbg !2839

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2840
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2843
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2844

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2845
  %sub39 = sub i32 0, %22, !dbg !2846
  store i32 %sub39, i32* %retval, align 4, !dbg !2847
  br label %return, !dbg !2847

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2848
  br label %return, !dbg !2848

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2849
  br label %return, !dbg !2849

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2851
  ret i32 %23, !dbg !2851
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2852 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2853, metadata !DIExpression()), !dbg !2854
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2855, metadata !DIExpression()), !dbg !2856
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2857, metadata !DIExpression()), !dbg !2858
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2859, metadata !DIExpression()), !dbg !2860
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2861, metadata !DIExpression()), !dbg !2862
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2863, metadata !DIExpression()), !dbg !2864
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2865, metadata !DIExpression()), !dbg !2866
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2867
  %cmp = icmp slt i32 %0, 0, !dbg !2869
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2870
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2870

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2871
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2872
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2873
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2873

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2874
  br label %if.end, !dbg !2876

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2877
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2879
  %cmp5 = icmp slt i32 %4, 0, !dbg !2881
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2882

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2883
  %sub = sub nsw i32 0, %5, !dbg !2885
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2886
  br label %if.end8, !dbg !2887

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2888
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2890
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2891
  %cmp9 = icmp slt i32 %7, 0, !dbg !2893
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2894

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2895
  %sub11 = sub nsw i32 0, %8, !dbg !2897
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2898
  br label %if.end13, !dbg !2899

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2900
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2902
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2903
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2904
  %mul = mul i32 %10, %11, !dbg !2905
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2906
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2907
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2908
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2909
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2910
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2911
  %cmp14 = icmp eq i32 %14, 0, !dbg !2913
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2914

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2915
  %conv = zext i8 %15 to i32, !dbg !2915
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2918
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2919

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2920
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2923
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2924

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2925
  store i32 %17, i32* %retval, align 4, !dbg !2926
  br label %return, !dbg !2926

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2927
  br label %return, !dbg !2927

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2928
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2931
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2932

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2933
  %sub27 = sub i32 0, %19, !dbg !2934
  store i32 %sub27, i32* %retval, align 4, !dbg !2935
  br label %return, !dbg !2935

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2936
  br label %return, !dbg !2936

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2937
  %conv30 = zext i8 %20 to i32, !dbg !2937
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2940
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2941

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2942
  br label %return, !dbg !2942

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2944
  br label %return, !dbg !2944

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2946
  ret i32 %21, !dbg !2946
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2947 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2948, metadata !DIExpression()), !dbg !2949
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2950, metadata !DIExpression()), !dbg !2951
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2952, metadata !DIExpression()), !dbg !2953
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2954, metadata !DIExpression()), !dbg !2955
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2956, metadata !DIExpression()), !dbg !2957
  %0 = load i32, i32* %value.addr, align 4, !dbg !2958
  %cmp = icmp slt i32 %0, 0, !dbg !2960
  br i1 %cmp, label %if.then, label %if.else, !dbg !2961

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2962
  %sub = sub nsw i32 0, %1, !dbg !2964
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2965
  store i8 1, i8* %u8SignBit, align 1, !dbg !2966
  br label %if.end, !dbg !2967

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2968
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2970
  store i8 0, i8* %u8SignBit, align 1, !dbg !2971
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2972
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2973
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2974
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2975
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2976
  %shr = lshr i32 %5, 1, !dbg !2977
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2978
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2979
  %conv = zext i8 %6 to i32, !dbg !2979
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2981
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2982

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2983
  store i32 %7, i32* %retval, align 4, !dbg !2985
  br label %return, !dbg !2985

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2986
  %sub5 = sub i32 0, %8, !dbg !2988
  store i32 %sub5, i32* %retval, align 4, !dbg !2989
  br label %return, !dbg !2989

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2990
  ret i32 %9, !dbg !2990
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2991 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2992, metadata !DIExpression()), !dbg !2993
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2994, metadata !DIExpression()), !dbg !2995
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2996, metadata !DIExpression()), !dbg !2997
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2998, metadata !DIExpression()), !dbg !2999
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3000, metadata !DIExpression()), !dbg !3001
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3002, metadata !DIExpression()), !dbg !3003
  %0 = load i32, i32* %value.addr, align 4, !dbg !3004
  %cmp = icmp slt i32 %0, 0, !dbg !3006
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3007
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !3007

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3008
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3009
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3010
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3010

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3011
  br label %if.end, !dbg !3013

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3014
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3016
  %cmp5 = icmp slt i32 %4, 0, !dbg !3018
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3019

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3020
  %sub = sub nsw i32 0, %5, !dbg !3022
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3023
  br label %if.end8, !dbg !3024

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3025
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3027
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3028
  %cmp9 = icmp slt i32 %7, 0, !dbg !3030
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3031

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3032
  %sub11 = sub nsw i32 0, %8, !dbg !3034
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3035
  br label %if.end13, !dbg !3036

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3037
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3039
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3040
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3041
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3042
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3043
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3044
  %conv = zext i8 %12 to i32, !dbg !3044
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3046
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3047

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3048
  store i32 %13, i32* %retval, align 4, !dbg !3050
  br label %return, !dbg !3050

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3051
  %sub18 = sub i32 0, %14, !dbg !3053
  store i32 %sub18, i32* %retval, align 4, !dbg !3054
  br label %return, !dbg !3054

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3055
  ret i32 %15, !dbg !3055
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3056 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3059, metadata !DIExpression()), !dbg !3060
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3061, metadata !DIExpression()), !dbg !3062
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3063, metadata !DIExpression()), !dbg !3064
  store i32 0, i32* %u32Temp1, align 4, !dbg !3064
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3065, metadata !DIExpression()), !dbg !3066
  store i32 0, i32* %u32Temp2, align 4, !dbg !3066
  %0 = load i32, i32* %value.addr, align 4, !dbg !3067
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3068
  %conv = zext i8 %1 to i32, !dbg !3068
  %mul = mul i32 %0, %conv, !dbg !3069
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3070
  %2 = load i32, i32* %value.addr, align 4, !dbg !3071
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3072
  %conv1 = zext i8 %3 to i32, !dbg !3072
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3073
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3074
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3075
  %shr = lshr i32 %4, 8, !dbg !3076
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3077
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3078
  %shl = shl i32 %5, 24, !dbg !3079
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3080
  %or = or i32 %6, %shl, !dbg !3080
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3080
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3081
  ret i32 %7, !dbg !3082
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3083 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3084, metadata !DIExpression()), !dbg !3085
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3086, metadata !DIExpression()), !dbg !3087
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3088, metadata !DIExpression()), !dbg !3089
  store i32 0, i32* %u32Temp1, align 4, !dbg !3089
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3090, metadata !DIExpression()), !dbg !3091
  store i32 0, i32* %u32Temp2, align 4, !dbg !3091
  %0 = load i32, i32* %value.addr, align 4, !dbg !3092
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3093
  %conv = zext i8 %1 to i32, !dbg !3093
  %mul = mul i32 %0, %conv, !dbg !3094
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3095
  %2 = load i32, i32* %value.addr, align 4, !dbg !3096
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3097
  %conv1 = zext i8 %3 to i32, !dbg !3097
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3098
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3099
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3100
  %shr = lshr i32 %4, 7, !dbg !3101
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3102
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3103
  %shl = shl i32 %5, 25, !dbg !3104
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3105
  %or = or i32 %6, %shl, !dbg !3105
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3105
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3106
  %shr2 = lshr i32 %7, 7, !dbg !3108
  %cmp = icmp eq i32 %shr2, 0, !dbg !3109
  br i1 %cmp, label %if.then, label %if.else, !dbg !3110

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3111
  store i32 %8, i32* %retval, align 4, !dbg !3113
  br label %return, !dbg !3113

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3114
  br label %return, !dbg !3114

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3116
  ret i32 %9, !dbg !3116
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3117 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3120, metadata !DIExpression()), !dbg !3121
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3122, metadata !DIExpression()), !dbg !3123
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3124, metadata !DIExpression()), !dbg !3125
  store i32 0, i32* %u32Temp1, align 4, !dbg !3125
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3126, metadata !DIExpression()), !dbg !3127
  store i32 0, i32* %u32Temp2, align 4, !dbg !3127
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3128
  %conv = sext i8 %0 to i32, !dbg !3128
  %cmp = icmp sgt i32 %conv, 0, !dbg !3130
  br i1 %cmp, label %if.then, label %if.else, !dbg !3131

if.then:                                          ; preds = %entry
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
  %shr = lshr i32 %5, 7, !dbg !3142
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3143
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3144
  %shl = shl i32 %6, 25, !dbg !3145
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3146
  %or = or i32 %7, %shl, !dbg !3146
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3146
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3147
  store i32 %8, i32* %retval, align 4, !dbg !3148
  br label %return, !dbg !3148

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3149
  br label %return, !dbg !3149

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3151
  ret i32 %9, !dbg !3151
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3152 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3153, metadata !DIExpression()), !dbg !3154
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3155, metadata !DIExpression()), !dbg !3156
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3157, metadata !DIExpression()), !dbg !3158
  store i32 0, i32* %u32Temp1, align 4, !dbg !3158
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3159, metadata !DIExpression()), !dbg !3160
  store i32 0, i32* %u32Temp2, align 4, !dbg !3160
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3161
  %conv = sext i8 %0 to i32, !dbg !3161
  %cmp = icmp sle i32 %conv, 0, !dbg !3163
  br i1 %cmp, label %if.then, label %if.else, !dbg !3164

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3165
  br label %return, !dbg !3165

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3167
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3169
  %conv2 = sext i8 %2 to i32, !dbg !3169
  %mul = mul i32 %1, %conv2, !dbg !3170
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3171
  %3 = load i32, i32* %value.addr, align 4, !dbg !3172
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3173
  %conv3 = sext i8 %4 to i32, !dbg !3173
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3174
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3175
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3176
  %shr = lshr i32 %5, 6, !dbg !3177
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3178
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3179
  %shl = shl i32 %6, 26, !dbg !3180
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3181
  %or = or i32 %7, %shl, !dbg !3181
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3181
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3182
  %shr4 = lshr i32 %8, 6, !dbg !3184
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3185
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3186

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3187
  store i32 %9, i32* %retval, align 4, !dbg !3189
  br label %return, !dbg !3189

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3190
  br label %return, !dbg !3190

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3192
  ret i32 %10, !dbg !3192
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3194, metadata !DIExpression()), !dbg !3195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3196, metadata !DIExpression()), !dbg !3197
  %0 = load i16, i16* %value.addr, align 2, !dbg !3198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3199
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3200
  ret i16 %call, !dbg !3201
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3203, metadata !DIExpression()), !dbg !3204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3205, metadata !DIExpression()), !dbg !3206
  %0 = load i16, i16* %value.addr, align 2, !dbg !3207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3208
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3209
  ret i16 %call, !dbg !3210
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3214, metadata !DIExpression()), !dbg !3215
  %0 = load i16, i16* %value.addr, align 2, !dbg !3216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3217
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3218
  ret i16 %call, !dbg !3219
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3220 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3221, metadata !DIExpression()), !dbg !3222
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3223, metadata !DIExpression()), !dbg !3224
  %0 = load i16, i16* %value.addr, align 2, !dbg !3225
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3226
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3227
  ret i16 %call, !dbg !3228
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3229 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3230, metadata !DIExpression()), !dbg !3231
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3232, metadata !DIExpression()), !dbg !3233
  %0 = load i16, i16* %value.addr, align 2, !dbg !3234
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3235
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3236
  ret i16 %call, !dbg !3237
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3238 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3239, metadata !DIExpression()), !dbg !3240
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3241, metadata !DIExpression()), !dbg !3242
  %0 = load i16, i16* %value.addr, align 2, !dbg !3243
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3244
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3245
  ret i16 %call, !dbg !3246
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3247 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3248, metadata !DIExpression()), !dbg !3249
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3250, metadata !DIExpression()), !dbg !3251
  %0 = load i16, i16* %value.addr, align 2, !dbg !3252
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3253
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3254
  ret i16 %call, !dbg !3255
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3256 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3257, metadata !DIExpression()), !dbg !3258
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3259, metadata !DIExpression()), !dbg !3260
  %0 = load i16, i16* %value.addr, align 2, !dbg !3261
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3262
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3263
  ret i16 %call, !dbg !3264
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3265 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3266, metadata !DIExpression()), !dbg !3267
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3268, metadata !DIExpression()), !dbg !3269
  %0 = load i16, i16* %value.addr, align 2, !dbg !3270
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3271
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3272
  ret i16 %call, !dbg !3273
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3274 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3275, metadata !DIExpression()), !dbg !3276
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3277, metadata !DIExpression()), !dbg !3278
  %0 = load i16, i16* %value.addr, align 2, !dbg !3279
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3280
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3281
  ret i16 %call, !dbg !3282
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3283 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3284, metadata !DIExpression()), !dbg !3285
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3286, metadata !DIExpression()), !dbg !3287
  %0 = load i16, i16* %value.addr, align 2, !dbg !3288
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3289
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3290
  ret i16 %call, !dbg !3291
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3292 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3293, metadata !DIExpression()), !dbg !3294
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3295, metadata !DIExpression()), !dbg !3296
  %0 = load i16, i16* %value.addr, align 2, !dbg !3297
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3298
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3299
  ret i16 %call, !dbg !3300
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3301 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3302, metadata !DIExpression()), !dbg !3303
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3304, metadata !DIExpression()), !dbg !3305
  %0 = load i16, i16* %value.addr, align 2, !dbg !3306
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3307
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3308
  ret i16 %call, !dbg !3309
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3310 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3313, metadata !DIExpression()), !dbg !3314
  %0 = load i16, i16* %value.addr, align 2, !dbg !3315
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3316
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3317
  ret i16 %call, !dbg !3318
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3319 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3320, metadata !DIExpression()), !dbg !3321
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3322, metadata !DIExpression()), !dbg !3323
  %0 = load i16, i16* %value.addr, align 2, !dbg !3324
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3325
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3326
  ret i16 %call, !dbg !3327
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3328 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3329, metadata !DIExpression()), !dbg !3330
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3331, metadata !DIExpression()), !dbg !3332
  %0 = load i16, i16* %value.addr, align 2, !dbg !3333
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3334
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3335
  %2 = load i16, i16* %retval, align 2, !dbg !3336
  ret i16 %2, !dbg !3336
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3337 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3338, metadata !DIExpression()), !dbg !3339
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3340, metadata !DIExpression()), !dbg !3341
  %0 = load i16, i16* %value.addr, align 2, !dbg !3342
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3343
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3344
  ret i16 %call, !dbg !3345
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3346 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3347, metadata !DIExpression()), !dbg !3348
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3349, metadata !DIExpression()), !dbg !3350
  %0 = load i16, i16* %value.addr, align 2, !dbg !3351
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3352
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3353
  ret i16 %call, !dbg !3354
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3355 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3356, metadata !DIExpression()), !dbg !3357
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3358, metadata !DIExpression()), !dbg !3359
  %0 = load i16, i16* %value.addr, align 2, !dbg !3360
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3361
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3362
  ret i16 %call, !dbg !3363
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3364 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3365, metadata !DIExpression()), !dbg !3366
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3367, metadata !DIExpression()), !dbg !3368
  %0 = load i16, i16* %value.addr, align 2, !dbg !3369
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3370
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3371
  ret i16 %call, !dbg !3372
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3373 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3374, metadata !DIExpression()), !dbg !3375
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3376, metadata !DIExpression()), !dbg !3377
  %0 = load i16, i16* %value.addr, align 2, !dbg !3378
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3379
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3380
  ret i16 %call, !dbg !3381
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3382 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3383, metadata !DIExpression()), !dbg !3384
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3385, metadata !DIExpression()), !dbg !3386
  %0 = load i16, i16* %value.addr, align 2, !dbg !3387
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3388
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3389
  ret i16 %call, !dbg !3390
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3391 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3392, metadata !DIExpression()), !dbg !3393
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3394, metadata !DIExpression()), !dbg !3395
  %0 = load i16, i16* %value.addr, align 2, !dbg !3396
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3397
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3398
  ret i16 %call, !dbg !3399
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3400 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3401, metadata !DIExpression()), !dbg !3402
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3403, metadata !DIExpression()), !dbg !3404
  %0 = load i16, i16* %value.addr, align 2, !dbg !3405
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3406
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3407
  ret i16 %call, !dbg !3408
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3409 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3410, metadata !DIExpression()), !dbg !3411
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3412, metadata !DIExpression()), !dbg !3413
  %0 = load i16, i16* %value.addr, align 2, !dbg !3414
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3415
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3416
  ret i16 %call, !dbg !3417
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3418 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3419, metadata !DIExpression()), !dbg !3420
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3421, metadata !DIExpression()), !dbg !3422
  %0 = load i16, i16* %value.addr, align 2, !dbg !3423
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3424
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3425
  ret i16 %call, !dbg !3426
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3427 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3428, metadata !DIExpression()), !dbg !3429
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3430, metadata !DIExpression()), !dbg !3431
  %0 = load i16, i16* %value.addr, align 2, !dbg !3432
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3433
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3434
  ret i16 %call, !dbg !3435
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3436 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3437, metadata !DIExpression()), !dbg !3438
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3439, metadata !DIExpression()), !dbg !3440
  %0 = load i16, i16* %value.addr, align 2, !dbg !3441
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3442
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3443
  ret i16 %call, !dbg !3444
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3445 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3446, metadata !DIExpression()), !dbg !3447
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3448, metadata !DIExpression()), !dbg !3449
  %0 = load i16, i16* %value.addr, align 2, !dbg !3450
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3451
  %conv = zext i8 %1 to i16, !dbg !3452
  %conv1 = zext i16 %conv to i32, !dbg !3452
  %shl = shl i32 %conv1, 5, !dbg !3453
  %conv2 = trunc i32 %shl to i16, !dbg !3454
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3455
  ret i16 %call, !dbg !3456
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3457 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3458, metadata !DIExpression()), !dbg !3459
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3460, metadata !DIExpression()), !dbg !3461
  %0 = load i16, i16* %value.addr, align 2, !dbg !3462
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3463
  %conv = zext i8 %1 to i16, !dbg !3464
  %conv1 = zext i16 %conv to i32, !dbg !3464
  %shl = shl i32 %conv1, 6, !dbg !3465
  %conv2 = trunc i32 %shl to i16, !dbg !3466
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3467
  ret i16 %call, !dbg !3468
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3469 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3470, metadata !DIExpression()), !dbg !3471
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3472, metadata !DIExpression()), !dbg !3473
  %0 = load i16, i16* %value.addr, align 2, !dbg !3474
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3475
  %conv = zext i8 %1 to i16, !dbg !3476
  %conv1 = zext i16 %conv to i32, !dbg !3476
  %shl = shl i32 %conv1, 7, !dbg !3477
  %conv2 = trunc i32 %shl to i16, !dbg !3478
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3479
  ret i16 %call, !dbg !3480
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3481 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3482, metadata !DIExpression()), !dbg !3483
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3484, metadata !DIExpression()), !dbg !3485
  %0 = load i16, i16* %value.addr, align 2, !dbg !3486
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3487
  %conv = zext i8 %1 to i16, !dbg !3488
  %conv1 = zext i16 %conv to i32, !dbg !3488
  %shl = shl i32 %conv1, 7, !dbg !3489
  %conv2 = trunc i32 %shl to i16, !dbg !3490
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3491
  ret i16 %call, !dbg !3492
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3493 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3494, metadata !DIExpression()), !dbg !3495
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3496, metadata !DIExpression()), !dbg !3497
  %0 = load i16, i16* %value.addr, align 2, !dbg !3498
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3499
  %conv = zext i8 %1 to i16, !dbg !3500
  %conv1 = zext i16 %conv to i32, !dbg !3500
  %shl = shl i32 %conv1, 4, !dbg !3501
  %conv2 = trunc i32 %shl to i16, !dbg !3502
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3503
  ret i16 %call, !dbg !3504
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3505 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3506, metadata !DIExpression()), !dbg !3507
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3508, metadata !DIExpression()), !dbg !3509
  %0 = load i16, i16* %value.addr, align 2, !dbg !3510
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3511
  %conv = zext i8 %1 to i16, !dbg !3512
  %conv1 = zext i16 %conv to i32, !dbg !3512
  %shl = shl i32 %conv1, 5, !dbg !3513
  %conv2 = trunc i32 %shl to i16, !dbg !3514
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3515
  ret i16 %call, !dbg !3516
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3517 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3518, metadata !DIExpression()), !dbg !3519
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3520, metadata !DIExpression()), !dbg !3521
  %0 = load i16, i16* %value.addr, align 2, !dbg !3522
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3523
  %conv = zext i8 %1 to i16, !dbg !3524
  %conv1 = zext i16 %conv to i32, !dbg !3524
  %shl = shl i32 %conv1, 2, !dbg !3525
  %conv2 = trunc i32 %shl to i16, !dbg !3526
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3527
  ret i16 %call, !dbg !3528
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3529 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3530, metadata !DIExpression()), !dbg !3531
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3532, metadata !DIExpression()), !dbg !3533
  %0 = load i16, i16* %value.addr, align 2, !dbg !3534
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3535
  %conv = zext i8 %1 to i16, !dbg !3536
  %conv1 = zext i16 %conv to i32, !dbg !3536
  %shl = shl i32 %conv1, 6, !dbg !3537
  %conv2 = trunc i32 %shl to i16, !dbg !3538
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3539
  ret i16 %call, !dbg !3540
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3541 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3542, metadata !DIExpression()), !dbg !3543
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3544, metadata !DIExpression()), !dbg !3545
  %0 = load i16, i16* %value.addr, align 2, !dbg !3546
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3547
  %conv = zext i8 %1 to i16, !dbg !3548
  %conv1 = zext i16 %conv to i32, !dbg !3548
  %shl = shl i32 %conv1, 3, !dbg !3549
  %conv2 = trunc i32 %shl to i16, !dbg !3550
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3551
  ret i16 %call, !dbg !3552
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3553 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3554, metadata !DIExpression()), !dbg !3555
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3556, metadata !DIExpression()), !dbg !3557
  %0 = load i32, i32* %value.addr, align 4, !dbg !3558
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3559
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3560
  ret i32 %call, !dbg !3561
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3562 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3565, metadata !DIExpression()), !dbg !3566
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3567, metadata !DIExpression()), !dbg !3568
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3569, metadata !DIExpression()), !dbg !3570
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3571, metadata !DIExpression()), !dbg !3572
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3573, metadata !DIExpression()), !dbg !3574
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3575, metadata !DIExpression()), !dbg !3576
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3577, metadata !DIExpression()), !dbg !3578
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3579, metadata !DIExpression()), !dbg !3580
  %0 = load i32, i32* %value.addr, align 4, !dbg !3581
  %cmp = icmp slt i32 %0, 0, !dbg !3583
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3584

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3585
  %conv = sext i16 %1 to i32, !dbg !3585
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3586
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3587

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3588
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3589
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3590

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3591
  %conv6 = sext i16 %3 to i32, !dbg !3591
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3592
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3593

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3594
  br label %if.end, !dbg !3596

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3597
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3599
  %cmp9 = icmp slt i32 %4, 0, !dbg !3601
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3602

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3603
  %sub = sub nsw i32 0, %5, !dbg !3605
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3606
  br label %if.end13, !dbg !3607

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3608
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3610
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3611
  %conv14 = sext i16 %7 to i32, !dbg !3611
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3613
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3614

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3615
  %conv18 = sext i16 %8 to i32, !dbg !3615
  %sub19 = sub nsw i32 0, %conv18, !dbg !3617
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3618
  br label %if.end22, !dbg !3619

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3620
  %conv21 = sext i16 %9 to i32, !dbg !3620
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3622
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3623
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3624
  %mul = mul i32 %10, %11, !dbg !3625
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3626
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3627
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3628
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3629
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3630
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3631
  %15 = load i32, i32* %count.addr, align 4, !dbg !3632
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3633
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3633
  %shr = lshr i32 %14, %15, !dbg !3633, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3634
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3635
  %17 = load i32, i32* %count.addr, align 4, !dbg !3636
  %sub23 = sub i32 32, %17, !dbg !3637
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3638
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3638
  %shl = shl i32 %16, %sub23, !dbg !3638, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3639
  %or = or i32 %18, %shl, !dbg !3639
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3639
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3640
  %20 = load i32, i32* %count.addr, align 4, !dbg !3642
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3643
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3643
  %shr24 = lshr i32 %19, %20, !dbg !3643, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3644
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3645

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3646
  %conv28 = zext i8 %21 to i32, !dbg !3646
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3649
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3650

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3651
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3654
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3655

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3656
  store i32 %23, i32* %retval, align 4, !dbg !3657
  br label %return, !dbg !3657

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3658
  br label %return, !dbg !3658

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3659
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3662
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3663

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3664
  %sub40 = sub i32 0, %25, !dbg !3665
  store i32 %sub40, i32* %retval, align 4, !dbg !3666
  br label %return, !dbg !3666

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3667
  br label %return, !dbg !3667

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3668
  br label %return, !dbg !3668

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3670
  ret i32 %26, !dbg !3670
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3671 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3672, metadata !DIExpression()), !dbg !3673
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3674, metadata !DIExpression()), !dbg !3675
  %0 = load i32, i32* %value.addr, align 4, !dbg !3676
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3677
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3678
  ret i32 %call, !dbg !3679
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3680 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3683, metadata !DIExpression()), !dbg !3684
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3685, metadata !DIExpression()), !dbg !3686
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3687, metadata !DIExpression()), !dbg !3688
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3689, metadata !DIExpression()), !dbg !3690
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3691, metadata !DIExpression()), !dbg !3692
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3693, metadata !DIExpression()), !dbg !3694
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3695, metadata !DIExpression()), !dbg !3696
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3697, metadata !DIExpression()), !dbg !3698
  %0 = load i32, i32* %value.addr, align 4, !dbg !3699
  %cmp = icmp slt i32 %0, 0, !dbg !3701
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3702

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3703
  %conv = sext i8 %1 to i32, !dbg !3703
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3704
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3705

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3706
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3707
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3708

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3709
  %conv6 = sext i8 %3 to i32, !dbg !3709
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3710
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3711

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3712
  br label %if.end, !dbg !3714

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3715
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3717
  %cmp9 = icmp slt i32 %4, 0, !dbg !3719
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3720

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3721
  %sub = sub nsw i32 0, %5, !dbg !3723
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3724
  br label %if.end13, !dbg !3725

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3726
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3728
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3729
  %conv14 = sext i8 %7 to i32, !dbg !3729
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3731
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3732

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3733
  %conv18 = sext i8 %8 to i32, !dbg !3733
  %sub19 = sub nsw i32 0, %conv18, !dbg !3735
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3736
  br label %if.end22, !dbg !3737

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3738
  %conv21 = sext i8 %9 to i32, !dbg !3738
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3740
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3741
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3742
  %mul = mul i32 %10, %11, !dbg !3743
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3744
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3745
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3746
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3747
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3748
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3749
  %15 = load i32, i32* %count.addr, align 4, !dbg !3750
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3751
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3751
  %shr = lshr i32 %14, %15, !dbg !3751, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3752
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3753
  %17 = load i32, i32* %count.addr, align 4, !dbg !3754
  %sub23 = sub i32 32, %17, !dbg !3755
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3756
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3756
  %shl = shl i32 %16, %sub23, !dbg !3756, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3757
  %or = or i32 %18, %shl, !dbg !3757
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3757
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3758
  %20 = load i32, i32* %count.addr, align 4, !dbg !3760
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3761
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3761
  %shr24 = lshr i32 %19, %20, !dbg !3761, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3762
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3763

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3764
  %conv28 = zext i8 %21 to i32, !dbg !3764
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3767
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3768

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3769
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3772
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3773

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3774
  store i32 %23, i32* %retval, align 4, !dbg !3775
  br label %return, !dbg !3775

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3776
  br label %return, !dbg !3776

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3777
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3780
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3781

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3782
  %sub40 = sub i32 0, %25, !dbg !3783
  store i32 %sub40, i32* %retval, align 4, !dbg !3784
  br label %return, !dbg !3784

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3785
  br label %return, !dbg !3785

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3786
  br label %return, !dbg !3786

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3788
  ret i32 %26, !dbg !3788
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3789 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3790, metadata !DIExpression()), !dbg !3791
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3792, metadata !DIExpression()), !dbg !3793
  %0 = load i32, i32* %value.addr, align 4, !dbg !3794
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3795
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3796
  ret i32 %call, !dbg !3797
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3798 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3801, metadata !DIExpression()), !dbg !3802
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3803, metadata !DIExpression()), !dbg !3804
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3805, metadata !DIExpression()), !dbg !3806
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3807, metadata !DIExpression()), !dbg !3808
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3809, metadata !DIExpression()), !dbg !3810
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3811, metadata !DIExpression()), !dbg !3812
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3813, metadata !DIExpression()), !dbg !3814
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3815, metadata !DIExpression()), !dbg !3816
  %0 = load i32, i32* %value.addr, align 4, !dbg !3817
  %cmp = icmp slt i32 %0, 0, !dbg !3819
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3820

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3821
  %conv = zext i16 %1 to i32, !dbg !3821
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3822
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3823

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3824
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3825
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3826

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3827
  %conv6 = zext i16 %3 to i32, !dbg !3827
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3828
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3829

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3830
  br label %if.end, !dbg !3832

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3833
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3835
  %cmp9 = icmp slt i32 %4, 0, !dbg !3837
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3838

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3839
  %sub = sub nsw i32 0, %5, !dbg !3841
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3842
  br label %if.end13, !dbg !3843

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3844
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3846
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3847
  %conv14 = zext i16 %7 to i32, !dbg !3847
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3849
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3850

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3851
  %conv18 = zext i16 %8 to i32, !dbg !3851
  %sub19 = sub nsw i32 0, %conv18, !dbg !3853
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3854
  br label %if.end22, !dbg !3855

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3856
  %conv21 = zext i16 %9 to i32, !dbg !3856
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3858
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3859
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3860
  %mul = mul i32 %10, %11, !dbg !3861
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3862
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3863
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3864
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3865
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3866
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3867
  %15 = load i32, i32* %count.addr, align 4, !dbg !3868
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3869
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3869
  %shr = lshr i32 %14, %15, !dbg !3869, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3870
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3871
  %17 = load i32, i32* %count.addr, align 4, !dbg !3872
  %sub23 = sub i32 32, %17, !dbg !3873
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3874
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3874
  %shl = shl i32 %16, %sub23, !dbg !3874, !klee.check.shift !261
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3875
  %or = or i32 %18, %shl, !dbg !3875
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3875
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3876
  %20 = load i32, i32* %count.addr, align 4, !dbg !3878
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3879
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3879
  %shr24 = lshr i32 %19, %20, !dbg !3879, !klee.check.shift !261
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3880
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3881

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3882
  %conv28 = zext i8 %21 to i32, !dbg !3882
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3885
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3886

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3887
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3890
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3891

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3892
  store i32 %23, i32* %retval, align 4, !dbg !3893
  br label %return, !dbg !3893

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3894
  br label %return, !dbg !3894

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3895
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3898
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3899

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3900
  %sub40 = sub i32 0, %25, !dbg !3901
  store i32 %sub40, i32* %retval, align 4, !dbg !3902
  br label %return, !dbg !3902

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3903
  br label %return, !dbg !3903

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3904
  br label %return, !dbg !3904

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3906
  ret i32 %26, !dbg !3906
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3907 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3908, metadata !DIExpression()), !dbg !3909
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3910, metadata !DIExpression()), !dbg !3911
  %0 = load i32, i32* %value.addr, align 4, !dbg !3912
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3913
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3914
  ret i32 %call, !dbg !3915
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3916 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3919, metadata !DIExpression()), !dbg !3920
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3921, metadata !DIExpression()), !dbg !3922
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3923, metadata !DIExpression()), !dbg !3924
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3925, metadata !DIExpression()), !dbg !3926
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3927, metadata !DIExpression()), !dbg !3928
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3929, metadata !DIExpression()), !dbg !3930
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3931, metadata !DIExpression()), !dbg !3932
  %0 = load i32, i32* %value.addr, align 4, !dbg !3933
  %cmp = icmp slt i32 %0, 0, !dbg !3935
  br i1 %cmp, label %if.then, label %if.else, !dbg !3936

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3937
  %1 = load i32, i32* %value.addr, align 4, !dbg !3939
  %sub = sub nsw i32 0, %1, !dbg !3940
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3941
  br label %if.end, !dbg !3942

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3943
  %2 = load i32, i32* %value.addr, align 4, !dbg !3945
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3946
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3947
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3948
  %conv = zext i8 %4 to i32, !dbg !3948
  %mul = mul i32 %3, %conv, !dbg !3949
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3950
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3951
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3952
  %conv1 = zext i8 %6 to i32, !dbg !3952
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3953
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3954
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3955
  %8 = load i32, i32* %count.addr, align 4, !dbg !3956
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3957
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3957
  %shr = lshr i32 %7, %8, !dbg !3957, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3958
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3959
  %10 = load i32, i32* %count.addr, align 4, !dbg !3960
  %sub2 = sub i32 32, %10, !dbg !3961
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3962
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3962
  %shl = shl i32 %9, %sub2, !dbg !3962, !klee.check.shift !261
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3963
  %or = or i32 %11, %shl, !dbg !3963
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3963
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3964
  %13 = load i32, i32* %count.addr, align 4, !dbg !3966
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3967
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3967
  %shr3 = lshr i32 %12, %13, !dbg !3967, !klee.check.shift !261
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3968
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3969

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3970
  %conv7 = zext i8 %14 to i32, !dbg !3970
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3973
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3974

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3975
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3978
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3979

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3980
  store i32 %16, i32* %retval, align 4, !dbg !3981
  br label %return, !dbg !3981

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3982
  br label %return, !dbg !3982

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3983
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3986
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3987

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3988
  %sub19 = sub i32 0, %18, !dbg !3990
  store i32 %sub19, i32* %retval, align 4, !dbg !3991
  br label %return, !dbg !3991

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3992
  br label %return, !dbg !3992

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3994
  %conv22 = zext i8 %19 to i32, !dbg !3994
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3997
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3998

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3999
  br label %return, !dbg !3999

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !4001
  br label %return, !dbg !4001

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !4003
  ret i32 %20, !dbg !4003
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !4004 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4005, metadata !DIExpression()), !dbg !4006
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4007, metadata !DIExpression()), !dbg !4008
  %0 = load i8, i8* %value.addr, align 1, !dbg !4009
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4010
  %conv = zext i8 %1 to i16, !dbg !4011
  %conv1 = zext i16 %conv to i32, !dbg !4011
  %shl = shl i32 %conv1, 5, !dbg !4012
  %conv2 = trunc i32 %shl to i16, !dbg !4013
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4014
  ret i8 %call, !dbg !4015
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4016 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4017, metadata !DIExpression()), !dbg !4018
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4019, metadata !DIExpression()), !dbg !4020
  %0 = load i8, i8* %value.addr, align 1, !dbg !4021
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4022
  %conv = zext i8 %1 to i16, !dbg !4023
  %conv1 = zext i16 %conv to i32, !dbg !4023
  %shl = shl i32 %conv1, 6, !dbg !4024
  %conv2 = trunc i32 %shl to i16, !dbg !4025
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4026
  ret i8 %call, !dbg !4027
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4028 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4029, metadata !DIExpression()), !dbg !4030
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4031, metadata !DIExpression()), !dbg !4032
  %0 = load i8, i8* %value.addr, align 1, !dbg !4033
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4034
  %conv = zext i8 %1 to i16, !dbg !4035
  %conv1 = zext i16 %conv to i32, !dbg !4035
  %shl = shl i32 %conv1, 7, !dbg !4036
  %conv2 = trunc i32 %shl to i16, !dbg !4037
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4038
  ret i8 %call, !dbg !4039
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4040 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4041, metadata !DIExpression()), !dbg !4042
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4043, metadata !DIExpression()), !dbg !4044
  %0 = load i8, i8* %value.addr, align 1, !dbg !4045
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4046
  %conv = zext i8 %1 to i16, !dbg !4047
  %conv1 = zext i16 %conv to i32, !dbg !4047
  %shl = shl i32 %conv1, 7, !dbg !4048
  %conv2 = trunc i32 %shl to i16, !dbg !4049
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4050
  ret i8 %call, !dbg !4051
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4052 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4053, metadata !DIExpression()), !dbg !4054
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4055, metadata !DIExpression()), !dbg !4056
  %0 = load i8, i8* %value.addr, align 1, !dbg !4057
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4058
  %conv = zext i8 %1 to i16, !dbg !4059
  %conv1 = zext i16 %conv to i32, !dbg !4059
  %shl = shl i32 %conv1, 4, !dbg !4060
  %conv2 = trunc i32 %shl to i16, !dbg !4061
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4062
  ret i8 %call, !dbg !4063
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4064 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4065, metadata !DIExpression()), !dbg !4066
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4067, metadata !DIExpression()), !dbg !4068
  %0 = load i8, i8* %value.addr, align 1, !dbg !4069
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4070
  %conv = zext i8 %1 to i16, !dbg !4071
  %conv1 = zext i16 %conv to i32, !dbg !4071
  %shl = shl i32 %conv1, 5, !dbg !4072
  %conv2 = trunc i32 %shl to i16, !dbg !4073
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4074
  ret i8 %call, !dbg !4075
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4076 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4077, metadata !DIExpression()), !dbg !4078
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4079, metadata !DIExpression()), !dbg !4080
  %0 = load i8, i8* %value.addr, align 1, !dbg !4081
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4082
  %conv = zext i8 %1 to i16, !dbg !4083
  %conv1 = zext i16 %conv to i32, !dbg !4083
  %shl = shl i32 %conv1, 2, !dbg !4084
  %conv2 = trunc i32 %shl to i16, !dbg !4085
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4086
  ret i8 %call, !dbg !4087
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4088 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4089, metadata !DIExpression()), !dbg !4090
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4091, metadata !DIExpression()), !dbg !4092
  %0 = load i8, i8* %value.addr, align 1, !dbg !4093
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4094
  %conv = zext i8 %1 to i16, !dbg !4095
  %conv1 = zext i16 %conv to i32, !dbg !4095
  %shl = shl i32 %conv1, 6, !dbg !4096
  %conv2 = trunc i32 %shl to i16, !dbg !4097
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4098
  ret i8 %call, !dbg !4099
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4100 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4101, metadata !DIExpression()), !dbg !4102
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4103, metadata !DIExpression()), !dbg !4104
  %0 = load i8, i8* %value.addr, align 1, !dbg !4105
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4106
  %conv = zext i8 %1 to i16, !dbg !4107
  %conv1 = zext i16 %conv to i32, !dbg !4107
  %shl = shl i32 %conv1, 3, !dbg !4108
  %conv2 = trunc i32 %shl to i16, !dbg !4109
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4110
  ret i8 %call, !dbg !4111
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4112 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4113, metadata !DIExpression()), !dbg !4114
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4115, metadata !DIExpression()), !dbg !4116
  %0 = load i16, i16* %value.addr, align 2, !dbg !4117
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4118
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4119
  ret i16 %call, !dbg !4120
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4121 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4124, metadata !DIExpression()), !dbg !4125
  %0 = load i16, i16* %value.addr, align 2, !dbg !4126
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4127
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4128
  ret i16 %call, !dbg !4129
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4130 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4131, metadata !DIExpression()), !dbg !4132
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4133, metadata !DIExpression()), !dbg !4134
  %0 = load i16, i16* %value.addr, align 2, !dbg !4135
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4136
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4137
  ret i16 %call, !dbg !4138
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4139 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4140, metadata !DIExpression()), !dbg !4141
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4142, metadata !DIExpression()), !dbg !4143
  %0 = load i16, i16* %value.addr, align 2, !dbg !4144
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4145
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4146
  ret i16 %call, !dbg !4147
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4148 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4149, metadata !DIExpression()), !dbg !4150
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4151, metadata !DIExpression()), !dbg !4152
  %0 = load i16, i16* %value.addr, align 2, !dbg !4153
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4154
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4155
  ret i16 %call, !dbg !4156
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4157 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4158, metadata !DIExpression()), !dbg !4159
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4160, metadata !DIExpression()), !dbg !4161
  %0 = load i16, i16* %value.addr, align 2, !dbg !4162
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4163
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4164
  ret i16 %call, !dbg !4165
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4166 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4167, metadata !DIExpression()), !dbg !4168
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4169, metadata !DIExpression()), !dbg !4170
  %0 = load i16, i16* %value.addr, align 2, !dbg !4171
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4172
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4173
  ret i16 %call, !dbg !4174
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4175 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4176, metadata !DIExpression()), !dbg !4177
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4178, metadata !DIExpression()), !dbg !4179
  %0 = load i16, i16* %value.addr, align 2, !dbg !4180
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4181
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4182
  ret i16 %call, !dbg !4183
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4184 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4185, metadata !DIExpression()), !dbg !4186
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4187, metadata !DIExpression()), !dbg !4188
  %0 = load i16, i16* %value.addr, align 2, !dbg !4189
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4190
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4191
  ret i16 %call, !dbg !4192
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4193 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4194, metadata !DIExpression()), !dbg !4195
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4196, metadata !DIExpression()), !dbg !4197
  %0 = load i16, i16* %value.addr, align 2, !dbg !4198
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4199
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4200
  ret i16 %call, !dbg !4201
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4202 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4203, metadata !DIExpression()), !dbg !4204
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4205, metadata !DIExpression()), !dbg !4206
  %0 = load i16, i16* %value.addr, align 2, !dbg !4207
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4208
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4209
  ret i16 %call, !dbg !4210
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4211 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4212, metadata !DIExpression()), !dbg !4213
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4214, metadata !DIExpression()), !dbg !4215
  %0 = load i16, i16* %value.addr, align 2, !dbg !4216
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4217
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4218
  ret i16 %call, !dbg !4219
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4220 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4221, metadata !DIExpression()), !dbg !4222
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4223, metadata !DIExpression()), !dbg !4224
  %0 = load i16, i16* %value.addr, align 2, !dbg !4225
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4226
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4227
  ret i16 %call, !dbg !4228
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4229 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4230, metadata !DIExpression()), !dbg !4231
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4232, metadata !DIExpression()), !dbg !4233
  %0 = load i16, i16* %value.addr, align 2, !dbg !4234
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4235
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4236
  ret i16 %call, !dbg !4237
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4238 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4239, metadata !DIExpression()), !dbg !4240
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4241, metadata !DIExpression()), !dbg !4242
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4243
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4244
  %conv = zext i8 %1 to i16, !dbg !4245
  %conv1 = zext i16 %conv to i32, !dbg !4245
  %shl = shl i32 %conv1, 5, !dbg !4246
  %conv2 = trunc i32 %shl to i16, !dbg !4247
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4248
  ret i16 %call, !dbg !4249
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4250 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4251, metadata !DIExpression()), !dbg !4252
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4253, metadata !DIExpression()), !dbg !4254
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4255
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4256
  %conv = zext i8 %1 to i16, !dbg !4257
  %conv1 = zext i16 %conv to i32, !dbg !4257
  %shl = shl i32 %conv1, 6, !dbg !4258
  %conv2 = trunc i32 %shl to i16, !dbg !4259
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4260
  ret i16 %call, !dbg !4261
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4262 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4263, metadata !DIExpression()), !dbg !4264
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4265, metadata !DIExpression()), !dbg !4266
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4267
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4268
  %conv = zext i8 %1 to i16, !dbg !4269
  %conv1 = zext i16 %conv to i32, !dbg !4269
  %shl = shl i32 %conv1, 7, !dbg !4270
  %conv2 = trunc i32 %shl to i16, !dbg !4271
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4272
  ret i16 %call, !dbg !4273
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4274 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4275, metadata !DIExpression()), !dbg !4276
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4277, metadata !DIExpression()), !dbg !4278
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4279
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4280
  %conv = zext i8 %1 to i16, !dbg !4281
  %conv1 = zext i16 %conv to i32, !dbg !4281
  %shl = shl i32 %conv1, 7, !dbg !4282
  %conv2 = trunc i32 %shl to i16, !dbg !4283
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4284
  ret i16 %call, !dbg !4285
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4286 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4287, metadata !DIExpression()), !dbg !4288
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4289, metadata !DIExpression()), !dbg !4290
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4291
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4292
  %conv = zext i8 %1 to i16, !dbg !4293
  %conv1 = zext i16 %conv to i32, !dbg !4293
  %shl = shl i32 %conv1, 4, !dbg !4294
  %conv2 = trunc i32 %shl to i16, !dbg !4295
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4296
  ret i16 %call, !dbg !4297
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4298 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4299, metadata !DIExpression()), !dbg !4300
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4301, metadata !DIExpression()), !dbg !4302
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4303
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4304
  %conv = zext i8 %1 to i16, !dbg !4305
  %conv1 = zext i16 %conv to i32, !dbg !4305
  %shl = shl i32 %conv1, 5, !dbg !4306
  %conv2 = trunc i32 %shl to i16, !dbg !4307
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4308
  ret i16 %call, !dbg !4309
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4310 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4311, metadata !DIExpression()), !dbg !4312
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4313, metadata !DIExpression()), !dbg !4314
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4315
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4316
  %conv = zext i8 %1 to i16, !dbg !4317
  %conv1 = zext i16 %conv to i32, !dbg !4317
  %shl = shl i32 %conv1, 2, !dbg !4318
  %conv2 = trunc i32 %shl to i16, !dbg !4319
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4320
  ret i16 %call, !dbg !4321
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4322 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4323, metadata !DIExpression()), !dbg !4324
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4325, metadata !DIExpression()), !dbg !4326
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4327
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4328
  %conv = zext i8 %1 to i16, !dbg !4329
  %conv1 = zext i16 %conv to i32, !dbg !4329
  %shl = shl i32 %conv1, 6, !dbg !4330
  %conv2 = trunc i32 %shl to i16, !dbg !4331
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4332
  ret i16 %call, !dbg !4333
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4334 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4335, metadata !DIExpression()), !dbg !4336
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4337, metadata !DIExpression()), !dbg !4338
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4339
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4340
  %conv = zext i8 %1 to i16, !dbg !4341
  %conv1 = zext i16 %conv to i32, !dbg !4341
  %shl = shl i32 %conv1, 3, !dbg !4342
  %conv2 = trunc i32 %shl to i16, !dbg !4343
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4344
  ret i16 %call, !dbg !4345
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4346 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4347, metadata !DIExpression()), !dbg !4348
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4349, metadata !DIExpression()), !dbg !4350
  %0 = load i32, i32* %value.addr, align 4, !dbg !4351
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4352
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4353
  ret i32 %call, !dbg !4354
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4355 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4358, metadata !DIExpression()), !dbg !4359
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4360, metadata !DIExpression()), !dbg !4361
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4362, metadata !DIExpression()), !dbg !4363
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4364, metadata !DIExpression()), !dbg !4365
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4366, metadata !DIExpression()), !dbg !4367
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4368, metadata !DIExpression()), !dbg !4369
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4370, metadata !DIExpression()), !dbg !4371
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4372
  %conv = sext i16 %0 to i32, !dbg !4372
  %cmp = icmp slt i32 %conv, 0, !dbg !4374
  br i1 %cmp, label %if.then, label %if.else, !dbg !4375

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4376
  br label %if.end, !dbg !4378

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4379
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4381
  %conv2 = sext i16 %1 to i32, !dbg !4381
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4383
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4384

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4385
  %conv6 = sext i16 %2 to i32, !dbg !4385
  %sub = sub nsw i32 0, %conv6, !dbg !4387
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4388
  br label %if.end9, !dbg !4389

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4390
  %conv8 = sext i16 %3 to i32, !dbg !4390
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4392
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4393
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4394
  %mul = mul i32 %4, %5, !dbg !4395
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4396
  %6 = load i32, i32* %value.addr, align 4, !dbg !4397
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4398
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4399
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4400
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4401
  %9 = load i32, i32* %count.addr, align 4, !dbg !4402
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4403
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4403
  %shr = lshr i32 %8, %9, !dbg !4403, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4404
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4405
  %11 = load i32, i32* %count.addr, align 4, !dbg !4406
  %sub10 = sub i32 32, %11, !dbg !4407
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4408
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4408
  %shl = shl i32 %10, %sub10, !dbg !4408, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4409
  %or = or i32 %12, %shl, !dbg !4409
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4409
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4410
  %14 = load i32, i32* %count.addr, align 4, !dbg !4412
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4413
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4413
  %shr11 = lshr i32 %13, %14, !dbg !4413, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4414
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4415

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4416
  %conv15 = zext i8 %15 to i32, !dbg !4416
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4419
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4420

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4421
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4424
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4425

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4426
  store i32 %17, i32* %retval, align 4, !dbg !4427
  br label %return, !dbg !4427

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4428
  br label %return, !dbg !4428

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4429
  br label %return, !dbg !4429

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4431
  br label %return, !dbg !4431

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4433
  ret i32 %18, !dbg !4433
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4434 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4435, metadata !DIExpression()), !dbg !4436
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4437, metadata !DIExpression()), !dbg !4438
  %0 = load i32, i32* %value.addr, align 4, !dbg !4439
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4440
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4441
  ret i32 %call, !dbg !4442
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4443 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4446, metadata !DIExpression()), !dbg !4447
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4448, metadata !DIExpression()), !dbg !4449
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4450, metadata !DIExpression()), !dbg !4451
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4452, metadata !DIExpression()), !dbg !4453
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4454, metadata !DIExpression()), !dbg !4455
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4456, metadata !DIExpression()), !dbg !4457
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4458
  %cmp = icmp slt i32 %0, 0, !dbg !4460
  br i1 %cmp, label %if.then, label %if.else, !dbg !4461

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4462
  br label %if.end, !dbg !4464

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4465
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4467
  %cmp1 = icmp slt i32 %1, 0, !dbg !4469
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4470

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4471
  %sub = sub nsw i32 0, %2, !dbg !4473
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4474
  br label %if.end4, !dbg !4475

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4476
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4478
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4479
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4480
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4481
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4482
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4483
  %7 = load i32, i32* %count.addr, align 4, !dbg !4484
  %sub5 = sub i32 %7, 32, !dbg !4485
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4486
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4486
  %shr = lshr i32 %6, %sub5, !dbg !4486, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4487
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4488
  %conv = zext i8 %8 to i32, !dbg !4488
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4490
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4491

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4492
  store i32 %9, i32* %retval, align 4, !dbg !4494
  br label %return, !dbg !4494

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4495
  br label %return, !dbg !4495

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4497
  ret i32 %10, !dbg !4497
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4498 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4499, metadata !DIExpression()), !dbg !4500
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4501, metadata !DIExpression()), !dbg !4502
  %0 = load i32, i32* %value.addr, align 4, !dbg !4503
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4504
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4505
  ret i32 %call, !dbg !4506
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4507 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4510, metadata !DIExpression()), !dbg !4511
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4512, metadata !DIExpression()), !dbg !4513
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4514, metadata !DIExpression()), !dbg !4515
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4516, metadata !DIExpression()), !dbg !4517
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4518, metadata !DIExpression()), !dbg !4519
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4520, metadata !DIExpression()), !dbg !4521
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4522, metadata !DIExpression()), !dbg !4523
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4524
  %conv = sext i8 %0 to i32, !dbg !4524
  %cmp = icmp slt i32 %conv, 0, !dbg !4526
  br i1 %cmp, label %if.then, label %if.else, !dbg !4527

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4528
  br label %if.end, !dbg !4530

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4531
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4533
  %conv2 = sext i8 %1 to i32, !dbg !4533
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4535
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4536

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4537
  %conv6 = sext i8 %2 to i32, !dbg !4537
  %sub = sub nsw i32 0, %conv6, !dbg !4539
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4540
  br label %if.end9, !dbg !4541

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4542
  %conv8 = sext i8 %3 to i32, !dbg !4542
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4544
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4545
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4546
  %mul = mul i32 %4, %5, !dbg !4547
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4548
  %6 = load i32, i32* %value.addr, align 4, !dbg !4549
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4550
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4551
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4552
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4553
  %9 = load i32, i32* %count.addr, align 4, !dbg !4554
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4555
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4555
  %shr = lshr i32 %8, %9, !dbg !4555, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4556
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4557
  %11 = load i32, i32* %count.addr, align 4, !dbg !4558
  %sub10 = sub i32 32, %11, !dbg !4559
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4560
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4560
  %shl = shl i32 %10, %sub10, !dbg !4560, !klee.check.shift !261
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4561
  %or = or i32 %12, %shl, !dbg !4561
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4561
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4562
  %14 = load i32, i32* %count.addr, align 4, !dbg !4564
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4565
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4565
  %shr11 = lshr i32 %13, %14, !dbg !4565, !klee.check.shift !261
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4566
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4567

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4568
  %conv15 = zext i8 %15 to i32, !dbg !4568
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4571
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4572

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4573
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4576
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4577

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4578
  store i32 %17, i32* %retval, align 4, !dbg !4579
  br label %return, !dbg !4579

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4580
  br label %return, !dbg !4580

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4581
  br label %return, !dbg !4581

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4583
  br label %return, !dbg !4583

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4585
  ret i32 %18, !dbg !4585
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4586 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4587, metadata !DIExpression()), !dbg !4588
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4589, metadata !DIExpression()), !dbg !4590
  %0 = load i32, i32* %value.addr, align 4, !dbg !4591
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4592
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4593
  ret i32 %call, !dbg !4594
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4595 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4596, metadata !DIExpression()), !dbg !4597
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4598, metadata !DIExpression()), !dbg !4599
  %0 = load i32, i32* %value.addr, align 4, !dbg !4600
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4601
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4602
  ret i32 %call, !dbg !4603
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4604 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4607, metadata !DIExpression()), !dbg !4608
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4609, metadata !DIExpression()), !dbg !4610
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4611, metadata !DIExpression()), !dbg !4612
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4613, metadata !DIExpression()), !dbg !4614
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4615, metadata !DIExpression()), !dbg !4616
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4617, metadata !DIExpression()), !dbg !4618
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4619, metadata !DIExpression()), !dbg !4620
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4621, metadata !DIExpression()), !dbg !4622
  %0 = load i32, i32* %value.addr, align 4, !dbg !4623
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4624
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4625
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4626
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4627
  %3 = load i32, i32* %count.addr, align 4, !dbg !4628
  %sub = sub i32 %3, 32, !dbg !4629
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4630
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4630
  %shr = lshr i32 %2, %sub, !dbg !4630, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4631
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4632
  ret i32 %4, !dbg !4633
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4634 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4635, metadata !DIExpression()), !dbg !4636
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4637, metadata !DIExpression()), !dbg !4638
  %0 = load i32, i32* %value.addr, align 4, !dbg !4639
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4640
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4641
  ret i32 %call, !dbg !4642
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4643 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4646, metadata !DIExpression()), !dbg !4647
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4648, metadata !DIExpression()), !dbg !4649
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4650, metadata !DIExpression()), !dbg !4651
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4652, metadata !DIExpression()), !dbg !4653
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4654, metadata !DIExpression()), !dbg !4655
  %0 = load i32, i32* %value.addr, align 4, !dbg !4656
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4657
  %conv = zext i8 %1 to i32, !dbg !4657
  %mul = mul i32 %0, %conv, !dbg !4658
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4659
  %2 = load i32, i32* %value.addr, align 4, !dbg !4660
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4661
  %conv1 = zext i8 %3 to i32, !dbg !4661
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4662
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4663
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4664
  %5 = load i32, i32* %count.addr, align 4, !dbg !4665
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4666
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4666
  %shr = lshr i32 %4, %5, !dbg !4666, !klee.check.shift !261
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4667
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4668
  %7 = load i32, i32* %count.addr, align 4, !dbg !4669
  %sub = sub i32 32, %7, !dbg !4670
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4671
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4671
  %shl = shl i32 %6, %sub, !dbg !4671, !klee.check.shift !261
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4672
  %or = or i32 %8, %shl, !dbg !4672
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4672
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4673
  %10 = load i32, i32* %count.addr, align 4, !dbg !4675
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4676
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4676
  %shr2 = lshr i32 %9, %10, !dbg !4676, !klee.check.shift !261
  %cmp = icmp eq i32 %shr2, 0, !dbg !4677
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4678

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4679
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4682
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4683

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4684
  store i32 %12, i32* %retval, align 4, !dbg !4685
  br label %return, !dbg !4685

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4686
  br label %return, !dbg !4686

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4687
  br label %return, !dbg !4687

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4689
  ret i32 %13, !dbg !4689
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4690 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4691, metadata !DIExpression()), !dbg !4692
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4693, metadata !DIExpression()), !dbg !4694
  %0 = load i8, i8* %value.addr, align 1, !dbg !4695
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4696
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4697
  ret i8 %call, !dbg !4698
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4699 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4702, metadata !DIExpression()), !dbg !4703
  %0 = load i8, i8* %value.addr, align 1, !dbg !4704
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4705
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4706
  ret i8 %call, !dbg !4707
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4708 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4711, metadata !DIExpression()), !dbg !4712
  %0 = load i8, i8* %value.addr, align 1, !dbg !4713
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4714
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4715
  ret i8 %call, !dbg !4716
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4717 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4718, metadata !DIExpression()), !dbg !4719
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4720, metadata !DIExpression()), !dbg !4721
  %0 = load i8, i8* %value.addr, align 1, !dbg !4722
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4723
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4724
  ret i8 %call, !dbg !4725
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4726 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4727, metadata !DIExpression()), !dbg !4728
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4729, metadata !DIExpression()), !dbg !4730
  %0 = load i8, i8* %value.addr, align 1, !dbg !4731
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4732
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4733
  ret i8 %call, !dbg !4734
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4735 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4736, metadata !DIExpression()), !dbg !4737
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4738, metadata !DIExpression()), !dbg !4739
  %0 = load i8, i8* %value.addr, align 1, !dbg !4740
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4741
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4742
  ret i8 %call, !dbg !4743
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4744 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4745, metadata !DIExpression()), !dbg !4746
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4747, metadata !DIExpression()), !dbg !4748
  %0 = load i8, i8* %value.addr, align 1, !dbg !4749
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4750
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4751
  ret i8 %call, !dbg !4752
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4753 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4754, metadata !DIExpression()), !dbg !4755
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4756, metadata !DIExpression()), !dbg !4757
  %0 = load i8, i8* %value.addr, align 1, !dbg !4758
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4759
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4760
  ret i8 %call, !dbg !4761
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4762 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4763, metadata !DIExpression()), !dbg !4764
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4765, metadata !DIExpression()), !dbg !4766
  %0 = load i8, i8* %value.addr, align 1, !dbg !4767
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4768
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4769
  ret i8 %call, !dbg !4770
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4771 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4773, metadata !DIExpression()), !dbg !4774
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4775, metadata !DIExpression()), !dbg !4776
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4777, metadata !DIExpression()), !dbg !4778
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4779, metadata !DIExpression()), !dbg !4780
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4781, metadata !DIExpression()), !dbg !4782
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4783, metadata !DIExpression()), !dbg !4784
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4785, metadata !DIExpression()), !dbg !4786
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4787, metadata !DIExpression()), !dbg !4788
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4789, metadata !DIExpression()), !dbg !4790
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4791, metadata !DIExpression()), !dbg !4792
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4793, metadata !DIExpression()), !dbg !4794
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4795, metadata !DIExpression()), !dbg !4796
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4797
  %and = and i32 %0, 65535, !dbg !4798
  %conv = trunc i32 %and to i16, !dbg !4797
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4799
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4800
  %and1 = and i32 %1, -65536, !dbg !4801
  %shr = lshr i32 %and1, 16, !dbg !4802
  %conv2 = trunc i32 %shr to i16, !dbg !4803
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4804
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4805
  %and3 = and i32 %2, 65535, !dbg !4806
  %conv4 = trunc i32 %and3 to i16, !dbg !4805
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4807
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4808
  %and5 = and i32 %3, -65536, !dbg !4809
  %shr6 = lshr i32 %and5, 16, !dbg !4810
  %conv7 = trunc i32 %shr6 to i16, !dbg !4811
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4812
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4813
  %conv8 = zext i16 %4 to i32, !dbg !4815
  %conv9 = sext i32 %conv8 to i64, !dbg !4816
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4817
  %conv10 = zext i16 %5 to i32, !dbg !4818
  %conv11 = sext i32 %conv10 to i64, !dbg !4819
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4820
  %tobool = icmp ne i32 %call, 0, !dbg !4820
  br i1 %tobool, label %if.end, label %if.then, !dbg !4821

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !4822
  br label %return, !dbg !4822

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4824
  %conv12 = zext i16 %6 to i32, !dbg !4824
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4825
  %conv13 = zext i16 %7 to i32, !dbg !4825
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4826
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4827
  %8 = load i16, i16* %arg1_LW, align 2, !dbg !4828
  %conv14 = zext i16 %8 to i32, !dbg !4828
  %9 = load i16, i16* %arg2_HW, align 2, !dbg !4829
  %conv15 = zext i16 %9 to i32, !dbg !4829
  %mul16 = mul nsw i32 %conv14, %conv15, !dbg !4830
  store i32 %mul16, i32* %MulTemp2, align 4, !dbg !4831
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4832
  %conv17 = zext i16 %10 to i32, !dbg !4832
  %11 = load i16, i16* %arg2_LW, align 2, !dbg !4833
  %conv18 = zext i16 %11 to i32, !dbg !4833
  %mul19 = mul nsw i32 %conv17, %conv18, !dbg !4834
  store i32 %mul19, i32* %MulTemp3, align 4, !dbg !4835
  %12 = load i16, i16* %arg1_HW, align 2, !dbg !4836
  %conv20 = zext i16 %12 to i32, !dbg !4836
  %13 = load i16, i16* %arg2_HW, align 2, !dbg !4837
  %conv21 = zext i16 %13 to i32, !dbg !4837
  %mul22 = mul nsw i32 %conv20, %conv21, !dbg !4838
  store i32 %mul22, i32* %MulTemp4, align 4, !dbg !4839
  %14 = load i32, i32* %MulTemp2, align 4, !dbg !4840
  %shr23 = lshr i32 %14, 16, !dbg !4841
  %15 = load i32, i32* %MulTemp3, align 4, !dbg !4842
  %shr24 = lshr i32 %15, 16, !dbg !4843
  %add = add i32 %shr23, %shr24, !dbg !4844
  %16 = load i32, i32* %MulTemp4, align 4, !dbg !4845
  %add25 = add i32 %add, %16, !dbg !4846
  store i32 %add25, i32* %HIGHWORD, align 4, !dbg !4847
  %17 = load i32, i32* %MulTemp1, align 4, !dbg !4848
  %shr26 = lshr i32 %17, 16, !dbg !4849
  %18 = load i32, i32* %MulTemp2, align 4, !dbg !4850
  %and27 = and i32 %18, 65535, !dbg !4851
  %add28 = add i32 %shr26, %and27, !dbg !4852
  %19 = load i32, i32* %MulTemp3, align 4, !dbg !4853
  %and29 = and i32 %19, 65535, !dbg !4854
  %add30 = add i32 %add28, %and29, !dbg !4855
  store i32 %add30, i32* %OverFlow, align 4, !dbg !4856
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4857
  %cmp = icmp ugt i32 %20, 65535, !dbg !4859
  br i1 %cmp, label %if.then32, label %if.else, !dbg !4860

if.then32:                                        ; preds = %if.end
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4861
  %22 = load i32, i32* %OverFlow, align 4, !dbg !4863
  %shr33 = lshr i32 %22, 16, !dbg !4864
  %add34 = add i32 %21, %shr33, !dbg !4865
  store i32 %add34, i32* %retval, align 4, !dbg !4866
  br label %return, !dbg !4866

if.else:                                          ; preds = %if.end
  %23 = load i32, i32* %HIGHWORD, align 4, !dbg !4867
  store i32 %23, i32* %retval, align 4, !dbg !4869
  br label %return, !dbg !4869

return:                                           ; preds = %if.else, %if.then32, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !4870
  ret i32 %24, !dbg !4870
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4871 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4874, metadata !DIExpression()), !dbg !4875
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4876, metadata !DIExpression()), !dbg !4877
  %0 = load i64, i64* %left.addr, align 8, !dbg !4878
  %1 = load i64, i64* %right.addr, align 8, !dbg !4879
  %mul = mul nsw i64 %0, %1, !dbg !4880
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4881
  %conv = zext i1 %cmp to i32, !dbg !4881
  ret i32 %conv, !dbg !4882
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4883 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4884, metadata !DIExpression()), !dbg !4885
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4886, metadata !DIExpression()), !dbg !4887
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4888, metadata !DIExpression()), !dbg !4889
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4890, metadata !DIExpression()), !dbg !4891
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4892, metadata !DIExpression()), !dbg !4893
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4894, metadata !DIExpression()), !dbg !4895
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4896, metadata !DIExpression()), !dbg !4897
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4898, metadata !DIExpression()), !dbg !4899
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4900, metadata !DIExpression()), !dbg !4901
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4902, metadata !DIExpression()), !dbg !4903
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4904, metadata !DIExpression()), !dbg !4905
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4906, metadata !DIExpression()), !dbg !4907
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4908
  %and = and i32 %0, 65535, !dbg !4909
  %conv = trunc i32 %and to i16, !dbg !4908
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4910
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4911
  %and1 = and i32 %1, -65536, !dbg !4912
  %shr = lshr i32 %and1, 16, !dbg !4913
  %conv2 = trunc i32 %shr to i16, !dbg !4914
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4915
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4916
  %and3 = and i32 %2, 65535, !dbg !4917
  %conv4 = trunc i32 %and3 to i16, !dbg !4916
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4918
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4919
  %and5 = and i32 %3, -65536, !dbg !4920
  %shr6 = lshr i32 %and5, 16, !dbg !4921
  %conv7 = trunc i32 %shr6 to i16, !dbg !4922
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4923
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4924
  %conv8 = zext i16 %4 to i32, !dbg !4924
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4925
  %conv9 = zext i16 %5 to i32, !dbg !4925
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4926
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4927
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4928
  %conv10 = zext i16 %6 to i32, !dbg !4928
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4929
  %conv11 = zext i16 %7 to i32, !dbg !4929
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4930
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4931
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4932
  %conv13 = zext i16 %8 to i32, !dbg !4932
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4933
  %conv14 = zext i16 %9 to i32, !dbg !4933
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4934
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4935
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4936
  %conv16 = zext i16 %10 to i32, !dbg !4936
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4937
  %conv17 = zext i16 %11 to i32, !dbg !4937
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4938
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4939
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4940
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4941
  %and19 = and i32 %13, 65535, !dbg !4942
  %shl = shl i32 %and19, 16, !dbg !4943
  %add = add i32 %12, %shl, !dbg !4944
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4945
  %and20 = and i32 %14, 65535, !dbg !4946
  %shl21 = shl i32 %and20, 16, !dbg !4947
  %add22 = add i32 %add, %shl21, !dbg !4948
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4949
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4950
  ret i32 %15, !dbg !4951
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4952 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4958, metadata !DIExpression()), !dbg !4959
  %2 = icmp eq i64 %0, 0, !dbg !4960
  br i1 %2, label %3, label %4, !dbg !4962

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4963
  unreachable, !dbg !4963

4:                                                ; preds = %1
  ret void, !dbg !4964
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4965 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4971, metadata !DIExpression()), !dbg !4973
  call void @llvm.dbg.value(metadata i64 %1, metadata !4972, metadata !DIExpression()), !dbg !4973
  %3 = icmp ult i64 %1, %0, !dbg !4974
  br i1 %3, label %5, label %4, !dbg !4976

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4977
  unreachable, !dbg !4977

5:                                                ; preds = %2
  ret void, !dbg !4979
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/mul_Ccode_alarm_0112.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !36, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112/MulHword_alarm_0112.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
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
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
!51 = !DISubroutineType(types: !52)
!52 = !{!37}
!53 = !DILocalVariable(name: "value", scope: !49, file: !50, line: 9, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !37)
!56 = !DILocation(line: 9, column: 13, scope: !49)
!57 = !DILocalVariable(name: "factor", scope: !49, file: !50, line: 10, type: !54)
!58 = !DILocation(line: 10, column: 13, scope: !49)
!59 = !DILocalVariable(name: "result", scope: !49, file: !50, line: 11, type: !54)
!60 = !DILocation(line: 11, column: 13, scope: !49)
!61 = !DILocation(line: 13, column: 24, scope: !49)
!62 = !DILocation(line: 13, column: 5, scope: !49)
!63 = !DILocation(line: 14, column: 24, scope: !49)
!64 = !DILocation(line: 14, column: 5, scope: !49)
!65 = !DILocation(line: 16, column: 35, scope: !49)
!66 = !DILocation(line: 16, column: 42, scope: !49)
!67 = !DILocation(line: 16, column: 14, scope: !49)
!68 = !DILocation(line: 16, column: 12, scope: !49)
!69 = !DILocation(line: 18, column: 11, scope: !49)
!70 = !DILocation(line: 19, column: 5, scope: !49)
!71 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !72, file: !72, line: 43, type: !73, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
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
!2279 = !DILocation(line: 2224, column: 44, scope: !2280)
!2280 = distinct !DILexicalBlock(scope: !2281, file: !72, line: 2224, column: 7)
!2281 = distinct !DILexicalBlock(scope: !2276, file: !72, line: 2222, column: 2)
!2282 = !DILocation(line: 2224, column: 34, scope: !2280)
!2283 = !DILocation(line: 2224, column: 9, scope: !2280)
!2284 = !DILocation(line: 2224, column: 7, scope: !2281)
!2285 = !DILocation(line: 2225, column: 7, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2280, file: !72, line: 2224, column: 54)
!2287 = !DILocation(line: 2227, column: 15, scope: !2281)
!2288 = !DILocation(line: 2227, column: 14, scope: !2281)
!2289 = !DILocation(line: 2227, column: 12, scope: !2281)
!2290 = !DILocation(line: 2228, column: 2, scope: !2281)
!2291 = !DILocation(line: 2231, column: 14, scope: !2292)
!2292 = distinct !DILexicalBlock(scope: !2276, file: !72, line: 2230, column: 2)
!2293 = !DILocation(line: 2231, column: 12, scope: !2292)
!2294 = !DILocation(line: 2234, column: 5, scope: !2295)
!2295 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2234, column: 5)
!2296 = !DILocation(line: 2234, column: 11, scope: !2295)
!2297 = !DILocation(line: 2234, column: 5, scope: !2248)
!2298 = !DILocation(line: 2237, column: 44, scope: !2299)
!2299 = distinct !DILexicalBlock(scope: !2300, file: !72, line: 2237, column: 7)
!2300 = distinct !DILexicalBlock(scope: !2295, file: !72, line: 2235, column: 2)
!2301 = !DILocation(line: 2237, column: 34, scope: !2299)
!2302 = !DILocation(line: 2237, column: 9, scope: !2299)
!2303 = !DILocation(line: 2237, column: 7, scope: !2300)
!2304 = !DILocation(line: 2238, column: 7, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2299, file: !72, line: 2237, column: 55)
!2306 = !DILocation(line: 2245, column: 36, scope: !2300)
!2307 = !DILocation(line: 2245, column: 35, scope: !2300)
!2308 = !DILocation(line: 2245, column: 25, scope: !2300)
!2309 = !DILocation(line: 2245, column: 23, scope: !2300)
!2310 = !DILocation(line: 2246, column: 3, scope: !2300)
!2311 = !DILocation(line: 2250, column: 14, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2295, file: !72, line: 2249, column: 2)
!2313 = !DILocation(line: 2250, column: 12, scope: !2312)
!2314 = !DILocation(line: 2253, column: 13, scope: !2248)
!2315 = !DILocation(line: 2253, column: 24, scope: !2248)
!2316 = !DILocation(line: 2253, column: 22, scope: !2248)
!2317 = !DILocation(line: 2253, column: 11, scope: !2248)
!2318 = !DILocation(line: 2254, column: 25, scope: !2248)
!2319 = !DILocation(line: 2254, column: 35, scope: !2248)
!2320 = !DILocation(line: 2254, column: 13, scope: !2248)
!2321 = !DILocation(line: 2254, column: 11, scope: !2248)
!2322 = !DILocation(line: 2255, column: 13, scope: !2248)
!2323 = !DILocation(line: 2255, column: 22, scope: !2248)
!2324 = !DILocation(line: 2255, column: 11, scope: !2248)
!2325 = !DILocation(line: 2256, column: 14, scope: !2248)
!2326 = !DILocation(line: 2256, column: 23, scope: !2248)
!2327 = !DILocation(line: 2256, column: 11, scope: !2248)
!2328 = !DILocation(line: 2257, column: 6, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2248, file: !72, line: 2257, column: 5)
!2330 = !DILocation(line: 2257, column: 14, scope: !2329)
!2331 = !DILocation(line: 2257, column: 19, scope: !2329)
!2332 = !DILocation(line: 2257, column: 5, scope: !2248)
!2333 = !DILocation(line: 2259, column: 6, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2335, file: !72, line: 2259, column: 6)
!2335 = distinct !DILexicalBlock(scope: !2329, file: !72, line: 2258, column: 2)
!2336 = !DILocation(line: 2259, column: 16, scope: !2334)
!2337 = !DILocation(line: 2259, column: 6, scope: !2335)
!2338 = !DILocation(line: 2261, column: 7, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2340, file: !72, line: 2261, column: 7)
!2340 = distinct !DILexicalBlock(scope: !2334, file: !72, line: 2260, column: 3)
!2341 = !DILocation(line: 2261, column: 15, scope: !2339)
!2342 = !DILocation(line: 2261, column: 7, scope: !2340)
!2343 = !DILocation(line: 2262, column: 12, scope: !2339)
!2344 = !DILocation(line: 2262, column: 5, scope: !2339)
!2345 = !DILocation(line: 2264, column: 5, scope: !2339)
!2346 = !DILocation(line: 2268, column: 7, scope: !2347)
!2347 = distinct !DILexicalBlock(scope: !2348, file: !72, line: 2268, column: 7)
!2348 = distinct !DILexicalBlock(scope: !2334, file: !72, line: 2267, column: 3)
!2349 = !DILocation(line: 2268, column: 15, scope: !2347)
!2350 = !DILocation(line: 2268, column: 7, scope: !2348)
!2351 = !DILocation(line: 2269, column: 13, scope: !2347)
!2352 = !DILocation(line: 2269, column: 12, scope: !2347)
!2353 = !DILocation(line: 2269, column: 5, scope: !2347)
!2354 = !DILocation(line: 2271, column: 5, scope: !2347)
!2355 = !DILocation(line: 2276, column: 4, scope: !2356)
!2356 = distinct !DILexicalBlock(scope: !2329, file: !72, line: 2275, column: 2)
!2357 = !DILocation(line: 2278, column: 1, scope: !2248)
!2358 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !2359, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2359 = !DISubroutineType(types: !2360)
!2360 = !{!37, !26}
!2361 = !DILocalVariable(name: "value", arg: 1, scope: !2358, file: !30, line: 42, type: !26)
!2362 = !DILocation(line: 42, column: 38, scope: !2358)
!2363 = !DILocation(line: 44, column: 12, scope: !2358)
!2364 = !DILocation(line: 44, column: 18, scope: !2358)
!2365 = !DILocation(line: 44, column: 5, scope: !2358)
!2366 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !72, file: !72, line: 2296, type: !2367, scopeLine: 2297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2367 = !DISubroutineType(types: !2368)
!2368 = !{!80, !80, !17}
!2369 = !DILocalVariable(name: "value", arg: 1, scope: !2366, file: !72, line: 2296, type: !80)
!2370 = !DILocation(line: 2296, column: 29, scope: !2366)
!2371 = !DILocalVariable(name: "factor", arg: 2, scope: !2366, file: !72, line: 2296, type: !17)
!2372 = !DILocation(line: 2296, column: 39, scope: !2366)
!2373 = !DILocalVariable(name: "u32Temp1", scope: !2366, file: !72, line: 2298, type: !736)
!2374 = !DILocation(line: 2298, column: 6, scope: !2366)
!2375 = !DILocalVariable(name: "u32Temp2", scope: !2366, file: !72, line: 2298, type: !736)
!2376 = !DILocation(line: 2298, column: 17, scope: !2366)
!2377 = !DILocalVariable(name: "u32Temp3", scope: !2366, file: !72, line: 2298, type: !736)
!2378 = !DILocation(line: 2298, column: 26, scope: !2366)
!2379 = !DILocalVariable(name: "u8SignBit", scope: !2366, file: !72, line: 2299, type: !17)
!2380 = !DILocation(line: 2299, column: 5, scope: !2366)
!2381 = !DILocation(line: 2301, column: 5, scope: !2382)
!2382 = distinct !DILexicalBlock(scope: !2366, file: !72, line: 2301, column: 5)
!2383 = !DILocation(line: 2301, column: 10, scope: !2382)
!2384 = !DILocation(line: 2301, column: 5, scope: !2366)
!2385 = !DILocation(line: 2303, column: 15, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2382, file: !72, line: 2302, column: 2)
!2387 = !DILocation(line: 2303, column: 14, scope: !2386)
!2388 = !DILocation(line: 2303, column: 12, scope: !2386)
!2389 = !DILocation(line: 2304, column: 13, scope: !2386)
!2390 = !DILocation(line: 2305, column: 2, scope: !2386)
!2391 = !DILocation(line: 2308, column: 14, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2382, file: !72, line: 2307, column: 2)
!2393 = !DILocation(line: 2308, column: 12, scope: !2392)
!2394 = !DILocation(line: 2309, column: 13, scope: !2392)
!2395 = !DILocation(line: 2312, column: 13, scope: !2366)
!2396 = !DILocation(line: 2312, column: 24, scope: !2366)
!2397 = !DILocation(line: 2312, column: 22, scope: !2366)
!2398 = !DILocation(line: 2312, column: 11, scope: !2366)
!2399 = !DILocation(line: 2313, column: 25, scope: !2366)
!2400 = !DILocation(line: 2313, column: 35, scope: !2366)
!2401 = !DILocation(line: 2313, column: 13, scope: !2366)
!2402 = !DILocation(line: 2313, column: 11, scope: !2366)
!2403 = !DILocation(line: 2314, column: 13, scope: !2366)
!2404 = !DILocation(line: 2314, column: 22, scope: !2366)
!2405 = !DILocation(line: 2314, column: 11, scope: !2366)
!2406 = !DILocation(line: 2315, column: 14, scope: !2366)
!2407 = !DILocation(line: 2315, column: 23, scope: !2366)
!2408 = !DILocation(line: 2315, column: 11, scope: !2366)
!2409 = !DILocation(line: 2316, column: 5, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2366, file: !72, line: 2316, column: 5)
!2411 = !DILocation(line: 2316, column: 15, scope: !2410)
!2412 = !DILocation(line: 2316, column: 5, scope: !2366)
!2413 = !DILocation(line: 2318, column: 10, scope: !2414)
!2414 = distinct !DILexicalBlock(scope: !2410, file: !72, line: 2317, column: 2)
!2415 = !DILocation(line: 2318, column: 3, scope: !2414)
!2416 = !DILocation(line: 2322, column: 11, scope: !2417)
!2417 = distinct !DILexicalBlock(scope: !2410, file: !72, line: 2321, column: 2)
!2418 = !DILocation(line: 2322, column: 10, scope: !2417)
!2419 = !DILocation(line: 2322, column: 3, scope: !2417)
!2420 = !DILocation(line: 2324, column: 1, scope: !2366)
!2421 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !72, file: !72, line: 2343, type: !2367, scopeLine: 2344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2422 = !DILocalVariable(name: "value", arg: 1, scope: !2421, file: !72, line: 2343, type: !80)
!2423 = !DILocation(line: 2343, column: 29, scope: !2421)
!2424 = !DILocalVariable(name: "factor", arg: 2, scope: !2421, file: !72, line: 2343, type: !17)
!2425 = !DILocation(line: 2343, column: 39, scope: !2421)
!2426 = !DILocalVariable(name: "u32Temp1", scope: !2421, file: !72, line: 2345, type: !736)
!2427 = !DILocation(line: 2345, column: 6, scope: !2421)
!2428 = !DILocalVariable(name: "u32Temp2", scope: !2421, file: !72, line: 2345, type: !736)
!2429 = !DILocation(line: 2345, column: 17, scope: !2421)
!2430 = !DILocalVariable(name: "u32Temp3", scope: !2421, file: !72, line: 2345, type: !736)
!2431 = !DILocation(line: 2345, column: 26, scope: !2421)
!2432 = !DILocalVariable(name: "u8SignBit", scope: !2421, file: !72, line: 2346, type: !17)
!2433 = !DILocation(line: 2346, column: 5, scope: !2421)
!2434 = !DILocation(line: 2348, column: 5, scope: !2435)
!2435 = distinct !DILexicalBlock(scope: !2421, file: !72, line: 2348, column: 5)
!2436 = !DILocation(line: 2348, column: 10, scope: !2435)
!2437 = !DILocation(line: 2348, column: 5, scope: !2421)
!2438 = !DILocation(line: 2350, column: 15, scope: !2439)
!2439 = distinct !DILexicalBlock(scope: !2435, file: !72, line: 2349, column: 2)
!2440 = !DILocation(line: 2350, column: 14, scope: !2439)
!2441 = !DILocation(line: 2350, column: 12, scope: !2439)
!2442 = !DILocation(line: 2351, column: 13, scope: !2439)
!2443 = !DILocation(line: 2352, column: 2, scope: !2439)
!2444 = !DILocation(line: 2355, column: 14, scope: !2445)
!2445 = distinct !DILexicalBlock(scope: !2435, file: !72, line: 2354, column: 2)
!2446 = !DILocation(line: 2355, column: 12, scope: !2445)
!2447 = !DILocation(line: 2356, column: 13, scope: !2445)
!2448 = !DILocation(line: 2359, column: 13, scope: !2421)
!2449 = !DILocation(line: 2359, column: 24, scope: !2421)
!2450 = !DILocation(line: 2359, column: 22, scope: !2421)
!2451 = !DILocation(line: 2359, column: 11, scope: !2421)
!2452 = !DILocation(line: 2360, column: 25, scope: !2421)
!2453 = !DILocation(line: 2360, column: 35, scope: !2421)
!2454 = !DILocation(line: 2360, column: 13, scope: !2421)
!2455 = !DILocation(line: 2360, column: 11, scope: !2421)
!2456 = !DILocation(line: 2361, column: 13, scope: !2421)
!2457 = !DILocation(line: 2361, column: 22, scope: !2421)
!2458 = !DILocation(line: 2361, column: 11, scope: !2421)
!2459 = !DILocation(line: 2362, column: 14, scope: !2421)
!2460 = !DILocation(line: 2362, column: 23, scope: !2421)
!2461 = !DILocation(line: 2362, column: 11, scope: !2421)
!2462 = !DILocation(line: 2363, column: 5, scope: !2463)
!2463 = distinct !DILexicalBlock(scope: !2421, file: !72, line: 2363, column: 5)
!2464 = !DILocation(line: 2363, column: 15, scope: !2463)
!2465 = !DILocation(line: 2363, column: 5, scope: !2421)
!2466 = !DILocation(line: 2365, column: 6, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2468, file: !72, line: 2365, column: 6)
!2468 = distinct !DILexicalBlock(scope: !2463, file: !72, line: 2364, column: 2)
!2469 = !DILocation(line: 2365, column: 14, scope: !2467)
!2470 = !DILocation(line: 2365, column: 6, scope: !2468)
!2471 = !DILocation(line: 2366, column: 11, scope: !2467)
!2472 = !DILocation(line: 2366, column: 4, scope: !2467)
!2473 = !DILocation(line: 2368, column: 4, scope: !2467)
!2474 = !DILocation(line: 2372, column: 6, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2476, file: !72, line: 2372, column: 6)
!2476 = distinct !DILexicalBlock(scope: !2463, file: !72, line: 2371, column: 2)
!2477 = !DILocation(line: 2372, column: 14, scope: !2475)
!2478 = !DILocation(line: 2372, column: 6, scope: !2476)
!2479 = !DILocation(line: 2373, column: 12, scope: !2475)
!2480 = !DILocation(line: 2373, column: 11, scope: !2475)
!2481 = !DILocation(line: 2373, column: 4, scope: !2475)
!2482 = !DILocation(line: 2375, column: 4, scope: !2475)
!2483 = !DILocation(line: 2377, column: 1, scope: !2421)
!2484 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !72, file: !72, line: 2394, type: !2485, scopeLine: 2395, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2485 = !DISubroutineType(types: !2486)
!2486 = !{!736, !736, !736, !17}
!2487 = !DILocalVariable(name: "value", arg: 1, scope: !2484, file: !72, line: 2394, type: !736)
!2488 = !DILocation(line: 2394, column: 39, scope: !2484)
!2489 = !DILocalVariable(name: "factor", arg: 2, scope: !2484, file: !72, line: 2394, type: !736)
!2490 = !DILocation(line: 2394, column: 49, scope: !2484)
!2491 = !DILocalVariable(name: "power", arg: 3, scope: !2484, file: !72, line: 2394, type: !17)
!2492 = !DILocation(line: 2394, column: 60, scope: !2484)
!2493 = !DILocalVariable(name: "u32Temp1", scope: !2484, file: !72, line: 2396, type: !736)
!2494 = !DILocation(line: 2396, column: 6, scope: !2484)
!2495 = !DILocalVariable(name: "u32Temp2", scope: !2484, file: !72, line: 2396, type: !736)
!2496 = !DILocation(line: 2396, column: 20, scope: !2484)
!2497 = !DILocation(line: 2397, column: 5, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2484, file: !72, line: 2397, column: 5)
!2499 = !DILocation(line: 2397, column: 10, scope: !2498)
!2500 = !DILocation(line: 2397, column: 5, scope: !2484)
!2501 = !DILocation(line: 2399, column: 9, scope: !2502)
!2502 = distinct !DILexicalBlock(scope: !2498, file: !72, line: 2398, column: 2)
!2503 = !DILocation(line: 2400, column: 2, scope: !2502)
!2504 = !DILocation(line: 2401, column: 10, scope: !2505)
!2505 = distinct !DILexicalBlock(scope: !2498, file: !72, line: 2401, column: 10)
!2506 = !DILocation(line: 2401, column: 15, scope: !2505)
!2507 = !DILocation(line: 2401, column: 10, scope: !2498)
!2508 = !DILocation(line: 2403, column: 9, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2505, file: !72, line: 2402, column: 2)
!2510 = !DILocation(line: 2404, column: 2, scope: !2509)
!2511 = !DILocation(line: 2409, column: 13, scope: !2484)
!2512 = !DILocation(line: 2409, column: 21, scope: !2484)
!2513 = !DILocation(line: 2409, column: 19, scope: !2484)
!2514 = !DILocation(line: 2409, column: 11, scope: !2484)
!2515 = !DILocation(line: 2410, column: 25, scope: !2484)
!2516 = !DILocation(line: 2410, column: 32, scope: !2484)
!2517 = !DILocation(line: 2410, column: 13, scope: !2484)
!2518 = !DILocation(line: 2410, column: 11, scope: !2484)
!2519 = !DILocation(line: 2411, column: 13, scope: !2484)
!2520 = !DILocation(line: 2411, column: 29, scope: !2484)
!2521 = !DILocation(line: 2411, column: 28, scope: !2484)
!2522 = !DILocation(line: 2411, column: 22, scope: !2484)
!2523 = !DILocation(line: 2411, column: 11, scope: !2484)
!2524 = !DILocation(line: 2412, column: 14, scope: !2484)
!2525 = !DILocation(line: 2412, column: 26, scope: !2484)
!2526 = !DILocation(line: 2412, column: 23, scope: !2484)
!2527 = !DILocation(line: 2412, column: 11, scope: !2484)
!2528 = !DILocation(line: 2413, column: 6, scope: !2529)
!2529 = distinct !DILexicalBlock(scope: !2484, file: !72, line: 2413, column: 5)
!2530 = !DILocation(line: 2413, column: 20, scope: !2529)
!2531 = !DILocation(line: 2413, column: 19, scope: !2529)
!2532 = !DILocation(line: 2413, column: 14, scope: !2529)
!2533 = !DILocation(line: 2413, column: 28, scope: !2529)
!2534 = !DILocation(line: 2413, column: 5, scope: !2484)
!2535 = !DILocation(line: 2415, column: 10, scope: !2536)
!2536 = distinct !DILexicalBlock(scope: !2529, file: !72, line: 2414, column: 2)
!2537 = !DILocation(line: 2415, column: 3, scope: !2536)
!2538 = !DILocation(line: 2419, column: 3, scope: !2539)
!2539 = distinct !DILexicalBlock(scope: !2529, file: !72, line: 2418, column: 2)
!2540 = !DILocation(line: 2421, column: 1, scope: !2484)
!2541 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !72, file: !72, line: 2439, type: !2542, scopeLine: 2440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2542 = !DISubroutineType(types: !2543)
!2543 = !{!80, !80, !80, !17}
!2544 = !DILocalVariable(name: "value", arg: 1, scope: !2541, file: !72, line: 2439, type: !80)
!2545 = !DILocation(line: 2439, column: 39, scope: !2541)
!2546 = !DILocalVariable(name: "factor", arg: 2, scope: !2541, file: !72, line: 2439, type: !80)
!2547 = !DILocation(line: 2439, column: 50, scope: !2541)
!2548 = !DILocalVariable(name: "power", arg: 3, scope: !2541, file: !72, line: 2439, type: !17)
!2549 = !DILocation(line: 2439, column: 61, scope: !2541)
!2550 = !DILocalVariable(name: "u32Temp1", scope: !2541, file: !72, line: 2441, type: !736)
!2551 = !DILocation(line: 2441, column: 6, scope: !2541)
!2552 = !DILocalVariable(name: "u32Temp2", scope: !2541, file: !72, line: 2441, type: !736)
!2553 = !DILocation(line: 2441, column: 17, scope: !2541)
!2554 = !DILocalVariable(name: "u32Temp3", scope: !2541, file: !72, line: 2441, type: !736)
!2555 = !DILocation(line: 2441, column: 26, scope: !2541)
!2556 = !DILocalVariable(name: "u32Temp4", scope: !2541, file: !72, line: 2441, type: !736)
!2557 = !DILocation(line: 2441, column: 35, scope: !2541)
!2558 = !DILocalVariable(name: "u8SignBit", scope: !2541, file: !72, line: 2442, type: !17)
!2559 = !DILocation(line: 2442, column: 5, scope: !2541)
!2560 = !DILocation(line: 2444, column: 5, scope: !2561)
!2561 = distinct !DILexicalBlock(scope: !2541, file: !72, line: 2444, column: 5)
!2562 = !DILocation(line: 2444, column: 10, scope: !2561)
!2563 = !DILocation(line: 2444, column: 5, scope: !2541)
!2564 = !DILocation(line: 2446, column: 9, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2561, file: !72, line: 2445, column: 2)
!2566 = !DILocation(line: 2447, column: 2, scope: !2565)
!2567 = !DILocation(line: 2448, column: 10, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2561, file: !72, line: 2448, column: 10)
!2569 = !DILocation(line: 2448, column: 15, scope: !2568)
!2570 = !DILocation(line: 2448, column: 10, scope: !2561)
!2571 = !DILocation(line: 2450, column: 9, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2568, file: !72, line: 2449, column: 2)
!2573 = !DILocation(line: 2451, column: 2, scope: !2572)
!2574 = !DILocation(line: 2457, column: 7, scope: !2575)
!2575 = distinct !DILexicalBlock(scope: !2541, file: !72, line: 2457, column: 5)
!2576 = !DILocation(line: 2457, column: 12, scope: !2575)
!2577 = !DILocation(line: 2457, column: 16, scope: !2575)
!2578 = !DILocation(line: 2457, column: 36, scope: !2575)
!2579 = !DILocation(line: 2457, column: 41, scope: !2575)
!2580 = !DILocation(line: 2457, column: 45, scope: !2575)
!2581 = !DILocation(line: 2459, column: 13, scope: !2582)
!2582 = distinct !DILexicalBlock(scope: !2575, file: !72, line: 2458, column: 2)
!2583 = !DILocation(line: 2460, column: 2, scope: !2582)
!2584 = !DILocation(line: 2463, column: 13, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2575, file: !72, line: 2462, column: 2)
!2586 = !DILocation(line: 2466, column: 5, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2541, file: !72, line: 2466, column: 5)
!2588 = !DILocation(line: 2466, column: 10, scope: !2587)
!2589 = !DILocation(line: 2466, column: 5, scope: !2541)
!2590 = !DILocation(line: 2468, column: 15, scope: !2591)
!2591 = distinct !DILexicalBlock(scope: !2587, file: !72, line: 2467, column: 2)
!2592 = !DILocation(line: 2468, column: 14, scope: !2591)
!2593 = !DILocation(line: 2468, column: 12, scope: !2591)
!2594 = !DILocation(line: 2469, column: 2, scope: !2591)
!2595 = !DILocation(line: 2472, column: 14, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2587, file: !72, line: 2471, column: 2)
!2597 = !DILocation(line: 2472, column: 12, scope: !2596)
!2598 = !DILocation(line: 2475, column: 5, scope: !2599)
!2599 = distinct !DILexicalBlock(scope: !2541, file: !72, line: 2475, column: 5)
!2600 = !DILocation(line: 2475, column: 11, scope: !2599)
!2601 = !DILocation(line: 2475, column: 5, scope: !2541)
!2602 = !DILocation(line: 2477, column: 15, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2599, file: !72, line: 2476, column: 2)
!2604 = !DILocation(line: 2477, column: 14, scope: !2603)
!2605 = !DILocation(line: 2477, column: 12, scope: !2603)
!2606 = !DILocation(line: 2478, column: 2, scope: !2603)
!2607 = !DILocation(line: 2481, column: 14, scope: !2608)
!2608 = distinct !DILexicalBlock(scope: !2599, file: !72, line: 2480, column: 2)
!2609 = !DILocation(line: 2481, column: 12, scope: !2608)
!2610 = !DILocation(line: 2484, column: 13, scope: !2541)
!2611 = !DILocation(line: 2484, column: 24, scope: !2541)
!2612 = !DILocation(line: 2484, column: 22, scope: !2541)
!2613 = !DILocation(line: 2484, column: 11, scope: !2541)
!2614 = !DILocation(line: 2485, column: 25, scope: !2541)
!2615 = !DILocation(line: 2485, column: 35, scope: !2541)
!2616 = !DILocation(line: 2485, column: 13, scope: !2541)
!2617 = !DILocation(line: 2485, column: 11, scope: !2541)
!2618 = !DILocation(line: 2486, column: 13, scope: !2541)
!2619 = !DILocation(line: 2486, column: 29, scope: !2541)
!2620 = !DILocation(line: 2486, column: 28, scope: !2541)
!2621 = !DILocation(line: 2486, column: 22, scope: !2541)
!2622 = !DILocation(line: 2486, column: 11, scope: !2541)
!2623 = !DILocation(line: 2487, column: 14, scope: !2541)
!2624 = !DILocation(line: 2487, column: 26, scope: !2541)
!2625 = !DILocation(line: 2487, column: 23, scope: !2541)
!2626 = !DILocation(line: 2487, column: 11, scope: !2541)
!2627 = !DILocation(line: 2488, column: 6, scope: !2628)
!2628 = distinct !DILexicalBlock(scope: !2541, file: !72, line: 2488, column: 5)
!2629 = !DILocation(line: 2488, column: 20, scope: !2628)
!2630 = !DILocation(line: 2488, column: 19, scope: !2628)
!2631 = !DILocation(line: 2488, column: 14, scope: !2628)
!2632 = !DILocation(line: 2488, column: 27, scope: !2628)
!2633 = !DILocation(line: 2488, column: 5, scope: !2541)
!2634 = !DILocation(line: 2490, column: 6, scope: !2635)
!2635 = distinct !DILexicalBlock(scope: !2636, file: !72, line: 2490, column: 6)
!2636 = distinct !DILexicalBlock(scope: !2628, file: !72, line: 2489, column: 2)
!2637 = !DILocation(line: 2490, column: 16, scope: !2635)
!2638 = !DILocation(line: 2490, column: 6, scope: !2636)
!2639 = !DILocation(line: 2492, column: 7, scope: !2640)
!2640 = distinct !DILexicalBlock(scope: !2641, file: !72, line: 2492, column: 7)
!2641 = distinct !DILexicalBlock(scope: !2635, file: !72, line: 2491, column: 3)
!2642 = !DILocation(line: 2492, column: 15, scope: !2640)
!2643 = !DILocation(line: 2492, column: 7, scope: !2641)
!2644 = !DILocation(line: 2493, column: 12, scope: !2640)
!2645 = !DILocation(line: 2493, column: 5, scope: !2640)
!2646 = !DILocation(line: 2495, column: 5, scope: !2640)
!2647 = !DILocation(line: 2499, column: 12, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2635, file: !72, line: 2498, column: 3)
!2649 = !DILocation(line: 2499, column: 11, scope: !2648)
!2650 = !DILocation(line: 2499, column: 4, scope: !2648)
!2651 = !DILocation(line: 2504, column: 6, scope: !2652)
!2652 = distinct !DILexicalBlock(scope: !2653, file: !72, line: 2504, column: 6)
!2653 = distinct !DILexicalBlock(scope: !2628, file: !72, line: 2503, column: 2)
!2654 = !DILocation(line: 2504, column: 16, scope: !2652)
!2655 = !DILocation(line: 2504, column: 6, scope: !2653)
!2656 = !DILocation(line: 2506, column: 4, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2652, file: !72, line: 2505, column: 3)
!2658 = !DILocation(line: 2510, column: 4, scope: !2659)
!2659 = distinct !DILexicalBlock(scope: !2652, file: !72, line: 2509, column: 3)
!2660 = !DILocation(line: 2513, column: 1, scope: !2541)
!2661 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !72, file: !72, line: 2532, type: !2662, scopeLine: 2533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2662 = !DISubroutineType(types: !2663)
!2663 = !{!80, !80, !6}
!2664 = !DILocalVariable(name: "value", arg: 1, scope: !2661, file: !72, line: 2532, type: !80)
!2665 = !DILocation(line: 2532, column: 29, scope: !2661)
!2666 = !DILocalVariable(name: "factor", arg: 2, scope: !2661, file: !72, line: 2532, type: !6)
!2667 = !DILocation(line: 2532, column: 39, scope: !2661)
!2668 = !DILocalVariable(name: "u32Temp1", scope: !2661, file: !72, line: 2534, type: !736)
!2669 = !DILocation(line: 2534, column: 6, scope: !2661)
!2670 = !DILocalVariable(name: "u32Temp2", scope: !2661, file: !72, line: 2534, type: !736)
!2671 = !DILocation(line: 2534, column: 17, scope: !2661)
!2672 = !DILocalVariable(name: "u32Temp3", scope: !2661, file: !72, line: 2534, type: !736)
!2673 = !DILocation(line: 2534, column: 26, scope: !2661)
!2674 = !DILocalVariable(name: "u32Temp4", scope: !2661, file: !72, line: 2534, type: !736)
!2675 = !DILocation(line: 2534, column: 35, scope: !2661)
!2676 = !DILocalVariable(name: "u8SignBit", scope: !2661, file: !72, line: 2535, type: !17)
!2677 = !DILocation(line: 2535, column: 5, scope: !2661)
!2678 = !DILocation(line: 2537, column: 7, scope: !2679)
!2679 = distinct !DILexicalBlock(scope: !2661, file: !72, line: 2537, column: 5)
!2680 = !DILocation(line: 2537, column: 12, scope: !2679)
!2681 = !DILocation(line: 2537, column: 16, scope: !2679)
!2682 = !DILocation(line: 2537, column: 20, scope: !2679)
!2683 = !DILocation(line: 2537, column: 26, scope: !2679)
!2684 = !DILocation(line: 2537, column: 31, scope: !2679)
!2685 = !DILocation(line: 2537, column: 36, scope: !2679)
!2686 = !DILocation(line: 2537, column: 41, scope: !2679)
!2687 = !DILocation(line: 2537, column: 45, scope: !2679)
!2688 = !DILocation(line: 2537, column: 49, scope: !2679)
!2689 = !DILocation(line: 2537, column: 55, scope: !2679)
!2690 = !DILocation(line: 2537, column: 5, scope: !2661)
!2691 = !DILocation(line: 2539, column: 13, scope: !2692)
!2692 = distinct !DILexicalBlock(scope: !2679, file: !72, line: 2538, column: 2)
!2693 = !DILocation(line: 2540, column: 2, scope: !2692)
!2694 = !DILocation(line: 2543, column: 13, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2679, file: !72, line: 2542, column: 2)
!2696 = !DILocation(line: 2546, column: 5, scope: !2697)
!2697 = distinct !DILexicalBlock(scope: !2661, file: !72, line: 2546, column: 5)
!2698 = !DILocation(line: 2546, column: 10, scope: !2697)
!2699 = !DILocation(line: 2546, column: 5, scope: !2661)
!2700 = !DILocation(line: 2548, column: 15, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2697, file: !72, line: 2547, column: 2)
!2702 = !DILocation(line: 2548, column: 14, scope: !2701)
!2703 = !DILocation(line: 2548, column: 12, scope: !2701)
!2704 = !DILocation(line: 2549, column: 2, scope: !2701)
!2705 = !DILocation(line: 2552, column: 14, scope: !2706)
!2706 = distinct !DILexicalBlock(scope: !2697, file: !72, line: 2551, column: 2)
!2707 = !DILocation(line: 2552, column: 12, scope: !2706)
!2708 = !DILocation(line: 2555, column: 5, scope: !2709)
!2709 = distinct !DILexicalBlock(scope: !2661, file: !72, line: 2555, column: 5)
!2710 = !DILocation(line: 2555, column: 11, scope: !2709)
!2711 = !DILocation(line: 2555, column: 5, scope: !2661)
!2712 = !DILocation(line: 2557, column: 15, scope: !2713)
!2713 = distinct !DILexicalBlock(scope: !2709, file: !72, line: 2556, column: 2)
!2714 = !DILocation(line: 2557, column: 14, scope: !2713)
!2715 = !DILocation(line: 2557, column: 12, scope: !2713)
!2716 = !DILocation(line: 2558, column: 2, scope: !2713)
!2717 = !DILocation(line: 2561, column: 14, scope: !2718)
!2718 = distinct !DILexicalBlock(scope: !2709, file: !72, line: 2560, column: 2)
!2719 = !DILocation(line: 2561, column: 12, scope: !2718)
!2720 = !DILocation(line: 2564, column: 13, scope: !2661)
!2721 = !DILocation(line: 2564, column: 24, scope: !2661)
!2722 = !DILocation(line: 2564, column: 22, scope: !2661)
!2723 = !DILocation(line: 2564, column: 11, scope: !2661)
!2724 = !DILocation(line: 2565, column: 25, scope: !2661)
!2725 = !DILocation(line: 2565, column: 35, scope: !2661)
!2726 = !DILocation(line: 2565, column: 13, scope: !2661)
!2727 = !DILocation(line: 2565, column: 11, scope: !2661)
!2728 = !DILocation(line: 2566, column: 13, scope: !2661)
!2729 = !DILocation(line: 2566, column: 22, scope: !2661)
!2730 = !DILocation(line: 2566, column: 11, scope: !2661)
!2731 = !DILocation(line: 2567, column: 14, scope: !2661)
!2732 = !DILocation(line: 2567, column: 23, scope: !2661)
!2733 = !DILocation(line: 2567, column: 11, scope: !2661)
!2734 = !DILocation(line: 2568, column: 5, scope: !2735)
!2735 = distinct !DILexicalBlock(scope: !2661, file: !72, line: 2568, column: 5)
!2736 = !DILocation(line: 2568, column: 15, scope: !2735)
!2737 = !DILocation(line: 2568, column: 5, scope: !2661)
!2738 = !DILocation(line: 2570, column: 6, scope: !2739)
!2739 = distinct !DILexicalBlock(scope: !2740, file: !72, line: 2570, column: 6)
!2740 = distinct !DILexicalBlock(scope: !2735, file: !72, line: 2569, column: 2)
!2741 = !DILocation(line: 2570, column: 14, scope: !2739)
!2742 = !DILocation(line: 2570, column: 6, scope: !2740)
!2743 = !DILocation(line: 2571, column: 11, scope: !2739)
!2744 = !DILocation(line: 2571, column: 4, scope: !2739)
!2745 = !DILocation(line: 2573, column: 4, scope: !2739)
!2746 = !DILocation(line: 2577, column: 11, scope: !2747)
!2747 = distinct !DILexicalBlock(scope: !2735, file: !72, line: 2576, column: 2)
!2748 = !DILocation(line: 2577, column: 10, scope: !2747)
!2749 = !DILocation(line: 2577, column: 3, scope: !2747)
!2750 = !DILocation(line: 2579, column: 1, scope: !2661)
!2751 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !72, file: !72, line: 2598, type: !2662, scopeLine: 2599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2752 = !DILocalVariable(name: "value", arg: 1, scope: !2751, file: !72, line: 2598, type: !80)
!2753 = !DILocation(line: 2598, column: 29, scope: !2751)
!2754 = !DILocalVariable(name: "factor", arg: 2, scope: !2751, file: !72, line: 2598, type: !6)
!2755 = !DILocation(line: 2598, column: 39, scope: !2751)
!2756 = !DILocalVariable(name: "u32Temp1", scope: !2751, file: !72, line: 2600, type: !736)
!2757 = !DILocation(line: 2600, column: 6, scope: !2751)
!2758 = !DILocalVariable(name: "u32Temp2", scope: !2751, file: !72, line: 2600, type: !736)
!2759 = !DILocation(line: 2600, column: 17, scope: !2751)
!2760 = !DILocalVariable(name: "u32Temp3", scope: !2751, file: !72, line: 2600, type: !736)
!2761 = !DILocation(line: 2600, column: 26, scope: !2751)
!2762 = !DILocalVariable(name: "u32Temp4", scope: !2751, file: !72, line: 2600, type: !736)
!2763 = !DILocation(line: 2600, column: 35, scope: !2751)
!2764 = !DILocalVariable(name: "u8SignBit", scope: !2751, file: !72, line: 2601, type: !17)
!2765 = !DILocation(line: 2601, column: 5, scope: !2751)
!2766 = !DILocation(line: 2603, column: 7, scope: !2767)
!2767 = distinct !DILexicalBlock(scope: !2751, file: !72, line: 2603, column: 5)
!2768 = !DILocation(line: 2603, column: 12, scope: !2767)
!2769 = !DILocation(line: 2603, column: 16, scope: !2767)
!2770 = !DILocation(line: 2603, column: 20, scope: !2767)
!2771 = !DILocation(line: 2603, column: 26, scope: !2767)
!2772 = !DILocation(line: 2603, column: 31, scope: !2767)
!2773 = !DILocation(line: 2603, column: 36, scope: !2767)
!2774 = !DILocation(line: 2603, column: 41, scope: !2767)
!2775 = !DILocation(line: 2603, column: 45, scope: !2767)
!2776 = !DILocation(line: 2603, column: 49, scope: !2767)
!2777 = !DILocation(line: 2603, column: 55, scope: !2767)
!2778 = !DILocation(line: 2603, column: 5, scope: !2751)
!2779 = !DILocation(line: 2605, column: 13, scope: !2780)
!2780 = distinct !DILexicalBlock(scope: !2767, file: !72, line: 2604, column: 2)
!2781 = !DILocation(line: 2606, column: 2, scope: !2780)
!2782 = !DILocation(line: 2609, column: 13, scope: !2783)
!2783 = distinct !DILexicalBlock(scope: !2767, file: !72, line: 2608, column: 2)
!2784 = !DILocation(line: 2612, column: 5, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2751, file: !72, line: 2612, column: 5)
!2786 = !DILocation(line: 2612, column: 10, scope: !2785)
!2787 = !DILocation(line: 2612, column: 5, scope: !2751)
!2788 = !DILocation(line: 2614, column: 15, scope: !2789)
!2789 = distinct !DILexicalBlock(scope: !2785, file: !72, line: 2613, column: 2)
!2790 = !DILocation(line: 2614, column: 14, scope: !2789)
!2791 = !DILocation(line: 2614, column: 12, scope: !2789)
!2792 = !DILocation(line: 2615, column: 2, scope: !2789)
!2793 = !DILocation(line: 2618, column: 14, scope: !2794)
!2794 = distinct !DILexicalBlock(scope: !2785, file: !72, line: 2617, column: 2)
!2795 = !DILocation(line: 2618, column: 12, scope: !2794)
!2796 = !DILocation(line: 2621, column: 5, scope: !2797)
!2797 = distinct !DILexicalBlock(scope: !2751, file: !72, line: 2621, column: 5)
!2798 = !DILocation(line: 2621, column: 11, scope: !2797)
!2799 = !DILocation(line: 2621, column: 5, scope: !2751)
!2800 = !DILocation(line: 2623, column: 15, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2797, file: !72, line: 2622, column: 2)
!2802 = !DILocation(line: 2623, column: 14, scope: !2801)
!2803 = !DILocation(line: 2623, column: 12, scope: !2801)
!2804 = !DILocation(line: 2624, column: 2, scope: !2801)
!2805 = !DILocation(line: 2627, column: 14, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2797, file: !72, line: 2626, column: 2)
!2807 = !DILocation(line: 2627, column: 12, scope: !2806)
!2808 = !DILocation(line: 2630, column: 13, scope: !2751)
!2809 = !DILocation(line: 2630, column: 24, scope: !2751)
!2810 = !DILocation(line: 2630, column: 22, scope: !2751)
!2811 = !DILocation(line: 2630, column: 11, scope: !2751)
!2812 = !DILocation(line: 2631, column: 25, scope: !2751)
!2813 = !DILocation(line: 2631, column: 35, scope: !2751)
!2814 = !DILocation(line: 2631, column: 13, scope: !2751)
!2815 = !DILocation(line: 2631, column: 11, scope: !2751)
!2816 = !DILocation(line: 2632, column: 13, scope: !2751)
!2817 = !DILocation(line: 2632, column: 22, scope: !2751)
!2818 = !DILocation(line: 2632, column: 11, scope: !2751)
!2819 = !DILocation(line: 2633, column: 14, scope: !2751)
!2820 = !DILocation(line: 2633, column: 23, scope: !2751)
!2821 = !DILocation(line: 2633, column: 11, scope: !2751)
!2822 = !DILocation(line: 2634, column: 6, scope: !2823)
!2823 = distinct !DILexicalBlock(scope: !2751, file: !72, line: 2634, column: 5)
!2824 = !DILocation(line: 2634, column: 14, scope: !2823)
!2825 = !DILocation(line: 2634, column: 18, scope: !2823)
!2826 = !DILocation(line: 2634, column: 5, scope: !2751)
!2827 = !DILocation(line: 2636, column: 6, scope: !2828)
!2828 = distinct !DILexicalBlock(scope: !2829, file: !72, line: 2636, column: 6)
!2829 = distinct !DILexicalBlock(scope: !2823, file: !72, line: 2635, column: 2)
!2830 = !DILocation(line: 2636, column: 16, scope: !2828)
!2831 = !DILocation(line: 2636, column: 6, scope: !2829)
!2832 = !DILocation(line: 2638, column: 7, scope: !2833)
!2833 = distinct !DILexicalBlock(scope: !2834, file: !72, line: 2638, column: 7)
!2834 = distinct !DILexicalBlock(scope: !2828, file: !72, line: 2637, column: 3)
!2835 = !DILocation(line: 2638, column: 15, scope: !2833)
!2836 = !DILocation(line: 2638, column: 7, scope: !2834)
!2837 = !DILocation(line: 2639, column: 12, scope: !2833)
!2838 = !DILocation(line: 2639, column: 5, scope: !2833)
!2839 = !DILocation(line: 2641, column: 5, scope: !2833)
!2840 = !DILocation(line: 2645, column: 7, scope: !2841)
!2841 = distinct !DILexicalBlock(scope: !2842, file: !72, line: 2645, column: 7)
!2842 = distinct !DILexicalBlock(scope: !2828, file: !72, line: 2644, column: 3)
!2843 = !DILocation(line: 2645, column: 15, scope: !2841)
!2844 = !DILocation(line: 2645, column: 7, scope: !2842)
!2845 = !DILocation(line: 2646, column: 13, scope: !2841)
!2846 = !DILocation(line: 2646, column: 12, scope: !2841)
!2847 = !DILocation(line: 2646, column: 5, scope: !2841)
!2848 = !DILocation(line: 2648, column: 5, scope: !2841)
!2849 = !DILocation(line: 2653, column: 3, scope: !2850)
!2850 = distinct !DILexicalBlock(scope: !2823, file: !72, line: 2652, column: 2)
!2851 = !DILocation(line: 2655, column: 1, scope: !2751)
!2852 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !72, file: !72, line: 2670, type: !2165, scopeLine: 2671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2853 = !DILocalVariable(name: "val1", arg: 1, scope: !2852, file: !72, line: 2670, type: !80)
!2854 = !DILocation(line: 2670, column: 25, scope: !2852)
!2855 = !DILocalVariable(name: "val2", arg: 2, scope: !2852, file: !72, line: 2670, type: !80)
!2856 = !DILocation(line: 2670, column: 35, scope: !2852)
!2857 = !DILocalVariable(name: "u32Temp1", scope: !2852, file: !72, line: 2672, type: !736)
!2858 = !DILocation(line: 2672, column: 6, scope: !2852)
!2859 = !DILocalVariable(name: "u32Temp2", scope: !2852, file: !72, line: 2672, type: !736)
!2860 = !DILocation(line: 2672, column: 17, scope: !2852)
!2861 = !DILocalVariable(name: "u32Temp3", scope: !2852, file: !72, line: 2672, type: !736)
!2862 = !DILocation(line: 2672, column: 26, scope: !2852)
!2863 = !DILocalVariable(name: "u32Temp4", scope: !2852, file: !72, line: 2672, type: !736)
!2864 = !DILocation(line: 2672, column: 35, scope: !2852)
!2865 = !DILocalVariable(name: "u8SignBit", scope: !2852, file: !72, line: 2673, type: !17)
!2866 = !DILocation(line: 2673, column: 5, scope: !2852)
!2867 = !DILocation(line: 2675, column: 7, scope: !2868)
!2868 = distinct !DILexicalBlock(scope: !2852, file: !72, line: 2675, column: 5)
!2869 = !DILocation(line: 2675, column: 11, scope: !2868)
!2870 = !DILocation(line: 2675, column: 15, scope: !2868)
!2871 = !DILocation(line: 2675, column: 33, scope: !2868)
!2872 = !DILocation(line: 2675, column: 37, scope: !2868)
!2873 = !DILocation(line: 2675, column: 41, scope: !2868)
!2874 = !DILocation(line: 2677, column: 13, scope: !2875)
!2875 = distinct !DILexicalBlock(scope: !2868, file: !72, line: 2676, column: 2)
!2876 = !DILocation(line: 2678, column: 2, scope: !2875)
!2877 = !DILocation(line: 2681, column: 13, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2868, file: !72, line: 2680, column: 2)
!2879 = !DILocation(line: 2684, column: 5, scope: !2880)
!2880 = distinct !DILexicalBlock(scope: !2852, file: !72, line: 2684, column: 5)
!2881 = !DILocation(line: 2684, column: 9, scope: !2880)
!2882 = !DILocation(line: 2684, column: 5, scope: !2852)
!2883 = !DILocation(line: 2686, column: 15, scope: !2884)
!2884 = distinct !DILexicalBlock(scope: !2880, file: !72, line: 2685, column: 2)
!2885 = !DILocation(line: 2686, column: 14, scope: !2884)
!2886 = !DILocation(line: 2686, column: 12, scope: !2884)
!2887 = !DILocation(line: 2687, column: 2, scope: !2884)
!2888 = !DILocation(line: 2690, column: 14, scope: !2889)
!2889 = distinct !DILexicalBlock(scope: !2880, file: !72, line: 2689, column: 2)
!2890 = !DILocation(line: 2690, column: 12, scope: !2889)
!2891 = !DILocation(line: 2693, column: 5, scope: !2892)
!2892 = distinct !DILexicalBlock(scope: !2852, file: !72, line: 2693, column: 5)
!2893 = !DILocation(line: 2693, column: 9, scope: !2892)
!2894 = !DILocation(line: 2693, column: 5, scope: !2852)
!2895 = !DILocation(line: 2695, column: 15, scope: !2896)
!2896 = distinct !DILexicalBlock(scope: !2892, file: !72, line: 2694, column: 2)
!2897 = !DILocation(line: 2695, column: 14, scope: !2896)
!2898 = !DILocation(line: 2695, column: 12, scope: !2896)
!2899 = !DILocation(line: 2696, column: 2, scope: !2896)
!2900 = !DILocation(line: 2699, column: 14, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2892, file: !72, line: 2698, column: 2)
!2902 = !DILocation(line: 2699, column: 12, scope: !2901)
!2903 = !DILocation(line: 2702, column: 13, scope: !2852)
!2904 = !DILocation(line: 2702, column: 24, scope: !2852)
!2905 = !DILocation(line: 2702, column: 22, scope: !2852)
!2906 = !DILocation(line: 2702, column: 11, scope: !2852)
!2907 = !DILocation(line: 2703, column: 25, scope: !2852)
!2908 = !DILocation(line: 2703, column: 35, scope: !2852)
!2909 = !DILocation(line: 2703, column: 13, scope: !2852)
!2910 = !DILocation(line: 2703, column: 11, scope: !2852)
!2911 = !DILocation(line: 2704, column: 5, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2852, file: !72, line: 2704, column: 5)
!2913 = !DILocation(line: 2704, column: 13, scope: !2912)
!2914 = !DILocation(line: 2704, column: 5, scope: !2852)
!2915 = !DILocation(line: 2706, column: 6, scope: !2916)
!2916 = distinct !DILexicalBlock(scope: !2917, file: !72, line: 2706, column: 6)
!2917 = distinct !DILexicalBlock(scope: !2912, file: !72, line: 2705, column: 2)
!2918 = !DILocation(line: 2706, column: 16, scope: !2916)
!2919 = !DILocation(line: 2706, column: 6, scope: !2917)
!2920 = !DILocation(line: 2708, column: 7, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2922, file: !72, line: 2708, column: 7)
!2922 = distinct !DILexicalBlock(scope: !2916, file: !72, line: 2707, column: 3)
!2923 = !DILocation(line: 2708, column: 15, scope: !2921)
!2924 = !DILocation(line: 2708, column: 7, scope: !2922)
!2925 = !DILocation(line: 2709, column: 12, scope: !2921)
!2926 = !DILocation(line: 2709, column: 5, scope: !2921)
!2927 = !DILocation(line: 2711, column: 5, scope: !2921)
!2928 = !DILocation(line: 2715, column: 7, scope: !2929)
!2929 = distinct !DILexicalBlock(scope: !2930, file: !72, line: 2715, column: 7)
!2930 = distinct !DILexicalBlock(scope: !2916, file: !72, line: 2714, column: 3)
!2931 = !DILocation(line: 2715, column: 15, scope: !2929)
!2932 = !DILocation(line: 2715, column: 7, scope: !2930)
!2933 = !DILocation(line: 2716, column: 13, scope: !2929)
!2934 = !DILocation(line: 2716, column: 12, scope: !2929)
!2935 = !DILocation(line: 2716, column: 5, scope: !2929)
!2936 = !DILocation(line: 2718, column: 5, scope: !2929)
!2937 = !DILocation(line: 2723, column: 6, scope: !2938)
!2938 = distinct !DILexicalBlock(scope: !2939, file: !72, line: 2723, column: 6)
!2939 = distinct !DILexicalBlock(scope: !2912, file: !72, line: 2722, column: 2)
!2940 = !DILocation(line: 2723, column: 16, scope: !2938)
!2941 = !DILocation(line: 2723, column: 6, scope: !2939)
!2942 = !DILocation(line: 2725, column: 4, scope: !2943)
!2943 = distinct !DILexicalBlock(scope: !2938, file: !72, line: 2724, column: 3)
!2944 = !DILocation(line: 2729, column: 4, scope: !2945)
!2945 = distinct !DILexicalBlock(scope: !2938, file: !72, line: 2728, column: 3)
!2946 = !DILocation(line: 2733, column: 1, scope: !2852)
!2947 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !72, file: !72, line: 2751, type: !2061, scopeLine: 2752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2948 = !DILocalVariable(name: "value", arg: 1, scope: !2947, file: !72, line: 2751, type: !80)
!2949 = !DILocation(line: 2751, column: 31, scope: !2947)
!2950 = !DILocalVariable(name: "factor", arg: 2, scope: !2947, file: !72, line: 2751, type: !736)
!2951 = !DILocation(line: 2751, column: 42, scope: !2947)
!2952 = !DILocalVariable(name: "u32Temp1", scope: !2947, file: !72, line: 2753, type: !736)
!2953 = !DILocation(line: 2753, column: 6, scope: !2947)
!2954 = !DILocalVariable(name: "u32Temp2", scope: !2947, file: !72, line: 2753, type: !736)
!2955 = !DILocation(line: 2753, column: 17, scope: !2947)
!2956 = !DILocalVariable(name: "u8SignBit", scope: !2947, file: !72, line: 2754, type: !17)
!2957 = !DILocation(line: 2754, column: 5, scope: !2947)
!2958 = !DILocation(line: 2756, column: 5, scope: !2959)
!2959 = distinct !DILexicalBlock(scope: !2947, file: !72, line: 2756, column: 5)
!2960 = !DILocation(line: 2756, column: 10, scope: !2959)
!2961 = !DILocation(line: 2756, column: 5, scope: !2947)
!2962 = !DILocation(line: 2758, column: 15, scope: !2963)
!2963 = distinct !DILexicalBlock(scope: !2959, file: !72, line: 2757, column: 2)
!2964 = !DILocation(line: 2758, column: 14, scope: !2963)
!2965 = !DILocation(line: 2758, column: 12, scope: !2963)
!2966 = !DILocation(line: 2759, column: 13, scope: !2963)
!2967 = !DILocation(line: 2760, column: 2, scope: !2963)
!2968 = !DILocation(line: 2763, column: 14, scope: !2969)
!2969 = distinct !DILexicalBlock(scope: !2959, file: !72, line: 2762, column: 2)
!2970 = !DILocation(line: 2763, column: 12, scope: !2969)
!2971 = !DILocation(line: 2764, column: 13, scope: !2969)
!2972 = !DILocation(line: 2767, column: 25, scope: !2947)
!2973 = !DILocation(line: 2767, column: 35, scope: !2947)
!2974 = !DILocation(line: 2767, column: 13, scope: !2947)
!2975 = !DILocation(line: 2767, column: 11, scope: !2947)
!2976 = !DILocation(line: 2768, column: 13, scope: !2947)
!2977 = !DILocation(line: 2768, column: 22, scope: !2947)
!2978 = !DILocation(line: 2768, column: 11, scope: !2947)
!2979 = !DILocation(line: 2769, column: 5, scope: !2980)
!2980 = distinct !DILexicalBlock(scope: !2947, file: !72, line: 2769, column: 5)
!2981 = !DILocation(line: 2769, column: 15, scope: !2980)
!2982 = !DILocation(line: 2769, column: 5, scope: !2947)
!2983 = !DILocation(line: 2771, column: 10, scope: !2984)
!2984 = distinct !DILexicalBlock(scope: !2980, file: !72, line: 2770, column: 2)
!2985 = !DILocation(line: 2771, column: 3, scope: !2984)
!2986 = !DILocation(line: 2775, column: 11, scope: !2987)
!2987 = distinct !DILexicalBlock(scope: !2980, file: !72, line: 2774, column: 2)
!2988 = !DILocation(line: 2775, column: 10, scope: !2987)
!2989 = !DILocation(line: 2775, column: 3, scope: !2987)
!2990 = !DILocation(line: 2777, column: 1, scope: !2947)
!2991 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !72, file: !72, line: 2793, type: !2165, scopeLine: 2794, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2992 = !DILocalVariable(name: "value", arg: 1, scope: !2991, file: !72, line: 2793, type: !80)
!2993 = !DILocation(line: 2793, column: 31, scope: !2991)
!2994 = !DILocalVariable(name: "factor", arg: 2, scope: !2991, file: !72, line: 2793, type: !80)
!2995 = !DILocation(line: 2793, column: 42, scope: !2991)
!2996 = !DILocalVariable(name: "u32Temp1", scope: !2991, file: !72, line: 2795, type: !736)
!2997 = !DILocation(line: 2795, column: 6, scope: !2991)
!2998 = !DILocalVariable(name: "u32Temp2", scope: !2991, file: !72, line: 2795, type: !736)
!2999 = !DILocation(line: 2795, column: 17, scope: !2991)
!3000 = !DILocalVariable(name: "u32Temp3", scope: !2991, file: !72, line: 2795, type: !736)
!3001 = !DILocation(line: 2795, column: 26, scope: !2991)
!3002 = !DILocalVariable(name: "u8SignBit", scope: !2991, file: !72, line: 2796, type: !17)
!3003 = !DILocation(line: 2796, column: 5, scope: !2991)
!3004 = !DILocation(line: 2798, column: 7, scope: !3005)
!3005 = distinct !DILexicalBlock(scope: !2991, file: !72, line: 2798, column: 5)
!3006 = !DILocation(line: 2798, column: 12, scope: !3005)
!3007 = !DILocation(line: 2798, column: 16, scope: !3005)
!3008 = !DILocation(line: 2798, column: 36, scope: !3005)
!3009 = !DILocation(line: 2798, column: 41, scope: !3005)
!3010 = !DILocation(line: 2798, column: 45, scope: !3005)
!3011 = !DILocation(line: 2800, column: 13, scope: !3012)
!3012 = distinct !DILexicalBlock(scope: !3005, file: !72, line: 2799, column: 2)
!3013 = !DILocation(line: 2801, column: 2, scope: !3012)
!3014 = !DILocation(line: 2804, column: 13, scope: !3015)
!3015 = distinct !DILexicalBlock(scope: !3005, file: !72, line: 2803, column: 2)
!3016 = !DILocation(line: 2807, column: 5, scope: !3017)
!3017 = distinct !DILexicalBlock(scope: !2991, file: !72, line: 2807, column: 5)
!3018 = !DILocation(line: 2807, column: 10, scope: !3017)
!3019 = !DILocation(line: 2807, column: 5, scope: !2991)
!3020 = !DILocation(line: 2809, column: 15, scope: !3021)
!3021 = distinct !DILexicalBlock(scope: !3017, file: !72, line: 2808, column: 2)
!3022 = !DILocation(line: 2809, column: 14, scope: !3021)
!3023 = !DILocation(line: 2809, column: 12, scope: !3021)
!3024 = !DILocation(line: 2810, column: 2, scope: !3021)
!3025 = !DILocation(line: 2813, column: 14, scope: !3026)
!3026 = distinct !DILexicalBlock(scope: !3017, file: !72, line: 2812, column: 2)
!3027 = !DILocation(line: 2813, column: 12, scope: !3026)
!3028 = !DILocation(line: 2816, column: 5, scope: !3029)
!3029 = distinct !DILexicalBlock(scope: !2991, file: !72, line: 2816, column: 5)
!3030 = !DILocation(line: 2816, column: 11, scope: !3029)
!3031 = !DILocation(line: 2816, column: 5, scope: !2991)
!3032 = !DILocation(line: 2818, column: 15, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3029, file: !72, line: 2817, column: 2)
!3034 = !DILocation(line: 2818, column: 14, scope: !3033)
!3035 = !DILocation(line: 2818, column: 12, scope: !3033)
!3036 = !DILocation(line: 2819, column: 2, scope: !3033)
!3037 = !DILocation(line: 2822, column: 14, scope: !3038)
!3038 = distinct !DILexicalBlock(scope: !3029, file: !72, line: 2821, column: 2)
!3039 = !DILocation(line: 2822, column: 12, scope: !3038)
!3040 = !DILocation(line: 2825, column: 25, scope: !2991)
!3041 = !DILocation(line: 2825, column: 35, scope: !2991)
!3042 = !DILocation(line: 2825, column: 13, scope: !2991)
!3043 = !DILocation(line: 2825, column: 11, scope: !2991)
!3044 = !DILocation(line: 2826, column: 5, scope: !3045)
!3045 = distinct !DILexicalBlock(scope: !2991, file: !72, line: 2826, column: 5)
!3046 = !DILocation(line: 2826, column: 15, scope: !3045)
!3047 = !DILocation(line: 2826, column: 5, scope: !2991)
!3048 = !DILocation(line: 2828, column: 10, scope: !3049)
!3049 = distinct !DILexicalBlock(scope: !3045, file: !72, line: 2827, column: 2)
!3050 = !DILocation(line: 2828, column: 3, scope: !3049)
!3051 = !DILocation(line: 2832, column: 11, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3045, file: !72, line: 2831, column: 2)
!3053 = !DILocation(line: 2832, column: 10, scope: !3052)
!3054 = !DILocation(line: 2832, column: 3, scope: !3052)
!3055 = !DILocation(line: 2834, column: 1, scope: !2991)
!3056 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !72, file: !72, line: 2851, type: !3057, scopeLine: 2852, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3057 = !DISubroutineType(types: !3058)
!3058 = !{!736, !736, !17}
!3059 = !DILocalVariable(name: "value", arg: 1, scope: !3056, file: !72, line: 2851, type: !736)
!3060 = !DILocation(line: 2851, column: 29, scope: !3056)
!3061 = !DILocalVariable(name: "factor", arg: 2, scope: !3056, file: !72, line: 2851, type: !17)
!3062 = !DILocation(line: 2851, column: 39, scope: !3056)
!3063 = !DILocalVariable(name: "u32Temp1", scope: !3056, file: !72, line: 2853, type: !736)
!3064 = !DILocation(line: 2853, column: 6, scope: !3056)
!3065 = !DILocalVariable(name: "u32Temp2", scope: !3056, file: !72, line: 2853, type: !736)
!3066 = !DILocation(line: 2853, column: 20, scope: !3056)
!3067 = !DILocation(line: 2854, column: 13, scope: !3056)
!3068 = !DILocation(line: 2854, column: 21, scope: !3056)
!3069 = !DILocation(line: 2854, column: 19, scope: !3056)
!3070 = !DILocation(line: 2854, column: 11, scope: !3056)
!3071 = !DILocation(line: 2855, column: 25, scope: !3056)
!3072 = !DILocation(line: 2855, column: 32, scope: !3056)
!3073 = !DILocation(line: 2855, column: 13, scope: !3056)
!3074 = !DILocation(line: 2855, column: 11, scope: !3056)
!3075 = !DILocation(line: 2856, column: 14, scope: !3056)
!3076 = !DILocation(line: 2856, column: 23, scope: !3056)
!3077 = !DILocation(line: 2856, column: 11, scope: !3056)
!3078 = !DILocation(line: 2857, column: 14, scope: !3056)
!3079 = !DILocation(line: 2857, column: 23, scope: !3056)
!3080 = !DILocation(line: 2857, column: 11, scope: !3056)
!3081 = !DILocation(line: 2858, column: 9, scope: !3056)
!3082 = !DILocation(line: 2858, column: 2, scope: !3056)
!3083 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !72, file: !72, line: 2877, type: !3057, scopeLine: 2878, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3084 = !DILocalVariable(name: "value", arg: 1, scope: !3083, file: !72, line: 2877, type: !736)
!3085 = !DILocation(line: 2877, column: 29, scope: !3083)
!3086 = !DILocalVariable(name: "factor", arg: 2, scope: !3083, file: !72, line: 2877, type: !17)
!3087 = !DILocation(line: 2877, column: 39, scope: !3083)
!3088 = !DILocalVariable(name: "u32Temp1", scope: !3083, file: !72, line: 2879, type: !736)
!3089 = !DILocation(line: 2879, column: 6, scope: !3083)
!3090 = !DILocalVariable(name: "u32Temp2", scope: !3083, file: !72, line: 2879, type: !736)
!3091 = !DILocation(line: 2879, column: 20, scope: !3083)
!3092 = !DILocation(line: 2880, column: 13, scope: !3083)
!3093 = !DILocation(line: 2880, column: 21, scope: !3083)
!3094 = !DILocation(line: 2880, column: 19, scope: !3083)
!3095 = !DILocation(line: 2880, column: 11, scope: !3083)
!3096 = !DILocation(line: 2881, column: 25, scope: !3083)
!3097 = !DILocation(line: 2881, column: 32, scope: !3083)
!3098 = !DILocation(line: 2881, column: 13, scope: !3083)
!3099 = !DILocation(line: 2881, column: 11, scope: !3083)
!3100 = !DILocation(line: 2882, column: 14, scope: !3083)
!3101 = !DILocation(line: 2882, column: 23, scope: !3083)
!3102 = !DILocation(line: 2882, column: 11, scope: !3083)
!3103 = !DILocation(line: 2883, column: 14, scope: !3083)
!3104 = !DILocation(line: 2883, column: 23, scope: !3083)
!3105 = !DILocation(line: 2883, column: 11, scope: !3083)
!3106 = !DILocation(line: 2884, column: 6, scope: !3107)
!3107 = distinct !DILexicalBlock(scope: !3083, file: !72, line: 2884, column: 5)
!3108 = !DILocation(line: 2884, column: 14, scope: !3107)
!3109 = !DILocation(line: 2884, column: 19, scope: !3107)
!3110 = !DILocation(line: 2884, column: 5, scope: !3083)
!3111 = !DILocation(line: 2886, column: 10, scope: !3112)
!3112 = distinct !DILexicalBlock(scope: !3107, file: !72, line: 2885, column: 2)
!3113 = !DILocation(line: 2886, column: 3, scope: !3112)
!3114 = !DILocation(line: 2890, column: 3, scope: !3115)
!3115 = distinct !DILexicalBlock(scope: !3107, file: !72, line: 2889, column: 2)
!3116 = !DILocation(line: 2893, column: 1, scope: !3083)
!3117 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !72, file: !72, line: 2912, type: !3118, scopeLine: 2913, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3118 = !DISubroutineType(types: !3119)
!3119 = !{!736, !736, !6}
!3120 = !DILocalVariable(name: "value", arg: 1, scope: !3117, file: !72, line: 2912, type: !736)
!3121 = !DILocation(line: 2912, column: 29, scope: !3117)
!3122 = !DILocalVariable(name: "factor", arg: 2, scope: !3117, file: !72, line: 2912, type: !6)
!3123 = !DILocation(line: 2912, column: 39, scope: !3117)
!3124 = !DILocalVariable(name: "u32Temp1", scope: !3117, file: !72, line: 2914, type: !736)
!3125 = !DILocation(line: 2914, column: 6, scope: !3117)
!3126 = !DILocalVariable(name: "u32Temp2", scope: !3117, file: !72, line: 2914, type: !736)
!3127 = !DILocation(line: 2914, column: 20, scope: !3117)
!3128 = !DILocation(line: 2915, column: 5, scope: !3129)
!3129 = distinct !DILexicalBlock(scope: !3117, file: !72, line: 2915, column: 5)
!3130 = !DILocation(line: 2915, column: 12, scope: !3129)
!3131 = !DILocation(line: 2915, column: 5, scope: !3117)
!3132 = !DILocation(line: 2918, column: 14, scope: !3133)
!3133 = distinct !DILexicalBlock(scope: !3129, file: !72, line: 2916, column: 2)
!3134 = !DILocation(line: 2918, column: 22, scope: !3133)
!3135 = !DILocation(line: 2918, column: 20, scope: !3133)
!3136 = !DILocation(line: 2918, column: 12, scope: !3133)
!3137 = !DILocation(line: 2919, column: 26, scope: !3133)
!3138 = !DILocation(line: 2919, column: 33, scope: !3133)
!3139 = !DILocation(line: 2919, column: 14, scope: !3133)
!3140 = !DILocation(line: 2919, column: 12, scope: !3133)
!3141 = !DILocation(line: 2920, column: 14, scope: !3133)
!3142 = !DILocation(line: 2920, column: 23, scope: !3133)
!3143 = !DILocation(line: 2920, column: 12, scope: !3133)
!3144 = !DILocation(line: 2921, column: 15, scope: !3133)
!3145 = !DILocation(line: 2921, column: 24, scope: !3133)
!3146 = !DILocation(line: 2921, column: 12, scope: !3133)
!3147 = !DILocation(line: 2922, column: 10, scope: !3133)
!3148 = !DILocation(line: 2922, column: 3, scope: !3133)
!3149 = !DILocation(line: 2926, column: 3, scope: !3150)
!3150 = distinct !DILexicalBlock(scope: !3129, file: !72, line: 2925, column: 2)
!3151 = !DILocation(line: 2928, column: 1, scope: !3117)
!3152 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !72, file: !72, line: 2947, type: !3118, scopeLine: 2948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3153 = !DILocalVariable(name: "value", arg: 1, scope: !3152, file: !72, line: 2947, type: !736)
!3154 = !DILocation(line: 2947, column: 29, scope: !3152)
!3155 = !DILocalVariable(name: "factor", arg: 2, scope: !3152, file: !72, line: 2947, type: !6)
!3156 = !DILocation(line: 2947, column: 39, scope: !3152)
!3157 = !DILocalVariable(name: "u32Temp1", scope: !3152, file: !72, line: 2949, type: !736)
!3158 = !DILocation(line: 2949, column: 6, scope: !3152)
!3159 = !DILocalVariable(name: "u32Temp2", scope: !3152, file: !72, line: 2949, type: !736)
!3160 = !DILocation(line: 2949, column: 20, scope: !3152)
!3161 = !DILocation(line: 2950, column: 5, scope: !3162)
!3162 = distinct !DILexicalBlock(scope: !3152, file: !72, line: 2950, column: 5)
!3163 = !DILocation(line: 2950, column: 12, scope: !3162)
!3164 = !DILocation(line: 2950, column: 5, scope: !3152)
!3165 = !DILocation(line: 2952, column: 3, scope: !3166)
!3166 = distinct !DILexicalBlock(scope: !3162, file: !72, line: 2951, column: 2)
!3167 = !DILocation(line: 2956, column: 14, scope: !3168)
!3168 = distinct !DILexicalBlock(scope: !3162, file: !72, line: 2955, column: 2)
!3169 = !DILocation(line: 2956, column: 22, scope: !3168)
!3170 = !DILocation(line: 2956, column: 20, scope: !3168)
!3171 = !DILocation(line: 2956, column: 12, scope: !3168)
!3172 = !DILocation(line: 2957, column: 26, scope: !3168)
!3173 = !DILocation(line: 2957, column: 33, scope: !3168)
!3174 = !DILocation(line: 2957, column: 14, scope: !3168)
!3175 = !DILocation(line: 2957, column: 12, scope: !3168)
!3176 = !DILocation(line: 2958, column: 14, scope: !3168)
!3177 = !DILocation(line: 2958, column: 23, scope: !3168)
!3178 = !DILocation(line: 2958, column: 12, scope: !3168)
!3179 = !DILocation(line: 2959, column: 15, scope: !3168)
!3180 = !DILocation(line: 2959, column: 24, scope: !3168)
!3181 = !DILocation(line: 2959, column: 12, scope: !3168)
!3182 = !DILocation(line: 2960, column: 7, scope: !3183)
!3183 = distinct !DILexicalBlock(scope: !3168, file: !72, line: 2960, column: 6)
!3184 = !DILocation(line: 2960, column: 16, scope: !3183)
!3185 = !DILocation(line: 2960, column: 22, scope: !3183)
!3186 = !DILocation(line: 2960, column: 6, scope: !3168)
!3187 = !DILocation(line: 2962, column: 11, scope: !3188)
!3188 = distinct !DILexicalBlock(scope: !3183, file: !72, line: 2961, column: 3)
!3189 = !DILocation(line: 2962, column: 4, scope: !3188)
!3190 = !DILocation(line: 2966, column: 4, scope: !3191)
!3191 = distinct !DILexicalBlock(scope: !3183, file: !72, line: 2965, column: 3)
!3192 = !DILocation(line: 2969, column: 1, scope: !3152)
!3193 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !72, file: !72, line: 2991, type: !301, scopeLine: 2992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3194 = !DILocalVariable(name: "value", arg: 1, scope: !3193, file: !72, line: 2991, type: !13)
!3195 = !DILocation(line: 2991, column: 33, scope: !3193)
!3196 = !DILocalVariable(name: "factor", arg: 2, scope: !3193, file: !72, line: 2991, type: !13)
!3197 = !DILocation(line: 2991, column: 44, scope: !3193)
!3198 = !DILocation(line: 2993, column: 40, scope: !3193)
!3199 = !DILocation(line: 2993, column: 46, scope: !3193)
!3200 = !DILocation(line: 2993, column: 9, scope: !3193)
!3201 = !DILocation(line: 2993, column: 2, scope: !3193)
!3202 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !72, file: !72, line: 3015, type: !301, scopeLine: 3016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3203 = !DILocalVariable(name: "value", arg: 1, scope: !3202, file: !72, line: 3015, type: !13)
!3204 = !DILocation(line: 3015, column: 33, scope: !3202)
!3205 = !DILocalVariable(name: "factor", arg: 2, scope: !3202, file: !72, line: 3015, type: !13)
!3206 = !DILocation(line: 3015, column: 44, scope: !3202)
!3207 = !DILocation(line: 3017, column: 41, scope: !3202)
!3208 = !DILocation(line: 3017, column: 47, scope: !3202)
!3209 = !DILocation(line: 3017, column: 10, scope: !3202)
!3210 = !DILocation(line: 3017, column: 3, scope: !3202)
!3211 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !72, file: !72, line: 3040, type: !301, scopeLine: 3041, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3212 = !DILocalVariable(name: "value", arg: 1, scope: !3211, file: !72, line: 3040, type: !13)
!3213 = !DILocation(line: 3040, column: 32, scope: !3211)
!3214 = !DILocalVariable(name: "factor", arg: 2, scope: !3211, file: !72, line: 3040, type: !13)
!3215 = !DILocation(line: 3040, column: 43, scope: !3211)
!3216 = !DILocation(line: 3042, column: 41, scope: !3211)
!3217 = !DILocation(line: 3042, column: 47, scope: !3211)
!3218 = !DILocation(line: 3042, column: 10, scope: !3211)
!3219 = !DILocation(line: 3042, column: 3, scope: !3211)
!3220 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !72, file: !72, line: 3065, type: !301, scopeLine: 3066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3221 = !DILocalVariable(name: "value", arg: 1, scope: !3220, file: !72, line: 3065, type: !13)
!3222 = !DILocation(line: 3065, column: 34, scope: !3220)
!3223 = !DILocalVariable(name: "factor", arg: 2, scope: !3220, file: !72, line: 3065, type: !13)
!3224 = !DILocation(line: 3065, column: 45, scope: !3220)
!3225 = !DILocation(line: 3067, column: 44, scope: !3220)
!3226 = !DILocation(line: 3067, column: 50, scope: !3220)
!3227 = !DILocation(line: 3067, column: 10, scope: !3220)
!3228 = !DILocation(line: 3067, column: 3, scope: !3220)
!3229 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !72, file: !72, line: 3090, type: !301, scopeLine: 3091, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3230 = !DILocalVariable(name: "value", arg: 1, scope: !3229, file: !72, line: 3090, type: !13)
!3231 = !DILocation(line: 3090, column: 33, scope: !3229)
!3232 = !DILocalVariable(name: "factor", arg: 2, scope: !3229, file: !72, line: 3090, type: !13)
!3233 = !DILocation(line: 3090, column: 44, scope: !3229)
!3234 = !DILocation(line: 3092, column: 44, scope: !3229)
!3235 = !DILocation(line: 3092, column: 50, scope: !3229)
!3236 = !DILocation(line: 3092, column: 10, scope: !3229)
!3237 = !DILocation(line: 3092, column: 3, scope: !3229)
!3238 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !72, file: !72, line: 3115, type: !301, scopeLine: 3116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3239 = !DILocalVariable(name: "value", arg: 1, scope: !3238, file: !72, line: 3115, type: !13)
!3240 = !DILocation(line: 3115, column: 31, scope: !3238)
!3241 = !DILocalVariable(name: "factor", arg: 2, scope: !3238, file: !72, line: 3115, type: !13)
!3242 = !DILocation(line: 3115, column: 42, scope: !3238)
!3243 = !DILocation(line: 3117, column: 44, scope: !3238)
!3244 = !DILocation(line: 3117, column: 50, scope: !3238)
!3245 = !DILocation(line: 3117, column: 10, scope: !3238)
!3246 = !DILocation(line: 3117, column: 3, scope: !3238)
!3247 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !72, file: !72, line: 3140, type: !301, scopeLine: 3141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3248 = !DILocalVariable(name: "value", arg: 1, scope: !3247, file: !72, line: 3140, type: !13)
!3249 = !DILocation(line: 3140, column: 33, scope: !3247)
!3250 = !DILocalVariable(name: "factor", arg: 2, scope: !3247, file: !72, line: 3140, type: !13)
!3251 = !DILocation(line: 3140, column: 44, scope: !3247)
!3252 = !DILocation(line: 3142, column: 44, scope: !3247)
!3253 = !DILocation(line: 3142, column: 50, scope: !3247)
!3254 = !DILocation(line: 3142, column: 10, scope: !3247)
!3255 = !DILocation(line: 3142, column: 3, scope: !3247)
!3256 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !72, file: !72, line: 3165, type: !301, scopeLine: 3166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3257 = !DILocalVariable(name: "value", arg: 1, scope: !3256, file: !72, line: 3165, type: !13)
!3258 = !DILocation(line: 3165, column: 32, scope: !3256)
!3259 = !DILocalVariable(name: "factor", arg: 2, scope: !3256, file: !72, line: 3165, type: !13)
!3260 = !DILocation(line: 3165, column: 43, scope: !3256)
!3261 = !DILocation(line: 3167, column: 44, scope: !3256)
!3262 = !DILocation(line: 3167, column: 50, scope: !3256)
!3263 = !DILocation(line: 3167, column: 10, scope: !3256)
!3264 = !DILocation(line: 3167, column: 3, scope: !3256)
!3265 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !72, file: !72, line: 3189, type: !301, scopeLine: 3190, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3266 = !DILocalVariable(name: "value", arg: 1, scope: !3265, file: !72, line: 3189, type: !13)
!3267 = !DILocation(line: 3189, column: 31, scope: !3265)
!3268 = !DILocalVariable(name: "factor", arg: 2, scope: !3265, file: !72, line: 3189, type: !13)
!3269 = !DILocation(line: 3189, column: 42, scope: !3265)
!3270 = !DILocation(line: 3191, column: 44, scope: !3265)
!3271 = !DILocation(line: 3191, column: 50, scope: !3265)
!3272 = !DILocation(line: 3191, column: 10, scope: !3265)
!3273 = !DILocation(line: 3191, column: 3, scope: !3265)
!3274 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !72, file: !72, line: 3213, type: !301, scopeLine: 3214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3275 = !DILocalVariable(name: "value", arg: 1, scope: !3274, file: !72, line: 3213, type: !13)
!3276 = !DILocation(line: 3213, column: 30, scope: !3274)
!3277 = !DILocalVariable(name: "factor", arg: 2, scope: !3274, file: !72, line: 3213, type: !13)
!3278 = !DILocation(line: 3213, column: 41, scope: !3274)
!3279 = !DILocation(line: 3215, column: 44, scope: !3274)
!3280 = !DILocation(line: 3215, column: 50, scope: !3274)
!3281 = !DILocation(line: 3215, column: 10, scope: !3274)
!3282 = !DILocation(line: 3215, column: 3, scope: !3274)
!3283 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !72, file: !72, line: 3237, type: !301, scopeLine: 3238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3284 = !DILocalVariable(name: "value", arg: 1, scope: !3283, file: !72, line: 3237, type: !13)
!3285 = !DILocation(line: 3237, column: 33, scope: !3283)
!3286 = !DILocalVariable(name: "factor", arg: 2, scope: !3283, file: !72, line: 3237, type: !13)
!3287 = !DILocation(line: 3237, column: 44, scope: !3283)
!3288 = !DILocation(line: 3239, column: 44, scope: !3283)
!3289 = !DILocation(line: 3239, column: 50, scope: !3283)
!3290 = !DILocation(line: 3239, column: 10, scope: !3283)
!3291 = !DILocation(line: 3239, column: 3, scope: !3283)
!3292 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !72, file: !72, line: 3261, type: !301, scopeLine: 3262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3293 = !DILocalVariable(name: "value", arg: 1, scope: !3292, file: !72, line: 3261, type: !13)
!3294 = !DILocation(line: 3261, column: 32, scope: !3292)
!3295 = !DILocalVariable(name: "factor", arg: 2, scope: !3292, file: !72, line: 3261, type: !13)
!3296 = !DILocation(line: 3261, column: 43, scope: !3292)
!3297 = !DILocation(line: 3263, column: 44, scope: !3292)
!3298 = !DILocation(line: 3263, column: 50, scope: !3292)
!3299 = !DILocation(line: 3263, column: 10, scope: !3292)
!3300 = !DILocation(line: 3263, column: 3, scope: !3292)
!3301 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !72, file: !72, line: 3285, type: !301, scopeLine: 3286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3302 = !DILocalVariable(name: "value", arg: 1, scope: !3301, file: !72, line: 3285, type: !13)
!3303 = !DILocation(line: 3285, column: 31, scope: !3301)
!3304 = !DILocalVariable(name: "factor", arg: 2, scope: !3301, file: !72, line: 3285, type: !13)
!3305 = !DILocation(line: 3285, column: 42, scope: !3301)
!3306 = !DILocation(line: 3287, column: 44, scope: !3301)
!3307 = !DILocation(line: 3287, column: 50, scope: !3301)
!3308 = !DILocation(line: 3287, column: 10, scope: !3301)
!3309 = !DILocation(line: 3287, column: 3, scope: !3301)
!3310 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !72, file: !72, line: 3309, type: !301, scopeLine: 3310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3311 = !DILocalVariable(name: "value", arg: 1, scope: !3310, file: !72, line: 3309, type: !13)
!3312 = !DILocation(line: 3309, column: 30, scope: !3310)
!3313 = !DILocalVariable(name: "factor", arg: 2, scope: !3310, file: !72, line: 3309, type: !13)
!3314 = !DILocation(line: 3309, column: 41, scope: !3310)
!3315 = !DILocation(line: 3311, column: 44, scope: !3310)
!3316 = !DILocation(line: 3311, column: 50, scope: !3310)
!3317 = !DILocation(line: 3311, column: 10, scope: !3310)
!3318 = !DILocation(line: 3311, column: 3, scope: !3310)
!3319 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !72, file: !72, line: 3332, type: !390, scopeLine: 3333, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3320 = !DILocalVariable(name: "value", arg: 1, scope: !3319, file: !72, line: 3332, type: !13)
!3321 = !DILocation(line: 3332, column: 33, scope: !3319)
!3322 = !DILocalVariable(name: "factor", arg: 2, scope: !3319, file: !72, line: 3332, type: !22)
!3323 = !DILocation(line: 3332, column: 44, scope: !3319)
!3324 = !DILocation(line: 3334, column: 41, scope: !3319)
!3325 = !DILocation(line: 3334, column: 47, scope: !3319)
!3326 = !DILocation(line: 3334, column: 10, scope: !3319)
!3327 = !DILocation(line: 3334, column: 3, scope: !3319)
!3328 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !72, file: !72, line: 3355, type: !390, scopeLine: 3356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3329 = !DILocalVariable(name: "value", arg: 1, scope: !3328, file: !72, line: 3355, type: !13)
!3330 = !DILocation(line: 3355, column: 32, scope: !3328)
!3331 = !DILocalVariable(name: "factor", arg: 2, scope: !3328, file: !72, line: 3355, type: !22)
!3332 = !DILocation(line: 3355, column: 43, scope: !3328)
!3333 = !DILocation(line: 3357, column: 33, scope: !3328)
!3334 = !DILocation(line: 3357, column: 39, scope: !3328)
!3335 = !DILocation(line: 3357, column: 2, scope: !3328)
!3336 = !DILocation(line: 3358, column: 1, scope: !3328)
!3337 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !72, file: !72, line: 3379, type: !390, scopeLine: 3380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3338 = !DILocalVariable(name: "value", arg: 1, scope: !3337, file: !72, line: 3379, type: !13)
!3339 = !DILocation(line: 3379, column: 31, scope: !3337)
!3340 = !DILocalVariable(name: "factor", arg: 2, scope: !3337, file: !72, line: 3379, type: !22)
!3341 = !DILocation(line: 3379, column: 42, scope: !3337)
!3342 = !DILocation(line: 3381, column: 41, scope: !3337)
!3343 = !DILocation(line: 3381, column: 47, scope: !3337)
!3344 = !DILocation(line: 3381, column: 10, scope: !3337)
!3345 = !DILocation(line: 3381, column: 3, scope: !3337)
!3346 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !72, file: !72, line: 3404, type: !390, scopeLine: 3405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3347 = !DILocalVariable(name: "value", arg: 1, scope: !3346, file: !72, line: 3404, type: !13)
!3348 = !DILocation(line: 3404, column: 33, scope: !3346)
!3349 = !DILocalVariable(name: "factor", arg: 2, scope: !3346, file: !72, line: 3404, type: !22)
!3350 = !DILocation(line: 3404, column: 44, scope: !3346)
!3351 = !DILocation(line: 3406, column: 44, scope: !3346)
!3352 = !DILocation(line: 3406, column: 50, scope: !3346)
!3353 = !DILocation(line: 3406, column: 10, scope: !3346)
!3354 = !DILocation(line: 3406, column: 3, scope: !3346)
!3355 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !72, file: !72, line: 3429, type: !390, scopeLine: 3430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3356 = !DILocalVariable(name: "value", arg: 1, scope: !3355, file: !72, line: 3429, type: !13)
!3357 = !DILocation(line: 3429, column: 32, scope: !3355)
!3358 = !DILocalVariable(name: "factor", arg: 2, scope: !3355, file: !72, line: 3429, type: !22)
!3359 = !DILocation(line: 3429, column: 43, scope: !3355)
!3360 = !DILocation(line: 3431, column: 44, scope: !3355)
!3361 = !DILocation(line: 3431, column: 50, scope: !3355)
!3362 = !DILocation(line: 3431, column: 10, scope: !3355)
!3363 = !DILocation(line: 3431, column: 3, scope: !3355)
!3364 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !72, file: !72, line: 3454, type: !390, scopeLine: 3455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3365 = !DILocalVariable(name: "value", arg: 1, scope: !3364, file: !72, line: 3454, type: !13)
!3366 = !DILocation(line: 3454, column: 31, scope: !3364)
!3367 = !DILocalVariable(name: "factor", arg: 2, scope: !3364, file: !72, line: 3454, type: !22)
!3368 = !DILocation(line: 3454, column: 42, scope: !3364)
!3369 = !DILocation(line: 3456, column: 44, scope: !3364)
!3370 = !DILocation(line: 3456, column: 50, scope: !3364)
!3371 = !DILocation(line: 3456, column: 10, scope: !3364)
!3372 = !DILocation(line: 3456, column: 3, scope: !3364)
!3373 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !72, file: !72, line: 3479, type: !390, scopeLine: 3480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3374 = !DILocalVariable(name: "value", arg: 1, scope: !3373, file: !72, line: 3479, type: !13)
!3375 = !DILocation(line: 3479, column: 33, scope: !3373)
!3376 = !DILocalVariable(name: "factor", arg: 2, scope: !3373, file: !72, line: 3479, type: !22)
!3377 = !DILocation(line: 3479, column: 44, scope: !3373)
!3378 = !DILocation(line: 3481, column: 44, scope: !3373)
!3379 = !DILocation(line: 3481, column: 50, scope: !3373)
!3380 = !DILocation(line: 3481, column: 10, scope: !3373)
!3381 = !DILocation(line: 3481, column: 3, scope: !3373)
!3382 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !72, file: !72, line: 3504, type: !390, scopeLine: 3505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3383 = !DILocalVariable(name: "value", arg: 1, scope: !3382, file: !72, line: 3504, type: !13)
!3384 = !DILocation(line: 3504, column: 32, scope: !3382)
!3385 = !DILocalVariable(name: "factor", arg: 2, scope: !3382, file: !72, line: 3504, type: !22)
!3386 = !DILocation(line: 3504, column: 43, scope: !3382)
!3387 = !DILocation(line: 3506, column: 44, scope: !3382)
!3388 = !DILocation(line: 3506, column: 50, scope: !3382)
!3389 = !DILocation(line: 3506, column: 10, scope: !3382)
!3390 = !DILocation(line: 3506, column: 3, scope: !3382)
!3391 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !72, file: !72, line: 3528, type: !390, scopeLine: 3529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3392 = !DILocalVariable(name: "value", arg: 1, scope: !3391, file: !72, line: 3528, type: !13)
!3393 = !DILocation(line: 3528, column: 31, scope: !3391)
!3394 = !DILocalVariable(name: "factor", arg: 2, scope: !3391, file: !72, line: 3528, type: !22)
!3395 = !DILocation(line: 3528, column: 42, scope: !3391)
!3396 = !DILocation(line: 3530, column: 44, scope: !3391)
!3397 = !DILocation(line: 3530, column: 50, scope: !3391)
!3398 = !DILocation(line: 3530, column: 10, scope: !3391)
!3399 = !DILocation(line: 3530, column: 3, scope: !3391)
!3400 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !72, file: !72, line: 3552, type: !390, scopeLine: 3553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3401 = !DILocalVariable(name: "value", arg: 1, scope: !3400, file: !72, line: 3552, type: !13)
!3402 = !DILocation(line: 3552, column: 30, scope: !3400)
!3403 = !DILocalVariable(name: "factor", arg: 2, scope: !3400, file: !72, line: 3552, type: !22)
!3404 = !DILocation(line: 3552, column: 41, scope: !3400)
!3405 = !DILocation(line: 3554, column: 44, scope: !3400)
!3406 = !DILocation(line: 3554, column: 50, scope: !3400)
!3407 = !DILocation(line: 3554, column: 10, scope: !3400)
!3408 = !DILocation(line: 3554, column: 3, scope: !3400)
!3409 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !72, file: !72, line: 3576, type: !390, scopeLine: 3577, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3410 = !DILocalVariable(name: "value", arg: 1, scope: !3409, file: !72, line: 3576, type: !13)
!3411 = !DILocation(line: 3576, column: 33, scope: !3409)
!3412 = !DILocalVariable(name: "factor", arg: 2, scope: !3409, file: !72, line: 3576, type: !22)
!3413 = !DILocation(line: 3576, column: 44, scope: !3409)
!3414 = !DILocation(line: 3578, column: 44, scope: !3409)
!3415 = !DILocation(line: 3578, column: 50, scope: !3409)
!3416 = !DILocation(line: 3578, column: 10, scope: !3409)
!3417 = !DILocation(line: 3578, column: 3, scope: !3409)
!3418 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !72, file: !72, line: 3600, type: !390, scopeLine: 3601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3419 = !DILocalVariable(name: "value", arg: 1, scope: !3418, file: !72, line: 3600, type: !13)
!3420 = !DILocation(line: 3600, column: 32, scope: !3418)
!3421 = !DILocalVariable(name: "factor", arg: 2, scope: !3418, file: !72, line: 3600, type: !22)
!3422 = !DILocation(line: 3600, column: 43, scope: !3418)
!3423 = !DILocation(line: 3602, column: 44, scope: !3418)
!3424 = !DILocation(line: 3602, column: 50, scope: !3418)
!3425 = !DILocation(line: 3602, column: 10, scope: !3418)
!3426 = !DILocation(line: 3602, column: 3, scope: !3418)
!3427 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !72, file: !72, line: 3624, type: !390, scopeLine: 3625, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3428 = !DILocalVariable(name: "value", arg: 1, scope: !3427, file: !72, line: 3624, type: !13)
!3429 = !DILocation(line: 3624, column: 31, scope: !3427)
!3430 = !DILocalVariable(name: "factor", arg: 2, scope: !3427, file: !72, line: 3624, type: !22)
!3431 = !DILocation(line: 3624, column: 42, scope: !3427)
!3432 = !DILocation(line: 3626, column: 44, scope: !3427)
!3433 = !DILocation(line: 3626, column: 50, scope: !3427)
!3434 = !DILocation(line: 3626, column: 10, scope: !3427)
!3435 = !DILocation(line: 3626, column: 3, scope: !3427)
!3436 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !72, file: !72, line: 3648, type: !390, scopeLine: 3649, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3437 = !DILocalVariable(name: "value", arg: 1, scope: !3436, file: !72, line: 3648, type: !13)
!3438 = !DILocation(line: 3648, column: 30, scope: !3436)
!3439 = !DILocalVariable(name: "factor", arg: 2, scope: !3436, file: !72, line: 3648, type: !22)
!3440 = !DILocation(line: 3648, column: 41, scope: !3436)
!3441 = !DILocation(line: 3650, column: 44, scope: !3436)
!3442 = !DILocation(line: 3650, column: 50, scope: !3436)
!3443 = !DILocation(line: 3650, column: 10, scope: !3436)
!3444 = !DILocation(line: 3650, column: 3, scope: !3436)
!3445 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !72, file: !72, line: 3670, type: !475, scopeLine: 3671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3446 = !DILocalVariable(name: "value", arg: 1, scope: !3445, file: !72, line: 3670, type: !13)
!3447 = !DILocation(line: 3670, column: 32, scope: !3445)
!3448 = !DILocalVariable(name: "factor", arg: 2, scope: !3445, file: !72, line: 3670, type: !17)
!3449 = !DILocation(line: 3670, column: 42, scope: !3445)
!3450 = !DILocation(line: 3672, column: 40, scope: !3445)
!3451 = !DILocation(line: 3672, column: 58, scope: !3445)
!3452 = !DILocation(line: 3672, column: 52, scope: !3445)
!3453 = !DILocation(line: 3672, column: 66, scope: !3445)
!3454 = !DILocation(line: 3672, column: 46, scope: !3445)
!3455 = !DILocation(line: 3672, column: 10, scope: !3445)
!3456 = !DILocation(line: 3672, column: 3, scope: !3445)
!3457 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !72, file: !72, line: 3692, type: !475, scopeLine: 3693, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3458 = !DILocalVariable(name: "value", arg: 1, scope: !3457, file: !72, line: 3692, type: !13)
!3459 = !DILocation(line: 3692, column: 31, scope: !3457)
!3460 = !DILocalVariable(name: "factor", arg: 2, scope: !3457, file: !72, line: 3692, type: !17)
!3461 = !DILocation(line: 3692, column: 41, scope: !3457)
!3462 = !DILocation(line: 3694, column: 40, scope: !3457)
!3463 = !DILocation(line: 3694, column: 58, scope: !3457)
!3464 = !DILocation(line: 3694, column: 52, scope: !3457)
!3465 = !DILocation(line: 3694, column: 66, scope: !3457)
!3466 = !DILocation(line: 3694, column: 46, scope: !3457)
!3467 = !DILocation(line: 3694, column: 10, scope: !3457)
!3468 = !DILocation(line: 3694, column: 3, scope: !3457)
!3469 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !72, file: !72, line: 3715, type: !475, scopeLine: 3716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3470 = !DILocalVariable(name: "value", arg: 1, scope: !3469, file: !72, line: 3715, type: !13)
!3471 = !DILocation(line: 3715, column: 30, scope: !3469)
!3472 = !DILocalVariable(name: "factor", arg: 2, scope: !3469, file: !72, line: 3715, type: !17)
!3473 = !DILocation(line: 3715, column: 40, scope: !3469)
!3474 = !DILocation(line: 3717, column: 40, scope: !3469)
!3475 = !DILocation(line: 3717, column: 58, scope: !3469)
!3476 = !DILocation(line: 3717, column: 52, scope: !3469)
!3477 = !DILocation(line: 3717, column: 66, scope: !3469)
!3478 = !DILocation(line: 3717, column: 46, scope: !3469)
!3479 = !DILocation(line: 3717, column: 10, scope: !3469)
!3480 = !DILocation(line: 3717, column: 3, scope: !3469)
!3481 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !72, file: !72, line: 3738, type: !475, scopeLine: 3739, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3482 = !DILocalVariable(name: "value", arg: 1, scope: !3481, file: !72, line: 3738, type: !13)
!3483 = !DILocation(line: 3738, column: 31, scope: !3481)
!3484 = !DILocalVariable(name: "factor", arg: 2, scope: !3481, file: !72, line: 3738, type: !17)
!3485 = !DILocation(line: 3738, column: 41, scope: !3481)
!3486 = !DILocation(line: 3740, column: 43, scope: !3481)
!3487 = !DILocation(line: 3740, column: 61, scope: !3481)
!3488 = !DILocation(line: 3740, column: 55, scope: !3481)
!3489 = !DILocation(line: 3740, column: 69, scope: !3481)
!3490 = !DILocation(line: 3740, column: 49, scope: !3481)
!3491 = !DILocation(line: 3740, column: 10, scope: !3481)
!3492 = !DILocation(line: 3740, column: 3, scope: !3481)
!3493 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !72, file: !72, line: 3761, type: !475, scopeLine: 3762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3494 = !DILocalVariable(name: "value", arg: 1, scope: !3493, file: !72, line: 3761, type: !13)
!3495 = !DILocation(line: 3761, column: 30, scope: !3493)
!3496 = !DILocalVariable(name: "factor", arg: 2, scope: !3493, file: !72, line: 3761, type: !17)
!3497 = !DILocation(line: 3761, column: 40, scope: !3493)
!3498 = !DILocation(line: 3763, column: 43, scope: !3493)
!3499 = !DILocation(line: 3763, column: 61, scope: !3493)
!3500 = !DILocation(line: 3763, column: 55, scope: !3493)
!3501 = !DILocation(line: 3763, column: 69, scope: !3493)
!3502 = !DILocation(line: 3763, column: 49, scope: !3493)
!3503 = !DILocation(line: 3763, column: 10, scope: !3493)
!3504 = !DILocation(line: 3763, column: 3, scope: !3493)
!3505 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !72, file: !72, line: 3783, type: !475, scopeLine: 3784, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3506 = !DILocalVariable(name: "value", arg: 1, scope: !3505, file: !72, line: 3783, type: !13)
!3507 = !DILocation(line: 3783, column: 30, scope: !3505)
!3508 = !DILocalVariable(name: "factor", arg: 2, scope: !3505, file: !72, line: 3783, type: !17)
!3509 = !DILocation(line: 3783, column: 40, scope: !3505)
!3510 = !DILocation(line: 3785, column: 43, scope: !3505)
!3511 = !DILocation(line: 3785, column: 61, scope: !3505)
!3512 = !DILocation(line: 3785, column: 55, scope: !3505)
!3513 = !DILocation(line: 3785, column: 69, scope: !3505)
!3514 = !DILocation(line: 3785, column: 49, scope: !3505)
!3515 = !DILocation(line: 3785, column: 10, scope: !3505)
!3516 = !DILocation(line: 3785, column: 3, scope: !3505)
!3517 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !72, file: !72, line: 3805, type: !475, scopeLine: 3806, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3518 = !DILocalVariable(name: "value", arg: 1, scope: !3517, file: !72, line: 3805, type: !13)
!3519 = !DILocation(line: 3805, column: 29, scope: !3517)
!3520 = !DILocalVariable(name: "factor", arg: 2, scope: !3517, file: !72, line: 3805, type: !17)
!3521 = !DILocation(line: 3805, column: 39, scope: !3517)
!3522 = !DILocation(line: 3807, column: 43, scope: !3517)
!3523 = !DILocation(line: 3807, column: 61, scope: !3517)
!3524 = !DILocation(line: 3807, column: 55, scope: !3517)
!3525 = !DILocation(line: 3807, column: 69, scope: !3517)
!3526 = !DILocation(line: 3807, column: 49, scope: !3517)
!3527 = !DILocation(line: 3807, column: 10, scope: !3517)
!3528 = !DILocation(line: 3807, column: 3, scope: !3517)
!3529 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !72, file: !72, line: 3827, type: !475, scopeLine: 3828, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3530 = !DILocalVariable(name: "value", arg: 1, scope: !3529, file: !72, line: 3827, type: !13)
!3531 = !DILocation(line: 3827, column: 30, scope: !3529)
!3532 = !DILocalVariable(name: "factor", arg: 2, scope: !3529, file: !72, line: 3827, type: !17)
!3533 = !DILocation(line: 3827, column: 40, scope: !3529)
!3534 = !DILocation(line: 3829, column: 43, scope: !3529)
!3535 = !DILocation(line: 3829, column: 61, scope: !3529)
!3536 = !DILocation(line: 3829, column: 55, scope: !3529)
!3537 = !DILocation(line: 3829, column: 69, scope: !3529)
!3538 = !DILocation(line: 3829, column: 49, scope: !3529)
!3539 = !DILocation(line: 3829, column: 10, scope: !3529)
!3540 = !DILocation(line: 3829, column: 3, scope: !3529)
!3541 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !72, file: !72, line: 3849, type: !475, scopeLine: 3850, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3542 = !DILocalVariable(name: "value", arg: 1, scope: !3541, file: !72, line: 3849, type: !13)
!3543 = !DILocation(line: 3849, column: 29, scope: !3541)
!3544 = !DILocalVariable(name: "factor", arg: 2, scope: !3541, file: !72, line: 3849, type: !17)
!3545 = !DILocation(line: 3849, column: 39, scope: !3541)
!3546 = !DILocation(line: 3851, column: 43, scope: !3541)
!3547 = !DILocation(line: 3851, column: 61, scope: !3541)
!3548 = !DILocation(line: 3851, column: 55, scope: !3541)
!3549 = !DILocation(line: 3851, column: 69, scope: !3541)
!3550 = !DILocation(line: 3851, column: 49, scope: !3541)
!3551 = !DILocation(line: 3851, column: 10, scope: !3541)
!3552 = !DILocation(line: 3851, column: 3, scope: !3541)
!3553 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !72, file: !72, line: 3873, type: !1870, scopeLine: 3874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3554 = !DILocalVariable(name: "value", arg: 1, scope: !3553, file: !72, line: 3873, type: !80)
!3555 = !DILocation(line: 3873, column: 31, scope: !3553)
!3556 = !DILocalVariable(name: "factor", arg: 2, scope: !3553, file: !72, line: 3873, type: !13)
!3557 = !DILocation(line: 3873, column: 42, scope: !3553)
!3558 = !DILocation(line: 3875, column: 41, scope: !3553)
!3559 = !DILocation(line: 3875, column: 47, scope: !3553)
!3560 = !DILocation(line: 3875, column: 10, scope: !3553)
!3561 = !DILocation(line: 3875, column: 3, scope: !3553)
!3562 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !72, file: !72, line: 5069, type: !3563, scopeLine: 5070, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3563 = !DISubroutineType(types: !3564)
!3564 = !{!80, !80, !13, !736}
!3565 = !DILocalVariable(name: "value", arg: 1, scope: !3562, file: !72, line: 5069, type: !80)
!3566 = !DILocation(line: 5069, column: 40, scope: !3562)
!3567 = !DILocalVariable(name: "factor", arg: 2, scope: !3562, file: !72, line: 5069, type: !13)
!3568 = !DILocation(line: 5069, column: 51, scope: !3562)
!3569 = !DILocalVariable(name: "count", arg: 3, scope: !3562, file: !72, line: 5069, type: !736)
!3570 = !DILocation(line: 5069, column: 63, scope: !3562)
!3571 = !DILocalVariable(name: "u32Temp1", scope: !3562, file: !72, line: 5071, type: !736)
!3572 = !DILocation(line: 5071, column: 6, scope: !3562)
!3573 = !DILocalVariable(name: "u32Temp2", scope: !3562, file: !72, line: 5071, type: !736)
!3574 = !DILocation(line: 5071, column: 17, scope: !3562)
!3575 = !DILocalVariable(name: "u32Temp3", scope: !3562, file: !72, line: 5071, type: !736)
!3576 = !DILocation(line: 5071, column: 26, scope: !3562)
!3577 = !DILocalVariable(name: "u32Temp4", scope: !3562, file: !72, line: 5071, type: !736)
!3578 = !DILocation(line: 5071, column: 35, scope: !3562)
!3579 = !DILocalVariable(name: "u8SignBit", scope: !3562, file: !72, line: 5072, type: !17)
!3580 = !DILocation(line: 5072, column: 5, scope: !3562)
!3581 = !DILocation(line: 5074, column: 7, scope: !3582)
!3582 = distinct !DILexicalBlock(scope: !3562, file: !72, line: 5074, column: 5)
!3583 = !DILocation(line: 5074, column: 12, scope: !3582)
!3584 = !DILocation(line: 5074, column: 16, scope: !3582)
!3585 = !DILocation(line: 5074, column: 20, scope: !3582)
!3586 = !DILocation(line: 5074, column: 26, scope: !3582)
!3587 = !DILocation(line: 5074, column: 31, scope: !3582)
!3588 = !DILocation(line: 5074, column: 36, scope: !3582)
!3589 = !DILocation(line: 5074, column: 41, scope: !3582)
!3590 = !DILocation(line: 5074, column: 45, scope: !3582)
!3591 = !DILocation(line: 5074, column: 49, scope: !3582)
!3592 = !DILocation(line: 5074, column: 55, scope: !3582)
!3593 = !DILocation(line: 5074, column: 5, scope: !3562)
!3594 = !DILocation(line: 5076, column: 13, scope: !3595)
!3595 = distinct !DILexicalBlock(scope: !3582, file: !72, line: 5075, column: 2)
!3596 = !DILocation(line: 5077, column: 2, scope: !3595)
!3597 = !DILocation(line: 5080, column: 13, scope: !3598)
!3598 = distinct !DILexicalBlock(scope: !3582, file: !72, line: 5079, column: 2)
!3599 = !DILocation(line: 5083, column: 5, scope: !3600)
!3600 = distinct !DILexicalBlock(scope: !3562, file: !72, line: 5083, column: 5)
!3601 = !DILocation(line: 5083, column: 10, scope: !3600)
!3602 = !DILocation(line: 5083, column: 5, scope: !3562)
!3603 = !DILocation(line: 5085, column: 15, scope: !3604)
!3604 = distinct !DILexicalBlock(scope: !3600, file: !72, line: 5084, column: 2)
!3605 = !DILocation(line: 5085, column: 14, scope: !3604)
!3606 = !DILocation(line: 5085, column: 12, scope: !3604)
!3607 = !DILocation(line: 5086, column: 2, scope: !3604)
!3608 = !DILocation(line: 5089, column: 14, scope: !3609)
!3609 = distinct !DILexicalBlock(scope: !3600, file: !72, line: 5088, column: 2)
!3610 = !DILocation(line: 5089, column: 12, scope: !3609)
!3611 = !DILocation(line: 5092, column: 5, scope: !3612)
!3612 = distinct !DILexicalBlock(scope: !3562, file: !72, line: 5092, column: 5)
!3613 = !DILocation(line: 5092, column: 11, scope: !3612)
!3614 = !DILocation(line: 5092, column: 5, scope: !3562)
!3615 = !DILocation(line: 5094, column: 15, scope: !3616)
!3616 = distinct !DILexicalBlock(scope: !3612, file: !72, line: 5093, column: 2)
!3617 = !DILocation(line: 5094, column: 14, scope: !3616)
!3618 = !DILocation(line: 5094, column: 12, scope: !3616)
!3619 = !DILocation(line: 5095, column: 2, scope: !3616)
!3620 = !DILocation(line: 5098, column: 14, scope: !3621)
!3621 = distinct !DILexicalBlock(scope: !3612, file: !72, line: 5097, column: 2)
!3622 = !DILocation(line: 5098, column: 12, scope: !3621)
!3623 = !DILocation(line: 5101, column: 13, scope: !3562)
!3624 = !DILocation(line: 5101, column: 24, scope: !3562)
!3625 = !DILocation(line: 5101, column: 22, scope: !3562)
!3626 = !DILocation(line: 5101, column: 11, scope: !3562)
!3627 = !DILocation(line: 5102, column: 25, scope: !3562)
!3628 = !DILocation(line: 5102, column: 35, scope: !3562)
!3629 = !DILocation(line: 5102, column: 13, scope: !3562)
!3630 = !DILocation(line: 5102, column: 11, scope: !3562)
!3631 = !DILocation(line: 5103, column: 13, scope: !3562)
!3632 = !DILocation(line: 5103, column: 25, scope: !3562)
!3633 = !DILocation(line: 5103, column: 22, scope: !3562)
!3634 = !DILocation(line: 5103, column: 11, scope: !3562)
!3635 = !DILocation(line: 5104, column: 14, scope: !3562)
!3636 = !DILocation(line: 5104, column: 30, scope: !3562)
!3637 = !DILocation(line: 5104, column: 29, scope: !3562)
!3638 = !DILocation(line: 5104, column: 23, scope: !3562)
!3639 = !DILocation(line: 5104, column: 11, scope: !3562)
!3640 = !DILocation(line: 5105, column: 6, scope: !3641)
!3641 = distinct !DILexicalBlock(scope: !3562, file: !72, line: 5105, column: 5)
!3642 = !DILocation(line: 5105, column: 16, scope: !3641)
!3643 = !DILocation(line: 5105, column: 14, scope: !3641)
!3644 = !DILocation(line: 5105, column: 22, scope: !3641)
!3645 = !DILocation(line: 5105, column: 5, scope: !3562)
!3646 = !DILocation(line: 5107, column: 6, scope: !3647)
!3647 = distinct !DILexicalBlock(scope: !3648, file: !72, line: 5107, column: 6)
!3648 = distinct !DILexicalBlock(scope: !3641, file: !72, line: 5106, column: 2)
!3649 = !DILocation(line: 5107, column: 16, scope: !3647)
!3650 = !DILocation(line: 5107, column: 6, scope: !3648)
!3651 = !DILocation(line: 5109, column: 7, scope: !3652)
!3652 = distinct !DILexicalBlock(scope: !3653, file: !72, line: 5109, column: 7)
!3653 = distinct !DILexicalBlock(scope: !3647, file: !72, line: 5108, column: 3)
!3654 = !DILocation(line: 5109, column: 15, scope: !3652)
!3655 = !DILocation(line: 5109, column: 7, scope: !3653)
!3656 = !DILocation(line: 5110, column: 12, scope: !3652)
!3657 = !DILocation(line: 5110, column: 5, scope: !3652)
!3658 = !DILocation(line: 5112, column: 5, scope: !3652)
!3659 = !DILocation(line: 5116, column: 7, scope: !3660)
!3660 = distinct !DILexicalBlock(scope: !3661, file: !72, line: 5116, column: 7)
!3661 = distinct !DILexicalBlock(scope: !3647, file: !72, line: 5115, column: 3)
!3662 = !DILocation(line: 5116, column: 15, scope: !3660)
!3663 = !DILocation(line: 5116, column: 7, scope: !3661)
!3664 = !DILocation(line: 5117, column: 13, scope: !3660)
!3665 = !DILocation(line: 5117, column: 12, scope: !3660)
!3666 = !DILocation(line: 5117, column: 5, scope: !3660)
!3667 = !DILocation(line: 5119, column: 5, scope: !3660)
!3668 = !DILocation(line: 5124, column: 3, scope: !3669)
!3669 = distinct !DILexicalBlock(scope: !3641, file: !72, line: 5123, column: 2)
!3670 = !DILocation(line: 5126, column: 1, scope: !3562)
!3671 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !72, file: !72, line: 3897, type: !2662, scopeLine: 3898, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3672 = !DILocalVariable(name: "value", arg: 1, scope: !3671, file: !72, line: 3897, type: !80)
!3673 = !DILocation(line: 3897, column: 30, scope: !3671)
!3674 = !DILocalVariable(name: "factor", arg: 2, scope: !3671, file: !72, line: 3897, type: !6)
!3675 = !DILocation(line: 3897, column: 40, scope: !3671)
!3676 = !DILocation(line: 3899, column: 40, scope: !3671)
!3677 = !DILocation(line: 3899, column: 46, scope: !3671)
!3678 = !DILocation(line: 3899, column: 10, scope: !3671)
!3679 = !DILocation(line: 3899, column: 3, scope: !3671)
!3680 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !72, file: !72, line: 5221, type: !3681, scopeLine: 5222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3681 = !DISubroutineType(types: !3682)
!3682 = !{!80, !80, !6, !736}
!3683 = !DILocalVariable(name: "value", arg: 1, scope: !3680, file: !72, line: 5221, type: !80)
!3684 = !DILocation(line: 5221, column: 39, scope: !3680)
!3685 = !DILocalVariable(name: "factor", arg: 2, scope: !3680, file: !72, line: 5221, type: !6)
!3686 = !DILocation(line: 5221, column: 49, scope: !3680)
!3687 = !DILocalVariable(name: "count", arg: 3, scope: !3680, file: !72, line: 5221, type: !736)
!3688 = !DILocation(line: 5221, column: 61, scope: !3680)
!3689 = !DILocalVariable(name: "u32Temp1", scope: !3680, file: !72, line: 5223, type: !736)
!3690 = !DILocation(line: 5223, column: 6, scope: !3680)
!3691 = !DILocalVariable(name: "u32Temp2", scope: !3680, file: !72, line: 5223, type: !736)
!3692 = !DILocation(line: 5223, column: 17, scope: !3680)
!3693 = !DILocalVariable(name: "u32Temp3", scope: !3680, file: !72, line: 5223, type: !736)
!3694 = !DILocation(line: 5223, column: 26, scope: !3680)
!3695 = !DILocalVariable(name: "u32Temp4", scope: !3680, file: !72, line: 5223, type: !736)
!3696 = !DILocation(line: 5223, column: 35, scope: !3680)
!3697 = !DILocalVariable(name: "u8SignBit", scope: !3680, file: !72, line: 5224, type: !17)
!3698 = !DILocation(line: 5224, column: 5, scope: !3680)
!3699 = !DILocation(line: 5226, column: 7, scope: !3700)
!3700 = distinct !DILexicalBlock(scope: !3680, file: !72, line: 5226, column: 5)
!3701 = !DILocation(line: 5226, column: 12, scope: !3700)
!3702 = !DILocation(line: 5226, column: 16, scope: !3700)
!3703 = !DILocation(line: 5226, column: 20, scope: !3700)
!3704 = !DILocation(line: 5226, column: 26, scope: !3700)
!3705 = !DILocation(line: 5226, column: 31, scope: !3700)
!3706 = !DILocation(line: 5226, column: 36, scope: !3700)
!3707 = !DILocation(line: 5226, column: 41, scope: !3700)
!3708 = !DILocation(line: 5226, column: 45, scope: !3700)
!3709 = !DILocation(line: 5226, column: 49, scope: !3700)
!3710 = !DILocation(line: 5226, column: 55, scope: !3700)
!3711 = !DILocation(line: 5226, column: 5, scope: !3680)
!3712 = !DILocation(line: 5228, column: 13, scope: !3713)
!3713 = distinct !DILexicalBlock(scope: !3700, file: !72, line: 5227, column: 2)
!3714 = !DILocation(line: 5229, column: 2, scope: !3713)
!3715 = !DILocation(line: 5232, column: 13, scope: !3716)
!3716 = distinct !DILexicalBlock(scope: !3700, file: !72, line: 5231, column: 2)
!3717 = !DILocation(line: 5235, column: 5, scope: !3718)
!3718 = distinct !DILexicalBlock(scope: !3680, file: !72, line: 5235, column: 5)
!3719 = !DILocation(line: 5235, column: 10, scope: !3718)
!3720 = !DILocation(line: 5235, column: 5, scope: !3680)
!3721 = !DILocation(line: 5237, column: 15, scope: !3722)
!3722 = distinct !DILexicalBlock(scope: !3718, file: !72, line: 5236, column: 2)
!3723 = !DILocation(line: 5237, column: 14, scope: !3722)
!3724 = !DILocation(line: 5237, column: 12, scope: !3722)
!3725 = !DILocation(line: 5238, column: 2, scope: !3722)
!3726 = !DILocation(line: 5241, column: 14, scope: !3727)
!3727 = distinct !DILexicalBlock(scope: !3718, file: !72, line: 5240, column: 2)
!3728 = !DILocation(line: 5241, column: 12, scope: !3727)
!3729 = !DILocation(line: 5244, column: 5, scope: !3730)
!3730 = distinct !DILexicalBlock(scope: !3680, file: !72, line: 5244, column: 5)
!3731 = !DILocation(line: 5244, column: 11, scope: !3730)
!3732 = !DILocation(line: 5244, column: 5, scope: !3680)
!3733 = !DILocation(line: 5246, column: 15, scope: !3734)
!3734 = distinct !DILexicalBlock(scope: !3730, file: !72, line: 5245, column: 2)
!3735 = !DILocation(line: 5246, column: 14, scope: !3734)
!3736 = !DILocation(line: 5246, column: 12, scope: !3734)
!3737 = !DILocation(line: 5247, column: 2, scope: !3734)
!3738 = !DILocation(line: 5250, column: 14, scope: !3739)
!3739 = distinct !DILexicalBlock(scope: !3730, file: !72, line: 5249, column: 2)
!3740 = !DILocation(line: 5250, column: 12, scope: !3739)
!3741 = !DILocation(line: 5253, column: 13, scope: !3680)
!3742 = !DILocation(line: 5253, column: 24, scope: !3680)
!3743 = !DILocation(line: 5253, column: 22, scope: !3680)
!3744 = !DILocation(line: 5253, column: 11, scope: !3680)
!3745 = !DILocation(line: 5254, column: 25, scope: !3680)
!3746 = !DILocation(line: 5254, column: 35, scope: !3680)
!3747 = !DILocation(line: 5254, column: 13, scope: !3680)
!3748 = !DILocation(line: 5254, column: 11, scope: !3680)
!3749 = !DILocation(line: 5255, column: 13, scope: !3680)
!3750 = !DILocation(line: 5255, column: 25, scope: !3680)
!3751 = !DILocation(line: 5255, column: 22, scope: !3680)
!3752 = !DILocation(line: 5255, column: 11, scope: !3680)
!3753 = !DILocation(line: 5256, column: 14, scope: !3680)
!3754 = !DILocation(line: 5256, column: 30, scope: !3680)
!3755 = !DILocation(line: 5256, column: 29, scope: !3680)
!3756 = !DILocation(line: 5256, column: 23, scope: !3680)
!3757 = !DILocation(line: 5256, column: 11, scope: !3680)
!3758 = !DILocation(line: 5257, column: 6, scope: !3759)
!3759 = distinct !DILexicalBlock(scope: !3680, file: !72, line: 5257, column: 5)
!3760 = !DILocation(line: 5257, column: 16, scope: !3759)
!3761 = !DILocation(line: 5257, column: 14, scope: !3759)
!3762 = !DILocation(line: 5257, column: 22, scope: !3759)
!3763 = !DILocation(line: 5257, column: 5, scope: !3680)
!3764 = !DILocation(line: 5259, column: 6, scope: !3765)
!3765 = distinct !DILexicalBlock(scope: !3766, file: !72, line: 5259, column: 6)
!3766 = distinct !DILexicalBlock(scope: !3759, file: !72, line: 5258, column: 2)
!3767 = !DILocation(line: 5259, column: 16, scope: !3765)
!3768 = !DILocation(line: 5259, column: 6, scope: !3766)
!3769 = !DILocation(line: 5261, column: 7, scope: !3770)
!3770 = distinct !DILexicalBlock(scope: !3771, file: !72, line: 5261, column: 7)
!3771 = distinct !DILexicalBlock(scope: !3765, file: !72, line: 5260, column: 3)
!3772 = !DILocation(line: 5261, column: 15, scope: !3770)
!3773 = !DILocation(line: 5261, column: 7, scope: !3771)
!3774 = !DILocation(line: 5262, column: 12, scope: !3770)
!3775 = !DILocation(line: 5262, column: 5, scope: !3770)
!3776 = !DILocation(line: 5264, column: 5, scope: !3770)
!3777 = !DILocation(line: 5268, column: 7, scope: !3778)
!3778 = distinct !DILexicalBlock(scope: !3779, file: !72, line: 5268, column: 7)
!3779 = distinct !DILexicalBlock(scope: !3765, file: !72, line: 5267, column: 3)
!3780 = !DILocation(line: 5268, column: 15, scope: !3778)
!3781 = !DILocation(line: 5268, column: 7, scope: !3779)
!3782 = !DILocation(line: 5269, column: 13, scope: !3778)
!3783 = !DILocation(line: 5269, column: 12, scope: !3778)
!3784 = !DILocation(line: 5269, column: 5, scope: !3778)
!3785 = !DILocation(line: 5271, column: 5, scope: !3778)
!3786 = !DILocation(line: 5276, column: 3, scope: !3787)
!3787 = distinct !DILexicalBlock(scope: !3759, file: !72, line: 5275, column: 2)
!3788 = !DILocation(line: 5278, column: 1, scope: !3680)
!3789 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !72, file: !72, line: 3921, type: !775, scopeLine: 3922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3790 = !DILocalVariable(name: "value", arg: 1, scope: !3789, file: !72, line: 3921, type: !80)
!3791 = !DILocation(line: 3921, column: 31, scope: !3789)
!3792 = !DILocalVariable(name: "factor", arg: 2, scope: !3789, file: !72, line: 3921, type: !22)
!3793 = !DILocation(line: 3921, column: 42, scope: !3789)
!3794 = !DILocation(line: 3923, column: 41, scope: !3789)
!3795 = !DILocation(line: 3923, column: 47, scope: !3789)
!3796 = !DILocation(line: 3923, column: 10, scope: !3789)
!3797 = !DILocation(line: 3923, column: 3, scope: !3789)
!3798 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !72, file: !72, line: 5145, type: !3799, scopeLine: 5146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3799 = !DISubroutineType(types: !3800)
!3800 = !{!80, !80, !22, !736}
!3801 = !DILocalVariable(name: "value", arg: 1, scope: !3798, file: !72, line: 5145, type: !80)
!3802 = !DILocation(line: 5145, column: 40, scope: !3798)
!3803 = !DILocalVariable(name: "factor", arg: 2, scope: !3798, file: !72, line: 5145, type: !22)
!3804 = !DILocation(line: 5145, column: 50, scope: !3798)
!3805 = !DILocalVariable(name: "count", arg: 3, scope: !3798, file: !72, line: 5145, type: !736)
!3806 = !DILocation(line: 5145, column: 62, scope: !3798)
!3807 = !DILocalVariable(name: "u32Temp1", scope: !3798, file: !72, line: 5147, type: !736)
!3808 = !DILocation(line: 5147, column: 6, scope: !3798)
!3809 = !DILocalVariable(name: "u32Temp2", scope: !3798, file: !72, line: 5147, type: !736)
!3810 = !DILocation(line: 5147, column: 17, scope: !3798)
!3811 = !DILocalVariable(name: "u32Temp3", scope: !3798, file: !72, line: 5147, type: !736)
!3812 = !DILocation(line: 5147, column: 26, scope: !3798)
!3813 = !DILocalVariable(name: "u32Temp4", scope: !3798, file: !72, line: 5147, type: !736)
!3814 = !DILocation(line: 5147, column: 35, scope: !3798)
!3815 = !DILocalVariable(name: "u8SignBit", scope: !3798, file: !72, line: 5148, type: !17)
!3816 = !DILocation(line: 5148, column: 5, scope: !3798)
!3817 = !DILocation(line: 5150, column: 7, scope: !3818)
!3818 = distinct !DILexicalBlock(scope: !3798, file: !72, line: 5150, column: 5)
!3819 = !DILocation(line: 5150, column: 12, scope: !3818)
!3820 = !DILocation(line: 5150, column: 16, scope: !3818)
!3821 = !DILocation(line: 5150, column: 20, scope: !3818)
!3822 = !DILocation(line: 5150, column: 26, scope: !3818)
!3823 = !DILocation(line: 5150, column: 31, scope: !3818)
!3824 = !DILocation(line: 5150, column: 36, scope: !3818)
!3825 = !DILocation(line: 5150, column: 41, scope: !3818)
!3826 = !DILocation(line: 5150, column: 45, scope: !3818)
!3827 = !DILocation(line: 5150, column: 49, scope: !3818)
!3828 = !DILocation(line: 5150, column: 55, scope: !3818)
!3829 = !DILocation(line: 5150, column: 5, scope: !3798)
!3830 = !DILocation(line: 5152, column: 13, scope: !3831)
!3831 = distinct !DILexicalBlock(scope: !3818, file: !72, line: 5151, column: 2)
!3832 = !DILocation(line: 5153, column: 2, scope: !3831)
!3833 = !DILocation(line: 5156, column: 13, scope: !3834)
!3834 = distinct !DILexicalBlock(scope: !3818, file: !72, line: 5155, column: 2)
!3835 = !DILocation(line: 5159, column: 5, scope: !3836)
!3836 = distinct !DILexicalBlock(scope: !3798, file: !72, line: 5159, column: 5)
!3837 = !DILocation(line: 5159, column: 10, scope: !3836)
!3838 = !DILocation(line: 5159, column: 5, scope: !3798)
!3839 = !DILocation(line: 5161, column: 15, scope: !3840)
!3840 = distinct !DILexicalBlock(scope: !3836, file: !72, line: 5160, column: 2)
!3841 = !DILocation(line: 5161, column: 14, scope: !3840)
!3842 = !DILocation(line: 5161, column: 12, scope: !3840)
!3843 = !DILocation(line: 5162, column: 2, scope: !3840)
!3844 = !DILocation(line: 5165, column: 14, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3836, file: !72, line: 5164, column: 2)
!3846 = !DILocation(line: 5165, column: 12, scope: !3845)
!3847 = !DILocation(line: 5168, column: 5, scope: !3848)
!3848 = distinct !DILexicalBlock(scope: !3798, file: !72, line: 5168, column: 5)
!3849 = !DILocation(line: 5168, column: 11, scope: !3848)
!3850 = !DILocation(line: 5168, column: 5, scope: !3798)
!3851 = !DILocation(line: 5170, column: 15, scope: !3852)
!3852 = distinct !DILexicalBlock(scope: !3848, file: !72, line: 5169, column: 2)
!3853 = !DILocation(line: 5170, column: 14, scope: !3852)
!3854 = !DILocation(line: 5170, column: 12, scope: !3852)
!3855 = !DILocation(line: 5171, column: 2, scope: !3852)
!3856 = !DILocation(line: 5174, column: 14, scope: !3857)
!3857 = distinct !DILexicalBlock(scope: !3848, file: !72, line: 5173, column: 2)
!3858 = !DILocation(line: 5174, column: 12, scope: !3857)
!3859 = !DILocation(line: 5177, column: 13, scope: !3798)
!3860 = !DILocation(line: 5177, column: 24, scope: !3798)
!3861 = !DILocation(line: 5177, column: 22, scope: !3798)
!3862 = !DILocation(line: 5177, column: 11, scope: !3798)
!3863 = !DILocation(line: 5178, column: 25, scope: !3798)
!3864 = !DILocation(line: 5178, column: 35, scope: !3798)
!3865 = !DILocation(line: 5178, column: 13, scope: !3798)
!3866 = !DILocation(line: 5178, column: 11, scope: !3798)
!3867 = !DILocation(line: 5179, column: 13, scope: !3798)
!3868 = !DILocation(line: 5179, column: 25, scope: !3798)
!3869 = !DILocation(line: 5179, column: 22, scope: !3798)
!3870 = !DILocation(line: 5179, column: 11, scope: !3798)
!3871 = !DILocation(line: 5180, column: 14, scope: !3798)
!3872 = !DILocation(line: 5180, column: 30, scope: !3798)
!3873 = !DILocation(line: 5180, column: 29, scope: !3798)
!3874 = !DILocation(line: 5180, column: 23, scope: !3798)
!3875 = !DILocation(line: 5180, column: 11, scope: !3798)
!3876 = !DILocation(line: 5181, column: 6, scope: !3877)
!3877 = distinct !DILexicalBlock(scope: !3798, file: !72, line: 5181, column: 5)
!3878 = !DILocation(line: 5181, column: 16, scope: !3877)
!3879 = !DILocation(line: 5181, column: 14, scope: !3877)
!3880 = !DILocation(line: 5181, column: 22, scope: !3877)
!3881 = !DILocation(line: 5181, column: 5, scope: !3798)
!3882 = !DILocation(line: 5183, column: 6, scope: !3883)
!3883 = distinct !DILexicalBlock(scope: !3884, file: !72, line: 5183, column: 6)
!3884 = distinct !DILexicalBlock(scope: !3877, file: !72, line: 5182, column: 2)
!3885 = !DILocation(line: 5183, column: 16, scope: !3883)
!3886 = !DILocation(line: 5183, column: 6, scope: !3884)
!3887 = !DILocation(line: 5185, column: 7, scope: !3888)
!3888 = distinct !DILexicalBlock(scope: !3889, file: !72, line: 5185, column: 7)
!3889 = distinct !DILexicalBlock(scope: !3883, file: !72, line: 5184, column: 3)
!3890 = !DILocation(line: 5185, column: 15, scope: !3888)
!3891 = !DILocation(line: 5185, column: 7, scope: !3889)
!3892 = !DILocation(line: 5186, column: 12, scope: !3888)
!3893 = !DILocation(line: 5186, column: 5, scope: !3888)
!3894 = !DILocation(line: 5188, column: 5, scope: !3888)
!3895 = !DILocation(line: 5192, column: 7, scope: !3896)
!3896 = distinct !DILexicalBlock(scope: !3897, file: !72, line: 5192, column: 7)
!3897 = distinct !DILexicalBlock(scope: !3883, file: !72, line: 5191, column: 3)
!3898 = !DILocation(line: 5192, column: 15, scope: !3896)
!3899 = !DILocation(line: 5192, column: 7, scope: !3897)
!3900 = !DILocation(line: 5193, column: 13, scope: !3896)
!3901 = !DILocation(line: 5193, column: 12, scope: !3896)
!3902 = !DILocation(line: 5193, column: 5, scope: !3896)
!3903 = !DILocation(line: 5195, column: 5, scope: !3896)
!3904 = !DILocation(line: 5200, column: 3, scope: !3905)
!3905 = distinct !DILexicalBlock(scope: !3877, file: !72, line: 5199, column: 2)
!3906 = !DILocation(line: 5202, column: 1, scope: !3798)
!3907 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !72, file: !72, line: 3945, type: !2367, scopeLine: 3946, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3908 = !DILocalVariable(name: "value", arg: 1, scope: !3907, file: !72, line: 3945, type: !80)
!3909 = !DILocation(line: 3945, column: 30, scope: !3907)
!3910 = !DILocalVariable(name: "factor", arg: 2, scope: !3907, file: !72, line: 3945, type: !17)
!3911 = !DILocation(line: 3945, column: 40, scope: !3907)
!3912 = !DILocation(line: 3947, column: 40, scope: !3907)
!3913 = !DILocation(line: 3947, column: 46, scope: !3907)
!3914 = !DILocation(line: 3947, column: 10, scope: !3907)
!3915 = !DILocation(line: 3947, column: 3, scope: !3907)
!3916 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !72, file: !72, line: 5540, type: !3917, scopeLine: 5541, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3917 = !DISubroutineType(types: !3918)
!3918 = !{!80, !80, !17, !736}
!3919 = !DILocalVariable(name: "value", arg: 1, scope: !3916, file: !72, line: 5540, type: !80)
!3920 = !DILocation(line: 5540, column: 39, scope: !3916)
!3921 = !DILocalVariable(name: "factor", arg: 2, scope: !3916, file: !72, line: 5540, type: !17)
!3922 = !DILocation(line: 5540, column: 49, scope: !3916)
!3923 = !DILocalVariable(name: "count", arg: 3, scope: !3916, file: !72, line: 5540, type: !736)
!3924 = !DILocation(line: 5540, column: 61, scope: !3916)
!3925 = !DILocalVariable(name: "u32Temp1", scope: !3916, file: !72, line: 5542, type: !736)
!3926 = !DILocation(line: 5542, column: 6, scope: !3916)
!3927 = !DILocalVariable(name: "u32Temp2", scope: !3916, file: !72, line: 5542, type: !736)
!3928 = !DILocation(line: 5542, column: 17, scope: !3916)
!3929 = !DILocalVariable(name: "u32Temp3", scope: !3916, file: !72, line: 5542, type: !736)
!3930 = !DILocation(line: 5542, column: 26, scope: !3916)
!3931 = !DILocalVariable(name: "u8SignBit", scope: !3916, file: !72, line: 5543, type: !17)
!3932 = !DILocation(line: 5543, column: 5, scope: !3916)
!3933 = !DILocation(line: 5545, column: 5, scope: !3934)
!3934 = distinct !DILexicalBlock(scope: !3916, file: !72, line: 5545, column: 5)
!3935 = !DILocation(line: 5545, column: 10, scope: !3934)
!3936 = !DILocation(line: 5545, column: 5, scope: !3916)
!3937 = !DILocation(line: 5547, column: 13, scope: !3938)
!3938 = distinct !DILexicalBlock(scope: !3934, file: !72, line: 5546, column: 2)
!3939 = !DILocation(line: 5548, column: 15, scope: !3938)
!3940 = !DILocation(line: 5548, column: 14, scope: !3938)
!3941 = !DILocation(line: 5548, column: 12, scope: !3938)
!3942 = !DILocation(line: 5549, column: 2, scope: !3938)
!3943 = !DILocation(line: 5552, column: 13, scope: !3944)
!3944 = distinct !DILexicalBlock(scope: !3934, file: !72, line: 5551, column: 2)
!3945 = !DILocation(line: 5553, column: 14, scope: !3944)
!3946 = !DILocation(line: 5553, column: 12, scope: !3944)
!3947 = !DILocation(line: 5556, column: 13, scope: !3916)
!3948 = !DILocation(line: 5556, column: 24, scope: !3916)
!3949 = !DILocation(line: 5556, column: 22, scope: !3916)
!3950 = !DILocation(line: 5556, column: 11, scope: !3916)
!3951 = !DILocation(line: 5557, column: 25, scope: !3916)
!3952 = !DILocation(line: 5557, column: 34, scope: !3916)
!3953 = !DILocation(line: 5557, column: 13, scope: !3916)
!3954 = !DILocation(line: 5557, column: 11, scope: !3916)
!3955 = !DILocation(line: 5558, column: 13, scope: !3916)
!3956 = !DILocation(line: 5558, column: 25, scope: !3916)
!3957 = !DILocation(line: 5558, column: 22, scope: !3916)
!3958 = !DILocation(line: 5558, column: 11, scope: !3916)
!3959 = !DILocation(line: 5559, column: 14, scope: !3916)
!3960 = !DILocation(line: 5559, column: 30, scope: !3916)
!3961 = !DILocation(line: 5559, column: 29, scope: !3916)
!3962 = !DILocation(line: 5559, column: 23, scope: !3916)
!3963 = !DILocation(line: 5559, column: 11, scope: !3916)
!3964 = !DILocation(line: 5560, column: 6, scope: !3965)
!3965 = distinct !DILexicalBlock(scope: !3916, file: !72, line: 5560, column: 5)
!3966 = !DILocation(line: 5560, column: 16, scope: !3965)
!3967 = !DILocation(line: 5560, column: 14, scope: !3965)
!3968 = !DILocation(line: 5560, column: 22, scope: !3965)
!3969 = !DILocation(line: 5560, column: 5, scope: !3916)
!3970 = !DILocation(line: 5562, column: 6, scope: !3971)
!3971 = distinct !DILexicalBlock(scope: !3972, file: !72, line: 5562, column: 6)
!3972 = distinct !DILexicalBlock(scope: !3965, file: !72, line: 5561, column: 2)
!3973 = !DILocation(line: 5562, column: 16, scope: !3971)
!3974 = !DILocation(line: 5562, column: 6, scope: !3972)
!3975 = !DILocation(line: 5564, column: 7, scope: !3976)
!3976 = distinct !DILexicalBlock(scope: !3977, file: !72, line: 5564, column: 7)
!3977 = distinct !DILexicalBlock(scope: !3971, file: !72, line: 5563, column: 3)
!3978 = !DILocation(line: 5564, column: 15, scope: !3976)
!3979 = !DILocation(line: 5564, column: 7, scope: !3977)
!3980 = !DILocation(line: 5565, column: 12, scope: !3976)
!3981 = !DILocation(line: 5565, column: 5, scope: !3976)
!3982 = !DILocation(line: 5567, column: 5, scope: !3976)
!3983 = !DILocation(line: 5571, column: 7, scope: !3984)
!3984 = distinct !DILexicalBlock(scope: !3985, file: !72, line: 5571, column: 7)
!3985 = distinct !DILexicalBlock(scope: !3971, file: !72, line: 5570, column: 3)
!3986 = !DILocation(line: 5571, column: 15, scope: !3984)
!3987 = !DILocation(line: 5571, column: 7, scope: !3985)
!3988 = !DILocation(line: 5573, column: 13, scope: !3989)
!3989 = distinct !DILexicalBlock(scope: !3984, file: !72, line: 5572, column: 4)
!3990 = !DILocation(line: 5573, column: 12, scope: !3989)
!3991 = !DILocation(line: 5573, column: 5, scope: !3989)
!3992 = !DILocation(line: 5577, column: 5, scope: !3993)
!3993 = distinct !DILexicalBlock(scope: !3984, file: !72, line: 5576, column: 4)
!3994 = !DILocation(line: 5583, column: 6, scope: !3995)
!3995 = distinct !DILexicalBlock(scope: !3996, file: !72, line: 5583, column: 6)
!3996 = distinct !DILexicalBlock(scope: !3965, file: !72, line: 5582, column: 2)
!3997 = !DILocation(line: 5583, column: 16, scope: !3995)
!3998 = !DILocation(line: 5583, column: 6, scope: !3996)
!3999 = !DILocation(line: 5585, column: 4, scope: !4000)
!4000 = distinct !DILexicalBlock(scope: !3995, file: !72, line: 5584, column: 3)
!4001 = !DILocation(line: 5589, column: 4, scope: !4002)
!4002 = distinct !DILexicalBlock(scope: !3995, file: !72, line: 5588, column: 3)
!4003 = !DILocation(line: 5592, column: 1, scope: !3916)
!4004 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !72, file: !72, line: 3969, type: !159, scopeLine: 3970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4005 = !DILocalVariable(name: "value", arg: 1, scope: !4004, file: !72, line: 3969, type: !6)
!4006 = !DILocation(line: 3969, column: 28, scope: !4004)
!4007 = !DILocalVariable(name: "factor", arg: 2, scope: !4004, file: !72, line: 3969, type: !17)
!4008 = !DILocation(line: 3969, column: 38, scope: !4004)
!4009 = !DILocation(line: 3971, column: 38, scope: !4004)
!4010 = !DILocation(line: 3971, column: 56, scope: !4004)
!4011 = !DILocation(line: 3971, column: 50, scope: !4004)
!4012 = !DILocation(line: 3971, column: 64, scope: !4004)
!4013 = !DILocation(line: 3971, column: 44, scope: !4004)
!4014 = !DILocation(line: 3971, column: 10, scope: !4004)
!4015 = !DILocation(line: 3971, column: 3, scope: !4004)
!4016 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !72, file: !72, line: 3993, type: !159, scopeLine: 3994, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4017 = !DILocalVariable(name: "value", arg: 1, scope: !4016, file: !72, line: 3993, type: !6)
!4018 = !DILocation(line: 3993, column: 27, scope: !4016)
!4019 = !DILocalVariable(name: "factor", arg: 2, scope: !4016, file: !72, line: 3993, type: !17)
!4020 = !DILocation(line: 3993, column: 37, scope: !4016)
!4021 = !DILocation(line: 3995, column: 38, scope: !4016)
!4022 = !DILocation(line: 3995, column: 56, scope: !4016)
!4023 = !DILocation(line: 3995, column: 50, scope: !4016)
!4024 = !DILocation(line: 3995, column: 64, scope: !4016)
!4025 = !DILocation(line: 3995, column: 44, scope: !4016)
!4026 = !DILocation(line: 3995, column: 10, scope: !4016)
!4027 = !DILocation(line: 3995, column: 3, scope: !4016)
!4028 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !72, file: !72, line: 4018, type: !159, scopeLine: 4019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4029 = !DILocalVariable(name: "value", arg: 1, scope: !4028, file: !72, line: 4018, type: !6)
!4030 = !DILocation(line: 4018, column: 26, scope: !4028)
!4031 = !DILocalVariable(name: "factor", arg: 2, scope: !4028, file: !72, line: 4018, type: !17)
!4032 = !DILocation(line: 4018, column: 36, scope: !4028)
!4033 = !DILocation(line: 4020, column: 38, scope: !4028)
!4034 = !DILocation(line: 4020, column: 56, scope: !4028)
!4035 = !DILocation(line: 4020, column: 50, scope: !4028)
!4036 = !DILocation(line: 4020, column: 64, scope: !4028)
!4037 = !DILocation(line: 4020, column: 44, scope: !4028)
!4038 = !DILocation(line: 4020, column: 10, scope: !4028)
!4039 = !DILocation(line: 4020, column: 3, scope: !4028)
!4040 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !72, file: !72, line: 4043, type: !159, scopeLine: 4044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4041 = !DILocalVariable(name: "value", arg: 1, scope: !4040, file: !72, line: 4043, type: !6)
!4042 = !DILocation(line: 4043, column: 27, scope: !4040)
!4043 = !DILocalVariable(name: "factor", arg: 2, scope: !4040, file: !72, line: 4043, type: !17)
!4044 = !DILocation(line: 4043, column: 37, scope: !4040)
!4045 = !DILocation(line: 4045, column: 41, scope: !4040)
!4046 = !DILocation(line: 4045, column: 59, scope: !4040)
!4047 = !DILocation(line: 4045, column: 53, scope: !4040)
!4048 = !DILocation(line: 4045, column: 67, scope: !4040)
!4049 = !DILocation(line: 4045, column: 47, scope: !4040)
!4050 = !DILocation(line: 4045, column: 10, scope: !4040)
!4051 = !DILocation(line: 4045, column: 3, scope: !4040)
!4052 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !72, file: !72, line: 4068, type: !159, scopeLine: 4069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4053 = !DILocalVariable(name: "value", arg: 1, scope: !4052, file: !72, line: 4068, type: !6)
!4054 = !DILocation(line: 4068, column: 26, scope: !4052)
!4055 = !DILocalVariable(name: "factor", arg: 2, scope: !4052, file: !72, line: 4068, type: !17)
!4056 = !DILocation(line: 4068, column: 36, scope: !4052)
!4057 = !DILocation(line: 4070, column: 41, scope: !4052)
!4058 = !DILocation(line: 4070, column: 59, scope: !4052)
!4059 = !DILocation(line: 4070, column: 53, scope: !4052)
!4060 = !DILocation(line: 4070, column: 67, scope: !4052)
!4061 = !DILocation(line: 4070, column: 47, scope: !4052)
!4062 = !DILocation(line: 4070, column: 10, scope: !4052)
!4063 = !DILocation(line: 4070, column: 3, scope: !4052)
!4064 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !72, file: !72, line: 4092, type: !159, scopeLine: 4093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4065 = !DILocalVariable(name: "value", arg: 1, scope: !4064, file: !72, line: 4092, type: !6)
!4066 = !DILocation(line: 4092, column: 26, scope: !4064)
!4067 = !DILocalVariable(name: "factor", arg: 2, scope: !4064, file: !72, line: 4092, type: !17)
!4068 = !DILocation(line: 4092, column: 36, scope: !4064)
!4069 = !DILocation(line: 4094, column: 41, scope: !4064)
!4070 = !DILocation(line: 4094, column: 59, scope: !4064)
!4071 = !DILocation(line: 4094, column: 53, scope: !4064)
!4072 = !DILocation(line: 4094, column: 67, scope: !4064)
!4073 = !DILocation(line: 4094, column: 47, scope: !4064)
!4074 = !DILocation(line: 4094, column: 10, scope: !4064)
!4075 = !DILocation(line: 4094, column: 3, scope: !4064)
!4076 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !72, file: !72, line: 4116, type: !159, scopeLine: 4117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4077 = !DILocalVariable(name: "value", arg: 1, scope: !4076, file: !72, line: 4116, type: !6)
!4078 = !DILocation(line: 4116, column: 25, scope: !4076)
!4079 = !DILocalVariable(name: "factor", arg: 2, scope: !4076, file: !72, line: 4116, type: !17)
!4080 = !DILocation(line: 4116, column: 35, scope: !4076)
!4081 = !DILocation(line: 4118, column: 41, scope: !4076)
!4082 = !DILocation(line: 4118, column: 59, scope: !4076)
!4083 = !DILocation(line: 4118, column: 53, scope: !4076)
!4084 = !DILocation(line: 4118, column: 67, scope: !4076)
!4085 = !DILocation(line: 4118, column: 47, scope: !4076)
!4086 = !DILocation(line: 4118, column: 10, scope: !4076)
!4087 = !DILocation(line: 4118, column: 3, scope: !4076)
!4088 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !72, file: !72, line: 4140, type: !159, scopeLine: 4141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4089 = !DILocalVariable(name: "value", arg: 1, scope: !4088, file: !72, line: 4140, type: !6)
!4090 = !DILocation(line: 4140, column: 26, scope: !4088)
!4091 = !DILocalVariable(name: "factor", arg: 2, scope: !4088, file: !72, line: 4140, type: !17)
!4092 = !DILocation(line: 4140, column: 36, scope: !4088)
!4093 = !DILocation(line: 4142, column: 41, scope: !4088)
!4094 = !DILocation(line: 4142, column: 59, scope: !4088)
!4095 = !DILocation(line: 4142, column: 53, scope: !4088)
!4096 = !DILocation(line: 4142, column: 67, scope: !4088)
!4097 = !DILocation(line: 4142, column: 47, scope: !4088)
!4098 = !DILocation(line: 4142, column: 10, scope: !4088)
!4099 = !DILocation(line: 4142, column: 3, scope: !4088)
!4100 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !72, file: !72, line: 4164, type: !159, scopeLine: 4165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4101 = !DILocalVariable(name: "value", arg: 1, scope: !4100, file: !72, line: 4164, type: !6)
!4102 = !DILocation(line: 4164, column: 25, scope: !4100)
!4103 = !DILocalVariable(name: "factor", arg: 2, scope: !4100, file: !72, line: 4164, type: !17)
!4104 = !DILocation(line: 4164, column: 35, scope: !4100)
!4105 = !DILocation(line: 4166, column: 41, scope: !4100)
!4106 = !DILocation(line: 4166, column: 59, scope: !4100)
!4107 = !DILocation(line: 4166, column: 53, scope: !4100)
!4108 = !DILocation(line: 4166, column: 67, scope: !4100)
!4109 = !DILocation(line: 4166, column: 47, scope: !4100)
!4110 = !DILocation(line: 4166, column: 10, scope: !4100)
!4111 = !DILocation(line: 4166, column: 3, scope: !4100)
!4112 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !72, file: !72, line: 4187, type: !929, scopeLine: 4188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4113 = !DILocalVariable(name: "value", arg: 1, scope: !4112, file: !72, line: 4187, type: !22)
!4114 = !DILocation(line: 4187, column: 33, scope: !4112)
!4115 = !DILocalVariable(name: "factor", arg: 2, scope: !4112, file: !72, line: 4187, type: !22)
!4116 = !DILocation(line: 4187, column: 44, scope: !4112)
!4117 = !DILocation(line: 4189, column: 41, scope: !4112)
!4118 = !DILocation(line: 4189, column: 47, scope: !4112)
!4119 = !DILocation(line: 4189, column: 10, scope: !4112)
!4120 = !DILocation(line: 4189, column: 3, scope: !4112)
!4121 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !72, file: !72, line: 4210, type: !929, scopeLine: 4211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4122 = !DILocalVariable(name: "value", arg: 1, scope: !4121, file: !72, line: 4210, type: !22)
!4123 = !DILocation(line: 4210, column: 32, scope: !4121)
!4124 = !DILocalVariable(name: "factor", arg: 2, scope: !4121, file: !72, line: 4210, type: !22)
!4125 = !DILocation(line: 4210, column: 43, scope: !4121)
!4126 = !DILocation(line: 4212, column: 41, scope: !4121)
!4127 = !DILocation(line: 4212, column: 47, scope: !4121)
!4128 = !DILocation(line: 4212, column: 10, scope: !4121)
!4129 = !DILocation(line: 4212, column: 3, scope: !4121)
!4130 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !72, file: !72, line: 4234, type: !929, scopeLine: 4235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4131 = !DILocalVariable(name: "value", arg: 1, scope: !4130, file: !72, line: 4234, type: !22)
!4132 = !DILocation(line: 4234, column: 31, scope: !4130)
!4133 = !DILocalVariable(name: "factor", arg: 2, scope: !4130, file: !72, line: 4234, type: !22)
!4134 = !DILocation(line: 4234, column: 42, scope: !4130)
!4135 = !DILocation(line: 4236, column: 41, scope: !4130)
!4136 = !DILocation(line: 4236, column: 47, scope: !4130)
!4137 = !DILocation(line: 4236, column: 10, scope: !4130)
!4138 = !DILocation(line: 4236, column: 3, scope: !4130)
!4139 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !72, file: !72, line: 4258, type: !929, scopeLine: 4259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4140 = !DILocalVariable(name: "value", arg: 1, scope: !4139, file: !72, line: 4258, type: !22)
!4141 = !DILocation(line: 4258, column: 34, scope: !4139)
!4142 = !DILocalVariable(name: "factor", arg: 2, scope: !4139, file: !72, line: 4258, type: !22)
!4143 = !DILocation(line: 4258, column: 45, scope: !4139)
!4144 = !DILocation(line: 4260, column: 44, scope: !4139)
!4145 = !DILocation(line: 4260, column: 50, scope: !4139)
!4146 = !DILocation(line: 4260, column: 10, scope: !4139)
!4147 = !DILocation(line: 4260, column: 3, scope: !4139)
!4148 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !72, file: !72, line: 4282, type: !929, scopeLine: 4283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4149 = !DILocalVariable(name: "value", arg: 1, scope: !4148, file: !72, line: 4282, type: !22)
!4150 = !DILocation(line: 4282, column: 32, scope: !4148)
!4151 = !DILocalVariable(name: "factor", arg: 2, scope: !4148, file: !72, line: 4282, type: !22)
!4152 = !DILocation(line: 4282, column: 43, scope: !4148)
!4153 = !DILocation(line: 4284, column: 44, scope: !4148)
!4154 = !DILocation(line: 4284, column: 50, scope: !4148)
!4155 = !DILocation(line: 4284, column: 10, scope: !4148)
!4156 = !DILocation(line: 4284, column: 3, scope: !4148)
!4157 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !72, file: !72, line: 4306, type: !929, scopeLine: 4307, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4158 = !DILocalVariable(name: "value", arg: 1, scope: !4157, file: !72, line: 4306, type: !22)
!4159 = !DILocation(line: 4306, column: 31, scope: !4157)
!4160 = !DILocalVariable(name: "factor", arg: 2, scope: !4157, file: !72, line: 4306, type: !22)
!4161 = !DILocation(line: 4306, column: 42, scope: !4157)
!4162 = !DILocation(line: 4308, column: 44, scope: !4157)
!4163 = !DILocation(line: 4308, column: 50, scope: !4157)
!4164 = !DILocation(line: 4308, column: 10, scope: !4157)
!4165 = !DILocation(line: 4308, column: 3, scope: !4157)
!4166 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !72, file: !72, line: 4330, type: !929, scopeLine: 4331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4167 = !DILocalVariable(name: "value", arg: 1, scope: !4166, file: !72, line: 4330, type: !22)
!4168 = !DILocation(line: 4330, column: 33, scope: !4166)
!4169 = !DILocalVariable(name: "factor", arg: 2, scope: !4166, file: !72, line: 4330, type: !22)
!4170 = !DILocation(line: 4330, column: 44, scope: !4166)
!4171 = !DILocation(line: 4332, column: 44, scope: !4166)
!4172 = !DILocation(line: 4332, column: 50, scope: !4166)
!4173 = !DILocation(line: 4332, column: 10, scope: !4166)
!4174 = !DILocation(line: 4332, column: 3, scope: !4166)
!4175 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !72, file: !72, line: 4354, type: !929, scopeLine: 4355, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4176 = !DILocalVariable(name: "value", arg: 1, scope: !4175, file: !72, line: 4354, type: !22)
!4177 = !DILocation(line: 4354, column: 32, scope: !4175)
!4178 = !DILocalVariable(name: "factor", arg: 2, scope: !4175, file: !72, line: 4354, type: !22)
!4179 = !DILocation(line: 4354, column: 43, scope: !4175)
!4180 = !DILocation(line: 4356, column: 44, scope: !4175)
!4181 = !DILocation(line: 4356, column: 50, scope: !4175)
!4182 = !DILocation(line: 4356, column: 10, scope: !4175)
!4183 = !DILocation(line: 4356, column: 3, scope: !4175)
!4184 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !72, file: !72, line: 4377, type: !929, scopeLine: 4378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4185 = !DILocalVariable(name: "value", arg: 1, scope: !4184, file: !72, line: 4377, type: !22)
!4186 = !DILocation(line: 4377, column: 31, scope: !4184)
!4187 = !DILocalVariable(name: "factor", arg: 2, scope: !4184, file: !72, line: 4377, type: !22)
!4188 = !DILocation(line: 4377, column: 42, scope: !4184)
!4189 = !DILocation(line: 4379, column: 44, scope: !4184)
!4190 = !DILocation(line: 4379, column: 50, scope: !4184)
!4191 = !DILocation(line: 4379, column: 10, scope: !4184)
!4192 = !DILocation(line: 4379, column: 3, scope: !4184)
!4193 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !72, file: !72, line: 4400, type: !929, scopeLine: 4401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4194 = !DILocalVariable(name: "value", arg: 1, scope: !4193, file: !72, line: 4400, type: !22)
!4195 = !DILocation(line: 4400, column: 30, scope: !4193)
!4196 = !DILocalVariable(name: "factor", arg: 2, scope: !4193, file: !72, line: 4400, type: !22)
!4197 = !DILocation(line: 4400, column: 41, scope: !4193)
!4198 = !DILocation(line: 4402, column: 44, scope: !4193)
!4199 = !DILocation(line: 4402, column: 50, scope: !4193)
!4200 = !DILocation(line: 4402, column: 10, scope: !4193)
!4201 = !DILocation(line: 4402, column: 3, scope: !4193)
!4202 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !72, file: !72, line: 4423, type: !929, scopeLine: 4424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4203 = !DILocalVariable(name: "value", arg: 1, scope: !4202, file: !72, line: 4423, type: !22)
!4204 = !DILocation(line: 4423, column: 33, scope: !4202)
!4205 = !DILocalVariable(name: "factor", arg: 2, scope: !4202, file: !72, line: 4423, type: !22)
!4206 = !DILocation(line: 4423, column: 44, scope: !4202)
!4207 = !DILocation(line: 4425, column: 44, scope: !4202)
!4208 = !DILocation(line: 4425, column: 50, scope: !4202)
!4209 = !DILocation(line: 4425, column: 10, scope: !4202)
!4210 = !DILocation(line: 4425, column: 3, scope: !4202)
!4211 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !72, file: !72, line: 4446, type: !929, scopeLine: 4447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4212 = !DILocalVariable(name: "value", arg: 1, scope: !4211, file: !72, line: 4446, type: !22)
!4213 = !DILocation(line: 4446, column: 32, scope: !4211)
!4214 = !DILocalVariable(name: "factor", arg: 2, scope: !4211, file: !72, line: 4446, type: !22)
!4215 = !DILocation(line: 4446, column: 43, scope: !4211)
!4216 = !DILocation(line: 4448, column: 44, scope: !4211)
!4217 = !DILocation(line: 4448, column: 50, scope: !4211)
!4218 = !DILocation(line: 4448, column: 10, scope: !4211)
!4219 = !DILocation(line: 4448, column: 3, scope: !4211)
!4220 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !72, file: !72, line: 4469, type: !929, scopeLine: 4470, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4221 = !DILocalVariable(name: "value", arg: 1, scope: !4220, file: !72, line: 4469, type: !22)
!4222 = !DILocation(line: 4469, column: 31, scope: !4220)
!4223 = !DILocalVariable(name: "factor", arg: 2, scope: !4220, file: !72, line: 4469, type: !22)
!4224 = !DILocation(line: 4469, column: 42, scope: !4220)
!4225 = !DILocation(line: 4471, column: 44, scope: !4220)
!4226 = !DILocation(line: 4471, column: 50, scope: !4220)
!4227 = !DILocation(line: 4471, column: 10, scope: !4220)
!4228 = !DILocation(line: 4471, column: 3, scope: !4220)
!4229 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !72, file: !72, line: 4492, type: !929, scopeLine: 4493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4230 = !DILocalVariable(name: "value", arg: 1, scope: !4229, file: !72, line: 4492, type: !22)
!4231 = !DILocation(line: 4492, column: 30, scope: !4229)
!4232 = !DILocalVariable(name: "factor", arg: 2, scope: !4229, file: !72, line: 4492, type: !22)
!4233 = !DILocation(line: 4492, column: 41, scope: !4229)
!4234 = !DILocation(line: 4494, column: 44, scope: !4229)
!4235 = !DILocation(line: 4494, column: 50, scope: !4229)
!4236 = !DILocation(line: 4494, column: 10, scope: !4229)
!4237 = !DILocation(line: 4494, column: 3, scope: !4229)
!4238 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !72, file: !72, line: 4514, type: !974, scopeLine: 4515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4239 = !DILocalVariable(name: "x_value", arg: 1, scope: !4238, file: !72, line: 4514, type: !22)
!4240 = !DILocation(line: 4514, column: 32, scope: !4238)
!4241 = !DILocalVariable(name: "y_value", arg: 2, scope: !4238, file: !72, line: 4514, type: !17)
!4242 = !DILocation(line: 4514, column: 44, scope: !4238)
!4243 = !DILocation(line: 4516, column: 40, scope: !4238)
!4244 = !DILocation(line: 4516, column: 60, scope: !4238)
!4245 = !DILocation(line: 4516, column: 54, scope: !4238)
!4246 = !DILocation(line: 4516, column: 69, scope: !4238)
!4247 = !DILocation(line: 4516, column: 48, scope: !4238)
!4248 = !DILocation(line: 4516, column: 10, scope: !4238)
!4249 = !DILocation(line: 4516, column: 3, scope: !4238)
!4250 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !72, file: !72, line: 4536, type: !974, scopeLine: 4537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4251 = !DILocalVariable(name: "x_value", arg: 1, scope: !4250, file: !72, line: 4536, type: !22)
!4252 = !DILocation(line: 4536, column: 31, scope: !4250)
!4253 = !DILocalVariable(name: "y_value", arg: 2, scope: !4250, file: !72, line: 4536, type: !17)
!4254 = !DILocation(line: 4536, column: 43, scope: !4250)
!4255 = !DILocation(line: 4538, column: 40, scope: !4250)
!4256 = !DILocation(line: 4538, column: 60, scope: !4250)
!4257 = !DILocation(line: 4538, column: 54, scope: !4250)
!4258 = !DILocation(line: 4538, column: 69, scope: !4250)
!4259 = !DILocation(line: 4538, column: 48, scope: !4250)
!4260 = !DILocation(line: 4538, column: 10, scope: !4250)
!4261 = !DILocation(line: 4538, column: 3, scope: !4250)
!4262 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !72, file: !72, line: 4559, type: !974, scopeLine: 4560, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4263 = !DILocalVariable(name: "x_value", arg: 1, scope: !4262, file: !72, line: 4559, type: !22)
!4264 = !DILocation(line: 4559, column: 30, scope: !4262)
!4265 = !DILocalVariable(name: "y_value", arg: 2, scope: !4262, file: !72, line: 4559, type: !17)
!4266 = !DILocation(line: 4559, column: 42, scope: !4262)
!4267 = !DILocation(line: 4561, column: 40, scope: !4262)
!4268 = !DILocation(line: 4561, column: 60, scope: !4262)
!4269 = !DILocation(line: 4561, column: 54, scope: !4262)
!4270 = !DILocation(line: 4561, column: 69, scope: !4262)
!4271 = !DILocation(line: 4561, column: 48, scope: !4262)
!4272 = !DILocation(line: 4561, column: 10, scope: !4262)
!4273 = !DILocation(line: 4561, column: 3, scope: !4262)
!4274 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !72, file: !72, line: 4582, type: !974, scopeLine: 4583, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4275 = !DILocalVariable(name: "x_value", arg: 1, scope: !4274, file: !72, line: 4582, type: !22)
!4276 = !DILocation(line: 4582, column: 31, scope: !4274)
!4277 = !DILocalVariable(name: "y_value", arg: 2, scope: !4274, file: !72, line: 4582, type: !17)
!4278 = !DILocation(line: 4582, column: 43, scope: !4274)
!4279 = !DILocation(line: 4584, column: 44, scope: !4274)
!4280 = !DILocation(line: 4584, column: 64, scope: !4274)
!4281 = !DILocation(line: 4584, column: 58, scope: !4274)
!4282 = !DILocation(line: 4584, column: 73, scope: !4274)
!4283 = !DILocation(line: 4584, column: 52, scope: !4274)
!4284 = !DILocation(line: 4584, column: 10, scope: !4274)
!4285 = !DILocation(line: 4584, column: 3, scope: !4274)
!4286 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !72, file: !72, line: 4605, type: !974, scopeLine: 4606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4287 = !DILocalVariable(name: "x_value", arg: 1, scope: !4286, file: !72, line: 4605, type: !22)
!4288 = !DILocation(line: 4605, column: 30, scope: !4286)
!4289 = !DILocalVariable(name: "y_value", arg: 2, scope: !4286, file: !72, line: 4605, type: !17)
!4290 = !DILocation(line: 4605, column: 42, scope: !4286)
!4291 = !DILocation(line: 4607, column: 44, scope: !4286)
!4292 = !DILocation(line: 4607, column: 64, scope: !4286)
!4293 = !DILocation(line: 4607, column: 58, scope: !4286)
!4294 = !DILocation(line: 4607, column: 73, scope: !4286)
!4295 = !DILocation(line: 4607, column: 52, scope: !4286)
!4296 = !DILocation(line: 4607, column: 10, scope: !4286)
!4297 = !DILocation(line: 4607, column: 3, scope: !4286)
!4298 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !72, file: !72, line: 4627, type: !974, scopeLine: 4628, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4299 = !DILocalVariable(name: "x_value", arg: 1, scope: !4298, file: !72, line: 4627, type: !22)
!4300 = !DILocation(line: 4627, column: 30, scope: !4298)
!4301 = !DILocalVariable(name: "y_value", arg: 2, scope: !4298, file: !72, line: 4627, type: !17)
!4302 = !DILocation(line: 4627, column: 42, scope: !4298)
!4303 = !DILocation(line: 4629, column: 44, scope: !4298)
!4304 = !DILocation(line: 4629, column: 64, scope: !4298)
!4305 = !DILocation(line: 4629, column: 58, scope: !4298)
!4306 = !DILocation(line: 4629, column: 73, scope: !4298)
!4307 = !DILocation(line: 4629, column: 52, scope: !4298)
!4308 = !DILocation(line: 4629, column: 10, scope: !4298)
!4309 = !DILocation(line: 4629, column: 3, scope: !4298)
!4310 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !72, file: !72, line: 4649, type: !974, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4311 = !DILocalVariable(name: "x_value", arg: 1, scope: !4310, file: !72, line: 4649, type: !22)
!4312 = !DILocation(line: 4649, column: 29, scope: !4310)
!4313 = !DILocalVariable(name: "y_value", arg: 2, scope: !4310, file: !72, line: 4649, type: !17)
!4314 = !DILocation(line: 4649, column: 41, scope: !4310)
!4315 = !DILocation(line: 4651, column: 44, scope: !4310)
!4316 = !DILocation(line: 4651, column: 64, scope: !4310)
!4317 = !DILocation(line: 4651, column: 58, scope: !4310)
!4318 = !DILocation(line: 4651, column: 73, scope: !4310)
!4319 = !DILocation(line: 4651, column: 52, scope: !4310)
!4320 = !DILocation(line: 4651, column: 10, scope: !4310)
!4321 = !DILocation(line: 4651, column: 3, scope: !4310)
!4322 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !72, file: !72, line: 4671, type: !974, scopeLine: 4672, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4323 = !DILocalVariable(name: "x_value", arg: 1, scope: !4322, file: !72, line: 4671, type: !22)
!4324 = !DILocation(line: 4671, column: 30, scope: !4322)
!4325 = !DILocalVariable(name: "y_value", arg: 2, scope: !4322, file: !72, line: 4671, type: !17)
!4326 = !DILocation(line: 4671, column: 42, scope: !4322)
!4327 = !DILocation(line: 4673, column: 44, scope: !4322)
!4328 = !DILocation(line: 4673, column: 64, scope: !4322)
!4329 = !DILocation(line: 4673, column: 58, scope: !4322)
!4330 = !DILocation(line: 4673, column: 73, scope: !4322)
!4331 = !DILocation(line: 4673, column: 52, scope: !4322)
!4332 = !DILocation(line: 4673, column: 10, scope: !4322)
!4333 = !DILocation(line: 4673, column: 3, scope: !4322)
!4334 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !72, file: !72, line: 4693, type: !974, scopeLine: 4694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4335 = !DILocalVariable(name: "x_value", arg: 1, scope: !4334, file: !72, line: 4693, type: !22)
!4336 = !DILocation(line: 4693, column: 29, scope: !4334)
!4337 = !DILocalVariable(name: "y_value", arg: 2, scope: !4334, file: !72, line: 4693, type: !17)
!4338 = !DILocation(line: 4693, column: 41, scope: !4334)
!4339 = !DILocation(line: 4695, column: 44, scope: !4334)
!4340 = !DILocation(line: 4695, column: 64, scope: !4334)
!4341 = !DILocation(line: 4695, column: 58, scope: !4334)
!4342 = !DILocation(line: 4695, column: 73, scope: !4334)
!4343 = !DILocation(line: 4695, column: 52, scope: !4334)
!4344 = !DILocation(line: 4695, column: 10, scope: !4334)
!4345 = !DILocation(line: 4695, column: 3, scope: !4334)
!4346 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !72, file: !72, line: 4717, type: !1503, scopeLine: 4718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4347 = !DILocalVariable(name: "value", arg: 1, scope: !4346, file: !72, line: 4717, type: !736)
!4348 = !DILocation(line: 4717, column: 31, scope: !4346)
!4349 = !DILocalVariable(name: "factor", arg: 2, scope: !4346, file: !72, line: 4717, type: !13)
!4350 = !DILocation(line: 4717, column: 42, scope: !4346)
!4351 = !DILocation(line: 4719, column: 41, scope: !4346)
!4352 = !DILocation(line: 4719, column: 47, scope: !4346)
!4353 = !DILocation(line: 4719, column: 10, scope: !4346)
!4354 = !DILocation(line: 4719, column: 3, scope: !4346)
!4355 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !72, file: !72, line: 5297, type: !4356, scopeLine: 5298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4356 = !DISubroutineType(types: !4357)
!4357 = !{!736, !736, !13, !736}
!4358 = !DILocalVariable(name: "value", arg: 1, scope: !4355, file: !72, line: 5297, type: !736)
!4359 = !DILocation(line: 5297, column: 40, scope: !4355)
!4360 = !DILocalVariable(name: "factor", arg: 2, scope: !4355, file: !72, line: 5297, type: !13)
!4361 = !DILocation(line: 5297, column: 50, scope: !4355)
!4362 = !DILocalVariable(name: "count", arg: 3, scope: !4355, file: !72, line: 5297, type: !736)
!4363 = !DILocation(line: 5297, column: 62, scope: !4355)
!4364 = !DILocalVariable(name: "u32Temp1", scope: !4355, file: !72, line: 5299, type: !736)
!4365 = !DILocation(line: 5299, column: 6, scope: !4355)
!4366 = !DILocalVariable(name: "u32Temp2", scope: !4355, file: !72, line: 5299, type: !736)
!4367 = !DILocation(line: 5299, column: 17, scope: !4355)
!4368 = !DILocalVariable(name: "u32Temp3", scope: !4355, file: !72, line: 5299, type: !736)
!4369 = !DILocation(line: 5299, column: 26, scope: !4355)
!4370 = !DILocalVariable(name: "u8SignBit", scope: !4355, file: !72, line: 5300, type: !17)
!4371 = !DILocation(line: 5300, column: 5, scope: !4355)
!4372 = !DILocation(line: 5302, column: 5, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4355, file: !72, line: 5302, column: 5)
!4374 = !DILocation(line: 5302, column: 11, scope: !4373)
!4375 = !DILocation(line: 5302, column: 5, scope: !4355)
!4376 = !DILocation(line: 5304, column: 13, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4373, file: !72, line: 5303, column: 2)
!4378 = !DILocation(line: 5305, column: 2, scope: !4377)
!4379 = !DILocation(line: 5308, column: 13, scope: !4380)
!4380 = distinct !DILexicalBlock(scope: !4373, file: !72, line: 5307, column: 2)
!4381 = !DILocation(line: 5312, column: 5, scope: !4382)
!4382 = distinct !DILexicalBlock(scope: !4355, file: !72, line: 5312, column: 5)
!4383 = !DILocation(line: 5312, column: 11, scope: !4382)
!4384 = !DILocation(line: 5312, column: 5, scope: !4355)
!4385 = !DILocation(line: 5314, column: 15, scope: !4386)
!4386 = distinct !DILexicalBlock(scope: !4382, file: !72, line: 5313, column: 2)
!4387 = !DILocation(line: 5314, column: 14, scope: !4386)
!4388 = !DILocation(line: 5314, column: 12, scope: !4386)
!4389 = !DILocation(line: 5315, column: 2, scope: !4386)
!4390 = !DILocation(line: 5318, column: 14, scope: !4391)
!4391 = distinct !DILexicalBlock(scope: !4382, file: !72, line: 5317, column: 2)
!4392 = !DILocation(line: 5318, column: 12, scope: !4391)
!4393 = !DILocation(line: 5321, column: 13, scope: !4355)
!4394 = !DILocation(line: 5321, column: 21, scope: !4355)
!4395 = !DILocation(line: 5321, column: 19, scope: !4355)
!4396 = !DILocation(line: 5321, column: 11, scope: !4355)
!4397 = !DILocation(line: 5322, column: 25, scope: !4355)
!4398 = !DILocation(line: 5322, column: 32, scope: !4355)
!4399 = !DILocation(line: 5322, column: 13, scope: !4355)
!4400 = !DILocation(line: 5322, column: 11, scope: !4355)
!4401 = !DILocation(line: 5323, column: 13, scope: !4355)
!4402 = !DILocation(line: 5323, column: 25, scope: !4355)
!4403 = !DILocation(line: 5323, column: 22, scope: !4355)
!4404 = !DILocation(line: 5323, column: 11, scope: !4355)
!4405 = !DILocation(line: 5324, column: 14, scope: !4355)
!4406 = !DILocation(line: 5324, column: 30, scope: !4355)
!4407 = !DILocation(line: 5324, column: 29, scope: !4355)
!4408 = !DILocation(line: 5324, column: 23, scope: !4355)
!4409 = !DILocation(line: 5324, column: 11, scope: !4355)
!4410 = !DILocation(line: 5325, column: 6, scope: !4411)
!4411 = distinct !DILexicalBlock(scope: !4355, file: !72, line: 5325, column: 5)
!4412 = !DILocation(line: 5325, column: 16, scope: !4411)
!4413 = !DILocation(line: 5325, column: 14, scope: !4411)
!4414 = !DILocation(line: 5325, column: 22, scope: !4411)
!4415 = !DILocation(line: 5325, column: 5, scope: !4355)
!4416 = !DILocation(line: 5327, column: 6, scope: !4417)
!4417 = distinct !DILexicalBlock(scope: !4418, file: !72, line: 5327, column: 6)
!4418 = distinct !DILexicalBlock(scope: !4411, file: !72, line: 5326, column: 2)
!4419 = !DILocation(line: 5327, column: 16, scope: !4417)
!4420 = !DILocation(line: 5327, column: 6, scope: !4418)
!4421 = !DILocation(line: 5329, column: 7, scope: !4422)
!4422 = distinct !DILexicalBlock(scope: !4423, file: !72, line: 5329, column: 7)
!4423 = distinct !DILexicalBlock(scope: !4417, file: !72, line: 5328, column: 3)
!4424 = !DILocation(line: 5329, column: 15, scope: !4422)
!4425 = !DILocation(line: 5329, column: 7, scope: !4423)
!4426 = !DILocation(line: 5330, column: 12, scope: !4422)
!4427 = !DILocation(line: 5330, column: 5, scope: !4422)
!4428 = !DILocation(line: 5332, column: 5, scope: !4422)
!4429 = !DILocation(line: 5336, column: 4, scope: !4430)
!4430 = distinct !DILexicalBlock(scope: !4417, file: !72, line: 5335, column: 3)
!4431 = !DILocation(line: 5341, column: 3, scope: !4432)
!4432 = distinct !DILexicalBlock(scope: !4411, file: !72, line: 5340, column: 2)
!4433 = !DILocation(line: 5343, column: 1, scope: !4355)
!4434 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !72, file: !72, line: 4741, type: !1321, scopeLine: 4742, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4435 = !DILocalVariable(name: "value", arg: 1, scope: !4434, file: !72, line: 4741, type: !736)
!4436 = !DILocation(line: 4741, column: 31, scope: !4434)
!4437 = !DILocalVariable(name: "factor", arg: 2, scope: !4434, file: !72, line: 4741, type: !80)
!4438 = !DILocation(line: 4741, column: 42, scope: !4434)
!4439 = !DILocation(line: 4743, column: 41, scope: !4434)
!4440 = !DILocation(line: 4743, column: 47, scope: !4434)
!4441 = !DILocation(line: 4743, column: 10, scope: !4434)
!4442 = !DILocation(line: 4743, column: 3, scope: !4434)
!4443 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !72, file: !72, line: 5361, type: !4444, scopeLine: 5362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4444 = !DISubroutineType(types: !4445)
!4445 = !{!736, !736, !80, !736}
!4446 = !DILocalVariable(name: "value", arg: 1, scope: !4443, file: !72, line: 5361, type: !736)
!4447 = !DILocation(line: 5361, column: 40, scope: !4443)
!4448 = !DILocalVariable(name: "factor", arg: 2, scope: !4443, file: !72, line: 5361, type: !80)
!4449 = !DILocation(line: 5361, column: 51, scope: !4443)
!4450 = !DILocalVariable(name: "count", arg: 3, scope: !4443, file: !72, line: 5361, type: !736)
!4451 = !DILocation(line: 5361, column: 63, scope: !4443)
!4452 = !DILocalVariable(name: "u32Temp1", scope: !4443, file: !72, line: 5363, type: !736)
!4453 = !DILocation(line: 5363, column: 6, scope: !4443)
!4454 = !DILocalVariable(name: "u32Temp2", scope: !4443, file: !72, line: 5363, type: !736)
!4455 = !DILocation(line: 5363, column: 17, scope: !4443)
!4456 = !DILocalVariable(name: "u8SignBit", scope: !4443, file: !72, line: 5364, type: !17)
!4457 = !DILocation(line: 5364, column: 5, scope: !4443)
!4458 = !DILocation(line: 5366, column: 5, scope: !4459)
!4459 = distinct !DILexicalBlock(scope: !4443, file: !72, line: 5366, column: 5)
!4460 = !DILocation(line: 5366, column: 11, scope: !4459)
!4461 = !DILocation(line: 5366, column: 5, scope: !4443)
!4462 = !DILocation(line: 5368, column: 13, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4459, file: !72, line: 5367, column: 2)
!4464 = !DILocation(line: 5369, column: 2, scope: !4463)
!4465 = !DILocation(line: 5372, column: 13, scope: !4466)
!4466 = distinct !DILexicalBlock(scope: !4459, file: !72, line: 5371, column: 2)
!4467 = !DILocation(line: 5376, column: 5, scope: !4468)
!4468 = distinct !DILexicalBlock(scope: !4443, file: !72, line: 5376, column: 5)
!4469 = !DILocation(line: 5376, column: 11, scope: !4468)
!4470 = !DILocation(line: 5376, column: 5, scope: !4443)
!4471 = !DILocation(line: 5378, column: 15, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4468, file: !72, line: 5377, column: 2)
!4473 = !DILocation(line: 5378, column: 14, scope: !4472)
!4474 = !DILocation(line: 5378, column: 12, scope: !4472)
!4475 = !DILocation(line: 5379, column: 2, scope: !4472)
!4476 = !DILocation(line: 5382, column: 14, scope: !4477)
!4477 = distinct !DILexicalBlock(scope: !4468, file: !72, line: 5381, column: 2)
!4478 = !DILocation(line: 5382, column: 12, scope: !4477)
!4479 = !DILocation(line: 5385, column: 25, scope: !4443)
!4480 = !DILocation(line: 5385, column: 32, scope: !4443)
!4481 = !DILocation(line: 5385, column: 13, scope: !4443)
!4482 = !DILocation(line: 5385, column: 11, scope: !4443)
!4483 = !DILocation(line: 5386, column: 13, scope: !4443)
!4484 = !DILocation(line: 5386, column: 26, scope: !4443)
!4485 = !DILocation(line: 5386, column: 31, scope: !4443)
!4486 = !DILocation(line: 5386, column: 22, scope: !4443)
!4487 = !DILocation(line: 5386, column: 11, scope: !4443)
!4488 = !DILocation(line: 5387, column: 5, scope: !4489)
!4489 = distinct !DILexicalBlock(scope: !4443, file: !72, line: 5387, column: 5)
!4490 = !DILocation(line: 5387, column: 15, scope: !4489)
!4491 = !DILocation(line: 5387, column: 5, scope: !4443)
!4492 = !DILocation(line: 5389, column: 10, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4489, file: !72, line: 5388, column: 2)
!4494 = !DILocation(line: 5389, column: 3, scope: !4493)
!4495 = !DILocation(line: 5393, column: 3, scope: !4496)
!4496 = distinct !DILexicalBlock(scope: !4489, file: !72, line: 5392, column: 2)
!4497 = !DILocation(line: 5395, column: 1, scope: !4443)
!4498 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !72, file: !72, line: 4765, type: !3118, scopeLine: 4766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4499 = !DILocalVariable(name: "value", arg: 1, scope: !4498, file: !72, line: 4765, type: !736)
!4500 = !DILocation(line: 4765, column: 30, scope: !4498)
!4501 = !DILocalVariable(name: "factor", arg: 2, scope: !4498, file: !72, line: 4765, type: !6)
!4502 = !DILocation(line: 4765, column: 40, scope: !4498)
!4503 = !DILocation(line: 4767, column: 40, scope: !4498)
!4504 = !DILocation(line: 4767, column: 46, scope: !4498)
!4505 = !DILocation(line: 4767, column: 10, scope: !4498)
!4506 = !DILocation(line: 4767, column: 3, scope: !4498)
!4507 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !72, file: !72, line: 5439, type: !4508, scopeLine: 5440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4508 = !DISubroutineType(types: !4509)
!4509 = !{!736, !736, !6, !736}
!4510 = !DILocalVariable(name: "value", arg: 1, scope: !4507, file: !72, line: 5439, type: !736)
!4511 = !DILocation(line: 5439, column: 39, scope: !4507)
!4512 = !DILocalVariable(name: "factor", arg: 2, scope: !4507, file: !72, line: 5439, type: !6)
!4513 = !DILocation(line: 5439, column: 49, scope: !4507)
!4514 = !DILocalVariable(name: "count", arg: 3, scope: !4507, file: !72, line: 5439, type: !736)
!4515 = !DILocation(line: 5439, column: 61, scope: !4507)
!4516 = !DILocalVariable(name: "u32Temp1", scope: !4507, file: !72, line: 5441, type: !736)
!4517 = !DILocation(line: 5441, column: 6, scope: !4507)
!4518 = !DILocalVariable(name: "u32Temp2", scope: !4507, file: !72, line: 5441, type: !736)
!4519 = !DILocation(line: 5441, column: 17, scope: !4507)
!4520 = !DILocalVariable(name: "u32Temp3", scope: !4507, file: !72, line: 5441, type: !736)
!4521 = !DILocation(line: 5441, column: 26, scope: !4507)
!4522 = !DILocalVariable(name: "u8SignBit", scope: !4507, file: !72, line: 5442, type: !17)
!4523 = !DILocation(line: 5442, column: 5, scope: !4507)
!4524 = !DILocation(line: 5444, column: 5, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4507, file: !72, line: 5444, column: 5)
!4526 = !DILocation(line: 5444, column: 11, scope: !4525)
!4527 = !DILocation(line: 5444, column: 5, scope: !4507)
!4528 = !DILocation(line: 5446, column: 13, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4525, file: !72, line: 5445, column: 2)
!4530 = !DILocation(line: 5447, column: 2, scope: !4529)
!4531 = !DILocation(line: 5450, column: 13, scope: !4532)
!4532 = distinct !DILexicalBlock(scope: !4525, file: !72, line: 5449, column: 2)
!4533 = !DILocation(line: 5454, column: 5, scope: !4534)
!4534 = distinct !DILexicalBlock(scope: !4507, file: !72, line: 5454, column: 5)
!4535 = !DILocation(line: 5454, column: 11, scope: !4534)
!4536 = !DILocation(line: 5454, column: 5, scope: !4507)
!4537 = !DILocation(line: 5456, column: 15, scope: !4538)
!4538 = distinct !DILexicalBlock(scope: !4534, file: !72, line: 5455, column: 2)
!4539 = !DILocation(line: 5456, column: 14, scope: !4538)
!4540 = !DILocation(line: 5456, column: 12, scope: !4538)
!4541 = !DILocation(line: 5457, column: 2, scope: !4538)
!4542 = !DILocation(line: 5460, column: 14, scope: !4543)
!4543 = distinct !DILexicalBlock(scope: !4534, file: !72, line: 5459, column: 2)
!4544 = !DILocation(line: 5460, column: 12, scope: !4543)
!4545 = !DILocation(line: 5463, column: 13, scope: !4507)
!4546 = !DILocation(line: 5463, column: 21, scope: !4507)
!4547 = !DILocation(line: 5463, column: 19, scope: !4507)
!4548 = !DILocation(line: 5463, column: 11, scope: !4507)
!4549 = !DILocation(line: 5464, column: 25, scope: !4507)
!4550 = !DILocation(line: 5464, column: 32, scope: !4507)
!4551 = !DILocation(line: 5464, column: 13, scope: !4507)
!4552 = !DILocation(line: 5464, column: 11, scope: !4507)
!4553 = !DILocation(line: 5465, column: 13, scope: !4507)
!4554 = !DILocation(line: 5465, column: 25, scope: !4507)
!4555 = !DILocation(line: 5465, column: 22, scope: !4507)
!4556 = !DILocation(line: 5465, column: 11, scope: !4507)
!4557 = !DILocation(line: 5466, column: 14, scope: !4507)
!4558 = !DILocation(line: 5466, column: 30, scope: !4507)
!4559 = !DILocation(line: 5466, column: 29, scope: !4507)
!4560 = !DILocation(line: 5466, column: 23, scope: !4507)
!4561 = !DILocation(line: 5466, column: 11, scope: !4507)
!4562 = !DILocation(line: 5467, column: 6, scope: !4563)
!4563 = distinct !DILexicalBlock(scope: !4507, file: !72, line: 5467, column: 5)
!4564 = !DILocation(line: 5467, column: 16, scope: !4563)
!4565 = !DILocation(line: 5467, column: 14, scope: !4563)
!4566 = !DILocation(line: 5467, column: 22, scope: !4563)
!4567 = !DILocation(line: 5467, column: 5, scope: !4507)
!4568 = !DILocation(line: 5469, column: 6, scope: !4569)
!4569 = distinct !DILexicalBlock(scope: !4570, file: !72, line: 5469, column: 6)
!4570 = distinct !DILexicalBlock(scope: !4563, file: !72, line: 5468, column: 2)
!4571 = !DILocation(line: 5469, column: 16, scope: !4569)
!4572 = !DILocation(line: 5469, column: 6, scope: !4570)
!4573 = !DILocation(line: 5471, column: 7, scope: !4574)
!4574 = distinct !DILexicalBlock(scope: !4575, file: !72, line: 5471, column: 7)
!4575 = distinct !DILexicalBlock(scope: !4569, file: !72, line: 5470, column: 3)
!4576 = !DILocation(line: 5471, column: 15, scope: !4574)
!4577 = !DILocation(line: 5471, column: 7, scope: !4575)
!4578 = !DILocation(line: 5472, column: 12, scope: !4574)
!4579 = !DILocation(line: 5472, column: 5, scope: !4574)
!4580 = !DILocation(line: 5474, column: 5, scope: !4574)
!4581 = !DILocation(line: 5478, column: 4, scope: !4582)
!4582 = distinct !DILexicalBlock(scope: !4569, file: !72, line: 5477, column: 3)
!4583 = !DILocation(line: 5483, column: 3, scope: !4584)
!4584 = distinct !DILexicalBlock(scope: !4563, file: !72, line: 5482, column: 2)
!4585 = !DILocation(line: 5485, column: 1, scope: !4507)
!4586 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !72, file: !72, line: 4789, type: !1117, scopeLine: 4790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4587 = !DILocalVariable(name: "value", arg: 1, scope: !4586, file: !72, line: 4789, type: !736)
!4588 = !DILocation(line: 4789, column: 31, scope: !4586)
!4589 = !DILocalVariable(name: "factor", arg: 2, scope: !4586, file: !72, line: 4789, type: !22)
!4590 = !DILocation(line: 4789, column: 42, scope: !4586)
!4591 = !DILocation(line: 4791, column: 41, scope: !4586)
!4592 = !DILocation(line: 4791, column: 47, scope: !4586)
!4593 = !DILocation(line: 4791, column: 10, scope: !4586)
!4594 = !DILocation(line: 4791, column: 3, scope: !4586)
!4595 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !72, file: !72, line: 4813, type: !1412, scopeLine: 4814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4596 = !DILocalVariable(name: "value", arg: 1, scope: !4595, file: !72, line: 4813, type: !736)
!4597 = !DILocation(line: 4813, column: 31, scope: !4595)
!4598 = !DILocalVariable(name: "factor", arg: 2, scope: !4595, file: !72, line: 4813, type: !736)
!4599 = !DILocation(line: 4813, column: 42, scope: !4595)
!4600 = !DILocation(line: 4815, column: 41, scope: !4595)
!4601 = !DILocation(line: 4815, column: 47, scope: !4595)
!4602 = !DILocation(line: 4815, column: 10, scope: !4595)
!4603 = !DILocation(line: 4815, column: 3, scope: !4595)
!4604 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !72, file: !72, line: 5412, type: !4605, scopeLine: 5413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4605 = !DISubroutineType(types: !4606)
!4606 = !{!736, !736, !736, !736}
!4607 = !DILocalVariable(name: "value", arg: 1, scope: !4604, file: !72, line: 5412, type: !736)
!4608 = !DILocation(line: 5412, column: 40, scope: !4604)
!4609 = !DILocalVariable(name: "factor", arg: 2, scope: !4604, file: !72, line: 5412, type: !736)
!4610 = !DILocation(line: 5412, column: 50, scope: !4604)
!4611 = !DILocalVariable(name: "count", arg: 3, scope: !4604, file: !72, line: 5412, type: !736)
!4612 = !DILocation(line: 5412, column: 62, scope: !4604)
!4613 = !DILocalVariable(name: "u32Temp1", scope: !4604, file: !72, line: 5414, type: !736)
!4614 = !DILocation(line: 5414, column: 6, scope: !4604)
!4615 = !DILocalVariable(name: "u32Temp2", scope: !4604, file: !72, line: 5414, type: !736)
!4616 = !DILocation(line: 5414, column: 17, scope: !4604)
!4617 = !DILocalVariable(name: "u32Temp3", scope: !4604, file: !72, line: 5414, type: !736)
!4618 = !DILocation(line: 5414, column: 26, scope: !4604)
!4619 = !DILocalVariable(name: "u32Temp4", scope: !4604, file: !72, line: 5414, type: !736)
!4620 = !DILocation(line: 5414, column: 35, scope: !4604)
!4621 = !DILocalVariable(name: "u8SignBit", scope: !4604, file: !72, line: 5415, type: !17)
!4622 = !DILocation(line: 5415, column: 5, scope: !4604)
!4623 = !DILocation(line: 5417, column: 25, scope: !4604)
!4624 = !DILocation(line: 5417, column: 32, scope: !4604)
!4625 = !DILocation(line: 5417, column: 13, scope: !4604)
!4626 = !DILocation(line: 5417, column: 11, scope: !4604)
!4627 = !DILocation(line: 5418, column: 13, scope: !4604)
!4628 = !DILocation(line: 5418, column: 26, scope: !4604)
!4629 = !DILocation(line: 5418, column: 31, scope: !4604)
!4630 = !DILocation(line: 5418, column: 22, scope: !4604)
!4631 = !DILocation(line: 5418, column: 11, scope: !4604)
!4632 = !DILocation(line: 5419, column: 9, scope: !4604)
!4633 = !DILocation(line: 5419, column: 2, scope: !4604)
!4634 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !72, file: !72, line: 4837, type: !3057, scopeLine: 4838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4635 = !DILocalVariable(name: "value", arg: 1, scope: !4634, file: !72, line: 4837, type: !736)
!4636 = !DILocation(line: 4837, column: 30, scope: !4634)
!4637 = !DILocalVariable(name: "factor", arg: 2, scope: !4634, file: !72, line: 4837, type: !17)
!4638 = !DILocation(line: 4837, column: 40, scope: !4634)
!4639 = !DILocation(line: 4839, column: 40, scope: !4634)
!4640 = !DILocation(line: 4839, column: 46, scope: !4634)
!4641 = !DILocation(line: 4839, column: 10, scope: !4634)
!4642 = !DILocation(line: 4839, column: 3, scope: !4634)
!4643 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !72, file: !72, line: 5503, type: !4644, scopeLine: 5504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4644 = !DISubroutineType(types: !4645)
!4645 = !{!736, !736, !17, !736}
!4646 = !DILocalVariable(name: "value", arg: 1, scope: !4643, file: !72, line: 5503, type: !736)
!4647 = !DILocation(line: 5503, column: 39, scope: !4643)
!4648 = !DILocalVariable(name: "factor", arg: 2, scope: !4643, file: !72, line: 5503, type: !17)
!4649 = !DILocation(line: 5503, column: 49, scope: !4643)
!4650 = !DILocalVariable(name: "count", arg: 3, scope: !4643, file: !72, line: 5503, type: !736)
!4651 = !DILocation(line: 5503, column: 61, scope: !4643)
!4652 = !DILocalVariable(name: "u32Temp1", scope: !4643, file: !72, line: 5505, type: !736)
!4653 = !DILocation(line: 5505, column: 6, scope: !4643)
!4654 = !DILocalVariable(name: "u32Temp2", scope: !4643, file: !72, line: 5505, type: !736)
!4655 = !DILocation(line: 5505, column: 17, scope: !4643)
!4656 = !DILocation(line: 5507, column: 13, scope: !4643)
!4657 = !DILocation(line: 5507, column: 21, scope: !4643)
!4658 = !DILocation(line: 5507, column: 19, scope: !4643)
!4659 = !DILocation(line: 5507, column: 11, scope: !4643)
!4660 = !DILocation(line: 5508, column: 25, scope: !4643)
!4661 = !DILocation(line: 5508, column: 32, scope: !4643)
!4662 = !DILocation(line: 5508, column: 13, scope: !4643)
!4663 = !DILocation(line: 5508, column: 11, scope: !4643)
!4664 = !DILocation(line: 5509, column: 13, scope: !4643)
!4665 = !DILocation(line: 5509, column: 25, scope: !4643)
!4666 = !DILocation(line: 5509, column: 22, scope: !4643)
!4667 = !DILocation(line: 5509, column: 11, scope: !4643)
!4668 = !DILocation(line: 5510, column: 14, scope: !4643)
!4669 = !DILocation(line: 5510, column: 30, scope: !4643)
!4670 = !DILocation(line: 5510, column: 29, scope: !4643)
!4671 = !DILocation(line: 5510, column: 23, scope: !4643)
!4672 = !DILocation(line: 5510, column: 11, scope: !4643)
!4673 = !DILocation(line: 5511, column: 6, scope: !4674)
!4674 = distinct !DILexicalBlock(scope: !4643, file: !72, line: 5511, column: 5)
!4675 = !DILocation(line: 5511, column: 16, scope: !4674)
!4676 = !DILocation(line: 5511, column: 14, scope: !4674)
!4677 = !DILocation(line: 5511, column: 22, scope: !4674)
!4678 = !DILocation(line: 5511, column: 5, scope: !4643)
!4679 = !DILocation(line: 5513, column: 6, scope: !4680)
!4680 = distinct !DILexicalBlock(scope: !4681, file: !72, line: 5513, column: 6)
!4681 = distinct !DILexicalBlock(scope: !4674, file: !72, line: 5512, column: 2)
!4682 = !DILocation(line: 5513, column: 14, scope: !4680)
!4683 = !DILocation(line: 5513, column: 6, scope: !4681)
!4684 = !DILocation(line: 5514, column: 11, scope: !4680)
!4685 = !DILocation(line: 5514, column: 4, scope: !4680)
!4686 = !DILocation(line: 5516, column: 4, scope: !4680)
!4687 = !DILocation(line: 5520, column: 3, scope: !4688)
!4688 = distinct !DILexicalBlock(scope: !4674, file: !72, line: 5519, column: 2)
!4689 = !DILocation(line: 5522, column: 1, scope: !4643)
!4690 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !72, file: !72, line: 4860, type: !885, scopeLine: 4861, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4691 = !DILocalVariable(name: "value", arg: 1, scope: !4690, file: !72, line: 4860, type: !17)
!4692 = !DILocation(line: 4860, column: 28, scope: !4690)
!4693 = !DILocalVariable(name: "factor", arg: 2, scope: !4690, file: !72, line: 4860, type: !17)
!4694 = !DILocation(line: 4860, column: 38, scope: !4690)
!4695 = !DILocation(line: 4862, column: 38, scope: !4690)
!4696 = !DILocation(line: 4862, column: 44, scope: !4690)
!4697 = !DILocation(line: 4862, column: 10, scope: !4690)
!4698 = !DILocation(line: 4862, column: 3, scope: !4690)
!4699 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !72, file: !72, line: 4883, type: !885, scopeLine: 4884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4700 = !DILocalVariable(name: "value", arg: 1, scope: !4699, file: !72, line: 4883, type: !17)
!4701 = !DILocation(line: 4883, column: 28, scope: !4699)
!4702 = !DILocalVariable(name: "factor", arg: 2, scope: !4699, file: !72, line: 4883, type: !17)
!4703 = !DILocation(line: 4883, column: 38, scope: !4699)
!4704 = !DILocation(line: 4885, column: 38, scope: !4699)
!4705 = !DILocation(line: 4885, column: 44, scope: !4699)
!4706 = !DILocation(line: 4885, column: 10, scope: !4699)
!4707 = !DILocation(line: 4885, column: 3, scope: !4699)
!4708 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !72, file: !72, line: 4907, type: !885, scopeLine: 4908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4709 = !DILocalVariable(name: "value", arg: 1, scope: !4708, file: !72, line: 4907, type: !17)
!4710 = !DILocation(line: 4907, column: 26, scope: !4708)
!4711 = !DILocalVariable(name: "factor", arg: 2, scope: !4708, file: !72, line: 4907, type: !17)
!4712 = !DILocation(line: 4907, column: 36, scope: !4708)
!4713 = !DILocation(line: 4909, column: 38, scope: !4708)
!4714 = !DILocation(line: 4909, column: 44, scope: !4708)
!4715 = !DILocation(line: 4909, column: 10, scope: !4708)
!4716 = !DILocation(line: 4909, column: 3, scope: !4708)
!4717 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !72, file: !72, line: 4931, type: !885, scopeLine: 4932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4718 = !DILocalVariable(name: "value", arg: 1, scope: !4717, file: !72, line: 4931, type: !17)
!4719 = !DILocation(line: 4931, column: 28, scope: !4717)
!4720 = !DILocalVariable(name: "factor", arg: 2, scope: !4717, file: !72, line: 4931, type: !17)
!4721 = !DILocation(line: 4931, column: 38, scope: !4717)
!4722 = !DILocation(line: 4933, column: 41, scope: !4717)
!4723 = !DILocation(line: 4933, column: 47, scope: !4717)
!4724 = !DILocation(line: 4933, column: 10, scope: !4717)
!4725 = !DILocation(line: 4933, column: 3, scope: !4717)
!4726 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !72, file: !72, line: 4955, type: !885, scopeLine: 4956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4727 = !DILocalVariable(name: "value", arg: 1, scope: !4726, file: !72, line: 4955, type: !17)
!4728 = !DILocation(line: 4955, column: 26, scope: !4726)
!4729 = !DILocalVariable(name: "factor", arg: 2, scope: !4726, file: !72, line: 4955, type: !17)
!4730 = !DILocation(line: 4955, column: 36, scope: !4726)
!4731 = !DILocation(line: 4957, column: 41, scope: !4726)
!4732 = !DILocation(line: 4957, column: 47, scope: !4726)
!4733 = !DILocation(line: 4957, column: 10, scope: !4726)
!4734 = !DILocation(line: 4957, column: 3, scope: !4726)
!4735 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !72, file: !72, line: 4978, type: !885, scopeLine: 4979, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4736 = !DILocalVariable(name: "value", arg: 1, scope: !4735, file: !72, line: 4978, type: !17)
!4737 = !DILocation(line: 4978, column: 26, scope: !4735)
!4738 = !DILocalVariable(name: "factor", arg: 2, scope: !4735, file: !72, line: 4978, type: !17)
!4739 = !DILocation(line: 4978, column: 36, scope: !4735)
!4740 = !DILocation(line: 4980, column: 41, scope: !4735)
!4741 = !DILocation(line: 4980, column: 47, scope: !4735)
!4742 = !DILocation(line: 4980, column: 10, scope: !4735)
!4743 = !DILocation(line: 4980, column: 3, scope: !4735)
!4744 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !72, file: !72, line: 5001, type: !885, scopeLine: 5002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4745 = !DILocalVariable(name: "value", arg: 1, scope: !4744, file: !72, line: 5001, type: !17)
!4746 = !DILocation(line: 5001, column: 25, scope: !4744)
!4747 = !DILocalVariable(name: "factor", arg: 2, scope: !4744, file: !72, line: 5001, type: !17)
!4748 = !DILocation(line: 5001, column: 35, scope: !4744)
!4749 = !DILocation(line: 5003, column: 41, scope: !4744)
!4750 = !DILocation(line: 5003, column: 47, scope: !4744)
!4751 = !DILocation(line: 5003, column: 10, scope: !4744)
!4752 = !DILocation(line: 5003, column: 3, scope: !4744)
!4753 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !72, file: !72, line: 5024, type: !885, scopeLine: 5025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4754 = !DILocalVariable(name: "value", arg: 1, scope: !4753, file: !72, line: 5024, type: !17)
!4755 = !DILocation(line: 5024, column: 26, scope: !4753)
!4756 = !DILocalVariable(name: "factor", arg: 2, scope: !4753, file: !72, line: 5024, type: !17)
!4757 = !DILocation(line: 5024, column: 35, scope: !4753)
!4758 = !DILocation(line: 5026, column: 41, scope: !4753)
!4759 = !DILocation(line: 5026, column: 47, scope: !4753)
!4760 = !DILocation(line: 5026, column: 10, scope: !4753)
!4761 = !DILocation(line: 5026, column: 3, scope: !4753)
!4762 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !72, file: !72, line: 5047, type: !885, scopeLine: 5048, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4763 = !DILocalVariable(name: "value", arg: 1, scope: !4762, file: !72, line: 5047, type: !17)
!4764 = !DILocation(line: 5047, column: 25, scope: !4762)
!4765 = !DILocalVariable(name: "factor", arg: 2, scope: !4762, file: !72, line: 5047, type: !17)
!4766 = !DILocation(line: 5047, column: 35, scope: !4762)
!4767 = !DILocation(line: 5049, column: 41, scope: !4762)
!4768 = !DILocation(line: 5049, column: 47, scope: !4762)
!4769 = !DILocation(line: 5049, column: 10, scope: !4762)
!4770 = !DILocation(line: 5049, column: 3, scope: !4762)
!4771 = distinct !DISubprogram(name: "MulHighWord", scope: !4772, file: !4772, line: 39, type: !1412, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4772 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac2/alarm_0112")
!4773 = !DILocalVariable(name: "arg1", arg: 1, scope: !4771, file: !4772, line: 39, type: !736)
!4774 = !DILocation(line: 39, column: 30, scope: !4771)
!4775 = !DILocalVariable(name: "arg2", arg: 2, scope: !4771, file: !4772, line: 39, type: !736)
!4776 = !DILocation(line: 39, column: 48, scope: !4771)
!4777 = !DILocalVariable(name: "arg1_LW", scope: !4771, file: !4772, line: 41, type: !22)
!4778 = !DILocation(line: 41, column: 6, scope: !4771)
!4779 = !DILocalVariable(name: "arg1_HW", scope: !4771, file: !4772, line: 41, type: !22)
!4780 = !DILocation(line: 41, column: 14, scope: !4771)
!4781 = !DILocalVariable(name: "arg2_LW", scope: !4771, file: !4772, line: 41, type: !22)
!4782 = !DILocation(line: 41, column: 22, scope: !4771)
!4783 = !DILocalVariable(name: "arg2_HW", scope: !4771, file: !4772, line: 41, type: !22)
!4784 = !DILocation(line: 41, column: 30, scope: !4771)
!4785 = !DILocalVariable(name: "MulTemp1", scope: !4771, file: !4772, line: 42, type: !736)
!4786 = !DILocation(line: 42, column: 6, scope: !4771)
!4787 = !DILocalVariable(name: "MulTemp2", scope: !4771, file: !4772, line: 42, type: !736)
!4788 = !DILocation(line: 42, column: 16, scope: !4771)
!4789 = !DILocalVariable(name: "MulTemp3", scope: !4771, file: !4772, line: 42, type: !736)
!4790 = !DILocation(line: 42, column: 26, scope: !4771)
!4791 = !DILocalVariable(name: "MulTemp4", scope: !4771, file: !4772, line: 42, type: !736)
!4792 = !DILocation(line: 42, column: 36, scope: !4771)
!4793 = !DILocalVariable(name: "HIGHWORD", scope: !4771, file: !4772, line: 42, type: !736)
!4794 = !DILocation(line: 42, column: 47, scope: !4771)
!4795 = !DILocalVariable(name: "OverFlow", scope: !4771, file: !4772, line: 42, type: !736)
!4796 = !DILocation(line: 42, column: 57, scope: !4771)
!4797 = !DILocation(line: 43, column: 12, scope: !4771)
!4798 = !DILocation(line: 43, column: 17, scope: !4771)
!4799 = !DILocation(line: 43, column: 10, scope: !4771)
!4800 = !DILocation(line: 44, column: 13, scope: !4771)
!4801 = !DILocation(line: 44, column: 18, scope: !4771)
!4802 = !DILocation(line: 44, column: 31, scope: !4771)
!4803 = !DILocation(line: 44, column: 12, scope: !4771)
!4804 = !DILocation(line: 44, column: 10, scope: !4771)
!4805 = !DILocation(line: 45, column: 12, scope: !4771)
!4806 = !DILocation(line: 45, column: 17, scope: !4771)
!4807 = !DILocation(line: 45, column: 10, scope: !4771)
!4808 = !DILocation(line: 46, column: 13, scope: !4771)
!4809 = !DILocation(line: 46, column: 18, scope: !4771)
!4810 = !DILocation(line: 46, column: 31, scope: !4771)
!4811 = !DILocation(line: 46, column: 12, scope: !4771)
!4812 = !DILocation(line: 46, column: 10, scope: !4771)
!4813 = !DILocation(line: 48, column: 48, scope: !4814)
!4814 = distinct !DILexicalBlock(scope: !4771, file: !4772, line: 48, column: 6)
!4815 = !DILocation(line: 48, column: 43, scope: !4814)
!4816 = !DILocation(line: 48, column: 33, scope: !4814)
!4817 = !DILocation(line: 48, column: 73, scope: !4814)
!4818 = !DILocation(line: 48, column: 68, scope: !4814)
!4819 = !DILocation(line: 48, column: 58, scope: !4814)
!4820 = !DILocation(line: 48, column: 8, scope: !4814)
!4821 = !DILocation(line: 48, column: 6, scope: !4771)
!4822 = !DILocation(line: 49, column: 6, scope: !4823)
!4823 = distinct !DILexicalBlock(scope: !4814, file: !4772, line: 48, column: 85)
!4824 = !DILocation(line: 51, column: 13, scope: !4771)
!4825 = !DILocation(line: 51, column: 23, scope: !4771)
!4826 = !DILocation(line: 51, column: 21, scope: !4771)
!4827 = !DILocation(line: 51, column: 11, scope: !4771)
!4828 = !DILocation(line: 52, column: 13, scope: !4771)
!4829 = !DILocation(line: 52, column: 23, scope: !4771)
!4830 = !DILocation(line: 52, column: 21, scope: !4771)
!4831 = !DILocation(line: 52, column: 11, scope: !4771)
!4832 = !DILocation(line: 53, column: 13, scope: !4771)
!4833 = !DILocation(line: 53, column: 23, scope: !4771)
!4834 = !DILocation(line: 53, column: 21, scope: !4771)
!4835 = !DILocation(line: 53, column: 11, scope: !4771)
!4836 = !DILocation(line: 54, column: 13, scope: !4771)
!4837 = !DILocation(line: 54, column: 23, scope: !4771)
!4838 = !DILocation(line: 54, column: 21, scope: !4771)
!4839 = !DILocation(line: 54, column: 11, scope: !4771)
!4840 = !DILocation(line: 56, column: 14, scope: !4771)
!4841 = !DILocation(line: 56, column: 23, scope: !4771)
!4842 = !DILocation(line: 56, column: 33, scope: !4771)
!4843 = !DILocation(line: 56, column: 42, scope: !4771)
!4844 = !DILocation(line: 56, column: 30, scope: !4771)
!4845 = !DILocation(line: 56, column: 51, scope: !4771)
!4846 = !DILocation(line: 56, column: 49, scope: !4771)
!4847 = !DILocation(line: 56, column: 11, scope: !4771)
!4848 = !DILocation(line: 57, column: 14, scope: !4771)
!4849 = !DILocation(line: 57, column: 22, scope: !4771)
!4850 = !DILocation(line: 57, column: 31, scope: !4771)
!4851 = !DILocation(line: 57, column: 40, scope: !4771)
!4852 = !DILocation(line: 57, column: 28, scope: !4771)
!4853 = !DILocation(line: 57, column: 53, scope: !4771)
!4854 = !DILocation(line: 57, column: 62, scope: !4771)
!4855 = !DILocation(line: 57, column: 50, scope: !4771)
!4856 = !DILocation(line: 57, column: 11, scope: !4771)
!4857 = !DILocation(line: 58, column: 6, scope: !4858)
!4858 = distinct !DILexicalBlock(scope: !4771, file: !4772, line: 58, column: 6)
!4859 = !DILocation(line: 58, column: 15, scope: !4858)
!4860 = !DILocation(line: 58, column: 6, scope: !4771)
!4861 = !DILocation(line: 60, column: 10, scope: !4862)
!4862 = distinct !DILexicalBlock(scope: !4858, file: !4772, line: 59, column: 2)
!4863 = !DILocation(line: 60, column: 22, scope: !4862)
!4864 = !DILocation(line: 60, column: 30, scope: !4862)
!4865 = !DILocation(line: 60, column: 19, scope: !4862)
!4866 = !DILocation(line: 60, column: 3, scope: !4862)
!4867 = !DILocation(line: 64, column: 10, scope: !4868)
!4868 = distinct !DILexicalBlock(scope: !4858, file: !4772, line: 63, column: 2)
!4869 = !DILocation(line: 64, column: 3, scope: !4868)
!4870 = !DILocation(line: 66, column: 1, scope: !4771)
!4871 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !4872, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4872 = !DISubroutineType(types: !4873)
!4873 = !{!37, !26, !26}
!4874 = !DILocalVariable(name: "left", arg: 1, scope: !4871, file: !30, line: 78, type: !26)
!4875 = !DILocation(line: 78, column: 38, scope: !4871)
!4876 = !DILocalVariable(name: "right", arg: 2, scope: !4871, file: !30, line: 78, type: !26)
!4877 = !DILocation(line: 78, column: 52, scope: !4871)
!4878 = !DILocation(line: 80, column: 12, scope: !4871)
!4879 = !DILocation(line: 80, column: 19, scope: !4871)
!4880 = !DILocation(line: 80, column: 17, scope: !4871)
!4881 = !DILocation(line: 80, column: 25, scope: !4871)
!4882 = !DILocation(line: 80, column: 5, scope: !4871)
!4883 = distinct !DISubprogram(name: "MulLowWord", scope: !4772, file: !4772, line: 82, type: !1412, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4884 = !DILocalVariable(name: "arg1", arg: 1, scope: !4883, file: !4772, line: 82, type: !736)
!4885 = !DILocation(line: 82, column: 29, scope: !4883)
!4886 = !DILocalVariable(name: "arg2", arg: 2, scope: !4883, file: !4772, line: 82, type: !736)
!4887 = !DILocation(line: 82, column: 47, scope: !4883)
!4888 = !DILocalVariable(name: "arg1_LW", scope: !4883, file: !4772, line: 84, type: !22)
!4889 = !DILocation(line: 84, column: 6, scope: !4883)
!4890 = !DILocalVariable(name: "arg1_HW", scope: !4883, file: !4772, line: 84, type: !22)
!4891 = !DILocation(line: 84, column: 14, scope: !4883)
!4892 = !DILocalVariable(name: "arg2_LW", scope: !4883, file: !4772, line: 84, type: !22)
!4893 = !DILocation(line: 84, column: 22, scope: !4883)
!4894 = !DILocalVariable(name: "arg2_HW", scope: !4883, file: !4772, line: 84, type: !22)
!4895 = !DILocation(line: 84, column: 30, scope: !4883)
!4896 = !DILocalVariable(name: "MulTemp1", scope: !4883, file: !4772, line: 85, type: !736)
!4897 = !DILocation(line: 85, column: 6, scope: !4883)
!4898 = !DILocalVariable(name: "MulTemp2", scope: !4883, file: !4772, line: 85, type: !736)
!4899 = !DILocation(line: 85, column: 16, scope: !4883)
!4900 = !DILocalVariable(name: "MulTemp3", scope: !4883, file: !4772, line: 85, type: !736)
!4901 = !DILocation(line: 85, column: 26, scope: !4883)
!4902 = !DILocalVariable(name: "MulTemp4", scope: !4883, file: !4772, line: 85, type: !736)
!4903 = !DILocation(line: 85, column: 36, scope: !4883)
!4904 = !DILocalVariable(name: "HIGHWORD", scope: !4883, file: !4772, line: 85, type: !736)
!4905 = !DILocation(line: 85, column: 47, scope: !4883)
!4906 = !DILocalVariable(name: "OverFlow", scope: !4883, file: !4772, line: 85, type: !736)
!4907 = !DILocation(line: 85, column: 57, scope: !4883)
!4908 = !DILocation(line: 86, column: 12, scope: !4883)
!4909 = !DILocation(line: 86, column: 17, scope: !4883)
!4910 = !DILocation(line: 86, column: 10, scope: !4883)
!4911 = !DILocation(line: 87, column: 13, scope: !4883)
!4912 = !DILocation(line: 87, column: 18, scope: !4883)
!4913 = !DILocation(line: 87, column: 31, scope: !4883)
!4914 = !DILocation(line: 87, column: 12, scope: !4883)
!4915 = !DILocation(line: 87, column: 10, scope: !4883)
!4916 = !DILocation(line: 88, column: 12, scope: !4883)
!4917 = !DILocation(line: 88, column: 17, scope: !4883)
!4918 = !DILocation(line: 88, column: 10, scope: !4883)
!4919 = !DILocation(line: 89, column: 13, scope: !4883)
!4920 = !DILocation(line: 89, column: 18, scope: !4883)
!4921 = !DILocation(line: 89, column: 31, scope: !4883)
!4922 = !DILocation(line: 89, column: 12, scope: !4883)
!4923 = !DILocation(line: 89, column: 10, scope: !4883)
!4924 = !DILocation(line: 90, column: 13, scope: !4883)
!4925 = !DILocation(line: 90, column: 23, scope: !4883)
!4926 = !DILocation(line: 90, column: 21, scope: !4883)
!4927 = !DILocation(line: 90, column: 11, scope: !4883)
!4928 = !DILocation(line: 91, column: 13, scope: !4883)
!4929 = !DILocation(line: 91, column: 23, scope: !4883)
!4930 = !DILocation(line: 91, column: 21, scope: !4883)
!4931 = !DILocation(line: 91, column: 11, scope: !4883)
!4932 = !DILocation(line: 92, column: 13, scope: !4883)
!4933 = !DILocation(line: 92, column: 23, scope: !4883)
!4934 = !DILocation(line: 92, column: 21, scope: !4883)
!4935 = !DILocation(line: 92, column: 11, scope: !4883)
!4936 = !DILocation(line: 93, column: 13, scope: !4883)
!4937 = !DILocation(line: 93, column: 23, scope: !4883)
!4938 = !DILocation(line: 93, column: 21, scope: !4883)
!4939 = !DILocation(line: 93, column: 11, scope: !4883)
!4940 = !DILocation(line: 94, column: 14, scope: !4883)
!4941 = !DILocation(line: 94, column: 28, scope: !4883)
!4942 = !DILocation(line: 94, column: 37, scope: !4883)
!4943 = !DILocation(line: 94, column: 46, scope: !4883)
!4944 = !DILocation(line: 94, column: 24, scope: !4883)
!4945 = !DILocation(line: 94, column: 56, scope: !4883)
!4946 = !DILocation(line: 94, column: 65, scope: !4883)
!4947 = !DILocation(line: 94, column: 74, scope: !4883)
!4948 = !DILocation(line: 94, column: 52, scope: !4883)
!4949 = !DILocation(line: 94, column: 11, scope: !4883)
!4950 = !DILocation(line: 96, column: 9, scope: !4883)
!4951 = !DILocation(line: 96, column: 2, scope: !4883)
!4952 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4953, file: !4953, line: 12, type: !4954, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4957)
!4953 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4954 = !DISubroutineType(types: !4955)
!4955 = !{null, !4956}
!4956 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4957 = !{!4958}
!4958 = !DILocalVariable(name: "z", arg: 1, scope: !4952, file: !4953, line: 12, type: !4956)
!4959 = !DILocation(line: 0, scope: !4952)
!4960 = !DILocation(line: 13, column: 9, scope: !4961)
!4961 = distinct !DILexicalBlock(scope: !4952, file: !4953, line: 13, column: 7)
!4962 = !DILocation(line: 13, column: 7, scope: !4952)
!4963 = !DILocation(line: 14, column: 5, scope: !4961)
!4964 = !DILocation(line: 15, column: 1, scope: !4952)
!4965 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4966, file: !4966, line: 20, type: !4967, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4970)
!4966 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4967 = !DISubroutineType(types: !4968)
!4968 = !{null, !4969, !4969}
!4969 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4970 = !{!4971, !4972}
!4971 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4965, file: !4966, line: 20, type: !4969)
!4972 = !DILocalVariable(name: "shift", arg: 2, scope: !4965, file: !4966, line: 20, type: !4969)
!4973 = !DILocation(line: 0, scope: !4965)
!4974 = !DILocation(line: 21, column: 13, scope: !4975)
!4975 = distinct !DILexicalBlock(scope: !4965, file: !4966, line: 21, column: 7)
!4976 = !DILocation(line: 21, column: 7, scope: !4965)
!4977 = !DILocation(line: 27, column: 5, scope: !4978)
!4978 = distinct !DILexicalBlock(scope: !4975, file: !4966, line: 21, column: 26)
!4979 = !DILocation(line: 29, column: 1, scope: !4965)
