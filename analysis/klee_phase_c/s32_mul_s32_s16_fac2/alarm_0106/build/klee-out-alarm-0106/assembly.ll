; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/build/s32_mul_s32_s16_fac2_alarm_0106.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"val1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"val2\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [62 x i8] c"KLEE-ALARM-0106: signed overflow. assert -val1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0106.err\00", align 1
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
  %val1 = alloca i32, align 4
  %val2 = alloca i16, align 2
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %val1, metadata !52, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i16* %val2, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %result, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = bitcast i32* %val1 to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %1 = bitcast i16* %val2 to i8*, !dbg !62
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  %2 = load i32, i32* %val1, align 4, !dbg !64
  %3 = load i16, i16* %val2, align 2, !dbg !65
  %call = call i32 @s32_mul_s32_s16_fac2(i32 %2, i16 signext %3), !dbg !66
  store i32 %call, i32* %result, align 4, !dbg !67
  %4 = load i32, i32* %result, align 4, !dbg !68
  ret i32 0, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !70 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !78, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !80
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !81, metadata !DIExpression()), !dbg !82
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !82
  %0 = load i8, i8* %value.addr, align 1, !dbg !83
  %conv = sext i8 %0 to i32, !dbg !83
  %1 = load i16, i16* %factor.addr, align 2, !dbg !84
  %conv1 = zext i16 %1 to i32, !dbg !84
  %mul = mul nsw i32 %conv, %conv1, !dbg !85
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !86
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !87
  %shr = ashr i32 %2, 16, !dbg !88
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !89
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !90
  %cmp = icmp slt i32 %3, 0, !dbg !92
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !93

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !94
  %and = and i32 %4, 65535, !dbg !95
  %cmp3 = icmp ne i32 %and, 0, !dbg !96
  br i1 %cmp3, label %if.then, label %if.else, !dbg !97

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !98
  %add = add nsw i32 %5, 1, !dbg !100
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !101
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !102
  %conv5 = trunc i32 %6 to i8, !dbg !103
  store i8 %conv5, i8* %retval, align 1, !dbg !104
  br label %return, !dbg !104

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !105
  %conv6 = trunc i32 %7 to i8, !dbg !107
  store i8 %conv6, i8* %retval, align 1, !dbg !108
  br label %return, !dbg !108

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !109
  ret i8 %8, !dbg !109
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !110 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !118
  %0 = load i8, i8* %value.addr, align 1, !dbg !119
  %conv = sext i8 %0 to i32, !dbg !119
  %1 = load i16, i16* %factor.addr, align 2, !dbg !120
  %conv1 = zext i16 %1 to i32, !dbg !120
  %mul = mul nsw i32 %conv, %conv1, !dbg !121
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !122
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !123
  %shr = ashr i32 %2, 8, !dbg !124
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !125
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !126
  %cmp = icmp slt i32 %3, 0, !dbg !128
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !129

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !130
  %and = and i32 %4, 255, !dbg !131
  %cmp3 = icmp ne i32 %and, 0, !dbg !132
  br i1 %cmp3, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !134
  %add = add nsw i32 %5, 1, !dbg !136
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !137
  br label %if.end, !dbg !138

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !139
  %cmp5 = icmp slt i32 %6, 127, !dbg !141
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !142

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !143
  %cmp8 = icmp sgt i32 %7, -128, !dbg !146
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !147

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !148
  %conv11 = trunc i32 %8 to i8, !dbg !150
  store i8 %conv11, i8* %retval, align 1, !dbg !151
  br label %return, !dbg !151

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !152
  br label %return, !dbg !152

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !154
  br label %return, !dbg !154

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !156
  ret i8 %9, !dbg !156
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !157 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !160, metadata !DIExpression()), !dbg !161
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !165
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !166, metadata !DIExpression()), !dbg !167
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !167
  %0 = load i8, i8* %value.addr, align 1, !dbg !168
  %conv = sext i8 %0 to i32, !dbg !168
  %1 = load i8, i8* %factor.addr, align 1, !dbg !169
  %conv1 = zext i8 %1 to i32, !dbg !169
  %mul = mul nsw i32 %conv, %conv1, !dbg !170
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !171
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !172
  %shr = ashr i32 %2, 8, !dbg !173
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !174
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !175
  %cmp = icmp slt i32 %3, 0, !dbg !177
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !178

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !179
  %and = and i32 %4, 255, !dbg !180
  %cmp3 = icmp ne i32 %and, 0, !dbg !181
  br i1 %cmp3, label %if.then, label %if.else, !dbg !182

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !183
  %add = add nsw i32 %5, 1, !dbg !185
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !186
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !187
  %conv5 = trunc i32 %6 to i8, !dbg !188
  store i8 %conv5, i8* %retval, align 1, !dbg !189
  br label %return, !dbg !189

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !190
  %conv6 = trunc i32 %7 to i8, !dbg !192
  store i8 %conv6, i8* %retval, align 1, !dbg !193
  br label %return, !dbg !193

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !194
  ret i8 %8, !dbg !194
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !195 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !196, metadata !DIExpression()), !dbg !197
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !201
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !203
  %0 = load i8, i8* %value.addr, align 1, !dbg !204
  %conv = sext i8 %0 to i32, !dbg !204
  %1 = load i8, i8* %factor.addr, align 1, !dbg !205
  %conv1 = zext i8 %1 to i32, !dbg !205
  %mul = mul nsw i32 %conv, %conv1, !dbg !206
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !207
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !208
  %shr = ashr i32 %2, 7, !dbg !209
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !210
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !211
  %cmp = icmp slt i32 %3, 0, !dbg !213
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !214

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !215
  %and = and i32 %4, 127, !dbg !216
  %cmp3 = icmp ne i32 %and, 0, !dbg !217
  br i1 %cmp3, label %if.then, label %if.end, !dbg !218

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !219
  %add = add nsw i32 %5, 1, !dbg !221
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !222
  br label %if.end, !dbg !223

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !224
  %cmp5 = icmp slt i32 %6, 127, !dbg !226
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !227

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !228
  %cmp8 = icmp sgt i32 %7, -128, !dbg !231
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !232

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !233
  %conv11 = trunc i32 %8 to i8, !dbg !235
  store i8 %conv11, i8* %retval, align 1, !dbg !236
  br label %return, !dbg !236

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !237
  br label %return, !dbg !237

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !239
  br label %return, !dbg !239

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !241
  ret i8 %9, !dbg !241
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !242 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !247, metadata !DIExpression()), !dbg !248
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !249, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 0, i32* %s32MulTemp, align 4, !dbg !252
  %0 = load i16, i16* %value.addr, align 2, !dbg !253
  %conv = sext i16 %0 to i32, !dbg !253
  %1 = load i16, i16* %factor.addr, align 2, !dbg !254
  %conv1 = sext i16 %1 to i32, !dbg !254
  %mul = mul nsw i32 %conv, %conv1, !dbg !255
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !256
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !257
  %3 = load i32, i32* %count.addr, align 4, !dbg !258
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !259
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !259
  %div = sdiv i32 %2, %3, !dbg !259, !klee.check.div !260
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !261
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !262
  %conv2 = trunc i32 %4 to i16, !dbg !262
  ret i16 %conv2, !dbg !263
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !264 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !265, metadata !DIExpression()), !dbg !266
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !267, metadata !DIExpression()), !dbg !268
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 0, i32* %s32MulTemp, align 4, !dbg !272
  %0 = load i16, i16* %value.addr, align 2, !dbg !273
  %conv = sext i16 %0 to i32, !dbg !273
  %1 = load i16, i16* %factor.addr, align 2, !dbg !274
  %conv1 = sext i16 %1 to i32, !dbg !274
  %mul = mul nsw i32 %conv, %conv1, !dbg !275
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !276
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !277
  %3 = load i32, i32* %count.addr, align 4, !dbg !278
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !279
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !279
  %div = sdiv i32 %2, %3, !dbg !279, !klee.check.div !260
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !280
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !281
  %cmp = icmp slt i32 %4, 32767, !dbg !283
  br i1 %cmp, label %if.then, label %if.else7, !dbg !284

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !285
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !288
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !289

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !290
  %conv6 = trunc i32 %6 to i16, !dbg !292
  store i16 %conv6, i16* %retval, align 2, !dbg !293
  br label %return, !dbg !293

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !296
  br label %return, !dbg !296

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !298
  ret i16 %7, !dbg !298
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !299 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !302, metadata !DIExpression()), !dbg !303
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !309
  %0 = load i16, i16* %value.addr, align 2, !dbg !310
  %conv = sext i16 %0 to i32, !dbg !310
  %1 = load i16, i16* %factor.addr, align 2, !dbg !311
  %conv1 = sext i16 %1 to i32, !dbg !311
  %mul = mul nsw i32 %conv, %conv1, !dbg !312
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !313
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !314
  %shr = ashr i32 %2, 15, !dbg !315
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !316
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !317
  %cmp = icmp slt i32 %3, 0, !dbg !319
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !320

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !321
  %and = and i32 %4, 32767, !dbg !322
  %cmp3 = icmp ne i32 %and, 0, !dbg !323
  br i1 %cmp3, label %if.then, label %if.end, !dbg !324

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !325
  %add = add nsw i32 %5, 1, !dbg !327
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !328
  br label %if.end, !dbg !329

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !330
  %cmp5 = icmp slt i32 %6, 32767, !dbg !332
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !333

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !334
  %conv8 = trunc i32 %7 to i16, !dbg !336
  store i16 %conv8, i16* %retval, align 2, !dbg !337
  br label %return, !dbg !337

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !338
  br label %return, !dbg !338

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !340
  ret i16 %8, !dbg !340
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !341 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !342, metadata !DIExpression()), !dbg !343
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !344, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !346, metadata !DIExpression()), !dbg !347
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !347
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !348, metadata !DIExpression()), !dbg !349
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !349
  %0 = load i16, i16* %value.addr, align 2, !dbg !350
  %conv = sext i16 %0 to i32, !dbg !350
  %1 = load i16, i16* %factor.addr, align 2, !dbg !351
  %conv1 = sext i16 %1 to i32, !dbg !351
  %mul = mul nsw i32 %conv, %conv1, !dbg !352
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !353
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !354
  %shr = ashr i32 %2, 14, !dbg !355
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !356
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !357
  %cmp = icmp slt i32 %3, 0, !dbg !359
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !360

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !361
  %and = and i32 %4, 16383, !dbg !362
  %cmp3 = icmp ne i32 %and, 0, !dbg !363
  br i1 %cmp3, label %if.then, label %if.end, !dbg !364

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !365
  %add = add nsw i32 %5, 1, !dbg !367
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !368
  br label %if.end, !dbg !369

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !370
  %cmp5 = icmp slt i32 %6, 32767, !dbg !372
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !373

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !374
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !377
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !378

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !379
  %conv11 = trunc i32 %8 to i16, !dbg !381
  store i16 %conv11, i16* %retval, align 2, !dbg !382
  br label %return, !dbg !382

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !385
  br label %return, !dbg !385

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !387
  ret i16 %9, !dbg !387
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !388 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !391, metadata !DIExpression()), !dbg !392
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !393, metadata !DIExpression()), !dbg !394
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !395, metadata !DIExpression()), !dbg !396
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !396
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !397, metadata !DIExpression()), !dbg !398
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !398
  %0 = load i16, i16* %value.addr, align 2, !dbg !399
  %conv = sext i16 %0 to i32, !dbg !399
  %1 = load i16, i16* %factor.addr, align 2, !dbg !400
  %conv1 = zext i16 %1 to i32, !dbg !400
  %mul = mul nsw i32 %conv, %conv1, !dbg !401
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !402
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !403
  %shr = ashr i32 %2, 16, !dbg !404
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !405
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !406
  %cmp = icmp slt i32 %3, 0, !dbg !408
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !409

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !410
  %and = and i32 %4, 32767, !dbg !411
  %cmp3 = icmp ne i32 %and, 0, !dbg !412
  br i1 %cmp3, label %if.then, label %if.else, !dbg !413

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !414
  %add = add nsw i32 %5, 1, !dbg !416
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !417
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !418
  %conv5 = trunc i32 %6 to i16, !dbg !419
  store i16 %conv5, i16* %retval, align 2, !dbg !420
  br label %return, !dbg !420

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !421
  %conv6 = trunc i32 %7 to i16, !dbg !423
  store i16 %conv6, i16* %retval, align 2, !dbg !424
  br label %return, !dbg !424

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !425
  ret i16 %8, !dbg !425
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !426 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !427, metadata !DIExpression()), !dbg !428
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !432
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !433, metadata !DIExpression()), !dbg !434
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !434
  %0 = load i16, i16* %value.addr, align 2, !dbg !435
  %conv = sext i16 %0 to i32, !dbg !435
  %1 = load i16, i16* %factor.addr, align 2, !dbg !436
  %conv1 = zext i16 %1 to i32, !dbg !436
  %mul = mul nsw i32 %conv, %conv1, !dbg !437
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !438
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !439
  %shr = ashr i32 %2, 8, !dbg !440
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !441
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !442
  %cmp = icmp slt i32 %3, 0, !dbg !444
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !445

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !446
  %and = and i32 %4, 255, !dbg !447
  %cmp3 = icmp ne i32 %and, 0, !dbg !448
  br i1 %cmp3, label %if.then, label %if.end, !dbg !449

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !450
  %add = add nsw i32 %5, 1, !dbg !452
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !453
  br label %if.end, !dbg !454

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !455
  %cmp5 = icmp slt i32 %6, 32767, !dbg !457
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !458

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !459
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !462
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !463

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !464
  %conv11 = trunc i32 %8 to i16, !dbg !466
  store i16 %conv11, i16* %retval, align 2, !dbg !467
  br label %return, !dbg !467

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !468
  br label %return, !dbg !468

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !470
  br label %return, !dbg !470

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !472
  ret i16 %9, !dbg !472
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !473 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !476, metadata !DIExpression()), !dbg !477
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !478, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !480, metadata !DIExpression()), !dbg !481
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !481
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !482, metadata !DIExpression()), !dbg !483
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !483
  %0 = load i16, i16* %value.addr, align 2, !dbg !484
  %conv = sext i16 %0 to i32, !dbg !484
  %1 = load i8, i8* %factor.addr, align 1, !dbg !485
  %conv1 = zext i8 %1 to i32, !dbg !485
  %mul = mul nsw i32 %conv, %conv1, !dbg !486
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !487
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !488
  %shr = ashr i32 %2, 8, !dbg !489
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !490
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !491
  %cmp = icmp slt i32 %3, 0, !dbg !493
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !494

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !495
  %and = and i32 %4, 255, !dbg !496
  %cmp3 = icmp ne i32 %and, 0, !dbg !497
  br i1 %cmp3, label %if.then, label %if.else, !dbg !498

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !499
  %add = add nsw i32 %5, 1, !dbg !501
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !502
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !503
  %conv5 = trunc i32 %6 to i16, !dbg !503
  store i16 %conv5, i16* %retval, align 2, !dbg !504
  br label %return, !dbg !504

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !505
  %conv6 = trunc i32 %7 to i16, !dbg !505
  store i16 %conv6, i16* %retval, align 2, !dbg !507
  br label %return, !dbg !507

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !508
  ret i16 %8, !dbg !508
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !509 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !510, metadata !DIExpression()), !dbg !511
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !512, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !514, metadata !DIExpression()), !dbg !515
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !515
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !516, metadata !DIExpression()), !dbg !517
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !517
  %0 = load i16, i16* %value.addr, align 2, !dbg !518
  %conv = sext i16 %0 to i32, !dbg !518
  %1 = load i8, i8* %factor.addr, align 1, !dbg !519
  %conv1 = zext i8 %1 to i32, !dbg !519
  %mul = mul nsw i32 %conv, %conv1, !dbg !520
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !521
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !522
  %shr = ashr i32 %2, 7, !dbg !523
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !524
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !525
  %cmp = icmp slt i32 %3, 0, !dbg !527
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !528

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !529
  %and = and i32 %4, 127, !dbg !530
  %cmp3 = icmp ne i32 %and, 0, !dbg !531
  br i1 %cmp3, label %if.then, label %if.end, !dbg !532

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !533
  %add = add nsw i32 %5, 1, !dbg !535
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !536
  br label %if.end, !dbg !537

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !538
  %cmp5 = icmp slt i32 %6, 32767, !dbg !540
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !541

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !542
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !545
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !546

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !547
  %conv11 = trunc i32 %8 to i16, !dbg !549
  store i16 %conv11, i16* %retval, align 2, !dbg !550
  br label %return, !dbg !550

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !551
  br label %return, !dbg !551

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !553
  br label %return, !dbg !553

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !555
  ret i16 %9, !dbg !555
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !556 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !557, metadata !DIExpression()), !dbg !558
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !559, metadata !DIExpression()), !dbg !560
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !561, metadata !DIExpression()), !dbg !562
  store i32 0, i32* %s32MulTemp, align 4, !dbg !562
  %0 = load i16, i16* %value.addr, align 2, !dbg !563
  %conv = sext i16 %0 to i32, !dbg !563
  %1 = load i16, i16* %factor.addr, align 2, !dbg !564
  %conv1 = zext i16 %1 to i32, !dbg !564
  %mul = mul nsw i32 %conv, %conv1, !dbg !565
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !566
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !567
  %cmp = icmp slt i32 %2, 32767, !dbg !569
  br i1 %cmp, label %if.then, label %if.else7, !dbg !570

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !571
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !574
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !575

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !576
  %conv6 = trunc i32 %4 to i16, !dbg !578
  store i16 %conv6, i16* %retval, align 2, !dbg !579
  br label %return, !dbg !579

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !580
  br label %return, !dbg !580

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !582
  br label %return, !dbg !582

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !584
  ret i16 %5, !dbg !584
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !585 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !588, metadata !DIExpression()), !dbg !589
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !590, metadata !DIExpression()), !dbg !591
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !592, metadata !DIExpression()), !dbg !593
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !594, metadata !DIExpression()), !dbg !595
  store i32 0, i32* %s32MulTemp, align 4, !dbg !595
  %0 = load i16, i16* %value.addr, align 2, !dbg !596
  %conv = sext i16 %0 to i32, !dbg !596
  %1 = load i16, i16* %factor.addr, align 2, !dbg !597
  %conv1 = zext i16 %1 to i32, !dbg !597
  %mul = mul nsw i32 %conv, %conv1, !dbg !598
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !599
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !600
  %3 = load i32, i32* %count.addr, align 4, !dbg !601
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !602
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !602
  %div = sdiv i32 %2, %3, !dbg !602, !klee.check.div !260
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !603
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !604
  %conv2 = trunc i32 %4 to i16, !dbg !605
  ret i16 %conv2, !dbg !606
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !607 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !610, metadata !DIExpression()), !dbg !611
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !612, metadata !DIExpression()), !dbg !613
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !614, metadata !DIExpression()), !dbg !615
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !616, metadata !DIExpression()), !dbg !617
  store i32 0, i32* %s32MulTemp, align 4, !dbg !617
  %0 = load i16, i16* %value.addr, align 2, !dbg !618
  %conv = sext i16 %0 to i32, !dbg !618
  %1 = load i16, i16* %factor.addr, align 2, !dbg !619
  %conv1 = zext i16 %1 to i32, !dbg !619
  %mul = mul nsw i32 %conv, %conv1, !dbg !620
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !621
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !622
  %3 = load i16, i16* %count.addr, align 2, !dbg !623
  %conv2 = zext i16 %3 to i32, !dbg !623
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !624
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !624
  %div = sdiv i32 %2, %conv2, !dbg !624, !klee.check.div !260
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !625
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !626
  %cmp = icmp slt i32 %4, 32767, !dbg !628
  br i1 %cmp, label %if.then, label %if.else8, !dbg !629

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !630
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !633
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !634

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !635
  %conv7 = trunc i32 %6 to i16, !dbg !637
  store i16 %conv7, i16* %retval, align 2, !dbg !638
  br label %return, !dbg !638

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !641
  br label %return, !dbg !641

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !643
  ret i16 %7, !dbg !643
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !644 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !645, metadata !DIExpression()), !dbg !646
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !647, metadata !DIExpression()), !dbg !648
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !649, metadata !DIExpression()), !dbg !650
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !650
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !651, metadata !DIExpression()), !dbg !652
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !652
  %0 = load i16, i16* %value.addr, align 2, !dbg !653
  %conv = sext i16 %0 to i32, !dbg !653
  %1 = load i16, i16* %factor.addr, align 2, !dbg !654
  %conv1 = zext i16 %1 to i32, !dbg !654
  %mul = mul nsw i32 %conv, %conv1, !dbg !655
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !656
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !657
  %shr = ashr i32 %2, 16, !dbg !658
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !659
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !660
  %cmp = icmp slt i32 %3, 0, !dbg !662
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !663

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !664
  %and = and i32 %4, 65535, !dbg !665
  %cmp3 = icmp ne i32 %and, 0, !dbg !666
  br i1 %cmp3, label %if.then, label %if.else, !dbg !667

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !668
  %add = add nsw i32 %5, 1, !dbg !670
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !671
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !672
  %conv5 = trunc i32 %6 to i16, !dbg !673
  store i16 %conv5, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !675
  %conv6 = trunc i32 %7 to i16, !dbg !677
  store i16 %conv6, i16* %retval, align 2, !dbg !678
  br label %return, !dbg !678

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !679
  ret i16 %8, !dbg !679
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !680 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !681, metadata !DIExpression()), !dbg !682
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !683, metadata !DIExpression()), !dbg !684
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !685, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !686
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !687, metadata !DIExpression()), !dbg !688
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !688
  %0 = load i16, i16* %value.addr, align 2, !dbg !689
  %conv = sext i16 %0 to i32, !dbg !689
  %1 = load i16, i16* %factor.addr, align 2, !dbg !690
  %conv1 = zext i16 %1 to i32, !dbg !690
  %mul = mul nsw i32 %conv, %conv1, !dbg !691
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !692
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !693
  %shr = ashr i32 %2, 15, !dbg !694
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !695
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !696
  %cmp = icmp slt i32 %3, 0, !dbg !698
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !699

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !700
  %and = and i32 %4, 32767, !dbg !701
  %cmp3 = icmp ne i32 %and, 0, !dbg !702
  br i1 %cmp3, label %if.then, label %if.end, !dbg !703

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !704
  %add = add nsw i32 %5, 1, !dbg !706
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !707
  br label %if.end, !dbg !708

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !709
  %cmp5 = icmp slt i32 %6, 32767, !dbg !711
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !712

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !713
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !716
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !717

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !718
  %conv11 = trunc i32 %8 to i16, !dbg !720
  store i16 %conv11, i16* %retval, align 2, !dbg !721
  br label %return, !dbg !721

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !724
  br label %return, !dbg !724

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !726
  ret i16 %9, !dbg !726
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !727 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !730, metadata !DIExpression()), !dbg !731
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !732, metadata !DIExpression()), !dbg !733
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !734, metadata !DIExpression()), !dbg !739
  store i32 0, i32* %u32MulTemp, align 4, !dbg !739
  %0 = load i16, i16* %value.addr, align 2, !dbg !740
  %conv = zext i16 %0 to i32, !dbg !740
  %1 = load i16, i16* %factor.addr, align 2, !dbg !741
  %conv1 = zext i16 %1 to i32, !dbg !741
  %mul = mul nsw i32 %conv, %conv1, !dbg !742
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !743
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !744
  %shr = lshr i32 %2, 8, !dbg !745
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !746
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !747
  %cmp = icmp ult i32 %3, 32767, !dbg !749
  br i1 %cmp, label %if.then, label %if.else, !dbg !750

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !751
  %conv3 = trunc i32 %4 to i16, !dbg !753
  store i16 %conv3, i16* %retval, align 2, !dbg !754
  br label %return, !dbg !754

if.else:                                          ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !755
  br label %return, !dbg !755

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !757
  ret i16 %5, !dbg !757
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !758 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !761, metadata !DIExpression()), !dbg !762
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !763, metadata !DIExpression()), !dbg !764
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !765, metadata !DIExpression()), !dbg !766
  store i32 0, i32* %s32MulTemp, align 4, !dbg !766
  %0 = load i16, i16* %value.addr, align 2, !dbg !767
  %conv = sext i16 %0 to i32, !dbg !767
  %1 = load i16, i16* %factor.addr, align 2, !dbg !768
  %conv1 = zext i16 %1 to i32, !dbg !768
  %mul = mul nsw i32 %conv, %conv1, !dbg !769
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !770
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !771
  ret i32 %2, !dbg !772
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16(i32 %value, i16 zeroext %factor) #0 !dbg !773 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Factor = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !776, metadata !DIExpression()), !dbg !777
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !778, metadata !DIExpression()), !dbg !779
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !780, metadata !DIExpression()), !dbg !781
  store i32 0, i32* %s32Temp1, align 4, !dbg !781
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !782, metadata !DIExpression()), !dbg !783
  store i32 -2147483648, i32* %s32Temp2, align 4, !dbg !783
  call void @llvm.dbg.declare(metadata i32* %s32Factor, metadata !784, metadata !DIExpression()), !dbg !785
  store i32 0, i32* %s32Factor, align 4, !dbg !785
  %0 = load i16, i16* %factor.addr, align 2, !dbg !786
  %conv = zext i16 %0 to i32, !dbg !786
  store i32 %conv, i32* %s32Factor, align 4, !dbg !787
  %1 = load i16, i16* %factor.addr, align 2, !dbg !788
  %conv1 = zext i16 %1 to i32, !dbg !788
  %cmp = icmp ne i32 %conv1, 0, !dbg !790
  br i1 %cmp, label %if.then, label %if.else19, !dbg !791

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !792
  %cmp3 = icmp slt i32 %2, 0, !dbg !795
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !796

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !797
  %4 = load i32, i32* %s32Factor, align 4, !dbg !799
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !800
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !800
  %div = sdiv i32 %3, %4, !dbg !800, !klee.check.div !260
  store i32 %div, i32* %s32Temp1, align 4, !dbg !801
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !802
  %6 = load i32, i32* %value.addr, align 4, !dbg !804
  %cmp6 = icmp sge i32 %5, %6, !dbg !805
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !806

if.then8:                                         ; preds = %if.then5
  store i32 -2147483648, i32* %retval, align 4, !dbg !807
  br label %return, !dbg !807

if.else:                                          ; preds = %if.then5
  %7 = load i32, i32* %value.addr, align 4, !dbg !809
  %8 = load i16, i16* %factor.addr, align 2, !dbg !811
  %conv9 = zext i16 %8 to i32, !dbg !811
  %mul = mul nsw i32 %7, %conv9, !dbg !812
  store i32 %mul, i32* %retval, align 4, !dbg !813
  br label %return, !dbg !813

if.else10:                                        ; preds = %if.then
  %9 = load i16, i16* %factor.addr, align 2, !dbg !814
  %conv11 = zext i16 %9 to i32, !dbg !814
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !817
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !817
  %div12 = udiv i32 2147483647, %conv11, !dbg !817, !klee.check.div !260
  %10 = load i32, i32* %value.addr, align 4, !dbg !818
  %cmp13 = icmp ule i32 %div12, %10, !dbg !819
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !820

if.then15:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !821
  br label %return, !dbg !821

if.else16:                                        ; preds = %if.else10
  %11 = load i32, i32* %value.addr, align 4, !dbg !823
  %12 = load i16, i16* %factor.addr, align 2, !dbg !825
  %conv17 = zext i16 %12 to i32, !dbg !825
  %mul18 = mul nsw i32 %11, %conv17, !dbg !826
  store i32 %mul18, i32* %retval, align 4, !dbg !827
  br label %return, !dbg !827

if.else19:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !828
  br label %return, !dbg !828

return:                                           ; preds = %if.else19, %if.else16, %if.then15, %if.else, %if.then8
  %13 = load i32, i32* %retval, align 4, !dbg !830
  ret i32 %13, !dbg !830
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !831 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !834, metadata !DIExpression()), !dbg !835
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !836, metadata !DIExpression()), !dbg !837
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !838, metadata !DIExpression()), !dbg !839
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !840, metadata !DIExpression()), !dbg !841
  store i16 0, i16* %u16MulTemp, align 2, !dbg !841
  %0 = load i8, i8* %value.addr, align 1, !dbg !842
  %conv = zext i8 %0 to i32, !dbg !842
  %1 = load i8, i8* %factor.addr, align 1, !dbg !843
  %conv1 = zext i8 %1 to i32, !dbg !843
  %mul = mul nsw i32 %conv, %conv1, !dbg !844
  %conv2 = trunc i32 %mul to i16, !dbg !842
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !845
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !846
  %conv3 = zext i16 %2 to i32, !dbg !846
  %3 = load i16, i16* %count.addr, align 2, !dbg !847
  %conv4 = zext i16 %3 to i32, !dbg !847
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !848
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !848
  %div = sdiv i32 %conv3, %conv4, !dbg !848, !klee.check.div !260
  %conv5 = trunc i32 %div to i16, !dbg !846
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !849
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !850
  %conv6 = trunc i16 %4 to i8, !dbg !851
  ret i8 %conv6, !dbg !852
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !853 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !856, metadata !DIExpression()), !dbg !857
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !858, metadata !DIExpression()), !dbg !859
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !860, metadata !DIExpression()), !dbg !861
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !862, metadata !DIExpression()), !dbg !863
  store i16 0, i16* %u16MulTemp, align 2, !dbg !863
  %0 = load i8, i8* %value.addr, align 1, !dbg !864
  %conv = zext i8 %0 to i32, !dbg !864
  %1 = load i8, i8* %factor.addr, align 1, !dbg !865
  %conv1 = zext i8 %1 to i32, !dbg !865
  %mul = mul nsw i32 %conv, %conv1, !dbg !866
  %conv2 = trunc i32 %mul to i16, !dbg !864
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !867
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !868
  %conv3 = zext i16 %2 to i32, !dbg !868
  %3 = load i8, i8* %count.addr, align 1, !dbg !869
  %conv4 = zext i8 %3 to i32, !dbg !869
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !870
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !870
  %div = sdiv i32 %conv3, %conv4, !dbg !870, !klee.check.div !260
  %conv5 = trunc i32 %div to i16, !dbg !868
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !871
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !872
  %conv6 = zext i16 %4 to i32, !dbg !872
  %cmp = icmp sle i32 %conv6, 255, !dbg !874
  br i1 %cmp, label %if.then, label %if.else, !dbg !875

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !876
  %conv8 = zext i16 %5 to i32, !dbg !876
  %and = and i32 %conv8, 255, !dbg !878
  %conv9 = trunc i32 %and to i8, !dbg !876
  store i8 %conv9, i8* %retval, align 1, !dbg !879
  br label %return, !dbg !879

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !880
  br label %return, !dbg !880

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !882
  ret i8 %6, !dbg !882
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !883 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !886, metadata !DIExpression()), !dbg !887
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !888, metadata !DIExpression()), !dbg !889
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !890, metadata !DIExpression()), !dbg !891
  store i16 0, i16* %u16MulTemp, align 2, !dbg !891
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !892
  %conv = zext i8 %0 to i32, !dbg !892
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !893
  %conv1 = zext i8 %1 to i32, !dbg !893
  %mul = mul nsw i32 %conv, %conv1, !dbg !894
  %conv2 = trunc i32 %mul to i16, !dbg !892
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !895
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !896
  %conv3 = zext i16 %2 to i32, !dbg !896
  %shr = ashr i32 %conv3, 8, !dbg !897
  %conv4 = trunc i32 %shr to i16, !dbg !896
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !898
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !899
  %conv5 = trunc i16 %3 to i8, !dbg !900
  ret i8 %conv5, !dbg !901
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !902 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !903, metadata !DIExpression()), !dbg !904
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !905, metadata !DIExpression()), !dbg !906
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !907, metadata !DIExpression()), !dbg !908
  store i16 0, i16* %u16MulTemp, align 2, !dbg !908
  %0 = load i8, i8* %value.addr, align 1, !dbg !909
  %conv = zext i8 %0 to i32, !dbg !909
  %1 = load i8, i8* %factor.addr, align 1, !dbg !910
  %conv1 = zext i8 %1 to i32, !dbg !910
  %mul = mul nsw i32 %conv, %conv1, !dbg !911
  %conv2 = trunc i32 %mul to i16, !dbg !909
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !912
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !913
  %conv3 = zext i16 %2 to i32, !dbg !913
  %shr = ashr i32 %conv3, 7, !dbg !914
  %conv4 = trunc i32 %shr to i16, !dbg !913
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !915
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !916
  %conv5 = zext i16 %3 to i32, !dbg !916
  %cmp = icmp slt i32 %conv5, 255, !dbg !918
  br i1 %cmp, label %if.then, label %if.else, !dbg !919

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !920
  %conv7 = trunc i16 %4 to i8, !dbg !922
  store i8 %conv7, i8* %retval, align 1, !dbg !923
  br label %return, !dbg !923

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !924
  br label %return, !dbg !924

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !926
  ret i8 %5, !dbg !926
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !927 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !930, metadata !DIExpression()), !dbg !931
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !932, metadata !DIExpression()), !dbg !933
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !934, metadata !DIExpression()), !dbg !935
  store i32 0, i32* %u32MulTemp, align 4, !dbg !935
  %0 = load i16, i16* %value.addr, align 2, !dbg !936
  %conv = zext i16 %0 to i32, !dbg !936
  %1 = load i16, i16* %factor.addr, align 2, !dbg !937
  %conv1 = zext i16 %1 to i32, !dbg !937
  %mul = mul nsw i32 %conv, %conv1, !dbg !938
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !939
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !940
  %shr = lshr i32 %2, 16, !dbg !941
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !942
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !943
  %conv2 = trunc i32 %3 to i16, !dbg !944
  ret i16 %conv2, !dbg !945
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !946 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !947, metadata !DIExpression()), !dbg !948
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !951, metadata !DIExpression()), !dbg !952
  store i32 0, i32* %u32MulTemp, align 4, !dbg !952
  %0 = load i16, i16* %value.addr, align 2, !dbg !953
  %conv = zext i16 %0 to i32, !dbg !953
  %1 = load i16, i16* %factor.addr, align 2, !dbg !954
  %conv1 = zext i16 %1 to i32, !dbg !954
  %mul = mul nsw i32 %conv, %conv1, !dbg !955
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !956
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !957
  %shr = lshr i32 %2, 8, !dbg !958
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !959
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !960
  %cmp = icmp ult i32 %3, 65535, !dbg !962
  br i1 %cmp, label %if.then, label %if.else, !dbg !963

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !964
  %and = and i32 %4, 65535, !dbg !966
  %conv3 = trunc i32 %and to i16, !dbg !967
  store i16 %conv3, i16* %retval, align 2, !dbg !968
  br label %return, !dbg !968

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !969
  br label %return, !dbg !969

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !971
  ret i16 %5, !dbg !971
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !972 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !975, metadata !DIExpression()), !dbg !976
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !977, metadata !DIExpression()), !dbg !978
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !979, metadata !DIExpression()), !dbg !980
  store i32 0, i32* %u32MulTemp, align 4, !dbg !980
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !981
  %conv = zext i16 %0 to i32, !dbg !981
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !982
  %conv1 = zext i8 %1 to i32, !dbg !982
  %mul = mul nsw i32 %conv, %conv1, !dbg !983
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !984
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !985
  %shr = lshr i32 %2, 8, !dbg !986
  %and = and i32 %shr, 65535, !dbg !987
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !988
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !989
  %conv2 = trunc i32 %3 to i16, !dbg !989
  ret i16 %conv2, !dbg !990
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !991 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !992, metadata !DIExpression()), !dbg !993
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !994, metadata !DIExpression()), !dbg !995
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !996, metadata !DIExpression()), !dbg !997
  store i32 0, i32* %u32MulTemp, align 4, !dbg !997
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !998
  %conv = zext i16 %0 to i32, !dbg !998
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !999
  %conv1 = zext i8 %1 to i32, !dbg !999
  %mul = mul nsw i32 %conv, %conv1, !dbg !1000
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1001
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1002
  %shr = lshr i32 %2, 7, !dbg !1003
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1004
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1005
  %cmp = icmp ult i32 %3, 65535, !dbg !1007
  br i1 %cmp, label %if.then, label %if.else, !dbg !1008

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1009
  %and = and i32 %4, 65535, !dbg !1011
  %conv3 = trunc i32 %and to i16, !dbg !1012
  store i16 %conv3, i16* %retval, align 2, !dbg !1013
  br label %return, !dbg !1013

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1014
  br label %return, !dbg !1014

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1016
  ret i16 %5, !dbg !1016
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1017 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1024, metadata !DIExpression()), !dbg !1025
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1027
  %0 = load i16, i16* %value.addr, align 2, !dbg !1028
  %conv = zext i16 %0 to i32, !dbg !1028
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1029
  %conv1 = zext i16 %1 to i32, !dbg !1029
  %mul = mul nsw i32 %conv, %conv1, !dbg !1030
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1031
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1032
  %3 = load i32, i32* %count.addr, align 4, !dbg !1033
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1034
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1034
  %div = udiv i32 %2, %3, !dbg !1034, !klee.check.div !260
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1035
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1036
  %and = and i32 %4, 65535, !dbg !1037
  %conv2 = trunc i32 %and to i16, !dbg !1038
  ret i16 %conv2, !dbg !1039
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1040 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1050
  %0 = load i16, i16* %value.addr, align 2, !dbg !1051
  %conv = zext i16 %0 to i32, !dbg !1051
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1052
  %conv1 = zext i16 %1 to i32, !dbg !1052
  %mul = mul nsw i32 %conv, %conv1, !dbg !1053
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1054
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1055
  %3 = load i16, i16* %count.addr, align 2, !dbg !1056
  %conv2 = zext i16 %3 to i32, !dbg !1056
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1057
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1057
  %div = udiv i32 %2, %conv2, !dbg !1057, !klee.check.div !260
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1058
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1059
  %cmp = icmp ule i32 %4, 65535, !dbg !1061
  br i1 %cmp, label %if.then, label %if.else, !dbg !1062

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1063
  %and = and i32 %5, 65535, !dbg !1065
  %conv4 = trunc i32 %and to i16, !dbg !1066
  store i16 %conv4, i16* %retval, align 2, !dbg !1067
  br label %return, !dbg !1067

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1068
  br label %return, !dbg !1068

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1070
  ret i16 %6, !dbg !1070
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1071 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1072, metadata !DIExpression()), !dbg !1073
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1074, metadata !DIExpression()), !dbg !1075
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1076, metadata !DIExpression()), !dbg !1077
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1077
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1078
  %conv = zext i16 %0 to i32, !dbg !1078
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1079
  %conv1 = zext i16 %1 to i32, !dbg !1079
  %mul = mul nsw i32 %conv, %conv1, !dbg !1080
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1081
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1082
  %shr = lshr i32 %2, 16, !dbg !1083
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1084
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1085
  %and = and i32 65535, %3, !dbg !1086
  %conv2 = trunc i32 %and to i16, !dbg !1087
  ret i16 %conv2, !dbg !1088
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1089 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1092, metadata !DIExpression()), !dbg !1093
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1094, metadata !DIExpression()), !dbg !1095
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1095
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1096
  %conv = zext i16 %0 to i32, !dbg !1096
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1097
  %conv1 = zext i16 %1 to i32, !dbg !1097
  %mul = mul nsw i32 %conv, %conv1, !dbg !1098
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1099
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1100
  %shr = lshr i32 %2, 15, !dbg !1101
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1102
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1103
  %cmp = icmp ule i32 %3, 65535, !dbg !1105
  br i1 %cmp, label %if.then, label %if.else, !dbg !1106

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1107
  %and = and i32 %4, 65535, !dbg !1109
  %conv3 = trunc i32 %and to i16, !dbg !1110
  store i16 %conv3, i16* %retval, align 2, !dbg !1111
  br label %return, !dbg !1111

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1112
  br label %return, !dbg !1112

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1114
  ret i16 %5, !dbg !1114
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1115 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1122, metadata !DIExpression()), !dbg !1123
  store i32 0, i32* %u32Temp1, align 4, !dbg !1123
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1124
  %conv = zext i16 %0 to i32, !dbg !1124
  %cmp = icmp sgt i32 %conv, 0, !dbg !1126
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1127

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1128
  %conv2 = zext i16 %1 to i32, !dbg !1128
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1130
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1130
  %div = udiv i32 -1, %conv2, !dbg !1130, !klee.check.div !260
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1131
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1132
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1134
  %cmp3 = icmp ult i32 %2, %3, !dbg !1135
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1136

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1137
  br label %return, !dbg !1137

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1139
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1141
  %conv6 = zext i16 %5 to i32, !dbg !1141
  %mul = mul i32 %4, %conv6, !dbg !1142
  store i32 %mul, i32* %retval, align 4, !dbg !1143
  br label %return, !dbg !1143

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1144
  br label %return, !dbg !1144

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1146
  ret i32 %6, !dbg !1146
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1147 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1150, metadata !DIExpression()), !dbg !1151
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1152, metadata !DIExpression()), !dbg !1153
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1154, metadata !DIExpression()), !dbg !1155
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1156, metadata !DIExpression()), !dbg !1157
  store i32 0, i32* %u32Temp1, align 4, !dbg !1157
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1158, metadata !DIExpression()), !dbg !1159
  store i32 0, i32* %u32Temp2, align 4, !dbg !1159
  %0 = load i32, i32* %value.addr, align 4, !dbg !1160
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1161
  %conv = zext i16 %1 to i32, !dbg !1161
  %mul = mul i32 %0, %conv, !dbg !1162
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1163
  %2 = load i32, i32* %value.addr, align 4, !dbg !1164
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1165
  %conv1 = zext i16 %3 to i32, !dbg !1165
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1166
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1167
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1168
  %5 = load i32, i32* %count.addr, align 4, !dbg !1169
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1170
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1170
  %shr = lshr i32 %4, %5, !dbg !1170, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1171
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1172
  %7 = load i32, i32* %count.addr, align 4, !dbg !1173
  %sub = sub i32 32, %7, !dbg !1174
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1175
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1175
  %shl = shl i32 %6, %sub, !dbg !1175, !klee.check.shift !260
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1176
  %or = or i32 %8, %shl, !dbg !1176
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1176
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1177
  %10 = load i32, i32* %count.addr, align 4, !dbg !1179
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1180
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1180
  %shr2 = lshr i32 %9, %10, !dbg !1180, !klee.check.shift !260
  %cmp = icmp eq i32 %shr2, 0, !dbg !1181
  br i1 %cmp, label %if.then, label %if.else, !dbg !1182

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1183
  store i32 %11, i32* %retval, align 4, !dbg !1185
  br label %return, !dbg !1185

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1186
  br label %return, !dbg !1186

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1188
  ret i32 %12, !dbg !1188
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1189 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1192, metadata !DIExpression()), !dbg !1193
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1194, metadata !DIExpression()), !dbg !1195
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1196, metadata !DIExpression()), !dbg !1197
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1198, metadata !DIExpression()), !dbg !1199
  store i16 0, i16* %s16Temp1, align 2, !dbg !1199
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1200
  %conv = zext i8 %0 to i32, !dbg !1200
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1201
  %conv1 = zext i8 %1 to i32, !dbg !1201
  %sub = sub nsw i32 %conv, %conv1, !dbg !1202
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1203
  %conv2 = sext i8 %2 to i32, !dbg !1203
  %mul = mul nsw i32 %sub, %conv2, !dbg !1204
  %div = sdiv i32 %mul, 32, !dbg !1205
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1206
  %conv3 = zext i8 %3 to i32, !dbg !1206
  %add = add nsw i32 %div, %conv3, !dbg !1207
  %conv4 = trunc i32 %add to i16, !dbg !1208
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1209
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1210
  %conv5 = sext i16 %4 to i32, !dbg !1210
  %cmp = icmp slt i32 %conv5, 255, !dbg !1212
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1213

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1214
  %conv7 = sext i16 %5 to i32, !dbg !1214
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1217
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1218

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1219
  %conv11 = trunc i16 %6 to i8, !dbg !1221
  store i8 %conv11, i8* %retval, align 1, !dbg !1222
  br label %return, !dbg !1222

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1223
  br label %return, !dbg !1223

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1225
  br label %return, !dbg !1225

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1227
  ret i8 %7, !dbg !1227
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1228 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1231, metadata !DIExpression()), !dbg !1232
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1233, metadata !DIExpression()), !dbg !1234
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1235, metadata !DIExpression()), !dbg !1236
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1237, metadata !DIExpression()), !dbg !1238
  store i32 0, i32* %s32Temp1, align 4, !dbg !1238
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1239
  %conv = zext i16 %0 to i32, !dbg !1239
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1240
  %conv1 = zext i16 %1 to i32, !dbg !1240
  %sub = sub nsw i32 %conv, %conv1, !dbg !1241
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1242
  %conv2 = sext i8 %2 to i32, !dbg !1242
  %mul = mul nsw i32 %sub, %conv2, !dbg !1243
  %div = sdiv i32 %mul, 32, !dbg !1244
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1245
  %conv3 = zext i16 %3 to i32, !dbg !1245
  %add = add nsw i32 %div, %conv3, !dbg !1246
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1247
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1248
  %cmp = icmp slt i32 %4, 65535, !dbg !1250
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1251

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1252
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1255
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1256

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1257
  %conv8 = trunc i32 %6 to i16, !dbg !1259
  store i16 %conv8, i16* %retval, align 2, !dbg !1260
  br label %return, !dbg !1260

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1261
  br label %return, !dbg !1261

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1263
  br label %return, !dbg !1263

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1265
  ret i16 %7, !dbg !1265
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1266 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1267, metadata !DIExpression()), !dbg !1268
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1269, metadata !DIExpression()), !dbg !1270
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1271, metadata !DIExpression()), !dbg !1272
  store i32 0, i32* %u32Temp1, align 4, !dbg !1272
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1273
  %conv = zext i16 %0 to i32, !dbg !1273
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1274
  %conv1 = zext i16 %1 to i32, !dbg !1274
  %mul = mul nsw i32 %conv, %conv1, !dbg !1275
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1276
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1277
  %cmp = icmp ule i32 %2, 65535, !dbg !1279
  br i1 %cmp, label %if.then, label %if.else, !dbg !1280

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1281
  %and = and i32 %3, 65535, !dbg !1283
  %conv3 = trunc i32 %and to i16, !dbg !1284
  store i16 %conv3, i16* %retval, align 2, !dbg !1285
  br label %return, !dbg !1285

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1286
  br label %return, !dbg !1286

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1288
  ret i16 %4, !dbg !1288
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1289 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1292, metadata !DIExpression()), !dbg !1293
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1294, metadata !DIExpression()), !dbg !1295
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1296, metadata !DIExpression()), !dbg !1297
  store i32 0, i32* %u32Temp1, align 4, !dbg !1297
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1298
  %conv = zext i16 %0 to i32, !dbg !1298
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1299
  %conv1 = zext i16 %1 to i32, !dbg !1299
  %mul = mul nsw i32 %conv, %conv1, !dbg !1300
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1301
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1302
  ret i32 %2, !dbg !1303
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1304 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1307, metadata !DIExpression()), !dbg !1308
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1309, metadata !DIExpression()), !dbg !1310
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1311, metadata !DIExpression()), !dbg !1312
  store i32 0, i32* %s32Temp1, align 4, !dbg !1312
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1313
  %conv = sext i16 %0 to i32, !dbg !1313
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1314
  %conv1 = sext i16 %1 to i32, !dbg !1314
  %mul = mul nsw i32 %conv, %conv1, !dbg !1315
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1316
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1317
  ret i32 %2, !dbg !1318
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1319 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1322, metadata !DIExpression()), !dbg !1323
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1324, metadata !DIExpression()), !dbg !1325
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1326, metadata !DIExpression()), !dbg !1327
  store i32 0, i32* %s32Temp1, align 4, !dbg !1327
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1328
  %cmp = icmp sgt i32 %0, 0, !dbg !1330
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1331

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1332
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1334
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1334
  %div = udiv i32 -1, %1, !dbg !1334, !klee.check.div !260
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1335
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1336
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1338
  %cmp1 = icmp ult i32 %2, %3, !dbg !1339
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1340

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1343
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1345
  %mul = mul i32 %4, %5, !dbg !1346
  store i32 %mul, i32* %retval, align 4, !dbg !1347
  br label %return, !dbg !1347

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1348
  br label %return, !dbg !1348

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1350
  ret i32 %6, !dbg !1350
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1351 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1354, metadata !DIExpression()), !dbg !1355
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1356, metadata !DIExpression()), !dbg !1357
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1358, metadata !DIExpression()), !dbg !1359
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1360, metadata !DIExpression()), !dbg !1361
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1362, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1364, metadata !DIExpression()), !dbg !1365
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1366
  %cmp = icmp slt i32 %0, 0, !dbg !1368
  br i1 %cmp, label %if.then, label %if.else, !dbg !1369

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1370
  %sub = sub nsw i32 0, %1, !dbg !1371
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1372
  br label %if.end, !dbg !1373

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1374
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1375
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1376
  %cmp1 = icmp slt i32 %3, 0, !dbg !1378
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1379

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1380
  %sub3 = sub nsw i32 0, %4, !dbg !1381
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1382
  br label %if.end5, !dbg !1383

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1384
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1385
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1386
  %cmp6 = icmp slt i32 %6, 0, !dbg !1388
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1389
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1389

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1390
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1391
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1392
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1392

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1393
  br label %if.end13, !dbg !1394

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1395
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1396
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1397
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1398
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1399
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1400
  %conv = zext i8 %12 to i32, !dbg !1400
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1402
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1403

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1404
  br label %return, !dbg !1404

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1406
  store i32 %13, i32* %retval, align 4, !dbg !1408
  br label %return, !dbg !1408

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1409
  ret i32 %14, !dbg !1409
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1410 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1413, metadata !DIExpression()), !dbg !1414
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1415, metadata !DIExpression()), !dbg !1416
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1417, metadata !DIExpression()), !dbg !1418
  store i32 0, i32* %u32Temp1, align 4, !dbg !1418
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1419
  %cmp = icmp ne i32 %0, 0, !dbg !1421
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1422

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1423
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1425
  %div = udiv i32 -1, %1, !dbg !1425, !klee.check.div !260
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1426
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1427
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1429
  %cmp1 = icmp ult i32 %2, %3, !dbg !1430
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1431

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1432
  br label %return, !dbg !1432

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1434
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1436
  %mul = mul i32 %4, %5, !dbg !1437
  store i32 %mul, i32* %retval, align 4, !dbg !1438
  br label %return, !dbg !1438

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1441
  ret i32 %6, !dbg !1441
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1442 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1443, metadata !DIExpression()), !dbg !1444
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1445, metadata !DIExpression()), !dbg !1446
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1447, metadata !DIExpression()), !dbg !1448
  store i32 0, i32* %u32Temp1, align 4, !dbg !1448
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1449, metadata !DIExpression()), !dbg !1450
  store i32 0, i32* %u32Temp2, align 4, !dbg !1450
  %0 = load i32, i32* %value.addr, align 4, !dbg !1451
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1452
  %conv = zext i16 %1 to i32, !dbg !1452
  %mul = mul i32 %0, %conv, !dbg !1453
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1454
  %2 = load i32, i32* %value.addr, align 4, !dbg !1455
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1456
  %conv1 = zext i16 %3 to i32, !dbg !1456
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1457
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1458
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1459
  %shr = lshr i32 %4, 16, !dbg !1460
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1461
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1462
  %shl = shl i32 %5, 16, !dbg !1463
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  %or = or i32 %6, %shl, !dbg !1464
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1464
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1465
  ret i32 %7, !dbg !1466
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1467 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1468, metadata !DIExpression()), !dbg !1469
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1470, metadata !DIExpression()), !dbg !1471
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1472, metadata !DIExpression()), !dbg !1473
  store i32 0, i32* %u32Temp1, align 4, !dbg !1473
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1474, metadata !DIExpression()), !dbg !1475
  store i32 0, i32* %u32Temp2, align 4, !dbg !1475
  %0 = load i32, i32* %value.addr, align 4, !dbg !1476
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1477
  %conv = zext i16 %1 to i32, !dbg !1477
  %mul = mul i32 %0, %conv, !dbg !1478
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1479
  %2 = load i32, i32* %value.addr, align 4, !dbg !1480
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1481
  %conv1 = zext i16 %3 to i32, !dbg !1481
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1482
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1483
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1484
  %shr = lshr i32 %4, 15, !dbg !1485
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1486
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1487
  %shl = shl i32 %5, 17, !dbg !1488
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1489
  %or = or i32 %6, %shl, !dbg !1489
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1489
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1490
  %shr2 = lshr i32 %7, 15, !dbg !1492
  %cmp = icmp eq i32 %shr2, 0, !dbg !1493
  br i1 %cmp, label %if.then, label %if.else, !dbg !1494

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1495
  store i32 %8, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1498
  br label %return, !dbg !1498

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1500
  ret i32 %9, !dbg !1500
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1501 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1504, metadata !DIExpression()), !dbg !1505
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1506, metadata !DIExpression()), !dbg !1507
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1508, metadata !DIExpression()), !dbg !1509
  store i32 0, i32* %u32Temp1, align 4, !dbg !1509
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1510, metadata !DIExpression()), !dbg !1511
  store i32 0, i32* %u32Temp2, align 4, !dbg !1511
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1512
  %conv = sext i16 %0 to i32, !dbg !1512
  %cmp = icmp sgt i32 %conv, 0, !dbg !1514
  br i1 %cmp, label %if.then, label %if.else, !dbg !1515

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1516
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1518
  %conv2 = sext i16 %2 to i32, !dbg !1518
  %mul = mul i32 %1, %conv2, !dbg !1519
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1520
  %3 = load i32, i32* %value.addr, align 4, !dbg !1521
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1522
  %conv3 = sext i16 %4 to i32, !dbg !1522
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1523
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1524
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1525
  %shr = lshr i32 %5, 15, !dbg !1526
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1527
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1528
  %shl = shl i32 %6, 17, !dbg !1529
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  %or = or i32 %7, %shl, !dbg !1530
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1530
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1531
  store i32 %8, i32* %retval, align 4, !dbg !1532
  br label %return, !dbg !1532

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1533
  br label %return, !dbg !1533

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1535
  ret i32 %9, !dbg !1535
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1536 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1537, metadata !DIExpression()), !dbg !1538
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1539, metadata !DIExpression()), !dbg !1540
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1541, metadata !DIExpression()), !dbg !1542
  store i32 0, i32* %u32Temp1, align 4, !dbg !1542
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1543, metadata !DIExpression()), !dbg !1544
  store i32 0, i32* %u32Temp2, align 4, !dbg !1544
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1545
  %conv = sext i16 %0 to i32, !dbg !1545
  %cmp = icmp sle i32 %conv, 0, !dbg !1547
  br i1 %cmp, label %if.then, label %if.else, !dbg !1548

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1549
  br label %return, !dbg !1549

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1551
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1553
  %conv2 = sext i16 %2 to i32, !dbg !1553
  %mul = mul i32 %1, %conv2, !dbg !1554
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1555
  %3 = load i32, i32* %value.addr, align 4, !dbg !1556
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1557
  %conv3 = sext i16 %4 to i32, !dbg !1557
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1558
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1559
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1560
  %shr = lshr i32 %5, 14, !dbg !1561
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1562
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1563
  %shl = shl i32 %6, 18, !dbg !1564
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1565
  %or = or i32 %7, %shl, !dbg !1565
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1565
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1566
  %shr4 = lshr i32 %8, 14, !dbg !1568
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1569
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1570

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1571
  store i32 %9, i32* %retval, align 4, !dbg !1573
  br label %return, !dbg !1573

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1574
  br label %return, !dbg !1574

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1576
  ret i32 %10, !dbg !1576
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1577 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1578, metadata !DIExpression()), !dbg !1579
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  %0 = load i32, i32* %value.addr, align 4, !dbg !1582
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1583
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1584
  ret i32 %call, !dbg !1585
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1586 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1587, metadata !DIExpression()), !dbg !1588
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1589, metadata !DIExpression()), !dbg !1590
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1591, metadata !DIExpression()), !dbg !1592
  store i32 0, i32* %u32Temp1, align 4, !dbg !1592
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1593, metadata !DIExpression()), !dbg !1594
  store i32 0, i32* %u32Temp2, align 4, !dbg !1594
  %0 = load i32, i32* %value.addr, align 4, !dbg !1595
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1596
  %mul = mul i32 %0, %1, !dbg !1597
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1598
  %2 = load i32, i32* %value.addr, align 4, !dbg !1599
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1600
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1601
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1602
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1603
  %shr = lshr i32 %4, 31, !dbg !1604
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1605
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1606
  %shl = shl i32 %5, 1, !dbg !1607
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1608
  %or = or i32 %6, %shl, !dbg !1608
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1608
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1609
  %shr1 = lshr i32 %7, 31, !dbg !1611
  %cmp = icmp eq i32 %shr1, 0, !dbg !1612
  br i1 %cmp, label %if.then, label %if.else, !dbg !1613

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1614
  store i32 %8, i32* %retval, align 4, !dbg !1616
  br label %return, !dbg !1616

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1617
  br label %return, !dbg !1617

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1619
  ret i32 %9, !dbg !1619
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1620 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1623, metadata !DIExpression()), !dbg !1624
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1625, metadata !DIExpression()), !dbg !1626
  store i32 0, i32* %u32Temp1, align 4, !dbg !1626
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1627, metadata !DIExpression()), !dbg !1628
  store i32 0, i32* %u32Temp2, align 4, !dbg !1628
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1629
  %cmp = icmp sgt i32 %0, 0, !dbg !1631
  br i1 %cmp, label %if.then, label %if.else, !dbg !1632

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1633
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1635
  %mul = mul i32 %1, %2, !dbg !1636
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1637
  %3 = load i32, i32* %value.addr, align 4, !dbg !1638
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1639
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1640
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1641
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1642
  %shr = lshr i32 %5, 31, !dbg !1643
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1644
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1645
  %shl = shl i32 %6, 1, !dbg !1646
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1647
  %or = or i32 %7, %shl, !dbg !1647
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1647
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1648
  store i32 %8, i32* %retval, align 4, !dbg !1649
  br label %return, !dbg !1649

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1650
  br label %return, !dbg !1650

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1652
  ret i32 %9, !dbg !1652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1653 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1654, metadata !DIExpression()), !dbg !1655
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1656, metadata !DIExpression()), !dbg !1657
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1658, metadata !DIExpression()), !dbg !1659
  store i32 0, i32* %u32Temp1, align 4, !dbg !1659
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1660, metadata !DIExpression()), !dbg !1661
  store i32 0, i32* %u32Temp2, align 4, !dbg !1661
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1662
  %cmp = icmp sle i32 %0, 0, !dbg !1664
  br i1 %cmp, label %if.then, label %if.else, !dbg !1665

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1666
  br label %return, !dbg !1666

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1668
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1670
  %mul = mul i32 %1, %2, !dbg !1671
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1672
  %3 = load i32, i32* %value.addr, align 4, !dbg !1673
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1674
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1675
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1676
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1677
  %shr = lshr i32 %5, 30, !dbg !1678
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1679
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1680
  %shl = shl i32 %6, 2, !dbg !1681
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1682
  %or = or i32 %7, %shl, !dbg !1682
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1682
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1683
  %shr1 = lshr i32 %8, 30, !dbg !1685
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1686
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1687

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1688
  store i32 %9, i32* %retval, align 4, !dbg !1690
  br label %return, !dbg !1690

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1691
  br label %return, !dbg !1691

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1693
  ret i32 %10, !dbg !1693
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1694 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1699, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1701, metadata !DIExpression()), !dbg !1702
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1702
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1703
  %cmp = icmp slt i32 %0, 0, !dbg !1705
  br i1 %cmp, label %if.then, label %if.end, !dbg !1706

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1707
  %sub = sub nsw i32 0, %1, !dbg !1709
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1710
  br label %if.end, !dbg !1711

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1712
  %cmp1 = icmp ne i32 %2, 0, !dbg !1714
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1715

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1716
  %cmp3 = icmp sle i32 %3, 0, !dbg !1719
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1720

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1721
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1724
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1724
  %div = udiv i32 -2147483648, %4, !dbg !1724, !klee.check.div !260
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1725
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1726
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1727

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1728
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1730
  %mul = mul i32 %6, %7, !dbg !1731
  store i32 %mul, i32* %retval, align 4, !dbg !1732
  br label %return, !dbg !1732

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1733
  br label %return, !dbg !1733

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1735
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1738
  %div8 = sdiv i32 2147483647, %8, !dbg !1738, !klee.check.div !260
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1739
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1740
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1741

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1742
  br label %return, !dbg !1742

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1744
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1746
  %mul12 = mul i32 %10, %11, !dbg !1747
  store i32 %mul12, i32* %retval, align 4, !dbg !1748
  br label %return, !dbg !1748

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1749
  br label %return, !dbg !1749

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1751
  ret i32 %12, !dbg !1751
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1752 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1753, metadata !DIExpression()), !dbg !1754
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1755, metadata !DIExpression()), !dbg !1756
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1757, metadata !DIExpression()), !dbg !1758
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1759, metadata !DIExpression()), !dbg !1760
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1761, metadata !DIExpression()), !dbg !1762
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1763, metadata !DIExpression()), !dbg !1764
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1765
  %cmp = icmp slt i32 %0, 0, !dbg !1767
  br i1 %cmp, label %if.then, label %if.else, !dbg !1768

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1769
  %sub = sub nsw i32 0, %1, !dbg !1771
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1772
  store i8 1, i8* %u8SignBit, align 1, !dbg !1773
  br label %if.end, !dbg !1774

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1775
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1777
  store i8 0, i8* %u8SignBit, align 1, !dbg !1778
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1779
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1780
  %conv = zext i16 %4 to i32, !dbg !1780
  %mul = mul i32 %3, %conv, !dbg !1781
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1782
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1783
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1784
  %conv1 = zext i16 %6 to i32, !dbg !1784
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1785
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1786
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1787
  %shr = lshr i32 %7, 16, !dbg !1788
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1789
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1790
  %shl = shl i32 %8, 16, !dbg !1791
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1792
  %or = or i32 %9, %shl, !dbg !1792
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1792
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1793
  %conv2 = zext i8 %10 to i32, !dbg !1793
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1795
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1796

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1797
  store i32 %11, i32* %retval, align 4, !dbg !1799
  br label %return, !dbg !1799

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1800
  %sub7 = sub i32 0, %12, !dbg !1802
  store i32 %sub7, i32* %retval, align 4, !dbg !1803
  br label %return, !dbg !1803

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1804
  ret i32 %13, !dbg !1804
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1805 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1806, metadata !DIExpression()), !dbg !1807
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1808, metadata !DIExpression()), !dbg !1809
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1810, metadata !DIExpression()), !dbg !1811
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1812, metadata !DIExpression()), !dbg !1813
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1814, metadata !DIExpression()), !dbg !1815
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1816, metadata !DIExpression()), !dbg !1817
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1818
  %cmp = icmp slt i32 %0, 0, !dbg !1820
  br i1 %cmp, label %if.then, label %if.else, !dbg !1821

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1822
  %sub = sub nsw i32 0, %1, !dbg !1824
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1825
  store i8 1, i8* %u8SignBit, align 1, !dbg !1826
  br label %if.end, !dbg !1827

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1828
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1830
  store i8 0, i8* %u8SignBit, align 1, !dbg !1831
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1832
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1833
  %conv = zext i16 %4 to i32, !dbg !1833
  %mul = mul i32 %3, %conv, !dbg !1834
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1835
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1836
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1837
  %conv1 = zext i16 %6 to i32, !dbg !1837
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1838
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1839
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1840
  %shr = lshr i32 %7, 15, !dbg !1841
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1842
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1843
  %shl = shl i32 %8, 17, !dbg !1844
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1845
  %or = or i32 %9, %shl, !dbg !1845
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1845
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1846
  %conv2 = zext i8 %10 to i32, !dbg !1846
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1848
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1849

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1850
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1853
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1854

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1855
  store i32 %12, i32* %retval, align 4, !dbg !1856
  br label %return, !dbg !1856

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1857
  br label %return, !dbg !1857

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1858
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1861
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1862

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1863
  %sub14 = sub i32 0, %14, !dbg !1864
  store i32 %sub14, i32* %retval, align 4, !dbg !1865
  br label %return, !dbg !1865

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1866
  br label %return, !dbg !1866

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1867
  ret i32 %15, !dbg !1867
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1868 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1871, metadata !DIExpression()), !dbg !1872
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1873, metadata !DIExpression()), !dbg !1874
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1875, metadata !DIExpression()), !dbg !1876
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1877, metadata !DIExpression()), !dbg !1878
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1879, metadata !DIExpression()), !dbg !1880
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1881, metadata !DIExpression()), !dbg !1882
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1883, metadata !DIExpression()), !dbg !1884
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1885
  %cmp = icmp slt i32 %0, 0, !dbg !1887
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1888

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1889
  %conv = sext i16 %1 to i32, !dbg !1889
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1890
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1891

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1892
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1893
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1894

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1895
  %conv6 = sext i16 %3 to i32, !dbg !1895
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1896
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1897

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1898
  br label %if.end, !dbg !1900

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1901
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1903
  %cmp9 = icmp slt i32 %4, 0, !dbg !1905
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1906

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1907
  %sub = sub nsw i32 0, %5, !dbg !1909
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1910
  br label %if.end13, !dbg !1911

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1912
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1914
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1915
  %conv14 = sext i16 %7 to i32, !dbg !1915
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1917
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1918

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1919
  %conv18 = sext i16 %8 to i32, !dbg !1919
  %sub19 = sub nsw i32 0, %conv18, !dbg !1921
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1922
  br label %if.end22, !dbg !1923

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1924
  %conv21 = sext i16 %9 to i32, !dbg !1924
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1926
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1927
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1928
  %mul = mul i32 %10, %11, !dbg !1929
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1930
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1931
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1932
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1933
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1934
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1935
  %shr = lshr i32 %14, 15, !dbg !1936
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1937
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1938
  %shl = shl i32 %15, 17, !dbg !1939
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1940
  %or = or i32 %16, %shl, !dbg !1940
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1940
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1941
  %conv23 = zext i8 %17 to i32, !dbg !1941
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1943
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1944

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1945
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1948
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1949

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1950
  store i32 %19, i32* %retval, align 4, !dbg !1951
  br label %return, !dbg !1951

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1952
  br label %return, !dbg !1952

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1953
  %sub32 = sub i32 0, %20, !dbg !1955
  store i32 %sub32, i32* %retval, align 4, !dbg !1956
  br label %return, !dbg !1956

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1957
  ret i32 %21, !dbg !1957
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1958 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1959, metadata !DIExpression()), !dbg !1960
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1961, metadata !DIExpression()), !dbg !1962
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1963, metadata !DIExpression()), !dbg !1964
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1965, metadata !DIExpression()), !dbg !1966
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1967, metadata !DIExpression()), !dbg !1968
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1969, metadata !DIExpression()), !dbg !1970
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1971, metadata !DIExpression()), !dbg !1972
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1973
  %cmp = icmp slt i32 %0, 0, !dbg !1975
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1976

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1977
  %conv = sext i16 %1 to i32, !dbg !1977
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1978
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1979

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1980
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1981
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1982

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1983
  %conv6 = sext i16 %3 to i32, !dbg !1983
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1984
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1985

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1986
  br label %if.end, !dbg !1988

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1989
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1991
  %cmp9 = icmp slt i32 %4, 0, !dbg !1993
  br i1 %cmp9, label %if.then11, label %if.else16, !dbg !1994

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1995
  %conv12 = sext i32 %5 to i64, !dbg !1998
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv12), !dbg !1999
  %tobool = icmp ne i32 %call, 0, !dbg !1999
  br i1 %tobool, label %if.end14, label %if.then13, !dbg !2000

if.then13:                                        ; preds = %if.then11
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1997, i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !2001
  unreachable, !dbg !2001

if.end14:                                         ; preds = %if.then11
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2003
  %sub = sub nsw i32 0, %6, !dbg !2004
  %conv15 = sext i32 %sub to i64, !dbg !2005
  store volatile i64 %conv15, i64* @klee_alarm_sink_s64, align 8, !dbg !2006
  store i32 0, i32* %retval, align 4, !dbg !2007
  br label %return, !dbg !2007

if.else16:                                        ; preds = %if.end
  %7 = load i32, i32* %val1.addr, align 4, !dbg !2008
  store i32 %7, i32* %u32Temp1, align 4, !dbg !2010
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2011
  %conv18 = sext i16 %8 to i32, !dbg !2011
  %cmp19 = icmp slt i32 %conv18, 0, !dbg !2013
  br i1 %cmp19, label %if.then21, label %if.else24, !dbg !2014

if.then21:                                        ; preds = %if.else16
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2015
  %conv22 = sext i16 %9 to i32, !dbg !2015
  %sub23 = sub nsw i32 0, %conv22, !dbg !2017
  store i32 %sub23, i32* %u32Temp2, align 4, !dbg !2018
  br label %if.end26, !dbg !2019

if.else24:                                        ; preds = %if.else16
  %10 = load i16, i16* %val2.addr, align 2, !dbg !2020
  %conv25 = sext i16 %10 to i32, !dbg !2020
  store i32 %conv25, i32* %u32Temp2, align 4, !dbg !2022
  br label %if.end26

if.end26:                                         ; preds = %if.else24, %if.then21
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !2023
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2024
  %mul = mul i32 %11, %12, !dbg !2025
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2026
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2027
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2028
  %call27 = call i32 @MulHighWord(i32 %13, i32 %14), !dbg !2029
  store i32 %call27, i32* %u32Temp4, align 4, !dbg !2030
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !2031
  %shr = lshr i32 %15, 14, !dbg !2032
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2033
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !2034
  %shl = shl i32 %16, 18, !dbg !2035
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2036
  %or = or i32 %17, %shl, !dbg !2036
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2036
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2037
  %shr28 = lshr i32 %18, 14, !dbg !2039
  %cmp29 = icmp eq i32 %shr28, 0, !dbg !2040
  br i1 %cmp29, label %if.then31, label %if.else46, !dbg !2041

if.then31:                                        ; preds = %if.end26
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !2042
  %conv32 = zext i8 %19 to i32, !dbg !2042
  %cmp33 = icmp eq i32 %conv32, 0, !dbg !2045
  br i1 %cmp33, label %if.then35, label %if.else40, !dbg !2046

if.then35:                                        ; preds = %if.then31
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2047
  %cmp36 = icmp ule i32 %20, 2147483647, !dbg !2050
  br i1 %cmp36, label %if.then38, label %if.else39, !dbg !2051

if.then38:                                        ; preds = %if.then35
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2052
  store i32 %21, i32* %retval, align 4, !dbg !2053
  br label %return, !dbg !2053

if.else39:                                        ; preds = %if.then35
  store i32 2147483647, i32* %retval, align 4, !dbg !2054
  br label %return, !dbg !2054

if.else40:                                        ; preds = %if.then31
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2055
  %cmp41 = icmp ule i32 %22, -2147483648, !dbg !2058
  br i1 %cmp41, label %if.then43, label %if.else45, !dbg !2059

if.then43:                                        ; preds = %if.else40
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !2060
  %sub44 = sub i32 0, %23, !dbg !2061
  store i32 %sub44, i32* %retval, align 4, !dbg !2062
  br label %return, !dbg !2062

if.else45:                                        ; preds = %if.else40
  store i32 -2147483648, i32* %retval, align 4, !dbg !2063
  br label %return, !dbg !2063

if.else46:                                        ; preds = %if.end26
  store i32 2147483647, i32* %retval, align 4, !dbg !2064
  br label %return, !dbg !2064

return:                                           ; preds = %if.else46, %if.else45, %if.then43, %if.else39, %if.then38, %if.end14
  %24 = load i32, i32* %retval, align 4, !dbg !2066
  ret i32 %24, !dbg !2066
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2067 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2070, metadata !DIExpression()), !dbg !2071
  %0 = load i64, i64* %value.addr, align 8, !dbg !2072
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2073
  %conv = zext i1 %cmp to i32, !dbg !2073
  ret i32 %conv, !dbg !2074
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2075 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2078, metadata !DIExpression()), !dbg !2079
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2080, metadata !DIExpression()), !dbg !2081
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2082, metadata !DIExpression()), !dbg !2083
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2084, metadata !DIExpression()), !dbg !2085
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2086, metadata !DIExpression()), !dbg !2087
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2088
  %cmp = icmp slt i32 %0, 0, !dbg !2090
  br i1 %cmp, label %if.then, label %if.else, !dbg !2091

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2092
  %sub = sub nsw i32 0, %1, !dbg !2094
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2095
  store i8 1, i8* %u8SignBit, align 1, !dbg !2096
  br label %if.end, !dbg !2097

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2098
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2100
  store i8 0, i8* %u8SignBit, align 1, !dbg !2101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2102
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2103
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2104
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2105
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2106
  %conv = zext i8 %5 to i32, !dbg !2106
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2108
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2109

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2110
  store i32 %6, i32* %retval, align 4, !dbg !2111
  br label %return, !dbg !2111

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2112
  %sub5 = sub i32 0, %7, !dbg !2113
  store i32 %sub5, i32* %retval, align 4, !dbg !2114
  br label %return, !dbg !2114

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2115
  ret i32 %8, !dbg !2115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2116 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2117, metadata !DIExpression()), !dbg !2118
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2119, metadata !DIExpression()), !dbg !2120
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2121, metadata !DIExpression()), !dbg !2122
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2123, metadata !DIExpression()), !dbg !2124
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2125, metadata !DIExpression()), !dbg !2126
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2127, metadata !DIExpression()), !dbg !2128
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2129
  %cmp = icmp slt i32 %0, 0, !dbg !2131
  br i1 %cmp, label %if.then, label %if.else, !dbg !2132

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2133
  %sub = sub nsw i32 0, %1, !dbg !2135
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2136
  store i8 1, i8* %u8SignBit, align 1, !dbg !2137
  br label %if.end, !dbg !2138

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2139
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2141
  store i8 0, i8* %u8SignBit, align 1, !dbg !2142
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2143
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2144
  %mul = mul i32 %3, %4, !dbg !2145
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2146
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2147
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2148
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2149
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2150
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2151
  %shr = lshr i32 %7, 31, !dbg !2152
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2153
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2154
  %shl = shl i32 %8, 1, !dbg !2155
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2156
  %or = or i32 %9, %shl, !dbg !2156
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2156
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2157
  %conv = zext i8 %10 to i32, !dbg !2157
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2159
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2160

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2161
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2164
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2165

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2166
  store i32 %12, i32* %retval, align 4, !dbg !2167
  br label %return, !dbg !2167

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2168
  br label %return, !dbg !2168

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2169
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2172
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2173

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2174
  %sub12 = sub i32 0, %14, !dbg !2175
  store i32 %sub12, i32* %retval, align 4, !dbg !2176
  br label %return, !dbg !2176

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2177
  br label %return, !dbg !2177

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2178
  ret i32 %15, !dbg !2178
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2179 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2182, metadata !DIExpression()), !dbg !2183
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2184, metadata !DIExpression()), !dbg !2185
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2186, metadata !DIExpression()), !dbg !2187
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2188, metadata !DIExpression()), !dbg !2189
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2190, metadata !DIExpression()), !dbg !2191
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2192, metadata !DIExpression()), !dbg !2193
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2194, metadata !DIExpression()), !dbg !2195
  %0 = load i32, i32* %value.addr, align 4, !dbg !2196
  %cmp = icmp slt i32 %0, 0, !dbg !2198
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2199
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2199

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2200
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2201
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2202
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2202

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2203
  br label %if.end, !dbg !2205

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2206
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2208
  %cmp5 = icmp slt i32 %4, 0, !dbg !2210
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2211

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2212
  %sub = sub nsw i32 0, %5, !dbg !2214
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2215
  br label %if.end8, !dbg !2216

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2217
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2219
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2220
  %cmp9 = icmp slt i32 %7, 0, !dbg !2222
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2223

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2224
  %sub11 = sub nsw i32 0, %8, !dbg !2226
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2227
  br label %if.end13, !dbg !2228

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2229
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2231
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2232
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2233
  %mul = mul i32 %10, %11, !dbg !2234
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2235
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2236
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2237
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2238
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2239
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2240
  %shr = lshr i32 %14, 31, !dbg !2241
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2242
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2243
  %shl = shl i32 %15, 1, !dbg !2244
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2245
  %or = or i32 %16, %shl, !dbg !2245
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2245
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2246
  %conv = zext i8 %17 to i32, !dbg !2246
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2248
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2249

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2250
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2253
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2254

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2255
  store i32 %19, i32* %retval, align 4, !dbg !2256
  br label %return, !dbg !2256

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2257
  br label %return, !dbg !2257

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2258
  %sub22 = sub i32 0, %20, !dbg !2260
  store i32 %sub22, i32* %retval, align 4, !dbg !2261
  br label %return, !dbg !2261

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2262
  ret i32 %21, !dbg !2262
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2263 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2264, metadata !DIExpression()), !dbg !2265
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2266, metadata !DIExpression()), !dbg !2267
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2268, metadata !DIExpression()), !dbg !2269
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2270, metadata !DIExpression()), !dbg !2271
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2272, metadata !DIExpression()), !dbg !2273
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2274, metadata !DIExpression()), !dbg !2275
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2276, metadata !DIExpression()), !dbg !2277
  %0 = load i32, i32* %value.addr, align 4, !dbg !2278
  %cmp = icmp slt i32 %0, 0, !dbg !2280
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2281
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2281

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2282
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2283
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2284
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2284

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2285
  br label %if.end, !dbg !2287

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2288
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2290
  %cmp5 = icmp slt i32 %4, 0, !dbg !2292
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2293

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2294
  %sub = sub nsw i32 0, %5, !dbg !2296
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2297
  br label %if.end8, !dbg !2298

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2299
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2301
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2302
  %cmp9 = icmp slt i32 %7, 0, !dbg !2304
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2305

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2306
  %sub11 = sub nsw i32 0, %8, !dbg !2308
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2309
  br label %if.end13, !dbg !2310

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2311
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2313
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2314
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2315
  %mul = mul i32 %10, %11, !dbg !2316
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2317
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2318
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2319
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2320
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2321
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2322
  %shr = lshr i32 %14, 30, !dbg !2323
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2324
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2325
  %shl = shl i32 %15, 2, !dbg !2326
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2327
  %or = or i32 %16, %shl, !dbg !2327
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2327
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2328
  %shr14 = lshr i32 %17, 30, !dbg !2330
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2331
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2332

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2333
  %conv = zext i8 %18 to i32, !dbg !2333
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2336
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2337

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2338
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2341
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2342

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2343
  store i32 %20, i32* %retval, align 4, !dbg !2344
  br label %return, !dbg !2344

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2345
  br label %return, !dbg !2345

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2346
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2349
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2350

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2351
  %sub28 = sub i32 0, %22, !dbg !2352
  store i32 %sub28, i32* %retval, align 4, !dbg !2353
  br label %return, !dbg !2353

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2354
  br label %return, !dbg !2354

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2355
  br label %return, !dbg !2355

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2357
  ret i32 %23, !dbg !2357
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2358 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2361, metadata !DIExpression()), !dbg !2362
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2363, metadata !DIExpression()), !dbg !2364
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2365, metadata !DIExpression()), !dbg !2366
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2367, metadata !DIExpression()), !dbg !2368
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2369, metadata !DIExpression()), !dbg !2370
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2371, metadata !DIExpression()), !dbg !2372
  %0 = load i32, i32* %value.addr, align 4, !dbg !2373
  %cmp = icmp slt i32 %0, 0, !dbg !2375
  br i1 %cmp, label %if.then, label %if.else, !dbg !2376

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2377
  %sub = sub nsw i32 0, %1, !dbg !2379
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2380
  store i8 1, i8* %u8SignBit, align 1, !dbg !2381
  br label %if.end, !dbg !2382

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2383
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2385
  store i8 0, i8* %u8SignBit, align 1, !dbg !2386
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2387
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2388
  %conv = zext i8 %4 to i32, !dbg !2388
  %mul = mul i32 %3, %conv, !dbg !2389
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2390
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2391
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2392
  %conv1 = zext i8 %6 to i32, !dbg !2392
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2393
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2394
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2395
  %shr = lshr i32 %7, 8, !dbg !2396
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2397
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2398
  %shl = shl i32 %8, 24, !dbg !2399
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2400
  %or = or i32 %9, %shl, !dbg !2400
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2400
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2401
  %conv2 = zext i8 %10 to i32, !dbg !2401
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2403
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2404

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2405
  store i32 %11, i32* %retval, align 4, !dbg !2407
  br label %return, !dbg !2407

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2408
  %sub7 = sub i32 0, %12, !dbg !2410
  store i32 %sub7, i32* %retval, align 4, !dbg !2411
  br label %return, !dbg !2411

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2412
  ret i32 %13, !dbg !2412
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2413 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2414, metadata !DIExpression()), !dbg !2415
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2416, metadata !DIExpression()), !dbg !2417
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2418, metadata !DIExpression()), !dbg !2419
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2420, metadata !DIExpression()), !dbg !2421
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2422, metadata !DIExpression()), !dbg !2423
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2424, metadata !DIExpression()), !dbg !2425
  %0 = load i32, i32* %value.addr, align 4, !dbg !2426
  %cmp = icmp slt i32 %0, 0, !dbg !2428
  br i1 %cmp, label %if.then, label %if.else, !dbg !2429

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2430
  %sub = sub nsw i32 0, %1, !dbg !2432
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2433
  store i8 1, i8* %u8SignBit, align 1, !dbg !2434
  br label %if.end, !dbg !2435

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2436
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2438
  store i8 0, i8* %u8SignBit, align 1, !dbg !2439
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2440
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2441
  %conv = zext i8 %4 to i32, !dbg !2441
  %mul = mul i32 %3, %conv, !dbg !2442
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2443
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2444
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2445
  %conv1 = zext i8 %6 to i32, !dbg !2445
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2446
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2447
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2448
  %shr = lshr i32 %7, 7, !dbg !2449
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2450
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2451
  %shl = shl i32 %8, 25, !dbg !2452
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2453
  %or = or i32 %9, %shl, !dbg !2453
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2453
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2454
  %conv2 = zext i8 %10 to i32, !dbg !2454
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2456
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2457

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2458
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2461
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2462

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2463
  store i32 %12, i32* %retval, align 4, !dbg !2464
  br label %return, !dbg !2464

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2465
  br label %return, !dbg !2465

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2466
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2469
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2470

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2471
  %sub14 = sub i32 0, %14, !dbg !2472
  store i32 %sub14, i32* %retval, align 4, !dbg !2473
  br label %return, !dbg !2473

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2474
  br label %return, !dbg !2474

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2475
  ret i32 %15, !dbg !2475
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2476 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2479, metadata !DIExpression()), !dbg !2480
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2481, metadata !DIExpression()), !dbg !2482
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2483, metadata !DIExpression()), !dbg !2484
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2485, metadata !DIExpression()), !dbg !2486
  store i32 0, i32* %u32Temp1, align 4, !dbg !2486
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2487, metadata !DIExpression()), !dbg !2488
  store i32 0, i32* %u32Temp2, align 4, !dbg !2488
  %0 = load i8, i8* %power.addr, align 1, !dbg !2489
  %conv = zext i8 %0 to i32, !dbg !2489
  %cmp = icmp sge i32 %conv, 32, !dbg !2491
  br i1 %cmp, label %if.then, label %if.else, !dbg !2492

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2493
  br label %if.end7, !dbg !2495

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2496
  %conv2 = zext i8 %1 to i32, !dbg !2496
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2498
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2499

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2500
  br label %if.end7, !dbg !2502

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2503
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2504
  %mul = mul i32 %2, %3, !dbg !2505
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2506
  %4 = load i32, i32* %value.addr, align 4, !dbg !2507
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2508
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2509
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2510
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2511
  %7 = load i8, i8* %power.addr, align 1, !dbg !2512
  %conv8 = zext i8 %7 to i32, !dbg !2512
  %sub = sub nsw i32 32, %conv8, !dbg !2513
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2514
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2514
  %shr = lshr i32 %6, %sub, !dbg !2514, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2515
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2516
  %9 = load i8, i8* %power.addr, align 1, !dbg !2517
  %conv9 = zext i8 %9 to i32, !dbg !2517
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2518
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2518
  %shl = shl i32 %8, %conv9, !dbg !2518, !klee.check.shift !260
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2519
  %or = or i32 %10, %shl, !dbg !2519
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2519
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2520
  %12 = load i8, i8* %power.addr, align 1, !dbg !2522
  %conv10 = zext i8 %12 to i32, !dbg !2522
  %sub11 = sub nsw i32 32, %conv10, !dbg !2523
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2524
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2524
  %shr12 = lshr i32 %11, %sub11, !dbg !2524, !klee.check.shift !260
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2525
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2526

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2527
  store i32 %13, i32* %retval, align 4, !dbg !2529
  br label %return, !dbg !2529

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2530
  br label %return, !dbg !2530

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2532
  ret i32 %14, !dbg !2532
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2533 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2536, metadata !DIExpression()), !dbg !2537
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2538, metadata !DIExpression()), !dbg !2539
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2540, metadata !DIExpression()), !dbg !2541
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2542, metadata !DIExpression()), !dbg !2543
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2544, metadata !DIExpression()), !dbg !2545
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2546, metadata !DIExpression()), !dbg !2547
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2548, metadata !DIExpression()), !dbg !2549
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2550, metadata !DIExpression()), !dbg !2551
  %0 = load i8, i8* %power.addr, align 1, !dbg !2552
  %conv = zext i8 %0 to i32, !dbg !2552
  %cmp = icmp sge i32 %conv, 32, !dbg !2554
  br i1 %cmp, label %if.then, label %if.else, !dbg !2555

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2556
  br label %if.end7, !dbg !2558

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2559
  %conv2 = zext i8 %1 to i32, !dbg !2559
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2561
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2562

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2563
  br label %if.end7, !dbg !2565

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2566
  %cmp8 = icmp slt i32 %2, 0, !dbg !2568
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2569
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2569

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2570
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2571
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2572
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2572

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2573
  br label %if.end19, !dbg !2575

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2576
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2578
  %cmp20 = icmp slt i32 %6, 0, !dbg !2580
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2581

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2582
  %sub = sub nsw i32 0, %7, !dbg !2584
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2585
  br label %if.end24, !dbg !2586

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2587
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2589
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2590
  %cmp25 = icmp slt i32 %9, 0, !dbg !2592
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2593

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2594
  %sub28 = sub nsw i32 0, %10, !dbg !2596
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2597
  br label %if.end30, !dbg !2598

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2599
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2601
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2602
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2603
  %mul = mul i32 %12, %13, !dbg !2604
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2605
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2606
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2607
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2608
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2609
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2610
  %17 = load i8, i8* %power.addr, align 1, !dbg !2611
  %conv31 = zext i8 %17 to i32, !dbg !2611
  %sub32 = sub nsw i32 32, %conv31, !dbg !2612
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2613
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2613
  %shr = lshr i32 %16, %sub32, !dbg !2613, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2614
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2615
  %19 = load i8, i8* %power.addr, align 1, !dbg !2616
  %conv33 = zext i8 %19 to i32, !dbg !2616
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2617
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2617
  %shl = shl i32 %18, %conv33, !dbg !2617, !klee.check.shift !260
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2618
  %or = or i32 %20, %shl, !dbg !2618
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2618
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2619
  %22 = load i8, i8* %power.addr, align 1, !dbg !2621
  %conv34 = zext i8 %22 to i32, !dbg !2621
  %sub35 = sub nsw i32 32, %conv34, !dbg !2622
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2623
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2623
  %shr36 = lshr i32 %21, %sub35, !dbg !2623, !klee.check.shift !260
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2624
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2625

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2626
  %conv40 = zext i8 %23 to i32, !dbg !2626
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2629
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2630

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2631
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2634
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2635

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2636
  store i32 %25, i32* %retval, align 4, !dbg !2637
  br label %return, !dbg !2637

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2638
  br label %return, !dbg !2638

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2639
  %sub49 = sub i32 0, %26, !dbg !2641
  store i32 %sub49, i32* %retval, align 4, !dbg !2642
  br label %return, !dbg !2642

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2643
  %conv51 = zext i8 %27 to i32, !dbg !2643
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2646
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2647

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2648
  br label %return, !dbg !2648

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2650
  br label %return, !dbg !2650

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2652
  ret i32 %28, !dbg !2652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2653 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2656, metadata !DIExpression()), !dbg !2657
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2658, metadata !DIExpression()), !dbg !2659
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2660, metadata !DIExpression()), !dbg !2661
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2662, metadata !DIExpression()), !dbg !2663
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2664, metadata !DIExpression()), !dbg !2665
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2666, metadata !DIExpression()), !dbg !2667
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2668, metadata !DIExpression()), !dbg !2669
  %0 = load i32, i32* %value.addr, align 4, !dbg !2670
  %cmp = icmp slt i32 %0, 0, !dbg !2672
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2673

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2674
  %conv = sext i8 %1 to i32, !dbg !2674
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2675
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2676

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2677
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2678
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2679

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2680
  %conv6 = sext i8 %3 to i32, !dbg !2680
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2681
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2682

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2683
  br label %if.end, !dbg !2685

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2686
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2688
  %cmp9 = icmp slt i32 %4, 0, !dbg !2690
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2691

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2692
  %sub = sub nsw i32 0, %5, !dbg !2694
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2695
  br label %if.end13, !dbg !2696

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2697
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2699
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2700
  %conv14 = sext i8 %7 to i32, !dbg !2700
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2702
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2703

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2704
  %conv18 = sext i8 %8 to i32, !dbg !2704
  %sub19 = sub nsw i32 0, %conv18, !dbg !2706
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2707
  br label %if.end22, !dbg !2708

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2709
  %conv21 = sext i8 %9 to i32, !dbg !2709
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2711
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2712
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2713
  %mul = mul i32 %10, %11, !dbg !2714
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2715
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2716
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2717
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2718
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2719
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2720
  %shr = lshr i32 %14, 7, !dbg !2721
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2722
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2723
  %shl = shl i32 %15, 25, !dbg !2724
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2725
  %or = or i32 %16, %shl, !dbg !2725
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2725
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2726
  %conv23 = zext i8 %17 to i32, !dbg !2726
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2728
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2729

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2730
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2733
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2734

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2735
  store i32 %19, i32* %retval, align 4, !dbg !2736
  br label %return, !dbg !2736

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2737
  br label %return, !dbg !2737

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2738
  %sub32 = sub i32 0, %20, !dbg !2740
  store i32 %sub32, i32* %retval, align 4, !dbg !2741
  br label %return, !dbg !2741

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2742
  ret i32 %21, !dbg !2742
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2743 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2744, metadata !DIExpression()), !dbg !2745
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2746, metadata !DIExpression()), !dbg !2747
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2748, metadata !DIExpression()), !dbg !2749
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2750, metadata !DIExpression()), !dbg !2751
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2752, metadata !DIExpression()), !dbg !2753
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2754, metadata !DIExpression()), !dbg !2755
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2756, metadata !DIExpression()), !dbg !2757
  %0 = load i32, i32* %value.addr, align 4, !dbg !2758
  %cmp = icmp slt i32 %0, 0, !dbg !2760
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2761

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2762
  %conv = sext i8 %1 to i32, !dbg !2762
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2763
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2764

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2765
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2766
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2767

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2768
  %conv6 = sext i8 %3 to i32, !dbg !2768
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2769
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2770

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2771
  br label %if.end, !dbg !2773

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2774
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2776
  %cmp9 = icmp slt i32 %4, 0, !dbg !2778
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2779

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2780
  %sub = sub nsw i32 0, %5, !dbg !2782
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2783
  br label %if.end13, !dbg !2784

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2785
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2787
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2788
  %conv14 = sext i8 %7 to i32, !dbg !2788
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2790
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2791

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2792
  %conv18 = sext i8 %8 to i32, !dbg !2792
  %sub19 = sub nsw i32 0, %conv18, !dbg !2794
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2795
  br label %if.end22, !dbg !2796

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2797
  %conv21 = sext i8 %9 to i32, !dbg !2797
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2799
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2800
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2801
  %mul = mul i32 %10, %11, !dbg !2802
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2803
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2804
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2805
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2806
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2807
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2808
  %shr = lshr i32 %14, 6, !dbg !2809
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2810
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2811
  %shl = shl i32 %15, 26, !dbg !2812
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2813
  %or = or i32 %16, %shl, !dbg !2813
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2813
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2814
  %shr23 = lshr i32 %17, 6, !dbg !2816
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2817
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2818

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2819
  %conv27 = zext i8 %18 to i32, !dbg !2819
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2822
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2823

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2824
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2827
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2828

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2829
  store i32 %20, i32* %retval, align 4, !dbg !2830
  br label %return, !dbg !2830

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2831
  br label %return, !dbg !2831

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2832
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2835
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2836

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2837
  %sub39 = sub i32 0, %22, !dbg !2838
  store i32 %sub39, i32* %retval, align 4, !dbg !2839
  br label %return, !dbg !2839

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2840
  br label %return, !dbg !2840

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2841
  br label %return, !dbg !2841

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2843
  ret i32 %23, !dbg !2843
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2844 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2845, metadata !DIExpression()), !dbg !2846
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2847, metadata !DIExpression()), !dbg !2848
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2849, metadata !DIExpression()), !dbg !2850
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2851, metadata !DIExpression()), !dbg !2852
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2853, metadata !DIExpression()), !dbg !2854
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2855, metadata !DIExpression()), !dbg !2856
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2857, metadata !DIExpression()), !dbg !2858
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2859
  %cmp = icmp slt i32 %0, 0, !dbg !2861
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2862
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2862

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2863
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2864
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2865
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2865

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2866
  br label %if.end, !dbg !2868

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2869
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2871
  %cmp5 = icmp slt i32 %4, 0, !dbg !2873
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2874

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2875
  %sub = sub nsw i32 0, %5, !dbg !2877
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2878
  br label %if.end8, !dbg !2879

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2880
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2882
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2883
  %cmp9 = icmp slt i32 %7, 0, !dbg !2885
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2886

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2887
  %sub11 = sub nsw i32 0, %8, !dbg !2889
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2890
  br label %if.end13, !dbg !2891

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2892
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2894
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2895
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2896
  %mul = mul i32 %10, %11, !dbg !2897
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2898
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2899
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2900
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2901
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2902
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2903
  %cmp14 = icmp eq i32 %14, 0, !dbg !2905
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2906

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2907
  %conv = zext i8 %15 to i32, !dbg !2907
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2910
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2911

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2912
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2915
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2916

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2917
  store i32 %17, i32* %retval, align 4, !dbg !2918
  br label %return, !dbg !2918

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2919
  br label %return, !dbg !2919

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2920
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2923
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2924

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2925
  %sub27 = sub i32 0, %19, !dbg !2926
  store i32 %sub27, i32* %retval, align 4, !dbg !2927
  br label %return, !dbg !2927

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2928
  br label %return, !dbg !2928

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2929
  %conv30 = zext i8 %20 to i32, !dbg !2929
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2932
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2933

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2934
  br label %return, !dbg !2934

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2936
  br label %return, !dbg !2936

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2938
  ret i32 %21, !dbg !2938
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2939 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2940, metadata !DIExpression()), !dbg !2941
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2942, metadata !DIExpression()), !dbg !2943
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2944, metadata !DIExpression()), !dbg !2945
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2946, metadata !DIExpression()), !dbg !2947
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2948, metadata !DIExpression()), !dbg !2949
  %0 = load i32, i32* %value.addr, align 4, !dbg !2950
  %cmp = icmp slt i32 %0, 0, !dbg !2952
  br i1 %cmp, label %if.then, label %if.else, !dbg !2953

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2954
  %sub = sub nsw i32 0, %1, !dbg !2956
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2957
  store i8 1, i8* %u8SignBit, align 1, !dbg !2958
  br label %if.end, !dbg !2959

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2960
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2962
  store i8 0, i8* %u8SignBit, align 1, !dbg !2963
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2964
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2965
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2966
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2967
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2968
  %shr = lshr i32 %5, 1, !dbg !2969
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2970
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2971
  %conv = zext i8 %6 to i32, !dbg !2971
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2973
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2974

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2975
  store i32 %7, i32* %retval, align 4, !dbg !2977
  br label %return, !dbg !2977

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2978
  %sub5 = sub i32 0, %8, !dbg !2980
  store i32 %sub5, i32* %retval, align 4, !dbg !2981
  br label %return, !dbg !2981

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2982
  ret i32 %9, !dbg !2982
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2983 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2984, metadata !DIExpression()), !dbg !2985
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2986, metadata !DIExpression()), !dbg !2987
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2988, metadata !DIExpression()), !dbg !2989
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2990, metadata !DIExpression()), !dbg !2991
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2992, metadata !DIExpression()), !dbg !2993
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2994, metadata !DIExpression()), !dbg !2995
  %0 = load i32, i32* %value.addr, align 4, !dbg !2996
  %cmp = icmp slt i32 %0, 0, !dbg !2998
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2999
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2999

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3000
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3001
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3002
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3002

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3003
  br label %if.end, !dbg !3005

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3006
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3008
  %cmp5 = icmp slt i32 %4, 0, !dbg !3010
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3011

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3012
  %sub = sub nsw i32 0, %5, !dbg !3014
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3015
  br label %if.end8, !dbg !3016

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3017
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3019
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3020
  %cmp9 = icmp slt i32 %7, 0, !dbg !3022
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3023

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3024
  %sub11 = sub nsw i32 0, %8, !dbg !3026
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3027
  br label %if.end13, !dbg !3028

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3029
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3031
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3032
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3033
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3034
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3035
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3036
  %conv = zext i8 %12 to i32, !dbg !3036
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3038
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3039

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3040
  store i32 %13, i32* %retval, align 4, !dbg !3042
  br label %return, !dbg !3042

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3043
  %sub18 = sub i32 0, %14, !dbg !3045
  store i32 %sub18, i32* %retval, align 4, !dbg !3046
  br label %return, !dbg !3046

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3047
  ret i32 %15, !dbg !3047
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3048 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3051, metadata !DIExpression()), !dbg !3052
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3053, metadata !DIExpression()), !dbg !3054
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3055, metadata !DIExpression()), !dbg !3056
  store i32 0, i32* %u32Temp1, align 4, !dbg !3056
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3057, metadata !DIExpression()), !dbg !3058
  store i32 0, i32* %u32Temp2, align 4, !dbg !3058
  %0 = load i32, i32* %value.addr, align 4, !dbg !3059
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3060
  %conv = zext i8 %1 to i32, !dbg !3060
  %mul = mul i32 %0, %conv, !dbg !3061
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3062
  %2 = load i32, i32* %value.addr, align 4, !dbg !3063
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3064
  %conv1 = zext i8 %3 to i32, !dbg !3064
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3065
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3066
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3067
  %shr = lshr i32 %4, 8, !dbg !3068
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3069
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3070
  %shl = shl i32 %5, 24, !dbg !3071
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3072
  %or = or i32 %6, %shl, !dbg !3072
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3072
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3073
  ret i32 %7, !dbg !3074
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3075 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3076, metadata !DIExpression()), !dbg !3077
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3078, metadata !DIExpression()), !dbg !3079
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3080, metadata !DIExpression()), !dbg !3081
  store i32 0, i32* %u32Temp1, align 4, !dbg !3081
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3082, metadata !DIExpression()), !dbg !3083
  store i32 0, i32* %u32Temp2, align 4, !dbg !3083
  %0 = load i32, i32* %value.addr, align 4, !dbg !3084
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3085
  %conv = zext i8 %1 to i32, !dbg !3085
  %mul = mul i32 %0, %conv, !dbg !3086
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3087
  %2 = load i32, i32* %value.addr, align 4, !dbg !3088
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3089
  %conv1 = zext i8 %3 to i32, !dbg !3089
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3090
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3091
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3092
  %shr = lshr i32 %4, 7, !dbg !3093
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3094
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3095
  %shl = shl i32 %5, 25, !dbg !3096
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3097
  %or = or i32 %6, %shl, !dbg !3097
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3097
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3098
  %shr2 = lshr i32 %7, 7, !dbg !3100
  %cmp = icmp eq i32 %shr2, 0, !dbg !3101
  br i1 %cmp, label %if.then, label %if.else, !dbg !3102

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3103
  store i32 %8, i32* %retval, align 4, !dbg !3105
  br label %return, !dbg !3105

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3106
  br label %return, !dbg !3106

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3108
  ret i32 %9, !dbg !3108
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3109 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3112, metadata !DIExpression()), !dbg !3113
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3114, metadata !DIExpression()), !dbg !3115
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3116, metadata !DIExpression()), !dbg !3117
  store i32 0, i32* %u32Temp1, align 4, !dbg !3117
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3118, metadata !DIExpression()), !dbg !3119
  store i32 0, i32* %u32Temp2, align 4, !dbg !3119
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3120
  %conv = sext i8 %0 to i32, !dbg !3120
  %cmp = icmp sgt i32 %conv, 0, !dbg !3122
  br i1 %cmp, label %if.then, label %if.else, !dbg !3123

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3124
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3126
  %conv2 = sext i8 %2 to i32, !dbg !3126
  %mul = mul i32 %1, %conv2, !dbg !3127
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3128
  %3 = load i32, i32* %value.addr, align 4, !dbg !3129
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3130
  %conv3 = sext i8 %4 to i32, !dbg !3130
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3131
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3132
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3133
  %shr = lshr i32 %5, 7, !dbg !3134
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3135
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3136
  %shl = shl i32 %6, 25, !dbg !3137
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3138
  %or = or i32 %7, %shl, !dbg !3138
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3138
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3139
  store i32 %8, i32* %retval, align 4, !dbg !3140
  br label %return, !dbg !3140

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3141
  br label %return, !dbg !3141

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3143
  ret i32 %9, !dbg !3143
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3144 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3145, metadata !DIExpression()), !dbg !3146
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3147, metadata !DIExpression()), !dbg !3148
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3149, metadata !DIExpression()), !dbg !3150
  store i32 0, i32* %u32Temp1, align 4, !dbg !3150
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3151, metadata !DIExpression()), !dbg !3152
  store i32 0, i32* %u32Temp2, align 4, !dbg !3152
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3153
  %conv = sext i8 %0 to i32, !dbg !3153
  %cmp = icmp sle i32 %conv, 0, !dbg !3155
  br i1 %cmp, label %if.then, label %if.else, !dbg !3156

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3157
  br label %return, !dbg !3157

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3159
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3161
  %conv2 = sext i8 %2 to i32, !dbg !3161
  %mul = mul i32 %1, %conv2, !dbg !3162
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3163
  %3 = load i32, i32* %value.addr, align 4, !dbg !3164
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3165
  %conv3 = sext i8 %4 to i32, !dbg !3165
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3166
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3167
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3168
  %shr = lshr i32 %5, 6, !dbg !3169
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3170
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3171
  %shl = shl i32 %6, 26, !dbg !3172
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3173
  %or = or i32 %7, %shl, !dbg !3173
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3173
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3174
  %shr4 = lshr i32 %8, 6, !dbg !3176
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3177
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3178

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3179
  store i32 %9, i32* %retval, align 4, !dbg !3181
  br label %return, !dbg !3181

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3182
  br label %return, !dbg !3182

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3184
  ret i32 %10, !dbg !3184
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3185 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3186, metadata !DIExpression()), !dbg !3187
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3188, metadata !DIExpression()), !dbg !3189
  %0 = load i16, i16* %value.addr, align 2, !dbg !3190
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3191
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3192
  ret i16 %call, !dbg !3193
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3194 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3195, metadata !DIExpression()), !dbg !3196
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3197, metadata !DIExpression()), !dbg !3198
  %0 = load i16, i16* %value.addr, align 2, !dbg !3199
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3200
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3201
  ret i16 %call, !dbg !3202
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3203 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3206, metadata !DIExpression()), !dbg !3207
  %0 = load i16, i16* %value.addr, align 2, !dbg !3208
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3209
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3210
  ret i16 %call, !dbg !3211
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3212 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3215, metadata !DIExpression()), !dbg !3216
  %0 = load i16, i16* %value.addr, align 2, !dbg !3217
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3218
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3219
  ret i16 %call, !dbg !3220
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3221 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3224, metadata !DIExpression()), !dbg !3225
  %0 = load i16, i16* %value.addr, align 2, !dbg !3226
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3227
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3228
  ret i16 %call, !dbg !3229
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3230 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3233, metadata !DIExpression()), !dbg !3234
  %0 = load i16, i16* %value.addr, align 2, !dbg !3235
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3236
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3237
  ret i16 %call, !dbg !3238
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3239 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3242, metadata !DIExpression()), !dbg !3243
  %0 = load i16, i16* %value.addr, align 2, !dbg !3244
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3245
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3246
  ret i16 %call, !dbg !3247
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3248 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3251, metadata !DIExpression()), !dbg !3252
  %0 = load i16, i16* %value.addr, align 2, !dbg !3253
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3254
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3255
  ret i16 %call, !dbg !3256
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3257 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3260, metadata !DIExpression()), !dbg !3261
  %0 = load i16, i16* %value.addr, align 2, !dbg !3262
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3263
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3264
  ret i16 %call, !dbg !3265
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3266 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3269, metadata !DIExpression()), !dbg !3270
  %0 = load i16, i16* %value.addr, align 2, !dbg !3271
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3272
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3273
  ret i16 %call, !dbg !3274
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3275 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3278, metadata !DIExpression()), !dbg !3279
  %0 = load i16, i16* %value.addr, align 2, !dbg !3280
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3281
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3282
  ret i16 %call, !dbg !3283
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3284 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3287, metadata !DIExpression()), !dbg !3288
  %0 = load i16, i16* %value.addr, align 2, !dbg !3289
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3290
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3291
  ret i16 %call, !dbg !3292
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3293 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3296, metadata !DIExpression()), !dbg !3297
  %0 = load i16, i16* %value.addr, align 2, !dbg !3298
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3299
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3300
  ret i16 %call, !dbg !3301
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3302 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3305, metadata !DIExpression()), !dbg !3306
  %0 = load i16, i16* %value.addr, align 2, !dbg !3307
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3308
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3309
  ret i16 %call, !dbg !3310
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3311 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3314, metadata !DIExpression()), !dbg !3315
  %0 = load i16, i16* %value.addr, align 2, !dbg !3316
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3317
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3318
  ret i16 %call, !dbg !3319
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3320 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3323, metadata !DIExpression()), !dbg !3324
  %0 = load i16, i16* %value.addr, align 2, !dbg !3325
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3326
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3327
  %2 = load i16, i16* %retval, align 2, !dbg !3328
  ret i16 %2, !dbg !3328
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3329 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3332, metadata !DIExpression()), !dbg !3333
  %0 = load i16, i16* %value.addr, align 2, !dbg !3334
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3335
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3336
  ret i16 %call, !dbg !3337
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3338 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3341, metadata !DIExpression()), !dbg !3342
  %0 = load i16, i16* %value.addr, align 2, !dbg !3343
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3344
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3345
  ret i16 %call, !dbg !3346
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3347 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3350, metadata !DIExpression()), !dbg !3351
  %0 = load i16, i16* %value.addr, align 2, !dbg !3352
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3353
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3354
  ret i16 %call, !dbg !3355
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3356 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3359, metadata !DIExpression()), !dbg !3360
  %0 = load i16, i16* %value.addr, align 2, !dbg !3361
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3362
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3363
  ret i16 %call, !dbg !3364
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3365 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3368, metadata !DIExpression()), !dbg !3369
  %0 = load i16, i16* %value.addr, align 2, !dbg !3370
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3371
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3372
  ret i16 %call, !dbg !3373
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3374 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3377, metadata !DIExpression()), !dbg !3378
  %0 = load i16, i16* %value.addr, align 2, !dbg !3379
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3380
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3381
  ret i16 %call, !dbg !3382
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3383 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3386, metadata !DIExpression()), !dbg !3387
  %0 = load i16, i16* %value.addr, align 2, !dbg !3388
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3389
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3390
  ret i16 %call, !dbg !3391
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3392 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3395, metadata !DIExpression()), !dbg !3396
  %0 = load i16, i16* %value.addr, align 2, !dbg !3397
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3398
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3399
  ret i16 %call, !dbg !3400
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3401 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3404, metadata !DIExpression()), !dbg !3405
  %0 = load i16, i16* %value.addr, align 2, !dbg !3406
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3407
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3408
  ret i16 %call, !dbg !3409
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3410 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3413, metadata !DIExpression()), !dbg !3414
  %0 = load i16, i16* %value.addr, align 2, !dbg !3415
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3416
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3417
  ret i16 %call, !dbg !3418
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3419 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3422, metadata !DIExpression()), !dbg !3423
  %0 = load i16, i16* %value.addr, align 2, !dbg !3424
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3425
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3426
  ret i16 %call, !dbg !3427
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3428 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3429, metadata !DIExpression()), !dbg !3430
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3431, metadata !DIExpression()), !dbg !3432
  %0 = load i16, i16* %value.addr, align 2, !dbg !3433
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3434
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3435
  ret i16 %call, !dbg !3436
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3437 {
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
  %shl = shl i32 %conv1, 5, !dbg !3445
  %conv2 = trunc i32 %shl to i16, !dbg !3446
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3447
  ret i16 %call, !dbg !3448
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3449 {
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
  %shl = shl i32 %conv1, 6, !dbg !3457
  %conv2 = trunc i32 %shl to i16, !dbg !3458
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3459
  ret i16 %call, !dbg !3460
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3461 {
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
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3471
  ret i16 %call, !dbg !3472
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3473 {
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
  %shl = shl i32 %conv1, 7, !dbg !3481
  %conv2 = trunc i32 %shl to i16, !dbg !3482
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3483
  ret i16 %call, !dbg !3484
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3485 {
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
  %shl = shl i32 %conv1, 4, !dbg !3493
  %conv2 = trunc i32 %shl to i16, !dbg !3494
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3495
  ret i16 %call, !dbg !3496
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3497 {
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
  %shl = shl i32 %conv1, 5, !dbg !3505
  %conv2 = trunc i32 %shl to i16, !dbg !3506
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3507
  ret i16 %call, !dbg !3508
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3509 {
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
  %shl = shl i32 %conv1, 2, !dbg !3517
  %conv2 = trunc i32 %shl to i16, !dbg !3518
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3519
  ret i16 %call, !dbg !3520
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3521 {
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
  %shl = shl i32 %conv1, 6, !dbg !3529
  %conv2 = trunc i32 %shl to i16, !dbg !3530
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3531
  ret i16 %call, !dbg !3532
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3533 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3534, metadata !DIExpression()), !dbg !3535
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3536, metadata !DIExpression()), !dbg !3537
  %0 = load i16, i16* %value.addr, align 2, !dbg !3538
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3539
  %conv = zext i8 %1 to i16, !dbg !3540
  %conv1 = zext i16 %conv to i32, !dbg !3540
  %shl = shl i32 %conv1, 3, !dbg !3541
  %conv2 = trunc i32 %shl to i16, !dbg !3542
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3543
  ret i16 %call, !dbg !3544
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3545 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3546, metadata !DIExpression()), !dbg !3547
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3548, metadata !DIExpression()), !dbg !3549
  %0 = load i32, i32* %value.addr, align 4, !dbg !3550
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3551
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3552
  ret i32 %call, !dbg !3553
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3554 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3557, metadata !DIExpression()), !dbg !3558
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3559, metadata !DIExpression()), !dbg !3560
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3561, metadata !DIExpression()), !dbg !3562
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3563, metadata !DIExpression()), !dbg !3564
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3565, metadata !DIExpression()), !dbg !3566
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3567, metadata !DIExpression()), !dbg !3568
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3569, metadata !DIExpression()), !dbg !3570
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3571, metadata !DIExpression()), !dbg !3572
  %0 = load i32, i32* %value.addr, align 4, !dbg !3573
  %cmp = icmp slt i32 %0, 0, !dbg !3575
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3576

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3577
  %conv = sext i16 %1 to i32, !dbg !3577
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3578
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3579

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3580
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3581
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3582

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3583
  %conv6 = sext i16 %3 to i32, !dbg !3583
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3584
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3585

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3586
  br label %if.end, !dbg !3588

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3589
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3591
  %cmp9 = icmp slt i32 %4, 0, !dbg !3593
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3594

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3595
  %sub = sub nsw i32 0, %5, !dbg !3597
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3598
  br label %if.end13, !dbg !3599

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3600
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3602
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3603
  %conv14 = sext i16 %7 to i32, !dbg !3603
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3605
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3606

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3607
  %conv18 = sext i16 %8 to i32, !dbg !3607
  %sub19 = sub nsw i32 0, %conv18, !dbg !3609
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3610
  br label %if.end22, !dbg !3611

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3612
  %conv21 = sext i16 %9 to i32, !dbg !3612
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3614
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3615
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3616
  %mul = mul i32 %10, %11, !dbg !3617
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3618
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3619
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3620
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3621
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3622
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3623
  %15 = load i32, i32* %count.addr, align 4, !dbg !3624
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3625
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3625
  %shr = lshr i32 %14, %15, !dbg !3625, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3626
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3627
  %17 = load i32, i32* %count.addr, align 4, !dbg !3628
  %sub23 = sub i32 32, %17, !dbg !3629
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3630
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3630
  %shl = shl i32 %16, %sub23, !dbg !3630, !klee.check.shift !260
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3631
  %or = or i32 %18, %shl, !dbg !3631
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3631
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3632
  %20 = load i32, i32* %count.addr, align 4, !dbg !3634
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3635
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3635
  %shr24 = lshr i32 %19, %20, !dbg !3635, !klee.check.shift !260
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3636
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3637

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3638
  %conv28 = zext i8 %21 to i32, !dbg !3638
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3641
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3642

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3643
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3646
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3647

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3648
  store i32 %23, i32* %retval, align 4, !dbg !3649
  br label %return, !dbg !3649

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3650
  br label %return, !dbg !3650

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3651
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3654
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3655

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3656
  %sub40 = sub i32 0, %25, !dbg !3657
  store i32 %sub40, i32* %retval, align 4, !dbg !3658
  br label %return, !dbg !3658

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3659
  br label %return, !dbg !3659

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3660
  br label %return, !dbg !3660

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3662
  ret i32 %26, !dbg !3662
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3663 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3664, metadata !DIExpression()), !dbg !3665
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3666, metadata !DIExpression()), !dbg !3667
  %0 = load i32, i32* %value.addr, align 4, !dbg !3668
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3669
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3670
  ret i32 %call, !dbg !3671
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3672 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3675, metadata !DIExpression()), !dbg !3676
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3677, metadata !DIExpression()), !dbg !3678
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3679, metadata !DIExpression()), !dbg !3680
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3681, metadata !DIExpression()), !dbg !3682
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3683, metadata !DIExpression()), !dbg !3684
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3685, metadata !DIExpression()), !dbg !3686
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3687, metadata !DIExpression()), !dbg !3688
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3689, metadata !DIExpression()), !dbg !3690
  %0 = load i32, i32* %value.addr, align 4, !dbg !3691
  %cmp = icmp slt i32 %0, 0, !dbg !3693
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3694

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3695
  %conv = sext i8 %1 to i32, !dbg !3695
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3696
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3697

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3698
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3699
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3700

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3701
  %conv6 = sext i8 %3 to i32, !dbg !3701
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3702
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3703

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3704
  br label %if.end, !dbg !3706

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3707
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3709
  %cmp9 = icmp slt i32 %4, 0, !dbg !3711
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3712

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3713
  %sub = sub nsw i32 0, %5, !dbg !3715
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3716
  br label %if.end13, !dbg !3717

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3718
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3720
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3721
  %conv14 = sext i8 %7 to i32, !dbg !3721
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3723
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3724

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3725
  %conv18 = sext i8 %8 to i32, !dbg !3725
  %sub19 = sub nsw i32 0, %conv18, !dbg !3727
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3728
  br label %if.end22, !dbg !3729

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3730
  %conv21 = sext i8 %9 to i32, !dbg !3730
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3732
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3733
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3734
  %mul = mul i32 %10, %11, !dbg !3735
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3736
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3737
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3738
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3739
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3740
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3741
  %15 = load i32, i32* %count.addr, align 4, !dbg !3742
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3743
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3743
  %shr = lshr i32 %14, %15, !dbg !3743, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3744
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3745
  %17 = load i32, i32* %count.addr, align 4, !dbg !3746
  %sub23 = sub i32 32, %17, !dbg !3747
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3748
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3748
  %shl = shl i32 %16, %sub23, !dbg !3748, !klee.check.shift !260
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3749
  %or = or i32 %18, %shl, !dbg !3749
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3749
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3750
  %20 = load i32, i32* %count.addr, align 4, !dbg !3752
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3753
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3753
  %shr24 = lshr i32 %19, %20, !dbg !3753, !klee.check.shift !260
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3754
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3755

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3756
  %conv28 = zext i8 %21 to i32, !dbg !3756
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3759
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3760

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3761
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3764
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3765

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3766
  store i32 %23, i32* %retval, align 4, !dbg !3767
  br label %return, !dbg !3767

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3768
  br label %return, !dbg !3768

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3769
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3772
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3773

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3774
  %sub40 = sub i32 0, %25, !dbg !3775
  store i32 %sub40, i32* %retval, align 4, !dbg !3776
  br label %return, !dbg !3776

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3777
  br label %return, !dbg !3777

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3778
  br label %return, !dbg !3778

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3780
  ret i32 %26, !dbg !3780
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3781 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3782, metadata !DIExpression()), !dbg !3783
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3784, metadata !DIExpression()), !dbg !3785
  %0 = load i32, i32* %value.addr, align 4, !dbg !3786
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3787
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3788
  ret i32 %call, !dbg !3789
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3790 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3793, metadata !DIExpression()), !dbg !3794
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3795, metadata !DIExpression()), !dbg !3796
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3797, metadata !DIExpression()), !dbg !3798
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3799, metadata !DIExpression()), !dbg !3800
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3801, metadata !DIExpression()), !dbg !3802
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3803, metadata !DIExpression()), !dbg !3804
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3805, metadata !DIExpression()), !dbg !3806
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3807, metadata !DIExpression()), !dbg !3808
  %0 = load i32, i32* %value.addr, align 4, !dbg !3809
  %cmp = icmp slt i32 %0, 0, !dbg !3811
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3812

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3813
  %conv = zext i16 %1 to i32, !dbg !3813
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3814
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3815

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3816
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3817
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3818

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3819
  %conv6 = zext i16 %3 to i32, !dbg !3819
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3820
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3821

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3822
  br label %if.end, !dbg !3824

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3825
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3827
  %cmp9 = icmp slt i32 %4, 0, !dbg !3829
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3830

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3831
  %sub = sub nsw i32 0, %5, !dbg !3833
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3834
  br label %if.end13, !dbg !3835

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3836
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3838
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3839
  %conv14 = zext i16 %7 to i32, !dbg !3839
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3841
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3842

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3843
  %conv18 = zext i16 %8 to i32, !dbg !3843
  %sub19 = sub nsw i32 0, %conv18, !dbg !3845
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3846
  br label %if.end22, !dbg !3847

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3848
  %conv21 = zext i16 %9 to i32, !dbg !3848
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3850
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3851
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3852
  %mul = mul i32 %10, %11, !dbg !3853
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3854
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3855
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3856
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3857
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3858
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3859
  %15 = load i32, i32* %count.addr, align 4, !dbg !3860
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3861
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3861
  %shr = lshr i32 %14, %15, !dbg !3861, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3862
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3863
  %17 = load i32, i32* %count.addr, align 4, !dbg !3864
  %sub23 = sub i32 32, %17, !dbg !3865
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3866
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3866
  %shl = shl i32 %16, %sub23, !dbg !3866, !klee.check.shift !260
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3867
  %or = or i32 %18, %shl, !dbg !3867
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3867
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3868
  %20 = load i32, i32* %count.addr, align 4, !dbg !3870
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3871
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3871
  %shr24 = lshr i32 %19, %20, !dbg !3871, !klee.check.shift !260
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3872
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3873

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3874
  %conv28 = zext i8 %21 to i32, !dbg !3874
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3877
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3878

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3879
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3882
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3883

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3884
  store i32 %23, i32* %retval, align 4, !dbg !3885
  br label %return, !dbg !3885

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3886
  br label %return, !dbg !3886

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3887
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3890
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3891

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3892
  %sub40 = sub i32 0, %25, !dbg !3893
  store i32 %sub40, i32* %retval, align 4, !dbg !3894
  br label %return, !dbg !3894

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3895
  br label %return, !dbg !3895

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3896
  br label %return, !dbg !3896

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3898
  ret i32 %26, !dbg !3898
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3899 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3900, metadata !DIExpression()), !dbg !3901
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3902, metadata !DIExpression()), !dbg !3903
  %0 = load i32, i32* %value.addr, align 4, !dbg !3904
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3905
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3906
  ret i32 %call, !dbg !3907
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3908 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3911, metadata !DIExpression()), !dbg !3912
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3913, metadata !DIExpression()), !dbg !3914
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3915, metadata !DIExpression()), !dbg !3916
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3917, metadata !DIExpression()), !dbg !3918
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3919, metadata !DIExpression()), !dbg !3920
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3921, metadata !DIExpression()), !dbg !3922
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3923, metadata !DIExpression()), !dbg !3924
  %0 = load i32, i32* %value.addr, align 4, !dbg !3925
  %cmp = icmp slt i32 %0, 0, !dbg !3927
  br i1 %cmp, label %if.then, label %if.else, !dbg !3928

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3929
  %1 = load i32, i32* %value.addr, align 4, !dbg !3931
  %sub = sub nsw i32 0, %1, !dbg !3932
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3933
  br label %if.end, !dbg !3934

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3935
  %2 = load i32, i32* %value.addr, align 4, !dbg !3937
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3938
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3939
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3940
  %conv = zext i8 %4 to i32, !dbg !3940
  %mul = mul i32 %3, %conv, !dbg !3941
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3942
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3943
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3944
  %conv1 = zext i8 %6 to i32, !dbg !3944
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3945
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3946
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3947
  %8 = load i32, i32* %count.addr, align 4, !dbg !3948
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3949
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3949
  %shr = lshr i32 %7, %8, !dbg !3949, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3950
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3951
  %10 = load i32, i32* %count.addr, align 4, !dbg !3952
  %sub2 = sub i32 32, %10, !dbg !3953
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3954
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3954
  %shl = shl i32 %9, %sub2, !dbg !3954, !klee.check.shift !260
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3955
  %or = or i32 %11, %shl, !dbg !3955
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3955
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3956
  %13 = load i32, i32* %count.addr, align 4, !dbg !3958
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3959
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3959
  %shr3 = lshr i32 %12, %13, !dbg !3959, !klee.check.shift !260
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3960
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3961

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3962
  %conv7 = zext i8 %14 to i32, !dbg !3962
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3965
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3966

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3967
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3970
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3971

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3972
  store i32 %16, i32* %retval, align 4, !dbg !3973
  br label %return, !dbg !3973

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3974
  br label %return, !dbg !3974

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3975
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3978
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3979

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3980
  %sub19 = sub i32 0, %18, !dbg !3982
  store i32 %sub19, i32* %retval, align 4, !dbg !3983
  br label %return, !dbg !3983

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3984
  br label %return, !dbg !3984

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3986
  %conv22 = zext i8 %19 to i32, !dbg !3986
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3989
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3990

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3991
  br label %return, !dbg !3991

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3993
  br label %return, !dbg !3993

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3995
  ret i32 %20, !dbg !3995
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3996 {
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
  %shl = shl i32 %conv1, 5, !dbg !4004
  %conv2 = trunc i32 %shl to i16, !dbg !4005
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4006
  ret i8 %call, !dbg !4007
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4008 {
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
  %shl = shl i32 %conv1, 6, !dbg !4016
  %conv2 = trunc i32 %shl to i16, !dbg !4017
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4018
  ret i8 %call, !dbg !4019
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4020 {
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
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4030
  ret i8 %call, !dbg !4031
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4032 {
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
  %shl = shl i32 %conv1, 7, !dbg !4040
  %conv2 = trunc i32 %shl to i16, !dbg !4041
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4042
  ret i8 %call, !dbg !4043
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4044 {
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
  %shl = shl i32 %conv1, 4, !dbg !4052
  %conv2 = trunc i32 %shl to i16, !dbg !4053
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4054
  ret i8 %call, !dbg !4055
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4056 {
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
  %shl = shl i32 %conv1, 5, !dbg !4064
  %conv2 = trunc i32 %shl to i16, !dbg !4065
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4066
  ret i8 %call, !dbg !4067
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4068 {
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
  %shl = shl i32 %conv1, 2, !dbg !4076
  %conv2 = trunc i32 %shl to i16, !dbg !4077
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4078
  ret i8 %call, !dbg !4079
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4080 {
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
  %shl = shl i32 %conv1, 6, !dbg !4088
  %conv2 = trunc i32 %shl to i16, !dbg !4089
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4090
  ret i8 %call, !dbg !4091
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4092 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4093, metadata !DIExpression()), !dbg !4094
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4095, metadata !DIExpression()), !dbg !4096
  %0 = load i8, i8* %value.addr, align 1, !dbg !4097
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4098
  %conv = zext i8 %1 to i16, !dbg !4099
  %conv1 = zext i16 %conv to i32, !dbg !4099
  %shl = shl i32 %conv1, 3, !dbg !4100
  %conv2 = trunc i32 %shl to i16, !dbg !4101
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4102
  ret i8 %call, !dbg !4103
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4104 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4105, metadata !DIExpression()), !dbg !4106
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4107, metadata !DIExpression()), !dbg !4108
  %0 = load i16, i16* %value.addr, align 2, !dbg !4109
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4110
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4111
  ret i16 %call, !dbg !4112
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4113 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4114, metadata !DIExpression()), !dbg !4115
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4116, metadata !DIExpression()), !dbg !4117
  %0 = load i16, i16* %value.addr, align 2, !dbg !4118
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4119
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4120
  ret i16 %call, !dbg !4121
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4122 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4123, metadata !DIExpression()), !dbg !4124
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4125, metadata !DIExpression()), !dbg !4126
  %0 = load i16, i16* %value.addr, align 2, !dbg !4127
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4128
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4129
  ret i16 %call, !dbg !4130
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4131 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4132, metadata !DIExpression()), !dbg !4133
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4134, metadata !DIExpression()), !dbg !4135
  %0 = load i16, i16* %value.addr, align 2, !dbg !4136
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4137
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4138
  ret i16 %call, !dbg !4139
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4140 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4141, metadata !DIExpression()), !dbg !4142
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4143, metadata !DIExpression()), !dbg !4144
  %0 = load i16, i16* %value.addr, align 2, !dbg !4145
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4146
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4147
  ret i16 %call, !dbg !4148
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4149 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4150, metadata !DIExpression()), !dbg !4151
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4152, metadata !DIExpression()), !dbg !4153
  %0 = load i16, i16* %value.addr, align 2, !dbg !4154
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4155
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4156
  ret i16 %call, !dbg !4157
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4158 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4159, metadata !DIExpression()), !dbg !4160
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4161, metadata !DIExpression()), !dbg !4162
  %0 = load i16, i16* %value.addr, align 2, !dbg !4163
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4164
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4165
  ret i16 %call, !dbg !4166
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4167 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4168, metadata !DIExpression()), !dbg !4169
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4170, metadata !DIExpression()), !dbg !4171
  %0 = load i16, i16* %value.addr, align 2, !dbg !4172
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4173
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4174
  ret i16 %call, !dbg !4175
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4176 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4177, metadata !DIExpression()), !dbg !4178
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4179, metadata !DIExpression()), !dbg !4180
  %0 = load i16, i16* %value.addr, align 2, !dbg !4181
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4182
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4183
  ret i16 %call, !dbg !4184
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4185 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4186, metadata !DIExpression()), !dbg !4187
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4188, metadata !DIExpression()), !dbg !4189
  %0 = load i16, i16* %value.addr, align 2, !dbg !4190
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4191
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4192
  ret i16 %call, !dbg !4193
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4194 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4195, metadata !DIExpression()), !dbg !4196
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4197, metadata !DIExpression()), !dbg !4198
  %0 = load i16, i16* %value.addr, align 2, !dbg !4199
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4200
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4201
  ret i16 %call, !dbg !4202
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4203 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4204, metadata !DIExpression()), !dbg !4205
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4206, metadata !DIExpression()), !dbg !4207
  %0 = load i16, i16* %value.addr, align 2, !dbg !4208
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4209
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4210
  ret i16 %call, !dbg !4211
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4212 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4213, metadata !DIExpression()), !dbg !4214
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4215, metadata !DIExpression()), !dbg !4216
  %0 = load i16, i16* %value.addr, align 2, !dbg !4217
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4218
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4219
  ret i16 %call, !dbg !4220
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4221 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4222, metadata !DIExpression()), !dbg !4223
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4224, metadata !DIExpression()), !dbg !4225
  %0 = load i16, i16* %value.addr, align 2, !dbg !4226
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4227
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4228
  ret i16 %call, !dbg !4229
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4230 {
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
  %shl = shl i32 %conv1, 5, !dbg !4238
  %conv2 = trunc i32 %shl to i16, !dbg !4239
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4240
  ret i16 %call, !dbg !4241
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4242 {
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
  %shl = shl i32 %conv1, 6, !dbg !4250
  %conv2 = trunc i32 %shl to i16, !dbg !4251
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4252
  ret i16 %call, !dbg !4253
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4254 {
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
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4264
  ret i16 %call, !dbg !4265
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4266 {
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
  %shl = shl i32 %conv1, 7, !dbg !4274
  %conv2 = trunc i32 %shl to i16, !dbg !4275
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4276
  ret i16 %call, !dbg !4277
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4278 {
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
  %shl = shl i32 %conv1, 4, !dbg !4286
  %conv2 = trunc i32 %shl to i16, !dbg !4287
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4288
  ret i16 %call, !dbg !4289
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4290 {
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
  %shl = shl i32 %conv1, 5, !dbg !4298
  %conv2 = trunc i32 %shl to i16, !dbg !4299
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4300
  ret i16 %call, !dbg !4301
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4302 {
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
  %shl = shl i32 %conv1, 2, !dbg !4310
  %conv2 = trunc i32 %shl to i16, !dbg !4311
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4312
  ret i16 %call, !dbg !4313
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4314 {
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
  %shl = shl i32 %conv1, 6, !dbg !4322
  %conv2 = trunc i32 %shl to i16, !dbg !4323
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4324
  ret i16 %call, !dbg !4325
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4326 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4327, metadata !DIExpression()), !dbg !4328
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4329, metadata !DIExpression()), !dbg !4330
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4331
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4332
  %conv = zext i8 %1 to i16, !dbg !4333
  %conv1 = zext i16 %conv to i32, !dbg !4333
  %shl = shl i32 %conv1, 3, !dbg !4334
  %conv2 = trunc i32 %shl to i16, !dbg !4335
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4336
  ret i16 %call, !dbg !4337
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4338 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4339, metadata !DIExpression()), !dbg !4340
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4341, metadata !DIExpression()), !dbg !4342
  %0 = load i32, i32* %value.addr, align 4, !dbg !4343
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4344
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4345
  ret i32 %call, !dbg !4346
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4347 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4350, metadata !DIExpression()), !dbg !4351
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4352, metadata !DIExpression()), !dbg !4353
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4354, metadata !DIExpression()), !dbg !4355
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4356, metadata !DIExpression()), !dbg !4357
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4358, metadata !DIExpression()), !dbg !4359
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4360, metadata !DIExpression()), !dbg !4361
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4362, metadata !DIExpression()), !dbg !4363
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4364
  %conv = sext i16 %0 to i32, !dbg !4364
  %cmp = icmp slt i32 %conv, 0, !dbg !4366
  br i1 %cmp, label %if.then, label %if.else, !dbg !4367

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4368
  br label %if.end, !dbg !4370

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4371
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4373
  %conv2 = sext i16 %1 to i32, !dbg !4373
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4375
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4376

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4377
  %conv6 = sext i16 %2 to i32, !dbg !4377
  %sub = sub nsw i32 0, %conv6, !dbg !4379
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4380
  br label %if.end9, !dbg !4381

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4382
  %conv8 = sext i16 %3 to i32, !dbg !4382
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4384
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4385
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4386
  %mul = mul i32 %4, %5, !dbg !4387
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4388
  %6 = load i32, i32* %value.addr, align 4, !dbg !4389
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4390
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4391
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4392
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4393
  %9 = load i32, i32* %count.addr, align 4, !dbg !4394
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4395
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4395
  %shr = lshr i32 %8, %9, !dbg !4395, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4396
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4397
  %11 = load i32, i32* %count.addr, align 4, !dbg !4398
  %sub10 = sub i32 32, %11, !dbg !4399
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4400
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4400
  %shl = shl i32 %10, %sub10, !dbg !4400, !klee.check.shift !260
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4401
  %or = or i32 %12, %shl, !dbg !4401
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4401
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4402
  %14 = load i32, i32* %count.addr, align 4, !dbg !4404
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4405
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4405
  %shr11 = lshr i32 %13, %14, !dbg !4405, !klee.check.shift !260
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4406
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4407

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4408
  %conv15 = zext i8 %15 to i32, !dbg !4408
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4411
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4412

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4413
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4416
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4417

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4418
  store i32 %17, i32* %retval, align 4, !dbg !4419
  br label %return, !dbg !4419

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4420
  br label %return, !dbg !4420

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4421
  br label %return, !dbg !4421

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4423
  br label %return, !dbg !4423

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4425
  ret i32 %18, !dbg !4425
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4426 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4427, metadata !DIExpression()), !dbg !4428
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4429, metadata !DIExpression()), !dbg !4430
  %0 = load i32, i32* %value.addr, align 4, !dbg !4431
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4432
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4433
  ret i32 %call, !dbg !4434
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4435 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4438, metadata !DIExpression()), !dbg !4439
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4440, metadata !DIExpression()), !dbg !4441
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4442, metadata !DIExpression()), !dbg !4443
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4444, metadata !DIExpression()), !dbg !4445
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4446, metadata !DIExpression()), !dbg !4447
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4448, metadata !DIExpression()), !dbg !4449
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4450
  %cmp = icmp slt i32 %0, 0, !dbg !4452
  br i1 %cmp, label %if.then, label %if.else, !dbg !4453

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4454
  br label %if.end, !dbg !4456

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4457
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4459
  %cmp1 = icmp slt i32 %1, 0, !dbg !4461
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4462

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4463
  %sub = sub nsw i32 0, %2, !dbg !4465
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4466
  br label %if.end4, !dbg !4467

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4468
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4470
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4471
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4472
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4473
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4474
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4475
  %7 = load i32, i32* %count.addr, align 4, !dbg !4476
  %sub5 = sub i32 %7, 32, !dbg !4477
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4478
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4478
  %shr = lshr i32 %6, %sub5, !dbg !4478, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4479
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4480
  %conv = zext i8 %8 to i32, !dbg !4480
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4482
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4483

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4484
  store i32 %9, i32* %retval, align 4, !dbg !4486
  br label %return, !dbg !4486

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4487
  br label %return, !dbg !4487

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4489
  ret i32 %10, !dbg !4489
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4490 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4491, metadata !DIExpression()), !dbg !4492
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4493, metadata !DIExpression()), !dbg !4494
  %0 = load i32, i32* %value.addr, align 4, !dbg !4495
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4496
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4497
  ret i32 %call, !dbg !4498
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4499 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4502, metadata !DIExpression()), !dbg !4503
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4504, metadata !DIExpression()), !dbg !4505
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4506, metadata !DIExpression()), !dbg !4507
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4508, metadata !DIExpression()), !dbg !4509
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4510, metadata !DIExpression()), !dbg !4511
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4512, metadata !DIExpression()), !dbg !4513
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4514, metadata !DIExpression()), !dbg !4515
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4516
  %conv = sext i8 %0 to i32, !dbg !4516
  %cmp = icmp slt i32 %conv, 0, !dbg !4518
  br i1 %cmp, label %if.then, label %if.else, !dbg !4519

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4520
  br label %if.end, !dbg !4522

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4523
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4525
  %conv2 = sext i8 %1 to i32, !dbg !4525
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4527
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4528

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4529
  %conv6 = sext i8 %2 to i32, !dbg !4529
  %sub = sub nsw i32 0, %conv6, !dbg !4531
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4532
  br label %if.end9, !dbg !4533

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4534
  %conv8 = sext i8 %3 to i32, !dbg !4534
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4536
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4537
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4538
  %mul = mul i32 %4, %5, !dbg !4539
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4540
  %6 = load i32, i32* %value.addr, align 4, !dbg !4541
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4542
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4543
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4544
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4545
  %9 = load i32, i32* %count.addr, align 4, !dbg !4546
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4547
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4547
  %shr = lshr i32 %8, %9, !dbg !4547, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4548
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4549
  %11 = load i32, i32* %count.addr, align 4, !dbg !4550
  %sub10 = sub i32 32, %11, !dbg !4551
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4552
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4552
  %shl = shl i32 %10, %sub10, !dbg !4552, !klee.check.shift !260
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4553
  %or = or i32 %12, %shl, !dbg !4553
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4553
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4554
  %14 = load i32, i32* %count.addr, align 4, !dbg !4556
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4557
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4557
  %shr11 = lshr i32 %13, %14, !dbg !4557, !klee.check.shift !260
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4558
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4559

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4560
  %conv15 = zext i8 %15 to i32, !dbg !4560
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4563
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4564

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4565
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4568
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4569

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4570
  store i32 %17, i32* %retval, align 4, !dbg !4571
  br label %return, !dbg !4571

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4572
  br label %return, !dbg !4572

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4573
  br label %return, !dbg !4573

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4575
  br label %return, !dbg !4575

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4577
  ret i32 %18, !dbg !4577
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4578 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4579, metadata !DIExpression()), !dbg !4580
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4581, metadata !DIExpression()), !dbg !4582
  %0 = load i32, i32* %value.addr, align 4, !dbg !4583
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4584
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4585
  ret i32 %call, !dbg !4586
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4587 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4588, metadata !DIExpression()), !dbg !4589
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4590, metadata !DIExpression()), !dbg !4591
  %0 = load i32, i32* %value.addr, align 4, !dbg !4592
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4593
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4594
  ret i32 %call, !dbg !4595
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4596 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4599, metadata !DIExpression()), !dbg !4600
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4601, metadata !DIExpression()), !dbg !4602
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4603, metadata !DIExpression()), !dbg !4604
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4605, metadata !DIExpression()), !dbg !4606
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4607, metadata !DIExpression()), !dbg !4608
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4609, metadata !DIExpression()), !dbg !4610
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4611, metadata !DIExpression()), !dbg !4612
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4613, metadata !DIExpression()), !dbg !4614
  %0 = load i32, i32* %value.addr, align 4, !dbg !4615
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4616
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4617
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4618
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4619
  %3 = load i32, i32* %count.addr, align 4, !dbg !4620
  %sub = sub i32 %3, 32, !dbg !4621
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4622
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4622
  %shr = lshr i32 %2, %sub, !dbg !4622, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4623
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4624
  ret i32 %4, !dbg !4625
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4626 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4627, metadata !DIExpression()), !dbg !4628
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4629, metadata !DIExpression()), !dbg !4630
  %0 = load i32, i32* %value.addr, align 4, !dbg !4631
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4632
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4633
  ret i32 %call, !dbg !4634
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4635 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4638, metadata !DIExpression()), !dbg !4639
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4640, metadata !DIExpression()), !dbg !4641
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4642, metadata !DIExpression()), !dbg !4643
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4644, metadata !DIExpression()), !dbg !4645
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4646, metadata !DIExpression()), !dbg !4647
  %0 = load i32, i32* %value.addr, align 4, !dbg !4648
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4649
  %conv = zext i8 %1 to i32, !dbg !4649
  %mul = mul i32 %0, %conv, !dbg !4650
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4651
  %2 = load i32, i32* %value.addr, align 4, !dbg !4652
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4653
  %conv1 = zext i8 %3 to i32, !dbg !4653
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4654
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4655
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4656
  %5 = load i32, i32* %count.addr, align 4, !dbg !4657
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4658
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4658
  %shr = lshr i32 %4, %5, !dbg !4658, !klee.check.shift !260
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4659
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4660
  %7 = load i32, i32* %count.addr, align 4, !dbg !4661
  %sub = sub i32 32, %7, !dbg !4662
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4663
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4663
  %shl = shl i32 %6, %sub, !dbg !4663, !klee.check.shift !260
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4664
  %or = or i32 %8, %shl, !dbg !4664
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4664
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4665
  %10 = load i32, i32* %count.addr, align 4, !dbg !4667
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4668
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4668
  %shr2 = lshr i32 %9, %10, !dbg !4668, !klee.check.shift !260
  %cmp = icmp eq i32 %shr2, 0, !dbg !4669
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4670

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4671
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4674
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4675

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4676
  store i32 %12, i32* %retval, align 4, !dbg !4677
  br label %return, !dbg !4677

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4678
  br label %return, !dbg !4678

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4679
  br label %return, !dbg !4679

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4681
  ret i32 %13, !dbg !4681
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4682 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4683, metadata !DIExpression()), !dbg !4684
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4685, metadata !DIExpression()), !dbg !4686
  %0 = load i8, i8* %value.addr, align 1, !dbg !4687
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4688
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4689
  ret i8 %call, !dbg !4690
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4691 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4692, metadata !DIExpression()), !dbg !4693
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4694, metadata !DIExpression()), !dbg !4695
  %0 = load i8, i8* %value.addr, align 1, !dbg !4696
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4697
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4698
  ret i8 %call, !dbg !4699
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4700 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4701, metadata !DIExpression()), !dbg !4702
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4703, metadata !DIExpression()), !dbg !4704
  %0 = load i8, i8* %value.addr, align 1, !dbg !4705
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4706
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4707
  ret i8 %call, !dbg !4708
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4709 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4712, metadata !DIExpression()), !dbg !4713
  %0 = load i8, i8* %value.addr, align 1, !dbg !4714
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4715
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4716
  ret i8 %call, !dbg !4717
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4718 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4719, metadata !DIExpression()), !dbg !4720
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4721, metadata !DIExpression()), !dbg !4722
  %0 = load i8, i8* %value.addr, align 1, !dbg !4723
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4724
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4725
  ret i8 %call, !dbg !4726
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4727 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4728, metadata !DIExpression()), !dbg !4729
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4730, metadata !DIExpression()), !dbg !4731
  %0 = load i8, i8* %value.addr, align 1, !dbg !4732
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4733
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4734
  ret i8 %call, !dbg !4735
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4736 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4737, metadata !DIExpression()), !dbg !4738
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4739, metadata !DIExpression()), !dbg !4740
  %0 = load i8, i8* %value.addr, align 1, !dbg !4741
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4742
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4743
  ret i8 %call, !dbg !4744
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4745 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4746, metadata !DIExpression()), !dbg !4747
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4748, metadata !DIExpression()), !dbg !4749
  %0 = load i8, i8* %value.addr, align 1, !dbg !4750
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4751
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4752
  ret i8 %call, !dbg !4753
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4754 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4755, metadata !DIExpression()), !dbg !4756
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4757, metadata !DIExpression()), !dbg !4758
  %0 = load i8, i8* %value.addr, align 1, !dbg !4759
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4760
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4761
  ret i8 %call, !dbg !4762
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4763 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4765, metadata !DIExpression()), !dbg !4766
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4767, metadata !DIExpression()), !dbg !4768
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4769, metadata !DIExpression()), !dbg !4770
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4771, metadata !DIExpression()), !dbg !4772
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4773, metadata !DIExpression()), !dbg !4774
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4775, metadata !DIExpression()), !dbg !4776
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4777, metadata !DIExpression()), !dbg !4778
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4779, metadata !DIExpression()), !dbg !4780
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4781, metadata !DIExpression()), !dbg !4782
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4783, metadata !DIExpression()), !dbg !4784
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4785, metadata !DIExpression()), !dbg !4786
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4787, metadata !DIExpression()), !dbg !4788
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4789
  %and = and i32 %0, 65535, !dbg !4790
  %conv = trunc i32 %and to i16, !dbg !4789
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4791
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4792
  %and1 = and i32 %1, -65536, !dbg !4793
  %shr = lshr i32 %and1, 16, !dbg !4794
  %conv2 = trunc i32 %shr to i16, !dbg !4795
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4796
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4797
  %and3 = and i32 %2, 65535, !dbg !4798
  %conv4 = trunc i32 %and3 to i16, !dbg !4797
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4799
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4800
  %and5 = and i32 %3, -65536, !dbg !4801
  %shr6 = lshr i32 %and5, 16, !dbg !4802
  %conv7 = trunc i32 %shr6 to i16, !dbg !4803
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4804
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4805
  %conv8 = zext i16 %4 to i32, !dbg !4805
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4806
  %conv9 = zext i16 %5 to i32, !dbg !4806
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4807
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4808
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4809
  %conv10 = zext i16 %6 to i32, !dbg !4809
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4810
  %conv11 = zext i16 %7 to i32, !dbg !4810
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4811
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4812
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4813
  %conv13 = zext i16 %8 to i32, !dbg !4813
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4814
  %conv14 = zext i16 %9 to i32, !dbg !4814
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4815
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4816
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4817
  %conv16 = zext i16 %10 to i32, !dbg !4817
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4818
  %conv17 = zext i16 %11 to i32, !dbg !4818
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4819
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4820
  %12 = load i32, i32* %MulTemp2, align 4, !dbg !4821
  %shr19 = lshr i32 %12, 16, !dbg !4822
  %13 = load i32, i32* %MulTemp3, align 4, !dbg !4823
  %shr20 = lshr i32 %13, 16, !dbg !4824
  %add = add i32 %shr19, %shr20, !dbg !4825
  %14 = load i32, i32* %MulTemp4, align 4, !dbg !4826
  %add21 = add i32 %add, %14, !dbg !4827
  store i32 %add21, i32* %HIGHWORD, align 4, !dbg !4828
  %15 = load i32, i32* %MulTemp1, align 4, !dbg !4829
  %shr22 = lshr i32 %15, 16, !dbg !4830
  %16 = load i32, i32* %MulTemp2, align 4, !dbg !4831
  %and23 = and i32 %16, 65535, !dbg !4832
  %add24 = add i32 %shr22, %and23, !dbg !4833
  %17 = load i32, i32* %MulTemp3, align 4, !dbg !4834
  %and25 = and i32 %17, 65535, !dbg !4835
  %add26 = add i32 %add24, %and25, !dbg !4836
  store i32 %add26, i32* %OverFlow, align 4, !dbg !4837
  %18 = load i32, i32* %OverFlow, align 4, !dbg !4838
  %cmp = icmp ugt i32 %18, 65535, !dbg !4840
  br i1 %cmp, label %if.then, label %if.else, !dbg !4841

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %HIGHWORD, align 4, !dbg !4842
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4844
  %shr28 = lshr i32 %20, 16, !dbg !4845
  %add29 = add i32 %19, %shr28, !dbg !4846
  store i32 %add29, i32* %retval, align 4, !dbg !4847
  br label %return, !dbg !4847

if.else:                                          ; preds = %entry
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4848
  store i32 %21, i32* %retval, align 4, !dbg !4850
  br label %return, !dbg !4850

return:                                           ; preds = %if.else, %if.then
  %22 = load i32, i32* %retval, align 4, !dbg !4851
  ret i32 %22, !dbg !4851
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4852 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4853, metadata !DIExpression()), !dbg !4854
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4855, metadata !DIExpression()), !dbg !4856
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4857, metadata !DIExpression()), !dbg !4858
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4859, metadata !DIExpression()), !dbg !4860
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4861, metadata !DIExpression()), !dbg !4862
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4863, metadata !DIExpression()), !dbg !4864
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4865, metadata !DIExpression()), !dbg !4866
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4867, metadata !DIExpression()), !dbg !4868
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4869, metadata !DIExpression()), !dbg !4870
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4871, metadata !DIExpression()), !dbg !4872
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4873, metadata !DIExpression()), !dbg !4874
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4875, metadata !DIExpression()), !dbg !4876
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4877
  %and = and i32 %0, 65535, !dbg !4878
  %conv = trunc i32 %and to i16, !dbg !4877
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4879
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4880
  %and1 = and i32 %1, -65536, !dbg !4881
  %shr = lshr i32 %and1, 16, !dbg !4882
  %conv2 = trunc i32 %shr to i16, !dbg !4883
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4884
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4885
  %and3 = and i32 %2, 65535, !dbg !4886
  %conv4 = trunc i32 %and3 to i16, !dbg !4885
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4887
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4888
  %and5 = and i32 %3, -65536, !dbg !4889
  %shr6 = lshr i32 %and5, 16, !dbg !4890
  %conv7 = trunc i32 %shr6 to i16, !dbg !4891
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4892
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4893
  %conv8 = zext i16 %4 to i32, !dbg !4893
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4894
  %conv9 = zext i16 %5 to i32, !dbg !4894
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4895
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4896
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4897
  %conv10 = zext i16 %6 to i32, !dbg !4897
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4898
  %conv11 = zext i16 %7 to i32, !dbg !4898
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4899
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4900
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4901
  %conv13 = zext i16 %8 to i32, !dbg !4901
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4902
  %conv14 = zext i16 %9 to i32, !dbg !4902
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4903
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4904
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4905
  %conv16 = zext i16 %10 to i32, !dbg !4905
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4906
  %conv17 = zext i16 %11 to i32, !dbg !4906
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4907
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4908
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4909
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4910
  %and19 = and i32 %13, 65535, !dbg !4911
  %shl = shl i32 %and19, 16, !dbg !4912
  %add = add i32 %12, %shl, !dbg !4913
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4914
  %and20 = and i32 %14, 65535, !dbg !4915
  %shl21 = shl i32 %and20, 16, !dbg !4916
  %add22 = add i32 %add, %shl21, !dbg !4917
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4918
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4919
  ret i32 %15, !dbg !4920
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4921 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4927, metadata !DIExpression()), !dbg !4928
  %2 = icmp eq i64 %0, 0, !dbg !4929
  br i1 %2, label %3, label %4, !dbg !4931

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4932
  unreachable, !dbg !4932

4:                                                ; preds = %1
  ret void, !dbg !4933
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4934 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4940, metadata !DIExpression()), !dbg !4942
  call void @llvm.dbg.value(metadata i64 %1, metadata !4941, metadata !DIExpression()), !dbg !4942
  %3 = icmp ult i64 %1, %0, !dbg !4943
  br i1 %3, label %5, label %4, !dbg !4945

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4946
  unreachable, !dbg !4946

5:                                                ; preds = %2
  ret void, !dbg !4948
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/mul_Ccode_alarm_0106.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106/MulHword_alarm_0106.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
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
!48 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!49 = !DISubroutineType(types: !50)
!50 = !{!51}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DILocalVariable(name: "val1", scope: !47, file: !48, line: 9, type: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !51)
!55 = !DILocation(line: 9, column: 13, scope: !47)
!56 = !DILocalVariable(name: "val2", scope: !47, file: !48, line: 10, type: !14)
!57 = !DILocation(line: 10, column: 13, scope: !47)
!58 = !DILocalVariable(name: "result", scope: !47, file: !48, line: 11, type: !53)
!59 = !DILocation(line: 11, column: 13, scope: !47)
!60 = !DILocation(line: 13, column: 24, scope: !47)
!61 = !DILocation(line: 13, column: 5, scope: !47)
!62 = !DILocation(line: 14, column: 24, scope: !47)
!63 = !DILocation(line: 14, column: 5, scope: !47)
!64 = !DILocation(line: 16, column: 35, scope: !47)
!65 = !DILocation(line: 16, column: 41, scope: !47)
!66 = !DILocation(line: 16, column: 14, scope: !47)
!67 = !DILocation(line: 16, column: 12, scope: !47)
!68 = !DILocation(line: 18, column: 11, scope: !47)
!69 = !DILocation(line: 19, column: 5, scope: !47)
!70 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !71, file: !71, line: 43, type: !72, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!72 = !DISubroutineType(types: !73)
!73 = !{!6, !6, !22}
!74 = !DILocalVariable(name: "value", arg: 1, scope: !70, file: !71, line: 43, type: !6)
!75 = !DILocation(line: 43, column: 35, scope: !70)
!76 = !DILocalVariable(name: "factor", arg: 2, scope: !70, file: !71, line: 43, type: !22)
!77 = !DILocation(line: 43, column: 46, scope: !70)
!78 = !DILocalVariable(name: "s32MulTemp1", scope: !70, file: !71, line: 45, type: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !53)
!80 = !DILocation(line: 45, column: 6, scope: !70)
!81 = !DILocalVariable(name: "s32MulTemp2", scope: !70, file: !71, line: 45, type: !79)
!82 = !DILocation(line: 45, column: 24, scope: !70)
!83 = !DILocation(line: 46, column: 16, scope: !70)
!84 = !DILocation(line: 46, column: 24, scope: !70)
!85 = !DILocation(line: 46, column: 22, scope: !70)
!86 = !DILocation(line: 46, column: 14, scope: !70)
!87 = !DILocation(line: 48, column: 16, scope: !70)
!88 = !DILocation(line: 48, column: 28, scope: !70)
!89 = !DILocation(line: 48, column: 14, scope: !70)
!90 = !DILocation(line: 50, column: 6, scope: !91)
!91 = distinct !DILexicalBlock(scope: !70, file: !71, line: 50, column: 5)
!92 = !DILocation(line: 50, column: 17, scope: !91)
!93 = !DILocation(line: 50, column: 21, scope: !91)
!94 = !DILocation(line: 50, column: 25, scope: !91)
!95 = !DILocation(line: 50, column: 37, scope: !91)
!96 = !DILocation(line: 50, column: 46, scope: !91)
!97 = !DILocation(line: 50, column: 5, scope: !70)
!98 = !DILocation(line: 52, column: 17, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !71, line: 51, column: 2)
!100 = !DILocation(line: 52, column: 29, scope: !99)
!101 = !DILocation(line: 52, column: 15, scope: !99)
!102 = !DILocation(line: 53, column: 14, scope: !99)
!103 = !DILocation(line: 53, column: 10, scope: !99)
!104 = !DILocation(line: 53, column: 3, scope: !99)
!105 = !DILocation(line: 57, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !91, file: !71, line: 56, column: 2)
!107 = !DILocation(line: 57, column: 10, scope: !106)
!108 = !DILocation(line: 57, column: 3, scope: !106)
!109 = !DILocation(line: 59, column: 1, scope: !70)
!110 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !71, file: !71, line: 77, type: !72, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!111 = !DILocalVariable(name: "value", arg: 1, scope: !110, file: !71, line: 77, type: !6)
!112 = !DILocation(line: 77, column: 38, scope: !110)
!113 = !DILocalVariable(name: "factor", arg: 2, scope: !110, file: !71, line: 77, type: !22)
!114 = !DILocation(line: 77, column: 49, scope: !110)
!115 = !DILocalVariable(name: "s32MulTemp1", scope: !110, file: !71, line: 79, type: !79)
!116 = !DILocation(line: 79, column: 6, scope: !110)
!117 = !DILocalVariable(name: "s32MulTemp2", scope: !110, file: !71, line: 79, type: !79)
!118 = !DILocation(line: 79, column: 24, scope: !110)
!119 = !DILocation(line: 80, column: 16, scope: !110)
!120 = !DILocation(line: 80, column: 24, scope: !110)
!121 = !DILocation(line: 80, column: 22, scope: !110)
!122 = !DILocation(line: 80, column: 14, scope: !110)
!123 = !DILocation(line: 81, column: 16, scope: !110)
!124 = !DILocation(line: 81, column: 28, scope: !110)
!125 = !DILocation(line: 81, column: 14, scope: !110)
!126 = !DILocation(line: 82, column: 6, scope: !127)
!127 = distinct !DILexicalBlock(scope: !110, file: !71, line: 82, column: 5)
!128 = !DILocation(line: 82, column: 17, scope: !127)
!129 = !DILocation(line: 82, column: 21, scope: !127)
!130 = !DILocation(line: 82, column: 25, scope: !127)
!131 = !DILocation(line: 82, column: 37, scope: !127)
!132 = !DILocation(line: 82, column: 44, scope: !127)
!133 = !DILocation(line: 82, column: 5, scope: !110)
!134 = !DILocation(line: 84, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !71, line: 83, column: 2)
!136 = !DILocation(line: 84, column: 29, scope: !135)
!137 = !DILocation(line: 84, column: 15, scope: !135)
!138 = !DILocation(line: 85, column: 2, scope: !135)
!139 = !DILocation(line: 91, column: 5, scope: !140)
!140 = distinct !DILexicalBlock(scope: !110, file: !71, line: 91, column: 5)
!141 = !DILocation(line: 91, column: 17, scope: !140)
!142 = !DILocation(line: 91, column: 5, scope: !110)
!143 = !DILocation(line: 93, column: 6, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !71, line: 93, column: 6)
!145 = distinct !DILexicalBlock(scope: !140, file: !71, line: 92, column: 2)
!146 = !DILocation(line: 93, column: 18, scope: !144)
!147 = !DILocation(line: 93, column: 6, scope: !145)
!148 = !DILocation(line: 95, column: 15, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !71, line: 94, column: 3)
!150 = !DILocation(line: 95, column: 11, scope: !149)
!151 = !DILocation(line: 95, column: 4, scope: !149)
!152 = !DILocation(line: 99, column: 4, scope: !153)
!153 = distinct !DILexicalBlock(scope: !144, file: !71, line: 98, column: 3)
!154 = !DILocation(line: 104, column: 3, scope: !155)
!155 = distinct !DILexicalBlock(scope: !140, file: !71, line: 103, column: 2)
!156 = !DILocation(line: 106, column: 1, scope: !110)
!157 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !71, file: !71, line: 123, type: !158, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!158 = !DISubroutineType(types: !159)
!159 = !{!6, !6, !17}
!160 = !DILocalVariable(name: "value", arg: 1, scope: !157, file: !71, line: 123, type: !6)
!161 = !DILocation(line: 123, column: 25, scope: !157)
!162 = !DILocalVariable(name: "factor", arg: 2, scope: !157, file: !71, line: 123, type: !17)
!163 = !DILocation(line: 123, column: 35, scope: !157)
!164 = !DILocalVariable(name: "s32MulTemp1", scope: !157, file: !71, line: 125, type: !79)
!165 = !DILocation(line: 125, column: 6, scope: !157)
!166 = !DILocalVariable(name: "s32MulTemp2", scope: !157, file: !71, line: 125, type: !79)
!167 = !DILocation(line: 125, column: 24, scope: !157)
!168 = !DILocation(line: 126, column: 16, scope: !157)
!169 = !DILocation(line: 126, column: 24, scope: !157)
!170 = !DILocation(line: 126, column: 22, scope: !157)
!171 = !DILocation(line: 126, column: 14, scope: !157)
!172 = !DILocation(line: 127, column: 16, scope: !157)
!173 = !DILocation(line: 127, column: 28, scope: !157)
!174 = !DILocation(line: 127, column: 14, scope: !157)
!175 = !DILocation(line: 128, column: 6, scope: !176)
!176 = distinct !DILexicalBlock(scope: !157, file: !71, line: 128, column: 5)
!177 = !DILocation(line: 128, column: 17, scope: !176)
!178 = !DILocation(line: 128, column: 21, scope: !176)
!179 = !DILocation(line: 128, column: 25, scope: !176)
!180 = !DILocation(line: 128, column: 37, scope: !176)
!181 = !DILocation(line: 128, column: 44, scope: !176)
!182 = !DILocation(line: 128, column: 5, scope: !157)
!183 = !DILocation(line: 130, column: 17, scope: !184)
!184 = distinct !DILexicalBlock(scope: !176, file: !71, line: 129, column: 2)
!185 = !DILocation(line: 130, column: 29, scope: !184)
!186 = !DILocation(line: 130, column: 15, scope: !184)
!187 = !DILocation(line: 131, column: 14, scope: !184)
!188 = !DILocation(line: 131, column: 10, scope: !184)
!189 = !DILocation(line: 131, column: 3, scope: !184)
!190 = !DILocation(line: 135, column: 14, scope: !191)
!191 = distinct !DILexicalBlock(scope: !176, file: !71, line: 134, column: 2)
!192 = !DILocation(line: 135, column: 10, scope: !191)
!193 = !DILocation(line: 135, column: 3, scope: !191)
!194 = !DILocation(line: 137, column: 1, scope: !157)
!195 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !71, file: !71, line: 155, type: !158, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!196 = !DILocalVariable(name: "value", arg: 1, scope: !195, file: !71, line: 155, type: !6)
!197 = !DILocation(line: 155, column: 25, scope: !195)
!198 = !DILocalVariable(name: "factor", arg: 2, scope: !195, file: !71, line: 155, type: !17)
!199 = !DILocation(line: 155, column: 35, scope: !195)
!200 = !DILocalVariable(name: "s32MulTemp1", scope: !195, file: !71, line: 157, type: !79)
!201 = !DILocation(line: 157, column: 6, scope: !195)
!202 = !DILocalVariable(name: "s32MulTemp2", scope: !195, file: !71, line: 157, type: !79)
!203 = !DILocation(line: 157, column: 24, scope: !195)
!204 = !DILocation(line: 158, column: 16, scope: !195)
!205 = !DILocation(line: 158, column: 24, scope: !195)
!206 = !DILocation(line: 158, column: 22, scope: !195)
!207 = !DILocation(line: 158, column: 14, scope: !195)
!208 = !DILocation(line: 159, column: 16, scope: !195)
!209 = !DILocation(line: 159, column: 28, scope: !195)
!210 = !DILocation(line: 159, column: 14, scope: !195)
!211 = !DILocation(line: 160, column: 6, scope: !212)
!212 = distinct !DILexicalBlock(scope: !195, file: !71, line: 160, column: 5)
!213 = !DILocation(line: 160, column: 17, scope: !212)
!214 = !DILocation(line: 160, column: 21, scope: !212)
!215 = !DILocation(line: 160, column: 25, scope: !212)
!216 = !DILocation(line: 160, column: 37, scope: !212)
!217 = !DILocation(line: 160, column: 44, scope: !212)
!218 = !DILocation(line: 160, column: 5, scope: !195)
!219 = !DILocation(line: 162, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !212, file: !71, line: 161, column: 2)
!221 = !DILocation(line: 162, column: 29, scope: !220)
!222 = !DILocation(line: 162, column: 15, scope: !220)
!223 = !DILocation(line: 163, column: 2, scope: !220)
!224 = !DILocation(line: 169, column: 5, scope: !225)
!225 = distinct !DILexicalBlock(scope: !195, file: !71, line: 169, column: 5)
!226 = !DILocation(line: 169, column: 17, scope: !225)
!227 = !DILocation(line: 169, column: 5, scope: !195)
!228 = !DILocation(line: 171, column: 6, scope: !229)
!229 = distinct !DILexicalBlock(scope: !230, file: !71, line: 171, column: 6)
!230 = distinct !DILexicalBlock(scope: !225, file: !71, line: 170, column: 2)
!231 = !DILocation(line: 171, column: 18, scope: !229)
!232 = !DILocation(line: 171, column: 6, scope: !230)
!233 = !DILocation(line: 173, column: 15, scope: !234)
!234 = distinct !DILexicalBlock(scope: !229, file: !71, line: 172, column: 3)
!235 = !DILocation(line: 173, column: 11, scope: !234)
!236 = !DILocation(line: 173, column: 4, scope: !234)
!237 = !DILocation(line: 177, column: 4, scope: !238)
!238 = distinct !DILexicalBlock(scope: !229, file: !71, line: 176, column: 3)
!239 = !DILocation(line: 182, column: 3, scope: !240)
!240 = distinct !DILexicalBlock(scope: !225, file: !71, line: 181, column: 2)
!241 = !DILocation(line: 184, column: 1, scope: !195)
!242 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !71, file: !71, line: 200, type: !243, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!243 = !DISubroutineType(types: !244)
!244 = !{!13, !13, !13, !79}
!245 = !DILocalVariable(name: "value", arg: 1, scope: !242, file: !71, line: 200, type: !13)
!246 = !DILocation(line: 200, column: 40, scope: !242)
!247 = !DILocalVariable(name: "factor", arg: 2, scope: !242, file: !71, line: 200, type: !13)
!248 = !DILocation(line: 200, column: 51, scope: !242)
!249 = !DILocalVariable(name: "count", arg: 3, scope: !242, file: !71, line: 200, type: !79)
!250 = !DILocation(line: 200, column: 63, scope: !242)
!251 = !DILocalVariable(name: "s32MulTemp", scope: !242, file: !71, line: 202, type: !79)
!252 = !DILocation(line: 202, column: 6, scope: !242)
!253 = !DILocation(line: 203, column: 15, scope: !242)
!254 = !DILocation(line: 203, column: 23, scope: !242)
!255 = !DILocation(line: 203, column: 21, scope: !242)
!256 = !DILocation(line: 203, column: 13, scope: !242)
!257 = !DILocation(line: 204, column: 15, scope: !242)
!258 = !DILocation(line: 204, column: 26, scope: !242)
!259 = !DILocation(line: 204, column: 25, scope: !242)
!260 = !{!"True"}
!261 = !DILocation(line: 204, column: 13, scope: !242)
!262 = !DILocation(line: 205, column: 9, scope: !242)
!263 = !DILocation(line: 205, column: 2, scope: !242)
!264 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !71, file: !71, line: 223, type: !243, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!265 = !DILocalVariable(name: "value", arg: 1, scope: !264, file: !71, line: 223, type: !13)
!266 = !DILocation(line: 223, column: 43, scope: !264)
!267 = !DILocalVariable(name: "factor", arg: 2, scope: !264, file: !71, line: 223, type: !13)
!268 = !DILocation(line: 223, column: 54, scope: !264)
!269 = !DILocalVariable(name: "count", arg: 3, scope: !264, file: !71, line: 223, type: !79)
!270 = !DILocation(line: 223, column: 66, scope: !264)
!271 = !DILocalVariable(name: "s32MulTemp", scope: !264, file: !71, line: 225, type: !79)
!272 = !DILocation(line: 225, column: 6, scope: !264)
!273 = !DILocation(line: 226, column: 15, scope: !264)
!274 = !DILocation(line: 226, column: 23, scope: !264)
!275 = !DILocation(line: 226, column: 21, scope: !264)
!276 = !DILocation(line: 226, column: 13, scope: !264)
!277 = !DILocation(line: 227, column: 15, scope: !264)
!278 = !DILocation(line: 227, column: 26, scope: !264)
!279 = !DILocation(line: 227, column: 25, scope: !264)
!280 = !DILocation(line: 227, column: 13, scope: !264)
!281 = !DILocation(line: 228, column: 5, scope: !282)
!282 = distinct !DILexicalBlock(scope: !264, file: !71, line: 228, column: 5)
!283 = !DILocation(line: 228, column: 16, scope: !282)
!284 = !DILocation(line: 228, column: 5, scope: !264)
!285 = !DILocation(line: 230, column: 6, scope: !286)
!286 = distinct !DILexicalBlock(scope: !287, file: !71, line: 230, column: 6)
!287 = distinct !DILexicalBlock(scope: !282, file: !71, line: 229, column: 2)
!288 = !DILocation(line: 230, column: 17, scope: !286)
!289 = !DILocation(line: 230, column: 6, scope: !287)
!290 = !DILocation(line: 232, column: 16, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !71, line: 231, column: 3)
!292 = !DILocation(line: 232, column: 11, scope: !291)
!293 = !DILocation(line: 232, column: 4, scope: !291)
!294 = !DILocation(line: 236, column: 4, scope: !295)
!295 = distinct !DILexicalBlock(scope: !286, file: !71, line: 235, column: 3)
!296 = !DILocation(line: 241, column: 3, scope: !297)
!297 = distinct !DILexicalBlock(scope: !282, file: !71, line: 240, column: 2)
!298 = !DILocation(line: 243, column: 1, scope: !264)
!299 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !71, file: !71, line: 262, type: !300, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!300 = !DISubroutineType(types: !301)
!301 = !{!13, !13, !13}
!302 = !DILocalVariable(name: "value", arg: 1, scope: !299, file: !71, line: 262, type: !13)
!303 = !DILocation(line: 262, column: 30, scope: !299)
!304 = !DILocalVariable(name: "factor", arg: 2, scope: !299, file: !71, line: 262, type: !13)
!305 = !DILocation(line: 262, column: 41, scope: !299)
!306 = !DILocalVariable(name: "s32MulTemp1", scope: !299, file: !71, line: 264, type: !79)
!307 = !DILocation(line: 264, column: 6, scope: !299)
!308 = !DILocalVariable(name: "s32MulTemp2", scope: !299, file: !71, line: 264, type: !79)
!309 = !DILocation(line: 264, column: 24, scope: !299)
!310 = !DILocation(line: 265, column: 16, scope: !299)
!311 = !DILocation(line: 265, column: 24, scope: !299)
!312 = !DILocation(line: 265, column: 22, scope: !299)
!313 = !DILocation(line: 265, column: 14, scope: !299)
!314 = !DILocation(line: 266, column: 16, scope: !299)
!315 = !DILocation(line: 266, column: 28, scope: !299)
!316 = !DILocation(line: 266, column: 14, scope: !299)
!317 = !DILocation(line: 267, column: 6, scope: !318)
!318 = distinct !DILexicalBlock(scope: !299, file: !71, line: 267, column: 5)
!319 = !DILocation(line: 267, column: 17, scope: !318)
!320 = !DILocation(line: 267, column: 21, scope: !318)
!321 = !DILocation(line: 267, column: 25, scope: !318)
!322 = !DILocation(line: 267, column: 37, scope: !318)
!323 = !DILocation(line: 267, column: 46, scope: !318)
!324 = !DILocation(line: 267, column: 5, scope: !299)
!325 = !DILocation(line: 269, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !318, file: !71, line: 268, column: 2)
!327 = !DILocation(line: 269, column: 29, scope: !326)
!328 = !DILocation(line: 269, column: 15, scope: !326)
!329 = !DILocation(line: 271, column: 2, scope: !326)
!330 = !DILocation(line: 277, column: 5, scope: !331)
!331 = distinct !DILexicalBlock(scope: !299, file: !71, line: 277, column: 5)
!332 = !DILocation(line: 277, column: 17, scope: !331)
!333 = !DILocation(line: 277, column: 5, scope: !299)
!334 = !DILocation(line: 279, column: 15, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !71, line: 278, column: 2)
!336 = !DILocation(line: 279, column: 10, scope: !335)
!337 = !DILocation(line: 279, column: 3, scope: !335)
!338 = !DILocation(line: 283, column: 3, scope: !339)
!339 = distinct !DILexicalBlock(scope: !331, file: !71, line: 282, column: 2)
!340 = !DILocation(line: 285, column: 1, scope: !299)
!341 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !71, file: !71, line: 304, type: !300, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DILocalVariable(name: "value", arg: 1, scope: !341, file: !71, line: 304, type: !13)
!343 = !DILocation(line: 304, column: 30, scope: !341)
!344 = !DILocalVariable(name: "factor", arg: 2, scope: !341, file: !71, line: 304, type: !13)
!345 = !DILocation(line: 304, column: 41, scope: !341)
!346 = !DILocalVariable(name: "s32MulTemp1", scope: !341, file: !71, line: 306, type: !79)
!347 = !DILocation(line: 306, column: 6, scope: !341)
!348 = !DILocalVariable(name: "s32MulTemp2", scope: !341, file: !71, line: 306, type: !79)
!349 = !DILocation(line: 306, column: 24, scope: !341)
!350 = !DILocation(line: 307, column: 16, scope: !341)
!351 = !DILocation(line: 307, column: 24, scope: !341)
!352 = !DILocation(line: 307, column: 22, scope: !341)
!353 = !DILocation(line: 307, column: 14, scope: !341)
!354 = !DILocation(line: 308, column: 16, scope: !341)
!355 = !DILocation(line: 308, column: 28, scope: !341)
!356 = !DILocation(line: 308, column: 14, scope: !341)
!357 = !DILocation(line: 309, column: 6, scope: !358)
!358 = distinct !DILexicalBlock(scope: !341, file: !71, line: 309, column: 5)
!359 = !DILocation(line: 309, column: 17, scope: !358)
!360 = !DILocation(line: 309, column: 21, scope: !358)
!361 = !DILocation(line: 309, column: 25, scope: !358)
!362 = !DILocation(line: 309, column: 37, scope: !358)
!363 = !DILocation(line: 309, column: 46, scope: !358)
!364 = !DILocation(line: 309, column: 5, scope: !341)
!365 = !DILocation(line: 311, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !358, file: !71, line: 310, column: 2)
!367 = !DILocation(line: 311, column: 29, scope: !366)
!368 = !DILocation(line: 311, column: 15, scope: !366)
!369 = !DILocation(line: 312, column: 2, scope: !366)
!370 = !DILocation(line: 318, column: 6, scope: !371)
!371 = distinct !DILexicalBlock(scope: !341, file: !71, line: 318, column: 6)
!372 = !DILocation(line: 318, column: 18, scope: !371)
!373 = !DILocation(line: 318, column: 6, scope: !341)
!374 = !DILocation(line: 320, column: 6, scope: !375)
!375 = distinct !DILexicalBlock(scope: !376, file: !71, line: 320, column: 6)
!376 = distinct !DILexicalBlock(scope: !371, file: !71, line: 319, column: 2)
!377 = !DILocation(line: 320, column: 18, scope: !375)
!378 = !DILocation(line: 320, column: 6, scope: !376)
!379 = !DILocation(line: 322, column: 16, scope: !380)
!380 = distinct !DILexicalBlock(scope: !375, file: !71, line: 321, column: 3)
!381 = !DILocation(line: 322, column: 11, scope: !380)
!382 = !DILocation(line: 322, column: 4, scope: !380)
!383 = !DILocation(line: 326, column: 4, scope: !384)
!384 = distinct !DILexicalBlock(scope: !375, file: !71, line: 325, column: 3)
!385 = !DILocation(line: 331, column: 3, scope: !386)
!386 = distinct !DILexicalBlock(scope: !371, file: !71, line: 330, column: 2)
!387 = !DILocation(line: 333, column: 1, scope: !341)
!388 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !71, file: !71, line: 350, type: !389, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DISubroutineType(types: !390)
!390 = !{!13, !13, !22}
!391 = !DILocalVariable(name: "value", arg: 1, scope: !388, file: !71, line: 350, type: !13)
!392 = !DILocation(line: 350, column: 39, scope: !388)
!393 = !DILocalVariable(name: "factor", arg: 2, scope: !388, file: !71, line: 350, type: !22)
!394 = !DILocation(line: 350, column: 50, scope: !388)
!395 = !DILocalVariable(name: "s32MulTemp1", scope: !388, file: !71, line: 352, type: !79)
!396 = !DILocation(line: 352, column: 6, scope: !388)
!397 = !DILocalVariable(name: "s32MulTemp2", scope: !388, file: !71, line: 352, type: !79)
!398 = !DILocation(line: 352, column: 24, scope: !388)
!399 = !DILocation(line: 353, column: 16, scope: !388)
!400 = !DILocation(line: 353, column: 24, scope: !388)
!401 = !DILocation(line: 353, column: 22, scope: !388)
!402 = !DILocation(line: 353, column: 14, scope: !388)
!403 = !DILocation(line: 354, column: 16, scope: !388)
!404 = !DILocation(line: 354, column: 28, scope: !388)
!405 = !DILocation(line: 354, column: 14, scope: !388)
!406 = !DILocation(line: 355, column: 6, scope: !407)
!407 = distinct !DILexicalBlock(scope: !388, file: !71, line: 355, column: 5)
!408 = !DILocation(line: 355, column: 17, scope: !407)
!409 = !DILocation(line: 355, column: 21, scope: !407)
!410 = !DILocation(line: 355, column: 25, scope: !407)
!411 = !DILocation(line: 355, column: 37, scope: !407)
!412 = !DILocation(line: 355, column: 46, scope: !407)
!413 = !DILocation(line: 355, column: 5, scope: !388)
!414 = !DILocation(line: 361, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !407, file: !71, line: 360, column: 2)
!416 = !DILocation(line: 361, column: 29, scope: !415)
!417 = !DILocation(line: 361, column: 15, scope: !415)
!418 = !DILocation(line: 362, column: 15, scope: !415)
!419 = !DILocation(line: 362, column: 10, scope: !415)
!420 = !DILocation(line: 362, column: 3, scope: !415)
!421 = !DILocation(line: 366, column: 15, scope: !422)
!422 = distinct !DILexicalBlock(scope: !407, file: !71, line: 365, column: 2)
!423 = !DILocation(line: 366, column: 10, scope: !422)
!424 = !DILocation(line: 366, column: 3, scope: !422)
!425 = !DILocation(line: 368, column: 1, scope: !388)
!426 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !71, file: !71, line: 386, type: !389, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!427 = !DILocalVariable(name: "value", arg: 1, scope: !426, file: !71, line: 386, type: !13)
!428 = !DILocation(line: 386, column: 42, scope: !426)
!429 = !DILocalVariable(name: "factor", arg: 2, scope: !426, file: !71, line: 386, type: !22)
!430 = !DILocation(line: 386, column: 53, scope: !426)
!431 = !DILocalVariable(name: "s32MulTemp1", scope: !426, file: !71, line: 388, type: !79)
!432 = !DILocation(line: 388, column: 6, scope: !426)
!433 = !DILocalVariable(name: "s32MulTemp2", scope: !426, file: !71, line: 388, type: !79)
!434 = !DILocation(line: 388, column: 24, scope: !426)
!435 = !DILocation(line: 389, column: 16, scope: !426)
!436 = !DILocation(line: 389, column: 24, scope: !426)
!437 = !DILocation(line: 389, column: 22, scope: !426)
!438 = !DILocation(line: 389, column: 14, scope: !426)
!439 = !DILocation(line: 390, column: 16, scope: !426)
!440 = !DILocation(line: 390, column: 28, scope: !426)
!441 = !DILocation(line: 390, column: 14, scope: !426)
!442 = !DILocation(line: 391, column: 6, scope: !443)
!443 = distinct !DILexicalBlock(scope: !426, file: !71, line: 391, column: 5)
!444 = !DILocation(line: 391, column: 17, scope: !443)
!445 = !DILocation(line: 391, column: 21, scope: !443)
!446 = !DILocation(line: 391, column: 25, scope: !443)
!447 = !DILocation(line: 391, column: 37, scope: !443)
!448 = !DILocation(line: 391, column: 44, scope: !443)
!449 = !DILocation(line: 391, column: 5, scope: !426)
!450 = !DILocation(line: 398, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !443, file: !71, line: 397, column: 2)
!452 = !DILocation(line: 398, column: 29, scope: !451)
!453 = !DILocation(line: 398, column: 15, scope: !451)
!454 = !DILocation(line: 399, column: 2, scope: !451)
!455 = !DILocation(line: 404, column: 5, scope: !456)
!456 = distinct !DILexicalBlock(scope: !426, file: !71, line: 404, column: 5)
!457 = !DILocation(line: 404, column: 17, scope: !456)
!458 = !DILocation(line: 404, column: 5, scope: !426)
!459 = !DILocation(line: 406, column: 6, scope: !460)
!460 = distinct !DILexicalBlock(scope: !461, file: !71, line: 406, column: 6)
!461 = distinct !DILexicalBlock(scope: !456, file: !71, line: 405, column: 2)
!462 = !DILocation(line: 406, column: 18, scope: !460)
!463 = !DILocation(line: 406, column: 6, scope: !461)
!464 = !DILocation(line: 408, column: 16, scope: !465)
!465 = distinct !DILexicalBlock(scope: !460, file: !71, line: 407, column: 3)
!466 = !DILocation(line: 408, column: 11, scope: !465)
!467 = !DILocation(line: 408, column: 4, scope: !465)
!468 = !DILocation(line: 412, column: 4, scope: !469)
!469 = distinct !DILexicalBlock(scope: !460, file: !71, line: 411, column: 3)
!470 = !DILocation(line: 417, column: 3, scope: !471)
!471 = distinct !DILexicalBlock(scope: !456, file: !71, line: 416, column: 2)
!472 = !DILocation(line: 419, column: 1, scope: !426)
!473 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !71, file: !71, line: 436, type: !474, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!474 = !DISubroutineType(types: !475)
!475 = !{!13, !13, !17}
!476 = !DILocalVariable(name: "value", arg: 1, scope: !473, file: !71, line: 436, type: !13)
!477 = !DILocation(line: 436, column: 29, scope: !473)
!478 = !DILocalVariable(name: "factor", arg: 2, scope: !473, file: !71, line: 436, type: !17)
!479 = !DILocation(line: 436, column: 39, scope: !473)
!480 = !DILocalVariable(name: "s32MulTemp1", scope: !473, file: !71, line: 438, type: !79)
!481 = !DILocation(line: 438, column: 6, scope: !473)
!482 = !DILocalVariable(name: "s32MulTemp2", scope: !473, file: !71, line: 438, type: !79)
!483 = !DILocation(line: 438, column: 24, scope: !473)
!484 = !DILocation(line: 439, column: 16, scope: !473)
!485 = !DILocation(line: 439, column: 24, scope: !473)
!486 = !DILocation(line: 439, column: 22, scope: !473)
!487 = !DILocation(line: 439, column: 14, scope: !473)
!488 = !DILocation(line: 440, column: 16, scope: !473)
!489 = !DILocation(line: 440, column: 28, scope: !473)
!490 = !DILocation(line: 440, column: 14, scope: !473)
!491 = !DILocation(line: 441, column: 6, scope: !492)
!492 = distinct !DILexicalBlock(scope: !473, file: !71, line: 441, column: 5)
!493 = !DILocation(line: 441, column: 17, scope: !492)
!494 = !DILocation(line: 441, column: 21, scope: !492)
!495 = !DILocation(line: 441, column: 25, scope: !492)
!496 = !DILocation(line: 441, column: 37, scope: !492)
!497 = !DILocation(line: 441, column: 44, scope: !492)
!498 = !DILocation(line: 441, column: 5, scope: !473)
!499 = !DILocation(line: 448, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !492, file: !71, line: 447, column: 2)
!501 = !DILocation(line: 448, column: 29, scope: !500)
!502 = !DILocation(line: 448, column: 15, scope: !500)
!503 = !DILocation(line: 449, column: 10, scope: !500)
!504 = !DILocation(line: 449, column: 3, scope: !500)
!505 = !DILocation(line: 453, column: 10, scope: !506)
!506 = distinct !DILexicalBlock(scope: !492, file: !71, line: 452, column: 2)
!507 = !DILocation(line: 453, column: 3, scope: !506)
!508 = !DILocation(line: 455, column: 1, scope: !473)
!509 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !71, file: !71, line: 473, type: !474, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!510 = !DILocalVariable(name: "value", arg: 1, scope: !509, file: !71, line: 473, type: !13)
!511 = !DILocation(line: 473, column: 29, scope: !509)
!512 = !DILocalVariable(name: "factor", arg: 2, scope: !509, file: !71, line: 473, type: !17)
!513 = !DILocation(line: 473, column: 39, scope: !509)
!514 = !DILocalVariable(name: "s32MulTemp1", scope: !509, file: !71, line: 475, type: !79)
!515 = !DILocation(line: 475, column: 6, scope: !509)
!516 = !DILocalVariable(name: "s32MulTemp2", scope: !509, file: !71, line: 475, type: !79)
!517 = !DILocation(line: 475, column: 24, scope: !509)
!518 = !DILocation(line: 476, column: 16, scope: !509)
!519 = !DILocation(line: 476, column: 24, scope: !509)
!520 = !DILocation(line: 476, column: 22, scope: !509)
!521 = !DILocation(line: 476, column: 14, scope: !509)
!522 = !DILocation(line: 477, column: 16, scope: !509)
!523 = !DILocation(line: 477, column: 28, scope: !509)
!524 = !DILocation(line: 477, column: 14, scope: !509)
!525 = !DILocation(line: 478, column: 6, scope: !526)
!526 = distinct !DILexicalBlock(scope: !509, file: !71, line: 478, column: 5)
!527 = !DILocation(line: 478, column: 17, scope: !526)
!528 = !DILocation(line: 478, column: 21, scope: !526)
!529 = !DILocation(line: 478, column: 25, scope: !526)
!530 = !DILocation(line: 478, column: 37, scope: !526)
!531 = !DILocation(line: 478, column: 44, scope: !526)
!532 = !DILocation(line: 478, column: 5, scope: !509)
!533 = !DILocation(line: 484, column: 17, scope: !534)
!534 = distinct !DILexicalBlock(scope: !526, file: !71, line: 483, column: 2)
!535 = !DILocation(line: 484, column: 29, scope: !534)
!536 = !DILocation(line: 484, column: 15, scope: !534)
!537 = !DILocation(line: 485, column: 2, scope: !534)
!538 = !DILocation(line: 491, column: 6, scope: !539)
!539 = distinct !DILexicalBlock(scope: !509, file: !71, line: 491, column: 6)
!540 = !DILocation(line: 491, column: 18, scope: !539)
!541 = !DILocation(line: 491, column: 6, scope: !509)
!542 = !DILocation(line: 493, column: 6, scope: !543)
!543 = distinct !DILexicalBlock(scope: !544, file: !71, line: 493, column: 6)
!544 = distinct !DILexicalBlock(scope: !539, file: !71, line: 492, column: 2)
!545 = !DILocation(line: 493, column: 18, scope: !543)
!546 = !DILocation(line: 493, column: 6, scope: !544)
!547 = !DILocation(line: 495, column: 16, scope: !548)
!548 = distinct !DILexicalBlock(scope: !543, file: !71, line: 494, column: 3)
!549 = !DILocation(line: 495, column: 11, scope: !548)
!550 = !DILocation(line: 495, column: 4, scope: !548)
!551 = !DILocation(line: 499, column: 4, scope: !552)
!552 = distinct !DILexicalBlock(scope: !543, file: !71, line: 498, column: 3)
!553 = !DILocation(line: 504, column: 3, scope: !554)
!554 = distinct !DILexicalBlock(scope: !539, file: !71, line: 503, column: 2)
!555 = !DILocation(line: 506, column: 1, scope: !509)
!556 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !71, file: !71, line: 521, type: !389, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!557 = !DILocalVariable(name: "value", arg: 1, scope: !556, file: !71, line: 521, type: !13)
!558 = !DILocation(line: 521, column: 25, scope: !556)
!559 = !DILocalVariable(name: "factor", arg: 2, scope: !556, file: !71, line: 521, type: !22)
!560 = !DILocation(line: 521, column: 36, scope: !556)
!561 = !DILocalVariable(name: "s32MulTemp", scope: !556, file: !71, line: 523, type: !79)
!562 = !DILocation(line: 523, column: 6, scope: !556)
!563 = !DILocation(line: 524, column: 15, scope: !556)
!564 = !DILocation(line: 524, column: 23, scope: !556)
!565 = !DILocation(line: 524, column: 21, scope: !556)
!566 = !DILocation(line: 524, column: 13, scope: !556)
!567 = !DILocation(line: 525, column: 5, scope: !568)
!568 = distinct !DILexicalBlock(scope: !556, file: !71, line: 525, column: 5)
!569 = !DILocation(line: 525, column: 16, scope: !568)
!570 = !DILocation(line: 525, column: 5, scope: !556)
!571 = !DILocation(line: 527, column: 6, scope: !572)
!572 = distinct !DILexicalBlock(scope: !573, file: !71, line: 527, column: 6)
!573 = distinct !DILexicalBlock(scope: !568, file: !71, line: 526, column: 2)
!574 = !DILocation(line: 527, column: 17, scope: !572)
!575 = !DILocation(line: 527, column: 6, scope: !573)
!576 = !DILocation(line: 529, column: 16, scope: !577)
!577 = distinct !DILexicalBlock(scope: !572, file: !71, line: 528, column: 3)
!578 = !DILocation(line: 529, column: 11, scope: !577)
!579 = !DILocation(line: 529, column: 4, scope: !577)
!580 = !DILocation(line: 533, column: 4, scope: !581)
!581 = distinct !DILexicalBlock(scope: !572, file: !71, line: 532, column: 3)
!582 = !DILocation(line: 538, column: 3, scope: !583)
!583 = distinct !DILexicalBlock(scope: !568, file: !71, line: 537, column: 2)
!584 = !DILocation(line: 540, column: 1, scope: !556)
!585 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !71, file: !71, line: 556, type: !586, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!586 = !DISubroutineType(types: !587)
!587 = !{!13, !13, !22, !79}
!588 = !DILocalVariable(name: "value", arg: 1, scope: !585, file: !71, line: 556, type: !13)
!589 = !DILocation(line: 556, column: 40, scope: !585)
!590 = !DILocalVariable(name: "factor", arg: 2, scope: !585, file: !71, line: 556, type: !22)
!591 = !DILocation(line: 556, column: 50, scope: !585)
!592 = !DILocalVariable(name: "count", arg: 3, scope: !585, file: !71, line: 556, type: !79)
!593 = !DILocation(line: 556, column: 61, scope: !585)
!594 = !DILocalVariable(name: "s32MulTemp", scope: !585, file: !71, line: 558, type: !79)
!595 = !DILocation(line: 558, column: 6, scope: !585)
!596 = !DILocation(line: 559, column: 15, scope: !585)
!597 = !DILocation(line: 559, column: 23, scope: !585)
!598 = !DILocation(line: 559, column: 21, scope: !585)
!599 = !DILocation(line: 559, column: 13, scope: !585)
!600 = !DILocation(line: 560, column: 15, scope: !585)
!601 = !DILocation(line: 560, column: 26, scope: !585)
!602 = !DILocation(line: 560, column: 25, scope: !585)
!603 = !DILocation(line: 560, column: 13, scope: !585)
!604 = !DILocation(line: 561, column: 14, scope: !585)
!605 = !DILocation(line: 561, column: 9, scope: !585)
!606 = !DILocation(line: 561, column: 2, scope: !585)
!607 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !71, file: !71, line: 580, type: !608, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!608 = !DISubroutineType(types: !609)
!609 = !{!13, !13, !22, !22}
!610 = !DILocalVariable(name: "value", arg: 1, scope: !607, file: !71, line: 580, type: !13)
!611 = !DILocation(line: 580, column: 43, scope: !607)
!612 = !DILocalVariable(name: "factor", arg: 2, scope: !607, file: !71, line: 580, type: !22)
!613 = !DILocation(line: 580, column: 53, scope: !607)
!614 = !DILocalVariable(name: "count", arg: 3, scope: !607, file: !71, line: 580, type: !22)
!615 = !DILocation(line: 580, column: 64, scope: !607)
!616 = !DILocalVariable(name: "s32MulTemp", scope: !607, file: !71, line: 582, type: !79)
!617 = !DILocation(line: 582, column: 6, scope: !607)
!618 = !DILocation(line: 583, column: 15, scope: !607)
!619 = !DILocation(line: 583, column: 23, scope: !607)
!620 = !DILocation(line: 583, column: 21, scope: !607)
!621 = !DILocation(line: 583, column: 13, scope: !607)
!622 = !DILocation(line: 584, column: 15, scope: !607)
!623 = !DILocation(line: 584, column: 26, scope: !607)
!624 = !DILocation(line: 584, column: 25, scope: !607)
!625 = !DILocation(line: 584, column: 13, scope: !607)
!626 = !DILocation(line: 585, column: 5, scope: !627)
!627 = distinct !DILexicalBlock(scope: !607, file: !71, line: 585, column: 5)
!628 = !DILocation(line: 585, column: 16, scope: !627)
!629 = !DILocation(line: 585, column: 5, scope: !607)
!630 = !DILocation(line: 587, column: 6, scope: !631)
!631 = distinct !DILexicalBlock(scope: !632, file: !71, line: 587, column: 6)
!632 = distinct !DILexicalBlock(scope: !627, file: !71, line: 586, column: 2)
!633 = !DILocation(line: 587, column: 17, scope: !631)
!634 = !DILocation(line: 587, column: 6, scope: !632)
!635 = !DILocation(line: 589, column: 16, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !71, line: 588, column: 3)
!637 = !DILocation(line: 589, column: 11, scope: !636)
!638 = !DILocation(line: 589, column: 4, scope: !636)
!639 = !DILocation(line: 593, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !631, file: !71, line: 592, column: 3)
!641 = !DILocation(line: 598, column: 3, scope: !642)
!642 = distinct !DILexicalBlock(scope: !627, file: !71, line: 597, column: 2)
!643 = !DILocation(line: 600, column: 1, scope: !607)
!644 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !71, file: !71, line: 617, type: !389, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!645 = !DILocalVariable(name: "value", arg: 1, scope: !644, file: !71, line: 617, type: !13)
!646 = !DILocation(line: 617, column: 31, scope: !644)
!647 = !DILocalVariable(name: "factor", arg: 2, scope: !644, file: !71, line: 617, type: !22)
!648 = !DILocation(line: 617, column: 42, scope: !644)
!649 = !DILocalVariable(name: "s32MulTemp1", scope: !644, file: !71, line: 619, type: !79)
!650 = !DILocation(line: 619, column: 6, scope: !644)
!651 = !DILocalVariable(name: "s32MulTemp2", scope: !644, file: !71, line: 619, type: !79)
!652 = !DILocation(line: 619, column: 24, scope: !644)
!653 = !DILocation(line: 620, column: 16, scope: !644)
!654 = !DILocation(line: 620, column: 24, scope: !644)
!655 = !DILocation(line: 620, column: 22, scope: !644)
!656 = !DILocation(line: 620, column: 14, scope: !644)
!657 = !DILocation(line: 621, column: 16, scope: !644)
!658 = !DILocation(line: 621, column: 28, scope: !644)
!659 = !DILocation(line: 621, column: 14, scope: !644)
!660 = !DILocation(line: 622, column: 6, scope: !661)
!661 = distinct !DILexicalBlock(scope: !644, file: !71, line: 622, column: 5)
!662 = !DILocation(line: 622, column: 17, scope: !661)
!663 = !DILocation(line: 622, column: 21, scope: !661)
!664 = !DILocation(line: 622, column: 25, scope: !661)
!665 = !DILocation(line: 622, column: 37, scope: !661)
!666 = !DILocation(line: 622, column: 46, scope: !661)
!667 = !DILocation(line: 622, column: 5, scope: !644)
!668 = !DILocation(line: 629, column: 17, scope: !669)
!669 = distinct !DILexicalBlock(scope: !661, file: !71, line: 628, column: 2)
!670 = !DILocation(line: 629, column: 29, scope: !669)
!671 = !DILocation(line: 629, column: 15, scope: !669)
!672 = !DILocation(line: 630, column: 15, scope: !669)
!673 = !DILocation(line: 630, column: 10, scope: !669)
!674 = !DILocation(line: 630, column: 3, scope: !669)
!675 = !DILocation(line: 634, column: 15, scope: !676)
!676 = distinct !DILexicalBlock(scope: !661, file: !71, line: 633, column: 2)
!677 = !DILocation(line: 634, column: 10, scope: !676)
!678 = !DILocation(line: 634, column: 3, scope: !676)
!679 = !DILocation(line: 636, column: 1, scope: !644)
!680 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !71, file: !71, line: 654, type: !389, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!681 = !DILocalVariable(name: "value", arg: 1, scope: !680, file: !71, line: 654, type: !13)
!682 = !DILocation(line: 654, column: 31, scope: !680)
!683 = !DILocalVariable(name: "factor", arg: 2, scope: !680, file: !71, line: 654, type: !22)
!684 = !DILocation(line: 654, column: 42, scope: !680)
!685 = !DILocalVariable(name: "s32MulTemp1", scope: !680, file: !71, line: 656, type: !79)
!686 = !DILocation(line: 656, column: 6, scope: !680)
!687 = !DILocalVariable(name: "s32MulTemp2", scope: !680, file: !71, line: 656, type: !79)
!688 = !DILocation(line: 656, column: 24, scope: !680)
!689 = !DILocation(line: 657, column: 16, scope: !680)
!690 = !DILocation(line: 657, column: 24, scope: !680)
!691 = !DILocation(line: 657, column: 22, scope: !680)
!692 = !DILocation(line: 657, column: 14, scope: !680)
!693 = !DILocation(line: 658, column: 16, scope: !680)
!694 = !DILocation(line: 658, column: 28, scope: !680)
!695 = !DILocation(line: 658, column: 14, scope: !680)
!696 = !DILocation(line: 659, column: 6, scope: !697)
!697 = distinct !DILexicalBlock(scope: !680, file: !71, line: 659, column: 5)
!698 = !DILocation(line: 659, column: 17, scope: !697)
!699 = !DILocation(line: 659, column: 21, scope: !697)
!700 = !DILocation(line: 659, column: 25, scope: !697)
!701 = !DILocation(line: 659, column: 37, scope: !697)
!702 = !DILocation(line: 659, column: 46, scope: !697)
!703 = !DILocation(line: 659, column: 5, scope: !680)
!704 = !DILocation(line: 665, column: 17, scope: !705)
!705 = distinct !DILexicalBlock(scope: !697, file: !71, line: 664, column: 2)
!706 = !DILocation(line: 665, column: 29, scope: !705)
!707 = !DILocation(line: 665, column: 15, scope: !705)
!708 = !DILocation(line: 666, column: 2, scope: !705)
!709 = !DILocation(line: 672, column: 6, scope: !710)
!710 = distinct !DILexicalBlock(scope: !680, file: !71, line: 672, column: 6)
!711 = !DILocation(line: 672, column: 18, scope: !710)
!712 = !DILocation(line: 672, column: 6, scope: !680)
!713 = !DILocation(line: 674, column: 6, scope: !714)
!714 = distinct !DILexicalBlock(scope: !715, file: !71, line: 674, column: 6)
!715 = distinct !DILexicalBlock(scope: !710, file: !71, line: 673, column: 2)
!716 = !DILocation(line: 674, column: 18, scope: !714)
!717 = !DILocation(line: 674, column: 6, scope: !715)
!718 = !DILocation(line: 676, column: 16, scope: !719)
!719 = distinct !DILexicalBlock(scope: !714, file: !71, line: 675, column: 3)
!720 = !DILocation(line: 676, column: 11, scope: !719)
!721 = !DILocation(line: 676, column: 4, scope: !719)
!722 = !DILocation(line: 680, column: 4, scope: !723)
!723 = distinct !DILexicalBlock(scope: !714, file: !71, line: 679, column: 3)
!724 = !DILocation(line: 685, column: 3, scope: !725)
!725 = distinct !DILexicalBlock(scope: !710, file: !71, line: 684, column: 2)
!726 = !DILocation(line: 687, column: 1, scope: !680)
!727 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !71, file: !71, line: 704, type: !728, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!728 = !DISubroutineType(types: !729)
!729 = !{!13, !22, !22}
!730 = !DILocalVariable(name: "value", arg: 1, scope: !727, file: !71, line: 704, type: !22)
!731 = !DILocation(line: 704, column: 33, scope: !727)
!732 = !DILocalVariable(name: "factor", arg: 2, scope: !727, file: !71, line: 704, type: !22)
!733 = !DILocation(line: 704, column: 44, scope: !727)
!734 = !DILocalVariable(name: "u32MulTemp", scope: !727, file: !71, line: 706, type: !735)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !736)
!736 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !738)
!738 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!739 = !DILocation(line: 706, column: 6, scope: !727)
!740 = !DILocation(line: 707, column: 15, scope: !727)
!741 = !DILocation(line: 707, column: 23, scope: !727)
!742 = !DILocation(line: 707, column: 21, scope: !727)
!743 = !DILocation(line: 707, column: 13, scope: !727)
!744 = !DILocation(line: 708, column: 15, scope: !727)
!745 = !DILocation(line: 708, column: 26, scope: !727)
!746 = !DILocation(line: 708, column: 13, scope: !727)
!747 = !DILocation(line: 709, column: 5, scope: !748)
!748 = distinct !DILexicalBlock(scope: !727, file: !71, line: 709, column: 5)
!749 = !DILocation(line: 709, column: 16, scope: !748)
!750 = !DILocation(line: 709, column: 5, scope: !727)
!751 = !DILocation(line: 711, column: 15, scope: !752)
!752 = distinct !DILexicalBlock(scope: !748, file: !71, line: 710, column: 2)
!753 = !DILocation(line: 711, column: 10, scope: !752)
!754 = !DILocation(line: 711, column: 3, scope: !752)
!755 = !DILocation(line: 715, column: 3, scope: !756)
!756 = distinct !DILexicalBlock(scope: !748, file: !71, line: 714, column: 2)
!757 = !DILocation(line: 717, column: 1, scope: !727)
!758 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !71, file: !71, line: 732, type: !759, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!759 = !DISubroutineType(types: !760)
!760 = !{!79, !13, !22}
!761 = !DILocalVariable(name: "value", arg: 1, scope: !758, file: !71, line: 732, type: !13)
!762 = !DILocation(line: 732, column: 25, scope: !758)
!763 = !DILocalVariable(name: "factor", arg: 2, scope: !758, file: !71, line: 732, type: !22)
!764 = !DILocation(line: 732, column: 36, scope: !758)
!765 = !DILocalVariable(name: "s32MulTemp", scope: !758, file: !71, line: 734, type: !79)
!766 = !DILocation(line: 734, column: 6, scope: !758)
!767 = !DILocation(line: 735, column: 15, scope: !758)
!768 = !DILocation(line: 735, column: 23, scope: !758)
!769 = !DILocation(line: 735, column: 21, scope: !758)
!770 = !DILocation(line: 735, column: 13, scope: !758)
!771 = !DILocation(line: 736, column: 9, scope: !758)
!772 = !DILocation(line: 736, column: 2, scope: !758)
!773 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !71, file: !71, line: 752, type: !774, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!774 = !DISubroutineType(types: !775)
!775 = !{!79, !79, !22}
!776 = !DILocalVariable(name: "value", arg: 1, scope: !773, file: !71, line: 752, type: !79)
!777 = !DILocation(line: 752, column: 25, scope: !773)
!778 = !DILocalVariable(name: "factor", arg: 2, scope: !773, file: !71, line: 752, type: !22)
!779 = !DILocation(line: 752, column: 36, scope: !773)
!780 = !DILocalVariable(name: "s32Temp1", scope: !773, file: !71, line: 754, type: !79)
!781 = !DILocation(line: 754, column: 6, scope: !773)
!782 = !DILocalVariable(name: "s32Temp2", scope: !773, file: !71, line: 754, type: !79)
!783 = !DILocation(line: 754, column: 20, scope: !773)
!784 = !DILocalVariable(name: "s32Factor", scope: !773, file: !71, line: 754, type: !79)
!785 = !DILocation(line: 754, column: 44, scope: !773)
!786 = !DILocation(line: 755, column: 14, scope: !773)
!787 = !DILocation(line: 755, column: 12, scope: !773)
!788 = !DILocation(line: 756, column: 5, scope: !789)
!789 = distinct !DILexicalBlock(scope: !773, file: !71, line: 756, column: 5)
!790 = !DILocation(line: 756, column: 12, scope: !789)
!791 = !DILocation(line: 756, column: 5, scope: !773)
!792 = !DILocation(line: 758, column: 6, scope: !793)
!793 = distinct !DILexicalBlock(scope: !794, file: !71, line: 758, column: 6)
!794 = distinct !DILexicalBlock(scope: !789, file: !71, line: 757, column: 2)
!795 = !DILocation(line: 758, column: 12, scope: !793)
!796 = !DILocation(line: 758, column: 6, scope: !794)
!797 = !DILocation(line: 760, column: 15, scope: !798)
!798 = distinct !DILexicalBlock(scope: !793, file: !71, line: 759, column: 3)
!799 = !DILocation(line: 760, column: 26, scope: !798)
!800 = !DILocation(line: 760, column: 24, scope: !798)
!801 = !DILocation(line: 760, column: 13, scope: !798)
!802 = !DILocation(line: 761, column: 7, scope: !803)
!803 = distinct !DILexicalBlock(scope: !798, file: !71, line: 761, column: 7)
!804 = !DILocation(line: 761, column: 19, scope: !803)
!805 = !DILocation(line: 761, column: 16, scope: !803)
!806 = !DILocation(line: 761, column: 7, scope: !798)
!807 = !DILocation(line: 763, column: 5, scope: !808)
!808 = distinct !DILexicalBlock(scope: !803, file: !71, line: 762, column: 4)
!809 = !DILocation(line: 767, column: 13, scope: !810)
!810 = distinct !DILexicalBlock(scope: !803, file: !71, line: 766, column: 4)
!811 = !DILocation(line: 767, column: 19, scope: !810)
!812 = !DILocation(line: 767, column: 18, scope: !810)
!813 = !DILocation(line: 767, column: 5, scope: !810)
!814 = !DILocation(line: 772, column: 20, scope: !815)
!815 = distinct !DILexicalBlock(scope: !816, file: !71, line: 772, column: 7)
!816 = distinct !DILexicalBlock(scope: !793, file: !71, line: 771, column: 3)
!817 = !DILocation(line: 772, column: 19, scope: !815)
!818 = !DILocation(line: 772, column: 31, scope: !815)
!819 = !DILocation(line: 772, column: 28, scope: !815)
!820 = !DILocation(line: 772, column: 7, scope: !816)
!821 = !DILocation(line: 774, column: 5, scope: !822)
!822 = distinct !DILexicalBlock(scope: !815, file: !71, line: 773, column: 4)
!823 = !DILocation(line: 778, column: 13, scope: !824)
!824 = distinct !DILexicalBlock(scope: !815, file: !71, line: 777, column: 4)
!825 = !DILocation(line: 778, column: 19, scope: !824)
!826 = !DILocation(line: 778, column: 18, scope: !824)
!827 = !DILocation(line: 778, column: 5, scope: !824)
!828 = !DILocation(line: 784, column: 3, scope: !829)
!829 = distinct !DILexicalBlock(scope: !789, file: !71, line: 783, column: 2)
!830 = !DILocation(line: 786, column: 1, scope: !773)
!831 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !71, file: !71, line: 802, type: !832, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!832 = !DISubroutineType(types: !833)
!833 = !{!17, !17, !17, !22}
!834 = !DILocalVariable(name: "value", arg: 1, scope: !831, file: !71, line: 802, type: !17)
!835 = !DILocation(line: 802, column: 35, scope: !831)
!836 = !DILocalVariable(name: "factor", arg: 2, scope: !831, file: !71, line: 802, type: !17)
!837 = !DILocation(line: 802, column: 44, scope: !831)
!838 = !DILocalVariable(name: "count", arg: 3, scope: !831, file: !71, line: 802, type: !22)
!839 = !DILocation(line: 802, column: 55, scope: !831)
!840 = !DILocalVariable(name: "u16MulTemp", scope: !831, file: !71, line: 804, type: !22)
!841 = !DILocation(line: 804, column: 6, scope: !831)
!842 = !DILocation(line: 805, column: 15, scope: !831)
!843 = !DILocation(line: 805, column: 23, scope: !831)
!844 = !DILocation(line: 805, column: 21, scope: !831)
!845 = !DILocation(line: 805, column: 13, scope: !831)
!846 = !DILocation(line: 806, column: 15, scope: !831)
!847 = !DILocation(line: 806, column: 26, scope: !831)
!848 = !DILocation(line: 806, column: 25, scope: !831)
!849 = !DILocation(line: 806, column: 13, scope: !831)
!850 = !DILocation(line: 807, column: 13, scope: !831)
!851 = !DILocation(line: 807, column: 9, scope: !831)
!852 = !DILocation(line: 807, column: 2, scope: !831)
!853 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !71, file: !71, line: 824, type: !854, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!854 = !DISubroutineType(types: !855)
!855 = !{!17, !17, !17, !17}
!856 = !DILocalVariable(name: "value", arg: 1, scope: !853, file: !71, line: 824, type: !17)
!857 = !DILocation(line: 824, column: 38, scope: !853)
!858 = !DILocalVariable(name: "factor", arg: 2, scope: !853, file: !71, line: 824, type: !17)
!859 = !DILocation(line: 824, column: 47, scope: !853)
!860 = !DILocalVariable(name: "count", arg: 3, scope: !853, file: !71, line: 824, type: !17)
!861 = !DILocation(line: 824, column: 57, scope: !853)
!862 = !DILocalVariable(name: "u16MulTemp", scope: !853, file: !71, line: 826, type: !22)
!863 = !DILocation(line: 826, column: 6, scope: !853)
!864 = !DILocation(line: 827, column: 15, scope: !853)
!865 = !DILocation(line: 827, column: 23, scope: !853)
!866 = !DILocation(line: 827, column: 21, scope: !853)
!867 = !DILocation(line: 827, column: 13, scope: !853)
!868 = !DILocation(line: 828, column: 15, scope: !853)
!869 = !DILocation(line: 828, column: 26, scope: !853)
!870 = !DILocation(line: 828, column: 25, scope: !853)
!871 = !DILocation(line: 828, column: 13, scope: !853)
!872 = !DILocation(line: 829, column: 5, scope: !873)
!873 = distinct !DILexicalBlock(scope: !853, file: !71, line: 829, column: 5)
!874 = !DILocation(line: 829, column: 16, scope: !873)
!875 = !DILocation(line: 829, column: 5, scope: !853)
!876 = !DILocation(line: 831, column: 10, scope: !877)
!877 = distinct !DILexicalBlock(scope: !873, file: !71, line: 830, column: 2)
!878 = !DILocation(line: 831, column: 21, scope: !877)
!879 = !DILocation(line: 831, column: 3, scope: !877)
!880 = !DILocation(line: 835, column: 3, scope: !881)
!881 = distinct !DILexicalBlock(scope: !873, file: !71, line: 834, column: 2)
!882 = !DILocation(line: 837, column: 1, scope: !853)
!883 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !71, file: !71, line: 854, type: !884, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!884 = !DISubroutineType(types: !885)
!885 = !{!17, !17, !17}
!886 = !DILocalVariable(name: "x_value", arg: 1, scope: !883, file: !71, line: 854, type: !17)
!887 = !DILocation(line: 854, column: 25, scope: !883)
!888 = !DILocalVariable(name: "y_value", arg: 2, scope: !883, file: !71, line: 854, type: !17)
!889 = !DILocation(line: 854, column: 36, scope: !883)
!890 = !DILocalVariable(name: "u16MulTemp", scope: !883, file: !71, line: 856, type: !22)
!891 = !DILocation(line: 856, column: 6, scope: !883)
!892 = !DILocation(line: 857, column: 15, scope: !883)
!893 = !DILocation(line: 857, column: 25, scope: !883)
!894 = !DILocation(line: 857, column: 23, scope: !883)
!895 = !DILocation(line: 857, column: 13, scope: !883)
!896 = !DILocation(line: 858, column: 15, scope: !883)
!897 = !DILocation(line: 858, column: 26, scope: !883)
!898 = !DILocation(line: 858, column: 13, scope: !883)
!899 = !DILocation(line: 859, column: 13, scope: !883)
!900 = !DILocation(line: 859, column: 9, scope: !883)
!901 = !DILocation(line: 859, column: 2, scope: !883)
!902 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !71, file: !71, line: 878, type: !884, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!903 = !DILocalVariable(name: "value", arg: 1, scope: !902, file: !71, line: 878, type: !17)
!904 = !DILocation(line: 878, column: 26, scope: !902)
!905 = !DILocalVariable(name: "factor", arg: 2, scope: !902, file: !71, line: 878, type: !17)
!906 = !DILocation(line: 878, column: 36, scope: !902)
!907 = !DILocalVariable(name: "u16MulTemp", scope: !902, file: !71, line: 880, type: !22)
!908 = !DILocation(line: 880, column: 6, scope: !902)
!909 = !DILocation(line: 881, column: 15, scope: !902)
!910 = !DILocation(line: 881, column: 23, scope: !902)
!911 = !DILocation(line: 881, column: 21, scope: !902)
!912 = !DILocation(line: 881, column: 13, scope: !902)
!913 = !DILocation(line: 882, column: 15, scope: !902)
!914 = !DILocation(line: 882, column: 26, scope: !902)
!915 = !DILocation(line: 882, column: 13, scope: !902)
!916 = !DILocation(line: 883, column: 5, scope: !917)
!917 = distinct !DILexicalBlock(scope: !902, file: !71, line: 883, column: 5)
!918 = !DILocation(line: 883, column: 16, scope: !917)
!919 = !DILocation(line: 883, column: 5, scope: !902)
!920 = !DILocation(line: 885, column: 14, scope: !921)
!921 = distinct !DILexicalBlock(scope: !917, file: !71, line: 884, column: 2)
!922 = !DILocation(line: 885, column: 10, scope: !921)
!923 = !DILocation(line: 885, column: 3, scope: !921)
!924 = !DILocation(line: 889, column: 3, scope: !925)
!925 = distinct !DILexicalBlock(scope: !917, file: !71, line: 888, column: 2)
!926 = !DILocation(line: 891, column: 1, scope: !902)
!927 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !71, file: !71, line: 907, type: !928, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!928 = !DISubroutineType(types: !929)
!929 = !{!22, !22, !22}
!930 = !DILocalVariable(name: "value", arg: 1, scope: !927, file: !71, line: 907, type: !22)
!931 = !DILocation(line: 907, column: 39, scope: !927)
!932 = !DILocalVariable(name: "factor", arg: 2, scope: !927, file: !71, line: 907, type: !22)
!933 = !DILocation(line: 907, column: 49, scope: !927)
!934 = !DILocalVariable(name: "u32MulTemp", scope: !927, file: !71, line: 909, type: !735)
!935 = !DILocation(line: 909, column: 6, scope: !927)
!936 = !DILocation(line: 910, column: 15, scope: !927)
!937 = !DILocation(line: 910, column: 23, scope: !927)
!938 = !DILocation(line: 910, column: 21, scope: !927)
!939 = !DILocation(line: 910, column: 13, scope: !927)
!940 = !DILocation(line: 911, column: 15, scope: !927)
!941 = !DILocation(line: 911, column: 26, scope: !927)
!942 = !DILocation(line: 911, column: 13, scope: !927)
!943 = !DILocation(line: 912, column: 14, scope: !927)
!944 = !DILocation(line: 912, column: 9, scope: !927)
!945 = !DILocation(line: 912, column: 2, scope: !927)
!946 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !71, file: !71, line: 931, type: !928, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!947 = !DILocalVariable(name: "value", arg: 1, scope: !946, file: !71, line: 931, type: !22)
!948 = !DILocation(line: 931, column: 43, scope: !946)
!949 = !DILocalVariable(name: "factor", arg: 2, scope: !946, file: !71, line: 931, type: !22)
!950 = !DILocation(line: 931, column: 53, scope: !946)
!951 = !DILocalVariable(name: "u32MulTemp", scope: !946, file: !71, line: 933, type: !735)
!952 = !DILocation(line: 933, column: 6, scope: !946)
!953 = !DILocation(line: 934, column: 15, scope: !946)
!954 = !DILocation(line: 934, column: 23, scope: !946)
!955 = !DILocation(line: 934, column: 21, scope: !946)
!956 = !DILocation(line: 934, column: 13, scope: !946)
!957 = !DILocation(line: 935, column: 15, scope: !946)
!958 = !DILocation(line: 935, column: 26, scope: !946)
!959 = !DILocation(line: 935, column: 13, scope: !946)
!960 = !DILocation(line: 936, column: 5, scope: !961)
!961 = distinct !DILexicalBlock(scope: !946, file: !71, line: 936, column: 5)
!962 = !DILocation(line: 936, column: 16, scope: !961)
!963 = !DILocation(line: 936, column: 5, scope: !946)
!964 = !DILocation(line: 938, column: 11, scope: !965)
!965 = distinct !DILexicalBlock(scope: !961, file: !71, line: 937, column: 2)
!966 = !DILocation(line: 938, column: 22, scope: !965)
!967 = !DILocation(line: 938, column: 10, scope: !965)
!968 = !DILocation(line: 938, column: 3, scope: !965)
!969 = !DILocation(line: 942, column: 3, scope: !970)
!970 = distinct !DILexicalBlock(scope: !961, file: !71, line: 941, column: 2)
!971 = !DILocation(line: 944, column: 1, scope: !946)
!972 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !71, file: !71, line: 962, type: !973, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!973 = !DISubroutineType(types: !974)
!974 = !{!22, !22, !17}
!975 = !DILocalVariable(name: "x_value", arg: 1, scope: !972, file: !71, line: 962, type: !22)
!976 = !DILocation(line: 962, column: 29, scope: !972)
!977 = !DILocalVariable(name: "y_value", arg: 2, scope: !972, file: !71, line: 962, type: !17)
!978 = !DILocation(line: 962, column: 41, scope: !972)
!979 = !DILocalVariable(name: "u32MulTemp", scope: !972, file: !71, line: 964, type: !735)
!980 = !DILocation(line: 964, column: 6, scope: !972)
!981 = !DILocation(line: 965, column: 15, scope: !972)
!982 = !DILocation(line: 965, column: 25, scope: !972)
!983 = !DILocation(line: 965, column: 23, scope: !972)
!984 = !DILocation(line: 965, column: 13, scope: !972)
!985 = !DILocation(line: 966, column: 16, scope: !972)
!986 = !DILocation(line: 966, column: 27, scope: !972)
!987 = !DILocation(line: 966, column: 33, scope: !972)
!988 = !DILocation(line: 966, column: 13, scope: !972)
!989 = !DILocation(line: 967, column: 9, scope: !972)
!990 = !DILocation(line: 967, column: 2, scope: !972)
!991 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !71, file: !71, line: 986, type: !973, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!992 = !DILocalVariable(name: "x_value", arg: 1, scope: !991, file: !71, line: 986, type: !22)
!993 = !DILocation(line: 986, column: 29, scope: !991)
!994 = !DILocalVariable(name: "y_value", arg: 2, scope: !991, file: !71, line: 986, type: !17)
!995 = !DILocation(line: 986, column: 41, scope: !991)
!996 = !DILocalVariable(name: "u32MulTemp", scope: !991, file: !71, line: 988, type: !735)
!997 = !DILocation(line: 988, column: 6, scope: !991)
!998 = !DILocation(line: 989, column: 15, scope: !991)
!999 = !DILocation(line: 989, column: 25, scope: !991)
!1000 = !DILocation(line: 989, column: 23, scope: !991)
!1001 = !DILocation(line: 989, column: 13, scope: !991)
!1002 = !DILocation(line: 990, column: 15, scope: !991)
!1003 = !DILocation(line: 990, column: 26, scope: !991)
!1004 = !DILocation(line: 990, column: 13, scope: !991)
!1005 = !DILocation(line: 991, column: 5, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !991, file: !71, line: 991, column: 5)
!1007 = !DILocation(line: 991, column: 16, scope: !1006)
!1008 = !DILocation(line: 991, column: 5, scope: !991)
!1009 = !DILocation(line: 993, column: 11, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !1006, file: !71, line: 992, column: 2)
!1011 = !DILocation(line: 993, column: 22, scope: !1010)
!1012 = !DILocation(line: 993, column: 10, scope: !1010)
!1013 = !DILocation(line: 993, column: 3, scope: !1010)
!1014 = !DILocation(line: 997, column: 3, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1006, file: !71, line: 996, column: 2)
!1016 = !DILocation(line: 999, column: 1, scope: !991)
!1017 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !71, file: !71, line: 1015, type: !1018, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{!22, !22, !22, !735}
!1020 = !DILocalVariable(name: "value", arg: 1, scope: !1017, file: !71, line: 1015, type: !22)
!1021 = !DILocation(line: 1015, column: 40, scope: !1017)
!1022 = !DILocalVariable(name: "factor", arg: 2, scope: !1017, file: !71, line: 1015, type: !22)
!1023 = !DILocation(line: 1015, column: 50, scope: !1017)
!1024 = !DILocalVariable(name: "count", arg: 3, scope: !1017, file: !71, line: 1015, type: !735)
!1025 = !DILocation(line: 1015, column: 61, scope: !1017)
!1026 = !DILocalVariable(name: "u32MulTemp", scope: !1017, file: !71, line: 1017, type: !735)
!1027 = !DILocation(line: 1017, column: 6, scope: !1017)
!1028 = !DILocation(line: 1018, column: 15, scope: !1017)
!1029 = !DILocation(line: 1018, column: 23, scope: !1017)
!1030 = !DILocation(line: 1018, column: 21, scope: !1017)
!1031 = !DILocation(line: 1018, column: 13, scope: !1017)
!1032 = !DILocation(line: 1019, column: 15, scope: !1017)
!1033 = !DILocation(line: 1019, column: 26, scope: !1017)
!1034 = !DILocation(line: 1019, column: 25, scope: !1017)
!1035 = !DILocation(line: 1019, column: 13, scope: !1017)
!1036 = !DILocation(line: 1020, column: 10, scope: !1017)
!1037 = !DILocation(line: 1020, column: 21, scope: !1017)
!1038 = !DILocation(line: 1020, column: 9, scope: !1017)
!1039 = !DILocation(line: 1020, column: 2, scope: !1017)
!1040 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !71, file: !71, line: 1038, type: !1041, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!22, !22, !22, !22}
!1043 = !DILocalVariable(name: "value", arg: 1, scope: !1040, file: !71, line: 1038, type: !22)
!1044 = !DILocation(line: 1038, column: 43, scope: !1040)
!1045 = !DILocalVariable(name: "factor", arg: 2, scope: !1040, file: !71, line: 1038, type: !22)
!1046 = !DILocation(line: 1038, column: 53, scope: !1040)
!1047 = !DILocalVariable(name: "count", arg: 3, scope: !1040, file: !71, line: 1038, type: !22)
!1048 = !DILocation(line: 1038, column: 64, scope: !1040)
!1049 = !DILocalVariable(name: "u32MulTemp", scope: !1040, file: !71, line: 1040, type: !735)
!1050 = !DILocation(line: 1040, column: 6, scope: !1040)
!1051 = !DILocation(line: 1041, column: 15, scope: !1040)
!1052 = !DILocation(line: 1041, column: 23, scope: !1040)
!1053 = !DILocation(line: 1041, column: 21, scope: !1040)
!1054 = !DILocation(line: 1041, column: 13, scope: !1040)
!1055 = !DILocation(line: 1042, column: 15, scope: !1040)
!1056 = !DILocation(line: 1042, column: 26, scope: !1040)
!1057 = !DILocation(line: 1042, column: 25, scope: !1040)
!1058 = !DILocation(line: 1042, column: 13, scope: !1040)
!1059 = !DILocation(line: 1043, column: 5, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1040, file: !71, line: 1043, column: 5)
!1061 = !DILocation(line: 1043, column: 16, scope: !1060)
!1062 = !DILocation(line: 1043, column: 5, scope: !1040)
!1063 = !DILocation(line: 1045, column: 11, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1060, file: !71, line: 1044, column: 2)
!1065 = !DILocation(line: 1045, column: 22, scope: !1064)
!1066 = !DILocation(line: 1045, column: 10, scope: !1064)
!1067 = !DILocation(line: 1045, column: 3, scope: !1064)
!1068 = !DILocation(line: 1049, column: 3, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1060, file: !71, line: 1048, column: 2)
!1070 = !DILocation(line: 1051, column: 1, scope: !1040)
!1071 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !71, file: !71, line: 1067, type: !928, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1072 = !DILocalVariable(name: "x_value", arg: 1, scope: !1071, file: !71, line: 1067, type: !22)
!1073 = !DILocation(line: 1067, column: 30, scope: !1071)
!1074 = !DILocalVariable(name: "y_value", arg: 2, scope: !1071, file: !71, line: 1067, type: !22)
!1075 = !DILocation(line: 1067, column: 42, scope: !1071)
!1076 = !DILocalVariable(name: "u32MulTemp", scope: !1071, file: !71, line: 1069, type: !735)
!1077 = !DILocation(line: 1069, column: 6, scope: !1071)
!1078 = !DILocation(line: 1070, column: 15, scope: !1071)
!1079 = !DILocation(line: 1070, column: 25, scope: !1071)
!1080 = !DILocation(line: 1070, column: 23, scope: !1071)
!1081 = !DILocation(line: 1070, column: 13, scope: !1071)
!1082 = !DILocation(line: 1071, column: 15, scope: !1071)
!1083 = !DILocation(line: 1071, column: 26, scope: !1071)
!1084 = !DILocation(line: 1071, column: 13, scope: !1071)
!1085 = !DILocation(line: 1072, column: 19, scope: !1071)
!1086 = !DILocation(line: 1072, column: 17, scope: !1071)
!1087 = !DILocation(line: 1072, column: 9, scope: !1071)
!1088 = !DILocation(line: 1072, column: 2, scope: !1071)
!1089 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !71, file: !71, line: 1091, type: !928, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1090 = !DILocalVariable(name: "x_value", arg: 1, scope: !1089, file: !71, line: 1091, type: !22)
!1091 = !DILocation(line: 1091, column: 30, scope: !1089)
!1092 = !DILocalVariable(name: "y_value", arg: 2, scope: !1089, file: !71, line: 1091, type: !22)
!1093 = !DILocation(line: 1091, column: 42, scope: !1089)
!1094 = !DILocalVariable(name: "u32MulTemp", scope: !1089, file: !71, line: 1093, type: !735)
!1095 = !DILocation(line: 1093, column: 6, scope: !1089)
!1096 = !DILocation(line: 1094, column: 15, scope: !1089)
!1097 = !DILocation(line: 1094, column: 25, scope: !1089)
!1098 = !DILocation(line: 1094, column: 23, scope: !1089)
!1099 = !DILocation(line: 1094, column: 13, scope: !1089)
!1100 = !DILocation(line: 1095, column: 15, scope: !1089)
!1101 = !DILocation(line: 1095, column: 26, scope: !1089)
!1102 = !DILocation(line: 1095, column: 13, scope: !1089)
!1103 = !DILocation(line: 1096, column: 5, scope: !1104)
!1104 = distinct !DILexicalBlock(scope: !1089, file: !71, line: 1096, column: 5)
!1105 = !DILocation(line: 1096, column: 16, scope: !1104)
!1106 = !DILocation(line: 1096, column: 5, scope: !1089)
!1107 = !DILocation(line: 1098, column: 11, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1104, file: !71, line: 1097, column: 2)
!1109 = !DILocation(line: 1098, column: 22, scope: !1108)
!1110 = !DILocation(line: 1098, column: 10, scope: !1108)
!1111 = !DILocation(line: 1098, column: 3, scope: !1108)
!1112 = !DILocation(line: 1102, column: 3, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1104, file: !71, line: 1101, column: 2)
!1114 = !DILocation(line: 1104, column: 1, scope: !1089)
!1115 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !71, file: !71, line: 1119, type: !1116, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1116 = !DISubroutineType(types: !1117)
!1117 = !{!735, !735, !22}
!1118 = !DILocalVariable(name: "x_value", arg: 1, scope: !1115, file: !71, line: 1119, type: !735)
!1119 = !DILocation(line: 1119, column: 26, scope: !1115)
!1120 = !DILocalVariable(name: "y_value", arg: 2, scope: !1115, file: !71, line: 1119, type: !22)
!1121 = !DILocation(line: 1119, column: 39, scope: !1115)
!1122 = !DILocalVariable(name: "u32Temp1", scope: !1115, file: !71, line: 1122, type: !735)
!1123 = !DILocation(line: 1122, column: 6, scope: !1115)
!1124 = !DILocation(line: 1123, column: 5, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1115, file: !71, line: 1123, column: 5)
!1126 = !DILocation(line: 1123, column: 13, scope: !1125)
!1127 = !DILocation(line: 1123, column: 5, scope: !1115)
!1128 = !DILocation(line: 1125, column: 26, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1125, file: !71, line: 1124, column: 2)
!1130 = !DILocation(line: 1125, column: 25, scope: !1129)
!1131 = !DILocation(line: 1125, column: 12, scope: !1129)
!1132 = !DILocation(line: 1126, column: 6, scope: !1133)
!1133 = distinct !DILexicalBlock(scope: !1129, file: !71, line: 1126, column: 6)
!1134 = !DILocation(line: 1126, column: 17, scope: !1133)
!1135 = !DILocation(line: 1126, column: 15, scope: !1133)
!1136 = !DILocation(line: 1126, column: 6, scope: !1129)
!1137 = !DILocation(line: 1128, column: 4, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1133, file: !71, line: 1127, column: 3)
!1139 = !DILocation(line: 1132, column: 12, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1133, file: !71, line: 1131, column: 3)
!1141 = !DILocation(line: 1132, column: 22, scope: !1140)
!1142 = !DILocation(line: 1132, column: 20, scope: !1140)
!1143 = !DILocation(line: 1132, column: 4, scope: !1140)
!1144 = !DILocation(line: 1137, column: 3, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1125, file: !71, line: 1136, column: 2)
!1146 = !DILocation(line: 1140, column: 2, scope: !1115)
!1147 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !71, file: !71, line: 1157, type: !1148, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!735, !735, !22, !735}
!1150 = !DILocalVariable(name: "value", arg: 1, scope: !1147, file: !71, line: 1157, type: !735)
!1151 = !DILocation(line: 1157, column: 40, scope: !1147)
!1152 = !DILocalVariable(name: "factor", arg: 2, scope: !1147, file: !71, line: 1157, type: !22)
!1153 = !DILocation(line: 1157, column: 50, scope: !1147)
!1154 = !DILocalVariable(name: "count", arg: 3, scope: !1147, file: !71, line: 1157, type: !735)
!1155 = !DILocation(line: 1157, column: 62, scope: !1147)
!1156 = !DILocalVariable(name: "u32Temp1", scope: !1147, file: !71, line: 1159, type: !735)
!1157 = !DILocation(line: 1159, column: 6, scope: !1147)
!1158 = !DILocalVariable(name: "u32Temp2", scope: !1147, file: !71, line: 1159, type: !735)
!1159 = !DILocation(line: 1159, column: 20, scope: !1147)
!1160 = !DILocation(line: 1160, column: 13, scope: !1147)
!1161 = !DILocation(line: 1160, column: 21, scope: !1147)
!1162 = !DILocation(line: 1160, column: 19, scope: !1147)
!1163 = !DILocation(line: 1160, column: 11, scope: !1147)
!1164 = !DILocation(line: 1161, column: 25, scope: !1147)
!1165 = !DILocation(line: 1161, column: 32, scope: !1147)
!1166 = !DILocation(line: 1161, column: 13, scope: !1147)
!1167 = !DILocation(line: 1161, column: 11, scope: !1147)
!1168 = !DILocation(line: 1162, column: 13, scope: !1147)
!1169 = !DILocation(line: 1162, column: 25, scope: !1147)
!1170 = !DILocation(line: 1162, column: 22, scope: !1147)
!1171 = !DILocation(line: 1162, column: 11, scope: !1147)
!1172 = !DILocation(line: 1163, column: 14, scope: !1147)
!1173 = !DILocation(line: 1163, column: 30, scope: !1147)
!1174 = !DILocation(line: 1163, column: 29, scope: !1147)
!1175 = !DILocation(line: 1163, column: 23, scope: !1147)
!1176 = !DILocation(line: 1163, column: 11, scope: !1147)
!1177 = !DILocation(line: 1164, column: 6, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1147, file: !71, line: 1164, column: 5)
!1179 = !DILocation(line: 1164, column: 16, scope: !1178)
!1180 = !DILocation(line: 1164, column: 14, scope: !1178)
!1181 = !DILocation(line: 1164, column: 23, scope: !1178)
!1182 = !DILocation(line: 1164, column: 5, scope: !1147)
!1183 = !DILocation(line: 1166, column: 10, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1178, file: !71, line: 1165, column: 2)
!1185 = !DILocation(line: 1166, column: 3, scope: !1184)
!1186 = !DILocation(line: 1170, column: 3, scope: !1187)
!1187 = distinct !DILexicalBlock(scope: !1178, file: !71, line: 1169, column: 2)
!1188 = !DILocation(line: 1172, column: 1, scope: !1147)
!1189 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !71, file: !71, line: 1188, type: !1190, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!17, !17, !17, !6}
!1192 = !DILocalVariable(name: "val1", arg: 1, scope: !1189, file: !71, line: 1188, type: !17)
!1193 = !DILocation(line: 1188, column: 25, scope: !1189)
!1194 = !DILocalVariable(name: "val2", arg: 2, scope: !1189, file: !71, line: 1188, type: !17)
!1195 = !DILocation(line: 1188, column: 34, scope: !1189)
!1196 = !DILocalVariable(name: "factor", arg: 3, scope: !1189, file: !71, line: 1188, type: !6)
!1197 = !DILocation(line: 1188, column: 43, scope: !1189)
!1198 = !DILocalVariable(name: "s16Temp1", scope: !1189, file: !71, line: 1190, type: !13)
!1199 = !DILocation(line: 1190, column: 6, scope: !1189)
!1200 = !DILocation(line: 1191, column: 15, scope: !1189)
!1201 = !DILocation(line: 1191, column: 22, scope: !1189)
!1202 = !DILocation(line: 1191, column: 20, scope: !1189)
!1203 = !DILocation(line: 1191, column: 28, scope: !1189)
!1204 = !DILocation(line: 1191, column: 27, scope: !1189)
!1205 = !DILocation(line: 1191, column: 35, scope: !1189)
!1206 = !DILocation(line: 1191, column: 39, scope: !1189)
!1207 = !DILocation(line: 1191, column: 38, scope: !1189)
!1208 = !DILocation(line: 1191, column: 13, scope: !1189)
!1209 = !DILocation(line: 1191, column: 11, scope: !1189)
!1210 = !DILocation(line: 1192, column: 5, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1189, file: !71, line: 1192, column: 5)
!1212 = !DILocation(line: 1192, column: 14, scope: !1211)
!1213 = !DILocation(line: 1192, column: 5, scope: !1189)
!1214 = !DILocation(line: 1194, column: 6, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1216, file: !71, line: 1194, column: 6)
!1216 = distinct !DILexicalBlock(scope: !1211, file: !71, line: 1193, column: 2)
!1217 = !DILocation(line: 1194, column: 15, scope: !1215)
!1218 = !DILocation(line: 1194, column: 6, scope: !1216)
!1219 = !DILocation(line: 1196, column: 15, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1215, file: !71, line: 1195, column: 3)
!1221 = !DILocation(line: 1196, column: 11, scope: !1220)
!1222 = !DILocation(line: 1196, column: 4, scope: !1220)
!1223 = !DILocation(line: 1200, column: 4, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1215, file: !71, line: 1199, column: 3)
!1225 = !DILocation(line: 1205, column: 3, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1211, file: !71, line: 1204, column: 2)
!1227 = !DILocation(line: 1208, column: 1, scope: !1189)
!1228 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !71, file: !71, line: 1224, type: !1229, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!22, !22, !22, !6}
!1231 = !DILocalVariable(name: "val1", arg: 1, scope: !1228, file: !71, line: 1224, type: !22)
!1232 = !DILocation(line: 1224, column: 30, scope: !1228)
!1233 = !DILocalVariable(name: "val2", arg: 2, scope: !1228, file: !71, line: 1224, type: !22)
!1234 = !DILocation(line: 1224, column: 40, scope: !1228)
!1235 = !DILocalVariable(name: "factor", arg: 3, scope: !1228, file: !71, line: 1224, type: !6)
!1236 = !DILocation(line: 1224, column: 49, scope: !1228)
!1237 = !DILocalVariable(name: "s32Temp1", scope: !1228, file: !71, line: 1226, type: !79)
!1238 = !DILocation(line: 1226, column: 6, scope: !1228)
!1239 = !DILocation(line: 1227, column: 15, scope: !1228)
!1240 = !DILocation(line: 1227, column: 22, scope: !1228)
!1241 = !DILocation(line: 1227, column: 20, scope: !1228)
!1242 = !DILocation(line: 1227, column: 28, scope: !1228)
!1243 = !DILocation(line: 1227, column: 27, scope: !1228)
!1244 = !DILocation(line: 1227, column: 35, scope: !1228)
!1245 = !DILocation(line: 1227, column: 39, scope: !1228)
!1246 = !DILocation(line: 1227, column: 38, scope: !1228)
!1247 = !DILocation(line: 1227, column: 11, scope: !1228)
!1248 = !DILocation(line: 1228, column: 5, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1228, file: !71, line: 1228, column: 5)
!1250 = !DILocation(line: 1228, column: 14, scope: !1249)
!1251 = !DILocation(line: 1228, column: 5, scope: !1228)
!1252 = !DILocation(line: 1230, column: 6, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1254, file: !71, line: 1230, column: 6)
!1254 = distinct !DILexicalBlock(scope: !1249, file: !71, line: 1229, column: 2)
!1255 = !DILocation(line: 1230, column: 15, scope: !1253)
!1256 = !DILocation(line: 1230, column: 6, scope: !1254)
!1257 = !DILocation(line: 1232, column: 16, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1253, file: !71, line: 1231, column: 3)
!1259 = !DILocation(line: 1232, column: 11, scope: !1258)
!1260 = !DILocation(line: 1232, column: 4, scope: !1258)
!1261 = !DILocation(line: 1236, column: 4, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1253, file: !71, line: 1235, column: 3)
!1263 = !DILocation(line: 1242, column: 3, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1249, file: !71, line: 1241, column: 2)
!1265 = !DILocation(line: 1244, column: 1, scope: !1228)
!1266 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !71, file: !71, line: 1259, type: !928, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1267 = !DILocalVariable(name: "val1", arg: 1, scope: !1266, file: !71, line: 1259, type: !22)
!1268 = !DILocation(line: 1259, column: 26, scope: !1266)
!1269 = !DILocalVariable(name: "val2", arg: 2, scope: !1266, file: !71, line: 1259, type: !22)
!1270 = !DILocation(line: 1259, column: 36, scope: !1266)
!1271 = !DILocalVariable(name: "u32Temp1", scope: !1266, file: !71, line: 1261, type: !735)
!1272 = !DILocation(line: 1261, column: 6, scope: !1266)
!1273 = !DILocation(line: 1262, column: 13, scope: !1266)
!1274 = !DILocation(line: 1262, column: 20, scope: !1266)
!1275 = !DILocation(line: 1262, column: 18, scope: !1266)
!1276 = !DILocation(line: 1262, column: 11, scope: !1266)
!1277 = !DILocation(line: 1263, column: 5, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1266, file: !71, line: 1263, column: 5)
!1279 = !DILocation(line: 1263, column: 14, scope: !1278)
!1280 = !DILocation(line: 1263, column: 5, scope: !1266)
!1281 = !DILocation(line: 1265, column: 11, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1278, file: !71, line: 1264, column: 2)
!1283 = !DILocation(line: 1265, column: 20, scope: !1282)
!1284 = !DILocation(line: 1265, column: 10, scope: !1282)
!1285 = !DILocation(line: 1265, column: 3, scope: !1282)
!1286 = !DILocation(line: 1269, column: 3, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1278, file: !71, line: 1268, column: 2)
!1288 = !DILocation(line: 1271, column: 1, scope: !1266)
!1289 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !71, file: !71, line: 1285, type: !1290, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1290 = !DISubroutineType(types: !1291)
!1291 = !{!735, !22, !22}
!1292 = !DILocalVariable(name: "x_value", arg: 1, scope: !1289, file: !71, line: 1285, type: !22)
!1293 = !DILocation(line: 1285, column: 25, scope: !1289)
!1294 = !DILocalVariable(name: "y_value", arg: 2, scope: !1289, file: !71, line: 1285, type: !22)
!1295 = !DILocation(line: 1285, column: 38, scope: !1289)
!1296 = !DILocalVariable(name: "u32Temp1", scope: !1289, file: !71, line: 1287, type: !735)
!1297 = !DILocation(line: 1287, column: 6, scope: !1289)
!1298 = !DILocation(line: 1288, column: 13, scope: !1289)
!1299 = !DILocation(line: 1288, column: 23, scope: !1289)
!1300 = !DILocation(line: 1288, column: 21, scope: !1289)
!1301 = !DILocation(line: 1288, column: 11, scope: !1289)
!1302 = !DILocation(line: 1289, column: 9, scope: !1289)
!1303 = !DILocation(line: 1289, column: 2, scope: !1289)
!1304 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !71, file: !71, line: 1307, type: !1305, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!79, !13, !13}
!1307 = !DILocalVariable(name: "x_value", arg: 1, scope: !1304, file: !71, line: 1307, type: !13)
!1308 = !DILocation(line: 1307, column: 25, scope: !1304)
!1309 = !DILocalVariable(name: "y_value", arg: 2, scope: !1304, file: !71, line: 1307, type: !13)
!1310 = !DILocation(line: 1307, column: 38, scope: !1304)
!1311 = !DILocalVariable(name: "s32Temp1", scope: !1304, file: !71, line: 1309, type: !79)
!1312 = !DILocation(line: 1309, column: 6, scope: !1304)
!1313 = !DILocation(line: 1310, column: 13, scope: !1304)
!1314 = !DILocation(line: 1310, column: 23, scope: !1304)
!1315 = !DILocation(line: 1310, column: 21, scope: !1304)
!1316 = !DILocation(line: 1310, column: 11, scope: !1304)
!1317 = !DILocation(line: 1311, column: 9, scope: !1304)
!1318 = !DILocation(line: 1311, column: 2, scope: !1304)
!1319 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !71, file: !71, line: 1328, type: !1320, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1320 = !DISubroutineType(types: !1321)
!1321 = !{!735, !735, !79}
!1322 = !DILocalVariable(name: "val1", arg: 1, scope: !1319, file: !71, line: 1328, type: !735)
!1323 = !DILocation(line: 1328, column: 25, scope: !1319)
!1324 = !DILocalVariable(name: "val2", arg: 2, scope: !1319, file: !71, line: 1328, type: !79)
!1325 = !DILocation(line: 1328, column: 35, scope: !1319)
!1326 = !DILocalVariable(name: "s32Temp1", scope: !1319, file: !71, line: 1330, type: !79)
!1327 = !DILocation(line: 1330, column: 6, scope: !1319)
!1328 = !DILocation(line: 1331, column: 5, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1319, file: !71, line: 1331, column: 5)
!1330 = !DILocation(line: 1331, column: 10, scope: !1329)
!1331 = !DILocation(line: 1331, column: 5, scope: !1319)
!1332 = !DILocation(line: 1333, column: 25, scope: !1333)
!1333 = distinct !DILexicalBlock(scope: !1329, file: !71, line: 1332, column: 2)
!1334 = !DILocation(line: 1333, column: 24, scope: !1333)
!1335 = !DILocation(line: 1333, column: 12, scope: !1333)
!1336 = !DILocation(line: 1334, column: 6, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1333, file: !71, line: 1334, column: 6)
!1338 = !DILocation(line: 1334, column: 17, scope: !1337)
!1339 = !DILocation(line: 1334, column: 15, scope: !1337)
!1340 = !DILocation(line: 1334, column: 6, scope: !1333)
!1341 = !DILocation(line: 1336, column: 4, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !71, line: 1335, column: 3)
!1343 = !DILocation(line: 1340, column: 12, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1337, file: !71, line: 1339, column: 3)
!1345 = !DILocation(line: 1340, column: 19, scope: !1344)
!1346 = !DILocation(line: 1340, column: 17, scope: !1344)
!1347 = !DILocation(line: 1340, column: 4, scope: !1344)
!1348 = !DILocation(line: 1345, column: 3, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1329, file: !71, line: 1344, column: 2)
!1350 = !DILocation(line: 1347, column: 1, scope: !1319)
!1351 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !71, file: !71, line: 1362, type: !1352, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{!735, !79, !79}
!1354 = !DILocalVariable(name: "val1", arg: 1, scope: !1351, file: !71, line: 1362, type: !79)
!1355 = !DILocation(line: 1362, column: 25, scope: !1351)
!1356 = !DILocalVariable(name: "val2", arg: 2, scope: !1351, file: !71, line: 1362, type: !79)
!1357 = !DILocation(line: 1362, column: 35, scope: !1351)
!1358 = !DILocalVariable(name: "u32Temp1", scope: !1351, file: !71, line: 1364, type: !735)
!1359 = !DILocation(line: 1364, column: 6, scope: !1351)
!1360 = !DILocalVariable(name: "u32Temp2", scope: !1351, file: !71, line: 1364, type: !735)
!1361 = !DILocation(line: 1364, column: 17, scope: !1351)
!1362 = !DILocalVariable(name: "u32Temp3", scope: !1351, file: !71, line: 1364, type: !735)
!1363 = !DILocation(line: 1364, column: 27, scope: !1351)
!1364 = !DILocalVariable(name: "u8SignBit", scope: !1351, file: !71, line: 1365, type: !17)
!1365 = !DILocation(line: 1365, column: 5, scope: !1351)
!1366 = !DILocation(line: 1367, column: 5, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1351, file: !71, line: 1367, column: 5)
!1368 = !DILocation(line: 1367, column: 9, scope: !1367)
!1369 = !DILocation(line: 1367, column: 5, scope: !1351)
!1370 = !DILocation(line: 1368, column: 15, scope: !1367)
!1371 = !DILocation(line: 1368, column: 14, scope: !1367)
!1372 = !DILocation(line: 1368, column: 12, scope: !1367)
!1373 = !DILocation(line: 1368, column: 3, scope: !1367)
!1374 = !DILocation(line: 1370, column: 14, scope: !1367)
!1375 = !DILocation(line: 1370, column: 12, scope: !1367)
!1376 = !DILocation(line: 1372, column: 5, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1351, file: !71, line: 1372, column: 5)
!1378 = !DILocation(line: 1372, column: 9, scope: !1377)
!1379 = !DILocation(line: 1372, column: 5, scope: !1351)
!1380 = !DILocation(line: 1373, column: 15, scope: !1377)
!1381 = !DILocation(line: 1373, column: 14, scope: !1377)
!1382 = !DILocation(line: 1373, column: 12, scope: !1377)
!1383 = !DILocation(line: 1373, column: 3, scope: !1377)
!1384 = !DILocation(line: 1375, column: 14, scope: !1377)
!1385 = !DILocation(line: 1375, column: 12, scope: !1377)
!1386 = !DILocation(line: 1377, column: 6, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1351, file: !71, line: 1377, column: 5)
!1388 = !DILocation(line: 1377, column: 10, scope: !1387)
!1389 = !DILocation(line: 1377, column: 13, scope: !1387)
!1390 = !DILocation(line: 1377, column: 28, scope: !1387)
!1391 = !DILocation(line: 1377, column: 32, scope: !1387)
!1392 = !DILocation(line: 1377, column: 35, scope: !1387)
!1393 = !DILocation(line: 1378, column: 12, scope: !1387)
!1394 = !DILocation(line: 1378, column: 3, scope: !1387)
!1395 = !DILocation(line: 1380, column: 12, scope: !1387)
!1396 = !DILocation(line: 1381, column: 29, scope: !1351)
!1397 = !DILocation(line: 1381, column: 38, scope: !1351)
!1398 = !DILocation(line: 1381, column: 13, scope: !1351)
!1399 = !DILocation(line: 1381, column: 11, scope: !1351)
!1400 = !DILocation(line: 1383, column: 5, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1351, file: !71, line: 1383, column: 5)
!1402 = !DILocation(line: 1383, column: 14, scope: !1401)
!1403 = !DILocation(line: 1383, column: 5, scope: !1351)
!1404 = !DILocation(line: 1385, column: 3, scope: !1405)
!1405 = distinct !DILexicalBlock(scope: !1401, file: !71, line: 1384, column: 2)
!1406 = !DILocation(line: 1389, column: 10, scope: !1407)
!1407 = distinct !DILexicalBlock(scope: !1401, file: !71, line: 1388, column: 2)
!1408 = !DILocation(line: 1389, column: 3, scope: !1407)
!1409 = !DILocation(line: 1440, column: 1, scope: !1351)
!1410 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !71, file: !71, line: 1455, type: !1411, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1411 = !DISubroutineType(types: !1412)
!1412 = !{!735, !735, !735}
!1413 = !DILocalVariable(name: "val1", arg: 1, scope: !1410, file: !71, line: 1455, type: !735)
!1414 = !DILocation(line: 1455, column: 25, scope: !1410)
!1415 = !DILocalVariable(name: "val2", arg: 2, scope: !1410, file: !71, line: 1455, type: !735)
!1416 = !DILocation(line: 1455, column: 35, scope: !1410)
!1417 = !DILocalVariable(name: "u32Temp1", scope: !1410, file: !71, line: 1457, type: !735)
!1418 = !DILocation(line: 1457, column: 6, scope: !1410)
!1419 = !DILocation(line: 1458, column: 5, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1410, file: !71, line: 1458, column: 5)
!1421 = !DILocation(line: 1458, column: 10, scope: !1420)
!1422 = !DILocation(line: 1458, column: 5, scope: !1410)
!1423 = !DILocation(line: 1460, column: 26, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1420, file: !71, line: 1459, column: 2)
!1425 = !DILocation(line: 1460, column: 25, scope: !1424)
!1426 = !DILocation(line: 1460, column: 12, scope: !1424)
!1427 = !DILocation(line: 1461, column: 6, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !71, line: 1461, column: 6)
!1429 = !DILocation(line: 1461, column: 17, scope: !1428)
!1430 = !DILocation(line: 1461, column: 15, scope: !1428)
!1431 = !DILocation(line: 1461, column: 6, scope: !1424)
!1432 = !DILocation(line: 1463, column: 4, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !71, line: 1462, column: 3)
!1434 = !DILocation(line: 1467, column: 12, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1428, file: !71, line: 1466, column: 3)
!1436 = !DILocation(line: 1467, column: 19, scope: !1435)
!1437 = !DILocation(line: 1467, column: 17, scope: !1435)
!1438 = !DILocation(line: 1467, column: 4, scope: !1435)
!1439 = !DILocation(line: 1472, column: 3, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1420, file: !71, line: 1471, column: 2)
!1441 = !DILocation(line: 1474, column: 1, scope: !1410)
!1442 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !71, file: !71, line: 1501, type: !1116, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1443 = !DILocalVariable(name: "value", arg: 1, scope: !1442, file: !71, line: 1501, type: !735)
!1444 = !DILocation(line: 1501, column: 30, scope: !1442)
!1445 = !DILocalVariable(name: "factor", arg: 2, scope: !1442, file: !71, line: 1501, type: !22)
!1446 = !DILocation(line: 1501, column: 41, scope: !1442)
!1447 = !DILocalVariable(name: "u32Temp1", scope: !1442, file: !71, line: 1503, type: !735)
!1448 = !DILocation(line: 1503, column: 6, scope: !1442)
!1449 = !DILocalVariable(name: "u32Temp2", scope: !1442, file: !71, line: 1503, type: !735)
!1450 = !DILocation(line: 1503, column: 20, scope: !1442)
!1451 = !DILocation(line: 1504, column: 13, scope: !1442)
!1452 = !DILocation(line: 1504, column: 21, scope: !1442)
!1453 = !DILocation(line: 1504, column: 19, scope: !1442)
!1454 = !DILocation(line: 1504, column: 11, scope: !1442)
!1455 = !DILocation(line: 1505, column: 25, scope: !1442)
!1456 = !DILocation(line: 1505, column: 32, scope: !1442)
!1457 = !DILocation(line: 1505, column: 13, scope: !1442)
!1458 = !DILocation(line: 1505, column: 11, scope: !1442)
!1459 = !DILocation(line: 1506, column: 14, scope: !1442)
!1460 = !DILocation(line: 1506, column: 23, scope: !1442)
!1461 = !DILocation(line: 1506, column: 11, scope: !1442)
!1462 = !DILocation(line: 1507, column: 14, scope: !1442)
!1463 = !DILocation(line: 1507, column: 23, scope: !1442)
!1464 = !DILocation(line: 1507, column: 11, scope: !1442)
!1465 = !DILocation(line: 1508, column: 9, scope: !1442)
!1466 = !DILocation(line: 1508, column: 2, scope: !1442)
!1467 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !71, file: !71, line: 1527, type: !1116, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1468 = !DILocalVariable(name: "value", arg: 1, scope: !1467, file: !71, line: 1527, type: !735)
!1469 = !DILocation(line: 1527, column: 30, scope: !1467)
!1470 = !DILocalVariable(name: "factor", arg: 2, scope: !1467, file: !71, line: 1527, type: !22)
!1471 = !DILocation(line: 1527, column: 41, scope: !1467)
!1472 = !DILocalVariable(name: "u32Temp1", scope: !1467, file: !71, line: 1529, type: !735)
!1473 = !DILocation(line: 1529, column: 6, scope: !1467)
!1474 = !DILocalVariable(name: "u32Temp2", scope: !1467, file: !71, line: 1529, type: !735)
!1475 = !DILocation(line: 1529, column: 20, scope: !1467)
!1476 = !DILocation(line: 1530, column: 13, scope: !1467)
!1477 = !DILocation(line: 1530, column: 21, scope: !1467)
!1478 = !DILocation(line: 1530, column: 19, scope: !1467)
!1479 = !DILocation(line: 1530, column: 11, scope: !1467)
!1480 = !DILocation(line: 1531, column: 25, scope: !1467)
!1481 = !DILocation(line: 1531, column: 32, scope: !1467)
!1482 = !DILocation(line: 1531, column: 13, scope: !1467)
!1483 = !DILocation(line: 1531, column: 11, scope: !1467)
!1484 = !DILocation(line: 1532, column: 13, scope: !1467)
!1485 = !DILocation(line: 1532, column: 22, scope: !1467)
!1486 = !DILocation(line: 1532, column: 11, scope: !1467)
!1487 = !DILocation(line: 1533, column: 14, scope: !1467)
!1488 = !DILocation(line: 1533, column: 23, scope: !1467)
!1489 = !DILocation(line: 1533, column: 11, scope: !1467)
!1490 = !DILocation(line: 1534, column: 6, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1467, file: !71, line: 1534, column: 5)
!1492 = !DILocation(line: 1534, column: 14, scope: !1491)
!1493 = !DILocation(line: 1534, column: 20, scope: !1491)
!1494 = !DILocation(line: 1534, column: 5, scope: !1467)
!1495 = !DILocation(line: 1536, column: 10, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1491, file: !71, line: 1535, column: 2)
!1497 = !DILocation(line: 1536, column: 3, scope: !1496)
!1498 = !DILocation(line: 1540, column: 3, scope: !1499)
!1499 = distinct !DILexicalBlock(scope: !1491, file: !71, line: 1539, column: 2)
!1500 = !DILocation(line: 1542, column: 1, scope: !1467)
!1501 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !71, file: !71, line: 1560, type: !1502, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1502 = !DISubroutineType(types: !1503)
!1503 = !{!735, !735, !13}
!1504 = !DILocalVariable(name: "value", arg: 1, scope: !1501, file: !71, line: 1560, type: !735)
!1505 = !DILocation(line: 1560, column: 30, scope: !1501)
!1506 = !DILocalVariable(name: "factor", arg: 2, scope: !1501, file: !71, line: 1560, type: !13)
!1507 = !DILocation(line: 1560, column: 41, scope: !1501)
!1508 = !DILocalVariable(name: "u32Temp1", scope: !1501, file: !71, line: 1562, type: !735)
!1509 = !DILocation(line: 1562, column: 6, scope: !1501)
!1510 = !DILocalVariable(name: "u32Temp2", scope: !1501, file: !71, line: 1562, type: !735)
!1511 = !DILocation(line: 1562, column: 20, scope: !1501)
!1512 = !DILocation(line: 1563, column: 5, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1501, file: !71, line: 1563, column: 5)
!1514 = !DILocation(line: 1563, column: 12, scope: !1513)
!1515 = !DILocation(line: 1563, column: 5, scope: !1501)
!1516 = !DILocation(line: 1566, column: 14, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1513, file: !71, line: 1564, column: 2)
!1518 = !DILocation(line: 1566, column: 22, scope: !1517)
!1519 = !DILocation(line: 1566, column: 20, scope: !1517)
!1520 = !DILocation(line: 1566, column: 12, scope: !1517)
!1521 = !DILocation(line: 1567, column: 26, scope: !1517)
!1522 = !DILocation(line: 1567, column: 33, scope: !1517)
!1523 = !DILocation(line: 1567, column: 14, scope: !1517)
!1524 = !DILocation(line: 1567, column: 12, scope: !1517)
!1525 = !DILocation(line: 1568, column: 14, scope: !1517)
!1526 = !DILocation(line: 1568, column: 23, scope: !1517)
!1527 = !DILocation(line: 1568, column: 12, scope: !1517)
!1528 = !DILocation(line: 1569, column: 15, scope: !1517)
!1529 = !DILocation(line: 1569, column: 24, scope: !1517)
!1530 = !DILocation(line: 1569, column: 12, scope: !1517)
!1531 = !DILocation(line: 1570, column: 10, scope: !1517)
!1532 = !DILocation(line: 1570, column: 3, scope: !1517)
!1533 = !DILocation(line: 1574, column: 3, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1513, file: !71, line: 1573, column: 2)
!1535 = !DILocation(line: 1576, column: 1, scope: !1501)
!1536 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !71, file: !71, line: 1595, type: !1502, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1537 = !DILocalVariable(name: "value", arg: 1, scope: !1536, file: !71, line: 1595, type: !735)
!1538 = !DILocation(line: 1595, column: 31, scope: !1536)
!1539 = !DILocalVariable(name: "factor", arg: 2, scope: !1536, file: !71, line: 1595, type: !13)
!1540 = !DILocation(line: 1595, column: 42, scope: !1536)
!1541 = !DILocalVariable(name: "u32Temp1", scope: !1536, file: !71, line: 1597, type: !735)
!1542 = !DILocation(line: 1597, column: 6, scope: !1536)
!1543 = !DILocalVariable(name: "u32Temp2", scope: !1536, file: !71, line: 1597, type: !735)
!1544 = !DILocation(line: 1597, column: 20, scope: !1536)
!1545 = !DILocation(line: 1598, column: 5, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1536, file: !71, line: 1598, column: 5)
!1547 = !DILocation(line: 1598, column: 12, scope: !1546)
!1548 = !DILocation(line: 1598, column: 5, scope: !1536)
!1549 = !DILocation(line: 1600, column: 3, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1546, file: !71, line: 1599, column: 2)
!1551 = !DILocation(line: 1604, column: 14, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1546, file: !71, line: 1603, column: 2)
!1553 = !DILocation(line: 1604, column: 22, scope: !1552)
!1554 = !DILocation(line: 1604, column: 20, scope: !1552)
!1555 = !DILocation(line: 1604, column: 12, scope: !1552)
!1556 = !DILocation(line: 1605, column: 26, scope: !1552)
!1557 = !DILocation(line: 1605, column: 33, scope: !1552)
!1558 = !DILocation(line: 1605, column: 14, scope: !1552)
!1559 = !DILocation(line: 1605, column: 12, scope: !1552)
!1560 = !DILocation(line: 1606, column: 14, scope: !1552)
!1561 = !DILocation(line: 1606, column: 23, scope: !1552)
!1562 = !DILocation(line: 1606, column: 12, scope: !1552)
!1563 = !DILocation(line: 1607, column: 15, scope: !1552)
!1564 = !DILocation(line: 1607, column: 24, scope: !1552)
!1565 = !DILocation(line: 1607, column: 12, scope: !1552)
!1566 = !DILocation(line: 1608, column: 7, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1552, file: !71, line: 1608, column: 6)
!1568 = !DILocation(line: 1608, column: 16, scope: !1567)
!1569 = !DILocation(line: 1608, column: 23, scope: !1567)
!1570 = !DILocation(line: 1608, column: 6, scope: !1552)
!1571 = !DILocation(line: 1610, column: 11, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1567, file: !71, line: 1609, column: 3)
!1573 = !DILocation(line: 1610, column: 4, scope: !1572)
!1574 = !DILocation(line: 1614, column: 4, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1567, file: !71, line: 1613, column: 3)
!1576 = !DILocation(line: 1617, column: 1, scope: !1536)
!1577 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !71, file: !71, line: 1632, type: !1411, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1578 = !DILocalVariable(name: "value", arg: 1, scope: !1577, file: !71, line: 1632, type: !735)
!1579 = !DILocation(line: 1632, column: 30, scope: !1577)
!1580 = !DILocalVariable(name: "factor", arg: 2, scope: !1577, file: !71, line: 1632, type: !735)
!1581 = !DILocation(line: 1632, column: 40, scope: !1577)
!1582 = !DILocation(line: 1634, column: 21, scope: !1577)
!1583 = !DILocation(line: 1634, column: 28, scope: !1577)
!1584 = !DILocation(line: 1634, column: 9, scope: !1577)
!1585 = !DILocation(line: 1634, column: 2, scope: !1577)
!1586 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !71, file: !71, line: 1653, type: !1411, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1587 = !DILocalVariable(name: "value", arg: 1, scope: !1586, file: !71, line: 1653, type: !735)
!1588 = !DILocation(line: 1653, column: 30, scope: !1586)
!1589 = !DILocalVariable(name: "factor", arg: 2, scope: !1586, file: !71, line: 1653, type: !735)
!1590 = !DILocation(line: 1653, column: 40, scope: !1586)
!1591 = !DILocalVariable(name: "u32Temp1", scope: !1586, file: !71, line: 1655, type: !735)
!1592 = !DILocation(line: 1655, column: 6, scope: !1586)
!1593 = !DILocalVariable(name: "u32Temp2", scope: !1586, file: !71, line: 1655, type: !735)
!1594 = !DILocation(line: 1655, column: 20, scope: !1586)
!1595 = !DILocation(line: 1656, column: 13, scope: !1586)
!1596 = !DILocation(line: 1656, column: 21, scope: !1586)
!1597 = !DILocation(line: 1656, column: 19, scope: !1586)
!1598 = !DILocation(line: 1656, column: 11, scope: !1586)
!1599 = !DILocation(line: 1657, column: 25, scope: !1586)
!1600 = !DILocation(line: 1657, column: 32, scope: !1586)
!1601 = !DILocation(line: 1657, column: 13, scope: !1586)
!1602 = !DILocation(line: 1657, column: 11, scope: !1586)
!1603 = !DILocation(line: 1658, column: 13, scope: !1586)
!1604 = !DILocation(line: 1658, column: 22, scope: !1586)
!1605 = !DILocation(line: 1658, column: 11, scope: !1586)
!1606 = !DILocation(line: 1659, column: 14, scope: !1586)
!1607 = !DILocation(line: 1659, column: 23, scope: !1586)
!1608 = !DILocation(line: 1659, column: 11, scope: !1586)
!1609 = !DILocation(line: 1660, column: 6, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1586, file: !71, line: 1660, column: 5)
!1611 = !DILocation(line: 1660, column: 14, scope: !1610)
!1612 = !DILocation(line: 1660, column: 20, scope: !1610)
!1613 = !DILocation(line: 1660, column: 5, scope: !1586)
!1614 = !DILocation(line: 1662, column: 10, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1610, file: !71, line: 1661, column: 2)
!1616 = !DILocation(line: 1662, column: 3, scope: !1615)
!1617 = !DILocation(line: 1666, column: 3, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1610, file: !71, line: 1665, column: 2)
!1619 = !DILocation(line: 1668, column: 1, scope: !1586)
!1620 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !71, file: !71, line: 1686, type: !1320, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1621 = !DILocalVariable(name: "value", arg: 1, scope: !1620, file: !71, line: 1686, type: !735)
!1622 = !DILocation(line: 1686, column: 30, scope: !1620)
!1623 = !DILocalVariable(name: "factor", arg: 2, scope: !1620, file: !71, line: 1686, type: !79)
!1624 = !DILocation(line: 1686, column: 40, scope: !1620)
!1625 = !DILocalVariable(name: "u32Temp1", scope: !1620, file: !71, line: 1688, type: !735)
!1626 = !DILocation(line: 1688, column: 6, scope: !1620)
!1627 = !DILocalVariable(name: "u32Temp2", scope: !1620, file: !71, line: 1688, type: !735)
!1628 = !DILocation(line: 1688, column: 20, scope: !1620)
!1629 = !DILocation(line: 1689, column: 5, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1620, file: !71, line: 1689, column: 5)
!1631 = !DILocation(line: 1689, column: 12, scope: !1630)
!1632 = !DILocation(line: 1689, column: 5, scope: !1620)
!1633 = !DILocation(line: 1691, column: 14, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1630, file: !71, line: 1690, column: 2)
!1635 = !DILocation(line: 1691, column: 22, scope: !1634)
!1636 = !DILocation(line: 1691, column: 20, scope: !1634)
!1637 = !DILocation(line: 1691, column: 12, scope: !1634)
!1638 = !DILocation(line: 1692, column: 26, scope: !1634)
!1639 = !DILocation(line: 1692, column: 33, scope: !1634)
!1640 = !DILocation(line: 1692, column: 14, scope: !1634)
!1641 = !DILocation(line: 1692, column: 12, scope: !1634)
!1642 = !DILocation(line: 1693, column: 14, scope: !1634)
!1643 = !DILocation(line: 1693, column: 23, scope: !1634)
!1644 = !DILocation(line: 1693, column: 12, scope: !1634)
!1645 = !DILocation(line: 1694, column: 15, scope: !1634)
!1646 = !DILocation(line: 1694, column: 24, scope: !1634)
!1647 = !DILocation(line: 1694, column: 12, scope: !1634)
!1648 = !DILocation(line: 1695, column: 10, scope: !1634)
!1649 = !DILocation(line: 1695, column: 3, scope: !1634)
!1650 = !DILocation(line: 1699, column: 3, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1630, file: !71, line: 1698, column: 2)
!1652 = !DILocation(line: 1701, column: 1, scope: !1620)
!1653 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !71, file: !71, line: 1720, type: !1320, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1654 = !DILocalVariable(name: "value", arg: 1, scope: !1653, file: !71, line: 1720, type: !735)
!1655 = !DILocation(line: 1720, column: 30, scope: !1653)
!1656 = !DILocalVariable(name: "factor", arg: 2, scope: !1653, file: !71, line: 1720, type: !79)
!1657 = !DILocation(line: 1720, column: 40, scope: !1653)
!1658 = !DILocalVariable(name: "u32Temp1", scope: !1653, file: !71, line: 1722, type: !735)
!1659 = !DILocation(line: 1722, column: 6, scope: !1653)
!1660 = !DILocalVariable(name: "u32Temp2", scope: !1653, file: !71, line: 1722, type: !735)
!1661 = !DILocation(line: 1722, column: 20, scope: !1653)
!1662 = !DILocation(line: 1723, column: 5, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1653, file: !71, line: 1723, column: 5)
!1664 = !DILocation(line: 1723, column: 12, scope: !1663)
!1665 = !DILocation(line: 1723, column: 5, scope: !1653)
!1666 = !DILocation(line: 1725, column: 3, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1663, file: !71, line: 1724, column: 2)
!1668 = !DILocation(line: 1729, column: 14, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1663, file: !71, line: 1728, column: 2)
!1670 = !DILocation(line: 1729, column: 22, scope: !1669)
!1671 = !DILocation(line: 1729, column: 20, scope: !1669)
!1672 = !DILocation(line: 1729, column: 12, scope: !1669)
!1673 = !DILocation(line: 1730, column: 26, scope: !1669)
!1674 = !DILocation(line: 1730, column: 33, scope: !1669)
!1675 = !DILocation(line: 1730, column: 14, scope: !1669)
!1676 = !DILocation(line: 1730, column: 12, scope: !1669)
!1677 = !DILocation(line: 1731, column: 14, scope: !1669)
!1678 = !DILocation(line: 1731, column: 23, scope: !1669)
!1679 = !DILocation(line: 1731, column: 12, scope: !1669)
!1680 = !DILocation(line: 1732, column: 15, scope: !1669)
!1681 = !DILocation(line: 1732, column: 24, scope: !1669)
!1682 = !DILocation(line: 1732, column: 12, scope: !1669)
!1683 = !DILocation(line: 1733, column: 7, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1669, file: !71, line: 1733, column: 6)
!1685 = !DILocation(line: 1733, column: 15, scope: !1684)
!1686 = !DILocation(line: 1733, column: 21, scope: !1684)
!1687 = !DILocation(line: 1733, column: 6, scope: !1669)
!1688 = !DILocation(line: 1735, column: 11, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1684, file: !71, line: 1734, column: 3)
!1690 = !DILocation(line: 1735, column: 4, scope: !1689)
!1691 = !DILocation(line: 1739, column: 4, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1684, file: !71, line: 1738, column: 3)
!1693 = !DILocation(line: 1742, column: 1, scope: !1653)
!1694 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !71, file: !71, line: 1757, type: !1695, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1695 = !DISubroutineType(types: !1696)
!1696 = !{!79, !735, !79}
!1697 = !DILocalVariable(name: "val1", arg: 1, scope: !1694, file: !71, line: 1757, type: !735)
!1698 = !DILocation(line: 1757, column: 25, scope: !1694)
!1699 = !DILocalVariable(name: "val2", arg: 2, scope: !1694, file: !71, line: 1757, type: !79)
!1700 = !DILocation(line: 1757, column: 35, scope: !1694)
!1701 = !DILocalVariable(name: "s32Val2prime", scope: !1694, file: !71, line: 1759, type: !79)
!1702 = !DILocation(line: 1759, column: 6, scope: !1694)
!1703 = !DILocation(line: 1760, column: 5, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1694, file: !71, line: 1760, column: 5)
!1705 = !DILocation(line: 1760, column: 10, scope: !1704)
!1706 = !DILocation(line: 1760, column: 5, scope: !1694)
!1707 = !DILocation(line: 1762, column: 19, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1704, file: !71, line: 1761, column: 2)
!1709 = !DILocation(line: 1762, column: 18, scope: !1708)
!1710 = !DILocation(line: 1762, column: 16, scope: !1708)
!1711 = !DILocation(line: 1763, column: 2, scope: !1708)
!1712 = !DILocation(line: 1764, column: 5, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1694, file: !71, line: 1764, column: 5)
!1714 = !DILocation(line: 1764, column: 10, scope: !1713)
!1715 = !DILocation(line: 1764, column: 5, scope: !1694)
!1716 = !DILocation(line: 1766, column: 6, scope: !1717)
!1717 = distinct !DILexicalBlock(scope: !1718, file: !71, line: 1766, column: 6)
!1718 = distinct !DILexicalBlock(scope: !1713, file: !71, line: 1765, column: 2)
!1719 = !DILocation(line: 1766, column: 11, scope: !1717)
!1720 = !DILocation(line: 1766, column: 6, scope: !1718)
!1721 = !DILocation(line: 1768, column: 21, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1723, file: !71, line: 1768, column: 7)
!1723 = distinct !DILexicalBlock(scope: !1717, file: !71, line: 1767, column: 3)
!1724 = !DILocation(line: 1768, column: 19, scope: !1722)
!1725 = !DILocation(line: 1768, column: 37, scope: !1722)
!1726 = !DILocation(line: 1768, column: 35, scope: !1722)
!1727 = !DILocation(line: 1768, column: 7, scope: !1723)
!1728 = !DILocation(line: 1770, column: 13, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1722, file: !71, line: 1769, column: 4)
!1730 = !DILocation(line: 1770, column: 20, scope: !1729)
!1731 = !DILocation(line: 1770, column: 18, scope: !1729)
!1732 = !DILocation(line: 1770, column: 5, scope: !1729)
!1733 = !DILocation(line: 1774, column: 5, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1722, file: !71, line: 1773, column: 4)
!1735 = !DILocation(line: 1779, column: 21, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1737, file: !71, line: 1779, column: 7)
!1737 = distinct !DILexicalBlock(scope: !1717, file: !71, line: 1778, column: 3)
!1738 = !DILocation(line: 1779, column: 19, scope: !1736)
!1739 = !DILocation(line: 1779, column: 29, scope: !1736)
!1740 = !DILocation(line: 1779, column: 27, scope: !1736)
!1741 = !DILocation(line: 1779, column: 7, scope: !1737)
!1742 = !DILocation(line: 1781, column: 5, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1736, file: !71, line: 1780, column: 4)
!1744 = !DILocation(line: 1785, column: 13, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1736, file: !71, line: 1784, column: 4)
!1746 = !DILocation(line: 1785, column: 20, scope: !1745)
!1747 = !DILocation(line: 1785, column: 18, scope: !1745)
!1748 = !DILocation(line: 1785, column: 5, scope: !1745)
!1749 = !DILocation(line: 1791, column: 3, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1713, file: !71, line: 1790, column: 2)
!1751 = !DILocation(line: 1793, column: 1, scope: !1694)
!1752 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !71, file: !71, line: 1810, type: !774, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1753 = !DILocalVariable(name: "val1", arg: 1, scope: !1752, file: !71, line: 1810, type: !79)
!1754 = !DILocation(line: 1810, column: 30, scope: !1752)
!1755 = !DILocalVariable(name: "val2", arg: 2, scope: !1752, file: !71, line: 1810, type: !22)
!1756 = !DILocation(line: 1810, column: 39, scope: !1752)
!1757 = !DILocalVariable(name: "u32Temp1", scope: !1752, file: !71, line: 1812, type: !735)
!1758 = !DILocation(line: 1812, column: 6, scope: !1752)
!1759 = !DILocalVariable(name: "u32Temp2", scope: !1752, file: !71, line: 1812, type: !735)
!1760 = !DILocation(line: 1812, column: 17, scope: !1752)
!1761 = !DILocalVariable(name: "u32Temp3", scope: !1752, file: !71, line: 1812, type: !735)
!1762 = !DILocation(line: 1812, column: 26, scope: !1752)
!1763 = !DILocalVariable(name: "u8SignBit", scope: !1752, file: !71, line: 1813, type: !17)
!1764 = !DILocation(line: 1813, column: 5, scope: !1752)
!1765 = !DILocation(line: 1815, column: 5, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1752, file: !71, line: 1815, column: 5)
!1767 = !DILocation(line: 1815, column: 9, scope: !1766)
!1768 = !DILocation(line: 1815, column: 5, scope: !1752)
!1769 = !DILocation(line: 1817, column: 15, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1766, file: !71, line: 1816, column: 2)
!1771 = !DILocation(line: 1817, column: 14, scope: !1770)
!1772 = !DILocation(line: 1817, column: 12, scope: !1770)
!1773 = !DILocation(line: 1818, column: 13, scope: !1770)
!1774 = !DILocation(line: 1819, column: 2, scope: !1770)
!1775 = !DILocation(line: 1822, column: 14, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1766, file: !71, line: 1821, column: 2)
!1777 = !DILocation(line: 1822, column: 12, scope: !1776)
!1778 = !DILocation(line: 1823, column: 13, scope: !1776)
!1779 = !DILocation(line: 1826, column: 13, scope: !1752)
!1780 = !DILocation(line: 1826, column: 24, scope: !1752)
!1781 = !DILocation(line: 1826, column: 22, scope: !1752)
!1782 = !DILocation(line: 1826, column: 11, scope: !1752)
!1783 = !DILocation(line: 1827, column: 25, scope: !1752)
!1784 = !DILocation(line: 1827, column: 35, scope: !1752)
!1785 = !DILocation(line: 1827, column: 13, scope: !1752)
!1786 = !DILocation(line: 1827, column: 11, scope: !1752)
!1787 = !DILocation(line: 1828, column: 13, scope: !1752)
!1788 = !DILocation(line: 1828, column: 22, scope: !1752)
!1789 = !DILocation(line: 1828, column: 11, scope: !1752)
!1790 = !DILocation(line: 1829, column: 14, scope: !1752)
!1791 = !DILocation(line: 1829, column: 23, scope: !1752)
!1792 = !DILocation(line: 1829, column: 11, scope: !1752)
!1793 = !DILocation(line: 1830, column: 5, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1752, file: !71, line: 1830, column: 5)
!1795 = !DILocation(line: 1830, column: 15, scope: !1794)
!1796 = !DILocation(line: 1830, column: 5, scope: !1752)
!1797 = !DILocation(line: 1832, column: 10, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1794, file: !71, line: 1831, column: 2)
!1799 = !DILocation(line: 1832, column: 3, scope: !1798)
!1800 = !DILocation(line: 1836, column: 11, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1794, file: !71, line: 1835, column: 2)
!1802 = !DILocation(line: 1836, column: 10, scope: !1801)
!1803 = !DILocation(line: 1836, column: 3, scope: !1801)
!1804 = !DILocation(line: 1838, column: 1, scope: !1752)
!1805 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !71, file: !71, line: 1857, type: !774, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1806 = !DILocalVariable(name: "val1", arg: 1, scope: !1805, file: !71, line: 1857, type: !79)
!1807 = !DILocation(line: 1857, column: 30, scope: !1805)
!1808 = !DILocalVariable(name: "val2", arg: 2, scope: !1805, file: !71, line: 1857, type: !22)
!1809 = !DILocation(line: 1857, column: 39, scope: !1805)
!1810 = !DILocalVariable(name: "u32Temp1", scope: !1805, file: !71, line: 1859, type: !735)
!1811 = !DILocation(line: 1859, column: 6, scope: !1805)
!1812 = !DILocalVariable(name: "u32Temp2", scope: !1805, file: !71, line: 1859, type: !735)
!1813 = !DILocation(line: 1859, column: 17, scope: !1805)
!1814 = !DILocalVariable(name: "u32Temp3", scope: !1805, file: !71, line: 1859, type: !735)
!1815 = !DILocation(line: 1859, column: 26, scope: !1805)
!1816 = !DILocalVariable(name: "u8SignBit", scope: !1805, file: !71, line: 1860, type: !17)
!1817 = !DILocation(line: 1860, column: 5, scope: !1805)
!1818 = !DILocation(line: 1862, column: 5, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1805, file: !71, line: 1862, column: 5)
!1820 = !DILocation(line: 1862, column: 9, scope: !1819)
!1821 = !DILocation(line: 1862, column: 5, scope: !1805)
!1822 = !DILocation(line: 1864, column: 15, scope: !1823)
!1823 = distinct !DILexicalBlock(scope: !1819, file: !71, line: 1863, column: 2)
!1824 = !DILocation(line: 1864, column: 14, scope: !1823)
!1825 = !DILocation(line: 1864, column: 12, scope: !1823)
!1826 = !DILocation(line: 1865, column: 13, scope: !1823)
!1827 = !DILocation(line: 1866, column: 2, scope: !1823)
!1828 = !DILocation(line: 1869, column: 14, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1819, file: !71, line: 1868, column: 2)
!1830 = !DILocation(line: 1869, column: 12, scope: !1829)
!1831 = !DILocation(line: 1870, column: 13, scope: !1829)
!1832 = !DILocation(line: 1873, column: 13, scope: !1805)
!1833 = !DILocation(line: 1873, column: 24, scope: !1805)
!1834 = !DILocation(line: 1873, column: 22, scope: !1805)
!1835 = !DILocation(line: 1873, column: 11, scope: !1805)
!1836 = !DILocation(line: 1874, column: 25, scope: !1805)
!1837 = !DILocation(line: 1874, column: 35, scope: !1805)
!1838 = !DILocation(line: 1874, column: 13, scope: !1805)
!1839 = !DILocation(line: 1874, column: 11, scope: !1805)
!1840 = !DILocation(line: 1875, column: 13, scope: !1805)
!1841 = !DILocation(line: 1875, column: 22, scope: !1805)
!1842 = !DILocation(line: 1875, column: 11, scope: !1805)
!1843 = !DILocation(line: 1876, column: 14, scope: !1805)
!1844 = !DILocation(line: 1876, column: 23, scope: !1805)
!1845 = !DILocation(line: 1876, column: 11, scope: !1805)
!1846 = !DILocation(line: 1877, column: 5, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1805, file: !71, line: 1877, column: 5)
!1848 = !DILocation(line: 1877, column: 15, scope: !1847)
!1849 = !DILocation(line: 1877, column: 5, scope: !1805)
!1850 = !DILocation(line: 1879, column: 6, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1852, file: !71, line: 1879, column: 6)
!1852 = distinct !DILexicalBlock(scope: !1847, file: !71, line: 1878, column: 2)
!1853 = !DILocation(line: 1879, column: 14, scope: !1851)
!1854 = !DILocation(line: 1879, column: 6, scope: !1852)
!1855 = !DILocation(line: 1880, column: 11, scope: !1851)
!1856 = !DILocation(line: 1880, column: 4, scope: !1851)
!1857 = !DILocation(line: 1882, column: 4, scope: !1851)
!1858 = !DILocation(line: 1886, column: 6, scope: !1859)
!1859 = distinct !DILexicalBlock(scope: !1860, file: !71, line: 1886, column: 6)
!1860 = distinct !DILexicalBlock(scope: !1847, file: !71, line: 1885, column: 2)
!1861 = !DILocation(line: 1886, column: 14, scope: !1859)
!1862 = !DILocation(line: 1886, column: 6, scope: !1860)
!1863 = !DILocation(line: 1887, column: 12, scope: !1859)
!1864 = !DILocation(line: 1887, column: 11, scope: !1859)
!1865 = !DILocation(line: 1887, column: 4, scope: !1859)
!1866 = !DILocation(line: 1889, column: 4, scope: !1859)
!1867 = !DILocation(line: 1891, column: 1, scope: !1805)
!1868 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !71, file: !71, line: 1911, type: !1869, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1869 = !DISubroutineType(types: !1870)
!1870 = !{!79, !79, !13}
!1871 = !DILocalVariable(name: "val1", arg: 1, scope: !1868, file: !71, line: 1911, type: !79)
!1872 = !DILocation(line: 1911, column: 30, scope: !1868)
!1873 = !DILocalVariable(name: "val2", arg: 2, scope: !1868, file: !71, line: 1911, type: !13)
!1874 = !DILocation(line: 1911, column: 39, scope: !1868)
!1875 = !DILocalVariable(name: "u32Temp1", scope: !1868, file: !71, line: 1913, type: !735)
!1876 = !DILocation(line: 1913, column: 6, scope: !1868)
!1877 = !DILocalVariable(name: "u32Temp2", scope: !1868, file: !71, line: 1913, type: !735)
!1878 = !DILocation(line: 1913, column: 17, scope: !1868)
!1879 = !DILocalVariable(name: "u32Temp3", scope: !1868, file: !71, line: 1913, type: !735)
!1880 = !DILocation(line: 1913, column: 26, scope: !1868)
!1881 = !DILocalVariable(name: "u32Temp4", scope: !1868, file: !71, line: 1913, type: !735)
!1882 = !DILocation(line: 1913, column: 35, scope: !1868)
!1883 = !DILocalVariable(name: "u8SignBit", scope: !1868, file: !71, line: 1914, type: !17)
!1884 = !DILocation(line: 1914, column: 5, scope: !1868)
!1885 = !DILocation(line: 1916, column: 7, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1868, file: !71, line: 1916, column: 5)
!1887 = !DILocation(line: 1916, column: 11, scope: !1886)
!1888 = !DILocation(line: 1916, column: 15, scope: !1886)
!1889 = !DILocation(line: 1916, column: 19, scope: !1886)
!1890 = !DILocation(line: 1916, column: 23, scope: !1886)
!1891 = !DILocation(line: 1916, column: 28, scope: !1886)
!1892 = !DILocation(line: 1916, column: 33, scope: !1886)
!1893 = !DILocation(line: 1916, column: 37, scope: !1886)
!1894 = !DILocation(line: 1916, column: 41, scope: !1886)
!1895 = !DILocation(line: 1916, column: 45, scope: !1886)
!1896 = !DILocation(line: 1916, column: 49, scope: !1886)
!1897 = !DILocation(line: 1916, column: 5, scope: !1868)
!1898 = !DILocation(line: 1918, column: 13, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1886, file: !71, line: 1917, column: 2)
!1900 = !DILocation(line: 1919, column: 2, scope: !1899)
!1901 = !DILocation(line: 1922, column: 13, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1886, file: !71, line: 1921, column: 2)
!1903 = !DILocation(line: 1925, column: 5, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1868, file: !71, line: 1925, column: 5)
!1905 = !DILocation(line: 1925, column: 9, scope: !1904)
!1906 = !DILocation(line: 1925, column: 5, scope: !1868)
!1907 = !DILocation(line: 1927, column: 15, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1904, file: !71, line: 1926, column: 2)
!1909 = !DILocation(line: 1927, column: 14, scope: !1908)
!1910 = !DILocation(line: 1927, column: 12, scope: !1908)
!1911 = !DILocation(line: 1928, column: 2, scope: !1908)
!1912 = !DILocation(line: 1931, column: 14, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1904, file: !71, line: 1930, column: 2)
!1914 = !DILocation(line: 1931, column: 12, scope: !1913)
!1915 = !DILocation(line: 1934, column: 5, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1868, file: !71, line: 1934, column: 5)
!1917 = !DILocation(line: 1934, column: 9, scope: !1916)
!1918 = !DILocation(line: 1934, column: 5, scope: !1868)
!1919 = !DILocation(line: 1936, column: 15, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1916, file: !71, line: 1935, column: 2)
!1921 = !DILocation(line: 1936, column: 14, scope: !1920)
!1922 = !DILocation(line: 1936, column: 12, scope: !1920)
!1923 = !DILocation(line: 1937, column: 2, scope: !1920)
!1924 = !DILocation(line: 1940, column: 14, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1916, file: !71, line: 1939, column: 2)
!1926 = !DILocation(line: 1940, column: 12, scope: !1925)
!1927 = !DILocation(line: 1943, column: 13, scope: !1868)
!1928 = !DILocation(line: 1943, column: 24, scope: !1868)
!1929 = !DILocation(line: 1943, column: 22, scope: !1868)
!1930 = !DILocation(line: 1943, column: 11, scope: !1868)
!1931 = !DILocation(line: 1944, column: 25, scope: !1868)
!1932 = !DILocation(line: 1944, column: 35, scope: !1868)
!1933 = !DILocation(line: 1944, column: 13, scope: !1868)
!1934 = !DILocation(line: 1944, column: 11, scope: !1868)
!1935 = !DILocation(line: 1945, column: 13, scope: !1868)
!1936 = !DILocation(line: 1945, column: 22, scope: !1868)
!1937 = !DILocation(line: 1945, column: 11, scope: !1868)
!1938 = !DILocation(line: 1946, column: 14, scope: !1868)
!1939 = !DILocation(line: 1946, column: 23, scope: !1868)
!1940 = !DILocation(line: 1946, column: 11, scope: !1868)
!1941 = !DILocation(line: 1947, column: 5, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1868, file: !71, line: 1947, column: 5)
!1943 = !DILocation(line: 1947, column: 15, scope: !1942)
!1944 = !DILocation(line: 1947, column: 5, scope: !1868)
!1945 = !DILocation(line: 1949, column: 6, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1947, file: !71, line: 1949, column: 6)
!1947 = distinct !DILexicalBlock(scope: !1942, file: !71, line: 1948, column: 2)
!1948 = !DILocation(line: 1949, column: 14, scope: !1946)
!1949 = !DILocation(line: 1949, column: 6, scope: !1947)
!1950 = !DILocation(line: 1950, column: 11, scope: !1946)
!1951 = !DILocation(line: 1950, column: 4, scope: !1946)
!1952 = !DILocation(line: 1952, column: 4, scope: !1946)
!1953 = !DILocation(line: 1956, column: 11, scope: !1954)
!1954 = distinct !DILexicalBlock(scope: !1942, file: !71, line: 1955, column: 2)
!1955 = !DILocation(line: 1956, column: 10, scope: !1954)
!1956 = !DILocation(line: 1956, column: 3, scope: !1954)
!1957 = !DILocation(line: 1958, column: 1, scope: !1868)
!1958 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !71, file: !71, line: 1977, type: !1869, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1959 = !DILocalVariable(name: "val1", arg: 1, scope: !1958, file: !71, line: 1977, type: !79)
!1960 = !DILocation(line: 1977, column: 30, scope: !1958)
!1961 = !DILocalVariable(name: "val2", arg: 2, scope: !1958, file: !71, line: 1977, type: !13)
!1962 = !DILocation(line: 1977, column: 39, scope: !1958)
!1963 = !DILocalVariable(name: "u32Temp1", scope: !1958, file: !71, line: 1979, type: !735)
!1964 = !DILocation(line: 1979, column: 6, scope: !1958)
!1965 = !DILocalVariable(name: "u32Temp2", scope: !1958, file: !71, line: 1979, type: !735)
!1966 = !DILocation(line: 1979, column: 17, scope: !1958)
!1967 = !DILocalVariable(name: "u32Temp3", scope: !1958, file: !71, line: 1979, type: !735)
!1968 = !DILocation(line: 1979, column: 26, scope: !1958)
!1969 = !DILocalVariable(name: "u32Temp4", scope: !1958, file: !71, line: 1979, type: !735)
!1970 = !DILocation(line: 1979, column: 35, scope: !1958)
!1971 = !DILocalVariable(name: "u8SignBit", scope: !1958, file: !71, line: 1980, type: !17)
!1972 = !DILocation(line: 1980, column: 5, scope: !1958)
!1973 = !DILocation(line: 1982, column: 7, scope: !1974)
!1974 = distinct !DILexicalBlock(scope: !1958, file: !71, line: 1982, column: 5)
!1975 = !DILocation(line: 1982, column: 11, scope: !1974)
!1976 = !DILocation(line: 1982, column: 15, scope: !1974)
!1977 = !DILocation(line: 1982, column: 19, scope: !1974)
!1978 = !DILocation(line: 1982, column: 23, scope: !1974)
!1979 = !DILocation(line: 1982, column: 28, scope: !1974)
!1980 = !DILocation(line: 1982, column: 33, scope: !1974)
!1981 = !DILocation(line: 1982, column: 37, scope: !1974)
!1982 = !DILocation(line: 1982, column: 41, scope: !1974)
!1983 = !DILocation(line: 1982, column: 45, scope: !1974)
!1984 = !DILocation(line: 1982, column: 49, scope: !1974)
!1985 = !DILocation(line: 1982, column: 5, scope: !1958)
!1986 = !DILocation(line: 1984, column: 13, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1974, file: !71, line: 1983, column: 2)
!1988 = !DILocation(line: 1985, column: 2, scope: !1987)
!1989 = !DILocation(line: 1988, column: 13, scope: !1990)
!1990 = distinct !DILexicalBlock(scope: !1974, file: !71, line: 1987, column: 2)
!1991 = !DILocation(line: 1991, column: 5, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1958, file: !71, line: 1991, column: 5)
!1993 = !DILocation(line: 1991, column: 9, scope: !1992)
!1994 = !DILocation(line: 1991, column: 5, scope: !1958)
!1995 = !DILocation(line: 1994, column: 44, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1997, file: !71, line: 1994, column: 7)
!1997 = distinct !DILexicalBlock(scope: !1992, file: !71, line: 1992, column: 2)
!1998 = !DILocation(line: 1994, column: 34, scope: !1996)
!1999 = !DILocation(line: 1994, column: 9, scope: !1996)
!2000 = !DILocation(line: 1994, column: 7, scope: !1997)
!2001 = !DILocation(line: 1995, column: 7, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1996, file: !71, line: 1994, column: 53)
!2003 = !DILocation(line: 2002, column: 36, scope: !1997)
!2004 = !DILocation(line: 2002, column: 35, scope: !1997)
!2005 = !DILocation(line: 2002, column: 25, scope: !1997)
!2006 = !DILocation(line: 2002, column: 23, scope: !1997)
!2007 = !DILocation(line: 2003, column: 3, scope: !1997)
!2008 = !DILocation(line: 2007, column: 14, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !1992, file: !71, line: 2006, column: 2)
!2010 = !DILocation(line: 2007, column: 12, scope: !2009)
!2011 = !DILocation(line: 2010, column: 5, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !1958, file: !71, line: 2010, column: 5)
!2013 = !DILocation(line: 2010, column: 9, scope: !2012)
!2014 = !DILocation(line: 2010, column: 5, scope: !1958)
!2015 = !DILocation(line: 2012, column: 15, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !2012, file: !71, line: 2011, column: 2)
!2017 = !DILocation(line: 2012, column: 14, scope: !2016)
!2018 = !DILocation(line: 2012, column: 12, scope: !2016)
!2019 = !DILocation(line: 2013, column: 2, scope: !2016)
!2020 = !DILocation(line: 2016, column: 14, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2012, file: !71, line: 2015, column: 2)
!2022 = !DILocation(line: 2016, column: 12, scope: !2021)
!2023 = !DILocation(line: 2019, column: 13, scope: !1958)
!2024 = !DILocation(line: 2019, column: 24, scope: !1958)
!2025 = !DILocation(line: 2019, column: 22, scope: !1958)
!2026 = !DILocation(line: 2019, column: 11, scope: !1958)
!2027 = !DILocation(line: 2020, column: 25, scope: !1958)
!2028 = !DILocation(line: 2020, column: 35, scope: !1958)
!2029 = !DILocation(line: 2020, column: 13, scope: !1958)
!2030 = !DILocation(line: 2020, column: 11, scope: !1958)
!2031 = !DILocation(line: 2021, column: 13, scope: !1958)
!2032 = !DILocation(line: 2021, column: 22, scope: !1958)
!2033 = !DILocation(line: 2021, column: 11, scope: !1958)
!2034 = !DILocation(line: 2022, column: 14, scope: !1958)
!2035 = !DILocation(line: 2022, column: 23, scope: !1958)
!2036 = !DILocation(line: 2022, column: 11, scope: !1958)
!2037 = !DILocation(line: 2023, column: 6, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !1958, file: !71, line: 2023, column: 5)
!2039 = !DILocation(line: 2023, column: 14, scope: !2038)
!2040 = !DILocation(line: 2023, column: 19, scope: !2038)
!2041 = !DILocation(line: 2023, column: 5, scope: !1958)
!2042 = !DILocation(line: 2025, column: 6, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2044, file: !71, line: 2025, column: 6)
!2044 = distinct !DILexicalBlock(scope: !2038, file: !71, line: 2024, column: 2)
!2045 = !DILocation(line: 2025, column: 16, scope: !2043)
!2046 = !DILocation(line: 2025, column: 6, scope: !2044)
!2047 = !DILocation(line: 2027, column: 7, scope: !2048)
!2048 = distinct !DILexicalBlock(scope: !2049, file: !71, line: 2027, column: 7)
!2049 = distinct !DILexicalBlock(scope: !2043, file: !71, line: 2026, column: 3)
!2050 = !DILocation(line: 2027, column: 15, scope: !2048)
!2051 = !DILocation(line: 2027, column: 7, scope: !2049)
!2052 = !DILocation(line: 2028, column: 12, scope: !2048)
!2053 = !DILocation(line: 2028, column: 5, scope: !2048)
!2054 = !DILocation(line: 2030, column: 5, scope: !2048)
!2055 = !DILocation(line: 2034, column: 7, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2057, file: !71, line: 2034, column: 7)
!2057 = distinct !DILexicalBlock(scope: !2043, file: !71, line: 2033, column: 3)
!2058 = !DILocation(line: 2034, column: 15, scope: !2056)
!2059 = !DILocation(line: 2034, column: 7, scope: !2057)
!2060 = !DILocation(line: 2035, column: 13, scope: !2056)
!2061 = !DILocation(line: 2035, column: 12, scope: !2056)
!2062 = !DILocation(line: 2035, column: 5, scope: !2056)
!2063 = !DILocation(line: 2037, column: 5, scope: !2056)
!2064 = !DILocation(line: 2042, column: 3, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2038, file: !71, line: 2041, column: 2)
!2066 = !DILocation(line: 2044, column: 1, scope: !1958)
!2067 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !2068, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2068 = !DISubroutineType(types: !2069)
!2069 = !{!51, !26}
!2070 = !DILocalVariable(name: "value", arg: 1, scope: !2067, file: !30, line: 42, type: !26)
!2071 = !DILocation(line: 42, column: 38, scope: !2067)
!2072 = !DILocation(line: 44, column: 12, scope: !2067)
!2073 = !DILocation(line: 44, column: 18, scope: !2067)
!2074 = !DILocation(line: 44, column: 5, scope: !2067)
!2075 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !71, file: !71, line: 2059, type: !2076, scopeLine: 2060, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2076 = !DISubroutineType(types: !2077)
!2077 = !{!79, !79, !735}
!2078 = !DILocalVariable(name: "val1", arg: 1, scope: !2075, file: !71, line: 2059, type: !79)
!2079 = !DILocation(line: 2059, column: 30, scope: !2075)
!2080 = !DILocalVariable(name: "val2", arg: 2, scope: !2075, file: !71, line: 2059, type: !735)
!2081 = !DILocation(line: 2059, column: 39, scope: !2075)
!2082 = !DILocalVariable(name: "u32Temp1", scope: !2075, file: !71, line: 2061, type: !735)
!2083 = !DILocation(line: 2061, column: 6, scope: !2075)
!2084 = !DILocalVariable(name: "u32Temp2", scope: !2075, file: !71, line: 2061, type: !735)
!2085 = !DILocation(line: 2061, column: 17, scope: !2075)
!2086 = !DILocalVariable(name: "u8SignBit", scope: !2075, file: !71, line: 2062, type: !17)
!2087 = !DILocation(line: 2062, column: 5, scope: !2075)
!2088 = !DILocation(line: 2064, column: 5, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2075, file: !71, line: 2064, column: 5)
!2090 = !DILocation(line: 2064, column: 9, scope: !2089)
!2091 = !DILocation(line: 2064, column: 5, scope: !2075)
!2092 = !DILocation(line: 2066, column: 15, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2089, file: !71, line: 2065, column: 2)
!2094 = !DILocation(line: 2066, column: 14, scope: !2093)
!2095 = !DILocation(line: 2066, column: 12, scope: !2093)
!2096 = !DILocation(line: 2067, column: 13, scope: !2093)
!2097 = !DILocation(line: 2068, column: 2, scope: !2093)
!2098 = !DILocation(line: 2071, column: 14, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2089, file: !71, line: 2070, column: 2)
!2100 = !DILocation(line: 2071, column: 12, scope: !2099)
!2101 = !DILocation(line: 2072, column: 13, scope: !2099)
!2102 = !DILocation(line: 2075, column: 25, scope: !2075)
!2103 = !DILocation(line: 2075, column: 35, scope: !2075)
!2104 = !DILocation(line: 2075, column: 13, scope: !2075)
!2105 = !DILocation(line: 2075, column: 11, scope: !2075)
!2106 = !DILocation(line: 2076, column: 5, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2075, file: !71, line: 2076, column: 5)
!2108 = !DILocation(line: 2076, column: 15, scope: !2107)
!2109 = !DILocation(line: 2076, column: 5, scope: !2075)
!2110 = !DILocation(line: 2077, column: 10, scope: !2107)
!2111 = !DILocation(line: 2077, column: 3, scope: !2107)
!2112 = !DILocation(line: 2079, column: 11, scope: !2107)
!2113 = !DILocation(line: 2079, column: 10, scope: !2107)
!2114 = !DILocation(line: 2079, column: 3, scope: !2107)
!2115 = !DILocation(line: 2080, column: 1, scope: !2075)
!2116 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !71, file: !71, line: 2099, type: !2076, scopeLine: 2100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2117 = !DILocalVariable(name: "val1", arg: 1, scope: !2116, file: !71, line: 2099, type: !79)
!2118 = !DILocation(line: 2099, column: 30, scope: !2116)
!2119 = !DILocalVariable(name: "val2", arg: 2, scope: !2116, file: !71, line: 2099, type: !735)
!2120 = !DILocation(line: 2099, column: 39, scope: !2116)
!2121 = !DILocalVariable(name: "u32Temp1", scope: !2116, file: !71, line: 2101, type: !735)
!2122 = !DILocation(line: 2101, column: 6, scope: !2116)
!2123 = !DILocalVariable(name: "u32Temp2", scope: !2116, file: !71, line: 2101, type: !735)
!2124 = !DILocation(line: 2101, column: 17, scope: !2116)
!2125 = !DILocalVariable(name: "u32Temp3", scope: !2116, file: !71, line: 2101, type: !735)
!2126 = !DILocation(line: 2101, column: 26, scope: !2116)
!2127 = !DILocalVariable(name: "u8SignBit", scope: !2116, file: !71, line: 2102, type: !17)
!2128 = !DILocation(line: 2102, column: 5, scope: !2116)
!2129 = !DILocation(line: 2104, column: 5, scope: !2130)
!2130 = distinct !DILexicalBlock(scope: !2116, file: !71, line: 2104, column: 5)
!2131 = !DILocation(line: 2104, column: 9, scope: !2130)
!2132 = !DILocation(line: 2104, column: 5, scope: !2116)
!2133 = !DILocation(line: 2106, column: 15, scope: !2134)
!2134 = distinct !DILexicalBlock(scope: !2130, file: !71, line: 2105, column: 2)
!2135 = !DILocation(line: 2106, column: 14, scope: !2134)
!2136 = !DILocation(line: 2106, column: 12, scope: !2134)
!2137 = !DILocation(line: 2107, column: 13, scope: !2134)
!2138 = !DILocation(line: 2108, column: 2, scope: !2134)
!2139 = !DILocation(line: 2111, column: 14, scope: !2140)
!2140 = distinct !DILexicalBlock(scope: !2130, file: !71, line: 2110, column: 2)
!2141 = !DILocation(line: 2111, column: 12, scope: !2140)
!2142 = !DILocation(line: 2112, column: 13, scope: !2140)
!2143 = !DILocation(line: 2115, column: 13, scope: !2116)
!2144 = !DILocation(line: 2115, column: 24, scope: !2116)
!2145 = !DILocation(line: 2115, column: 22, scope: !2116)
!2146 = !DILocation(line: 2115, column: 11, scope: !2116)
!2147 = !DILocation(line: 2116, column: 25, scope: !2116)
!2148 = !DILocation(line: 2116, column: 35, scope: !2116)
!2149 = !DILocation(line: 2116, column: 13, scope: !2116)
!2150 = !DILocation(line: 2116, column: 11, scope: !2116)
!2151 = !DILocation(line: 2117, column: 13, scope: !2116)
!2152 = !DILocation(line: 2117, column: 22, scope: !2116)
!2153 = !DILocation(line: 2117, column: 11, scope: !2116)
!2154 = !DILocation(line: 2118, column: 14, scope: !2116)
!2155 = !DILocation(line: 2118, column: 23, scope: !2116)
!2156 = !DILocation(line: 2118, column: 11, scope: !2116)
!2157 = !DILocation(line: 2119, column: 5, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2116, file: !71, line: 2119, column: 5)
!2159 = !DILocation(line: 2119, column: 15, scope: !2158)
!2160 = !DILocation(line: 2119, column: 5, scope: !2116)
!2161 = !DILocation(line: 2121, column: 6, scope: !2162)
!2162 = distinct !DILexicalBlock(scope: !2163, file: !71, line: 2121, column: 6)
!2163 = distinct !DILexicalBlock(scope: !2158, file: !71, line: 2120, column: 2)
!2164 = !DILocation(line: 2121, column: 14, scope: !2162)
!2165 = !DILocation(line: 2121, column: 6, scope: !2163)
!2166 = !DILocation(line: 2122, column: 11, scope: !2162)
!2167 = !DILocation(line: 2122, column: 4, scope: !2162)
!2168 = !DILocation(line: 2124, column: 4, scope: !2162)
!2169 = !DILocation(line: 2128, column: 6, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2171, file: !71, line: 2128, column: 6)
!2171 = distinct !DILexicalBlock(scope: !2158, file: !71, line: 2127, column: 2)
!2172 = !DILocation(line: 2128, column: 14, scope: !2170)
!2173 = !DILocation(line: 2128, column: 6, scope: !2171)
!2174 = !DILocation(line: 2129, column: 12, scope: !2170)
!2175 = !DILocation(line: 2129, column: 11, scope: !2170)
!2176 = !DILocation(line: 2129, column: 4, scope: !2170)
!2177 = !DILocation(line: 2131, column: 4, scope: !2170)
!2178 = !DILocation(line: 2133, column: 1, scope: !2116)
!2179 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !71, file: !71, line: 2151, type: !2180, scopeLine: 2152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2180 = !DISubroutineType(types: !2181)
!2181 = !{!79, !79, !79}
!2182 = !DILocalVariable(name: "value", arg: 1, scope: !2179, file: !71, line: 2151, type: !79)
!2183 = !DILocation(line: 2151, column: 30, scope: !2179)
!2184 = !DILocalVariable(name: "factor", arg: 2, scope: !2179, file: !71, line: 2151, type: !79)
!2185 = !DILocation(line: 2151, column: 41, scope: !2179)
!2186 = !DILocalVariable(name: "u32Temp1", scope: !2179, file: !71, line: 2153, type: !735)
!2187 = !DILocation(line: 2153, column: 6, scope: !2179)
!2188 = !DILocalVariable(name: "u32Temp2", scope: !2179, file: !71, line: 2153, type: !735)
!2189 = !DILocation(line: 2153, column: 17, scope: !2179)
!2190 = !DILocalVariable(name: "u32Temp3", scope: !2179, file: !71, line: 2153, type: !735)
!2191 = !DILocation(line: 2153, column: 26, scope: !2179)
!2192 = !DILocalVariable(name: "u32Temp4", scope: !2179, file: !71, line: 2153, type: !735)
!2193 = !DILocation(line: 2153, column: 35, scope: !2179)
!2194 = !DILocalVariable(name: "u8SignBit", scope: !2179, file: !71, line: 2154, type: !17)
!2195 = !DILocation(line: 2154, column: 5, scope: !2179)
!2196 = !DILocation(line: 2156, column: 7, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2179, file: !71, line: 2156, column: 5)
!2198 = !DILocation(line: 2156, column: 12, scope: !2197)
!2199 = !DILocation(line: 2156, column: 16, scope: !2197)
!2200 = !DILocation(line: 2156, column: 36, scope: !2197)
!2201 = !DILocation(line: 2156, column: 41, scope: !2197)
!2202 = !DILocation(line: 2156, column: 45, scope: !2197)
!2203 = !DILocation(line: 2158, column: 13, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2197, file: !71, line: 2157, column: 2)
!2205 = !DILocation(line: 2159, column: 2, scope: !2204)
!2206 = !DILocation(line: 2162, column: 13, scope: !2207)
!2207 = distinct !DILexicalBlock(scope: !2197, file: !71, line: 2161, column: 2)
!2208 = !DILocation(line: 2165, column: 5, scope: !2209)
!2209 = distinct !DILexicalBlock(scope: !2179, file: !71, line: 2165, column: 5)
!2210 = !DILocation(line: 2165, column: 10, scope: !2209)
!2211 = !DILocation(line: 2165, column: 5, scope: !2179)
!2212 = !DILocation(line: 2167, column: 15, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2209, file: !71, line: 2166, column: 2)
!2214 = !DILocation(line: 2167, column: 14, scope: !2213)
!2215 = !DILocation(line: 2167, column: 12, scope: !2213)
!2216 = !DILocation(line: 2168, column: 2, scope: !2213)
!2217 = !DILocation(line: 2171, column: 14, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2209, file: !71, line: 2170, column: 2)
!2219 = !DILocation(line: 2171, column: 12, scope: !2218)
!2220 = !DILocation(line: 2174, column: 5, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2179, file: !71, line: 2174, column: 5)
!2222 = !DILocation(line: 2174, column: 11, scope: !2221)
!2223 = !DILocation(line: 2174, column: 5, scope: !2179)
!2224 = !DILocation(line: 2176, column: 15, scope: !2225)
!2225 = distinct !DILexicalBlock(scope: !2221, file: !71, line: 2175, column: 2)
!2226 = !DILocation(line: 2176, column: 14, scope: !2225)
!2227 = !DILocation(line: 2176, column: 12, scope: !2225)
!2228 = !DILocation(line: 2177, column: 2, scope: !2225)
!2229 = !DILocation(line: 2180, column: 14, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2221, file: !71, line: 2179, column: 2)
!2231 = !DILocation(line: 2180, column: 12, scope: !2230)
!2232 = !DILocation(line: 2183, column: 13, scope: !2179)
!2233 = !DILocation(line: 2183, column: 24, scope: !2179)
!2234 = !DILocation(line: 2183, column: 22, scope: !2179)
!2235 = !DILocation(line: 2183, column: 11, scope: !2179)
!2236 = !DILocation(line: 2184, column: 25, scope: !2179)
!2237 = !DILocation(line: 2184, column: 35, scope: !2179)
!2238 = !DILocation(line: 2184, column: 13, scope: !2179)
!2239 = !DILocation(line: 2184, column: 11, scope: !2179)
!2240 = !DILocation(line: 2185, column: 13, scope: !2179)
!2241 = !DILocation(line: 2185, column: 22, scope: !2179)
!2242 = !DILocation(line: 2185, column: 11, scope: !2179)
!2243 = !DILocation(line: 2186, column: 14, scope: !2179)
!2244 = !DILocation(line: 2186, column: 23, scope: !2179)
!2245 = !DILocation(line: 2186, column: 11, scope: !2179)
!2246 = !DILocation(line: 2187, column: 5, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2179, file: !71, line: 2187, column: 5)
!2248 = !DILocation(line: 2187, column: 15, scope: !2247)
!2249 = !DILocation(line: 2187, column: 5, scope: !2179)
!2250 = !DILocation(line: 2189, column: 6, scope: !2251)
!2251 = distinct !DILexicalBlock(scope: !2252, file: !71, line: 2189, column: 6)
!2252 = distinct !DILexicalBlock(scope: !2247, file: !71, line: 2188, column: 2)
!2253 = !DILocation(line: 2189, column: 14, scope: !2251)
!2254 = !DILocation(line: 2189, column: 6, scope: !2252)
!2255 = !DILocation(line: 2190, column: 11, scope: !2251)
!2256 = !DILocation(line: 2190, column: 4, scope: !2251)
!2257 = !DILocation(line: 2192, column: 4, scope: !2251)
!2258 = !DILocation(line: 2196, column: 11, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2247, file: !71, line: 2195, column: 2)
!2260 = !DILocation(line: 2196, column: 10, scope: !2259)
!2261 = !DILocation(line: 2196, column: 3, scope: !2259)
!2262 = !DILocation(line: 2198, column: 1, scope: !2179)
!2263 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !71, file: !71, line: 2217, type: !2180, scopeLine: 2218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2264 = !DILocalVariable(name: "value", arg: 1, scope: !2263, file: !71, line: 2217, type: !79)
!2265 = !DILocation(line: 2217, column: 30, scope: !2263)
!2266 = !DILocalVariable(name: "factor", arg: 2, scope: !2263, file: !71, line: 2217, type: !79)
!2267 = !DILocation(line: 2217, column: 41, scope: !2263)
!2268 = !DILocalVariable(name: "u32Temp1", scope: !2263, file: !71, line: 2219, type: !735)
!2269 = !DILocation(line: 2219, column: 6, scope: !2263)
!2270 = !DILocalVariable(name: "u32Temp2", scope: !2263, file: !71, line: 2219, type: !735)
!2271 = !DILocation(line: 2219, column: 17, scope: !2263)
!2272 = !DILocalVariable(name: "u32Temp3", scope: !2263, file: !71, line: 2219, type: !735)
!2273 = !DILocation(line: 2219, column: 26, scope: !2263)
!2274 = !DILocalVariable(name: "u32Temp4", scope: !2263, file: !71, line: 2219, type: !735)
!2275 = !DILocation(line: 2219, column: 35, scope: !2263)
!2276 = !DILocalVariable(name: "u8SignBit", scope: !2263, file: !71, line: 2220, type: !17)
!2277 = !DILocation(line: 2220, column: 5, scope: !2263)
!2278 = !DILocation(line: 2222, column: 7, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2263, file: !71, line: 2222, column: 5)
!2280 = !DILocation(line: 2222, column: 12, scope: !2279)
!2281 = !DILocation(line: 2222, column: 16, scope: !2279)
!2282 = !DILocation(line: 2222, column: 36, scope: !2279)
!2283 = !DILocation(line: 2222, column: 41, scope: !2279)
!2284 = !DILocation(line: 2222, column: 45, scope: !2279)
!2285 = !DILocation(line: 2224, column: 13, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2279, file: !71, line: 2223, column: 2)
!2287 = !DILocation(line: 2225, column: 2, scope: !2286)
!2288 = !DILocation(line: 2228, column: 13, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2279, file: !71, line: 2227, column: 2)
!2290 = !DILocation(line: 2231, column: 5, scope: !2291)
!2291 = distinct !DILexicalBlock(scope: !2263, file: !71, line: 2231, column: 5)
!2292 = !DILocation(line: 2231, column: 10, scope: !2291)
!2293 = !DILocation(line: 2231, column: 5, scope: !2263)
!2294 = !DILocation(line: 2233, column: 15, scope: !2295)
!2295 = distinct !DILexicalBlock(scope: !2291, file: !71, line: 2232, column: 2)
!2296 = !DILocation(line: 2233, column: 14, scope: !2295)
!2297 = !DILocation(line: 2233, column: 12, scope: !2295)
!2298 = !DILocation(line: 2234, column: 2, scope: !2295)
!2299 = !DILocation(line: 2237, column: 14, scope: !2300)
!2300 = distinct !DILexicalBlock(scope: !2291, file: !71, line: 2236, column: 2)
!2301 = !DILocation(line: 2237, column: 12, scope: !2300)
!2302 = !DILocation(line: 2240, column: 5, scope: !2303)
!2303 = distinct !DILexicalBlock(scope: !2263, file: !71, line: 2240, column: 5)
!2304 = !DILocation(line: 2240, column: 11, scope: !2303)
!2305 = !DILocation(line: 2240, column: 5, scope: !2263)
!2306 = !DILocation(line: 2242, column: 15, scope: !2307)
!2307 = distinct !DILexicalBlock(scope: !2303, file: !71, line: 2241, column: 2)
!2308 = !DILocation(line: 2242, column: 14, scope: !2307)
!2309 = !DILocation(line: 2242, column: 12, scope: !2307)
!2310 = !DILocation(line: 2243, column: 2, scope: !2307)
!2311 = !DILocation(line: 2246, column: 14, scope: !2312)
!2312 = distinct !DILexicalBlock(scope: !2303, file: !71, line: 2245, column: 2)
!2313 = !DILocation(line: 2246, column: 12, scope: !2312)
!2314 = !DILocation(line: 2249, column: 13, scope: !2263)
!2315 = !DILocation(line: 2249, column: 24, scope: !2263)
!2316 = !DILocation(line: 2249, column: 22, scope: !2263)
!2317 = !DILocation(line: 2249, column: 11, scope: !2263)
!2318 = !DILocation(line: 2250, column: 25, scope: !2263)
!2319 = !DILocation(line: 2250, column: 35, scope: !2263)
!2320 = !DILocation(line: 2250, column: 13, scope: !2263)
!2321 = !DILocation(line: 2250, column: 11, scope: !2263)
!2322 = !DILocation(line: 2251, column: 13, scope: !2263)
!2323 = !DILocation(line: 2251, column: 22, scope: !2263)
!2324 = !DILocation(line: 2251, column: 11, scope: !2263)
!2325 = !DILocation(line: 2252, column: 14, scope: !2263)
!2326 = !DILocation(line: 2252, column: 23, scope: !2263)
!2327 = !DILocation(line: 2252, column: 11, scope: !2263)
!2328 = !DILocation(line: 2253, column: 6, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2263, file: !71, line: 2253, column: 5)
!2330 = !DILocation(line: 2253, column: 14, scope: !2329)
!2331 = !DILocation(line: 2253, column: 19, scope: !2329)
!2332 = !DILocation(line: 2253, column: 5, scope: !2263)
!2333 = !DILocation(line: 2255, column: 6, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2335, file: !71, line: 2255, column: 6)
!2335 = distinct !DILexicalBlock(scope: !2329, file: !71, line: 2254, column: 2)
!2336 = !DILocation(line: 2255, column: 16, scope: !2334)
!2337 = !DILocation(line: 2255, column: 6, scope: !2335)
!2338 = !DILocation(line: 2257, column: 7, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2340, file: !71, line: 2257, column: 7)
!2340 = distinct !DILexicalBlock(scope: !2334, file: !71, line: 2256, column: 3)
!2341 = !DILocation(line: 2257, column: 15, scope: !2339)
!2342 = !DILocation(line: 2257, column: 7, scope: !2340)
!2343 = !DILocation(line: 2258, column: 12, scope: !2339)
!2344 = !DILocation(line: 2258, column: 5, scope: !2339)
!2345 = !DILocation(line: 2260, column: 5, scope: !2339)
!2346 = !DILocation(line: 2264, column: 7, scope: !2347)
!2347 = distinct !DILexicalBlock(scope: !2348, file: !71, line: 2264, column: 7)
!2348 = distinct !DILexicalBlock(scope: !2334, file: !71, line: 2263, column: 3)
!2349 = !DILocation(line: 2264, column: 15, scope: !2347)
!2350 = !DILocation(line: 2264, column: 7, scope: !2348)
!2351 = !DILocation(line: 2265, column: 13, scope: !2347)
!2352 = !DILocation(line: 2265, column: 12, scope: !2347)
!2353 = !DILocation(line: 2265, column: 5, scope: !2347)
!2354 = !DILocation(line: 2267, column: 5, scope: !2347)
!2355 = !DILocation(line: 2272, column: 4, scope: !2356)
!2356 = distinct !DILexicalBlock(scope: !2329, file: !71, line: 2271, column: 2)
!2357 = !DILocation(line: 2274, column: 1, scope: !2263)
!2358 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !71, file: !71, line: 2292, type: !2359, scopeLine: 2293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2359 = !DISubroutineType(types: !2360)
!2360 = !{!79, !79, !17}
!2361 = !DILocalVariable(name: "value", arg: 1, scope: !2358, file: !71, line: 2292, type: !79)
!2362 = !DILocation(line: 2292, column: 29, scope: !2358)
!2363 = !DILocalVariable(name: "factor", arg: 2, scope: !2358, file: !71, line: 2292, type: !17)
!2364 = !DILocation(line: 2292, column: 39, scope: !2358)
!2365 = !DILocalVariable(name: "u32Temp1", scope: !2358, file: !71, line: 2294, type: !735)
!2366 = !DILocation(line: 2294, column: 6, scope: !2358)
!2367 = !DILocalVariable(name: "u32Temp2", scope: !2358, file: !71, line: 2294, type: !735)
!2368 = !DILocation(line: 2294, column: 17, scope: !2358)
!2369 = !DILocalVariable(name: "u32Temp3", scope: !2358, file: !71, line: 2294, type: !735)
!2370 = !DILocation(line: 2294, column: 26, scope: !2358)
!2371 = !DILocalVariable(name: "u8SignBit", scope: !2358, file: !71, line: 2295, type: !17)
!2372 = !DILocation(line: 2295, column: 5, scope: !2358)
!2373 = !DILocation(line: 2297, column: 5, scope: !2374)
!2374 = distinct !DILexicalBlock(scope: !2358, file: !71, line: 2297, column: 5)
!2375 = !DILocation(line: 2297, column: 10, scope: !2374)
!2376 = !DILocation(line: 2297, column: 5, scope: !2358)
!2377 = !DILocation(line: 2299, column: 15, scope: !2378)
!2378 = distinct !DILexicalBlock(scope: !2374, file: !71, line: 2298, column: 2)
!2379 = !DILocation(line: 2299, column: 14, scope: !2378)
!2380 = !DILocation(line: 2299, column: 12, scope: !2378)
!2381 = !DILocation(line: 2300, column: 13, scope: !2378)
!2382 = !DILocation(line: 2301, column: 2, scope: !2378)
!2383 = !DILocation(line: 2304, column: 14, scope: !2384)
!2384 = distinct !DILexicalBlock(scope: !2374, file: !71, line: 2303, column: 2)
!2385 = !DILocation(line: 2304, column: 12, scope: !2384)
!2386 = !DILocation(line: 2305, column: 13, scope: !2384)
!2387 = !DILocation(line: 2308, column: 13, scope: !2358)
!2388 = !DILocation(line: 2308, column: 24, scope: !2358)
!2389 = !DILocation(line: 2308, column: 22, scope: !2358)
!2390 = !DILocation(line: 2308, column: 11, scope: !2358)
!2391 = !DILocation(line: 2309, column: 25, scope: !2358)
!2392 = !DILocation(line: 2309, column: 35, scope: !2358)
!2393 = !DILocation(line: 2309, column: 13, scope: !2358)
!2394 = !DILocation(line: 2309, column: 11, scope: !2358)
!2395 = !DILocation(line: 2310, column: 13, scope: !2358)
!2396 = !DILocation(line: 2310, column: 22, scope: !2358)
!2397 = !DILocation(line: 2310, column: 11, scope: !2358)
!2398 = !DILocation(line: 2311, column: 14, scope: !2358)
!2399 = !DILocation(line: 2311, column: 23, scope: !2358)
!2400 = !DILocation(line: 2311, column: 11, scope: !2358)
!2401 = !DILocation(line: 2312, column: 5, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2358, file: !71, line: 2312, column: 5)
!2403 = !DILocation(line: 2312, column: 15, scope: !2402)
!2404 = !DILocation(line: 2312, column: 5, scope: !2358)
!2405 = !DILocation(line: 2314, column: 10, scope: !2406)
!2406 = distinct !DILexicalBlock(scope: !2402, file: !71, line: 2313, column: 2)
!2407 = !DILocation(line: 2314, column: 3, scope: !2406)
!2408 = !DILocation(line: 2318, column: 11, scope: !2409)
!2409 = distinct !DILexicalBlock(scope: !2402, file: !71, line: 2317, column: 2)
!2410 = !DILocation(line: 2318, column: 10, scope: !2409)
!2411 = !DILocation(line: 2318, column: 3, scope: !2409)
!2412 = !DILocation(line: 2320, column: 1, scope: !2358)
!2413 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !71, file: !71, line: 2339, type: !2359, scopeLine: 2340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2414 = !DILocalVariable(name: "value", arg: 1, scope: !2413, file: !71, line: 2339, type: !79)
!2415 = !DILocation(line: 2339, column: 29, scope: !2413)
!2416 = !DILocalVariable(name: "factor", arg: 2, scope: !2413, file: !71, line: 2339, type: !17)
!2417 = !DILocation(line: 2339, column: 39, scope: !2413)
!2418 = !DILocalVariable(name: "u32Temp1", scope: !2413, file: !71, line: 2341, type: !735)
!2419 = !DILocation(line: 2341, column: 6, scope: !2413)
!2420 = !DILocalVariable(name: "u32Temp2", scope: !2413, file: !71, line: 2341, type: !735)
!2421 = !DILocation(line: 2341, column: 17, scope: !2413)
!2422 = !DILocalVariable(name: "u32Temp3", scope: !2413, file: !71, line: 2341, type: !735)
!2423 = !DILocation(line: 2341, column: 26, scope: !2413)
!2424 = !DILocalVariable(name: "u8SignBit", scope: !2413, file: !71, line: 2342, type: !17)
!2425 = !DILocation(line: 2342, column: 5, scope: !2413)
!2426 = !DILocation(line: 2344, column: 5, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2413, file: !71, line: 2344, column: 5)
!2428 = !DILocation(line: 2344, column: 10, scope: !2427)
!2429 = !DILocation(line: 2344, column: 5, scope: !2413)
!2430 = !DILocation(line: 2346, column: 15, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2427, file: !71, line: 2345, column: 2)
!2432 = !DILocation(line: 2346, column: 14, scope: !2431)
!2433 = !DILocation(line: 2346, column: 12, scope: !2431)
!2434 = !DILocation(line: 2347, column: 13, scope: !2431)
!2435 = !DILocation(line: 2348, column: 2, scope: !2431)
!2436 = !DILocation(line: 2351, column: 14, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2427, file: !71, line: 2350, column: 2)
!2438 = !DILocation(line: 2351, column: 12, scope: !2437)
!2439 = !DILocation(line: 2352, column: 13, scope: !2437)
!2440 = !DILocation(line: 2355, column: 13, scope: !2413)
!2441 = !DILocation(line: 2355, column: 24, scope: !2413)
!2442 = !DILocation(line: 2355, column: 22, scope: !2413)
!2443 = !DILocation(line: 2355, column: 11, scope: !2413)
!2444 = !DILocation(line: 2356, column: 25, scope: !2413)
!2445 = !DILocation(line: 2356, column: 35, scope: !2413)
!2446 = !DILocation(line: 2356, column: 13, scope: !2413)
!2447 = !DILocation(line: 2356, column: 11, scope: !2413)
!2448 = !DILocation(line: 2357, column: 13, scope: !2413)
!2449 = !DILocation(line: 2357, column: 22, scope: !2413)
!2450 = !DILocation(line: 2357, column: 11, scope: !2413)
!2451 = !DILocation(line: 2358, column: 14, scope: !2413)
!2452 = !DILocation(line: 2358, column: 23, scope: !2413)
!2453 = !DILocation(line: 2358, column: 11, scope: !2413)
!2454 = !DILocation(line: 2359, column: 5, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2413, file: !71, line: 2359, column: 5)
!2456 = !DILocation(line: 2359, column: 15, scope: !2455)
!2457 = !DILocation(line: 2359, column: 5, scope: !2413)
!2458 = !DILocation(line: 2361, column: 6, scope: !2459)
!2459 = distinct !DILexicalBlock(scope: !2460, file: !71, line: 2361, column: 6)
!2460 = distinct !DILexicalBlock(scope: !2455, file: !71, line: 2360, column: 2)
!2461 = !DILocation(line: 2361, column: 14, scope: !2459)
!2462 = !DILocation(line: 2361, column: 6, scope: !2460)
!2463 = !DILocation(line: 2362, column: 11, scope: !2459)
!2464 = !DILocation(line: 2362, column: 4, scope: !2459)
!2465 = !DILocation(line: 2364, column: 4, scope: !2459)
!2466 = !DILocation(line: 2368, column: 6, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2468, file: !71, line: 2368, column: 6)
!2468 = distinct !DILexicalBlock(scope: !2455, file: !71, line: 2367, column: 2)
!2469 = !DILocation(line: 2368, column: 14, scope: !2467)
!2470 = !DILocation(line: 2368, column: 6, scope: !2468)
!2471 = !DILocation(line: 2369, column: 12, scope: !2467)
!2472 = !DILocation(line: 2369, column: 11, scope: !2467)
!2473 = !DILocation(line: 2369, column: 4, scope: !2467)
!2474 = !DILocation(line: 2371, column: 4, scope: !2467)
!2475 = !DILocation(line: 2373, column: 1, scope: !2413)
!2476 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !71, file: !71, line: 2390, type: !2477, scopeLine: 2391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2477 = !DISubroutineType(types: !2478)
!2478 = !{!735, !735, !735, !17}
!2479 = !DILocalVariable(name: "value", arg: 1, scope: !2476, file: !71, line: 2390, type: !735)
!2480 = !DILocation(line: 2390, column: 39, scope: !2476)
!2481 = !DILocalVariable(name: "factor", arg: 2, scope: !2476, file: !71, line: 2390, type: !735)
!2482 = !DILocation(line: 2390, column: 49, scope: !2476)
!2483 = !DILocalVariable(name: "power", arg: 3, scope: !2476, file: !71, line: 2390, type: !17)
!2484 = !DILocation(line: 2390, column: 60, scope: !2476)
!2485 = !DILocalVariable(name: "u32Temp1", scope: !2476, file: !71, line: 2392, type: !735)
!2486 = !DILocation(line: 2392, column: 6, scope: !2476)
!2487 = !DILocalVariable(name: "u32Temp2", scope: !2476, file: !71, line: 2392, type: !735)
!2488 = !DILocation(line: 2392, column: 20, scope: !2476)
!2489 = !DILocation(line: 2393, column: 5, scope: !2490)
!2490 = distinct !DILexicalBlock(scope: !2476, file: !71, line: 2393, column: 5)
!2491 = !DILocation(line: 2393, column: 10, scope: !2490)
!2492 = !DILocation(line: 2393, column: 5, scope: !2476)
!2493 = !DILocation(line: 2395, column: 9, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2490, file: !71, line: 2394, column: 2)
!2495 = !DILocation(line: 2396, column: 2, scope: !2494)
!2496 = !DILocation(line: 2397, column: 10, scope: !2497)
!2497 = distinct !DILexicalBlock(scope: !2490, file: !71, line: 2397, column: 10)
!2498 = !DILocation(line: 2397, column: 15, scope: !2497)
!2499 = !DILocation(line: 2397, column: 10, scope: !2490)
!2500 = !DILocation(line: 2399, column: 9, scope: !2501)
!2501 = distinct !DILexicalBlock(scope: !2497, file: !71, line: 2398, column: 2)
!2502 = !DILocation(line: 2400, column: 2, scope: !2501)
!2503 = !DILocation(line: 2405, column: 13, scope: !2476)
!2504 = !DILocation(line: 2405, column: 21, scope: !2476)
!2505 = !DILocation(line: 2405, column: 19, scope: !2476)
!2506 = !DILocation(line: 2405, column: 11, scope: !2476)
!2507 = !DILocation(line: 2406, column: 25, scope: !2476)
!2508 = !DILocation(line: 2406, column: 32, scope: !2476)
!2509 = !DILocation(line: 2406, column: 13, scope: !2476)
!2510 = !DILocation(line: 2406, column: 11, scope: !2476)
!2511 = !DILocation(line: 2407, column: 13, scope: !2476)
!2512 = !DILocation(line: 2407, column: 29, scope: !2476)
!2513 = !DILocation(line: 2407, column: 28, scope: !2476)
!2514 = !DILocation(line: 2407, column: 22, scope: !2476)
!2515 = !DILocation(line: 2407, column: 11, scope: !2476)
!2516 = !DILocation(line: 2408, column: 14, scope: !2476)
!2517 = !DILocation(line: 2408, column: 26, scope: !2476)
!2518 = !DILocation(line: 2408, column: 23, scope: !2476)
!2519 = !DILocation(line: 2408, column: 11, scope: !2476)
!2520 = !DILocation(line: 2409, column: 6, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2476, file: !71, line: 2409, column: 5)
!2522 = !DILocation(line: 2409, column: 20, scope: !2521)
!2523 = !DILocation(line: 2409, column: 19, scope: !2521)
!2524 = !DILocation(line: 2409, column: 14, scope: !2521)
!2525 = !DILocation(line: 2409, column: 28, scope: !2521)
!2526 = !DILocation(line: 2409, column: 5, scope: !2476)
!2527 = !DILocation(line: 2411, column: 10, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2521, file: !71, line: 2410, column: 2)
!2529 = !DILocation(line: 2411, column: 3, scope: !2528)
!2530 = !DILocation(line: 2415, column: 3, scope: !2531)
!2531 = distinct !DILexicalBlock(scope: !2521, file: !71, line: 2414, column: 2)
!2532 = !DILocation(line: 2417, column: 1, scope: !2476)
!2533 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !71, file: !71, line: 2435, type: !2534, scopeLine: 2436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2534 = !DISubroutineType(types: !2535)
!2535 = !{!79, !79, !79, !17}
!2536 = !DILocalVariable(name: "value", arg: 1, scope: !2533, file: !71, line: 2435, type: !79)
!2537 = !DILocation(line: 2435, column: 39, scope: !2533)
!2538 = !DILocalVariable(name: "factor", arg: 2, scope: !2533, file: !71, line: 2435, type: !79)
!2539 = !DILocation(line: 2435, column: 50, scope: !2533)
!2540 = !DILocalVariable(name: "power", arg: 3, scope: !2533, file: !71, line: 2435, type: !17)
!2541 = !DILocation(line: 2435, column: 61, scope: !2533)
!2542 = !DILocalVariable(name: "u32Temp1", scope: !2533, file: !71, line: 2437, type: !735)
!2543 = !DILocation(line: 2437, column: 6, scope: !2533)
!2544 = !DILocalVariable(name: "u32Temp2", scope: !2533, file: !71, line: 2437, type: !735)
!2545 = !DILocation(line: 2437, column: 17, scope: !2533)
!2546 = !DILocalVariable(name: "u32Temp3", scope: !2533, file: !71, line: 2437, type: !735)
!2547 = !DILocation(line: 2437, column: 26, scope: !2533)
!2548 = !DILocalVariable(name: "u32Temp4", scope: !2533, file: !71, line: 2437, type: !735)
!2549 = !DILocation(line: 2437, column: 35, scope: !2533)
!2550 = !DILocalVariable(name: "u8SignBit", scope: !2533, file: !71, line: 2438, type: !17)
!2551 = !DILocation(line: 2438, column: 5, scope: !2533)
!2552 = !DILocation(line: 2440, column: 5, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2533, file: !71, line: 2440, column: 5)
!2554 = !DILocation(line: 2440, column: 10, scope: !2553)
!2555 = !DILocation(line: 2440, column: 5, scope: !2533)
!2556 = !DILocation(line: 2442, column: 9, scope: !2557)
!2557 = distinct !DILexicalBlock(scope: !2553, file: !71, line: 2441, column: 2)
!2558 = !DILocation(line: 2443, column: 2, scope: !2557)
!2559 = !DILocation(line: 2444, column: 10, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2553, file: !71, line: 2444, column: 10)
!2561 = !DILocation(line: 2444, column: 15, scope: !2560)
!2562 = !DILocation(line: 2444, column: 10, scope: !2553)
!2563 = !DILocation(line: 2446, column: 9, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2560, file: !71, line: 2445, column: 2)
!2565 = !DILocation(line: 2447, column: 2, scope: !2564)
!2566 = !DILocation(line: 2453, column: 7, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2533, file: !71, line: 2453, column: 5)
!2568 = !DILocation(line: 2453, column: 12, scope: !2567)
!2569 = !DILocation(line: 2453, column: 16, scope: !2567)
!2570 = !DILocation(line: 2453, column: 36, scope: !2567)
!2571 = !DILocation(line: 2453, column: 41, scope: !2567)
!2572 = !DILocation(line: 2453, column: 45, scope: !2567)
!2573 = !DILocation(line: 2455, column: 13, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2567, file: !71, line: 2454, column: 2)
!2575 = !DILocation(line: 2456, column: 2, scope: !2574)
!2576 = !DILocation(line: 2459, column: 13, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2567, file: !71, line: 2458, column: 2)
!2578 = !DILocation(line: 2462, column: 5, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2533, file: !71, line: 2462, column: 5)
!2580 = !DILocation(line: 2462, column: 10, scope: !2579)
!2581 = !DILocation(line: 2462, column: 5, scope: !2533)
!2582 = !DILocation(line: 2464, column: 15, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2579, file: !71, line: 2463, column: 2)
!2584 = !DILocation(line: 2464, column: 14, scope: !2583)
!2585 = !DILocation(line: 2464, column: 12, scope: !2583)
!2586 = !DILocation(line: 2465, column: 2, scope: !2583)
!2587 = !DILocation(line: 2468, column: 14, scope: !2588)
!2588 = distinct !DILexicalBlock(scope: !2579, file: !71, line: 2467, column: 2)
!2589 = !DILocation(line: 2468, column: 12, scope: !2588)
!2590 = !DILocation(line: 2471, column: 5, scope: !2591)
!2591 = distinct !DILexicalBlock(scope: !2533, file: !71, line: 2471, column: 5)
!2592 = !DILocation(line: 2471, column: 11, scope: !2591)
!2593 = !DILocation(line: 2471, column: 5, scope: !2533)
!2594 = !DILocation(line: 2473, column: 15, scope: !2595)
!2595 = distinct !DILexicalBlock(scope: !2591, file: !71, line: 2472, column: 2)
!2596 = !DILocation(line: 2473, column: 14, scope: !2595)
!2597 = !DILocation(line: 2473, column: 12, scope: !2595)
!2598 = !DILocation(line: 2474, column: 2, scope: !2595)
!2599 = !DILocation(line: 2477, column: 14, scope: !2600)
!2600 = distinct !DILexicalBlock(scope: !2591, file: !71, line: 2476, column: 2)
!2601 = !DILocation(line: 2477, column: 12, scope: !2600)
!2602 = !DILocation(line: 2480, column: 13, scope: !2533)
!2603 = !DILocation(line: 2480, column: 24, scope: !2533)
!2604 = !DILocation(line: 2480, column: 22, scope: !2533)
!2605 = !DILocation(line: 2480, column: 11, scope: !2533)
!2606 = !DILocation(line: 2481, column: 25, scope: !2533)
!2607 = !DILocation(line: 2481, column: 35, scope: !2533)
!2608 = !DILocation(line: 2481, column: 13, scope: !2533)
!2609 = !DILocation(line: 2481, column: 11, scope: !2533)
!2610 = !DILocation(line: 2482, column: 13, scope: !2533)
!2611 = !DILocation(line: 2482, column: 29, scope: !2533)
!2612 = !DILocation(line: 2482, column: 28, scope: !2533)
!2613 = !DILocation(line: 2482, column: 22, scope: !2533)
!2614 = !DILocation(line: 2482, column: 11, scope: !2533)
!2615 = !DILocation(line: 2483, column: 14, scope: !2533)
!2616 = !DILocation(line: 2483, column: 26, scope: !2533)
!2617 = !DILocation(line: 2483, column: 23, scope: !2533)
!2618 = !DILocation(line: 2483, column: 11, scope: !2533)
!2619 = !DILocation(line: 2484, column: 6, scope: !2620)
!2620 = distinct !DILexicalBlock(scope: !2533, file: !71, line: 2484, column: 5)
!2621 = !DILocation(line: 2484, column: 20, scope: !2620)
!2622 = !DILocation(line: 2484, column: 19, scope: !2620)
!2623 = !DILocation(line: 2484, column: 14, scope: !2620)
!2624 = !DILocation(line: 2484, column: 27, scope: !2620)
!2625 = !DILocation(line: 2484, column: 5, scope: !2533)
!2626 = !DILocation(line: 2486, column: 6, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2628, file: !71, line: 2486, column: 6)
!2628 = distinct !DILexicalBlock(scope: !2620, file: !71, line: 2485, column: 2)
!2629 = !DILocation(line: 2486, column: 16, scope: !2627)
!2630 = !DILocation(line: 2486, column: 6, scope: !2628)
!2631 = !DILocation(line: 2488, column: 7, scope: !2632)
!2632 = distinct !DILexicalBlock(scope: !2633, file: !71, line: 2488, column: 7)
!2633 = distinct !DILexicalBlock(scope: !2627, file: !71, line: 2487, column: 3)
!2634 = !DILocation(line: 2488, column: 15, scope: !2632)
!2635 = !DILocation(line: 2488, column: 7, scope: !2633)
!2636 = !DILocation(line: 2489, column: 12, scope: !2632)
!2637 = !DILocation(line: 2489, column: 5, scope: !2632)
!2638 = !DILocation(line: 2491, column: 5, scope: !2632)
!2639 = !DILocation(line: 2495, column: 12, scope: !2640)
!2640 = distinct !DILexicalBlock(scope: !2627, file: !71, line: 2494, column: 3)
!2641 = !DILocation(line: 2495, column: 11, scope: !2640)
!2642 = !DILocation(line: 2495, column: 4, scope: !2640)
!2643 = !DILocation(line: 2500, column: 6, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2645, file: !71, line: 2500, column: 6)
!2645 = distinct !DILexicalBlock(scope: !2620, file: !71, line: 2499, column: 2)
!2646 = !DILocation(line: 2500, column: 16, scope: !2644)
!2647 = !DILocation(line: 2500, column: 6, scope: !2645)
!2648 = !DILocation(line: 2502, column: 4, scope: !2649)
!2649 = distinct !DILexicalBlock(scope: !2644, file: !71, line: 2501, column: 3)
!2650 = !DILocation(line: 2506, column: 4, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2644, file: !71, line: 2505, column: 3)
!2652 = !DILocation(line: 2509, column: 1, scope: !2533)
!2653 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !71, file: !71, line: 2528, type: !2654, scopeLine: 2529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2654 = !DISubroutineType(types: !2655)
!2655 = !{!79, !79, !6}
!2656 = !DILocalVariable(name: "value", arg: 1, scope: !2653, file: !71, line: 2528, type: !79)
!2657 = !DILocation(line: 2528, column: 29, scope: !2653)
!2658 = !DILocalVariable(name: "factor", arg: 2, scope: !2653, file: !71, line: 2528, type: !6)
!2659 = !DILocation(line: 2528, column: 39, scope: !2653)
!2660 = !DILocalVariable(name: "u32Temp1", scope: !2653, file: !71, line: 2530, type: !735)
!2661 = !DILocation(line: 2530, column: 6, scope: !2653)
!2662 = !DILocalVariable(name: "u32Temp2", scope: !2653, file: !71, line: 2530, type: !735)
!2663 = !DILocation(line: 2530, column: 17, scope: !2653)
!2664 = !DILocalVariable(name: "u32Temp3", scope: !2653, file: !71, line: 2530, type: !735)
!2665 = !DILocation(line: 2530, column: 26, scope: !2653)
!2666 = !DILocalVariable(name: "u32Temp4", scope: !2653, file: !71, line: 2530, type: !735)
!2667 = !DILocation(line: 2530, column: 35, scope: !2653)
!2668 = !DILocalVariable(name: "u8SignBit", scope: !2653, file: !71, line: 2531, type: !17)
!2669 = !DILocation(line: 2531, column: 5, scope: !2653)
!2670 = !DILocation(line: 2533, column: 7, scope: !2671)
!2671 = distinct !DILexicalBlock(scope: !2653, file: !71, line: 2533, column: 5)
!2672 = !DILocation(line: 2533, column: 12, scope: !2671)
!2673 = !DILocation(line: 2533, column: 16, scope: !2671)
!2674 = !DILocation(line: 2533, column: 20, scope: !2671)
!2675 = !DILocation(line: 2533, column: 26, scope: !2671)
!2676 = !DILocation(line: 2533, column: 31, scope: !2671)
!2677 = !DILocation(line: 2533, column: 36, scope: !2671)
!2678 = !DILocation(line: 2533, column: 41, scope: !2671)
!2679 = !DILocation(line: 2533, column: 45, scope: !2671)
!2680 = !DILocation(line: 2533, column: 49, scope: !2671)
!2681 = !DILocation(line: 2533, column: 55, scope: !2671)
!2682 = !DILocation(line: 2533, column: 5, scope: !2653)
!2683 = !DILocation(line: 2535, column: 13, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2671, file: !71, line: 2534, column: 2)
!2685 = !DILocation(line: 2536, column: 2, scope: !2684)
!2686 = !DILocation(line: 2539, column: 13, scope: !2687)
!2687 = distinct !DILexicalBlock(scope: !2671, file: !71, line: 2538, column: 2)
!2688 = !DILocation(line: 2542, column: 5, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2653, file: !71, line: 2542, column: 5)
!2690 = !DILocation(line: 2542, column: 10, scope: !2689)
!2691 = !DILocation(line: 2542, column: 5, scope: !2653)
!2692 = !DILocation(line: 2544, column: 15, scope: !2693)
!2693 = distinct !DILexicalBlock(scope: !2689, file: !71, line: 2543, column: 2)
!2694 = !DILocation(line: 2544, column: 14, scope: !2693)
!2695 = !DILocation(line: 2544, column: 12, scope: !2693)
!2696 = !DILocation(line: 2545, column: 2, scope: !2693)
!2697 = !DILocation(line: 2548, column: 14, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2689, file: !71, line: 2547, column: 2)
!2699 = !DILocation(line: 2548, column: 12, scope: !2698)
!2700 = !DILocation(line: 2551, column: 5, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2653, file: !71, line: 2551, column: 5)
!2702 = !DILocation(line: 2551, column: 11, scope: !2701)
!2703 = !DILocation(line: 2551, column: 5, scope: !2653)
!2704 = !DILocation(line: 2553, column: 15, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2701, file: !71, line: 2552, column: 2)
!2706 = !DILocation(line: 2553, column: 14, scope: !2705)
!2707 = !DILocation(line: 2553, column: 12, scope: !2705)
!2708 = !DILocation(line: 2554, column: 2, scope: !2705)
!2709 = !DILocation(line: 2557, column: 14, scope: !2710)
!2710 = distinct !DILexicalBlock(scope: !2701, file: !71, line: 2556, column: 2)
!2711 = !DILocation(line: 2557, column: 12, scope: !2710)
!2712 = !DILocation(line: 2560, column: 13, scope: !2653)
!2713 = !DILocation(line: 2560, column: 24, scope: !2653)
!2714 = !DILocation(line: 2560, column: 22, scope: !2653)
!2715 = !DILocation(line: 2560, column: 11, scope: !2653)
!2716 = !DILocation(line: 2561, column: 25, scope: !2653)
!2717 = !DILocation(line: 2561, column: 35, scope: !2653)
!2718 = !DILocation(line: 2561, column: 13, scope: !2653)
!2719 = !DILocation(line: 2561, column: 11, scope: !2653)
!2720 = !DILocation(line: 2562, column: 13, scope: !2653)
!2721 = !DILocation(line: 2562, column: 22, scope: !2653)
!2722 = !DILocation(line: 2562, column: 11, scope: !2653)
!2723 = !DILocation(line: 2563, column: 14, scope: !2653)
!2724 = !DILocation(line: 2563, column: 23, scope: !2653)
!2725 = !DILocation(line: 2563, column: 11, scope: !2653)
!2726 = !DILocation(line: 2564, column: 5, scope: !2727)
!2727 = distinct !DILexicalBlock(scope: !2653, file: !71, line: 2564, column: 5)
!2728 = !DILocation(line: 2564, column: 15, scope: !2727)
!2729 = !DILocation(line: 2564, column: 5, scope: !2653)
!2730 = !DILocation(line: 2566, column: 6, scope: !2731)
!2731 = distinct !DILexicalBlock(scope: !2732, file: !71, line: 2566, column: 6)
!2732 = distinct !DILexicalBlock(scope: !2727, file: !71, line: 2565, column: 2)
!2733 = !DILocation(line: 2566, column: 14, scope: !2731)
!2734 = !DILocation(line: 2566, column: 6, scope: !2732)
!2735 = !DILocation(line: 2567, column: 11, scope: !2731)
!2736 = !DILocation(line: 2567, column: 4, scope: !2731)
!2737 = !DILocation(line: 2569, column: 4, scope: !2731)
!2738 = !DILocation(line: 2573, column: 11, scope: !2739)
!2739 = distinct !DILexicalBlock(scope: !2727, file: !71, line: 2572, column: 2)
!2740 = !DILocation(line: 2573, column: 10, scope: !2739)
!2741 = !DILocation(line: 2573, column: 3, scope: !2739)
!2742 = !DILocation(line: 2575, column: 1, scope: !2653)
!2743 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !71, file: !71, line: 2594, type: !2654, scopeLine: 2595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2744 = !DILocalVariable(name: "value", arg: 1, scope: !2743, file: !71, line: 2594, type: !79)
!2745 = !DILocation(line: 2594, column: 29, scope: !2743)
!2746 = !DILocalVariable(name: "factor", arg: 2, scope: !2743, file: !71, line: 2594, type: !6)
!2747 = !DILocation(line: 2594, column: 39, scope: !2743)
!2748 = !DILocalVariable(name: "u32Temp1", scope: !2743, file: !71, line: 2596, type: !735)
!2749 = !DILocation(line: 2596, column: 6, scope: !2743)
!2750 = !DILocalVariable(name: "u32Temp2", scope: !2743, file: !71, line: 2596, type: !735)
!2751 = !DILocation(line: 2596, column: 17, scope: !2743)
!2752 = !DILocalVariable(name: "u32Temp3", scope: !2743, file: !71, line: 2596, type: !735)
!2753 = !DILocation(line: 2596, column: 26, scope: !2743)
!2754 = !DILocalVariable(name: "u32Temp4", scope: !2743, file: !71, line: 2596, type: !735)
!2755 = !DILocation(line: 2596, column: 35, scope: !2743)
!2756 = !DILocalVariable(name: "u8SignBit", scope: !2743, file: !71, line: 2597, type: !17)
!2757 = !DILocation(line: 2597, column: 5, scope: !2743)
!2758 = !DILocation(line: 2599, column: 7, scope: !2759)
!2759 = distinct !DILexicalBlock(scope: !2743, file: !71, line: 2599, column: 5)
!2760 = !DILocation(line: 2599, column: 12, scope: !2759)
!2761 = !DILocation(line: 2599, column: 16, scope: !2759)
!2762 = !DILocation(line: 2599, column: 20, scope: !2759)
!2763 = !DILocation(line: 2599, column: 26, scope: !2759)
!2764 = !DILocation(line: 2599, column: 31, scope: !2759)
!2765 = !DILocation(line: 2599, column: 36, scope: !2759)
!2766 = !DILocation(line: 2599, column: 41, scope: !2759)
!2767 = !DILocation(line: 2599, column: 45, scope: !2759)
!2768 = !DILocation(line: 2599, column: 49, scope: !2759)
!2769 = !DILocation(line: 2599, column: 55, scope: !2759)
!2770 = !DILocation(line: 2599, column: 5, scope: !2743)
!2771 = !DILocation(line: 2601, column: 13, scope: !2772)
!2772 = distinct !DILexicalBlock(scope: !2759, file: !71, line: 2600, column: 2)
!2773 = !DILocation(line: 2602, column: 2, scope: !2772)
!2774 = !DILocation(line: 2605, column: 13, scope: !2775)
!2775 = distinct !DILexicalBlock(scope: !2759, file: !71, line: 2604, column: 2)
!2776 = !DILocation(line: 2608, column: 5, scope: !2777)
!2777 = distinct !DILexicalBlock(scope: !2743, file: !71, line: 2608, column: 5)
!2778 = !DILocation(line: 2608, column: 10, scope: !2777)
!2779 = !DILocation(line: 2608, column: 5, scope: !2743)
!2780 = !DILocation(line: 2610, column: 15, scope: !2781)
!2781 = distinct !DILexicalBlock(scope: !2777, file: !71, line: 2609, column: 2)
!2782 = !DILocation(line: 2610, column: 14, scope: !2781)
!2783 = !DILocation(line: 2610, column: 12, scope: !2781)
!2784 = !DILocation(line: 2611, column: 2, scope: !2781)
!2785 = !DILocation(line: 2614, column: 14, scope: !2786)
!2786 = distinct !DILexicalBlock(scope: !2777, file: !71, line: 2613, column: 2)
!2787 = !DILocation(line: 2614, column: 12, scope: !2786)
!2788 = !DILocation(line: 2617, column: 5, scope: !2789)
!2789 = distinct !DILexicalBlock(scope: !2743, file: !71, line: 2617, column: 5)
!2790 = !DILocation(line: 2617, column: 11, scope: !2789)
!2791 = !DILocation(line: 2617, column: 5, scope: !2743)
!2792 = !DILocation(line: 2619, column: 15, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2789, file: !71, line: 2618, column: 2)
!2794 = !DILocation(line: 2619, column: 14, scope: !2793)
!2795 = !DILocation(line: 2619, column: 12, scope: !2793)
!2796 = !DILocation(line: 2620, column: 2, scope: !2793)
!2797 = !DILocation(line: 2623, column: 14, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2789, file: !71, line: 2622, column: 2)
!2799 = !DILocation(line: 2623, column: 12, scope: !2798)
!2800 = !DILocation(line: 2626, column: 13, scope: !2743)
!2801 = !DILocation(line: 2626, column: 24, scope: !2743)
!2802 = !DILocation(line: 2626, column: 22, scope: !2743)
!2803 = !DILocation(line: 2626, column: 11, scope: !2743)
!2804 = !DILocation(line: 2627, column: 25, scope: !2743)
!2805 = !DILocation(line: 2627, column: 35, scope: !2743)
!2806 = !DILocation(line: 2627, column: 13, scope: !2743)
!2807 = !DILocation(line: 2627, column: 11, scope: !2743)
!2808 = !DILocation(line: 2628, column: 13, scope: !2743)
!2809 = !DILocation(line: 2628, column: 22, scope: !2743)
!2810 = !DILocation(line: 2628, column: 11, scope: !2743)
!2811 = !DILocation(line: 2629, column: 14, scope: !2743)
!2812 = !DILocation(line: 2629, column: 23, scope: !2743)
!2813 = !DILocation(line: 2629, column: 11, scope: !2743)
!2814 = !DILocation(line: 2630, column: 6, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2743, file: !71, line: 2630, column: 5)
!2816 = !DILocation(line: 2630, column: 14, scope: !2815)
!2817 = !DILocation(line: 2630, column: 18, scope: !2815)
!2818 = !DILocation(line: 2630, column: 5, scope: !2743)
!2819 = !DILocation(line: 2632, column: 6, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2821, file: !71, line: 2632, column: 6)
!2821 = distinct !DILexicalBlock(scope: !2815, file: !71, line: 2631, column: 2)
!2822 = !DILocation(line: 2632, column: 16, scope: !2820)
!2823 = !DILocation(line: 2632, column: 6, scope: !2821)
!2824 = !DILocation(line: 2634, column: 7, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2826, file: !71, line: 2634, column: 7)
!2826 = distinct !DILexicalBlock(scope: !2820, file: !71, line: 2633, column: 3)
!2827 = !DILocation(line: 2634, column: 15, scope: !2825)
!2828 = !DILocation(line: 2634, column: 7, scope: !2826)
!2829 = !DILocation(line: 2635, column: 12, scope: !2825)
!2830 = !DILocation(line: 2635, column: 5, scope: !2825)
!2831 = !DILocation(line: 2637, column: 5, scope: !2825)
!2832 = !DILocation(line: 2641, column: 7, scope: !2833)
!2833 = distinct !DILexicalBlock(scope: !2834, file: !71, line: 2641, column: 7)
!2834 = distinct !DILexicalBlock(scope: !2820, file: !71, line: 2640, column: 3)
!2835 = !DILocation(line: 2641, column: 15, scope: !2833)
!2836 = !DILocation(line: 2641, column: 7, scope: !2834)
!2837 = !DILocation(line: 2642, column: 13, scope: !2833)
!2838 = !DILocation(line: 2642, column: 12, scope: !2833)
!2839 = !DILocation(line: 2642, column: 5, scope: !2833)
!2840 = !DILocation(line: 2644, column: 5, scope: !2833)
!2841 = !DILocation(line: 2649, column: 3, scope: !2842)
!2842 = distinct !DILexicalBlock(scope: !2815, file: !71, line: 2648, column: 2)
!2843 = !DILocation(line: 2651, column: 1, scope: !2743)
!2844 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !71, file: !71, line: 2666, type: !2180, scopeLine: 2667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2845 = !DILocalVariable(name: "val1", arg: 1, scope: !2844, file: !71, line: 2666, type: !79)
!2846 = !DILocation(line: 2666, column: 25, scope: !2844)
!2847 = !DILocalVariable(name: "val2", arg: 2, scope: !2844, file: !71, line: 2666, type: !79)
!2848 = !DILocation(line: 2666, column: 35, scope: !2844)
!2849 = !DILocalVariable(name: "u32Temp1", scope: !2844, file: !71, line: 2668, type: !735)
!2850 = !DILocation(line: 2668, column: 6, scope: !2844)
!2851 = !DILocalVariable(name: "u32Temp2", scope: !2844, file: !71, line: 2668, type: !735)
!2852 = !DILocation(line: 2668, column: 17, scope: !2844)
!2853 = !DILocalVariable(name: "u32Temp3", scope: !2844, file: !71, line: 2668, type: !735)
!2854 = !DILocation(line: 2668, column: 26, scope: !2844)
!2855 = !DILocalVariable(name: "u32Temp4", scope: !2844, file: !71, line: 2668, type: !735)
!2856 = !DILocation(line: 2668, column: 35, scope: !2844)
!2857 = !DILocalVariable(name: "u8SignBit", scope: !2844, file: !71, line: 2669, type: !17)
!2858 = !DILocation(line: 2669, column: 5, scope: !2844)
!2859 = !DILocation(line: 2671, column: 7, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2844, file: !71, line: 2671, column: 5)
!2861 = !DILocation(line: 2671, column: 11, scope: !2860)
!2862 = !DILocation(line: 2671, column: 15, scope: !2860)
!2863 = !DILocation(line: 2671, column: 33, scope: !2860)
!2864 = !DILocation(line: 2671, column: 37, scope: !2860)
!2865 = !DILocation(line: 2671, column: 41, scope: !2860)
!2866 = !DILocation(line: 2673, column: 13, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2860, file: !71, line: 2672, column: 2)
!2868 = !DILocation(line: 2674, column: 2, scope: !2867)
!2869 = !DILocation(line: 2677, column: 13, scope: !2870)
!2870 = distinct !DILexicalBlock(scope: !2860, file: !71, line: 2676, column: 2)
!2871 = !DILocation(line: 2680, column: 5, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2844, file: !71, line: 2680, column: 5)
!2873 = !DILocation(line: 2680, column: 9, scope: !2872)
!2874 = !DILocation(line: 2680, column: 5, scope: !2844)
!2875 = !DILocation(line: 2682, column: 15, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2872, file: !71, line: 2681, column: 2)
!2877 = !DILocation(line: 2682, column: 14, scope: !2876)
!2878 = !DILocation(line: 2682, column: 12, scope: !2876)
!2879 = !DILocation(line: 2683, column: 2, scope: !2876)
!2880 = !DILocation(line: 2686, column: 14, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2872, file: !71, line: 2685, column: 2)
!2882 = !DILocation(line: 2686, column: 12, scope: !2881)
!2883 = !DILocation(line: 2689, column: 5, scope: !2884)
!2884 = distinct !DILexicalBlock(scope: !2844, file: !71, line: 2689, column: 5)
!2885 = !DILocation(line: 2689, column: 9, scope: !2884)
!2886 = !DILocation(line: 2689, column: 5, scope: !2844)
!2887 = !DILocation(line: 2691, column: 15, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2884, file: !71, line: 2690, column: 2)
!2889 = !DILocation(line: 2691, column: 14, scope: !2888)
!2890 = !DILocation(line: 2691, column: 12, scope: !2888)
!2891 = !DILocation(line: 2692, column: 2, scope: !2888)
!2892 = !DILocation(line: 2695, column: 14, scope: !2893)
!2893 = distinct !DILexicalBlock(scope: !2884, file: !71, line: 2694, column: 2)
!2894 = !DILocation(line: 2695, column: 12, scope: !2893)
!2895 = !DILocation(line: 2698, column: 13, scope: !2844)
!2896 = !DILocation(line: 2698, column: 24, scope: !2844)
!2897 = !DILocation(line: 2698, column: 22, scope: !2844)
!2898 = !DILocation(line: 2698, column: 11, scope: !2844)
!2899 = !DILocation(line: 2699, column: 25, scope: !2844)
!2900 = !DILocation(line: 2699, column: 35, scope: !2844)
!2901 = !DILocation(line: 2699, column: 13, scope: !2844)
!2902 = !DILocation(line: 2699, column: 11, scope: !2844)
!2903 = !DILocation(line: 2700, column: 5, scope: !2904)
!2904 = distinct !DILexicalBlock(scope: !2844, file: !71, line: 2700, column: 5)
!2905 = !DILocation(line: 2700, column: 13, scope: !2904)
!2906 = !DILocation(line: 2700, column: 5, scope: !2844)
!2907 = !DILocation(line: 2702, column: 6, scope: !2908)
!2908 = distinct !DILexicalBlock(scope: !2909, file: !71, line: 2702, column: 6)
!2909 = distinct !DILexicalBlock(scope: !2904, file: !71, line: 2701, column: 2)
!2910 = !DILocation(line: 2702, column: 16, scope: !2908)
!2911 = !DILocation(line: 2702, column: 6, scope: !2909)
!2912 = !DILocation(line: 2704, column: 7, scope: !2913)
!2913 = distinct !DILexicalBlock(scope: !2914, file: !71, line: 2704, column: 7)
!2914 = distinct !DILexicalBlock(scope: !2908, file: !71, line: 2703, column: 3)
!2915 = !DILocation(line: 2704, column: 15, scope: !2913)
!2916 = !DILocation(line: 2704, column: 7, scope: !2914)
!2917 = !DILocation(line: 2705, column: 12, scope: !2913)
!2918 = !DILocation(line: 2705, column: 5, scope: !2913)
!2919 = !DILocation(line: 2707, column: 5, scope: !2913)
!2920 = !DILocation(line: 2711, column: 7, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2922, file: !71, line: 2711, column: 7)
!2922 = distinct !DILexicalBlock(scope: !2908, file: !71, line: 2710, column: 3)
!2923 = !DILocation(line: 2711, column: 15, scope: !2921)
!2924 = !DILocation(line: 2711, column: 7, scope: !2922)
!2925 = !DILocation(line: 2712, column: 13, scope: !2921)
!2926 = !DILocation(line: 2712, column: 12, scope: !2921)
!2927 = !DILocation(line: 2712, column: 5, scope: !2921)
!2928 = !DILocation(line: 2714, column: 5, scope: !2921)
!2929 = !DILocation(line: 2719, column: 6, scope: !2930)
!2930 = distinct !DILexicalBlock(scope: !2931, file: !71, line: 2719, column: 6)
!2931 = distinct !DILexicalBlock(scope: !2904, file: !71, line: 2718, column: 2)
!2932 = !DILocation(line: 2719, column: 16, scope: !2930)
!2933 = !DILocation(line: 2719, column: 6, scope: !2931)
!2934 = !DILocation(line: 2721, column: 4, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2930, file: !71, line: 2720, column: 3)
!2936 = !DILocation(line: 2725, column: 4, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2930, file: !71, line: 2724, column: 3)
!2938 = !DILocation(line: 2729, column: 1, scope: !2844)
!2939 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !71, file: !71, line: 2747, type: !2076, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2940 = !DILocalVariable(name: "value", arg: 1, scope: !2939, file: !71, line: 2747, type: !79)
!2941 = !DILocation(line: 2747, column: 31, scope: !2939)
!2942 = !DILocalVariable(name: "factor", arg: 2, scope: !2939, file: !71, line: 2747, type: !735)
!2943 = !DILocation(line: 2747, column: 42, scope: !2939)
!2944 = !DILocalVariable(name: "u32Temp1", scope: !2939, file: !71, line: 2749, type: !735)
!2945 = !DILocation(line: 2749, column: 6, scope: !2939)
!2946 = !DILocalVariable(name: "u32Temp2", scope: !2939, file: !71, line: 2749, type: !735)
!2947 = !DILocation(line: 2749, column: 17, scope: !2939)
!2948 = !DILocalVariable(name: "u8SignBit", scope: !2939, file: !71, line: 2750, type: !17)
!2949 = !DILocation(line: 2750, column: 5, scope: !2939)
!2950 = !DILocation(line: 2752, column: 5, scope: !2951)
!2951 = distinct !DILexicalBlock(scope: !2939, file: !71, line: 2752, column: 5)
!2952 = !DILocation(line: 2752, column: 10, scope: !2951)
!2953 = !DILocation(line: 2752, column: 5, scope: !2939)
!2954 = !DILocation(line: 2754, column: 15, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2951, file: !71, line: 2753, column: 2)
!2956 = !DILocation(line: 2754, column: 14, scope: !2955)
!2957 = !DILocation(line: 2754, column: 12, scope: !2955)
!2958 = !DILocation(line: 2755, column: 13, scope: !2955)
!2959 = !DILocation(line: 2756, column: 2, scope: !2955)
!2960 = !DILocation(line: 2759, column: 14, scope: !2961)
!2961 = distinct !DILexicalBlock(scope: !2951, file: !71, line: 2758, column: 2)
!2962 = !DILocation(line: 2759, column: 12, scope: !2961)
!2963 = !DILocation(line: 2760, column: 13, scope: !2961)
!2964 = !DILocation(line: 2763, column: 25, scope: !2939)
!2965 = !DILocation(line: 2763, column: 35, scope: !2939)
!2966 = !DILocation(line: 2763, column: 13, scope: !2939)
!2967 = !DILocation(line: 2763, column: 11, scope: !2939)
!2968 = !DILocation(line: 2764, column: 13, scope: !2939)
!2969 = !DILocation(line: 2764, column: 22, scope: !2939)
!2970 = !DILocation(line: 2764, column: 11, scope: !2939)
!2971 = !DILocation(line: 2765, column: 5, scope: !2972)
!2972 = distinct !DILexicalBlock(scope: !2939, file: !71, line: 2765, column: 5)
!2973 = !DILocation(line: 2765, column: 15, scope: !2972)
!2974 = !DILocation(line: 2765, column: 5, scope: !2939)
!2975 = !DILocation(line: 2767, column: 10, scope: !2976)
!2976 = distinct !DILexicalBlock(scope: !2972, file: !71, line: 2766, column: 2)
!2977 = !DILocation(line: 2767, column: 3, scope: !2976)
!2978 = !DILocation(line: 2771, column: 11, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2972, file: !71, line: 2770, column: 2)
!2980 = !DILocation(line: 2771, column: 10, scope: !2979)
!2981 = !DILocation(line: 2771, column: 3, scope: !2979)
!2982 = !DILocation(line: 2773, column: 1, scope: !2939)
!2983 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !71, file: !71, line: 2789, type: !2180, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2984 = !DILocalVariable(name: "value", arg: 1, scope: !2983, file: !71, line: 2789, type: !79)
!2985 = !DILocation(line: 2789, column: 31, scope: !2983)
!2986 = !DILocalVariable(name: "factor", arg: 2, scope: !2983, file: !71, line: 2789, type: !79)
!2987 = !DILocation(line: 2789, column: 42, scope: !2983)
!2988 = !DILocalVariable(name: "u32Temp1", scope: !2983, file: !71, line: 2791, type: !735)
!2989 = !DILocation(line: 2791, column: 6, scope: !2983)
!2990 = !DILocalVariable(name: "u32Temp2", scope: !2983, file: !71, line: 2791, type: !735)
!2991 = !DILocation(line: 2791, column: 17, scope: !2983)
!2992 = !DILocalVariable(name: "u32Temp3", scope: !2983, file: !71, line: 2791, type: !735)
!2993 = !DILocation(line: 2791, column: 26, scope: !2983)
!2994 = !DILocalVariable(name: "u8SignBit", scope: !2983, file: !71, line: 2792, type: !17)
!2995 = !DILocation(line: 2792, column: 5, scope: !2983)
!2996 = !DILocation(line: 2794, column: 7, scope: !2997)
!2997 = distinct !DILexicalBlock(scope: !2983, file: !71, line: 2794, column: 5)
!2998 = !DILocation(line: 2794, column: 12, scope: !2997)
!2999 = !DILocation(line: 2794, column: 16, scope: !2997)
!3000 = !DILocation(line: 2794, column: 36, scope: !2997)
!3001 = !DILocation(line: 2794, column: 41, scope: !2997)
!3002 = !DILocation(line: 2794, column: 45, scope: !2997)
!3003 = !DILocation(line: 2796, column: 13, scope: !3004)
!3004 = distinct !DILexicalBlock(scope: !2997, file: !71, line: 2795, column: 2)
!3005 = !DILocation(line: 2797, column: 2, scope: !3004)
!3006 = !DILocation(line: 2800, column: 13, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2997, file: !71, line: 2799, column: 2)
!3008 = !DILocation(line: 2803, column: 5, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !2983, file: !71, line: 2803, column: 5)
!3010 = !DILocation(line: 2803, column: 10, scope: !3009)
!3011 = !DILocation(line: 2803, column: 5, scope: !2983)
!3012 = !DILocation(line: 2805, column: 15, scope: !3013)
!3013 = distinct !DILexicalBlock(scope: !3009, file: !71, line: 2804, column: 2)
!3014 = !DILocation(line: 2805, column: 14, scope: !3013)
!3015 = !DILocation(line: 2805, column: 12, scope: !3013)
!3016 = !DILocation(line: 2806, column: 2, scope: !3013)
!3017 = !DILocation(line: 2809, column: 14, scope: !3018)
!3018 = distinct !DILexicalBlock(scope: !3009, file: !71, line: 2808, column: 2)
!3019 = !DILocation(line: 2809, column: 12, scope: !3018)
!3020 = !DILocation(line: 2812, column: 5, scope: !3021)
!3021 = distinct !DILexicalBlock(scope: !2983, file: !71, line: 2812, column: 5)
!3022 = !DILocation(line: 2812, column: 11, scope: !3021)
!3023 = !DILocation(line: 2812, column: 5, scope: !2983)
!3024 = !DILocation(line: 2814, column: 15, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !3021, file: !71, line: 2813, column: 2)
!3026 = !DILocation(line: 2814, column: 14, scope: !3025)
!3027 = !DILocation(line: 2814, column: 12, scope: !3025)
!3028 = !DILocation(line: 2815, column: 2, scope: !3025)
!3029 = !DILocation(line: 2818, column: 14, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3021, file: !71, line: 2817, column: 2)
!3031 = !DILocation(line: 2818, column: 12, scope: !3030)
!3032 = !DILocation(line: 2821, column: 25, scope: !2983)
!3033 = !DILocation(line: 2821, column: 35, scope: !2983)
!3034 = !DILocation(line: 2821, column: 13, scope: !2983)
!3035 = !DILocation(line: 2821, column: 11, scope: !2983)
!3036 = !DILocation(line: 2822, column: 5, scope: !3037)
!3037 = distinct !DILexicalBlock(scope: !2983, file: !71, line: 2822, column: 5)
!3038 = !DILocation(line: 2822, column: 15, scope: !3037)
!3039 = !DILocation(line: 2822, column: 5, scope: !2983)
!3040 = !DILocation(line: 2824, column: 10, scope: !3041)
!3041 = distinct !DILexicalBlock(scope: !3037, file: !71, line: 2823, column: 2)
!3042 = !DILocation(line: 2824, column: 3, scope: !3041)
!3043 = !DILocation(line: 2828, column: 11, scope: !3044)
!3044 = distinct !DILexicalBlock(scope: !3037, file: !71, line: 2827, column: 2)
!3045 = !DILocation(line: 2828, column: 10, scope: !3044)
!3046 = !DILocation(line: 2828, column: 3, scope: !3044)
!3047 = !DILocation(line: 2830, column: 1, scope: !2983)
!3048 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !71, file: !71, line: 2847, type: !3049, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3049 = !DISubroutineType(types: !3050)
!3050 = !{!735, !735, !17}
!3051 = !DILocalVariable(name: "value", arg: 1, scope: !3048, file: !71, line: 2847, type: !735)
!3052 = !DILocation(line: 2847, column: 29, scope: !3048)
!3053 = !DILocalVariable(name: "factor", arg: 2, scope: !3048, file: !71, line: 2847, type: !17)
!3054 = !DILocation(line: 2847, column: 39, scope: !3048)
!3055 = !DILocalVariable(name: "u32Temp1", scope: !3048, file: !71, line: 2849, type: !735)
!3056 = !DILocation(line: 2849, column: 6, scope: !3048)
!3057 = !DILocalVariable(name: "u32Temp2", scope: !3048, file: !71, line: 2849, type: !735)
!3058 = !DILocation(line: 2849, column: 20, scope: !3048)
!3059 = !DILocation(line: 2850, column: 13, scope: !3048)
!3060 = !DILocation(line: 2850, column: 21, scope: !3048)
!3061 = !DILocation(line: 2850, column: 19, scope: !3048)
!3062 = !DILocation(line: 2850, column: 11, scope: !3048)
!3063 = !DILocation(line: 2851, column: 25, scope: !3048)
!3064 = !DILocation(line: 2851, column: 32, scope: !3048)
!3065 = !DILocation(line: 2851, column: 13, scope: !3048)
!3066 = !DILocation(line: 2851, column: 11, scope: !3048)
!3067 = !DILocation(line: 2852, column: 14, scope: !3048)
!3068 = !DILocation(line: 2852, column: 23, scope: !3048)
!3069 = !DILocation(line: 2852, column: 11, scope: !3048)
!3070 = !DILocation(line: 2853, column: 14, scope: !3048)
!3071 = !DILocation(line: 2853, column: 23, scope: !3048)
!3072 = !DILocation(line: 2853, column: 11, scope: !3048)
!3073 = !DILocation(line: 2854, column: 9, scope: !3048)
!3074 = !DILocation(line: 2854, column: 2, scope: !3048)
!3075 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !71, file: !71, line: 2873, type: !3049, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3076 = !DILocalVariable(name: "value", arg: 1, scope: !3075, file: !71, line: 2873, type: !735)
!3077 = !DILocation(line: 2873, column: 29, scope: !3075)
!3078 = !DILocalVariable(name: "factor", arg: 2, scope: !3075, file: !71, line: 2873, type: !17)
!3079 = !DILocation(line: 2873, column: 39, scope: !3075)
!3080 = !DILocalVariable(name: "u32Temp1", scope: !3075, file: !71, line: 2875, type: !735)
!3081 = !DILocation(line: 2875, column: 6, scope: !3075)
!3082 = !DILocalVariable(name: "u32Temp2", scope: !3075, file: !71, line: 2875, type: !735)
!3083 = !DILocation(line: 2875, column: 20, scope: !3075)
!3084 = !DILocation(line: 2876, column: 13, scope: !3075)
!3085 = !DILocation(line: 2876, column: 21, scope: !3075)
!3086 = !DILocation(line: 2876, column: 19, scope: !3075)
!3087 = !DILocation(line: 2876, column: 11, scope: !3075)
!3088 = !DILocation(line: 2877, column: 25, scope: !3075)
!3089 = !DILocation(line: 2877, column: 32, scope: !3075)
!3090 = !DILocation(line: 2877, column: 13, scope: !3075)
!3091 = !DILocation(line: 2877, column: 11, scope: !3075)
!3092 = !DILocation(line: 2878, column: 14, scope: !3075)
!3093 = !DILocation(line: 2878, column: 23, scope: !3075)
!3094 = !DILocation(line: 2878, column: 11, scope: !3075)
!3095 = !DILocation(line: 2879, column: 14, scope: !3075)
!3096 = !DILocation(line: 2879, column: 23, scope: !3075)
!3097 = !DILocation(line: 2879, column: 11, scope: !3075)
!3098 = !DILocation(line: 2880, column: 6, scope: !3099)
!3099 = distinct !DILexicalBlock(scope: !3075, file: !71, line: 2880, column: 5)
!3100 = !DILocation(line: 2880, column: 14, scope: !3099)
!3101 = !DILocation(line: 2880, column: 19, scope: !3099)
!3102 = !DILocation(line: 2880, column: 5, scope: !3075)
!3103 = !DILocation(line: 2882, column: 10, scope: !3104)
!3104 = distinct !DILexicalBlock(scope: !3099, file: !71, line: 2881, column: 2)
!3105 = !DILocation(line: 2882, column: 3, scope: !3104)
!3106 = !DILocation(line: 2886, column: 3, scope: !3107)
!3107 = distinct !DILexicalBlock(scope: !3099, file: !71, line: 2885, column: 2)
!3108 = !DILocation(line: 2889, column: 1, scope: !3075)
!3109 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !71, file: !71, line: 2908, type: !3110, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3110 = !DISubroutineType(types: !3111)
!3111 = !{!735, !735, !6}
!3112 = !DILocalVariable(name: "value", arg: 1, scope: !3109, file: !71, line: 2908, type: !735)
!3113 = !DILocation(line: 2908, column: 29, scope: !3109)
!3114 = !DILocalVariable(name: "factor", arg: 2, scope: !3109, file: !71, line: 2908, type: !6)
!3115 = !DILocation(line: 2908, column: 39, scope: !3109)
!3116 = !DILocalVariable(name: "u32Temp1", scope: !3109, file: !71, line: 2910, type: !735)
!3117 = !DILocation(line: 2910, column: 6, scope: !3109)
!3118 = !DILocalVariable(name: "u32Temp2", scope: !3109, file: !71, line: 2910, type: !735)
!3119 = !DILocation(line: 2910, column: 20, scope: !3109)
!3120 = !DILocation(line: 2911, column: 5, scope: !3121)
!3121 = distinct !DILexicalBlock(scope: !3109, file: !71, line: 2911, column: 5)
!3122 = !DILocation(line: 2911, column: 12, scope: !3121)
!3123 = !DILocation(line: 2911, column: 5, scope: !3109)
!3124 = !DILocation(line: 2914, column: 14, scope: !3125)
!3125 = distinct !DILexicalBlock(scope: !3121, file: !71, line: 2912, column: 2)
!3126 = !DILocation(line: 2914, column: 22, scope: !3125)
!3127 = !DILocation(line: 2914, column: 20, scope: !3125)
!3128 = !DILocation(line: 2914, column: 12, scope: !3125)
!3129 = !DILocation(line: 2915, column: 26, scope: !3125)
!3130 = !DILocation(line: 2915, column: 33, scope: !3125)
!3131 = !DILocation(line: 2915, column: 14, scope: !3125)
!3132 = !DILocation(line: 2915, column: 12, scope: !3125)
!3133 = !DILocation(line: 2916, column: 14, scope: !3125)
!3134 = !DILocation(line: 2916, column: 23, scope: !3125)
!3135 = !DILocation(line: 2916, column: 12, scope: !3125)
!3136 = !DILocation(line: 2917, column: 15, scope: !3125)
!3137 = !DILocation(line: 2917, column: 24, scope: !3125)
!3138 = !DILocation(line: 2917, column: 12, scope: !3125)
!3139 = !DILocation(line: 2918, column: 10, scope: !3125)
!3140 = !DILocation(line: 2918, column: 3, scope: !3125)
!3141 = !DILocation(line: 2922, column: 3, scope: !3142)
!3142 = distinct !DILexicalBlock(scope: !3121, file: !71, line: 2921, column: 2)
!3143 = !DILocation(line: 2924, column: 1, scope: !3109)
!3144 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !71, file: !71, line: 2943, type: !3110, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3145 = !DILocalVariable(name: "value", arg: 1, scope: !3144, file: !71, line: 2943, type: !735)
!3146 = !DILocation(line: 2943, column: 29, scope: !3144)
!3147 = !DILocalVariable(name: "factor", arg: 2, scope: !3144, file: !71, line: 2943, type: !6)
!3148 = !DILocation(line: 2943, column: 39, scope: !3144)
!3149 = !DILocalVariable(name: "u32Temp1", scope: !3144, file: !71, line: 2945, type: !735)
!3150 = !DILocation(line: 2945, column: 6, scope: !3144)
!3151 = !DILocalVariable(name: "u32Temp2", scope: !3144, file: !71, line: 2945, type: !735)
!3152 = !DILocation(line: 2945, column: 20, scope: !3144)
!3153 = !DILocation(line: 2946, column: 5, scope: !3154)
!3154 = distinct !DILexicalBlock(scope: !3144, file: !71, line: 2946, column: 5)
!3155 = !DILocation(line: 2946, column: 12, scope: !3154)
!3156 = !DILocation(line: 2946, column: 5, scope: !3144)
!3157 = !DILocation(line: 2948, column: 3, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3154, file: !71, line: 2947, column: 2)
!3159 = !DILocation(line: 2952, column: 14, scope: !3160)
!3160 = distinct !DILexicalBlock(scope: !3154, file: !71, line: 2951, column: 2)
!3161 = !DILocation(line: 2952, column: 22, scope: !3160)
!3162 = !DILocation(line: 2952, column: 20, scope: !3160)
!3163 = !DILocation(line: 2952, column: 12, scope: !3160)
!3164 = !DILocation(line: 2953, column: 26, scope: !3160)
!3165 = !DILocation(line: 2953, column: 33, scope: !3160)
!3166 = !DILocation(line: 2953, column: 14, scope: !3160)
!3167 = !DILocation(line: 2953, column: 12, scope: !3160)
!3168 = !DILocation(line: 2954, column: 14, scope: !3160)
!3169 = !DILocation(line: 2954, column: 23, scope: !3160)
!3170 = !DILocation(line: 2954, column: 12, scope: !3160)
!3171 = !DILocation(line: 2955, column: 15, scope: !3160)
!3172 = !DILocation(line: 2955, column: 24, scope: !3160)
!3173 = !DILocation(line: 2955, column: 12, scope: !3160)
!3174 = !DILocation(line: 2956, column: 7, scope: !3175)
!3175 = distinct !DILexicalBlock(scope: !3160, file: !71, line: 2956, column: 6)
!3176 = !DILocation(line: 2956, column: 16, scope: !3175)
!3177 = !DILocation(line: 2956, column: 22, scope: !3175)
!3178 = !DILocation(line: 2956, column: 6, scope: !3160)
!3179 = !DILocation(line: 2958, column: 11, scope: !3180)
!3180 = distinct !DILexicalBlock(scope: !3175, file: !71, line: 2957, column: 3)
!3181 = !DILocation(line: 2958, column: 4, scope: !3180)
!3182 = !DILocation(line: 2962, column: 4, scope: !3183)
!3183 = distinct !DILexicalBlock(scope: !3175, file: !71, line: 2961, column: 3)
!3184 = !DILocation(line: 2965, column: 1, scope: !3144)
!3185 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !71, file: !71, line: 2987, type: !300, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3186 = !DILocalVariable(name: "value", arg: 1, scope: !3185, file: !71, line: 2987, type: !13)
!3187 = !DILocation(line: 2987, column: 33, scope: !3185)
!3188 = !DILocalVariable(name: "factor", arg: 2, scope: !3185, file: !71, line: 2987, type: !13)
!3189 = !DILocation(line: 2987, column: 44, scope: !3185)
!3190 = !DILocation(line: 2989, column: 40, scope: !3185)
!3191 = !DILocation(line: 2989, column: 46, scope: !3185)
!3192 = !DILocation(line: 2989, column: 9, scope: !3185)
!3193 = !DILocation(line: 2989, column: 2, scope: !3185)
!3194 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !71, file: !71, line: 3011, type: !300, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3195 = !DILocalVariable(name: "value", arg: 1, scope: !3194, file: !71, line: 3011, type: !13)
!3196 = !DILocation(line: 3011, column: 33, scope: !3194)
!3197 = !DILocalVariable(name: "factor", arg: 2, scope: !3194, file: !71, line: 3011, type: !13)
!3198 = !DILocation(line: 3011, column: 44, scope: !3194)
!3199 = !DILocation(line: 3013, column: 41, scope: !3194)
!3200 = !DILocation(line: 3013, column: 47, scope: !3194)
!3201 = !DILocation(line: 3013, column: 10, scope: !3194)
!3202 = !DILocation(line: 3013, column: 3, scope: !3194)
!3203 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !71, file: !71, line: 3036, type: !300, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3204 = !DILocalVariable(name: "value", arg: 1, scope: !3203, file: !71, line: 3036, type: !13)
!3205 = !DILocation(line: 3036, column: 32, scope: !3203)
!3206 = !DILocalVariable(name: "factor", arg: 2, scope: !3203, file: !71, line: 3036, type: !13)
!3207 = !DILocation(line: 3036, column: 43, scope: !3203)
!3208 = !DILocation(line: 3038, column: 41, scope: !3203)
!3209 = !DILocation(line: 3038, column: 47, scope: !3203)
!3210 = !DILocation(line: 3038, column: 10, scope: !3203)
!3211 = !DILocation(line: 3038, column: 3, scope: !3203)
!3212 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !71, file: !71, line: 3061, type: !300, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3213 = !DILocalVariable(name: "value", arg: 1, scope: !3212, file: !71, line: 3061, type: !13)
!3214 = !DILocation(line: 3061, column: 34, scope: !3212)
!3215 = !DILocalVariable(name: "factor", arg: 2, scope: !3212, file: !71, line: 3061, type: !13)
!3216 = !DILocation(line: 3061, column: 45, scope: !3212)
!3217 = !DILocation(line: 3063, column: 44, scope: !3212)
!3218 = !DILocation(line: 3063, column: 50, scope: !3212)
!3219 = !DILocation(line: 3063, column: 10, scope: !3212)
!3220 = !DILocation(line: 3063, column: 3, scope: !3212)
!3221 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !71, file: !71, line: 3086, type: !300, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3222 = !DILocalVariable(name: "value", arg: 1, scope: !3221, file: !71, line: 3086, type: !13)
!3223 = !DILocation(line: 3086, column: 33, scope: !3221)
!3224 = !DILocalVariable(name: "factor", arg: 2, scope: !3221, file: !71, line: 3086, type: !13)
!3225 = !DILocation(line: 3086, column: 44, scope: !3221)
!3226 = !DILocation(line: 3088, column: 44, scope: !3221)
!3227 = !DILocation(line: 3088, column: 50, scope: !3221)
!3228 = !DILocation(line: 3088, column: 10, scope: !3221)
!3229 = !DILocation(line: 3088, column: 3, scope: !3221)
!3230 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !71, file: !71, line: 3111, type: !300, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3231 = !DILocalVariable(name: "value", arg: 1, scope: !3230, file: !71, line: 3111, type: !13)
!3232 = !DILocation(line: 3111, column: 31, scope: !3230)
!3233 = !DILocalVariable(name: "factor", arg: 2, scope: !3230, file: !71, line: 3111, type: !13)
!3234 = !DILocation(line: 3111, column: 42, scope: !3230)
!3235 = !DILocation(line: 3113, column: 44, scope: !3230)
!3236 = !DILocation(line: 3113, column: 50, scope: !3230)
!3237 = !DILocation(line: 3113, column: 10, scope: !3230)
!3238 = !DILocation(line: 3113, column: 3, scope: !3230)
!3239 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !71, file: !71, line: 3136, type: !300, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3240 = !DILocalVariable(name: "value", arg: 1, scope: !3239, file: !71, line: 3136, type: !13)
!3241 = !DILocation(line: 3136, column: 33, scope: !3239)
!3242 = !DILocalVariable(name: "factor", arg: 2, scope: !3239, file: !71, line: 3136, type: !13)
!3243 = !DILocation(line: 3136, column: 44, scope: !3239)
!3244 = !DILocation(line: 3138, column: 44, scope: !3239)
!3245 = !DILocation(line: 3138, column: 50, scope: !3239)
!3246 = !DILocation(line: 3138, column: 10, scope: !3239)
!3247 = !DILocation(line: 3138, column: 3, scope: !3239)
!3248 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !71, file: !71, line: 3161, type: !300, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3249 = !DILocalVariable(name: "value", arg: 1, scope: !3248, file: !71, line: 3161, type: !13)
!3250 = !DILocation(line: 3161, column: 32, scope: !3248)
!3251 = !DILocalVariable(name: "factor", arg: 2, scope: !3248, file: !71, line: 3161, type: !13)
!3252 = !DILocation(line: 3161, column: 43, scope: !3248)
!3253 = !DILocation(line: 3163, column: 44, scope: !3248)
!3254 = !DILocation(line: 3163, column: 50, scope: !3248)
!3255 = !DILocation(line: 3163, column: 10, scope: !3248)
!3256 = !DILocation(line: 3163, column: 3, scope: !3248)
!3257 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !71, file: !71, line: 3185, type: !300, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3258 = !DILocalVariable(name: "value", arg: 1, scope: !3257, file: !71, line: 3185, type: !13)
!3259 = !DILocation(line: 3185, column: 31, scope: !3257)
!3260 = !DILocalVariable(name: "factor", arg: 2, scope: !3257, file: !71, line: 3185, type: !13)
!3261 = !DILocation(line: 3185, column: 42, scope: !3257)
!3262 = !DILocation(line: 3187, column: 44, scope: !3257)
!3263 = !DILocation(line: 3187, column: 50, scope: !3257)
!3264 = !DILocation(line: 3187, column: 10, scope: !3257)
!3265 = !DILocation(line: 3187, column: 3, scope: !3257)
!3266 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !71, file: !71, line: 3209, type: !300, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3267 = !DILocalVariable(name: "value", arg: 1, scope: !3266, file: !71, line: 3209, type: !13)
!3268 = !DILocation(line: 3209, column: 30, scope: !3266)
!3269 = !DILocalVariable(name: "factor", arg: 2, scope: !3266, file: !71, line: 3209, type: !13)
!3270 = !DILocation(line: 3209, column: 41, scope: !3266)
!3271 = !DILocation(line: 3211, column: 44, scope: !3266)
!3272 = !DILocation(line: 3211, column: 50, scope: !3266)
!3273 = !DILocation(line: 3211, column: 10, scope: !3266)
!3274 = !DILocation(line: 3211, column: 3, scope: !3266)
!3275 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !71, file: !71, line: 3233, type: !300, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3276 = !DILocalVariable(name: "value", arg: 1, scope: !3275, file: !71, line: 3233, type: !13)
!3277 = !DILocation(line: 3233, column: 33, scope: !3275)
!3278 = !DILocalVariable(name: "factor", arg: 2, scope: !3275, file: !71, line: 3233, type: !13)
!3279 = !DILocation(line: 3233, column: 44, scope: !3275)
!3280 = !DILocation(line: 3235, column: 44, scope: !3275)
!3281 = !DILocation(line: 3235, column: 50, scope: !3275)
!3282 = !DILocation(line: 3235, column: 10, scope: !3275)
!3283 = !DILocation(line: 3235, column: 3, scope: !3275)
!3284 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !71, file: !71, line: 3257, type: !300, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3285 = !DILocalVariable(name: "value", arg: 1, scope: !3284, file: !71, line: 3257, type: !13)
!3286 = !DILocation(line: 3257, column: 32, scope: !3284)
!3287 = !DILocalVariable(name: "factor", arg: 2, scope: !3284, file: !71, line: 3257, type: !13)
!3288 = !DILocation(line: 3257, column: 43, scope: !3284)
!3289 = !DILocation(line: 3259, column: 44, scope: !3284)
!3290 = !DILocation(line: 3259, column: 50, scope: !3284)
!3291 = !DILocation(line: 3259, column: 10, scope: !3284)
!3292 = !DILocation(line: 3259, column: 3, scope: !3284)
!3293 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !71, file: !71, line: 3281, type: !300, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3294 = !DILocalVariable(name: "value", arg: 1, scope: !3293, file: !71, line: 3281, type: !13)
!3295 = !DILocation(line: 3281, column: 31, scope: !3293)
!3296 = !DILocalVariable(name: "factor", arg: 2, scope: !3293, file: !71, line: 3281, type: !13)
!3297 = !DILocation(line: 3281, column: 42, scope: !3293)
!3298 = !DILocation(line: 3283, column: 44, scope: !3293)
!3299 = !DILocation(line: 3283, column: 50, scope: !3293)
!3300 = !DILocation(line: 3283, column: 10, scope: !3293)
!3301 = !DILocation(line: 3283, column: 3, scope: !3293)
!3302 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !71, file: !71, line: 3305, type: !300, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3303 = !DILocalVariable(name: "value", arg: 1, scope: !3302, file: !71, line: 3305, type: !13)
!3304 = !DILocation(line: 3305, column: 30, scope: !3302)
!3305 = !DILocalVariable(name: "factor", arg: 2, scope: !3302, file: !71, line: 3305, type: !13)
!3306 = !DILocation(line: 3305, column: 41, scope: !3302)
!3307 = !DILocation(line: 3307, column: 44, scope: !3302)
!3308 = !DILocation(line: 3307, column: 50, scope: !3302)
!3309 = !DILocation(line: 3307, column: 10, scope: !3302)
!3310 = !DILocation(line: 3307, column: 3, scope: !3302)
!3311 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !71, file: !71, line: 3328, type: !389, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3312 = !DILocalVariable(name: "value", arg: 1, scope: !3311, file: !71, line: 3328, type: !13)
!3313 = !DILocation(line: 3328, column: 33, scope: !3311)
!3314 = !DILocalVariable(name: "factor", arg: 2, scope: !3311, file: !71, line: 3328, type: !22)
!3315 = !DILocation(line: 3328, column: 44, scope: !3311)
!3316 = !DILocation(line: 3330, column: 41, scope: !3311)
!3317 = !DILocation(line: 3330, column: 47, scope: !3311)
!3318 = !DILocation(line: 3330, column: 10, scope: !3311)
!3319 = !DILocation(line: 3330, column: 3, scope: !3311)
!3320 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !71, file: !71, line: 3351, type: !389, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3321 = !DILocalVariable(name: "value", arg: 1, scope: !3320, file: !71, line: 3351, type: !13)
!3322 = !DILocation(line: 3351, column: 32, scope: !3320)
!3323 = !DILocalVariable(name: "factor", arg: 2, scope: !3320, file: !71, line: 3351, type: !22)
!3324 = !DILocation(line: 3351, column: 43, scope: !3320)
!3325 = !DILocation(line: 3353, column: 33, scope: !3320)
!3326 = !DILocation(line: 3353, column: 39, scope: !3320)
!3327 = !DILocation(line: 3353, column: 2, scope: !3320)
!3328 = !DILocation(line: 3354, column: 1, scope: !3320)
!3329 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !71, file: !71, line: 3375, type: !389, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3330 = !DILocalVariable(name: "value", arg: 1, scope: !3329, file: !71, line: 3375, type: !13)
!3331 = !DILocation(line: 3375, column: 31, scope: !3329)
!3332 = !DILocalVariable(name: "factor", arg: 2, scope: !3329, file: !71, line: 3375, type: !22)
!3333 = !DILocation(line: 3375, column: 42, scope: !3329)
!3334 = !DILocation(line: 3377, column: 41, scope: !3329)
!3335 = !DILocation(line: 3377, column: 47, scope: !3329)
!3336 = !DILocation(line: 3377, column: 10, scope: !3329)
!3337 = !DILocation(line: 3377, column: 3, scope: !3329)
!3338 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !71, file: !71, line: 3400, type: !389, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3339 = !DILocalVariable(name: "value", arg: 1, scope: !3338, file: !71, line: 3400, type: !13)
!3340 = !DILocation(line: 3400, column: 33, scope: !3338)
!3341 = !DILocalVariable(name: "factor", arg: 2, scope: !3338, file: !71, line: 3400, type: !22)
!3342 = !DILocation(line: 3400, column: 44, scope: !3338)
!3343 = !DILocation(line: 3402, column: 44, scope: !3338)
!3344 = !DILocation(line: 3402, column: 50, scope: !3338)
!3345 = !DILocation(line: 3402, column: 10, scope: !3338)
!3346 = !DILocation(line: 3402, column: 3, scope: !3338)
!3347 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !71, file: !71, line: 3425, type: !389, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3348 = !DILocalVariable(name: "value", arg: 1, scope: !3347, file: !71, line: 3425, type: !13)
!3349 = !DILocation(line: 3425, column: 32, scope: !3347)
!3350 = !DILocalVariable(name: "factor", arg: 2, scope: !3347, file: !71, line: 3425, type: !22)
!3351 = !DILocation(line: 3425, column: 43, scope: !3347)
!3352 = !DILocation(line: 3427, column: 44, scope: !3347)
!3353 = !DILocation(line: 3427, column: 50, scope: !3347)
!3354 = !DILocation(line: 3427, column: 10, scope: !3347)
!3355 = !DILocation(line: 3427, column: 3, scope: !3347)
!3356 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !71, file: !71, line: 3450, type: !389, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3357 = !DILocalVariable(name: "value", arg: 1, scope: !3356, file: !71, line: 3450, type: !13)
!3358 = !DILocation(line: 3450, column: 31, scope: !3356)
!3359 = !DILocalVariable(name: "factor", arg: 2, scope: !3356, file: !71, line: 3450, type: !22)
!3360 = !DILocation(line: 3450, column: 42, scope: !3356)
!3361 = !DILocation(line: 3452, column: 44, scope: !3356)
!3362 = !DILocation(line: 3452, column: 50, scope: !3356)
!3363 = !DILocation(line: 3452, column: 10, scope: !3356)
!3364 = !DILocation(line: 3452, column: 3, scope: !3356)
!3365 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !71, file: !71, line: 3475, type: !389, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3366 = !DILocalVariable(name: "value", arg: 1, scope: !3365, file: !71, line: 3475, type: !13)
!3367 = !DILocation(line: 3475, column: 33, scope: !3365)
!3368 = !DILocalVariable(name: "factor", arg: 2, scope: !3365, file: !71, line: 3475, type: !22)
!3369 = !DILocation(line: 3475, column: 44, scope: !3365)
!3370 = !DILocation(line: 3477, column: 44, scope: !3365)
!3371 = !DILocation(line: 3477, column: 50, scope: !3365)
!3372 = !DILocation(line: 3477, column: 10, scope: !3365)
!3373 = !DILocation(line: 3477, column: 3, scope: !3365)
!3374 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !71, file: !71, line: 3500, type: !389, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3375 = !DILocalVariable(name: "value", arg: 1, scope: !3374, file: !71, line: 3500, type: !13)
!3376 = !DILocation(line: 3500, column: 32, scope: !3374)
!3377 = !DILocalVariable(name: "factor", arg: 2, scope: !3374, file: !71, line: 3500, type: !22)
!3378 = !DILocation(line: 3500, column: 43, scope: !3374)
!3379 = !DILocation(line: 3502, column: 44, scope: !3374)
!3380 = !DILocation(line: 3502, column: 50, scope: !3374)
!3381 = !DILocation(line: 3502, column: 10, scope: !3374)
!3382 = !DILocation(line: 3502, column: 3, scope: !3374)
!3383 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !71, file: !71, line: 3524, type: !389, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3384 = !DILocalVariable(name: "value", arg: 1, scope: !3383, file: !71, line: 3524, type: !13)
!3385 = !DILocation(line: 3524, column: 31, scope: !3383)
!3386 = !DILocalVariable(name: "factor", arg: 2, scope: !3383, file: !71, line: 3524, type: !22)
!3387 = !DILocation(line: 3524, column: 42, scope: !3383)
!3388 = !DILocation(line: 3526, column: 44, scope: !3383)
!3389 = !DILocation(line: 3526, column: 50, scope: !3383)
!3390 = !DILocation(line: 3526, column: 10, scope: !3383)
!3391 = !DILocation(line: 3526, column: 3, scope: !3383)
!3392 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !71, file: !71, line: 3548, type: !389, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3393 = !DILocalVariable(name: "value", arg: 1, scope: !3392, file: !71, line: 3548, type: !13)
!3394 = !DILocation(line: 3548, column: 30, scope: !3392)
!3395 = !DILocalVariable(name: "factor", arg: 2, scope: !3392, file: !71, line: 3548, type: !22)
!3396 = !DILocation(line: 3548, column: 41, scope: !3392)
!3397 = !DILocation(line: 3550, column: 44, scope: !3392)
!3398 = !DILocation(line: 3550, column: 50, scope: !3392)
!3399 = !DILocation(line: 3550, column: 10, scope: !3392)
!3400 = !DILocation(line: 3550, column: 3, scope: !3392)
!3401 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !71, file: !71, line: 3572, type: !389, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3402 = !DILocalVariable(name: "value", arg: 1, scope: !3401, file: !71, line: 3572, type: !13)
!3403 = !DILocation(line: 3572, column: 33, scope: !3401)
!3404 = !DILocalVariable(name: "factor", arg: 2, scope: !3401, file: !71, line: 3572, type: !22)
!3405 = !DILocation(line: 3572, column: 44, scope: !3401)
!3406 = !DILocation(line: 3574, column: 44, scope: !3401)
!3407 = !DILocation(line: 3574, column: 50, scope: !3401)
!3408 = !DILocation(line: 3574, column: 10, scope: !3401)
!3409 = !DILocation(line: 3574, column: 3, scope: !3401)
!3410 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !71, file: !71, line: 3596, type: !389, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3411 = !DILocalVariable(name: "value", arg: 1, scope: !3410, file: !71, line: 3596, type: !13)
!3412 = !DILocation(line: 3596, column: 32, scope: !3410)
!3413 = !DILocalVariable(name: "factor", arg: 2, scope: !3410, file: !71, line: 3596, type: !22)
!3414 = !DILocation(line: 3596, column: 43, scope: !3410)
!3415 = !DILocation(line: 3598, column: 44, scope: !3410)
!3416 = !DILocation(line: 3598, column: 50, scope: !3410)
!3417 = !DILocation(line: 3598, column: 10, scope: !3410)
!3418 = !DILocation(line: 3598, column: 3, scope: !3410)
!3419 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !71, file: !71, line: 3620, type: !389, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3420 = !DILocalVariable(name: "value", arg: 1, scope: !3419, file: !71, line: 3620, type: !13)
!3421 = !DILocation(line: 3620, column: 31, scope: !3419)
!3422 = !DILocalVariable(name: "factor", arg: 2, scope: !3419, file: !71, line: 3620, type: !22)
!3423 = !DILocation(line: 3620, column: 42, scope: !3419)
!3424 = !DILocation(line: 3622, column: 44, scope: !3419)
!3425 = !DILocation(line: 3622, column: 50, scope: !3419)
!3426 = !DILocation(line: 3622, column: 10, scope: !3419)
!3427 = !DILocation(line: 3622, column: 3, scope: !3419)
!3428 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !71, file: !71, line: 3644, type: !389, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3429 = !DILocalVariable(name: "value", arg: 1, scope: !3428, file: !71, line: 3644, type: !13)
!3430 = !DILocation(line: 3644, column: 30, scope: !3428)
!3431 = !DILocalVariable(name: "factor", arg: 2, scope: !3428, file: !71, line: 3644, type: !22)
!3432 = !DILocation(line: 3644, column: 41, scope: !3428)
!3433 = !DILocation(line: 3646, column: 44, scope: !3428)
!3434 = !DILocation(line: 3646, column: 50, scope: !3428)
!3435 = !DILocation(line: 3646, column: 10, scope: !3428)
!3436 = !DILocation(line: 3646, column: 3, scope: !3428)
!3437 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !71, file: !71, line: 3666, type: !474, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3438 = !DILocalVariable(name: "value", arg: 1, scope: !3437, file: !71, line: 3666, type: !13)
!3439 = !DILocation(line: 3666, column: 32, scope: !3437)
!3440 = !DILocalVariable(name: "factor", arg: 2, scope: !3437, file: !71, line: 3666, type: !17)
!3441 = !DILocation(line: 3666, column: 42, scope: !3437)
!3442 = !DILocation(line: 3668, column: 40, scope: !3437)
!3443 = !DILocation(line: 3668, column: 58, scope: !3437)
!3444 = !DILocation(line: 3668, column: 52, scope: !3437)
!3445 = !DILocation(line: 3668, column: 66, scope: !3437)
!3446 = !DILocation(line: 3668, column: 46, scope: !3437)
!3447 = !DILocation(line: 3668, column: 10, scope: !3437)
!3448 = !DILocation(line: 3668, column: 3, scope: !3437)
!3449 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !71, file: !71, line: 3688, type: !474, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3450 = !DILocalVariable(name: "value", arg: 1, scope: !3449, file: !71, line: 3688, type: !13)
!3451 = !DILocation(line: 3688, column: 31, scope: !3449)
!3452 = !DILocalVariable(name: "factor", arg: 2, scope: !3449, file: !71, line: 3688, type: !17)
!3453 = !DILocation(line: 3688, column: 41, scope: !3449)
!3454 = !DILocation(line: 3690, column: 40, scope: !3449)
!3455 = !DILocation(line: 3690, column: 58, scope: !3449)
!3456 = !DILocation(line: 3690, column: 52, scope: !3449)
!3457 = !DILocation(line: 3690, column: 66, scope: !3449)
!3458 = !DILocation(line: 3690, column: 46, scope: !3449)
!3459 = !DILocation(line: 3690, column: 10, scope: !3449)
!3460 = !DILocation(line: 3690, column: 3, scope: !3449)
!3461 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !71, file: !71, line: 3711, type: !474, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3462 = !DILocalVariable(name: "value", arg: 1, scope: !3461, file: !71, line: 3711, type: !13)
!3463 = !DILocation(line: 3711, column: 30, scope: !3461)
!3464 = !DILocalVariable(name: "factor", arg: 2, scope: !3461, file: !71, line: 3711, type: !17)
!3465 = !DILocation(line: 3711, column: 40, scope: !3461)
!3466 = !DILocation(line: 3713, column: 40, scope: !3461)
!3467 = !DILocation(line: 3713, column: 58, scope: !3461)
!3468 = !DILocation(line: 3713, column: 52, scope: !3461)
!3469 = !DILocation(line: 3713, column: 66, scope: !3461)
!3470 = !DILocation(line: 3713, column: 46, scope: !3461)
!3471 = !DILocation(line: 3713, column: 10, scope: !3461)
!3472 = !DILocation(line: 3713, column: 3, scope: !3461)
!3473 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !71, file: !71, line: 3734, type: !474, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3474 = !DILocalVariable(name: "value", arg: 1, scope: !3473, file: !71, line: 3734, type: !13)
!3475 = !DILocation(line: 3734, column: 31, scope: !3473)
!3476 = !DILocalVariable(name: "factor", arg: 2, scope: !3473, file: !71, line: 3734, type: !17)
!3477 = !DILocation(line: 3734, column: 41, scope: !3473)
!3478 = !DILocation(line: 3736, column: 43, scope: !3473)
!3479 = !DILocation(line: 3736, column: 61, scope: !3473)
!3480 = !DILocation(line: 3736, column: 55, scope: !3473)
!3481 = !DILocation(line: 3736, column: 69, scope: !3473)
!3482 = !DILocation(line: 3736, column: 49, scope: !3473)
!3483 = !DILocation(line: 3736, column: 10, scope: !3473)
!3484 = !DILocation(line: 3736, column: 3, scope: !3473)
!3485 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !71, file: !71, line: 3757, type: !474, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3486 = !DILocalVariable(name: "value", arg: 1, scope: !3485, file: !71, line: 3757, type: !13)
!3487 = !DILocation(line: 3757, column: 30, scope: !3485)
!3488 = !DILocalVariable(name: "factor", arg: 2, scope: !3485, file: !71, line: 3757, type: !17)
!3489 = !DILocation(line: 3757, column: 40, scope: !3485)
!3490 = !DILocation(line: 3759, column: 43, scope: !3485)
!3491 = !DILocation(line: 3759, column: 61, scope: !3485)
!3492 = !DILocation(line: 3759, column: 55, scope: !3485)
!3493 = !DILocation(line: 3759, column: 69, scope: !3485)
!3494 = !DILocation(line: 3759, column: 49, scope: !3485)
!3495 = !DILocation(line: 3759, column: 10, scope: !3485)
!3496 = !DILocation(line: 3759, column: 3, scope: !3485)
!3497 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !71, file: !71, line: 3779, type: !474, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3498 = !DILocalVariable(name: "value", arg: 1, scope: !3497, file: !71, line: 3779, type: !13)
!3499 = !DILocation(line: 3779, column: 30, scope: !3497)
!3500 = !DILocalVariable(name: "factor", arg: 2, scope: !3497, file: !71, line: 3779, type: !17)
!3501 = !DILocation(line: 3779, column: 40, scope: !3497)
!3502 = !DILocation(line: 3781, column: 43, scope: !3497)
!3503 = !DILocation(line: 3781, column: 61, scope: !3497)
!3504 = !DILocation(line: 3781, column: 55, scope: !3497)
!3505 = !DILocation(line: 3781, column: 69, scope: !3497)
!3506 = !DILocation(line: 3781, column: 49, scope: !3497)
!3507 = !DILocation(line: 3781, column: 10, scope: !3497)
!3508 = !DILocation(line: 3781, column: 3, scope: !3497)
!3509 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !71, file: !71, line: 3801, type: !474, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3510 = !DILocalVariable(name: "value", arg: 1, scope: !3509, file: !71, line: 3801, type: !13)
!3511 = !DILocation(line: 3801, column: 29, scope: !3509)
!3512 = !DILocalVariable(name: "factor", arg: 2, scope: !3509, file: !71, line: 3801, type: !17)
!3513 = !DILocation(line: 3801, column: 39, scope: !3509)
!3514 = !DILocation(line: 3803, column: 43, scope: !3509)
!3515 = !DILocation(line: 3803, column: 61, scope: !3509)
!3516 = !DILocation(line: 3803, column: 55, scope: !3509)
!3517 = !DILocation(line: 3803, column: 69, scope: !3509)
!3518 = !DILocation(line: 3803, column: 49, scope: !3509)
!3519 = !DILocation(line: 3803, column: 10, scope: !3509)
!3520 = !DILocation(line: 3803, column: 3, scope: !3509)
!3521 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !71, file: !71, line: 3823, type: !474, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3522 = !DILocalVariable(name: "value", arg: 1, scope: !3521, file: !71, line: 3823, type: !13)
!3523 = !DILocation(line: 3823, column: 30, scope: !3521)
!3524 = !DILocalVariable(name: "factor", arg: 2, scope: !3521, file: !71, line: 3823, type: !17)
!3525 = !DILocation(line: 3823, column: 40, scope: !3521)
!3526 = !DILocation(line: 3825, column: 43, scope: !3521)
!3527 = !DILocation(line: 3825, column: 61, scope: !3521)
!3528 = !DILocation(line: 3825, column: 55, scope: !3521)
!3529 = !DILocation(line: 3825, column: 69, scope: !3521)
!3530 = !DILocation(line: 3825, column: 49, scope: !3521)
!3531 = !DILocation(line: 3825, column: 10, scope: !3521)
!3532 = !DILocation(line: 3825, column: 3, scope: !3521)
!3533 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !71, file: !71, line: 3845, type: !474, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3534 = !DILocalVariable(name: "value", arg: 1, scope: !3533, file: !71, line: 3845, type: !13)
!3535 = !DILocation(line: 3845, column: 29, scope: !3533)
!3536 = !DILocalVariable(name: "factor", arg: 2, scope: !3533, file: !71, line: 3845, type: !17)
!3537 = !DILocation(line: 3845, column: 39, scope: !3533)
!3538 = !DILocation(line: 3847, column: 43, scope: !3533)
!3539 = !DILocation(line: 3847, column: 61, scope: !3533)
!3540 = !DILocation(line: 3847, column: 55, scope: !3533)
!3541 = !DILocation(line: 3847, column: 69, scope: !3533)
!3542 = !DILocation(line: 3847, column: 49, scope: !3533)
!3543 = !DILocation(line: 3847, column: 10, scope: !3533)
!3544 = !DILocation(line: 3847, column: 3, scope: !3533)
!3545 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !71, file: !71, line: 3869, type: !1869, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3546 = !DILocalVariable(name: "value", arg: 1, scope: !3545, file: !71, line: 3869, type: !79)
!3547 = !DILocation(line: 3869, column: 31, scope: !3545)
!3548 = !DILocalVariable(name: "factor", arg: 2, scope: !3545, file: !71, line: 3869, type: !13)
!3549 = !DILocation(line: 3869, column: 42, scope: !3545)
!3550 = !DILocation(line: 3871, column: 41, scope: !3545)
!3551 = !DILocation(line: 3871, column: 47, scope: !3545)
!3552 = !DILocation(line: 3871, column: 10, scope: !3545)
!3553 = !DILocation(line: 3871, column: 3, scope: !3545)
!3554 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !71, file: !71, line: 5065, type: !3555, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3555 = !DISubroutineType(types: !3556)
!3556 = !{!79, !79, !13, !735}
!3557 = !DILocalVariable(name: "value", arg: 1, scope: !3554, file: !71, line: 5065, type: !79)
!3558 = !DILocation(line: 5065, column: 40, scope: !3554)
!3559 = !DILocalVariable(name: "factor", arg: 2, scope: !3554, file: !71, line: 5065, type: !13)
!3560 = !DILocation(line: 5065, column: 51, scope: !3554)
!3561 = !DILocalVariable(name: "count", arg: 3, scope: !3554, file: !71, line: 5065, type: !735)
!3562 = !DILocation(line: 5065, column: 63, scope: !3554)
!3563 = !DILocalVariable(name: "u32Temp1", scope: !3554, file: !71, line: 5067, type: !735)
!3564 = !DILocation(line: 5067, column: 6, scope: !3554)
!3565 = !DILocalVariable(name: "u32Temp2", scope: !3554, file: !71, line: 5067, type: !735)
!3566 = !DILocation(line: 5067, column: 17, scope: !3554)
!3567 = !DILocalVariable(name: "u32Temp3", scope: !3554, file: !71, line: 5067, type: !735)
!3568 = !DILocation(line: 5067, column: 26, scope: !3554)
!3569 = !DILocalVariable(name: "u32Temp4", scope: !3554, file: !71, line: 5067, type: !735)
!3570 = !DILocation(line: 5067, column: 35, scope: !3554)
!3571 = !DILocalVariable(name: "u8SignBit", scope: !3554, file: !71, line: 5068, type: !17)
!3572 = !DILocation(line: 5068, column: 5, scope: !3554)
!3573 = !DILocation(line: 5070, column: 7, scope: !3574)
!3574 = distinct !DILexicalBlock(scope: !3554, file: !71, line: 5070, column: 5)
!3575 = !DILocation(line: 5070, column: 12, scope: !3574)
!3576 = !DILocation(line: 5070, column: 16, scope: !3574)
!3577 = !DILocation(line: 5070, column: 20, scope: !3574)
!3578 = !DILocation(line: 5070, column: 26, scope: !3574)
!3579 = !DILocation(line: 5070, column: 31, scope: !3574)
!3580 = !DILocation(line: 5070, column: 36, scope: !3574)
!3581 = !DILocation(line: 5070, column: 41, scope: !3574)
!3582 = !DILocation(line: 5070, column: 45, scope: !3574)
!3583 = !DILocation(line: 5070, column: 49, scope: !3574)
!3584 = !DILocation(line: 5070, column: 55, scope: !3574)
!3585 = !DILocation(line: 5070, column: 5, scope: !3554)
!3586 = !DILocation(line: 5072, column: 13, scope: !3587)
!3587 = distinct !DILexicalBlock(scope: !3574, file: !71, line: 5071, column: 2)
!3588 = !DILocation(line: 5073, column: 2, scope: !3587)
!3589 = !DILocation(line: 5076, column: 13, scope: !3590)
!3590 = distinct !DILexicalBlock(scope: !3574, file: !71, line: 5075, column: 2)
!3591 = !DILocation(line: 5079, column: 5, scope: !3592)
!3592 = distinct !DILexicalBlock(scope: !3554, file: !71, line: 5079, column: 5)
!3593 = !DILocation(line: 5079, column: 10, scope: !3592)
!3594 = !DILocation(line: 5079, column: 5, scope: !3554)
!3595 = !DILocation(line: 5081, column: 15, scope: !3596)
!3596 = distinct !DILexicalBlock(scope: !3592, file: !71, line: 5080, column: 2)
!3597 = !DILocation(line: 5081, column: 14, scope: !3596)
!3598 = !DILocation(line: 5081, column: 12, scope: !3596)
!3599 = !DILocation(line: 5082, column: 2, scope: !3596)
!3600 = !DILocation(line: 5085, column: 14, scope: !3601)
!3601 = distinct !DILexicalBlock(scope: !3592, file: !71, line: 5084, column: 2)
!3602 = !DILocation(line: 5085, column: 12, scope: !3601)
!3603 = !DILocation(line: 5088, column: 5, scope: !3604)
!3604 = distinct !DILexicalBlock(scope: !3554, file: !71, line: 5088, column: 5)
!3605 = !DILocation(line: 5088, column: 11, scope: !3604)
!3606 = !DILocation(line: 5088, column: 5, scope: !3554)
!3607 = !DILocation(line: 5090, column: 15, scope: !3608)
!3608 = distinct !DILexicalBlock(scope: !3604, file: !71, line: 5089, column: 2)
!3609 = !DILocation(line: 5090, column: 14, scope: !3608)
!3610 = !DILocation(line: 5090, column: 12, scope: !3608)
!3611 = !DILocation(line: 5091, column: 2, scope: !3608)
!3612 = !DILocation(line: 5094, column: 14, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3604, file: !71, line: 5093, column: 2)
!3614 = !DILocation(line: 5094, column: 12, scope: !3613)
!3615 = !DILocation(line: 5097, column: 13, scope: !3554)
!3616 = !DILocation(line: 5097, column: 24, scope: !3554)
!3617 = !DILocation(line: 5097, column: 22, scope: !3554)
!3618 = !DILocation(line: 5097, column: 11, scope: !3554)
!3619 = !DILocation(line: 5098, column: 25, scope: !3554)
!3620 = !DILocation(line: 5098, column: 35, scope: !3554)
!3621 = !DILocation(line: 5098, column: 13, scope: !3554)
!3622 = !DILocation(line: 5098, column: 11, scope: !3554)
!3623 = !DILocation(line: 5099, column: 13, scope: !3554)
!3624 = !DILocation(line: 5099, column: 25, scope: !3554)
!3625 = !DILocation(line: 5099, column: 22, scope: !3554)
!3626 = !DILocation(line: 5099, column: 11, scope: !3554)
!3627 = !DILocation(line: 5100, column: 14, scope: !3554)
!3628 = !DILocation(line: 5100, column: 30, scope: !3554)
!3629 = !DILocation(line: 5100, column: 29, scope: !3554)
!3630 = !DILocation(line: 5100, column: 23, scope: !3554)
!3631 = !DILocation(line: 5100, column: 11, scope: !3554)
!3632 = !DILocation(line: 5101, column: 6, scope: !3633)
!3633 = distinct !DILexicalBlock(scope: !3554, file: !71, line: 5101, column: 5)
!3634 = !DILocation(line: 5101, column: 16, scope: !3633)
!3635 = !DILocation(line: 5101, column: 14, scope: !3633)
!3636 = !DILocation(line: 5101, column: 22, scope: !3633)
!3637 = !DILocation(line: 5101, column: 5, scope: !3554)
!3638 = !DILocation(line: 5103, column: 6, scope: !3639)
!3639 = distinct !DILexicalBlock(scope: !3640, file: !71, line: 5103, column: 6)
!3640 = distinct !DILexicalBlock(scope: !3633, file: !71, line: 5102, column: 2)
!3641 = !DILocation(line: 5103, column: 16, scope: !3639)
!3642 = !DILocation(line: 5103, column: 6, scope: !3640)
!3643 = !DILocation(line: 5105, column: 7, scope: !3644)
!3644 = distinct !DILexicalBlock(scope: !3645, file: !71, line: 5105, column: 7)
!3645 = distinct !DILexicalBlock(scope: !3639, file: !71, line: 5104, column: 3)
!3646 = !DILocation(line: 5105, column: 15, scope: !3644)
!3647 = !DILocation(line: 5105, column: 7, scope: !3645)
!3648 = !DILocation(line: 5106, column: 12, scope: !3644)
!3649 = !DILocation(line: 5106, column: 5, scope: !3644)
!3650 = !DILocation(line: 5108, column: 5, scope: !3644)
!3651 = !DILocation(line: 5112, column: 7, scope: !3652)
!3652 = distinct !DILexicalBlock(scope: !3653, file: !71, line: 5112, column: 7)
!3653 = distinct !DILexicalBlock(scope: !3639, file: !71, line: 5111, column: 3)
!3654 = !DILocation(line: 5112, column: 15, scope: !3652)
!3655 = !DILocation(line: 5112, column: 7, scope: !3653)
!3656 = !DILocation(line: 5113, column: 13, scope: !3652)
!3657 = !DILocation(line: 5113, column: 12, scope: !3652)
!3658 = !DILocation(line: 5113, column: 5, scope: !3652)
!3659 = !DILocation(line: 5115, column: 5, scope: !3652)
!3660 = !DILocation(line: 5120, column: 3, scope: !3661)
!3661 = distinct !DILexicalBlock(scope: !3633, file: !71, line: 5119, column: 2)
!3662 = !DILocation(line: 5122, column: 1, scope: !3554)
!3663 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !71, file: !71, line: 3893, type: !2654, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3664 = !DILocalVariable(name: "value", arg: 1, scope: !3663, file: !71, line: 3893, type: !79)
!3665 = !DILocation(line: 3893, column: 30, scope: !3663)
!3666 = !DILocalVariable(name: "factor", arg: 2, scope: !3663, file: !71, line: 3893, type: !6)
!3667 = !DILocation(line: 3893, column: 40, scope: !3663)
!3668 = !DILocation(line: 3895, column: 40, scope: !3663)
!3669 = !DILocation(line: 3895, column: 46, scope: !3663)
!3670 = !DILocation(line: 3895, column: 10, scope: !3663)
!3671 = !DILocation(line: 3895, column: 3, scope: !3663)
!3672 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !71, file: !71, line: 5217, type: !3673, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3673 = !DISubroutineType(types: !3674)
!3674 = !{!79, !79, !6, !735}
!3675 = !DILocalVariable(name: "value", arg: 1, scope: !3672, file: !71, line: 5217, type: !79)
!3676 = !DILocation(line: 5217, column: 39, scope: !3672)
!3677 = !DILocalVariable(name: "factor", arg: 2, scope: !3672, file: !71, line: 5217, type: !6)
!3678 = !DILocation(line: 5217, column: 49, scope: !3672)
!3679 = !DILocalVariable(name: "count", arg: 3, scope: !3672, file: !71, line: 5217, type: !735)
!3680 = !DILocation(line: 5217, column: 61, scope: !3672)
!3681 = !DILocalVariable(name: "u32Temp1", scope: !3672, file: !71, line: 5219, type: !735)
!3682 = !DILocation(line: 5219, column: 6, scope: !3672)
!3683 = !DILocalVariable(name: "u32Temp2", scope: !3672, file: !71, line: 5219, type: !735)
!3684 = !DILocation(line: 5219, column: 17, scope: !3672)
!3685 = !DILocalVariable(name: "u32Temp3", scope: !3672, file: !71, line: 5219, type: !735)
!3686 = !DILocation(line: 5219, column: 26, scope: !3672)
!3687 = !DILocalVariable(name: "u32Temp4", scope: !3672, file: !71, line: 5219, type: !735)
!3688 = !DILocation(line: 5219, column: 35, scope: !3672)
!3689 = !DILocalVariable(name: "u8SignBit", scope: !3672, file: !71, line: 5220, type: !17)
!3690 = !DILocation(line: 5220, column: 5, scope: !3672)
!3691 = !DILocation(line: 5222, column: 7, scope: !3692)
!3692 = distinct !DILexicalBlock(scope: !3672, file: !71, line: 5222, column: 5)
!3693 = !DILocation(line: 5222, column: 12, scope: !3692)
!3694 = !DILocation(line: 5222, column: 16, scope: !3692)
!3695 = !DILocation(line: 5222, column: 20, scope: !3692)
!3696 = !DILocation(line: 5222, column: 26, scope: !3692)
!3697 = !DILocation(line: 5222, column: 31, scope: !3692)
!3698 = !DILocation(line: 5222, column: 36, scope: !3692)
!3699 = !DILocation(line: 5222, column: 41, scope: !3692)
!3700 = !DILocation(line: 5222, column: 45, scope: !3692)
!3701 = !DILocation(line: 5222, column: 49, scope: !3692)
!3702 = !DILocation(line: 5222, column: 55, scope: !3692)
!3703 = !DILocation(line: 5222, column: 5, scope: !3672)
!3704 = !DILocation(line: 5224, column: 13, scope: !3705)
!3705 = distinct !DILexicalBlock(scope: !3692, file: !71, line: 5223, column: 2)
!3706 = !DILocation(line: 5225, column: 2, scope: !3705)
!3707 = !DILocation(line: 5228, column: 13, scope: !3708)
!3708 = distinct !DILexicalBlock(scope: !3692, file: !71, line: 5227, column: 2)
!3709 = !DILocation(line: 5231, column: 5, scope: !3710)
!3710 = distinct !DILexicalBlock(scope: !3672, file: !71, line: 5231, column: 5)
!3711 = !DILocation(line: 5231, column: 10, scope: !3710)
!3712 = !DILocation(line: 5231, column: 5, scope: !3672)
!3713 = !DILocation(line: 5233, column: 15, scope: !3714)
!3714 = distinct !DILexicalBlock(scope: !3710, file: !71, line: 5232, column: 2)
!3715 = !DILocation(line: 5233, column: 14, scope: !3714)
!3716 = !DILocation(line: 5233, column: 12, scope: !3714)
!3717 = !DILocation(line: 5234, column: 2, scope: !3714)
!3718 = !DILocation(line: 5237, column: 14, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3710, file: !71, line: 5236, column: 2)
!3720 = !DILocation(line: 5237, column: 12, scope: !3719)
!3721 = !DILocation(line: 5240, column: 5, scope: !3722)
!3722 = distinct !DILexicalBlock(scope: !3672, file: !71, line: 5240, column: 5)
!3723 = !DILocation(line: 5240, column: 11, scope: !3722)
!3724 = !DILocation(line: 5240, column: 5, scope: !3672)
!3725 = !DILocation(line: 5242, column: 15, scope: !3726)
!3726 = distinct !DILexicalBlock(scope: !3722, file: !71, line: 5241, column: 2)
!3727 = !DILocation(line: 5242, column: 14, scope: !3726)
!3728 = !DILocation(line: 5242, column: 12, scope: !3726)
!3729 = !DILocation(line: 5243, column: 2, scope: !3726)
!3730 = !DILocation(line: 5246, column: 14, scope: !3731)
!3731 = distinct !DILexicalBlock(scope: !3722, file: !71, line: 5245, column: 2)
!3732 = !DILocation(line: 5246, column: 12, scope: !3731)
!3733 = !DILocation(line: 5249, column: 13, scope: !3672)
!3734 = !DILocation(line: 5249, column: 24, scope: !3672)
!3735 = !DILocation(line: 5249, column: 22, scope: !3672)
!3736 = !DILocation(line: 5249, column: 11, scope: !3672)
!3737 = !DILocation(line: 5250, column: 25, scope: !3672)
!3738 = !DILocation(line: 5250, column: 35, scope: !3672)
!3739 = !DILocation(line: 5250, column: 13, scope: !3672)
!3740 = !DILocation(line: 5250, column: 11, scope: !3672)
!3741 = !DILocation(line: 5251, column: 13, scope: !3672)
!3742 = !DILocation(line: 5251, column: 25, scope: !3672)
!3743 = !DILocation(line: 5251, column: 22, scope: !3672)
!3744 = !DILocation(line: 5251, column: 11, scope: !3672)
!3745 = !DILocation(line: 5252, column: 14, scope: !3672)
!3746 = !DILocation(line: 5252, column: 30, scope: !3672)
!3747 = !DILocation(line: 5252, column: 29, scope: !3672)
!3748 = !DILocation(line: 5252, column: 23, scope: !3672)
!3749 = !DILocation(line: 5252, column: 11, scope: !3672)
!3750 = !DILocation(line: 5253, column: 6, scope: !3751)
!3751 = distinct !DILexicalBlock(scope: !3672, file: !71, line: 5253, column: 5)
!3752 = !DILocation(line: 5253, column: 16, scope: !3751)
!3753 = !DILocation(line: 5253, column: 14, scope: !3751)
!3754 = !DILocation(line: 5253, column: 22, scope: !3751)
!3755 = !DILocation(line: 5253, column: 5, scope: !3672)
!3756 = !DILocation(line: 5255, column: 6, scope: !3757)
!3757 = distinct !DILexicalBlock(scope: !3758, file: !71, line: 5255, column: 6)
!3758 = distinct !DILexicalBlock(scope: !3751, file: !71, line: 5254, column: 2)
!3759 = !DILocation(line: 5255, column: 16, scope: !3757)
!3760 = !DILocation(line: 5255, column: 6, scope: !3758)
!3761 = !DILocation(line: 5257, column: 7, scope: !3762)
!3762 = distinct !DILexicalBlock(scope: !3763, file: !71, line: 5257, column: 7)
!3763 = distinct !DILexicalBlock(scope: !3757, file: !71, line: 5256, column: 3)
!3764 = !DILocation(line: 5257, column: 15, scope: !3762)
!3765 = !DILocation(line: 5257, column: 7, scope: !3763)
!3766 = !DILocation(line: 5258, column: 12, scope: !3762)
!3767 = !DILocation(line: 5258, column: 5, scope: !3762)
!3768 = !DILocation(line: 5260, column: 5, scope: !3762)
!3769 = !DILocation(line: 5264, column: 7, scope: !3770)
!3770 = distinct !DILexicalBlock(scope: !3771, file: !71, line: 5264, column: 7)
!3771 = distinct !DILexicalBlock(scope: !3757, file: !71, line: 5263, column: 3)
!3772 = !DILocation(line: 5264, column: 15, scope: !3770)
!3773 = !DILocation(line: 5264, column: 7, scope: !3771)
!3774 = !DILocation(line: 5265, column: 13, scope: !3770)
!3775 = !DILocation(line: 5265, column: 12, scope: !3770)
!3776 = !DILocation(line: 5265, column: 5, scope: !3770)
!3777 = !DILocation(line: 5267, column: 5, scope: !3770)
!3778 = !DILocation(line: 5272, column: 3, scope: !3779)
!3779 = distinct !DILexicalBlock(scope: !3751, file: !71, line: 5271, column: 2)
!3780 = !DILocation(line: 5274, column: 1, scope: !3672)
!3781 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !71, file: !71, line: 3917, type: !774, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3782 = !DILocalVariable(name: "value", arg: 1, scope: !3781, file: !71, line: 3917, type: !79)
!3783 = !DILocation(line: 3917, column: 31, scope: !3781)
!3784 = !DILocalVariable(name: "factor", arg: 2, scope: !3781, file: !71, line: 3917, type: !22)
!3785 = !DILocation(line: 3917, column: 42, scope: !3781)
!3786 = !DILocation(line: 3919, column: 41, scope: !3781)
!3787 = !DILocation(line: 3919, column: 47, scope: !3781)
!3788 = !DILocation(line: 3919, column: 10, scope: !3781)
!3789 = !DILocation(line: 3919, column: 3, scope: !3781)
!3790 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !71, file: !71, line: 5141, type: !3791, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3791 = !DISubroutineType(types: !3792)
!3792 = !{!79, !79, !22, !735}
!3793 = !DILocalVariable(name: "value", arg: 1, scope: !3790, file: !71, line: 5141, type: !79)
!3794 = !DILocation(line: 5141, column: 40, scope: !3790)
!3795 = !DILocalVariable(name: "factor", arg: 2, scope: !3790, file: !71, line: 5141, type: !22)
!3796 = !DILocation(line: 5141, column: 50, scope: !3790)
!3797 = !DILocalVariable(name: "count", arg: 3, scope: !3790, file: !71, line: 5141, type: !735)
!3798 = !DILocation(line: 5141, column: 62, scope: !3790)
!3799 = !DILocalVariable(name: "u32Temp1", scope: !3790, file: !71, line: 5143, type: !735)
!3800 = !DILocation(line: 5143, column: 6, scope: !3790)
!3801 = !DILocalVariable(name: "u32Temp2", scope: !3790, file: !71, line: 5143, type: !735)
!3802 = !DILocation(line: 5143, column: 17, scope: !3790)
!3803 = !DILocalVariable(name: "u32Temp3", scope: !3790, file: !71, line: 5143, type: !735)
!3804 = !DILocation(line: 5143, column: 26, scope: !3790)
!3805 = !DILocalVariable(name: "u32Temp4", scope: !3790, file: !71, line: 5143, type: !735)
!3806 = !DILocation(line: 5143, column: 35, scope: !3790)
!3807 = !DILocalVariable(name: "u8SignBit", scope: !3790, file: !71, line: 5144, type: !17)
!3808 = !DILocation(line: 5144, column: 5, scope: !3790)
!3809 = !DILocation(line: 5146, column: 7, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3790, file: !71, line: 5146, column: 5)
!3811 = !DILocation(line: 5146, column: 12, scope: !3810)
!3812 = !DILocation(line: 5146, column: 16, scope: !3810)
!3813 = !DILocation(line: 5146, column: 20, scope: !3810)
!3814 = !DILocation(line: 5146, column: 26, scope: !3810)
!3815 = !DILocation(line: 5146, column: 31, scope: !3810)
!3816 = !DILocation(line: 5146, column: 36, scope: !3810)
!3817 = !DILocation(line: 5146, column: 41, scope: !3810)
!3818 = !DILocation(line: 5146, column: 45, scope: !3810)
!3819 = !DILocation(line: 5146, column: 49, scope: !3810)
!3820 = !DILocation(line: 5146, column: 55, scope: !3810)
!3821 = !DILocation(line: 5146, column: 5, scope: !3790)
!3822 = !DILocation(line: 5148, column: 13, scope: !3823)
!3823 = distinct !DILexicalBlock(scope: !3810, file: !71, line: 5147, column: 2)
!3824 = !DILocation(line: 5149, column: 2, scope: !3823)
!3825 = !DILocation(line: 5152, column: 13, scope: !3826)
!3826 = distinct !DILexicalBlock(scope: !3810, file: !71, line: 5151, column: 2)
!3827 = !DILocation(line: 5155, column: 5, scope: !3828)
!3828 = distinct !DILexicalBlock(scope: !3790, file: !71, line: 5155, column: 5)
!3829 = !DILocation(line: 5155, column: 10, scope: !3828)
!3830 = !DILocation(line: 5155, column: 5, scope: !3790)
!3831 = !DILocation(line: 5157, column: 15, scope: !3832)
!3832 = distinct !DILexicalBlock(scope: !3828, file: !71, line: 5156, column: 2)
!3833 = !DILocation(line: 5157, column: 14, scope: !3832)
!3834 = !DILocation(line: 5157, column: 12, scope: !3832)
!3835 = !DILocation(line: 5158, column: 2, scope: !3832)
!3836 = !DILocation(line: 5161, column: 14, scope: !3837)
!3837 = distinct !DILexicalBlock(scope: !3828, file: !71, line: 5160, column: 2)
!3838 = !DILocation(line: 5161, column: 12, scope: !3837)
!3839 = !DILocation(line: 5164, column: 5, scope: !3840)
!3840 = distinct !DILexicalBlock(scope: !3790, file: !71, line: 5164, column: 5)
!3841 = !DILocation(line: 5164, column: 11, scope: !3840)
!3842 = !DILocation(line: 5164, column: 5, scope: !3790)
!3843 = !DILocation(line: 5166, column: 15, scope: !3844)
!3844 = distinct !DILexicalBlock(scope: !3840, file: !71, line: 5165, column: 2)
!3845 = !DILocation(line: 5166, column: 14, scope: !3844)
!3846 = !DILocation(line: 5166, column: 12, scope: !3844)
!3847 = !DILocation(line: 5167, column: 2, scope: !3844)
!3848 = !DILocation(line: 5170, column: 14, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3840, file: !71, line: 5169, column: 2)
!3850 = !DILocation(line: 5170, column: 12, scope: !3849)
!3851 = !DILocation(line: 5173, column: 13, scope: !3790)
!3852 = !DILocation(line: 5173, column: 24, scope: !3790)
!3853 = !DILocation(line: 5173, column: 22, scope: !3790)
!3854 = !DILocation(line: 5173, column: 11, scope: !3790)
!3855 = !DILocation(line: 5174, column: 25, scope: !3790)
!3856 = !DILocation(line: 5174, column: 35, scope: !3790)
!3857 = !DILocation(line: 5174, column: 13, scope: !3790)
!3858 = !DILocation(line: 5174, column: 11, scope: !3790)
!3859 = !DILocation(line: 5175, column: 13, scope: !3790)
!3860 = !DILocation(line: 5175, column: 25, scope: !3790)
!3861 = !DILocation(line: 5175, column: 22, scope: !3790)
!3862 = !DILocation(line: 5175, column: 11, scope: !3790)
!3863 = !DILocation(line: 5176, column: 14, scope: !3790)
!3864 = !DILocation(line: 5176, column: 30, scope: !3790)
!3865 = !DILocation(line: 5176, column: 29, scope: !3790)
!3866 = !DILocation(line: 5176, column: 23, scope: !3790)
!3867 = !DILocation(line: 5176, column: 11, scope: !3790)
!3868 = !DILocation(line: 5177, column: 6, scope: !3869)
!3869 = distinct !DILexicalBlock(scope: !3790, file: !71, line: 5177, column: 5)
!3870 = !DILocation(line: 5177, column: 16, scope: !3869)
!3871 = !DILocation(line: 5177, column: 14, scope: !3869)
!3872 = !DILocation(line: 5177, column: 22, scope: !3869)
!3873 = !DILocation(line: 5177, column: 5, scope: !3790)
!3874 = !DILocation(line: 5179, column: 6, scope: !3875)
!3875 = distinct !DILexicalBlock(scope: !3876, file: !71, line: 5179, column: 6)
!3876 = distinct !DILexicalBlock(scope: !3869, file: !71, line: 5178, column: 2)
!3877 = !DILocation(line: 5179, column: 16, scope: !3875)
!3878 = !DILocation(line: 5179, column: 6, scope: !3876)
!3879 = !DILocation(line: 5181, column: 7, scope: !3880)
!3880 = distinct !DILexicalBlock(scope: !3881, file: !71, line: 5181, column: 7)
!3881 = distinct !DILexicalBlock(scope: !3875, file: !71, line: 5180, column: 3)
!3882 = !DILocation(line: 5181, column: 15, scope: !3880)
!3883 = !DILocation(line: 5181, column: 7, scope: !3881)
!3884 = !DILocation(line: 5182, column: 12, scope: !3880)
!3885 = !DILocation(line: 5182, column: 5, scope: !3880)
!3886 = !DILocation(line: 5184, column: 5, scope: !3880)
!3887 = !DILocation(line: 5188, column: 7, scope: !3888)
!3888 = distinct !DILexicalBlock(scope: !3889, file: !71, line: 5188, column: 7)
!3889 = distinct !DILexicalBlock(scope: !3875, file: !71, line: 5187, column: 3)
!3890 = !DILocation(line: 5188, column: 15, scope: !3888)
!3891 = !DILocation(line: 5188, column: 7, scope: !3889)
!3892 = !DILocation(line: 5189, column: 13, scope: !3888)
!3893 = !DILocation(line: 5189, column: 12, scope: !3888)
!3894 = !DILocation(line: 5189, column: 5, scope: !3888)
!3895 = !DILocation(line: 5191, column: 5, scope: !3888)
!3896 = !DILocation(line: 5196, column: 3, scope: !3897)
!3897 = distinct !DILexicalBlock(scope: !3869, file: !71, line: 5195, column: 2)
!3898 = !DILocation(line: 5198, column: 1, scope: !3790)
!3899 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !71, file: !71, line: 3941, type: !2359, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3900 = !DILocalVariable(name: "value", arg: 1, scope: !3899, file: !71, line: 3941, type: !79)
!3901 = !DILocation(line: 3941, column: 30, scope: !3899)
!3902 = !DILocalVariable(name: "factor", arg: 2, scope: !3899, file: !71, line: 3941, type: !17)
!3903 = !DILocation(line: 3941, column: 40, scope: !3899)
!3904 = !DILocation(line: 3943, column: 40, scope: !3899)
!3905 = !DILocation(line: 3943, column: 46, scope: !3899)
!3906 = !DILocation(line: 3943, column: 10, scope: !3899)
!3907 = !DILocation(line: 3943, column: 3, scope: !3899)
!3908 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !71, file: !71, line: 5536, type: !3909, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3909 = !DISubroutineType(types: !3910)
!3910 = !{!79, !79, !17, !735}
!3911 = !DILocalVariable(name: "value", arg: 1, scope: !3908, file: !71, line: 5536, type: !79)
!3912 = !DILocation(line: 5536, column: 39, scope: !3908)
!3913 = !DILocalVariable(name: "factor", arg: 2, scope: !3908, file: !71, line: 5536, type: !17)
!3914 = !DILocation(line: 5536, column: 49, scope: !3908)
!3915 = !DILocalVariable(name: "count", arg: 3, scope: !3908, file: !71, line: 5536, type: !735)
!3916 = !DILocation(line: 5536, column: 61, scope: !3908)
!3917 = !DILocalVariable(name: "u32Temp1", scope: !3908, file: !71, line: 5538, type: !735)
!3918 = !DILocation(line: 5538, column: 6, scope: !3908)
!3919 = !DILocalVariable(name: "u32Temp2", scope: !3908, file: !71, line: 5538, type: !735)
!3920 = !DILocation(line: 5538, column: 17, scope: !3908)
!3921 = !DILocalVariable(name: "u32Temp3", scope: !3908, file: !71, line: 5538, type: !735)
!3922 = !DILocation(line: 5538, column: 26, scope: !3908)
!3923 = !DILocalVariable(name: "u8SignBit", scope: !3908, file: !71, line: 5539, type: !17)
!3924 = !DILocation(line: 5539, column: 5, scope: !3908)
!3925 = !DILocation(line: 5541, column: 5, scope: !3926)
!3926 = distinct !DILexicalBlock(scope: !3908, file: !71, line: 5541, column: 5)
!3927 = !DILocation(line: 5541, column: 10, scope: !3926)
!3928 = !DILocation(line: 5541, column: 5, scope: !3908)
!3929 = !DILocation(line: 5543, column: 13, scope: !3930)
!3930 = distinct !DILexicalBlock(scope: !3926, file: !71, line: 5542, column: 2)
!3931 = !DILocation(line: 5544, column: 15, scope: !3930)
!3932 = !DILocation(line: 5544, column: 14, scope: !3930)
!3933 = !DILocation(line: 5544, column: 12, scope: !3930)
!3934 = !DILocation(line: 5545, column: 2, scope: !3930)
!3935 = !DILocation(line: 5548, column: 13, scope: !3936)
!3936 = distinct !DILexicalBlock(scope: !3926, file: !71, line: 5547, column: 2)
!3937 = !DILocation(line: 5549, column: 14, scope: !3936)
!3938 = !DILocation(line: 5549, column: 12, scope: !3936)
!3939 = !DILocation(line: 5552, column: 13, scope: !3908)
!3940 = !DILocation(line: 5552, column: 24, scope: !3908)
!3941 = !DILocation(line: 5552, column: 22, scope: !3908)
!3942 = !DILocation(line: 5552, column: 11, scope: !3908)
!3943 = !DILocation(line: 5553, column: 25, scope: !3908)
!3944 = !DILocation(line: 5553, column: 34, scope: !3908)
!3945 = !DILocation(line: 5553, column: 13, scope: !3908)
!3946 = !DILocation(line: 5553, column: 11, scope: !3908)
!3947 = !DILocation(line: 5554, column: 13, scope: !3908)
!3948 = !DILocation(line: 5554, column: 25, scope: !3908)
!3949 = !DILocation(line: 5554, column: 22, scope: !3908)
!3950 = !DILocation(line: 5554, column: 11, scope: !3908)
!3951 = !DILocation(line: 5555, column: 14, scope: !3908)
!3952 = !DILocation(line: 5555, column: 30, scope: !3908)
!3953 = !DILocation(line: 5555, column: 29, scope: !3908)
!3954 = !DILocation(line: 5555, column: 23, scope: !3908)
!3955 = !DILocation(line: 5555, column: 11, scope: !3908)
!3956 = !DILocation(line: 5556, column: 6, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3908, file: !71, line: 5556, column: 5)
!3958 = !DILocation(line: 5556, column: 16, scope: !3957)
!3959 = !DILocation(line: 5556, column: 14, scope: !3957)
!3960 = !DILocation(line: 5556, column: 22, scope: !3957)
!3961 = !DILocation(line: 5556, column: 5, scope: !3908)
!3962 = !DILocation(line: 5558, column: 6, scope: !3963)
!3963 = distinct !DILexicalBlock(scope: !3964, file: !71, line: 5558, column: 6)
!3964 = distinct !DILexicalBlock(scope: !3957, file: !71, line: 5557, column: 2)
!3965 = !DILocation(line: 5558, column: 16, scope: !3963)
!3966 = !DILocation(line: 5558, column: 6, scope: !3964)
!3967 = !DILocation(line: 5560, column: 7, scope: !3968)
!3968 = distinct !DILexicalBlock(scope: !3969, file: !71, line: 5560, column: 7)
!3969 = distinct !DILexicalBlock(scope: !3963, file: !71, line: 5559, column: 3)
!3970 = !DILocation(line: 5560, column: 15, scope: !3968)
!3971 = !DILocation(line: 5560, column: 7, scope: !3969)
!3972 = !DILocation(line: 5561, column: 12, scope: !3968)
!3973 = !DILocation(line: 5561, column: 5, scope: !3968)
!3974 = !DILocation(line: 5563, column: 5, scope: !3968)
!3975 = !DILocation(line: 5567, column: 7, scope: !3976)
!3976 = distinct !DILexicalBlock(scope: !3977, file: !71, line: 5567, column: 7)
!3977 = distinct !DILexicalBlock(scope: !3963, file: !71, line: 5566, column: 3)
!3978 = !DILocation(line: 5567, column: 15, scope: !3976)
!3979 = !DILocation(line: 5567, column: 7, scope: !3977)
!3980 = !DILocation(line: 5569, column: 13, scope: !3981)
!3981 = distinct !DILexicalBlock(scope: !3976, file: !71, line: 5568, column: 4)
!3982 = !DILocation(line: 5569, column: 12, scope: !3981)
!3983 = !DILocation(line: 5569, column: 5, scope: !3981)
!3984 = !DILocation(line: 5573, column: 5, scope: !3985)
!3985 = distinct !DILexicalBlock(scope: !3976, file: !71, line: 5572, column: 4)
!3986 = !DILocation(line: 5579, column: 6, scope: !3987)
!3987 = distinct !DILexicalBlock(scope: !3988, file: !71, line: 5579, column: 6)
!3988 = distinct !DILexicalBlock(scope: !3957, file: !71, line: 5578, column: 2)
!3989 = !DILocation(line: 5579, column: 16, scope: !3987)
!3990 = !DILocation(line: 5579, column: 6, scope: !3988)
!3991 = !DILocation(line: 5581, column: 4, scope: !3992)
!3992 = distinct !DILexicalBlock(scope: !3987, file: !71, line: 5580, column: 3)
!3993 = !DILocation(line: 5585, column: 4, scope: !3994)
!3994 = distinct !DILexicalBlock(scope: !3987, file: !71, line: 5584, column: 3)
!3995 = !DILocation(line: 5588, column: 1, scope: !3908)
!3996 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !71, file: !71, line: 3965, type: !158, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3997 = !DILocalVariable(name: "value", arg: 1, scope: !3996, file: !71, line: 3965, type: !6)
!3998 = !DILocation(line: 3965, column: 28, scope: !3996)
!3999 = !DILocalVariable(name: "factor", arg: 2, scope: !3996, file: !71, line: 3965, type: !17)
!4000 = !DILocation(line: 3965, column: 38, scope: !3996)
!4001 = !DILocation(line: 3967, column: 38, scope: !3996)
!4002 = !DILocation(line: 3967, column: 56, scope: !3996)
!4003 = !DILocation(line: 3967, column: 50, scope: !3996)
!4004 = !DILocation(line: 3967, column: 64, scope: !3996)
!4005 = !DILocation(line: 3967, column: 44, scope: !3996)
!4006 = !DILocation(line: 3967, column: 10, scope: !3996)
!4007 = !DILocation(line: 3967, column: 3, scope: !3996)
!4008 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !71, file: !71, line: 3989, type: !158, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4009 = !DILocalVariable(name: "value", arg: 1, scope: !4008, file: !71, line: 3989, type: !6)
!4010 = !DILocation(line: 3989, column: 27, scope: !4008)
!4011 = !DILocalVariable(name: "factor", arg: 2, scope: !4008, file: !71, line: 3989, type: !17)
!4012 = !DILocation(line: 3989, column: 37, scope: !4008)
!4013 = !DILocation(line: 3991, column: 38, scope: !4008)
!4014 = !DILocation(line: 3991, column: 56, scope: !4008)
!4015 = !DILocation(line: 3991, column: 50, scope: !4008)
!4016 = !DILocation(line: 3991, column: 64, scope: !4008)
!4017 = !DILocation(line: 3991, column: 44, scope: !4008)
!4018 = !DILocation(line: 3991, column: 10, scope: !4008)
!4019 = !DILocation(line: 3991, column: 3, scope: !4008)
!4020 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !71, file: !71, line: 4014, type: !158, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4021 = !DILocalVariable(name: "value", arg: 1, scope: !4020, file: !71, line: 4014, type: !6)
!4022 = !DILocation(line: 4014, column: 26, scope: !4020)
!4023 = !DILocalVariable(name: "factor", arg: 2, scope: !4020, file: !71, line: 4014, type: !17)
!4024 = !DILocation(line: 4014, column: 36, scope: !4020)
!4025 = !DILocation(line: 4016, column: 38, scope: !4020)
!4026 = !DILocation(line: 4016, column: 56, scope: !4020)
!4027 = !DILocation(line: 4016, column: 50, scope: !4020)
!4028 = !DILocation(line: 4016, column: 64, scope: !4020)
!4029 = !DILocation(line: 4016, column: 44, scope: !4020)
!4030 = !DILocation(line: 4016, column: 10, scope: !4020)
!4031 = !DILocation(line: 4016, column: 3, scope: !4020)
!4032 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !71, file: !71, line: 4039, type: !158, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4033 = !DILocalVariable(name: "value", arg: 1, scope: !4032, file: !71, line: 4039, type: !6)
!4034 = !DILocation(line: 4039, column: 27, scope: !4032)
!4035 = !DILocalVariable(name: "factor", arg: 2, scope: !4032, file: !71, line: 4039, type: !17)
!4036 = !DILocation(line: 4039, column: 37, scope: !4032)
!4037 = !DILocation(line: 4041, column: 41, scope: !4032)
!4038 = !DILocation(line: 4041, column: 59, scope: !4032)
!4039 = !DILocation(line: 4041, column: 53, scope: !4032)
!4040 = !DILocation(line: 4041, column: 67, scope: !4032)
!4041 = !DILocation(line: 4041, column: 47, scope: !4032)
!4042 = !DILocation(line: 4041, column: 10, scope: !4032)
!4043 = !DILocation(line: 4041, column: 3, scope: !4032)
!4044 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !71, file: !71, line: 4064, type: !158, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4045 = !DILocalVariable(name: "value", arg: 1, scope: !4044, file: !71, line: 4064, type: !6)
!4046 = !DILocation(line: 4064, column: 26, scope: !4044)
!4047 = !DILocalVariable(name: "factor", arg: 2, scope: !4044, file: !71, line: 4064, type: !17)
!4048 = !DILocation(line: 4064, column: 36, scope: !4044)
!4049 = !DILocation(line: 4066, column: 41, scope: !4044)
!4050 = !DILocation(line: 4066, column: 59, scope: !4044)
!4051 = !DILocation(line: 4066, column: 53, scope: !4044)
!4052 = !DILocation(line: 4066, column: 67, scope: !4044)
!4053 = !DILocation(line: 4066, column: 47, scope: !4044)
!4054 = !DILocation(line: 4066, column: 10, scope: !4044)
!4055 = !DILocation(line: 4066, column: 3, scope: !4044)
!4056 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !71, file: !71, line: 4088, type: !158, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4057 = !DILocalVariable(name: "value", arg: 1, scope: !4056, file: !71, line: 4088, type: !6)
!4058 = !DILocation(line: 4088, column: 26, scope: !4056)
!4059 = !DILocalVariable(name: "factor", arg: 2, scope: !4056, file: !71, line: 4088, type: !17)
!4060 = !DILocation(line: 4088, column: 36, scope: !4056)
!4061 = !DILocation(line: 4090, column: 41, scope: !4056)
!4062 = !DILocation(line: 4090, column: 59, scope: !4056)
!4063 = !DILocation(line: 4090, column: 53, scope: !4056)
!4064 = !DILocation(line: 4090, column: 67, scope: !4056)
!4065 = !DILocation(line: 4090, column: 47, scope: !4056)
!4066 = !DILocation(line: 4090, column: 10, scope: !4056)
!4067 = !DILocation(line: 4090, column: 3, scope: !4056)
!4068 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !71, file: !71, line: 4112, type: !158, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4069 = !DILocalVariable(name: "value", arg: 1, scope: !4068, file: !71, line: 4112, type: !6)
!4070 = !DILocation(line: 4112, column: 25, scope: !4068)
!4071 = !DILocalVariable(name: "factor", arg: 2, scope: !4068, file: !71, line: 4112, type: !17)
!4072 = !DILocation(line: 4112, column: 35, scope: !4068)
!4073 = !DILocation(line: 4114, column: 41, scope: !4068)
!4074 = !DILocation(line: 4114, column: 59, scope: !4068)
!4075 = !DILocation(line: 4114, column: 53, scope: !4068)
!4076 = !DILocation(line: 4114, column: 67, scope: !4068)
!4077 = !DILocation(line: 4114, column: 47, scope: !4068)
!4078 = !DILocation(line: 4114, column: 10, scope: !4068)
!4079 = !DILocation(line: 4114, column: 3, scope: !4068)
!4080 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !71, file: !71, line: 4136, type: !158, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4081 = !DILocalVariable(name: "value", arg: 1, scope: !4080, file: !71, line: 4136, type: !6)
!4082 = !DILocation(line: 4136, column: 26, scope: !4080)
!4083 = !DILocalVariable(name: "factor", arg: 2, scope: !4080, file: !71, line: 4136, type: !17)
!4084 = !DILocation(line: 4136, column: 36, scope: !4080)
!4085 = !DILocation(line: 4138, column: 41, scope: !4080)
!4086 = !DILocation(line: 4138, column: 59, scope: !4080)
!4087 = !DILocation(line: 4138, column: 53, scope: !4080)
!4088 = !DILocation(line: 4138, column: 67, scope: !4080)
!4089 = !DILocation(line: 4138, column: 47, scope: !4080)
!4090 = !DILocation(line: 4138, column: 10, scope: !4080)
!4091 = !DILocation(line: 4138, column: 3, scope: !4080)
!4092 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !71, file: !71, line: 4160, type: !158, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4093 = !DILocalVariable(name: "value", arg: 1, scope: !4092, file: !71, line: 4160, type: !6)
!4094 = !DILocation(line: 4160, column: 25, scope: !4092)
!4095 = !DILocalVariable(name: "factor", arg: 2, scope: !4092, file: !71, line: 4160, type: !17)
!4096 = !DILocation(line: 4160, column: 35, scope: !4092)
!4097 = !DILocation(line: 4162, column: 41, scope: !4092)
!4098 = !DILocation(line: 4162, column: 59, scope: !4092)
!4099 = !DILocation(line: 4162, column: 53, scope: !4092)
!4100 = !DILocation(line: 4162, column: 67, scope: !4092)
!4101 = !DILocation(line: 4162, column: 47, scope: !4092)
!4102 = !DILocation(line: 4162, column: 10, scope: !4092)
!4103 = !DILocation(line: 4162, column: 3, scope: !4092)
!4104 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !71, file: !71, line: 4183, type: !928, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4105 = !DILocalVariable(name: "value", arg: 1, scope: !4104, file: !71, line: 4183, type: !22)
!4106 = !DILocation(line: 4183, column: 33, scope: !4104)
!4107 = !DILocalVariable(name: "factor", arg: 2, scope: !4104, file: !71, line: 4183, type: !22)
!4108 = !DILocation(line: 4183, column: 44, scope: !4104)
!4109 = !DILocation(line: 4185, column: 41, scope: !4104)
!4110 = !DILocation(line: 4185, column: 47, scope: !4104)
!4111 = !DILocation(line: 4185, column: 10, scope: !4104)
!4112 = !DILocation(line: 4185, column: 3, scope: !4104)
!4113 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !71, file: !71, line: 4206, type: !928, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4114 = !DILocalVariable(name: "value", arg: 1, scope: !4113, file: !71, line: 4206, type: !22)
!4115 = !DILocation(line: 4206, column: 32, scope: !4113)
!4116 = !DILocalVariable(name: "factor", arg: 2, scope: !4113, file: !71, line: 4206, type: !22)
!4117 = !DILocation(line: 4206, column: 43, scope: !4113)
!4118 = !DILocation(line: 4208, column: 41, scope: !4113)
!4119 = !DILocation(line: 4208, column: 47, scope: !4113)
!4120 = !DILocation(line: 4208, column: 10, scope: !4113)
!4121 = !DILocation(line: 4208, column: 3, scope: !4113)
!4122 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !71, file: !71, line: 4230, type: !928, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4123 = !DILocalVariable(name: "value", arg: 1, scope: !4122, file: !71, line: 4230, type: !22)
!4124 = !DILocation(line: 4230, column: 31, scope: !4122)
!4125 = !DILocalVariable(name: "factor", arg: 2, scope: !4122, file: !71, line: 4230, type: !22)
!4126 = !DILocation(line: 4230, column: 42, scope: !4122)
!4127 = !DILocation(line: 4232, column: 41, scope: !4122)
!4128 = !DILocation(line: 4232, column: 47, scope: !4122)
!4129 = !DILocation(line: 4232, column: 10, scope: !4122)
!4130 = !DILocation(line: 4232, column: 3, scope: !4122)
!4131 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !71, file: !71, line: 4254, type: !928, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4132 = !DILocalVariable(name: "value", arg: 1, scope: !4131, file: !71, line: 4254, type: !22)
!4133 = !DILocation(line: 4254, column: 34, scope: !4131)
!4134 = !DILocalVariable(name: "factor", arg: 2, scope: !4131, file: !71, line: 4254, type: !22)
!4135 = !DILocation(line: 4254, column: 45, scope: !4131)
!4136 = !DILocation(line: 4256, column: 44, scope: !4131)
!4137 = !DILocation(line: 4256, column: 50, scope: !4131)
!4138 = !DILocation(line: 4256, column: 10, scope: !4131)
!4139 = !DILocation(line: 4256, column: 3, scope: !4131)
!4140 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !71, file: !71, line: 4278, type: !928, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4141 = !DILocalVariable(name: "value", arg: 1, scope: !4140, file: !71, line: 4278, type: !22)
!4142 = !DILocation(line: 4278, column: 32, scope: !4140)
!4143 = !DILocalVariable(name: "factor", arg: 2, scope: !4140, file: !71, line: 4278, type: !22)
!4144 = !DILocation(line: 4278, column: 43, scope: !4140)
!4145 = !DILocation(line: 4280, column: 44, scope: !4140)
!4146 = !DILocation(line: 4280, column: 50, scope: !4140)
!4147 = !DILocation(line: 4280, column: 10, scope: !4140)
!4148 = !DILocation(line: 4280, column: 3, scope: !4140)
!4149 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !71, file: !71, line: 4302, type: !928, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4150 = !DILocalVariable(name: "value", arg: 1, scope: !4149, file: !71, line: 4302, type: !22)
!4151 = !DILocation(line: 4302, column: 31, scope: !4149)
!4152 = !DILocalVariable(name: "factor", arg: 2, scope: !4149, file: !71, line: 4302, type: !22)
!4153 = !DILocation(line: 4302, column: 42, scope: !4149)
!4154 = !DILocation(line: 4304, column: 44, scope: !4149)
!4155 = !DILocation(line: 4304, column: 50, scope: !4149)
!4156 = !DILocation(line: 4304, column: 10, scope: !4149)
!4157 = !DILocation(line: 4304, column: 3, scope: !4149)
!4158 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !71, file: !71, line: 4326, type: !928, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4159 = !DILocalVariable(name: "value", arg: 1, scope: !4158, file: !71, line: 4326, type: !22)
!4160 = !DILocation(line: 4326, column: 33, scope: !4158)
!4161 = !DILocalVariable(name: "factor", arg: 2, scope: !4158, file: !71, line: 4326, type: !22)
!4162 = !DILocation(line: 4326, column: 44, scope: !4158)
!4163 = !DILocation(line: 4328, column: 44, scope: !4158)
!4164 = !DILocation(line: 4328, column: 50, scope: !4158)
!4165 = !DILocation(line: 4328, column: 10, scope: !4158)
!4166 = !DILocation(line: 4328, column: 3, scope: !4158)
!4167 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !71, file: !71, line: 4350, type: !928, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4168 = !DILocalVariable(name: "value", arg: 1, scope: !4167, file: !71, line: 4350, type: !22)
!4169 = !DILocation(line: 4350, column: 32, scope: !4167)
!4170 = !DILocalVariable(name: "factor", arg: 2, scope: !4167, file: !71, line: 4350, type: !22)
!4171 = !DILocation(line: 4350, column: 43, scope: !4167)
!4172 = !DILocation(line: 4352, column: 44, scope: !4167)
!4173 = !DILocation(line: 4352, column: 50, scope: !4167)
!4174 = !DILocation(line: 4352, column: 10, scope: !4167)
!4175 = !DILocation(line: 4352, column: 3, scope: !4167)
!4176 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !71, file: !71, line: 4373, type: !928, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4177 = !DILocalVariable(name: "value", arg: 1, scope: !4176, file: !71, line: 4373, type: !22)
!4178 = !DILocation(line: 4373, column: 31, scope: !4176)
!4179 = !DILocalVariable(name: "factor", arg: 2, scope: !4176, file: !71, line: 4373, type: !22)
!4180 = !DILocation(line: 4373, column: 42, scope: !4176)
!4181 = !DILocation(line: 4375, column: 44, scope: !4176)
!4182 = !DILocation(line: 4375, column: 50, scope: !4176)
!4183 = !DILocation(line: 4375, column: 10, scope: !4176)
!4184 = !DILocation(line: 4375, column: 3, scope: !4176)
!4185 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !71, file: !71, line: 4396, type: !928, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4186 = !DILocalVariable(name: "value", arg: 1, scope: !4185, file: !71, line: 4396, type: !22)
!4187 = !DILocation(line: 4396, column: 30, scope: !4185)
!4188 = !DILocalVariable(name: "factor", arg: 2, scope: !4185, file: !71, line: 4396, type: !22)
!4189 = !DILocation(line: 4396, column: 41, scope: !4185)
!4190 = !DILocation(line: 4398, column: 44, scope: !4185)
!4191 = !DILocation(line: 4398, column: 50, scope: !4185)
!4192 = !DILocation(line: 4398, column: 10, scope: !4185)
!4193 = !DILocation(line: 4398, column: 3, scope: !4185)
!4194 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !71, file: !71, line: 4419, type: !928, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4195 = !DILocalVariable(name: "value", arg: 1, scope: !4194, file: !71, line: 4419, type: !22)
!4196 = !DILocation(line: 4419, column: 33, scope: !4194)
!4197 = !DILocalVariable(name: "factor", arg: 2, scope: !4194, file: !71, line: 4419, type: !22)
!4198 = !DILocation(line: 4419, column: 44, scope: !4194)
!4199 = !DILocation(line: 4421, column: 44, scope: !4194)
!4200 = !DILocation(line: 4421, column: 50, scope: !4194)
!4201 = !DILocation(line: 4421, column: 10, scope: !4194)
!4202 = !DILocation(line: 4421, column: 3, scope: !4194)
!4203 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !71, file: !71, line: 4442, type: !928, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4204 = !DILocalVariable(name: "value", arg: 1, scope: !4203, file: !71, line: 4442, type: !22)
!4205 = !DILocation(line: 4442, column: 32, scope: !4203)
!4206 = !DILocalVariable(name: "factor", arg: 2, scope: !4203, file: !71, line: 4442, type: !22)
!4207 = !DILocation(line: 4442, column: 43, scope: !4203)
!4208 = !DILocation(line: 4444, column: 44, scope: !4203)
!4209 = !DILocation(line: 4444, column: 50, scope: !4203)
!4210 = !DILocation(line: 4444, column: 10, scope: !4203)
!4211 = !DILocation(line: 4444, column: 3, scope: !4203)
!4212 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !71, file: !71, line: 4465, type: !928, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4213 = !DILocalVariable(name: "value", arg: 1, scope: !4212, file: !71, line: 4465, type: !22)
!4214 = !DILocation(line: 4465, column: 31, scope: !4212)
!4215 = !DILocalVariable(name: "factor", arg: 2, scope: !4212, file: !71, line: 4465, type: !22)
!4216 = !DILocation(line: 4465, column: 42, scope: !4212)
!4217 = !DILocation(line: 4467, column: 44, scope: !4212)
!4218 = !DILocation(line: 4467, column: 50, scope: !4212)
!4219 = !DILocation(line: 4467, column: 10, scope: !4212)
!4220 = !DILocation(line: 4467, column: 3, scope: !4212)
!4221 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !71, file: !71, line: 4488, type: !928, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4222 = !DILocalVariable(name: "value", arg: 1, scope: !4221, file: !71, line: 4488, type: !22)
!4223 = !DILocation(line: 4488, column: 30, scope: !4221)
!4224 = !DILocalVariable(name: "factor", arg: 2, scope: !4221, file: !71, line: 4488, type: !22)
!4225 = !DILocation(line: 4488, column: 41, scope: !4221)
!4226 = !DILocation(line: 4490, column: 44, scope: !4221)
!4227 = !DILocation(line: 4490, column: 50, scope: !4221)
!4228 = !DILocation(line: 4490, column: 10, scope: !4221)
!4229 = !DILocation(line: 4490, column: 3, scope: !4221)
!4230 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !71, file: !71, line: 4510, type: !973, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4231 = !DILocalVariable(name: "x_value", arg: 1, scope: !4230, file: !71, line: 4510, type: !22)
!4232 = !DILocation(line: 4510, column: 32, scope: !4230)
!4233 = !DILocalVariable(name: "y_value", arg: 2, scope: !4230, file: !71, line: 4510, type: !17)
!4234 = !DILocation(line: 4510, column: 44, scope: !4230)
!4235 = !DILocation(line: 4512, column: 40, scope: !4230)
!4236 = !DILocation(line: 4512, column: 60, scope: !4230)
!4237 = !DILocation(line: 4512, column: 54, scope: !4230)
!4238 = !DILocation(line: 4512, column: 69, scope: !4230)
!4239 = !DILocation(line: 4512, column: 48, scope: !4230)
!4240 = !DILocation(line: 4512, column: 10, scope: !4230)
!4241 = !DILocation(line: 4512, column: 3, scope: !4230)
!4242 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !71, file: !71, line: 4532, type: !973, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4243 = !DILocalVariable(name: "x_value", arg: 1, scope: !4242, file: !71, line: 4532, type: !22)
!4244 = !DILocation(line: 4532, column: 31, scope: !4242)
!4245 = !DILocalVariable(name: "y_value", arg: 2, scope: !4242, file: !71, line: 4532, type: !17)
!4246 = !DILocation(line: 4532, column: 43, scope: !4242)
!4247 = !DILocation(line: 4534, column: 40, scope: !4242)
!4248 = !DILocation(line: 4534, column: 60, scope: !4242)
!4249 = !DILocation(line: 4534, column: 54, scope: !4242)
!4250 = !DILocation(line: 4534, column: 69, scope: !4242)
!4251 = !DILocation(line: 4534, column: 48, scope: !4242)
!4252 = !DILocation(line: 4534, column: 10, scope: !4242)
!4253 = !DILocation(line: 4534, column: 3, scope: !4242)
!4254 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !71, file: !71, line: 4555, type: !973, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4255 = !DILocalVariable(name: "x_value", arg: 1, scope: !4254, file: !71, line: 4555, type: !22)
!4256 = !DILocation(line: 4555, column: 30, scope: !4254)
!4257 = !DILocalVariable(name: "y_value", arg: 2, scope: !4254, file: !71, line: 4555, type: !17)
!4258 = !DILocation(line: 4555, column: 42, scope: !4254)
!4259 = !DILocation(line: 4557, column: 40, scope: !4254)
!4260 = !DILocation(line: 4557, column: 60, scope: !4254)
!4261 = !DILocation(line: 4557, column: 54, scope: !4254)
!4262 = !DILocation(line: 4557, column: 69, scope: !4254)
!4263 = !DILocation(line: 4557, column: 48, scope: !4254)
!4264 = !DILocation(line: 4557, column: 10, scope: !4254)
!4265 = !DILocation(line: 4557, column: 3, scope: !4254)
!4266 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !71, file: !71, line: 4578, type: !973, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4267 = !DILocalVariable(name: "x_value", arg: 1, scope: !4266, file: !71, line: 4578, type: !22)
!4268 = !DILocation(line: 4578, column: 31, scope: !4266)
!4269 = !DILocalVariable(name: "y_value", arg: 2, scope: !4266, file: !71, line: 4578, type: !17)
!4270 = !DILocation(line: 4578, column: 43, scope: !4266)
!4271 = !DILocation(line: 4580, column: 44, scope: !4266)
!4272 = !DILocation(line: 4580, column: 64, scope: !4266)
!4273 = !DILocation(line: 4580, column: 58, scope: !4266)
!4274 = !DILocation(line: 4580, column: 73, scope: !4266)
!4275 = !DILocation(line: 4580, column: 52, scope: !4266)
!4276 = !DILocation(line: 4580, column: 10, scope: !4266)
!4277 = !DILocation(line: 4580, column: 3, scope: !4266)
!4278 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !71, file: !71, line: 4601, type: !973, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4279 = !DILocalVariable(name: "x_value", arg: 1, scope: !4278, file: !71, line: 4601, type: !22)
!4280 = !DILocation(line: 4601, column: 30, scope: !4278)
!4281 = !DILocalVariable(name: "y_value", arg: 2, scope: !4278, file: !71, line: 4601, type: !17)
!4282 = !DILocation(line: 4601, column: 42, scope: !4278)
!4283 = !DILocation(line: 4603, column: 44, scope: !4278)
!4284 = !DILocation(line: 4603, column: 64, scope: !4278)
!4285 = !DILocation(line: 4603, column: 58, scope: !4278)
!4286 = !DILocation(line: 4603, column: 73, scope: !4278)
!4287 = !DILocation(line: 4603, column: 52, scope: !4278)
!4288 = !DILocation(line: 4603, column: 10, scope: !4278)
!4289 = !DILocation(line: 4603, column: 3, scope: !4278)
!4290 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !71, file: !71, line: 4623, type: !973, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4291 = !DILocalVariable(name: "x_value", arg: 1, scope: !4290, file: !71, line: 4623, type: !22)
!4292 = !DILocation(line: 4623, column: 30, scope: !4290)
!4293 = !DILocalVariable(name: "y_value", arg: 2, scope: !4290, file: !71, line: 4623, type: !17)
!4294 = !DILocation(line: 4623, column: 42, scope: !4290)
!4295 = !DILocation(line: 4625, column: 44, scope: !4290)
!4296 = !DILocation(line: 4625, column: 64, scope: !4290)
!4297 = !DILocation(line: 4625, column: 58, scope: !4290)
!4298 = !DILocation(line: 4625, column: 73, scope: !4290)
!4299 = !DILocation(line: 4625, column: 52, scope: !4290)
!4300 = !DILocation(line: 4625, column: 10, scope: !4290)
!4301 = !DILocation(line: 4625, column: 3, scope: !4290)
!4302 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !71, file: !71, line: 4645, type: !973, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4303 = !DILocalVariable(name: "x_value", arg: 1, scope: !4302, file: !71, line: 4645, type: !22)
!4304 = !DILocation(line: 4645, column: 29, scope: !4302)
!4305 = !DILocalVariable(name: "y_value", arg: 2, scope: !4302, file: !71, line: 4645, type: !17)
!4306 = !DILocation(line: 4645, column: 41, scope: !4302)
!4307 = !DILocation(line: 4647, column: 44, scope: !4302)
!4308 = !DILocation(line: 4647, column: 64, scope: !4302)
!4309 = !DILocation(line: 4647, column: 58, scope: !4302)
!4310 = !DILocation(line: 4647, column: 73, scope: !4302)
!4311 = !DILocation(line: 4647, column: 52, scope: !4302)
!4312 = !DILocation(line: 4647, column: 10, scope: !4302)
!4313 = !DILocation(line: 4647, column: 3, scope: !4302)
!4314 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !71, file: !71, line: 4667, type: !973, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4315 = !DILocalVariable(name: "x_value", arg: 1, scope: !4314, file: !71, line: 4667, type: !22)
!4316 = !DILocation(line: 4667, column: 30, scope: !4314)
!4317 = !DILocalVariable(name: "y_value", arg: 2, scope: !4314, file: !71, line: 4667, type: !17)
!4318 = !DILocation(line: 4667, column: 42, scope: !4314)
!4319 = !DILocation(line: 4669, column: 44, scope: !4314)
!4320 = !DILocation(line: 4669, column: 64, scope: !4314)
!4321 = !DILocation(line: 4669, column: 58, scope: !4314)
!4322 = !DILocation(line: 4669, column: 73, scope: !4314)
!4323 = !DILocation(line: 4669, column: 52, scope: !4314)
!4324 = !DILocation(line: 4669, column: 10, scope: !4314)
!4325 = !DILocation(line: 4669, column: 3, scope: !4314)
!4326 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !71, file: !71, line: 4689, type: !973, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4327 = !DILocalVariable(name: "x_value", arg: 1, scope: !4326, file: !71, line: 4689, type: !22)
!4328 = !DILocation(line: 4689, column: 29, scope: !4326)
!4329 = !DILocalVariable(name: "y_value", arg: 2, scope: !4326, file: !71, line: 4689, type: !17)
!4330 = !DILocation(line: 4689, column: 41, scope: !4326)
!4331 = !DILocation(line: 4691, column: 44, scope: !4326)
!4332 = !DILocation(line: 4691, column: 64, scope: !4326)
!4333 = !DILocation(line: 4691, column: 58, scope: !4326)
!4334 = !DILocation(line: 4691, column: 73, scope: !4326)
!4335 = !DILocation(line: 4691, column: 52, scope: !4326)
!4336 = !DILocation(line: 4691, column: 10, scope: !4326)
!4337 = !DILocation(line: 4691, column: 3, scope: !4326)
!4338 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !71, file: !71, line: 4713, type: !1502, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4339 = !DILocalVariable(name: "value", arg: 1, scope: !4338, file: !71, line: 4713, type: !735)
!4340 = !DILocation(line: 4713, column: 31, scope: !4338)
!4341 = !DILocalVariable(name: "factor", arg: 2, scope: !4338, file: !71, line: 4713, type: !13)
!4342 = !DILocation(line: 4713, column: 42, scope: !4338)
!4343 = !DILocation(line: 4715, column: 41, scope: !4338)
!4344 = !DILocation(line: 4715, column: 47, scope: !4338)
!4345 = !DILocation(line: 4715, column: 10, scope: !4338)
!4346 = !DILocation(line: 4715, column: 3, scope: !4338)
!4347 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !71, file: !71, line: 5293, type: !4348, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4348 = !DISubroutineType(types: !4349)
!4349 = !{!735, !735, !13, !735}
!4350 = !DILocalVariable(name: "value", arg: 1, scope: !4347, file: !71, line: 5293, type: !735)
!4351 = !DILocation(line: 5293, column: 40, scope: !4347)
!4352 = !DILocalVariable(name: "factor", arg: 2, scope: !4347, file: !71, line: 5293, type: !13)
!4353 = !DILocation(line: 5293, column: 50, scope: !4347)
!4354 = !DILocalVariable(name: "count", arg: 3, scope: !4347, file: !71, line: 5293, type: !735)
!4355 = !DILocation(line: 5293, column: 62, scope: !4347)
!4356 = !DILocalVariable(name: "u32Temp1", scope: !4347, file: !71, line: 5295, type: !735)
!4357 = !DILocation(line: 5295, column: 6, scope: !4347)
!4358 = !DILocalVariable(name: "u32Temp2", scope: !4347, file: !71, line: 5295, type: !735)
!4359 = !DILocation(line: 5295, column: 17, scope: !4347)
!4360 = !DILocalVariable(name: "u32Temp3", scope: !4347, file: !71, line: 5295, type: !735)
!4361 = !DILocation(line: 5295, column: 26, scope: !4347)
!4362 = !DILocalVariable(name: "u8SignBit", scope: !4347, file: !71, line: 5296, type: !17)
!4363 = !DILocation(line: 5296, column: 5, scope: !4347)
!4364 = !DILocation(line: 5298, column: 5, scope: !4365)
!4365 = distinct !DILexicalBlock(scope: !4347, file: !71, line: 5298, column: 5)
!4366 = !DILocation(line: 5298, column: 11, scope: !4365)
!4367 = !DILocation(line: 5298, column: 5, scope: !4347)
!4368 = !DILocation(line: 5300, column: 13, scope: !4369)
!4369 = distinct !DILexicalBlock(scope: !4365, file: !71, line: 5299, column: 2)
!4370 = !DILocation(line: 5301, column: 2, scope: !4369)
!4371 = !DILocation(line: 5304, column: 13, scope: !4372)
!4372 = distinct !DILexicalBlock(scope: !4365, file: !71, line: 5303, column: 2)
!4373 = !DILocation(line: 5308, column: 5, scope: !4374)
!4374 = distinct !DILexicalBlock(scope: !4347, file: !71, line: 5308, column: 5)
!4375 = !DILocation(line: 5308, column: 11, scope: !4374)
!4376 = !DILocation(line: 5308, column: 5, scope: !4347)
!4377 = !DILocation(line: 5310, column: 15, scope: !4378)
!4378 = distinct !DILexicalBlock(scope: !4374, file: !71, line: 5309, column: 2)
!4379 = !DILocation(line: 5310, column: 14, scope: !4378)
!4380 = !DILocation(line: 5310, column: 12, scope: !4378)
!4381 = !DILocation(line: 5311, column: 2, scope: !4378)
!4382 = !DILocation(line: 5314, column: 14, scope: !4383)
!4383 = distinct !DILexicalBlock(scope: !4374, file: !71, line: 5313, column: 2)
!4384 = !DILocation(line: 5314, column: 12, scope: !4383)
!4385 = !DILocation(line: 5317, column: 13, scope: !4347)
!4386 = !DILocation(line: 5317, column: 21, scope: !4347)
!4387 = !DILocation(line: 5317, column: 19, scope: !4347)
!4388 = !DILocation(line: 5317, column: 11, scope: !4347)
!4389 = !DILocation(line: 5318, column: 25, scope: !4347)
!4390 = !DILocation(line: 5318, column: 32, scope: !4347)
!4391 = !DILocation(line: 5318, column: 13, scope: !4347)
!4392 = !DILocation(line: 5318, column: 11, scope: !4347)
!4393 = !DILocation(line: 5319, column: 13, scope: !4347)
!4394 = !DILocation(line: 5319, column: 25, scope: !4347)
!4395 = !DILocation(line: 5319, column: 22, scope: !4347)
!4396 = !DILocation(line: 5319, column: 11, scope: !4347)
!4397 = !DILocation(line: 5320, column: 14, scope: !4347)
!4398 = !DILocation(line: 5320, column: 30, scope: !4347)
!4399 = !DILocation(line: 5320, column: 29, scope: !4347)
!4400 = !DILocation(line: 5320, column: 23, scope: !4347)
!4401 = !DILocation(line: 5320, column: 11, scope: !4347)
!4402 = !DILocation(line: 5321, column: 6, scope: !4403)
!4403 = distinct !DILexicalBlock(scope: !4347, file: !71, line: 5321, column: 5)
!4404 = !DILocation(line: 5321, column: 16, scope: !4403)
!4405 = !DILocation(line: 5321, column: 14, scope: !4403)
!4406 = !DILocation(line: 5321, column: 22, scope: !4403)
!4407 = !DILocation(line: 5321, column: 5, scope: !4347)
!4408 = !DILocation(line: 5323, column: 6, scope: !4409)
!4409 = distinct !DILexicalBlock(scope: !4410, file: !71, line: 5323, column: 6)
!4410 = distinct !DILexicalBlock(scope: !4403, file: !71, line: 5322, column: 2)
!4411 = !DILocation(line: 5323, column: 16, scope: !4409)
!4412 = !DILocation(line: 5323, column: 6, scope: !4410)
!4413 = !DILocation(line: 5325, column: 7, scope: !4414)
!4414 = distinct !DILexicalBlock(scope: !4415, file: !71, line: 5325, column: 7)
!4415 = distinct !DILexicalBlock(scope: !4409, file: !71, line: 5324, column: 3)
!4416 = !DILocation(line: 5325, column: 15, scope: !4414)
!4417 = !DILocation(line: 5325, column: 7, scope: !4415)
!4418 = !DILocation(line: 5326, column: 12, scope: !4414)
!4419 = !DILocation(line: 5326, column: 5, scope: !4414)
!4420 = !DILocation(line: 5328, column: 5, scope: !4414)
!4421 = !DILocation(line: 5332, column: 4, scope: !4422)
!4422 = distinct !DILexicalBlock(scope: !4409, file: !71, line: 5331, column: 3)
!4423 = !DILocation(line: 5337, column: 3, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4403, file: !71, line: 5336, column: 2)
!4425 = !DILocation(line: 5339, column: 1, scope: !4347)
!4426 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !71, file: !71, line: 4737, type: !1320, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4427 = !DILocalVariable(name: "value", arg: 1, scope: !4426, file: !71, line: 4737, type: !735)
!4428 = !DILocation(line: 4737, column: 31, scope: !4426)
!4429 = !DILocalVariable(name: "factor", arg: 2, scope: !4426, file: !71, line: 4737, type: !79)
!4430 = !DILocation(line: 4737, column: 42, scope: !4426)
!4431 = !DILocation(line: 4739, column: 41, scope: !4426)
!4432 = !DILocation(line: 4739, column: 47, scope: !4426)
!4433 = !DILocation(line: 4739, column: 10, scope: !4426)
!4434 = !DILocation(line: 4739, column: 3, scope: !4426)
!4435 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !71, file: !71, line: 5357, type: !4436, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4436 = !DISubroutineType(types: !4437)
!4437 = !{!735, !735, !79, !735}
!4438 = !DILocalVariable(name: "value", arg: 1, scope: !4435, file: !71, line: 5357, type: !735)
!4439 = !DILocation(line: 5357, column: 40, scope: !4435)
!4440 = !DILocalVariable(name: "factor", arg: 2, scope: !4435, file: !71, line: 5357, type: !79)
!4441 = !DILocation(line: 5357, column: 51, scope: !4435)
!4442 = !DILocalVariable(name: "count", arg: 3, scope: !4435, file: !71, line: 5357, type: !735)
!4443 = !DILocation(line: 5357, column: 63, scope: !4435)
!4444 = !DILocalVariable(name: "u32Temp1", scope: !4435, file: !71, line: 5359, type: !735)
!4445 = !DILocation(line: 5359, column: 6, scope: !4435)
!4446 = !DILocalVariable(name: "u32Temp2", scope: !4435, file: !71, line: 5359, type: !735)
!4447 = !DILocation(line: 5359, column: 17, scope: !4435)
!4448 = !DILocalVariable(name: "u8SignBit", scope: !4435, file: !71, line: 5360, type: !17)
!4449 = !DILocation(line: 5360, column: 5, scope: !4435)
!4450 = !DILocation(line: 5362, column: 5, scope: !4451)
!4451 = distinct !DILexicalBlock(scope: !4435, file: !71, line: 5362, column: 5)
!4452 = !DILocation(line: 5362, column: 11, scope: !4451)
!4453 = !DILocation(line: 5362, column: 5, scope: !4435)
!4454 = !DILocation(line: 5364, column: 13, scope: !4455)
!4455 = distinct !DILexicalBlock(scope: !4451, file: !71, line: 5363, column: 2)
!4456 = !DILocation(line: 5365, column: 2, scope: !4455)
!4457 = !DILocation(line: 5368, column: 13, scope: !4458)
!4458 = distinct !DILexicalBlock(scope: !4451, file: !71, line: 5367, column: 2)
!4459 = !DILocation(line: 5372, column: 5, scope: !4460)
!4460 = distinct !DILexicalBlock(scope: !4435, file: !71, line: 5372, column: 5)
!4461 = !DILocation(line: 5372, column: 11, scope: !4460)
!4462 = !DILocation(line: 5372, column: 5, scope: !4435)
!4463 = !DILocation(line: 5374, column: 15, scope: !4464)
!4464 = distinct !DILexicalBlock(scope: !4460, file: !71, line: 5373, column: 2)
!4465 = !DILocation(line: 5374, column: 14, scope: !4464)
!4466 = !DILocation(line: 5374, column: 12, scope: !4464)
!4467 = !DILocation(line: 5375, column: 2, scope: !4464)
!4468 = !DILocation(line: 5378, column: 14, scope: !4469)
!4469 = distinct !DILexicalBlock(scope: !4460, file: !71, line: 5377, column: 2)
!4470 = !DILocation(line: 5378, column: 12, scope: !4469)
!4471 = !DILocation(line: 5381, column: 25, scope: !4435)
!4472 = !DILocation(line: 5381, column: 32, scope: !4435)
!4473 = !DILocation(line: 5381, column: 13, scope: !4435)
!4474 = !DILocation(line: 5381, column: 11, scope: !4435)
!4475 = !DILocation(line: 5382, column: 13, scope: !4435)
!4476 = !DILocation(line: 5382, column: 26, scope: !4435)
!4477 = !DILocation(line: 5382, column: 31, scope: !4435)
!4478 = !DILocation(line: 5382, column: 22, scope: !4435)
!4479 = !DILocation(line: 5382, column: 11, scope: !4435)
!4480 = !DILocation(line: 5383, column: 5, scope: !4481)
!4481 = distinct !DILexicalBlock(scope: !4435, file: !71, line: 5383, column: 5)
!4482 = !DILocation(line: 5383, column: 15, scope: !4481)
!4483 = !DILocation(line: 5383, column: 5, scope: !4435)
!4484 = !DILocation(line: 5385, column: 10, scope: !4485)
!4485 = distinct !DILexicalBlock(scope: !4481, file: !71, line: 5384, column: 2)
!4486 = !DILocation(line: 5385, column: 3, scope: !4485)
!4487 = !DILocation(line: 5389, column: 3, scope: !4488)
!4488 = distinct !DILexicalBlock(scope: !4481, file: !71, line: 5388, column: 2)
!4489 = !DILocation(line: 5391, column: 1, scope: !4435)
!4490 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !71, file: !71, line: 4761, type: !3110, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4491 = !DILocalVariable(name: "value", arg: 1, scope: !4490, file: !71, line: 4761, type: !735)
!4492 = !DILocation(line: 4761, column: 30, scope: !4490)
!4493 = !DILocalVariable(name: "factor", arg: 2, scope: !4490, file: !71, line: 4761, type: !6)
!4494 = !DILocation(line: 4761, column: 40, scope: !4490)
!4495 = !DILocation(line: 4763, column: 40, scope: !4490)
!4496 = !DILocation(line: 4763, column: 46, scope: !4490)
!4497 = !DILocation(line: 4763, column: 10, scope: !4490)
!4498 = !DILocation(line: 4763, column: 3, scope: !4490)
!4499 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !71, file: !71, line: 5435, type: !4500, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4500 = !DISubroutineType(types: !4501)
!4501 = !{!735, !735, !6, !735}
!4502 = !DILocalVariable(name: "value", arg: 1, scope: !4499, file: !71, line: 5435, type: !735)
!4503 = !DILocation(line: 5435, column: 39, scope: !4499)
!4504 = !DILocalVariable(name: "factor", arg: 2, scope: !4499, file: !71, line: 5435, type: !6)
!4505 = !DILocation(line: 5435, column: 49, scope: !4499)
!4506 = !DILocalVariable(name: "count", arg: 3, scope: !4499, file: !71, line: 5435, type: !735)
!4507 = !DILocation(line: 5435, column: 61, scope: !4499)
!4508 = !DILocalVariable(name: "u32Temp1", scope: !4499, file: !71, line: 5437, type: !735)
!4509 = !DILocation(line: 5437, column: 6, scope: !4499)
!4510 = !DILocalVariable(name: "u32Temp2", scope: !4499, file: !71, line: 5437, type: !735)
!4511 = !DILocation(line: 5437, column: 17, scope: !4499)
!4512 = !DILocalVariable(name: "u32Temp3", scope: !4499, file: !71, line: 5437, type: !735)
!4513 = !DILocation(line: 5437, column: 26, scope: !4499)
!4514 = !DILocalVariable(name: "u8SignBit", scope: !4499, file: !71, line: 5438, type: !17)
!4515 = !DILocation(line: 5438, column: 5, scope: !4499)
!4516 = !DILocation(line: 5440, column: 5, scope: !4517)
!4517 = distinct !DILexicalBlock(scope: !4499, file: !71, line: 5440, column: 5)
!4518 = !DILocation(line: 5440, column: 11, scope: !4517)
!4519 = !DILocation(line: 5440, column: 5, scope: !4499)
!4520 = !DILocation(line: 5442, column: 13, scope: !4521)
!4521 = distinct !DILexicalBlock(scope: !4517, file: !71, line: 5441, column: 2)
!4522 = !DILocation(line: 5443, column: 2, scope: !4521)
!4523 = !DILocation(line: 5446, column: 13, scope: !4524)
!4524 = distinct !DILexicalBlock(scope: !4517, file: !71, line: 5445, column: 2)
!4525 = !DILocation(line: 5450, column: 5, scope: !4526)
!4526 = distinct !DILexicalBlock(scope: !4499, file: !71, line: 5450, column: 5)
!4527 = !DILocation(line: 5450, column: 11, scope: !4526)
!4528 = !DILocation(line: 5450, column: 5, scope: !4499)
!4529 = !DILocation(line: 5452, column: 15, scope: !4530)
!4530 = distinct !DILexicalBlock(scope: !4526, file: !71, line: 5451, column: 2)
!4531 = !DILocation(line: 5452, column: 14, scope: !4530)
!4532 = !DILocation(line: 5452, column: 12, scope: !4530)
!4533 = !DILocation(line: 5453, column: 2, scope: !4530)
!4534 = !DILocation(line: 5456, column: 14, scope: !4535)
!4535 = distinct !DILexicalBlock(scope: !4526, file: !71, line: 5455, column: 2)
!4536 = !DILocation(line: 5456, column: 12, scope: !4535)
!4537 = !DILocation(line: 5459, column: 13, scope: !4499)
!4538 = !DILocation(line: 5459, column: 21, scope: !4499)
!4539 = !DILocation(line: 5459, column: 19, scope: !4499)
!4540 = !DILocation(line: 5459, column: 11, scope: !4499)
!4541 = !DILocation(line: 5460, column: 25, scope: !4499)
!4542 = !DILocation(line: 5460, column: 32, scope: !4499)
!4543 = !DILocation(line: 5460, column: 13, scope: !4499)
!4544 = !DILocation(line: 5460, column: 11, scope: !4499)
!4545 = !DILocation(line: 5461, column: 13, scope: !4499)
!4546 = !DILocation(line: 5461, column: 25, scope: !4499)
!4547 = !DILocation(line: 5461, column: 22, scope: !4499)
!4548 = !DILocation(line: 5461, column: 11, scope: !4499)
!4549 = !DILocation(line: 5462, column: 14, scope: !4499)
!4550 = !DILocation(line: 5462, column: 30, scope: !4499)
!4551 = !DILocation(line: 5462, column: 29, scope: !4499)
!4552 = !DILocation(line: 5462, column: 23, scope: !4499)
!4553 = !DILocation(line: 5462, column: 11, scope: !4499)
!4554 = !DILocation(line: 5463, column: 6, scope: !4555)
!4555 = distinct !DILexicalBlock(scope: !4499, file: !71, line: 5463, column: 5)
!4556 = !DILocation(line: 5463, column: 16, scope: !4555)
!4557 = !DILocation(line: 5463, column: 14, scope: !4555)
!4558 = !DILocation(line: 5463, column: 22, scope: !4555)
!4559 = !DILocation(line: 5463, column: 5, scope: !4499)
!4560 = !DILocation(line: 5465, column: 6, scope: !4561)
!4561 = distinct !DILexicalBlock(scope: !4562, file: !71, line: 5465, column: 6)
!4562 = distinct !DILexicalBlock(scope: !4555, file: !71, line: 5464, column: 2)
!4563 = !DILocation(line: 5465, column: 16, scope: !4561)
!4564 = !DILocation(line: 5465, column: 6, scope: !4562)
!4565 = !DILocation(line: 5467, column: 7, scope: !4566)
!4566 = distinct !DILexicalBlock(scope: !4567, file: !71, line: 5467, column: 7)
!4567 = distinct !DILexicalBlock(scope: !4561, file: !71, line: 5466, column: 3)
!4568 = !DILocation(line: 5467, column: 15, scope: !4566)
!4569 = !DILocation(line: 5467, column: 7, scope: !4567)
!4570 = !DILocation(line: 5468, column: 12, scope: !4566)
!4571 = !DILocation(line: 5468, column: 5, scope: !4566)
!4572 = !DILocation(line: 5470, column: 5, scope: !4566)
!4573 = !DILocation(line: 5474, column: 4, scope: !4574)
!4574 = distinct !DILexicalBlock(scope: !4561, file: !71, line: 5473, column: 3)
!4575 = !DILocation(line: 5479, column: 3, scope: !4576)
!4576 = distinct !DILexicalBlock(scope: !4555, file: !71, line: 5478, column: 2)
!4577 = !DILocation(line: 5481, column: 1, scope: !4499)
!4578 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !71, file: !71, line: 4785, type: !1116, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4579 = !DILocalVariable(name: "value", arg: 1, scope: !4578, file: !71, line: 4785, type: !735)
!4580 = !DILocation(line: 4785, column: 31, scope: !4578)
!4581 = !DILocalVariable(name: "factor", arg: 2, scope: !4578, file: !71, line: 4785, type: !22)
!4582 = !DILocation(line: 4785, column: 42, scope: !4578)
!4583 = !DILocation(line: 4787, column: 41, scope: !4578)
!4584 = !DILocation(line: 4787, column: 47, scope: !4578)
!4585 = !DILocation(line: 4787, column: 10, scope: !4578)
!4586 = !DILocation(line: 4787, column: 3, scope: !4578)
!4587 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !71, file: !71, line: 4809, type: !1411, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4588 = !DILocalVariable(name: "value", arg: 1, scope: !4587, file: !71, line: 4809, type: !735)
!4589 = !DILocation(line: 4809, column: 31, scope: !4587)
!4590 = !DILocalVariable(name: "factor", arg: 2, scope: !4587, file: !71, line: 4809, type: !735)
!4591 = !DILocation(line: 4809, column: 42, scope: !4587)
!4592 = !DILocation(line: 4811, column: 41, scope: !4587)
!4593 = !DILocation(line: 4811, column: 47, scope: !4587)
!4594 = !DILocation(line: 4811, column: 10, scope: !4587)
!4595 = !DILocation(line: 4811, column: 3, scope: !4587)
!4596 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !71, file: !71, line: 5408, type: !4597, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4597 = !DISubroutineType(types: !4598)
!4598 = !{!735, !735, !735, !735}
!4599 = !DILocalVariable(name: "value", arg: 1, scope: !4596, file: !71, line: 5408, type: !735)
!4600 = !DILocation(line: 5408, column: 40, scope: !4596)
!4601 = !DILocalVariable(name: "factor", arg: 2, scope: !4596, file: !71, line: 5408, type: !735)
!4602 = !DILocation(line: 5408, column: 50, scope: !4596)
!4603 = !DILocalVariable(name: "count", arg: 3, scope: !4596, file: !71, line: 5408, type: !735)
!4604 = !DILocation(line: 5408, column: 62, scope: !4596)
!4605 = !DILocalVariable(name: "u32Temp1", scope: !4596, file: !71, line: 5410, type: !735)
!4606 = !DILocation(line: 5410, column: 6, scope: !4596)
!4607 = !DILocalVariable(name: "u32Temp2", scope: !4596, file: !71, line: 5410, type: !735)
!4608 = !DILocation(line: 5410, column: 17, scope: !4596)
!4609 = !DILocalVariable(name: "u32Temp3", scope: !4596, file: !71, line: 5410, type: !735)
!4610 = !DILocation(line: 5410, column: 26, scope: !4596)
!4611 = !DILocalVariable(name: "u32Temp4", scope: !4596, file: !71, line: 5410, type: !735)
!4612 = !DILocation(line: 5410, column: 35, scope: !4596)
!4613 = !DILocalVariable(name: "u8SignBit", scope: !4596, file: !71, line: 5411, type: !17)
!4614 = !DILocation(line: 5411, column: 5, scope: !4596)
!4615 = !DILocation(line: 5413, column: 25, scope: !4596)
!4616 = !DILocation(line: 5413, column: 32, scope: !4596)
!4617 = !DILocation(line: 5413, column: 13, scope: !4596)
!4618 = !DILocation(line: 5413, column: 11, scope: !4596)
!4619 = !DILocation(line: 5414, column: 13, scope: !4596)
!4620 = !DILocation(line: 5414, column: 26, scope: !4596)
!4621 = !DILocation(line: 5414, column: 31, scope: !4596)
!4622 = !DILocation(line: 5414, column: 22, scope: !4596)
!4623 = !DILocation(line: 5414, column: 11, scope: !4596)
!4624 = !DILocation(line: 5415, column: 9, scope: !4596)
!4625 = !DILocation(line: 5415, column: 2, scope: !4596)
!4626 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !71, file: !71, line: 4833, type: !3049, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4627 = !DILocalVariable(name: "value", arg: 1, scope: !4626, file: !71, line: 4833, type: !735)
!4628 = !DILocation(line: 4833, column: 30, scope: !4626)
!4629 = !DILocalVariable(name: "factor", arg: 2, scope: !4626, file: !71, line: 4833, type: !17)
!4630 = !DILocation(line: 4833, column: 40, scope: !4626)
!4631 = !DILocation(line: 4835, column: 40, scope: !4626)
!4632 = !DILocation(line: 4835, column: 46, scope: !4626)
!4633 = !DILocation(line: 4835, column: 10, scope: !4626)
!4634 = !DILocation(line: 4835, column: 3, scope: !4626)
!4635 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !71, file: !71, line: 5499, type: !4636, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4636 = !DISubroutineType(types: !4637)
!4637 = !{!735, !735, !17, !735}
!4638 = !DILocalVariable(name: "value", arg: 1, scope: !4635, file: !71, line: 5499, type: !735)
!4639 = !DILocation(line: 5499, column: 39, scope: !4635)
!4640 = !DILocalVariable(name: "factor", arg: 2, scope: !4635, file: !71, line: 5499, type: !17)
!4641 = !DILocation(line: 5499, column: 49, scope: !4635)
!4642 = !DILocalVariable(name: "count", arg: 3, scope: !4635, file: !71, line: 5499, type: !735)
!4643 = !DILocation(line: 5499, column: 61, scope: !4635)
!4644 = !DILocalVariable(name: "u32Temp1", scope: !4635, file: !71, line: 5501, type: !735)
!4645 = !DILocation(line: 5501, column: 6, scope: !4635)
!4646 = !DILocalVariable(name: "u32Temp2", scope: !4635, file: !71, line: 5501, type: !735)
!4647 = !DILocation(line: 5501, column: 17, scope: !4635)
!4648 = !DILocation(line: 5503, column: 13, scope: !4635)
!4649 = !DILocation(line: 5503, column: 21, scope: !4635)
!4650 = !DILocation(line: 5503, column: 19, scope: !4635)
!4651 = !DILocation(line: 5503, column: 11, scope: !4635)
!4652 = !DILocation(line: 5504, column: 25, scope: !4635)
!4653 = !DILocation(line: 5504, column: 32, scope: !4635)
!4654 = !DILocation(line: 5504, column: 13, scope: !4635)
!4655 = !DILocation(line: 5504, column: 11, scope: !4635)
!4656 = !DILocation(line: 5505, column: 13, scope: !4635)
!4657 = !DILocation(line: 5505, column: 25, scope: !4635)
!4658 = !DILocation(line: 5505, column: 22, scope: !4635)
!4659 = !DILocation(line: 5505, column: 11, scope: !4635)
!4660 = !DILocation(line: 5506, column: 14, scope: !4635)
!4661 = !DILocation(line: 5506, column: 30, scope: !4635)
!4662 = !DILocation(line: 5506, column: 29, scope: !4635)
!4663 = !DILocation(line: 5506, column: 23, scope: !4635)
!4664 = !DILocation(line: 5506, column: 11, scope: !4635)
!4665 = !DILocation(line: 5507, column: 6, scope: !4666)
!4666 = distinct !DILexicalBlock(scope: !4635, file: !71, line: 5507, column: 5)
!4667 = !DILocation(line: 5507, column: 16, scope: !4666)
!4668 = !DILocation(line: 5507, column: 14, scope: !4666)
!4669 = !DILocation(line: 5507, column: 22, scope: !4666)
!4670 = !DILocation(line: 5507, column: 5, scope: !4635)
!4671 = !DILocation(line: 5509, column: 6, scope: !4672)
!4672 = distinct !DILexicalBlock(scope: !4673, file: !71, line: 5509, column: 6)
!4673 = distinct !DILexicalBlock(scope: !4666, file: !71, line: 5508, column: 2)
!4674 = !DILocation(line: 5509, column: 14, scope: !4672)
!4675 = !DILocation(line: 5509, column: 6, scope: !4673)
!4676 = !DILocation(line: 5510, column: 11, scope: !4672)
!4677 = !DILocation(line: 5510, column: 4, scope: !4672)
!4678 = !DILocation(line: 5512, column: 4, scope: !4672)
!4679 = !DILocation(line: 5516, column: 3, scope: !4680)
!4680 = distinct !DILexicalBlock(scope: !4666, file: !71, line: 5515, column: 2)
!4681 = !DILocation(line: 5518, column: 1, scope: !4635)
!4682 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !71, file: !71, line: 4856, type: !884, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4683 = !DILocalVariable(name: "value", arg: 1, scope: !4682, file: !71, line: 4856, type: !17)
!4684 = !DILocation(line: 4856, column: 28, scope: !4682)
!4685 = !DILocalVariable(name: "factor", arg: 2, scope: !4682, file: !71, line: 4856, type: !17)
!4686 = !DILocation(line: 4856, column: 38, scope: !4682)
!4687 = !DILocation(line: 4858, column: 38, scope: !4682)
!4688 = !DILocation(line: 4858, column: 44, scope: !4682)
!4689 = !DILocation(line: 4858, column: 10, scope: !4682)
!4690 = !DILocation(line: 4858, column: 3, scope: !4682)
!4691 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !71, file: !71, line: 4879, type: !884, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4692 = !DILocalVariable(name: "value", arg: 1, scope: !4691, file: !71, line: 4879, type: !17)
!4693 = !DILocation(line: 4879, column: 28, scope: !4691)
!4694 = !DILocalVariable(name: "factor", arg: 2, scope: !4691, file: !71, line: 4879, type: !17)
!4695 = !DILocation(line: 4879, column: 38, scope: !4691)
!4696 = !DILocation(line: 4881, column: 38, scope: !4691)
!4697 = !DILocation(line: 4881, column: 44, scope: !4691)
!4698 = !DILocation(line: 4881, column: 10, scope: !4691)
!4699 = !DILocation(line: 4881, column: 3, scope: !4691)
!4700 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !71, file: !71, line: 4903, type: !884, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4701 = !DILocalVariable(name: "value", arg: 1, scope: !4700, file: !71, line: 4903, type: !17)
!4702 = !DILocation(line: 4903, column: 26, scope: !4700)
!4703 = !DILocalVariable(name: "factor", arg: 2, scope: !4700, file: !71, line: 4903, type: !17)
!4704 = !DILocation(line: 4903, column: 36, scope: !4700)
!4705 = !DILocation(line: 4905, column: 38, scope: !4700)
!4706 = !DILocation(line: 4905, column: 44, scope: !4700)
!4707 = !DILocation(line: 4905, column: 10, scope: !4700)
!4708 = !DILocation(line: 4905, column: 3, scope: !4700)
!4709 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !71, file: !71, line: 4927, type: !884, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4710 = !DILocalVariable(name: "value", arg: 1, scope: !4709, file: !71, line: 4927, type: !17)
!4711 = !DILocation(line: 4927, column: 28, scope: !4709)
!4712 = !DILocalVariable(name: "factor", arg: 2, scope: !4709, file: !71, line: 4927, type: !17)
!4713 = !DILocation(line: 4927, column: 38, scope: !4709)
!4714 = !DILocation(line: 4929, column: 41, scope: !4709)
!4715 = !DILocation(line: 4929, column: 47, scope: !4709)
!4716 = !DILocation(line: 4929, column: 10, scope: !4709)
!4717 = !DILocation(line: 4929, column: 3, scope: !4709)
!4718 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !71, file: !71, line: 4951, type: !884, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4719 = !DILocalVariable(name: "value", arg: 1, scope: !4718, file: !71, line: 4951, type: !17)
!4720 = !DILocation(line: 4951, column: 26, scope: !4718)
!4721 = !DILocalVariable(name: "factor", arg: 2, scope: !4718, file: !71, line: 4951, type: !17)
!4722 = !DILocation(line: 4951, column: 36, scope: !4718)
!4723 = !DILocation(line: 4953, column: 41, scope: !4718)
!4724 = !DILocation(line: 4953, column: 47, scope: !4718)
!4725 = !DILocation(line: 4953, column: 10, scope: !4718)
!4726 = !DILocation(line: 4953, column: 3, scope: !4718)
!4727 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !71, file: !71, line: 4974, type: !884, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4728 = !DILocalVariable(name: "value", arg: 1, scope: !4727, file: !71, line: 4974, type: !17)
!4729 = !DILocation(line: 4974, column: 26, scope: !4727)
!4730 = !DILocalVariable(name: "factor", arg: 2, scope: !4727, file: !71, line: 4974, type: !17)
!4731 = !DILocation(line: 4974, column: 36, scope: !4727)
!4732 = !DILocation(line: 4976, column: 41, scope: !4727)
!4733 = !DILocation(line: 4976, column: 47, scope: !4727)
!4734 = !DILocation(line: 4976, column: 10, scope: !4727)
!4735 = !DILocation(line: 4976, column: 3, scope: !4727)
!4736 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !71, file: !71, line: 4997, type: !884, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4737 = !DILocalVariable(name: "value", arg: 1, scope: !4736, file: !71, line: 4997, type: !17)
!4738 = !DILocation(line: 4997, column: 25, scope: !4736)
!4739 = !DILocalVariable(name: "factor", arg: 2, scope: !4736, file: !71, line: 4997, type: !17)
!4740 = !DILocation(line: 4997, column: 35, scope: !4736)
!4741 = !DILocation(line: 4999, column: 41, scope: !4736)
!4742 = !DILocation(line: 4999, column: 47, scope: !4736)
!4743 = !DILocation(line: 4999, column: 10, scope: !4736)
!4744 = !DILocation(line: 4999, column: 3, scope: !4736)
!4745 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !71, file: !71, line: 5020, type: !884, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4746 = !DILocalVariable(name: "value", arg: 1, scope: !4745, file: !71, line: 5020, type: !17)
!4747 = !DILocation(line: 5020, column: 26, scope: !4745)
!4748 = !DILocalVariable(name: "factor", arg: 2, scope: !4745, file: !71, line: 5020, type: !17)
!4749 = !DILocation(line: 5020, column: 35, scope: !4745)
!4750 = !DILocation(line: 5022, column: 41, scope: !4745)
!4751 = !DILocation(line: 5022, column: 47, scope: !4745)
!4752 = !DILocation(line: 5022, column: 10, scope: !4745)
!4753 = !DILocation(line: 5022, column: 3, scope: !4745)
!4754 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !71, file: !71, line: 5043, type: !884, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4755 = !DILocalVariable(name: "value", arg: 1, scope: !4754, file: !71, line: 5043, type: !17)
!4756 = !DILocation(line: 5043, column: 25, scope: !4754)
!4757 = !DILocalVariable(name: "factor", arg: 2, scope: !4754, file: !71, line: 5043, type: !17)
!4758 = !DILocation(line: 5043, column: 35, scope: !4754)
!4759 = !DILocation(line: 5045, column: 41, scope: !4754)
!4760 = !DILocation(line: 5045, column: 47, scope: !4754)
!4761 = !DILocation(line: 5045, column: 10, scope: !4754)
!4762 = !DILocation(line: 5045, column: 3, scope: !4754)
!4763 = distinct !DISubprogram(name: "MulHighWord", scope: !4764, file: !4764, line: 39, type: !1411, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4764 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s16_fac2/alarm_0106")
!4765 = !DILocalVariable(name: "arg1", arg: 1, scope: !4763, file: !4764, line: 39, type: !735)
!4766 = !DILocation(line: 39, column: 30, scope: !4763)
!4767 = !DILocalVariable(name: "arg2", arg: 2, scope: !4763, file: !4764, line: 39, type: !735)
!4768 = !DILocation(line: 39, column: 48, scope: !4763)
!4769 = !DILocalVariable(name: "arg1_LW", scope: !4763, file: !4764, line: 41, type: !22)
!4770 = !DILocation(line: 41, column: 6, scope: !4763)
!4771 = !DILocalVariable(name: "arg1_HW", scope: !4763, file: !4764, line: 41, type: !22)
!4772 = !DILocation(line: 41, column: 14, scope: !4763)
!4773 = !DILocalVariable(name: "arg2_LW", scope: !4763, file: !4764, line: 41, type: !22)
!4774 = !DILocation(line: 41, column: 22, scope: !4763)
!4775 = !DILocalVariable(name: "arg2_HW", scope: !4763, file: !4764, line: 41, type: !22)
!4776 = !DILocation(line: 41, column: 30, scope: !4763)
!4777 = !DILocalVariable(name: "MulTemp1", scope: !4763, file: !4764, line: 42, type: !735)
!4778 = !DILocation(line: 42, column: 6, scope: !4763)
!4779 = !DILocalVariable(name: "MulTemp2", scope: !4763, file: !4764, line: 42, type: !735)
!4780 = !DILocation(line: 42, column: 16, scope: !4763)
!4781 = !DILocalVariable(name: "MulTemp3", scope: !4763, file: !4764, line: 42, type: !735)
!4782 = !DILocation(line: 42, column: 26, scope: !4763)
!4783 = !DILocalVariable(name: "MulTemp4", scope: !4763, file: !4764, line: 42, type: !735)
!4784 = !DILocation(line: 42, column: 36, scope: !4763)
!4785 = !DILocalVariable(name: "HIGHWORD", scope: !4763, file: !4764, line: 42, type: !735)
!4786 = !DILocation(line: 42, column: 47, scope: !4763)
!4787 = !DILocalVariable(name: "OverFlow", scope: !4763, file: !4764, line: 42, type: !735)
!4788 = !DILocation(line: 42, column: 57, scope: !4763)
!4789 = !DILocation(line: 43, column: 12, scope: !4763)
!4790 = !DILocation(line: 43, column: 17, scope: !4763)
!4791 = !DILocation(line: 43, column: 10, scope: !4763)
!4792 = !DILocation(line: 44, column: 13, scope: !4763)
!4793 = !DILocation(line: 44, column: 18, scope: !4763)
!4794 = !DILocation(line: 44, column: 31, scope: !4763)
!4795 = !DILocation(line: 44, column: 12, scope: !4763)
!4796 = !DILocation(line: 44, column: 10, scope: !4763)
!4797 = !DILocation(line: 45, column: 12, scope: !4763)
!4798 = !DILocation(line: 45, column: 17, scope: !4763)
!4799 = !DILocation(line: 45, column: 10, scope: !4763)
!4800 = !DILocation(line: 46, column: 13, scope: !4763)
!4801 = !DILocation(line: 46, column: 18, scope: !4763)
!4802 = !DILocation(line: 46, column: 31, scope: !4763)
!4803 = !DILocation(line: 46, column: 12, scope: !4763)
!4804 = !DILocation(line: 46, column: 10, scope: !4763)
!4805 = !DILocation(line: 47, column: 13, scope: !4763)
!4806 = !DILocation(line: 47, column: 23, scope: !4763)
!4807 = !DILocation(line: 47, column: 21, scope: !4763)
!4808 = !DILocation(line: 47, column: 11, scope: !4763)
!4809 = !DILocation(line: 48, column: 13, scope: !4763)
!4810 = !DILocation(line: 48, column: 23, scope: !4763)
!4811 = !DILocation(line: 48, column: 21, scope: !4763)
!4812 = !DILocation(line: 48, column: 11, scope: !4763)
!4813 = !DILocation(line: 49, column: 13, scope: !4763)
!4814 = !DILocation(line: 49, column: 23, scope: !4763)
!4815 = !DILocation(line: 49, column: 21, scope: !4763)
!4816 = !DILocation(line: 49, column: 11, scope: !4763)
!4817 = !DILocation(line: 50, column: 13, scope: !4763)
!4818 = !DILocation(line: 50, column: 23, scope: !4763)
!4819 = !DILocation(line: 50, column: 21, scope: !4763)
!4820 = !DILocation(line: 50, column: 11, scope: !4763)
!4821 = !DILocation(line: 52, column: 14, scope: !4763)
!4822 = !DILocation(line: 52, column: 23, scope: !4763)
!4823 = !DILocation(line: 52, column: 33, scope: !4763)
!4824 = !DILocation(line: 52, column: 42, scope: !4763)
!4825 = !DILocation(line: 52, column: 30, scope: !4763)
!4826 = !DILocation(line: 52, column: 51, scope: !4763)
!4827 = !DILocation(line: 52, column: 49, scope: !4763)
!4828 = !DILocation(line: 52, column: 11, scope: !4763)
!4829 = !DILocation(line: 53, column: 14, scope: !4763)
!4830 = !DILocation(line: 53, column: 22, scope: !4763)
!4831 = !DILocation(line: 53, column: 31, scope: !4763)
!4832 = !DILocation(line: 53, column: 40, scope: !4763)
!4833 = !DILocation(line: 53, column: 28, scope: !4763)
!4834 = !DILocation(line: 53, column: 53, scope: !4763)
!4835 = !DILocation(line: 53, column: 62, scope: !4763)
!4836 = !DILocation(line: 53, column: 50, scope: !4763)
!4837 = !DILocation(line: 53, column: 11, scope: !4763)
!4838 = !DILocation(line: 54, column: 6, scope: !4839)
!4839 = distinct !DILexicalBlock(scope: !4763, file: !4764, line: 54, column: 6)
!4840 = !DILocation(line: 54, column: 15, scope: !4839)
!4841 = !DILocation(line: 54, column: 6, scope: !4763)
!4842 = !DILocation(line: 56, column: 10, scope: !4843)
!4843 = distinct !DILexicalBlock(scope: !4839, file: !4764, line: 55, column: 2)
!4844 = !DILocation(line: 56, column: 22, scope: !4843)
!4845 = !DILocation(line: 56, column: 30, scope: !4843)
!4846 = !DILocation(line: 56, column: 19, scope: !4843)
!4847 = !DILocation(line: 56, column: 3, scope: !4843)
!4848 = !DILocation(line: 60, column: 10, scope: !4849)
!4849 = distinct !DILexicalBlock(scope: !4839, file: !4764, line: 59, column: 2)
!4850 = !DILocation(line: 60, column: 3, scope: !4849)
!4851 = !DILocation(line: 62, column: 1, scope: !4763)
!4852 = distinct !DISubprogram(name: "MulLowWord", scope: !4764, file: !4764, line: 78, type: !1411, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4853 = !DILocalVariable(name: "arg1", arg: 1, scope: !4852, file: !4764, line: 78, type: !735)
!4854 = !DILocation(line: 78, column: 29, scope: !4852)
!4855 = !DILocalVariable(name: "arg2", arg: 2, scope: !4852, file: !4764, line: 78, type: !735)
!4856 = !DILocation(line: 78, column: 47, scope: !4852)
!4857 = !DILocalVariable(name: "arg1_LW", scope: !4852, file: !4764, line: 80, type: !22)
!4858 = !DILocation(line: 80, column: 6, scope: !4852)
!4859 = !DILocalVariable(name: "arg1_HW", scope: !4852, file: !4764, line: 80, type: !22)
!4860 = !DILocation(line: 80, column: 14, scope: !4852)
!4861 = !DILocalVariable(name: "arg2_LW", scope: !4852, file: !4764, line: 80, type: !22)
!4862 = !DILocation(line: 80, column: 22, scope: !4852)
!4863 = !DILocalVariable(name: "arg2_HW", scope: !4852, file: !4764, line: 80, type: !22)
!4864 = !DILocation(line: 80, column: 30, scope: !4852)
!4865 = !DILocalVariable(name: "MulTemp1", scope: !4852, file: !4764, line: 81, type: !735)
!4866 = !DILocation(line: 81, column: 6, scope: !4852)
!4867 = !DILocalVariable(name: "MulTemp2", scope: !4852, file: !4764, line: 81, type: !735)
!4868 = !DILocation(line: 81, column: 16, scope: !4852)
!4869 = !DILocalVariable(name: "MulTemp3", scope: !4852, file: !4764, line: 81, type: !735)
!4870 = !DILocation(line: 81, column: 26, scope: !4852)
!4871 = !DILocalVariable(name: "MulTemp4", scope: !4852, file: !4764, line: 81, type: !735)
!4872 = !DILocation(line: 81, column: 36, scope: !4852)
!4873 = !DILocalVariable(name: "HIGHWORD", scope: !4852, file: !4764, line: 81, type: !735)
!4874 = !DILocation(line: 81, column: 47, scope: !4852)
!4875 = !DILocalVariable(name: "OverFlow", scope: !4852, file: !4764, line: 81, type: !735)
!4876 = !DILocation(line: 81, column: 57, scope: !4852)
!4877 = !DILocation(line: 82, column: 12, scope: !4852)
!4878 = !DILocation(line: 82, column: 17, scope: !4852)
!4879 = !DILocation(line: 82, column: 10, scope: !4852)
!4880 = !DILocation(line: 83, column: 13, scope: !4852)
!4881 = !DILocation(line: 83, column: 18, scope: !4852)
!4882 = !DILocation(line: 83, column: 31, scope: !4852)
!4883 = !DILocation(line: 83, column: 12, scope: !4852)
!4884 = !DILocation(line: 83, column: 10, scope: !4852)
!4885 = !DILocation(line: 84, column: 12, scope: !4852)
!4886 = !DILocation(line: 84, column: 17, scope: !4852)
!4887 = !DILocation(line: 84, column: 10, scope: !4852)
!4888 = !DILocation(line: 85, column: 13, scope: !4852)
!4889 = !DILocation(line: 85, column: 18, scope: !4852)
!4890 = !DILocation(line: 85, column: 31, scope: !4852)
!4891 = !DILocation(line: 85, column: 12, scope: !4852)
!4892 = !DILocation(line: 85, column: 10, scope: !4852)
!4893 = !DILocation(line: 86, column: 13, scope: !4852)
!4894 = !DILocation(line: 86, column: 23, scope: !4852)
!4895 = !DILocation(line: 86, column: 21, scope: !4852)
!4896 = !DILocation(line: 86, column: 11, scope: !4852)
!4897 = !DILocation(line: 87, column: 13, scope: !4852)
!4898 = !DILocation(line: 87, column: 23, scope: !4852)
!4899 = !DILocation(line: 87, column: 21, scope: !4852)
!4900 = !DILocation(line: 87, column: 11, scope: !4852)
!4901 = !DILocation(line: 88, column: 13, scope: !4852)
!4902 = !DILocation(line: 88, column: 23, scope: !4852)
!4903 = !DILocation(line: 88, column: 21, scope: !4852)
!4904 = !DILocation(line: 88, column: 11, scope: !4852)
!4905 = !DILocation(line: 89, column: 13, scope: !4852)
!4906 = !DILocation(line: 89, column: 23, scope: !4852)
!4907 = !DILocation(line: 89, column: 21, scope: !4852)
!4908 = !DILocation(line: 89, column: 11, scope: !4852)
!4909 = !DILocation(line: 90, column: 14, scope: !4852)
!4910 = !DILocation(line: 90, column: 28, scope: !4852)
!4911 = !DILocation(line: 90, column: 37, scope: !4852)
!4912 = !DILocation(line: 90, column: 46, scope: !4852)
!4913 = !DILocation(line: 90, column: 24, scope: !4852)
!4914 = !DILocation(line: 90, column: 56, scope: !4852)
!4915 = !DILocation(line: 90, column: 65, scope: !4852)
!4916 = !DILocation(line: 90, column: 74, scope: !4852)
!4917 = !DILocation(line: 90, column: 52, scope: !4852)
!4918 = !DILocation(line: 90, column: 11, scope: !4852)
!4919 = !DILocation(line: 92, column: 9, scope: !4852)
!4920 = !DILocation(line: 92, column: 2, scope: !4852)
!4921 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4922, file: !4922, line: 12, type: !4923, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !4926)
!4922 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4923 = !DISubroutineType(types: !4924)
!4924 = !{null, !4925}
!4925 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4926 = !{!4927}
!4927 = !DILocalVariable(name: "z", arg: 1, scope: !4921, file: !4922, line: 12, type: !4925)
!4928 = !DILocation(line: 0, scope: !4921)
!4929 = !DILocation(line: 13, column: 9, scope: !4930)
!4930 = distinct !DILexicalBlock(scope: !4921, file: !4922, line: 13, column: 7)
!4931 = !DILocation(line: 13, column: 7, scope: !4921)
!4932 = !DILocation(line: 14, column: 5, scope: !4930)
!4933 = !DILocation(line: 15, column: 1, scope: !4921)
!4934 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4935, file: !4935, line: 20, type: !4936, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4939)
!4935 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4936 = !DISubroutineType(types: !4937)
!4937 = !{null, !4938, !4938}
!4938 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4939 = !{!4940, !4941}
!4940 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4934, file: !4935, line: 20, type: !4938)
!4941 = !DILocalVariable(name: "shift", arg: 2, scope: !4934, file: !4935, line: 20, type: !4938)
!4942 = !DILocation(line: 0, scope: !4934)
!4943 = !DILocation(line: 21, column: 13, scope: !4944)
!4944 = distinct !DILexicalBlock(scope: !4934, file: !4935, line: 21, column: 7)
!4945 = !DILocation(line: 21, column: 7, scope: !4934)
!4946 = !DILocation(line: 27, column: 5, scope: !4947)
!4947 = distinct !DILexicalBlock(scope: !4944, file: !4935, line: 21, column: 26)
!4948 = !DILocation(line: 29, column: 1, scope: !4934)
