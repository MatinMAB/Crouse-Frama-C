; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118/build/s32_mul_s32_u16_alarm_0118.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [76 x i8] c"KLEE-ALARM-0118: signed overflow. assert value * (s32)factor <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0118.err\00", align 1
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
  %factor = alloca i16, align 2
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i16* %factor, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %result, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = bitcast i32* %value to i8*, !dbg !59
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !60
  %1 = bitcast i16* %factor to i8*, !dbg !61
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  %2 = load i32, i32* %value, align 4, !dbg !63
  %3 = load i16, i16* %factor, align 2, !dbg !64
  %call = call i32 @s32_mul_s32_u16(i32 %2, i16 zeroext %3), !dbg !65
  store i32 %call, i32* %result, align 4, !dbg !66
  %4 = load i32, i32* %result, align 4, !dbg !67
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
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !79, metadata !DIExpression()), !dbg !80
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !80
  %0 = load i8, i8* %value.addr, align 1, !dbg !81
  %conv = sext i8 %0 to i32, !dbg !81
  %1 = load i16, i16* %factor.addr, align 2, !dbg !82
  %conv1 = zext i16 %1 to i32, !dbg !82
  %mul = mul nsw i32 %conv, %conv1, !dbg !83
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !84
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !85
  %shr = ashr i32 %2, 16, !dbg !86
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !87
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !88
  %cmp = icmp slt i32 %3, 0, !dbg !90
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !91

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !92
  %and = and i32 %4, 65535, !dbg !93
  %cmp3 = icmp ne i32 %and, 0, !dbg !94
  br i1 %cmp3, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !96
  %add = add nsw i32 %5, 1, !dbg !98
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !99
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !100
  %conv5 = trunc i32 %6 to i8, !dbg !101
  store i8 %conv5, i8* %retval, align 1, !dbg !102
  br label %return, !dbg !102

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !103
  %conv6 = trunc i32 %7 to i8, !dbg !105
  store i8 %conv6, i8* %retval, align 1, !dbg !106
  br label %return, !dbg !106

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !107
  ret i8 %8, !dbg !107
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !108 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !113, metadata !DIExpression()), !dbg !114
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !115, metadata !DIExpression()), !dbg !116
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !116
  %0 = load i8, i8* %value.addr, align 1, !dbg !117
  %conv = sext i8 %0 to i32, !dbg !117
  %1 = load i16, i16* %factor.addr, align 2, !dbg !118
  %conv1 = zext i16 %1 to i32, !dbg !118
  %mul = mul nsw i32 %conv, %conv1, !dbg !119
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !120
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !121
  %shr = ashr i32 %2, 8, !dbg !122
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !123
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !124
  %cmp = icmp slt i32 %3, 0, !dbg !126
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !127

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !128
  %and = and i32 %4, 255, !dbg !129
  %cmp3 = icmp ne i32 %and, 0, !dbg !130
  br i1 %cmp3, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !132
  %add = add nsw i32 %5, 1, !dbg !134
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !135
  br label %if.end, !dbg !136

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !137
  %cmp5 = icmp slt i32 %6, 127, !dbg !139
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !140

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !141
  %cmp8 = icmp sgt i32 %7, -128, !dbg !144
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !145

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !146
  %conv11 = trunc i32 %8 to i8, !dbg !148
  store i8 %conv11, i8* %retval, align 1, !dbg !149
  br label %return, !dbg !149

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !150
  br label %return, !dbg !150

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !152
  br label %return, !dbg !152

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !154
  ret i8 %9, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !155 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !158, metadata !DIExpression()), !dbg !159
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !162, metadata !DIExpression()), !dbg !163
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !164, metadata !DIExpression()), !dbg !165
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !165
  %0 = load i8, i8* %value.addr, align 1, !dbg !166
  %conv = sext i8 %0 to i32, !dbg !166
  %1 = load i8, i8* %factor.addr, align 1, !dbg !167
  %conv1 = zext i8 %1 to i32, !dbg !167
  %mul = mul nsw i32 %conv, %conv1, !dbg !168
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !169
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !170
  %shr = ashr i32 %2, 8, !dbg !171
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !172
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !173
  %cmp = icmp slt i32 %3, 0, !dbg !175
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !176

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !177
  %and = and i32 %4, 255, !dbg !178
  %cmp3 = icmp ne i32 %and, 0, !dbg !179
  br i1 %cmp3, label %if.then, label %if.else, !dbg !180

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !181
  %add = add nsw i32 %5, 1, !dbg !183
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !184
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !185
  %conv5 = trunc i32 %6 to i8, !dbg !186
  store i8 %conv5, i8* %retval, align 1, !dbg !187
  br label %return, !dbg !187

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !188
  %conv6 = trunc i32 %7 to i8, !dbg !190
  store i8 %conv6, i8* %retval, align 1, !dbg !191
  br label %return, !dbg !191

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !192
  ret i8 %8, !dbg !192
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !193 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !196, metadata !DIExpression()), !dbg !197
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !198, metadata !DIExpression()), !dbg !199
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !200, metadata !DIExpression()), !dbg !201
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !201
  %0 = load i8, i8* %value.addr, align 1, !dbg !202
  %conv = sext i8 %0 to i32, !dbg !202
  %1 = load i8, i8* %factor.addr, align 1, !dbg !203
  %conv1 = zext i8 %1 to i32, !dbg !203
  %mul = mul nsw i32 %conv, %conv1, !dbg !204
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !205
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !206
  %shr = ashr i32 %2, 7, !dbg !207
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !208
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !209
  %cmp = icmp slt i32 %3, 0, !dbg !211
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !212

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !213
  %and = and i32 %4, 127, !dbg !214
  %cmp3 = icmp ne i32 %and, 0, !dbg !215
  br i1 %cmp3, label %if.then, label %if.end, !dbg !216

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !217
  %add = add nsw i32 %5, 1, !dbg !219
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !220
  br label %if.end, !dbg !221

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !222
  %cmp5 = icmp slt i32 %6, 127, !dbg !224
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !225

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !226
  %cmp8 = icmp sgt i32 %7, -128, !dbg !229
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !230

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !231
  %conv11 = trunc i32 %8 to i8, !dbg !233
  store i8 %conv11, i8* %retval, align 1, !dbg !234
  br label %return, !dbg !234

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !235
  br label %return, !dbg !235

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !237
  br label %return, !dbg !237

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !239
  ret i8 %9, !dbg !239
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !240 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !243, metadata !DIExpression()), !dbg !244
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !245, metadata !DIExpression()), !dbg !246
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !247, metadata !DIExpression()), !dbg !248
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !249, metadata !DIExpression()), !dbg !250
  store i32 0, i32* %s32MulTemp, align 4, !dbg !250
  %0 = load i16, i16* %value.addr, align 2, !dbg !251
  %conv = sext i16 %0 to i32, !dbg !251
  %1 = load i16, i16* %factor.addr, align 2, !dbg !252
  %conv1 = sext i16 %1 to i32, !dbg !252
  %mul = mul nsw i32 %conv, %conv1, !dbg !253
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !254
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !255
  %3 = load i32, i32* %count.addr, align 4, !dbg !256
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !257
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !257
  %div = sdiv i32 %2, %3, !dbg !257, !klee.check.div !258
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !259
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !260
  %conv2 = trunc i32 %4 to i16, !dbg !260
  ret i16 %conv2, !dbg !261
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !262 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !263, metadata !DIExpression()), !dbg !264
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !265, metadata !DIExpression()), !dbg !266
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 0, i32* %s32MulTemp, align 4, !dbg !270
  %0 = load i16, i16* %value.addr, align 2, !dbg !271
  %conv = sext i16 %0 to i32, !dbg !271
  %1 = load i16, i16* %factor.addr, align 2, !dbg !272
  %conv1 = sext i16 %1 to i32, !dbg !272
  %mul = mul nsw i32 %conv, %conv1, !dbg !273
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !274
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !275
  %3 = load i32, i32* %count.addr, align 4, !dbg !276
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !277
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !277
  %div = sdiv i32 %2, %3, !dbg !277, !klee.check.div !258
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !278
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !279
  %cmp = icmp slt i32 %4, 32767, !dbg !281
  br i1 %cmp, label %if.then, label %if.else7, !dbg !282

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !283
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !286
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !287

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !288
  %conv6 = trunc i32 %6 to i16, !dbg !290
  store i16 %conv6, i16* %retval, align 2, !dbg !291
  br label %return, !dbg !291

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !292
  br label %return, !dbg !292

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !294
  br label %return, !dbg !294

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !296
  ret i16 %7, !dbg !296
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !297 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !300, metadata !DIExpression()), !dbg !301
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !302, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !304, metadata !DIExpression()), !dbg !305
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !305
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !307
  %0 = load i16, i16* %value.addr, align 2, !dbg !308
  %conv = sext i16 %0 to i32, !dbg !308
  %1 = load i16, i16* %factor.addr, align 2, !dbg !309
  %conv1 = sext i16 %1 to i32, !dbg !309
  %mul = mul nsw i32 %conv, %conv1, !dbg !310
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !311
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !312
  %shr = ashr i32 %2, 15, !dbg !313
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !314
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !315
  %cmp = icmp slt i32 %3, 0, !dbg !317
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !318

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !319
  %and = and i32 %4, 32767, !dbg !320
  %cmp3 = icmp ne i32 %and, 0, !dbg !321
  br i1 %cmp3, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !323
  %add = add nsw i32 %5, 1, !dbg !325
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !326
  br label %if.end, !dbg !327

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !328
  %cmp5 = icmp slt i32 %6, 32767, !dbg !330
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !331

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !332
  %conv8 = trunc i32 %7 to i16, !dbg !334
  store i16 %conv8, i16* %retval, align 2, !dbg !335
  br label %return, !dbg !335

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !336
  br label %return, !dbg !336

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !338
  ret i16 %8, !dbg !338
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !339 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !340, metadata !DIExpression()), !dbg !341
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !342, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !344, metadata !DIExpression()), !dbg !345
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !345
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !346, metadata !DIExpression()), !dbg !347
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !347
  %0 = load i16, i16* %value.addr, align 2, !dbg !348
  %conv = sext i16 %0 to i32, !dbg !348
  %1 = load i16, i16* %factor.addr, align 2, !dbg !349
  %conv1 = sext i16 %1 to i32, !dbg !349
  %mul = mul nsw i32 %conv, %conv1, !dbg !350
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !351
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !352
  %shr = ashr i32 %2, 14, !dbg !353
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !354
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !355
  %cmp = icmp slt i32 %3, 0, !dbg !357
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !358

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !359
  %and = and i32 %4, 16383, !dbg !360
  %cmp3 = icmp ne i32 %and, 0, !dbg !361
  br i1 %cmp3, label %if.then, label %if.end, !dbg !362

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !363
  %add = add nsw i32 %5, 1, !dbg !365
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !366
  br label %if.end, !dbg !367

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !368
  %cmp5 = icmp slt i32 %6, 32767, !dbg !370
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !371

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !372
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !375
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !376

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !377
  %conv11 = trunc i32 %8 to i16, !dbg !379
  store i16 %conv11, i16* %retval, align 2, !dbg !380
  br label %return, !dbg !380

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !381
  br label %return, !dbg !381

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !383
  br label %return, !dbg !383

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !385
  ret i16 %9, !dbg !385
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !386 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !389, metadata !DIExpression()), !dbg !390
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !391, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !393, metadata !DIExpression()), !dbg !394
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !394
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !395, metadata !DIExpression()), !dbg !396
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !396
  %0 = load i16, i16* %value.addr, align 2, !dbg !397
  %conv = sext i16 %0 to i32, !dbg !397
  %1 = load i16, i16* %factor.addr, align 2, !dbg !398
  %conv1 = zext i16 %1 to i32, !dbg !398
  %mul = mul nsw i32 %conv, %conv1, !dbg !399
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !400
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !401
  %shr = ashr i32 %2, 16, !dbg !402
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !403
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !404
  %cmp = icmp slt i32 %3, 0, !dbg !406
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !407

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !408
  %and = and i32 %4, 32767, !dbg !409
  %cmp3 = icmp ne i32 %and, 0, !dbg !410
  br i1 %cmp3, label %if.then, label %if.else, !dbg !411

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !412
  %add = add nsw i32 %5, 1, !dbg !414
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !415
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !416
  %conv5 = trunc i32 %6 to i16, !dbg !417
  store i16 %conv5, i16* %retval, align 2, !dbg !418
  br label %return, !dbg !418

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !419
  %conv6 = trunc i32 %7 to i16, !dbg !421
  store i16 %conv6, i16* %retval, align 2, !dbg !422
  br label %return, !dbg !422

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !423
  ret i16 %8, !dbg !423
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !424 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !425, metadata !DIExpression()), !dbg !426
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !427, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !429, metadata !DIExpression()), !dbg !430
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !430
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !432
  %0 = load i16, i16* %value.addr, align 2, !dbg !433
  %conv = sext i16 %0 to i32, !dbg !433
  %1 = load i16, i16* %factor.addr, align 2, !dbg !434
  %conv1 = zext i16 %1 to i32, !dbg !434
  %mul = mul nsw i32 %conv, %conv1, !dbg !435
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !436
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !437
  %shr = ashr i32 %2, 8, !dbg !438
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !439
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !440
  %cmp = icmp slt i32 %3, 0, !dbg !442
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !443

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !444
  %and = and i32 %4, 255, !dbg !445
  %cmp3 = icmp ne i32 %and, 0, !dbg !446
  br i1 %cmp3, label %if.then, label %if.end, !dbg !447

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !448
  %add = add nsw i32 %5, 1, !dbg !450
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !451
  br label %if.end, !dbg !452

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !453
  %cmp5 = icmp slt i32 %6, 32767, !dbg !455
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !456

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !457
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !460
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !461

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !462
  %conv11 = trunc i32 %8 to i16, !dbg !464
  store i16 %conv11, i16* %retval, align 2, !dbg !465
  br label %return, !dbg !465

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !466
  br label %return, !dbg !466

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !468
  br label %return, !dbg !468

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !470
  ret i16 %9, !dbg !470
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !471 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !474, metadata !DIExpression()), !dbg !475
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !476, metadata !DIExpression()), !dbg !477
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !478, metadata !DIExpression()), !dbg !479
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !479
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !480, metadata !DIExpression()), !dbg !481
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !481
  %0 = load i16, i16* %value.addr, align 2, !dbg !482
  %conv = sext i16 %0 to i32, !dbg !482
  %1 = load i8, i8* %factor.addr, align 1, !dbg !483
  %conv1 = zext i8 %1 to i32, !dbg !483
  %mul = mul nsw i32 %conv, %conv1, !dbg !484
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !485
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !486
  %shr = ashr i32 %2, 8, !dbg !487
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !488
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !489
  %cmp = icmp slt i32 %3, 0, !dbg !491
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !492

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !493
  %and = and i32 %4, 255, !dbg !494
  %cmp3 = icmp ne i32 %and, 0, !dbg !495
  br i1 %cmp3, label %if.then, label %if.else, !dbg !496

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !497
  %add = add nsw i32 %5, 1, !dbg !499
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !500
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !501
  %conv5 = trunc i32 %6 to i16, !dbg !501
  store i16 %conv5, i16* %retval, align 2, !dbg !502
  br label %return, !dbg !502

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !503
  %conv6 = trunc i32 %7 to i16, !dbg !503
  store i16 %conv6, i16* %retval, align 2, !dbg !505
  br label %return, !dbg !505

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !506
  ret i16 %8, !dbg !506
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !507 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !508, metadata !DIExpression()), !dbg !509
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !510, metadata !DIExpression()), !dbg !511
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !512, metadata !DIExpression()), !dbg !513
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !513
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !514, metadata !DIExpression()), !dbg !515
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !515
  %0 = load i16, i16* %value.addr, align 2, !dbg !516
  %conv = sext i16 %0 to i32, !dbg !516
  %1 = load i8, i8* %factor.addr, align 1, !dbg !517
  %conv1 = zext i8 %1 to i32, !dbg !517
  %mul = mul nsw i32 %conv, %conv1, !dbg !518
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !519
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !520
  %shr = ashr i32 %2, 7, !dbg !521
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !522
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !523
  %cmp = icmp slt i32 %3, 0, !dbg !525
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !526

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !527
  %and = and i32 %4, 127, !dbg !528
  %cmp3 = icmp ne i32 %and, 0, !dbg !529
  br i1 %cmp3, label %if.then, label %if.end, !dbg !530

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !531
  %add = add nsw i32 %5, 1, !dbg !533
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !534
  br label %if.end, !dbg !535

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !536
  %cmp5 = icmp slt i32 %6, 32767, !dbg !538
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !539

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !540
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !543
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !544

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !545
  %conv11 = trunc i32 %8 to i16, !dbg !547
  store i16 %conv11, i16* %retval, align 2, !dbg !548
  br label %return, !dbg !548

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !549
  br label %return, !dbg !549

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !551
  br label %return, !dbg !551

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !553
  ret i16 %9, !dbg !553
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !554 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !555, metadata !DIExpression()), !dbg !556
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !557, metadata !DIExpression()), !dbg !558
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !559, metadata !DIExpression()), !dbg !560
  store i32 0, i32* %s32MulTemp, align 4, !dbg !560
  %0 = load i16, i16* %value.addr, align 2, !dbg !561
  %conv = sext i16 %0 to i32, !dbg !561
  %1 = load i16, i16* %factor.addr, align 2, !dbg !562
  %conv1 = zext i16 %1 to i32, !dbg !562
  %mul = mul nsw i32 %conv, %conv1, !dbg !563
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !564
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !565
  %cmp = icmp slt i32 %2, 32767, !dbg !567
  br i1 %cmp, label %if.then, label %if.else7, !dbg !568

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !569
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !572
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !573

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !574
  %conv6 = trunc i32 %4 to i16, !dbg !576
  store i16 %conv6, i16* %retval, align 2, !dbg !577
  br label %return, !dbg !577

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !578
  br label %return, !dbg !578

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !580
  br label %return, !dbg !580

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !582
  ret i16 %5, !dbg !582
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !583 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !586, metadata !DIExpression()), !dbg !587
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !588, metadata !DIExpression()), !dbg !589
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !590, metadata !DIExpression()), !dbg !591
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !592, metadata !DIExpression()), !dbg !593
  store i32 0, i32* %s32MulTemp, align 4, !dbg !593
  %0 = load i16, i16* %value.addr, align 2, !dbg !594
  %conv = sext i16 %0 to i32, !dbg !594
  %1 = load i16, i16* %factor.addr, align 2, !dbg !595
  %conv1 = zext i16 %1 to i32, !dbg !595
  %mul = mul nsw i32 %conv, %conv1, !dbg !596
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !597
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !598
  %3 = load i32, i32* %count.addr, align 4, !dbg !599
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !600
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !600
  %div = sdiv i32 %2, %3, !dbg !600, !klee.check.div !258
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !601
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !602
  %conv2 = trunc i32 %4 to i16, !dbg !603
  ret i16 %conv2, !dbg !604
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !605 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !608, metadata !DIExpression()), !dbg !609
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !610, metadata !DIExpression()), !dbg !611
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !612, metadata !DIExpression()), !dbg !613
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !614, metadata !DIExpression()), !dbg !615
  store i32 0, i32* %s32MulTemp, align 4, !dbg !615
  %0 = load i16, i16* %value.addr, align 2, !dbg !616
  %conv = sext i16 %0 to i32, !dbg !616
  %1 = load i16, i16* %factor.addr, align 2, !dbg !617
  %conv1 = zext i16 %1 to i32, !dbg !617
  %mul = mul nsw i32 %conv, %conv1, !dbg !618
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !619
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !620
  %3 = load i16, i16* %count.addr, align 2, !dbg !621
  %conv2 = zext i16 %3 to i32, !dbg !621
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !622
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !622
  %div = sdiv i32 %2, %conv2, !dbg !622, !klee.check.div !258
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !623
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !624
  %cmp = icmp slt i32 %4, 32767, !dbg !626
  br i1 %cmp, label %if.then, label %if.else8, !dbg !627

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !628
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !631
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !632

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !633
  %conv7 = trunc i32 %6 to i16, !dbg !635
  store i16 %conv7, i16* %retval, align 2, !dbg !636
  br label %return, !dbg !636

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !637
  br label %return, !dbg !637

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !641
  ret i16 %7, !dbg !641
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !642 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !643, metadata !DIExpression()), !dbg !644
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !645, metadata !DIExpression()), !dbg !646
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !647, metadata !DIExpression()), !dbg !648
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !648
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !649, metadata !DIExpression()), !dbg !650
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !650
  %0 = load i16, i16* %value.addr, align 2, !dbg !651
  %conv = sext i16 %0 to i32, !dbg !651
  %1 = load i16, i16* %factor.addr, align 2, !dbg !652
  %conv1 = zext i16 %1 to i32, !dbg !652
  %mul = mul nsw i32 %conv, %conv1, !dbg !653
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !654
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !655
  %shr = ashr i32 %2, 16, !dbg !656
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !657
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !658
  %cmp = icmp slt i32 %3, 0, !dbg !660
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !661

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !662
  %and = and i32 %4, 65535, !dbg !663
  %cmp3 = icmp ne i32 %and, 0, !dbg !664
  br i1 %cmp3, label %if.then, label %if.else, !dbg !665

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !666
  %add = add nsw i32 %5, 1, !dbg !668
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !669
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !670
  %conv5 = trunc i32 %6 to i16, !dbg !671
  store i16 %conv5, i16* %retval, align 2, !dbg !672
  br label %return, !dbg !672

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !673
  %conv6 = trunc i32 %7 to i16, !dbg !675
  store i16 %conv6, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !677
  ret i16 %8, !dbg !677
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !678 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !679, metadata !DIExpression()), !dbg !680
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !681, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !683, metadata !DIExpression()), !dbg !684
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !684
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !685, metadata !DIExpression()), !dbg !686
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !686
  %0 = load i16, i16* %value.addr, align 2, !dbg !687
  %conv = sext i16 %0 to i32, !dbg !687
  %1 = load i16, i16* %factor.addr, align 2, !dbg !688
  %conv1 = zext i16 %1 to i32, !dbg !688
  %mul = mul nsw i32 %conv, %conv1, !dbg !689
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !690
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !691
  %shr = ashr i32 %2, 15, !dbg !692
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !693
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !694
  %cmp = icmp slt i32 %3, 0, !dbg !696
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !697

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !698
  %and = and i32 %4, 32767, !dbg !699
  %cmp3 = icmp ne i32 %and, 0, !dbg !700
  br i1 %cmp3, label %if.then, label %if.end, !dbg !701

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !702
  %add = add nsw i32 %5, 1, !dbg !704
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !705
  br label %if.end, !dbg !706

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !707
  %cmp5 = icmp slt i32 %6, 32767, !dbg !709
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !710

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !711
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !714
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !715

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !716
  %conv11 = trunc i32 %8 to i16, !dbg !718
  store i16 %conv11, i16* %retval, align 2, !dbg !719
  br label %return, !dbg !719

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !720
  br label %return, !dbg !720

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !722
  br label %return, !dbg !722

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !724
  ret i16 %9, !dbg !724
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !725 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !728, metadata !DIExpression()), !dbg !729
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !730, metadata !DIExpression()), !dbg !731
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !732, metadata !DIExpression()), !dbg !737
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
  br i1 %cmp, label %if.then, label %if.else31, !dbg !789

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !790
  %cmp3 = icmp slt i32 %2, 0, !dbg !793
  br i1 %cmp3, label %if.then5, label %if.else14, !dbg !794

if.then5:                                         ; preds = %if.then
  %3 = load i32, i32* %s32Temp2, align 4, !dbg !795
  %4 = load i32, i32* %s32Factor, align 4, !dbg !797
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !798
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !798
  %div = sdiv i32 %3, %4, !dbg !798, !klee.check.div !258
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
  %conv9 = sext i32 %7 to i64, !dbg !810
  %8 = load i16, i16* %factor.addr, align 2, !dbg !811
  %conv10 = zext i16 %8 to i32, !dbg !812
  %conv11 = sext i32 %conv10 to i64, !dbg !813
  %call = call i32 @klee_alarm_s32_mul_lower(i64 %conv9, i64 %conv11), !dbg !814
  %tobool = icmp ne i32 %call, 0, !dbg !814
  br i1 %tobool, label %if.end, label %if.then12, !dbg !815

if.then12:                                        ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !816
  br label %return, !dbg !816

if.end:                                           ; preds = %if.else
  %9 = load i32, i32* %value.addr, align 4, !dbg !818
  %10 = load i16, i16* %factor.addr, align 2, !dbg !819
  %conv13 = zext i16 %10 to i32, !dbg !819
  %mul = mul nsw i32 %9, %conv13, !dbg !820
  store i32 %mul, i32* %retval, align 4, !dbg !821
  br label %return, !dbg !821

if.else14:                                        ; preds = %if.then
  %11 = load i16, i16* %factor.addr, align 2, !dbg !822
  %conv15 = zext i16 %11 to i32, !dbg !822
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !825
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !825
  %div16 = udiv i32 2147483647, %conv15, !dbg !825, !klee.check.div !258
  %12 = load i32, i32* %value.addr, align 4, !dbg !826
  %cmp17 = icmp ule i32 %div16, %12, !dbg !827
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !828

if.then19:                                        ; preds = %if.else14
  store i32 2147483647, i32* %retval, align 4, !dbg !829
  br label %return, !dbg !829

if.else20:                                        ; preds = %if.else14
  %13 = load i32, i32* %value.addr, align 4, !dbg !831
  %conv21 = sext i32 %13 to i64, !dbg !834
  %14 = load i16, i16* %factor.addr, align 2, !dbg !835
  %conv22 = zext i16 %14 to i32, !dbg !836
  %conv23 = sext i32 %conv22 to i64, !dbg !837
  %call24 = call i32 @klee_alarm_s32_mul_upper(i64 %conv21, i64 %conv23), !dbg !838
  %tobool25 = icmp ne i32 %call24, 0, !dbg !838
  br i1 %tobool25, label %if.end27, label %if.then26, !dbg !839

if.then26:                                        ; preds = %if.else20
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 786, i8* getelementptr inbounds ([76 x i8], [76 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !840
  unreachable, !dbg !840

if.end27:                                         ; preds = %if.else20
  %15 = load i32, i32* %value.addr, align 4, !dbg !842
  %16 = load i16, i16* %factor.addr, align 2, !dbg !843
  %conv28 = zext i16 %16 to i32, !dbg !844
  %mul29 = mul nsw i32 %15, %conv28, !dbg !845
  %conv30 = sext i32 %mul29 to i64, !dbg !846
  store volatile i64 %conv30, i64* @klee_alarm_sink_s64, align 8, !dbg !847
  store i32 0, i32* %retval, align 4, !dbg !848
  br label %return, !dbg !848

if.else31:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !849
  br label %return, !dbg !849

return:                                           ; preds = %if.else31, %if.end27, %if.then19, %if.end, %if.then12, %if.then8
  %17 = load i32, i32* %retval, align 4, !dbg !851
  ret i32 %17, !dbg !851
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !852 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !855, metadata !DIExpression()), !dbg !856
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !857, metadata !DIExpression()), !dbg !858
  %0 = load i64, i64* %left.addr, align 8, !dbg !859
  %1 = load i64, i64* %right.addr, align 8, !dbg !860
  %mul = mul nsw i64 %0, %1, !dbg !861
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !862
  %conv = zext i1 %cmp to i32, !dbg !862
  ret i32 %conv, !dbg !863
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !864 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !865, metadata !DIExpression()), !dbg !866
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !867, metadata !DIExpression()), !dbg !868
  %0 = load i64, i64* %left.addr, align 8, !dbg !869
  %1 = load i64, i64* %right.addr, align 8, !dbg !870
  %mul = mul nsw i64 %0, %1, !dbg !871
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !872
  %conv = zext i1 %cmp to i32, !dbg !872
  ret i32 %conv, !dbg !873
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !874 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !877, metadata !DIExpression()), !dbg !878
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !879, metadata !DIExpression()), !dbg !880
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !881, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !883, metadata !DIExpression()), !dbg !884
  store i16 0, i16* %u16MulTemp, align 2, !dbg !884
  %0 = load i8, i8* %value.addr, align 1, !dbg !885
  %conv = zext i8 %0 to i32, !dbg !885
  %1 = load i8, i8* %factor.addr, align 1, !dbg !886
  %conv1 = zext i8 %1 to i32, !dbg !886
  %mul = mul nsw i32 %conv, %conv1, !dbg !887
  %conv2 = trunc i32 %mul to i16, !dbg !885
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !888
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !889
  %conv3 = zext i16 %2 to i32, !dbg !889
  %3 = load i16, i16* %count.addr, align 2, !dbg !890
  %conv4 = zext i16 %3 to i32, !dbg !890
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !891
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !891
  %div = sdiv i32 %conv3, %conv4, !dbg !891, !klee.check.div !258
  %conv5 = trunc i32 %div to i16, !dbg !889
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !892
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !893
  %conv6 = trunc i16 %4 to i8, !dbg !894
  ret i8 %conv6, !dbg !895
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !896 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !901, metadata !DIExpression()), !dbg !902
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !903, metadata !DIExpression()), !dbg !904
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
  %3 = load i8, i8* %count.addr, align 1, !dbg !912
  %conv4 = zext i8 %3 to i32, !dbg !912
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !913
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !913
  %div = sdiv i32 %conv3, %conv4, !dbg !913, !klee.check.div !258
  %conv5 = trunc i32 %div to i16, !dbg !911
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !914
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !915
  %conv6 = zext i16 %4 to i32, !dbg !915
  %cmp = icmp sle i32 %conv6, 255, !dbg !917
  br i1 %cmp, label %if.then, label %if.else, !dbg !918

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !919
  %conv8 = zext i16 %5 to i32, !dbg !919
  %and = and i32 %conv8, 255, !dbg !921
  %conv9 = trunc i32 %and to i8, !dbg !919
  store i8 %conv9, i8* %retval, align 1, !dbg !922
  br label %return, !dbg !922

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !923
  br label %return, !dbg !923

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !925
  ret i8 %6, !dbg !925
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !926 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !929, metadata !DIExpression()), !dbg !930
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !931, metadata !DIExpression()), !dbg !932
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !933, metadata !DIExpression()), !dbg !934
  store i16 0, i16* %u16MulTemp, align 2, !dbg !934
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !935
  %conv = zext i8 %0 to i32, !dbg !935
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !936
  %conv1 = zext i8 %1 to i32, !dbg !936
  %mul = mul nsw i32 %conv, %conv1, !dbg !937
  %conv2 = trunc i32 %mul to i16, !dbg !935
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !938
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !939
  %conv3 = zext i16 %2 to i32, !dbg !939
  %shr = ashr i32 %conv3, 8, !dbg !940
  %conv4 = trunc i32 %shr to i16, !dbg !939
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !941
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !942
  %conv5 = trunc i16 %3 to i8, !dbg !943
  ret i8 %conv5, !dbg !944
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !945 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !946, metadata !DIExpression()), !dbg !947
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !948, metadata !DIExpression()), !dbg !949
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !950, metadata !DIExpression()), !dbg !951
  store i16 0, i16* %u16MulTemp, align 2, !dbg !951
  %0 = load i8, i8* %value.addr, align 1, !dbg !952
  %conv = zext i8 %0 to i32, !dbg !952
  %1 = load i8, i8* %factor.addr, align 1, !dbg !953
  %conv1 = zext i8 %1 to i32, !dbg !953
  %mul = mul nsw i32 %conv, %conv1, !dbg !954
  %conv2 = trunc i32 %mul to i16, !dbg !952
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !955
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !956
  %conv3 = zext i16 %2 to i32, !dbg !956
  %shr = ashr i32 %conv3, 7, !dbg !957
  %conv4 = trunc i32 %shr to i16, !dbg !956
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !958
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !959
  %conv5 = zext i16 %3 to i32, !dbg !959
  %cmp = icmp slt i32 %conv5, 255, !dbg !961
  br i1 %cmp, label %if.then, label %if.else, !dbg !962

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !963
  %conv7 = trunc i16 %4 to i8, !dbg !965
  store i8 %conv7, i8* %retval, align 1, !dbg !966
  br label %return, !dbg !966

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !967
  br label %return, !dbg !967

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !969
  ret i8 %5, !dbg !969
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !970 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !973, metadata !DIExpression()), !dbg !974
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !975, metadata !DIExpression()), !dbg !976
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !977, metadata !DIExpression()), !dbg !978
  store i32 0, i32* %u32MulTemp, align 4, !dbg !978
  %0 = load i16, i16* %value.addr, align 2, !dbg !979
  %conv = zext i16 %0 to i32, !dbg !979
  %1 = load i16, i16* %factor.addr, align 2, !dbg !980
  %conv1 = zext i16 %1 to i32, !dbg !980
  %mul = mul nsw i32 %conv, %conv1, !dbg !981
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !982
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !983
  %shr = lshr i32 %2, 16, !dbg !984
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !985
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !986
  %conv2 = trunc i32 %3 to i16, !dbg !987
  ret i16 %conv2, !dbg !988
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !989 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !990, metadata !DIExpression()), !dbg !991
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !992, metadata !DIExpression()), !dbg !993
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !994, metadata !DIExpression()), !dbg !995
  store i32 0, i32* %u32MulTemp, align 4, !dbg !995
  %0 = load i16, i16* %value.addr, align 2, !dbg !996
  %conv = zext i16 %0 to i32, !dbg !996
  %1 = load i16, i16* %factor.addr, align 2, !dbg !997
  %conv1 = zext i16 %1 to i32, !dbg !997
  %mul = mul nsw i32 %conv, %conv1, !dbg !998
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !999
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1000
  %shr = lshr i32 %2, 8, !dbg !1001
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
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !1015 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1022, metadata !DIExpression()), !dbg !1023
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1023
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1024
  %conv = zext i16 %0 to i32, !dbg !1024
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1025
  %conv1 = zext i8 %1 to i32, !dbg !1025
  %mul = mul nsw i32 %conv, %conv1, !dbg !1026
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1027
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1028
  %shr = lshr i32 %2, 8, !dbg !1029
  %and = and i32 %shr, 65535, !dbg !1030
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !1031
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1032
  %conv2 = trunc i32 %3 to i16, !dbg !1032
  ret i16 %conv2, !dbg !1033
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !1034 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1035, metadata !DIExpression()), !dbg !1036
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !1037, metadata !DIExpression()), !dbg !1038
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1039, metadata !DIExpression()), !dbg !1040
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1040
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1041
  %conv = zext i16 %0 to i32, !dbg !1041
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1042
  %conv1 = zext i8 %1 to i32, !dbg !1042
  %mul = mul nsw i32 %conv, %conv1, !dbg !1043
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1044
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1045
  %shr = lshr i32 %2, 7, !dbg !1046
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1047
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1048
  %cmp = icmp ult i32 %3, 65535, !dbg !1050
  br i1 %cmp, label %if.then, label %if.else, !dbg !1051

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1052
  %and = and i32 %4, 65535, !dbg !1054
  %conv3 = trunc i32 %and to i16, !dbg !1055
  store i16 %conv3, i16* %retval, align 2, !dbg !1056
  br label %return, !dbg !1056

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1057
  br label %return, !dbg !1057

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1059
  ret i16 %5, !dbg !1059
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1060 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1063, metadata !DIExpression()), !dbg !1064
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1065, metadata !DIExpression()), !dbg !1066
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1067, metadata !DIExpression()), !dbg !1068
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1069, metadata !DIExpression()), !dbg !1070
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1070
  %0 = load i16, i16* %value.addr, align 2, !dbg !1071
  %conv = zext i16 %0 to i32, !dbg !1071
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1072
  %conv1 = zext i16 %1 to i32, !dbg !1072
  %mul = mul nsw i32 %conv, %conv1, !dbg !1073
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1074
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1075
  %3 = load i32, i32* %count.addr, align 4, !dbg !1076
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1077
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1077
  %div = udiv i32 %2, %3, !dbg !1077, !klee.check.div !258
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1078
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1079
  %and = and i32 %4, 65535, !dbg !1080
  %conv2 = trunc i32 %and to i16, !dbg !1081
  ret i16 %conv2, !dbg !1082
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1083 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1086, metadata !DIExpression()), !dbg !1087
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1093
  %0 = load i16, i16* %value.addr, align 2, !dbg !1094
  %conv = zext i16 %0 to i32, !dbg !1094
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1095
  %conv1 = zext i16 %1 to i32, !dbg !1095
  %mul = mul nsw i32 %conv, %conv1, !dbg !1096
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1097
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1098
  %3 = load i16, i16* %count.addr, align 2, !dbg !1099
  %conv2 = zext i16 %3 to i32, !dbg !1099
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1100
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1100
  %div = udiv i32 %2, %conv2, !dbg !1100, !klee.check.div !258
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1101
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1102
  %cmp = icmp ule i32 %4, 65535, !dbg !1104
  br i1 %cmp, label %if.then, label %if.else, !dbg !1105

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1106
  %and = and i32 %5, 65535, !dbg !1108
  %conv4 = trunc i32 %and to i16, !dbg !1109
  store i16 %conv4, i16* %retval, align 2, !dbg !1110
  br label %return, !dbg !1110

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1111
  br label %return, !dbg !1111

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1113
  ret i16 %6, !dbg !1113
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1114 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1115, metadata !DIExpression()), !dbg !1116
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1117, metadata !DIExpression()), !dbg !1118
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1119, metadata !DIExpression()), !dbg !1120
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1120
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1121
  %conv = zext i16 %0 to i32, !dbg !1121
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1122
  %conv1 = zext i16 %1 to i32, !dbg !1122
  %mul = mul nsw i32 %conv, %conv1, !dbg !1123
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1124
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1125
  %shr = lshr i32 %2, 16, !dbg !1126
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1127
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1128
  %and = and i32 65535, %3, !dbg !1129
  %conv2 = trunc i32 %and to i16, !dbg !1130
  ret i16 %conv2, !dbg !1131
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1132 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1133, metadata !DIExpression()), !dbg !1134
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1135, metadata !DIExpression()), !dbg !1136
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1137, metadata !DIExpression()), !dbg !1138
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1138
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1139
  %conv = zext i16 %0 to i32, !dbg !1139
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1140
  %conv1 = zext i16 %1 to i32, !dbg !1140
  %mul = mul nsw i32 %conv, %conv1, !dbg !1141
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1142
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1143
  %shr = lshr i32 %2, 15, !dbg !1144
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1145
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1146
  %cmp = icmp ule i32 %3, 65535, !dbg !1148
  br i1 %cmp, label %if.then, label %if.else, !dbg !1149

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1150
  %and = and i32 %4, 65535, !dbg !1152
  %conv3 = trunc i32 %and to i16, !dbg !1153
  store i16 %conv3, i16* %retval, align 2, !dbg !1154
  br label %return, !dbg !1154

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1155
  br label %return, !dbg !1155

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1157
  ret i16 %5, !dbg !1157
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1158 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1161, metadata !DIExpression()), !dbg !1162
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1163, metadata !DIExpression()), !dbg !1164
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1165, metadata !DIExpression()), !dbg !1166
  store i32 0, i32* %u32Temp1, align 4, !dbg !1166
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1167
  %conv = zext i16 %0 to i32, !dbg !1167
  %cmp = icmp sgt i32 %conv, 0, !dbg !1169
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1170

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1171
  %conv2 = zext i16 %1 to i32, !dbg !1171
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1173
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1173
  %div = udiv i32 -1, %conv2, !dbg !1173, !klee.check.div !258
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1174
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1175
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1177
  %cmp3 = icmp ult i32 %2, %3, !dbg !1178
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1179

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1180
  br label %return, !dbg !1180

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1182
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1184
  %conv6 = zext i16 %5 to i32, !dbg !1184
  %mul = mul i32 %4, %conv6, !dbg !1185
  store i32 %mul, i32* %retval, align 4, !dbg !1186
  br label %return, !dbg !1186

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1187
  br label %return, !dbg !1187

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1189
  ret i32 %6, !dbg !1189
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1190 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1193, metadata !DIExpression()), !dbg !1194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1195, metadata !DIExpression()), !dbg !1196
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1197, metadata !DIExpression()), !dbg !1198
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1199, metadata !DIExpression()), !dbg !1200
  store i32 0, i32* %u32Temp1, align 4, !dbg !1200
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1201, metadata !DIExpression()), !dbg !1202
  store i32 0, i32* %u32Temp2, align 4, !dbg !1202
  %0 = load i32, i32* %value.addr, align 4, !dbg !1203
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1204
  %conv = zext i16 %1 to i32, !dbg !1204
  %mul = mul i32 %0, %conv, !dbg !1205
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1206
  %2 = load i32, i32* %value.addr, align 4, !dbg !1207
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1208
  %conv1 = zext i16 %3 to i32, !dbg !1208
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1209
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1210
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1211
  %5 = load i32, i32* %count.addr, align 4, !dbg !1212
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1213
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1213
  %shr = lshr i32 %4, %5, !dbg !1213, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1214
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1215
  %7 = load i32, i32* %count.addr, align 4, !dbg !1216
  %sub = sub i32 32, %7, !dbg !1217
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1218
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1218
  %shl = shl i32 %6, %sub, !dbg !1218, !klee.check.shift !258
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1219
  %or = or i32 %8, %shl, !dbg !1219
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1219
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1220
  %10 = load i32, i32* %count.addr, align 4, !dbg !1222
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1223
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1223
  %shr2 = lshr i32 %9, %10, !dbg !1223, !klee.check.shift !258
  %cmp = icmp eq i32 %shr2, 0, !dbg !1224
  br i1 %cmp, label %if.then, label %if.else, !dbg !1225

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1226
  store i32 %11, i32* %retval, align 4, !dbg !1228
  br label %return, !dbg !1228

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1229
  br label %return, !dbg !1229

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1231
  ret i32 %12, !dbg !1231
}

declare dso_local i32 @MulHighWord(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1232 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1235, metadata !DIExpression()), !dbg !1236
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1237, metadata !DIExpression()), !dbg !1238
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1239, metadata !DIExpression()), !dbg !1240
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1241, metadata !DIExpression()), !dbg !1242
  store i16 0, i16* %s16Temp1, align 2, !dbg !1242
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1243
  %conv = zext i8 %0 to i32, !dbg !1243
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1244
  %conv1 = zext i8 %1 to i32, !dbg !1244
  %sub = sub nsw i32 %conv, %conv1, !dbg !1245
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1246
  %conv2 = sext i8 %2 to i32, !dbg !1246
  %mul = mul nsw i32 %sub, %conv2, !dbg !1247
  %div = sdiv i32 %mul, 32, !dbg !1248
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1249
  %conv3 = zext i8 %3 to i32, !dbg !1249
  %add = add nsw i32 %div, %conv3, !dbg !1250
  %conv4 = trunc i32 %add to i16, !dbg !1251
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1252
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1253
  %conv5 = sext i16 %4 to i32, !dbg !1253
  %cmp = icmp slt i32 %conv5, 255, !dbg !1255
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1256

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1257
  %conv7 = sext i16 %5 to i32, !dbg !1257
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1260
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1261

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1262
  %conv11 = trunc i16 %6 to i8, !dbg !1264
  store i8 %conv11, i8* %retval, align 1, !dbg !1265
  br label %return, !dbg !1265

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1266
  br label %return, !dbg !1266

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1268
  br label %return, !dbg !1268

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1270
  ret i8 %7, !dbg !1270
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1271 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1274, metadata !DIExpression()), !dbg !1275
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1276, metadata !DIExpression()), !dbg !1277
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1278, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1280, metadata !DIExpression()), !dbg !1281
  store i32 0, i32* %s32Temp1, align 4, !dbg !1281
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1282
  %conv = zext i16 %0 to i32, !dbg !1282
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1283
  %conv1 = zext i16 %1 to i32, !dbg !1283
  %sub = sub nsw i32 %conv, %conv1, !dbg !1284
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1285
  %conv2 = sext i8 %2 to i32, !dbg !1285
  %mul = mul nsw i32 %sub, %conv2, !dbg !1286
  %div = sdiv i32 %mul, 32, !dbg !1287
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1288
  %conv3 = zext i16 %3 to i32, !dbg !1288
  %add = add nsw i32 %div, %conv3, !dbg !1289
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1290
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1291
  %cmp = icmp slt i32 %4, 65535, !dbg !1293
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1294

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1295
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1298
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1299

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1300
  %conv8 = trunc i32 %6 to i16, !dbg !1302
  store i16 %conv8, i16* %retval, align 2, !dbg !1303
  br label %return, !dbg !1303

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1304
  br label %return, !dbg !1304

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1306
  br label %return, !dbg !1306

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1308
  ret i16 %7, !dbg !1308
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1309 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1310, metadata !DIExpression()), !dbg !1311
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1312, metadata !DIExpression()), !dbg !1313
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1314, metadata !DIExpression()), !dbg !1315
  store i32 0, i32* %u32Temp1, align 4, !dbg !1315
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1316
  %conv = zext i16 %0 to i32, !dbg !1316
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1317
  %conv1 = zext i16 %1 to i32, !dbg !1317
  %mul = mul nsw i32 %conv, %conv1, !dbg !1318
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1319
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1320
  %cmp = icmp ule i32 %2, 65535, !dbg !1322
  br i1 %cmp, label %if.then, label %if.else, !dbg !1323

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1324
  %and = and i32 %3, 65535, !dbg !1326
  %conv3 = trunc i32 %and to i16, !dbg !1327
  store i16 %conv3, i16* %retval, align 2, !dbg !1328
  br label %return, !dbg !1328

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1329
  br label %return, !dbg !1329

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1331
  ret i16 %4, !dbg !1331
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1332 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1335, metadata !DIExpression()), !dbg !1336
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1337, metadata !DIExpression()), !dbg !1338
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1339, metadata !DIExpression()), !dbg !1340
  store i32 0, i32* %u32Temp1, align 4, !dbg !1340
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1341
  %conv = zext i16 %0 to i32, !dbg !1341
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1342
  %conv1 = zext i16 %1 to i32, !dbg !1342
  %mul = mul nsw i32 %conv, %conv1, !dbg !1343
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1344
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1345
  ret i32 %2, !dbg !1346
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1347 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1350, metadata !DIExpression()), !dbg !1351
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1352, metadata !DIExpression()), !dbg !1353
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1354, metadata !DIExpression()), !dbg !1355
  store i32 0, i32* %s32Temp1, align 4, !dbg !1355
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1356
  %conv = sext i16 %0 to i32, !dbg !1356
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1357
  %conv1 = sext i16 %1 to i32, !dbg !1357
  %mul = mul nsw i32 %conv, %conv1, !dbg !1358
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1359
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1360
  ret i32 %2, !dbg !1361
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1362 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1365, metadata !DIExpression()), !dbg !1366
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1367, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1369, metadata !DIExpression()), !dbg !1370
  store i32 0, i32* %s32Temp1, align 4, !dbg !1370
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1371
  %cmp = icmp sgt i32 %0, 0, !dbg !1373
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1374

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1375
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1377
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1377
  %div = udiv i32 -1, %1, !dbg !1377, !klee.check.div !258
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1378
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1379
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1381
  %cmp1 = icmp ult i32 %2, %3, !dbg !1382
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1383

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1384
  br label %return, !dbg !1384

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1386
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1388
  %mul = mul i32 %4, %5, !dbg !1389
  store i32 %mul, i32* %retval, align 4, !dbg !1390
  br label %return, !dbg !1390

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1391
  br label %return, !dbg !1391

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1393
  ret i32 %6, !dbg !1393
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1394 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1397, metadata !DIExpression()), !dbg !1398
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1399, metadata !DIExpression()), !dbg !1400
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1401, metadata !DIExpression()), !dbg !1402
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1403, metadata !DIExpression()), !dbg !1404
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1405, metadata !DIExpression()), !dbg !1406
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1407, metadata !DIExpression()), !dbg !1408
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1409
  %cmp = icmp slt i32 %0, 0, !dbg !1411
  br i1 %cmp, label %if.then, label %if.else, !dbg !1412

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1413
  %sub = sub nsw i32 0, %1, !dbg !1414
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1415
  br label %if.end, !dbg !1416

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1417
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1418
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1419
  %cmp1 = icmp slt i32 %3, 0, !dbg !1421
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1422

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1423
  %sub3 = sub nsw i32 0, %4, !dbg !1424
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1425
  br label %if.end5, !dbg !1426

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1427
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1428
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1429
  %cmp6 = icmp slt i32 %6, 0, !dbg !1431
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1432
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1432

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1433
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1434
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1435
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1435

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1436
  br label %if.end13, !dbg !1437

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1438
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1439
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1440
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1441
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1442
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1443
  %conv = zext i8 %12 to i32, !dbg !1443
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1445
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1446

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1447
  br label %return, !dbg !1447

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1449
  store i32 %13, i32* %retval, align 4, !dbg !1451
  br label %return, !dbg !1451

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1452
  ret i32 %14, !dbg !1452
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1453 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1456, metadata !DIExpression()), !dbg !1457
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1458, metadata !DIExpression()), !dbg !1459
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1460, metadata !DIExpression()), !dbg !1461
  store i32 0, i32* %u32Temp1, align 4, !dbg !1461
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1462
  %cmp = icmp ne i32 %0, 0, !dbg !1464
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1465

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1466
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1468
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1468
  %div = udiv i32 -1, %1, !dbg !1468, !klee.check.div !258
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1469
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1470
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1472
  %cmp1 = icmp ult i32 %2, %3, !dbg !1473
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1474

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1475
  br label %return, !dbg !1475

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1477
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1479
  %mul = mul i32 %4, %5, !dbg !1480
  store i32 %mul, i32* %retval, align 4, !dbg !1481
  br label %return, !dbg !1481

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1482
  br label %return, !dbg !1482

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1484
  ret i32 %6, !dbg !1484
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1485 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1486, metadata !DIExpression()), !dbg !1487
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1488, metadata !DIExpression()), !dbg !1489
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1490, metadata !DIExpression()), !dbg !1491
  store i32 0, i32* %u32Temp1, align 4, !dbg !1491
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1492, metadata !DIExpression()), !dbg !1493
  store i32 0, i32* %u32Temp2, align 4, !dbg !1493
  %0 = load i32, i32* %value.addr, align 4, !dbg !1494
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1495
  %conv = zext i16 %1 to i32, !dbg !1495
  %mul = mul i32 %0, %conv, !dbg !1496
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1497
  %2 = load i32, i32* %value.addr, align 4, !dbg !1498
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1499
  %conv1 = zext i16 %3 to i32, !dbg !1499
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1500
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1501
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1502
  %shr = lshr i32 %4, 16, !dbg !1503
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1504
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1505
  %shl = shl i32 %5, 16, !dbg !1506
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1507
  %or = or i32 %6, %shl, !dbg !1507
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1507
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1508
  ret i32 %7, !dbg !1509
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1510 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1513, metadata !DIExpression()), !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %u32Temp1, align 4, !dbg !1516
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1517, metadata !DIExpression()), !dbg !1518
  store i32 0, i32* %u32Temp2, align 4, !dbg !1518
  %0 = load i32, i32* %value.addr, align 4, !dbg !1519
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1520
  %conv = zext i16 %1 to i32, !dbg !1520
  %mul = mul i32 %0, %conv, !dbg !1521
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1522
  %2 = load i32, i32* %value.addr, align 4, !dbg !1523
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1524
  %conv1 = zext i16 %3 to i32, !dbg !1524
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1525
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1526
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1527
  %shr = lshr i32 %4, 15, !dbg !1528
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1529
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1530
  %shl = shl i32 %5, 17, !dbg !1531
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1532
  %or = or i32 %6, %shl, !dbg !1532
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1532
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1533
  %shr2 = lshr i32 %7, 15, !dbg !1535
  %cmp = icmp eq i32 %shr2, 0, !dbg !1536
  br i1 %cmp, label %if.then, label %if.else, !dbg !1537

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1538
  store i32 %8, i32* %retval, align 4, !dbg !1540
  br label %return, !dbg !1540

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1541
  br label %return, !dbg !1541

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1543
  ret i32 %9, !dbg !1543
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1544 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1547, metadata !DIExpression()), !dbg !1548
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1549, metadata !DIExpression()), !dbg !1550
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1551, metadata !DIExpression()), !dbg !1552
  store i32 0, i32* %u32Temp1, align 4, !dbg !1552
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1553, metadata !DIExpression()), !dbg !1554
  store i32 0, i32* %u32Temp2, align 4, !dbg !1554
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1555
  %conv = sext i16 %0 to i32, !dbg !1555
  %cmp = icmp sgt i32 %conv, 0, !dbg !1557
  br i1 %cmp, label %if.then, label %if.else, !dbg !1558

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1559
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1561
  %conv2 = sext i16 %2 to i32, !dbg !1561
  %mul = mul i32 %1, %conv2, !dbg !1562
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1563
  %3 = load i32, i32* %value.addr, align 4, !dbg !1564
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1565
  %conv3 = sext i16 %4 to i32, !dbg !1565
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1566
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1567
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1568
  %shr = lshr i32 %5, 15, !dbg !1569
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1570
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1571
  %shl = shl i32 %6, 17, !dbg !1572
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1573
  %or = or i32 %7, %shl, !dbg !1573
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1573
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1574
  store i32 %8, i32* %retval, align 4, !dbg !1575
  br label %return, !dbg !1575

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1576
  br label %return, !dbg !1576

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1578
  ret i32 %9, !dbg !1578
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1579 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1580, metadata !DIExpression()), !dbg !1581
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1582, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1584, metadata !DIExpression()), !dbg !1585
  store i32 0, i32* %u32Temp1, align 4, !dbg !1585
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1586, metadata !DIExpression()), !dbg !1587
  store i32 0, i32* %u32Temp2, align 4, !dbg !1587
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1588
  %conv = sext i16 %0 to i32, !dbg !1588
  %cmp = icmp sle i32 %conv, 0, !dbg !1590
  br i1 %cmp, label %if.then, label %if.else, !dbg !1591

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1592
  br label %return, !dbg !1592

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1594
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1596
  %conv2 = sext i16 %2 to i32, !dbg !1596
  %mul = mul i32 %1, %conv2, !dbg !1597
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1598
  %3 = load i32, i32* %value.addr, align 4, !dbg !1599
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1600
  %conv3 = sext i16 %4 to i32, !dbg !1600
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1601
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1602
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1603
  %shr = lshr i32 %5, 14, !dbg !1604
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1605
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1606
  %shl = shl i32 %6, 18, !dbg !1607
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1608
  %or = or i32 %7, %shl, !dbg !1608
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1608
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1609
  %shr4 = lshr i32 %8, 14, !dbg !1611
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1612
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1613

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1614
  store i32 %9, i32* %retval, align 4, !dbg !1616
  br label %return, !dbg !1616

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1617
  br label %return, !dbg !1617

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1619
  ret i32 %10, !dbg !1619
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1620 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1621, metadata !DIExpression()), !dbg !1622
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1623, metadata !DIExpression()), !dbg !1624
  %0 = load i32, i32* %value.addr, align 4, !dbg !1625
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1626
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1627
  ret i32 %call, !dbg !1628
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1629 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1630, metadata !DIExpression()), !dbg !1631
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1632, metadata !DIExpression()), !dbg !1633
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1634, metadata !DIExpression()), !dbg !1635
  store i32 0, i32* %u32Temp1, align 4, !dbg !1635
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1636, metadata !DIExpression()), !dbg !1637
  store i32 0, i32* %u32Temp2, align 4, !dbg !1637
  %0 = load i32, i32* %value.addr, align 4, !dbg !1638
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1639
  %mul = mul i32 %0, %1, !dbg !1640
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1641
  %2 = load i32, i32* %value.addr, align 4, !dbg !1642
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1643
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1644
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1645
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1646
  %shr = lshr i32 %4, 31, !dbg !1647
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1648
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1649
  %shl = shl i32 %5, 1, !dbg !1650
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1651
  %or = or i32 %6, %shl, !dbg !1651
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1651
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1652
  %shr1 = lshr i32 %7, 31, !dbg !1654
  %cmp = icmp eq i32 %shr1, 0, !dbg !1655
  br i1 %cmp, label %if.then, label %if.else, !dbg !1656

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1657
  store i32 %8, i32* %retval, align 4, !dbg !1659
  br label %return, !dbg !1659

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1660
  br label %return, !dbg !1660

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1662
  ret i32 %9, !dbg !1662
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1663 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1664, metadata !DIExpression()), !dbg !1665
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1666, metadata !DIExpression()), !dbg !1667
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1668, metadata !DIExpression()), !dbg !1669
  store i32 0, i32* %u32Temp1, align 4, !dbg !1669
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1670, metadata !DIExpression()), !dbg !1671
  store i32 0, i32* %u32Temp2, align 4, !dbg !1671
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1672
  %cmp = icmp sgt i32 %0, 0, !dbg !1674
  br i1 %cmp, label %if.then, label %if.else, !dbg !1675

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1676
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1678
  %mul = mul i32 %1, %2, !dbg !1679
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1680
  %3 = load i32, i32* %value.addr, align 4, !dbg !1681
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1682
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1683
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1684
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1685
  %shr = lshr i32 %5, 31, !dbg !1686
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1687
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1688
  %shl = shl i32 %6, 1, !dbg !1689
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1690
  %or = or i32 %7, %shl, !dbg !1690
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1690
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1691
  store i32 %8, i32* %retval, align 4, !dbg !1692
  br label %return, !dbg !1692

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1693
  br label %return, !dbg !1693

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1695
  ret i32 %9, !dbg !1695
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1696 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1697, metadata !DIExpression()), !dbg !1698
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1699, metadata !DIExpression()), !dbg !1700
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1701, metadata !DIExpression()), !dbg !1702
  store i32 0, i32* %u32Temp1, align 4, !dbg !1702
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1703, metadata !DIExpression()), !dbg !1704
  store i32 0, i32* %u32Temp2, align 4, !dbg !1704
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1705
  %cmp = icmp sle i32 %0, 0, !dbg !1707
  br i1 %cmp, label %if.then, label %if.else, !dbg !1708

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1709
  br label %return, !dbg !1709

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1711
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1713
  %mul = mul i32 %1, %2, !dbg !1714
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1715
  %3 = load i32, i32* %value.addr, align 4, !dbg !1716
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1717
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1718
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1719
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1720
  %shr = lshr i32 %5, 30, !dbg !1721
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1722
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1723
  %shl = shl i32 %6, 2, !dbg !1724
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1725
  %or = or i32 %7, %shl, !dbg !1725
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1725
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1726
  %shr1 = lshr i32 %8, 30, !dbg !1728
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1729
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1730

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1731
  store i32 %9, i32* %retval, align 4, !dbg !1733
  br label %return, !dbg !1733

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1734
  br label %return, !dbg !1734

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1736
  ret i32 %10, !dbg !1736
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1737 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1740, metadata !DIExpression()), !dbg !1741
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1742, metadata !DIExpression()), !dbg !1743
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1744, metadata !DIExpression()), !dbg !1745
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1745
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1746
  %cmp = icmp slt i32 %0, 0, !dbg !1748
  br i1 %cmp, label %if.then, label %if.end, !dbg !1749

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1750
  %sub = sub nsw i32 0, %1, !dbg !1752
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1753
  br label %if.end, !dbg !1754

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1755
  %cmp1 = icmp ne i32 %2, 0, !dbg !1757
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1758

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1759
  %cmp3 = icmp sle i32 %3, 0, !dbg !1762
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1763

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1764
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1767
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1767
  %div = udiv i32 -2147483648, %4, !dbg !1767, !klee.check.div !258
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1768
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1769
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1770

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1771
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1773
  %mul = mul i32 %6, %7, !dbg !1774
  store i32 %mul, i32* %retval, align 4, !dbg !1775
  br label %return, !dbg !1775

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1776
  br label %return, !dbg !1776

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1778
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1781
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1781
  %div8 = sdiv i32 2147483647, %8, !dbg !1781, !klee.check.div !258
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1782
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1783
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1784

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1785
  br label %return, !dbg !1785

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1787
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1789
  %mul12 = mul i32 %10, %11, !dbg !1790
  store i32 %mul12, i32* %retval, align 4, !dbg !1791
  br label %return, !dbg !1791

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1792
  br label %return, !dbg !1792

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1794
  ret i32 %12, !dbg !1794
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1795 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1796, metadata !DIExpression()), !dbg !1797
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1798, metadata !DIExpression()), !dbg !1799
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1800, metadata !DIExpression()), !dbg !1801
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1802, metadata !DIExpression()), !dbg !1803
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1804, metadata !DIExpression()), !dbg !1805
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1806, metadata !DIExpression()), !dbg !1807
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1808
  %cmp = icmp slt i32 %0, 0, !dbg !1810
  br i1 %cmp, label %if.then, label %if.else, !dbg !1811

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1812
  %sub = sub nsw i32 0, %1, !dbg !1814
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1815
  store i8 1, i8* %u8SignBit, align 1, !dbg !1816
  br label %if.end, !dbg !1817

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1818
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1820
  store i8 0, i8* %u8SignBit, align 1, !dbg !1821
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1822
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1823
  %conv = zext i16 %4 to i32, !dbg !1823
  %mul = mul i32 %3, %conv, !dbg !1824
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1825
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1826
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1827
  %conv1 = zext i16 %6 to i32, !dbg !1827
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1828
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1829
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1830
  %shr = lshr i32 %7, 16, !dbg !1831
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1832
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1833
  %shl = shl i32 %8, 16, !dbg !1834
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1835
  %or = or i32 %9, %shl, !dbg !1835
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1835
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1836
  %conv2 = zext i8 %10 to i32, !dbg !1836
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1838
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1839

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1840
  store i32 %11, i32* %retval, align 4, !dbg !1842
  br label %return, !dbg !1842

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1843
  %sub7 = sub i32 0, %12, !dbg !1845
  store i32 %sub7, i32* %retval, align 4, !dbg !1846
  br label %return, !dbg !1846

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1847
  ret i32 %13, !dbg !1847
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1848 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1849, metadata !DIExpression()), !dbg !1850
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1851, metadata !DIExpression()), !dbg !1852
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1853, metadata !DIExpression()), !dbg !1854
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1855, metadata !DIExpression()), !dbg !1856
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1857, metadata !DIExpression()), !dbg !1858
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1859, metadata !DIExpression()), !dbg !1860
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1861
  %cmp = icmp slt i32 %0, 0, !dbg !1863
  br i1 %cmp, label %if.then, label %if.else, !dbg !1864

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1865
  %sub = sub nsw i32 0, %1, !dbg !1867
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1868
  store i8 1, i8* %u8SignBit, align 1, !dbg !1869
  br label %if.end, !dbg !1870

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1871
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1873
  store i8 0, i8* %u8SignBit, align 1, !dbg !1874
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1875
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1876
  %conv = zext i16 %4 to i32, !dbg !1876
  %mul = mul i32 %3, %conv, !dbg !1877
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1878
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1879
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1880
  %conv1 = zext i16 %6 to i32, !dbg !1880
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1881
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1882
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1883
  %shr = lshr i32 %7, 15, !dbg !1884
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1885
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1886
  %shl = shl i32 %8, 17, !dbg !1887
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1888
  %or = or i32 %9, %shl, !dbg !1888
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1888
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1889
  %conv2 = zext i8 %10 to i32, !dbg !1889
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1891
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1892

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1893
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1896
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1897

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1898
  store i32 %12, i32* %retval, align 4, !dbg !1899
  br label %return, !dbg !1899

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1900
  br label %return, !dbg !1900

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1901
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1904
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1905

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1906
  %sub14 = sub i32 0, %14, !dbg !1907
  store i32 %sub14, i32* %retval, align 4, !dbg !1908
  br label %return, !dbg !1908

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1909
  br label %return, !dbg !1909

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1910
  ret i32 %15, !dbg !1910
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1911 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1914, metadata !DIExpression()), !dbg !1915
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1916, metadata !DIExpression()), !dbg !1917
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1918, metadata !DIExpression()), !dbg !1919
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1920, metadata !DIExpression()), !dbg !1921
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1922, metadata !DIExpression()), !dbg !1923
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1924, metadata !DIExpression()), !dbg !1925
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1926, metadata !DIExpression()), !dbg !1927
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1928
  %cmp = icmp slt i32 %0, 0, !dbg !1930
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1931

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1932
  %conv = sext i16 %1 to i32, !dbg !1932
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1933
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1934

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1935
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1936
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1937

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1938
  %conv6 = sext i16 %3 to i32, !dbg !1938
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1939
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1940

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1941
  br label %if.end, !dbg !1943

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1944
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1946
  %cmp9 = icmp slt i32 %4, 0, !dbg !1948
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1949

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1950
  %sub = sub nsw i32 0, %5, !dbg !1952
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1953
  br label %if.end13, !dbg !1954

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1955
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1957
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1958
  %conv14 = sext i16 %7 to i32, !dbg !1958
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1960
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1961

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1962
  %conv18 = sext i16 %8 to i32, !dbg !1962
  %sub19 = sub nsw i32 0, %conv18, !dbg !1964
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1965
  br label %if.end22, !dbg !1966

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1967
  %conv21 = sext i16 %9 to i32, !dbg !1967
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1969
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1970
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1971
  %mul = mul i32 %10, %11, !dbg !1972
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1973
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1974
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1975
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1976
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1977
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1978
  %shr = lshr i32 %14, 15, !dbg !1979
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1980
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1981
  %shl = shl i32 %15, 17, !dbg !1982
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1983
  %or = or i32 %16, %shl, !dbg !1983
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1983
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1984
  %conv23 = zext i8 %17 to i32, !dbg !1984
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1986
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1987

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1988
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1991
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1992

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1993
  store i32 %19, i32* %retval, align 4, !dbg !1994
  br label %return, !dbg !1994

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1995
  br label %return, !dbg !1995

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1996
  %sub32 = sub i32 0, %20, !dbg !1998
  store i32 %sub32, i32* %retval, align 4, !dbg !1999
  br label %return, !dbg !1999

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2000
  ret i32 %21, !dbg !2000
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !2001 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2002, metadata !DIExpression()), !dbg !2003
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !2004, metadata !DIExpression()), !dbg !2005
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2006, metadata !DIExpression()), !dbg !2007
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2008, metadata !DIExpression()), !dbg !2009
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2010, metadata !DIExpression()), !dbg !2011
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2012, metadata !DIExpression()), !dbg !2013
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2014, metadata !DIExpression()), !dbg !2015
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2016
  %cmp = icmp slt i32 %0, 0, !dbg !2018
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2019

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !2020
  %conv = sext i16 %1 to i32, !dbg !2020
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2021
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2022

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2023
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2024
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2025

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !2026
  %conv6 = sext i16 %3 to i32, !dbg !2026
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2027
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2028

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2029
  br label %if.end, !dbg !2031

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2032
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2034
  %cmp9 = icmp slt i32 %4, 0, !dbg !2036
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2037

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2038
  %sub = sub nsw i32 0, %5, !dbg !2040
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2041
  br label %if.end13, !dbg !2042

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2043
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2045
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2046
  %conv14 = sext i16 %7 to i32, !dbg !2046
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2048
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2049

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2050
  %conv18 = sext i16 %8 to i32, !dbg !2050
  %sub19 = sub nsw i32 0, %conv18, !dbg !2052
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2053
  br label %if.end22, !dbg !2054

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2055
  %conv21 = sext i16 %9 to i32, !dbg !2055
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2057
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2058
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2059
  %mul = mul i32 %10, %11, !dbg !2060
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2061
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2062
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2063
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2064
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2065
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2066
  %shr = lshr i32 %14, 14, !dbg !2067
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2068
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2069
  %shl = shl i32 %15, 18, !dbg !2070
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2071
  %or = or i32 %16, %shl, !dbg !2071
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2071
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2072
  %shr23 = lshr i32 %17, 14, !dbg !2074
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2075
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2076

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2077
  %conv27 = zext i8 %18 to i32, !dbg !2077
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2080
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2081

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2082
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2085
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2086

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2087
  store i32 %20, i32* %retval, align 4, !dbg !2088
  br label %return, !dbg !2088

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2089
  br label %return, !dbg !2089

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2090
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2093
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2094

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2095
  %sub39 = sub i32 0, %22, !dbg !2096
  store i32 %sub39, i32* %retval, align 4, !dbg !2097
  br label %return, !dbg !2097

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2098
  br label %return, !dbg !2098

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2099
  br label %return, !dbg !2099

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2101
  ret i32 %23, !dbg !2101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2102 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2105, metadata !DIExpression()), !dbg !2106
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2107, metadata !DIExpression()), !dbg !2108
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2109, metadata !DIExpression()), !dbg !2110
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2111, metadata !DIExpression()), !dbg !2112
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2113, metadata !DIExpression()), !dbg !2114
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2115
  %cmp = icmp slt i32 %0, 0, !dbg !2117
  br i1 %cmp, label %if.then, label %if.else, !dbg !2118

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2119
  %sub = sub nsw i32 0, %1, !dbg !2121
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2122
  store i8 1, i8* %u8SignBit, align 1, !dbg !2123
  br label %if.end, !dbg !2124

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2125
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2127
  store i8 0, i8* %u8SignBit, align 1, !dbg !2128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2129
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2130
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2131
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2132
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2133
  %conv = zext i8 %5 to i32, !dbg !2133
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2135
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2136

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2137
  store i32 %6, i32* %retval, align 4, !dbg !2138
  br label %return, !dbg !2138

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2139
  %sub5 = sub i32 0, %7, !dbg !2140
  store i32 %sub5, i32* %retval, align 4, !dbg !2141
  br label %return, !dbg !2141

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2142
  ret i32 %8, !dbg !2142
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2143 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2144, metadata !DIExpression()), !dbg !2145
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2146, metadata !DIExpression()), !dbg !2147
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2148, metadata !DIExpression()), !dbg !2149
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2150, metadata !DIExpression()), !dbg !2151
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2152, metadata !DIExpression()), !dbg !2153
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2154, metadata !DIExpression()), !dbg !2155
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2156
  %cmp = icmp slt i32 %0, 0, !dbg !2158
  br i1 %cmp, label %if.then, label %if.else, !dbg !2159

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2160
  %sub = sub nsw i32 0, %1, !dbg !2162
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2163
  store i8 1, i8* %u8SignBit, align 1, !dbg !2164
  br label %if.end, !dbg !2165

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2166
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2168
  store i8 0, i8* %u8SignBit, align 1, !dbg !2169
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2170
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2171
  %mul = mul i32 %3, %4, !dbg !2172
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2173
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2174
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2175
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2176
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2177
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2178
  %shr = lshr i32 %7, 31, !dbg !2179
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2180
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2181
  %shl = shl i32 %8, 1, !dbg !2182
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2183
  %or = or i32 %9, %shl, !dbg !2183
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2183
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2184
  %conv = zext i8 %10 to i32, !dbg !2184
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2186
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2187

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2188
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2191
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2192

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2193
  store i32 %12, i32* %retval, align 4, !dbg !2194
  br label %return, !dbg !2194

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2195
  br label %return, !dbg !2195

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2196
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2199
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2200

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2201
  %sub12 = sub i32 0, %14, !dbg !2202
  store i32 %sub12, i32* %retval, align 4, !dbg !2203
  br label %return, !dbg !2203

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2204
  br label %return, !dbg !2204

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2205
  ret i32 %15, !dbg !2205
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2206 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2209, metadata !DIExpression()), !dbg !2210
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2211, metadata !DIExpression()), !dbg !2212
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2213, metadata !DIExpression()), !dbg !2214
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2215, metadata !DIExpression()), !dbg !2216
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2217, metadata !DIExpression()), !dbg !2218
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2219, metadata !DIExpression()), !dbg !2220
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2221, metadata !DIExpression()), !dbg !2222
  %0 = load i32, i32* %value.addr, align 4, !dbg !2223
  %cmp = icmp slt i32 %0, 0, !dbg !2225
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2226
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2226

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2227
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2228
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2229
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2229

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2230
  br label %if.end, !dbg !2232

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2233
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2235
  %cmp5 = icmp slt i32 %4, 0, !dbg !2237
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2238

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2239
  %sub = sub nsw i32 0, %5, !dbg !2241
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2242
  br label %if.end8, !dbg !2243

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2244
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2246
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2247
  %cmp9 = icmp slt i32 %7, 0, !dbg !2249
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2250

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2251
  %sub11 = sub nsw i32 0, %8, !dbg !2253
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2254
  br label %if.end13, !dbg !2255

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2256
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2258
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2259
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2260
  %mul = mul i32 %10, %11, !dbg !2261
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2262
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2263
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2264
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2265
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2266
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2267
  %shr = lshr i32 %14, 31, !dbg !2268
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2269
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2270
  %shl = shl i32 %15, 1, !dbg !2271
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2272
  %or = or i32 %16, %shl, !dbg !2272
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2272
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2273
  %conv = zext i8 %17 to i32, !dbg !2273
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2275
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2276

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2277
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2280
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2281

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2282
  store i32 %19, i32* %retval, align 4, !dbg !2283
  br label %return, !dbg !2283

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2284
  br label %return, !dbg !2284

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2285
  %sub22 = sub i32 0, %20, !dbg !2287
  store i32 %sub22, i32* %retval, align 4, !dbg !2288
  br label %return, !dbg !2288

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2289
  ret i32 %21, !dbg !2289
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2290 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2291, metadata !DIExpression()), !dbg !2292
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2293, metadata !DIExpression()), !dbg !2294
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2295, metadata !DIExpression()), !dbg !2296
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2297, metadata !DIExpression()), !dbg !2298
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2299, metadata !DIExpression()), !dbg !2300
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2301, metadata !DIExpression()), !dbg !2302
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2303, metadata !DIExpression()), !dbg !2304
  %0 = load i32, i32* %value.addr, align 4, !dbg !2305
  %cmp = icmp slt i32 %0, 0, !dbg !2307
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2308
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2308

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2309
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2310
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2311
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2311

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2312
  br label %if.end, !dbg !2314

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2315
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2317
  %cmp5 = icmp slt i32 %4, 0, !dbg !2319
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2320

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2321
  %sub = sub nsw i32 0, %5, !dbg !2323
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2324
  br label %if.end8, !dbg !2325

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2326
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2328
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2329
  %cmp9 = icmp slt i32 %7, 0, !dbg !2331
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2332

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2333
  %sub11 = sub nsw i32 0, %8, !dbg !2335
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2336
  br label %if.end13, !dbg !2337

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2338
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2340
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2341
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2342
  %mul = mul i32 %10, %11, !dbg !2343
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2344
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2345
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2346
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2347
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2348
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2349
  %shr = lshr i32 %14, 30, !dbg !2350
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2351
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2352
  %shl = shl i32 %15, 2, !dbg !2353
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2354
  %or = or i32 %16, %shl, !dbg !2354
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2354
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2355
  %shr14 = lshr i32 %17, 30, !dbg !2357
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2358
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2359

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2360
  %conv = zext i8 %18 to i32, !dbg !2360
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2363
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2364

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2365
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2368
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2369

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2370
  store i32 %20, i32* %retval, align 4, !dbg !2371
  br label %return, !dbg !2371

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2372
  br label %return, !dbg !2372

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2373
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2376
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2377

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2378
  %sub28 = sub i32 0, %22, !dbg !2379
  store i32 %sub28, i32* %retval, align 4, !dbg !2380
  br label %return, !dbg !2380

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2381
  br label %return, !dbg !2381

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2382
  br label %return, !dbg !2382

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2384
  ret i32 %23, !dbg !2384
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2385 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2388, metadata !DIExpression()), !dbg !2389
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2390, metadata !DIExpression()), !dbg !2391
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2392, metadata !DIExpression()), !dbg !2393
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2394, metadata !DIExpression()), !dbg !2395
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2396, metadata !DIExpression()), !dbg !2397
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2398, metadata !DIExpression()), !dbg !2399
  %0 = load i32, i32* %value.addr, align 4, !dbg !2400
  %cmp = icmp slt i32 %0, 0, !dbg !2402
  br i1 %cmp, label %if.then, label %if.else, !dbg !2403

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2404
  %sub = sub nsw i32 0, %1, !dbg !2406
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2407
  store i8 1, i8* %u8SignBit, align 1, !dbg !2408
  br label %if.end, !dbg !2409

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2410
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2412
  store i8 0, i8* %u8SignBit, align 1, !dbg !2413
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2414
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2415
  %conv = zext i8 %4 to i32, !dbg !2415
  %mul = mul i32 %3, %conv, !dbg !2416
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2417
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2418
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2419
  %conv1 = zext i8 %6 to i32, !dbg !2419
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2420
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2421
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2422
  %shr = lshr i32 %7, 8, !dbg !2423
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2424
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2425
  %shl = shl i32 %8, 24, !dbg !2426
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2427
  %or = or i32 %9, %shl, !dbg !2427
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2427
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2428
  %conv2 = zext i8 %10 to i32, !dbg !2428
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2430
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2431

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2432
  store i32 %11, i32* %retval, align 4, !dbg !2434
  br label %return, !dbg !2434

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2435
  %sub7 = sub i32 0, %12, !dbg !2437
  store i32 %sub7, i32* %retval, align 4, !dbg !2438
  br label %return, !dbg !2438

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2439
  ret i32 %13, !dbg !2439
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2440 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2441, metadata !DIExpression()), !dbg !2442
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2443, metadata !DIExpression()), !dbg !2444
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2445, metadata !DIExpression()), !dbg !2446
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2447, metadata !DIExpression()), !dbg !2448
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2449, metadata !DIExpression()), !dbg !2450
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2451, metadata !DIExpression()), !dbg !2452
  %0 = load i32, i32* %value.addr, align 4, !dbg !2453
  %cmp = icmp slt i32 %0, 0, !dbg !2455
  br i1 %cmp, label %if.then, label %if.else, !dbg !2456

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2457
  %sub = sub nsw i32 0, %1, !dbg !2459
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2460
  store i8 1, i8* %u8SignBit, align 1, !dbg !2461
  br label %if.end, !dbg !2462

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2463
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2465
  store i8 0, i8* %u8SignBit, align 1, !dbg !2466
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2467
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2468
  %conv = zext i8 %4 to i32, !dbg !2468
  %mul = mul i32 %3, %conv, !dbg !2469
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2470
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2471
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2472
  %conv1 = zext i8 %6 to i32, !dbg !2472
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2473
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2474
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2475
  %shr = lshr i32 %7, 7, !dbg !2476
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2477
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2478
  %shl = shl i32 %8, 25, !dbg !2479
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2480
  %or = or i32 %9, %shl, !dbg !2480
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2480
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2481
  %conv2 = zext i8 %10 to i32, !dbg !2481
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2483
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2484

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2485
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2488
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2489

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2490
  store i32 %12, i32* %retval, align 4, !dbg !2491
  br label %return, !dbg !2491

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2492
  br label %return, !dbg !2492

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2493
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2496
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2497

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2498
  %sub14 = sub i32 0, %14, !dbg !2499
  store i32 %sub14, i32* %retval, align 4, !dbg !2500
  br label %return, !dbg !2500

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2501
  br label %return, !dbg !2501

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2502
  ret i32 %15, !dbg !2502
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2503 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2506, metadata !DIExpression()), !dbg !2507
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2508, metadata !DIExpression()), !dbg !2509
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2510, metadata !DIExpression()), !dbg !2511
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2512, metadata !DIExpression()), !dbg !2513
  store i32 0, i32* %u32Temp1, align 4, !dbg !2513
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2514, metadata !DIExpression()), !dbg !2515
  store i32 0, i32* %u32Temp2, align 4, !dbg !2515
  %0 = load i8, i8* %power.addr, align 1, !dbg !2516
  %conv = zext i8 %0 to i32, !dbg !2516
  %cmp = icmp sge i32 %conv, 32, !dbg !2518
  br i1 %cmp, label %if.then, label %if.else, !dbg !2519

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2520
  br label %if.end7, !dbg !2522

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2523
  %conv2 = zext i8 %1 to i32, !dbg !2523
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2525
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2526

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2527
  br label %if.end7, !dbg !2529

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2530
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2531
  %mul = mul i32 %2, %3, !dbg !2532
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2533
  %4 = load i32, i32* %value.addr, align 4, !dbg !2534
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2535
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2536
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2537
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2538
  %7 = load i8, i8* %power.addr, align 1, !dbg !2539
  %conv8 = zext i8 %7 to i32, !dbg !2539
  %sub = sub nsw i32 32, %conv8, !dbg !2540
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2541
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2541
  %shr = lshr i32 %6, %sub, !dbg !2541, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2542
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2543
  %9 = load i8, i8* %power.addr, align 1, !dbg !2544
  %conv9 = zext i8 %9 to i32, !dbg !2544
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2545
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2545
  %shl = shl i32 %8, %conv9, !dbg !2545, !klee.check.shift !258
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2546
  %or = or i32 %10, %shl, !dbg !2546
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2546
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2547
  %12 = load i8, i8* %power.addr, align 1, !dbg !2549
  %conv10 = zext i8 %12 to i32, !dbg !2549
  %sub11 = sub nsw i32 32, %conv10, !dbg !2550
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2551
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2551
  %shr12 = lshr i32 %11, %sub11, !dbg !2551, !klee.check.shift !258
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2552
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2553

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2554
  store i32 %13, i32* %retval, align 4, !dbg !2556
  br label %return, !dbg !2556

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2557
  br label %return, !dbg !2557

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2559
  ret i32 %14, !dbg !2559
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2560 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2563, metadata !DIExpression()), !dbg !2564
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2565, metadata !DIExpression()), !dbg !2566
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2567, metadata !DIExpression()), !dbg !2568
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2569, metadata !DIExpression()), !dbg !2570
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2571, metadata !DIExpression()), !dbg !2572
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2573, metadata !DIExpression()), !dbg !2574
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2575, metadata !DIExpression()), !dbg !2576
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2577, metadata !DIExpression()), !dbg !2578
  %0 = load i8, i8* %power.addr, align 1, !dbg !2579
  %conv = zext i8 %0 to i32, !dbg !2579
  %cmp = icmp sge i32 %conv, 32, !dbg !2581
  br i1 %cmp, label %if.then, label %if.else, !dbg !2582

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2583
  br label %if.end7, !dbg !2585

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2586
  %conv2 = zext i8 %1 to i32, !dbg !2586
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2588
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2589

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2590
  br label %if.end7, !dbg !2592

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2593
  %cmp8 = icmp slt i32 %2, 0, !dbg !2595
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2596
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2596

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2597
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2598
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2599
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2599

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2600
  br label %if.end19, !dbg !2602

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2603
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2605
  %cmp20 = icmp slt i32 %6, 0, !dbg !2607
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2608

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2609
  %sub = sub nsw i32 0, %7, !dbg !2611
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2612
  br label %if.end24, !dbg !2613

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2614
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2616
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2617
  %cmp25 = icmp slt i32 %9, 0, !dbg !2619
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2620

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2621
  %sub28 = sub nsw i32 0, %10, !dbg !2623
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2624
  br label %if.end30, !dbg !2625

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2626
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2628
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2629
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2630
  %mul = mul i32 %12, %13, !dbg !2631
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2632
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2633
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2634
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2635
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2636
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2637
  %17 = load i8, i8* %power.addr, align 1, !dbg !2638
  %conv31 = zext i8 %17 to i32, !dbg !2638
  %sub32 = sub nsw i32 32, %conv31, !dbg !2639
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2640
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2640
  %shr = lshr i32 %16, %sub32, !dbg !2640, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2641
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2642
  %19 = load i8, i8* %power.addr, align 1, !dbg !2643
  %conv33 = zext i8 %19 to i32, !dbg !2643
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2644
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2644
  %shl = shl i32 %18, %conv33, !dbg !2644, !klee.check.shift !258
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2645
  %or = or i32 %20, %shl, !dbg !2645
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2645
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2646
  %22 = load i8, i8* %power.addr, align 1, !dbg !2648
  %conv34 = zext i8 %22 to i32, !dbg !2648
  %sub35 = sub nsw i32 32, %conv34, !dbg !2649
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2650
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2650
  %shr36 = lshr i32 %21, %sub35, !dbg !2650, !klee.check.shift !258
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2651
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2652

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2653
  %conv40 = zext i8 %23 to i32, !dbg !2653
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2656
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2657

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2658
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2661
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2662

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2663
  store i32 %25, i32* %retval, align 4, !dbg !2664
  br label %return, !dbg !2664

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2665
  br label %return, !dbg !2665

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2666
  %sub49 = sub i32 0, %26, !dbg !2668
  store i32 %sub49, i32* %retval, align 4, !dbg !2669
  br label %return, !dbg !2669

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2670
  %conv51 = zext i8 %27 to i32, !dbg !2670
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2673
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2674

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2675
  br label %return, !dbg !2675

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2677
  br label %return, !dbg !2677

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2679
  ret i32 %28, !dbg !2679
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2680 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2683, metadata !DIExpression()), !dbg !2684
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2685, metadata !DIExpression()), !dbg !2686
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2687, metadata !DIExpression()), !dbg !2688
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2689, metadata !DIExpression()), !dbg !2690
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2691, metadata !DIExpression()), !dbg !2692
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2693, metadata !DIExpression()), !dbg !2694
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2695, metadata !DIExpression()), !dbg !2696
  %0 = load i32, i32* %value.addr, align 4, !dbg !2697
  %cmp = icmp slt i32 %0, 0, !dbg !2699
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2700

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2701
  %conv = sext i8 %1 to i32, !dbg !2701
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2702
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2703

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2704
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2705
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2706

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2707
  %conv6 = sext i8 %3 to i32, !dbg !2707
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2708
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2709

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2710
  br label %if.end, !dbg !2712

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2713
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2715
  %cmp9 = icmp slt i32 %4, 0, !dbg !2717
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2718

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2719
  %sub = sub nsw i32 0, %5, !dbg !2721
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2722
  br label %if.end13, !dbg !2723

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2724
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2726
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2727
  %conv14 = sext i8 %7 to i32, !dbg !2727
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2729
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2730

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2731
  %conv18 = sext i8 %8 to i32, !dbg !2731
  %sub19 = sub nsw i32 0, %conv18, !dbg !2733
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2734
  br label %if.end22, !dbg !2735

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2736
  %conv21 = sext i8 %9 to i32, !dbg !2736
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2738
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2739
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2740
  %mul = mul i32 %10, %11, !dbg !2741
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2742
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2743
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2744
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2745
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2746
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2747
  %shr = lshr i32 %14, 7, !dbg !2748
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2749
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2750
  %shl = shl i32 %15, 25, !dbg !2751
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2752
  %or = or i32 %16, %shl, !dbg !2752
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2752
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2753
  %conv23 = zext i8 %17 to i32, !dbg !2753
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2755
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2756

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2757
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2760
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2761

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2762
  store i32 %19, i32* %retval, align 4, !dbg !2763
  br label %return, !dbg !2763

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2764
  br label %return, !dbg !2764

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2765
  %sub32 = sub i32 0, %20, !dbg !2767
  store i32 %sub32, i32* %retval, align 4, !dbg !2768
  br label %return, !dbg !2768

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2769
  ret i32 %21, !dbg !2769
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2770 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2771, metadata !DIExpression()), !dbg !2772
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2773, metadata !DIExpression()), !dbg !2774
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2775, metadata !DIExpression()), !dbg !2776
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2777, metadata !DIExpression()), !dbg !2778
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2779, metadata !DIExpression()), !dbg !2780
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2781, metadata !DIExpression()), !dbg !2782
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2783, metadata !DIExpression()), !dbg !2784
  %0 = load i32, i32* %value.addr, align 4, !dbg !2785
  %cmp = icmp slt i32 %0, 0, !dbg !2787
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2788

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2789
  %conv = sext i8 %1 to i32, !dbg !2789
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2790
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2791

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2792
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2793
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2794

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2795
  %conv6 = sext i8 %3 to i32, !dbg !2795
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2796
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2797

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2798
  br label %if.end, !dbg !2800

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2801
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2803
  %cmp9 = icmp slt i32 %4, 0, !dbg !2805
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2806

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2807
  %sub = sub nsw i32 0, %5, !dbg !2809
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2810
  br label %if.end13, !dbg !2811

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2812
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2814
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2815
  %conv14 = sext i8 %7 to i32, !dbg !2815
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2817
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2818

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2819
  %conv18 = sext i8 %8 to i32, !dbg !2819
  %sub19 = sub nsw i32 0, %conv18, !dbg !2821
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2822
  br label %if.end22, !dbg !2823

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2824
  %conv21 = sext i8 %9 to i32, !dbg !2824
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2826
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2827
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2828
  %mul = mul i32 %10, %11, !dbg !2829
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2830
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2831
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2832
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2833
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2834
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2835
  %shr = lshr i32 %14, 6, !dbg !2836
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2837
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2838
  %shl = shl i32 %15, 26, !dbg !2839
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2840
  %or = or i32 %16, %shl, !dbg !2840
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2840
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2841
  %shr23 = lshr i32 %17, 6, !dbg !2843
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2844
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2845

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2846
  %conv27 = zext i8 %18 to i32, !dbg !2846
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2849
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2850

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2851
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2854
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2855

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2856
  store i32 %20, i32* %retval, align 4, !dbg !2857
  br label %return, !dbg !2857

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2858
  br label %return, !dbg !2858

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2859
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2862
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2863

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2864
  %sub39 = sub i32 0, %22, !dbg !2865
  store i32 %sub39, i32* %retval, align 4, !dbg !2866
  br label %return, !dbg !2866

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2867
  br label %return, !dbg !2867

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2868
  br label %return, !dbg !2868

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2870
  ret i32 %23, !dbg !2870
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2871 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2872, metadata !DIExpression()), !dbg !2873
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2874, metadata !DIExpression()), !dbg !2875
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2876, metadata !DIExpression()), !dbg !2877
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2878, metadata !DIExpression()), !dbg !2879
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2880, metadata !DIExpression()), !dbg !2881
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2882, metadata !DIExpression()), !dbg !2883
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2884, metadata !DIExpression()), !dbg !2885
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2886
  %cmp = icmp slt i32 %0, 0, !dbg !2888
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2889
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2889

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2890
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2891
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2892
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2892

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2893
  br label %if.end, !dbg !2895

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2896
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2898
  %cmp5 = icmp slt i32 %4, 0, !dbg !2900
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2901

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2902
  %sub = sub nsw i32 0, %5, !dbg !2904
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2905
  br label %if.end8, !dbg !2906

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2907
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2909
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2910
  %cmp9 = icmp slt i32 %7, 0, !dbg !2912
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2913

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2914
  %sub11 = sub nsw i32 0, %8, !dbg !2916
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2917
  br label %if.end13, !dbg !2918

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2919
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2921
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2922
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2923
  %mul = mul i32 %10, %11, !dbg !2924
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2925
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2926
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2927
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2928
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2929
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2930
  %cmp14 = icmp eq i32 %14, 0, !dbg !2932
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2933

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2934
  %conv = zext i8 %15 to i32, !dbg !2934
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2937
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2938

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2939
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2942
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2943

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2944
  store i32 %17, i32* %retval, align 4, !dbg !2945
  br label %return, !dbg !2945

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2946
  br label %return, !dbg !2946

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2947
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2950
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2951

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2952
  %sub27 = sub i32 0, %19, !dbg !2953
  store i32 %sub27, i32* %retval, align 4, !dbg !2954
  br label %return, !dbg !2954

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2955
  br label %return, !dbg !2955

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2956
  %conv30 = zext i8 %20 to i32, !dbg !2956
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2959
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2960

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2961
  br label %return, !dbg !2961

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2963
  br label %return, !dbg !2963

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2965
  ret i32 %21, !dbg !2965
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2966 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2967, metadata !DIExpression()), !dbg !2968
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2969, metadata !DIExpression()), !dbg !2970
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2971, metadata !DIExpression()), !dbg !2972
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2973, metadata !DIExpression()), !dbg !2974
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2975, metadata !DIExpression()), !dbg !2976
  %0 = load i32, i32* %value.addr, align 4, !dbg !2977
  %cmp = icmp slt i32 %0, 0, !dbg !2979
  br i1 %cmp, label %if.then, label %if.else, !dbg !2980

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2981
  %sub = sub nsw i32 0, %1, !dbg !2983
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2984
  store i8 1, i8* %u8SignBit, align 1, !dbg !2985
  br label %if.end, !dbg !2986

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2987
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2989
  store i8 0, i8* %u8SignBit, align 1, !dbg !2990
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2991
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2992
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2993
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2994
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2995
  %shr = lshr i32 %5, 1, !dbg !2996
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2997
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2998
  %conv = zext i8 %6 to i32, !dbg !2998
  %cmp1 = icmp eq i32 %conv, 0, !dbg !3000
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !3001

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3002
  store i32 %7, i32* %retval, align 4, !dbg !3004
  br label %return, !dbg !3004

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3005
  %sub5 = sub i32 0, %8, !dbg !3007
  store i32 %sub5, i32* %retval, align 4, !dbg !3008
  br label %return, !dbg !3008

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !3009
  ret i32 %9, !dbg !3009
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !3010 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3011, metadata !DIExpression()), !dbg !3012
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !3013, metadata !DIExpression()), !dbg !3014
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3015, metadata !DIExpression()), !dbg !3016
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3017, metadata !DIExpression()), !dbg !3018
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3019, metadata !DIExpression()), !dbg !3020
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3021, metadata !DIExpression()), !dbg !3022
  %0 = load i32, i32* %value.addr, align 4, !dbg !3023
  %cmp = icmp slt i32 %0, 0, !dbg !3025
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3026
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !3026

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3027
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3028
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3029
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3029

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3030
  br label %if.end, !dbg !3032

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3033
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3035
  %cmp5 = icmp slt i32 %4, 0, !dbg !3037
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3038

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3039
  %sub = sub nsw i32 0, %5, !dbg !3041
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3042
  br label %if.end8, !dbg !3043

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3044
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3046
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3047
  %cmp9 = icmp slt i32 %7, 0, !dbg !3049
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3050

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3051
  %sub11 = sub nsw i32 0, %8, !dbg !3053
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3054
  br label %if.end13, !dbg !3055

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3056
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3058
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3059
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3060
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3061
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3062
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3063
  %conv = zext i8 %12 to i32, !dbg !3063
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3065
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3066

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3067
  store i32 %13, i32* %retval, align 4, !dbg !3069
  br label %return, !dbg !3069

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3070
  %sub18 = sub i32 0, %14, !dbg !3072
  store i32 %sub18, i32* %retval, align 4, !dbg !3073
  br label %return, !dbg !3073

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3074
  ret i32 %15, !dbg !3074
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3075 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3078, metadata !DIExpression()), !dbg !3079
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3080, metadata !DIExpression()), !dbg !3081
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3082, metadata !DIExpression()), !dbg !3083
  store i32 0, i32* %u32Temp1, align 4, !dbg !3083
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3084, metadata !DIExpression()), !dbg !3085
  store i32 0, i32* %u32Temp2, align 4, !dbg !3085
  %0 = load i32, i32* %value.addr, align 4, !dbg !3086
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3087
  %conv = zext i8 %1 to i32, !dbg !3087
  %mul = mul i32 %0, %conv, !dbg !3088
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3089
  %2 = load i32, i32* %value.addr, align 4, !dbg !3090
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3091
  %conv1 = zext i8 %3 to i32, !dbg !3091
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3092
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3093
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3094
  %shr = lshr i32 %4, 8, !dbg !3095
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3096
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3097
  %shl = shl i32 %5, 24, !dbg !3098
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3099
  %or = or i32 %6, %shl, !dbg !3099
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3099
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3100
  ret i32 %7, !dbg !3101
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3102 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3103, metadata !DIExpression()), !dbg !3104
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3105, metadata !DIExpression()), !dbg !3106
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3107, metadata !DIExpression()), !dbg !3108
  store i32 0, i32* %u32Temp1, align 4, !dbg !3108
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3109, metadata !DIExpression()), !dbg !3110
  store i32 0, i32* %u32Temp2, align 4, !dbg !3110
  %0 = load i32, i32* %value.addr, align 4, !dbg !3111
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3112
  %conv = zext i8 %1 to i32, !dbg !3112
  %mul = mul i32 %0, %conv, !dbg !3113
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3114
  %2 = load i32, i32* %value.addr, align 4, !dbg !3115
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3116
  %conv1 = zext i8 %3 to i32, !dbg !3116
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3117
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3118
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3119
  %shr = lshr i32 %4, 7, !dbg !3120
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3121
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3122
  %shl = shl i32 %5, 25, !dbg !3123
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3124
  %or = or i32 %6, %shl, !dbg !3124
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3124
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3125
  %shr2 = lshr i32 %7, 7, !dbg !3127
  %cmp = icmp eq i32 %shr2, 0, !dbg !3128
  br i1 %cmp, label %if.then, label %if.else, !dbg !3129

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3130
  store i32 %8, i32* %retval, align 4, !dbg !3132
  br label %return, !dbg !3132

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3133
  br label %return, !dbg !3133

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3135
  ret i32 %9, !dbg !3135
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3136 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3139, metadata !DIExpression()), !dbg !3140
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3141, metadata !DIExpression()), !dbg !3142
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3143, metadata !DIExpression()), !dbg !3144
  store i32 0, i32* %u32Temp1, align 4, !dbg !3144
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3145, metadata !DIExpression()), !dbg !3146
  store i32 0, i32* %u32Temp2, align 4, !dbg !3146
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3147
  %conv = sext i8 %0 to i32, !dbg !3147
  %cmp = icmp sgt i32 %conv, 0, !dbg !3149
  br i1 %cmp, label %if.then, label %if.else, !dbg !3150

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3151
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3153
  %conv2 = sext i8 %2 to i32, !dbg !3153
  %mul = mul i32 %1, %conv2, !dbg !3154
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3155
  %3 = load i32, i32* %value.addr, align 4, !dbg !3156
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3157
  %conv3 = sext i8 %4 to i32, !dbg !3157
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3158
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3159
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3160
  %shr = lshr i32 %5, 7, !dbg !3161
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3162
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3163
  %shl = shl i32 %6, 25, !dbg !3164
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3165
  %or = or i32 %7, %shl, !dbg !3165
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3165
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3166
  store i32 %8, i32* %retval, align 4, !dbg !3167
  br label %return, !dbg !3167

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3168
  br label %return, !dbg !3168

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3170
  ret i32 %9, !dbg !3170
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3171 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3172, metadata !DIExpression()), !dbg !3173
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3174, metadata !DIExpression()), !dbg !3175
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3176, metadata !DIExpression()), !dbg !3177
  store i32 0, i32* %u32Temp1, align 4, !dbg !3177
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3178, metadata !DIExpression()), !dbg !3179
  store i32 0, i32* %u32Temp2, align 4, !dbg !3179
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3180
  %conv = sext i8 %0 to i32, !dbg !3180
  %cmp = icmp sle i32 %conv, 0, !dbg !3182
  br i1 %cmp, label %if.then, label %if.else, !dbg !3183

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3184
  br label %return, !dbg !3184

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3186
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3188
  %conv2 = sext i8 %2 to i32, !dbg !3188
  %mul = mul i32 %1, %conv2, !dbg !3189
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3190
  %3 = load i32, i32* %value.addr, align 4, !dbg !3191
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3192
  %conv3 = sext i8 %4 to i32, !dbg !3192
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3193
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3194
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3195
  %shr = lshr i32 %5, 6, !dbg !3196
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3197
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3198
  %shl = shl i32 %6, 26, !dbg !3199
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3200
  %or = or i32 %7, %shl, !dbg !3200
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3200
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3201
  %shr4 = lshr i32 %8, 6, !dbg !3203
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3204
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3205

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3206
  store i32 %9, i32* %retval, align 4, !dbg !3208
  br label %return, !dbg !3208

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3209
  br label %return, !dbg !3209

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3211
  ret i32 %10, !dbg !3211
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3212 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3215, metadata !DIExpression()), !dbg !3216
  %0 = load i16, i16* %value.addr, align 2, !dbg !3217
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3218
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3219
  ret i16 %call, !dbg !3220
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3221 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3224, metadata !DIExpression()), !dbg !3225
  %0 = load i16, i16* %value.addr, align 2, !dbg !3226
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3227
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3228
  ret i16 %call, !dbg !3229
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3230 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3233, metadata !DIExpression()), !dbg !3234
  %0 = load i16, i16* %value.addr, align 2, !dbg !3235
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3236
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3237
  ret i16 %call, !dbg !3238
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3239 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3242, metadata !DIExpression()), !dbg !3243
  %0 = load i16, i16* %value.addr, align 2, !dbg !3244
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3245
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3246
  ret i16 %call, !dbg !3247
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3248 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3251, metadata !DIExpression()), !dbg !3252
  %0 = load i16, i16* %value.addr, align 2, !dbg !3253
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3254
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3255
  ret i16 %call, !dbg !3256
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3257 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3260, metadata !DIExpression()), !dbg !3261
  %0 = load i16, i16* %value.addr, align 2, !dbg !3262
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3263
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3264
  ret i16 %call, !dbg !3265
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3266 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3269, metadata !DIExpression()), !dbg !3270
  %0 = load i16, i16* %value.addr, align 2, !dbg !3271
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3272
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3273
  ret i16 %call, !dbg !3274
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3275 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3278, metadata !DIExpression()), !dbg !3279
  %0 = load i16, i16* %value.addr, align 2, !dbg !3280
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3281
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3282
  ret i16 %call, !dbg !3283
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3284 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3287, metadata !DIExpression()), !dbg !3288
  %0 = load i16, i16* %value.addr, align 2, !dbg !3289
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3290
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3291
  ret i16 %call, !dbg !3292
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3293 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3296, metadata !DIExpression()), !dbg !3297
  %0 = load i16, i16* %value.addr, align 2, !dbg !3298
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3299
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3300
  ret i16 %call, !dbg !3301
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3302 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3305, metadata !DIExpression()), !dbg !3306
  %0 = load i16, i16* %value.addr, align 2, !dbg !3307
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3308
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3309
  ret i16 %call, !dbg !3310
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3311 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3314, metadata !DIExpression()), !dbg !3315
  %0 = load i16, i16* %value.addr, align 2, !dbg !3316
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3317
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3318
  ret i16 %call, !dbg !3319
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3320 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3323, metadata !DIExpression()), !dbg !3324
  %0 = load i16, i16* %value.addr, align 2, !dbg !3325
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3326
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3327
  ret i16 %call, !dbg !3328
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3329 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3332, metadata !DIExpression()), !dbg !3333
  %0 = load i16, i16* %value.addr, align 2, !dbg !3334
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3335
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3336
  ret i16 %call, !dbg !3337
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3338 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3341, metadata !DIExpression()), !dbg !3342
  %0 = load i16, i16* %value.addr, align 2, !dbg !3343
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3344
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3345
  ret i16 %call, !dbg !3346
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3347 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3350, metadata !DIExpression()), !dbg !3351
  %0 = load i16, i16* %value.addr, align 2, !dbg !3352
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3353
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3354
  %2 = load i16, i16* %retval, align 2, !dbg !3355
  ret i16 %2, !dbg !3355
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3356 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3359, metadata !DIExpression()), !dbg !3360
  %0 = load i16, i16* %value.addr, align 2, !dbg !3361
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3362
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3363
  ret i16 %call, !dbg !3364
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3365 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3368, metadata !DIExpression()), !dbg !3369
  %0 = load i16, i16* %value.addr, align 2, !dbg !3370
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3371
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3372
  ret i16 %call, !dbg !3373
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3374 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3377, metadata !DIExpression()), !dbg !3378
  %0 = load i16, i16* %value.addr, align 2, !dbg !3379
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3380
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3381
  ret i16 %call, !dbg !3382
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3383 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3386, metadata !DIExpression()), !dbg !3387
  %0 = load i16, i16* %value.addr, align 2, !dbg !3388
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3389
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3390
  ret i16 %call, !dbg !3391
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3392 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3395, metadata !DIExpression()), !dbg !3396
  %0 = load i16, i16* %value.addr, align 2, !dbg !3397
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3398
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3399
  ret i16 %call, !dbg !3400
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3401 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3404, metadata !DIExpression()), !dbg !3405
  %0 = load i16, i16* %value.addr, align 2, !dbg !3406
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3407
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3408
  ret i16 %call, !dbg !3409
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3410 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3413, metadata !DIExpression()), !dbg !3414
  %0 = load i16, i16* %value.addr, align 2, !dbg !3415
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3416
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3417
  ret i16 %call, !dbg !3418
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3419 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3422, metadata !DIExpression()), !dbg !3423
  %0 = load i16, i16* %value.addr, align 2, !dbg !3424
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3425
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3426
  ret i16 %call, !dbg !3427
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3428 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3429, metadata !DIExpression()), !dbg !3430
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3431, metadata !DIExpression()), !dbg !3432
  %0 = load i16, i16* %value.addr, align 2, !dbg !3433
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3434
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3435
  ret i16 %call, !dbg !3436
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3437 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3438, metadata !DIExpression()), !dbg !3439
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3440, metadata !DIExpression()), !dbg !3441
  %0 = load i16, i16* %value.addr, align 2, !dbg !3442
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3443
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3444
  ret i16 %call, !dbg !3445
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3446 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3447, metadata !DIExpression()), !dbg !3448
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3449, metadata !DIExpression()), !dbg !3450
  %0 = load i16, i16* %value.addr, align 2, !dbg !3451
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3452
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3453
  ret i16 %call, !dbg !3454
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3455 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3456, metadata !DIExpression()), !dbg !3457
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3458, metadata !DIExpression()), !dbg !3459
  %0 = load i16, i16* %value.addr, align 2, !dbg !3460
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3461
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3462
  ret i16 %call, !dbg !3463
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3464 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3465, metadata !DIExpression()), !dbg !3466
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3467, metadata !DIExpression()), !dbg !3468
  %0 = load i16, i16* %value.addr, align 2, !dbg !3469
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3470
  %conv = zext i8 %1 to i16, !dbg !3471
  %conv1 = zext i16 %conv to i32, !dbg !3471
  %shl = shl i32 %conv1, 5, !dbg !3472
  %conv2 = trunc i32 %shl to i16, !dbg !3473
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3474
  ret i16 %call, !dbg !3475
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3476 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3477, metadata !DIExpression()), !dbg !3478
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3479, metadata !DIExpression()), !dbg !3480
  %0 = load i16, i16* %value.addr, align 2, !dbg !3481
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3482
  %conv = zext i8 %1 to i16, !dbg !3483
  %conv1 = zext i16 %conv to i32, !dbg !3483
  %shl = shl i32 %conv1, 6, !dbg !3484
  %conv2 = trunc i32 %shl to i16, !dbg !3485
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3486
  ret i16 %call, !dbg !3487
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3488 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3489, metadata !DIExpression()), !dbg !3490
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3491, metadata !DIExpression()), !dbg !3492
  %0 = load i16, i16* %value.addr, align 2, !dbg !3493
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3494
  %conv = zext i8 %1 to i16, !dbg !3495
  %conv1 = zext i16 %conv to i32, !dbg !3495
  %shl = shl i32 %conv1, 7, !dbg !3496
  %conv2 = trunc i32 %shl to i16, !dbg !3497
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3498
  ret i16 %call, !dbg !3499
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3500 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3501, metadata !DIExpression()), !dbg !3502
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3503, metadata !DIExpression()), !dbg !3504
  %0 = load i16, i16* %value.addr, align 2, !dbg !3505
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3506
  %conv = zext i8 %1 to i16, !dbg !3507
  %conv1 = zext i16 %conv to i32, !dbg !3507
  %shl = shl i32 %conv1, 7, !dbg !3508
  %conv2 = trunc i32 %shl to i16, !dbg !3509
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3510
  ret i16 %call, !dbg !3511
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3512 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3513, metadata !DIExpression()), !dbg !3514
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3515, metadata !DIExpression()), !dbg !3516
  %0 = load i16, i16* %value.addr, align 2, !dbg !3517
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3518
  %conv = zext i8 %1 to i16, !dbg !3519
  %conv1 = zext i16 %conv to i32, !dbg !3519
  %shl = shl i32 %conv1, 4, !dbg !3520
  %conv2 = trunc i32 %shl to i16, !dbg !3521
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3522
  ret i16 %call, !dbg !3523
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3524 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3525, metadata !DIExpression()), !dbg !3526
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3527, metadata !DIExpression()), !dbg !3528
  %0 = load i16, i16* %value.addr, align 2, !dbg !3529
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3530
  %conv = zext i8 %1 to i16, !dbg !3531
  %conv1 = zext i16 %conv to i32, !dbg !3531
  %shl = shl i32 %conv1, 5, !dbg !3532
  %conv2 = trunc i32 %shl to i16, !dbg !3533
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3534
  ret i16 %call, !dbg !3535
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3536 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3537, metadata !DIExpression()), !dbg !3538
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3539, metadata !DIExpression()), !dbg !3540
  %0 = load i16, i16* %value.addr, align 2, !dbg !3541
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3542
  %conv = zext i8 %1 to i16, !dbg !3543
  %conv1 = zext i16 %conv to i32, !dbg !3543
  %shl = shl i32 %conv1, 2, !dbg !3544
  %conv2 = trunc i32 %shl to i16, !dbg !3545
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3546
  ret i16 %call, !dbg !3547
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3548 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3549, metadata !DIExpression()), !dbg !3550
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3551, metadata !DIExpression()), !dbg !3552
  %0 = load i16, i16* %value.addr, align 2, !dbg !3553
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3554
  %conv = zext i8 %1 to i16, !dbg !3555
  %conv1 = zext i16 %conv to i32, !dbg !3555
  %shl = shl i32 %conv1, 6, !dbg !3556
  %conv2 = trunc i32 %shl to i16, !dbg !3557
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3558
  ret i16 %call, !dbg !3559
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3560 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3561, metadata !DIExpression()), !dbg !3562
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3563, metadata !DIExpression()), !dbg !3564
  %0 = load i16, i16* %value.addr, align 2, !dbg !3565
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3566
  %conv = zext i8 %1 to i16, !dbg !3567
  %conv1 = zext i16 %conv to i32, !dbg !3567
  %shl = shl i32 %conv1, 3, !dbg !3568
  %conv2 = trunc i32 %shl to i16, !dbg !3569
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3570
  ret i16 %call, !dbg !3571
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3572 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3573, metadata !DIExpression()), !dbg !3574
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3575, metadata !DIExpression()), !dbg !3576
  %0 = load i32, i32* %value.addr, align 4, !dbg !3577
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3578
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3579
  ret i32 %call, !dbg !3580
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3581 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3584, metadata !DIExpression()), !dbg !3585
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3586, metadata !DIExpression()), !dbg !3587
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3588, metadata !DIExpression()), !dbg !3589
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3590, metadata !DIExpression()), !dbg !3591
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3592, metadata !DIExpression()), !dbg !3593
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3594, metadata !DIExpression()), !dbg !3595
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3596, metadata !DIExpression()), !dbg !3597
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3598, metadata !DIExpression()), !dbg !3599
  %0 = load i32, i32* %value.addr, align 4, !dbg !3600
  %cmp = icmp slt i32 %0, 0, !dbg !3602
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3603

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3604
  %conv = sext i16 %1 to i32, !dbg !3604
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3605
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3606

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3607
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3608
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3609

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3610
  %conv6 = sext i16 %3 to i32, !dbg !3610
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3611
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3612

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3613
  br label %if.end, !dbg !3615

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3616
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3618
  %cmp9 = icmp slt i32 %4, 0, !dbg !3620
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3621

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3622
  %sub = sub nsw i32 0, %5, !dbg !3624
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3625
  br label %if.end13, !dbg !3626

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3627
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3629
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3630
  %conv14 = sext i16 %7 to i32, !dbg !3630
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3632
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3633

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3634
  %conv18 = sext i16 %8 to i32, !dbg !3634
  %sub19 = sub nsw i32 0, %conv18, !dbg !3636
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3637
  br label %if.end22, !dbg !3638

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3639
  %conv21 = sext i16 %9 to i32, !dbg !3639
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3641
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3642
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3643
  %mul = mul i32 %10, %11, !dbg !3644
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3645
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3646
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3647
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3648
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3649
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3650
  %15 = load i32, i32* %count.addr, align 4, !dbg !3651
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3652
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3652
  %shr = lshr i32 %14, %15, !dbg !3652, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3653
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3654
  %17 = load i32, i32* %count.addr, align 4, !dbg !3655
  %sub23 = sub i32 32, %17, !dbg !3656
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3657
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3657
  %shl = shl i32 %16, %sub23, !dbg !3657, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3658
  %or = or i32 %18, %shl, !dbg !3658
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3658
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3659
  %20 = load i32, i32* %count.addr, align 4, !dbg !3661
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3662
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3662
  %shr24 = lshr i32 %19, %20, !dbg !3662, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3663
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3664

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3665
  %conv28 = zext i8 %21 to i32, !dbg !3665
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3668
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3669

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3670
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3673
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3674

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3675
  store i32 %23, i32* %retval, align 4, !dbg !3676
  br label %return, !dbg !3676

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3677
  br label %return, !dbg !3677

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3678
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3681
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3682

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3683
  %sub40 = sub i32 0, %25, !dbg !3684
  store i32 %sub40, i32* %retval, align 4, !dbg !3685
  br label %return, !dbg !3685

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3686
  br label %return, !dbg !3686

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3687
  br label %return, !dbg !3687

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3689
  ret i32 %26, !dbg !3689
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3690 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3691, metadata !DIExpression()), !dbg !3692
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3693, metadata !DIExpression()), !dbg !3694
  %0 = load i32, i32* %value.addr, align 4, !dbg !3695
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3696
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3697
  ret i32 %call, !dbg !3698
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3699 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3702, metadata !DIExpression()), !dbg !3703
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3704, metadata !DIExpression()), !dbg !3705
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3706, metadata !DIExpression()), !dbg !3707
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3708, metadata !DIExpression()), !dbg !3709
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3710, metadata !DIExpression()), !dbg !3711
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3712, metadata !DIExpression()), !dbg !3713
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3714, metadata !DIExpression()), !dbg !3715
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3716, metadata !DIExpression()), !dbg !3717
  %0 = load i32, i32* %value.addr, align 4, !dbg !3718
  %cmp = icmp slt i32 %0, 0, !dbg !3720
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3721

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3722
  %conv = sext i8 %1 to i32, !dbg !3722
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3723
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3724

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3725
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3726
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3727

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3728
  %conv6 = sext i8 %3 to i32, !dbg !3728
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3729
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3730

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3731
  br label %if.end, !dbg !3733

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3734
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3736
  %cmp9 = icmp slt i32 %4, 0, !dbg !3738
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3739

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3740
  %sub = sub nsw i32 0, %5, !dbg !3742
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3743
  br label %if.end13, !dbg !3744

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3745
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3747
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3748
  %conv14 = sext i8 %7 to i32, !dbg !3748
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3750
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3751

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3752
  %conv18 = sext i8 %8 to i32, !dbg !3752
  %sub19 = sub nsw i32 0, %conv18, !dbg !3754
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3755
  br label %if.end22, !dbg !3756

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3757
  %conv21 = sext i8 %9 to i32, !dbg !3757
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3759
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3760
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3761
  %mul = mul i32 %10, %11, !dbg !3762
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3763
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3764
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3765
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3766
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3767
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3768
  %15 = load i32, i32* %count.addr, align 4, !dbg !3769
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3770
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3770
  %shr = lshr i32 %14, %15, !dbg !3770, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3771
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3772
  %17 = load i32, i32* %count.addr, align 4, !dbg !3773
  %sub23 = sub i32 32, %17, !dbg !3774
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3775
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3775
  %shl = shl i32 %16, %sub23, !dbg !3775, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3776
  %or = or i32 %18, %shl, !dbg !3776
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3776
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3777
  %20 = load i32, i32* %count.addr, align 4, !dbg !3779
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3780
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3780
  %shr24 = lshr i32 %19, %20, !dbg !3780, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3781
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3782

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3783
  %conv28 = zext i8 %21 to i32, !dbg !3783
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3786
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3787

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3788
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3791
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3792

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3793
  store i32 %23, i32* %retval, align 4, !dbg !3794
  br label %return, !dbg !3794

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3795
  br label %return, !dbg !3795

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3796
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3799
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3800

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3801
  %sub40 = sub i32 0, %25, !dbg !3802
  store i32 %sub40, i32* %retval, align 4, !dbg !3803
  br label %return, !dbg !3803

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3804
  br label %return, !dbg !3804

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3805
  br label %return, !dbg !3805

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3807
  ret i32 %26, !dbg !3807
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3808 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3809, metadata !DIExpression()), !dbg !3810
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3811, metadata !DIExpression()), !dbg !3812
  %0 = load i32, i32* %value.addr, align 4, !dbg !3813
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3814
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3815
  ret i32 %call, !dbg !3816
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3817 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3820, metadata !DIExpression()), !dbg !3821
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3822, metadata !DIExpression()), !dbg !3823
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3824, metadata !DIExpression()), !dbg !3825
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3826, metadata !DIExpression()), !dbg !3827
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3828, metadata !DIExpression()), !dbg !3829
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3830, metadata !DIExpression()), !dbg !3831
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3832, metadata !DIExpression()), !dbg !3833
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3834, metadata !DIExpression()), !dbg !3835
  %0 = load i32, i32* %value.addr, align 4, !dbg !3836
  %cmp = icmp slt i32 %0, 0, !dbg !3838
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3839

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3840
  %conv = zext i16 %1 to i32, !dbg !3840
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3841
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3842

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3843
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3844
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3845

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3846
  %conv6 = zext i16 %3 to i32, !dbg !3846
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3847
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3848

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3849
  br label %if.end, !dbg !3851

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3852
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3854
  %cmp9 = icmp slt i32 %4, 0, !dbg !3856
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3857

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3858
  %sub = sub nsw i32 0, %5, !dbg !3860
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3861
  br label %if.end13, !dbg !3862

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3863
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3865
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3866
  %conv14 = zext i16 %7 to i32, !dbg !3866
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3868
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3869

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3870
  %conv18 = zext i16 %8 to i32, !dbg !3870
  %sub19 = sub nsw i32 0, %conv18, !dbg !3872
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3873
  br label %if.end22, !dbg !3874

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3875
  %conv21 = zext i16 %9 to i32, !dbg !3875
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3877
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3878
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3879
  %mul = mul i32 %10, %11, !dbg !3880
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3881
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3882
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3883
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3884
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3885
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3886
  %15 = load i32, i32* %count.addr, align 4, !dbg !3887
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3888
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3888
  %shr = lshr i32 %14, %15, !dbg !3888, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3889
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3890
  %17 = load i32, i32* %count.addr, align 4, !dbg !3891
  %sub23 = sub i32 32, %17, !dbg !3892
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3893
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3893
  %shl = shl i32 %16, %sub23, !dbg !3893, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3894
  %or = or i32 %18, %shl, !dbg !3894
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3894
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3895
  %20 = load i32, i32* %count.addr, align 4, !dbg !3897
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3898
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3898
  %shr24 = lshr i32 %19, %20, !dbg !3898, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3899
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3900

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3901
  %conv28 = zext i8 %21 to i32, !dbg !3901
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3904
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3905

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3906
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3909
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3910

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3911
  store i32 %23, i32* %retval, align 4, !dbg !3912
  br label %return, !dbg !3912

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3913
  br label %return, !dbg !3913

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3914
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3917
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3918

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3919
  %sub40 = sub i32 0, %25, !dbg !3920
  store i32 %sub40, i32* %retval, align 4, !dbg !3921
  br label %return, !dbg !3921

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3922
  br label %return, !dbg !3922

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3923
  br label %return, !dbg !3923

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3925
  ret i32 %26, !dbg !3925
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3926 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3927, metadata !DIExpression()), !dbg !3928
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3929, metadata !DIExpression()), !dbg !3930
  %0 = load i32, i32* %value.addr, align 4, !dbg !3931
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3932
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3933
  ret i32 %call, !dbg !3934
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3935 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3938, metadata !DIExpression()), !dbg !3939
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3940, metadata !DIExpression()), !dbg !3941
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3942, metadata !DIExpression()), !dbg !3943
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3944, metadata !DIExpression()), !dbg !3945
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3946, metadata !DIExpression()), !dbg !3947
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3948, metadata !DIExpression()), !dbg !3949
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3950, metadata !DIExpression()), !dbg !3951
  %0 = load i32, i32* %value.addr, align 4, !dbg !3952
  %cmp = icmp slt i32 %0, 0, !dbg !3954
  br i1 %cmp, label %if.then, label %if.else, !dbg !3955

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3956
  %1 = load i32, i32* %value.addr, align 4, !dbg !3958
  %sub = sub nsw i32 0, %1, !dbg !3959
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3960
  br label %if.end, !dbg !3961

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3962
  %2 = load i32, i32* %value.addr, align 4, !dbg !3964
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3965
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3966
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3967
  %conv = zext i8 %4 to i32, !dbg !3967
  %mul = mul i32 %3, %conv, !dbg !3968
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3969
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3970
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3971
  %conv1 = zext i8 %6 to i32, !dbg !3971
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3972
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3973
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3974
  %8 = load i32, i32* %count.addr, align 4, !dbg !3975
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3976
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3976
  %shr = lshr i32 %7, %8, !dbg !3976, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3977
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3978
  %10 = load i32, i32* %count.addr, align 4, !dbg !3979
  %sub2 = sub i32 32, %10, !dbg !3980
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3981
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3981
  %shl = shl i32 %9, %sub2, !dbg !3981, !klee.check.shift !258
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3982
  %or = or i32 %11, %shl, !dbg !3982
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3982
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3983
  %13 = load i32, i32* %count.addr, align 4, !dbg !3985
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3986
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3986
  %shr3 = lshr i32 %12, %13, !dbg !3986, !klee.check.shift !258
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3987
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3988

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3989
  %conv7 = zext i8 %14 to i32, !dbg !3989
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3992
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3993

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3994
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3997
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3998

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3999
  store i32 %16, i32* %retval, align 4, !dbg !4000
  br label %return, !dbg !4000

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !4001
  br label %return, !dbg !4001

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !4002
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !4005
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !4006

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !4007
  %sub19 = sub i32 0, %18, !dbg !4009
  store i32 %sub19, i32* %retval, align 4, !dbg !4010
  br label %return, !dbg !4010

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !4011
  br label %return, !dbg !4011

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !4013
  %conv22 = zext i8 %19 to i32, !dbg !4013
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !4016
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !4017

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !4018
  br label %return, !dbg !4018

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !4020
  br label %return, !dbg !4020

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !4022
  ret i32 %20, !dbg !4022
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !4023 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4024, metadata !DIExpression()), !dbg !4025
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4026, metadata !DIExpression()), !dbg !4027
  %0 = load i8, i8* %value.addr, align 1, !dbg !4028
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4029
  %conv = zext i8 %1 to i16, !dbg !4030
  %conv1 = zext i16 %conv to i32, !dbg !4030
  %shl = shl i32 %conv1, 5, !dbg !4031
  %conv2 = trunc i32 %shl to i16, !dbg !4032
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4033
  ret i8 %call, !dbg !4034
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4035 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4036, metadata !DIExpression()), !dbg !4037
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4038, metadata !DIExpression()), !dbg !4039
  %0 = load i8, i8* %value.addr, align 1, !dbg !4040
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4041
  %conv = zext i8 %1 to i16, !dbg !4042
  %conv1 = zext i16 %conv to i32, !dbg !4042
  %shl = shl i32 %conv1, 6, !dbg !4043
  %conv2 = trunc i32 %shl to i16, !dbg !4044
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4045
  ret i8 %call, !dbg !4046
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4047 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4048, metadata !DIExpression()), !dbg !4049
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4050, metadata !DIExpression()), !dbg !4051
  %0 = load i8, i8* %value.addr, align 1, !dbg !4052
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4053
  %conv = zext i8 %1 to i16, !dbg !4054
  %conv1 = zext i16 %conv to i32, !dbg !4054
  %shl = shl i32 %conv1, 7, !dbg !4055
  %conv2 = trunc i32 %shl to i16, !dbg !4056
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4057
  ret i8 %call, !dbg !4058
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4059 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4060, metadata !DIExpression()), !dbg !4061
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4062, metadata !DIExpression()), !dbg !4063
  %0 = load i8, i8* %value.addr, align 1, !dbg !4064
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4065
  %conv = zext i8 %1 to i16, !dbg !4066
  %conv1 = zext i16 %conv to i32, !dbg !4066
  %shl = shl i32 %conv1, 7, !dbg !4067
  %conv2 = trunc i32 %shl to i16, !dbg !4068
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4069
  ret i8 %call, !dbg !4070
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4071 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4072, metadata !DIExpression()), !dbg !4073
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4074, metadata !DIExpression()), !dbg !4075
  %0 = load i8, i8* %value.addr, align 1, !dbg !4076
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4077
  %conv = zext i8 %1 to i16, !dbg !4078
  %conv1 = zext i16 %conv to i32, !dbg !4078
  %shl = shl i32 %conv1, 4, !dbg !4079
  %conv2 = trunc i32 %shl to i16, !dbg !4080
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4081
  ret i8 %call, !dbg !4082
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4083 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4084, metadata !DIExpression()), !dbg !4085
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4086, metadata !DIExpression()), !dbg !4087
  %0 = load i8, i8* %value.addr, align 1, !dbg !4088
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4089
  %conv = zext i8 %1 to i16, !dbg !4090
  %conv1 = zext i16 %conv to i32, !dbg !4090
  %shl = shl i32 %conv1, 5, !dbg !4091
  %conv2 = trunc i32 %shl to i16, !dbg !4092
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4093
  ret i8 %call, !dbg !4094
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4095 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4096, metadata !DIExpression()), !dbg !4097
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4098, metadata !DIExpression()), !dbg !4099
  %0 = load i8, i8* %value.addr, align 1, !dbg !4100
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4101
  %conv = zext i8 %1 to i16, !dbg !4102
  %conv1 = zext i16 %conv to i32, !dbg !4102
  %shl = shl i32 %conv1, 2, !dbg !4103
  %conv2 = trunc i32 %shl to i16, !dbg !4104
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4105
  ret i8 %call, !dbg !4106
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4107 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4108, metadata !DIExpression()), !dbg !4109
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4110, metadata !DIExpression()), !dbg !4111
  %0 = load i8, i8* %value.addr, align 1, !dbg !4112
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4113
  %conv = zext i8 %1 to i16, !dbg !4114
  %conv1 = zext i16 %conv to i32, !dbg !4114
  %shl = shl i32 %conv1, 6, !dbg !4115
  %conv2 = trunc i32 %shl to i16, !dbg !4116
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4117
  ret i8 %call, !dbg !4118
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4119 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4120, metadata !DIExpression()), !dbg !4121
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  %0 = load i8, i8* %value.addr, align 1, !dbg !4124
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4125
  %conv = zext i8 %1 to i16, !dbg !4126
  %conv1 = zext i16 %conv to i32, !dbg !4126
  %shl = shl i32 %conv1, 3, !dbg !4127
  %conv2 = trunc i32 %shl to i16, !dbg !4128
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4129
  ret i8 %call, !dbg !4130
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4131 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4132, metadata !DIExpression()), !dbg !4133
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4134, metadata !DIExpression()), !dbg !4135
  %0 = load i16, i16* %value.addr, align 2, !dbg !4136
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4137
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4138
  ret i16 %call, !dbg !4139
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4140 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4141, metadata !DIExpression()), !dbg !4142
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4143, metadata !DIExpression()), !dbg !4144
  %0 = load i16, i16* %value.addr, align 2, !dbg !4145
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4146
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4147
  ret i16 %call, !dbg !4148
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4149 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4150, metadata !DIExpression()), !dbg !4151
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4152, metadata !DIExpression()), !dbg !4153
  %0 = load i16, i16* %value.addr, align 2, !dbg !4154
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4155
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4156
  ret i16 %call, !dbg !4157
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4158 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4159, metadata !DIExpression()), !dbg !4160
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4161, metadata !DIExpression()), !dbg !4162
  %0 = load i16, i16* %value.addr, align 2, !dbg !4163
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4164
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4165
  ret i16 %call, !dbg !4166
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4167 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4168, metadata !DIExpression()), !dbg !4169
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4170, metadata !DIExpression()), !dbg !4171
  %0 = load i16, i16* %value.addr, align 2, !dbg !4172
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4173
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4174
  ret i16 %call, !dbg !4175
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4176 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4177, metadata !DIExpression()), !dbg !4178
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4179, metadata !DIExpression()), !dbg !4180
  %0 = load i16, i16* %value.addr, align 2, !dbg !4181
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4182
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4183
  ret i16 %call, !dbg !4184
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4185 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4186, metadata !DIExpression()), !dbg !4187
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4188, metadata !DIExpression()), !dbg !4189
  %0 = load i16, i16* %value.addr, align 2, !dbg !4190
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4191
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4192
  ret i16 %call, !dbg !4193
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4194 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4195, metadata !DIExpression()), !dbg !4196
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4197, metadata !DIExpression()), !dbg !4198
  %0 = load i16, i16* %value.addr, align 2, !dbg !4199
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4200
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4201
  ret i16 %call, !dbg !4202
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4203 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4204, metadata !DIExpression()), !dbg !4205
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4206, metadata !DIExpression()), !dbg !4207
  %0 = load i16, i16* %value.addr, align 2, !dbg !4208
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4209
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4210
  ret i16 %call, !dbg !4211
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4212 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4213, metadata !DIExpression()), !dbg !4214
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4215, metadata !DIExpression()), !dbg !4216
  %0 = load i16, i16* %value.addr, align 2, !dbg !4217
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4218
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4219
  ret i16 %call, !dbg !4220
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4221 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4222, metadata !DIExpression()), !dbg !4223
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4224, metadata !DIExpression()), !dbg !4225
  %0 = load i16, i16* %value.addr, align 2, !dbg !4226
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4227
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4228
  ret i16 %call, !dbg !4229
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4230 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4231, metadata !DIExpression()), !dbg !4232
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4233, metadata !DIExpression()), !dbg !4234
  %0 = load i16, i16* %value.addr, align 2, !dbg !4235
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4236
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4237
  ret i16 %call, !dbg !4238
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4239 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4240, metadata !DIExpression()), !dbg !4241
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4242, metadata !DIExpression()), !dbg !4243
  %0 = load i16, i16* %value.addr, align 2, !dbg !4244
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4245
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4246
  ret i16 %call, !dbg !4247
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4248 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4249, metadata !DIExpression()), !dbg !4250
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4251, metadata !DIExpression()), !dbg !4252
  %0 = load i16, i16* %value.addr, align 2, !dbg !4253
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4254
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4255
  ret i16 %call, !dbg !4256
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4257 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4258, metadata !DIExpression()), !dbg !4259
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4260, metadata !DIExpression()), !dbg !4261
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4262
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4263
  %conv = zext i8 %1 to i16, !dbg !4264
  %conv1 = zext i16 %conv to i32, !dbg !4264
  %shl = shl i32 %conv1, 5, !dbg !4265
  %conv2 = trunc i32 %shl to i16, !dbg !4266
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4267
  ret i16 %call, !dbg !4268
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4269 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4270, metadata !DIExpression()), !dbg !4271
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4272, metadata !DIExpression()), !dbg !4273
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4274
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4275
  %conv = zext i8 %1 to i16, !dbg !4276
  %conv1 = zext i16 %conv to i32, !dbg !4276
  %shl = shl i32 %conv1, 6, !dbg !4277
  %conv2 = trunc i32 %shl to i16, !dbg !4278
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4279
  ret i16 %call, !dbg !4280
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4281 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4282, metadata !DIExpression()), !dbg !4283
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4284, metadata !DIExpression()), !dbg !4285
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4286
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4287
  %conv = zext i8 %1 to i16, !dbg !4288
  %conv1 = zext i16 %conv to i32, !dbg !4288
  %shl = shl i32 %conv1, 7, !dbg !4289
  %conv2 = trunc i32 %shl to i16, !dbg !4290
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4291
  ret i16 %call, !dbg !4292
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4293 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4294, metadata !DIExpression()), !dbg !4295
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4296, metadata !DIExpression()), !dbg !4297
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4298
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4299
  %conv = zext i8 %1 to i16, !dbg !4300
  %conv1 = zext i16 %conv to i32, !dbg !4300
  %shl = shl i32 %conv1, 7, !dbg !4301
  %conv2 = trunc i32 %shl to i16, !dbg !4302
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4303
  ret i16 %call, !dbg !4304
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4305 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4306, metadata !DIExpression()), !dbg !4307
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4308, metadata !DIExpression()), !dbg !4309
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4310
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4311
  %conv = zext i8 %1 to i16, !dbg !4312
  %conv1 = zext i16 %conv to i32, !dbg !4312
  %shl = shl i32 %conv1, 4, !dbg !4313
  %conv2 = trunc i32 %shl to i16, !dbg !4314
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4315
  ret i16 %call, !dbg !4316
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4317 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4318, metadata !DIExpression()), !dbg !4319
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4320, metadata !DIExpression()), !dbg !4321
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4322
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4323
  %conv = zext i8 %1 to i16, !dbg !4324
  %conv1 = zext i16 %conv to i32, !dbg !4324
  %shl = shl i32 %conv1, 5, !dbg !4325
  %conv2 = trunc i32 %shl to i16, !dbg !4326
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4327
  ret i16 %call, !dbg !4328
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4329 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4330, metadata !DIExpression()), !dbg !4331
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4332, metadata !DIExpression()), !dbg !4333
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4334
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4335
  %conv = zext i8 %1 to i16, !dbg !4336
  %conv1 = zext i16 %conv to i32, !dbg !4336
  %shl = shl i32 %conv1, 2, !dbg !4337
  %conv2 = trunc i32 %shl to i16, !dbg !4338
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4339
  ret i16 %call, !dbg !4340
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4341 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4342, metadata !DIExpression()), !dbg !4343
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4344, metadata !DIExpression()), !dbg !4345
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4346
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4347
  %conv = zext i8 %1 to i16, !dbg !4348
  %conv1 = zext i16 %conv to i32, !dbg !4348
  %shl = shl i32 %conv1, 6, !dbg !4349
  %conv2 = trunc i32 %shl to i16, !dbg !4350
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4351
  ret i16 %call, !dbg !4352
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4353 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4354, metadata !DIExpression()), !dbg !4355
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4356, metadata !DIExpression()), !dbg !4357
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4358
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4359
  %conv = zext i8 %1 to i16, !dbg !4360
  %conv1 = zext i16 %conv to i32, !dbg !4360
  %shl = shl i32 %conv1, 3, !dbg !4361
  %conv2 = trunc i32 %shl to i16, !dbg !4362
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4363
  ret i16 %call, !dbg !4364
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4365 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4366, metadata !DIExpression()), !dbg !4367
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4368, metadata !DIExpression()), !dbg !4369
  %0 = load i32, i32* %value.addr, align 4, !dbg !4370
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4371
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4372
  ret i32 %call, !dbg !4373
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4374 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4377, metadata !DIExpression()), !dbg !4378
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4379, metadata !DIExpression()), !dbg !4380
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4381, metadata !DIExpression()), !dbg !4382
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4383, metadata !DIExpression()), !dbg !4384
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4385, metadata !DIExpression()), !dbg !4386
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4387, metadata !DIExpression()), !dbg !4388
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4389, metadata !DIExpression()), !dbg !4390
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4391
  %conv = sext i16 %0 to i32, !dbg !4391
  %cmp = icmp slt i32 %conv, 0, !dbg !4393
  br i1 %cmp, label %if.then, label %if.else, !dbg !4394

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4395
  br label %if.end, !dbg !4397

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4398
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4400
  %conv2 = sext i16 %1 to i32, !dbg !4400
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4402
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4403

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4404
  %conv6 = sext i16 %2 to i32, !dbg !4404
  %sub = sub nsw i32 0, %conv6, !dbg !4406
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4407
  br label %if.end9, !dbg !4408

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4409
  %conv8 = sext i16 %3 to i32, !dbg !4409
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4411
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4412
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4413
  %mul = mul i32 %4, %5, !dbg !4414
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4415
  %6 = load i32, i32* %value.addr, align 4, !dbg !4416
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4417
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4418
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4419
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4420
  %9 = load i32, i32* %count.addr, align 4, !dbg !4421
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4422
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4422
  %shr = lshr i32 %8, %9, !dbg !4422, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4423
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4424
  %11 = load i32, i32* %count.addr, align 4, !dbg !4425
  %sub10 = sub i32 32, %11, !dbg !4426
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4427
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4427
  %shl = shl i32 %10, %sub10, !dbg !4427, !klee.check.shift !258
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4428
  %or = or i32 %12, %shl, !dbg !4428
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4428
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4429
  %14 = load i32, i32* %count.addr, align 4, !dbg !4431
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4432
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4432
  %shr11 = lshr i32 %13, %14, !dbg !4432, !klee.check.shift !258
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4433
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4434

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4435
  %conv15 = zext i8 %15 to i32, !dbg !4435
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4438
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4439

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4440
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4443
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4444

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4445
  store i32 %17, i32* %retval, align 4, !dbg !4446
  br label %return, !dbg !4446

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4447
  br label %return, !dbg !4447

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4448
  br label %return, !dbg !4448

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4450
  br label %return, !dbg !4450

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4452
  ret i32 %18, !dbg !4452
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4453 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4454, metadata !DIExpression()), !dbg !4455
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4456, metadata !DIExpression()), !dbg !4457
  %0 = load i32, i32* %value.addr, align 4, !dbg !4458
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4459
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4460
  ret i32 %call, !dbg !4461
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4462 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4465, metadata !DIExpression()), !dbg !4466
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4467, metadata !DIExpression()), !dbg !4468
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4469, metadata !DIExpression()), !dbg !4470
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4471, metadata !DIExpression()), !dbg !4472
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4473, metadata !DIExpression()), !dbg !4474
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4475, metadata !DIExpression()), !dbg !4476
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4477
  %cmp = icmp slt i32 %0, 0, !dbg !4479
  br i1 %cmp, label %if.then, label %if.else, !dbg !4480

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4481
  br label %if.end, !dbg !4483

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4484
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4486
  %cmp1 = icmp slt i32 %1, 0, !dbg !4488
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4489

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4490
  %sub = sub nsw i32 0, %2, !dbg !4492
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4493
  br label %if.end4, !dbg !4494

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4495
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4497
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4498
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4499
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4500
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4501
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4502
  %7 = load i32, i32* %count.addr, align 4, !dbg !4503
  %sub5 = sub i32 %7, 32, !dbg !4504
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4505
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4505
  %shr = lshr i32 %6, %sub5, !dbg !4505, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4506
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4507
  %conv = zext i8 %8 to i32, !dbg !4507
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4509
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4510

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4511
  store i32 %9, i32* %retval, align 4, !dbg !4513
  br label %return, !dbg !4513

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4514
  br label %return, !dbg !4514

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4516
  ret i32 %10, !dbg !4516
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4517 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4518, metadata !DIExpression()), !dbg !4519
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4520, metadata !DIExpression()), !dbg !4521
  %0 = load i32, i32* %value.addr, align 4, !dbg !4522
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4523
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4524
  ret i32 %call, !dbg !4525
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4526 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4529, metadata !DIExpression()), !dbg !4530
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4531, metadata !DIExpression()), !dbg !4532
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4533, metadata !DIExpression()), !dbg !4534
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4535, metadata !DIExpression()), !dbg !4536
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4537, metadata !DIExpression()), !dbg !4538
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4539, metadata !DIExpression()), !dbg !4540
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4541, metadata !DIExpression()), !dbg !4542
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4543
  %conv = sext i8 %0 to i32, !dbg !4543
  %cmp = icmp slt i32 %conv, 0, !dbg !4545
  br i1 %cmp, label %if.then, label %if.else, !dbg !4546

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4547
  br label %if.end, !dbg !4549

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4550
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4552
  %conv2 = sext i8 %1 to i32, !dbg !4552
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4554
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4555

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4556
  %conv6 = sext i8 %2 to i32, !dbg !4556
  %sub = sub nsw i32 0, %conv6, !dbg !4558
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4559
  br label %if.end9, !dbg !4560

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4561
  %conv8 = sext i8 %3 to i32, !dbg !4561
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4563
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4564
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4565
  %mul = mul i32 %4, %5, !dbg !4566
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4567
  %6 = load i32, i32* %value.addr, align 4, !dbg !4568
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4569
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4570
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4571
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4572
  %9 = load i32, i32* %count.addr, align 4, !dbg !4573
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4574
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4574
  %shr = lshr i32 %8, %9, !dbg !4574, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4575
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4576
  %11 = load i32, i32* %count.addr, align 4, !dbg !4577
  %sub10 = sub i32 32, %11, !dbg !4578
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4579
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4579
  %shl = shl i32 %10, %sub10, !dbg !4579, !klee.check.shift !258
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4580
  %or = or i32 %12, %shl, !dbg !4580
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4580
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4581
  %14 = load i32, i32* %count.addr, align 4, !dbg !4583
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4584
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4584
  %shr11 = lshr i32 %13, %14, !dbg !4584, !klee.check.shift !258
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4585
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4586

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4587
  %conv15 = zext i8 %15 to i32, !dbg !4587
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4590
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4591

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4592
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4595
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4596

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4597
  store i32 %17, i32* %retval, align 4, !dbg !4598
  br label %return, !dbg !4598

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4599
  br label %return, !dbg !4599

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4600
  br label %return, !dbg !4600

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4602
  br label %return, !dbg !4602

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4604
  ret i32 %18, !dbg !4604
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4605 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4606, metadata !DIExpression()), !dbg !4607
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4608, metadata !DIExpression()), !dbg !4609
  %0 = load i32, i32* %value.addr, align 4, !dbg !4610
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4611
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4612
  ret i32 %call, !dbg !4613
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4614 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4615, metadata !DIExpression()), !dbg !4616
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4617, metadata !DIExpression()), !dbg !4618
  %0 = load i32, i32* %value.addr, align 4, !dbg !4619
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4620
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4621
  ret i32 %call, !dbg !4622
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4623 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4626, metadata !DIExpression()), !dbg !4627
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4628, metadata !DIExpression()), !dbg !4629
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4630, metadata !DIExpression()), !dbg !4631
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4632, metadata !DIExpression()), !dbg !4633
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4634, metadata !DIExpression()), !dbg !4635
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4636, metadata !DIExpression()), !dbg !4637
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4638, metadata !DIExpression()), !dbg !4639
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4640, metadata !DIExpression()), !dbg !4641
  %0 = load i32, i32* %value.addr, align 4, !dbg !4642
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4643
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4644
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4645
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4646
  %3 = load i32, i32* %count.addr, align 4, !dbg !4647
  %sub = sub i32 %3, 32, !dbg !4648
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4649
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4649
  %shr = lshr i32 %2, %sub, !dbg !4649, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4650
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4651
  ret i32 %4, !dbg !4652
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4653 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4654, metadata !DIExpression()), !dbg !4655
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4656, metadata !DIExpression()), !dbg !4657
  %0 = load i32, i32* %value.addr, align 4, !dbg !4658
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4659
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4660
  ret i32 %call, !dbg !4661
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4662 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4665, metadata !DIExpression()), !dbg !4666
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4667, metadata !DIExpression()), !dbg !4668
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4669, metadata !DIExpression()), !dbg !4670
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4671, metadata !DIExpression()), !dbg !4672
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4673, metadata !DIExpression()), !dbg !4674
  %0 = load i32, i32* %value.addr, align 4, !dbg !4675
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4676
  %conv = zext i8 %1 to i32, !dbg !4676
  %mul = mul i32 %0, %conv, !dbg !4677
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4678
  %2 = load i32, i32* %value.addr, align 4, !dbg !4679
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4680
  %conv1 = zext i8 %3 to i32, !dbg !4680
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4681
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4682
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4683
  %5 = load i32, i32* %count.addr, align 4, !dbg !4684
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4685
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4685
  %shr = lshr i32 %4, %5, !dbg !4685, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4686
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4687
  %7 = load i32, i32* %count.addr, align 4, !dbg !4688
  %sub = sub i32 32, %7, !dbg !4689
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4690
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4690
  %shl = shl i32 %6, %sub, !dbg !4690, !klee.check.shift !258
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4691
  %or = or i32 %8, %shl, !dbg !4691
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4691
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4692
  %10 = load i32, i32* %count.addr, align 4, !dbg !4694
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4695
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4695
  %shr2 = lshr i32 %9, %10, !dbg !4695, !klee.check.shift !258
  %cmp = icmp eq i32 %shr2, 0, !dbg !4696
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4697

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4698
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4701
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4702

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4703
  store i32 %12, i32* %retval, align 4, !dbg !4704
  br label %return, !dbg !4704

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4705
  br label %return, !dbg !4705

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4706
  br label %return, !dbg !4706

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4708
  ret i32 %13, !dbg !4708
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4709 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4712, metadata !DIExpression()), !dbg !4713
  %0 = load i8, i8* %value.addr, align 1, !dbg !4714
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4715
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4716
  ret i8 %call, !dbg !4717
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4718 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4719, metadata !DIExpression()), !dbg !4720
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4721, metadata !DIExpression()), !dbg !4722
  %0 = load i8, i8* %value.addr, align 1, !dbg !4723
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4724
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4725
  ret i8 %call, !dbg !4726
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4727 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4728, metadata !DIExpression()), !dbg !4729
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4730, metadata !DIExpression()), !dbg !4731
  %0 = load i8, i8* %value.addr, align 1, !dbg !4732
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4733
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4734
  ret i8 %call, !dbg !4735
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4736 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4737, metadata !DIExpression()), !dbg !4738
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4739, metadata !DIExpression()), !dbg !4740
  %0 = load i8, i8* %value.addr, align 1, !dbg !4741
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4742
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4743
  ret i8 %call, !dbg !4744
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4745 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4746, metadata !DIExpression()), !dbg !4747
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4748, metadata !DIExpression()), !dbg !4749
  %0 = load i8, i8* %value.addr, align 1, !dbg !4750
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4751
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4752
  ret i8 %call, !dbg !4753
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4754 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4755, metadata !DIExpression()), !dbg !4756
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4757, metadata !DIExpression()), !dbg !4758
  %0 = load i8, i8* %value.addr, align 1, !dbg !4759
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4760
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4761
  ret i8 %call, !dbg !4762
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4763 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4764, metadata !DIExpression()), !dbg !4765
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4766, metadata !DIExpression()), !dbg !4767
  %0 = load i8, i8* %value.addr, align 1, !dbg !4768
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4769
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4770
  ret i8 %call, !dbg !4771
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4772 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4773, metadata !DIExpression()), !dbg !4774
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4775, metadata !DIExpression()), !dbg !4776
  %0 = load i8, i8* %value.addr, align 1, !dbg !4777
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4778
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4779
  ret i8 %call, !dbg !4780
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4781 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4782, metadata !DIExpression()), !dbg !4783
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4784, metadata !DIExpression()), !dbg !4785
  %0 = load i8, i8* %value.addr, align 1, !dbg !4786
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4787
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4788
  ret i8 %call, !dbg !4789
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4790 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4796, metadata !DIExpression()), !dbg !4797
  %2 = icmp eq i64 %0, 0, !dbg !4798
  br i1 %2, label %3, label %4, !dbg !4800

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4801
  unreachable, !dbg !4801

4:                                                ; preds = %1
  ret void, !dbg !4802
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4803 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4809, metadata !DIExpression()), !dbg !4811
  call void @llvm.dbg.value(metadata i64 %1, metadata !4810, metadata !DIExpression()), !dbg !4811
  %3 = icmp ult i64 %1, %0, !dbg !4812
  br i1 %3, label %5, label %4, !dbg !4814

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4815
  unreachable, !dbg !4815

5:                                                ; preds = %2
  ret void, !dbg !4817
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!36, !2, !38, !40}
!llvm.ident = !{!42, !42, !43, !43}
!llvm.module.flags = !{!44, !45, !46, !47, !48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !34, line: 21, type: !35, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !33, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118/mul_Ccode_alarm_0118.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
!4 = !{}
!5 = !{!6, !13, !17, !20, !24, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !9, line: 24, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !11, line: 37, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !16)
!16 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !19)
!19 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !23)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !26, line: 24, baseType: !27)
!26 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !28)
!28 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !30)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !26, line: 25, baseType: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !32)
!32 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!33 = !{!0}
!34 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
!35 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !17)
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
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
!49 = distinct !DISubprogram(name: "main", scope: !50, file: !50, line: 7, type: !51, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !36, retainedNodes: !4)
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
!51 = !DISubroutineType(types: !52)
!52 = !{!23}
!53 = !DILocalVariable(name: "value", scope: !49, file: !50, line: 9, type: !21)
!54 = !DILocation(line: 9, column: 13, scope: !49)
!55 = !DILocalVariable(name: "factor", scope: !49, file: !50, line: 10, type: !30)
!56 = !DILocation(line: 10, column: 14, scope: !49)
!57 = !DILocalVariable(name: "result", scope: !49, file: !50, line: 11, type: !21)
!58 = !DILocation(line: 11, column: 13, scope: !49)
!59 = !DILocation(line: 13, column: 24, scope: !49)
!60 = !DILocation(line: 13, column: 5, scope: !49)
!61 = !DILocation(line: 14, column: 24, scope: !49)
!62 = !DILocation(line: 14, column: 5, scope: !49)
!63 = !DILocation(line: 16, column: 30, scope: !49)
!64 = !DILocation(line: 16, column: 37, scope: !49)
!65 = !DILocation(line: 16, column: 14, scope: !49)
!66 = !DILocation(line: 16, column: 12, scope: !49)
!67 = !DILocation(line: 18, column: 11, scope: !49)
!68 = !DILocation(line: 19, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !70, file: !70, line: 43, type: !71, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!70 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0118")
!71 = !DISubroutineType(types: !72)
!72 = !{!6, !6, !29}
!73 = !DILocalVariable(name: "value", arg: 1, scope: !69, file: !70, line: 43, type: !6)
!74 = !DILocation(line: 43, column: 35, scope: !69)
!75 = !DILocalVariable(name: "factor", arg: 2, scope: !69, file: !70, line: 43, type: !29)
!76 = !DILocation(line: 43, column: 46, scope: !69)
!77 = !DILocalVariable(name: "s32MulTemp1", scope: !69, file: !70, line: 45, type: !20)
!78 = !DILocation(line: 45, column: 6, scope: !69)
!79 = !DILocalVariable(name: "s32MulTemp2", scope: !69, file: !70, line: 45, type: !20)
!80 = !DILocation(line: 45, column: 24, scope: !69)
!81 = !DILocation(line: 46, column: 16, scope: !69)
!82 = !DILocation(line: 46, column: 24, scope: !69)
!83 = !DILocation(line: 46, column: 22, scope: !69)
!84 = !DILocation(line: 46, column: 14, scope: !69)
!85 = !DILocation(line: 48, column: 16, scope: !69)
!86 = !DILocation(line: 48, column: 28, scope: !69)
!87 = !DILocation(line: 48, column: 14, scope: !69)
!88 = !DILocation(line: 50, column: 6, scope: !89)
!89 = distinct !DILexicalBlock(scope: !69, file: !70, line: 50, column: 5)
!90 = !DILocation(line: 50, column: 17, scope: !89)
!91 = !DILocation(line: 50, column: 21, scope: !89)
!92 = !DILocation(line: 50, column: 25, scope: !89)
!93 = !DILocation(line: 50, column: 37, scope: !89)
!94 = !DILocation(line: 50, column: 46, scope: !89)
!95 = !DILocation(line: 50, column: 5, scope: !69)
!96 = !DILocation(line: 52, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !70, line: 51, column: 2)
!98 = !DILocation(line: 52, column: 29, scope: !97)
!99 = !DILocation(line: 52, column: 15, scope: !97)
!100 = !DILocation(line: 53, column: 14, scope: !97)
!101 = !DILocation(line: 53, column: 10, scope: !97)
!102 = !DILocation(line: 53, column: 3, scope: !97)
!103 = !DILocation(line: 57, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !89, file: !70, line: 56, column: 2)
!105 = !DILocation(line: 57, column: 10, scope: !104)
!106 = !DILocation(line: 57, column: 3, scope: !104)
!107 = !DILocation(line: 59, column: 1, scope: !69)
!108 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !70, file: !70, line: 77, type: !71, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "value", arg: 1, scope: !108, file: !70, line: 77, type: !6)
!110 = !DILocation(line: 77, column: 38, scope: !108)
!111 = !DILocalVariable(name: "factor", arg: 2, scope: !108, file: !70, line: 77, type: !29)
!112 = !DILocation(line: 77, column: 49, scope: !108)
!113 = !DILocalVariable(name: "s32MulTemp1", scope: !108, file: !70, line: 79, type: !20)
!114 = !DILocation(line: 79, column: 6, scope: !108)
!115 = !DILocalVariable(name: "s32MulTemp2", scope: !108, file: !70, line: 79, type: !20)
!116 = !DILocation(line: 79, column: 24, scope: !108)
!117 = !DILocation(line: 80, column: 16, scope: !108)
!118 = !DILocation(line: 80, column: 24, scope: !108)
!119 = !DILocation(line: 80, column: 22, scope: !108)
!120 = !DILocation(line: 80, column: 14, scope: !108)
!121 = !DILocation(line: 81, column: 16, scope: !108)
!122 = !DILocation(line: 81, column: 28, scope: !108)
!123 = !DILocation(line: 81, column: 14, scope: !108)
!124 = !DILocation(line: 82, column: 6, scope: !125)
!125 = distinct !DILexicalBlock(scope: !108, file: !70, line: 82, column: 5)
!126 = !DILocation(line: 82, column: 17, scope: !125)
!127 = !DILocation(line: 82, column: 21, scope: !125)
!128 = !DILocation(line: 82, column: 25, scope: !125)
!129 = !DILocation(line: 82, column: 37, scope: !125)
!130 = !DILocation(line: 82, column: 44, scope: !125)
!131 = !DILocation(line: 82, column: 5, scope: !108)
!132 = !DILocation(line: 84, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !70, line: 83, column: 2)
!134 = !DILocation(line: 84, column: 29, scope: !133)
!135 = !DILocation(line: 84, column: 15, scope: !133)
!136 = !DILocation(line: 85, column: 2, scope: !133)
!137 = !DILocation(line: 91, column: 5, scope: !138)
!138 = distinct !DILexicalBlock(scope: !108, file: !70, line: 91, column: 5)
!139 = !DILocation(line: 91, column: 17, scope: !138)
!140 = !DILocation(line: 91, column: 5, scope: !108)
!141 = !DILocation(line: 93, column: 6, scope: !142)
!142 = distinct !DILexicalBlock(scope: !143, file: !70, line: 93, column: 6)
!143 = distinct !DILexicalBlock(scope: !138, file: !70, line: 92, column: 2)
!144 = !DILocation(line: 93, column: 18, scope: !142)
!145 = !DILocation(line: 93, column: 6, scope: !143)
!146 = !DILocation(line: 95, column: 15, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !70, line: 94, column: 3)
!148 = !DILocation(line: 95, column: 11, scope: !147)
!149 = !DILocation(line: 95, column: 4, scope: !147)
!150 = !DILocation(line: 99, column: 4, scope: !151)
!151 = distinct !DILexicalBlock(scope: !142, file: !70, line: 98, column: 3)
!152 = !DILocation(line: 104, column: 3, scope: !153)
!153 = distinct !DILexicalBlock(scope: !138, file: !70, line: 103, column: 2)
!154 = !DILocation(line: 106, column: 1, scope: !108)
!155 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !70, file: !70, line: 123, type: !156, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!156 = !DISubroutineType(types: !157)
!157 = !{!6, !6, !24}
!158 = !DILocalVariable(name: "value", arg: 1, scope: !155, file: !70, line: 123, type: !6)
!159 = !DILocation(line: 123, column: 25, scope: !155)
!160 = !DILocalVariable(name: "factor", arg: 2, scope: !155, file: !70, line: 123, type: !24)
!161 = !DILocation(line: 123, column: 35, scope: !155)
!162 = !DILocalVariable(name: "s32MulTemp1", scope: !155, file: !70, line: 125, type: !20)
!163 = !DILocation(line: 125, column: 6, scope: !155)
!164 = !DILocalVariable(name: "s32MulTemp2", scope: !155, file: !70, line: 125, type: !20)
!165 = !DILocation(line: 125, column: 24, scope: !155)
!166 = !DILocation(line: 126, column: 16, scope: !155)
!167 = !DILocation(line: 126, column: 24, scope: !155)
!168 = !DILocation(line: 126, column: 22, scope: !155)
!169 = !DILocation(line: 126, column: 14, scope: !155)
!170 = !DILocation(line: 127, column: 16, scope: !155)
!171 = !DILocation(line: 127, column: 28, scope: !155)
!172 = !DILocation(line: 127, column: 14, scope: !155)
!173 = !DILocation(line: 128, column: 6, scope: !174)
!174 = distinct !DILexicalBlock(scope: !155, file: !70, line: 128, column: 5)
!175 = !DILocation(line: 128, column: 17, scope: !174)
!176 = !DILocation(line: 128, column: 21, scope: !174)
!177 = !DILocation(line: 128, column: 25, scope: !174)
!178 = !DILocation(line: 128, column: 37, scope: !174)
!179 = !DILocation(line: 128, column: 44, scope: !174)
!180 = !DILocation(line: 128, column: 5, scope: !155)
!181 = !DILocation(line: 130, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !174, file: !70, line: 129, column: 2)
!183 = !DILocation(line: 130, column: 29, scope: !182)
!184 = !DILocation(line: 130, column: 15, scope: !182)
!185 = !DILocation(line: 131, column: 14, scope: !182)
!186 = !DILocation(line: 131, column: 10, scope: !182)
!187 = !DILocation(line: 131, column: 3, scope: !182)
!188 = !DILocation(line: 135, column: 14, scope: !189)
!189 = distinct !DILexicalBlock(scope: !174, file: !70, line: 134, column: 2)
!190 = !DILocation(line: 135, column: 10, scope: !189)
!191 = !DILocation(line: 135, column: 3, scope: !189)
!192 = !DILocation(line: 137, column: 1, scope: !155)
!193 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !70, file: !70, line: 155, type: !156, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DILocalVariable(name: "value", arg: 1, scope: !193, file: !70, line: 155, type: !6)
!195 = !DILocation(line: 155, column: 25, scope: !193)
!196 = !DILocalVariable(name: "factor", arg: 2, scope: !193, file: !70, line: 155, type: !24)
!197 = !DILocation(line: 155, column: 35, scope: !193)
!198 = !DILocalVariable(name: "s32MulTemp1", scope: !193, file: !70, line: 157, type: !20)
!199 = !DILocation(line: 157, column: 6, scope: !193)
!200 = !DILocalVariable(name: "s32MulTemp2", scope: !193, file: !70, line: 157, type: !20)
!201 = !DILocation(line: 157, column: 24, scope: !193)
!202 = !DILocation(line: 158, column: 16, scope: !193)
!203 = !DILocation(line: 158, column: 24, scope: !193)
!204 = !DILocation(line: 158, column: 22, scope: !193)
!205 = !DILocation(line: 158, column: 14, scope: !193)
!206 = !DILocation(line: 159, column: 16, scope: !193)
!207 = !DILocation(line: 159, column: 28, scope: !193)
!208 = !DILocation(line: 159, column: 14, scope: !193)
!209 = !DILocation(line: 160, column: 6, scope: !210)
!210 = distinct !DILexicalBlock(scope: !193, file: !70, line: 160, column: 5)
!211 = !DILocation(line: 160, column: 17, scope: !210)
!212 = !DILocation(line: 160, column: 21, scope: !210)
!213 = !DILocation(line: 160, column: 25, scope: !210)
!214 = !DILocation(line: 160, column: 37, scope: !210)
!215 = !DILocation(line: 160, column: 44, scope: !210)
!216 = !DILocation(line: 160, column: 5, scope: !193)
!217 = !DILocation(line: 162, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !210, file: !70, line: 161, column: 2)
!219 = !DILocation(line: 162, column: 29, scope: !218)
!220 = !DILocation(line: 162, column: 15, scope: !218)
!221 = !DILocation(line: 163, column: 2, scope: !218)
!222 = !DILocation(line: 169, column: 5, scope: !223)
!223 = distinct !DILexicalBlock(scope: !193, file: !70, line: 169, column: 5)
!224 = !DILocation(line: 169, column: 17, scope: !223)
!225 = !DILocation(line: 169, column: 5, scope: !193)
!226 = !DILocation(line: 171, column: 6, scope: !227)
!227 = distinct !DILexicalBlock(scope: !228, file: !70, line: 171, column: 6)
!228 = distinct !DILexicalBlock(scope: !223, file: !70, line: 170, column: 2)
!229 = !DILocation(line: 171, column: 18, scope: !227)
!230 = !DILocation(line: 171, column: 6, scope: !228)
!231 = !DILocation(line: 173, column: 15, scope: !232)
!232 = distinct !DILexicalBlock(scope: !227, file: !70, line: 172, column: 3)
!233 = !DILocation(line: 173, column: 11, scope: !232)
!234 = !DILocation(line: 173, column: 4, scope: !232)
!235 = !DILocation(line: 177, column: 4, scope: !236)
!236 = distinct !DILexicalBlock(scope: !227, file: !70, line: 176, column: 3)
!237 = !DILocation(line: 182, column: 3, scope: !238)
!238 = distinct !DILexicalBlock(scope: !223, file: !70, line: 181, column: 2)
!239 = !DILocation(line: 184, column: 1, scope: !193)
!240 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !70, file: !70, line: 200, type: !241, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!241 = !DISubroutineType(types: !242)
!242 = !{!13, !13, !13, !20}
!243 = !DILocalVariable(name: "value", arg: 1, scope: !240, file: !70, line: 200, type: !13)
!244 = !DILocation(line: 200, column: 40, scope: !240)
!245 = !DILocalVariable(name: "factor", arg: 2, scope: !240, file: !70, line: 200, type: !13)
!246 = !DILocation(line: 200, column: 51, scope: !240)
!247 = !DILocalVariable(name: "count", arg: 3, scope: !240, file: !70, line: 200, type: !20)
!248 = !DILocation(line: 200, column: 63, scope: !240)
!249 = !DILocalVariable(name: "s32MulTemp", scope: !240, file: !70, line: 202, type: !20)
!250 = !DILocation(line: 202, column: 6, scope: !240)
!251 = !DILocation(line: 203, column: 15, scope: !240)
!252 = !DILocation(line: 203, column: 23, scope: !240)
!253 = !DILocation(line: 203, column: 21, scope: !240)
!254 = !DILocation(line: 203, column: 13, scope: !240)
!255 = !DILocation(line: 204, column: 15, scope: !240)
!256 = !DILocation(line: 204, column: 26, scope: !240)
!257 = !DILocation(line: 204, column: 25, scope: !240)
!258 = !{!"True"}
!259 = !DILocation(line: 204, column: 13, scope: !240)
!260 = !DILocation(line: 205, column: 9, scope: !240)
!261 = !DILocation(line: 205, column: 2, scope: !240)
!262 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !70, file: !70, line: 223, type: !241, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!263 = !DILocalVariable(name: "value", arg: 1, scope: !262, file: !70, line: 223, type: !13)
!264 = !DILocation(line: 223, column: 43, scope: !262)
!265 = !DILocalVariable(name: "factor", arg: 2, scope: !262, file: !70, line: 223, type: !13)
!266 = !DILocation(line: 223, column: 54, scope: !262)
!267 = !DILocalVariable(name: "count", arg: 3, scope: !262, file: !70, line: 223, type: !20)
!268 = !DILocation(line: 223, column: 66, scope: !262)
!269 = !DILocalVariable(name: "s32MulTemp", scope: !262, file: !70, line: 225, type: !20)
!270 = !DILocation(line: 225, column: 6, scope: !262)
!271 = !DILocation(line: 226, column: 15, scope: !262)
!272 = !DILocation(line: 226, column: 23, scope: !262)
!273 = !DILocation(line: 226, column: 21, scope: !262)
!274 = !DILocation(line: 226, column: 13, scope: !262)
!275 = !DILocation(line: 227, column: 15, scope: !262)
!276 = !DILocation(line: 227, column: 26, scope: !262)
!277 = !DILocation(line: 227, column: 25, scope: !262)
!278 = !DILocation(line: 227, column: 13, scope: !262)
!279 = !DILocation(line: 228, column: 5, scope: !280)
!280 = distinct !DILexicalBlock(scope: !262, file: !70, line: 228, column: 5)
!281 = !DILocation(line: 228, column: 16, scope: !280)
!282 = !DILocation(line: 228, column: 5, scope: !262)
!283 = !DILocation(line: 230, column: 6, scope: !284)
!284 = distinct !DILexicalBlock(scope: !285, file: !70, line: 230, column: 6)
!285 = distinct !DILexicalBlock(scope: !280, file: !70, line: 229, column: 2)
!286 = !DILocation(line: 230, column: 17, scope: !284)
!287 = !DILocation(line: 230, column: 6, scope: !285)
!288 = !DILocation(line: 232, column: 16, scope: !289)
!289 = distinct !DILexicalBlock(scope: !284, file: !70, line: 231, column: 3)
!290 = !DILocation(line: 232, column: 11, scope: !289)
!291 = !DILocation(line: 232, column: 4, scope: !289)
!292 = !DILocation(line: 236, column: 4, scope: !293)
!293 = distinct !DILexicalBlock(scope: !284, file: !70, line: 235, column: 3)
!294 = !DILocation(line: 241, column: 3, scope: !295)
!295 = distinct !DILexicalBlock(scope: !280, file: !70, line: 240, column: 2)
!296 = !DILocation(line: 243, column: 1, scope: !262)
!297 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !70, file: !70, line: 262, type: !298, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!298 = !DISubroutineType(types: !299)
!299 = !{!13, !13, !13}
!300 = !DILocalVariable(name: "value", arg: 1, scope: !297, file: !70, line: 262, type: !13)
!301 = !DILocation(line: 262, column: 30, scope: !297)
!302 = !DILocalVariable(name: "factor", arg: 2, scope: !297, file: !70, line: 262, type: !13)
!303 = !DILocation(line: 262, column: 41, scope: !297)
!304 = !DILocalVariable(name: "s32MulTemp1", scope: !297, file: !70, line: 264, type: !20)
!305 = !DILocation(line: 264, column: 6, scope: !297)
!306 = !DILocalVariable(name: "s32MulTemp2", scope: !297, file: !70, line: 264, type: !20)
!307 = !DILocation(line: 264, column: 24, scope: !297)
!308 = !DILocation(line: 265, column: 16, scope: !297)
!309 = !DILocation(line: 265, column: 24, scope: !297)
!310 = !DILocation(line: 265, column: 22, scope: !297)
!311 = !DILocation(line: 265, column: 14, scope: !297)
!312 = !DILocation(line: 266, column: 16, scope: !297)
!313 = !DILocation(line: 266, column: 28, scope: !297)
!314 = !DILocation(line: 266, column: 14, scope: !297)
!315 = !DILocation(line: 267, column: 6, scope: !316)
!316 = distinct !DILexicalBlock(scope: !297, file: !70, line: 267, column: 5)
!317 = !DILocation(line: 267, column: 17, scope: !316)
!318 = !DILocation(line: 267, column: 21, scope: !316)
!319 = !DILocation(line: 267, column: 25, scope: !316)
!320 = !DILocation(line: 267, column: 37, scope: !316)
!321 = !DILocation(line: 267, column: 46, scope: !316)
!322 = !DILocation(line: 267, column: 5, scope: !297)
!323 = !DILocation(line: 269, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !316, file: !70, line: 268, column: 2)
!325 = !DILocation(line: 269, column: 29, scope: !324)
!326 = !DILocation(line: 269, column: 15, scope: !324)
!327 = !DILocation(line: 271, column: 2, scope: !324)
!328 = !DILocation(line: 277, column: 5, scope: !329)
!329 = distinct !DILexicalBlock(scope: !297, file: !70, line: 277, column: 5)
!330 = !DILocation(line: 277, column: 17, scope: !329)
!331 = !DILocation(line: 277, column: 5, scope: !297)
!332 = !DILocation(line: 279, column: 15, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !70, line: 278, column: 2)
!334 = !DILocation(line: 279, column: 10, scope: !333)
!335 = !DILocation(line: 279, column: 3, scope: !333)
!336 = !DILocation(line: 283, column: 3, scope: !337)
!337 = distinct !DILexicalBlock(scope: !329, file: !70, line: 282, column: 2)
!338 = !DILocation(line: 285, column: 1, scope: !297)
!339 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !70, file: !70, line: 304, type: !298, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!340 = !DILocalVariable(name: "value", arg: 1, scope: !339, file: !70, line: 304, type: !13)
!341 = !DILocation(line: 304, column: 30, scope: !339)
!342 = !DILocalVariable(name: "factor", arg: 2, scope: !339, file: !70, line: 304, type: !13)
!343 = !DILocation(line: 304, column: 41, scope: !339)
!344 = !DILocalVariable(name: "s32MulTemp1", scope: !339, file: !70, line: 306, type: !20)
!345 = !DILocation(line: 306, column: 6, scope: !339)
!346 = !DILocalVariable(name: "s32MulTemp2", scope: !339, file: !70, line: 306, type: !20)
!347 = !DILocation(line: 306, column: 24, scope: !339)
!348 = !DILocation(line: 307, column: 16, scope: !339)
!349 = !DILocation(line: 307, column: 24, scope: !339)
!350 = !DILocation(line: 307, column: 22, scope: !339)
!351 = !DILocation(line: 307, column: 14, scope: !339)
!352 = !DILocation(line: 308, column: 16, scope: !339)
!353 = !DILocation(line: 308, column: 28, scope: !339)
!354 = !DILocation(line: 308, column: 14, scope: !339)
!355 = !DILocation(line: 309, column: 6, scope: !356)
!356 = distinct !DILexicalBlock(scope: !339, file: !70, line: 309, column: 5)
!357 = !DILocation(line: 309, column: 17, scope: !356)
!358 = !DILocation(line: 309, column: 21, scope: !356)
!359 = !DILocation(line: 309, column: 25, scope: !356)
!360 = !DILocation(line: 309, column: 37, scope: !356)
!361 = !DILocation(line: 309, column: 46, scope: !356)
!362 = !DILocation(line: 309, column: 5, scope: !339)
!363 = !DILocation(line: 311, column: 17, scope: !364)
!364 = distinct !DILexicalBlock(scope: !356, file: !70, line: 310, column: 2)
!365 = !DILocation(line: 311, column: 29, scope: !364)
!366 = !DILocation(line: 311, column: 15, scope: !364)
!367 = !DILocation(line: 312, column: 2, scope: !364)
!368 = !DILocation(line: 318, column: 6, scope: !369)
!369 = distinct !DILexicalBlock(scope: !339, file: !70, line: 318, column: 6)
!370 = !DILocation(line: 318, column: 18, scope: !369)
!371 = !DILocation(line: 318, column: 6, scope: !339)
!372 = !DILocation(line: 320, column: 6, scope: !373)
!373 = distinct !DILexicalBlock(scope: !374, file: !70, line: 320, column: 6)
!374 = distinct !DILexicalBlock(scope: !369, file: !70, line: 319, column: 2)
!375 = !DILocation(line: 320, column: 18, scope: !373)
!376 = !DILocation(line: 320, column: 6, scope: !374)
!377 = !DILocation(line: 322, column: 16, scope: !378)
!378 = distinct !DILexicalBlock(scope: !373, file: !70, line: 321, column: 3)
!379 = !DILocation(line: 322, column: 11, scope: !378)
!380 = !DILocation(line: 322, column: 4, scope: !378)
!381 = !DILocation(line: 326, column: 4, scope: !382)
!382 = distinct !DILexicalBlock(scope: !373, file: !70, line: 325, column: 3)
!383 = !DILocation(line: 331, column: 3, scope: !384)
!384 = distinct !DILexicalBlock(scope: !369, file: !70, line: 330, column: 2)
!385 = !DILocation(line: 333, column: 1, scope: !339)
!386 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !70, file: !70, line: 350, type: !387, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!387 = !DISubroutineType(types: !388)
!388 = !{!13, !13, !29}
!389 = !DILocalVariable(name: "value", arg: 1, scope: !386, file: !70, line: 350, type: !13)
!390 = !DILocation(line: 350, column: 39, scope: !386)
!391 = !DILocalVariable(name: "factor", arg: 2, scope: !386, file: !70, line: 350, type: !29)
!392 = !DILocation(line: 350, column: 50, scope: !386)
!393 = !DILocalVariable(name: "s32MulTemp1", scope: !386, file: !70, line: 352, type: !20)
!394 = !DILocation(line: 352, column: 6, scope: !386)
!395 = !DILocalVariable(name: "s32MulTemp2", scope: !386, file: !70, line: 352, type: !20)
!396 = !DILocation(line: 352, column: 24, scope: !386)
!397 = !DILocation(line: 353, column: 16, scope: !386)
!398 = !DILocation(line: 353, column: 24, scope: !386)
!399 = !DILocation(line: 353, column: 22, scope: !386)
!400 = !DILocation(line: 353, column: 14, scope: !386)
!401 = !DILocation(line: 354, column: 16, scope: !386)
!402 = !DILocation(line: 354, column: 28, scope: !386)
!403 = !DILocation(line: 354, column: 14, scope: !386)
!404 = !DILocation(line: 355, column: 6, scope: !405)
!405 = distinct !DILexicalBlock(scope: !386, file: !70, line: 355, column: 5)
!406 = !DILocation(line: 355, column: 17, scope: !405)
!407 = !DILocation(line: 355, column: 21, scope: !405)
!408 = !DILocation(line: 355, column: 25, scope: !405)
!409 = !DILocation(line: 355, column: 37, scope: !405)
!410 = !DILocation(line: 355, column: 46, scope: !405)
!411 = !DILocation(line: 355, column: 5, scope: !386)
!412 = !DILocation(line: 361, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !405, file: !70, line: 360, column: 2)
!414 = !DILocation(line: 361, column: 29, scope: !413)
!415 = !DILocation(line: 361, column: 15, scope: !413)
!416 = !DILocation(line: 362, column: 15, scope: !413)
!417 = !DILocation(line: 362, column: 10, scope: !413)
!418 = !DILocation(line: 362, column: 3, scope: !413)
!419 = !DILocation(line: 366, column: 15, scope: !420)
!420 = distinct !DILexicalBlock(scope: !405, file: !70, line: 365, column: 2)
!421 = !DILocation(line: 366, column: 10, scope: !420)
!422 = !DILocation(line: 366, column: 3, scope: !420)
!423 = !DILocation(line: 368, column: 1, scope: !386)
!424 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !70, file: !70, line: 386, type: !387, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!425 = !DILocalVariable(name: "value", arg: 1, scope: !424, file: !70, line: 386, type: !13)
!426 = !DILocation(line: 386, column: 42, scope: !424)
!427 = !DILocalVariable(name: "factor", arg: 2, scope: !424, file: !70, line: 386, type: !29)
!428 = !DILocation(line: 386, column: 53, scope: !424)
!429 = !DILocalVariable(name: "s32MulTemp1", scope: !424, file: !70, line: 388, type: !20)
!430 = !DILocation(line: 388, column: 6, scope: !424)
!431 = !DILocalVariable(name: "s32MulTemp2", scope: !424, file: !70, line: 388, type: !20)
!432 = !DILocation(line: 388, column: 24, scope: !424)
!433 = !DILocation(line: 389, column: 16, scope: !424)
!434 = !DILocation(line: 389, column: 24, scope: !424)
!435 = !DILocation(line: 389, column: 22, scope: !424)
!436 = !DILocation(line: 389, column: 14, scope: !424)
!437 = !DILocation(line: 390, column: 16, scope: !424)
!438 = !DILocation(line: 390, column: 28, scope: !424)
!439 = !DILocation(line: 390, column: 14, scope: !424)
!440 = !DILocation(line: 391, column: 6, scope: !441)
!441 = distinct !DILexicalBlock(scope: !424, file: !70, line: 391, column: 5)
!442 = !DILocation(line: 391, column: 17, scope: !441)
!443 = !DILocation(line: 391, column: 21, scope: !441)
!444 = !DILocation(line: 391, column: 25, scope: !441)
!445 = !DILocation(line: 391, column: 37, scope: !441)
!446 = !DILocation(line: 391, column: 44, scope: !441)
!447 = !DILocation(line: 391, column: 5, scope: !424)
!448 = !DILocation(line: 398, column: 17, scope: !449)
!449 = distinct !DILexicalBlock(scope: !441, file: !70, line: 397, column: 2)
!450 = !DILocation(line: 398, column: 29, scope: !449)
!451 = !DILocation(line: 398, column: 15, scope: !449)
!452 = !DILocation(line: 399, column: 2, scope: !449)
!453 = !DILocation(line: 404, column: 5, scope: !454)
!454 = distinct !DILexicalBlock(scope: !424, file: !70, line: 404, column: 5)
!455 = !DILocation(line: 404, column: 17, scope: !454)
!456 = !DILocation(line: 404, column: 5, scope: !424)
!457 = !DILocation(line: 406, column: 6, scope: !458)
!458 = distinct !DILexicalBlock(scope: !459, file: !70, line: 406, column: 6)
!459 = distinct !DILexicalBlock(scope: !454, file: !70, line: 405, column: 2)
!460 = !DILocation(line: 406, column: 18, scope: !458)
!461 = !DILocation(line: 406, column: 6, scope: !459)
!462 = !DILocation(line: 408, column: 16, scope: !463)
!463 = distinct !DILexicalBlock(scope: !458, file: !70, line: 407, column: 3)
!464 = !DILocation(line: 408, column: 11, scope: !463)
!465 = !DILocation(line: 408, column: 4, scope: !463)
!466 = !DILocation(line: 412, column: 4, scope: !467)
!467 = distinct !DILexicalBlock(scope: !458, file: !70, line: 411, column: 3)
!468 = !DILocation(line: 417, column: 3, scope: !469)
!469 = distinct !DILexicalBlock(scope: !454, file: !70, line: 416, column: 2)
!470 = !DILocation(line: 419, column: 1, scope: !424)
!471 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !70, file: !70, line: 436, type: !472, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!472 = !DISubroutineType(types: !473)
!473 = !{!13, !13, !24}
!474 = !DILocalVariable(name: "value", arg: 1, scope: !471, file: !70, line: 436, type: !13)
!475 = !DILocation(line: 436, column: 29, scope: !471)
!476 = !DILocalVariable(name: "factor", arg: 2, scope: !471, file: !70, line: 436, type: !24)
!477 = !DILocation(line: 436, column: 39, scope: !471)
!478 = !DILocalVariable(name: "s32MulTemp1", scope: !471, file: !70, line: 438, type: !20)
!479 = !DILocation(line: 438, column: 6, scope: !471)
!480 = !DILocalVariable(name: "s32MulTemp2", scope: !471, file: !70, line: 438, type: !20)
!481 = !DILocation(line: 438, column: 24, scope: !471)
!482 = !DILocation(line: 439, column: 16, scope: !471)
!483 = !DILocation(line: 439, column: 24, scope: !471)
!484 = !DILocation(line: 439, column: 22, scope: !471)
!485 = !DILocation(line: 439, column: 14, scope: !471)
!486 = !DILocation(line: 440, column: 16, scope: !471)
!487 = !DILocation(line: 440, column: 28, scope: !471)
!488 = !DILocation(line: 440, column: 14, scope: !471)
!489 = !DILocation(line: 441, column: 6, scope: !490)
!490 = distinct !DILexicalBlock(scope: !471, file: !70, line: 441, column: 5)
!491 = !DILocation(line: 441, column: 17, scope: !490)
!492 = !DILocation(line: 441, column: 21, scope: !490)
!493 = !DILocation(line: 441, column: 25, scope: !490)
!494 = !DILocation(line: 441, column: 37, scope: !490)
!495 = !DILocation(line: 441, column: 44, scope: !490)
!496 = !DILocation(line: 441, column: 5, scope: !471)
!497 = !DILocation(line: 448, column: 17, scope: !498)
!498 = distinct !DILexicalBlock(scope: !490, file: !70, line: 447, column: 2)
!499 = !DILocation(line: 448, column: 29, scope: !498)
!500 = !DILocation(line: 448, column: 15, scope: !498)
!501 = !DILocation(line: 449, column: 10, scope: !498)
!502 = !DILocation(line: 449, column: 3, scope: !498)
!503 = !DILocation(line: 453, column: 10, scope: !504)
!504 = distinct !DILexicalBlock(scope: !490, file: !70, line: 452, column: 2)
!505 = !DILocation(line: 453, column: 3, scope: !504)
!506 = !DILocation(line: 455, column: 1, scope: !471)
!507 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !70, file: !70, line: 473, type: !472, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!508 = !DILocalVariable(name: "value", arg: 1, scope: !507, file: !70, line: 473, type: !13)
!509 = !DILocation(line: 473, column: 29, scope: !507)
!510 = !DILocalVariable(name: "factor", arg: 2, scope: !507, file: !70, line: 473, type: !24)
!511 = !DILocation(line: 473, column: 39, scope: !507)
!512 = !DILocalVariable(name: "s32MulTemp1", scope: !507, file: !70, line: 475, type: !20)
!513 = !DILocation(line: 475, column: 6, scope: !507)
!514 = !DILocalVariable(name: "s32MulTemp2", scope: !507, file: !70, line: 475, type: !20)
!515 = !DILocation(line: 475, column: 24, scope: !507)
!516 = !DILocation(line: 476, column: 16, scope: !507)
!517 = !DILocation(line: 476, column: 24, scope: !507)
!518 = !DILocation(line: 476, column: 22, scope: !507)
!519 = !DILocation(line: 476, column: 14, scope: !507)
!520 = !DILocation(line: 477, column: 16, scope: !507)
!521 = !DILocation(line: 477, column: 28, scope: !507)
!522 = !DILocation(line: 477, column: 14, scope: !507)
!523 = !DILocation(line: 478, column: 6, scope: !524)
!524 = distinct !DILexicalBlock(scope: !507, file: !70, line: 478, column: 5)
!525 = !DILocation(line: 478, column: 17, scope: !524)
!526 = !DILocation(line: 478, column: 21, scope: !524)
!527 = !DILocation(line: 478, column: 25, scope: !524)
!528 = !DILocation(line: 478, column: 37, scope: !524)
!529 = !DILocation(line: 478, column: 44, scope: !524)
!530 = !DILocation(line: 478, column: 5, scope: !507)
!531 = !DILocation(line: 484, column: 17, scope: !532)
!532 = distinct !DILexicalBlock(scope: !524, file: !70, line: 483, column: 2)
!533 = !DILocation(line: 484, column: 29, scope: !532)
!534 = !DILocation(line: 484, column: 15, scope: !532)
!535 = !DILocation(line: 485, column: 2, scope: !532)
!536 = !DILocation(line: 491, column: 6, scope: !537)
!537 = distinct !DILexicalBlock(scope: !507, file: !70, line: 491, column: 6)
!538 = !DILocation(line: 491, column: 18, scope: !537)
!539 = !DILocation(line: 491, column: 6, scope: !507)
!540 = !DILocation(line: 493, column: 6, scope: !541)
!541 = distinct !DILexicalBlock(scope: !542, file: !70, line: 493, column: 6)
!542 = distinct !DILexicalBlock(scope: !537, file: !70, line: 492, column: 2)
!543 = !DILocation(line: 493, column: 18, scope: !541)
!544 = !DILocation(line: 493, column: 6, scope: !542)
!545 = !DILocation(line: 495, column: 16, scope: !546)
!546 = distinct !DILexicalBlock(scope: !541, file: !70, line: 494, column: 3)
!547 = !DILocation(line: 495, column: 11, scope: !546)
!548 = !DILocation(line: 495, column: 4, scope: !546)
!549 = !DILocation(line: 499, column: 4, scope: !550)
!550 = distinct !DILexicalBlock(scope: !541, file: !70, line: 498, column: 3)
!551 = !DILocation(line: 504, column: 3, scope: !552)
!552 = distinct !DILexicalBlock(scope: !537, file: !70, line: 503, column: 2)
!553 = !DILocation(line: 506, column: 1, scope: !507)
!554 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !70, file: !70, line: 521, type: !387, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!555 = !DILocalVariable(name: "value", arg: 1, scope: !554, file: !70, line: 521, type: !13)
!556 = !DILocation(line: 521, column: 25, scope: !554)
!557 = !DILocalVariable(name: "factor", arg: 2, scope: !554, file: !70, line: 521, type: !29)
!558 = !DILocation(line: 521, column: 36, scope: !554)
!559 = !DILocalVariable(name: "s32MulTemp", scope: !554, file: !70, line: 523, type: !20)
!560 = !DILocation(line: 523, column: 6, scope: !554)
!561 = !DILocation(line: 524, column: 15, scope: !554)
!562 = !DILocation(line: 524, column: 23, scope: !554)
!563 = !DILocation(line: 524, column: 21, scope: !554)
!564 = !DILocation(line: 524, column: 13, scope: !554)
!565 = !DILocation(line: 525, column: 5, scope: !566)
!566 = distinct !DILexicalBlock(scope: !554, file: !70, line: 525, column: 5)
!567 = !DILocation(line: 525, column: 16, scope: !566)
!568 = !DILocation(line: 525, column: 5, scope: !554)
!569 = !DILocation(line: 527, column: 6, scope: !570)
!570 = distinct !DILexicalBlock(scope: !571, file: !70, line: 527, column: 6)
!571 = distinct !DILexicalBlock(scope: !566, file: !70, line: 526, column: 2)
!572 = !DILocation(line: 527, column: 17, scope: !570)
!573 = !DILocation(line: 527, column: 6, scope: !571)
!574 = !DILocation(line: 529, column: 16, scope: !575)
!575 = distinct !DILexicalBlock(scope: !570, file: !70, line: 528, column: 3)
!576 = !DILocation(line: 529, column: 11, scope: !575)
!577 = !DILocation(line: 529, column: 4, scope: !575)
!578 = !DILocation(line: 533, column: 4, scope: !579)
!579 = distinct !DILexicalBlock(scope: !570, file: !70, line: 532, column: 3)
!580 = !DILocation(line: 538, column: 3, scope: !581)
!581 = distinct !DILexicalBlock(scope: !566, file: !70, line: 537, column: 2)
!582 = !DILocation(line: 540, column: 1, scope: !554)
!583 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !70, file: !70, line: 556, type: !584, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!584 = !DISubroutineType(types: !585)
!585 = !{!13, !13, !29, !20}
!586 = !DILocalVariable(name: "value", arg: 1, scope: !583, file: !70, line: 556, type: !13)
!587 = !DILocation(line: 556, column: 40, scope: !583)
!588 = !DILocalVariable(name: "factor", arg: 2, scope: !583, file: !70, line: 556, type: !29)
!589 = !DILocation(line: 556, column: 50, scope: !583)
!590 = !DILocalVariable(name: "count", arg: 3, scope: !583, file: !70, line: 556, type: !20)
!591 = !DILocation(line: 556, column: 61, scope: !583)
!592 = !DILocalVariable(name: "s32MulTemp", scope: !583, file: !70, line: 558, type: !20)
!593 = !DILocation(line: 558, column: 6, scope: !583)
!594 = !DILocation(line: 559, column: 15, scope: !583)
!595 = !DILocation(line: 559, column: 23, scope: !583)
!596 = !DILocation(line: 559, column: 21, scope: !583)
!597 = !DILocation(line: 559, column: 13, scope: !583)
!598 = !DILocation(line: 560, column: 15, scope: !583)
!599 = !DILocation(line: 560, column: 26, scope: !583)
!600 = !DILocation(line: 560, column: 25, scope: !583)
!601 = !DILocation(line: 560, column: 13, scope: !583)
!602 = !DILocation(line: 561, column: 14, scope: !583)
!603 = !DILocation(line: 561, column: 9, scope: !583)
!604 = !DILocation(line: 561, column: 2, scope: !583)
!605 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !70, file: !70, line: 580, type: !606, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!606 = !DISubroutineType(types: !607)
!607 = !{!13, !13, !29, !29}
!608 = !DILocalVariable(name: "value", arg: 1, scope: !605, file: !70, line: 580, type: !13)
!609 = !DILocation(line: 580, column: 43, scope: !605)
!610 = !DILocalVariable(name: "factor", arg: 2, scope: !605, file: !70, line: 580, type: !29)
!611 = !DILocation(line: 580, column: 53, scope: !605)
!612 = !DILocalVariable(name: "count", arg: 3, scope: !605, file: !70, line: 580, type: !29)
!613 = !DILocation(line: 580, column: 64, scope: !605)
!614 = !DILocalVariable(name: "s32MulTemp", scope: !605, file: !70, line: 582, type: !20)
!615 = !DILocation(line: 582, column: 6, scope: !605)
!616 = !DILocation(line: 583, column: 15, scope: !605)
!617 = !DILocation(line: 583, column: 23, scope: !605)
!618 = !DILocation(line: 583, column: 21, scope: !605)
!619 = !DILocation(line: 583, column: 13, scope: !605)
!620 = !DILocation(line: 584, column: 15, scope: !605)
!621 = !DILocation(line: 584, column: 26, scope: !605)
!622 = !DILocation(line: 584, column: 25, scope: !605)
!623 = !DILocation(line: 584, column: 13, scope: !605)
!624 = !DILocation(line: 585, column: 5, scope: !625)
!625 = distinct !DILexicalBlock(scope: !605, file: !70, line: 585, column: 5)
!626 = !DILocation(line: 585, column: 16, scope: !625)
!627 = !DILocation(line: 585, column: 5, scope: !605)
!628 = !DILocation(line: 587, column: 6, scope: !629)
!629 = distinct !DILexicalBlock(scope: !630, file: !70, line: 587, column: 6)
!630 = distinct !DILexicalBlock(scope: !625, file: !70, line: 586, column: 2)
!631 = !DILocation(line: 587, column: 17, scope: !629)
!632 = !DILocation(line: 587, column: 6, scope: !630)
!633 = !DILocation(line: 589, column: 16, scope: !634)
!634 = distinct !DILexicalBlock(scope: !629, file: !70, line: 588, column: 3)
!635 = !DILocation(line: 589, column: 11, scope: !634)
!636 = !DILocation(line: 589, column: 4, scope: !634)
!637 = !DILocation(line: 593, column: 4, scope: !638)
!638 = distinct !DILexicalBlock(scope: !629, file: !70, line: 592, column: 3)
!639 = !DILocation(line: 598, column: 3, scope: !640)
!640 = distinct !DILexicalBlock(scope: !625, file: !70, line: 597, column: 2)
!641 = !DILocation(line: 600, column: 1, scope: !605)
!642 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !70, file: !70, line: 617, type: !387, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!643 = !DILocalVariable(name: "value", arg: 1, scope: !642, file: !70, line: 617, type: !13)
!644 = !DILocation(line: 617, column: 31, scope: !642)
!645 = !DILocalVariable(name: "factor", arg: 2, scope: !642, file: !70, line: 617, type: !29)
!646 = !DILocation(line: 617, column: 42, scope: !642)
!647 = !DILocalVariable(name: "s32MulTemp1", scope: !642, file: !70, line: 619, type: !20)
!648 = !DILocation(line: 619, column: 6, scope: !642)
!649 = !DILocalVariable(name: "s32MulTemp2", scope: !642, file: !70, line: 619, type: !20)
!650 = !DILocation(line: 619, column: 24, scope: !642)
!651 = !DILocation(line: 620, column: 16, scope: !642)
!652 = !DILocation(line: 620, column: 24, scope: !642)
!653 = !DILocation(line: 620, column: 22, scope: !642)
!654 = !DILocation(line: 620, column: 14, scope: !642)
!655 = !DILocation(line: 621, column: 16, scope: !642)
!656 = !DILocation(line: 621, column: 28, scope: !642)
!657 = !DILocation(line: 621, column: 14, scope: !642)
!658 = !DILocation(line: 622, column: 6, scope: !659)
!659 = distinct !DILexicalBlock(scope: !642, file: !70, line: 622, column: 5)
!660 = !DILocation(line: 622, column: 17, scope: !659)
!661 = !DILocation(line: 622, column: 21, scope: !659)
!662 = !DILocation(line: 622, column: 25, scope: !659)
!663 = !DILocation(line: 622, column: 37, scope: !659)
!664 = !DILocation(line: 622, column: 46, scope: !659)
!665 = !DILocation(line: 622, column: 5, scope: !642)
!666 = !DILocation(line: 629, column: 17, scope: !667)
!667 = distinct !DILexicalBlock(scope: !659, file: !70, line: 628, column: 2)
!668 = !DILocation(line: 629, column: 29, scope: !667)
!669 = !DILocation(line: 629, column: 15, scope: !667)
!670 = !DILocation(line: 630, column: 15, scope: !667)
!671 = !DILocation(line: 630, column: 10, scope: !667)
!672 = !DILocation(line: 630, column: 3, scope: !667)
!673 = !DILocation(line: 634, column: 15, scope: !674)
!674 = distinct !DILexicalBlock(scope: !659, file: !70, line: 633, column: 2)
!675 = !DILocation(line: 634, column: 10, scope: !674)
!676 = !DILocation(line: 634, column: 3, scope: !674)
!677 = !DILocation(line: 636, column: 1, scope: !642)
!678 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !70, file: !70, line: 654, type: !387, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!679 = !DILocalVariable(name: "value", arg: 1, scope: !678, file: !70, line: 654, type: !13)
!680 = !DILocation(line: 654, column: 31, scope: !678)
!681 = !DILocalVariable(name: "factor", arg: 2, scope: !678, file: !70, line: 654, type: !29)
!682 = !DILocation(line: 654, column: 42, scope: !678)
!683 = !DILocalVariable(name: "s32MulTemp1", scope: !678, file: !70, line: 656, type: !20)
!684 = !DILocation(line: 656, column: 6, scope: !678)
!685 = !DILocalVariable(name: "s32MulTemp2", scope: !678, file: !70, line: 656, type: !20)
!686 = !DILocation(line: 656, column: 24, scope: !678)
!687 = !DILocation(line: 657, column: 16, scope: !678)
!688 = !DILocation(line: 657, column: 24, scope: !678)
!689 = !DILocation(line: 657, column: 22, scope: !678)
!690 = !DILocation(line: 657, column: 14, scope: !678)
!691 = !DILocation(line: 658, column: 16, scope: !678)
!692 = !DILocation(line: 658, column: 28, scope: !678)
!693 = !DILocation(line: 658, column: 14, scope: !678)
!694 = !DILocation(line: 659, column: 6, scope: !695)
!695 = distinct !DILexicalBlock(scope: !678, file: !70, line: 659, column: 5)
!696 = !DILocation(line: 659, column: 17, scope: !695)
!697 = !DILocation(line: 659, column: 21, scope: !695)
!698 = !DILocation(line: 659, column: 25, scope: !695)
!699 = !DILocation(line: 659, column: 37, scope: !695)
!700 = !DILocation(line: 659, column: 46, scope: !695)
!701 = !DILocation(line: 659, column: 5, scope: !678)
!702 = !DILocation(line: 665, column: 17, scope: !703)
!703 = distinct !DILexicalBlock(scope: !695, file: !70, line: 664, column: 2)
!704 = !DILocation(line: 665, column: 29, scope: !703)
!705 = !DILocation(line: 665, column: 15, scope: !703)
!706 = !DILocation(line: 666, column: 2, scope: !703)
!707 = !DILocation(line: 672, column: 6, scope: !708)
!708 = distinct !DILexicalBlock(scope: !678, file: !70, line: 672, column: 6)
!709 = !DILocation(line: 672, column: 18, scope: !708)
!710 = !DILocation(line: 672, column: 6, scope: !678)
!711 = !DILocation(line: 674, column: 6, scope: !712)
!712 = distinct !DILexicalBlock(scope: !713, file: !70, line: 674, column: 6)
!713 = distinct !DILexicalBlock(scope: !708, file: !70, line: 673, column: 2)
!714 = !DILocation(line: 674, column: 18, scope: !712)
!715 = !DILocation(line: 674, column: 6, scope: !713)
!716 = !DILocation(line: 676, column: 16, scope: !717)
!717 = distinct !DILexicalBlock(scope: !712, file: !70, line: 675, column: 3)
!718 = !DILocation(line: 676, column: 11, scope: !717)
!719 = !DILocation(line: 676, column: 4, scope: !717)
!720 = !DILocation(line: 680, column: 4, scope: !721)
!721 = distinct !DILexicalBlock(scope: !712, file: !70, line: 679, column: 3)
!722 = !DILocation(line: 685, column: 3, scope: !723)
!723 = distinct !DILexicalBlock(scope: !708, file: !70, line: 684, column: 2)
!724 = !DILocation(line: 687, column: 1, scope: !678)
!725 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !70, file: !70, line: 704, type: !726, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!726 = !DISubroutineType(types: !727)
!727 = !{!13, !29, !29}
!728 = !DILocalVariable(name: "value", arg: 1, scope: !725, file: !70, line: 704, type: !29)
!729 = !DILocation(line: 704, column: 33, scope: !725)
!730 = !DILocalVariable(name: "factor", arg: 2, scope: !725, file: !70, line: 704, type: !29)
!731 = !DILocation(line: 704, column: 44, scope: !725)
!732 = !DILocalVariable(name: "u32MulTemp", scope: !725, file: !70, line: 706, type: !733)
!733 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !734)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !26, line: 26, baseType: !735)
!735 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !736)
!736 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!737 = !DILocation(line: 706, column: 6, scope: !725)
!738 = !DILocation(line: 707, column: 15, scope: !725)
!739 = !DILocation(line: 707, column: 23, scope: !725)
!740 = !DILocation(line: 707, column: 21, scope: !725)
!741 = !DILocation(line: 707, column: 13, scope: !725)
!742 = !DILocation(line: 708, column: 15, scope: !725)
!743 = !DILocation(line: 708, column: 26, scope: !725)
!744 = !DILocation(line: 708, column: 13, scope: !725)
!745 = !DILocation(line: 709, column: 5, scope: !746)
!746 = distinct !DILexicalBlock(scope: !725, file: !70, line: 709, column: 5)
!747 = !DILocation(line: 709, column: 16, scope: !746)
!748 = !DILocation(line: 709, column: 5, scope: !725)
!749 = !DILocation(line: 711, column: 15, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !70, line: 710, column: 2)
!751 = !DILocation(line: 711, column: 10, scope: !750)
!752 = !DILocation(line: 711, column: 3, scope: !750)
!753 = !DILocation(line: 715, column: 3, scope: !754)
!754 = distinct !DILexicalBlock(scope: !746, file: !70, line: 714, column: 2)
!755 = !DILocation(line: 717, column: 1, scope: !725)
!756 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !70, file: !70, line: 732, type: !757, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!757 = !DISubroutineType(types: !758)
!758 = !{!20, !13, !29}
!759 = !DILocalVariable(name: "value", arg: 1, scope: !756, file: !70, line: 732, type: !13)
!760 = !DILocation(line: 732, column: 25, scope: !756)
!761 = !DILocalVariable(name: "factor", arg: 2, scope: !756, file: !70, line: 732, type: !29)
!762 = !DILocation(line: 732, column: 36, scope: !756)
!763 = !DILocalVariable(name: "s32MulTemp", scope: !756, file: !70, line: 734, type: !20)
!764 = !DILocation(line: 734, column: 6, scope: !756)
!765 = !DILocation(line: 735, column: 15, scope: !756)
!766 = !DILocation(line: 735, column: 23, scope: !756)
!767 = !DILocation(line: 735, column: 21, scope: !756)
!768 = !DILocation(line: 735, column: 13, scope: !756)
!769 = !DILocation(line: 736, column: 9, scope: !756)
!770 = !DILocation(line: 736, column: 2, scope: !756)
!771 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !70, file: !70, line: 752, type: !772, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!772 = !DISubroutineType(types: !773)
!773 = !{!20, !20, !29}
!774 = !DILocalVariable(name: "value", arg: 1, scope: !771, file: !70, line: 752, type: !20)
!775 = !DILocation(line: 752, column: 25, scope: !771)
!776 = !DILocalVariable(name: "factor", arg: 2, scope: !771, file: !70, line: 752, type: !29)
!777 = !DILocation(line: 752, column: 36, scope: !771)
!778 = !DILocalVariable(name: "s32Temp1", scope: !771, file: !70, line: 754, type: !20)
!779 = !DILocation(line: 754, column: 6, scope: !771)
!780 = !DILocalVariable(name: "s32Temp2", scope: !771, file: !70, line: 754, type: !20)
!781 = !DILocation(line: 754, column: 20, scope: !771)
!782 = !DILocalVariable(name: "s32Factor", scope: !771, file: !70, line: 754, type: !20)
!783 = !DILocation(line: 754, column: 44, scope: !771)
!784 = !DILocation(line: 755, column: 14, scope: !771)
!785 = !DILocation(line: 755, column: 12, scope: !771)
!786 = !DILocation(line: 756, column: 5, scope: !787)
!787 = distinct !DILexicalBlock(scope: !771, file: !70, line: 756, column: 5)
!788 = !DILocation(line: 756, column: 12, scope: !787)
!789 = !DILocation(line: 756, column: 5, scope: !771)
!790 = !DILocation(line: 758, column: 6, scope: !791)
!791 = distinct !DILexicalBlock(scope: !792, file: !70, line: 758, column: 6)
!792 = distinct !DILexicalBlock(scope: !787, file: !70, line: 757, column: 2)
!793 = !DILocation(line: 758, column: 12, scope: !791)
!794 = !DILocation(line: 758, column: 6, scope: !792)
!795 = !DILocation(line: 760, column: 15, scope: !796)
!796 = distinct !DILexicalBlock(scope: !791, file: !70, line: 759, column: 3)
!797 = !DILocation(line: 760, column: 26, scope: !796)
!798 = !DILocation(line: 760, column: 24, scope: !796)
!799 = !DILocation(line: 760, column: 13, scope: !796)
!800 = !DILocation(line: 761, column: 7, scope: !801)
!801 = distinct !DILexicalBlock(scope: !796, file: !70, line: 761, column: 7)
!802 = !DILocation(line: 761, column: 19, scope: !801)
!803 = !DILocation(line: 761, column: 16, scope: !801)
!804 = !DILocation(line: 761, column: 7, scope: !796)
!805 = !DILocation(line: 763, column: 5, scope: !806)
!806 = distinct !DILexicalBlock(scope: !801, file: !70, line: 762, column: 4)
!807 = !DILocation(line: 768, column: 46, scope: !808)
!808 = distinct !DILexicalBlock(scope: !809, file: !70, line: 768, column: 9)
!809 = distinct !DILexicalBlock(scope: !801, file: !70, line: 766, column: 4)
!810 = !DILocation(line: 768, column: 36, scope: !808)
!811 = !DILocation(line: 768, column: 69, scope: !808)
!812 = !DILocation(line: 768, column: 64, scope: !808)
!813 = !DILocation(line: 768, column: 54, scope: !808)
!814 = !DILocation(line: 768, column: 11, scope: !808)
!815 = !DILocation(line: 768, column: 9, scope: !809)
!816 = !DILocation(line: 769, column: 9, scope: !817)
!817 = distinct !DILexicalBlock(scope: !808, file: !70, line: 768, column: 80)
!818 = !DILocation(line: 771, column: 13, scope: !809)
!819 = !DILocation(line: 771, column: 19, scope: !809)
!820 = !DILocation(line: 771, column: 18, scope: !809)
!821 = !DILocation(line: 771, column: 5, scope: !809)
!822 = !DILocation(line: 776, column: 20, scope: !823)
!823 = distinct !DILexicalBlock(scope: !824, file: !70, line: 776, column: 7)
!824 = distinct !DILexicalBlock(scope: !791, file: !70, line: 775, column: 3)
!825 = !DILocation(line: 776, column: 19, scope: !823)
!826 = !DILocation(line: 776, column: 31, scope: !823)
!827 = !DILocation(line: 776, column: 28, scope: !823)
!828 = !DILocation(line: 776, column: 7, scope: !824)
!829 = !DILocation(line: 778, column: 5, scope: !830)
!830 = distinct !DILexicalBlock(scope: !823, file: !70, line: 777, column: 4)
!831 = !DILocation(line: 783, column: 46, scope: !832)
!832 = distinct !DILexicalBlock(scope: !833, file: !70, line: 783, column: 9)
!833 = distinct !DILexicalBlock(scope: !823, file: !70, line: 781, column: 4)
!834 = !DILocation(line: 783, column: 36, scope: !832)
!835 = !DILocation(line: 783, column: 69, scope: !832)
!836 = !DILocation(line: 783, column: 64, scope: !832)
!837 = !DILocation(line: 783, column: 54, scope: !832)
!838 = !DILocation(line: 783, column: 11, scope: !832)
!839 = !DILocation(line: 783, column: 9, scope: !833)
!840 = !DILocation(line: 784, column: 9, scope: !841)
!841 = distinct !DILexicalBlock(scope: !832, file: !70, line: 783, column: 80)
!842 = !DILocation(line: 791, column: 37, scope: !833)
!843 = !DILocation(line: 791, column: 50, scope: !833)
!844 = !DILocation(line: 791, column: 45, scope: !833)
!845 = !DILocation(line: 791, column: 43, scope: !833)
!846 = !DILocation(line: 791, column: 27, scope: !833)
!847 = !DILocation(line: 791, column: 25, scope: !833)
!848 = !DILocation(line: 792, column: 5, scope: !833)
!849 = !DILocation(line: 798, column: 3, scope: !850)
!850 = distinct !DILexicalBlock(scope: !787, file: !70, line: 797, column: 2)
!851 = !DILocation(line: 800, column: 1, scope: !771)
!852 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !34, file: !34, line: 72, type: !853, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!853 = !DISubroutineType(types: !854)
!854 = !{!23, !17, !17}
!855 = !DILocalVariable(name: "left", arg: 1, scope: !852, file: !34, line: 72, type: !17)
!856 = !DILocation(line: 72, column: 38, scope: !852)
!857 = !DILocalVariable(name: "right", arg: 2, scope: !852, file: !34, line: 72, type: !17)
!858 = !DILocation(line: 72, column: 52, scope: !852)
!859 = !DILocation(line: 74, column: 12, scope: !852)
!860 = !DILocation(line: 74, column: 19, scope: !852)
!861 = !DILocation(line: 74, column: 17, scope: !852)
!862 = !DILocation(line: 74, column: 25, scope: !852)
!863 = !DILocation(line: 74, column: 5, scope: !852)
!864 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !34, file: !34, line: 78, type: !853, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!865 = !DILocalVariable(name: "left", arg: 1, scope: !864, file: !34, line: 78, type: !17)
!866 = !DILocation(line: 78, column: 38, scope: !864)
!867 = !DILocalVariable(name: "right", arg: 2, scope: !864, file: !34, line: 78, type: !17)
!868 = !DILocation(line: 78, column: 52, scope: !864)
!869 = !DILocation(line: 80, column: 12, scope: !864)
!870 = !DILocation(line: 80, column: 19, scope: !864)
!871 = !DILocation(line: 80, column: 17, scope: !864)
!872 = !DILocation(line: 80, column: 25, scope: !864)
!873 = !DILocation(line: 80, column: 5, scope: !864)
!874 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !70, file: !70, line: 816, type: !875, scopeLine: 817, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!875 = !DISubroutineType(types: !876)
!876 = !{!24, !24, !24, !29}
!877 = !DILocalVariable(name: "value", arg: 1, scope: !874, file: !70, line: 816, type: !24)
!878 = !DILocation(line: 816, column: 35, scope: !874)
!879 = !DILocalVariable(name: "factor", arg: 2, scope: !874, file: !70, line: 816, type: !24)
!880 = !DILocation(line: 816, column: 44, scope: !874)
!881 = !DILocalVariable(name: "count", arg: 3, scope: !874, file: !70, line: 816, type: !29)
!882 = !DILocation(line: 816, column: 55, scope: !874)
!883 = !DILocalVariable(name: "u16MulTemp", scope: !874, file: !70, line: 818, type: !29)
!884 = !DILocation(line: 818, column: 6, scope: !874)
!885 = !DILocation(line: 819, column: 15, scope: !874)
!886 = !DILocation(line: 819, column: 23, scope: !874)
!887 = !DILocation(line: 819, column: 21, scope: !874)
!888 = !DILocation(line: 819, column: 13, scope: !874)
!889 = !DILocation(line: 820, column: 15, scope: !874)
!890 = !DILocation(line: 820, column: 26, scope: !874)
!891 = !DILocation(line: 820, column: 25, scope: !874)
!892 = !DILocation(line: 820, column: 13, scope: !874)
!893 = !DILocation(line: 821, column: 13, scope: !874)
!894 = !DILocation(line: 821, column: 9, scope: !874)
!895 = !DILocation(line: 821, column: 2, scope: !874)
!896 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !70, file: !70, line: 838, type: !897, scopeLine: 839, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!897 = !DISubroutineType(types: !898)
!898 = !{!24, !24, !24, !24}
!899 = !DILocalVariable(name: "value", arg: 1, scope: !896, file: !70, line: 838, type: !24)
!900 = !DILocation(line: 838, column: 38, scope: !896)
!901 = !DILocalVariable(name: "factor", arg: 2, scope: !896, file: !70, line: 838, type: !24)
!902 = !DILocation(line: 838, column: 47, scope: !896)
!903 = !DILocalVariable(name: "count", arg: 3, scope: !896, file: !70, line: 838, type: !24)
!904 = !DILocation(line: 838, column: 57, scope: !896)
!905 = !DILocalVariable(name: "u16MulTemp", scope: !896, file: !70, line: 840, type: !29)
!906 = !DILocation(line: 840, column: 6, scope: !896)
!907 = !DILocation(line: 841, column: 15, scope: !896)
!908 = !DILocation(line: 841, column: 23, scope: !896)
!909 = !DILocation(line: 841, column: 21, scope: !896)
!910 = !DILocation(line: 841, column: 13, scope: !896)
!911 = !DILocation(line: 842, column: 15, scope: !896)
!912 = !DILocation(line: 842, column: 26, scope: !896)
!913 = !DILocation(line: 842, column: 25, scope: !896)
!914 = !DILocation(line: 842, column: 13, scope: !896)
!915 = !DILocation(line: 843, column: 5, scope: !916)
!916 = distinct !DILexicalBlock(scope: !896, file: !70, line: 843, column: 5)
!917 = !DILocation(line: 843, column: 16, scope: !916)
!918 = !DILocation(line: 843, column: 5, scope: !896)
!919 = !DILocation(line: 845, column: 10, scope: !920)
!920 = distinct !DILexicalBlock(scope: !916, file: !70, line: 844, column: 2)
!921 = !DILocation(line: 845, column: 21, scope: !920)
!922 = !DILocation(line: 845, column: 3, scope: !920)
!923 = !DILocation(line: 849, column: 3, scope: !924)
!924 = distinct !DILexicalBlock(scope: !916, file: !70, line: 848, column: 2)
!925 = !DILocation(line: 851, column: 1, scope: !896)
!926 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !70, file: !70, line: 868, type: !927, scopeLine: 869, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!927 = !DISubroutineType(types: !928)
!928 = !{!24, !24, !24}
!929 = !DILocalVariable(name: "x_value", arg: 1, scope: !926, file: !70, line: 868, type: !24)
!930 = !DILocation(line: 868, column: 25, scope: !926)
!931 = !DILocalVariable(name: "y_value", arg: 2, scope: !926, file: !70, line: 868, type: !24)
!932 = !DILocation(line: 868, column: 36, scope: !926)
!933 = !DILocalVariable(name: "u16MulTemp", scope: !926, file: !70, line: 870, type: !29)
!934 = !DILocation(line: 870, column: 6, scope: !926)
!935 = !DILocation(line: 871, column: 15, scope: !926)
!936 = !DILocation(line: 871, column: 25, scope: !926)
!937 = !DILocation(line: 871, column: 23, scope: !926)
!938 = !DILocation(line: 871, column: 13, scope: !926)
!939 = !DILocation(line: 872, column: 15, scope: !926)
!940 = !DILocation(line: 872, column: 26, scope: !926)
!941 = !DILocation(line: 872, column: 13, scope: !926)
!942 = !DILocation(line: 873, column: 13, scope: !926)
!943 = !DILocation(line: 873, column: 9, scope: !926)
!944 = !DILocation(line: 873, column: 2, scope: !926)
!945 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !70, file: !70, line: 892, type: !927, scopeLine: 893, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!946 = !DILocalVariable(name: "value", arg: 1, scope: !945, file: !70, line: 892, type: !24)
!947 = !DILocation(line: 892, column: 26, scope: !945)
!948 = !DILocalVariable(name: "factor", arg: 2, scope: !945, file: !70, line: 892, type: !24)
!949 = !DILocation(line: 892, column: 36, scope: !945)
!950 = !DILocalVariable(name: "u16MulTemp", scope: !945, file: !70, line: 894, type: !29)
!951 = !DILocation(line: 894, column: 6, scope: !945)
!952 = !DILocation(line: 895, column: 15, scope: !945)
!953 = !DILocation(line: 895, column: 23, scope: !945)
!954 = !DILocation(line: 895, column: 21, scope: !945)
!955 = !DILocation(line: 895, column: 13, scope: !945)
!956 = !DILocation(line: 896, column: 15, scope: !945)
!957 = !DILocation(line: 896, column: 26, scope: !945)
!958 = !DILocation(line: 896, column: 13, scope: !945)
!959 = !DILocation(line: 897, column: 5, scope: !960)
!960 = distinct !DILexicalBlock(scope: !945, file: !70, line: 897, column: 5)
!961 = !DILocation(line: 897, column: 16, scope: !960)
!962 = !DILocation(line: 897, column: 5, scope: !945)
!963 = !DILocation(line: 899, column: 14, scope: !964)
!964 = distinct !DILexicalBlock(scope: !960, file: !70, line: 898, column: 2)
!965 = !DILocation(line: 899, column: 10, scope: !964)
!966 = !DILocation(line: 899, column: 3, scope: !964)
!967 = !DILocation(line: 903, column: 3, scope: !968)
!968 = distinct !DILexicalBlock(scope: !960, file: !70, line: 902, column: 2)
!969 = !DILocation(line: 905, column: 1, scope: !945)
!970 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !70, file: !70, line: 921, type: !971, scopeLine: 922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!971 = !DISubroutineType(types: !972)
!972 = !{!29, !29, !29}
!973 = !DILocalVariable(name: "value", arg: 1, scope: !970, file: !70, line: 921, type: !29)
!974 = !DILocation(line: 921, column: 39, scope: !970)
!975 = !DILocalVariable(name: "factor", arg: 2, scope: !970, file: !70, line: 921, type: !29)
!976 = !DILocation(line: 921, column: 49, scope: !970)
!977 = !DILocalVariable(name: "u32MulTemp", scope: !970, file: !70, line: 923, type: !733)
!978 = !DILocation(line: 923, column: 6, scope: !970)
!979 = !DILocation(line: 924, column: 15, scope: !970)
!980 = !DILocation(line: 924, column: 23, scope: !970)
!981 = !DILocation(line: 924, column: 21, scope: !970)
!982 = !DILocation(line: 924, column: 13, scope: !970)
!983 = !DILocation(line: 925, column: 15, scope: !970)
!984 = !DILocation(line: 925, column: 26, scope: !970)
!985 = !DILocation(line: 925, column: 13, scope: !970)
!986 = !DILocation(line: 926, column: 14, scope: !970)
!987 = !DILocation(line: 926, column: 9, scope: !970)
!988 = !DILocation(line: 926, column: 2, scope: !970)
!989 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !70, file: !70, line: 945, type: !971, scopeLine: 946, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!990 = !DILocalVariable(name: "value", arg: 1, scope: !989, file: !70, line: 945, type: !29)
!991 = !DILocation(line: 945, column: 43, scope: !989)
!992 = !DILocalVariable(name: "factor", arg: 2, scope: !989, file: !70, line: 945, type: !29)
!993 = !DILocation(line: 945, column: 53, scope: !989)
!994 = !DILocalVariable(name: "u32MulTemp", scope: !989, file: !70, line: 947, type: !733)
!995 = !DILocation(line: 947, column: 6, scope: !989)
!996 = !DILocation(line: 948, column: 15, scope: !989)
!997 = !DILocation(line: 948, column: 23, scope: !989)
!998 = !DILocation(line: 948, column: 21, scope: !989)
!999 = !DILocation(line: 948, column: 13, scope: !989)
!1000 = !DILocation(line: 949, column: 15, scope: !989)
!1001 = !DILocation(line: 949, column: 26, scope: !989)
!1002 = !DILocation(line: 949, column: 13, scope: !989)
!1003 = !DILocation(line: 950, column: 5, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !989, file: !70, line: 950, column: 5)
!1005 = !DILocation(line: 950, column: 16, scope: !1004)
!1006 = !DILocation(line: 950, column: 5, scope: !989)
!1007 = !DILocation(line: 952, column: 11, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1004, file: !70, line: 951, column: 2)
!1009 = !DILocation(line: 952, column: 22, scope: !1008)
!1010 = !DILocation(line: 952, column: 10, scope: !1008)
!1011 = !DILocation(line: 952, column: 3, scope: !1008)
!1012 = !DILocation(line: 956, column: 3, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1004, file: !70, line: 955, column: 2)
!1014 = !DILocation(line: 958, column: 1, scope: !989)
!1015 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !70, file: !70, line: 976, type: !1016, scopeLine: 977, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!29, !29, !24}
!1018 = !DILocalVariable(name: "x_value", arg: 1, scope: !1015, file: !70, line: 976, type: !29)
!1019 = !DILocation(line: 976, column: 29, scope: !1015)
!1020 = !DILocalVariable(name: "y_value", arg: 2, scope: !1015, file: !70, line: 976, type: !24)
!1021 = !DILocation(line: 976, column: 41, scope: !1015)
!1022 = !DILocalVariable(name: "u32MulTemp", scope: !1015, file: !70, line: 978, type: !733)
!1023 = !DILocation(line: 978, column: 6, scope: !1015)
!1024 = !DILocation(line: 979, column: 15, scope: !1015)
!1025 = !DILocation(line: 979, column: 25, scope: !1015)
!1026 = !DILocation(line: 979, column: 23, scope: !1015)
!1027 = !DILocation(line: 979, column: 13, scope: !1015)
!1028 = !DILocation(line: 980, column: 16, scope: !1015)
!1029 = !DILocation(line: 980, column: 27, scope: !1015)
!1030 = !DILocation(line: 980, column: 33, scope: !1015)
!1031 = !DILocation(line: 980, column: 13, scope: !1015)
!1032 = !DILocation(line: 981, column: 9, scope: !1015)
!1033 = !DILocation(line: 981, column: 2, scope: !1015)
!1034 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !70, file: !70, line: 1000, type: !1016, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1035 = !DILocalVariable(name: "x_value", arg: 1, scope: !1034, file: !70, line: 1000, type: !29)
!1036 = !DILocation(line: 1000, column: 29, scope: !1034)
!1037 = !DILocalVariable(name: "y_value", arg: 2, scope: !1034, file: !70, line: 1000, type: !24)
!1038 = !DILocation(line: 1000, column: 41, scope: !1034)
!1039 = !DILocalVariable(name: "u32MulTemp", scope: !1034, file: !70, line: 1002, type: !733)
!1040 = !DILocation(line: 1002, column: 6, scope: !1034)
!1041 = !DILocation(line: 1003, column: 15, scope: !1034)
!1042 = !DILocation(line: 1003, column: 25, scope: !1034)
!1043 = !DILocation(line: 1003, column: 23, scope: !1034)
!1044 = !DILocation(line: 1003, column: 13, scope: !1034)
!1045 = !DILocation(line: 1004, column: 15, scope: !1034)
!1046 = !DILocation(line: 1004, column: 26, scope: !1034)
!1047 = !DILocation(line: 1004, column: 13, scope: !1034)
!1048 = !DILocation(line: 1005, column: 5, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1034, file: !70, line: 1005, column: 5)
!1050 = !DILocation(line: 1005, column: 16, scope: !1049)
!1051 = !DILocation(line: 1005, column: 5, scope: !1034)
!1052 = !DILocation(line: 1007, column: 11, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1049, file: !70, line: 1006, column: 2)
!1054 = !DILocation(line: 1007, column: 22, scope: !1053)
!1055 = !DILocation(line: 1007, column: 10, scope: !1053)
!1056 = !DILocation(line: 1007, column: 3, scope: !1053)
!1057 = !DILocation(line: 1011, column: 3, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1049, file: !70, line: 1010, column: 2)
!1059 = !DILocation(line: 1013, column: 1, scope: !1034)
!1060 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !70, file: !70, line: 1029, type: !1061, scopeLine: 1030, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!29, !29, !29, !733}
!1063 = !DILocalVariable(name: "value", arg: 1, scope: !1060, file: !70, line: 1029, type: !29)
!1064 = !DILocation(line: 1029, column: 40, scope: !1060)
!1065 = !DILocalVariable(name: "factor", arg: 2, scope: !1060, file: !70, line: 1029, type: !29)
!1066 = !DILocation(line: 1029, column: 50, scope: !1060)
!1067 = !DILocalVariable(name: "count", arg: 3, scope: !1060, file: !70, line: 1029, type: !733)
!1068 = !DILocation(line: 1029, column: 61, scope: !1060)
!1069 = !DILocalVariable(name: "u32MulTemp", scope: !1060, file: !70, line: 1031, type: !733)
!1070 = !DILocation(line: 1031, column: 6, scope: !1060)
!1071 = !DILocation(line: 1032, column: 15, scope: !1060)
!1072 = !DILocation(line: 1032, column: 23, scope: !1060)
!1073 = !DILocation(line: 1032, column: 21, scope: !1060)
!1074 = !DILocation(line: 1032, column: 13, scope: !1060)
!1075 = !DILocation(line: 1033, column: 15, scope: !1060)
!1076 = !DILocation(line: 1033, column: 26, scope: !1060)
!1077 = !DILocation(line: 1033, column: 25, scope: !1060)
!1078 = !DILocation(line: 1033, column: 13, scope: !1060)
!1079 = !DILocation(line: 1034, column: 10, scope: !1060)
!1080 = !DILocation(line: 1034, column: 21, scope: !1060)
!1081 = !DILocation(line: 1034, column: 9, scope: !1060)
!1082 = !DILocation(line: 1034, column: 2, scope: !1060)
!1083 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !70, file: !70, line: 1052, type: !1084, scopeLine: 1053, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!29, !29, !29, !29}
!1086 = !DILocalVariable(name: "value", arg: 1, scope: !1083, file: !70, line: 1052, type: !29)
!1087 = !DILocation(line: 1052, column: 43, scope: !1083)
!1088 = !DILocalVariable(name: "factor", arg: 2, scope: !1083, file: !70, line: 1052, type: !29)
!1089 = !DILocation(line: 1052, column: 53, scope: !1083)
!1090 = !DILocalVariable(name: "count", arg: 3, scope: !1083, file: !70, line: 1052, type: !29)
!1091 = !DILocation(line: 1052, column: 64, scope: !1083)
!1092 = !DILocalVariable(name: "u32MulTemp", scope: !1083, file: !70, line: 1054, type: !733)
!1093 = !DILocation(line: 1054, column: 6, scope: !1083)
!1094 = !DILocation(line: 1055, column: 15, scope: !1083)
!1095 = !DILocation(line: 1055, column: 23, scope: !1083)
!1096 = !DILocation(line: 1055, column: 21, scope: !1083)
!1097 = !DILocation(line: 1055, column: 13, scope: !1083)
!1098 = !DILocation(line: 1056, column: 15, scope: !1083)
!1099 = !DILocation(line: 1056, column: 26, scope: !1083)
!1100 = !DILocation(line: 1056, column: 25, scope: !1083)
!1101 = !DILocation(line: 1056, column: 13, scope: !1083)
!1102 = !DILocation(line: 1057, column: 5, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1083, file: !70, line: 1057, column: 5)
!1104 = !DILocation(line: 1057, column: 16, scope: !1103)
!1105 = !DILocation(line: 1057, column: 5, scope: !1083)
!1106 = !DILocation(line: 1059, column: 11, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1103, file: !70, line: 1058, column: 2)
!1108 = !DILocation(line: 1059, column: 22, scope: !1107)
!1109 = !DILocation(line: 1059, column: 10, scope: !1107)
!1110 = !DILocation(line: 1059, column: 3, scope: !1107)
!1111 = !DILocation(line: 1063, column: 3, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1103, file: !70, line: 1062, column: 2)
!1113 = !DILocation(line: 1065, column: 1, scope: !1083)
!1114 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !70, file: !70, line: 1081, type: !971, scopeLine: 1082, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1115 = !DILocalVariable(name: "x_value", arg: 1, scope: !1114, file: !70, line: 1081, type: !29)
!1116 = !DILocation(line: 1081, column: 30, scope: !1114)
!1117 = !DILocalVariable(name: "y_value", arg: 2, scope: !1114, file: !70, line: 1081, type: !29)
!1118 = !DILocation(line: 1081, column: 42, scope: !1114)
!1119 = !DILocalVariable(name: "u32MulTemp", scope: !1114, file: !70, line: 1083, type: !733)
!1120 = !DILocation(line: 1083, column: 6, scope: !1114)
!1121 = !DILocation(line: 1084, column: 15, scope: !1114)
!1122 = !DILocation(line: 1084, column: 25, scope: !1114)
!1123 = !DILocation(line: 1084, column: 23, scope: !1114)
!1124 = !DILocation(line: 1084, column: 13, scope: !1114)
!1125 = !DILocation(line: 1085, column: 15, scope: !1114)
!1126 = !DILocation(line: 1085, column: 26, scope: !1114)
!1127 = !DILocation(line: 1085, column: 13, scope: !1114)
!1128 = !DILocation(line: 1086, column: 19, scope: !1114)
!1129 = !DILocation(line: 1086, column: 17, scope: !1114)
!1130 = !DILocation(line: 1086, column: 9, scope: !1114)
!1131 = !DILocation(line: 1086, column: 2, scope: !1114)
!1132 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !70, file: !70, line: 1105, type: !971, scopeLine: 1106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1133 = !DILocalVariable(name: "x_value", arg: 1, scope: !1132, file: !70, line: 1105, type: !29)
!1134 = !DILocation(line: 1105, column: 30, scope: !1132)
!1135 = !DILocalVariable(name: "y_value", arg: 2, scope: !1132, file: !70, line: 1105, type: !29)
!1136 = !DILocation(line: 1105, column: 42, scope: !1132)
!1137 = !DILocalVariable(name: "u32MulTemp", scope: !1132, file: !70, line: 1107, type: !733)
!1138 = !DILocation(line: 1107, column: 6, scope: !1132)
!1139 = !DILocation(line: 1108, column: 15, scope: !1132)
!1140 = !DILocation(line: 1108, column: 25, scope: !1132)
!1141 = !DILocation(line: 1108, column: 23, scope: !1132)
!1142 = !DILocation(line: 1108, column: 13, scope: !1132)
!1143 = !DILocation(line: 1109, column: 15, scope: !1132)
!1144 = !DILocation(line: 1109, column: 26, scope: !1132)
!1145 = !DILocation(line: 1109, column: 13, scope: !1132)
!1146 = !DILocation(line: 1110, column: 5, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1132, file: !70, line: 1110, column: 5)
!1148 = !DILocation(line: 1110, column: 16, scope: !1147)
!1149 = !DILocation(line: 1110, column: 5, scope: !1132)
!1150 = !DILocation(line: 1112, column: 11, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1147, file: !70, line: 1111, column: 2)
!1152 = !DILocation(line: 1112, column: 22, scope: !1151)
!1153 = !DILocation(line: 1112, column: 10, scope: !1151)
!1154 = !DILocation(line: 1112, column: 3, scope: !1151)
!1155 = !DILocation(line: 1116, column: 3, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1147, file: !70, line: 1115, column: 2)
!1157 = !DILocation(line: 1118, column: 1, scope: !1132)
!1158 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !70, file: !70, line: 1133, type: !1159, scopeLine: 1134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1159 = !DISubroutineType(types: !1160)
!1160 = !{!733, !733, !29}
!1161 = !DILocalVariable(name: "x_value", arg: 1, scope: !1158, file: !70, line: 1133, type: !733)
!1162 = !DILocation(line: 1133, column: 26, scope: !1158)
!1163 = !DILocalVariable(name: "y_value", arg: 2, scope: !1158, file: !70, line: 1133, type: !29)
!1164 = !DILocation(line: 1133, column: 39, scope: !1158)
!1165 = !DILocalVariable(name: "u32Temp1", scope: !1158, file: !70, line: 1136, type: !733)
!1166 = !DILocation(line: 1136, column: 6, scope: !1158)
!1167 = !DILocation(line: 1137, column: 5, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1158, file: !70, line: 1137, column: 5)
!1169 = !DILocation(line: 1137, column: 13, scope: !1168)
!1170 = !DILocation(line: 1137, column: 5, scope: !1158)
!1171 = !DILocation(line: 1139, column: 26, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1168, file: !70, line: 1138, column: 2)
!1173 = !DILocation(line: 1139, column: 25, scope: !1172)
!1174 = !DILocation(line: 1139, column: 12, scope: !1172)
!1175 = !DILocation(line: 1140, column: 6, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1172, file: !70, line: 1140, column: 6)
!1177 = !DILocation(line: 1140, column: 17, scope: !1176)
!1178 = !DILocation(line: 1140, column: 15, scope: !1176)
!1179 = !DILocation(line: 1140, column: 6, scope: !1172)
!1180 = !DILocation(line: 1142, column: 4, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1176, file: !70, line: 1141, column: 3)
!1182 = !DILocation(line: 1146, column: 12, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1176, file: !70, line: 1145, column: 3)
!1184 = !DILocation(line: 1146, column: 22, scope: !1183)
!1185 = !DILocation(line: 1146, column: 20, scope: !1183)
!1186 = !DILocation(line: 1146, column: 4, scope: !1183)
!1187 = !DILocation(line: 1151, column: 3, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1168, file: !70, line: 1150, column: 2)
!1189 = !DILocation(line: 1154, column: 2, scope: !1158)
!1190 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !70, file: !70, line: 1171, type: !1191, scopeLine: 1172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{!733, !733, !29, !733}
!1193 = !DILocalVariable(name: "value", arg: 1, scope: !1190, file: !70, line: 1171, type: !733)
!1194 = !DILocation(line: 1171, column: 40, scope: !1190)
!1195 = !DILocalVariable(name: "factor", arg: 2, scope: !1190, file: !70, line: 1171, type: !29)
!1196 = !DILocation(line: 1171, column: 50, scope: !1190)
!1197 = !DILocalVariable(name: "count", arg: 3, scope: !1190, file: !70, line: 1171, type: !733)
!1198 = !DILocation(line: 1171, column: 62, scope: !1190)
!1199 = !DILocalVariable(name: "u32Temp1", scope: !1190, file: !70, line: 1173, type: !733)
!1200 = !DILocation(line: 1173, column: 6, scope: !1190)
!1201 = !DILocalVariable(name: "u32Temp2", scope: !1190, file: !70, line: 1173, type: !733)
!1202 = !DILocation(line: 1173, column: 20, scope: !1190)
!1203 = !DILocation(line: 1174, column: 13, scope: !1190)
!1204 = !DILocation(line: 1174, column: 21, scope: !1190)
!1205 = !DILocation(line: 1174, column: 19, scope: !1190)
!1206 = !DILocation(line: 1174, column: 11, scope: !1190)
!1207 = !DILocation(line: 1175, column: 25, scope: !1190)
!1208 = !DILocation(line: 1175, column: 32, scope: !1190)
!1209 = !DILocation(line: 1175, column: 13, scope: !1190)
!1210 = !DILocation(line: 1175, column: 11, scope: !1190)
!1211 = !DILocation(line: 1176, column: 13, scope: !1190)
!1212 = !DILocation(line: 1176, column: 25, scope: !1190)
!1213 = !DILocation(line: 1176, column: 22, scope: !1190)
!1214 = !DILocation(line: 1176, column: 11, scope: !1190)
!1215 = !DILocation(line: 1177, column: 14, scope: !1190)
!1216 = !DILocation(line: 1177, column: 30, scope: !1190)
!1217 = !DILocation(line: 1177, column: 29, scope: !1190)
!1218 = !DILocation(line: 1177, column: 23, scope: !1190)
!1219 = !DILocation(line: 1177, column: 11, scope: !1190)
!1220 = !DILocation(line: 1178, column: 6, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1190, file: !70, line: 1178, column: 5)
!1222 = !DILocation(line: 1178, column: 16, scope: !1221)
!1223 = !DILocation(line: 1178, column: 14, scope: !1221)
!1224 = !DILocation(line: 1178, column: 23, scope: !1221)
!1225 = !DILocation(line: 1178, column: 5, scope: !1190)
!1226 = !DILocation(line: 1180, column: 10, scope: !1227)
!1227 = distinct !DILexicalBlock(scope: !1221, file: !70, line: 1179, column: 2)
!1228 = !DILocation(line: 1180, column: 3, scope: !1227)
!1229 = !DILocation(line: 1184, column: 3, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1221, file: !70, line: 1183, column: 2)
!1231 = !DILocation(line: 1186, column: 1, scope: !1190)
!1232 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !70, file: !70, line: 1202, type: !1233, scopeLine: 1203, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!24, !24, !24, !6}
!1235 = !DILocalVariable(name: "val1", arg: 1, scope: !1232, file: !70, line: 1202, type: !24)
!1236 = !DILocation(line: 1202, column: 25, scope: !1232)
!1237 = !DILocalVariable(name: "val2", arg: 2, scope: !1232, file: !70, line: 1202, type: !24)
!1238 = !DILocation(line: 1202, column: 34, scope: !1232)
!1239 = !DILocalVariable(name: "factor", arg: 3, scope: !1232, file: !70, line: 1202, type: !6)
!1240 = !DILocation(line: 1202, column: 43, scope: !1232)
!1241 = !DILocalVariable(name: "s16Temp1", scope: !1232, file: !70, line: 1204, type: !13)
!1242 = !DILocation(line: 1204, column: 6, scope: !1232)
!1243 = !DILocation(line: 1205, column: 15, scope: !1232)
!1244 = !DILocation(line: 1205, column: 22, scope: !1232)
!1245 = !DILocation(line: 1205, column: 20, scope: !1232)
!1246 = !DILocation(line: 1205, column: 28, scope: !1232)
!1247 = !DILocation(line: 1205, column: 27, scope: !1232)
!1248 = !DILocation(line: 1205, column: 35, scope: !1232)
!1249 = !DILocation(line: 1205, column: 39, scope: !1232)
!1250 = !DILocation(line: 1205, column: 38, scope: !1232)
!1251 = !DILocation(line: 1205, column: 13, scope: !1232)
!1252 = !DILocation(line: 1205, column: 11, scope: !1232)
!1253 = !DILocation(line: 1206, column: 5, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1232, file: !70, line: 1206, column: 5)
!1255 = !DILocation(line: 1206, column: 14, scope: !1254)
!1256 = !DILocation(line: 1206, column: 5, scope: !1232)
!1257 = !DILocation(line: 1208, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !70, line: 1208, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !70, line: 1207, column: 2)
!1260 = !DILocation(line: 1208, column: 15, scope: !1258)
!1261 = !DILocation(line: 1208, column: 6, scope: !1259)
!1262 = !DILocation(line: 1210, column: 15, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !70, line: 1209, column: 3)
!1264 = !DILocation(line: 1210, column: 11, scope: !1263)
!1265 = !DILocation(line: 1210, column: 4, scope: !1263)
!1266 = !DILocation(line: 1214, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1258, file: !70, line: 1213, column: 3)
!1268 = !DILocation(line: 1219, column: 3, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1254, file: !70, line: 1218, column: 2)
!1270 = !DILocation(line: 1222, column: 1, scope: !1232)
!1271 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !70, file: !70, line: 1238, type: !1272, scopeLine: 1239, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{!29, !29, !29, !6}
!1274 = !DILocalVariable(name: "val1", arg: 1, scope: !1271, file: !70, line: 1238, type: !29)
!1275 = !DILocation(line: 1238, column: 30, scope: !1271)
!1276 = !DILocalVariable(name: "val2", arg: 2, scope: !1271, file: !70, line: 1238, type: !29)
!1277 = !DILocation(line: 1238, column: 40, scope: !1271)
!1278 = !DILocalVariable(name: "factor", arg: 3, scope: !1271, file: !70, line: 1238, type: !6)
!1279 = !DILocation(line: 1238, column: 49, scope: !1271)
!1280 = !DILocalVariable(name: "s32Temp1", scope: !1271, file: !70, line: 1240, type: !20)
!1281 = !DILocation(line: 1240, column: 6, scope: !1271)
!1282 = !DILocation(line: 1241, column: 15, scope: !1271)
!1283 = !DILocation(line: 1241, column: 22, scope: !1271)
!1284 = !DILocation(line: 1241, column: 20, scope: !1271)
!1285 = !DILocation(line: 1241, column: 28, scope: !1271)
!1286 = !DILocation(line: 1241, column: 27, scope: !1271)
!1287 = !DILocation(line: 1241, column: 35, scope: !1271)
!1288 = !DILocation(line: 1241, column: 39, scope: !1271)
!1289 = !DILocation(line: 1241, column: 38, scope: !1271)
!1290 = !DILocation(line: 1241, column: 11, scope: !1271)
!1291 = !DILocation(line: 1242, column: 5, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1271, file: !70, line: 1242, column: 5)
!1293 = !DILocation(line: 1242, column: 14, scope: !1292)
!1294 = !DILocation(line: 1242, column: 5, scope: !1271)
!1295 = !DILocation(line: 1244, column: 6, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1297, file: !70, line: 1244, column: 6)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !70, line: 1243, column: 2)
!1298 = !DILocation(line: 1244, column: 15, scope: !1296)
!1299 = !DILocation(line: 1244, column: 6, scope: !1297)
!1300 = !DILocation(line: 1246, column: 16, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1296, file: !70, line: 1245, column: 3)
!1302 = !DILocation(line: 1246, column: 11, scope: !1301)
!1303 = !DILocation(line: 1246, column: 4, scope: !1301)
!1304 = !DILocation(line: 1250, column: 4, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1296, file: !70, line: 1249, column: 3)
!1306 = !DILocation(line: 1256, column: 3, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1292, file: !70, line: 1255, column: 2)
!1308 = !DILocation(line: 1258, column: 1, scope: !1271)
!1309 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !70, file: !70, line: 1273, type: !971, scopeLine: 1274, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1310 = !DILocalVariable(name: "val1", arg: 1, scope: !1309, file: !70, line: 1273, type: !29)
!1311 = !DILocation(line: 1273, column: 26, scope: !1309)
!1312 = !DILocalVariable(name: "val2", arg: 2, scope: !1309, file: !70, line: 1273, type: !29)
!1313 = !DILocation(line: 1273, column: 36, scope: !1309)
!1314 = !DILocalVariable(name: "u32Temp1", scope: !1309, file: !70, line: 1275, type: !733)
!1315 = !DILocation(line: 1275, column: 6, scope: !1309)
!1316 = !DILocation(line: 1276, column: 13, scope: !1309)
!1317 = !DILocation(line: 1276, column: 20, scope: !1309)
!1318 = !DILocation(line: 1276, column: 18, scope: !1309)
!1319 = !DILocation(line: 1276, column: 11, scope: !1309)
!1320 = !DILocation(line: 1277, column: 5, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1309, file: !70, line: 1277, column: 5)
!1322 = !DILocation(line: 1277, column: 14, scope: !1321)
!1323 = !DILocation(line: 1277, column: 5, scope: !1309)
!1324 = !DILocation(line: 1279, column: 11, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1321, file: !70, line: 1278, column: 2)
!1326 = !DILocation(line: 1279, column: 20, scope: !1325)
!1327 = !DILocation(line: 1279, column: 10, scope: !1325)
!1328 = !DILocation(line: 1279, column: 3, scope: !1325)
!1329 = !DILocation(line: 1283, column: 3, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1321, file: !70, line: 1282, column: 2)
!1331 = !DILocation(line: 1285, column: 1, scope: !1309)
!1332 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !70, file: !70, line: 1299, type: !1333, scopeLine: 1300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1333 = !DISubroutineType(types: !1334)
!1334 = !{!733, !29, !29}
!1335 = !DILocalVariable(name: "x_value", arg: 1, scope: !1332, file: !70, line: 1299, type: !29)
!1336 = !DILocation(line: 1299, column: 25, scope: !1332)
!1337 = !DILocalVariable(name: "y_value", arg: 2, scope: !1332, file: !70, line: 1299, type: !29)
!1338 = !DILocation(line: 1299, column: 38, scope: !1332)
!1339 = !DILocalVariable(name: "u32Temp1", scope: !1332, file: !70, line: 1301, type: !733)
!1340 = !DILocation(line: 1301, column: 6, scope: !1332)
!1341 = !DILocation(line: 1302, column: 13, scope: !1332)
!1342 = !DILocation(line: 1302, column: 23, scope: !1332)
!1343 = !DILocation(line: 1302, column: 21, scope: !1332)
!1344 = !DILocation(line: 1302, column: 11, scope: !1332)
!1345 = !DILocation(line: 1303, column: 9, scope: !1332)
!1346 = !DILocation(line: 1303, column: 2, scope: !1332)
!1347 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !70, file: !70, line: 1321, type: !1348, scopeLine: 1322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!20, !13, !13}
!1350 = !DILocalVariable(name: "x_value", arg: 1, scope: !1347, file: !70, line: 1321, type: !13)
!1351 = !DILocation(line: 1321, column: 25, scope: !1347)
!1352 = !DILocalVariable(name: "y_value", arg: 2, scope: !1347, file: !70, line: 1321, type: !13)
!1353 = !DILocation(line: 1321, column: 38, scope: !1347)
!1354 = !DILocalVariable(name: "s32Temp1", scope: !1347, file: !70, line: 1323, type: !20)
!1355 = !DILocation(line: 1323, column: 6, scope: !1347)
!1356 = !DILocation(line: 1324, column: 13, scope: !1347)
!1357 = !DILocation(line: 1324, column: 23, scope: !1347)
!1358 = !DILocation(line: 1324, column: 21, scope: !1347)
!1359 = !DILocation(line: 1324, column: 11, scope: !1347)
!1360 = !DILocation(line: 1325, column: 9, scope: !1347)
!1361 = !DILocation(line: 1325, column: 2, scope: !1347)
!1362 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !70, file: !70, line: 1342, type: !1363, scopeLine: 1343, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1363 = !DISubroutineType(types: !1364)
!1364 = !{!733, !733, !20}
!1365 = !DILocalVariable(name: "val1", arg: 1, scope: !1362, file: !70, line: 1342, type: !733)
!1366 = !DILocation(line: 1342, column: 25, scope: !1362)
!1367 = !DILocalVariable(name: "val2", arg: 2, scope: !1362, file: !70, line: 1342, type: !20)
!1368 = !DILocation(line: 1342, column: 35, scope: !1362)
!1369 = !DILocalVariable(name: "s32Temp1", scope: !1362, file: !70, line: 1344, type: !20)
!1370 = !DILocation(line: 1344, column: 6, scope: !1362)
!1371 = !DILocation(line: 1345, column: 5, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1362, file: !70, line: 1345, column: 5)
!1373 = !DILocation(line: 1345, column: 10, scope: !1372)
!1374 = !DILocation(line: 1345, column: 5, scope: !1362)
!1375 = !DILocation(line: 1347, column: 25, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1372, file: !70, line: 1346, column: 2)
!1377 = !DILocation(line: 1347, column: 24, scope: !1376)
!1378 = !DILocation(line: 1347, column: 12, scope: !1376)
!1379 = !DILocation(line: 1348, column: 6, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1376, file: !70, line: 1348, column: 6)
!1381 = !DILocation(line: 1348, column: 17, scope: !1380)
!1382 = !DILocation(line: 1348, column: 15, scope: !1380)
!1383 = !DILocation(line: 1348, column: 6, scope: !1376)
!1384 = !DILocation(line: 1350, column: 4, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1380, file: !70, line: 1349, column: 3)
!1386 = !DILocation(line: 1354, column: 12, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1380, file: !70, line: 1353, column: 3)
!1388 = !DILocation(line: 1354, column: 19, scope: !1387)
!1389 = !DILocation(line: 1354, column: 17, scope: !1387)
!1390 = !DILocation(line: 1354, column: 4, scope: !1387)
!1391 = !DILocation(line: 1359, column: 3, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1372, file: !70, line: 1358, column: 2)
!1393 = !DILocation(line: 1361, column: 1, scope: !1362)
!1394 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !70, file: !70, line: 1376, type: !1395, scopeLine: 1377, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1395 = !DISubroutineType(types: !1396)
!1396 = !{!733, !20, !20}
!1397 = !DILocalVariable(name: "val1", arg: 1, scope: !1394, file: !70, line: 1376, type: !20)
!1398 = !DILocation(line: 1376, column: 25, scope: !1394)
!1399 = !DILocalVariable(name: "val2", arg: 2, scope: !1394, file: !70, line: 1376, type: !20)
!1400 = !DILocation(line: 1376, column: 35, scope: !1394)
!1401 = !DILocalVariable(name: "u32Temp1", scope: !1394, file: !70, line: 1378, type: !733)
!1402 = !DILocation(line: 1378, column: 6, scope: !1394)
!1403 = !DILocalVariable(name: "u32Temp2", scope: !1394, file: !70, line: 1378, type: !733)
!1404 = !DILocation(line: 1378, column: 17, scope: !1394)
!1405 = !DILocalVariable(name: "u32Temp3", scope: !1394, file: !70, line: 1378, type: !733)
!1406 = !DILocation(line: 1378, column: 27, scope: !1394)
!1407 = !DILocalVariable(name: "u8SignBit", scope: !1394, file: !70, line: 1379, type: !24)
!1408 = !DILocation(line: 1379, column: 5, scope: !1394)
!1409 = !DILocation(line: 1381, column: 5, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1394, file: !70, line: 1381, column: 5)
!1411 = !DILocation(line: 1381, column: 9, scope: !1410)
!1412 = !DILocation(line: 1381, column: 5, scope: !1394)
!1413 = !DILocation(line: 1382, column: 15, scope: !1410)
!1414 = !DILocation(line: 1382, column: 14, scope: !1410)
!1415 = !DILocation(line: 1382, column: 12, scope: !1410)
!1416 = !DILocation(line: 1382, column: 3, scope: !1410)
!1417 = !DILocation(line: 1384, column: 14, scope: !1410)
!1418 = !DILocation(line: 1384, column: 12, scope: !1410)
!1419 = !DILocation(line: 1386, column: 5, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1394, file: !70, line: 1386, column: 5)
!1421 = !DILocation(line: 1386, column: 9, scope: !1420)
!1422 = !DILocation(line: 1386, column: 5, scope: !1394)
!1423 = !DILocation(line: 1387, column: 15, scope: !1420)
!1424 = !DILocation(line: 1387, column: 14, scope: !1420)
!1425 = !DILocation(line: 1387, column: 12, scope: !1420)
!1426 = !DILocation(line: 1387, column: 3, scope: !1420)
!1427 = !DILocation(line: 1389, column: 14, scope: !1420)
!1428 = !DILocation(line: 1389, column: 12, scope: !1420)
!1429 = !DILocation(line: 1391, column: 6, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1394, file: !70, line: 1391, column: 5)
!1431 = !DILocation(line: 1391, column: 10, scope: !1430)
!1432 = !DILocation(line: 1391, column: 13, scope: !1430)
!1433 = !DILocation(line: 1391, column: 28, scope: !1430)
!1434 = !DILocation(line: 1391, column: 32, scope: !1430)
!1435 = !DILocation(line: 1391, column: 35, scope: !1430)
!1436 = !DILocation(line: 1392, column: 12, scope: !1430)
!1437 = !DILocation(line: 1392, column: 3, scope: !1430)
!1438 = !DILocation(line: 1394, column: 12, scope: !1430)
!1439 = !DILocation(line: 1395, column: 29, scope: !1394)
!1440 = !DILocation(line: 1395, column: 38, scope: !1394)
!1441 = !DILocation(line: 1395, column: 13, scope: !1394)
!1442 = !DILocation(line: 1395, column: 11, scope: !1394)
!1443 = !DILocation(line: 1397, column: 5, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1394, file: !70, line: 1397, column: 5)
!1445 = !DILocation(line: 1397, column: 14, scope: !1444)
!1446 = !DILocation(line: 1397, column: 5, scope: !1394)
!1447 = !DILocation(line: 1399, column: 3, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1444, file: !70, line: 1398, column: 2)
!1449 = !DILocation(line: 1403, column: 10, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1444, file: !70, line: 1402, column: 2)
!1451 = !DILocation(line: 1403, column: 3, scope: !1450)
!1452 = !DILocation(line: 1454, column: 1, scope: !1394)
!1453 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !70, file: !70, line: 1469, type: !1454, scopeLine: 1470, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1454 = !DISubroutineType(types: !1455)
!1455 = !{!733, !733, !733}
!1456 = !DILocalVariable(name: "val1", arg: 1, scope: !1453, file: !70, line: 1469, type: !733)
!1457 = !DILocation(line: 1469, column: 25, scope: !1453)
!1458 = !DILocalVariable(name: "val2", arg: 2, scope: !1453, file: !70, line: 1469, type: !733)
!1459 = !DILocation(line: 1469, column: 35, scope: !1453)
!1460 = !DILocalVariable(name: "u32Temp1", scope: !1453, file: !70, line: 1471, type: !733)
!1461 = !DILocation(line: 1471, column: 6, scope: !1453)
!1462 = !DILocation(line: 1472, column: 5, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1453, file: !70, line: 1472, column: 5)
!1464 = !DILocation(line: 1472, column: 10, scope: !1463)
!1465 = !DILocation(line: 1472, column: 5, scope: !1453)
!1466 = !DILocation(line: 1474, column: 26, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1463, file: !70, line: 1473, column: 2)
!1468 = !DILocation(line: 1474, column: 25, scope: !1467)
!1469 = !DILocation(line: 1474, column: 12, scope: !1467)
!1470 = !DILocation(line: 1475, column: 6, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1467, file: !70, line: 1475, column: 6)
!1472 = !DILocation(line: 1475, column: 17, scope: !1471)
!1473 = !DILocation(line: 1475, column: 15, scope: !1471)
!1474 = !DILocation(line: 1475, column: 6, scope: !1467)
!1475 = !DILocation(line: 1477, column: 4, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1471, file: !70, line: 1476, column: 3)
!1477 = !DILocation(line: 1481, column: 12, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1471, file: !70, line: 1480, column: 3)
!1479 = !DILocation(line: 1481, column: 19, scope: !1478)
!1480 = !DILocation(line: 1481, column: 17, scope: !1478)
!1481 = !DILocation(line: 1481, column: 4, scope: !1478)
!1482 = !DILocation(line: 1486, column: 3, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1463, file: !70, line: 1485, column: 2)
!1484 = !DILocation(line: 1488, column: 1, scope: !1453)
!1485 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !70, file: !70, line: 1515, type: !1159, scopeLine: 1516, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1486 = !DILocalVariable(name: "value", arg: 1, scope: !1485, file: !70, line: 1515, type: !733)
!1487 = !DILocation(line: 1515, column: 30, scope: !1485)
!1488 = !DILocalVariable(name: "factor", arg: 2, scope: !1485, file: !70, line: 1515, type: !29)
!1489 = !DILocation(line: 1515, column: 41, scope: !1485)
!1490 = !DILocalVariable(name: "u32Temp1", scope: !1485, file: !70, line: 1517, type: !733)
!1491 = !DILocation(line: 1517, column: 6, scope: !1485)
!1492 = !DILocalVariable(name: "u32Temp2", scope: !1485, file: !70, line: 1517, type: !733)
!1493 = !DILocation(line: 1517, column: 20, scope: !1485)
!1494 = !DILocation(line: 1518, column: 13, scope: !1485)
!1495 = !DILocation(line: 1518, column: 21, scope: !1485)
!1496 = !DILocation(line: 1518, column: 19, scope: !1485)
!1497 = !DILocation(line: 1518, column: 11, scope: !1485)
!1498 = !DILocation(line: 1519, column: 25, scope: !1485)
!1499 = !DILocation(line: 1519, column: 32, scope: !1485)
!1500 = !DILocation(line: 1519, column: 13, scope: !1485)
!1501 = !DILocation(line: 1519, column: 11, scope: !1485)
!1502 = !DILocation(line: 1520, column: 14, scope: !1485)
!1503 = !DILocation(line: 1520, column: 23, scope: !1485)
!1504 = !DILocation(line: 1520, column: 11, scope: !1485)
!1505 = !DILocation(line: 1521, column: 14, scope: !1485)
!1506 = !DILocation(line: 1521, column: 23, scope: !1485)
!1507 = !DILocation(line: 1521, column: 11, scope: !1485)
!1508 = !DILocation(line: 1522, column: 9, scope: !1485)
!1509 = !DILocation(line: 1522, column: 2, scope: !1485)
!1510 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !70, file: !70, line: 1541, type: !1159, scopeLine: 1542, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1511 = !DILocalVariable(name: "value", arg: 1, scope: !1510, file: !70, line: 1541, type: !733)
!1512 = !DILocation(line: 1541, column: 30, scope: !1510)
!1513 = !DILocalVariable(name: "factor", arg: 2, scope: !1510, file: !70, line: 1541, type: !29)
!1514 = !DILocation(line: 1541, column: 41, scope: !1510)
!1515 = !DILocalVariable(name: "u32Temp1", scope: !1510, file: !70, line: 1543, type: !733)
!1516 = !DILocation(line: 1543, column: 6, scope: !1510)
!1517 = !DILocalVariable(name: "u32Temp2", scope: !1510, file: !70, line: 1543, type: !733)
!1518 = !DILocation(line: 1543, column: 20, scope: !1510)
!1519 = !DILocation(line: 1544, column: 13, scope: !1510)
!1520 = !DILocation(line: 1544, column: 21, scope: !1510)
!1521 = !DILocation(line: 1544, column: 19, scope: !1510)
!1522 = !DILocation(line: 1544, column: 11, scope: !1510)
!1523 = !DILocation(line: 1545, column: 25, scope: !1510)
!1524 = !DILocation(line: 1545, column: 32, scope: !1510)
!1525 = !DILocation(line: 1545, column: 13, scope: !1510)
!1526 = !DILocation(line: 1545, column: 11, scope: !1510)
!1527 = !DILocation(line: 1546, column: 13, scope: !1510)
!1528 = !DILocation(line: 1546, column: 22, scope: !1510)
!1529 = !DILocation(line: 1546, column: 11, scope: !1510)
!1530 = !DILocation(line: 1547, column: 14, scope: !1510)
!1531 = !DILocation(line: 1547, column: 23, scope: !1510)
!1532 = !DILocation(line: 1547, column: 11, scope: !1510)
!1533 = !DILocation(line: 1548, column: 6, scope: !1534)
!1534 = distinct !DILexicalBlock(scope: !1510, file: !70, line: 1548, column: 5)
!1535 = !DILocation(line: 1548, column: 14, scope: !1534)
!1536 = !DILocation(line: 1548, column: 20, scope: !1534)
!1537 = !DILocation(line: 1548, column: 5, scope: !1510)
!1538 = !DILocation(line: 1550, column: 10, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1534, file: !70, line: 1549, column: 2)
!1540 = !DILocation(line: 1550, column: 3, scope: !1539)
!1541 = !DILocation(line: 1554, column: 3, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1534, file: !70, line: 1553, column: 2)
!1543 = !DILocation(line: 1556, column: 1, scope: !1510)
!1544 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !70, file: !70, line: 1574, type: !1545, scopeLine: 1575, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1545 = !DISubroutineType(types: !1546)
!1546 = !{!733, !733, !13}
!1547 = !DILocalVariable(name: "value", arg: 1, scope: !1544, file: !70, line: 1574, type: !733)
!1548 = !DILocation(line: 1574, column: 30, scope: !1544)
!1549 = !DILocalVariable(name: "factor", arg: 2, scope: !1544, file: !70, line: 1574, type: !13)
!1550 = !DILocation(line: 1574, column: 41, scope: !1544)
!1551 = !DILocalVariable(name: "u32Temp1", scope: !1544, file: !70, line: 1576, type: !733)
!1552 = !DILocation(line: 1576, column: 6, scope: !1544)
!1553 = !DILocalVariable(name: "u32Temp2", scope: !1544, file: !70, line: 1576, type: !733)
!1554 = !DILocation(line: 1576, column: 20, scope: !1544)
!1555 = !DILocation(line: 1577, column: 5, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1544, file: !70, line: 1577, column: 5)
!1557 = !DILocation(line: 1577, column: 12, scope: !1556)
!1558 = !DILocation(line: 1577, column: 5, scope: !1544)
!1559 = !DILocation(line: 1580, column: 14, scope: !1560)
!1560 = distinct !DILexicalBlock(scope: !1556, file: !70, line: 1578, column: 2)
!1561 = !DILocation(line: 1580, column: 22, scope: !1560)
!1562 = !DILocation(line: 1580, column: 20, scope: !1560)
!1563 = !DILocation(line: 1580, column: 12, scope: !1560)
!1564 = !DILocation(line: 1581, column: 26, scope: !1560)
!1565 = !DILocation(line: 1581, column: 33, scope: !1560)
!1566 = !DILocation(line: 1581, column: 14, scope: !1560)
!1567 = !DILocation(line: 1581, column: 12, scope: !1560)
!1568 = !DILocation(line: 1582, column: 14, scope: !1560)
!1569 = !DILocation(line: 1582, column: 23, scope: !1560)
!1570 = !DILocation(line: 1582, column: 12, scope: !1560)
!1571 = !DILocation(line: 1583, column: 15, scope: !1560)
!1572 = !DILocation(line: 1583, column: 24, scope: !1560)
!1573 = !DILocation(line: 1583, column: 12, scope: !1560)
!1574 = !DILocation(line: 1584, column: 10, scope: !1560)
!1575 = !DILocation(line: 1584, column: 3, scope: !1560)
!1576 = !DILocation(line: 1588, column: 3, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1556, file: !70, line: 1587, column: 2)
!1578 = !DILocation(line: 1590, column: 1, scope: !1544)
!1579 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !70, file: !70, line: 1609, type: !1545, scopeLine: 1610, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1580 = !DILocalVariable(name: "value", arg: 1, scope: !1579, file: !70, line: 1609, type: !733)
!1581 = !DILocation(line: 1609, column: 31, scope: !1579)
!1582 = !DILocalVariable(name: "factor", arg: 2, scope: !1579, file: !70, line: 1609, type: !13)
!1583 = !DILocation(line: 1609, column: 42, scope: !1579)
!1584 = !DILocalVariable(name: "u32Temp1", scope: !1579, file: !70, line: 1611, type: !733)
!1585 = !DILocation(line: 1611, column: 6, scope: !1579)
!1586 = !DILocalVariable(name: "u32Temp2", scope: !1579, file: !70, line: 1611, type: !733)
!1587 = !DILocation(line: 1611, column: 20, scope: !1579)
!1588 = !DILocation(line: 1612, column: 5, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1579, file: !70, line: 1612, column: 5)
!1590 = !DILocation(line: 1612, column: 12, scope: !1589)
!1591 = !DILocation(line: 1612, column: 5, scope: !1579)
!1592 = !DILocation(line: 1614, column: 3, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1589, file: !70, line: 1613, column: 2)
!1594 = !DILocation(line: 1618, column: 14, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1589, file: !70, line: 1617, column: 2)
!1596 = !DILocation(line: 1618, column: 22, scope: !1595)
!1597 = !DILocation(line: 1618, column: 20, scope: !1595)
!1598 = !DILocation(line: 1618, column: 12, scope: !1595)
!1599 = !DILocation(line: 1619, column: 26, scope: !1595)
!1600 = !DILocation(line: 1619, column: 33, scope: !1595)
!1601 = !DILocation(line: 1619, column: 14, scope: !1595)
!1602 = !DILocation(line: 1619, column: 12, scope: !1595)
!1603 = !DILocation(line: 1620, column: 14, scope: !1595)
!1604 = !DILocation(line: 1620, column: 23, scope: !1595)
!1605 = !DILocation(line: 1620, column: 12, scope: !1595)
!1606 = !DILocation(line: 1621, column: 15, scope: !1595)
!1607 = !DILocation(line: 1621, column: 24, scope: !1595)
!1608 = !DILocation(line: 1621, column: 12, scope: !1595)
!1609 = !DILocation(line: 1622, column: 7, scope: !1610)
!1610 = distinct !DILexicalBlock(scope: !1595, file: !70, line: 1622, column: 6)
!1611 = !DILocation(line: 1622, column: 16, scope: !1610)
!1612 = !DILocation(line: 1622, column: 23, scope: !1610)
!1613 = !DILocation(line: 1622, column: 6, scope: !1595)
!1614 = !DILocation(line: 1624, column: 11, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1610, file: !70, line: 1623, column: 3)
!1616 = !DILocation(line: 1624, column: 4, scope: !1615)
!1617 = !DILocation(line: 1628, column: 4, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1610, file: !70, line: 1627, column: 3)
!1619 = !DILocation(line: 1631, column: 1, scope: !1579)
!1620 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !70, file: !70, line: 1646, type: !1454, scopeLine: 1647, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1621 = !DILocalVariable(name: "value", arg: 1, scope: !1620, file: !70, line: 1646, type: !733)
!1622 = !DILocation(line: 1646, column: 30, scope: !1620)
!1623 = !DILocalVariable(name: "factor", arg: 2, scope: !1620, file: !70, line: 1646, type: !733)
!1624 = !DILocation(line: 1646, column: 40, scope: !1620)
!1625 = !DILocation(line: 1648, column: 21, scope: !1620)
!1626 = !DILocation(line: 1648, column: 28, scope: !1620)
!1627 = !DILocation(line: 1648, column: 9, scope: !1620)
!1628 = !DILocation(line: 1648, column: 2, scope: !1620)
!1629 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !70, file: !70, line: 1667, type: !1454, scopeLine: 1668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1630 = !DILocalVariable(name: "value", arg: 1, scope: !1629, file: !70, line: 1667, type: !733)
!1631 = !DILocation(line: 1667, column: 30, scope: !1629)
!1632 = !DILocalVariable(name: "factor", arg: 2, scope: !1629, file: !70, line: 1667, type: !733)
!1633 = !DILocation(line: 1667, column: 40, scope: !1629)
!1634 = !DILocalVariable(name: "u32Temp1", scope: !1629, file: !70, line: 1669, type: !733)
!1635 = !DILocation(line: 1669, column: 6, scope: !1629)
!1636 = !DILocalVariable(name: "u32Temp2", scope: !1629, file: !70, line: 1669, type: !733)
!1637 = !DILocation(line: 1669, column: 20, scope: !1629)
!1638 = !DILocation(line: 1670, column: 13, scope: !1629)
!1639 = !DILocation(line: 1670, column: 21, scope: !1629)
!1640 = !DILocation(line: 1670, column: 19, scope: !1629)
!1641 = !DILocation(line: 1670, column: 11, scope: !1629)
!1642 = !DILocation(line: 1671, column: 25, scope: !1629)
!1643 = !DILocation(line: 1671, column: 32, scope: !1629)
!1644 = !DILocation(line: 1671, column: 13, scope: !1629)
!1645 = !DILocation(line: 1671, column: 11, scope: !1629)
!1646 = !DILocation(line: 1672, column: 13, scope: !1629)
!1647 = !DILocation(line: 1672, column: 22, scope: !1629)
!1648 = !DILocation(line: 1672, column: 11, scope: !1629)
!1649 = !DILocation(line: 1673, column: 14, scope: !1629)
!1650 = !DILocation(line: 1673, column: 23, scope: !1629)
!1651 = !DILocation(line: 1673, column: 11, scope: !1629)
!1652 = !DILocation(line: 1674, column: 6, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1629, file: !70, line: 1674, column: 5)
!1654 = !DILocation(line: 1674, column: 14, scope: !1653)
!1655 = !DILocation(line: 1674, column: 20, scope: !1653)
!1656 = !DILocation(line: 1674, column: 5, scope: !1629)
!1657 = !DILocation(line: 1676, column: 10, scope: !1658)
!1658 = distinct !DILexicalBlock(scope: !1653, file: !70, line: 1675, column: 2)
!1659 = !DILocation(line: 1676, column: 3, scope: !1658)
!1660 = !DILocation(line: 1680, column: 3, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1653, file: !70, line: 1679, column: 2)
!1662 = !DILocation(line: 1682, column: 1, scope: !1629)
!1663 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !70, file: !70, line: 1700, type: !1363, scopeLine: 1701, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1664 = !DILocalVariable(name: "value", arg: 1, scope: !1663, file: !70, line: 1700, type: !733)
!1665 = !DILocation(line: 1700, column: 30, scope: !1663)
!1666 = !DILocalVariable(name: "factor", arg: 2, scope: !1663, file: !70, line: 1700, type: !20)
!1667 = !DILocation(line: 1700, column: 40, scope: !1663)
!1668 = !DILocalVariable(name: "u32Temp1", scope: !1663, file: !70, line: 1702, type: !733)
!1669 = !DILocation(line: 1702, column: 6, scope: !1663)
!1670 = !DILocalVariable(name: "u32Temp2", scope: !1663, file: !70, line: 1702, type: !733)
!1671 = !DILocation(line: 1702, column: 20, scope: !1663)
!1672 = !DILocation(line: 1703, column: 5, scope: !1673)
!1673 = distinct !DILexicalBlock(scope: !1663, file: !70, line: 1703, column: 5)
!1674 = !DILocation(line: 1703, column: 12, scope: !1673)
!1675 = !DILocation(line: 1703, column: 5, scope: !1663)
!1676 = !DILocation(line: 1705, column: 14, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1673, file: !70, line: 1704, column: 2)
!1678 = !DILocation(line: 1705, column: 22, scope: !1677)
!1679 = !DILocation(line: 1705, column: 20, scope: !1677)
!1680 = !DILocation(line: 1705, column: 12, scope: !1677)
!1681 = !DILocation(line: 1706, column: 26, scope: !1677)
!1682 = !DILocation(line: 1706, column: 33, scope: !1677)
!1683 = !DILocation(line: 1706, column: 14, scope: !1677)
!1684 = !DILocation(line: 1706, column: 12, scope: !1677)
!1685 = !DILocation(line: 1707, column: 14, scope: !1677)
!1686 = !DILocation(line: 1707, column: 23, scope: !1677)
!1687 = !DILocation(line: 1707, column: 12, scope: !1677)
!1688 = !DILocation(line: 1708, column: 15, scope: !1677)
!1689 = !DILocation(line: 1708, column: 24, scope: !1677)
!1690 = !DILocation(line: 1708, column: 12, scope: !1677)
!1691 = !DILocation(line: 1709, column: 10, scope: !1677)
!1692 = !DILocation(line: 1709, column: 3, scope: !1677)
!1693 = !DILocation(line: 1713, column: 3, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1673, file: !70, line: 1712, column: 2)
!1695 = !DILocation(line: 1715, column: 1, scope: !1663)
!1696 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !70, file: !70, line: 1734, type: !1363, scopeLine: 1735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1697 = !DILocalVariable(name: "value", arg: 1, scope: !1696, file: !70, line: 1734, type: !733)
!1698 = !DILocation(line: 1734, column: 30, scope: !1696)
!1699 = !DILocalVariable(name: "factor", arg: 2, scope: !1696, file: !70, line: 1734, type: !20)
!1700 = !DILocation(line: 1734, column: 40, scope: !1696)
!1701 = !DILocalVariable(name: "u32Temp1", scope: !1696, file: !70, line: 1736, type: !733)
!1702 = !DILocation(line: 1736, column: 6, scope: !1696)
!1703 = !DILocalVariable(name: "u32Temp2", scope: !1696, file: !70, line: 1736, type: !733)
!1704 = !DILocation(line: 1736, column: 20, scope: !1696)
!1705 = !DILocation(line: 1737, column: 5, scope: !1706)
!1706 = distinct !DILexicalBlock(scope: !1696, file: !70, line: 1737, column: 5)
!1707 = !DILocation(line: 1737, column: 12, scope: !1706)
!1708 = !DILocation(line: 1737, column: 5, scope: !1696)
!1709 = !DILocation(line: 1739, column: 3, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1706, file: !70, line: 1738, column: 2)
!1711 = !DILocation(line: 1743, column: 14, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !70, line: 1742, column: 2)
!1713 = !DILocation(line: 1743, column: 22, scope: !1712)
!1714 = !DILocation(line: 1743, column: 20, scope: !1712)
!1715 = !DILocation(line: 1743, column: 12, scope: !1712)
!1716 = !DILocation(line: 1744, column: 26, scope: !1712)
!1717 = !DILocation(line: 1744, column: 33, scope: !1712)
!1718 = !DILocation(line: 1744, column: 14, scope: !1712)
!1719 = !DILocation(line: 1744, column: 12, scope: !1712)
!1720 = !DILocation(line: 1745, column: 14, scope: !1712)
!1721 = !DILocation(line: 1745, column: 23, scope: !1712)
!1722 = !DILocation(line: 1745, column: 12, scope: !1712)
!1723 = !DILocation(line: 1746, column: 15, scope: !1712)
!1724 = !DILocation(line: 1746, column: 24, scope: !1712)
!1725 = !DILocation(line: 1746, column: 12, scope: !1712)
!1726 = !DILocation(line: 1747, column: 7, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1712, file: !70, line: 1747, column: 6)
!1728 = !DILocation(line: 1747, column: 15, scope: !1727)
!1729 = !DILocation(line: 1747, column: 21, scope: !1727)
!1730 = !DILocation(line: 1747, column: 6, scope: !1712)
!1731 = !DILocation(line: 1749, column: 11, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1727, file: !70, line: 1748, column: 3)
!1733 = !DILocation(line: 1749, column: 4, scope: !1732)
!1734 = !DILocation(line: 1753, column: 4, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1727, file: !70, line: 1752, column: 3)
!1736 = !DILocation(line: 1756, column: 1, scope: !1696)
!1737 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !70, file: !70, line: 1771, type: !1738, scopeLine: 1772, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1738 = !DISubroutineType(types: !1739)
!1739 = !{!20, !733, !20}
!1740 = !DILocalVariable(name: "val1", arg: 1, scope: !1737, file: !70, line: 1771, type: !733)
!1741 = !DILocation(line: 1771, column: 25, scope: !1737)
!1742 = !DILocalVariable(name: "val2", arg: 2, scope: !1737, file: !70, line: 1771, type: !20)
!1743 = !DILocation(line: 1771, column: 35, scope: !1737)
!1744 = !DILocalVariable(name: "s32Val2prime", scope: !1737, file: !70, line: 1773, type: !20)
!1745 = !DILocation(line: 1773, column: 6, scope: !1737)
!1746 = !DILocation(line: 1774, column: 5, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1737, file: !70, line: 1774, column: 5)
!1748 = !DILocation(line: 1774, column: 10, scope: !1747)
!1749 = !DILocation(line: 1774, column: 5, scope: !1737)
!1750 = !DILocation(line: 1776, column: 19, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1747, file: !70, line: 1775, column: 2)
!1752 = !DILocation(line: 1776, column: 18, scope: !1751)
!1753 = !DILocation(line: 1776, column: 16, scope: !1751)
!1754 = !DILocation(line: 1777, column: 2, scope: !1751)
!1755 = !DILocation(line: 1778, column: 5, scope: !1756)
!1756 = distinct !DILexicalBlock(scope: !1737, file: !70, line: 1778, column: 5)
!1757 = !DILocation(line: 1778, column: 10, scope: !1756)
!1758 = !DILocation(line: 1778, column: 5, scope: !1737)
!1759 = !DILocation(line: 1780, column: 6, scope: !1760)
!1760 = distinct !DILexicalBlock(scope: !1761, file: !70, line: 1780, column: 6)
!1761 = distinct !DILexicalBlock(scope: !1756, file: !70, line: 1779, column: 2)
!1762 = !DILocation(line: 1780, column: 11, scope: !1760)
!1763 = !DILocation(line: 1780, column: 6, scope: !1761)
!1764 = !DILocation(line: 1782, column: 21, scope: !1765)
!1765 = distinct !DILexicalBlock(scope: !1766, file: !70, line: 1782, column: 7)
!1766 = distinct !DILexicalBlock(scope: !1760, file: !70, line: 1781, column: 3)
!1767 = !DILocation(line: 1782, column: 19, scope: !1765)
!1768 = !DILocation(line: 1782, column: 37, scope: !1765)
!1769 = !DILocation(line: 1782, column: 35, scope: !1765)
!1770 = !DILocation(line: 1782, column: 7, scope: !1766)
!1771 = !DILocation(line: 1784, column: 13, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1765, file: !70, line: 1783, column: 4)
!1773 = !DILocation(line: 1784, column: 20, scope: !1772)
!1774 = !DILocation(line: 1784, column: 18, scope: !1772)
!1775 = !DILocation(line: 1784, column: 5, scope: !1772)
!1776 = !DILocation(line: 1788, column: 5, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1765, file: !70, line: 1787, column: 4)
!1778 = !DILocation(line: 1793, column: 21, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !1780, file: !70, line: 1793, column: 7)
!1780 = distinct !DILexicalBlock(scope: !1760, file: !70, line: 1792, column: 3)
!1781 = !DILocation(line: 1793, column: 19, scope: !1779)
!1782 = !DILocation(line: 1793, column: 29, scope: !1779)
!1783 = !DILocation(line: 1793, column: 27, scope: !1779)
!1784 = !DILocation(line: 1793, column: 7, scope: !1780)
!1785 = !DILocation(line: 1795, column: 5, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1779, file: !70, line: 1794, column: 4)
!1787 = !DILocation(line: 1799, column: 13, scope: !1788)
!1788 = distinct !DILexicalBlock(scope: !1779, file: !70, line: 1798, column: 4)
!1789 = !DILocation(line: 1799, column: 20, scope: !1788)
!1790 = !DILocation(line: 1799, column: 18, scope: !1788)
!1791 = !DILocation(line: 1799, column: 5, scope: !1788)
!1792 = !DILocation(line: 1805, column: 3, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1756, file: !70, line: 1804, column: 2)
!1794 = !DILocation(line: 1807, column: 1, scope: !1737)
!1795 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !70, file: !70, line: 1824, type: !772, scopeLine: 1825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1796 = !DILocalVariable(name: "val1", arg: 1, scope: !1795, file: !70, line: 1824, type: !20)
!1797 = !DILocation(line: 1824, column: 30, scope: !1795)
!1798 = !DILocalVariable(name: "val2", arg: 2, scope: !1795, file: !70, line: 1824, type: !29)
!1799 = !DILocation(line: 1824, column: 39, scope: !1795)
!1800 = !DILocalVariable(name: "u32Temp1", scope: !1795, file: !70, line: 1826, type: !733)
!1801 = !DILocation(line: 1826, column: 6, scope: !1795)
!1802 = !DILocalVariable(name: "u32Temp2", scope: !1795, file: !70, line: 1826, type: !733)
!1803 = !DILocation(line: 1826, column: 17, scope: !1795)
!1804 = !DILocalVariable(name: "u32Temp3", scope: !1795, file: !70, line: 1826, type: !733)
!1805 = !DILocation(line: 1826, column: 26, scope: !1795)
!1806 = !DILocalVariable(name: "u8SignBit", scope: !1795, file: !70, line: 1827, type: !24)
!1807 = !DILocation(line: 1827, column: 5, scope: !1795)
!1808 = !DILocation(line: 1829, column: 5, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1795, file: !70, line: 1829, column: 5)
!1810 = !DILocation(line: 1829, column: 9, scope: !1809)
!1811 = !DILocation(line: 1829, column: 5, scope: !1795)
!1812 = !DILocation(line: 1831, column: 15, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1809, file: !70, line: 1830, column: 2)
!1814 = !DILocation(line: 1831, column: 14, scope: !1813)
!1815 = !DILocation(line: 1831, column: 12, scope: !1813)
!1816 = !DILocation(line: 1832, column: 13, scope: !1813)
!1817 = !DILocation(line: 1833, column: 2, scope: !1813)
!1818 = !DILocation(line: 1836, column: 14, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1809, file: !70, line: 1835, column: 2)
!1820 = !DILocation(line: 1836, column: 12, scope: !1819)
!1821 = !DILocation(line: 1837, column: 13, scope: !1819)
!1822 = !DILocation(line: 1840, column: 13, scope: !1795)
!1823 = !DILocation(line: 1840, column: 24, scope: !1795)
!1824 = !DILocation(line: 1840, column: 22, scope: !1795)
!1825 = !DILocation(line: 1840, column: 11, scope: !1795)
!1826 = !DILocation(line: 1841, column: 25, scope: !1795)
!1827 = !DILocation(line: 1841, column: 35, scope: !1795)
!1828 = !DILocation(line: 1841, column: 13, scope: !1795)
!1829 = !DILocation(line: 1841, column: 11, scope: !1795)
!1830 = !DILocation(line: 1842, column: 13, scope: !1795)
!1831 = !DILocation(line: 1842, column: 22, scope: !1795)
!1832 = !DILocation(line: 1842, column: 11, scope: !1795)
!1833 = !DILocation(line: 1843, column: 14, scope: !1795)
!1834 = !DILocation(line: 1843, column: 23, scope: !1795)
!1835 = !DILocation(line: 1843, column: 11, scope: !1795)
!1836 = !DILocation(line: 1844, column: 5, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1795, file: !70, line: 1844, column: 5)
!1838 = !DILocation(line: 1844, column: 15, scope: !1837)
!1839 = !DILocation(line: 1844, column: 5, scope: !1795)
!1840 = !DILocation(line: 1846, column: 10, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1837, file: !70, line: 1845, column: 2)
!1842 = !DILocation(line: 1846, column: 3, scope: !1841)
!1843 = !DILocation(line: 1850, column: 11, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1837, file: !70, line: 1849, column: 2)
!1845 = !DILocation(line: 1850, column: 10, scope: !1844)
!1846 = !DILocation(line: 1850, column: 3, scope: !1844)
!1847 = !DILocation(line: 1852, column: 1, scope: !1795)
!1848 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !70, file: !70, line: 1871, type: !772, scopeLine: 1872, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1849 = !DILocalVariable(name: "val1", arg: 1, scope: !1848, file: !70, line: 1871, type: !20)
!1850 = !DILocation(line: 1871, column: 30, scope: !1848)
!1851 = !DILocalVariable(name: "val2", arg: 2, scope: !1848, file: !70, line: 1871, type: !29)
!1852 = !DILocation(line: 1871, column: 39, scope: !1848)
!1853 = !DILocalVariable(name: "u32Temp1", scope: !1848, file: !70, line: 1873, type: !733)
!1854 = !DILocation(line: 1873, column: 6, scope: !1848)
!1855 = !DILocalVariable(name: "u32Temp2", scope: !1848, file: !70, line: 1873, type: !733)
!1856 = !DILocation(line: 1873, column: 17, scope: !1848)
!1857 = !DILocalVariable(name: "u32Temp3", scope: !1848, file: !70, line: 1873, type: !733)
!1858 = !DILocation(line: 1873, column: 26, scope: !1848)
!1859 = !DILocalVariable(name: "u8SignBit", scope: !1848, file: !70, line: 1874, type: !24)
!1860 = !DILocation(line: 1874, column: 5, scope: !1848)
!1861 = !DILocation(line: 1876, column: 5, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1848, file: !70, line: 1876, column: 5)
!1863 = !DILocation(line: 1876, column: 9, scope: !1862)
!1864 = !DILocation(line: 1876, column: 5, scope: !1848)
!1865 = !DILocation(line: 1878, column: 15, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1862, file: !70, line: 1877, column: 2)
!1867 = !DILocation(line: 1878, column: 14, scope: !1866)
!1868 = !DILocation(line: 1878, column: 12, scope: !1866)
!1869 = !DILocation(line: 1879, column: 13, scope: !1866)
!1870 = !DILocation(line: 1880, column: 2, scope: !1866)
!1871 = !DILocation(line: 1883, column: 14, scope: !1872)
!1872 = distinct !DILexicalBlock(scope: !1862, file: !70, line: 1882, column: 2)
!1873 = !DILocation(line: 1883, column: 12, scope: !1872)
!1874 = !DILocation(line: 1884, column: 13, scope: !1872)
!1875 = !DILocation(line: 1887, column: 13, scope: !1848)
!1876 = !DILocation(line: 1887, column: 24, scope: !1848)
!1877 = !DILocation(line: 1887, column: 22, scope: !1848)
!1878 = !DILocation(line: 1887, column: 11, scope: !1848)
!1879 = !DILocation(line: 1888, column: 25, scope: !1848)
!1880 = !DILocation(line: 1888, column: 35, scope: !1848)
!1881 = !DILocation(line: 1888, column: 13, scope: !1848)
!1882 = !DILocation(line: 1888, column: 11, scope: !1848)
!1883 = !DILocation(line: 1889, column: 13, scope: !1848)
!1884 = !DILocation(line: 1889, column: 22, scope: !1848)
!1885 = !DILocation(line: 1889, column: 11, scope: !1848)
!1886 = !DILocation(line: 1890, column: 14, scope: !1848)
!1887 = !DILocation(line: 1890, column: 23, scope: !1848)
!1888 = !DILocation(line: 1890, column: 11, scope: !1848)
!1889 = !DILocation(line: 1891, column: 5, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1848, file: !70, line: 1891, column: 5)
!1891 = !DILocation(line: 1891, column: 15, scope: !1890)
!1892 = !DILocation(line: 1891, column: 5, scope: !1848)
!1893 = !DILocation(line: 1893, column: 6, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1895, file: !70, line: 1893, column: 6)
!1895 = distinct !DILexicalBlock(scope: !1890, file: !70, line: 1892, column: 2)
!1896 = !DILocation(line: 1893, column: 14, scope: !1894)
!1897 = !DILocation(line: 1893, column: 6, scope: !1895)
!1898 = !DILocation(line: 1894, column: 11, scope: !1894)
!1899 = !DILocation(line: 1894, column: 4, scope: !1894)
!1900 = !DILocation(line: 1896, column: 4, scope: !1894)
!1901 = !DILocation(line: 1900, column: 6, scope: !1902)
!1902 = distinct !DILexicalBlock(scope: !1903, file: !70, line: 1900, column: 6)
!1903 = distinct !DILexicalBlock(scope: !1890, file: !70, line: 1899, column: 2)
!1904 = !DILocation(line: 1900, column: 14, scope: !1902)
!1905 = !DILocation(line: 1900, column: 6, scope: !1903)
!1906 = !DILocation(line: 1901, column: 12, scope: !1902)
!1907 = !DILocation(line: 1901, column: 11, scope: !1902)
!1908 = !DILocation(line: 1901, column: 4, scope: !1902)
!1909 = !DILocation(line: 1903, column: 4, scope: !1902)
!1910 = !DILocation(line: 1905, column: 1, scope: !1848)
!1911 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !70, file: !70, line: 1925, type: !1912, scopeLine: 1926, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1912 = !DISubroutineType(types: !1913)
!1913 = !{!20, !20, !13}
!1914 = !DILocalVariable(name: "val1", arg: 1, scope: !1911, file: !70, line: 1925, type: !20)
!1915 = !DILocation(line: 1925, column: 30, scope: !1911)
!1916 = !DILocalVariable(name: "val2", arg: 2, scope: !1911, file: !70, line: 1925, type: !13)
!1917 = !DILocation(line: 1925, column: 39, scope: !1911)
!1918 = !DILocalVariable(name: "u32Temp1", scope: !1911, file: !70, line: 1927, type: !733)
!1919 = !DILocation(line: 1927, column: 6, scope: !1911)
!1920 = !DILocalVariable(name: "u32Temp2", scope: !1911, file: !70, line: 1927, type: !733)
!1921 = !DILocation(line: 1927, column: 17, scope: !1911)
!1922 = !DILocalVariable(name: "u32Temp3", scope: !1911, file: !70, line: 1927, type: !733)
!1923 = !DILocation(line: 1927, column: 26, scope: !1911)
!1924 = !DILocalVariable(name: "u32Temp4", scope: !1911, file: !70, line: 1927, type: !733)
!1925 = !DILocation(line: 1927, column: 35, scope: !1911)
!1926 = !DILocalVariable(name: "u8SignBit", scope: !1911, file: !70, line: 1928, type: !24)
!1927 = !DILocation(line: 1928, column: 5, scope: !1911)
!1928 = !DILocation(line: 1930, column: 7, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1911, file: !70, line: 1930, column: 5)
!1930 = !DILocation(line: 1930, column: 11, scope: !1929)
!1931 = !DILocation(line: 1930, column: 15, scope: !1929)
!1932 = !DILocation(line: 1930, column: 19, scope: !1929)
!1933 = !DILocation(line: 1930, column: 23, scope: !1929)
!1934 = !DILocation(line: 1930, column: 28, scope: !1929)
!1935 = !DILocation(line: 1930, column: 33, scope: !1929)
!1936 = !DILocation(line: 1930, column: 37, scope: !1929)
!1937 = !DILocation(line: 1930, column: 41, scope: !1929)
!1938 = !DILocation(line: 1930, column: 45, scope: !1929)
!1939 = !DILocation(line: 1930, column: 49, scope: !1929)
!1940 = !DILocation(line: 1930, column: 5, scope: !1911)
!1941 = !DILocation(line: 1932, column: 13, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1929, file: !70, line: 1931, column: 2)
!1943 = !DILocation(line: 1933, column: 2, scope: !1942)
!1944 = !DILocation(line: 1936, column: 13, scope: !1945)
!1945 = distinct !DILexicalBlock(scope: !1929, file: !70, line: 1935, column: 2)
!1946 = !DILocation(line: 1939, column: 5, scope: !1947)
!1947 = distinct !DILexicalBlock(scope: !1911, file: !70, line: 1939, column: 5)
!1948 = !DILocation(line: 1939, column: 9, scope: !1947)
!1949 = !DILocation(line: 1939, column: 5, scope: !1911)
!1950 = !DILocation(line: 1941, column: 15, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1947, file: !70, line: 1940, column: 2)
!1952 = !DILocation(line: 1941, column: 14, scope: !1951)
!1953 = !DILocation(line: 1941, column: 12, scope: !1951)
!1954 = !DILocation(line: 1942, column: 2, scope: !1951)
!1955 = !DILocation(line: 1945, column: 14, scope: !1956)
!1956 = distinct !DILexicalBlock(scope: !1947, file: !70, line: 1944, column: 2)
!1957 = !DILocation(line: 1945, column: 12, scope: !1956)
!1958 = !DILocation(line: 1948, column: 5, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1911, file: !70, line: 1948, column: 5)
!1960 = !DILocation(line: 1948, column: 9, scope: !1959)
!1961 = !DILocation(line: 1948, column: 5, scope: !1911)
!1962 = !DILocation(line: 1950, column: 15, scope: !1963)
!1963 = distinct !DILexicalBlock(scope: !1959, file: !70, line: 1949, column: 2)
!1964 = !DILocation(line: 1950, column: 14, scope: !1963)
!1965 = !DILocation(line: 1950, column: 12, scope: !1963)
!1966 = !DILocation(line: 1951, column: 2, scope: !1963)
!1967 = !DILocation(line: 1954, column: 14, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1959, file: !70, line: 1953, column: 2)
!1969 = !DILocation(line: 1954, column: 12, scope: !1968)
!1970 = !DILocation(line: 1957, column: 13, scope: !1911)
!1971 = !DILocation(line: 1957, column: 24, scope: !1911)
!1972 = !DILocation(line: 1957, column: 22, scope: !1911)
!1973 = !DILocation(line: 1957, column: 11, scope: !1911)
!1974 = !DILocation(line: 1958, column: 25, scope: !1911)
!1975 = !DILocation(line: 1958, column: 35, scope: !1911)
!1976 = !DILocation(line: 1958, column: 13, scope: !1911)
!1977 = !DILocation(line: 1958, column: 11, scope: !1911)
!1978 = !DILocation(line: 1959, column: 13, scope: !1911)
!1979 = !DILocation(line: 1959, column: 22, scope: !1911)
!1980 = !DILocation(line: 1959, column: 11, scope: !1911)
!1981 = !DILocation(line: 1960, column: 14, scope: !1911)
!1982 = !DILocation(line: 1960, column: 23, scope: !1911)
!1983 = !DILocation(line: 1960, column: 11, scope: !1911)
!1984 = !DILocation(line: 1961, column: 5, scope: !1985)
!1985 = distinct !DILexicalBlock(scope: !1911, file: !70, line: 1961, column: 5)
!1986 = !DILocation(line: 1961, column: 15, scope: !1985)
!1987 = !DILocation(line: 1961, column: 5, scope: !1911)
!1988 = !DILocation(line: 1963, column: 6, scope: !1989)
!1989 = distinct !DILexicalBlock(scope: !1990, file: !70, line: 1963, column: 6)
!1990 = distinct !DILexicalBlock(scope: !1985, file: !70, line: 1962, column: 2)
!1991 = !DILocation(line: 1963, column: 14, scope: !1989)
!1992 = !DILocation(line: 1963, column: 6, scope: !1990)
!1993 = !DILocation(line: 1964, column: 11, scope: !1989)
!1994 = !DILocation(line: 1964, column: 4, scope: !1989)
!1995 = !DILocation(line: 1966, column: 4, scope: !1989)
!1996 = !DILocation(line: 1970, column: 11, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1985, file: !70, line: 1969, column: 2)
!1998 = !DILocation(line: 1970, column: 10, scope: !1997)
!1999 = !DILocation(line: 1970, column: 3, scope: !1997)
!2000 = !DILocation(line: 1972, column: 1, scope: !1911)
!2001 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !70, file: !70, line: 1991, type: !1912, scopeLine: 1992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2002 = !DILocalVariable(name: "val1", arg: 1, scope: !2001, file: !70, line: 1991, type: !20)
!2003 = !DILocation(line: 1991, column: 30, scope: !2001)
!2004 = !DILocalVariable(name: "val2", arg: 2, scope: !2001, file: !70, line: 1991, type: !13)
!2005 = !DILocation(line: 1991, column: 39, scope: !2001)
!2006 = !DILocalVariable(name: "u32Temp1", scope: !2001, file: !70, line: 1993, type: !733)
!2007 = !DILocation(line: 1993, column: 6, scope: !2001)
!2008 = !DILocalVariable(name: "u32Temp2", scope: !2001, file: !70, line: 1993, type: !733)
!2009 = !DILocation(line: 1993, column: 17, scope: !2001)
!2010 = !DILocalVariable(name: "u32Temp3", scope: !2001, file: !70, line: 1993, type: !733)
!2011 = !DILocation(line: 1993, column: 26, scope: !2001)
!2012 = !DILocalVariable(name: "u32Temp4", scope: !2001, file: !70, line: 1993, type: !733)
!2013 = !DILocation(line: 1993, column: 35, scope: !2001)
!2014 = !DILocalVariable(name: "u8SignBit", scope: !2001, file: !70, line: 1994, type: !24)
!2015 = !DILocation(line: 1994, column: 5, scope: !2001)
!2016 = !DILocation(line: 1996, column: 7, scope: !2017)
!2017 = distinct !DILexicalBlock(scope: !2001, file: !70, line: 1996, column: 5)
!2018 = !DILocation(line: 1996, column: 11, scope: !2017)
!2019 = !DILocation(line: 1996, column: 15, scope: !2017)
!2020 = !DILocation(line: 1996, column: 19, scope: !2017)
!2021 = !DILocation(line: 1996, column: 23, scope: !2017)
!2022 = !DILocation(line: 1996, column: 28, scope: !2017)
!2023 = !DILocation(line: 1996, column: 33, scope: !2017)
!2024 = !DILocation(line: 1996, column: 37, scope: !2017)
!2025 = !DILocation(line: 1996, column: 41, scope: !2017)
!2026 = !DILocation(line: 1996, column: 45, scope: !2017)
!2027 = !DILocation(line: 1996, column: 49, scope: !2017)
!2028 = !DILocation(line: 1996, column: 5, scope: !2001)
!2029 = !DILocation(line: 1998, column: 13, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !2017, file: !70, line: 1997, column: 2)
!2031 = !DILocation(line: 1999, column: 2, scope: !2030)
!2032 = !DILocation(line: 2002, column: 13, scope: !2033)
!2033 = distinct !DILexicalBlock(scope: !2017, file: !70, line: 2001, column: 2)
!2034 = !DILocation(line: 2005, column: 5, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !2001, file: !70, line: 2005, column: 5)
!2036 = !DILocation(line: 2005, column: 9, scope: !2035)
!2037 = !DILocation(line: 2005, column: 5, scope: !2001)
!2038 = !DILocation(line: 2007, column: 15, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2035, file: !70, line: 2006, column: 2)
!2040 = !DILocation(line: 2007, column: 14, scope: !2039)
!2041 = !DILocation(line: 2007, column: 12, scope: !2039)
!2042 = !DILocation(line: 2008, column: 2, scope: !2039)
!2043 = !DILocation(line: 2011, column: 14, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2035, file: !70, line: 2010, column: 2)
!2045 = !DILocation(line: 2011, column: 12, scope: !2044)
!2046 = !DILocation(line: 2014, column: 5, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2001, file: !70, line: 2014, column: 5)
!2048 = !DILocation(line: 2014, column: 9, scope: !2047)
!2049 = !DILocation(line: 2014, column: 5, scope: !2001)
!2050 = !DILocation(line: 2016, column: 15, scope: !2051)
!2051 = distinct !DILexicalBlock(scope: !2047, file: !70, line: 2015, column: 2)
!2052 = !DILocation(line: 2016, column: 14, scope: !2051)
!2053 = !DILocation(line: 2016, column: 12, scope: !2051)
!2054 = !DILocation(line: 2017, column: 2, scope: !2051)
!2055 = !DILocation(line: 2020, column: 14, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2047, file: !70, line: 2019, column: 2)
!2057 = !DILocation(line: 2020, column: 12, scope: !2056)
!2058 = !DILocation(line: 2023, column: 13, scope: !2001)
!2059 = !DILocation(line: 2023, column: 24, scope: !2001)
!2060 = !DILocation(line: 2023, column: 22, scope: !2001)
!2061 = !DILocation(line: 2023, column: 11, scope: !2001)
!2062 = !DILocation(line: 2024, column: 25, scope: !2001)
!2063 = !DILocation(line: 2024, column: 35, scope: !2001)
!2064 = !DILocation(line: 2024, column: 13, scope: !2001)
!2065 = !DILocation(line: 2024, column: 11, scope: !2001)
!2066 = !DILocation(line: 2025, column: 13, scope: !2001)
!2067 = !DILocation(line: 2025, column: 22, scope: !2001)
!2068 = !DILocation(line: 2025, column: 11, scope: !2001)
!2069 = !DILocation(line: 2026, column: 14, scope: !2001)
!2070 = !DILocation(line: 2026, column: 23, scope: !2001)
!2071 = !DILocation(line: 2026, column: 11, scope: !2001)
!2072 = !DILocation(line: 2027, column: 6, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2001, file: !70, line: 2027, column: 5)
!2074 = !DILocation(line: 2027, column: 14, scope: !2073)
!2075 = !DILocation(line: 2027, column: 19, scope: !2073)
!2076 = !DILocation(line: 2027, column: 5, scope: !2001)
!2077 = !DILocation(line: 2029, column: 6, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2079, file: !70, line: 2029, column: 6)
!2079 = distinct !DILexicalBlock(scope: !2073, file: !70, line: 2028, column: 2)
!2080 = !DILocation(line: 2029, column: 16, scope: !2078)
!2081 = !DILocation(line: 2029, column: 6, scope: !2079)
!2082 = !DILocation(line: 2031, column: 7, scope: !2083)
!2083 = distinct !DILexicalBlock(scope: !2084, file: !70, line: 2031, column: 7)
!2084 = distinct !DILexicalBlock(scope: !2078, file: !70, line: 2030, column: 3)
!2085 = !DILocation(line: 2031, column: 15, scope: !2083)
!2086 = !DILocation(line: 2031, column: 7, scope: !2084)
!2087 = !DILocation(line: 2032, column: 12, scope: !2083)
!2088 = !DILocation(line: 2032, column: 5, scope: !2083)
!2089 = !DILocation(line: 2034, column: 5, scope: !2083)
!2090 = !DILocation(line: 2038, column: 7, scope: !2091)
!2091 = distinct !DILexicalBlock(scope: !2092, file: !70, line: 2038, column: 7)
!2092 = distinct !DILexicalBlock(scope: !2078, file: !70, line: 2037, column: 3)
!2093 = !DILocation(line: 2038, column: 15, scope: !2091)
!2094 = !DILocation(line: 2038, column: 7, scope: !2092)
!2095 = !DILocation(line: 2039, column: 13, scope: !2091)
!2096 = !DILocation(line: 2039, column: 12, scope: !2091)
!2097 = !DILocation(line: 2039, column: 5, scope: !2091)
!2098 = !DILocation(line: 2041, column: 5, scope: !2091)
!2099 = !DILocation(line: 2046, column: 3, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2073, file: !70, line: 2045, column: 2)
!2101 = !DILocation(line: 2048, column: 1, scope: !2001)
!2102 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !70, file: !70, line: 2063, type: !2103, scopeLine: 2064, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2103 = !DISubroutineType(types: !2104)
!2104 = !{!20, !20, !733}
!2105 = !DILocalVariable(name: "val1", arg: 1, scope: !2102, file: !70, line: 2063, type: !20)
!2106 = !DILocation(line: 2063, column: 30, scope: !2102)
!2107 = !DILocalVariable(name: "val2", arg: 2, scope: !2102, file: !70, line: 2063, type: !733)
!2108 = !DILocation(line: 2063, column: 39, scope: !2102)
!2109 = !DILocalVariable(name: "u32Temp1", scope: !2102, file: !70, line: 2065, type: !733)
!2110 = !DILocation(line: 2065, column: 6, scope: !2102)
!2111 = !DILocalVariable(name: "u32Temp2", scope: !2102, file: !70, line: 2065, type: !733)
!2112 = !DILocation(line: 2065, column: 17, scope: !2102)
!2113 = !DILocalVariable(name: "u8SignBit", scope: !2102, file: !70, line: 2066, type: !24)
!2114 = !DILocation(line: 2066, column: 5, scope: !2102)
!2115 = !DILocation(line: 2068, column: 5, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2102, file: !70, line: 2068, column: 5)
!2117 = !DILocation(line: 2068, column: 9, scope: !2116)
!2118 = !DILocation(line: 2068, column: 5, scope: !2102)
!2119 = !DILocation(line: 2070, column: 15, scope: !2120)
!2120 = distinct !DILexicalBlock(scope: !2116, file: !70, line: 2069, column: 2)
!2121 = !DILocation(line: 2070, column: 14, scope: !2120)
!2122 = !DILocation(line: 2070, column: 12, scope: !2120)
!2123 = !DILocation(line: 2071, column: 13, scope: !2120)
!2124 = !DILocation(line: 2072, column: 2, scope: !2120)
!2125 = !DILocation(line: 2075, column: 14, scope: !2126)
!2126 = distinct !DILexicalBlock(scope: !2116, file: !70, line: 2074, column: 2)
!2127 = !DILocation(line: 2075, column: 12, scope: !2126)
!2128 = !DILocation(line: 2076, column: 13, scope: !2126)
!2129 = !DILocation(line: 2079, column: 25, scope: !2102)
!2130 = !DILocation(line: 2079, column: 35, scope: !2102)
!2131 = !DILocation(line: 2079, column: 13, scope: !2102)
!2132 = !DILocation(line: 2079, column: 11, scope: !2102)
!2133 = !DILocation(line: 2080, column: 5, scope: !2134)
!2134 = distinct !DILexicalBlock(scope: !2102, file: !70, line: 2080, column: 5)
!2135 = !DILocation(line: 2080, column: 15, scope: !2134)
!2136 = !DILocation(line: 2080, column: 5, scope: !2102)
!2137 = !DILocation(line: 2081, column: 10, scope: !2134)
!2138 = !DILocation(line: 2081, column: 3, scope: !2134)
!2139 = !DILocation(line: 2083, column: 11, scope: !2134)
!2140 = !DILocation(line: 2083, column: 10, scope: !2134)
!2141 = !DILocation(line: 2083, column: 3, scope: !2134)
!2142 = !DILocation(line: 2084, column: 1, scope: !2102)
!2143 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !70, file: !70, line: 2103, type: !2103, scopeLine: 2104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2144 = !DILocalVariable(name: "val1", arg: 1, scope: !2143, file: !70, line: 2103, type: !20)
!2145 = !DILocation(line: 2103, column: 30, scope: !2143)
!2146 = !DILocalVariable(name: "val2", arg: 2, scope: !2143, file: !70, line: 2103, type: !733)
!2147 = !DILocation(line: 2103, column: 39, scope: !2143)
!2148 = !DILocalVariable(name: "u32Temp1", scope: !2143, file: !70, line: 2105, type: !733)
!2149 = !DILocation(line: 2105, column: 6, scope: !2143)
!2150 = !DILocalVariable(name: "u32Temp2", scope: !2143, file: !70, line: 2105, type: !733)
!2151 = !DILocation(line: 2105, column: 17, scope: !2143)
!2152 = !DILocalVariable(name: "u32Temp3", scope: !2143, file: !70, line: 2105, type: !733)
!2153 = !DILocation(line: 2105, column: 26, scope: !2143)
!2154 = !DILocalVariable(name: "u8SignBit", scope: !2143, file: !70, line: 2106, type: !24)
!2155 = !DILocation(line: 2106, column: 5, scope: !2143)
!2156 = !DILocation(line: 2108, column: 5, scope: !2157)
!2157 = distinct !DILexicalBlock(scope: !2143, file: !70, line: 2108, column: 5)
!2158 = !DILocation(line: 2108, column: 9, scope: !2157)
!2159 = !DILocation(line: 2108, column: 5, scope: !2143)
!2160 = !DILocation(line: 2110, column: 15, scope: !2161)
!2161 = distinct !DILexicalBlock(scope: !2157, file: !70, line: 2109, column: 2)
!2162 = !DILocation(line: 2110, column: 14, scope: !2161)
!2163 = !DILocation(line: 2110, column: 12, scope: !2161)
!2164 = !DILocation(line: 2111, column: 13, scope: !2161)
!2165 = !DILocation(line: 2112, column: 2, scope: !2161)
!2166 = !DILocation(line: 2115, column: 14, scope: !2167)
!2167 = distinct !DILexicalBlock(scope: !2157, file: !70, line: 2114, column: 2)
!2168 = !DILocation(line: 2115, column: 12, scope: !2167)
!2169 = !DILocation(line: 2116, column: 13, scope: !2167)
!2170 = !DILocation(line: 2119, column: 13, scope: !2143)
!2171 = !DILocation(line: 2119, column: 24, scope: !2143)
!2172 = !DILocation(line: 2119, column: 22, scope: !2143)
!2173 = !DILocation(line: 2119, column: 11, scope: !2143)
!2174 = !DILocation(line: 2120, column: 25, scope: !2143)
!2175 = !DILocation(line: 2120, column: 35, scope: !2143)
!2176 = !DILocation(line: 2120, column: 13, scope: !2143)
!2177 = !DILocation(line: 2120, column: 11, scope: !2143)
!2178 = !DILocation(line: 2121, column: 13, scope: !2143)
!2179 = !DILocation(line: 2121, column: 22, scope: !2143)
!2180 = !DILocation(line: 2121, column: 11, scope: !2143)
!2181 = !DILocation(line: 2122, column: 14, scope: !2143)
!2182 = !DILocation(line: 2122, column: 23, scope: !2143)
!2183 = !DILocation(line: 2122, column: 11, scope: !2143)
!2184 = !DILocation(line: 2123, column: 5, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2143, file: !70, line: 2123, column: 5)
!2186 = !DILocation(line: 2123, column: 15, scope: !2185)
!2187 = !DILocation(line: 2123, column: 5, scope: !2143)
!2188 = !DILocation(line: 2125, column: 6, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2190, file: !70, line: 2125, column: 6)
!2190 = distinct !DILexicalBlock(scope: !2185, file: !70, line: 2124, column: 2)
!2191 = !DILocation(line: 2125, column: 14, scope: !2189)
!2192 = !DILocation(line: 2125, column: 6, scope: !2190)
!2193 = !DILocation(line: 2126, column: 11, scope: !2189)
!2194 = !DILocation(line: 2126, column: 4, scope: !2189)
!2195 = !DILocation(line: 2128, column: 4, scope: !2189)
!2196 = !DILocation(line: 2132, column: 6, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2198, file: !70, line: 2132, column: 6)
!2198 = distinct !DILexicalBlock(scope: !2185, file: !70, line: 2131, column: 2)
!2199 = !DILocation(line: 2132, column: 14, scope: !2197)
!2200 = !DILocation(line: 2132, column: 6, scope: !2198)
!2201 = !DILocation(line: 2133, column: 12, scope: !2197)
!2202 = !DILocation(line: 2133, column: 11, scope: !2197)
!2203 = !DILocation(line: 2133, column: 4, scope: !2197)
!2204 = !DILocation(line: 2135, column: 4, scope: !2197)
!2205 = !DILocation(line: 2137, column: 1, scope: !2143)
!2206 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !70, file: !70, line: 2155, type: !2207, scopeLine: 2156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2207 = !DISubroutineType(types: !2208)
!2208 = !{!20, !20, !20}
!2209 = !DILocalVariable(name: "value", arg: 1, scope: !2206, file: !70, line: 2155, type: !20)
!2210 = !DILocation(line: 2155, column: 30, scope: !2206)
!2211 = !DILocalVariable(name: "factor", arg: 2, scope: !2206, file: !70, line: 2155, type: !20)
!2212 = !DILocation(line: 2155, column: 41, scope: !2206)
!2213 = !DILocalVariable(name: "u32Temp1", scope: !2206, file: !70, line: 2157, type: !733)
!2214 = !DILocation(line: 2157, column: 6, scope: !2206)
!2215 = !DILocalVariable(name: "u32Temp2", scope: !2206, file: !70, line: 2157, type: !733)
!2216 = !DILocation(line: 2157, column: 17, scope: !2206)
!2217 = !DILocalVariable(name: "u32Temp3", scope: !2206, file: !70, line: 2157, type: !733)
!2218 = !DILocation(line: 2157, column: 26, scope: !2206)
!2219 = !DILocalVariable(name: "u32Temp4", scope: !2206, file: !70, line: 2157, type: !733)
!2220 = !DILocation(line: 2157, column: 35, scope: !2206)
!2221 = !DILocalVariable(name: "u8SignBit", scope: !2206, file: !70, line: 2158, type: !24)
!2222 = !DILocation(line: 2158, column: 5, scope: !2206)
!2223 = !DILocation(line: 2160, column: 7, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2206, file: !70, line: 2160, column: 5)
!2225 = !DILocation(line: 2160, column: 12, scope: !2224)
!2226 = !DILocation(line: 2160, column: 16, scope: !2224)
!2227 = !DILocation(line: 2160, column: 36, scope: !2224)
!2228 = !DILocation(line: 2160, column: 41, scope: !2224)
!2229 = !DILocation(line: 2160, column: 45, scope: !2224)
!2230 = !DILocation(line: 2162, column: 13, scope: !2231)
!2231 = distinct !DILexicalBlock(scope: !2224, file: !70, line: 2161, column: 2)
!2232 = !DILocation(line: 2163, column: 2, scope: !2231)
!2233 = !DILocation(line: 2166, column: 13, scope: !2234)
!2234 = distinct !DILexicalBlock(scope: !2224, file: !70, line: 2165, column: 2)
!2235 = !DILocation(line: 2169, column: 5, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2206, file: !70, line: 2169, column: 5)
!2237 = !DILocation(line: 2169, column: 10, scope: !2236)
!2238 = !DILocation(line: 2169, column: 5, scope: !2206)
!2239 = !DILocation(line: 2171, column: 15, scope: !2240)
!2240 = distinct !DILexicalBlock(scope: !2236, file: !70, line: 2170, column: 2)
!2241 = !DILocation(line: 2171, column: 14, scope: !2240)
!2242 = !DILocation(line: 2171, column: 12, scope: !2240)
!2243 = !DILocation(line: 2172, column: 2, scope: !2240)
!2244 = !DILocation(line: 2175, column: 14, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2236, file: !70, line: 2174, column: 2)
!2246 = !DILocation(line: 2175, column: 12, scope: !2245)
!2247 = !DILocation(line: 2178, column: 5, scope: !2248)
!2248 = distinct !DILexicalBlock(scope: !2206, file: !70, line: 2178, column: 5)
!2249 = !DILocation(line: 2178, column: 11, scope: !2248)
!2250 = !DILocation(line: 2178, column: 5, scope: !2206)
!2251 = !DILocation(line: 2180, column: 15, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2248, file: !70, line: 2179, column: 2)
!2253 = !DILocation(line: 2180, column: 14, scope: !2252)
!2254 = !DILocation(line: 2180, column: 12, scope: !2252)
!2255 = !DILocation(line: 2181, column: 2, scope: !2252)
!2256 = !DILocation(line: 2184, column: 14, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2248, file: !70, line: 2183, column: 2)
!2258 = !DILocation(line: 2184, column: 12, scope: !2257)
!2259 = !DILocation(line: 2187, column: 13, scope: !2206)
!2260 = !DILocation(line: 2187, column: 24, scope: !2206)
!2261 = !DILocation(line: 2187, column: 22, scope: !2206)
!2262 = !DILocation(line: 2187, column: 11, scope: !2206)
!2263 = !DILocation(line: 2188, column: 25, scope: !2206)
!2264 = !DILocation(line: 2188, column: 35, scope: !2206)
!2265 = !DILocation(line: 2188, column: 13, scope: !2206)
!2266 = !DILocation(line: 2188, column: 11, scope: !2206)
!2267 = !DILocation(line: 2189, column: 13, scope: !2206)
!2268 = !DILocation(line: 2189, column: 22, scope: !2206)
!2269 = !DILocation(line: 2189, column: 11, scope: !2206)
!2270 = !DILocation(line: 2190, column: 14, scope: !2206)
!2271 = !DILocation(line: 2190, column: 23, scope: !2206)
!2272 = !DILocation(line: 2190, column: 11, scope: !2206)
!2273 = !DILocation(line: 2191, column: 5, scope: !2274)
!2274 = distinct !DILexicalBlock(scope: !2206, file: !70, line: 2191, column: 5)
!2275 = !DILocation(line: 2191, column: 15, scope: !2274)
!2276 = !DILocation(line: 2191, column: 5, scope: !2206)
!2277 = !DILocation(line: 2193, column: 6, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2279, file: !70, line: 2193, column: 6)
!2279 = distinct !DILexicalBlock(scope: !2274, file: !70, line: 2192, column: 2)
!2280 = !DILocation(line: 2193, column: 14, scope: !2278)
!2281 = !DILocation(line: 2193, column: 6, scope: !2279)
!2282 = !DILocation(line: 2194, column: 11, scope: !2278)
!2283 = !DILocation(line: 2194, column: 4, scope: !2278)
!2284 = !DILocation(line: 2196, column: 4, scope: !2278)
!2285 = !DILocation(line: 2200, column: 11, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2274, file: !70, line: 2199, column: 2)
!2287 = !DILocation(line: 2200, column: 10, scope: !2286)
!2288 = !DILocation(line: 2200, column: 3, scope: !2286)
!2289 = !DILocation(line: 2202, column: 1, scope: !2206)
!2290 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !70, file: !70, line: 2221, type: !2207, scopeLine: 2222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2291 = !DILocalVariable(name: "value", arg: 1, scope: !2290, file: !70, line: 2221, type: !20)
!2292 = !DILocation(line: 2221, column: 30, scope: !2290)
!2293 = !DILocalVariable(name: "factor", arg: 2, scope: !2290, file: !70, line: 2221, type: !20)
!2294 = !DILocation(line: 2221, column: 41, scope: !2290)
!2295 = !DILocalVariable(name: "u32Temp1", scope: !2290, file: !70, line: 2223, type: !733)
!2296 = !DILocation(line: 2223, column: 6, scope: !2290)
!2297 = !DILocalVariable(name: "u32Temp2", scope: !2290, file: !70, line: 2223, type: !733)
!2298 = !DILocation(line: 2223, column: 17, scope: !2290)
!2299 = !DILocalVariable(name: "u32Temp3", scope: !2290, file: !70, line: 2223, type: !733)
!2300 = !DILocation(line: 2223, column: 26, scope: !2290)
!2301 = !DILocalVariable(name: "u32Temp4", scope: !2290, file: !70, line: 2223, type: !733)
!2302 = !DILocation(line: 2223, column: 35, scope: !2290)
!2303 = !DILocalVariable(name: "u8SignBit", scope: !2290, file: !70, line: 2224, type: !24)
!2304 = !DILocation(line: 2224, column: 5, scope: !2290)
!2305 = !DILocation(line: 2226, column: 7, scope: !2306)
!2306 = distinct !DILexicalBlock(scope: !2290, file: !70, line: 2226, column: 5)
!2307 = !DILocation(line: 2226, column: 12, scope: !2306)
!2308 = !DILocation(line: 2226, column: 16, scope: !2306)
!2309 = !DILocation(line: 2226, column: 36, scope: !2306)
!2310 = !DILocation(line: 2226, column: 41, scope: !2306)
!2311 = !DILocation(line: 2226, column: 45, scope: !2306)
!2312 = !DILocation(line: 2228, column: 13, scope: !2313)
!2313 = distinct !DILexicalBlock(scope: !2306, file: !70, line: 2227, column: 2)
!2314 = !DILocation(line: 2229, column: 2, scope: !2313)
!2315 = !DILocation(line: 2232, column: 13, scope: !2316)
!2316 = distinct !DILexicalBlock(scope: !2306, file: !70, line: 2231, column: 2)
!2317 = !DILocation(line: 2235, column: 5, scope: !2318)
!2318 = distinct !DILexicalBlock(scope: !2290, file: !70, line: 2235, column: 5)
!2319 = !DILocation(line: 2235, column: 10, scope: !2318)
!2320 = !DILocation(line: 2235, column: 5, scope: !2290)
!2321 = !DILocation(line: 2237, column: 15, scope: !2322)
!2322 = distinct !DILexicalBlock(scope: !2318, file: !70, line: 2236, column: 2)
!2323 = !DILocation(line: 2237, column: 14, scope: !2322)
!2324 = !DILocation(line: 2237, column: 12, scope: !2322)
!2325 = !DILocation(line: 2238, column: 2, scope: !2322)
!2326 = !DILocation(line: 2241, column: 14, scope: !2327)
!2327 = distinct !DILexicalBlock(scope: !2318, file: !70, line: 2240, column: 2)
!2328 = !DILocation(line: 2241, column: 12, scope: !2327)
!2329 = !DILocation(line: 2244, column: 5, scope: !2330)
!2330 = distinct !DILexicalBlock(scope: !2290, file: !70, line: 2244, column: 5)
!2331 = !DILocation(line: 2244, column: 11, scope: !2330)
!2332 = !DILocation(line: 2244, column: 5, scope: !2290)
!2333 = !DILocation(line: 2246, column: 15, scope: !2334)
!2334 = distinct !DILexicalBlock(scope: !2330, file: !70, line: 2245, column: 2)
!2335 = !DILocation(line: 2246, column: 14, scope: !2334)
!2336 = !DILocation(line: 2246, column: 12, scope: !2334)
!2337 = !DILocation(line: 2247, column: 2, scope: !2334)
!2338 = !DILocation(line: 2250, column: 14, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2330, file: !70, line: 2249, column: 2)
!2340 = !DILocation(line: 2250, column: 12, scope: !2339)
!2341 = !DILocation(line: 2253, column: 13, scope: !2290)
!2342 = !DILocation(line: 2253, column: 24, scope: !2290)
!2343 = !DILocation(line: 2253, column: 22, scope: !2290)
!2344 = !DILocation(line: 2253, column: 11, scope: !2290)
!2345 = !DILocation(line: 2254, column: 25, scope: !2290)
!2346 = !DILocation(line: 2254, column: 35, scope: !2290)
!2347 = !DILocation(line: 2254, column: 13, scope: !2290)
!2348 = !DILocation(line: 2254, column: 11, scope: !2290)
!2349 = !DILocation(line: 2255, column: 13, scope: !2290)
!2350 = !DILocation(line: 2255, column: 22, scope: !2290)
!2351 = !DILocation(line: 2255, column: 11, scope: !2290)
!2352 = !DILocation(line: 2256, column: 14, scope: !2290)
!2353 = !DILocation(line: 2256, column: 23, scope: !2290)
!2354 = !DILocation(line: 2256, column: 11, scope: !2290)
!2355 = !DILocation(line: 2257, column: 6, scope: !2356)
!2356 = distinct !DILexicalBlock(scope: !2290, file: !70, line: 2257, column: 5)
!2357 = !DILocation(line: 2257, column: 14, scope: !2356)
!2358 = !DILocation(line: 2257, column: 19, scope: !2356)
!2359 = !DILocation(line: 2257, column: 5, scope: !2290)
!2360 = !DILocation(line: 2259, column: 6, scope: !2361)
!2361 = distinct !DILexicalBlock(scope: !2362, file: !70, line: 2259, column: 6)
!2362 = distinct !DILexicalBlock(scope: !2356, file: !70, line: 2258, column: 2)
!2363 = !DILocation(line: 2259, column: 16, scope: !2361)
!2364 = !DILocation(line: 2259, column: 6, scope: !2362)
!2365 = !DILocation(line: 2261, column: 7, scope: !2366)
!2366 = distinct !DILexicalBlock(scope: !2367, file: !70, line: 2261, column: 7)
!2367 = distinct !DILexicalBlock(scope: !2361, file: !70, line: 2260, column: 3)
!2368 = !DILocation(line: 2261, column: 15, scope: !2366)
!2369 = !DILocation(line: 2261, column: 7, scope: !2367)
!2370 = !DILocation(line: 2262, column: 12, scope: !2366)
!2371 = !DILocation(line: 2262, column: 5, scope: !2366)
!2372 = !DILocation(line: 2264, column: 5, scope: !2366)
!2373 = !DILocation(line: 2268, column: 7, scope: !2374)
!2374 = distinct !DILexicalBlock(scope: !2375, file: !70, line: 2268, column: 7)
!2375 = distinct !DILexicalBlock(scope: !2361, file: !70, line: 2267, column: 3)
!2376 = !DILocation(line: 2268, column: 15, scope: !2374)
!2377 = !DILocation(line: 2268, column: 7, scope: !2375)
!2378 = !DILocation(line: 2269, column: 13, scope: !2374)
!2379 = !DILocation(line: 2269, column: 12, scope: !2374)
!2380 = !DILocation(line: 2269, column: 5, scope: !2374)
!2381 = !DILocation(line: 2271, column: 5, scope: !2374)
!2382 = !DILocation(line: 2276, column: 4, scope: !2383)
!2383 = distinct !DILexicalBlock(scope: !2356, file: !70, line: 2275, column: 2)
!2384 = !DILocation(line: 2278, column: 1, scope: !2290)
!2385 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !70, file: !70, line: 2296, type: !2386, scopeLine: 2297, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2386 = !DISubroutineType(types: !2387)
!2387 = !{!20, !20, !24}
!2388 = !DILocalVariable(name: "value", arg: 1, scope: !2385, file: !70, line: 2296, type: !20)
!2389 = !DILocation(line: 2296, column: 29, scope: !2385)
!2390 = !DILocalVariable(name: "factor", arg: 2, scope: !2385, file: !70, line: 2296, type: !24)
!2391 = !DILocation(line: 2296, column: 39, scope: !2385)
!2392 = !DILocalVariable(name: "u32Temp1", scope: !2385, file: !70, line: 2298, type: !733)
!2393 = !DILocation(line: 2298, column: 6, scope: !2385)
!2394 = !DILocalVariable(name: "u32Temp2", scope: !2385, file: !70, line: 2298, type: !733)
!2395 = !DILocation(line: 2298, column: 17, scope: !2385)
!2396 = !DILocalVariable(name: "u32Temp3", scope: !2385, file: !70, line: 2298, type: !733)
!2397 = !DILocation(line: 2298, column: 26, scope: !2385)
!2398 = !DILocalVariable(name: "u8SignBit", scope: !2385, file: !70, line: 2299, type: !24)
!2399 = !DILocation(line: 2299, column: 5, scope: !2385)
!2400 = !DILocation(line: 2301, column: 5, scope: !2401)
!2401 = distinct !DILexicalBlock(scope: !2385, file: !70, line: 2301, column: 5)
!2402 = !DILocation(line: 2301, column: 10, scope: !2401)
!2403 = !DILocation(line: 2301, column: 5, scope: !2385)
!2404 = !DILocation(line: 2303, column: 15, scope: !2405)
!2405 = distinct !DILexicalBlock(scope: !2401, file: !70, line: 2302, column: 2)
!2406 = !DILocation(line: 2303, column: 14, scope: !2405)
!2407 = !DILocation(line: 2303, column: 12, scope: !2405)
!2408 = !DILocation(line: 2304, column: 13, scope: !2405)
!2409 = !DILocation(line: 2305, column: 2, scope: !2405)
!2410 = !DILocation(line: 2308, column: 14, scope: !2411)
!2411 = distinct !DILexicalBlock(scope: !2401, file: !70, line: 2307, column: 2)
!2412 = !DILocation(line: 2308, column: 12, scope: !2411)
!2413 = !DILocation(line: 2309, column: 13, scope: !2411)
!2414 = !DILocation(line: 2312, column: 13, scope: !2385)
!2415 = !DILocation(line: 2312, column: 24, scope: !2385)
!2416 = !DILocation(line: 2312, column: 22, scope: !2385)
!2417 = !DILocation(line: 2312, column: 11, scope: !2385)
!2418 = !DILocation(line: 2313, column: 25, scope: !2385)
!2419 = !DILocation(line: 2313, column: 35, scope: !2385)
!2420 = !DILocation(line: 2313, column: 13, scope: !2385)
!2421 = !DILocation(line: 2313, column: 11, scope: !2385)
!2422 = !DILocation(line: 2314, column: 13, scope: !2385)
!2423 = !DILocation(line: 2314, column: 22, scope: !2385)
!2424 = !DILocation(line: 2314, column: 11, scope: !2385)
!2425 = !DILocation(line: 2315, column: 14, scope: !2385)
!2426 = !DILocation(line: 2315, column: 23, scope: !2385)
!2427 = !DILocation(line: 2315, column: 11, scope: !2385)
!2428 = !DILocation(line: 2316, column: 5, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !2385, file: !70, line: 2316, column: 5)
!2430 = !DILocation(line: 2316, column: 15, scope: !2429)
!2431 = !DILocation(line: 2316, column: 5, scope: !2385)
!2432 = !DILocation(line: 2318, column: 10, scope: !2433)
!2433 = distinct !DILexicalBlock(scope: !2429, file: !70, line: 2317, column: 2)
!2434 = !DILocation(line: 2318, column: 3, scope: !2433)
!2435 = !DILocation(line: 2322, column: 11, scope: !2436)
!2436 = distinct !DILexicalBlock(scope: !2429, file: !70, line: 2321, column: 2)
!2437 = !DILocation(line: 2322, column: 10, scope: !2436)
!2438 = !DILocation(line: 2322, column: 3, scope: !2436)
!2439 = !DILocation(line: 2324, column: 1, scope: !2385)
!2440 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !70, file: !70, line: 2343, type: !2386, scopeLine: 2344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2441 = !DILocalVariable(name: "value", arg: 1, scope: !2440, file: !70, line: 2343, type: !20)
!2442 = !DILocation(line: 2343, column: 29, scope: !2440)
!2443 = !DILocalVariable(name: "factor", arg: 2, scope: !2440, file: !70, line: 2343, type: !24)
!2444 = !DILocation(line: 2343, column: 39, scope: !2440)
!2445 = !DILocalVariable(name: "u32Temp1", scope: !2440, file: !70, line: 2345, type: !733)
!2446 = !DILocation(line: 2345, column: 6, scope: !2440)
!2447 = !DILocalVariable(name: "u32Temp2", scope: !2440, file: !70, line: 2345, type: !733)
!2448 = !DILocation(line: 2345, column: 17, scope: !2440)
!2449 = !DILocalVariable(name: "u32Temp3", scope: !2440, file: !70, line: 2345, type: !733)
!2450 = !DILocation(line: 2345, column: 26, scope: !2440)
!2451 = !DILocalVariable(name: "u8SignBit", scope: !2440, file: !70, line: 2346, type: !24)
!2452 = !DILocation(line: 2346, column: 5, scope: !2440)
!2453 = !DILocation(line: 2348, column: 5, scope: !2454)
!2454 = distinct !DILexicalBlock(scope: !2440, file: !70, line: 2348, column: 5)
!2455 = !DILocation(line: 2348, column: 10, scope: !2454)
!2456 = !DILocation(line: 2348, column: 5, scope: !2440)
!2457 = !DILocation(line: 2350, column: 15, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2454, file: !70, line: 2349, column: 2)
!2459 = !DILocation(line: 2350, column: 14, scope: !2458)
!2460 = !DILocation(line: 2350, column: 12, scope: !2458)
!2461 = !DILocation(line: 2351, column: 13, scope: !2458)
!2462 = !DILocation(line: 2352, column: 2, scope: !2458)
!2463 = !DILocation(line: 2355, column: 14, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2454, file: !70, line: 2354, column: 2)
!2465 = !DILocation(line: 2355, column: 12, scope: !2464)
!2466 = !DILocation(line: 2356, column: 13, scope: !2464)
!2467 = !DILocation(line: 2359, column: 13, scope: !2440)
!2468 = !DILocation(line: 2359, column: 24, scope: !2440)
!2469 = !DILocation(line: 2359, column: 22, scope: !2440)
!2470 = !DILocation(line: 2359, column: 11, scope: !2440)
!2471 = !DILocation(line: 2360, column: 25, scope: !2440)
!2472 = !DILocation(line: 2360, column: 35, scope: !2440)
!2473 = !DILocation(line: 2360, column: 13, scope: !2440)
!2474 = !DILocation(line: 2360, column: 11, scope: !2440)
!2475 = !DILocation(line: 2361, column: 13, scope: !2440)
!2476 = !DILocation(line: 2361, column: 22, scope: !2440)
!2477 = !DILocation(line: 2361, column: 11, scope: !2440)
!2478 = !DILocation(line: 2362, column: 14, scope: !2440)
!2479 = !DILocation(line: 2362, column: 23, scope: !2440)
!2480 = !DILocation(line: 2362, column: 11, scope: !2440)
!2481 = !DILocation(line: 2363, column: 5, scope: !2482)
!2482 = distinct !DILexicalBlock(scope: !2440, file: !70, line: 2363, column: 5)
!2483 = !DILocation(line: 2363, column: 15, scope: !2482)
!2484 = !DILocation(line: 2363, column: 5, scope: !2440)
!2485 = !DILocation(line: 2365, column: 6, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2487, file: !70, line: 2365, column: 6)
!2487 = distinct !DILexicalBlock(scope: !2482, file: !70, line: 2364, column: 2)
!2488 = !DILocation(line: 2365, column: 14, scope: !2486)
!2489 = !DILocation(line: 2365, column: 6, scope: !2487)
!2490 = !DILocation(line: 2366, column: 11, scope: !2486)
!2491 = !DILocation(line: 2366, column: 4, scope: !2486)
!2492 = !DILocation(line: 2368, column: 4, scope: !2486)
!2493 = !DILocation(line: 2372, column: 6, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2495, file: !70, line: 2372, column: 6)
!2495 = distinct !DILexicalBlock(scope: !2482, file: !70, line: 2371, column: 2)
!2496 = !DILocation(line: 2372, column: 14, scope: !2494)
!2497 = !DILocation(line: 2372, column: 6, scope: !2495)
!2498 = !DILocation(line: 2373, column: 12, scope: !2494)
!2499 = !DILocation(line: 2373, column: 11, scope: !2494)
!2500 = !DILocation(line: 2373, column: 4, scope: !2494)
!2501 = !DILocation(line: 2375, column: 4, scope: !2494)
!2502 = !DILocation(line: 2377, column: 1, scope: !2440)
!2503 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !70, file: !70, line: 2394, type: !2504, scopeLine: 2395, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2504 = !DISubroutineType(types: !2505)
!2505 = !{!733, !733, !733, !24}
!2506 = !DILocalVariable(name: "value", arg: 1, scope: !2503, file: !70, line: 2394, type: !733)
!2507 = !DILocation(line: 2394, column: 39, scope: !2503)
!2508 = !DILocalVariable(name: "factor", arg: 2, scope: !2503, file: !70, line: 2394, type: !733)
!2509 = !DILocation(line: 2394, column: 49, scope: !2503)
!2510 = !DILocalVariable(name: "power", arg: 3, scope: !2503, file: !70, line: 2394, type: !24)
!2511 = !DILocation(line: 2394, column: 60, scope: !2503)
!2512 = !DILocalVariable(name: "u32Temp1", scope: !2503, file: !70, line: 2396, type: !733)
!2513 = !DILocation(line: 2396, column: 6, scope: !2503)
!2514 = !DILocalVariable(name: "u32Temp2", scope: !2503, file: !70, line: 2396, type: !733)
!2515 = !DILocation(line: 2396, column: 20, scope: !2503)
!2516 = !DILocation(line: 2397, column: 5, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2503, file: !70, line: 2397, column: 5)
!2518 = !DILocation(line: 2397, column: 10, scope: !2517)
!2519 = !DILocation(line: 2397, column: 5, scope: !2503)
!2520 = !DILocation(line: 2399, column: 9, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2517, file: !70, line: 2398, column: 2)
!2522 = !DILocation(line: 2400, column: 2, scope: !2521)
!2523 = !DILocation(line: 2401, column: 10, scope: !2524)
!2524 = distinct !DILexicalBlock(scope: !2517, file: !70, line: 2401, column: 10)
!2525 = !DILocation(line: 2401, column: 15, scope: !2524)
!2526 = !DILocation(line: 2401, column: 10, scope: !2517)
!2527 = !DILocation(line: 2403, column: 9, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2524, file: !70, line: 2402, column: 2)
!2529 = !DILocation(line: 2404, column: 2, scope: !2528)
!2530 = !DILocation(line: 2409, column: 13, scope: !2503)
!2531 = !DILocation(line: 2409, column: 21, scope: !2503)
!2532 = !DILocation(line: 2409, column: 19, scope: !2503)
!2533 = !DILocation(line: 2409, column: 11, scope: !2503)
!2534 = !DILocation(line: 2410, column: 25, scope: !2503)
!2535 = !DILocation(line: 2410, column: 32, scope: !2503)
!2536 = !DILocation(line: 2410, column: 13, scope: !2503)
!2537 = !DILocation(line: 2410, column: 11, scope: !2503)
!2538 = !DILocation(line: 2411, column: 13, scope: !2503)
!2539 = !DILocation(line: 2411, column: 29, scope: !2503)
!2540 = !DILocation(line: 2411, column: 28, scope: !2503)
!2541 = !DILocation(line: 2411, column: 22, scope: !2503)
!2542 = !DILocation(line: 2411, column: 11, scope: !2503)
!2543 = !DILocation(line: 2412, column: 14, scope: !2503)
!2544 = !DILocation(line: 2412, column: 26, scope: !2503)
!2545 = !DILocation(line: 2412, column: 23, scope: !2503)
!2546 = !DILocation(line: 2412, column: 11, scope: !2503)
!2547 = !DILocation(line: 2413, column: 6, scope: !2548)
!2548 = distinct !DILexicalBlock(scope: !2503, file: !70, line: 2413, column: 5)
!2549 = !DILocation(line: 2413, column: 20, scope: !2548)
!2550 = !DILocation(line: 2413, column: 19, scope: !2548)
!2551 = !DILocation(line: 2413, column: 14, scope: !2548)
!2552 = !DILocation(line: 2413, column: 28, scope: !2548)
!2553 = !DILocation(line: 2413, column: 5, scope: !2503)
!2554 = !DILocation(line: 2415, column: 10, scope: !2555)
!2555 = distinct !DILexicalBlock(scope: !2548, file: !70, line: 2414, column: 2)
!2556 = !DILocation(line: 2415, column: 3, scope: !2555)
!2557 = !DILocation(line: 2419, column: 3, scope: !2558)
!2558 = distinct !DILexicalBlock(scope: !2548, file: !70, line: 2418, column: 2)
!2559 = !DILocation(line: 2421, column: 1, scope: !2503)
!2560 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !70, file: !70, line: 2439, type: !2561, scopeLine: 2440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2561 = !DISubroutineType(types: !2562)
!2562 = !{!20, !20, !20, !24}
!2563 = !DILocalVariable(name: "value", arg: 1, scope: !2560, file: !70, line: 2439, type: !20)
!2564 = !DILocation(line: 2439, column: 39, scope: !2560)
!2565 = !DILocalVariable(name: "factor", arg: 2, scope: !2560, file: !70, line: 2439, type: !20)
!2566 = !DILocation(line: 2439, column: 50, scope: !2560)
!2567 = !DILocalVariable(name: "power", arg: 3, scope: !2560, file: !70, line: 2439, type: !24)
!2568 = !DILocation(line: 2439, column: 61, scope: !2560)
!2569 = !DILocalVariable(name: "u32Temp1", scope: !2560, file: !70, line: 2441, type: !733)
!2570 = !DILocation(line: 2441, column: 6, scope: !2560)
!2571 = !DILocalVariable(name: "u32Temp2", scope: !2560, file: !70, line: 2441, type: !733)
!2572 = !DILocation(line: 2441, column: 17, scope: !2560)
!2573 = !DILocalVariable(name: "u32Temp3", scope: !2560, file: !70, line: 2441, type: !733)
!2574 = !DILocation(line: 2441, column: 26, scope: !2560)
!2575 = !DILocalVariable(name: "u32Temp4", scope: !2560, file: !70, line: 2441, type: !733)
!2576 = !DILocation(line: 2441, column: 35, scope: !2560)
!2577 = !DILocalVariable(name: "u8SignBit", scope: !2560, file: !70, line: 2442, type: !24)
!2578 = !DILocation(line: 2442, column: 5, scope: !2560)
!2579 = !DILocation(line: 2444, column: 5, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2444, column: 5)
!2581 = !DILocation(line: 2444, column: 10, scope: !2580)
!2582 = !DILocation(line: 2444, column: 5, scope: !2560)
!2583 = !DILocation(line: 2446, column: 9, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2580, file: !70, line: 2445, column: 2)
!2585 = !DILocation(line: 2447, column: 2, scope: !2584)
!2586 = !DILocation(line: 2448, column: 10, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2580, file: !70, line: 2448, column: 10)
!2588 = !DILocation(line: 2448, column: 15, scope: !2587)
!2589 = !DILocation(line: 2448, column: 10, scope: !2580)
!2590 = !DILocation(line: 2450, column: 9, scope: !2591)
!2591 = distinct !DILexicalBlock(scope: !2587, file: !70, line: 2449, column: 2)
!2592 = !DILocation(line: 2451, column: 2, scope: !2591)
!2593 = !DILocation(line: 2457, column: 7, scope: !2594)
!2594 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2457, column: 5)
!2595 = !DILocation(line: 2457, column: 12, scope: !2594)
!2596 = !DILocation(line: 2457, column: 16, scope: !2594)
!2597 = !DILocation(line: 2457, column: 36, scope: !2594)
!2598 = !DILocation(line: 2457, column: 41, scope: !2594)
!2599 = !DILocation(line: 2457, column: 45, scope: !2594)
!2600 = !DILocation(line: 2459, column: 13, scope: !2601)
!2601 = distinct !DILexicalBlock(scope: !2594, file: !70, line: 2458, column: 2)
!2602 = !DILocation(line: 2460, column: 2, scope: !2601)
!2603 = !DILocation(line: 2463, column: 13, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2594, file: !70, line: 2462, column: 2)
!2605 = !DILocation(line: 2466, column: 5, scope: !2606)
!2606 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2466, column: 5)
!2607 = !DILocation(line: 2466, column: 10, scope: !2606)
!2608 = !DILocation(line: 2466, column: 5, scope: !2560)
!2609 = !DILocation(line: 2468, column: 15, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2606, file: !70, line: 2467, column: 2)
!2611 = !DILocation(line: 2468, column: 14, scope: !2610)
!2612 = !DILocation(line: 2468, column: 12, scope: !2610)
!2613 = !DILocation(line: 2469, column: 2, scope: !2610)
!2614 = !DILocation(line: 2472, column: 14, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2606, file: !70, line: 2471, column: 2)
!2616 = !DILocation(line: 2472, column: 12, scope: !2615)
!2617 = !DILocation(line: 2475, column: 5, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2475, column: 5)
!2619 = !DILocation(line: 2475, column: 11, scope: !2618)
!2620 = !DILocation(line: 2475, column: 5, scope: !2560)
!2621 = !DILocation(line: 2477, column: 15, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2618, file: !70, line: 2476, column: 2)
!2623 = !DILocation(line: 2477, column: 14, scope: !2622)
!2624 = !DILocation(line: 2477, column: 12, scope: !2622)
!2625 = !DILocation(line: 2478, column: 2, scope: !2622)
!2626 = !DILocation(line: 2481, column: 14, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2618, file: !70, line: 2480, column: 2)
!2628 = !DILocation(line: 2481, column: 12, scope: !2627)
!2629 = !DILocation(line: 2484, column: 13, scope: !2560)
!2630 = !DILocation(line: 2484, column: 24, scope: !2560)
!2631 = !DILocation(line: 2484, column: 22, scope: !2560)
!2632 = !DILocation(line: 2484, column: 11, scope: !2560)
!2633 = !DILocation(line: 2485, column: 25, scope: !2560)
!2634 = !DILocation(line: 2485, column: 35, scope: !2560)
!2635 = !DILocation(line: 2485, column: 13, scope: !2560)
!2636 = !DILocation(line: 2485, column: 11, scope: !2560)
!2637 = !DILocation(line: 2486, column: 13, scope: !2560)
!2638 = !DILocation(line: 2486, column: 29, scope: !2560)
!2639 = !DILocation(line: 2486, column: 28, scope: !2560)
!2640 = !DILocation(line: 2486, column: 22, scope: !2560)
!2641 = !DILocation(line: 2486, column: 11, scope: !2560)
!2642 = !DILocation(line: 2487, column: 14, scope: !2560)
!2643 = !DILocation(line: 2487, column: 26, scope: !2560)
!2644 = !DILocation(line: 2487, column: 23, scope: !2560)
!2645 = !DILocation(line: 2487, column: 11, scope: !2560)
!2646 = !DILocation(line: 2488, column: 6, scope: !2647)
!2647 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2488, column: 5)
!2648 = !DILocation(line: 2488, column: 20, scope: !2647)
!2649 = !DILocation(line: 2488, column: 19, scope: !2647)
!2650 = !DILocation(line: 2488, column: 14, scope: !2647)
!2651 = !DILocation(line: 2488, column: 27, scope: !2647)
!2652 = !DILocation(line: 2488, column: 5, scope: !2560)
!2653 = !DILocation(line: 2490, column: 6, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2655, file: !70, line: 2490, column: 6)
!2655 = distinct !DILexicalBlock(scope: !2647, file: !70, line: 2489, column: 2)
!2656 = !DILocation(line: 2490, column: 16, scope: !2654)
!2657 = !DILocation(line: 2490, column: 6, scope: !2655)
!2658 = !DILocation(line: 2492, column: 7, scope: !2659)
!2659 = distinct !DILexicalBlock(scope: !2660, file: !70, line: 2492, column: 7)
!2660 = distinct !DILexicalBlock(scope: !2654, file: !70, line: 2491, column: 3)
!2661 = !DILocation(line: 2492, column: 15, scope: !2659)
!2662 = !DILocation(line: 2492, column: 7, scope: !2660)
!2663 = !DILocation(line: 2493, column: 12, scope: !2659)
!2664 = !DILocation(line: 2493, column: 5, scope: !2659)
!2665 = !DILocation(line: 2495, column: 5, scope: !2659)
!2666 = !DILocation(line: 2499, column: 12, scope: !2667)
!2667 = distinct !DILexicalBlock(scope: !2654, file: !70, line: 2498, column: 3)
!2668 = !DILocation(line: 2499, column: 11, scope: !2667)
!2669 = !DILocation(line: 2499, column: 4, scope: !2667)
!2670 = !DILocation(line: 2504, column: 6, scope: !2671)
!2671 = distinct !DILexicalBlock(scope: !2672, file: !70, line: 2504, column: 6)
!2672 = distinct !DILexicalBlock(scope: !2647, file: !70, line: 2503, column: 2)
!2673 = !DILocation(line: 2504, column: 16, scope: !2671)
!2674 = !DILocation(line: 2504, column: 6, scope: !2672)
!2675 = !DILocation(line: 2506, column: 4, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2671, file: !70, line: 2505, column: 3)
!2677 = !DILocation(line: 2510, column: 4, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2671, file: !70, line: 2509, column: 3)
!2679 = !DILocation(line: 2513, column: 1, scope: !2560)
!2680 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !70, file: !70, line: 2532, type: !2681, scopeLine: 2533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2681 = !DISubroutineType(types: !2682)
!2682 = !{!20, !20, !6}
!2683 = !DILocalVariable(name: "value", arg: 1, scope: !2680, file: !70, line: 2532, type: !20)
!2684 = !DILocation(line: 2532, column: 29, scope: !2680)
!2685 = !DILocalVariable(name: "factor", arg: 2, scope: !2680, file: !70, line: 2532, type: !6)
!2686 = !DILocation(line: 2532, column: 39, scope: !2680)
!2687 = !DILocalVariable(name: "u32Temp1", scope: !2680, file: !70, line: 2534, type: !733)
!2688 = !DILocation(line: 2534, column: 6, scope: !2680)
!2689 = !DILocalVariable(name: "u32Temp2", scope: !2680, file: !70, line: 2534, type: !733)
!2690 = !DILocation(line: 2534, column: 17, scope: !2680)
!2691 = !DILocalVariable(name: "u32Temp3", scope: !2680, file: !70, line: 2534, type: !733)
!2692 = !DILocation(line: 2534, column: 26, scope: !2680)
!2693 = !DILocalVariable(name: "u32Temp4", scope: !2680, file: !70, line: 2534, type: !733)
!2694 = !DILocation(line: 2534, column: 35, scope: !2680)
!2695 = !DILocalVariable(name: "u8SignBit", scope: !2680, file: !70, line: 2535, type: !24)
!2696 = !DILocation(line: 2535, column: 5, scope: !2680)
!2697 = !DILocation(line: 2537, column: 7, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2680, file: !70, line: 2537, column: 5)
!2699 = !DILocation(line: 2537, column: 12, scope: !2698)
!2700 = !DILocation(line: 2537, column: 16, scope: !2698)
!2701 = !DILocation(line: 2537, column: 20, scope: !2698)
!2702 = !DILocation(line: 2537, column: 26, scope: !2698)
!2703 = !DILocation(line: 2537, column: 31, scope: !2698)
!2704 = !DILocation(line: 2537, column: 36, scope: !2698)
!2705 = !DILocation(line: 2537, column: 41, scope: !2698)
!2706 = !DILocation(line: 2537, column: 45, scope: !2698)
!2707 = !DILocation(line: 2537, column: 49, scope: !2698)
!2708 = !DILocation(line: 2537, column: 55, scope: !2698)
!2709 = !DILocation(line: 2537, column: 5, scope: !2680)
!2710 = !DILocation(line: 2539, column: 13, scope: !2711)
!2711 = distinct !DILexicalBlock(scope: !2698, file: !70, line: 2538, column: 2)
!2712 = !DILocation(line: 2540, column: 2, scope: !2711)
!2713 = !DILocation(line: 2543, column: 13, scope: !2714)
!2714 = distinct !DILexicalBlock(scope: !2698, file: !70, line: 2542, column: 2)
!2715 = !DILocation(line: 2546, column: 5, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2680, file: !70, line: 2546, column: 5)
!2717 = !DILocation(line: 2546, column: 10, scope: !2716)
!2718 = !DILocation(line: 2546, column: 5, scope: !2680)
!2719 = !DILocation(line: 2548, column: 15, scope: !2720)
!2720 = distinct !DILexicalBlock(scope: !2716, file: !70, line: 2547, column: 2)
!2721 = !DILocation(line: 2548, column: 14, scope: !2720)
!2722 = !DILocation(line: 2548, column: 12, scope: !2720)
!2723 = !DILocation(line: 2549, column: 2, scope: !2720)
!2724 = !DILocation(line: 2552, column: 14, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2716, file: !70, line: 2551, column: 2)
!2726 = !DILocation(line: 2552, column: 12, scope: !2725)
!2727 = !DILocation(line: 2555, column: 5, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2680, file: !70, line: 2555, column: 5)
!2729 = !DILocation(line: 2555, column: 11, scope: !2728)
!2730 = !DILocation(line: 2555, column: 5, scope: !2680)
!2731 = !DILocation(line: 2557, column: 15, scope: !2732)
!2732 = distinct !DILexicalBlock(scope: !2728, file: !70, line: 2556, column: 2)
!2733 = !DILocation(line: 2557, column: 14, scope: !2732)
!2734 = !DILocation(line: 2557, column: 12, scope: !2732)
!2735 = !DILocation(line: 2558, column: 2, scope: !2732)
!2736 = !DILocation(line: 2561, column: 14, scope: !2737)
!2737 = distinct !DILexicalBlock(scope: !2728, file: !70, line: 2560, column: 2)
!2738 = !DILocation(line: 2561, column: 12, scope: !2737)
!2739 = !DILocation(line: 2564, column: 13, scope: !2680)
!2740 = !DILocation(line: 2564, column: 24, scope: !2680)
!2741 = !DILocation(line: 2564, column: 22, scope: !2680)
!2742 = !DILocation(line: 2564, column: 11, scope: !2680)
!2743 = !DILocation(line: 2565, column: 25, scope: !2680)
!2744 = !DILocation(line: 2565, column: 35, scope: !2680)
!2745 = !DILocation(line: 2565, column: 13, scope: !2680)
!2746 = !DILocation(line: 2565, column: 11, scope: !2680)
!2747 = !DILocation(line: 2566, column: 13, scope: !2680)
!2748 = !DILocation(line: 2566, column: 22, scope: !2680)
!2749 = !DILocation(line: 2566, column: 11, scope: !2680)
!2750 = !DILocation(line: 2567, column: 14, scope: !2680)
!2751 = !DILocation(line: 2567, column: 23, scope: !2680)
!2752 = !DILocation(line: 2567, column: 11, scope: !2680)
!2753 = !DILocation(line: 2568, column: 5, scope: !2754)
!2754 = distinct !DILexicalBlock(scope: !2680, file: !70, line: 2568, column: 5)
!2755 = !DILocation(line: 2568, column: 15, scope: !2754)
!2756 = !DILocation(line: 2568, column: 5, scope: !2680)
!2757 = !DILocation(line: 2570, column: 6, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2759, file: !70, line: 2570, column: 6)
!2759 = distinct !DILexicalBlock(scope: !2754, file: !70, line: 2569, column: 2)
!2760 = !DILocation(line: 2570, column: 14, scope: !2758)
!2761 = !DILocation(line: 2570, column: 6, scope: !2759)
!2762 = !DILocation(line: 2571, column: 11, scope: !2758)
!2763 = !DILocation(line: 2571, column: 4, scope: !2758)
!2764 = !DILocation(line: 2573, column: 4, scope: !2758)
!2765 = !DILocation(line: 2577, column: 11, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2754, file: !70, line: 2576, column: 2)
!2767 = !DILocation(line: 2577, column: 10, scope: !2766)
!2768 = !DILocation(line: 2577, column: 3, scope: !2766)
!2769 = !DILocation(line: 2579, column: 1, scope: !2680)
!2770 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !70, file: !70, line: 2598, type: !2681, scopeLine: 2599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2771 = !DILocalVariable(name: "value", arg: 1, scope: !2770, file: !70, line: 2598, type: !20)
!2772 = !DILocation(line: 2598, column: 29, scope: !2770)
!2773 = !DILocalVariable(name: "factor", arg: 2, scope: !2770, file: !70, line: 2598, type: !6)
!2774 = !DILocation(line: 2598, column: 39, scope: !2770)
!2775 = !DILocalVariable(name: "u32Temp1", scope: !2770, file: !70, line: 2600, type: !733)
!2776 = !DILocation(line: 2600, column: 6, scope: !2770)
!2777 = !DILocalVariable(name: "u32Temp2", scope: !2770, file: !70, line: 2600, type: !733)
!2778 = !DILocation(line: 2600, column: 17, scope: !2770)
!2779 = !DILocalVariable(name: "u32Temp3", scope: !2770, file: !70, line: 2600, type: !733)
!2780 = !DILocation(line: 2600, column: 26, scope: !2770)
!2781 = !DILocalVariable(name: "u32Temp4", scope: !2770, file: !70, line: 2600, type: !733)
!2782 = !DILocation(line: 2600, column: 35, scope: !2770)
!2783 = !DILocalVariable(name: "u8SignBit", scope: !2770, file: !70, line: 2601, type: !24)
!2784 = !DILocation(line: 2601, column: 5, scope: !2770)
!2785 = !DILocation(line: 2603, column: 7, scope: !2786)
!2786 = distinct !DILexicalBlock(scope: !2770, file: !70, line: 2603, column: 5)
!2787 = !DILocation(line: 2603, column: 12, scope: !2786)
!2788 = !DILocation(line: 2603, column: 16, scope: !2786)
!2789 = !DILocation(line: 2603, column: 20, scope: !2786)
!2790 = !DILocation(line: 2603, column: 26, scope: !2786)
!2791 = !DILocation(line: 2603, column: 31, scope: !2786)
!2792 = !DILocation(line: 2603, column: 36, scope: !2786)
!2793 = !DILocation(line: 2603, column: 41, scope: !2786)
!2794 = !DILocation(line: 2603, column: 45, scope: !2786)
!2795 = !DILocation(line: 2603, column: 49, scope: !2786)
!2796 = !DILocation(line: 2603, column: 55, scope: !2786)
!2797 = !DILocation(line: 2603, column: 5, scope: !2770)
!2798 = !DILocation(line: 2605, column: 13, scope: !2799)
!2799 = distinct !DILexicalBlock(scope: !2786, file: !70, line: 2604, column: 2)
!2800 = !DILocation(line: 2606, column: 2, scope: !2799)
!2801 = !DILocation(line: 2609, column: 13, scope: !2802)
!2802 = distinct !DILexicalBlock(scope: !2786, file: !70, line: 2608, column: 2)
!2803 = !DILocation(line: 2612, column: 5, scope: !2804)
!2804 = distinct !DILexicalBlock(scope: !2770, file: !70, line: 2612, column: 5)
!2805 = !DILocation(line: 2612, column: 10, scope: !2804)
!2806 = !DILocation(line: 2612, column: 5, scope: !2770)
!2807 = !DILocation(line: 2614, column: 15, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2804, file: !70, line: 2613, column: 2)
!2809 = !DILocation(line: 2614, column: 14, scope: !2808)
!2810 = !DILocation(line: 2614, column: 12, scope: !2808)
!2811 = !DILocation(line: 2615, column: 2, scope: !2808)
!2812 = !DILocation(line: 2618, column: 14, scope: !2813)
!2813 = distinct !DILexicalBlock(scope: !2804, file: !70, line: 2617, column: 2)
!2814 = !DILocation(line: 2618, column: 12, scope: !2813)
!2815 = !DILocation(line: 2621, column: 5, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2770, file: !70, line: 2621, column: 5)
!2817 = !DILocation(line: 2621, column: 11, scope: !2816)
!2818 = !DILocation(line: 2621, column: 5, scope: !2770)
!2819 = !DILocation(line: 2623, column: 15, scope: !2820)
!2820 = distinct !DILexicalBlock(scope: !2816, file: !70, line: 2622, column: 2)
!2821 = !DILocation(line: 2623, column: 14, scope: !2820)
!2822 = !DILocation(line: 2623, column: 12, scope: !2820)
!2823 = !DILocation(line: 2624, column: 2, scope: !2820)
!2824 = !DILocation(line: 2627, column: 14, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2816, file: !70, line: 2626, column: 2)
!2826 = !DILocation(line: 2627, column: 12, scope: !2825)
!2827 = !DILocation(line: 2630, column: 13, scope: !2770)
!2828 = !DILocation(line: 2630, column: 24, scope: !2770)
!2829 = !DILocation(line: 2630, column: 22, scope: !2770)
!2830 = !DILocation(line: 2630, column: 11, scope: !2770)
!2831 = !DILocation(line: 2631, column: 25, scope: !2770)
!2832 = !DILocation(line: 2631, column: 35, scope: !2770)
!2833 = !DILocation(line: 2631, column: 13, scope: !2770)
!2834 = !DILocation(line: 2631, column: 11, scope: !2770)
!2835 = !DILocation(line: 2632, column: 13, scope: !2770)
!2836 = !DILocation(line: 2632, column: 22, scope: !2770)
!2837 = !DILocation(line: 2632, column: 11, scope: !2770)
!2838 = !DILocation(line: 2633, column: 14, scope: !2770)
!2839 = !DILocation(line: 2633, column: 23, scope: !2770)
!2840 = !DILocation(line: 2633, column: 11, scope: !2770)
!2841 = !DILocation(line: 2634, column: 6, scope: !2842)
!2842 = distinct !DILexicalBlock(scope: !2770, file: !70, line: 2634, column: 5)
!2843 = !DILocation(line: 2634, column: 14, scope: !2842)
!2844 = !DILocation(line: 2634, column: 18, scope: !2842)
!2845 = !DILocation(line: 2634, column: 5, scope: !2770)
!2846 = !DILocation(line: 2636, column: 6, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2848, file: !70, line: 2636, column: 6)
!2848 = distinct !DILexicalBlock(scope: !2842, file: !70, line: 2635, column: 2)
!2849 = !DILocation(line: 2636, column: 16, scope: !2847)
!2850 = !DILocation(line: 2636, column: 6, scope: !2848)
!2851 = !DILocation(line: 2638, column: 7, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2853, file: !70, line: 2638, column: 7)
!2853 = distinct !DILexicalBlock(scope: !2847, file: !70, line: 2637, column: 3)
!2854 = !DILocation(line: 2638, column: 15, scope: !2852)
!2855 = !DILocation(line: 2638, column: 7, scope: !2853)
!2856 = !DILocation(line: 2639, column: 12, scope: !2852)
!2857 = !DILocation(line: 2639, column: 5, scope: !2852)
!2858 = !DILocation(line: 2641, column: 5, scope: !2852)
!2859 = !DILocation(line: 2645, column: 7, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2861, file: !70, line: 2645, column: 7)
!2861 = distinct !DILexicalBlock(scope: !2847, file: !70, line: 2644, column: 3)
!2862 = !DILocation(line: 2645, column: 15, scope: !2860)
!2863 = !DILocation(line: 2645, column: 7, scope: !2861)
!2864 = !DILocation(line: 2646, column: 13, scope: !2860)
!2865 = !DILocation(line: 2646, column: 12, scope: !2860)
!2866 = !DILocation(line: 2646, column: 5, scope: !2860)
!2867 = !DILocation(line: 2648, column: 5, scope: !2860)
!2868 = !DILocation(line: 2653, column: 3, scope: !2869)
!2869 = distinct !DILexicalBlock(scope: !2842, file: !70, line: 2652, column: 2)
!2870 = !DILocation(line: 2655, column: 1, scope: !2770)
!2871 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !70, file: !70, line: 2670, type: !2207, scopeLine: 2671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2872 = !DILocalVariable(name: "val1", arg: 1, scope: !2871, file: !70, line: 2670, type: !20)
!2873 = !DILocation(line: 2670, column: 25, scope: !2871)
!2874 = !DILocalVariable(name: "val2", arg: 2, scope: !2871, file: !70, line: 2670, type: !20)
!2875 = !DILocation(line: 2670, column: 35, scope: !2871)
!2876 = !DILocalVariable(name: "u32Temp1", scope: !2871, file: !70, line: 2672, type: !733)
!2877 = !DILocation(line: 2672, column: 6, scope: !2871)
!2878 = !DILocalVariable(name: "u32Temp2", scope: !2871, file: !70, line: 2672, type: !733)
!2879 = !DILocation(line: 2672, column: 17, scope: !2871)
!2880 = !DILocalVariable(name: "u32Temp3", scope: !2871, file: !70, line: 2672, type: !733)
!2881 = !DILocation(line: 2672, column: 26, scope: !2871)
!2882 = !DILocalVariable(name: "u32Temp4", scope: !2871, file: !70, line: 2672, type: !733)
!2883 = !DILocation(line: 2672, column: 35, scope: !2871)
!2884 = !DILocalVariable(name: "u8SignBit", scope: !2871, file: !70, line: 2673, type: !24)
!2885 = !DILocation(line: 2673, column: 5, scope: !2871)
!2886 = !DILocation(line: 2675, column: 7, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2675, column: 5)
!2888 = !DILocation(line: 2675, column: 11, scope: !2887)
!2889 = !DILocation(line: 2675, column: 15, scope: !2887)
!2890 = !DILocation(line: 2675, column: 33, scope: !2887)
!2891 = !DILocation(line: 2675, column: 37, scope: !2887)
!2892 = !DILocation(line: 2675, column: 41, scope: !2887)
!2893 = !DILocation(line: 2677, column: 13, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2887, file: !70, line: 2676, column: 2)
!2895 = !DILocation(line: 2678, column: 2, scope: !2894)
!2896 = !DILocation(line: 2681, column: 13, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2887, file: !70, line: 2680, column: 2)
!2898 = !DILocation(line: 2684, column: 5, scope: !2899)
!2899 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2684, column: 5)
!2900 = !DILocation(line: 2684, column: 9, scope: !2899)
!2901 = !DILocation(line: 2684, column: 5, scope: !2871)
!2902 = !DILocation(line: 2686, column: 15, scope: !2903)
!2903 = distinct !DILexicalBlock(scope: !2899, file: !70, line: 2685, column: 2)
!2904 = !DILocation(line: 2686, column: 14, scope: !2903)
!2905 = !DILocation(line: 2686, column: 12, scope: !2903)
!2906 = !DILocation(line: 2687, column: 2, scope: !2903)
!2907 = !DILocation(line: 2690, column: 14, scope: !2908)
!2908 = distinct !DILexicalBlock(scope: !2899, file: !70, line: 2689, column: 2)
!2909 = !DILocation(line: 2690, column: 12, scope: !2908)
!2910 = !DILocation(line: 2693, column: 5, scope: !2911)
!2911 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2693, column: 5)
!2912 = !DILocation(line: 2693, column: 9, scope: !2911)
!2913 = !DILocation(line: 2693, column: 5, scope: !2871)
!2914 = !DILocation(line: 2695, column: 15, scope: !2915)
!2915 = distinct !DILexicalBlock(scope: !2911, file: !70, line: 2694, column: 2)
!2916 = !DILocation(line: 2695, column: 14, scope: !2915)
!2917 = !DILocation(line: 2695, column: 12, scope: !2915)
!2918 = !DILocation(line: 2696, column: 2, scope: !2915)
!2919 = !DILocation(line: 2699, column: 14, scope: !2920)
!2920 = distinct !DILexicalBlock(scope: !2911, file: !70, line: 2698, column: 2)
!2921 = !DILocation(line: 2699, column: 12, scope: !2920)
!2922 = !DILocation(line: 2702, column: 13, scope: !2871)
!2923 = !DILocation(line: 2702, column: 24, scope: !2871)
!2924 = !DILocation(line: 2702, column: 22, scope: !2871)
!2925 = !DILocation(line: 2702, column: 11, scope: !2871)
!2926 = !DILocation(line: 2703, column: 25, scope: !2871)
!2927 = !DILocation(line: 2703, column: 35, scope: !2871)
!2928 = !DILocation(line: 2703, column: 13, scope: !2871)
!2929 = !DILocation(line: 2703, column: 11, scope: !2871)
!2930 = !DILocation(line: 2704, column: 5, scope: !2931)
!2931 = distinct !DILexicalBlock(scope: !2871, file: !70, line: 2704, column: 5)
!2932 = !DILocation(line: 2704, column: 13, scope: !2931)
!2933 = !DILocation(line: 2704, column: 5, scope: !2871)
!2934 = !DILocation(line: 2706, column: 6, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2936, file: !70, line: 2706, column: 6)
!2936 = distinct !DILexicalBlock(scope: !2931, file: !70, line: 2705, column: 2)
!2937 = !DILocation(line: 2706, column: 16, scope: !2935)
!2938 = !DILocation(line: 2706, column: 6, scope: !2936)
!2939 = !DILocation(line: 2708, column: 7, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2941, file: !70, line: 2708, column: 7)
!2941 = distinct !DILexicalBlock(scope: !2935, file: !70, line: 2707, column: 3)
!2942 = !DILocation(line: 2708, column: 15, scope: !2940)
!2943 = !DILocation(line: 2708, column: 7, scope: !2941)
!2944 = !DILocation(line: 2709, column: 12, scope: !2940)
!2945 = !DILocation(line: 2709, column: 5, scope: !2940)
!2946 = !DILocation(line: 2711, column: 5, scope: !2940)
!2947 = !DILocation(line: 2715, column: 7, scope: !2948)
!2948 = distinct !DILexicalBlock(scope: !2949, file: !70, line: 2715, column: 7)
!2949 = distinct !DILexicalBlock(scope: !2935, file: !70, line: 2714, column: 3)
!2950 = !DILocation(line: 2715, column: 15, scope: !2948)
!2951 = !DILocation(line: 2715, column: 7, scope: !2949)
!2952 = !DILocation(line: 2716, column: 13, scope: !2948)
!2953 = !DILocation(line: 2716, column: 12, scope: !2948)
!2954 = !DILocation(line: 2716, column: 5, scope: !2948)
!2955 = !DILocation(line: 2718, column: 5, scope: !2948)
!2956 = !DILocation(line: 2723, column: 6, scope: !2957)
!2957 = distinct !DILexicalBlock(scope: !2958, file: !70, line: 2723, column: 6)
!2958 = distinct !DILexicalBlock(scope: !2931, file: !70, line: 2722, column: 2)
!2959 = !DILocation(line: 2723, column: 16, scope: !2957)
!2960 = !DILocation(line: 2723, column: 6, scope: !2958)
!2961 = !DILocation(line: 2725, column: 4, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2957, file: !70, line: 2724, column: 3)
!2963 = !DILocation(line: 2729, column: 4, scope: !2964)
!2964 = distinct !DILexicalBlock(scope: !2957, file: !70, line: 2728, column: 3)
!2965 = !DILocation(line: 2733, column: 1, scope: !2871)
!2966 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !70, file: !70, line: 2751, type: !2103, scopeLine: 2752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2967 = !DILocalVariable(name: "value", arg: 1, scope: !2966, file: !70, line: 2751, type: !20)
!2968 = !DILocation(line: 2751, column: 31, scope: !2966)
!2969 = !DILocalVariable(name: "factor", arg: 2, scope: !2966, file: !70, line: 2751, type: !733)
!2970 = !DILocation(line: 2751, column: 42, scope: !2966)
!2971 = !DILocalVariable(name: "u32Temp1", scope: !2966, file: !70, line: 2753, type: !733)
!2972 = !DILocation(line: 2753, column: 6, scope: !2966)
!2973 = !DILocalVariable(name: "u32Temp2", scope: !2966, file: !70, line: 2753, type: !733)
!2974 = !DILocation(line: 2753, column: 17, scope: !2966)
!2975 = !DILocalVariable(name: "u8SignBit", scope: !2966, file: !70, line: 2754, type: !24)
!2976 = !DILocation(line: 2754, column: 5, scope: !2966)
!2977 = !DILocation(line: 2756, column: 5, scope: !2978)
!2978 = distinct !DILexicalBlock(scope: !2966, file: !70, line: 2756, column: 5)
!2979 = !DILocation(line: 2756, column: 10, scope: !2978)
!2980 = !DILocation(line: 2756, column: 5, scope: !2966)
!2981 = !DILocation(line: 2758, column: 15, scope: !2982)
!2982 = distinct !DILexicalBlock(scope: !2978, file: !70, line: 2757, column: 2)
!2983 = !DILocation(line: 2758, column: 14, scope: !2982)
!2984 = !DILocation(line: 2758, column: 12, scope: !2982)
!2985 = !DILocation(line: 2759, column: 13, scope: !2982)
!2986 = !DILocation(line: 2760, column: 2, scope: !2982)
!2987 = !DILocation(line: 2763, column: 14, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2978, file: !70, line: 2762, column: 2)
!2989 = !DILocation(line: 2763, column: 12, scope: !2988)
!2990 = !DILocation(line: 2764, column: 13, scope: !2988)
!2991 = !DILocation(line: 2767, column: 25, scope: !2966)
!2992 = !DILocation(line: 2767, column: 35, scope: !2966)
!2993 = !DILocation(line: 2767, column: 13, scope: !2966)
!2994 = !DILocation(line: 2767, column: 11, scope: !2966)
!2995 = !DILocation(line: 2768, column: 13, scope: !2966)
!2996 = !DILocation(line: 2768, column: 22, scope: !2966)
!2997 = !DILocation(line: 2768, column: 11, scope: !2966)
!2998 = !DILocation(line: 2769, column: 5, scope: !2999)
!2999 = distinct !DILexicalBlock(scope: !2966, file: !70, line: 2769, column: 5)
!3000 = !DILocation(line: 2769, column: 15, scope: !2999)
!3001 = !DILocation(line: 2769, column: 5, scope: !2966)
!3002 = !DILocation(line: 2771, column: 10, scope: !3003)
!3003 = distinct !DILexicalBlock(scope: !2999, file: !70, line: 2770, column: 2)
!3004 = !DILocation(line: 2771, column: 3, scope: !3003)
!3005 = !DILocation(line: 2775, column: 11, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2999, file: !70, line: 2774, column: 2)
!3007 = !DILocation(line: 2775, column: 10, scope: !3006)
!3008 = !DILocation(line: 2775, column: 3, scope: !3006)
!3009 = !DILocation(line: 2777, column: 1, scope: !2966)
!3010 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !70, file: !70, line: 2793, type: !2207, scopeLine: 2794, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3011 = !DILocalVariable(name: "value", arg: 1, scope: !3010, file: !70, line: 2793, type: !20)
!3012 = !DILocation(line: 2793, column: 31, scope: !3010)
!3013 = !DILocalVariable(name: "factor", arg: 2, scope: !3010, file: !70, line: 2793, type: !20)
!3014 = !DILocation(line: 2793, column: 42, scope: !3010)
!3015 = !DILocalVariable(name: "u32Temp1", scope: !3010, file: !70, line: 2795, type: !733)
!3016 = !DILocation(line: 2795, column: 6, scope: !3010)
!3017 = !DILocalVariable(name: "u32Temp2", scope: !3010, file: !70, line: 2795, type: !733)
!3018 = !DILocation(line: 2795, column: 17, scope: !3010)
!3019 = !DILocalVariable(name: "u32Temp3", scope: !3010, file: !70, line: 2795, type: !733)
!3020 = !DILocation(line: 2795, column: 26, scope: !3010)
!3021 = !DILocalVariable(name: "u8SignBit", scope: !3010, file: !70, line: 2796, type: !24)
!3022 = !DILocation(line: 2796, column: 5, scope: !3010)
!3023 = !DILocation(line: 2798, column: 7, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3010, file: !70, line: 2798, column: 5)
!3025 = !DILocation(line: 2798, column: 12, scope: !3024)
!3026 = !DILocation(line: 2798, column: 16, scope: !3024)
!3027 = !DILocation(line: 2798, column: 36, scope: !3024)
!3028 = !DILocation(line: 2798, column: 41, scope: !3024)
!3029 = !DILocation(line: 2798, column: 45, scope: !3024)
!3030 = !DILocation(line: 2800, column: 13, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3024, file: !70, line: 2799, column: 2)
!3032 = !DILocation(line: 2801, column: 2, scope: !3031)
!3033 = !DILocation(line: 2804, column: 13, scope: !3034)
!3034 = distinct !DILexicalBlock(scope: !3024, file: !70, line: 2803, column: 2)
!3035 = !DILocation(line: 2807, column: 5, scope: !3036)
!3036 = distinct !DILexicalBlock(scope: !3010, file: !70, line: 2807, column: 5)
!3037 = !DILocation(line: 2807, column: 10, scope: !3036)
!3038 = !DILocation(line: 2807, column: 5, scope: !3010)
!3039 = !DILocation(line: 2809, column: 15, scope: !3040)
!3040 = distinct !DILexicalBlock(scope: !3036, file: !70, line: 2808, column: 2)
!3041 = !DILocation(line: 2809, column: 14, scope: !3040)
!3042 = !DILocation(line: 2809, column: 12, scope: !3040)
!3043 = !DILocation(line: 2810, column: 2, scope: !3040)
!3044 = !DILocation(line: 2813, column: 14, scope: !3045)
!3045 = distinct !DILexicalBlock(scope: !3036, file: !70, line: 2812, column: 2)
!3046 = !DILocation(line: 2813, column: 12, scope: !3045)
!3047 = !DILocation(line: 2816, column: 5, scope: !3048)
!3048 = distinct !DILexicalBlock(scope: !3010, file: !70, line: 2816, column: 5)
!3049 = !DILocation(line: 2816, column: 11, scope: !3048)
!3050 = !DILocation(line: 2816, column: 5, scope: !3010)
!3051 = !DILocation(line: 2818, column: 15, scope: !3052)
!3052 = distinct !DILexicalBlock(scope: !3048, file: !70, line: 2817, column: 2)
!3053 = !DILocation(line: 2818, column: 14, scope: !3052)
!3054 = !DILocation(line: 2818, column: 12, scope: !3052)
!3055 = !DILocation(line: 2819, column: 2, scope: !3052)
!3056 = !DILocation(line: 2822, column: 14, scope: !3057)
!3057 = distinct !DILexicalBlock(scope: !3048, file: !70, line: 2821, column: 2)
!3058 = !DILocation(line: 2822, column: 12, scope: !3057)
!3059 = !DILocation(line: 2825, column: 25, scope: !3010)
!3060 = !DILocation(line: 2825, column: 35, scope: !3010)
!3061 = !DILocation(line: 2825, column: 13, scope: !3010)
!3062 = !DILocation(line: 2825, column: 11, scope: !3010)
!3063 = !DILocation(line: 2826, column: 5, scope: !3064)
!3064 = distinct !DILexicalBlock(scope: !3010, file: !70, line: 2826, column: 5)
!3065 = !DILocation(line: 2826, column: 15, scope: !3064)
!3066 = !DILocation(line: 2826, column: 5, scope: !3010)
!3067 = !DILocation(line: 2828, column: 10, scope: !3068)
!3068 = distinct !DILexicalBlock(scope: !3064, file: !70, line: 2827, column: 2)
!3069 = !DILocation(line: 2828, column: 3, scope: !3068)
!3070 = !DILocation(line: 2832, column: 11, scope: !3071)
!3071 = distinct !DILexicalBlock(scope: !3064, file: !70, line: 2831, column: 2)
!3072 = !DILocation(line: 2832, column: 10, scope: !3071)
!3073 = !DILocation(line: 2832, column: 3, scope: !3071)
!3074 = !DILocation(line: 2834, column: 1, scope: !3010)
!3075 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !70, file: !70, line: 2851, type: !3076, scopeLine: 2852, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3076 = !DISubroutineType(types: !3077)
!3077 = !{!733, !733, !24}
!3078 = !DILocalVariable(name: "value", arg: 1, scope: !3075, file: !70, line: 2851, type: !733)
!3079 = !DILocation(line: 2851, column: 29, scope: !3075)
!3080 = !DILocalVariable(name: "factor", arg: 2, scope: !3075, file: !70, line: 2851, type: !24)
!3081 = !DILocation(line: 2851, column: 39, scope: !3075)
!3082 = !DILocalVariable(name: "u32Temp1", scope: !3075, file: !70, line: 2853, type: !733)
!3083 = !DILocation(line: 2853, column: 6, scope: !3075)
!3084 = !DILocalVariable(name: "u32Temp2", scope: !3075, file: !70, line: 2853, type: !733)
!3085 = !DILocation(line: 2853, column: 20, scope: !3075)
!3086 = !DILocation(line: 2854, column: 13, scope: !3075)
!3087 = !DILocation(line: 2854, column: 21, scope: !3075)
!3088 = !DILocation(line: 2854, column: 19, scope: !3075)
!3089 = !DILocation(line: 2854, column: 11, scope: !3075)
!3090 = !DILocation(line: 2855, column: 25, scope: !3075)
!3091 = !DILocation(line: 2855, column: 32, scope: !3075)
!3092 = !DILocation(line: 2855, column: 13, scope: !3075)
!3093 = !DILocation(line: 2855, column: 11, scope: !3075)
!3094 = !DILocation(line: 2856, column: 14, scope: !3075)
!3095 = !DILocation(line: 2856, column: 23, scope: !3075)
!3096 = !DILocation(line: 2856, column: 11, scope: !3075)
!3097 = !DILocation(line: 2857, column: 14, scope: !3075)
!3098 = !DILocation(line: 2857, column: 23, scope: !3075)
!3099 = !DILocation(line: 2857, column: 11, scope: !3075)
!3100 = !DILocation(line: 2858, column: 9, scope: !3075)
!3101 = !DILocation(line: 2858, column: 2, scope: !3075)
!3102 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !70, file: !70, line: 2877, type: !3076, scopeLine: 2878, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3103 = !DILocalVariable(name: "value", arg: 1, scope: !3102, file: !70, line: 2877, type: !733)
!3104 = !DILocation(line: 2877, column: 29, scope: !3102)
!3105 = !DILocalVariable(name: "factor", arg: 2, scope: !3102, file: !70, line: 2877, type: !24)
!3106 = !DILocation(line: 2877, column: 39, scope: !3102)
!3107 = !DILocalVariable(name: "u32Temp1", scope: !3102, file: !70, line: 2879, type: !733)
!3108 = !DILocation(line: 2879, column: 6, scope: !3102)
!3109 = !DILocalVariable(name: "u32Temp2", scope: !3102, file: !70, line: 2879, type: !733)
!3110 = !DILocation(line: 2879, column: 20, scope: !3102)
!3111 = !DILocation(line: 2880, column: 13, scope: !3102)
!3112 = !DILocation(line: 2880, column: 21, scope: !3102)
!3113 = !DILocation(line: 2880, column: 19, scope: !3102)
!3114 = !DILocation(line: 2880, column: 11, scope: !3102)
!3115 = !DILocation(line: 2881, column: 25, scope: !3102)
!3116 = !DILocation(line: 2881, column: 32, scope: !3102)
!3117 = !DILocation(line: 2881, column: 13, scope: !3102)
!3118 = !DILocation(line: 2881, column: 11, scope: !3102)
!3119 = !DILocation(line: 2882, column: 14, scope: !3102)
!3120 = !DILocation(line: 2882, column: 23, scope: !3102)
!3121 = !DILocation(line: 2882, column: 11, scope: !3102)
!3122 = !DILocation(line: 2883, column: 14, scope: !3102)
!3123 = !DILocation(line: 2883, column: 23, scope: !3102)
!3124 = !DILocation(line: 2883, column: 11, scope: !3102)
!3125 = !DILocation(line: 2884, column: 6, scope: !3126)
!3126 = distinct !DILexicalBlock(scope: !3102, file: !70, line: 2884, column: 5)
!3127 = !DILocation(line: 2884, column: 14, scope: !3126)
!3128 = !DILocation(line: 2884, column: 19, scope: !3126)
!3129 = !DILocation(line: 2884, column: 5, scope: !3102)
!3130 = !DILocation(line: 2886, column: 10, scope: !3131)
!3131 = distinct !DILexicalBlock(scope: !3126, file: !70, line: 2885, column: 2)
!3132 = !DILocation(line: 2886, column: 3, scope: !3131)
!3133 = !DILocation(line: 2890, column: 3, scope: !3134)
!3134 = distinct !DILexicalBlock(scope: !3126, file: !70, line: 2889, column: 2)
!3135 = !DILocation(line: 2893, column: 1, scope: !3102)
!3136 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !70, file: !70, line: 2912, type: !3137, scopeLine: 2913, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3137 = !DISubroutineType(types: !3138)
!3138 = !{!733, !733, !6}
!3139 = !DILocalVariable(name: "value", arg: 1, scope: !3136, file: !70, line: 2912, type: !733)
!3140 = !DILocation(line: 2912, column: 29, scope: !3136)
!3141 = !DILocalVariable(name: "factor", arg: 2, scope: !3136, file: !70, line: 2912, type: !6)
!3142 = !DILocation(line: 2912, column: 39, scope: !3136)
!3143 = !DILocalVariable(name: "u32Temp1", scope: !3136, file: !70, line: 2914, type: !733)
!3144 = !DILocation(line: 2914, column: 6, scope: !3136)
!3145 = !DILocalVariable(name: "u32Temp2", scope: !3136, file: !70, line: 2914, type: !733)
!3146 = !DILocation(line: 2914, column: 20, scope: !3136)
!3147 = !DILocation(line: 2915, column: 5, scope: !3148)
!3148 = distinct !DILexicalBlock(scope: !3136, file: !70, line: 2915, column: 5)
!3149 = !DILocation(line: 2915, column: 12, scope: !3148)
!3150 = !DILocation(line: 2915, column: 5, scope: !3136)
!3151 = !DILocation(line: 2918, column: 14, scope: !3152)
!3152 = distinct !DILexicalBlock(scope: !3148, file: !70, line: 2916, column: 2)
!3153 = !DILocation(line: 2918, column: 22, scope: !3152)
!3154 = !DILocation(line: 2918, column: 20, scope: !3152)
!3155 = !DILocation(line: 2918, column: 12, scope: !3152)
!3156 = !DILocation(line: 2919, column: 26, scope: !3152)
!3157 = !DILocation(line: 2919, column: 33, scope: !3152)
!3158 = !DILocation(line: 2919, column: 14, scope: !3152)
!3159 = !DILocation(line: 2919, column: 12, scope: !3152)
!3160 = !DILocation(line: 2920, column: 14, scope: !3152)
!3161 = !DILocation(line: 2920, column: 23, scope: !3152)
!3162 = !DILocation(line: 2920, column: 12, scope: !3152)
!3163 = !DILocation(line: 2921, column: 15, scope: !3152)
!3164 = !DILocation(line: 2921, column: 24, scope: !3152)
!3165 = !DILocation(line: 2921, column: 12, scope: !3152)
!3166 = !DILocation(line: 2922, column: 10, scope: !3152)
!3167 = !DILocation(line: 2922, column: 3, scope: !3152)
!3168 = !DILocation(line: 2926, column: 3, scope: !3169)
!3169 = distinct !DILexicalBlock(scope: !3148, file: !70, line: 2925, column: 2)
!3170 = !DILocation(line: 2928, column: 1, scope: !3136)
!3171 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !70, file: !70, line: 2947, type: !3137, scopeLine: 2948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3172 = !DILocalVariable(name: "value", arg: 1, scope: !3171, file: !70, line: 2947, type: !733)
!3173 = !DILocation(line: 2947, column: 29, scope: !3171)
!3174 = !DILocalVariable(name: "factor", arg: 2, scope: !3171, file: !70, line: 2947, type: !6)
!3175 = !DILocation(line: 2947, column: 39, scope: !3171)
!3176 = !DILocalVariable(name: "u32Temp1", scope: !3171, file: !70, line: 2949, type: !733)
!3177 = !DILocation(line: 2949, column: 6, scope: !3171)
!3178 = !DILocalVariable(name: "u32Temp2", scope: !3171, file: !70, line: 2949, type: !733)
!3179 = !DILocation(line: 2949, column: 20, scope: !3171)
!3180 = !DILocation(line: 2950, column: 5, scope: !3181)
!3181 = distinct !DILexicalBlock(scope: !3171, file: !70, line: 2950, column: 5)
!3182 = !DILocation(line: 2950, column: 12, scope: !3181)
!3183 = !DILocation(line: 2950, column: 5, scope: !3171)
!3184 = !DILocation(line: 2952, column: 3, scope: !3185)
!3185 = distinct !DILexicalBlock(scope: !3181, file: !70, line: 2951, column: 2)
!3186 = !DILocation(line: 2956, column: 14, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3181, file: !70, line: 2955, column: 2)
!3188 = !DILocation(line: 2956, column: 22, scope: !3187)
!3189 = !DILocation(line: 2956, column: 20, scope: !3187)
!3190 = !DILocation(line: 2956, column: 12, scope: !3187)
!3191 = !DILocation(line: 2957, column: 26, scope: !3187)
!3192 = !DILocation(line: 2957, column: 33, scope: !3187)
!3193 = !DILocation(line: 2957, column: 14, scope: !3187)
!3194 = !DILocation(line: 2957, column: 12, scope: !3187)
!3195 = !DILocation(line: 2958, column: 14, scope: !3187)
!3196 = !DILocation(line: 2958, column: 23, scope: !3187)
!3197 = !DILocation(line: 2958, column: 12, scope: !3187)
!3198 = !DILocation(line: 2959, column: 15, scope: !3187)
!3199 = !DILocation(line: 2959, column: 24, scope: !3187)
!3200 = !DILocation(line: 2959, column: 12, scope: !3187)
!3201 = !DILocation(line: 2960, column: 7, scope: !3202)
!3202 = distinct !DILexicalBlock(scope: !3187, file: !70, line: 2960, column: 6)
!3203 = !DILocation(line: 2960, column: 16, scope: !3202)
!3204 = !DILocation(line: 2960, column: 22, scope: !3202)
!3205 = !DILocation(line: 2960, column: 6, scope: !3187)
!3206 = !DILocation(line: 2962, column: 11, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !3202, file: !70, line: 2961, column: 3)
!3208 = !DILocation(line: 2962, column: 4, scope: !3207)
!3209 = !DILocation(line: 2966, column: 4, scope: !3210)
!3210 = distinct !DILexicalBlock(scope: !3202, file: !70, line: 2965, column: 3)
!3211 = !DILocation(line: 2969, column: 1, scope: !3171)
!3212 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !70, file: !70, line: 2991, type: !298, scopeLine: 2992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3213 = !DILocalVariable(name: "value", arg: 1, scope: !3212, file: !70, line: 2991, type: !13)
!3214 = !DILocation(line: 2991, column: 33, scope: !3212)
!3215 = !DILocalVariable(name: "factor", arg: 2, scope: !3212, file: !70, line: 2991, type: !13)
!3216 = !DILocation(line: 2991, column: 44, scope: !3212)
!3217 = !DILocation(line: 2993, column: 40, scope: !3212)
!3218 = !DILocation(line: 2993, column: 46, scope: !3212)
!3219 = !DILocation(line: 2993, column: 9, scope: !3212)
!3220 = !DILocation(line: 2993, column: 2, scope: !3212)
!3221 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !70, file: !70, line: 3015, type: !298, scopeLine: 3016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3222 = !DILocalVariable(name: "value", arg: 1, scope: !3221, file: !70, line: 3015, type: !13)
!3223 = !DILocation(line: 3015, column: 33, scope: !3221)
!3224 = !DILocalVariable(name: "factor", arg: 2, scope: !3221, file: !70, line: 3015, type: !13)
!3225 = !DILocation(line: 3015, column: 44, scope: !3221)
!3226 = !DILocation(line: 3017, column: 41, scope: !3221)
!3227 = !DILocation(line: 3017, column: 47, scope: !3221)
!3228 = !DILocation(line: 3017, column: 10, scope: !3221)
!3229 = !DILocation(line: 3017, column: 3, scope: !3221)
!3230 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !70, file: !70, line: 3040, type: !298, scopeLine: 3041, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3231 = !DILocalVariable(name: "value", arg: 1, scope: !3230, file: !70, line: 3040, type: !13)
!3232 = !DILocation(line: 3040, column: 32, scope: !3230)
!3233 = !DILocalVariable(name: "factor", arg: 2, scope: !3230, file: !70, line: 3040, type: !13)
!3234 = !DILocation(line: 3040, column: 43, scope: !3230)
!3235 = !DILocation(line: 3042, column: 41, scope: !3230)
!3236 = !DILocation(line: 3042, column: 47, scope: !3230)
!3237 = !DILocation(line: 3042, column: 10, scope: !3230)
!3238 = !DILocation(line: 3042, column: 3, scope: !3230)
!3239 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !70, file: !70, line: 3065, type: !298, scopeLine: 3066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3240 = !DILocalVariable(name: "value", arg: 1, scope: !3239, file: !70, line: 3065, type: !13)
!3241 = !DILocation(line: 3065, column: 34, scope: !3239)
!3242 = !DILocalVariable(name: "factor", arg: 2, scope: !3239, file: !70, line: 3065, type: !13)
!3243 = !DILocation(line: 3065, column: 45, scope: !3239)
!3244 = !DILocation(line: 3067, column: 44, scope: !3239)
!3245 = !DILocation(line: 3067, column: 50, scope: !3239)
!3246 = !DILocation(line: 3067, column: 10, scope: !3239)
!3247 = !DILocation(line: 3067, column: 3, scope: !3239)
!3248 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !70, file: !70, line: 3090, type: !298, scopeLine: 3091, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3249 = !DILocalVariable(name: "value", arg: 1, scope: !3248, file: !70, line: 3090, type: !13)
!3250 = !DILocation(line: 3090, column: 33, scope: !3248)
!3251 = !DILocalVariable(name: "factor", arg: 2, scope: !3248, file: !70, line: 3090, type: !13)
!3252 = !DILocation(line: 3090, column: 44, scope: !3248)
!3253 = !DILocation(line: 3092, column: 44, scope: !3248)
!3254 = !DILocation(line: 3092, column: 50, scope: !3248)
!3255 = !DILocation(line: 3092, column: 10, scope: !3248)
!3256 = !DILocation(line: 3092, column: 3, scope: !3248)
!3257 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !70, file: !70, line: 3115, type: !298, scopeLine: 3116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3258 = !DILocalVariable(name: "value", arg: 1, scope: !3257, file: !70, line: 3115, type: !13)
!3259 = !DILocation(line: 3115, column: 31, scope: !3257)
!3260 = !DILocalVariable(name: "factor", arg: 2, scope: !3257, file: !70, line: 3115, type: !13)
!3261 = !DILocation(line: 3115, column: 42, scope: !3257)
!3262 = !DILocation(line: 3117, column: 44, scope: !3257)
!3263 = !DILocation(line: 3117, column: 50, scope: !3257)
!3264 = !DILocation(line: 3117, column: 10, scope: !3257)
!3265 = !DILocation(line: 3117, column: 3, scope: !3257)
!3266 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !70, file: !70, line: 3140, type: !298, scopeLine: 3141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3267 = !DILocalVariable(name: "value", arg: 1, scope: !3266, file: !70, line: 3140, type: !13)
!3268 = !DILocation(line: 3140, column: 33, scope: !3266)
!3269 = !DILocalVariable(name: "factor", arg: 2, scope: !3266, file: !70, line: 3140, type: !13)
!3270 = !DILocation(line: 3140, column: 44, scope: !3266)
!3271 = !DILocation(line: 3142, column: 44, scope: !3266)
!3272 = !DILocation(line: 3142, column: 50, scope: !3266)
!3273 = !DILocation(line: 3142, column: 10, scope: !3266)
!3274 = !DILocation(line: 3142, column: 3, scope: !3266)
!3275 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !70, file: !70, line: 3165, type: !298, scopeLine: 3166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3276 = !DILocalVariable(name: "value", arg: 1, scope: !3275, file: !70, line: 3165, type: !13)
!3277 = !DILocation(line: 3165, column: 32, scope: !3275)
!3278 = !DILocalVariable(name: "factor", arg: 2, scope: !3275, file: !70, line: 3165, type: !13)
!3279 = !DILocation(line: 3165, column: 43, scope: !3275)
!3280 = !DILocation(line: 3167, column: 44, scope: !3275)
!3281 = !DILocation(line: 3167, column: 50, scope: !3275)
!3282 = !DILocation(line: 3167, column: 10, scope: !3275)
!3283 = !DILocation(line: 3167, column: 3, scope: !3275)
!3284 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !70, file: !70, line: 3189, type: !298, scopeLine: 3190, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3285 = !DILocalVariable(name: "value", arg: 1, scope: !3284, file: !70, line: 3189, type: !13)
!3286 = !DILocation(line: 3189, column: 31, scope: !3284)
!3287 = !DILocalVariable(name: "factor", arg: 2, scope: !3284, file: !70, line: 3189, type: !13)
!3288 = !DILocation(line: 3189, column: 42, scope: !3284)
!3289 = !DILocation(line: 3191, column: 44, scope: !3284)
!3290 = !DILocation(line: 3191, column: 50, scope: !3284)
!3291 = !DILocation(line: 3191, column: 10, scope: !3284)
!3292 = !DILocation(line: 3191, column: 3, scope: !3284)
!3293 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !70, file: !70, line: 3213, type: !298, scopeLine: 3214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3294 = !DILocalVariable(name: "value", arg: 1, scope: !3293, file: !70, line: 3213, type: !13)
!3295 = !DILocation(line: 3213, column: 30, scope: !3293)
!3296 = !DILocalVariable(name: "factor", arg: 2, scope: !3293, file: !70, line: 3213, type: !13)
!3297 = !DILocation(line: 3213, column: 41, scope: !3293)
!3298 = !DILocation(line: 3215, column: 44, scope: !3293)
!3299 = !DILocation(line: 3215, column: 50, scope: !3293)
!3300 = !DILocation(line: 3215, column: 10, scope: !3293)
!3301 = !DILocation(line: 3215, column: 3, scope: !3293)
!3302 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !70, file: !70, line: 3237, type: !298, scopeLine: 3238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3303 = !DILocalVariable(name: "value", arg: 1, scope: !3302, file: !70, line: 3237, type: !13)
!3304 = !DILocation(line: 3237, column: 33, scope: !3302)
!3305 = !DILocalVariable(name: "factor", arg: 2, scope: !3302, file: !70, line: 3237, type: !13)
!3306 = !DILocation(line: 3237, column: 44, scope: !3302)
!3307 = !DILocation(line: 3239, column: 44, scope: !3302)
!3308 = !DILocation(line: 3239, column: 50, scope: !3302)
!3309 = !DILocation(line: 3239, column: 10, scope: !3302)
!3310 = !DILocation(line: 3239, column: 3, scope: !3302)
!3311 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !70, file: !70, line: 3261, type: !298, scopeLine: 3262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3312 = !DILocalVariable(name: "value", arg: 1, scope: !3311, file: !70, line: 3261, type: !13)
!3313 = !DILocation(line: 3261, column: 32, scope: !3311)
!3314 = !DILocalVariable(name: "factor", arg: 2, scope: !3311, file: !70, line: 3261, type: !13)
!3315 = !DILocation(line: 3261, column: 43, scope: !3311)
!3316 = !DILocation(line: 3263, column: 44, scope: !3311)
!3317 = !DILocation(line: 3263, column: 50, scope: !3311)
!3318 = !DILocation(line: 3263, column: 10, scope: !3311)
!3319 = !DILocation(line: 3263, column: 3, scope: !3311)
!3320 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !70, file: !70, line: 3285, type: !298, scopeLine: 3286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3321 = !DILocalVariable(name: "value", arg: 1, scope: !3320, file: !70, line: 3285, type: !13)
!3322 = !DILocation(line: 3285, column: 31, scope: !3320)
!3323 = !DILocalVariable(name: "factor", arg: 2, scope: !3320, file: !70, line: 3285, type: !13)
!3324 = !DILocation(line: 3285, column: 42, scope: !3320)
!3325 = !DILocation(line: 3287, column: 44, scope: !3320)
!3326 = !DILocation(line: 3287, column: 50, scope: !3320)
!3327 = !DILocation(line: 3287, column: 10, scope: !3320)
!3328 = !DILocation(line: 3287, column: 3, scope: !3320)
!3329 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !70, file: !70, line: 3309, type: !298, scopeLine: 3310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3330 = !DILocalVariable(name: "value", arg: 1, scope: !3329, file: !70, line: 3309, type: !13)
!3331 = !DILocation(line: 3309, column: 30, scope: !3329)
!3332 = !DILocalVariable(name: "factor", arg: 2, scope: !3329, file: !70, line: 3309, type: !13)
!3333 = !DILocation(line: 3309, column: 41, scope: !3329)
!3334 = !DILocation(line: 3311, column: 44, scope: !3329)
!3335 = !DILocation(line: 3311, column: 50, scope: !3329)
!3336 = !DILocation(line: 3311, column: 10, scope: !3329)
!3337 = !DILocation(line: 3311, column: 3, scope: !3329)
!3338 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !70, file: !70, line: 3332, type: !387, scopeLine: 3333, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3339 = !DILocalVariable(name: "value", arg: 1, scope: !3338, file: !70, line: 3332, type: !13)
!3340 = !DILocation(line: 3332, column: 33, scope: !3338)
!3341 = !DILocalVariable(name: "factor", arg: 2, scope: !3338, file: !70, line: 3332, type: !29)
!3342 = !DILocation(line: 3332, column: 44, scope: !3338)
!3343 = !DILocation(line: 3334, column: 41, scope: !3338)
!3344 = !DILocation(line: 3334, column: 47, scope: !3338)
!3345 = !DILocation(line: 3334, column: 10, scope: !3338)
!3346 = !DILocation(line: 3334, column: 3, scope: !3338)
!3347 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !70, file: !70, line: 3355, type: !387, scopeLine: 3356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3348 = !DILocalVariable(name: "value", arg: 1, scope: !3347, file: !70, line: 3355, type: !13)
!3349 = !DILocation(line: 3355, column: 32, scope: !3347)
!3350 = !DILocalVariable(name: "factor", arg: 2, scope: !3347, file: !70, line: 3355, type: !29)
!3351 = !DILocation(line: 3355, column: 43, scope: !3347)
!3352 = !DILocation(line: 3357, column: 33, scope: !3347)
!3353 = !DILocation(line: 3357, column: 39, scope: !3347)
!3354 = !DILocation(line: 3357, column: 2, scope: !3347)
!3355 = !DILocation(line: 3358, column: 1, scope: !3347)
!3356 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !70, file: !70, line: 3379, type: !387, scopeLine: 3380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3357 = !DILocalVariable(name: "value", arg: 1, scope: !3356, file: !70, line: 3379, type: !13)
!3358 = !DILocation(line: 3379, column: 31, scope: !3356)
!3359 = !DILocalVariable(name: "factor", arg: 2, scope: !3356, file: !70, line: 3379, type: !29)
!3360 = !DILocation(line: 3379, column: 42, scope: !3356)
!3361 = !DILocation(line: 3381, column: 41, scope: !3356)
!3362 = !DILocation(line: 3381, column: 47, scope: !3356)
!3363 = !DILocation(line: 3381, column: 10, scope: !3356)
!3364 = !DILocation(line: 3381, column: 3, scope: !3356)
!3365 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !70, file: !70, line: 3404, type: !387, scopeLine: 3405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3366 = !DILocalVariable(name: "value", arg: 1, scope: !3365, file: !70, line: 3404, type: !13)
!3367 = !DILocation(line: 3404, column: 33, scope: !3365)
!3368 = !DILocalVariable(name: "factor", arg: 2, scope: !3365, file: !70, line: 3404, type: !29)
!3369 = !DILocation(line: 3404, column: 44, scope: !3365)
!3370 = !DILocation(line: 3406, column: 44, scope: !3365)
!3371 = !DILocation(line: 3406, column: 50, scope: !3365)
!3372 = !DILocation(line: 3406, column: 10, scope: !3365)
!3373 = !DILocation(line: 3406, column: 3, scope: !3365)
!3374 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !70, file: !70, line: 3429, type: !387, scopeLine: 3430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3375 = !DILocalVariable(name: "value", arg: 1, scope: !3374, file: !70, line: 3429, type: !13)
!3376 = !DILocation(line: 3429, column: 32, scope: !3374)
!3377 = !DILocalVariable(name: "factor", arg: 2, scope: !3374, file: !70, line: 3429, type: !29)
!3378 = !DILocation(line: 3429, column: 43, scope: !3374)
!3379 = !DILocation(line: 3431, column: 44, scope: !3374)
!3380 = !DILocation(line: 3431, column: 50, scope: !3374)
!3381 = !DILocation(line: 3431, column: 10, scope: !3374)
!3382 = !DILocation(line: 3431, column: 3, scope: !3374)
!3383 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !70, file: !70, line: 3454, type: !387, scopeLine: 3455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3384 = !DILocalVariable(name: "value", arg: 1, scope: !3383, file: !70, line: 3454, type: !13)
!3385 = !DILocation(line: 3454, column: 31, scope: !3383)
!3386 = !DILocalVariable(name: "factor", arg: 2, scope: !3383, file: !70, line: 3454, type: !29)
!3387 = !DILocation(line: 3454, column: 42, scope: !3383)
!3388 = !DILocation(line: 3456, column: 44, scope: !3383)
!3389 = !DILocation(line: 3456, column: 50, scope: !3383)
!3390 = !DILocation(line: 3456, column: 10, scope: !3383)
!3391 = !DILocation(line: 3456, column: 3, scope: !3383)
!3392 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !70, file: !70, line: 3479, type: !387, scopeLine: 3480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3393 = !DILocalVariable(name: "value", arg: 1, scope: !3392, file: !70, line: 3479, type: !13)
!3394 = !DILocation(line: 3479, column: 33, scope: !3392)
!3395 = !DILocalVariable(name: "factor", arg: 2, scope: !3392, file: !70, line: 3479, type: !29)
!3396 = !DILocation(line: 3479, column: 44, scope: !3392)
!3397 = !DILocation(line: 3481, column: 44, scope: !3392)
!3398 = !DILocation(line: 3481, column: 50, scope: !3392)
!3399 = !DILocation(line: 3481, column: 10, scope: !3392)
!3400 = !DILocation(line: 3481, column: 3, scope: !3392)
!3401 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !70, file: !70, line: 3504, type: !387, scopeLine: 3505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3402 = !DILocalVariable(name: "value", arg: 1, scope: !3401, file: !70, line: 3504, type: !13)
!3403 = !DILocation(line: 3504, column: 32, scope: !3401)
!3404 = !DILocalVariable(name: "factor", arg: 2, scope: !3401, file: !70, line: 3504, type: !29)
!3405 = !DILocation(line: 3504, column: 43, scope: !3401)
!3406 = !DILocation(line: 3506, column: 44, scope: !3401)
!3407 = !DILocation(line: 3506, column: 50, scope: !3401)
!3408 = !DILocation(line: 3506, column: 10, scope: !3401)
!3409 = !DILocation(line: 3506, column: 3, scope: !3401)
!3410 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !70, file: !70, line: 3528, type: !387, scopeLine: 3529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3411 = !DILocalVariable(name: "value", arg: 1, scope: !3410, file: !70, line: 3528, type: !13)
!3412 = !DILocation(line: 3528, column: 31, scope: !3410)
!3413 = !DILocalVariable(name: "factor", arg: 2, scope: !3410, file: !70, line: 3528, type: !29)
!3414 = !DILocation(line: 3528, column: 42, scope: !3410)
!3415 = !DILocation(line: 3530, column: 44, scope: !3410)
!3416 = !DILocation(line: 3530, column: 50, scope: !3410)
!3417 = !DILocation(line: 3530, column: 10, scope: !3410)
!3418 = !DILocation(line: 3530, column: 3, scope: !3410)
!3419 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !70, file: !70, line: 3552, type: !387, scopeLine: 3553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3420 = !DILocalVariable(name: "value", arg: 1, scope: !3419, file: !70, line: 3552, type: !13)
!3421 = !DILocation(line: 3552, column: 30, scope: !3419)
!3422 = !DILocalVariable(name: "factor", arg: 2, scope: !3419, file: !70, line: 3552, type: !29)
!3423 = !DILocation(line: 3552, column: 41, scope: !3419)
!3424 = !DILocation(line: 3554, column: 44, scope: !3419)
!3425 = !DILocation(line: 3554, column: 50, scope: !3419)
!3426 = !DILocation(line: 3554, column: 10, scope: !3419)
!3427 = !DILocation(line: 3554, column: 3, scope: !3419)
!3428 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !70, file: !70, line: 3576, type: !387, scopeLine: 3577, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3429 = !DILocalVariable(name: "value", arg: 1, scope: !3428, file: !70, line: 3576, type: !13)
!3430 = !DILocation(line: 3576, column: 33, scope: !3428)
!3431 = !DILocalVariable(name: "factor", arg: 2, scope: !3428, file: !70, line: 3576, type: !29)
!3432 = !DILocation(line: 3576, column: 44, scope: !3428)
!3433 = !DILocation(line: 3578, column: 44, scope: !3428)
!3434 = !DILocation(line: 3578, column: 50, scope: !3428)
!3435 = !DILocation(line: 3578, column: 10, scope: !3428)
!3436 = !DILocation(line: 3578, column: 3, scope: !3428)
!3437 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !70, file: !70, line: 3600, type: !387, scopeLine: 3601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3438 = !DILocalVariable(name: "value", arg: 1, scope: !3437, file: !70, line: 3600, type: !13)
!3439 = !DILocation(line: 3600, column: 32, scope: !3437)
!3440 = !DILocalVariable(name: "factor", arg: 2, scope: !3437, file: !70, line: 3600, type: !29)
!3441 = !DILocation(line: 3600, column: 43, scope: !3437)
!3442 = !DILocation(line: 3602, column: 44, scope: !3437)
!3443 = !DILocation(line: 3602, column: 50, scope: !3437)
!3444 = !DILocation(line: 3602, column: 10, scope: !3437)
!3445 = !DILocation(line: 3602, column: 3, scope: !3437)
!3446 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !70, file: !70, line: 3624, type: !387, scopeLine: 3625, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3447 = !DILocalVariable(name: "value", arg: 1, scope: !3446, file: !70, line: 3624, type: !13)
!3448 = !DILocation(line: 3624, column: 31, scope: !3446)
!3449 = !DILocalVariable(name: "factor", arg: 2, scope: !3446, file: !70, line: 3624, type: !29)
!3450 = !DILocation(line: 3624, column: 42, scope: !3446)
!3451 = !DILocation(line: 3626, column: 44, scope: !3446)
!3452 = !DILocation(line: 3626, column: 50, scope: !3446)
!3453 = !DILocation(line: 3626, column: 10, scope: !3446)
!3454 = !DILocation(line: 3626, column: 3, scope: !3446)
!3455 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !70, file: !70, line: 3648, type: !387, scopeLine: 3649, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3456 = !DILocalVariable(name: "value", arg: 1, scope: !3455, file: !70, line: 3648, type: !13)
!3457 = !DILocation(line: 3648, column: 30, scope: !3455)
!3458 = !DILocalVariable(name: "factor", arg: 2, scope: !3455, file: !70, line: 3648, type: !29)
!3459 = !DILocation(line: 3648, column: 41, scope: !3455)
!3460 = !DILocation(line: 3650, column: 44, scope: !3455)
!3461 = !DILocation(line: 3650, column: 50, scope: !3455)
!3462 = !DILocation(line: 3650, column: 10, scope: !3455)
!3463 = !DILocation(line: 3650, column: 3, scope: !3455)
!3464 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !70, file: !70, line: 3670, type: !472, scopeLine: 3671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3465 = !DILocalVariable(name: "value", arg: 1, scope: !3464, file: !70, line: 3670, type: !13)
!3466 = !DILocation(line: 3670, column: 32, scope: !3464)
!3467 = !DILocalVariable(name: "factor", arg: 2, scope: !3464, file: !70, line: 3670, type: !24)
!3468 = !DILocation(line: 3670, column: 42, scope: !3464)
!3469 = !DILocation(line: 3672, column: 40, scope: !3464)
!3470 = !DILocation(line: 3672, column: 58, scope: !3464)
!3471 = !DILocation(line: 3672, column: 52, scope: !3464)
!3472 = !DILocation(line: 3672, column: 66, scope: !3464)
!3473 = !DILocation(line: 3672, column: 46, scope: !3464)
!3474 = !DILocation(line: 3672, column: 10, scope: !3464)
!3475 = !DILocation(line: 3672, column: 3, scope: !3464)
!3476 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !70, file: !70, line: 3692, type: !472, scopeLine: 3693, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3477 = !DILocalVariable(name: "value", arg: 1, scope: !3476, file: !70, line: 3692, type: !13)
!3478 = !DILocation(line: 3692, column: 31, scope: !3476)
!3479 = !DILocalVariable(name: "factor", arg: 2, scope: !3476, file: !70, line: 3692, type: !24)
!3480 = !DILocation(line: 3692, column: 41, scope: !3476)
!3481 = !DILocation(line: 3694, column: 40, scope: !3476)
!3482 = !DILocation(line: 3694, column: 58, scope: !3476)
!3483 = !DILocation(line: 3694, column: 52, scope: !3476)
!3484 = !DILocation(line: 3694, column: 66, scope: !3476)
!3485 = !DILocation(line: 3694, column: 46, scope: !3476)
!3486 = !DILocation(line: 3694, column: 10, scope: !3476)
!3487 = !DILocation(line: 3694, column: 3, scope: !3476)
!3488 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !70, file: !70, line: 3715, type: !472, scopeLine: 3716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3489 = !DILocalVariable(name: "value", arg: 1, scope: !3488, file: !70, line: 3715, type: !13)
!3490 = !DILocation(line: 3715, column: 30, scope: !3488)
!3491 = !DILocalVariable(name: "factor", arg: 2, scope: !3488, file: !70, line: 3715, type: !24)
!3492 = !DILocation(line: 3715, column: 40, scope: !3488)
!3493 = !DILocation(line: 3717, column: 40, scope: !3488)
!3494 = !DILocation(line: 3717, column: 58, scope: !3488)
!3495 = !DILocation(line: 3717, column: 52, scope: !3488)
!3496 = !DILocation(line: 3717, column: 66, scope: !3488)
!3497 = !DILocation(line: 3717, column: 46, scope: !3488)
!3498 = !DILocation(line: 3717, column: 10, scope: !3488)
!3499 = !DILocation(line: 3717, column: 3, scope: !3488)
!3500 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !70, file: !70, line: 3738, type: !472, scopeLine: 3739, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3501 = !DILocalVariable(name: "value", arg: 1, scope: !3500, file: !70, line: 3738, type: !13)
!3502 = !DILocation(line: 3738, column: 31, scope: !3500)
!3503 = !DILocalVariable(name: "factor", arg: 2, scope: !3500, file: !70, line: 3738, type: !24)
!3504 = !DILocation(line: 3738, column: 41, scope: !3500)
!3505 = !DILocation(line: 3740, column: 43, scope: !3500)
!3506 = !DILocation(line: 3740, column: 61, scope: !3500)
!3507 = !DILocation(line: 3740, column: 55, scope: !3500)
!3508 = !DILocation(line: 3740, column: 69, scope: !3500)
!3509 = !DILocation(line: 3740, column: 49, scope: !3500)
!3510 = !DILocation(line: 3740, column: 10, scope: !3500)
!3511 = !DILocation(line: 3740, column: 3, scope: !3500)
!3512 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !70, file: !70, line: 3761, type: !472, scopeLine: 3762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3513 = !DILocalVariable(name: "value", arg: 1, scope: !3512, file: !70, line: 3761, type: !13)
!3514 = !DILocation(line: 3761, column: 30, scope: !3512)
!3515 = !DILocalVariable(name: "factor", arg: 2, scope: !3512, file: !70, line: 3761, type: !24)
!3516 = !DILocation(line: 3761, column: 40, scope: !3512)
!3517 = !DILocation(line: 3763, column: 43, scope: !3512)
!3518 = !DILocation(line: 3763, column: 61, scope: !3512)
!3519 = !DILocation(line: 3763, column: 55, scope: !3512)
!3520 = !DILocation(line: 3763, column: 69, scope: !3512)
!3521 = !DILocation(line: 3763, column: 49, scope: !3512)
!3522 = !DILocation(line: 3763, column: 10, scope: !3512)
!3523 = !DILocation(line: 3763, column: 3, scope: !3512)
!3524 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !70, file: !70, line: 3783, type: !472, scopeLine: 3784, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3525 = !DILocalVariable(name: "value", arg: 1, scope: !3524, file: !70, line: 3783, type: !13)
!3526 = !DILocation(line: 3783, column: 30, scope: !3524)
!3527 = !DILocalVariable(name: "factor", arg: 2, scope: !3524, file: !70, line: 3783, type: !24)
!3528 = !DILocation(line: 3783, column: 40, scope: !3524)
!3529 = !DILocation(line: 3785, column: 43, scope: !3524)
!3530 = !DILocation(line: 3785, column: 61, scope: !3524)
!3531 = !DILocation(line: 3785, column: 55, scope: !3524)
!3532 = !DILocation(line: 3785, column: 69, scope: !3524)
!3533 = !DILocation(line: 3785, column: 49, scope: !3524)
!3534 = !DILocation(line: 3785, column: 10, scope: !3524)
!3535 = !DILocation(line: 3785, column: 3, scope: !3524)
!3536 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !70, file: !70, line: 3805, type: !472, scopeLine: 3806, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3537 = !DILocalVariable(name: "value", arg: 1, scope: !3536, file: !70, line: 3805, type: !13)
!3538 = !DILocation(line: 3805, column: 29, scope: !3536)
!3539 = !DILocalVariable(name: "factor", arg: 2, scope: !3536, file: !70, line: 3805, type: !24)
!3540 = !DILocation(line: 3805, column: 39, scope: !3536)
!3541 = !DILocation(line: 3807, column: 43, scope: !3536)
!3542 = !DILocation(line: 3807, column: 61, scope: !3536)
!3543 = !DILocation(line: 3807, column: 55, scope: !3536)
!3544 = !DILocation(line: 3807, column: 69, scope: !3536)
!3545 = !DILocation(line: 3807, column: 49, scope: !3536)
!3546 = !DILocation(line: 3807, column: 10, scope: !3536)
!3547 = !DILocation(line: 3807, column: 3, scope: !3536)
!3548 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !70, file: !70, line: 3827, type: !472, scopeLine: 3828, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3549 = !DILocalVariable(name: "value", arg: 1, scope: !3548, file: !70, line: 3827, type: !13)
!3550 = !DILocation(line: 3827, column: 30, scope: !3548)
!3551 = !DILocalVariable(name: "factor", arg: 2, scope: !3548, file: !70, line: 3827, type: !24)
!3552 = !DILocation(line: 3827, column: 40, scope: !3548)
!3553 = !DILocation(line: 3829, column: 43, scope: !3548)
!3554 = !DILocation(line: 3829, column: 61, scope: !3548)
!3555 = !DILocation(line: 3829, column: 55, scope: !3548)
!3556 = !DILocation(line: 3829, column: 69, scope: !3548)
!3557 = !DILocation(line: 3829, column: 49, scope: !3548)
!3558 = !DILocation(line: 3829, column: 10, scope: !3548)
!3559 = !DILocation(line: 3829, column: 3, scope: !3548)
!3560 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !70, file: !70, line: 3849, type: !472, scopeLine: 3850, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3561 = !DILocalVariable(name: "value", arg: 1, scope: !3560, file: !70, line: 3849, type: !13)
!3562 = !DILocation(line: 3849, column: 29, scope: !3560)
!3563 = !DILocalVariable(name: "factor", arg: 2, scope: !3560, file: !70, line: 3849, type: !24)
!3564 = !DILocation(line: 3849, column: 39, scope: !3560)
!3565 = !DILocation(line: 3851, column: 43, scope: !3560)
!3566 = !DILocation(line: 3851, column: 61, scope: !3560)
!3567 = !DILocation(line: 3851, column: 55, scope: !3560)
!3568 = !DILocation(line: 3851, column: 69, scope: !3560)
!3569 = !DILocation(line: 3851, column: 49, scope: !3560)
!3570 = !DILocation(line: 3851, column: 10, scope: !3560)
!3571 = !DILocation(line: 3851, column: 3, scope: !3560)
!3572 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !70, file: !70, line: 3873, type: !1912, scopeLine: 3874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3573 = !DILocalVariable(name: "value", arg: 1, scope: !3572, file: !70, line: 3873, type: !20)
!3574 = !DILocation(line: 3873, column: 31, scope: !3572)
!3575 = !DILocalVariable(name: "factor", arg: 2, scope: !3572, file: !70, line: 3873, type: !13)
!3576 = !DILocation(line: 3873, column: 42, scope: !3572)
!3577 = !DILocation(line: 3875, column: 41, scope: !3572)
!3578 = !DILocation(line: 3875, column: 47, scope: !3572)
!3579 = !DILocation(line: 3875, column: 10, scope: !3572)
!3580 = !DILocation(line: 3875, column: 3, scope: !3572)
!3581 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !70, file: !70, line: 5069, type: !3582, scopeLine: 5070, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3582 = !DISubroutineType(types: !3583)
!3583 = !{!20, !20, !13, !733}
!3584 = !DILocalVariable(name: "value", arg: 1, scope: !3581, file: !70, line: 5069, type: !20)
!3585 = !DILocation(line: 5069, column: 40, scope: !3581)
!3586 = !DILocalVariable(name: "factor", arg: 2, scope: !3581, file: !70, line: 5069, type: !13)
!3587 = !DILocation(line: 5069, column: 51, scope: !3581)
!3588 = !DILocalVariable(name: "count", arg: 3, scope: !3581, file: !70, line: 5069, type: !733)
!3589 = !DILocation(line: 5069, column: 63, scope: !3581)
!3590 = !DILocalVariable(name: "u32Temp1", scope: !3581, file: !70, line: 5071, type: !733)
!3591 = !DILocation(line: 5071, column: 6, scope: !3581)
!3592 = !DILocalVariable(name: "u32Temp2", scope: !3581, file: !70, line: 5071, type: !733)
!3593 = !DILocation(line: 5071, column: 17, scope: !3581)
!3594 = !DILocalVariable(name: "u32Temp3", scope: !3581, file: !70, line: 5071, type: !733)
!3595 = !DILocation(line: 5071, column: 26, scope: !3581)
!3596 = !DILocalVariable(name: "u32Temp4", scope: !3581, file: !70, line: 5071, type: !733)
!3597 = !DILocation(line: 5071, column: 35, scope: !3581)
!3598 = !DILocalVariable(name: "u8SignBit", scope: !3581, file: !70, line: 5072, type: !24)
!3599 = !DILocation(line: 5072, column: 5, scope: !3581)
!3600 = !DILocation(line: 5074, column: 7, scope: !3601)
!3601 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5074, column: 5)
!3602 = !DILocation(line: 5074, column: 12, scope: !3601)
!3603 = !DILocation(line: 5074, column: 16, scope: !3601)
!3604 = !DILocation(line: 5074, column: 20, scope: !3601)
!3605 = !DILocation(line: 5074, column: 26, scope: !3601)
!3606 = !DILocation(line: 5074, column: 31, scope: !3601)
!3607 = !DILocation(line: 5074, column: 36, scope: !3601)
!3608 = !DILocation(line: 5074, column: 41, scope: !3601)
!3609 = !DILocation(line: 5074, column: 45, scope: !3601)
!3610 = !DILocation(line: 5074, column: 49, scope: !3601)
!3611 = !DILocation(line: 5074, column: 55, scope: !3601)
!3612 = !DILocation(line: 5074, column: 5, scope: !3581)
!3613 = !DILocation(line: 5076, column: 13, scope: !3614)
!3614 = distinct !DILexicalBlock(scope: !3601, file: !70, line: 5075, column: 2)
!3615 = !DILocation(line: 5077, column: 2, scope: !3614)
!3616 = !DILocation(line: 5080, column: 13, scope: !3617)
!3617 = distinct !DILexicalBlock(scope: !3601, file: !70, line: 5079, column: 2)
!3618 = !DILocation(line: 5083, column: 5, scope: !3619)
!3619 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5083, column: 5)
!3620 = !DILocation(line: 5083, column: 10, scope: !3619)
!3621 = !DILocation(line: 5083, column: 5, scope: !3581)
!3622 = !DILocation(line: 5085, column: 15, scope: !3623)
!3623 = distinct !DILexicalBlock(scope: !3619, file: !70, line: 5084, column: 2)
!3624 = !DILocation(line: 5085, column: 14, scope: !3623)
!3625 = !DILocation(line: 5085, column: 12, scope: !3623)
!3626 = !DILocation(line: 5086, column: 2, scope: !3623)
!3627 = !DILocation(line: 5089, column: 14, scope: !3628)
!3628 = distinct !DILexicalBlock(scope: !3619, file: !70, line: 5088, column: 2)
!3629 = !DILocation(line: 5089, column: 12, scope: !3628)
!3630 = !DILocation(line: 5092, column: 5, scope: !3631)
!3631 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5092, column: 5)
!3632 = !DILocation(line: 5092, column: 11, scope: !3631)
!3633 = !DILocation(line: 5092, column: 5, scope: !3581)
!3634 = !DILocation(line: 5094, column: 15, scope: !3635)
!3635 = distinct !DILexicalBlock(scope: !3631, file: !70, line: 5093, column: 2)
!3636 = !DILocation(line: 5094, column: 14, scope: !3635)
!3637 = !DILocation(line: 5094, column: 12, scope: !3635)
!3638 = !DILocation(line: 5095, column: 2, scope: !3635)
!3639 = !DILocation(line: 5098, column: 14, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3631, file: !70, line: 5097, column: 2)
!3641 = !DILocation(line: 5098, column: 12, scope: !3640)
!3642 = !DILocation(line: 5101, column: 13, scope: !3581)
!3643 = !DILocation(line: 5101, column: 24, scope: !3581)
!3644 = !DILocation(line: 5101, column: 22, scope: !3581)
!3645 = !DILocation(line: 5101, column: 11, scope: !3581)
!3646 = !DILocation(line: 5102, column: 25, scope: !3581)
!3647 = !DILocation(line: 5102, column: 35, scope: !3581)
!3648 = !DILocation(line: 5102, column: 13, scope: !3581)
!3649 = !DILocation(line: 5102, column: 11, scope: !3581)
!3650 = !DILocation(line: 5103, column: 13, scope: !3581)
!3651 = !DILocation(line: 5103, column: 25, scope: !3581)
!3652 = !DILocation(line: 5103, column: 22, scope: !3581)
!3653 = !DILocation(line: 5103, column: 11, scope: !3581)
!3654 = !DILocation(line: 5104, column: 14, scope: !3581)
!3655 = !DILocation(line: 5104, column: 30, scope: !3581)
!3656 = !DILocation(line: 5104, column: 29, scope: !3581)
!3657 = !DILocation(line: 5104, column: 23, scope: !3581)
!3658 = !DILocation(line: 5104, column: 11, scope: !3581)
!3659 = !DILocation(line: 5105, column: 6, scope: !3660)
!3660 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5105, column: 5)
!3661 = !DILocation(line: 5105, column: 16, scope: !3660)
!3662 = !DILocation(line: 5105, column: 14, scope: !3660)
!3663 = !DILocation(line: 5105, column: 22, scope: !3660)
!3664 = !DILocation(line: 5105, column: 5, scope: !3581)
!3665 = !DILocation(line: 5107, column: 6, scope: !3666)
!3666 = distinct !DILexicalBlock(scope: !3667, file: !70, line: 5107, column: 6)
!3667 = distinct !DILexicalBlock(scope: !3660, file: !70, line: 5106, column: 2)
!3668 = !DILocation(line: 5107, column: 16, scope: !3666)
!3669 = !DILocation(line: 5107, column: 6, scope: !3667)
!3670 = !DILocation(line: 5109, column: 7, scope: !3671)
!3671 = distinct !DILexicalBlock(scope: !3672, file: !70, line: 5109, column: 7)
!3672 = distinct !DILexicalBlock(scope: !3666, file: !70, line: 5108, column: 3)
!3673 = !DILocation(line: 5109, column: 15, scope: !3671)
!3674 = !DILocation(line: 5109, column: 7, scope: !3672)
!3675 = !DILocation(line: 5110, column: 12, scope: !3671)
!3676 = !DILocation(line: 5110, column: 5, scope: !3671)
!3677 = !DILocation(line: 5112, column: 5, scope: !3671)
!3678 = !DILocation(line: 5116, column: 7, scope: !3679)
!3679 = distinct !DILexicalBlock(scope: !3680, file: !70, line: 5116, column: 7)
!3680 = distinct !DILexicalBlock(scope: !3666, file: !70, line: 5115, column: 3)
!3681 = !DILocation(line: 5116, column: 15, scope: !3679)
!3682 = !DILocation(line: 5116, column: 7, scope: !3680)
!3683 = !DILocation(line: 5117, column: 13, scope: !3679)
!3684 = !DILocation(line: 5117, column: 12, scope: !3679)
!3685 = !DILocation(line: 5117, column: 5, scope: !3679)
!3686 = !DILocation(line: 5119, column: 5, scope: !3679)
!3687 = !DILocation(line: 5124, column: 3, scope: !3688)
!3688 = distinct !DILexicalBlock(scope: !3660, file: !70, line: 5123, column: 2)
!3689 = !DILocation(line: 5126, column: 1, scope: !3581)
!3690 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !70, file: !70, line: 3897, type: !2681, scopeLine: 3898, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3691 = !DILocalVariable(name: "value", arg: 1, scope: !3690, file: !70, line: 3897, type: !20)
!3692 = !DILocation(line: 3897, column: 30, scope: !3690)
!3693 = !DILocalVariable(name: "factor", arg: 2, scope: !3690, file: !70, line: 3897, type: !6)
!3694 = !DILocation(line: 3897, column: 40, scope: !3690)
!3695 = !DILocation(line: 3899, column: 40, scope: !3690)
!3696 = !DILocation(line: 3899, column: 46, scope: !3690)
!3697 = !DILocation(line: 3899, column: 10, scope: !3690)
!3698 = !DILocation(line: 3899, column: 3, scope: !3690)
!3699 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !70, file: !70, line: 5221, type: !3700, scopeLine: 5222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3700 = !DISubroutineType(types: !3701)
!3701 = !{!20, !20, !6, !733}
!3702 = !DILocalVariable(name: "value", arg: 1, scope: !3699, file: !70, line: 5221, type: !20)
!3703 = !DILocation(line: 5221, column: 39, scope: !3699)
!3704 = !DILocalVariable(name: "factor", arg: 2, scope: !3699, file: !70, line: 5221, type: !6)
!3705 = !DILocation(line: 5221, column: 49, scope: !3699)
!3706 = !DILocalVariable(name: "count", arg: 3, scope: !3699, file: !70, line: 5221, type: !733)
!3707 = !DILocation(line: 5221, column: 61, scope: !3699)
!3708 = !DILocalVariable(name: "u32Temp1", scope: !3699, file: !70, line: 5223, type: !733)
!3709 = !DILocation(line: 5223, column: 6, scope: !3699)
!3710 = !DILocalVariable(name: "u32Temp2", scope: !3699, file: !70, line: 5223, type: !733)
!3711 = !DILocation(line: 5223, column: 17, scope: !3699)
!3712 = !DILocalVariable(name: "u32Temp3", scope: !3699, file: !70, line: 5223, type: !733)
!3713 = !DILocation(line: 5223, column: 26, scope: !3699)
!3714 = !DILocalVariable(name: "u32Temp4", scope: !3699, file: !70, line: 5223, type: !733)
!3715 = !DILocation(line: 5223, column: 35, scope: !3699)
!3716 = !DILocalVariable(name: "u8SignBit", scope: !3699, file: !70, line: 5224, type: !24)
!3717 = !DILocation(line: 5224, column: 5, scope: !3699)
!3718 = !DILocation(line: 5226, column: 7, scope: !3719)
!3719 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5226, column: 5)
!3720 = !DILocation(line: 5226, column: 12, scope: !3719)
!3721 = !DILocation(line: 5226, column: 16, scope: !3719)
!3722 = !DILocation(line: 5226, column: 20, scope: !3719)
!3723 = !DILocation(line: 5226, column: 26, scope: !3719)
!3724 = !DILocation(line: 5226, column: 31, scope: !3719)
!3725 = !DILocation(line: 5226, column: 36, scope: !3719)
!3726 = !DILocation(line: 5226, column: 41, scope: !3719)
!3727 = !DILocation(line: 5226, column: 45, scope: !3719)
!3728 = !DILocation(line: 5226, column: 49, scope: !3719)
!3729 = !DILocation(line: 5226, column: 55, scope: !3719)
!3730 = !DILocation(line: 5226, column: 5, scope: !3699)
!3731 = !DILocation(line: 5228, column: 13, scope: !3732)
!3732 = distinct !DILexicalBlock(scope: !3719, file: !70, line: 5227, column: 2)
!3733 = !DILocation(line: 5229, column: 2, scope: !3732)
!3734 = !DILocation(line: 5232, column: 13, scope: !3735)
!3735 = distinct !DILexicalBlock(scope: !3719, file: !70, line: 5231, column: 2)
!3736 = !DILocation(line: 5235, column: 5, scope: !3737)
!3737 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5235, column: 5)
!3738 = !DILocation(line: 5235, column: 10, scope: !3737)
!3739 = !DILocation(line: 5235, column: 5, scope: !3699)
!3740 = !DILocation(line: 5237, column: 15, scope: !3741)
!3741 = distinct !DILexicalBlock(scope: !3737, file: !70, line: 5236, column: 2)
!3742 = !DILocation(line: 5237, column: 14, scope: !3741)
!3743 = !DILocation(line: 5237, column: 12, scope: !3741)
!3744 = !DILocation(line: 5238, column: 2, scope: !3741)
!3745 = !DILocation(line: 5241, column: 14, scope: !3746)
!3746 = distinct !DILexicalBlock(scope: !3737, file: !70, line: 5240, column: 2)
!3747 = !DILocation(line: 5241, column: 12, scope: !3746)
!3748 = !DILocation(line: 5244, column: 5, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5244, column: 5)
!3750 = !DILocation(line: 5244, column: 11, scope: !3749)
!3751 = !DILocation(line: 5244, column: 5, scope: !3699)
!3752 = !DILocation(line: 5246, column: 15, scope: !3753)
!3753 = distinct !DILexicalBlock(scope: !3749, file: !70, line: 5245, column: 2)
!3754 = !DILocation(line: 5246, column: 14, scope: !3753)
!3755 = !DILocation(line: 5246, column: 12, scope: !3753)
!3756 = !DILocation(line: 5247, column: 2, scope: !3753)
!3757 = !DILocation(line: 5250, column: 14, scope: !3758)
!3758 = distinct !DILexicalBlock(scope: !3749, file: !70, line: 5249, column: 2)
!3759 = !DILocation(line: 5250, column: 12, scope: !3758)
!3760 = !DILocation(line: 5253, column: 13, scope: !3699)
!3761 = !DILocation(line: 5253, column: 24, scope: !3699)
!3762 = !DILocation(line: 5253, column: 22, scope: !3699)
!3763 = !DILocation(line: 5253, column: 11, scope: !3699)
!3764 = !DILocation(line: 5254, column: 25, scope: !3699)
!3765 = !DILocation(line: 5254, column: 35, scope: !3699)
!3766 = !DILocation(line: 5254, column: 13, scope: !3699)
!3767 = !DILocation(line: 5254, column: 11, scope: !3699)
!3768 = !DILocation(line: 5255, column: 13, scope: !3699)
!3769 = !DILocation(line: 5255, column: 25, scope: !3699)
!3770 = !DILocation(line: 5255, column: 22, scope: !3699)
!3771 = !DILocation(line: 5255, column: 11, scope: !3699)
!3772 = !DILocation(line: 5256, column: 14, scope: !3699)
!3773 = !DILocation(line: 5256, column: 30, scope: !3699)
!3774 = !DILocation(line: 5256, column: 29, scope: !3699)
!3775 = !DILocation(line: 5256, column: 23, scope: !3699)
!3776 = !DILocation(line: 5256, column: 11, scope: !3699)
!3777 = !DILocation(line: 5257, column: 6, scope: !3778)
!3778 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5257, column: 5)
!3779 = !DILocation(line: 5257, column: 16, scope: !3778)
!3780 = !DILocation(line: 5257, column: 14, scope: !3778)
!3781 = !DILocation(line: 5257, column: 22, scope: !3778)
!3782 = !DILocation(line: 5257, column: 5, scope: !3699)
!3783 = !DILocation(line: 5259, column: 6, scope: !3784)
!3784 = distinct !DILexicalBlock(scope: !3785, file: !70, line: 5259, column: 6)
!3785 = distinct !DILexicalBlock(scope: !3778, file: !70, line: 5258, column: 2)
!3786 = !DILocation(line: 5259, column: 16, scope: !3784)
!3787 = !DILocation(line: 5259, column: 6, scope: !3785)
!3788 = !DILocation(line: 5261, column: 7, scope: !3789)
!3789 = distinct !DILexicalBlock(scope: !3790, file: !70, line: 5261, column: 7)
!3790 = distinct !DILexicalBlock(scope: !3784, file: !70, line: 5260, column: 3)
!3791 = !DILocation(line: 5261, column: 15, scope: !3789)
!3792 = !DILocation(line: 5261, column: 7, scope: !3790)
!3793 = !DILocation(line: 5262, column: 12, scope: !3789)
!3794 = !DILocation(line: 5262, column: 5, scope: !3789)
!3795 = !DILocation(line: 5264, column: 5, scope: !3789)
!3796 = !DILocation(line: 5268, column: 7, scope: !3797)
!3797 = distinct !DILexicalBlock(scope: !3798, file: !70, line: 5268, column: 7)
!3798 = distinct !DILexicalBlock(scope: !3784, file: !70, line: 5267, column: 3)
!3799 = !DILocation(line: 5268, column: 15, scope: !3797)
!3800 = !DILocation(line: 5268, column: 7, scope: !3798)
!3801 = !DILocation(line: 5269, column: 13, scope: !3797)
!3802 = !DILocation(line: 5269, column: 12, scope: !3797)
!3803 = !DILocation(line: 5269, column: 5, scope: !3797)
!3804 = !DILocation(line: 5271, column: 5, scope: !3797)
!3805 = !DILocation(line: 5276, column: 3, scope: !3806)
!3806 = distinct !DILexicalBlock(scope: !3778, file: !70, line: 5275, column: 2)
!3807 = !DILocation(line: 5278, column: 1, scope: !3699)
!3808 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !70, file: !70, line: 3921, type: !772, scopeLine: 3922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3809 = !DILocalVariable(name: "value", arg: 1, scope: !3808, file: !70, line: 3921, type: !20)
!3810 = !DILocation(line: 3921, column: 31, scope: !3808)
!3811 = !DILocalVariable(name: "factor", arg: 2, scope: !3808, file: !70, line: 3921, type: !29)
!3812 = !DILocation(line: 3921, column: 42, scope: !3808)
!3813 = !DILocation(line: 3923, column: 41, scope: !3808)
!3814 = !DILocation(line: 3923, column: 47, scope: !3808)
!3815 = !DILocation(line: 3923, column: 10, scope: !3808)
!3816 = !DILocation(line: 3923, column: 3, scope: !3808)
!3817 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !70, file: !70, line: 5145, type: !3818, scopeLine: 5146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3818 = !DISubroutineType(types: !3819)
!3819 = !{!20, !20, !29, !733}
!3820 = !DILocalVariable(name: "value", arg: 1, scope: !3817, file: !70, line: 5145, type: !20)
!3821 = !DILocation(line: 5145, column: 40, scope: !3817)
!3822 = !DILocalVariable(name: "factor", arg: 2, scope: !3817, file: !70, line: 5145, type: !29)
!3823 = !DILocation(line: 5145, column: 50, scope: !3817)
!3824 = !DILocalVariable(name: "count", arg: 3, scope: !3817, file: !70, line: 5145, type: !733)
!3825 = !DILocation(line: 5145, column: 62, scope: !3817)
!3826 = !DILocalVariable(name: "u32Temp1", scope: !3817, file: !70, line: 5147, type: !733)
!3827 = !DILocation(line: 5147, column: 6, scope: !3817)
!3828 = !DILocalVariable(name: "u32Temp2", scope: !3817, file: !70, line: 5147, type: !733)
!3829 = !DILocation(line: 5147, column: 17, scope: !3817)
!3830 = !DILocalVariable(name: "u32Temp3", scope: !3817, file: !70, line: 5147, type: !733)
!3831 = !DILocation(line: 5147, column: 26, scope: !3817)
!3832 = !DILocalVariable(name: "u32Temp4", scope: !3817, file: !70, line: 5147, type: !733)
!3833 = !DILocation(line: 5147, column: 35, scope: !3817)
!3834 = !DILocalVariable(name: "u8SignBit", scope: !3817, file: !70, line: 5148, type: !24)
!3835 = !DILocation(line: 5148, column: 5, scope: !3817)
!3836 = !DILocation(line: 5150, column: 7, scope: !3837)
!3837 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5150, column: 5)
!3838 = !DILocation(line: 5150, column: 12, scope: !3837)
!3839 = !DILocation(line: 5150, column: 16, scope: !3837)
!3840 = !DILocation(line: 5150, column: 20, scope: !3837)
!3841 = !DILocation(line: 5150, column: 26, scope: !3837)
!3842 = !DILocation(line: 5150, column: 31, scope: !3837)
!3843 = !DILocation(line: 5150, column: 36, scope: !3837)
!3844 = !DILocation(line: 5150, column: 41, scope: !3837)
!3845 = !DILocation(line: 5150, column: 45, scope: !3837)
!3846 = !DILocation(line: 5150, column: 49, scope: !3837)
!3847 = !DILocation(line: 5150, column: 55, scope: !3837)
!3848 = !DILocation(line: 5150, column: 5, scope: !3817)
!3849 = !DILocation(line: 5152, column: 13, scope: !3850)
!3850 = distinct !DILexicalBlock(scope: !3837, file: !70, line: 5151, column: 2)
!3851 = !DILocation(line: 5153, column: 2, scope: !3850)
!3852 = !DILocation(line: 5156, column: 13, scope: !3853)
!3853 = distinct !DILexicalBlock(scope: !3837, file: !70, line: 5155, column: 2)
!3854 = !DILocation(line: 5159, column: 5, scope: !3855)
!3855 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5159, column: 5)
!3856 = !DILocation(line: 5159, column: 10, scope: !3855)
!3857 = !DILocation(line: 5159, column: 5, scope: !3817)
!3858 = !DILocation(line: 5161, column: 15, scope: !3859)
!3859 = distinct !DILexicalBlock(scope: !3855, file: !70, line: 5160, column: 2)
!3860 = !DILocation(line: 5161, column: 14, scope: !3859)
!3861 = !DILocation(line: 5161, column: 12, scope: !3859)
!3862 = !DILocation(line: 5162, column: 2, scope: !3859)
!3863 = !DILocation(line: 5165, column: 14, scope: !3864)
!3864 = distinct !DILexicalBlock(scope: !3855, file: !70, line: 5164, column: 2)
!3865 = !DILocation(line: 5165, column: 12, scope: !3864)
!3866 = !DILocation(line: 5168, column: 5, scope: !3867)
!3867 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5168, column: 5)
!3868 = !DILocation(line: 5168, column: 11, scope: !3867)
!3869 = !DILocation(line: 5168, column: 5, scope: !3817)
!3870 = !DILocation(line: 5170, column: 15, scope: !3871)
!3871 = distinct !DILexicalBlock(scope: !3867, file: !70, line: 5169, column: 2)
!3872 = !DILocation(line: 5170, column: 14, scope: !3871)
!3873 = !DILocation(line: 5170, column: 12, scope: !3871)
!3874 = !DILocation(line: 5171, column: 2, scope: !3871)
!3875 = !DILocation(line: 5174, column: 14, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3867, file: !70, line: 5173, column: 2)
!3877 = !DILocation(line: 5174, column: 12, scope: !3876)
!3878 = !DILocation(line: 5177, column: 13, scope: !3817)
!3879 = !DILocation(line: 5177, column: 24, scope: !3817)
!3880 = !DILocation(line: 5177, column: 22, scope: !3817)
!3881 = !DILocation(line: 5177, column: 11, scope: !3817)
!3882 = !DILocation(line: 5178, column: 25, scope: !3817)
!3883 = !DILocation(line: 5178, column: 35, scope: !3817)
!3884 = !DILocation(line: 5178, column: 13, scope: !3817)
!3885 = !DILocation(line: 5178, column: 11, scope: !3817)
!3886 = !DILocation(line: 5179, column: 13, scope: !3817)
!3887 = !DILocation(line: 5179, column: 25, scope: !3817)
!3888 = !DILocation(line: 5179, column: 22, scope: !3817)
!3889 = !DILocation(line: 5179, column: 11, scope: !3817)
!3890 = !DILocation(line: 5180, column: 14, scope: !3817)
!3891 = !DILocation(line: 5180, column: 30, scope: !3817)
!3892 = !DILocation(line: 5180, column: 29, scope: !3817)
!3893 = !DILocation(line: 5180, column: 23, scope: !3817)
!3894 = !DILocation(line: 5180, column: 11, scope: !3817)
!3895 = !DILocation(line: 5181, column: 6, scope: !3896)
!3896 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5181, column: 5)
!3897 = !DILocation(line: 5181, column: 16, scope: !3896)
!3898 = !DILocation(line: 5181, column: 14, scope: !3896)
!3899 = !DILocation(line: 5181, column: 22, scope: !3896)
!3900 = !DILocation(line: 5181, column: 5, scope: !3817)
!3901 = !DILocation(line: 5183, column: 6, scope: !3902)
!3902 = distinct !DILexicalBlock(scope: !3903, file: !70, line: 5183, column: 6)
!3903 = distinct !DILexicalBlock(scope: !3896, file: !70, line: 5182, column: 2)
!3904 = !DILocation(line: 5183, column: 16, scope: !3902)
!3905 = !DILocation(line: 5183, column: 6, scope: !3903)
!3906 = !DILocation(line: 5185, column: 7, scope: !3907)
!3907 = distinct !DILexicalBlock(scope: !3908, file: !70, line: 5185, column: 7)
!3908 = distinct !DILexicalBlock(scope: !3902, file: !70, line: 5184, column: 3)
!3909 = !DILocation(line: 5185, column: 15, scope: !3907)
!3910 = !DILocation(line: 5185, column: 7, scope: !3908)
!3911 = !DILocation(line: 5186, column: 12, scope: !3907)
!3912 = !DILocation(line: 5186, column: 5, scope: !3907)
!3913 = !DILocation(line: 5188, column: 5, scope: !3907)
!3914 = !DILocation(line: 5192, column: 7, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3916, file: !70, line: 5192, column: 7)
!3916 = distinct !DILexicalBlock(scope: !3902, file: !70, line: 5191, column: 3)
!3917 = !DILocation(line: 5192, column: 15, scope: !3915)
!3918 = !DILocation(line: 5192, column: 7, scope: !3916)
!3919 = !DILocation(line: 5193, column: 13, scope: !3915)
!3920 = !DILocation(line: 5193, column: 12, scope: !3915)
!3921 = !DILocation(line: 5193, column: 5, scope: !3915)
!3922 = !DILocation(line: 5195, column: 5, scope: !3915)
!3923 = !DILocation(line: 5200, column: 3, scope: !3924)
!3924 = distinct !DILexicalBlock(scope: !3896, file: !70, line: 5199, column: 2)
!3925 = !DILocation(line: 5202, column: 1, scope: !3817)
!3926 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !70, file: !70, line: 3945, type: !2386, scopeLine: 3946, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3927 = !DILocalVariable(name: "value", arg: 1, scope: !3926, file: !70, line: 3945, type: !20)
!3928 = !DILocation(line: 3945, column: 30, scope: !3926)
!3929 = !DILocalVariable(name: "factor", arg: 2, scope: !3926, file: !70, line: 3945, type: !24)
!3930 = !DILocation(line: 3945, column: 40, scope: !3926)
!3931 = !DILocation(line: 3947, column: 40, scope: !3926)
!3932 = !DILocation(line: 3947, column: 46, scope: !3926)
!3933 = !DILocation(line: 3947, column: 10, scope: !3926)
!3934 = !DILocation(line: 3947, column: 3, scope: !3926)
!3935 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !70, file: !70, line: 5540, type: !3936, scopeLine: 5541, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3936 = !DISubroutineType(types: !3937)
!3937 = !{!20, !20, !24, !733}
!3938 = !DILocalVariable(name: "value", arg: 1, scope: !3935, file: !70, line: 5540, type: !20)
!3939 = !DILocation(line: 5540, column: 39, scope: !3935)
!3940 = !DILocalVariable(name: "factor", arg: 2, scope: !3935, file: !70, line: 5540, type: !24)
!3941 = !DILocation(line: 5540, column: 49, scope: !3935)
!3942 = !DILocalVariable(name: "count", arg: 3, scope: !3935, file: !70, line: 5540, type: !733)
!3943 = !DILocation(line: 5540, column: 61, scope: !3935)
!3944 = !DILocalVariable(name: "u32Temp1", scope: !3935, file: !70, line: 5542, type: !733)
!3945 = !DILocation(line: 5542, column: 6, scope: !3935)
!3946 = !DILocalVariable(name: "u32Temp2", scope: !3935, file: !70, line: 5542, type: !733)
!3947 = !DILocation(line: 5542, column: 17, scope: !3935)
!3948 = !DILocalVariable(name: "u32Temp3", scope: !3935, file: !70, line: 5542, type: !733)
!3949 = !DILocation(line: 5542, column: 26, scope: !3935)
!3950 = !DILocalVariable(name: "u8SignBit", scope: !3935, file: !70, line: 5543, type: !24)
!3951 = !DILocation(line: 5543, column: 5, scope: !3935)
!3952 = !DILocation(line: 5545, column: 5, scope: !3953)
!3953 = distinct !DILexicalBlock(scope: !3935, file: !70, line: 5545, column: 5)
!3954 = !DILocation(line: 5545, column: 10, scope: !3953)
!3955 = !DILocation(line: 5545, column: 5, scope: !3935)
!3956 = !DILocation(line: 5547, column: 13, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3953, file: !70, line: 5546, column: 2)
!3958 = !DILocation(line: 5548, column: 15, scope: !3957)
!3959 = !DILocation(line: 5548, column: 14, scope: !3957)
!3960 = !DILocation(line: 5548, column: 12, scope: !3957)
!3961 = !DILocation(line: 5549, column: 2, scope: !3957)
!3962 = !DILocation(line: 5552, column: 13, scope: !3963)
!3963 = distinct !DILexicalBlock(scope: !3953, file: !70, line: 5551, column: 2)
!3964 = !DILocation(line: 5553, column: 14, scope: !3963)
!3965 = !DILocation(line: 5553, column: 12, scope: !3963)
!3966 = !DILocation(line: 5556, column: 13, scope: !3935)
!3967 = !DILocation(line: 5556, column: 24, scope: !3935)
!3968 = !DILocation(line: 5556, column: 22, scope: !3935)
!3969 = !DILocation(line: 5556, column: 11, scope: !3935)
!3970 = !DILocation(line: 5557, column: 25, scope: !3935)
!3971 = !DILocation(line: 5557, column: 34, scope: !3935)
!3972 = !DILocation(line: 5557, column: 13, scope: !3935)
!3973 = !DILocation(line: 5557, column: 11, scope: !3935)
!3974 = !DILocation(line: 5558, column: 13, scope: !3935)
!3975 = !DILocation(line: 5558, column: 25, scope: !3935)
!3976 = !DILocation(line: 5558, column: 22, scope: !3935)
!3977 = !DILocation(line: 5558, column: 11, scope: !3935)
!3978 = !DILocation(line: 5559, column: 14, scope: !3935)
!3979 = !DILocation(line: 5559, column: 30, scope: !3935)
!3980 = !DILocation(line: 5559, column: 29, scope: !3935)
!3981 = !DILocation(line: 5559, column: 23, scope: !3935)
!3982 = !DILocation(line: 5559, column: 11, scope: !3935)
!3983 = !DILocation(line: 5560, column: 6, scope: !3984)
!3984 = distinct !DILexicalBlock(scope: !3935, file: !70, line: 5560, column: 5)
!3985 = !DILocation(line: 5560, column: 16, scope: !3984)
!3986 = !DILocation(line: 5560, column: 14, scope: !3984)
!3987 = !DILocation(line: 5560, column: 22, scope: !3984)
!3988 = !DILocation(line: 5560, column: 5, scope: !3935)
!3989 = !DILocation(line: 5562, column: 6, scope: !3990)
!3990 = distinct !DILexicalBlock(scope: !3991, file: !70, line: 5562, column: 6)
!3991 = distinct !DILexicalBlock(scope: !3984, file: !70, line: 5561, column: 2)
!3992 = !DILocation(line: 5562, column: 16, scope: !3990)
!3993 = !DILocation(line: 5562, column: 6, scope: !3991)
!3994 = !DILocation(line: 5564, column: 7, scope: !3995)
!3995 = distinct !DILexicalBlock(scope: !3996, file: !70, line: 5564, column: 7)
!3996 = distinct !DILexicalBlock(scope: !3990, file: !70, line: 5563, column: 3)
!3997 = !DILocation(line: 5564, column: 15, scope: !3995)
!3998 = !DILocation(line: 5564, column: 7, scope: !3996)
!3999 = !DILocation(line: 5565, column: 12, scope: !3995)
!4000 = !DILocation(line: 5565, column: 5, scope: !3995)
!4001 = !DILocation(line: 5567, column: 5, scope: !3995)
!4002 = !DILocation(line: 5571, column: 7, scope: !4003)
!4003 = distinct !DILexicalBlock(scope: !4004, file: !70, line: 5571, column: 7)
!4004 = distinct !DILexicalBlock(scope: !3990, file: !70, line: 5570, column: 3)
!4005 = !DILocation(line: 5571, column: 15, scope: !4003)
!4006 = !DILocation(line: 5571, column: 7, scope: !4004)
!4007 = !DILocation(line: 5573, column: 13, scope: !4008)
!4008 = distinct !DILexicalBlock(scope: !4003, file: !70, line: 5572, column: 4)
!4009 = !DILocation(line: 5573, column: 12, scope: !4008)
!4010 = !DILocation(line: 5573, column: 5, scope: !4008)
!4011 = !DILocation(line: 5577, column: 5, scope: !4012)
!4012 = distinct !DILexicalBlock(scope: !4003, file: !70, line: 5576, column: 4)
!4013 = !DILocation(line: 5583, column: 6, scope: !4014)
!4014 = distinct !DILexicalBlock(scope: !4015, file: !70, line: 5583, column: 6)
!4015 = distinct !DILexicalBlock(scope: !3984, file: !70, line: 5582, column: 2)
!4016 = !DILocation(line: 5583, column: 16, scope: !4014)
!4017 = !DILocation(line: 5583, column: 6, scope: !4015)
!4018 = !DILocation(line: 5585, column: 4, scope: !4019)
!4019 = distinct !DILexicalBlock(scope: !4014, file: !70, line: 5584, column: 3)
!4020 = !DILocation(line: 5589, column: 4, scope: !4021)
!4021 = distinct !DILexicalBlock(scope: !4014, file: !70, line: 5588, column: 3)
!4022 = !DILocation(line: 5592, column: 1, scope: !3935)
!4023 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !70, file: !70, line: 3969, type: !156, scopeLine: 3970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4024 = !DILocalVariable(name: "value", arg: 1, scope: !4023, file: !70, line: 3969, type: !6)
!4025 = !DILocation(line: 3969, column: 28, scope: !4023)
!4026 = !DILocalVariable(name: "factor", arg: 2, scope: !4023, file: !70, line: 3969, type: !24)
!4027 = !DILocation(line: 3969, column: 38, scope: !4023)
!4028 = !DILocation(line: 3971, column: 38, scope: !4023)
!4029 = !DILocation(line: 3971, column: 56, scope: !4023)
!4030 = !DILocation(line: 3971, column: 50, scope: !4023)
!4031 = !DILocation(line: 3971, column: 64, scope: !4023)
!4032 = !DILocation(line: 3971, column: 44, scope: !4023)
!4033 = !DILocation(line: 3971, column: 10, scope: !4023)
!4034 = !DILocation(line: 3971, column: 3, scope: !4023)
!4035 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !70, file: !70, line: 3993, type: !156, scopeLine: 3994, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4036 = !DILocalVariable(name: "value", arg: 1, scope: !4035, file: !70, line: 3993, type: !6)
!4037 = !DILocation(line: 3993, column: 27, scope: !4035)
!4038 = !DILocalVariable(name: "factor", arg: 2, scope: !4035, file: !70, line: 3993, type: !24)
!4039 = !DILocation(line: 3993, column: 37, scope: !4035)
!4040 = !DILocation(line: 3995, column: 38, scope: !4035)
!4041 = !DILocation(line: 3995, column: 56, scope: !4035)
!4042 = !DILocation(line: 3995, column: 50, scope: !4035)
!4043 = !DILocation(line: 3995, column: 64, scope: !4035)
!4044 = !DILocation(line: 3995, column: 44, scope: !4035)
!4045 = !DILocation(line: 3995, column: 10, scope: !4035)
!4046 = !DILocation(line: 3995, column: 3, scope: !4035)
!4047 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !70, file: !70, line: 4018, type: !156, scopeLine: 4019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4048 = !DILocalVariable(name: "value", arg: 1, scope: !4047, file: !70, line: 4018, type: !6)
!4049 = !DILocation(line: 4018, column: 26, scope: !4047)
!4050 = !DILocalVariable(name: "factor", arg: 2, scope: !4047, file: !70, line: 4018, type: !24)
!4051 = !DILocation(line: 4018, column: 36, scope: !4047)
!4052 = !DILocation(line: 4020, column: 38, scope: !4047)
!4053 = !DILocation(line: 4020, column: 56, scope: !4047)
!4054 = !DILocation(line: 4020, column: 50, scope: !4047)
!4055 = !DILocation(line: 4020, column: 64, scope: !4047)
!4056 = !DILocation(line: 4020, column: 44, scope: !4047)
!4057 = !DILocation(line: 4020, column: 10, scope: !4047)
!4058 = !DILocation(line: 4020, column: 3, scope: !4047)
!4059 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !70, file: !70, line: 4043, type: !156, scopeLine: 4044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4060 = !DILocalVariable(name: "value", arg: 1, scope: !4059, file: !70, line: 4043, type: !6)
!4061 = !DILocation(line: 4043, column: 27, scope: !4059)
!4062 = !DILocalVariable(name: "factor", arg: 2, scope: !4059, file: !70, line: 4043, type: !24)
!4063 = !DILocation(line: 4043, column: 37, scope: !4059)
!4064 = !DILocation(line: 4045, column: 41, scope: !4059)
!4065 = !DILocation(line: 4045, column: 59, scope: !4059)
!4066 = !DILocation(line: 4045, column: 53, scope: !4059)
!4067 = !DILocation(line: 4045, column: 67, scope: !4059)
!4068 = !DILocation(line: 4045, column: 47, scope: !4059)
!4069 = !DILocation(line: 4045, column: 10, scope: !4059)
!4070 = !DILocation(line: 4045, column: 3, scope: !4059)
!4071 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !70, file: !70, line: 4068, type: !156, scopeLine: 4069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4072 = !DILocalVariable(name: "value", arg: 1, scope: !4071, file: !70, line: 4068, type: !6)
!4073 = !DILocation(line: 4068, column: 26, scope: !4071)
!4074 = !DILocalVariable(name: "factor", arg: 2, scope: !4071, file: !70, line: 4068, type: !24)
!4075 = !DILocation(line: 4068, column: 36, scope: !4071)
!4076 = !DILocation(line: 4070, column: 41, scope: !4071)
!4077 = !DILocation(line: 4070, column: 59, scope: !4071)
!4078 = !DILocation(line: 4070, column: 53, scope: !4071)
!4079 = !DILocation(line: 4070, column: 67, scope: !4071)
!4080 = !DILocation(line: 4070, column: 47, scope: !4071)
!4081 = !DILocation(line: 4070, column: 10, scope: !4071)
!4082 = !DILocation(line: 4070, column: 3, scope: !4071)
!4083 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !70, file: !70, line: 4092, type: !156, scopeLine: 4093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4084 = !DILocalVariable(name: "value", arg: 1, scope: !4083, file: !70, line: 4092, type: !6)
!4085 = !DILocation(line: 4092, column: 26, scope: !4083)
!4086 = !DILocalVariable(name: "factor", arg: 2, scope: !4083, file: !70, line: 4092, type: !24)
!4087 = !DILocation(line: 4092, column: 36, scope: !4083)
!4088 = !DILocation(line: 4094, column: 41, scope: !4083)
!4089 = !DILocation(line: 4094, column: 59, scope: !4083)
!4090 = !DILocation(line: 4094, column: 53, scope: !4083)
!4091 = !DILocation(line: 4094, column: 67, scope: !4083)
!4092 = !DILocation(line: 4094, column: 47, scope: !4083)
!4093 = !DILocation(line: 4094, column: 10, scope: !4083)
!4094 = !DILocation(line: 4094, column: 3, scope: !4083)
!4095 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !70, file: !70, line: 4116, type: !156, scopeLine: 4117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4096 = !DILocalVariable(name: "value", arg: 1, scope: !4095, file: !70, line: 4116, type: !6)
!4097 = !DILocation(line: 4116, column: 25, scope: !4095)
!4098 = !DILocalVariable(name: "factor", arg: 2, scope: !4095, file: !70, line: 4116, type: !24)
!4099 = !DILocation(line: 4116, column: 35, scope: !4095)
!4100 = !DILocation(line: 4118, column: 41, scope: !4095)
!4101 = !DILocation(line: 4118, column: 59, scope: !4095)
!4102 = !DILocation(line: 4118, column: 53, scope: !4095)
!4103 = !DILocation(line: 4118, column: 67, scope: !4095)
!4104 = !DILocation(line: 4118, column: 47, scope: !4095)
!4105 = !DILocation(line: 4118, column: 10, scope: !4095)
!4106 = !DILocation(line: 4118, column: 3, scope: !4095)
!4107 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !70, file: !70, line: 4140, type: !156, scopeLine: 4141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4108 = !DILocalVariable(name: "value", arg: 1, scope: !4107, file: !70, line: 4140, type: !6)
!4109 = !DILocation(line: 4140, column: 26, scope: !4107)
!4110 = !DILocalVariable(name: "factor", arg: 2, scope: !4107, file: !70, line: 4140, type: !24)
!4111 = !DILocation(line: 4140, column: 36, scope: !4107)
!4112 = !DILocation(line: 4142, column: 41, scope: !4107)
!4113 = !DILocation(line: 4142, column: 59, scope: !4107)
!4114 = !DILocation(line: 4142, column: 53, scope: !4107)
!4115 = !DILocation(line: 4142, column: 67, scope: !4107)
!4116 = !DILocation(line: 4142, column: 47, scope: !4107)
!4117 = !DILocation(line: 4142, column: 10, scope: !4107)
!4118 = !DILocation(line: 4142, column: 3, scope: !4107)
!4119 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !70, file: !70, line: 4164, type: !156, scopeLine: 4165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4120 = !DILocalVariable(name: "value", arg: 1, scope: !4119, file: !70, line: 4164, type: !6)
!4121 = !DILocation(line: 4164, column: 25, scope: !4119)
!4122 = !DILocalVariable(name: "factor", arg: 2, scope: !4119, file: !70, line: 4164, type: !24)
!4123 = !DILocation(line: 4164, column: 35, scope: !4119)
!4124 = !DILocation(line: 4166, column: 41, scope: !4119)
!4125 = !DILocation(line: 4166, column: 59, scope: !4119)
!4126 = !DILocation(line: 4166, column: 53, scope: !4119)
!4127 = !DILocation(line: 4166, column: 67, scope: !4119)
!4128 = !DILocation(line: 4166, column: 47, scope: !4119)
!4129 = !DILocation(line: 4166, column: 10, scope: !4119)
!4130 = !DILocation(line: 4166, column: 3, scope: !4119)
!4131 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !70, file: !70, line: 4187, type: !971, scopeLine: 4188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4132 = !DILocalVariable(name: "value", arg: 1, scope: !4131, file: !70, line: 4187, type: !29)
!4133 = !DILocation(line: 4187, column: 33, scope: !4131)
!4134 = !DILocalVariable(name: "factor", arg: 2, scope: !4131, file: !70, line: 4187, type: !29)
!4135 = !DILocation(line: 4187, column: 44, scope: !4131)
!4136 = !DILocation(line: 4189, column: 41, scope: !4131)
!4137 = !DILocation(line: 4189, column: 47, scope: !4131)
!4138 = !DILocation(line: 4189, column: 10, scope: !4131)
!4139 = !DILocation(line: 4189, column: 3, scope: !4131)
!4140 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !70, file: !70, line: 4210, type: !971, scopeLine: 4211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4141 = !DILocalVariable(name: "value", arg: 1, scope: !4140, file: !70, line: 4210, type: !29)
!4142 = !DILocation(line: 4210, column: 32, scope: !4140)
!4143 = !DILocalVariable(name: "factor", arg: 2, scope: !4140, file: !70, line: 4210, type: !29)
!4144 = !DILocation(line: 4210, column: 43, scope: !4140)
!4145 = !DILocation(line: 4212, column: 41, scope: !4140)
!4146 = !DILocation(line: 4212, column: 47, scope: !4140)
!4147 = !DILocation(line: 4212, column: 10, scope: !4140)
!4148 = !DILocation(line: 4212, column: 3, scope: !4140)
!4149 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !70, file: !70, line: 4234, type: !971, scopeLine: 4235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4150 = !DILocalVariable(name: "value", arg: 1, scope: !4149, file: !70, line: 4234, type: !29)
!4151 = !DILocation(line: 4234, column: 31, scope: !4149)
!4152 = !DILocalVariable(name: "factor", arg: 2, scope: !4149, file: !70, line: 4234, type: !29)
!4153 = !DILocation(line: 4234, column: 42, scope: !4149)
!4154 = !DILocation(line: 4236, column: 41, scope: !4149)
!4155 = !DILocation(line: 4236, column: 47, scope: !4149)
!4156 = !DILocation(line: 4236, column: 10, scope: !4149)
!4157 = !DILocation(line: 4236, column: 3, scope: !4149)
!4158 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !70, file: !70, line: 4258, type: !971, scopeLine: 4259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4159 = !DILocalVariable(name: "value", arg: 1, scope: !4158, file: !70, line: 4258, type: !29)
!4160 = !DILocation(line: 4258, column: 34, scope: !4158)
!4161 = !DILocalVariable(name: "factor", arg: 2, scope: !4158, file: !70, line: 4258, type: !29)
!4162 = !DILocation(line: 4258, column: 45, scope: !4158)
!4163 = !DILocation(line: 4260, column: 44, scope: !4158)
!4164 = !DILocation(line: 4260, column: 50, scope: !4158)
!4165 = !DILocation(line: 4260, column: 10, scope: !4158)
!4166 = !DILocation(line: 4260, column: 3, scope: !4158)
!4167 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !70, file: !70, line: 4282, type: !971, scopeLine: 4283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4168 = !DILocalVariable(name: "value", arg: 1, scope: !4167, file: !70, line: 4282, type: !29)
!4169 = !DILocation(line: 4282, column: 32, scope: !4167)
!4170 = !DILocalVariable(name: "factor", arg: 2, scope: !4167, file: !70, line: 4282, type: !29)
!4171 = !DILocation(line: 4282, column: 43, scope: !4167)
!4172 = !DILocation(line: 4284, column: 44, scope: !4167)
!4173 = !DILocation(line: 4284, column: 50, scope: !4167)
!4174 = !DILocation(line: 4284, column: 10, scope: !4167)
!4175 = !DILocation(line: 4284, column: 3, scope: !4167)
!4176 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !70, file: !70, line: 4306, type: !971, scopeLine: 4307, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4177 = !DILocalVariable(name: "value", arg: 1, scope: !4176, file: !70, line: 4306, type: !29)
!4178 = !DILocation(line: 4306, column: 31, scope: !4176)
!4179 = !DILocalVariable(name: "factor", arg: 2, scope: !4176, file: !70, line: 4306, type: !29)
!4180 = !DILocation(line: 4306, column: 42, scope: !4176)
!4181 = !DILocation(line: 4308, column: 44, scope: !4176)
!4182 = !DILocation(line: 4308, column: 50, scope: !4176)
!4183 = !DILocation(line: 4308, column: 10, scope: !4176)
!4184 = !DILocation(line: 4308, column: 3, scope: !4176)
!4185 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !70, file: !70, line: 4330, type: !971, scopeLine: 4331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4186 = !DILocalVariable(name: "value", arg: 1, scope: !4185, file: !70, line: 4330, type: !29)
!4187 = !DILocation(line: 4330, column: 33, scope: !4185)
!4188 = !DILocalVariable(name: "factor", arg: 2, scope: !4185, file: !70, line: 4330, type: !29)
!4189 = !DILocation(line: 4330, column: 44, scope: !4185)
!4190 = !DILocation(line: 4332, column: 44, scope: !4185)
!4191 = !DILocation(line: 4332, column: 50, scope: !4185)
!4192 = !DILocation(line: 4332, column: 10, scope: !4185)
!4193 = !DILocation(line: 4332, column: 3, scope: !4185)
!4194 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !70, file: !70, line: 4354, type: !971, scopeLine: 4355, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4195 = !DILocalVariable(name: "value", arg: 1, scope: !4194, file: !70, line: 4354, type: !29)
!4196 = !DILocation(line: 4354, column: 32, scope: !4194)
!4197 = !DILocalVariable(name: "factor", arg: 2, scope: !4194, file: !70, line: 4354, type: !29)
!4198 = !DILocation(line: 4354, column: 43, scope: !4194)
!4199 = !DILocation(line: 4356, column: 44, scope: !4194)
!4200 = !DILocation(line: 4356, column: 50, scope: !4194)
!4201 = !DILocation(line: 4356, column: 10, scope: !4194)
!4202 = !DILocation(line: 4356, column: 3, scope: !4194)
!4203 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !70, file: !70, line: 4377, type: !971, scopeLine: 4378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4204 = !DILocalVariable(name: "value", arg: 1, scope: !4203, file: !70, line: 4377, type: !29)
!4205 = !DILocation(line: 4377, column: 31, scope: !4203)
!4206 = !DILocalVariable(name: "factor", arg: 2, scope: !4203, file: !70, line: 4377, type: !29)
!4207 = !DILocation(line: 4377, column: 42, scope: !4203)
!4208 = !DILocation(line: 4379, column: 44, scope: !4203)
!4209 = !DILocation(line: 4379, column: 50, scope: !4203)
!4210 = !DILocation(line: 4379, column: 10, scope: !4203)
!4211 = !DILocation(line: 4379, column: 3, scope: !4203)
!4212 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !70, file: !70, line: 4400, type: !971, scopeLine: 4401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4213 = !DILocalVariable(name: "value", arg: 1, scope: !4212, file: !70, line: 4400, type: !29)
!4214 = !DILocation(line: 4400, column: 30, scope: !4212)
!4215 = !DILocalVariable(name: "factor", arg: 2, scope: !4212, file: !70, line: 4400, type: !29)
!4216 = !DILocation(line: 4400, column: 41, scope: !4212)
!4217 = !DILocation(line: 4402, column: 44, scope: !4212)
!4218 = !DILocation(line: 4402, column: 50, scope: !4212)
!4219 = !DILocation(line: 4402, column: 10, scope: !4212)
!4220 = !DILocation(line: 4402, column: 3, scope: !4212)
!4221 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !70, file: !70, line: 4423, type: !971, scopeLine: 4424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4222 = !DILocalVariable(name: "value", arg: 1, scope: !4221, file: !70, line: 4423, type: !29)
!4223 = !DILocation(line: 4423, column: 33, scope: !4221)
!4224 = !DILocalVariable(name: "factor", arg: 2, scope: !4221, file: !70, line: 4423, type: !29)
!4225 = !DILocation(line: 4423, column: 44, scope: !4221)
!4226 = !DILocation(line: 4425, column: 44, scope: !4221)
!4227 = !DILocation(line: 4425, column: 50, scope: !4221)
!4228 = !DILocation(line: 4425, column: 10, scope: !4221)
!4229 = !DILocation(line: 4425, column: 3, scope: !4221)
!4230 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !70, file: !70, line: 4446, type: !971, scopeLine: 4447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4231 = !DILocalVariable(name: "value", arg: 1, scope: !4230, file: !70, line: 4446, type: !29)
!4232 = !DILocation(line: 4446, column: 32, scope: !4230)
!4233 = !DILocalVariable(name: "factor", arg: 2, scope: !4230, file: !70, line: 4446, type: !29)
!4234 = !DILocation(line: 4446, column: 43, scope: !4230)
!4235 = !DILocation(line: 4448, column: 44, scope: !4230)
!4236 = !DILocation(line: 4448, column: 50, scope: !4230)
!4237 = !DILocation(line: 4448, column: 10, scope: !4230)
!4238 = !DILocation(line: 4448, column: 3, scope: !4230)
!4239 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !70, file: !70, line: 4469, type: !971, scopeLine: 4470, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4240 = !DILocalVariable(name: "value", arg: 1, scope: !4239, file: !70, line: 4469, type: !29)
!4241 = !DILocation(line: 4469, column: 31, scope: !4239)
!4242 = !DILocalVariable(name: "factor", arg: 2, scope: !4239, file: !70, line: 4469, type: !29)
!4243 = !DILocation(line: 4469, column: 42, scope: !4239)
!4244 = !DILocation(line: 4471, column: 44, scope: !4239)
!4245 = !DILocation(line: 4471, column: 50, scope: !4239)
!4246 = !DILocation(line: 4471, column: 10, scope: !4239)
!4247 = !DILocation(line: 4471, column: 3, scope: !4239)
!4248 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !70, file: !70, line: 4492, type: !971, scopeLine: 4493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4249 = !DILocalVariable(name: "value", arg: 1, scope: !4248, file: !70, line: 4492, type: !29)
!4250 = !DILocation(line: 4492, column: 30, scope: !4248)
!4251 = !DILocalVariable(name: "factor", arg: 2, scope: !4248, file: !70, line: 4492, type: !29)
!4252 = !DILocation(line: 4492, column: 41, scope: !4248)
!4253 = !DILocation(line: 4494, column: 44, scope: !4248)
!4254 = !DILocation(line: 4494, column: 50, scope: !4248)
!4255 = !DILocation(line: 4494, column: 10, scope: !4248)
!4256 = !DILocation(line: 4494, column: 3, scope: !4248)
!4257 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !70, file: !70, line: 4514, type: !1016, scopeLine: 4515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4258 = !DILocalVariable(name: "x_value", arg: 1, scope: !4257, file: !70, line: 4514, type: !29)
!4259 = !DILocation(line: 4514, column: 32, scope: !4257)
!4260 = !DILocalVariable(name: "y_value", arg: 2, scope: !4257, file: !70, line: 4514, type: !24)
!4261 = !DILocation(line: 4514, column: 44, scope: !4257)
!4262 = !DILocation(line: 4516, column: 40, scope: !4257)
!4263 = !DILocation(line: 4516, column: 60, scope: !4257)
!4264 = !DILocation(line: 4516, column: 54, scope: !4257)
!4265 = !DILocation(line: 4516, column: 69, scope: !4257)
!4266 = !DILocation(line: 4516, column: 48, scope: !4257)
!4267 = !DILocation(line: 4516, column: 10, scope: !4257)
!4268 = !DILocation(line: 4516, column: 3, scope: !4257)
!4269 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !70, file: !70, line: 4536, type: !1016, scopeLine: 4537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4270 = !DILocalVariable(name: "x_value", arg: 1, scope: !4269, file: !70, line: 4536, type: !29)
!4271 = !DILocation(line: 4536, column: 31, scope: !4269)
!4272 = !DILocalVariable(name: "y_value", arg: 2, scope: !4269, file: !70, line: 4536, type: !24)
!4273 = !DILocation(line: 4536, column: 43, scope: !4269)
!4274 = !DILocation(line: 4538, column: 40, scope: !4269)
!4275 = !DILocation(line: 4538, column: 60, scope: !4269)
!4276 = !DILocation(line: 4538, column: 54, scope: !4269)
!4277 = !DILocation(line: 4538, column: 69, scope: !4269)
!4278 = !DILocation(line: 4538, column: 48, scope: !4269)
!4279 = !DILocation(line: 4538, column: 10, scope: !4269)
!4280 = !DILocation(line: 4538, column: 3, scope: !4269)
!4281 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !70, file: !70, line: 4559, type: !1016, scopeLine: 4560, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4282 = !DILocalVariable(name: "x_value", arg: 1, scope: !4281, file: !70, line: 4559, type: !29)
!4283 = !DILocation(line: 4559, column: 30, scope: !4281)
!4284 = !DILocalVariable(name: "y_value", arg: 2, scope: !4281, file: !70, line: 4559, type: !24)
!4285 = !DILocation(line: 4559, column: 42, scope: !4281)
!4286 = !DILocation(line: 4561, column: 40, scope: !4281)
!4287 = !DILocation(line: 4561, column: 60, scope: !4281)
!4288 = !DILocation(line: 4561, column: 54, scope: !4281)
!4289 = !DILocation(line: 4561, column: 69, scope: !4281)
!4290 = !DILocation(line: 4561, column: 48, scope: !4281)
!4291 = !DILocation(line: 4561, column: 10, scope: !4281)
!4292 = !DILocation(line: 4561, column: 3, scope: !4281)
!4293 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !70, file: !70, line: 4582, type: !1016, scopeLine: 4583, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4294 = !DILocalVariable(name: "x_value", arg: 1, scope: !4293, file: !70, line: 4582, type: !29)
!4295 = !DILocation(line: 4582, column: 31, scope: !4293)
!4296 = !DILocalVariable(name: "y_value", arg: 2, scope: !4293, file: !70, line: 4582, type: !24)
!4297 = !DILocation(line: 4582, column: 43, scope: !4293)
!4298 = !DILocation(line: 4584, column: 44, scope: !4293)
!4299 = !DILocation(line: 4584, column: 64, scope: !4293)
!4300 = !DILocation(line: 4584, column: 58, scope: !4293)
!4301 = !DILocation(line: 4584, column: 73, scope: !4293)
!4302 = !DILocation(line: 4584, column: 52, scope: !4293)
!4303 = !DILocation(line: 4584, column: 10, scope: !4293)
!4304 = !DILocation(line: 4584, column: 3, scope: !4293)
!4305 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !70, file: !70, line: 4605, type: !1016, scopeLine: 4606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4306 = !DILocalVariable(name: "x_value", arg: 1, scope: !4305, file: !70, line: 4605, type: !29)
!4307 = !DILocation(line: 4605, column: 30, scope: !4305)
!4308 = !DILocalVariable(name: "y_value", arg: 2, scope: !4305, file: !70, line: 4605, type: !24)
!4309 = !DILocation(line: 4605, column: 42, scope: !4305)
!4310 = !DILocation(line: 4607, column: 44, scope: !4305)
!4311 = !DILocation(line: 4607, column: 64, scope: !4305)
!4312 = !DILocation(line: 4607, column: 58, scope: !4305)
!4313 = !DILocation(line: 4607, column: 73, scope: !4305)
!4314 = !DILocation(line: 4607, column: 52, scope: !4305)
!4315 = !DILocation(line: 4607, column: 10, scope: !4305)
!4316 = !DILocation(line: 4607, column: 3, scope: !4305)
!4317 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !70, file: !70, line: 4627, type: !1016, scopeLine: 4628, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4318 = !DILocalVariable(name: "x_value", arg: 1, scope: !4317, file: !70, line: 4627, type: !29)
!4319 = !DILocation(line: 4627, column: 30, scope: !4317)
!4320 = !DILocalVariable(name: "y_value", arg: 2, scope: !4317, file: !70, line: 4627, type: !24)
!4321 = !DILocation(line: 4627, column: 42, scope: !4317)
!4322 = !DILocation(line: 4629, column: 44, scope: !4317)
!4323 = !DILocation(line: 4629, column: 64, scope: !4317)
!4324 = !DILocation(line: 4629, column: 58, scope: !4317)
!4325 = !DILocation(line: 4629, column: 73, scope: !4317)
!4326 = !DILocation(line: 4629, column: 52, scope: !4317)
!4327 = !DILocation(line: 4629, column: 10, scope: !4317)
!4328 = !DILocation(line: 4629, column: 3, scope: !4317)
!4329 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !70, file: !70, line: 4649, type: !1016, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4330 = !DILocalVariable(name: "x_value", arg: 1, scope: !4329, file: !70, line: 4649, type: !29)
!4331 = !DILocation(line: 4649, column: 29, scope: !4329)
!4332 = !DILocalVariable(name: "y_value", arg: 2, scope: !4329, file: !70, line: 4649, type: !24)
!4333 = !DILocation(line: 4649, column: 41, scope: !4329)
!4334 = !DILocation(line: 4651, column: 44, scope: !4329)
!4335 = !DILocation(line: 4651, column: 64, scope: !4329)
!4336 = !DILocation(line: 4651, column: 58, scope: !4329)
!4337 = !DILocation(line: 4651, column: 73, scope: !4329)
!4338 = !DILocation(line: 4651, column: 52, scope: !4329)
!4339 = !DILocation(line: 4651, column: 10, scope: !4329)
!4340 = !DILocation(line: 4651, column: 3, scope: !4329)
!4341 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !70, file: !70, line: 4671, type: !1016, scopeLine: 4672, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4342 = !DILocalVariable(name: "x_value", arg: 1, scope: !4341, file: !70, line: 4671, type: !29)
!4343 = !DILocation(line: 4671, column: 30, scope: !4341)
!4344 = !DILocalVariable(name: "y_value", arg: 2, scope: !4341, file: !70, line: 4671, type: !24)
!4345 = !DILocation(line: 4671, column: 42, scope: !4341)
!4346 = !DILocation(line: 4673, column: 44, scope: !4341)
!4347 = !DILocation(line: 4673, column: 64, scope: !4341)
!4348 = !DILocation(line: 4673, column: 58, scope: !4341)
!4349 = !DILocation(line: 4673, column: 73, scope: !4341)
!4350 = !DILocation(line: 4673, column: 52, scope: !4341)
!4351 = !DILocation(line: 4673, column: 10, scope: !4341)
!4352 = !DILocation(line: 4673, column: 3, scope: !4341)
!4353 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !70, file: !70, line: 4693, type: !1016, scopeLine: 4694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4354 = !DILocalVariable(name: "x_value", arg: 1, scope: !4353, file: !70, line: 4693, type: !29)
!4355 = !DILocation(line: 4693, column: 29, scope: !4353)
!4356 = !DILocalVariable(name: "y_value", arg: 2, scope: !4353, file: !70, line: 4693, type: !24)
!4357 = !DILocation(line: 4693, column: 41, scope: !4353)
!4358 = !DILocation(line: 4695, column: 44, scope: !4353)
!4359 = !DILocation(line: 4695, column: 64, scope: !4353)
!4360 = !DILocation(line: 4695, column: 58, scope: !4353)
!4361 = !DILocation(line: 4695, column: 73, scope: !4353)
!4362 = !DILocation(line: 4695, column: 52, scope: !4353)
!4363 = !DILocation(line: 4695, column: 10, scope: !4353)
!4364 = !DILocation(line: 4695, column: 3, scope: !4353)
!4365 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !70, file: !70, line: 4717, type: !1545, scopeLine: 4718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4366 = !DILocalVariable(name: "value", arg: 1, scope: !4365, file: !70, line: 4717, type: !733)
!4367 = !DILocation(line: 4717, column: 31, scope: !4365)
!4368 = !DILocalVariable(name: "factor", arg: 2, scope: !4365, file: !70, line: 4717, type: !13)
!4369 = !DILocation(line: 4717, column: 42, scope: !4365)
!4370 = !DILocation(line: 4719, column: 41, scope: !4365)
!4371 = !DILocation(line: 4719, column: 47, scope: !4365)
!4372 = !DILocation(line: 4719, column: 10, scope: !4365)
!4373 = !DILocation(line: 4719, column: 3, scope: !4365)
!4374 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !70, file: !70, line: 5297, type: !4375, scopeLine: 5298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4375 = !DISubroutineType(types: !4376)
!4376 = !{!733, !733, !13, !733}
!4377 = !DILocalVariable(name: "value", arg: 1, scope: !4374, file: !70, line: 5297, type: !733)
!4378 = !DILocation(line: 5297, column: 40, scope: !4374)
!4379 = !DILocalVariable(name: "factor", arg: 2, scope: !4374, file: !70, line: 5297, type: !13)
!4380 = !DILocation(line: 5297, column: 50, scope: !4374)
!4381 = !DILocalVariable(name: "count", arg: 3, scope: !4374, file: !70, line: 5297, type: !733)
!4382 = !DILocation(line: 5297, column: 62, scope: !4374)
!4383 = !DILocalVariable(name: "u32Temp1", scope: !4374, file: !70, line: 5299, type: !733)
!4384 = !DILocation(line: 5299, column: 6, scope: !4374)
!4385 = !DILocalVariable(name: "u32Temp2", scope: !4374, file: !70, line: 5299, type: !733)
!4386 = !DILocation(line: 5299, column: 17, scope: !4374)
!4387 = !DILocalVariable(name: "u32Temp3", scope: !4374, file: !70, line: 5299, type: !733)
!4388 = !DILocation(line: 5299, column: 26, scope: !4374)
!4389 = !DILocalVariable(name: "u8SignBit", scope: !4374, file: !70, line: 5300, type: !24)
!4390 = !DILocation(line: 5300, column: 5, scope: !4374)
!4391 = !DILocation(line: 5302, column: 5, scope: !4392)
!4392 = distinct !DILexicalBlock(scope: !4374, file: !70, line: 5302, column: 5)
!4393 = !DILocation(line: 5302, column: 11, scope: !4392)
!4394 = !DILocation(line: 5302, column: 5, scope: !4374)
!4395 = !DILocation(line: 5304, column: 13, scope: !4396)
!4396 = distinct !DILexicalBlock(scope: !4392, file: !70, line: 5303, column: 2)
!4397 = !DILocation(line: 5305, column: 2, scope: !4396)
!4398 = !DILocation(line: 5308, column: 13, scope: !4399)
!4399 = distinct !DILexicalBlock(scope: !4392, file: !70, line: 5307, column: 2)
!4400 = !DILocation(line: 5312, column: 5, scope: !4401)
!4401 = distinct !DILexicalBlock(scope: !4374, file: !70, line: 5312, column: 5)
!4402 = !DILocation(line: 5312, column: 11, scope: !4401)
!4403 = !DILocation(line: 5312, column: 5, scope: !4374)
!4404 = !DILocation(line: 5314, column: 15, scope: !4405)
!4405 = distinct !DILexicalBlock(scope: !4401, file: !70, line: 5313, column: 2)
!4406 = !DILocation(line: 5314, column: 14, scope: !4405)
!4407 = !DILocation(line: 5314, column: 12, scope: !4405)
!4408 = !DILocation(line: 5315, column: 2, scope: !4405)
!4409 = !DILocation(line: 5318, column: 14, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4401, file: !70, line: 5317, column: 2)
!4411 = !DILocation(line: 5318, column: 12, scope: !4410)
!4412 = !DILocation(line: 5321, column: 13, scope: !4374)
!4413 = !DILocation(line: 5321, column: 21, scope: !4374)
!4414 = !DILocation(line: 5321, column: 19, scope: !4374)
!4415 = !DILocation(line: 5321, column: 11, scope: !4374)
!4416 = !DILocation(line: 5322, column: 25, scope: !4374)
!4417 = !DILocation(line: 5322, column: 32, scope: !4374)
!4418 = !DILocation(line: 5322, column: 13, scope: !4374)
!4419 = !DILocation(line: 5322, column: 11, scope: !4374)
!4420 = !DILocation(line: 5323, column: 13, scope: !4374)
!4421 = !DILocation(line: 5323, column: 25, scope: !4374)
!4422 = !DILocation(line: 5323, column: 22, scope: !4374)
!4423 = !DILocation(line: 5323, column: 11, scope: !4374)
!4424 = !DILocation(line: 5324, column: 14, scope: !4374)
!4425 = !DILocation(line: 5324, column: 30, scope: !4374)
!4426 = !DILocation(line: 5324, column: 29, scope: !4374)
!4427 = !DILocation(line: 5324, column: 23, scope: !4374)
!4428 = !DILocation(line: 5324, column: 11, scope: !4374)
!4429 = !DILocation(line: 5325, column: 6, scope: !4430)
!4430 = distinct !DILexicalBlock(scope: !4374, file: !70, line: 5325, column: 5)
!4431 = !DILocation(line: 5325, column: 16, scope: !4430)
!4432 = !DILocation(line: 5325, column: 14, scope: !4430)
!4433 = !DILocation(line: 5325, column: 22, scope: !4430)
!4434 = !DILocation(line: 5325, column: 5, scope: !4374)
!4435 = !DILocation(line: 5327, column: 6, scope: !4436)
!4436 = distinct !DILexicalBlock(scope: !4437, file: !70, line: 5327, column: 6)
!4437 = distinct !DILexicalBlock(scope: !4430, file: !70, line: 5326, column: 2)
!4438 = !DILocation(line: 5327, column: 16, scope: !4436)
!4439 = !DILocation(line: 5327, column: 6, scope: !4437)
!4440 = !DILocation(line: 5329, column: 7, scope: !4441)
!4441 = distinct !DILexicalBlock(scope: !4442, file: !70, line: 5329, column: 7)
!4442 = distinct !DILexicalBlock(scope: !4436, file: !70, line: 5328, column: 3)
!4443 = !DILocation(line: 5329, column: 15, scope: !4441)
!4444 = !DILocation(line: 5329, column: 7, scope: !4442)
!4445 = !DILocation(line: 5330, column: 12, scope: !4441)
!4446 = !DILocation(line: 5330, column: 5, scope: !4441)
!4447 = !DILocation(line: 5332, column: 5, scope: !4441)
!4448 = !DILocation(line: 5336, column: 4, scope: !4449)
!4449 = distinct !DILexicalBlock(scope: !4436, file: !70, line: 5335, column: 3)
!4450 = !DILocation(line: 5341, column: 3, scope: !4451)
!4451 = distinct !DILexicalBlock(scope: !4430, file: !70, line: 5340, column: 2)
!4452 = !DILocation(line: 5343, column: 1, scope: !4374)
!4453 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !70, file: !70, line: 4741, type: !1363, scopeLine: 4742, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4454 = !DILocalVariable(name: "value", arg: 1, scope: !4453, file: !70, line: 4741, type: !733)
!4455 = !DILocation(line: 4741, column: 31, scope: !4453)
!4456 = !DILocalVariable(name: "factor", arg: 2, scope: !4453, file: !70, line: 4741, type: !20)
!4457 = !DILocation(line: 4741, column: 42, scope: !4453)
!4458 = !DILocation(line: 4743, column: 41, scope: !4453)
!4459 = !DILocation(line: 4743, column: 47, scope: !4453)
!4460 = !DILocation(line: 4743, column: 10, scope: !4453)
!4461 = !DILocation(line: 4743, column: 3, scope: !4453)
!4462 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !70, file: !70, line: 5361, type: !4463, scopeLine: 5362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4463 = !DISubroutineType(types: !4464)
!4464 = !{!733, !733, !20, !733}
!4465 = !DILocalVariable(name: "value", arg: 1, scope: !4462, file: !70, line: 5361, type: !733)
!4466 = !DILocation(line: 5361, column: 40, scope: !4462)
!4467 = !DILocalVariable(name: "factor", arg: 2, scope: !4462, file: !70, line: 5361, type: !20)
!4468 = !DILocation(line: 5361, column: 51, scope: !4462)
!4469 = !DILocalVariable(name: "count", arg: 3, scope: !4462, file: !70, line: 5361, type: !733)
!4470 = !DILocation(line: 5361, column: 63, scope: !4462)
!4471 = !DILocalVariable(name: "u32Temp1", scope: !4462, file: !70, line: 5363, type: !733)
!4472 = !DILocation(line: 5363, column: 6, scope: !4462)
!4473 = !DILocalVariable(name: "u32Temp2", scope: !4462, file: !70, line: 5363, type: !733)
!4474 = !DILocation(line: 5363, column: 17, scope: !4462)
!4475 = !DILocalVariable(name: "u8SignBit", scope: !4462, file: !70, line: 5364, type: !24)
!4476 = !DILocation(line: 5364, column: 5, scope: !4462)
!4477 = !DILocation(line: 5366, column: 5, scope: !4478)
!4478 = distinct !DILexicalBlock(scope: !4462, file: !70, line: 5366, column: 5)
!4479 = !DILocation(line: 5366, column: 11, scope: !4478)
!4480 = !DILocation(line: 5366, column: 5, scope: !4462)
!4481 = !DILocation(line: 5368, column: 13, scope: !4482)
!4482 = distinct !DILexicalBlock(scope: !4478, file: !70, line: 5367, column: 2)
!4483 = !DILocation(line: 5369, column: 2, scope: !4482)
!4484 = !DILocation(line: 5372, column: 13, scope: !4485)
!4485 = distinct !DILexicalBlock(scope: !4478, file: !70, line: 5371, column: 2)
!4486 = !DILocation(line: 5376, column: 5, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4462, file: !70, line: 5376, column: 5)
!4488 = !DILocation(line: 5376, column: 11, scope: !4487)
!4489 = !DILocation(line: 5376, column: 5, scope: !4462)
!4490 = !DILocation(line: 5378, column: 15, scope: !4491)
!4491 = distinct !DILexicalBlock(scope: !4487, file: !70, line: 5377, column: 2)
!4492 = !DILocation(line: 5378, column: 14, scope: !4491)
!4493 = !DILocation(line: 5378, column: 12, scope: !4491)
!4494 = !DILocation(line: 5379, column: 2, scope: !4491)
!4495 = !DILocation(line: 5382, column: 14, scope: !4496)
!4496 = distinct !DILexicalBlock(scope: !4487, file: !70, line: 5381, column: 2)
!4497 = !DILocation(line: 5382, column: 12, scope: !4496)
!4498 = !DILocation(line: 5385, column: 25, scope: !4462)
!4499 = !DILocation(line: 5385, column: 32, scope: !4462)
!4500 = !DILocation(line: 5385, column: 13, scope: !4462)
!4501 = !DILocation(line: 5385, column: 11, scope: !4462)
!4502 = !DILocation(line: 5386, column: 13, scope: !4462)
!4503 = !DILocation(line: 5386, column: 26, scope: !4462)
!4504 = !DILocation(line: 5386, column: 31, scope: !4462)
!4505 = !DILocation(line: 5386, column: 22, scope: !4462)
!4506 = !DILocation(line: 5386, column: 11, scope: !4462)
!4507 = !DILocation(line: 5387, column: 5, scope: !4508)
!4508 = distinct !DILexicalBlock(scope: !4462, file: !70, line: 5387, column: 5)
!4509 = !DILocation(line: 5387, column: 15, scope: !4508)
!4510 = !DILocation(line: 5387, column: 5, scope: !4462)
!4511 = !DILocation(line: 5389, column: 10, scope: !4512)
!4512 = distinct !DILexicalBlock(scope: !4508, file: !70, line: 5388, column: 2)
!4513 = !DILocation(line: 5389, column: 3, scope: !4512)
!4514 = !DILocation(line: 5393, column: 3, scope: !4515)
!4515 = distinct !DILexicalBlock(scope: !4508, file: !70, line: 5392, column: 2)
!4516 = !DILocation(line: 5395, column: 1, scope: !4462)
!4517 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !70, file: !70, line: 4765, type: !3137, scopeLine: 4766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4518 = !DILocalVariable(name: "value", arg: 1, scope: !4517, file: !70, line: 4765, type: !733)
!4519 = !DILocation(line: 4765, column: 30, scope: !4517)
!4520 = !DILocalVariable(name: "factor", arg: 2, scope: !4517, file: !70, line: 4765, type: !6)
!4521 = !DILocation(line: 4765, column: 40, scope: !4517)
!4522 = !DILocation(line: 4767, column: 40, scope: !4517)
!4523 = !DILocation(line: 4767, column: 46, scope: !4517)
!4524 = !DILocation(line: 4767, column: 10, scope: !4517)
!4525 = !DILocation(line: 4767, column: 3, scope: !4517)
!4526 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !70, file: !70, line: 5439, type: !4527, scopeLine: 5440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4527 = !DISubroutineType(types: !4528)
!4528 = !{!733, !733, !6, !733}
!4529 = !DILocalVariable(name: "value", arg: 1, scope: !4526, file: !70, line: 5439, type: !733)
!4530 = !DILocation(line: 5439, column: 39, scope: !4526)
!4531 = !DILocalVariable(name: "factor", arg: 2, scope: !4526, file: !70, line: 5439, type: !6)
!4532 = !DILocation(line: 5439, column: 49, scope: !4526)
!4533 = !DILocalVariable(name: "count", arg: 3, scope: !4526, file: !70, line: 5439, type: !733)
!4534 = !DILocation(line: 5439, column: 61, scope: !4526)
!4535 = !DILocalVariable(name: "u32Temp1", scope: !4526, file: !70, line: 5441, type: !733)
!4536 = !DILocation(line: 5441, column: 6, scope: !4526)
!4537 = !DILocalVariable(name: "u32Temp2", scope: !4526, file: !70, line: 5441, type: !733)
!4538 = !DILocation(line: 5441, column: 17, scope: !4526)
!4539 = !DILocalVariable(name: "u32Temp3", scope: !4526, file: !70, line: 5441, type: !733)
!4540 = !DILocation(line: 5441, column: 26, scope: !4526)
!4541 = !DILocalVariable(name: "u8SignBit", scope: !4526, file: !70, line: 5442, type: !24)
!4542 = !DILocation(line: 5442, column: 5, scope: !4526)
!4543 = !DILocation(line: 5444, column: 5, scope: !4544)
!4544 = distinct !DILexicalBlock(scope: !4526, file: !70, line: 5444, column: 5)
!4545 = !DILocation(line: 5444, column: 11, scope: !4544)
!4546 = !DILocation(line: 5444, column: 5, scope: !4526)
!4547 = !DILocation(line: 5446, column: 13, scope: !4548)
!4548 = distinct !DILexicalBlock(scope: !4544, file: !70, line: 5445, column: 2)
!4549 = !DILocation(line: 5447, column: 2, scope: !4548)
!4550 = !DILocation(line: 5450, column: 13, scope: !4551)
!4551 = distinct !DILexicalBlock(scope: !4544, file: !70, line: 5449, column: 2)
!4552 = !DILocation(line: 5454, column: 5, scope: !4553)
!4553 = distinct !DILexicalBlock(scope: !4526, file: !70, line: 5454, column: 5)
!4554 = !DILocation(line: 5454, column: 11, scope: !4553)
!4555 = !DILocation(line: 5454, column: 5, scope: !4526)
!4556 = !DILocation(line: 5456, column: 15, scope: !4557)
!4557 = distinct !DILexicalBlock(scope: !4553, file: !70, line: 5455, column: 2)
!4558 = !DILocation(line: 5456, column: 14, scope: !4557)
!4559 = !DILocation(line: 5456, column: 12, scope: !4557)
!4560 = !DILocation(line: 5457, column: 2, scope: !4557)
!4561 = !DILocation(line: 5460, column: 14, scope: !4562)
!4562 = distinct !DILexicalBlock(scope: !4553, file: !70, line: 5459, column: 2)
!4563 = !DILocation(line: 5460, column: 12, scope: !4562)
!4564 = !DILocation(line: 5463, column: 13, scope: !4526)
!4565 = !DILocation(line: 5463, column: 21, scope: !4526)
!4566 = !DILocation(line: 5463, column: 19, scope: !4526)
!4567 = !DILocation(line: 5463, column: 11, scope: !4526)
!4568 = !DILocation(line: 5464, column: 25, scope: !4526)
!4569 = !DILocation(line: 5464, column: 32, scope: !4526)
!4570 = !DILocation(line: 5464, column: 13, scope: !4526)
!4571 = !DILocation(line: 5464, column: 11, scope: !4526)
!4572 = !DILocation(line: 5465, column: 13, scope: !4526)
!4573 = !DILocation(line: 5465, column: 25, scope: !4526)
!4574 = !DILocation(line: 5465, column: 22, scope: !4526)
!4575 = !DILocation(line: 5465, column: 11, scope: !4526)
!4576 = !DILocation(line: 5466, column: 14, scope: !4526)
!4577 = !DILocation(line: 5466, column: 30, scope: !4526)
!4578 = !DILocation(line: 5466, column: 29, scope: !4526)
!4579 = !DILocation(line: 5466, column: 23, scope: !4526)
!4580 = !DILocation(line: 5466, column: 11, scope: !4526)
!4581 = !DILocation(line: 5467, column: 6, scope: !4582)
!4582 = distinct !DILexicalBlock(scope: !4526, file: !70, line: 5467, column: 5)
!4583 = !DILocation(line: 5467, column: 16, scope: !4582)
!4584 = !DILocation(line: 5467, column: 14, scope: !4582)
!4585 = !DILocation(line: 5467, column: 22, scope: !4582)
!4586 = !DILocation(line: 5467, column: 5, scope: !4526)
!4587 = !DILocation(line: 5469, column: 6, scope: !4588)
!4588 = distinct !DILexicalBlock(scope: !4589, file: !70, line: 5469, column: 6)
!4589 = distinct !DILexicalBlock(scope: !4582, file: !70, line: 5468, column: 2)
!4590 = !DILocation(line: 5469, column: 16, scope: !4588)
!4591 = !DILocation(line: 5469, column: 6, scope: !4589)
!4592 = !DILocation(line: 5471, column: 7, scope: !4593)
!4593 = distinct !DILexicalBlock(scope: !4594, file: !70, line: 5471, column: 7)
!4594 = distinct !DILexicalBlock(scope: !4588, file: !70, line: 5470, column: 3)
!4595 = !DILocation(line: 5471, column: 15, scope: !4593)
!4596 = !DILocation(line: 5471, column: 7, scope: !4594)
!4597 = !DILocation(line: 5472, column: 12, scope: !4593)
!4598 = !DILocation(line: 5472, column: 5, scope: !4593)
!4599 = !DILocation(line: 5474, column: 5, scope: !4593)
!4600 = !DILocation(line: 5478, column: 4, scope: !4601)
!4601 = distinct !DILexicalBlock(scope: !4588, file: !70, line: 5477, column: 3)
!4602 = !DILocation(line: 5483, column: 3, scope: !4603)
!4603 = distinct !DILexicalBlock(scope: !4582, file: !70, line: 5482, column: 2)
!4604 = !DILocation(line: 5485, column: 1, scope: !4526)
!4605 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !70, file: !70, line: 4789, type: !1159, scopeLine: 4790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4606 = !DILocalVariable(name: "value", arg: 1, scope: !4605, file: !70, line: 4789, type: !733)
!4607 = !DILocation(line: 4789, column: 31, scope: !4605)
!4608 = !DILocalVariable(name: "factor", arg: 2, scope: !4605, file: !70, line: 4789, type: !29)
!4609 = !DILocation(line: 4789, column: 42, scope: !4605)
!4610 = !DILocation(line: 4791, column: 41, scope: !4605)
!4611 = !DILocation(line: 4791, column: 47, scope: !4605)
!4612 = !DILocation(line: 4791, column: 10, scope: !4605)
!4613 = !DILocation(line: 4791, column: 3, scope: !4605)
!4614 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !70, file: !70, line: 4813, type: !1454, scopeLine: 4814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4615 = !DILocalVariable(name: "value", arg: 1, scope: !4614, file: !70, line: 4813, type: !733)
!4616 = !DILocation(line: 4813, column: 31, scope: !4614)
!4617 = !DILocalVariable(name: "factor", arg: 2, scope: !4614, file: !70, line: 4813, type: !733)
!4618 = !DILocation(line: 4813, column: 42, scope: !4614)
!4619 = !DILocation(line: 4815, column: 41, scope: !4614)
!4620 = !DILocation(line: 4815, column: 47, scope: !4614)
!4621 = !DILocation(line: 4815, column: 10, scope: !4614)
!4622 = !DILocation(line: 4815, column: 3, scope: !4614)
!4623 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !70, file: !70, line: 5412, type: !4624, scopeLine: 5413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4624 = !DISubroutineType(types: !4625)
!4625 = !{!733, !733, !733, !733}
!4626 = !DILocalVariable(name: "value", arg: 1, scope: !4623, file: !70, line: 5412, type: !733)
!4627 = !DILocation(line: 5412, column: 40, scope: !4623)
!4628 = !DILocalVariable(name: "factor", arg: 2, scope: !4623, file: !70, line: 5412, type: !733)
!4629 = !DILocation(line: 5412, column: 50, scope: !4623)
!4630 = !DILocalVariable(name: "count", arg: 3, scope: !4623, file: !70, line: 5412, type: !733)
!4631 = !DILocation(line: 5412, column: 62, scope: !4623)
!4632 = !DILocalVariable(name: "u32Temp1", scope: !4623, file: !70, line: 5414, type: !733)
!4633 = !DILocation(line: 5414, column: 6, scope: !4623)
!4634 = !DILocalVariable(name: "u32Temp2", scope: !4623, file: !70, line: 5414, type: !733)
!4635 = !DILocation(line: 5414, column: 17, scope: !4623)
!4636 = !DILocalVariable(name: "u32Temp3", scope: !4623, file: !70, line: 5414, type: !733)
!4637 = !DILocation(line: 5414, column: 26, scope: !4623)
!4638 = !DILocalVariable(name: "u32Temp4", scope: !4623, file: !70, line: 5414, type: !733)
!4639 = !DILocation(line: 5414, column: 35, scope: !4623)
!4640 = !DILocalVariable(name: "u8SignBit", scope: !4623, file: !70, line: 5415, type: !24)
!4641 = !DILocation(line: 5415, column: 5, scope: !4623)
!4642 = !DILocation(line: 5417, column: 25, scope: !4623)
!4643 = !DILocation(line: 5417, column: 32, scope: !4623)
!4644 = !DILocation(line: 5417, column: 13, scope: !4623)
!4645 = !DILocation(line: 5417, column: 11, scope: !4623)
!4646 = !DILocation(line: 5418, column: 13, scope: !4623)
!4647 = !DILocation(line: 5418, column: 26, scope: !4623)
!4648 = !DILocation(line: 5418, column: 31, scope: !4623)
!4649 = !DILocation(line: 5418, column: 22, scope: !4623)
!4650 = !DILocation(line: 5418, column: 11, scope: !4623)
!4651 = !DILocation(line: 5419, column: 9, scope: !4623)
!4652 = !DILocation(line: 5419, column: 2, scope: !4623)
!4653 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !70, file: !70, line: 4837, type: !3076, scopeLine: 4838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4654 = !DILocalVariable(name: "value", arg: 1, scope: !4653, file: !70, line: 4837, type: !733)
!4655 = !DILocation(line: 4837, column: 30, scope: !4653)
!4656 = !DILocalVariable(name: "factor", arg: 2, scope: !4653, file: !70, line: 4837, type: !24)
!4657 = !DILocation(line: 4837, column: 40, scope: !4653)
!4658 = !DILocation(line: 4839, column: 40, scope: !4653)
!4659 = !DILocation(line: 4839, column: 46, scope: !4653)
!4660 = !DILocation(line: 4839, column: 10, scope: !4653)
!4661 = !DILocation(line: 4839, column: 3, scope: !4653)
!4662 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !70, file: !70, line: 5503, type: !4663, scopeLine: 5504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4663 = !DISubroutineType(types: !4664)
!4664 = !{!733, !733, !24, !733}
!4665 = !DILocalVariable(name: "value", arg: 1, scope: !4662, file: !70, line: 5503, type: !733)
!4666 = !DILocation(line: 5503, column: 39, scope: !4662)
!4667 = !DILocalVariable(name: "factor", arg: 2, scope: !4662, file: !70, line: 5503, type: !24)
!4668 = !DILocation(line: 5503, column: 49, scope: !4662)
!4669 = !DILocalVariable(name: "count", arg: 3, scope: !4662, file: !70, line: 5503, type: !733)
!4670 = !DILocation(line: 5503, column: 61, scope: !4662)
!4671 = !DILocalVariable(name: "u32Temp1", scope: !4662, file: !70, line: 5505, type: !733)
!4672 = !DILocation(line: 5505, column: 6, scope: !4662)
!4673 = !DILocalVariable(name: "u32Temp2", scope: !4662, file: !70, line: 5505, type: !733)
!4674 = !DILocation(line: 5505, column: 17, scope: !4662)
!4675 = !DILocation(line: 5507, column: 13, scope: !4662)
!4676 = !DILocation(line: 5507, column: 21, scope: !4662)
!4677 = !DILocation(line: 5507, column: 19, scope: !4662)
!4678 = !DILocation(line: 5507, column: 11, scope: !4662)
!4679 = !DILocation(line: 5508, column: 25, scope: !4662)
!4680 = !DILocation(line: 5508, column: 32, scope: !4662)
!4681 = !DILocation(line: 5508, column: 13, scope: !4662)
!4682 = !DILocation(line: 5508, column: 11, scope: !4662)
!4683 = !DILocation(line: 5509, column: 13, scope: !4662)
!4684 = !DILocation(line: 5509, column: 25, scope: !4662)
!4685 = !DILocation(line: 5509, column: 22, scope: !4662)
!4686 = !DILocation(line: 5509, column: 11, scope: !4662)
!4687 = !DILocation(line: 5510, column: 14, scope: !4662)
!4688 = !DILocation(line: 5510, column: 30, scope: !4662)
!4689 = !DILocation(line: 5510, column: 29, scope: !4662)
!4690 = !DILocation(line: 5510, column: 23, scope: !4662)
!4691 = !DILocation(line: 5510, column: 11, scope: !4662)
!4692 = !DILocation(line: 5511, column: 6, scope: !4693)
!4693 = distinct !DILexicalBlock(scope: !4662, file: !70, line: 5511, column: 5)
!4694 = !DILocation(line: 5511, column: 16, scope: !4693)
!4695 = !DILocation(line: 5511, column: 14, scope: !4693)
!4696 = !DILocation(line: 5511, column: 22, scope: !4693)
!4697 = !DILocation(line: 5511, column: 5, scope: !4662)
!4698 = !DILocation(line: 5513, column: 6, scope: !4699)
!4699 = distinct !DILexicalBlock(scope: !4700, file: !70, line: 5513, column: 6)
!4700 = distinct !DILexicalBlock(scope: !4693, file: !70, line: 5512, column: 2)
!4701 = !DILocation(line: 5513, column: 14, scope: !4699)
!4702 = !DILocation(line: 5513, column: 6, scope: !4700)
!4703 = !DILocation(line: 5514, column: 11, scope: !4699)
!4704 = !DILocation(line: 5514, column: 4, scope: !4699)
!4705 = !DILocation(line: 5516, column: 4, scope: !4699)
!4706 = !DILocation(line: 5520, column: 3, scope: !4707)
!4707 = distinct !DILexicalBlock(scope: !4693, file: !70, line: 5519, column: 2)
!4708 = !DILocation(line: 5522, column: 1, scope: !4662)
!4709 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !70, file: !70, line: 4860, type: !927, scopeLine: 4861, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4710 = !DILocalVariable(name: "value", arg: 1, scope: !4709, file: !70, line: 4860, type: !24)
!4711 = !DILocation(line: 4860, column: 28, scope: !4709)
!4712 = !DILocalVariable(name: "factor", arg: 2, scope: !4709, file: !70, line: 4860, type: !24)
!4713 = !DILocation(line: 4860, column: 38, scope: !4709)
!4714 = !DILocation(line: 4862, column: 38, scope: !4709)
!4715 = !DILocation(line: 4862, column: 44, scope: !4709)
!4716 = !DILocation(line: 4862, column: 10, scope: !4709)
!4717 = !DILocation(line: 4862, column: 3, scope: !4709)
!4718 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !70, file: !70, line: 4883, type: !927, scopeLine: 4884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4719 = !DILocalVariable(name: "value", arg: 1, scope: !4718, file: !70, line: 4883, type: !24)
!4720 = !DILocation(line: 4883, column: 28, scope: !4718)
!4721 = !DILocalVariable(name: "factor", arg: 2, scope: !4718, file: !70, line: 4883, type: !24)
!4722 = !DILocation(line: 4883, column: 38, scope: !4718)
!4723 = !DILocation(line: 4885, column: 38, scope: !4718)
!4724 = !DILocation(line: 4885, column: 44, scope: !4718)
!4725 = !DILocation(line: 4885, column: 10, scope: !4718)
!4726 = !DILocation(line: 4885, column: 3, scope: !4718)
!4727 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !70, file: !70, line: 4907, type: !927, scopeLine: 4908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4728 = !DILocalVariable(name: "value", arg: 1, scope: !4727, file: !70, line: 4907, type: !24)
!4729 = !DILocation(line: 4907, column: 26, scope: !4727)
!4730 = !DILocalVariable(name: "factor", arg: 2, scope: !4727, file: !70, line: 4907, type: !24)
!4731 = !DILocation(line: 4907, column: 36, scope: !4727)
!4732 = !DILocation(line: 4909, column: 38, scope: !4727)
!4733 = !DILocation(line: 4909, column: 44, scope: !4727)
!4734 = !DILocation(line: 4909, column: 10, scope: !4727)
!4735 = !DILocation(line: 4909, column: 3, scope: !4727)
!4736 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !70, file: !70, line: 4931, type: !927, scopeLine: 4932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4737 = !DILocalVariable(name: "value", arg: 1, scope: !4736, file: !70, line: 4931, type: !24)
!4738 = !DILocation(line: 4931, column: 28, scope: !4736)
!4739 = !DILocalVariable(name: "factor", arg: 2, scope: !4736, file: !70, line: 4931, type: !24)
!4740 = !DILocation(line: 4931, column: 38, scope: !4736)
!4741 = !DILocation(line: 4933, column: 41, scope: !4736)
!4742 = !DILocation(line: 4933, column: 47, scope: !4736)
!4743 = !DILocation(line: 4933, column: 10, scope: !4736)
!4744 = !DILocation(line: 4933, column: 3, scope: !4736)
!4745 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !70, file: !70, line: 4955, type: !927, scopeLine: 4956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4746 = !DILocalVariable(name: "value", arg: 1, scope: !4745, file: !70, line: 4955, type: !24)
!4747 = !DILocation(line: 4955, column: 26, scope: !4745)
!4748 = !DILocalVariable(name: "factor", arg: 2, scope: !4745, file: !70, line: 4955, type: !24)
!4749 = !DILocation(line: 4955, column: 36, scope: !4745)
!4750 = !DILocation(line: 4957, column: 41, scope: !4745)
!4751 = !DILocation(line: 4957, column: 47, scope: !4745)
!4752 = !DILocation(line: 4957, column: 10, scope: !4745)
!4753 = !DILocation(line: 4957, column: 3, scope: !4745)
!4754 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !70, file: !70, line: 4978, type: !927, scopeLine: 4979, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4755 = !DILocalVariable(name: "value", arg: 1, scope: !4754, file: !70, line: 4978, type: !24)
!4756 = !DILocation(line: 4978, column: 26, scope: !4754)
!4757 = !DILocalVariable(name: "factor", arg: 2, scope: !4754, file: !70, line: 4978, type: !24)
!4758 = !DILocation(line: 4978, column: 36, scope: !4754)
!4759 = !DILocation(line: 4980, column: 41, scope: !4754)
!4760 = !DILocation(line: 4980, column: 47, scope: !4754)
!4761 = !DILocation(line: 4980, column: 10, scope: !4754)
!4762 = !DILocation(line: 4980, column: 3, scope: !4754)
!4763 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !70, file: !70, line: 5001, type: !927, scopeLine: 5002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4764 = !DILocalVariable(name: "value", arg: 1, scope: !4763, file: !70, line: 5001, type: !24)
!4765 = !DILocation(line: 5001, column: 25, scope: !4763)
!4766 = !DILocalVariable(name: "factor", arg: 2, scope: !4763, file: !70, line: 5001, type: !24)
!4767 = !DILocation(line: 5001, column: 35, scope: !4763)
!4768 = !DILocation(line: 5003, column: 41, scope: !4763)
!4769 = !DILocation(line: 5003, column: 47, scope: !4763)
!4770 = !DILocation(line: 5003, column: 10, scope: !4763)
!4771 = !DILocation(line: 5003, column: 3, scope: !4763)
!4772 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !70, file: !70, line: 5024, type: !927, scopeLine: 5025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4773 = !DILocalVariable(name: "value", arg: 1, scope: !4772, file: !70, line: 5024, type: !24)
!4774 = !DILocation(line: 5024, column: 26, scope: !4772)
!4775 = !DILocalVariable(name: "factor", arg: 2, scope: !4772, file: !70, line: 5024, type: !24)
!4776 = !DILocation(line: 5024, column: 35, scope: !4772)
!4777 = !DILocation(line: 5026, column: 41, scope: !4772)
!4778 = !DILocation(line: 5026, column: 47, scope: !4772)
!4779 = !DILocation(line: 5026, column: 10, scope: !4772)
!4780 = !DILocation(line: 5026, column: 3, scope: !4772)
!4781 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !70, file: !70, line: 5047, type: !927, scopeLine: 5048, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4782 = !DILocalVariable(name: "value", arg: 1, scope: !4781, file: !70, line: 5047, type: !24)
!4783 = !DILocation(line: 5047, column: 25, scope: !4781)
!4784 = !DILocalVariable(name: "factor", arg: 2, scope: !4781, file: !70, line: 5047, type: !24)
!4785 = !DILocation(line: 5047, column: 35, scope: !4781)
!4786 = !DILocation(line: 5049, column: 41, scope: !4781)
!4787 = !DILocation(line: 5049, column: 47, scope: !4781)
!4788 = !DILocation(line: 5049, column: 10, scope: !4781)
!4789 = !DILocation(line: 5049, column: 3, scope: !4781)
!4790 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4791, file: !4791, line: 12, type: !4792, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4795)
!4791 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4792 = !DISubroutineType(types: !4793)
!4793 = !{null, !4794}
!4794 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4795 = !{!4796}
!4796 = !DILocalVariable(name: "z", arg: 1, scope: !4790, file: !4791, line: 12, type: !4794)
!4797 = !DILocation(line: 0, scope: !4790)
!4798 = !DILocation(line: 13, column: 9, scope: !4799)
!4799 = distinct !DILexicalBlock(scope: !4790, file: !4791, line: 13, column: 7)
!4800 = !DILocation(line: 13, column: 7, scope: !4790)
!4801 = !DILocation(line: 14, column: 5, scope: !4799)
!4802 = !DILocation(line: 15, column: 1, scope: !4790)
!4803 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4804, file: !4804, line: 20, type: !4805, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4808)
!4804 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4805 = !DISubroutineType(types: !4806)
!4806 = !{null, !4807, !4807}
!4807 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4808 = !{!4809, !4810}
!4809 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4803, file: !4804, line: 20, type: !4807)
!4810 = !DILocalVariable(name: "shift", arg: 2, scope: !4803, file: !4804, line: 20, type: !4807)
!4811 = !DILocation(line: 0, scope: !4803)
!4812 = !DILocation(line: 21, column: 13, scope: !4813)
!4813 = distinct !DILexicalBlock(scope: !4803, file: !4804, line: 21, column: 7)
!4814 = !DILocation(line: 21, column: 7, scope: !4803)
!4815 = !DILocation(line: 27, column: 5, scope: !4816)
!4816 = distinct !DILexicalBlock(scope: !4813, file: !4804, line: 21, column: 26)
!4817 = !DILocation(line: 29, column: 1, scope: !4803)
