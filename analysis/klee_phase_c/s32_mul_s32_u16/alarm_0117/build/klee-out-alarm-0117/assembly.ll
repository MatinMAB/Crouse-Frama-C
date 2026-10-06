; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117/build/s32_mul_s32_u16_alarm_0117.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [77 x i8] c"KLEE-ALARM-0117: signed overflow. assert -2147483648 <= value * (s32)factor;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0117.err\00", align 1
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
  br i1 %cmp, label %if.then, label %if.else24, !dbg !789

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !790
  %cmp3 = icmp slt i32 %2, 0, !dbg !793
  br i1 %cmp3, label %if.then5, label %if.else15, !dbg !794

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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 771, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !816
  unreachable, !dbg !816

if.end:                                           ; preds = %if.else
  %9 = load i32, i32* %value.addr, align 4, !dbg !818
  %10 = load i16, i16* %factor.addr, align 2, !dbg !819
  %conv13 = zext i16 %10 to i32, !dbg !820
  %mul = mul nsw i32 %9, %conv13, !dbg !821
  %conv14 = sext i32 %mul to i64, !dbg !822
  store volatile i64 %conv14, i64* @klee_alarm_sink_s64, align 8, !dbg !823
  store i32 0, i32* %retval, align 4, !dbg !824
  br label %return, !dbg !824

if.else15:                                        ; preds = %if.then
  %11 = load i16, i16* %factor.addr, align 2, !dbg !825
  %conv16 = zext i16 %11 to i32, !dbg !825
  %int_cast_to_i641 = zext i32 %conv16 to i64, !dbg !828
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !828
  %div17 = udiv i32 2147483647, %conv16, !dbg !828, !klee.check.div !258
  %12 = load i32, i32* %value.addr, align 4, !dbg !829
  %cmp18 = icmp ule i32 %div17, %12, !dbg !830
  br i1 %cmp18, label %if.then20, label %if.else21, !dbg !831

if.then20:                                        ; preds = %if.else15
  store i32 2147483647, i32* %retval, align 4, !dbg !832
  br label %return, !dbg !832

if.else21:                                        ; preds = %if.else15
  %13 = load i32, i32* %value.addr, align 4, !dbg !834
  %14 = load i16, i16* %factor.addr, align 2, !dbg !836
  %conv22 = zext i16 %14 to i32, !dbg !836
  %mul23 = mul nsw i32 %13, %conv22, !dbg !837
  store i32 %mul23, i32* %retval, align 4, !dbg !838
  br label %return, !dbg !838

if.else24:                                        ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !839
  br label %return, !dbg !839

return:                                           ; preds = %if.else24, %if.else21, %if.then20, %if.end, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !841
  ret i32 %15, !dbg !841
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !842 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !845, metadata !DIExpression()), !dbg !846
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !847, metadata !DIExpression()), !dbg !848
  %0 = load i64, i64* %left.addr, align 8, !dbg !849
  %1 = load i64, i64* %right.addr, align 8, !dbg !850
  %mul = mul nsw i64 %0, %1, !dbg !851
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !852
  %conv = zext i1 %cmp to i32, !dbg !852
  ret i32 %conv, !dbg !853
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %value, i8 zeroext %factor, i16 zeroext %count) #0 !dbg !854 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i16, align 2
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !857, metadata !DIExpression()), !dbg !858
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !859, metadata !DIExpression()), !dbg !860
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !861, metadata !DIExpression()), !dbg !862
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
  %3 = load i16, i16* %count.addr, align 2, !dbg !870
  %conv4 = zext i16 %3 to i32, !dbg !870
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !871
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !871
  %div = sdiv i32 %conv3, %conv4, !dbg !871, !klee.check.div !258
  %conv5 = trunc i32 %div to i16, !dbg !869
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !872
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !873
  %conv6 = trunc i16 %4 to i8, !dbg !874
  ret i8 %conv6, !dbg !875
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %value, i8 zeroext %factor, i8 zeroext %count) #0 !dbg !876 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !879, metadata !DIExpression()), !dbg !880
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !881, metadata !DIExpression()), !dbg !882
  store i8 %count, i8* %count.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %count.addr, metadata !883, metadata !DIExpression()), !dbg !884
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !885, metadata !DIExpression()), !dbg !886
  store i16 0, i16* %u16MulTemp, align 2, !dbg !886
  %0 = load i8, i8* %value.addr, align 1, !dbg !887
  %conv = zext i8 %0 to i32, !dbg !887
  %1 = load i8, i8* %factor.addr, align 1, !dbg !888
  %conv1 = zext i8 %1 to i32, !dbg !888
  %mul = mul nsw i32 %conv, %conv1, !dbg !889
  %conv2 = trunc i32 %mul to i16, !dbg !887
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !890
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !891
  %conv3 = zext i16 %2 to i32, !dbg !891
  %3 = load i8, i8* %count.addr, align 1, !dbg !892
  %conv4 = zext i8 %3 to i32, !dbg !892
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !893
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !893
  %div = sdiv i32 %conv3, %conv4, !dbg !893, !klee.check.div !258
  %conv5 = trunc i32 %div to i16, !dbg !891
  store i16 %conv5, i16* %u16MulTemp, align 2, !dbg !894
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !895
  %conv6 = zext i16 %4 to i32, !dbg !895
  %cmp = icmp sle i32 %conv6, 255, !dbg !897
  br i1 %cmp, label %if.then, label %if.else, !dbg !898

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %u16MulTemp, align 2, !dbg !899
  %conv8 = zext i16 %5 to i32, !dbg !899
  %and = and i32 %conv8, 255, !dbg !901
  %conv9 = trunc i32 %and to i8, !dbg !899
  store i8 %conv9, i8* %retval, align 1, !dbg !902
  br label %return, !dbg !902

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !903
  br label %return, !dbg !903

return:                                           ; preds = %if.else, %if.then
  %6 = load i8, i8* %retval, align 1, !dbg !905
  ret i8 %6, !dbg !905
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac1(i8 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !906 {
entry:
  %x_value.addr = alloca i8, align 1
  %y_value.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %x_value, i8* %x_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %x_value.addr, metadata !909, metadata !DIExpression()), !dbg !910
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !911, metadata !DIExpression()), !dbg !912
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !913, metadata !DIExpression()), !dbg !914
  store i16 0, i16* %u16MulTemp, align 2, !dbg !914
  %0 = load i8, i8* %x_value.addr, align 1, !dbg !915
  %conv = zext i8 %0 to i32, !dbg !915
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !916
  %conv1 = zext i8 %1 to i32, !dbg !916
  %mul = mul nsw i32 %conv, %conv1, !dbg !917
  %conv2 = trunc i32 %mul to i16, !dbg !915
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !918
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !919
  %conv3 = zext i16 %2 to i32, !dbg !919
  %shr = ashr i32 %conv3, 8, !dbg !920
  %conv4 = trunc i32 %shr to i16, !dbg !919
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !921
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !922
  %conv5 = trunc i16 %3 to i8, !dbg !923
  ret i8 %conv5, !dbg !924
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac2(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !925 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %u16MulTemp = alloca i16, align 2
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !926, metadata !DIExpression()), !dbg !927
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !928, metadata !DIExpression()), !dbg !929
  call void @llvm.dbg.declare(metadata i16* %u16MulTemp, metadata !930, metadata !DIExpression()), !dbg !931
  store i16 0, i16* %u16MulTemp, align 2, !dbg !931
  %0 = load i8, i8* %value.addr, align 1, !dbg !932
  %conv = zext i8 %0 to i32, !dbg !932
  %1 = load i8, i8* %factor.addr, align 1, !dbg !933
  %conv1 = zext i8 %1 to i32, !dbg !933
  %mul = mul nsw i32 %conv, %conv1, !dbg !934
  %conv2 = trunc i32 %mul to i16, !dbg !932
  store i16 %conv2, i16* %u16MulTemp, align 2, !dbg !935
  %2 = load i16, i16* %u16MulTemp, align 2, !dbg !936
  %conv3 = zext i16 %2 to i32, !dbg !936
  %shr = ashr i32 %conv3, 7, !dbg !937
  %conv4 = trunc i32 %shr to i16, !dbg !936
  store i16 %conv4, i16* %u16MulTemp, align 2, !dbg !938
  %3 = load i16, i16* %u16MulTemp, align 2, !dbg !939
  %conv5 = zext i16 %3 to i32, !dbg !939
  %cmp = icmp slt i32 %conv5, 255, !dbg !941
  br i1 %cmp, label %if.then, label %if.else, !dbg !942

if.then:                                          ; preds = %entry
  %4 = load i16, i16* %u16MulTemp, align 2, !dbg !943
  %conv7 = trunc i16 %4 to i8, !dbg !945
  store i8 %conv7, i8* %retval, align 1, !dbg !946
  br label %return, !dbg !946

if.else:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !947
  br label %return, !dbg !947

return:                                           ; preds = %if.else, %if.then
  %5 = load i8, i8* %retval, align 1, !dbg !949
  ret i8 %5, !dbg !949
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !950 {
entry:
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
  %shr = lshr i32 %2, 16, !dbg !964
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !965
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !966
  %conv2 = trunc i32 %3 to i16, !dbg !967
  ret i16 %conv2, !dbg !968
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !969 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !970, metadata !DIExpression()), !dbg !971
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !972, metadata !DIExpression()), !dbg !973
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !974, metadata !DIExpression()), !dbg !975
  store i32 0, i32* %u32MulTemp, align 4, !dbg !975
  %0 = load i16, i16* %value.addr, align 2, !dbg !976
  %conv = zext i16 %0 to i32, !dbg !976
  %1 = load i16, i16* %factor.addr, align 2, !dbg !977
  %conv1 = zext i16 %1 to i32, !dbg !977
  %mul = mul nsw i32 %conv, %conv1, !dbg !978
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !979
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !980
  %shr = lshr i32 %2, 8, !dbg !981
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !982
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !983
  %cmp = icmp ult i32 %3, 65535, !dbg !985
  br i1 %cmp, label %if.then, label %if.else, !dbg !986

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !987
  %and = and i32 %4, 65535, !dbg !989
  %conv3 = trunc i32 %and to i16, !dbg !990
  store i16 %conv3, i16* %retval, align 2, !dbg !991
  br label %return, !dbg !991

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !992
  br label %return, !dbg !992

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !994
  ret i16 %5, !dbg !994
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac1(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !995 {
entry:
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
  %shr = lshr i32 %2, 8, !dbg !1009
  %and = and i32 %shr, 65535, !dbg !1010
  store i32 %and, i32* %u32MulTemp, align 4, !dbg !1011
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1012
  %conv2 = trunc i32 %3 to i16, !dbg !1012
  ret i16 %conv2, !dbg !1013
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac2(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !1014 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1015, metadata !DIExpression()), !dbg !1016
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !1017, metadata !DIExpression()), !dbg !1018
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1019, metadata !DIExpression()), !dbg !1020
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1020
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1021
  %conv = zext i16 %0 to i32, !dbg !1021
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !1022
  %conv1 = zext i8 %1 to i32, !dbg !1022
  %mul = mul nsw i32 %conv, %conv1, !dbg !1023
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1024
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1025
  %shr = lshr i32 %2, 7, !dbg !1026
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1027
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1028
  %cmp = icmp ult i32 %3, 65535, !dbg !1030
  br i1 %cmp, label %if.then, label %if.else, !dbg !1031

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1032
  %and = and i32 %4, 65535, !dbg !1034
  %conv3 = trunc i32 %and to i16, !dbg !1035
  store i16 %conv3, i16* %retval, align 2, !dbg !1036
  br label %return, !dbg !1036

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1037
  br label %return, !dbg !1037

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1039
  ret i16 %5, !dbg !1039
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %value, i16 zeroext %factor, i32 %count) #0 !dbg !1040 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1043, metadata !DIExpression()), !dbg !1044
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1045, metadata !DIExpression()), !dbg !1046
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1047, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1050
  %0 = load i16, i16* %value.addr, align 2, !dbg !1051
  %conv = zext i16 %0 to i32, !dbg !1051
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1052
  %conv1 = zext i16 %1 to i32, !dbg !1052
  %mul = mul nsw i32 %conv, %conv1, !dbg !1053
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1054
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1055
  %3 = load i32, i32* %count.addr, align 4, !dbg !1056
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !1057
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1057
  %div = udiv i32 %2, %3, !dbg !1057, !klee.check.div !258
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1058
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1059
  %and = and i32 %4, 65535, !dbg !1060
  %conv2 = trunc i32 %and to i16, !dbg !1061
  ret i16 %conv2, !dbg !1062
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !1063 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !1066, metadata !DIExpression()), !dbg !1067
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1068, metadata !DIExpression()), !dbg !1069
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !1070, metadata !DIExpression()), !dbg !1071
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1072, metadata !DIExpression()), !dbg !1073
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1073
  %0 = load i16, i16* %value.addr, align 2, !dbg !1074
  %conv = zext i16 %0 to i32, !dbg !1074
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1075
  %conv1 = zext i16 %1 to i32, !dbg !1075
  %mul = mul nsw i32 %conv, %conv1, !dbg !1076
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1077
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1078
  %3 = load i16, i16* %count.addr, align 2, !dbg !1079
  %conv2 = zext i16 %3 to i32, !dbg !1079
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1080
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1080
  %div = udiv i32 %2, %conv2, !dbg !1080, !klee.check.div !258
  store i32 %div, i32* %u32MulTemp, align 4, !dbg !1081
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1082
  %cmp = icmp ule i32 %4, 65535, !dbg !1084
  br i1 %cmp, label %if.then, label %if.else, !dbg !1085

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %u32MulTemp, align 4, !dbg !1086
  %and = and i32 %5, 65535, !dbg !1088
  %conv4 = trunc i32 %and to i16, !dbg !1089
  store i16 %conv4, i16* %retval, align 2, !dbg !1090
  br label %return, !dbg !1090

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1091
  br label %return, !dbg !1091

return:                                           ; preds = %if.else, %if.then
  %6 = load i16, i16* %retval, align 2, !dbg !1093
  ret i16 %6, !dbg !1093
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1094 {
entry:
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
  %shr = lshr i32 %2, 16, !dbg !1106
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1107
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1108
  %and = and i32 65535, %3, !dbg !1109
  %conv2 = trunc i32 %and to i16, !dbg !1110
  ret i16 %conv2, !dbg !1111
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1112 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1113, metadata !DIExpression()), !dbg !1114
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1115, metadata !DIExpression()), !dbg !1116
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !1117, metadata !DIExpression()), !dbg !1118
  store i32 0, i32* %u32MulTemp, align 4, !dbg !1118
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1119
  %conv = zext i16 %0 to i32, !dbg !1119
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1120
  %conv1 = zext i16 %1 to i32, !dbg !1120
  %mul = mul nsw i32 %conv, %conv1, !dbg !1121
  store i32 %mul, i32* %u32MulTemp, align 4, !dbg !1122
  %2 = load i32, i32* %u32MulTemp, align 4, !dbg !1123
  %shr = lshr i32 %2, 15, !dbg !1124
  store i32 %shr, i32* %u32MulTemp, align 4, !dbg !1125
  %3 = load i32, i32* %u32MulTemp, align 4, !dbg !1126
  %cmp = icmp ule i32 %3, 65535, !dbg !1128
  br i1 %cmp, label %if.then, label %if.else, !dbg !1129

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %u32MulTemp, align 4, !dbg !1130
  %and = and i32 %4, 65535, !dbg !1132
  %conv3 = trunc i32 %and to i16, !dbg !1133
  store i16 %conv3, i16* %retval, align 2, !dbg !1134
  br label %return, !dbg !1134

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1135
  br label %return, !dbg !1135

return:                                           ; preds = %if.else, %if.then
  %5 = load i16, i16* %retval, align 2, !dbg !1137
  ret i16 %5, !dbg !1137
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1138 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1141, metadata !DIExpression()), !dbg !1142
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1145, metadata !DIExpression()), !dbg !1146
  store i32 0, i32* %u32Temp1, align 4, !dbg !1146
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1147
  %conv = zext i16 %0 to i32, !dbg !1147
  %cmp = icmp sgt i32 %conv, 0, !dbg !1149
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1150

if.then:                                          ; preds = %entry
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1151
  %conv2 = zext i16 %1 to i32, !dbg !1151
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1153
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1153
  %div = udiv i32 -1, %conv2, !dbg !1153, !klee.check.div !258
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1154
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1155
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !1157
  %cmp3 = icmp ult i32 %2, %3, !dbg !1158
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !1159

if.then5:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1160
  br label %return, !dbg !1160

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !1162
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !1164
  %conv6 = zext i16 %5 to i32, !dbg !1164
  %mul = mul i32 %4, %conv6, !dbg !1165
  store i32 %mul, i32* %retval, align 4, !dbg !1166
  br label %return, !dbg !1166

if.else7:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1167
  br label %return, !dbg !1167

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %6 = load i32, i32* %retval, align 4, !dbg !1169
  ret i32 %6, !dbg !1169
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !1170 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1173, metadata !DIExpression()), !dbg !1174
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1175, metadata !DIExpression()), !dbg !1176
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !1177, metadata !DIExpression()), !dbg !1178
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1179, metadata !DIExpression()), !dbg !1180
  store i32 0, i32* %u32Temp1, align 4, !dbg !1180
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1181, metadata !DIExpression()), !dbg !1182
  store i32 0, i32* %u32Temp2, align 4, !dbg !1182
  %0 = load i32, i32* %value.addr, align 4, !dbg !1183
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1184
  %conv = zext i16 %1 to i32, !dbg !1184
  %mul = mul i32 %0, %conv, !dbg !1185
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1186
  %2 = load i32, i32* %value.addr, align 4, !dbg !1187
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1188
  %conv1 = zext i16 %3 to i32, !dbg !1188
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1189
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1190
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1191
  %5 = load i32, i32* %count.addr, align 4, !dbg !1192
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1193
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !1193
  %shr = lshr i32 %4, %5, !dbg !1193, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1194
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1195
  %7 = load i32, i32* %count.addr, align 4, !dbg !1196
  %sub = sub i32 32, %7, !dbg !1197
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1198
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1198
  %shl = shl i32 %6, %sub, !dbg !1198, !klee.check.shift !258
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1199
  %or = or i32 %8, %shl, !dbg !1199
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1199
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1200
  %10 = load i32, i32* %count.addr, align 4, !dbg !1202
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1203
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1203
  %shr2 = lshr i32 %9, %10, !dbg !1203, !klee.check.shift !258
  %cmp = icmp eq i32 %shr2, 0, !dbg !1204
  br i1 %cmp, label %if.then, label %if.else, !dbg !1205

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1206
  store i32 %11, i32* %retval, align 4, !dbg !1208
  br label %return, !dbg !1208

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1209
  br label %return, !dbg !1209

return:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !1211
  ret i32 %12, !dbg !1211
}

declare dso_local i32 @MulHighWord(i32, i32) #2

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_cal1_u8_u8_s8(i8 zeroext %val1, i8 zeroext %val2, i8 signext %factor) #0 !dbg !1212 {
entry:
  %retval = alloca i8, align 1
  %val1.addr = alloca i8, align 1
  %val2.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s16Temp1 = alloca i16, align 2
  store i8 %val1, i8* %val1.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val1.addr, metadata !1215, metadata !DIExpression()), !dbg !1216
  store i8 %val2, i8* %val2.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %val2.addr, metadata !1217, metadata !DIExpression()), !dbg !1218
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1219, metadata !DIExpression()), !dbg !1220
  call void @llvm.dbg.declare(metadata i16* %s16Temp1, metadata !1221, metadata !DIExpression()), !dbg !1222
  store i16 0, i16* %s16Temp1, align 2, !dbg !1222
  %0 = load i8, i8* %val1.addr, align 1, !dbg !1223
  %conv = zext i8 %0 to i32, !dbg !1223
  %1 = load i8, i8* %val2.addr, align 1, !dbg !1224
  %conv1 = zext i8 %1 to i32, !dbg !1224
  %sub = sub nsw i32 %conv, %conv1, !dbg !1225
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1226
  %conv2 = sext i8 %2 to i32, !dbg !1226
  %mul = mul nsw i32 %sub, %conv2, !dbg !1227
  %div = sdiv i32 %mul, 32, !dbg !1228
  %3 = load i8, i8* %val2.addr, align 1, !dbg !1229
  %conv3 = zext i8 %3 to i32, !dbg !1229
  %add = add nsw i32 %div, %conv3, !dbg !1230
  %conv4 = trunc i32 %add to i16, !dbg !1231
  store i16 %conv4, i16* %s16Temp1, align 2, !dbg !1232
  %4 = load i16, i16* %s16Temp1, align 2, !dbg !1233
  %conv5 = sext i16 %4 to i32, !dbg !1233
  %cmp = icmp slt i32 %conv5, 255, !dbg !1235
  br i1 %cmp, label %if.then, label %if.else12, !dbg !1236

if.then:                                          ; preds = %entry
  %5 = load i16, i16* %s16Temp1, align 2, !dbg !1237
  %conv7 = sext i16 %5 to i32, !dbg !1237
  %cmp8 = icmp sgt i32 %conv7, 0, !dbg !1240
  br i1 %cmp8, label %if.then10, label %if.else, !dbg !1241

if.then10:                                        ; preds = %if.then
  %6 = load i16, i16* %s16Temp1, align 2, !dbg !1242
  %conv11 = trunc i16 %6 to i8, !dbg !1244
  store i8 %conv11, i8* %retval, align 1, !dbg !1245
  br label %return, !dbg !1245

if.else:                                          ; preds = %if.then
  store i8 0, i8* %retval, align 1, !dbg !1246
  br label %return, !dbg !1246

if.else12:                                        ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !1248
  br label %return, !dbg !1248

return:                                           ; preds = %if.else12, %if.else, %if.then10
  %7 = load i8, i8* %retval, align 1, !dbg !1250
  ret i8 %7, !dbg !1250
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_cal1_u16_u16_s8(i16 zeroext %val1, i16 zeroext %val2, i8 signext %factor) #0 !dbg !1251 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1254, metadata !DIExpression()), !dbg !1255
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1256, metadata !DIExpression()), !dbg !1257
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !1258, metadata !DIExpression()), !dbg !1259
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1260, metadata !DIExpression()), !dbg !1261
  store i32 0, i32* %s32Temp1, align 4, !dbg !1261
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1262
  %conv = zext i16 %0 to i32, !dbg !1262
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1263
  %conv1 = zext i16 %1 to i32, !dbg !1263
  %sub = sub nsw i32 %conv, %conv1, !dbg !1264
  %2 = load i8, i8* %factor.addr, align 1, !dbg !1265
  %conv2 = sext i8 %2 to i32, !dbg !1265
  %mul = mul nsw i32 %sub, %conv2, !dbg !1266
  %div = sdiv i32 %mul, 32, !dbg !1267
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1268
  %conv3 = zext i16 %3 to i32, !dbg !1268
  %add = add nsw i32 %div, %conv3, !dbg !1269
  store i32 %add, i32* %s32Temp1, align 4, !dbg !1270
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1271
  %cmp = icmp slt i32 %4, 65535, !dbg !1273
  br i1 %cmp, label %if.then, label %if.else9, !dbg !1274

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1275
  %cmp5 = icmp sgt i32 %5, 0, !dbg !1278
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !1279

if.then7:                                         ; preds = %if.then
  %6 = load i32, i32* %s32Temp1, align 4, !dbg !1280
  %conv8 = trunc i32 %6 to i16, !dbg !1282
  store i16 %conv8, i16* %retval, align 2, !dbg !1283
  br label %return, !dbg !1283

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !1284
  br label %return, !dbg !1284

if.else9:                                         ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1286
  br label %return, !dbg !1286

return:                                           ; preds = %if.else9, %if.else, %if.then7
  %7 = load i16, i16* %retval, align 2, !dbg !1288
  ret i16 %7, !dbg !1288
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16(i16 zeroext %val1, i16 zeroext %val2) #0 !dbg !1289 {
entry:
  %retval = alloca i16, align 2
  %val1.addr = alloca i16, align 2
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %val1, i16* %val1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val1.addr, metadata !1290, metadata !DIExpression()), !dbg !1291
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1292, metadata !DIExpression()), !dbg !1293
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1294, metadata !DIExpression()), !dbg !1295
  store i32 0, i32* %u32Temp1, align 4, !dbg !1295
  %0 = load i16, i16* %val1.addr, align 2, !dbg !1296
  %conv = zext i16 %0 to i32, !dbg !1296
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1297
  %conv1 = zext i16 %1 to i32, !dbg !1297
  %mul = mul nsw i32 %conv, %conv1, !dbg !1298
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1299
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1300
  %cmp = icmp ule i32 %2, 65535, !dbg !1302
  br i1 %cmp, label %if.then, label %if.else, !dbg !1303

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1304
  %and = and i32 %3, 65535, !dbg !1306
  %conv3 = trunc i32 %and to i16, !dbg !1307
  store i16 %conv3, i16* %retval, align 2, !dbg !1308
  br label %return, !dbg !1308

if.else:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !1309
  br label %return, !dbg !1309

return:                                           ; preds = %if.else, %if.then
  %4 = load i16, i16* %retval, align 2, !dbg !1311
  ret i16 %4, !dbg !1311
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u16_u16(i16 zeroext %x_value, i16 zeroext %y_value) #0 !dbg !1312 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1315, metadata !DIExpression()), !dbg !1316
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1317, metadata !DIExpression()), !dbg !1318
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1319, metadata !DIExpression()), !dbg !1320
  store i32 0, i32* %u32Temp1, align 4, !dbg !1320
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1321
  %conv = zext i16 %0 to i32, !dbg !1321
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1322
  %conv1 = zext i16 %1 to i32, !dbg !1322
  %mul = mul nsw i32 %conv, %conv1, !dbg !1323
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1324
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1325
  ret i32 %2, !dbg !1326
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s16_s16(i16 signext %x_value, i16 signext %y_value) #0 !dbg !1327 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !1330, metadata !DIExpression()), !dbg !1331
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1332, metadata !DIExpression()), !dbg !1333
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1334, metadata !DIExpression()), !dbg !1335
  store i32 0, i32* %s32Temp1, align 4, !dbg !1335
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !1336
  %conv = sext i16 %0 to i32, !dbg !1336
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !1337
  %conv1 = sext i16 %1 to i32, !dbg !1337
  %mul = mul nsw i32 %conv, %conv1, !dbg !1338
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1339
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1340
  ret i32 %2, !dbg !1341
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1342 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1345, metadata !DIExpression()), !dbg !1346
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1347, metadata !DIExpression()), !dbg !1348
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1349, metadata !DIExpression()), !dbg !1350
  store i32 0, i32* %s32Temp1, align 4, !dbg !1350
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1351
  %cmp = icmp sgt i32 %0, 0, !dbg !1353
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1354

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1355
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1357
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1357
  %div = udiv i32 -1, %1, !dbg !1357, !klee.check.div !258
  store i32 %div, i32* %s32Temp1, align 4, !dbg !1358
  %2 = load i32, i32* %s32Temp1, align 4, !dbg !1359
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1361
  %cmp1 = icmp ult i32 %2, %3, !dbg !1362
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1363

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1364
  br label %return, !dbg !1364

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1366
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1368
  %mul = mul i32 %4, %5, !dbg !1369
  store i32 %mul, i32* %retval, align 4, !dbg !1370
  br label %return, !dbg !1370

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1371
  br label %return, !dbg !1371

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1373
  ret i32 %6, !dbg !1373
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !1374 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1377, metadata !DIExpression()), !dbg !1378
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1379, metadata !DIExpression()), !dbg !1380
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1381, metadata !DIExpression()), !dbg !1382
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1383, metadata !DIExpression()), !dbg !1384
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1385, metadata !DIExpression()), !dbg !1386
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1387, metadata !DIExpression()), !dbg !1388
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1389
  %cmp = icmp slt i32 %0, 0, !dbg !1391
  br i1 %cmp, label %if.then, label %if.else, !dbg !1392

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1393
  %sub = sub nsw i32 0, %1, !dbg !1394
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1395
  br label %if.end, !dbg !1396

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1397
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1398
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1399
  %cmp1 = icmp slt i32 %3, 0, !dbg !1401
  br i1 %cmp1, label %if.then2, label %if.else4, !dbg !1402

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %val2.addr, align 4, !dbg !1403
  %sub3 = sub nsw i32 0, %4, !dbg !1404
  store i32 %sub3, i32* %u32Temp2, align 4, !dbg !1405
  br label %if.end5, !dbg !1406

if.else4:                                         ; preds = %if.end
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1407
  store i32 %5, i32* %u32Temp2, align 4, !dbg !1408
  br label %if.end5

if.end5:                                          ; preds = %if.else4, %if.then2
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1409
  %cmp6 = icmp slt i32 %6, 0, !dbg !1411
  %7 = load i32, i32* %val2.addr, align 4
  %cmp7 = icmp sgt i32 %7, 0
  %or.cond = select i1 %cmp6, i1 %cmp7, i1 false, !dbg !1412
  br i1 %or.cond, label %if.then11, label %lor.lhs.false, !dbg !1412

lor.lhs.false:                                    ; preds = %if.end5
  %8 = load i32, i32* %val1.addr, align 4, !dbg !1413
  %cmp8 = icmp sgt i32 %8, 0, !dbg !1414
  %9 = load i32, i32* %val2.addr, align 4
  %cmp10 = icmp slt i32 %9, 0
  %or.cond1 = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !1415
  br i1 %or.cond1, label %if.then11, label %if.else12, !dbg !1415

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  store i8 1, i8* %u8SignBit, align 1, !dbg !1416
  br label %if.end13, !dbg !1417

if.else12:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1418
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1419
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1420
  %call = call i32 @u32_mul_u32_u32(i32 %10, i32 %11), !dbg !1421
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1422
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !1423
  %conv = zext i8 %12 to i32, !dbg !1423
  %cmp14 = icmp eq i32 %conv, 1, !dbg !1425
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !1426

if.then16:                                        ; preds = %if.end13
  store i32 0, i32* %retval, align 4, !dbg !1427
  br label %return, !dbg !1427

if.else17:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !1429
  store i32 %13, i32* %retval, align 4, !dbg !1431
  br label %return, !dbg !1431

return:                                           ; preds = %if.else17, %if.then16
  %14 = load i32, i32* %retval, align 4, !dbg !1432
  ret i32 %14, !dbg !1432
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32(i32 %val1, i32 %val2) #0 !dbg !1433 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1436, metadata !DIExpression()), !dbg !1437
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1438, metadata !DIExpression()), !dbg !1439
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1440, metadata !DIExpression()), !dbg !1441
  store i32 0, i32* %u32Temp1, align 4, !dbg !1441
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1442
  %cmp = icmp ne i32 %0, 0, !dbg !1444
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1445

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1446
  %int_cast_to_i64 = zext i32 %1 to i64, !dbg !1448
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1448
  %div = udiv i32 -1, %1, !dbg !1448, !klee.check.div !258
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1449
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !1450
  %3 = load i32, i32* %val1.addr, align 4, !dbg !1452
  %cmp1 = icmp ult i32 %2, %3, !dbg !1453
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1454

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1455
  br label %return, !dbg !1455

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1457
  %5 = load i32, i32* %val2.addr, align 4, !dbg !1459
  %mul = mul i32 %4, %5, !dbg !1460
  store i32 %mul, i32* %retval, align 4, !dbg !1461
  br label %return, !dbg !1461

if.else3:                                         ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1462
  br label %return, !dbg !1462

return:                                           ; preds = %if.else3, %if.else, %if.then2
  %6 = load i32, i32* %retval, align 4, !dbg !1464
  ret i32 %6, !dbg !1464
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac1(i32 %value, i16 zeroext %factor) #0 !dbg !1465 {
entry:
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
  %shr = lshr i32 %4, 16, !dbg !1483
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1484
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1485
  %shl = shl i32 %5, 16, !dbg !1486
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1487
  %or = or i32 %6, %shl, !dbg !1487
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1487
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  ret i32 %7, !dbg !1489
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac2(i32 %value, i16 zeroext %factor) #0 !dbg !1490 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1491, metadata !DIExpression()), !dbg !1492
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1493, metadata !DIExpression()), !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 0, i32* %u32Temp1, align 4, !dbg !1496
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 0, i32* %u32Temp2, align 4, !dbg !1498
  %0 = load i32, i32* %value.addr, align 4, !dbg !1499
  %1 = load i16, i16* %factor.addr, align 2, !dbg !1500
  %conv = zext i16 %1 to i32, !dbg !1500
  %mul = mul i32 %0, %conv, !dbg !1501
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1502
  %2 = load i32, i32* %value.addr, align 4, !dbg !1503
  %3 = load i16, i16* %factor.addr, align 2, !dbg !1504
  %conv1 = zext i16 %3 to i32, !dbg !1504
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !1505
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1506
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1507
  %shr = lshr i32 %4, 15, !dbg !1508
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1509
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1510
  %shl = shl i32 %5, 17, !dbg !1511
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1512
  %or = or i32 %6, %shl, !dbg !1512
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1512
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1513
  %shr2 = lshr i32 %7, 15, !dbg !1515
  %cmp = icmp eq i32 %shr2, 0, !dbg !1516
  br i1 %cmp, label %if.then, label %if.else, !dbg !1517

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1518
  store i32 %8, i32* %retval, align 4, !dbg !1520
  br label %return, !dbg !1520

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1521
  br label %return, !dbg !1521

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1523
  ret i32 %9, !dbg !1523
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac1(i32 %value, i16 signext %factor) #0 !dbg !1524 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1527, metadata !DIExpression()), !dbg !1528
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1529, metadata !DIExpression()), !dbg !1530
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1531, metadata !DIExpression()), !dbg !1532
  store i32 0, i32* %u32Temp1, align 4, !dbg !1532
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1533, metadata !DIExpression()), !dbg !1534
  store i32 0, i32* %u32Temp2, align 4, !dbg !1534
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1535
  %conv = sext i16 %0 to i32, !dbg !1535
  %cmp = icmp sgt i32 %conv, 0, !dbg !1537
  br i1 %cmp, label %if.then, label %if.else, !dbg !1538

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1539
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1541
  %conv2 = sext i16 %2 to i32, !dbg !1541
  %mul = mul i32 %1, %conv2, !dbg !1542
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1543
  %3 = load i32, i32* %value.addr, align 4, !dbg !1544
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1545
  %conv3 = sext i16 %4 to i32, !dbg !1545
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1546
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1547
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1548
  %shr = lshr i32 %5, 15, !dbg !1549
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1550
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1551
  %shl = shl i32 %6, 17, !dbg !1552
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1553
  %or = or i32 %7, %shl, !dbg !1553
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1553
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1554
  store i32 %8, i32* %retval, align 4, !dbg !1555
  br label %return, !dbg !1555

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1556
  br label %return, !dbg !1556

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1558
  ret i32 %9, !dbg !1558
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac2(i32 %value, i16 signext %factor) #0 !dbg !1559 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1560, metadata !DIExpression()), !dbg !1561
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !1562, metadata !DIExpression()), !dbg !1563
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1564, metadata !DIExpression()), !dbg !1565
  store i32 0, i32* %u32Temp1, align 4, !dbg !1565
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1566, metadata !DIExpression()), !dbg !1567
  store i32 0, i32* %u32Temp2, align 4, !dbg !1567
  %0 = load i16, i16* %factor.addr, align 2, !dbg !1568
  %conv = sext i16 %0 to i32, !dbg !1568
  %cmp = icmp sle i32 %conv, 0, !dbg !1570
  br i1 %cmp, label %if.then, label %if.else, !dbg !1571

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1572
  br label %return, !dbg !1572

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1574
  %2 = load i16, i16* %factor.addr, align 2, !dbg !1576
  %conv2 = sext i16 %2 to i32, !dbg !1576
  %mul = mul i32 %1, %conv2, !dbg !1577
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1578
  %3 = load i32, i32* %value.addr, align 4, !dbg !1579
  %4 = load i16, i16* %factor.addr, align 2, !dbg !1580
  %conv3 = sext i16 %4 to i32, !dbg !1580
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !1581
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1582
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1583
  %shr = lshr i32 %5, 14, !dbg !1584
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1585
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1586
  %shl = shl i32 %6, 18, !dbg !1587
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1588
  %or = or i32 %7, %shl, !dbg !1588
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1588
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1589
  %shr4 = lshr i32 %8, 14, !dbg !1591
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !1592
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !1593

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1594
  store i32 %9, i32* %retval, align 4, !dbg !1596
  br label %return, !dbg !1596

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1597
  br label %return, !dbg !1597

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1599
  ret i32 %10, !dbg !1599
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac1(i32 %value, i32 %factor) #0 !dbg !1600 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1601, metadata !DIExpression()), !dbg !1602
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1603, metadata !DIExpression()), !dbg !1604
  %0 = load i32, i32* %value.addr, align 4, !dbg !1605
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1606
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !1607
  ret i32 %call, !dbg !1608
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac2(i32 %value, i32 %factor) #0 !dbg !1609 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1610, metadata !DIExpression()), !dbg !1611
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1612, metadata !DIExpression()), !dbg !1613
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1614, metadata !DIExpression()), !dbg !1615
  store i32 0, i32* %u32Temp1, align 4, !dbg !1615
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1616, metadata !DIExpression()), !dbg !1617
  store i32 0, i32* %u32Temp2, align 4, !dbg !1617
  %0 = load i32, i32* %value.addr, align 4, !dbg !1618
  %1 = load i32, i32* %factor.addr, align 4, !dbg !1619
  %mul = mul i32 %0, %1, !dbg !1620
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1621
  %2 = load i32, i32* %value.addr, align 4, !dbg !1622
  %3 = load i32, i32* %factor.addr, align 4, !dbg !1623
  %call = call i32 @MulHighWord(i32 %2, i32 %3), !dbg !1624
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1625
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1626
  %shr = lshr i32 %4, 31, !dbg !1627
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1628
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !1629
  %shl = shl i32 %5, 1, !dbg !1630
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1631
  %or = or i32 %6, %shl, !dbg !1631
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1631
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1632
  %shr1 = lshr i32 %7, 31, !dbg !1634
  %cmp = icmp eq i32 %shr1, 0, !dbg !1635
  br i1 %cmp, label %if.then, label %if.else, !dbg !1636

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1637
  store i32 %8, i32* %retval, align 4, !dbg !1639
  br label %return, !dbg !1639

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1640
  br label %return, !dbg !1640

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1642
  ret i32 %9, !dbg !1642
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !1643 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1644, metadata !DIExpression()), !dbg !1645
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1646, metadata !DIExpression()), !dbg !1647
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1648, metadata !DIExpression()), !dbg !1649
  store i32 0, i32* %u32Temp1, align 4, !dbg !1649
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1650, metadata !DIExpression()), !dbg !1651
  store i32 0, i32* %u32Temp2, align 4, !dbg !1651
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1652
  %cmp = icmp sgt i32 %0, 0, !dbg !1654
  br i1 %cmp, label %if.then, label %if.else, !dbg !1655

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1656
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1658
  %mul = mul i32 %1, %2, !dbg !1659
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1660
  %3 = load i32, i32* %value.addr, align 4, !dbg !1661
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1662
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1663
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1664
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1665
  %shr = lshr i32 %5, 31, !dbg !1666
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1667
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1668
  %shl = shl i32 %6, 1, !dbg !1669
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1670
  %or = or i32 %7, %shl, !dbg !1670
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1670
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1671
  store i32 %8, i32* %retval, align 4, !dbg !1672
  br label %return, !dbg !1672

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1673
  br label %return, !dbg !1673

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !1675
  ret i32 %9, !dbg !1675
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !1676 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !1677, metadata !DIExpression()), !dbg !1678
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !1679, metadata !DIExpression()), !dbg !1680
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1681, metadata !DIExpression()), !dbg !1682
  store i32 0, i32* %u32Temp1, align 4, !dbg !1682
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1683, metadata !DIExpression()), !dbg !1684
  store i32 0, i32* %u32Temp2, align 4, !dbg !1684
  %0 = load i32, i32* %factor.addr, align 4, !dbg !1685
  %cmp = icmp sle i32 %0, 0, !dbg !1687
  br i1 %cmp, label %if.then, label %if.else, !dbg !1688

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1689
  br label %return, !dbg !1689

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !1691
  %2 = load i32, i32* %factor.addr, align 4, !dbg !1693
  %mul = mul i32 %1, %2, !dbg !1694
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !1695
  %3 = load i32, i32* %value.addr, align 4, !dbg !1696
  %4 = load i32, i32* %factor.addr, align 4, !dbg !1697
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !1698
  store i32 %call, i32* %u32Temp2, align 4, !dbg !1699
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1700
  %shr = lshr i32 %5, 30, !dbg !1701
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1702
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1703
  %shl = shl i32 %6, 2, !dbg !1704
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1705
  %or = or i32 %7, %shl, !dbg !1705
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1705
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1706
  %shr1 = lshr i32 %8, 30, !dbg !1708
  %cmp2 = icmp eq i32 %shr1, 0, !dbg !1709
  br i1 %cmp2, label %if.then3, label %if.else4, !dbg !1710

if.then3:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1711
  store i32 %9, i32* %retval, align 4, !dbg !1713
  br label %return, !dbg !1713

if.else4:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !1714
  br label %return, !dbg !1714

return:                                           ; preds = %if.else4, %if.then3, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1716
  ret i32 %10, !dbg !1716
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_u32_s32(i32 %val1, i32 %val2) #0 !dbg !1717 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %s32Val2prime = alloca i32, align 4
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1720, metadata !DIExpression()), !dbg !1721
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !1722, metadata !DIExpression()), !dbg !1723
  call void @llvm.dbg.declare(metadata i32* %s32Val2prime, metadata !1724, metadata !DIExpression()), !dbg !1725
  store i32 0, i32* %s32Val2prime, align 4, !dbg !1725
  %0 = load i32, i32* %val2.addr, align 4, !dbg !1726
  %cmp = icmp slt i32 %0, 0, !dbg !1728
  br i1 %cmp, label %if.then, label %if.end, !dbg !1729

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val2.addr, align 4, !dbg !1730
  %sub = sub nsw i32 0, %1, !dbg !1732
  store i32 %sub, i32* %s32Val2prime, align 4, !dbg !1733
  br label %if.end, !dbg !1734

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %val2.addr, align 4, !dbg !1735
  %cmp1 = icmp ne i32 %2, 0, !dbg !1737
  br i1 %cmp1, label %if.then2, label %if.else13, !dbg !1738

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %val2.addr, align 4, !dbg !1739
  %cmp3 = icmp sle i32 %3, 0, !dbg !1742
  br i1 %cmp3, label %if.then4, label %if.else7, !dbg !1743

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %s32Val2prime, align 4, !dbg !1744
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1747
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1747
  %div = udiv i32 -2147483648, %4, !dbg !1747, !klee.check.div !258
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1748
  %cmp5 = icmp ugt i32 %div, %5, !dbg !1749
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !1750

if.then6:                                         ; preds = %if.then4
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1751
  %7 = load i32, i32* %val2.addr, align 4, !dbg !1753
  %mul = mul i32 %6, %7, !dbg !1754
  store i32 %mul, i32* %retval, align 4, !dbg !1755
  br label %return, !dbg !1755

if.else:                                          ; preds = %if.then4
  store i32 -2147483648, i32* %retval, align 4, !dbg !1756
  br label %return, !dbg !1756

if.else7:                                         ; preds = %if.then2
  %8 = load i32, i32* %val2.addr, align 4, !dbg !1758
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1761
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1761
  %div8 = sdiv i32 2147483647, %8, !dbg !1761, !klee.check.div !258
  %9 = load i32, i32* %val1.addr, align 4, !dbg !1762
  %cmp9 = icmp ult i32 %div8, %9, !dbg !1763
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1764

if.then10:                                        ; preds = %if.else7
  store i32 2147483647, i32* %retval, align 4, !dbg !1765
  br label %return, !dbg !1765

if.else11:                                        ; preds = %if.else7
  %10 = load i32, i32* %val1.addr, align 4, !dbg !1767
  %11 = load i32, i32* %val2.addr, align 4, !dbg !1769
  %mul12 = mul i32 %10, %11, !dbg !1770
  store i32 %mul12, i32* %retval, align 4, !dbg !1771
  br label %return, !dbg !1771

if.else13:                                        ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1772
  br label %return, !dbg !1772

return:                                           ; preds = %if.else13, %if.else11, %if.then10, %if.else, %if.then6
  %12 = load i32, i32* %retval, align 4, !dbg !1774
  ret i32 %12, !dbg !1774
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac1(i32 %val1, i16 zeroext %val2) #0 !dbg !1775 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1776, metadata !DIExpression()), !dbg !1777
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1778, metadata !DIExpression()), !dbg !1779
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1780, metadata !DIExpression()), !dbg !1781
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1782, metadata !DIExpression()), !dbg !1783
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1784, metadata !DIExpression()), !dbg !1785
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1786, metadata !DIExpression()), !dbg !1787
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1788
  %cmp = icmp slt i32 %0, 0, !dbg !1790
  br i1 %cmp, label %if.then, label %if.else, !dbg !1791

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1792
  %sub = sub nsw i32 0, %1, !dbg !1794
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1795
  store i8 1, i8* %u8SignBit, align 1, !dbg !1796
  br label %if.end, !dbg !1797

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1798
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1800
  store i8 0, i8* %u8SignBit, align 1, !dbg !1801
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1802
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1803
  %conv = zext i16 %4 to i32, !dbg !1803
  %mul = mul i32 %3, %conv, !dbg !1804
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1805
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1806
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1807
  %conv1 = zext i16 %6 to i32, !dbg !1807
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1808
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1809
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1810
  %shr = lshr i32 %7, 16, !dbg !1811
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1812
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1813
  %shl = shl i32 %8, 16, !dbg !1814
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1815
  %or = or i32 %9, %shl, !dbg !1815
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1815
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1816
  %conv2 = zext i8 %10 to i32, !dbg !1816
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1818
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !1819

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1820
  store i32 %11, i32* %retval, align 4, !dbg !1822
  br label %return, !dbg !1822

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1823
  %sub7 = sub i32 0, %12, !dbg !1825
  store i32 %sub7, i32* %retval, align 4, !dbg !1826
  br label %return, !dbg !1826

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !1827
  ret i32 %13, !dbg !1827
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac2(i32 %val1, i16 zeroext %val2) #0 !dbg !1828 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1829, metadata !DIExpression()), !dbg !1830
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1831, metadata !DIExpression()), !dbg !1832
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1833, metadata !DIExpression()), !dbg !1834
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1835, metadata !DIExpression()), !dbg !1836
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1837, metadata !DIExpression()), !dbg !1838
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1839, metadata !DIExpression()), !dbg !1840
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1841
  %cmp = icmp slt i32 %0, 0, !dbg !1843
  br i1 %cmp, label %if.then, label %if.else, !dbg !1844

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !1845
  %sub = sub nsw i32 0, %1, !dbg !1847
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1848
  store i8 1, i8* %u8SignBit, align 1, !dbg !1849
  br label %if.end, !dbg !1850

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1851
  store i32 %2, i32* %u32Temp1, align 4, !dbg !1853
  store i8 0, i8* %u8SignBit, align 1, !dbg !1854
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !1855
  %4 = load i16, i16* %val2.addr, align 2, !dbg !1856
  %conv = zext i16 %4 to i32, !dbg !1856
  %mul = mul i32 %3, %conv, !dbg !1857
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !1858
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1859
  %6 = load i16, i16* %val2.addr, align 2, !dbg !1860
  %conv1 = zext i16 %6 to i32, !dbg !1860
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !1861
  store i32 %call, i32* %u32Temp3, align 4, !dbg !1862
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !1863
  %shr = lshr i32 %7, 15, !dbg !1864
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1865
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !1866
  %shl = shl i32 %8, 17, !dbg !1867
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1868
  %or = or i32 %9, %shl, !dbg !1868
  store i32 %or, i32* %u32Temp2, align 4, !dbg !1868
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !1869
  %conv2 = zext i8 %10 to i32, !dbg !1869
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !1871
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !1872

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1873
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1876
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !1877

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1878
  store i32 %12, i32* %retval, align 4, !dbg !1879
  br label %return, !dbg !1879

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !1880
  br label %return, !dbg !1880

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1881
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !1884
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !1885

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1886
  %sub14 = sub i32 0, %14, !dbg !1887
  store i32 %sub14, i32* %retval, align 4, !dbg !1888
  br label %return, !dbg !1888

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !1889
  br label %return, !dbg !1889

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !1890
  ret i32 %15, !dbg !1890
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac1(i32 %val1, i16 signext %val2) #0 !dbg !1891 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1894, metadata !DIExpression()), !dbg !1895
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1896, metadata !DIExpression()), !dbg !1897
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1898, metadata !DIExpression()), !dbg !1899
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1900, metadata !DIExpression()), !dbg !1901
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1902, metadata !DIExpression()), !dbg !1903
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1904, metadata !DIExpression()), !dbg !1905
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1906, metadata !DIExpression()), !dbg !1907
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1908
  %cmp = icmp slt i32 %0, 0, !dbg !1910
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1911

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !1912
  %conv = sext i16 %1 to i32, !dbg !1912
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !1913
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !1914

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !1915
  %cmp3 = icmp sgt i32 %2, 0, !dbg !1916
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !1917

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !1918
  %conv6 = sext i16 %3 to i32, !dbg !1918
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !1919
  br i1 %cmp7, label %if.then, label %if.else, !dbg !1920

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !1921
  br label %if.end, !dbg !1923

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !1924
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !1926
  %cmp9 = icmp slt i32 %4, 0, !dbg !1928
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !1929

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !1930
  %sub = sub nsw i32 0, %5, !dbg !1932
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1933
  br label %if.end13, !dbg !1934

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !1935
  store i32 %6, i32* %u32Temp1, align 4, !dbg !1937
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !1938
  %conv14 = sext i16 %7 to i32, !dbg !1938
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !1940
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !1941

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !1942
  %conv18 = sext i16 %8 to i32, !dbg !1942
  %sub19 = sub nsw i32 0, %conv18, !dbg !1944
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !1945
  br label %if.end22, !dbg !1946

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !1947
  %conv21 = sext i16 %9 to i32, !dbg !1947
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !1949
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1950
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1951
  %mul = mul i32 %10, %11, !dbg !1952
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !1953
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !1954
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1955
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !1956
  store i32 %call, i32* %u32Temp4, align 4, !dbg !1957
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !1958
  %shr = lshr i32 %14, 15, !dbg !1959
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !1960
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !1961
  %shl = shl i32 %15, 17, !dbg !1962
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !1963
  %or = or i32 %16, %shl, !dbg !1963
  store i32 %or, i32* %u32Temp3, align 4, !dbg !1963
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !1964
  %conv23 = zext i8 %17 to i32, !dbg !1964
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !1966
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !1967

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !1968
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !1971
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !1972

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !1973
  store i32 %19, i32* %retval, align 4, !dbg !1974
  br label %return, !dbg !1974

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !1975
  br label %return, !dbg !1975

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !1976
  %sub32 = sub i32 0, %20, !dbg !1978
  store i32 %sub32, i32* %retval, align 4, !dbg !1979
  br label %return, !dbg !1979

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !1980
  ret i32 %21, !dbg !1980
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac2(i32 %val1, i16 signext %val2) #0 !dbg !1981 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !1982, metadata !DIExpression()), !dbg !1983
  store i16 %val2, i16* %val2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %val2.addr, metadata !1984, metadata !DIExpression()), !dbg !1985
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1986, metadata !DIExpression()), !dbg !1987
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1988, metadata !DIExpression()), !dbg !1989
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1990, metadata !DIExpression()), !dbg !1991
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !1992, metadata !DIExpression()), !dbg !1993
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !1994, metadata !DIExpression()), !dbg !1995
  %0 = load i32, i32* %val1.addr, align 4, !dbg !1996
  %cmp = icmp slt i32 %0, 0, !dbg !1998
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !1999

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %val2.addr, align 2, !dbg !2000
  %conv = sext i16 %1 to i32, !dbg !2000
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2001
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2002

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2003
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2004
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2005

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %val2.addr, align 2, !dbg !2006
  %conv6 = sext i16 %3 to i32, !dbg !2006
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2007
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2008

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2009
  br label %if.end, !dbg !2011

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2012
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2014
  %cmp9 = icmp slt i32 %4, 0, !dbg !2016
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2017

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2018
  %sub = sub nsw i32 0, %5, !dbg !2020
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2021
  br label %if.end13, !dbg !2022

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2023
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2025
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %val2.addr, align 2, !dbg !2026
  %conv14 = sext i16 %7 to i32, !dbg !2026
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2028
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2029

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %val2.addr, align 2, !dbg !2030
  %conv18 = sext i16 %8 to i32, !dbg !2030
  %sub19 = sub nsw i32 0, %conv18, !dbg !2032
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2033
  br label %if.end22, !dbg !2034

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %val2.addr, align 2, !dbg !2035
  %conv21 = sext i16 %9 to i32, !dbg !2035
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2037
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2038
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2039
  %mul = mul i32 %10, %11, !dbg !2040
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2041
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2042
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2043
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2044
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2045
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2046
  %shr = lshr i32 %14, 14, !dbg !2047
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2048
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2049
  %shl = shl i32 %15, 18, !dbg !2050
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2051
  %or = or i32 %16, %shl, !dbg !2051
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2051
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2052
  %shr23 = lshr i32 %17, 14, !dbg !2054
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2055
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2056

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2057
  %conv27 = zext i8 %18 to i32, !dbg !2057
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2060
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2061

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2062
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2065
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2066

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2067
  store i32 %20, i32* %retval, align 4, !dbg !2068
  br label %return, !dbg !2068

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2069
  br label %return, !dbg !2069

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2070
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2073
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2074

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2075
  %sub39 = sub i32 0, %22, !dbg !2076
  store i32 %sub39, i32* %retval, align 4, !dbg !2077
  br label %return, !dbg !2077

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2078
  br label %return, !dbg !2078

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2079
  br label %return, !dbg !2079

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2081
  ret i32 %23, !dbg !2081
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac1(i32 %val1, i32 %val2) #0 !dbg !2082 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2085, metadata !DIExpression()), !dbg !2086
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2087, metadata !DIExpression()), !dbg !2088
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2089, metadata !DIExpression()), !dbg !2090
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2091, metadata !DIExpression()), !dbg !2092
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2093, metadata !DIExpression()), !dbg !2094
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2095
  %cmp = icmp slt i32 %0, 0, !dbg !2097
  br i1 %cmp, label %if.then, label %if.else, !dbg !2098

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2099
  %sub = sub nsw i32 0, %1, !dbg !2101
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2102
  store i8 1, i8* %u8SignBit, align 1, !dbg !2103
  br label %if.end, !dbg !2104

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2105
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2107
  store i8 0, i8* %u8SignBit, align 1, !dbg !2108
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2109
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2110
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2111
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2112
  %5 = load i8, i8* %u8SignBit, align 1, !dbg !2113
  %conv = zext i8 %5 to i32, !dbg !2113
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2115
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2116

if.then3:                                         ; preds = %if.end
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !2117
  store i32 %6, i32* %retval, align 4, !dbg !2118
  br label %return, !dbg !2118

if.else4:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2119
  %sub5 = sub i32 0, %7, !dbg !2120
  store i32 %sub5, i32* %retval, align 4, !dbg !2121
  br label %return, !dbg !2121

return:                                           ; preds = %if.else4, %if.then3
  %8 = load i32, i32* %retval, align 4, !dbg !2122
  ret i32 %8, !dbg !2122
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac2(i32 %val1, i32 %val2) #0 !dbg !2123 {
entry:
  %retval = alloca i32, align 4
  %val1.addr = alloca i32, align 4
  %val2.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %val1, i32* %val1.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2124, metadata !DIExpression()), !dbg !2125
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2126, metadata !DIExpression()), !dbg !2127
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2128, metadata !DIExpression()), !dbg !2129
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2130, metadata !DIExpression()), !dbg !2131
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2132, metadata !DIExpression()), !dbg !2133
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2134, metadata !DIExpression()), !dbg !2135
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2136
  %cmp = icmp slt i32 %0, 0, !dbg !2138
  br i1 %cmp, label %if.then, label %if.else, !dbg !2139

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %val1.addr, align 4, !dbg !2140
  %sub = sub nsw i32 0, %1, !dbg !2142
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2143
  store i8 1, i8* %u8SignBit, align 1, !dbg !2144
  br label %if.end, !dbg !2145

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2146
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2148
  store i8 0, i8* %u8SignBit, align 1, !dbg !2149
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2150
  %4 = load i32, i32* %val2.addr, align 4, !dbg !2151
  %mul = mul i32 %3, %4, !dbg !2152
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2153
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2154
  %6 = load i32, i32* %val2.addr, align 4, !dbg !2155
  %call = call i32 @MulHighWord(i32 %5, i32 %6), !dbg !2156
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2157
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2158
  %shr = lshr i32 %7, 31, !dbg !2159
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2160
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2161
  %shl = shl i32 %8, 1, !dbg !2162
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2163
  %or = or i32 %9, %shl, !dbg !2163
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2163
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2164
  %conv = zext i8 %10 to i32, !dbg !2164
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2166
  br i1 %cmp1, label %if.then3, label %if.else8, !dbg !2167

if.then3:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2168
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !2171
  br i1 %cmp4, label %if.then6, label %if.else7, !dbg !2172

if.then6:                                         ; preds = %if.then3
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2173
  store i32 %12, i32* %retval, align 4, !dbg !2174
  br label %return, !dbg !2174

if.else7:                                         ; preds = %if.then3
  store i32 2147483647, i32* %retval, align 4, !dbg !2175
  br label %return, !dbg !2175

if.else8:                                         ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2176
  %cmp9 = icmp ule i32 %13, -2147483648, !dbg !2179
  br i1 %cmp9, label %if.then11, label %if.else13, !dbg !2180

if.then11:                                        ; preds = %if.else8
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2181
  %sub12 = sub i32 0, %14, !dbg !2182
  store i32 %sub12, i32* %retval, align 4, !dbg !2183
  br label %return, !dbg !2183

if.else13:                                        ; preds = %if.else8
  store i32 -2147483648, i32* %retval, align 4, !dbg !2184
  br label %return, !dbg !2184

return:                                           ; preds = %if.else13, %if.then11, %if.else7, %if.then6
  %15 = load i32, i32* %retval, align 4, !dbg !2185
  ret i32 %15, !dbg !2185
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac1(i32 %value, i32 %factor) #0 !dbg !2186 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2189, metadata !DIExpression()), !dbg !2190
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2191, metadata !DIExpression()), !dbg !2192
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2193, metadata !DIExpression()), !dbg !2194
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2195, metadata !DIExpression()), !dbg !2196
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2197, metadata !DIExpression()), !dbg !2198
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2199, metadata !DIExpression()), !dbg !2200
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2201, metadata !DIExpression()), !dbg !2202
  %0 = load i32, i32* %value.addr, align 4, !dbg !2203
  %cmp = icmp slt i32 %0, 0, !dbg !2205
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2206
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2206

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2207
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2208
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2209
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2209

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2210
  br label %if.end, !dbg !2212

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2213
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2215
  %cmp5 = icmp slt i32 %4, 0, !dbg !2217
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2218

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2219
  %sub = sub nsw i32 0, %5, !dbg !2221
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2222
  br label %if.end8, !dbg !2223

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2224
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2226
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2227
  %cmp9 = icmp slt i32 %7, 0, !dbg !2229
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2230

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2231
  %sub11 = sub nsw i32 0, %8, !dbg !2233
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2234
  br label %if.end13, !dbg !2235

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2236
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2238
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2239
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2240
  %mul = mul i32 %10, %11, !dbg !2241
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2242
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2243
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2244
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2245
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2246
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2247
  %shr = lshr i32 %14, 31, !dbg !2248
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2249
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2250
  %shl = shl i32 %15, 1, !dbg !2251
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2252
  %or = or i32 %16, %shl, !dbg !2252
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2252
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2253
  %conv = zext i8 %17 to i32, !dbg !2253
  %cmp14 = icmp eq i32 %conv, 0, !dbg !2255
  br i1 %cmp14, label %if.then16, label %if.else21, !dbg !2256

if.then16:                                        ; preds = %if.end13
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2257
  %cmp17 = icmp ule i32 %18, 2147483647, !dbg !2260
  br i1 %cmp17, label %if.then19, label %if.else20, !dbg !2261

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2262
  store i32 %19, i32* %retval, align 4, !dbg !2263
  br label %return, !dbg !2263

if.else20:                                        ; preds = %if.then16
  store i32 2147483647, i32* %retval, align 4, !dbg !2264
  br label %return, !dbg !2264

if.else21:                                        ; preds = %if.end13
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2265
  %sub22 = sub i32 0, %20, !dbg !2267
  store i32 %sub22, i32* %retval, align 4, !dbg !2268
  br label %return, !dbg !2268

return:                                           ; preds = %if.else21, %if.else20, %if.then19
  %21 = load i32, i32* %retval, align 4, !dbg !2269
  ret i32 %21, !dbg !2269
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac2(i32 %value, i32 %factor) #0 !dbg !2270 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2271, metadata !DIExpression()), !dbg !2272
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2273, metadata !DIExpression()), !dbg !2274
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2275, metadata !DIExpression()), !dbg !2276
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2277, metadata !DIExpression()), !dbg !2278
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2279, metadata !DIExpression()), !dbg !2280
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2281, metadata !DIExpression()), !dbg !2282
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2283, metadata !DIExpression()), !dbg !2284
  %0 = load i32, i32* %value.addr, align 4, !dbg !2285
  %cmp = icmp slt i32 %0, 0, !dbg !2287
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2288
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2288

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2289
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2290
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2291
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2291

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2292
  br label %if.end, !dbg !2294

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2295
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2297
  %cmp5 = icmp slt i32 %4, 0, !dbg !2299
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2300

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2301
  %sub = sub nsw i32 0, %5, !dbg !2303
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2304
  br label %if.end8, !dbg !2305

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2306
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2308
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2309
  %cmp9 = icmp slt i32 %7, 0, !dbg !2311
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2312

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2313
  %sub11 = sub nsw i32 0, %8, !dbg !2315
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2316
  br label %if.end13, !dbg !2317

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2318
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2320
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2321
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2322
  %mul = mul i32 %10, %11, !dbg !2323
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2324
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2325
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2326
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2327
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2328
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2329
  %shr = lshr i32 %14, 30, !dbg !2330
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2331
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2332
  %shl = shl i32 %15, 2, !dbg !2333
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2334
  %or = or i32 %16, %shl, !dbg !2334
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2334
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2335
  %shr14 = lshr i32 %17, 30, !dbg !2337
  %cmp15 = icmp eq i32 %shr14, 0, !dbg !2338
  br i1 %cmp15, label %if.then16, label %if.else30, !dbg !2339

if.then16:                                        ; preds = %if.end13
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2340
  %conv = zext i8 %18 to i32, !dbg !2340
  %cmp17 = icmp eq i32 %conv, 0, !dbg !2343
  br i1 %cmp17, label %if.then19, label %if.else24, !dbg !2344

if.then19:                                        ; preds = %if.then16
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2345
  %cmp20 = icmp ule i32 %19, 2147483647, !dbg !2348
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2349

if.then22:                                        ; preds = %if.then19
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2350
  store i32 %20, i32* %retval, align 4, !dbg !2351
  br label %return, !dbg !2351

if.else23:                                        ; preds = %if.then19
  store i32 2147483647, i32* %retval, align 4, !dbg !2352
  br label %return, !dbg !2352

if.else24:                                        ; preds = %if.then16
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2353
  %cmp25 = icmp ule i32 %21, -2147483648, !dbg !2356
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2357

if.then27:                                        ; preds = %if.else24
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2358
  %sub28 = sub i32 0, %22, !dbg !2359
  store i32 %sub28, i32* %retval, align 4, !dbg !2360
  br label %return, !dbg !2360

if.else29:                                        ; preds = %if.else24
  store i32 -2147483648, i32* %retval, align 4, !dbg !2361
  br label %return, !dbg !2361

if.else30:                                        ; preds = %if.end13
  store i32 2147483647, i32* %retval, align 4, !dbg !2362
  br label %return, !dbg !2362

return:                                           ; preds = %if.else30, %if.else29, %if.then27, %if.else23, %if.then22
  %23 = load i32, i32* %retval, align 4, !dbg !2364
  ret i32 %23, !dbg !2364
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !2365 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2368, metadata !DIExpression()), !dbg !2369
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2370, metadata !DIExpression()), !dbg !2371
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2372, metadata !DIExpression()), !dbg !2373
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2374, metadata !DIExpression()), !dbg !2375
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2376, metadata !DIExpression()), !dbg !2377
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2378, metadata !DIExpression()), !dbg !2379
  %0 = load i32, i32* %value.addr, align 4, !dbg !2380
  %cmp = icmp slt i32 %0, 0, !dbg !2382
  br i1 %cmp, label %if.then, label %if.else, !dbg !2383

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2384
  %sub = sub nsw i32 0, %1, !dbg !2386
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2387
  store i8 1, i8* %u8SignBit, align 1, !dbg !2388
  br label %if.end, !dbg !2389

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2390
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2392
  store i8 0, i8* %u8SignBit, align 1, !dbg !2393
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2394
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2395
  %conv = zext i8 %4 to i32, !dbg !2395
  %mul = mul i32 %3, %conv, !dbg !2396
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2397
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2398
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2399
  %conv1 = zext i8 %6 to i32, !dbg !2399
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2400
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2401
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2402
  %shr = lshr i32 %7, 8, !dbg !2403
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2404
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2405
  %shl = shl i32 %8, 24, !dbg !2406
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2407
  %or = or i32 %9, %shl, !dbg !2407
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2407
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2408
  %conv2 = zext i8 %10 to i32, !dbg !2408
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2410
  br i1 %cmp3, label %if.then5, label %if.else6, !dbg !2411

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2412
  store i32 %11, i32* %retval, align 4, !dbg !2414
  br label %return, !dbg !2414

if.else6:                                         ; preds = %if.end
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2415
  %sub7 = sub i32 0, %12, !dbg !2417
  store i32 %sub7, i32* %retval, align 4, !dbg !2418
  br label %return, !dbg !2418

return:                                           ; preds = %if.else6, %if.then5
  %13 = load i32, i32* %retval, align 4, !dbg !2419
  ret i32 %13, !dbg !2419
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !2420 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2421, metadata !DIExpression()), !dbg !2422
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2423, metadata !DIExpression()), !dbg !2424
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2425, metadata !DIExpression()), !dbg !2426
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2427, metadata !DIExpression()), !dbg !2428
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2429, metadata !DIExpression()), !dbg !2430
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2431, metadata !DIExpression()), !dbg !2432
  %0 = load i32, i32* %value.addr, align 4, !dbg !2433
  %cmp = icmp slt i32 %0, 0, !dbg !2435
  br i1 %cmp, label %if.then, label %if.else, !dbg !2436

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2437
  %sub = sub nsw i32 0, %1, !dbg !2439
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2440
  store i8 1, i8* %u8SignBit, align 1, !dbg !2441
  br label %if.end, !dbg !2442

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2443
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2445
  store i8 0, i8* %u8SignBit, align 1, !dbg !2446
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2447
  %4 = load i8, i8* %factor.addr, align 1, !dbg !2448
  %conv = zext i8 %4 to i32, !dbg !2448
  %mul = mul i32 %3, %conv, !dbg !2449
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !2450
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !2451
  %6 = load i8, i8* %factor.addr, align 1, !dbg !2452
  %conv1 = zext i8 %6 to i32, !dbg !2452
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !2453
  store i32 %call, i32* %u32Temp3, align 4, !dbg !2454
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2455
  %shr = lshr i32 %7, 7, !dbg !2456
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2457
  %8 = load i32, i32* %u32Temp3, align 4, !dbg !2458
  %shl = shl i32 %8, 25, !dbg !2459
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !2460
  %or = or i32 %9, %shl, !dbg !2460
  store i32 %or, i32* %u32Temp2, align 4, !dbg !2460
  %10 = load i8, i8* %u8SignBit, align 1, !dbg !2461
  %conv2 = zext i8 %10 to i32, !dbg !2461
  %cmp3 = icmp eq i32 %conv2, 0, !dbg !2463
  br i1 %cmp3, label %if.then5, label %if.else10, !dbg !2464

if.then5:                                         ; preds = %if.end
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2465
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !2468
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !2469

if.then8:                                         ; preds = %if.then5
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !2470
  store i32 %12, i32* %retval, align 4, !dbg !2471
  br label %return, !dbg !2471

if.else9:                                         ; preds = %if.then5
  store i32 2147483647, i32* %retval, align 4, !dbg !2472
  br label %return, !dbg !2472

if.else10:                                        ; preds = %if.end
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2473
  %cmp11 = icmp ule i32 %13, -2147483648, !dbg !2476
  br i1 %cmp11, label %if.then13, label %if.else15, !dbg !2477

if.then13:                                        ; preds = %if.else10
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !2478
  %sub14 = sub i32 0, %14, !dbg !2479
  store i32 %sub14, i32* %retval, align 4, !dbg !2480
  br label %return, !dbg !2480

if.else15:                                        ; preds = %if.else10
  store i32 -2147483648, i32* %retval, align 4, !dbg !2481
  br label %return, !dbg !2481

return:                                           ; preds = %if.else15, %if.then13, %if.else9, %if.then8
  %15 = load i32, i32* %retval, align 4, !dbg !2482
  ret i32 %15, !dbg !2482
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2483 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %power.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2486, metadata !DIExpression()), !dbg !2487
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2488, metadata !DIExpression()), !dbg !2489
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2490, metadata !DIExpression()), !dbg !2491
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2492, metadata !DIExpression()), !dbg !2493
  store i32 0, i32* %u32Temp1, align 4, !dbg !2493
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2494, metadata !DIExpression()), !dbg !2495
  store i32 0, i32* %u32Temp2, align 4, !dbg !2495
  %0 = load i8, i8* %power.addr, align 1, !dbg !2496
  %conv = zext i8 %0 to i32, !dbg !2496
  %cmp = icmp sge i32 %conv, 32, !dbg !2498
  br i1 %cmp, label %if.then, label %if.else, !dbg !2499

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2500
  br label %if.end7, !dbg !2502

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2503
  %conv2 = zext i8 %1 to i32, !dbg !2503
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2505
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2506

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2507
  br label %if.end7, !dbg !2509

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2510
  %3 = load i32, i32* %factor.addr, align 4, !dbg !2511
  %mul = mul i32 %2, %3, !dbg !2512
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !2513
  %4 = load i32, i32* %value.addr, align 4, !dbg !2514
  %5 = load i32, i32* %factor.addr, align 4, !dbg !2515
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !2516
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2517
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !2518
  %7 = load i8, i8* %power.addr, align 1, !dbg !2519
  %conv8 = zext i8 %7 to i32, !dbg !2519
  %sub = sub nsw i32 32, %conv8, !dbg !2520
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !2521
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2521
  %shr = lshr i32 %6, %sub, !dbg !2521, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2522
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2523
  %9 = load i8, i8* %power.addr, align 1, !dbg !2524
  %conv9 = zext i8 %9 to i32, !dbg !2524
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2525
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2525
  %shl = shl i32 %8, %conv9, !dbg !2525, !klee.check.shift !258
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2526
  %or = or i32 %10, %shl, !dbg !2526
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2526
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2527
  %12 = load i8, i8* %power.addr, align 1, !dbg !2529
  %conv10 = zext i8 %12 to i32, !dbg !2529
  %sub11 = sub nsw i32 32, %conv10, !dbg !2530
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2531
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2531
  %shr12 = lshr i32 %11, %sub11, !dbg !2531, !klee.check.shift !258
  %cmp13 = icmp eq i32 %shr12, 0, !dbg !2532
  br i1 %cmp13, label %if.then15, label %if.else16, !dbg !2533

if.then15:                                        ; preds = %if.end7
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !2534
  store i32 %13, i32* %retval, align 4, !dbg !2536
  br label %return, !dbg !2536

if.else16:                                        ; preds = %if.end7
  store i32 -1, i32* %retval, align 4, !dbg !2537
  br label %return, !dbg !2537

return:                                           ; preds = %if.else16, %if.then15
  %14 = load i32, i32* %retval, align 4, !dbg !2539
  ret i32 %14, !dbg !2539
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %value, i32 %factor, i8 zeroext %power) #0 !dbg !2540 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2543, metadata !DIExpression()), !dbg !2544
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2545, metadata !DIExpression()), !dbg !2546
  store i8 %power, i8* %power.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %power.addr, metadata !2547, metadata !DIExpression()), !dbg !2548
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2549, metadata !DIExpression()), !dbg !2550
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2551, metadata !DIExpression()), !dbg !2552
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2553, metadata !DIExpression()), !dbg !2554
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2555, metadata !DIExpression()), !dbg !2556
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2557, metadata !DIExpression()), !dbg !2558
  %0 = load i8, i8* %power.addr, align 1, !dbg !2559
  %conv = zext i8 %0 to i32, !dbg !2559
  %cmp = icmp sge i32 %conv, 32, !dbg !2561
  br i1 %cmp, label %if.then, label %if.else, !dbg !2562

if.then:                                          ; preds = %entry
  store i8 31, i8* %power.addr, align 1, !dbg !2563
  br label %if.end7, !dbg !2565

if.else:                                          ; preds = %entry
  %1 = load i8, i8* %power.addr, align 1, !dbg !2566
  %conv2 = zext i8 %1 to i32, !dbg !2566
  %cmp3 = icmp slt i32 %conv2, 1, !dbg !2568
  br i1 %cmp3, label %if.then5, label %if.end7, !dbg !2569

if.then5:                                         ; preds = %if.else
  store i8 1, i8* %power.addr, align 1, !dbg !2570
  br label %if.end7, !dbg !2572

if.end7:                                          ; preds = %if.then5, %if.else, %if.then
  %2 = load i32, i32* %value.addr, align 4, !dbg !2573
  %cmp8 = icmp slt i32 %2, 0, !dbg !2575
  %3 = load i32, i32* %factor.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  %or.cond = select i1 %cmp8, i1 %cmp10, i1 false, !dbg !2576
  br i1 %or.cond, label %if.then17, label %lor.lhs.false, !dbg !2576

lor.lhs.false:                                    ; preds = %if.end7
  %4 = load i32, i32* %value.addr, align 4, !dbg !2577
  %cmp12 = icmp sgt i32 %4, 0, !dbg !2578
  %5 = load i32, i32* %factor.addr, align 4
  %cmp15 = icmp slt i32 %5, 0
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2579
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2579

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2580
  br label %if.end19, !dbg !2582

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2583
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2585
  %cmp20 = icmp slt i32 %6, 0, !dbg !2587
  br i1 %cmp20, label %if.then22, label %if.else23, !dbg !2588

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2589
  %sub = sub nsw i32 0, %7, !dbg !2591
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2592
  br label %if.end24, !dbg !2593

if.else23:                                        ; preds = %if.end19
  %8 = load i32, i32* %value.addr, align 4, !dbg !2594
  store i32 %8, i32* %u32Temp1, align 4, !dbg !2596
  br label %if.end24

if.end24:                                         ; preds = %if.else23, %if.then22
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2597
  %cmp25 = icmp slt i32 %9, 0, !dbg !2599
  br i1 %cmp25, label %if.then27, label %if.else29, !dbg !2600

if.then27:                                        ; preds = %if.end24
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2601
  %sub28 = sub nsw i32 0, %10, !dbg !2603
  store i32 %sub28, i32* %u32Temp2, align 4, !dbg !2604
  br label %if.end30, !dbg !2605

if.else29:                                        ; preds = %if.end24
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2606
  store i32 %11, i32* %u32Temp2, align 4, !dbg !2608
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then27
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2609
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2610
  %mul = mul i32 %12, %13, !dbg !2611
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2612
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2613
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2614
  %call = call i32 @MulHighWord(i32 %14, i32 %15), !dbg !2615
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2616
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2617
  %17 = load i8, i8* %power.addr, align 1, !dbg !2618
  %conv31 = zext i8 %17 to i32, !dbg !2618
  %sub32 = sub nsw i32 32, %conv31, !dbg !2619
  %int_cast_to_i64 = zext i32 %sub32 to i64, !dbg !2620
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2620
  %shr = lshr i32 %16, %sub32, !dbg !2620, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2621
  %18 = load i32, i32* %u32Temp4, align 4, !dbg !2622
  %19 = load i8, i8* %power.addr, align 1, !dbg !2623
  %conv33 = zext i8 %19 to i32, !dbg !2623
  %int_cast_to_i641 = zext i32 %conv33 to i64, !dbg !2624
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2624
  %shl = shl i32 %18, %conv33, !dbg !2624, !klee.check.shift !258
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2625
  %or = or i32 %20, %shl, !dbg !2625
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2625
  %21 = load i32, i32* %u32Temp4, align 4, !dbg !2626
  %22 = load i8, i8* %power.addr, align 1, !dbg !2628
  %conv34 = zext i8 %22 to i32, !dbg !2628
  %sub35 = sub nsw i32 32, %conv34, !dbg !2629
  %int_cast_to_i642 = zext i32 %sub35 to i64, !dbg !2630
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2630
  %shr36 = lshr i32 %21, %sub35, !dbg !2630, !klee.check.shift !258
  %cmp37 = icmp eq i32 %shr36, 0, !dbg !2631
  br i1 %cmp37, label %if.then39, label %if.else50, !dbg !2632

if.then39:                                        ; preds = %if.end30
  %23 = load i8, i8* %u8SignBit, align 1, !dbg !2633
  %conv40 = zext i8 %23 to i32, !dbg !2633
  %cmp41 = icmp eq i32 %conv40, 0, !dbg !2636
  br i1 %cmp41, label %if.then43, label %if.else48, !dbg !2637

if.then43:                                        ; preds = %if.then39
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !2638
  %cmp44 = icmp ule i32 %24, 2147483647, !dbg !2641
  br i1 %cmp44, label %if.then46, label %if.else47, !dbg !2642

if.then46:                                        ; preds = %if.then43
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !2643
  store i32 %25, i32* %retval, align 4, !dbg !2644
  br label %return, !dbg !2644

if.else47:                                        ; preds = %if.then43
  store i32 2147483647, i32* %retval, align 4, !dbg !2645
  br label %return, !dbg !2645

if.else48:                                        ; preds = %if.then39
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2646
  %sub49 = sub i32 0, %26, !dbg !2648
  store i32 %sub49, i32* %retval, align 4, !dbg !2649
  br label %return, !dbg !2649

if.else50:                                        ; preds = %if.end30
  %27 = load i8, i8* %u8SignBit, align 1, !dbg !2650
  %conv51 = zext i8 %27 to i32, !dbg !2650
  %cmp52 = icmp eq i32 %conv51, 0, !dbg !2653
  br i1 %cmp52, label %if.then54, label %if.else55, !dbg !2654

if.then54:                                        ; preds = %if.else50
  store i32 2147483647, i32* %retval, align 4, !dbg !2655
  br label %return, !dbg !2655

if.else55:                                        ; preds = %if.else50
  store i32 -2147483648, i32* %retval, align 4, !dbg !2657
  br label %return, !dbg !2657

return:                                           ; preds = %if.else55, %if.then54, %if.else48, %if.else47, %if.then46
  %28 = load i32, i32* %retval, align 4, !dbg !2659
  ret i32 %28, !dbg !2659
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2660 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2663, metadata !DIExpression()), !dbg !2664
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2665, metadata !DIExpression()), !dbg !2666
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2667, metadata !DIExpression()), !dbg !2668
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2669, metadata !DIExpression()), !dbg !2670
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2671, metadata !DIExpression()), !dbg !2672
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2673, metadata !DIExpression()), !dbg !2674
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2675, metadata !DIExpression()), !dbg !2676
  %0 = load i32, i32* %value.addr, align 4, !dbg !2677
  %cmp = icmp slt i32 %0, 0, !dbg !2679
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2680

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2681
  %conv = sext i8 %1 to i32, !dbg !2681
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2682
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2683

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2684
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2685
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2686

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2687
  %conv6 = sext i8 %3 to i32, !dbg !2687
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2688
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2689

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2690
  br label %if.end, !dbg !2692

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2693
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2695
  %cmp9 = icmp slt i32 %4, 0, !dbg !2697
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2698

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2699
  %sub = sub nsw i32 0, %5, !dbg !2701
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2702
  br label %if.end13, !dbg !2703

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2704
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2706
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2707
  %conv14 = sext i8 %7 to i32, !dbg !2707
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2709
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2710

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2711
  %conv18 = sext i8 %8 to i32, !dbg !2711
  %sub19 = sub nsw i32 0, %conv18, !dbg !2713
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2714
  br label %if.end22, !dbg !2715

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2716
  %conv21 = sext i8 %9 to i32, !dbg !2716
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2718
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2719
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2720
  %mul = mul i32 %10, %11, !dbg !2721
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2722
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2723
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2724
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2725
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2726
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2727
  %shr = lshr i32 %14, 7, !dbg !2728
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2729
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2730
  %shl = shl i32 %15, 25, !dbg !2731
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2732
  %or = or i32 %16, %shl, !dbg !2732
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2732
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2733
  %conv23 = zext i8 %17 to i32, !dbg !2733
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2735
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2736

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2737
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2740
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2741

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2742
  store i32 %19, i32* %retval, align 4, !dbg !2743
  br label %return, !dbg !2743

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2744
  br label %return, !dbg !2744

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2745
  %sub32 = sub i32 0, %20, !dbg !2747
  store i32 %sub32, i32* %retval, align 4, !dbg !2748
  br label %return, !dbg !2748

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2749
  ret i32 %21, !dbg !2749
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2750 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2751, metadata !DIExpression()), !dbg !2752
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2753, metadata !DIExpression()), !dbg !2754
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2755, metadata !DIExpression()), !dbg !2756
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2757, metadata !DIExpression()), !dbg !2758
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2759, metadata !DIExpression()), !dbg !2760
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2761, metadata !DIExpression()), !dbg !2762
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2763, metadata !DIExpression()), !dbg !2764
  %0 = load i32, i32* %value.addr, align 4, !dbg !2765
  %cmp = icmp slt i32 %0, 0, !dbg !2767
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2768

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2769
  %conv = sext i8 %1 to i32, !dbg !2769
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2770
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2771

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2772
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2773
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2774

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2775
  %conv6 = sext i8 %3 to i32, !dbg !2775
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2776
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2777

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2778
  br label %if.end, !dbg !2780

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2781
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2783
  %cmp9 = icmp slt i32 %4, 0, !dbg !2785
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2786

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2787
  %sub = sub nsw i32 0, %5, !dbg !2789
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2790
  br label %if.end13, !dbg !2791

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2792
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2794
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2795
  %conv14 = sext i8 %7 to i32, !dbg !2795
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2797
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2798

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2799
  %conv18 = sext i8 %8 to i32, !dbg !2799
  %sub19 = sub nsw i32 0, %conv18, !dbg !2801
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2802
  br label %if.end22, !dbg !2803

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2804
  %conv21 = sext i8 %9 to i32, !dbg !2804
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2806
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2807
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2808
  %mul = mul i32 %10, %11, !dbg !2809
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2810
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2811
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2812
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2813
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2814
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2815
  %shr = lshr i32 %14, 6, !dbg !2816
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2817
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2818
  %shl = shl i32 %15, 26, !dbg !2819
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2820
  %or = or i32 %16, %shl, !dbg !2820
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2820
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2821
  %shr23 = lshr i32 %17, 6, !dbg !2823
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2824
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2825

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2826
  %conv27 = zext i8 %18 to i32, !dbg !2826
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2829
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2830

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2831
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2834
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2835

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2836
  store i32 %20, i32* %retval, align 4, !dbg !2837
  br label %return, !dbg !2837

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2838
  br label %return, !dbg !2838

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2839
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2842
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2843

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2844
  %sub39 = sub i32 0, %22, !dbg !2845
  store i32 %sub39, i32* %retval, align 4, !dbg !2846
  br label %return, !dbg !2846

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2847
  br label %return, !dbg !2847

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2848
  br label %return, !dbg !2848

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2850
  ret i32 %23, !dbg !2850
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2851 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2852, metadata !DIExpression()), !dbg !2853
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2854, metadata !DIExpression()), !dbg !2855
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2856, metadata !DIExpression()), !dbg !2857
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2858, metadata !DIExpression()), !dbg !2859
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2860, metadata !DIExpression()), !dbg !2861
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2862, metadata !DIExpression()), !dbg !2863
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2864, metadata !DIExpression()), !dbg !2865
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2866
  %cmp = icmp slt i32 %0, 0, !dbg !2868
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2869
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2869

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2870
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2871
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2872
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2872

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2873
  br label %if.end, !dbg !2875

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2876
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2878
  %cmp5 = icmp slt i32 %4, 0, !dbg !2880
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2881

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2882
  %sub = sub nsw i32 0, %5, !dbg !2884
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2885
  br label %if.end8, !dbg !2886

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2887
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2889
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2890
  %cmp9 = icmp slt i32 %7, 0, !dbg !2892
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2893

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2894
  %sub11 = sub nsw i32 0, %8, !dbg !2896
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2897
  br label %if.end13, !dbg !2898

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2899
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2901
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2902
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2903
  %mul = mul i32 %10, %11, !dbg !2904
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2905
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2906
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2907
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2908
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2909
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2910
  %cmp14 = icmp eq i32 %14, 0, !dbg !2912
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2913

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2914
  %conv = zext i8 %15 to i32, !dbg !2914
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2917
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2918

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2919
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2922
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2923

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2924
  store i32 %17, i32* %retval, align 4, !dbg !2925
  br label %return, !dbg !2925

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2926
  br label %return, !dbg !2926

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2927
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2930
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2931

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2932
  %sub27 = sub i32 0, %19, !dbg !2933
  store i32 %sub27, i32* %retval, align 4, !dbg !2934
  br label %return, !dbg !2934

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2935
  br label %return, !dbg !2935

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2936
  %conv30 = zext i8 %20 to i32, !dbg !2936
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2939
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2940

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2941
  br label %return, !dbg !2941

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2943
  br label %return, !dbg !2943

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2945
  ret i32 %21, !dbg !2945
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2946 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2947, metadata !DIExpression()), !dbg !2948
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2949, metadata !DIExpression()), !dbg !2950
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2951, metadata !DIExpression()), !dbg !2952
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2953, metadata !DIExpression()), !dbg !2954
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2955, metadata !DIExpression()), !dbg !2956
  %0 = load i32, i32* %value.addr, align 4, !dbg !2957
  %cmp = icmp slt i32 %0, 0, !dbg !2959
  br i1 %cmp, label %if.then, label %if.else, !dbg !2960

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2961
  %sub = sub nsw i32 0, %1, !dbg !2963
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2964
  store i8 1, i8* %u8SignBit, align 1, !dbg !2965
  br label %if.end, !dbg !2966

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2967
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2969
  store i8 0, i8* %u8SignBit, align 1, !dbg !2970
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2971
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2972
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2973
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2974
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2975
  %shr = lshr i32 %5, 1, !dbg !2976
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2977
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2978
  %conv = zext i8 %6 to i32, !dbg !2978
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2980
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2981

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2982
  store i32 %7, i32* %retval, align 4, !dbg !2984
  br label %return, !dbg !2984

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2985
  %sub5 = sub i32 0, %8, !dbg !2987
  store i32 %sub5, i32* %retval, align 4, !dbg !2988
  br label %return, !dbg !2988

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2989
  ret i32 %9, !dbg !2989
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2990 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2991, metadata !DIExpression()), !dbg !2992
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2993, metadata !DIExpression()), !dbg !2994
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2995, metadata !DIExpression()), !dbg !2996
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2997, metadata !DIExpression()), !dbg !2998
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2999, metadata !DIExpression()), !dbg !3000
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3001, metadata !DIExpression()), !dbg !3002
  %0 = load i32, i32* %value.addr, align 4, !dbg !3003
  %cmp = icmp slt i32 %0, 0, !dbg !3005
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3006
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !3006

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3007
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3008
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3009
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3009

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3010
  br label %if.end, !dbg !3012

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3013
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3015
  %cmp5 = icmp slt i32 %4, 0, !dbg !3017
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3018

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3019
  %sub = sub nsw i32 0, %5, !dbg !3021
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3022
  br label %if.end8, !dbg !3023

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3024
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3026
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3027
  %cmp9 = icmp slt i32 %7, 0, !dbg !3029
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3030

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3031
  %sub11 = sub nsw i32 0, %8, !dbg !3033
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3034
  br label %if.end13, !dbg !3035

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3036
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3038
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3039
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3040
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3041
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3042
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3043
  %conv = zext i8 %12 to i32, !dbg !3043
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3045
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3046

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3047
  store i32 %13, i32* %retval, align 4, !dbg !3049
  br label %return, !dbg !3049

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3050
  %sub18 = sub i32 0, %14, !dbg !3052
  store i32 %sub18, i32* %retval, align 4, !dbg !3053
  br label %return, !dbg !3053

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3054
  ret i32 %15, !dbg !3054
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3055 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3058, metadata !DIExpression()), !dbg !3059
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3060, metadata !DIExpression()), !dbg !3061
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3062, metadata !DIExpression()), !dbg !3063
  store i32 0, i32* %u32Temp1, align 4, !dbg !3063
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3064, metadata !DIExpression()), !dbg !3065
  store i32 0, i32* %u32Temp2, align 4, !dbg !3065
  %0 = load i32, i32* %value.addr, align 4, !dbg !3066
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3067
  %conv = zext i8 %1 to i32, !dbg !3067
  %mul = mul i32 %0, %conv, !dbg !3068
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3069
  %2 = load i32, i32* %value.addr, align 4, !dbg !3070
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3071
  %conv1 = zext i8 %3 to i32, !dbg !3071
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3072
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3073
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3074
  %shr = lshr i32 %4, 8, !dbg !3075
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3076
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3077
  %shl = shl i32 %5, 24, !dbg !3078
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3079
  %or = or i32 %6, %shl, !dbg !3079
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3079
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3080
  ret i32 %7, !dbg !3081
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3082 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3083, metadata !DIExpression()), !dbg !3084
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3085, metadata !DIExpression()), !dbg !3086
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3087, metadata !DIExpression()), !dbg !3088
  store i32 0, i32* %u32Temp1, align 4, !dbg !3088
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3089, metadata !DIExpression()), !dbg !3090
  store i32 0, i32* %u32Temp2, align 4, !dbg !3090
  %0 = load i32, i32* %value.addr, align 4, !dbg !3091
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3092
  %conv = zext i8 %1 to i32, !dbg !3092
  %mul = mul i32 %0, %conv, !dbg !3093
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3094
  %2 = load i32, i32* %value.addr, align 4, !dbg !3095
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3096
  %conv1 = zext i8 %3 to i32, !dbg !3096
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3097
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3098
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3099
  %shr = lshr i32 %4, 7, !dbg !3100
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3101
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3102
  %shl = shl i32 %5, 25, !dbg !3103
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3104
  %or = or i32 %6, %shl, !dbg !3104
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3104
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3105
  %shr2 = lshr i32 %7, 7, !dbg !3107
  %cmp = icmp eq i32 %shr2, 0, !dbg !3108
  br i1 %cmp, label %if.then, label %if.else, !dbg !3109

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3110
  store i32 %8, i32* %retval, align 4, !dbg !3112
  br label %return, !dbg !3112

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3113
  br label %return, !dbg !3113

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3115
  ret i32 %9, !dbg !3115
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3116 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3119, metadata !DIExpression()), !dbg !3120
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3121, metadata !DIExpression()), !dbg !3122
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3123, metadata !DIExpression()), !dbg !3124
  store i32 0, i32* %u32Temp1, align 4, !dbg !3124
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3125, metadata !DIExpression()), !dbg !3126
  store i32 0, i32* %u32Temp2, align 4, !dbg !3126
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3127
  %conv = sext i8 %0 to i32, !dbg !3127
  %cmp = icmp sgt i32 %conv, 0, !dbg !3129
  br i1 %cmp, label %if.then, label %if.else, !dbg !3130

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3131
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3133
  %conv2 = sext i8 %2 to i32, !dbg !3133
  %mul = mul i32 %1, %conv2, !dbg !3134
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3135
  %3 = load i32, i32* %value.addr, align 4, !dbg !3136
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3137
  %conv3 = sext i8 %4 to i32, !dbg !3137
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3138
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3139
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3140
  %shr = lshr i32 %5, 7, !dbg !3141
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3142
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3143
  %shl = shl i32 %6, 25, !dbg !3144
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3145
  %or = or i32 %7, %shl, !dbg !3145
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3145
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3146
  store i32 %8, i32* %retval, align 4, !dbg !3147
  br label %return, !dbg !3147

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3148
  br label %return, !dbg !3148

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3150
  ret i32 %9, !dbg !3150
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3151 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3152, metadata !DIExpression()), !dbg !3153
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3154, metadata !DIExpression()), !dbg !3155
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3156, metadata !DIExpression()), !dbg !3157
  store i32 0, i32* %u32Temp1, align 4, !dbg !3157
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3158, metadata !DIExpression()), !dbg !3159
  store i32 0, i32* %u32Temp2, align 4, !dbg !3159
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3160
  %conv = sext i8 %0 to i32, !dbg !3160
  %cmp = icmp sle i32 %conv, 0, !dbg !3162
  br i1 %cmp, label %if.then, label %if.else, !dbg !3163

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3164
  br label %return, !dbg !3164

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3166
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3168
  %conv2 = sext i8 %2 to i32, !dbg !3168
  %mul = mul i32 %1, %conv2, !dbg !3169
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3170
  %3 = load i32, i32* %value.addr, align 4, !dbg !3171
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3172
  %conv3 = sext i8 %4 to i32, !dbg !3172
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3173
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3174
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3175
  %shr = lshr i32 %5, 6, !dbg !3176
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3177
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3178
  %shl = shl i32 %6, 26, !dbg !3179
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3180
  %or = or i32 %7, %shl, !dbg !3180
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3180
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3181
  %shr4 = lshr i32 %8, 6, !dbg !3183
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3184
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3185

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3186
  store i32 %9, i32* %retval, align 4, !dbg !3188
  br label %return, !dbg !3188

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3189
  br label %return, !dbg !3189

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3191
  ret i32 %10, !dbg !3191
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3192 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3193, metadata !DIExpression()), !dbg !3194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3195, metadata !DIExpression()), !dbg !3196
  %0 = load i16, i16* %value.addr, align 2, !dbg !3197
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3198
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3199
  ret i16 %call, !dbg !3200
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3201 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3202, metadata !DIExpression()), !dbg !3203
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3204, metadata !DIExpression()), !dbg !3205
  %0 = load i16, i16* %value.addr, align 2, !dbg !3206
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3207
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3208
  ret i16 %call, !dbg !3209
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3210 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3211, metadata !DIExpression()), !dbg !3212
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3213, metadata !DIExpression()), !dbg !3214
  %0 = load i16, i16* %value.addr, align 2, !dbg !3215
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3216
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3217
  ret i16 %call, !dbg !3218
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3219 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3220, metadata !DIExpression()), !dbg !3221
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3222, metadata !DIExpression()), !dbg !3223
  %0 = load i16, i16* %value.addr, align 2, !dbg !3224
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3225
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3226
  ret i16 %call, !dbg !3227
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3228 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3229, metadata !DIExpression()), !dbg !3230
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3231, metadata !DIExpression()), !dbg !3232
  %0 = load i16, i16* %value.addr, align 2, !dbg !3233
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3234
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3235
  ret i16 %call, !dbg !3236
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3237 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3238, metadata !DIExpression()), !dbg !3239
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3240, metadata !DIExpression()), !dbg !3241
  %0 = load i16, i16* %value.addr, align 2, !dbg !3242
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3243
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3244
  ret i16 %call, !dbg !3245
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3246 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3247, metadata !DIExpression()), !dbg !3248
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3249, metadata !DIExpression()), !dbg !3250
  %0 = load i16, i16* %value.addr, align 2, !dbg !3251
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3252
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3253
  ret i16 %call, !dbg !3254
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3255 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3256, metadata !DIExpression()), !dbg !3257
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3258, metadata !DIExpression()), !dbg !3259
  %0 = load i16, i16* %value.addr, align 2, !dbg !3260
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3261
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3262
  ret i16 %call, !dbg !3263
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3264 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3265, metadata !DIExpression()), !dbg !3266
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3267, metadata !DIExpression()), !dbg !3268
  %0 = load i16, i16* %value.addr, align 2, !dbg !3269
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3270
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3271
  ret i16 %call, !dbg !3272
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3273 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3274, metadata !DIExpression()), !dbg !3275
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3276, metadata !DIExpression()), !dbg !3277
  %0 = load i16, i16* %value.addr, align 2, !dbg !3278
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3279
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3280
  ret i16 %call, !dbg !3281
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3282 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3283, metadata !DIExpression()), !dbg !3284
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3285, metadata !DIExpression()), !dbg !3286
  %0 = load i16, i16* %value.addr, align 2, !dbg !3287
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3288
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3289
  ret i16 %call, !dbg !3290
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3291 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3292, metadata !DIExpression()), !dbg !3293
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3294, metadata !DIExpression()), !dbg !3295
  %0 = load i16, i16* %value.addr, align 2, !dbg !3296
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3297
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3298
  ret i16 %call, !dbg !3299
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3300 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3301, metadata !DIExpression()), !dbg !3302
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3303, metadata !DIExpression()), !dbg !3304
  %0 = load i16, i16* %value.addr, align 2, !dbg !3305
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3306
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3307
  ret i16 %call, !dbg !3308
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3309 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3310, metadata !DIExpression()), !dbg !3311
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3312, metadata !DIExpression()), !dbg !3313
  %0 = load i16, i16* %value.addr, align 2, !dbg !3314
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3315
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3316
  ret i16 %call, !dbg !3317
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3318 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3319, metadata !DIExpression()), !dbg !3320
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3321, metadata !DIExpression()), !dbg !3322
  %0 = load i16, i16* %value.addr, align 2, !dbg !3323
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3324
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3325
  ret i16 %call, !dbg !3326
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3327 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3328, metadata !DIExpression()), !dbg !3329
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3330, metadata !DIExpression()), !dbg !3331
  %0 = load i16, i16* %value.addr, align 2, !dbg !3332
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3333
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3334
  %2 = load i16, i16* %retval, align 2, !dbg !3335
  ret i16 %2, !dbg !3335
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3336 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3337, metadata !DIExpression()), !dbg !3338
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3339, metadata !DIExpression()), !dbg !3340
  %0 = load i16, i16* %value.addr, align 2, !dbg !3341
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3342
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3343
  ret i16 %call, !dbg !3344
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3345 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3346, metadata !DIExpression()), !dbg !3347
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3348, metadata !DIExpression()), !dbg !3349
  %0 = load i16, i16* %value.addr, align 2, !dbg !3350
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3351
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3352
  ret i16 %call, !dbg !3353
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3354 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3355, metadata !DIExpression()), !dbg !3356
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3357, metadata !DIExpression()), !dbg !3358
  %0 = load i16, i16* %value.addr, align 2, !dbg !3359
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3360
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3361
  ret i16 %call, !dbg !3362
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3363 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3364, metadata !DIExpression()), !dbg !3365
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3366, metadata !DIExpression()), !dbg !3367
  %0 = load i16, i16* %value.addr, align 2, !dbg !3368
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3369
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3370
  ret i16 %call, !dbg !3371
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3372 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3373, metadata !DIExpression()), !dbg !3374
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3375, metadata !DIExpression()), !dbg !3376
  %0 = load i16, i16* %value.addr, align 2, !dbg !3377
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3378
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3379
  ret i16 %call, !dbg !3380
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3381 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3382, metadata !DIExpression()), !dbg !3383
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3384, metadata !DIExpression()), !dbg !3385
  %0 = load i16, i16* %value.addr, align 2, !dbg !3386
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3387
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3388
  ret i16 %call, !dbg !3389
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3390 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3391, metadata !DIExpression()), !dbg !3392
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3393, metadata !DIExpression()), !dbg !3394
  %0 = load i16, i16* %value.addr, align 2, !dbg !3395
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3396
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3397
  ret i16 %call, !dbg !3398
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3399 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3400, metadata !DIExpression()), !dbg !3401
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3402, metadata !DIExpression()), !dbg !3403
  %0 = load i16, i16* %value.addr, align 2, !dbg !3404
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3405
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3406
  ret i16 %call, !dbg !3407
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3408 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3409, metadata !DIExpression()), !dbg !3410
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3411, metadata !DIExpression()), !dbg !3412
  %0 = load i16, i16* %value.addr, align 2, !dbg !3413
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3414
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3415
  ret i16 %call, !dbg !3416
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3417 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3418, metadata !DIExpression()), !dbg !3419
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  %0 = load i16, i16* %value.addr, align 2, !dbg !3422
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3423
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3424
  ret i16 %call, !dbg !3425
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3426 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3427, metadata !DIExpression()), !dbg !3428
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3429, metadata !DIExpression()), !dbg !3430
  %0 = load i16, i16* %value.addr, align 2, !dbg !3431
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3432
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3433
  ret i16 %call, !dbg !3434
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3435 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3436, metadata !DIExpression()), !dbg !3437
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3438, metadata !DIExpression()), !dbg !3439
  %0 = load i16, i16* %value.addr, align 2, !dbg !3440
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3441
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3442
  ret i16 %call, !dbg !3443
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3444 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3445, metadata !DIExpression()), !dbg !3446
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3447, metadata !DIExpression()), !dbg !3448
  %0 = load i16, i16* %value.addr, align 2, !dbg !3449
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3450
  %conv = zext i8 %1 to i16, !dbg !3451
  %conv1 = zext i16 %conv to i32, !dbg !3451
  %shl = shl i32 %conv1, 5, !dbg !3452
  %conv2 = trunc i32 %shl to i16, !dbg !3453
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3454
  ret i16 %call, !dbg !3455
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3456 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3457, metadata !DIExpression()), !dbg !3458
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3459, metadata !DIExpression()), !dbg !3460
  %0 = load i16, i16* %value.addr, align 2, !dbg !3461
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3462
  %conv = zext i8 %1 to i16, !dbg !3463
  %conv1 = zext i16 %conv to i32, !dbg !3463
  %shl = shl i32 %conv1, 6, !dbg !3464
  %conv2 = trunc i32 %shl to i16, !dbg !3465
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3466
  ret i16 %call, !dbg !3467
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3468 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3469, metadata !DIExpression()), !dbg !3470
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3471, metadata !DIExpression()), !dbg !3472
  %0 = load i16, i16* %value.addr, align 2, !dbg !3473
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3474
  %conv = zext i8 %1 to i16, !dbg !3475
  %conv1 = zext i16 %conv to i32, !dbg !3475
  %shl = shl i32 %conv1, 7, !dbg !3476
  %conv2 = trunc i32 %shl to i16, !dbg !3477
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3478
  ret i16 %call, !dbg !3479
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3480 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3481, metadata !DIExpression()), !dbg !3482
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3483, metadata !DIExpression()), !dbg !3484
  %0 = load i16, i16* %value.addr, align 2, !dbg !3485
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3486
  %conv = zext i8 %1 to i16, !dbg !3487
  %conv1 = zext i16 %conv to i32, !dbg !3487
  %shl = shl i32 %conv1, 7, !dbg !3488
  %conv2 = trunc i32 %shl to i16, !dbg !3489
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3490
  ret i16 %call, !dbg !3491
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3492 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3493, metadata !DIExpression()), !dbg !3494
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3495, metadata !DIExpression()), !dbg !3496
  %0 = load i16, i16* %value.addr, align 2, !dbg !3497
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3498
  %conv = zext i8 %1 to i16, !dbg !3499
  %conv1 = zext i16 %conv to i32, !dbg !3499
  %shl = shl i32 %conv1, 4, !dbg !3500
  %conv2 = trunc i32 %shl to i16, !dbg !3501
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3502
  ret i16 %call, !dbg !3503
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3504 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3505, metadata !DIExpression()), !dbg !3506
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3507, metadata !DIExpression()), !dbg !3508
  %0 = load i16, i16* %value.addr, align 2, !dbg !3509
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3510
  %conv = zext i8 %1 to i16, !dbg !3511
  %conv1 = zext i16 %conv to i32, !dbg !3511
  %shl = shl i32 %conv1, 5, !dbg !3512
  %conv2 = trunc i32 %shl to i16, !dbg !3513
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3514
  ret i16 %call, !dbg !3515
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3516 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3517, metadata !DIExpression()), !dbg !3518
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3519, metadata !DIExpression()), !dbg !3520
  %0 = load i16, i16* %value.addr, align 2, !dbg !3521
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3522
  %conv = zext i8 %1 to i16, !dbg !3523
  %conv1 = zext i16 %conv to i32, !dbg !3523
  %shl = shl i32 %conv1, 2, !dbg !3524
  %conv2 = trunc i32 %shl to i16, !dbg !3525
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3526
  ret i16 %call, !dbg !3527
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3528 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3529, metadata !DIExpression()), !dbg !3530
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3531, metadata !DIExpression()), !dbg !3532
  %0 = load i16, i16* %value.addr, align 2, !dbg !3533
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3534
  %conv = zext i8 %1 to i16, !dbg !3535
  %conv1 = zext i16 %conv to i32, !dbg !3535
  %shl = shl i32 %conv1, 6, !dbg !3536
  %conv2 = trunc i32 %shl to i16, !dbg !3537
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3538
  ret i16 %call, !dbg !3539
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3540 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3541, metadata !DIExpression()), !dbg !3542
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3543, metadata !DIExpression()), !dbg !3544
  %0 = load i16, i16* %value.addr, align 2, !dbg !3545
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3546
  %conv = zext i8 %1 to i16, !dbg !3547
  %conv1 = zext i16 %conv to i32, !dbg !3547
  %shl = shl i32 %conv1, 3, !dbg !3548
  %conv2 = trunc i32 %shl to i16, !dbg !3549
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3550
  ret i16 %call, !dbg !3551
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3552 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3553, metadata !DIExpression()), !dbg !3554
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3555, metadata !DIExpression()), !dbg !3556
  %0 = load i32, i32* %value.addr, align 4, !dbg !3557
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3558
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3559
  ret i32 %call, !dbg !3560
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3561 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3564, metadata !DIExpression()), !dbg !3565
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3566, metadata !DIExpression()), !dbg !3567
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3568, metadata !DIExpression()), !dbg !3569
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3570, metadata !DIExpression()), !dbg !3571
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3572, metadata !DIExpression()), !dbg !3573
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3574, metadata !DIExpression()), !dbg !3575
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3576, metadata !DIExpression()), !dbg !3577
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3578, metadata !DIExpression()), !dbg !3579
  %0 = load i32, i32* %value.addr, align 4, !dbg !3580
  %cmp = icmp slt i32 %0, 0, !dbg !3582
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3583

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3584
  %conv = sext i16 %1 to i32, !dbg !3584
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3585
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3586

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3587
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3588
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3589

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3590
  %conv6 = sext i16 %3 to i32, !dbg !3590
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3591
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3592

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3593
  br label %if.end, !dbg !3595

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3596
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3598
  %cmp9 = icmp slt i32 %4, 0, !dbg !3600
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3601

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3602
  %sub = sub nsw i32 0, %5, !dbg !3604
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3605
  br label %if.end13, !dbg !3606

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3607
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3609
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3610
  %conv14 = sext i16 %7 to i32, !dbg !3610
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3612
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3613

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3614
  %conv18 = sext i16 %8 to i32, !dbg !3614
  %sub19 = sub nsw i32 0, %conv18, !dbg !3616
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3617
  br label %if.end22, !dbg !3618

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3619
  %conv21 = sext i16 %9 to i32, !dbg !3619
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3621
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3622
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3623
  %mul = mul i32 %10, %11, !dbg !3624
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3625
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3626
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3627
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3628
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3629
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3630
  %15 = load i32, i32* %count.addr, align 4, !dbg !3631
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3632
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3632
  %shr = lshr i32 %14, %15, !dbg !3632, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3633
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3634
  %17 = load i32, i32* %count.addr, align 4, !dbg !3635
  %sub23 = sub i32 32, %17, !dbg !3636
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3637
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3637
  %shl = shl i32 %16, %sub23, !dbg !3637, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3638
  %or = or i32 %18, %shl, !dbg !3638
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3638
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3639
  %20 = load i32, i32* %count.addr, align 4, !dbg !3641
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3642
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3642
  %shr24 = lshr i32 %19, %20, !dbg !3642, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3643
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3644

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3645
  %conv28 = zext i8 %21 to i32, !dbg !3645
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3648
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3649

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3650
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3653
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3654

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3655
  store i32 %23, i32* %retval, align 4, !dbg !3656
  br label %return, !dbg !3656

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3657
  br label %return, !dbg !3657

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3658
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3661
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3662

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3663
  %sub40 = sub i32 0, %25, !dbg !3664
  store i32 %sub40, i32* %retval, align 4, !dbg !3665
  br label %return, !dbg !3665

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3666
  br label %return, !dbg !3666

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3667
  br label %return, !dbg !3667

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3669
  ret i32 %26, !dbg !3669
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3670 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3671, metadata !DIExpression()), !dbg !3672
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3673, metadata !DIExpression()), !dbg !3674
  %0 = load i32, i32* %value.addr, align 4, !dbg !3675
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3676
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3677
  ret i32 %call, !dbg !3678
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3679 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3682, metadata !DIExpression()), !dbg !3683
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3684, metadata !DIExpression()), !dbg !3685
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3686, metadata !DIExpression()), !dbg !3687
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3688, metadata !DIExpression()), !dbg !3689
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3690, metadata !DIExpression()), !dbg !3691
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3692, metadata !DIExpression()), !dbg !3693
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3694, metadata !DIExpression()), !dbg !3695
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3696, metadata !DIExpression()), !dbg !3697
  %0 = load i32, i32* %value.addr, align 4, !dbg !3698
  %cmp = icmp slt i32 %0, 0, !dbg !3700
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3701

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3702
  %conv = sext i8 %1 to i32, !dbg !3702
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3703
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3704

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3705
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3706
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3707

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3708
  %conv6 = sext i8 %3 to i32, !dbg !3708
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3709
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3710

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3711
  br label %if.end, !dbg !3713

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3714
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3716
  %cmp9 = icmp slt i32 %4, 0, !dbg !3718
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3719

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3720
  %sub = sub nsw i32 0, %5, !dbg !3722
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3723
  br label %if.end13, !dbg !3724

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3725
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3727
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3728
  %conv14 = sext i8 %7 to i32, !dbg !3728
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3730
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3731

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3732
  %conv18 = sext i8 %8 to i32, !dbg !3732
  %sub19 = sub nsw i32 0, %conv18, !dbg !3734
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3735
  br label %if.end22, !dbg !3736

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3737
  %conv21 = sext i8 %9 to i32, !dbg !3737
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3739
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3740
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3741
  %mul = mul i32 %10, %11, !dbg !3742
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3743
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3744
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3745
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3746
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3747
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3748
  %15 = load i32, i32* %count.addr, align 4, !dbg !3749
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3750
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3750
  %shr = lshr i32 %14, %15, !dbg !3750, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3751
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3752
  %17 = load i32, i32* %count.addr, align 4, !dbg !3753
  %sub23 = sub i32 32, %17, !dbg !3754
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3755
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3755
  %shl = shl i32 %16, %sub23, !dbg !3755, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3756
  %or = or i32 %18, %shl, !dbg !3756
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3756
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3757
  %20 = load i32, i32* %count.addr, align 4, !dbg !3759
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3760
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3760
  %shr24 = lshr i32 %19, %20, !dbg !3760, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3761
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3762

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3763
  %conv28 = zext i8 %21 to i32, !dbg !3763
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3766
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3767

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3768
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3771
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3772

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3773
  store i32 %23, i32* %retval, align 4, !dbg !3774
  br label %return, !dbg !3774

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3775
  br label %return, !dbg !3775

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3776
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3779
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3780

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3781
  %sub40 = sub i32 0, %25, !dbg !3782
  store i32 %sub40, i32* %retval, align 4, !dbg !3783
  br label %return, !dbg !3783

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3784
  br label %return, !dbg !3784

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3785
  br label %return, !dbg !3785

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3787
  ret i32 %26, !dbg !3787
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3788 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3789, metadata !DIExpression()), !dbg !3790
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3791, metadata !DIExpression()), !dbg !3792
  %0 = load i32, i32* %value.addr, align 4, !dbg !3793
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3794
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3795
  ret i32 %call, !dbg !3796
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3797 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3800, metadata !DIExpression()), !dbg !3801
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3802, metadata !DIExpression()), !dbg !3803
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3804, metadata !DIExpression()), !dbg !3805
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3806, metadata !DIExpression()), !dbg !3807
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3808, metadata !DIExpression()), !dbg !3809
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3810, metadata !DIExpression()), !dbg !3811
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3812, metadata !DIExpression()), !dbg !3813
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3814, metadata !DIExpression()), !dbg !3815
  %0 = load i32, i32* %value.addr, align 4, !dbg !3816
  %cmp = icmp slt i32 %0, 0, !dbg !3818
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3819

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3820
  %conv = zext i16 %1 to i32, !dbg !3820
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3821
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3822

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3823
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3824
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3825

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3826
  %conv6 = zext i16 %3 to i32, !dbg !3826
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3827
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3828

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3829
  br label %if.end, !dbg !3831

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3832
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3834
  %cmp9 = icmp slt i32 %4, 0, !dbg !3836
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3837

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3838
  %sub = sub nsw i32 0, %5, !dbg !3840
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3841
  br label %if.end13, !dbg !3842

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3843
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3845
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3846
  %conv14 = zext i16 %7 to i32, !dbg !3846
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3848
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3849

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3850
  %conv18 = zext i16 %8 to i32, !dbg !3850
  %sub19 = sub nsw i32 0, %conv18, !dbg !3852
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3853
  br label %if.end22, !dbg !3854

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3855
  %conv21 = zext i16 %9 to i32, !dbg !3855
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3857
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3858
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3859
  %mul = mul i32 %10, %11, !dbg !3860
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3861
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3862
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3863
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3864
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3865
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3866
  %15 = load i32, i32* %count.addr, align 4, !dbg !3867
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3868
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3868
  %shr = lshr i32 %14, %15, !dbg !3868, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3869
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3870
  %17 = load i32, i32* %count.addr, align 4, !dbg !3871
  %sub23 = sub i32 32, %17, !dbg !3872
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3873
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3873
  %shl = shl i32 %16, %sub23, !dbg !3873, !klee.check.shift !258
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3874
  %or = or i32 %18, %shl, !dbg !3874
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3874
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3875
  %20 = load i32, i32* %count.addr, align 4, !dbg !3877
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3878
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3878
  %shr24 = lshr i32 %19, %20, !dbg !3878, !klee.check.shift !258
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3879
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3880

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3881
  %conv28 = zext i8 %21 to i32, !dbg !3881
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3884
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3885

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3886
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3889
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3890

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3891
  store i32 %23, i32* %retval, align 4, !dbg !3892
  br label %return, !dbg !3892

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3893
  br label %return, !dbg !3893

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3894
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3897
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3898

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3899
  %sub40 = sub i32 0, %25, !dbg !3900
  store i32 %sub40, i32* %retval, align 4, !dbg !3901
  br label %return, !dbg !3901

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3902
  br label %return, !dbg !3902

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3903
  br label %return, !dbg !3903

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3905
  ret i32 %26, !dbg !3905
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3906 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3907, metadata !DIExpression()), !dbg !3908
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3909, metadata !DIExpression()), !dbg !3910
  %0 = load i32, i32* %value.addr, align 4, !dbg !3911
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3912
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3913
  ret i32 %call, !dbg !3914
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3915 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3918, metadata !DIExpression()), !dbg !3919
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3920, metadata !DIExpression()), !dbg !3921
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3922, metadata !DIExpression()), !dbg !3923
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3924, metadata !DIExpression()), !dbg !3925
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3926, metadata !DIExpression()), !dbg !3927
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3928, metadata !DIExpression()), !dbg !3929
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3930, metadata !DIExpression()), !dbg !3931
  %0 = load i32, i32* %value.addr, align 4, !dbg !3932
  %cmp = icmp slt i32 %0, 0, !dbg !3934
  br i1 %cmp, label %if.then, label %if.else, !dbg !3935

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3936
  %1 = load i32, i32* %value.addr, align 4, !dbg !3938
  %sub = sub nsw i32 0, %1, !dbg !3939
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3940
  br label %if.end, !dbg !3941

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3942
  %2 = load i32, i32* %value.addr, align 4, !dbg !3944
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3945
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3946
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3947
  %conv = zext i8 %4 to i32, !dbg !3947
  %mul = mul i32 %3, %conv, !dbg !3948
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3949
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3950
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3951
  %conv1 = zext i8 %6 to i32, !dbg !3951
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3952
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3953
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3954
  %8 = load i32, i32* %count.addr, align 4, !dbg !3955
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3956
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3956
  %shr = lshr i32 %7, %8, !dbg !3956, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3957
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3958
  %10 = load i32, i32* %count.addr, align 4, !dbg !3959
  %sub2 = sub i32 32, %10, !dbg !3960
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3961
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3961
  %shl = shl i32 %9, %sub2, !dbg !3961, !klee.check.shift !258
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3962
  %or = or i32 %11, %shl, !dbg !3962
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3962
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3963
  %13 = load i32, i32* %count.addr, align 4, !dbg !3965
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3966
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3966
  %shr3 = lshr i32 %12, %13, !dbg !3966, !klee.check.shift !258
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3967
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3968

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3969
  %conv7 = zext i8 %14 to i32, !dbg !3969
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3972
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3973

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3974
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3977
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3978

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3979
  store i32 %16, i32* %retval, align 4, !dbg !3980
  br label %return, !dbg !3980

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3981
  br label %return, !dbg !3981

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3982
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3985
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3986

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3987
  %sub19 = sub i32 0, %18, !dbg !3989
  store i32 %sub19, i32* %retval, align 4, !dbg !3990
  br label %return, !dbg !3990

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3991
  br label %return, !dbg !3991

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3993
  %conv22 = zext i8 %19 to i32, !dbg !3993
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3996
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3997

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3998
  br label %return, !dbg !3998

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !4000
  br label %return, !dbg !4000

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !4002
  ret i32 %20, !dbg !4002
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !4003 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4004, metadata !DIExpression()), !dbg !4005
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4006, metadata !DIExpression()), !dbg !4007
  %0 = load i8, i8* %value.addr, align 1, !dbg !4008
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4009
  %conv = zext i8 %1 to i16, !dbg !4010
  %conv1 = zext i16 %conv to i32, !dbg !4010
  %shl = shl i32 %conv1, 5, !dbg !4011
  %conv2 = trunc i32 %shl to i16, !dbg !4012
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4013
  ret i8 %call, !dbg !4014
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4015 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4016, metadata !DIExpression()), !dbg !4017
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4018, metadata !DIExpression()), !dbg !4019
  %0 = load i8, i8* %value.addr, align 1, !dbg !4020
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4021
  %conv = zext i8 %1 to i16, !dbg !4022
  %conv1 = zext i16 %conv to i32, !dbg !4022
  %shl = shl i32 %conv1, 6, !dbg !4023
  %conv2 = trunc i32 %shl to i16, !dbg !4024
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4025
  ret i8 %call, !dbg !4026
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4027 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4028, metadata !DIExpression()), !dbg !4029
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4030, metadata !DIExpression()), !dbg !4031
  %0 = load i8, i8* %value.addr, align 1, !dbg !4032
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4033
  %conv = zext i8 %1 to i16, !dbg !4034
  %conv1 = zext i16 %conv to i32, !dbg !4034
  %shl = shl i32 %conv1, 7, !dbg !4035
  %conv2 = trunc i32 %shl to i16, !dbg !4036
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4037
  ret i8 %call, !dbg !4038
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4039 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4040, metadata !DIExpression()), !dbg !4041
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4042, metadata !DIExpression()), !dbg !4043
  %0 = load i8, i8* %value.addr, align 1, !dbg !4044
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4045
  %conv = zext i8 %1 to i16, !dbg !4046
  %conv1 = zext i16 %conv to i32, !dbg !4046
  %shl = shl i32 %conv1, 7, !dbg !4047
  %conv2 = trunc i32 %shl to i16, !dbg !4048
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4049
  ret i8 %call, !dbg !4050
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4051 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4052, metadata !DIExpression()), !dbg !4053
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4054, metadata !DIExpression()), !dbg !4055
  %0 = load i8, i8* %value.addr, align 1, !dbg !4056
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4057
  %conv = zext i8 %1 to i16, !dbg !4058
  %conv1 = zext i16 %conv to i32, !dbg !4058
  %shl = shl i32 %conv1, 4, !dbg !4059
  %conv2 = trunc i32 %shl to i16, !dbg !4060
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4061
  ret i8 %call, !dbg !4062
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4063 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4064, metadata !DIExpression()), !dbg !4065
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4066, metadata !DIExpression()), !dbg !4067
  %0 = load i8, i8* %value.addr, align 1, !dbg !4068
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4069
  %conv = zext i8 %1 to i16, !dbg !4070
  %conv1 = zext i16 %conv to i32, !dbg !4070
  %shl = shl i32 %conv1, 5, !dbg !4071
  %conv2 = trunc i32 %shl to i16, !dbg !4072
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4073
  ret i8 %call, !dbg !4074
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4075 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4076, metadata !DIExpression()), !dbg !4077
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4078, metadata !DIExpression()), !dbg !4079
  %0 = load i8, i8* %value.addr, align 1, !dbg !4080
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4081
  %conv = zext i8 %1 to i16, !dbg !4082
  %conv1 = zext i16 %conv to i32, !dbg !4082
  %shl = shl i32 %conv1, 2, !dbg !4083
  %conv2 = trunc i32 %shl to i16, !dbg !4084
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4085
  ret i8 %call, !dbg !4086
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4087 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4088, metadata !DIExpression()), !dbg !4089
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4090, metadata !DIExpression()), !dbg !4091
  %0 = load i8, i8* %value.addr, align 1, !dbg !4092
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4093
  %conv = zext i8 %1 to i16, !dbg !4094
  %conv1 = zext i16 %conv to i32, !dbg !4094
  %shl = shl i32 %conv1, 6, !dbg !4095
  %conv2 = trunc i32 %shl to i16, !dbg !4096
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4097
  ret i8 %call, !dbg !4098
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4099 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4100, metadata !DIExpression()), !dbg !4101
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4102, metadata !DIExpression()), !dbg !4103
  %0 = load i8, i8* %value.addr, align 1, !dbg !4104
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4105
  %conv = zext i8 %1 to i16, !dbg !4106
  %conv1 = zext i16 %conv to i32, !dbg !4106
  %shl = shl i32 %conv1, 3, !dbg !4107
  %conv2 = trunc i32 %shl to i16, !dbg !4108
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4109
  ret i8 %call, !dbg !4110
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4111 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4112, metadata !DIExpression()), !dbg !4113
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4114, metadata !DIExpression()), !dbg !4115
  %0 = load i16, i16* %value.addr, align 2, !dbg !4116
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4117
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4118
  ret i16 %call, !dbg !4119
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4120 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4121, metadata !DIExpression()), !dbg !4122
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4123, metadata !DIExpression()), !dbg !4124
  %0 = load i16, i16* %value.addr, align 2, !dbg !4125
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4126
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4127
  ret i16 %call, !dbg !4128
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4129 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4130, metadata !DIExpression()), !dbg !4131
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4132, metadata !DIExpression()), !dbg !4133
  %0 = load i16, i16* %value.addr, align 2, !dbg !4134
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4135
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4136
  ret i16 %call, !dbg !4137
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4138 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4139, metadata !DIExpression()), !dbg !4140
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4141, metadata !DIExpression()), !dbg !4142
  %0 = load i16, i16* %value.addr, align 2, !dbg !4143
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4144
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4145
  ret i16 %call, !dbg !4146
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4147 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4148, metadata !DIExpression()), !dbg !4149
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4150, metadata !DIExpression()), !dbg !4151
  %0 = load i16, i16* %value.addr, align 2, !dbg !4152
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4153
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4154
  ret i16 %call, !dbg !4155
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4156 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4157, metadata !DIExpression()), !dbg !4158
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4159, metadata !DIExpression()), !dbg !4160
  %0 = load i16, i16* %value.addr, align 2, !dbg !4161
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4162
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4163
  ret i16 %call, !dbg !4164
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4165 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4166, metadata !DIExpression()), !dbg !4167
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4168, metadata !DIExpression()), !dbg !4169
  %0 = load i16, i16* %value.addr, align 2, !dbg !4170
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4171
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4172
  ret i16 %call, !dbg !4173
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4174 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4175, metadata !DIExpression()), !dbg !4176
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4177, metadata !DIExpression()), !dbg !4178
  %0 = load i16, i16* %value.addr, align 2, !dbg !4179
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4180
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4181
  ret i16 %call, !dbg !4182
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4183 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4184, metadata !DIExpression()), !dbg !4185
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4186, metadata !DIExpression()), !dbg !4187
  %0 = load i16, i16* %value.addr, align 2, !dbg !4188
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4189
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4190
  ret i16 %call, !dbg !4191
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4192 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4193, metadata !DIExpression()), !dbg !4194
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4195, metadata !DIExpression()), !dbg !4196
  %0 = load i16, i16* %value.addr, align 2, !dbg !4197
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4198
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4199
  ret i16 %call, !dbg !4200
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4201 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4202, metadata !DIExpression()), !dbg !4203
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4204, metadata !DIExpression()), !dbg !4205
  %0 = load i16, i16* %value.addr, align 2, !dbg !4206
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4207
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4208
  ret i16 %call, !dbg !4209
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4210 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4211, metadata !DIExpression()), !dbg !4212
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4213, metadata !DIExpression()), !dbg !4214
  %0 = load i16, i16* %value.addr, align 2, !dbg !4215
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4216
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4217
  ret i16 %call, !dbg !4218
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4219 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4220, metadata !DIExpression()), !dbg !4221
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4222, metadata !DIExpression()), !dbg !4223
  %0 = load i16, i16* %value.addr, align 2, !dbg !4224
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4225
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4226
  ret i16 %call, !dbg !4227
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4228 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4229, metadata !DIExpression()), !dbg !4230
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4231, metadata !DIExpression()), !dbg !4232
  %0 = load i16, i16* %value.addr, align 2, !dbg !4233
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4234
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4235
  ret i16 %call, !dbg !4236
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4237 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4238, metadata !DIExpression()), !dbg !4239
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4240, metadata !DIExpression()), !dbg !4241
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4242
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4243
  %conv = zext i8 %1 to i16, !dbg !4244
  %conv1 = zext i16 %conv to i32, !dbg !4244
  %shl = shl i32 %conv1, 5, !dbg !4245
  %conv2 = trunc i32 %shl to i16, !dbg !4246
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4247
  ret i16 %call, !dbg !4248
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4249 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4250, metadata !DIExpression()), !dbg !4251
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4252, metadata !DIExpression()), !dbg !4253
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4254
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4255
  %conv = zext i8 %1 to i16, !dbg !4256
  %conv1 = zext i16 %conv to i32, !dbg !4256
  %shl = shl i32 %conv1, 6, !dbg !4257
  %conv2 = trunc i32 %shl to i16, !dbg !4258
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4259
  ret i16 %call, !dbg !4260
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4261 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4262, metadata !DIExpression()), !dbg !4263
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4264, metadata !DIExpression()), !dbg !4265
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4266
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4267
  %conv = zext i8 %1 to i16, !dbg !4268
  %conv1 = zext i16 %conv to i32, !dbg !4268
  %shl = shl i32 %conv1, 7, !dbg !4269
  %conv2 = trunc i32 %shl to i16, !dbg !4270
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4271
  ret i16 %call, !dbg !4272
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4273 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4274, metadata !DIExpression()), !dbg !4275
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4276, metadata !DIExpression()), !dbg !4277
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4278
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4279
  %conv = zext i8 %1 to i16, !dbg !4280
  %conv1 = zext i16 %conv to i32, !dbg !4280
  %shl = shl i32 %conv1, 7, !dbg !4281
  %conv2 = trunc i32 %shl to i16, !dbg !4282
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4283
  ret i16 %call, !dbg !4284
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4285 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4286, metadata !DIExpression()), !dbg !4287
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4288, metadata !DIExpression()), !dbg !4289
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4290
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4291
  %conv = zext i8 %1 to i16, !dbg !4292
  %conv1 = zext i16 %conv to i32, !dbg !4292
  %shl = shl i32 %conv1, 4, !dbg !4293
  %conv2 = trunc i32 %shl to i16, !dbg !4294
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4295
  ret i16 %call, !dbg !4296
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4297 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4298, metadata !DIExpression()), !dbg !4299
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4300, metadata !DIExpression()), !dbg !4301
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4302
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4303
  %conv = zext i8 %1 to i16, !dbg !4304
  %conv1 = zext i16 %conv to i32, !dbg !4304
  %shl = shl i32 %conv1, 5, !dbg !4305
  %conv2 = trunc i32 %shl to i16, !dbg !4306
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4307
  ret i16 %call, !dbg !4308
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4309 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4310, metadata !DIExpression()), !dbg !4311
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4312, metadata !DIExpression()), !dbg !4313
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4314
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4315
  %conv = zext i8 %1 to i16, !dbg !4316
  %conv1 = zext i16 %conv to i32, !dbg !4316
  %shl = shl i32 %conv1, 2, !dbg !4317
  %conv2 = trunc i32 %shl to i16, !dbg !4318
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4319
  ret i16 %call, !dbg !4320
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4321 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4322, metadata !DIExpression()), !dbg !4323
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4324, metadata !DIExpression()), !dbg !4325
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4326
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4327
  %conv = zext i8 %1 to i16, !dbg !4328
  %conv1 = zext i16 %conv to i32, !dbg !4328
  %shl = shl i32 %conv1, 6, !dbg !4329
  %conv2 = trunc i32 %shl to i16, !dbg !4330
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4331
  ret i16 %call, !dbg !4332
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4333 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4334, metadata !DIExpression()), !dbg !4335
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4336, metadata !DIExpression()), !dbg !4337
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4338
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4339
  %conv = zext i8 %1 to i16, !dbg !4340
  %conv1 = zext i16 %conv to i32, !dbg !4340
  %shl = shl i32 %conv1, 3, !dbg !4341
  %conv2 = trunc i32 %shl to i16, !dbg !4342
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4343
  ret i16 %call, !dbg !4344
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4345 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4346, metadata !DIExpression()), !dbg !4347
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4348, metadata !DIExpression()), !dbg !4349
  %0 = load i32, i32* %value.addr, align 4, !dbg !4350
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4351
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4352
  ret i32 %call, !dbg !4353
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4354 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4357, metadata !DIExpression()), !dbg !4358
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4359, metadata !DIExpression()), !dbg !4360
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4361, metadata !DIExpression()), !dbg !4362
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4363, metadata !DIExpression()), !dbg !4364
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4365, metadata !DIExpression()), !dbg !4366
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4367, metadata !DIExpression()), !dbg !4368
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4369, metadata !DIExpression()), !dbg !4370
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4371
  %conv = sext i16 %0 to i32, !dbg !4371
  %cmp = icmp slt i32 %conv, 0, !dbg !4373
  br i1 %cmp, label %if.then, label %if.else, !dbg !4374

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4375
  br label %if.end, !dbg !4377

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4378
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4380
  %conv2 = sext i16 %1 to i32, !dbg !4380
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4382
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4383

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4384
  %conv6 = sext i16 %2 to i32, !dbg !4384
  %sub = sub nsw i32 0, %conv6, !dbg !4386
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4387
  br label %if.end9, !dbg !4388

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4389
  %conv8 = sext i16 %3 to i32, !dbg !4389
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4391
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4392
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4393
  %mul = mul i32 %4, %5, !dbg !4394
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4395
  %6 = load i32, i32* %value.addr, align 4, !dbg !4396
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4397
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4398
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4399
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4400
  %9 = load i32, i32* %count.addr, align 4, !dbg !4401
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4402
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4402
  %shr = lshr i32 %8, %9, !dbg !4402, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4403
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4404
  %11 = load i32, i32* %count.addr, align 4, !dbg !4405
  %sub10 = sub i32 32, %11, !dbg !4406
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4407
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4407
  %shl = shl i32 %10, %sub10, !dbg !4407, !klee.check.shift !258
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4408
  %or = or i32 %12, %shl, !dbg !4408
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4408
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4409
  %14 = load i32, i32* %count.addr, align 4, !dbg !4411
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4412
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4412
  %shr11 = lshr i32 %13, %14, !dbg !4412, !klee.check.shift !258
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4413
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4414

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4415
  %conv15 = zext i8 %15 to i32, !dbg !4415
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4418
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4419

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4420
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4423
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4424

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4425
  store i32 %17, i32* %retval, align 4, !dbg !4426
  br label %return, !dbg !4426

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4427
  br label %return, !dbg !4427

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4428
  br label %return, !dbg !4428

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4430
  br label %return, !dbg !4430

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4432
  ret i32 %18, !dbg !4432
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4433 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4434, metadata !DIExpression()), !dbg !4435
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4436, metadata !DIExpression()), !dbg !4437
  %0 = load i32, i32* %value.addr, align 4, !dbg !4438
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4439
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4440
  ret i32 %call, !dbg !4441
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4442 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4445, metadata !DIExpression()), !dbg !4446
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4447, metadata !DIExpression()), !dbg !4448
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4449, metadata !DIExpression()), !dbg !4450
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4451, metadata !DIExpression()), !dbg !4452
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4453, metadata !DIExpression()), !dbg !4454
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4455, metadata !DIExpression()), !dbg !4456
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4457
  %cmp = icmp slt i32 %0, 0, !dbg !4459
  br i1 %cmp, label %if.then, label %if.else, !dbg !4460

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4461
  br label %if.end, !dbg !4463

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4464
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4466
  %cmp1 = icmp slt i32 %1, 0, !dbg !4468
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4469

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4470
  %sub = sub nsw i32 0, %2, !dbg !4472
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4473
  br label %if.end4, !dbg !4474

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4475
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4477
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4478
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4479
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4480
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4481
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4482
  %7 = load i32, i32* %count.addr, align 4, !dbg !4483
  %sub5 = sub i32 %7, 32, !dbg !4484
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4485
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4485
  %shr = lshr i32 %6, %sub5, !dbg !4485, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4486
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4487
  %conv = zext i8 %8 to i32, !dbg !4487
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4489
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4490

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4491
  store i32 %9, i32* %retval, align 4, !dbg !4493
  br label %return, !dbg !4493

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4494
  br label %return, !dbg !4494

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4496
  ret i32 %10, !dbg !4496
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4497 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4498, metadata !DIExpression()), !dbg !4499
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4500, metadata !DIExpression()), !dbg !4501
  %0 = load i32, i32* %value.addr, align 4, !dbg !4502
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4503
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4504
  ret i32 %call, !dbg !4505
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4506 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4509, metadata !DIExpression()), !dbg !4510
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4511, metadata !DIExpression()), !dbg !4512
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4513, metadata !DIExpression()), !dbg !4514
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4515, metadata !DIExpression()), !dbg !4516
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4517, metadata !DIExpression()), !dbg !4518
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4519, metadata !DIExpression()), !dbg !4520
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4521, metadata !DIExpression()), !dbg !4522
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4523
  %conv = sext i8 %0 to i32, !dbg !4523
  %cmp = icmp slt i32 %conv, 0, !dbg !4525
  br i1 %cmp, label %if.then, label %if.else, !dbg !4526

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4527
  br label %if.end, !dbg !4529

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4530
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4532
  %conv2 = sext i8 %1 to i32, !dbg !4532
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4534
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4535

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4536
  %conv6 = sext i8 %2 to i32, !dbg !4536
  %sub = sub nsw i32 0, %conv6, !dbg !4538
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4539
  br label %if.end9, !dbg !4540

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4541
  %conv8 = sext i8 %3 to i32, !dbg !4541
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4543
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4544
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4545
  %mul = mul i32 %4, %5, !dbg !4546
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4547
  %6 = load i32, i32* %value.addr, align 4, !dbg !4548
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4549
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4550
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4551
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4552
  %9 = load i32, i32* %count.addr, align 4, !dbg !4553
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4554
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4554
  %shr = lshr i32 %8, %9, !dbg !4554, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4555
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4556
  %11 = load i32, i32* %count.addr, align 4, !dbg !4557
  %sub10 = sub i32 32, %11, !dbg !4558
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4559
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4559
  %shl = shl i32 %10, %sub10, !dbg !4559, !klee.check.shift !258
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4560
  %or = or i32 %12, %shl, !dbg !4560
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4560
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4561
  %14 = load i32, i32* %count.addr, align 4, !dbg !4563
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4564
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4564
  %shr11 = lshr i32 %13, %14, !dbg !4564, !klee.check.shift !258
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4565
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4566

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4567
  %conv15 = zext i8 %15 to i32, !dbg !4567
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4570
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4571

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4572
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4575
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4576

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4577
  store i32 %17, i32* %retval, align 4, !dbg !4578
  br label %return, !dbg !4578

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4579
  br label %return, !dbg !4579

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4580
  br label %return, !dbg !4580

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4582
  br label %return, !dbg !4582

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4584
  ret i32 %18, !dbg !4584
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4585 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4586, metadata !DIExpression()), !dbg !4587
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4588, metadata !DIExpression()), !dbg !4589
  %0 = load i32, i32* %value.addr, align 4, !dbg !4590
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4591
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4592
  ret i32 %call, !dbg !4593
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4594 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4595, metadata !DIExpression()), !dbg !4596
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4597, metadata !DIExpression()), !dbg !4598
  %0 = load i32, i32* %value.addr, align 4, !dbg !4599
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4600
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4601
  ret i32 %call, !dbg !4602
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4603 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4606, metadata !DIExpression()), !dbg !4607
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4608, metadata !DIExpression()), !dbg !4609
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4610, metadata !DIExpression()), !dbg !4611
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4612, metadata !DIExpression()), !dbg !4613
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4614, metadata !DIExpression()), !dbg !4615
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4616, metadata !DIExpression()), !dbg !4617
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4618, metadata !DIExpression()), !dbg !4619
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4620, metadata !DIExpression()), !dbg !4621
  %0 = load i32, i32* %value.addr, align 4, !dbg !4622
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4623
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4624
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4625
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4626
  %3 = load i32, i32* %count.addr, align 4, !dbg !4627
  %sub = sub i32 %3, 32, !dbg !4628
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4629
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4629
  %shr = lshr i32 %2, %sub, !dbg !4629, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4630
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4631
  ret i32 %4, !dbg !4632
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4633 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4634, metadata !DIExpression()), !dbg !4635
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4636, metadata !DIExpression()), !dbg !4637
  %0 = load i32, i32* %value.addr, align 4, !dbg !4638
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4639
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4640
  ret i32 %call, !dbg !4641
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4642 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4645, metadata !DIExpression()), !dbg !4646
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4647, metadata !DIExpression()), !dbg !4648
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4649, metadata !DIExpression()), !dbg !4650
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4651, metadata !DIExpression()), !dbg !4652
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4653, metadata !DIExpression()), !dbg !4654
  %0 = load i32, i32* %value.addr, align 4, !dbg !4655
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4656
  %conv = zext i8 %1 to i32, !dbg !4656
  %mul = mul i32 %0, %conv, !dbg !4657
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4658
  %2 = load i32, i32* %value.addr, align 4, !dbg !4659
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4660
  %conv1 = zext i8 %3 to i32, !dbg !4660
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4661
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4662
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4663
  %5 = load i32, i32* %count.addr, align 4, !dbg !4664
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4665
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4665
  %shr = lshr i32 %4, %5, !dbg !4665, !klee.check.shift !258
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4666
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4667
  %7 = load i32, i32* %count.addr, align 4, !dbg !4668
  %sub = sub i32 32, %7, !dbg !4669
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4670
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4670
  %shl = shl i32 %6, %sub, !dbg !4670, !klee.check.shift !258
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4671
  %or = or i32 %8, %shl, !dbg !4671
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4671
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4672
  %10 = load i32, i32* %count.addr, align 4, !dbg !4674
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4675
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4675
  %shr2 = lshr i32 %9, %10, !dbg !4675, !klee.check.shift !258
  %cmp = icmp eq i32 %shr2, 0, !dbg !4676
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4677

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4678
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4681
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4682

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4683
  store i32 %12, i32* %retval, align 4, !dbg !4684
  br label %return, !dbg !4684

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4685
  br label %return, !dbg !4685

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4686
  br label %return, !dbg !4686

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4688
  ret i32 %13, !dbg !4688
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4689 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4690, metadata !DIExpression()), !dbg !4691
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4692, metadata !DIExpression()), !dbg !4693
  %0 = load i8, i8* %value.addr, align 1, !dbg !4694
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4695
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4696
  ret i8 %call, !dbg !4697
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4698 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4699, metadata !DIExpression()), !dbg !4700
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4701, metadata !DIExpression()), !dbg !4702
  %0 = load i8, i8* %value.addr, align 1, !dbg !4703
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4704
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4705
  ret i8 %call, !dbg !4706
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4707 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4708, metadata !DIExpression()), !dbg !4709
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4710, metadata !DIExpression()), !dbg !4711
  %0 = load i8, i8* %value.addr, align 1, !dbg !4712
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4713
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4714
  ret i8 %call, !dbg !4715
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4716 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4717, metadata !DIExpression()), !dbg !4718
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4719, metadata !DIExpression()), !dbg !4720
  %0 = load i8, i8* %value.addr, align 1, !dbg !4721
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4722
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4723
  ret i8 %call, !dbg !4724
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4725 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4726, metadata !DIExpression()), !dbg !4727
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4728, metadata !DIExpression()), !dbg !4729
  %0 = load i8, i8* %value.addr, align 1, !dbg !4730
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4731
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4732
  ret i8 %call, !dbg !4733
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4734 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4735, metadata !DIExpression()), !dbg !4736
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4737, metadata !DIExpression()), !dbg !4738
  %0 = load i8, i8* %value.addr, align 1, !dbg !4739
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4740
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4741
  ret i8 %call, !dbg !4742
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4743 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4744, metadata !DIExpression()), !dbg !4745
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4746, metadata !DIExpression()), !dbg !4747
  %0 = load i8, i8* %value.addr, align 1, !dbg !4748
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4749
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4750
  ret i8 %call, !dbg !4751
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4752 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4753, metadata !DIExpression()), !dbg !4754
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4755, metadata !DIExpression()), !dbg !4756
  %0 = load i8, i8* %value.addr, align 1, !dbg !4757
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4758
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4759
  ret i8 %call, !dbg !4760
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4761 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4762, metadata !DIExpression()), !dbg !4763
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4764, metadata !DIExpression()), !dbg !4765
  %0 = load i8, i8* %value.addr, align 1, !dbg !4766
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4767
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4768
  ret i8 %call, !dbg !4769
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4770 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4776, metadata !DIExpression()), !dbg !4777
  %2 = icmp eq i64 %0, 0, !dbg !4778
  br i1 %2, label %3, label %4, !dbg !4780

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4781
  unreachable, !dbg !4781

4:                                                ; preds = %1
  ret void, !dbg !4782
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4783 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4789, metadata !DIExpression()), !dbg !4791
  call void @llvm.dbg.value(metadata i64 %1, metadata !4790, metadata !DIExpression()), !dbg !4791
  %3 = icmp ult i64 %1, %0, !dbg !4792
  br i1 %3, label %5, label %4, !dbg !4794

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4795
  unreachable, !dbg !4795

5:                                                ; preds = %2
  ret void, !dbg !4797
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117/mul_Ccode_alarm_0117.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
!4 = !{}
!5 = !{!6, !13, !17, !20, !24, !29}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
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
!34 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
!35 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !17)
!36 = distinct !DICompileUnit(language: DW_LANG_C99, file: !37, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!37 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
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
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
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
!70 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_u16/alarm_0117")
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
!818 = !DILocation(line: 776, column: 37, scope: !809)
!819 = !DILocation(line: 776, column: 50, scope: !809)
!820 = !DILocation(line: 776, column: 45, scope: !809)
!821 = !DILocation(line: 776, column: 43, scope: !809)
!822 = !DILocation(line: 776, column: 27, scope: !809)
!823 = !DILocation(line: 776, column: 25, scope: !809)
!824 = !DILocation(line: 777, column: 5, scope: !809)
!825 = !DILocation(line: 782, column: 20, scope: !826)
!826 = distinct !DILexicalBlock(scope: !827, file: !70, line: 782, column: 7)
!827 = distinct !DILexicalBlock(scope: !791, file: !70, line: 781, column: 3)
!828 = !DILocation(line: 782, column: 19, scope: !826)
!829 = !DILocation(line: 782, column: 31, scope: !826)
!830 = !DILocation(line: 782, column: 28, scope: !826)
!831 = !DILocation(line: 782, column: 7, scope: !827)
!832 = !DILocation(line: 784, column: 5, scope: !833)
!833 = distinct !DILexicalBlock(scope: !826, file: !70, line: 783, column: 4)
!834 = !DILocation(line: 788, column: 13, scope: !835)
!835 = distinct !DILexicalBlock(scope: !826, file: !70, line: 787, column: 4)
!836 = !DILocation(line: 788, column: 19, scope: !835)
!837 = !DILocation(line: 788, column: 18, scope: !835)
!838 = !DILocation(line: 788, column: 5, scope: !835)
!839 = !DILocation(line: 794, column: 3, scope: !840)
!840 = distinct !DILexicalBlock(scope: !787, file: !70, line: 793, column: 2)
!841 = !DILocation(line: 796, column: 1, scope: !771)
!842 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !34, file: !34, line: 72, type: !843, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!843 = !DISubroutineType(types: !844)
!844 = !{!23, !17, !17}
!845 = !DILocalVariable(name: "left", arg: 1, scope: !842, file: !34, line: 72, type: !17)
!846 = !DILocation(line: 72, column: 38, scope: !842)
!847 = !DILocalVariable(name: "right", arg: 2, scope: !842, file: !34, line: 72, type: !17)
!848 = !DILocation(line: 72, column: 52, scope: !842)
!849 = !DILocation(line: 74, column: 12, scope: !842)
!850 = !DILocation(line: 74, column: 19, scope: !842)
!851 = !DILocation(line: 74, column: 17, scope: !842)
!852 = !DILocation(line: 74, column: 25, scope: !842)
!853 = !DILocation(line: 74, column: 5, scope: !842)
!854 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !70, file: !70, line: 812, type: !855, scopeLine: 813, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!855 = !DISubroutineType(types: !856)
!856 = !{!24, !24, !24, !29}
!857 = !DILocalVariable(name: "value", arg: 1, scope: !854, file: !70, line: 812, type: !24)
!858 = !DILocation(line: 812, column: 35, scope: !854)
!859 = !DILocalVariable(name: "factor", arg: 2, scope: !854, file: !70, line: 812, type: !24)
!860 = !DILocation(line: 812, column: 44, scope: !854)
!861 = !DILocalVariable(name: "count", arg: 3, scope: !854, file: !70, line: 812, type: !29)
!862 = !DILocation(line: 812, column: 55, scope: !854)
!863 = !DILocalVariable(name: "u16MulTemp", scope: !854, file: !70, line: 814, type: !29)
!864 = !DILocation(line: 814, column: 6, scope: !854)
!865 = !DILocation(line: 815, column: 15, scope: !854)
!866 = !DILocation(line: 815, column: 23, scope: !854)
!867 = !DILocation(line: 815, column: 21, scope: !854)
!868 = !DILocation(line: 815, column: 13, scope: !854)
!869 = !DILocation(line: 816, column: 15, scope: !854)
!870 = !DILocation(line: 816, column: 26, scope: !854)
!871 = !DILocation(line: 816, column: 25, scope: !854)
!872 = !DILocation(line: 816, column: 13, scope: !854)
!873 = !DILocation(line: 817, column: 13, scope: !854)
!874 = !DILocation(line: 817, column: 9, scope: !854)
!875 = !DILocation(line: 817, column: 2, scope: !854)
!876 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !70, file: !70, line: 834, type: !877, scopeLine: 835, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!877 = !DISubroutineType(types: !878)
!878 = !{!24, !24, !24, !24}
!879 = !DILocalVariable(name: "value", arg: 1, scope: !876, file: !70, line: 834, type: !24)
!880 = !DILocation(line: 834, column: 38, scope: !876)
!881 = !DILocalVariable(name: "factor", arg: 2, scope: !876, file: !70, line: 834, type: !24)
!882 = !DILocation(line: 834, column: 47, scope: !876)
!883 = !DILocalVariable(name: "count", arg: 3, scope: !876, file: !70, line: 834, type: !24)
!884 = !DILocation(line: 834, column: 57, scope: !876)
!885 = !DILocalVariable(name: "u16MulTemp", scope: !876, file: !70, line: 836, type: !29)
!886 = !DILocation(line: 836, column: 6, scope: !876)
!887 = !DILocation(line: 837, column: 15, scope: !876)
!888 = !DILocation(line: 837, column: 23, scope: !876)
!889 = !DILocation(line: 837, column: 21, scope: !876)
!890 = !DILocation(line: 837, column: 13, scope: !876)
!891 = !DILocation(line: 838, column: 15, scope: !876)
!892 = !DILocation(line: 838, column: 26, scope: !876)
!893 = !DILocation(line: 838, column: 25, scope: !876)
!894 = !DILocation(line: 838, column: 13, scope: !876)
!895 = !DILocation(line: 839, column: 5, scope: !896)
!896 = distinct !DILexicalBlock(scope: !876, file: !70, line: 839, column: 5)
!897 = !DILocation(line: 839, column: 16, scope: !896)
!898 = !DILocation(line: 839, column: 5, scope: !876)
!899 = !DILocation(line: 841, column: 10, scope: !900)
!900 = distinct !DILexicalBlock(scope: !896, file: !70, line: 840, column: 2)
!901 = !DILocation(line: 841, column: 21, scope: !900)
!902 = !DILocation(line: 841, column: 3, scope: !900)
!903 = !DILocation(line: 845, column: 3, scope: !904)
!904 = distinct !DILexicalBlock(scope: !896, file: !70, line: 844, column: 2)
!905 = !DILocation(line: 847, column: 1, scope: !876)
!906 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !70, file: !70, line: 864, type: !907, scopeLine: 865, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!907 = !DISubroutineType(types: !908)
!908 = !{!24, !24, !24}
!909 = !DILocalVariable(name: "x_value", arg: 1, scope: !906, file: !70, line: 864, type: !24)
!910 = !DILocation(line: 864, column: 25, scope: !906)
!911 = !DILocalVariable(name: "y_value", arg: 2, scope: !906, file: !70, line: 864, type: !24)
!912 = !DILocation(line: 864, column: 36, scope: !906)
!913 = !DILocalVariable(name: "u16MulTemp", scope: !906, file: !70, line: 866, type: !29)
!914 = !DILocation(line: 866, column: 6, scope: !906)
!915 = !DILocation(line: 867, column: 15, scope: !906)
!916 = !DILocation(line: 867, column: 25, scope: !906)
!917 = !DILocation(line: 867, column: 23, scope: !906)
!918 = !DILocation(line: 867, column: 13, scope: !906)
!919 = !DILocation(line: 868, column: 15, scope: !906)
!920 = !DILocation(line: 868, column: 26, scope: !906)
!921 = !DILocation(line: 868, column: 13, scope: !906)
!922 = !DILocation(line: 869, column: 13, scope: !906)
!923 = !DILocation(line: 869, column: 9, scope: !906)
!924 = !DILocation(line: 869, column: 2, scope: !906)
!925 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !70, file: !70, line: 888, type: !907, scopeLine: 889, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!926 = !DILocalVariable(name: "value", arg: 1, scope: !925, file: !70, line: 888, type: !24)
!927 = !DILocation(line: 888, column: 26, scope: !925)
!928 = !DILocalVariable(name: "factor", arg: 2, scope: !925, file: !70, line: 888, type: !24)
!929 = !DILocation(line: 888, column: 36, scope: !925)
!930 = !DILocalVariable(name: "u16MulTemp", scope: !925, file: !70, line: 890, type: !29)
!931 = !DILocation(line: 890, column: 6, scope: !925)
!932 = !DILocation(line: 891, column: 15, scope: !925)
!933 = !DILocation(line: 891, column: 23, scope: !925)
!934 = !DILocation(line: 891, column: 21, scope: !925)
!935 = !DILocation(line: 891, column: 13, scope: !925)
!936 = !DILocation(line: 892, column: 15, scope: !925)
!937 = !DILocation(line: 892, column: 26, scope: !925)
!938 = !DILocation(line: 892, column: 13, scope: !925)
!939 = !DILocation(line: 893, column: 5, scope: !940)
!940 = distinct !DILexicalBlock(scope: !925, file: !70, line: 893, column: 5)
!941 = !DILocation(line: 893, column: 16, scope: !940)
!942 = !DILocation(line: 893, column: 5, scope: !925)
!943 = !DILocation(line: 895, column: 14, scope: !944)
!944 = distinct !DILexicalBlock(scope: !940, file: !70, line: 894, column: 2)
!945 = !DILocation(line: 895, column: 10, scope: !944)
!946 = !DILocation(line: 895, column: 3, scope: !944)
!947 = !DILocation(line: 899, column: 3, scope: !948)
!948 = distinct !DILexicalBlock(scope: !940, file: !70, line: 898, column: 2)
!949 = !DILocation(line: 901, column: 1, scope: !925)
!950 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !70, file: !70, line: 917, type: !951, scopeLine: 918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!951 = !DISubroutineType(types: !952)
!952 = !{!29, !29, !29}
!953 = !DILocalVariable(name: "value", arg: 1, scope: !950, file: !70, line: 917, type: !29)
!954 = !DILocation(line: 917, column: 39, scope: !950)
!955 = !DILocalVariable(name: "factor", arg: 2, scope: !950, file: !70, line: 917, type: !29)
!956 = !DILocation(line: 917, column: 49, scope: !950)
!957 = !DILocalVariable(name: "u32MulTemp", scope: !950, file: !70, line: 919, type: !733)
!958 = !DILocation(line: 919, column: 6, scope: !950)
!959 = !DILocation(line: 920, column: 15, scope: !950)
!960 = !DILocation(line: 920, column: 23, scope: !950)
!961 = !DILocation(line: 920, column: 21, scope: !950)
!962 = !DILocation(line: 920, column: 13, scope: !950)
!963 = !DILocation(line: 921, column: 15, scope: !950)
!964 = !DILocation(line: 921, column: 26, scope: !950)
!965 = !DILocation(line: 921, column: 13, scope: !950)
!966 = !DILocation(line: 922, column: 14, scope: !950)
!967 = !DILocation(line: 922, column: 9, scope: !950)
!968 = !DILocation(line: 922, column: 2, scope: !950)
!969 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !70, file: !70, line: 941, type: !951, scopeLine: 942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!970 = !DILocalVariable(name: "value", arg: 1, scope: !969, file: !70, line: 941, type: !29)
!971 = !DILocation(line: 941, column: 43, scope: !969)
!972 = !DILocalVariable(name: "factor", arg: 2, scope: !969, file: !70, line: 941, type: !29)
!973 = !DILocation(line: 941, column: 53, scope: !969)
!974 = !DILocalVariable(name: "u32MulTemp", scope: !969, file: !70, line: 943, type: !733)
!975 = !DILocation(line: 943, column: 6, scope: !969)
!976 = !DILocation(line: 944, column: 15, scope: !969)
!977 = !DILocation(line: 944, column: 23, scope: !969)
!978 = !DILocation(line: 944, column: 21, scope: !969)
!979 = !DILocation(line: 944, column: 13, scope: !969)
!980 = !DILocation(line: 945, column: 15, scope: !969)
!981 = !DILocation(line: 945, column: 26, scope: !969)
!982 = !DILocation(line: 945, column: 13, scope: !969)
!983 = !DILocation(line: 946, column: 5, scope: !984)
!984 = distinct !DILexicalBlock(scope: !969, file: !70, line: 946, column: 5)
!985 = !DILocation(line: 946, column: 16, scope: !984)
!986 = !DILocation(line: 946, column: 5, scope: !969)
!987 = !DILocation(line: 948, column: 11, scope: !988)
!988 = distinct !DILexicalBlock(scope: !984, file: !70, line: 947, column: 2)
!989 = !DILocation(line: 948, column: 22, scope: !988)
!990 = !DILocation(line: 948, column: 10, scope: !988)
!991 = !DILocation(line: 948, column: 3, scope: !988)
!992 = !DILocation(line: 952, column: 3, scope: !993)
!993 = distinct !DILexicalBlock(scope: !984, file: !70, line: 951, column: 2)
!994 = !DILocation(line: 954, column: 1, scope: !969)
!995 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !70, file: !70, line: 972, type: !996, scopeLine: 973, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!996 = !DISubroutineType(types: !997)
!997 = !{!29, !29, !24}
!998 = !DILocalVariable(name: "x_value", arg: 1, scope: !995, file: !70, line: 972, type: !29)
!999 = !DILocation(line: 972, column: 29, scope: !995)
!1000 = !DILocalVariable(name: "y_value", arg: 2, scope: !995, file: !70, line: 972, type: !24)
!1001 = !DILocation(line: 972, column: 41, scope: !995)
!1002 = !DILocalVariable(name: "u32MulTemp", scope: !995, file: !70, line: 974, type: !733)
!1003 = !DILocation(line: 974, column: 6, scope: !995)
!1004 = !DILocation(line: 975, column: 15, scope: !995)
!1005 = !DILocation(line: 975, column: 25, scope: !995)
!1006 = !DILocation(line: 975, column: 23, scope: !995)
!1007 = !DILocation(line: 975, column: 13, scope: !995)
!1008 = !DILocation(line: 976, column: 16, scope: !995)
!1009 = !DILocation(line: 976, column: 27, scope: !995)
!1010 = !DILocation(line: 976, column: 33, scope: !995)
!1011 = !DILocation(line: 976, column: 13, scope: !995)
!1012 = !DILocation(line: 977, column: 9, scope: !995)
!1013 = !DILocation(line: 977, column: 2, scope: !995)
!1014 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !70, file: !70, line: 996, type: !996, scopeLine: 997, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1015 = !DILocalVariable(name: "x_value", arg: 1, scope: !1014, file: !70, line: 996, type: !29)
!1016 = !DILocation(line: 996, column: 29, scope: !1014)
!1017 = !DILocalVariable(name: "y_value", arg: 2, scope: !1014, file: !70, line: 996, type: !24)
!1018 = !DILocation(line: 996, column: 41, scope: !1014)
!1019 = !DILocalVariable(name: "u32MulTemp", scope: !1014, file: !70, line: 998, type: !733)
!1020 = !DILocation(line: 998, column: 6, scope: !1014)
!1021 = !DILocation(line: 999, column: 15, scope: !1014)
!1022 = !DILocation(line: 999, column: 25, scope: !1014)
!1023 = !DILocation(line: 999, column: 23, scope: !1014)
!1024 = !DILocation(line: 999, column: 13, scope: !1014)
!1025 = !DILocation(line: 1000, column: 15, scope: !1014)
!1026 = !DILocation(line: 1000, column: 26, scope: !1014)
!1027 = !DILocation(line: 1000, column: 13, scope: !1014)
!1028 = !DILocation(line: 1001, column: 5, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1014, file: !70, line: 1001, column: 5)
!1030 = !DILocation(line: 1001, column: 16, scope: !1029)
!1031 = !DILocation(line: 1001, column: 5, scope: !1014)
!1032 = !DILocation(line: 1003, column: 11, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1029, file: !70, line: 1002, column: 2)
!1034 = !DILocation(line: 1003, column: 22, scope: !1033)
!1035 = !DILocation(line: 1003, column: 10, scope: !1033)
!1036 = !DILocation(line: 1003, column: 3, scope: !1033)
!1037 = !DILocation(line: 1007, column: 3, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1029, file: !70, line: 1006, column: 2)
!1039 = !DILocation(line: 1009, column: 1, scope: !1014)
!1040 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !70, file: !70, line: 1025, type: !1041, scopeLine: 1026, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1041 = !DISubroutineType(types: !1042)
!1042 = !{!29, !29, !29, !733}
!1043 = !DILocalVariable(name: "value", arg: 1, scope: !1040, file: !70, line: 1025, type: !29)
!1044 = !DILocation(line: 1025, column: 40, scope: !1040)
!1045 = !DILocalVariable(name: "factor", arg: 2, scope: !1040, file: !70, line: 1025, type: !29)
!1046 = !DILocation(line: 1025, column: 50, scope: !1040)
!1047 = !DILocalVariable(name: "count", arg: 3, scope: !1040, file: !70, line: 1025, type: !733)
!1048 = !DILocation(line: 1025, column: 61, scope: !1040)
!1049 = !DILocalVariable(name: "u32MulTemp", scope: !1040, file: !70, line: 1027, type: !733)
!1050 = !DILocation(line: 1027, column: 6, scope: !1040)
!1051 = !DILocation(line: 1028, column: 15, scope: !1040)
!1052 = !DILocation(line: 1028, column: 23, scope: !1040)
!1053 = !DILocation(line: 1028, column: 21, scope: !1040)
!1054 = !DILocation(line: 1028, column: 13, scope: !1040)
!1055 = !DILocation(line: 1029, column: 15, scope: !1040)
!1056 = !DILocation(line: 1029, column: 26, scope: !1040)
!1057 = !DILocation(line: 1029, column: 25, scope: !1040)
!1058 = !DILocation(line: 1029, column: 13, scope: !1040)
!1059 = !DILocation(line: 1030, column: 10, scope: !1040)
!1060 = !DILocation(line: 1030, column: 21, scope: !1040)
!1061 = !DILocation(line: 1030, column: 9, scope: !1040)
!1062 = !DILocation(line: 1030, column: 2, scope: !1040)
!1063 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !70, file: !70, line: 1048, type: !1064, scopeLine: 1049, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!29, !29, !29, !29}
!1066 = !DILocalVariable(name: "value", arg: 1, scope: !1063, file: !70, line: 1048, type: !29)
!1067 = !DILocation(line: 1048, column: 43, scope: !1063)
!1068 = !DILocalVariable(name: "factor", arg: 2, scope: !1063, file: !70, line: 1048, type: !29)
!1069 = !DILocation(line: 1048, column: 53, scope: !1063)
!1070 = !DILocalVariable(name: "count", arg: 3, scope: !1063, file: !70, line: 1048, type: !29)
!1071 = !DILocation(line: 1048, column: 64, scope: !1063)
!1072 = !DILocalVariable(name: "u32MulTemp", scope: !1063, file: !70, line: 1050, type: !733)
!1073 = !DILocation(line: 1050, column: 6, scope: !1063)
!1074 = !DILocation(line: 1051, column: 15, scope: !1063)
!1075 = !DILocation(line: 1051, column: 23, scope: !1063)
!1076 = !DILocation(line: 1051, column: 21, scope: !1063)
!1077 = !DILocation(line: 1051, column: 13, scope: !1063)
!1078 = !DILocation(line: 1052, column: 15, scope: !1063)
!1079 = !DILocation(line: 1052, column: 26, scope: !1063)
!1080 = !DILocation(line: 1052, column: 25, scope: !1063)
!1081 = !DILocation(line: 1052, column: 13, scope: !1063)
!1082 = !DILocation(line: 1053, column: 5, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1063, file: !70, line: 1053, column: 5)
!1084 = !DILocation(line: 1053, column: 16, scope: !1083)
!1085 = !DILocation(line: 1053, column: 5, scope: !1063)
!1086 = !DILocation(line: 1055, column: 11, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1083, file: !70, line: 1054, column: 2)
!1088 = !DILocation(line: 1055, column: 22, scope: !1087)
!1089 = !DILocation(line: 1055, column: 10, scope: !1087)
!1090 = !DILocation(line: 1055, column: 3, scope: !1087)
!1091 = !DILocation(line: 1059, column: 3, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1083, file: !70, line: 1058, column: 2)
!1093 = !DILocation(line: 1061, column: 1, scope: !1063)
!1094 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !70, file: !70, line: 1077, type: !951, scopeLine: 1078, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1095 = !DILocalVariable(name: "x_value", arg: 1, scope: !1094, file: !70, line: 1077, type: !29)
!1096 = !DILocation(line: 1077, column: 30, scope: !1094)
!1097 = !DILocalVariable(name: "y_value", arg: 2, scope: !1094, file: !70, line: 1077, type: !29)
!1098 = !DILocation(line: 1077, column: 42, scope: !1094)
!1099 = !DILocalVariable(name: "u32MulTemp", scope: !1094, file: !70, line: 1079, type: !733)
!1100 = !DILocation(line: 1079, column: 6, scope: !1094)
!1101 = !DILocation(line: 1080, column: 15, scope: !1094)
!1102 = !DILocation(line: 1080, column: 25, scope: !1094)
!1103 = !DILocation(line: 1080, column: 23, scope: !1094)
!1104 = !DILocation(line: 1080, column: 13, scope: !1094)
!1105 = !DILocation(line: 1081, column: 15, scope: !1094)
!1106 = !DILocation(line: 1081, column: 26, scope: !1094)
!1107 = !DILocation(line: 1081, column: 13, scope: !1094)
!1108 = !DILocation(line: 1082, column: 19, scope: !1094)
!1109 = !DILocation(line: 1082, column: 17, scope: !1094)
!1110 = !DILocation(line: 1082, column: 9, scope: !1094)
!1111 = !DILocation(line: 1082, column: 2, scope: !1094)
!1112 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !70, file: !70, line: 1101, type: !951, scopeLine: 1102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1113 = !DILocalVariable(name: "x_value", arg: 1, scope: !1112, file: !70, line: 1101, type: !29)
!1114 = !DILocation(line: 1101, column: 30, scope: !1112)
!1115 = !DILocalVariable(name: "y_value", arg: 2, scope: !1112, file: !70, line: 1101, type: !29)
!1116 = !DILocation(line: 1101, column: 42, scope: !1112)
!1117 = !DILocalVariable(name: "u32MulTemp", scope: !1112, file: !70, line: 1103, type: !733)
!1118 = !DILocation(line: 1103, column: 6, scope: !1112)
!1119 = !DILocation(line: 1104, column: 15, scope: !1112)
!1120 = !DILocation(line: 1104, column: 25, scope: !1112)
!1121 = !DILocation(line: 1104, column: 23, scope: !1112)
!1122 = !DILocation(line: 1104, column: 13, scope: !1112)
!1123 = !DILocation(line: 1105, column: 15, scope: !1112)
!1124 = !DILocation(line: 1105, column: 26, scope: !1112)
!1125 = !DILocation(line: 1105, column: 13, scope: !1112)
!1126 = !DILocation(line: 1106, column: 5, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1112, file: !70, line: 1106, column: 5)
!1128 = !DILocation(line: 1106, column: 16, scope: !1127)
!1129 = !DILocation(line: 1106, column: 5, scope: !1112)
!1130 = !DILocation(line: 1108, column: 11, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1127, file: !70, line: 1107, column: 2)
!1132 = !DILocation(line: 1108, column: 22, scope: !1131)
!1133 = !DILocation(line: 1108, column: 10, scope: !1131)
!1134 = !DILocation(line: 1108, column: 3, scope: !1131)
!1135 = !DILocation(line: 1112, column: 3, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1127, file: !70, line: 1111, column: 2)
!1137 = !DILocation(line: 1114, column: 1, scope: !1112)
!1138 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !70, file: !70, line: 1129, type: !1139, scopeLine: 1130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!733, !733, !29}
!1141 = !DILocalVariable(name: "x_value", arg: 1, scope: !1138, file: !70, line: 1129, type: !733)
!1142 = !DILocation(line: 1129, column: 26, scope: !1138)
!1143 = !DILocalVariable(name: "y_value", arg: 2, scope: !1138, file: !70, line: 1129, type: !29)
!1144 = !DILocation(line: 1129, column: 39, scope: !1138)
!1145 = !DILocalVariable(name: "u32Temp1", scope: !1138, file: !70, line: 1132, type: !733)
!1146 = !DILocation(line: 1132, column: 6, scope: !1138)
!1147 = !DILocation(line: 1133, column: 5, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1138, file: !70, line: 1133, column: 5)
!1149 = !DILocation(line: 1133, column: 13, scope: !1148)
!1150 = !DILocation(line: 1133, column: 5, scope: !1138)
!1151 = !DILocation(line: 1135, column: 26, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1148, file: !70, line: 1134, column: 2)
!1153 = !DILocation(line: 1135, column: 25, scope: !1152)
!1154 = !DILocation(line: 1135, column: 12, scope: !1152)
!1155 = !DILocation(line: 1136, column: 6, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1152, file: !70, line: 1136, column: 6)
!1157 = !DILocation(line: 1136, column: 17, scope: !1156)
!1158 = !DILocation(line: 1136, column: 15, scope: !1156)
!1159 = !DILocation(line: 1136, column: 6, scope: !1152)
!1160 = !DILocation(line: 1138, column: 4, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1156, file: !70, line: 1137, column: 3)
!1162 = !DILocation(line: 1142, column: 12, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1156, file: !70, line: 1141, column: 3)
!1164 = !DILocation(line: 1142, column: 22, scope: !1163)
!1165 = !DILocation(line: 1142, column: 20, scope: !1163)
!1166 = !DILocation(line: 1142, column: 4, scope: !1163)
!1167 = !DILocation(line: 1147, column: 3, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1148, file: !70, line: 1146, column: 2)
!1169 = !DILocation(line: 1150, column: 2, scope: !1138)
!1170 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !70, file: !70, line: 1167, type: !1171, scopeLine: 1168, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1171 = !DISubroutineType(types: !1172)
!1172 = !{!733, !733, !29, !733}
!1173 = !DILocalVariable(name: "value", arg: 1, scope: !1170, file: !70, line: 1167, type: !733)
!1174 = !DILocation(line: 1167, column: 40, scope: !1170)
!1175 = !DILocalVariable(name: "factor", arg: 2, scope: !1170, file: !70, line: 1167, type: !29)
!1176 = !DILocation(line: 1167, column: 50, scope: !1170)
!1177 = !DILocalVariable(name: "count", arg: 3, scope: !1170, file: !70, line: 1167, type: !733)
!1178 = !DILocation(line: 1167, column: 62, scope: !1170)
!1179 = !DILocalVariable(name: "u32Temp1", scope: !1170, file: !70, line: 1169, type: !733)
!1180 = !DILocation(line: 1169, column: 6, scope: !1170)
!1181 = !DILocalVariable(name: "u32Temp2", scope: !1170, file: !70, line: 1169, type: !733)
!1182 = !DILocation(line: 1169, column: 20, scope: !1170)
!1183 = !DILocation(line: 1170, column: 13, scope: !1170)
!1184 = !DILocation(line: 1170, column: 21, scope: !1170)
!1185 = !DILocation(line: 1170, column: 19, scope: !1170)
!1186 = !DILocation(line: 1170, column: 11, scope: !1170)
!1187 = !DILocation(line: 1171, column: 25, scope: !1170)
!1188 = !DILocation(line: 1171, column: 32, scope: !1170)
!1189 = !DILocation(line: 1171, column: 13, scope: !1170)
!1190 = !DILocation(line: 1171, column: 11, scope: !1170)
!1191 = !DILocation(line: 1172, column: 13, scope: !1170)
!1192 = !DILocation(line: 1172, column: 25, scope: !1170)
!1193 = !DILocation(line: 1172, column: 22, scope: !1170)
!1194 = !DILocation(line: 1172, column: 11, scope: !1170)
!1195 = !DILocation(line: 1173, column: 14, scope: !1170)
!1196 = !DILocation(line: 1173, column: 30, scope: !1170)
!1197 = !DILocation(line: 1173, column: 29, scope: !1170)
!1198 = !DILocation(line: 1173, column: 23, scope: !1170)
!1199 = !DILocation(line: 1173, column: 11, scope: !1170)
!1200 = !DILocation(line: 1174, column: 6, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1170, file: !70, line: 1174, column: 5)
!1202 = !DILocation(line: 1174, column: 16, scope: !1201)
!1203 = !DILocation(line: 1174, column: 14, scope: !1201)
!1204 = !DILocation(line: 1174, column: 23, scope: !1201)
!1205 = !DILocation(line: 1174, column: 5, scope: !1170)
!1206 = !DILocation(line: 1176, column: 10, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1201, file: !70, line: 1175, column: 2)
!1208 = !DILocation(line: 1176, column: 3, scope: !1207)
!1209 = !DILocation(line: 1180, column: 3, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1201, file: !70, line: 1179, column: 2)
!1211 = !DILocation(line: 1182, column: 1, scope: !1170)
!1212 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !70, file: !70, line: 1198, type: !1213, scopeLine: 1199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{!24, !24, !24, !6}
!1215 = !DILocalVariable(name: "val1", arg: 1, scope: !1212, file: !70, line: 1198, type: !24)
!1216 = !DILocation(line: 1198, column: 25, scope: !1212)
!1217 = !DILocalVariable(name: "val2", arg: 2, scope: !1212, file: !70, line: 1198, type: !24)
!1218 = !DILocation(line: 1198, column: 34, scope: !1212)
!1219 = !DILocalVariable(name: "factor", arg: 3, scope: !1212, file: !70, line: 1198, type: !6)
!1220 = !DILocation(line: 1198, column: 43, scope: !1212)
!1221 = !DILocalVariable(name: "s16Temp1", scope: !1212, file: !70, line: 1200, type: !13)
!1222 = !DILocation(line: 1200, column: 6, scope: !1212)
!1223 = !DILocation(line: 1201, column: 15, scope: !1212)
!1224 = !DILocation(line: 1201, column: 22, scope: !1212)
!1225 = !DILocation(line: 1201, column: 20, scope: !1212)
!1226 = !DILocation(line: 1201, column: 28, scope: !1212)
!1227 = !DILocation(line: 1201, column: 27, scope: !1212)
!1228 = !DILocation(line: 1201, column: 35, scope: !1212)
!1229 = !DILocation(line: 1201, column: 39, scope: !1212)
!1230 = !DILocation(line: 1201, column: 38, scope: !1212)
!1231 = !DILocation(line: 1201, column: 13, scope: !1212)
!1232 = !DILocation(line: 1201, column: 11, scope: !1212)
!1233 = !DILocation(line: 1202, column: 5, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1212, file: !70, line: 1202, column: 5)
!1235 = !DILocation(line: 1202, column: 14, scope: !1234)
!1236 = !DILocation(line: 1202, column: 5, scope: !1212)
!1237 = !DILocation(line: 1204, column: 6, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1239, file: !70, line: 1204, column: 6)
!1239 = distinct !DILexicalBlock(scope: !1234, file: !70, line: 1203, column: 2)
!1240 = !DILocation(line: 1204, column: 15, scope: !1238)
!1241 = !DILocation(line: 1204, column: 6, scope: !1239)
!1242 = !DILocation(line: 1206, column: 15, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1238, file: !70, line: 1205, column: 3)
!1244 = !DILocation(line: 1206, column: 11, scope: !1243)
!1245 = !DILocation(line: 1206, column: 4, scope: !1243)
!1246 = !DILocation(line: 1210, column: 4, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1238, file: !70, line: 1209, column: 3)
!1248 = !DILocation(line: 1215, column: 3, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1234, file: !70, line: 1214, column: 2)
!1250 = !DILocation(line: 1218, column: 1, scope: !1212)
!1251 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !70, file: !70, line: 1234, type: !1252, scopeLine: 1235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1252 = !DISubroutineType(types: !1253)
!1253 = !{!29, !29, !29, !6}
!1254 = !DILocalVariable(name: "val1", arg: 1, scope: !1251, file: !70, line: 1234, type: !29)
!1255 = !DILocation(line: 1234, column: 30, scope: !1251)
!1256 = !DILocalVariable(name: "val2", arg: 2, scope: !1251, file: !70, line: 1234, type: !29)
!1257 = !DILocation(line: 1234, column: 40, scope: !1251)
!1258 = !DILocalVariable(name: "factor", arg: 3, scope: !1251, file: !70, line: 1234, type: !6)
!1259 = !DILocation(line: 1234, column: 49, scope: !1251)
!1260 = !DILocalVariable(name: "s32Temp1", scope: !1251, file: !70, line: 1236, type: !20)
!1261 = !DILocation(line: 1236, column: 6, scope: !1251)
!1262 = !DILocation(line: 1237, column: 15, scope: !1251)
!1263 = !DILocation(line: 1237, column: 22, scope: !1251)
!1264 = !DILocation(line: 1237, column: 20, scope: !1251)
!1265 = !DILocation(line: 1237, column: 28, scope: !1251)
!1266 = !DILocation(line: 1237, column: 27, scope: !1251)
!1267 = !DILocation(line: 1237, column: 35, scope: !1251)
!1268 = !DILocation(line: 1237, column: 39, scope: !1251)
!1269 = !DILocation(line: 1237, column: 38, scope: !1251)
!1270 = !DILocation(line: 1237, column: 11, scope: !1251)
!1271 = !DILocation(line: 1238, column: 5, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1251, file: !70, line: 1238, column: 5)
!1273 = !DILocation(line: 1238, column: 14, scope: !1272)
!1274 = !DILocation(line: 1238, column: 5, scope: !1251)
!1275 = !DILocation(line: 1240, column: 6, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1277, file: !70, line: 1240, column: 6)
!1277 = distinct !DILexicalBlock(scope: !1272, file: !70, line: 1239, column: 2)
!1278 = !DILocation(line: 1240, column: 15, scope: !1276)
!1279 = !DILocation(line: 1240, column: 6, scope: !1277)
!1280 = !DILocation(line: 1242, column: 16, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !70, line: 1241, column: 3)
!1282 = !DILocation(line: 1242, column: 11, scope: !1281)
!1283 = !DILocation(line: 1242, column: 4, scope: !1281)
!1284 = !DILocation(line: 1246, column: 4, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1276, file: !70, line: 1245, column: 3)
!1286 = !DILocation(line: 1252, column: 3, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1272, file: !70, line: 1251, column: 2)
!1288 = !DILocation(line: 1254, column: 1, scope: !1251)
!1289 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !70, file: !70, line: 1269, type: !951, scopeLine: 1270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1290 = !DILocalVariable(name: "val1", arg: 1, scope: !1289, file: !70, line: 1269, type: !29)
!1291 = !DILocation(line: 1269, column: 26, scope: !1289)
!1292 = !DILocalVariable(name: "val2", arg: 2, scope: !1289, file: !70, line: 1269, type: !29)
!1293 = !DILocation(line: 1269, column: 36, scope: !1289)
!1294 = !DILocalVariable(name: "u32Temp1", scope: !1289, file: !70, line: 1271, type: !733)
!1295 = !DILocation(line: 1271, column: 6, scope: !1289)
!1296 = !DILocation(line: 1272, column: 13, scope: !1289)
!1297 = !DILocation(line: 1272, column: 20, scope: !1289)
!1298 = !DILocation(line: 1272, column: 18, scope: !1289)
!1299 = !DILocation(line: 1272, column: 11, scope: !1289)
!1300 = !DILocation(line: 1273, column: 5, scope: !1301)
!1301 = distinct !DILexicalBlock(scope: !1289, file: !70, line: 1273, column: 5)
!1302 = !DILocation(line: 1273, column: 14, scope: !1301)
!1303 = !DILocation(line: 1273, column: 5, scope: !1289)
!1304 = !DILocation(line: 1275, column: 11, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1301, file: !70, line: 1274, column: 2)
!1306 = !DILocation(line: 1275, column: 20, scope: !1305)
!1307 = !DILocation(line: 1275, column: 10, scope: !1305)
!1308 = !DILocation(line: 1275, column: 3, scope: !1305)
!1309 = !DILocation(line: 1279, column: 3, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1301, file: !70, line: 1278, column: 2)
!1311 = !DILocation(line: 1281, column: 1, scope: !1289)
!1312 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !70, file: !70, line: 1295, type: !1313, scopeLine: 1296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{!733, !29, !29}
!1315 = !DILocalVariable(name: "x_value", arg: 1, scope: !1312, file: !70, line: 1295, type: !29)
!1316 = !DILocation(line: 1295, column: 25, scope: !1312)
!1317 = !DILocalVariable(name: "y_value", arg: 2, scope: !1312, file: !70, line: 1295, type: !29)
!1318 = !DILocation(line: 1295, column: 38, scope: !1312)
!1319 = !DILocalVariable(name: "u32Temp1", scope: !1312, file: !70, line: 1297, type: !733)
!1320 = !DILocation(line: 1297, column: 6, scope: !1312)
!1321 = !DILocation(line: 1298, column: 13, scope: !1312)
!1322 = !DILocation(line: 1298, column: 23, scope: !1312)
!1323 = !DILocation(line: 1298, column: 21, scope: !1312)
!1324 = !DILocation(line: 1298, column: 11, scope: !1312)
!1325 = !DILocation(line: 1299, column: 9, scope: !1312)
!1326 = !DILocation(line: 1299, column: 2, scope: !1312)
!1327 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !70, file: !70, line: 1317, type: !1328, scopeLine: 1318, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1328 = !DISubroutineType(types: !1329)
!1329 = !{!20, !13, !13}
!1330 = !DILocalVariable(name: "x_value", arg: 1, scope: !1327, file: !70, line: 1317, type: !13)
!1331 = !DILocation(line: 1317, column: 25, scope: !1327)
!1332 = !DILocalVariable(name: "y_value", arg: 2, scope: !1327, file: !70, line: 1317, type: !13)
!1333 = !DILocation(line: 1317, column: 38, scope: !1327)
!1334 = !DILocalVariable(name: "s32Temp1", scope: !1327, file: !70, line: 1319, type: !20)
!1335 = !DILocation(line: 1319, column: 6, scope: !1327)
!1336 = !DILocation(line: 1320, column: 13, scope: !1327)
!1337 = !DILocation(line: 1320, column: 23, scope: !1327)
!1338 = !DILocation(line: 1320, column: 21, scope: !1327)
!1339 = !DILocation(line: 1320, column: 11, scope: !1327)
!1340 = !DILocation(line: 1321, column: 9, scope: !1327)
!1341 = !DILocation(line: 1321, column: 2, scope: !1327)
!1342 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !70, file: !70, line: 1338, type: !1343, scopeLine: 1339, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1343 = !DISubroutineType(types: !1344)
!1344 = !{!733, !733, !20}
!1345 = !DILocalVariable(name: "val1", arg: 1, scope: !1342, file: !70, line: 1338, type: !733)
!1346 = !DILocation(line: 1338, column: 25, scope: !1342)
!1347 = !DILocalVariable(name: "val2", arg: 2, scope: !1342, file: !70, line: 1338, type: !20)
!1348 = !DILocation(line: 1338, column: 35, scope: !1342)
!1349 = !DILocalVariable(name: "s32Temp1", scope: !1342, file: !70, line: 1340, type: !20)
!1350 = !DILocation(line: 1340, column: 6, scope: !1342)
!1351 = !DILocation(line: 1341, column: 5, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1342, file: !70, line: 1341, column: 5)
!1353 = !DILocation(line: 1341, column: 10, scope: !1352)
!1354 = !DILocation(line: 1341, column: 5, scope: !1342)
!1355 = !DILocation(line: 1343, column: 25, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1352, file: !70, line: 1342, column: 2)
!1357 = !DILocation(line: 1343, column: 24, scope: !1356)
!1358 = !DILocation(line: 1343, column: 12, scope: !1356)
!1359 = !DILocation(line: 1344, column: 6, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1356, file: !70, line: 1344, column: 6)
!1361 = !DILocation(line: 1344, column: 17, scope: !1360)
!1362 = !DILocation(line: 1344, column: 15, scope: !1360)
!1363 = !DILocation(line: 1344, column: 6, scope: !1356)
!1364 = !DILocation(line: 1346, column: 4, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1360, file: !70, line: 1345, column: 3)
!1366 = !DILocation(line: 1350, column: 12, scope: !1367)
!1367 = distinct !DILexicalBlock(scope: !1360, file: !70, line: 1349, column: 3)
!1368 = !DILocation(line: 1350, column: 19, scope: !1367)
!1369 = !DILocation(line: 1350, column: 17, scope: !1367)
!1370 = !DILocation(line: 1350, column: 4, scope: !1367)
!1371 = !DILocation(line: 1355, column: 3, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1352, file: !70, line: 1354, column: 2)
!1373 = !DILocation(line: 1357, column: 1, scope: !1342)
!1374 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !70, file: !70, line: 1372, type: !1375, scopeLine: 1373, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1375 = !DISubroutineType(types: !1376)
!1376 = !{!733, !20, !20}
!1377 = !DILocalVariable(name: "val1", arg: 1, scope: !1374, file: !70, line: 1372, type: !20)
!1378 = !DILocation(line: 1372, column: 25, scope: !1374)
!1379 = !DILocalVariable(name: "val2", arg: 2, scope: !1374, file: !70, line: 1372, type: !20)
!1380 = !DILocation(line: 1372, column: 35, scope: !1374)
!1381 = !DILocalVariable(name: "u32Temp1", scope: !1374, file: !70, line: 1374, type: !733)
!1382 = !DILocation(line: 1374, column: 6, scope: !1374)
!1383 = !DILocalVariable(name: "u32Temp2", scope: !1374, file: !70, line: 1374, type: !733)
!1384 = !DILocation(line: 1374, column: 17, scope: !1374)
!1385 = !DILocalVariable(name: "u32Temp3", scope: !1374, file: !70, line: 1374, type: !733)
!1386 = !DILocation(line: 1374, column: 27, scope: !1374)
!1387 = !DILocalVariable(name: "u8SignBit", scope: !1374, file: !70, line: 1375, type: !24)
!1388 = !DILocation(line: 1375, column: 5, scope: !1374)
!1389 = !DILocation(line: 1377, column: 5, scope: !1390)
!1390 = distinct !DILexicalBlock(scope: !1374, file: !70, line: 1377, column: 5)
!1391 = !DILocation(line: 1377, column: 9, scope: !1390)
!1392 = !DILocation(line: 1377, column: 5, scope: !1374)
!1393 = !DILocation(line: 1378, column: 15, scope: !1390)
!1394 = !DILocation(line: 1378, column: 14, scope: !1390)
!1395 = !DILocation(line: 1378, column: 12, scope: !1390)
!1396 = !DILocation(line: 1378, column: 3, scope: !1390)
!1397 = !DILocation(line: 1380, column: 14, scope: !1390)
!1398 = !DILocation(line: 1380, column: 12, scope: !1390)
!1399 = !DILocation(line: 1382, column: 5, scope: !1400)
!1400 = distinct !DILexicalBlock(scope: !1374, file: !70, line: 1382, column: 5)
!1401 = !DILocation(line: 1382, column: 9, scope: !1400)
!1402 = !DILocation(line: 1382, column: 5, scope: !1374)
!1403 = !DILocation(line: 1383, column: 15, scope: !1400)
!1404 = !DILocation(line: 1383, column: 14, scope: !1400)
!1405 = !DILocation(line: 1383, column: 12, scope: !1400)
!1406 = !DILocation(line: 1383, column: 3, scope: !1400)
!1407 = !DILocation(line: 1385, column: 14, scope: !1400)
!1408 = !DILocation(line: 1385, column: 12, scope: !1400)
!1409 = !DILocation(line: 1387, column: 6, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1374, file: !70, line: 1387, column: 5)
!1411 = !DILocation(line: 1387, column: 10, scope: !1410)
!1412 = !DILocation(line: 1387, column: 13, scope: !1410)
!1413 = !DILocation(line: 1387, column: 28, scope: !1410)
!1414 = !DILocation(line: 1387, column: 32, scope: !1410)
!1415 = !DILocation(line: 1387, column: 35, scope: !1410)
!1416 = !DILocation(line: 1388, column: 12, scope: !1410)
!1417 = !DILocation(line: 1388, column: 3, scope: !1410)
!1418 = !DILocation(line: 1390, column: 12, scope: !1410)
!1419 = !DILocation(line: 1391, column: 29, scope: !1374)
!1420 = !DILocation(line: 1391, column: 38, scope: !1374)
!1421 = !DILocation(line: 1391, column: 13, scope: !1374)
!1422 = !DILocation(line: 1391, column: 11, scope: !1374)
!1423 = !DILocation(line: 1393, column: 5, scope: !1424)
!1424 = distinct !DILexicalBlock(scope: !1374, file: !70, line: 1393, column: 5)
!1425 = !DILocation(line: 1393, column: 14, scope: !1424)
!1426 = !DILocation(line: 1393, column: 5, scope: !1374)
!1427 = !DILocation(line: 1395, column: 3, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1424, file: !70, line: 1394, column: 2)
!1429 = !DILocation(line: 1399, column: 10, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1424, file: !70, line: 1398, column: 2)
!1431 = !DILocation(line: 1399, column: 3, scope: !1430)
!1432 = !DILocation(line: 1450, column: 1, scope: !1374)
!1433 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !70, file: !70, line: 1465, type: !1434, scopeLine: 1466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1434 = !DISubroutineType(types: !1435)
!1435 = !{!733, !733, !733}
!1436 = !DILocalVariable(name: "val1", arg: 1, scope: !1433, file: !70, line: 1465, type: !733)
!1437 = !DILocation(line: 1465, column: 25, scope: !1433)
!1438 = !DILocalVariable(name: "val2", arg: 2, scope: !1433, file: !70, line: 1465, type: !733)
!1439 = !DILocation(line: 1465, column: 35, scope: !1433)
!1440 = !DILocalVariable(name: "u32Temp1", scope: !1433, file: !70, line: 1467, type: !733)
!1441 = !DILocation(line: 1467, column: 6, scope: !1433)
!1442 = !DILocation(line: 1468, column: 5, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1433, file: !70, line: 1468, column: 5)
!1444 = !DILocation(line: 1468, column: 10, scope: !1443)
!1445 = !DILocation(line: 1468, column: 5, scope: !1433)
!1446 = !DILocation(line: 1470, column: 26, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1443, file: !70, line: 1469, column: 2)
!1448 = !DILocation(line: 1470, column: 25, scope: !1447)
!1449 = !DILocation(line: 1470, column: 12, scope: !1447)
!1450 = !DILocation(line: 1471, column: 6, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1447, file: !70, line: 1471, column: 6)
!1452 = !DILocation(line: 1471, column: 17, scope: !1451)
!1453 = !DILocation(line: 1471, column: 15, scope: !1451)
!1454 = !DILocation(line: 1471, column: 6, scope: !1447)
!1455 = !DILocation(line: 1473, column: 4, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1451, file: !70, line: 1472, column: 3)
!1457 = !DILocation(line: 1477, column: 12, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1451, file: !70, line: 1476, column: 3)
!1459 = !DILocation(line: 1477, column: 19, scope: !1458)
!1460 = !DILocation(line: 1477, column: 17, scope: !1458)
!1461 = !DILocation(line: 1477, column: 4, scope: !1458)
!1462 = !DILocation(line: 1482, column: 3, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1443, file: !70, line: 1481, column: 2)
!1464 = !DILocation(line: 1484, column: 1, scope: !1433)
!1465 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !70, file: !70, line: 1511, type: !1139, scopeLine: 1512, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1466 = !DILocalVariable(name: "value", arg: 1, scope: !1465, file: !70, line: 1511, type: !733)
!1467 = !DILocation(line: 1511, column: 30, scope: !1465)
!1468 = !DILocalVariable(name: "factor", arg: 2, scope: !1465, file: !70, line: 1511, type: !29)
!1469 = !DILocation(line: 1511, column: 41, scope: !1465)
!1470 = !DILocalVariable(name: "u32Temp1", scope: !1465, file: !70, line: 1513, type: !733)
!1471 = !DILocation(line: 1513, column: 6, scope: !1465)
!1472 = !DILocalVariable(name: "u32Temp2", scope: !1465, file: !70, line: 1513, type: !733)
!1473 = !DILocation(line: 1513, column: 20, scope: !1465)
!1474 = !DILocation(line: 1514, column: 13, scope: !1465)
!1475 = !DILocation(line: 1514, column: 21, scope: !1465)
!1476 = !DILocation(line: 1514, column: 19, scope: !1465)
!1477 = !DILocation(line: 1514, column: 11, scope: !1465)
!1478 = !DILocation(line: 1515, column: 25, scope: !1465)
!1479 = !DILocation(line: 1515, column: 32, scope: !1465)
!1480 = !DILocation(line: 1515, column: 13, scope: !1465)
!1481 = !DILocation(line: 1515, column: 11, scope: !1465)
!1482 = !DILocation(line: 1516, column: 14, scope: !1465)
!1483 = !DILocation(line: 1516, column: 23, scope: !1465)
!1484 = !DILocation(line: 1516, column: 11, scope: !1465)
!1485 = !DILocation(line: 1517, column: 14, scope: !1465)
!1486 = !DILocation(line: 1517, column: 23, scope: !1465)
!1487 = !DILocation(line: 1517, column: 11, scope: !1465)
!1488 = !DILocation(line: 1518, column: 9, scope: !1465)
!1489 = !DILocation(line: 1518, column: 2, scope: !1465)
!1490 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !70, file: !70, line: 1537, type: !1139, scopeLine: 1538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1491 = !DILocalVariable(name: "value", arg: 1, scope: !1490, file: !70, line: 1537, type: !733)
!1492 = !DILocation(line: 1537, column: 30, scope: !1490)
!1493 = !DILocalVariable(name: "factor", arg: 2, scope: !1490, file: !70, line: 1537, type: !29)
!1494 = !DILocation(line: 1537, column: 41, scope: !1490)
!1495 = !DILocalVariable(name: "u32Temp1", scope: !1490, file: !70, line: 1539, type: !733)
!1496 = !DILocation(line: 1539, column: 6, scope: !1490)
!1497 = !DILocalVariable(name: "u32Temp2", scope: !1490, file: !70, line: 1539, type: !733)
!1498 = !DILocation(line: 1539, column: 20, scope: !1490)
!1499 = !DILocation(line: 1540, column: 13, scope: !1490)
!1500 = !DILocation(line: 1540, column: 21, scope: !1490)
!1501 = !DILocation(line: 1540, column: 19, scope: !1490)
!1502 = !DILocation(line: 1540, column: 11, scope: !1490)
!1503 = !DILocation(line: 1541, column: 25, scope: !1490)
!1504 = !DILocation(line: 1541, column: 32, scope: !1490)
!1505 = !DILocation(line: 1541, column: 13, scope: !1490)
!1506 = !DILocation(line: 1541, column: 11, scope: !1490)
!1507 = !DILocation(line: 1542, column: 13, scope: !1490)
!1508 = !DILocation(line: 1542, column: 22, scope: !1490)
!1509 = !DILocation(line: 1542, column: 11, scope: !1490)
!1510 = !DILocation(line: 1543, column: 14, scope: !1490)
!1511 = !DILocation(line: 1543, column: 23, scope: !1490)
!1512 = !DILocation(line: 1543, column: 11, scope: !1490)
!1513 = !DILocation(line: 1544, column: 6, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1490, file: !70, line: 1544, column: 5)
!1515 = !DILocation(line: 1544, column: 14, scope: !1514)
!1516 = !DILocation(line: 1544, column: 20, scope: !1514)
!1517 = !DILocation(line: 1544, column: 5, scope: !1490)
!1518 = !DILocation(line: 1546, column: 10, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1514, file: !70, line: 1545, column: 2)
!1520 = !DILocation(line: 1546, column: 3, scope: !1519)
!1521 = !DILocation(line: 1550, column: 3, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1514, file: !70, line: 1549, column: 2)
!1523 = !DILocation(line: 1552, column: 1, scope: !1490)
!1524 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !70, file: !70, line: 1570, type: !1525, scopeLine: 1571, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1525 = !DISubroutineType(types: !1526)
!1526 = !{!733, !733, !13}
!1527 = !DILocalVariable(name: "value", arg: 1, scope: !1524, file: !70, line: 1570, type: !733)
!1528 = !DILocation(line: 1570, column: 30, scope: !1524)
!1529 = !DILocalVariable(name: "factor", arg: 2, scope: !1524, file: !70, line: 1570, type: !13)
!1530 = !DILocation(line: 1570, column: 41, scope: !1524)
!1531 = !DILocalVariable(name: "u32Temp1", scope: !1524, file: !70, line: 1572, type: !733)
!1532 = !DILocation(line: 1572, column: 6, scope: !1524)
!1533 = !DILocalVariable(name: "u32Temp2", scope: !1524, file: !70, line: 1572, type: !733)
!1534 = !DILocation(line: 1572, column: 20, scope: !1524)
!1535 = !DILocation(line: 1573, column: 5, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1524, file: !70, line: 1573, column: 5)
!1537 = !DILocation(line: 1573, column: 12, scope: !1536)
!1538 = !DILocation(line: 1573, column: 5, scope: !1524)
!1539 = !DILocation(line: 1576, column: 14, scope: !1540)
!1540 = distinct !DILexicalBlock(scope: !1536, file: !70, line: 1574, column: 2)
!1541 = !DILocation(line: 1576, column: 22, scope: !1540)
!1542 = !DILocation(line: 1576, column: 20, scope: !1540)
!1543 = !DILocation(line: 1576, column: 12, scope: !1540)
!1544 = !DILocation(line: 1577, column: 26, scope: !1540)
!1545 = !DILocation(line: 1577, column: 33, scope: !1540)
!1546 = !DILocation(line: 1577, column: 14, scope: !1540)
!1547 = !DILocation(line: 1577, column: 12, scope: !1540)
!1548 = !DILocation(line: 1578, column: 14, scope: !1540)
!1549 = !DILocation(line: 1578, column: 23, scope: !1540)
!1550 = !DILocation(line: 1578, column: 12, scope: !1540)
!1551 = !DILocation(line: 1579, column: 15, scope: !1540)
!1552 = !DILocation(line: 1579, column: 24, scope: !1540)
!1553 = !DILocation(line: 1579, column: 12, scope: !1540)
!1554 = !DILocation(line: 1580, column: 10, scope: !1540)
!1555 = !DILocation(line: 1580, column: 3, scope: !1540)
!1556 = !DILocation(line: 1584, column: 3, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1536, file: !70, line: 1583, column: 2)
!1558 = !DILocation(line: 1586, column: 1, scope: !1524)
!1559 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !70, file: !70, line: 1605, type: !1525, scopeLine: 1606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1560 = !DILocalVariable(name: "value", arg: 1, scope: !1559, file: !70, line: 1605, type: !733)
!1561 = !DILocation(line: 1605, column: 31, scope: !1559)
!1562 = !DILocalVariable(name: "factor", arg: 2, scope: !1559, file: !70, line: 1605, type: !13)
!1563 = !DILocation(line: 1605, column: 42, scope: !1559)
!1564 = !DILocalVariable(name: "u32Temp1", scope: !1559, file: !70, line: 1607, type: !733)
!1565 = !DILocation(line: 1607, column: 6, scope: !1559)
!1566 = !DILocalVariable(name: "u32Temp2", scope: !1559, file: !70, line: 1607, type: !733)
!1567 = !DILocation(line: 1607, column: 20, scope: !1559)
!1568 = !DILocation(line: 1608, column: 5, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1559, file: !70, line: 1608, column: 5)
!1570 = !DILocation(line: 1608, column: 12, scope: !1569)
!1571 = !DILocation(line: 1608, column: 5, scope: !1559)
!1572 = !DILocation(line: 1610, column: 3, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !70, line: 1609, column: 2)
!1574 = !DILocation(line: 1614, column: 14, scope: !1575)
!1575 = distinct !DILexicalBlock(scope: !1569, file: !70, line: 1613, column: 2)
!1576 = !DILocation(line: 1614, column: 22, scope: !1575)
!1577 = !DILocation(line: 1614, column: 20, scope: !1575)
!1578 = !DILocation(line: 1614, column: 12, scope: !1575)
!1579 = !DILocation(line: 1615, column: 26, scope: !1575)
!1580 = !DILocation(line: 1615, column: 33, scope: !1575)
!1581 = !DILocation(line: 1615, column: 14, scope: !1575)
!1582 = !DILocation(line: 1615, column: 12, scope: !1575)
!1583 = !DILocation(line: 1616, column: 14, scope: !1575)
!1584 = !DILocation(line: 1616, column: 23, scope: !1575)
!1585 = !DILocation(line: 1616, column: 12, scope: !1575)
!1586 = !DILocation(line: 1617, column: 15, scope: !1575)
!1587 = !DILocation(line: 1617, column: 24, scope: !1575)
!1588 = !DILocation(line: 1617, column: 12, scope: !1575)
!1589 = !DILocation(line: 1618, column: 7, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1575, file: !70, line: 1618, column: 6)
!1591 = !DILocation(line: 1618, column: 16, scope: !1590)
!1592 = !DILocation(line: 1618, column: 23, scope: !1590)
!1593 = !DILocation(line: 1618, column: 6, scope: !1575)
!1594 = !DILocation(line: 1620, column: 11, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1590, file: !70, line: 1619, column: 3)
!1596 = !DILocation(line: 1620, column: 4, scope: !1595)
!1597 = !DILocation(line: 1624, column: 4, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1590, file: !70, line: 1623, column: 3)
!1599 = !DILocation(line: 1627, column: 1, scope: !1559)
!1600 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !70, file: !70, line: 1642, type: !1434, scopeLine: 1643, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1601 = !DILocalVariable(name: "value", arg: 1, scope: !1600, file: !70, line: 1642, type: !733)
!1602 = !DILocation(line: 1642, column: 30, scope: !1600)
!1603 = !DILocalVariable(name: "factor", arg: 2, scope: !1600, file: !70, line: 1642, type: !733)
!1604 = !DILocation(line: 1642, column: 40, scope: !1600)
!1605 = !DILocation(line: 1644, column: 21, scope: !1600)
!1606 = !DILocation(line: 1644, column: 28, scope: !1600)
!1607 = !DILocation(line: 1644, column: 9, scope: !1600)
!1608 = !DILocation(line: 1644, column: 2, scope: !1600)
!1609 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !70, file: !70, line: 1663, type: !1434, scopeLine: 1664, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1610 = !DILocalVariable(name: "value", arg: 1, scope: !1609, file: !70, line: 1663, type: !733)
!1611 = !DILocation(line: 1663, column: 30, scope: !1609)
!1612 = !DILocalVariable(name: "factor", arg: 2, scope: !1609, file: !70, line: 1663, type: !733)
!1613 = !DILocation(line: 1663, column: 40, scope: !1609)
!1614 = !DILocalVariable(name: "u32Temp1", scope: !1609, file: !70, line: 1665, type: !733)
!1615 = !DILocation(line: 1665, column: 6, scope: !1609)
!1616 = !DILocalVariable(name: "u32Temp2", scope: !1609, file: !70, line: 1665, type: !733)
!1617 = !DILocation(line: 1665, column: 20, scope: !1609)
!1618 = !DILocation(line: 1666, column: 13, scope: !1609)
!1619 = !DILocation(line: 1666, column: 21, scope: !1609)
!1620 = !DILocation(line: 1666, column: 19, scope: !1609)
!1621 = !DILocation(line: 1666, column: 11, scope: !1609)
!1622 = !DILocation(line: 1667, column: 25, scope: !1609)
!1623 = !DILocation(line: 1667, column: 32, scope: !1609)
!1624 = !DILocation(line: 1667, column: 13, scope: !1609)
!1625 = !DILocation(line: 1667, column: 11, scope: !1609)
!1626 = !DILocation(line: 1668, column: 13, scope: !1609)
!1627 = !DILocation(line: 1668, column: 22, scope: !1609)
!1628 = !DILocation(line: 1668, column: 11, scope: !1609)
!1629 = !DILocation(line: 1669, column: 14, scope: !1609)
!1630 = !DILocation(line: 1669, column: 23, scope: !1609)
!1631 = !DILocation(line: 1669, column: 11, scope: !1609)
!1632 = !DILocation(line: 1670, column: 6, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1609, file: !70, line: 1670, column: 5)
!1634 = !DILocation(line: 1670, column: 14, scope: !1633)
!1635 = !DILocation(line: 1670, column: 20, scope: !1633)
!1636 = !DILocation(line: 1670, column: 5, scope: !1609)
!1637 = !DILocation(line: 1672, column: 10, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1633, file: !70, line: 1671, column: 2)
!1639 = !DILocation(line: 1672, column: 3, scope: !1638)
!1640 = !DILocation(line: 1676, column: 3, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1633, file: !70, line: 1675, column: 2)
!1642 = !DILocation(line: 1678, column: 1, scope: !1609)
!1643 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !70, file: !70, line: 1696, type: !1343, scopeLine: 1697, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1644 = !DILocalVariable(name: "value", arg: 1, scope: !1643, file: !70, line: 1696, type: !733)
!1645 = !DILocation(line: 1696, column: 30, scope: !1643)
!1646 = !DILocalVariable(name: "factor", arg: 2, scope: !1643, file: !70, line: 1696, type: !20)
!1647 = !DILocation(line: 1696, column: 40, scope: !1643)
!1648 = !DILocalVariable(name: "u32Temp1", scope: !1643, file: !70, line: 1698, type: !733)
!1649 = !DILocation(line: 1698, column: 6, scope: !1643)
!1650 = !DILocalVariable(name: "u32Temp2", scope: !1643, file: !70, line: 1698, type: !733)
!1651 = !DILocation(line: 1698, column: 20, scope: !1643)
!1652 = !DILocation(line: 1699, column: 5, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1643, file: !70, line: 1699, column: 5)
!1654 = !DILocation(line: 1699, column: 12, scope: !1653)
!1655 = !DILocation(line: 1699, column: 5, scope: !1643)
!1656 = !DILocation(line: 1701, column: 14, scope: !1657)
!1657 = distinct !DILexicalBlock(scope: !1653, file: !70, line: 1700, column: 2)
!1658 = !DILocation(line: 1701, column: 22, scope: !1657)
!1659 = !DILocation(line: 1701, column: 20, scope: !1657)
!1660 = !DILocation(line: 1701, column: 12, scope: !1657)
!1661 = !DILocation(line: 1702, column: 26, scope: !1657)
!1662 = !DILocation(line: 1702, column: 33, scope: !1657)
!1663 = !DILocation(line: 1702, column: 14, scope: !1657)
!1664 = !DILocation(line: 1702, column: 12, scope: !1657)
!1665 = !DILocation(line: 1703, column: 14, scope: !1657)
!1666 = !DILocation(line: 1703, column: 23, scope: !1657)
!1667 = !DILocation(line: 1703, column: 12, scope: !1657)
!1668 = !DILocation(line: 1704, column: 15, scope: !1657)
!1669 = !DILocation(line: 1704, column: 24, scope: !1657)
!1670 = !DILocation(line: 1704, column: 12, scope: !1657)
!1671 = !DILocation(line: 1705, column: 10, scope: !1657)
!1672 = !DILocation(line: 1705, column: 3, scope: !1657)
!1673 = !DILocation(line: 1709, column: 3, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1653, file: !70, line: 1708, column: 2)
!1675 = !DILocation(line: 1711, column: 1, scope: !1643)
!1676 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !70, file: !70, line: 1730, type: !1343, scopeLine: 1731, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1677 = !DILocalVariable(name: "value", arg: 1, scope: !1676, file: !70, line: 1730, type: !733)
!1678 = !DILocation(line: 1730, column: 30, scope: !1676)
!1679 = !DILocalVariable(name: "factor", arg: 2, scope: !1676, file: !70, line: 1730, type: !20)
!1680 = !DILocation(line: 1730, column: 40, scope: !1676)
!1681 = !DILocalVariable(name: "u32Temp1", scope: !1676, file: !70, line: 1732, type: !733)
!1682 = !DILocation(line: 1732, column: 6, scope: !1676)
!1683 = !DILocalVariable(name: "u32Temp2", scope: !1676, file: !70, line: 1732, type: !733)
!1684 = !DILocation(line: 1732, column: 20, scope: !1676)
!1685 = !DILocation(line: 1733, column: 5, scope: !1686)
!1686 = distinct !DILexicalBlock(scope: !1676, file: !70, line: 1733, column: 5)
!1687 = !DILocation(line: 1733, column: 12, scope: !1686)
!1688 = !DILocation(line: 1733, column: 5, scope: !1676)
!1689 = !DILocation(line: 1735, column: 3, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1686, file: !70, line: 1734, column: 2)
!1691 = !DILocation(line: 1739, column: 14, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1686, file: !70, line: 1738, column: 2)
!1693 = !DILocation(line: 1739, column: 22, scope: !1692)
!1694 = !DILocation(line: 1739, column: 20, scope: !1692)
!1695 = !DILocation(line: 1739, column: 12, scope: !1692)
!1696 = !DILocation(line: 1740, column: 26, scope: !1692)
!1697 = !DILocation(line: 1740, column: 33, scope: !1692)
!1698 = !DILocation(line: 1740, column: 14, scope: !1692)
!1699 = !DILocation(line: 1740, column: 12, scope: !1692)
!1700 = !DILocation(line: 1741, column: 14, scope: !1692)
!1701 = !DILocation(line: 1741, column: 23, scope: !1692)
!1702 = !DILocation(line: 1741, column: 12, scope: !1692)
!1703 = !DILocation(line: 1742, column: 15, scope: !1692)
!1704 = !DILocation(line: 1742, column: 24, scope: !1692)
!1705 = !DILocation(line: 1742, column: 12, scope: !1692)
!1706 = !DILocation(line: 1743, column: 7, scope: !1707)
!1707 = distinct !DILexicalBlock(scope: !1692, file: !70, line: 1743, column: 6)
!1708 = !DILocation(line: 1743, column: 15, scope: !1707)
!1709 = !DILocation(line: 1743, column: 21, scope: !1707)
!1710 = !DILocation(line: 1743, column: 6, scope: !1692)
!1711 = !DILocation(line: 1745, column: 11, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1707, file: !70, line: 1744, column: 3)
!1713 = !DILocation(line: 1745, column: 4, scope: !1712)
!1714 = !DILocation(line: 1749, column: 4, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1707, file: !70, line: 1748, column: 3)
!1716 = !DILocation(line: 1752, column: 1, scope: !1676)
!1717 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !70, file: !70, line: 1767, type: !1718, scopeLine: 1768, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!20, !733, !20}
!1720 = !DILocalVariable(name: "val1", arg: 1, scope: !1717, file: !70, line: 1767, type: !733)
!1721 = !DILocation(line: 1767, column: 25, scope: !1717)
!1722 = !DILocalVariable(name: "val2", arg: 2, scope: !1717, file: !70, line: 1767, type: !20)
!1723 = !DILocation(line: 1767, column: 35, scope: !1717)
!1724 = !DILocalVariable(name: "s32Val2prime", scope: !1717, file: !70, line: 1769, type: !20)
!1725 = !DILocation(line: 1769, column: 6, scope: !1717)
!1726 = !DILocation(line: 1770, column: 5, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1717, file: !70, line: 1770, column: 5)
!1728 = !DILocation(line: 1770, column: 10, scope: !1727)
!1729 = !DILocation(line: 1770, column: 5, scope: !1717)
!1730 = !DILocation(line: 1772, column: 19, scope: !1731)
!1731 = distinct !DILexicalBlock(scope: !1727, file: !70, line: 1771, column: 2)
!1732 = !DILocation(line: 1772, column: 18, scope: !1731)
!1733 = !DILocation(line: 1772, column: 16, scope: !1731)
!1734 = !DILocation(line: 1773, column: 2, scope: !1731)
!1735 = !DILocation(line: 1774, column: 5, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1717, file: !70, line: 1774, column: 5)
!1737 = !DILocation(line: 1774, column: 10, scope: !1736)
!1738 = !DILocation(line: 1774, column: 5, scope: !1717)
!1739 = !DILocation(line: 1776, column: 6, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1741, file: !70, line: 1776, column: 6)
!1741 = distinct !DILexicalBlock(scope: !1736, file: !70, line: 1775, column: 2)
!1742 = !DILocation(line: 1776, column: 11, scope: !1740)
!1743 = !DILocation(line: 1776, column: 6, scope: !1741)
!1744 = !DILocation(line: 1778, column: 21, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1746, file: !70, line: 1778, column: 7)
!1746 = distinct !DILexicalBlock(scope: !1740, file: !70, line: 1777, column: 3)
!1747 = !DILocation(line: 1778, column: 19, scope: !1745)
!1748 = !DILocation(line: 1778, column: 37, scope: !1745)
!1749 = !DILocation(line: 1778, column: 35, scope: !1745)
!1750 = !DILocation(line: 1778, column: 7, scope: !1746)
!1751 = !DILocation(line: 1780, column: 13, scope: !1752)
!1752 = distinct !DILexicalBlock(scope: !1745, file: !70, line: 1779, column: 4)
!1753 = !DILocation(line: 1780, column: 20, scope: !1752)
!1754 = !DILocation(line: 1780, column: 18, scope: !1752)
!1755 = !DILocation(line: 1780, column: 5, scope: !1752)
!1756 = !DILocation(line: 1784, column: 5, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1745, file: !70, line: 1783, column: 4)
!1758 = !DILocation(line: 1789, column: 21, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1760, file: !70, line: 1789, column: 7)
!1760 = distinct !DILexicalBlock(scope: !1740, file: !70, line: 1788, column: 3)
!1761 = !DILocation(line: 1789, column: 19, scope: !1759)
!1762 = !DILocation(line: 1789, column: 29, scope: !1759)
!1763 = !DILocation(line: 1789, column: 27, scope: !1759)
!1764 = !DILocation(line: 1789, column: 7, scope: !1760)
!1765 = !DILocation(line: 1791, column: 5, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1759, file: !70, line: 1790, column: 4)
!1767 = !DILocation(line: 1795, column: 13, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1759, file: !70, line: 1794, column: 4)
!1769 = !DILocation(line: 1795, column: 20, scope: !1768)
!1770 = !DILocation(line: 1795, column: 18, scope: !1768)
!1771 = !DILocation(line: 1795, column: 5, scope: !1768)
!1772 = !DILocation(line: 1801, column: 3, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1736, file: !70, line: 1800, column: 2)
!1774 = !DILocation(line: 1803, column: 1, scope: !1717)
!1775 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !70, file: !70, line: 1820, type: !772, scopeLine: 1821, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1776 = !DILocalVariable(name: "val1", arg: 1, scope: !1775, file: !70, line: 1820, type: !20)
!1777 = !DILocation(line: 1820, column: 30, scope: !1775)
!1778 = !DILocalVariable(name: "val2", arg: 2, scope: !1775, file: !70, line: 1820, type: !29)
!1779 = !DILocation(line: 1820, column: 39, scope: !1775)
!1780 = !DILocalVariable(name: "u32Temp1", scope: !1775, file: !70, line: 1822, type: !733)
!1781 = !DILocation(line: 1822, column: 6, scope: !1775)
!1782 = !DILocalVariable(name: "u32Temp2", scope: !1775, file: !70, line: 1822, type: !733)
!1783 = !DILocation(line: 1822, column: 17, scope: !1775)
!1784 = !DILocalVariable(name: "u32Temp3", scope: !1775, file: !70, line: 1822, type: !733)
!1785 = !DILocation(line: 1822, column: 26, scope: !1775)
!1786 = !DILocalVariable(name: "u8SignBit", scope: !1775, file: !70, line: 1823, type: !24)
!1787 = !DILocation(line: 1823, column: 5, scope: !1775)
!1788 = !DILocation(line: 1825, column: 5, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1775, file: !70, line: 1825, column: 5)
!1790 = !DILocation(line: 1825, column: 9, scope: !1789)
!1791 = !DILocation(line: 1825, column: 5, scope: !1775)
!1792 = !DILocation(line: 1827, column: 15, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1789, file: !70, line: 1826, column: 2)
!1794 = !DILocation(line: 1827, column: 14, scope: !1793)
!1795 = !DILocation(line: 1827, column: 12, scope: !1793)
!1796 = !DILocation(line: 1828, column: 13, scope: !1793)
!1797 = !DILocation(line: 1829, column: 2, scope: !1793)
!1798 = !DILocation(line: 1832, column: 14, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1789, file: !70, line: 1831, column: 2)
!1800 = !DILocation(line: 1832, column: 12, scope: !1799)
!1801 = !DILocation(line: 1833, column: 13, scope: !1799)
!1802 = !DILocation(line: 1836, column: 13, scope: !1775)
!1803 = !DILocation(line: 1836, column: 24, scope: !1775)
!1804 = !DILocation(line: 1836, column: 22, scope: !1775)
!1805 = !DILocation(line: 1836, column: 11, scope: !1775)
!1806 = !DILocation(line: 1837, column: 25, scope: !1775)
!1807 = !DILocation(line: 1837, column: 35, scope: !1775)
!1808 = !DILocation(line: 1837, column: 13, scope: !1775)
!1809 = !DILocation(line: 1837, column: 11, scope: !1775)
!1810 = !DILocation(line: 1838, column: 13, scope: !1775)
!1811 = !DILocation(line: 1838, column: 22, scope: !1775)
!1812 = !DILocation(line: 1838, column: 11, scope: !1775)
!1813 = !DILocation(line: 1839, column: 14, scope: !1775)
!1814 = !DILocation(line: 1839, column: 23, scope: !1775)
!1815 = !DILocation(line: 1839, column: 11, scope: !1775)
!1816 = !DILocation(line: 1840, column: 5, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1775, file: !70, line: 1840, column: 5)
!1818 = !DILocation(line: 1840, column: 15, scope: !1817)
!1819 = !DILocation(line: 1840, column: 5, scope: !1775)
!1820 = !DILocation(line: 1842, column: 10, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1817, file: !70, line: 1841, column: 2)
!1822 = !DILocation(line: 1842, column: 3, scope: !1821)
!1823 = !DILocation(line: 1846, column: 11, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1817, file: !70, line: 1845, column: 2)
!1825 = !DILocation(line: 1846, column: 10, scope: !1824)
!1826 = !DILocation(line: 1846, column: 3, scope: !1824)
!1827 = !DILocation(line: 1848, column: 1, scope: !1775)
!1828 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !70, file: !70, line: 1867, type: !772, scopeLine: 1868, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1829 = !DILocalVariable(name: "val1", arg: 1, scope: !1828, file: !70, line: 1867, type: !20)
!1830 = !DILocation(line: 1867, column: 30, scope: !1828)
!1831 = !DILocalVariable(name: "val2", arg: 2, scope: !1828, file: !70, line: 1867, type: !29)
!1832 = !DILocation(line: 1867, column: 39, scope: !1828)
!1833 = !DILocalVariable(name: "u32Temp1", scope: !1828, file: !70, line: 1869, type: !733)
!1834 = !DILocation(line: 1869, column: 6, scope: !1828)
!1835 = !DILocalVariable(name: "u32Temp2", scope: !1828, file: !70, line: 1869, type: !733)
!1836 = !DILocation(line: 1869, column: 17, scope: !1828)
!1837 = !DILocalVariable(name: "u32Temp3", scope: !1828, file: !70, line: 1869, type: !733)
!1838 = !DILocation(line: 1869, column: 26, scope: !1828)
!1839 = !DILocalVariable(name: "u8SignBit", scope: !1828, file: !70, line: 1870, type: !24)
!1840 = !DILocation(line: 1870, column: 5, scope: !1828)
!1841 = !DILocation(line: 1872, column: 5, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1828, file: !70, line: 1872, column: 5)
!1843 = !DILocation(line: 1872, column: 9, scope: !1842)
!1844 = !DILocation(line: 1872, column: 5, scope: !1828)
!1845 = !DILocation(line: 1874, column: 15, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1842, file: !70, line: 1873, column: 2)
!1847 = !DILocation(line: 1874, column: 14, scope: !1846)
!1848 = !DILocation(line: 1874, column: 12, scope: !1846)
!1849 = !DILocation(line: 1875, column: 13, scope: !1846)
!1850 = !DILocation(line: 1876, column: 2, scope: !1846)
!1851 = !DILocation(line: 1879, column: 14, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1842, file: !70, line: 1878, column: 2)
!1853 = !DILocation(line: 1879, column: 12, scope: !1852)
!1854 = !DILocation(line: 1880, column: 13, scope: !1852)
!1855 = !DILocation(line: 1883, column: 13, scope: !1828)
!1856 = !DILocation(line: 1883, column: 24, scope: !1828)
!1857 = !DILocation(line: 1883, column: 22, scope: !1828)
!1858 = !DILocation(line: 1883, column: 11, scope: !1828)
!1859 = !DILocation(line: 1884, column: 25, scope: !1828)
!1860 = !DILocation(line: 1884, column: 35, scope: !1828)
!1861 = !DILocation(line: 1884, column: 13, scope: !1828)
!1862 = !DILocation(line: 1884, column: 11, scope: !1828)
!1863 = !DILocation(line: 1885, column: 13, scope: !1828)
!1864 = !DILocation(line: 1885, column: 22, scope: !1828)
!1865 = !DILocation(line: 1885, column: 11, scope: !1828)
!1866 = !DILocation(line: 1886, column: 14, scope: !1828)
!1867 = !DILocation(line: 1886, column: 23, scope: !1828)
!1868 = !DILocation(line: 1886, column: 11, scope: !1828)
!1869 = !DILocation(line: 1887, column: 5, scope: !1870)
!1870 = distinct !DILexicalBlock(scope: !1828, file: !70, line: 1887, column: 5)
!1871 = !DILocation(line: 1887, column: 15, scope: !1870)
!1872 = !DILocation(line: 1887, column: 5, scope: !1828)
!1873 = !DILocation(line: 1889, column: 6, scope: !1874)
!1874 = distinct !DILexicalBlock(scope: !1875, file: !70, line: 1889, column: 6)
!1875 = distinct !DILexicalBlock(scope: !1870, file: !70, line: 1888, column: 2)
!1876 = !DILocation(line: 1889, column: 14, scope: !1874)
!1877 = !DILocation(line: 1889, column: 6, scope: !1875)
!1878 = !DILocation(line: 1890, column: 11, scope: !1874)
!1879 = !DILocation(line: 1890, column: 4, scope: !1874)
!1880 = !DILocation(line: 1892, column: 4, scope: !1874)
!1881 = !DILocation(line: 1896, column: 6, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1883, file: !70, line: 1896, column: 6)
!1883 = distinct !DILexicalBlock(scope: !1870, file: !70, line: 1895, column: 2)
!1884 = !DILocation(line: 1896, column: 14, scope: !1882)
!1885 = !DILocation(line: 1896, column: 6, scope: !1883)
!1886 = !DILocation(line: 1897, column: 12, scope: !1882)
!1887 = !DILocation(line: 1897, column: 11, scope: !1882)
!1888 = !DILocation(line: 1897, column: 4, scope: !1882)
!1889 = !DILocation(line: 1899, column: 4, scope: !1882)
!1890 = !DILocation(line: 1901, column: 1, scope: !1828)
!1891 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !70, file: !70, line: 1921, type: !1892, scopeLine: 1922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1892 = !DISubroutineType(types: !1893)
!1893 = !{!20, !20, !13}
!1894 = !DILocalVariable(name: "val1", arg: 1, scope: !1891, file: !70, line: 1921, type: !20)
!1895 = !DILocation(line: 1921, column: 30, scope: !1891)
!1896 = !DILocalVariable(name: "val2", arg: 2, scope: !1891, file: !70, line: 1921, type: !13)
!1897 = !DILocation(line: 1921, column: 39, scope: !1891)
!1898 = !DILocalVariable(name: "u32Temp1", scope: !1891, file: !70, line: 1923, type: !733)
!1899 = !DILocation(line: 1923, column: 6, scope: !1891)
!1900 = !DILocalVariable(name: "u32Temp2", scope: !1891, file: !70, line: 1923, type: !733)
!1901 = !DILocation(line: 1923, column: 17, scope: !1891)
!1902 = !DILocalVariable(name: "u32Temp3", scope: !1891, file: !70, line: 1923, type: !733)
!1903 = !DILocation(line: 1923, column: 26, scope: !1891)
!1904 = !DILocalVariable(name: "u32Temp4", scope: !1891, file: !70, line: 1923, type: !733)
!1905 = !DILocation(line: 1923, column: 35, scope: !1891)
!1906 = !DILocalVariable(name: "u8SignBit", scope: !1891, file: !70, line: 1924, type: !24)
!1907 = !DILocation(line: 1924, column: 5, scope: !1891)
!1908 = !DILocation(line: 1926, column: 7, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1891, file: !70, line: 1926, column: 5)
!1910 = !DILocation(line: 1926, column: 11, scope: !1909)
!1911 = !DILocation(line: 1926, column: 15, scope: !1909)
!1912 = !DILocation(line: 1926, column: 19, scope: !1909)
!1913 = !DILocation(line: 1926, column: 23, scope: !1909)
!1914 = !DILocation(line: 1926, column: 28, scope: !1909)
!1915 = !DILocation(line: 1926, column: 33, scope: !1909)
!1916 = !DILocation(line: 1926, column: 37, scope: !1909)
!1917 = !DILocation(line: 1926, column: 41, scope: !1909)
!1918 = !DILocation(line: 1926, column: 45, scope: !1909)
!1919 = !DILocation(line: 1926, column: 49, scope: !1909)
!1920 = !DILocation(line: 1926, column: 5, scope: !1891)
!1921 = !DILocation(line: 1928, column: 13, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1909, file: !70, line: 1927, column: 2)
!1923 = !DILocation(line: 1929, column: 2, scope: !1922)
!1924 = !DILocation(line: 1932, column: 13, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1909, file: !70, line: 1931, column: 2)
!1926 = !DILocation(line: 1935, column: 5, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1891, file: !70, line: 1935, column: 5)
!1928 = !DILocation(line: 1935, column: 9, scope: !1927)
!1929 = !DILocation(line: 1935, column: 5, scope: !1891)
!1930 = !DILocation(line: 1937, column: 15, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1927, file: !70, line: 1936, column: 2)
!1932 = !DILocation(line: 1937, column: 14, scope: !1931)
!1933 = !DILocation(line: 1937, column: 12, scope: !1931)
!1934 = !DILocation(line: 1938, column: 2, scope: !1931)
!1935 = !DILocation(line: 1941, column: 14, scope: !1936)
!1936 = distinct !DILexicalBlock(scope: !1927, file: !70, line: 1940, column: 2)
!1937 = !DILocation(line: 1941, column: 12, scope: !1936)
!1938 = !DILocation(line: 1944, column: 5, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1891, file: !70, line: 1944, column: 5)
!1940 = !DILocation(line: 1944, column: 9, scope: !1939)
!1941 = !DILocation(line: 1944, column: 5, scope: !1891)
!1942 = !DILocation(line: 1946, column: 15, scope: !1943)
!1943 = distinct !DILexicalBlock(scope: !1939, file: !70, line: 1945, column: 2)
!1944 = !DILocation(line: 1946, column: 14, scope: !1943)
!1945 = !DILocation(line: 1946, column: 12, scope: !1943)
!1946 = !DILocation(line: 1947, column: 2, scope: !1943)
!1947 = !DILocation(line: 1950, column: 14, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1939, file: !70, line: 1949, column: 2)
!1949 = !DILocation(line: 1950, column: 12, scope: !1948)
!1950 = !DILocation(line: 1953, column: 13, scope: !1891)
!1951 = !DILocation(line: 1953, column: 24, scope: !1891)
!1952 = !DILocation(line: 1953, column: 22, scope: !1891)
!1953 = !DILocation(line: 1953, column: 11, scope: !1891)
!1954 = !DILocation(line: 1954, column: 25, scope: !1891)
!1955 = !DILocation(line: 1954, column: 35, scope: !1891)
!1956 = !DILocation(line: 1954, column: 13, scope: !1891)
!1957 = !DILocation(line: 1954, column: 11, scope: !1891)
!1958 = !DILocation(line: 1955, column: 13, scope: !1891)
!1959 = !DILocation(line: 1955, column: 22, scope: !1891)
!1960 = !DILocation(line: 1955, column: 11, scope: !1891)
!1961 = !DILocation(line: 1956, column: 14, scope: !1891)
!1962 = !DILocation(line: 1956, column: 23, scope: !1891)
!1963 = !DILocation(line: 1956, column: 11, scope: !1891)
!1964 = !DILocation(line: 1957, column: 5, scope: !1965)
!1965 = distinct !DILexicalBlock(scope: !1891, file: !70, line: 1957, column: 5)
!1966 = !DILocation(line: 1957, column: 15, scope: !1965)
!1967 = !DILocation(line: 1957, column: 5, scope: !1891)
!1968 = !DILocation(line: 1959, column: 6, scope: !1969)
!1969 = distinct !DILexicalBlock(scope: !1970, file: !70, line: 1959, column: 6)
!1970 = distinct !DILexicalBlock(scope: !1965, file: !70, line: 1958, column: 2)
!1971 = !DILocation(line: 1959, column: 14, scope: !1969)
!1972 = !DILocation(line: 1959, column: 6, scope: !1970)
!1973 = !DILocation(line: 1960, column: 11, scope: !1969)
!1974 = !DILocation(line: 1960, column: 4, scope: !1969)
!1975 = !DILocation(line: 1962, column: 4, scope: !1969)
!1976 = !DILocation(line: 1966, column: 11, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1965, file: !70, line: 1965, column: 2)
!1978 = !DILocation(line: 1966, column: 10, scope: !1977)
!1979 = !DILocation(line: 1966, column: 3, scope: !1977)
!1980 = !DILocation(line: 1968, column: 1, scope: !1891)
!1981 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !70, file: !70, line: 1987, type: !1892, scopeLine: 1988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1982 = !DILocalVariable(name: "val1", arg: 1, scope: !1981, file: !70, line: 1987, type: !20)
!1983 = !DILocation(line: 1987, column: 30, scope: !1981)
!1984 = !DILocalVariable(name: "val2", arg: 2, scope: !1981, file: !70, line: 1987, type: !13)
!1985 = !DILocation(line: 1987, column: 39, scope: !1981)
!1986 = !DILocalVariable(name: "u32Temp1", scope: !1981, file: !70, line: 1989, type: !733)
!1987 = !DILocation(line: 1989, column: 6, scope: !1981)
!1988 = !DILocalVariable(name: "u32Temp2", scope: !1981, file: !70, line: 1989, type: !733)
!1989 = !DILocation(line: 1989, column: 17, scope: !1981)
!1990 = !DILocalVariable(name: "u32Temp3", scope: !1981, file: !70, line: 1989, type: !733)
!1991 = !DILocation(line: 1989, column: 26, scope: !1981)
!1992 = !DILocalVariable(name: "u32Temp4", scope: !1981, file: !70, line: 1989, type: !733)
!1993 = !DILocation(line: 1989, column: 35, scope: !1981)
!1994 = !DILocalVariable(name: "u8SignBit", scope: !1981, file: !70, line: 1990, type: !24)
!1995 = !DILocation(line: 1990, column: 5, scope: !1981)
!1996 = !DILocation(line: 1992, column: 7, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1981, file: !70, line: 1992, column: 5)
!1998 = !DILocation(line: 1992, column: 11, scope: !1997)
!1999 = !DILocation(line: 1992, column: 15, scope: !1997)
!2000 = !DILocation(line: 1992, column: 19, scope: !1997)
!2001 = !DILocation(line: 1992, column: 23, scope: !1997)
!2002 = !DILocation(line: 1992, column: 28, scope: !1997)
!2003 = !DILocation(line: 1992, column: 33, scope: !1997)
!2004 = !DILocation(line: 1992, column: 37, scope: !1997)
!2005 = !DILocation(line: 1992, column: 41, scope: !1997)
!2006 = !DILocation(line: 1992, column: 45, scope: !1997)
!2007 = !DILocation(line: 1992, column: 49, scope: !1997)
!2008 = !DILocation(line: 1992, column: 5, scope: !1981)
!2009 = !DILocation(line: 1994, column: 13, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !1997, file: !70, line: 1993, column: 2)
!2011 = !DILocation(line: 1995, column: 2, scope: !2010)
!2012 = !DILocation(line: 1998, column: 13, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !1997, file: !70, line: 1997, column: 2)
!2014 = !DILocation(line: 2001, column: 5, scope: !2015)
!2015 = distinct !DILexicalBlock(scope: !1981, file: !70, line: 2001, column: 5)
!2016 = !DILocation(line: 2001, column: 9, scope: !2015)
!2017 = !DILocation(line: 2001, column: 5, scope: !1981)
!2018 = !DILocation(line: 2003, column: 15, scope: !2019)
!2019 = distinct !DILexicalBlock(scope: !2015, file: !70, line: 2002, column: 2)
!2020 = !DILocation(line: 2003, column: 14, scope: !2019)
!2021 = !DILocation(line: 2003, column: 12, scope: !2019)
!2022 = !DILocation(line: 2004, column: 2, scope: !2019)
!2023 = !DILocation(line: 2007, column: 14, scope: !2024)
!2024 = distinct !DILexicalBlock(scope: !2015, file: !70, line: 2006, column: 2)
!2025 = !DILocation(line: 2007, column: 12, scope: !2024)
!2026 = !DILocation(line: 2010, column: 5, scope: !2027)
!2027 = distinct !DILexicalBlock(scope: !1981, file: !70, line: 2010, column: 5)
!2028 = !DILocation(line: 2010, column: 9, scope: !2027)
!2029 = !DILocation(line: 2010, column: 5, scope: !1981)
!2030 = !DILocation(line: 2012, column: 15, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2027, file: !70, line: 2011, column: 2)
!2032 = !DILocation(line: 2012, column: 14, scope: !2031)
!2033 = !DILocation(line: 2012, column: 12, scope: !2031)
!2034 = !DILocation(line: 2013, column: 2, scope: !2031)
!2035 = !DILocation(line: 2016, column: 14, scope: !2036)
!2036 = distinct !DILexicalBlock(scope: !2027, file: !70, line: 2015, column: 2)
!2037 = !DILocation(line: 2016, column: 12, scope: !2036)
!2038 = !DILocation(line: 2019, column: 13, scope: !1981)
!2039 = !DILocation(line: 2019, column: 24, scope: !1981)
!2040 = !DILocation(line: 2019, column: 22, scope: !1981)
!2041 = !DILocation(line: 2019, column: 11, scope: !1981)
!2042 = !DILocation(line: 2020, column: 25, scope: !1981)
!2043 = !DILocation(line: 2020, column: 35, scope: !1981)
!2044 = !DILocation(line: 2020, column: 13, scope: !1981)
!2045 = !DILocation(line: 2020, column: 11, scope: !1981)
!2046 = !DILocation(line: 2021, column: 13, scope: !1981)
!2047 = !DILocation(line: 2021, column: 22, scope: !1981)
!2048 = !DILocation(line: 2021, column: 11, scope: !1981)
!2049 = !DILocation(line: 2022, column: 14, scope: !1981)
!2050 = !DILocation(line: 2022, column: 23, scope: !1981)
!2051 = !DILocation(line: 2022, column: 11, scope: !1981)
!2052 = !DILocation(line: 2023, column: 6, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !1981, file: !70, line: 2023, column: 5)
!2054 = !DILocation(line: 2023, column: 14, scope: !2053)
!2055 = !DILocation(line: 2023, column: 19, scope: !2053)
!2056 = !DILocation(line: 2023, column: 5, scope: !1981)
!2057 = !DILocation(line: 2025, column: 6, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2059, file: !70, line: 2025, column: 6)
!2059 = distinct !DILexicalBlock(scope: !2053, file: !70, line: 2024, column: 2)
!2060 = !DILocation(line: 2025, column: 16, scope: !2058)
!2061 = !DILocation(line: 2025, column: 6, scope: !2059)
!2062 = !DILocation(line: 2027, column: 7, scope: !2063)
!2063 = distinct !DILexicalBlock(scope: !2064, file: !70, line: 2027, column: 7)
!2064 = distinct !DILexicalBlock(scope: !2058, file: !70, line: 2026, column: 3)
!2065 = !DILocation(line: 2027, column: 15, scope: !2063)
!2066 = !DILocation(line: 2027, column: 7, scope: !2064)
!2067 = !DILocation(line: 2028, column: 12, scope: !2063)
!2068 = !DILocation(line: 2028, column: 5, scope: !2063)
!2069 = !DILocation(line: 2030, column: 5, scope: !2063)
!2070 = !DILocation(line: 2034, column: 7, scope: !2071)
!2071 = distinct !DILexicalBlock(scope: !2072, file: !70, line: 2034, column: 7)
!2072 = distinct !DILexicalBlock(scope: !2058, file: !70, line: 2033, column: 3)
!2073 = !DILocation(line: 2034, column: 15, scope: !2071)
!2074 = !DILocation(line: 2034, column: 7, scope: !2072)
!2075 = !DILocation(line: 2035, column: 13, scope: !2071)
!2076 = !DILocation(line: 2035, column: 12, scope: !2071)
!2077 = !DILocation(line: 2035, column: 5, scope: !2071)
!2078 = !DILocation(line: 2037, column: 5, scope: !2071)
!2079 = !DILocation(line: 2042, column: 3, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2053, file: !70, line: 2041, column: 2)
!2081 = !DILocation(line: 2044, column: 1, scope: !1981)
!2082 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !70, file: !70, line: 2059, type: !2083, scopeLine: 2060, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2083 = !DISubroutineType(types: !2084)
!2084 = !{!20, !20, !733}
!2085 = !DILocalVariable(name: "val1", arg: 1, scope: !2082, file: !70, line: 2059, type: !20)
!2086 = !DILocation(line: 2059, column: 30, scope: !2082)
!2087 = !DILocalVariable(name: "val2", arg: 2, scope: !2082, file: !70, line: 2059, type: !733)
!2088 = !DILocation(line: 2059, column: 39, scope: !2082)
!2089 = !DILocalVariable(name: "u32Temp1", scope: !2082, file: !70, line: 2061, type: !733)
!2090 = !DILocation(line: 2061, column: 6, scope: !2082)
!2091 = !DILocalVariable(name: "u32Temp2", scope: !2082, file: !70, line: 2061, type: !733)
!2092 = !DILocation(line: 2061, column: 17, scope: !2082)
!2093 = !DILocalVariable(name: "u8SignBit", scope: !2082, file: !70, line: 2062, type: !24)
!2094 = !DILocation(line: 2062, column: 5, scope: !2082)
!2095 = !DILocation(line: 2064, column: 5, scope: !2096)
!2096 = distinct !DILexicalBlock(scope: !2082, file: !70, line: 2064, column: 5)
!2097 = !DILocation(line: 2064, column: 9, scope: !2096)
!2098 = !DILocation(line: 2064, column: 5, scope: !2082)
!2099 = !DILocation(line: 2066, column: 15, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2096, file: !70, line: 2065, column: 2)
!2101 = !DILocation(line: 2066, column: 14, scope: !2100)
!2102 = !DILocation(line: 2066, column: 12, scope: !2100)
!2103 = !DILocation(line: 2067, column: 13, scope: !2100)
!2104 = !DILocation(line: 2068, column: 2, scope: !2100)
!2105 = !DILocation(line: 2071, column: 14, scope: !2106)
!2106 = distinct !DILexicalBlock(scope: !2096, file: !70, line: 2070, column: 2)
!2107 = !DILocation(line: 2071, column: 12, scope: !2106)
!2108 = !DILocation(line: 2072, column: 13, scope: !2106)
!2109 = !DILocation(line: 2075, column: 25, scope: !2082)
!2110 = !DILocation(line: 2075, column: 35, scope: !2082)
!2111 = !DILocation(line: 2075, column: 13, scope: !2082)
!2112 = !DILocation(line: 2075, column: 11, scope: !2082)
!2113 = !DILocation(line: 2076, column: 5, scope: !2114)
!2114 = distinct !DILexicalBlock(scope: !2082, file: !70, line: 2076, column: 5)
!2115 = !DILocation(line: 2076, column: 15, scope: !2114)
!2116 = !DILocation(line: 2076, column: 5, scope: !2082)
!2117 = !DILocation(line: 2077, column: 10, scope: !2114)
!2118 = !DILocation(line: 2077, column: 3, scope: !2114)
!2119 = !DILocation(line: 2079, column: 11, scope: !2114)
!2120 = !DILocation(line: 2079, column: 10, scope: !2114)
!2121 = !DILocation(line: 2079, column: 3, scope: !2114)
!2122 = !DILocation(line: 2080, column: 1, scope: !2082)
!2123 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !70, file: !70, line: 2099, type: !2083, scopeLine: 2100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2124 = !DILocalVariable(name: "val1", arg: 1, scope: !2123, file: !70, line: 2099, type: !20)
!2125 = !DILocation(line: 2099, column: 30, scope: !2123)
!2126 = !DILocalVariable(name: "val2", arg: 2, scope: !2123, file: !70, line: 2099, type: !733)
!2127 = !DILocation(line: 2099, column: 39, scope: !2123)
!2128 = !DILocalVariable(name: "u32Temp1", scope: !2123, file: !70, line: 2101, type: !733)
!2129 = !DILocation(line: 2101, column: 6, scope: !2123)
!2130 = !DILocalVariable(name: "u32Temp2", scope: !2123, file: !70, line: 2101, type: !733)
!2131 = !DILocation(line: 2101, column: 17, scope: !2123)
!2132 = !DILocalVariable(name: "u32Temp3", scope: !2123, file: !70, line: 2101, type: !733)
!2133 = !DILocation(line: 2101, column: 26, scope: !2123)
!2134 = !DILocalVariable(name: "u8SignBit", scope: !2123, file: !70, line: 2102, type: !24)
!2135 = !DILocation(line: 2102, column: 5, scope: !2123)
!2136 = !DILocation(line: 2104, column: 5, scope: !2137)
!2137 = distinct !DILexicalBlock(scope: !2123, file: !70, line: 2104, column: 5)
!2138 = !DILocation(line: 2104, column: 9, scope: !2137)
!2139 = !DILocation(line: 2104, column: 5, scope: !2123)
!2140 = !DILocation(line: 2106, column: 15, scope: !2141)
!2141 = distinct !DILexicalBlock(scope: !2137, file: !70, line: 2105, column: 2)
!2142 = !DILocation(line: 2106, column: 14, scope: !2141)
!2143 = !DILocation(line: 2106, column: 12, scope: !2141)
!2144 = !DILocation(line: 2107, column: 13, scope: !2141)
!2145 = !DILocation(line: 2108, column: 2, scope: !2141)
!2146 = !DILocation(line: 2111, column: 14, scope: !2147)
!2147 = distinct !DILexicalBlock(scope: !2137, file: !70, line: 2110, column: 2)
!2148 = !DILocation(line: 2111, column: 12, scope: !2147)
!2149 = !DILocation(line: 2112, column: 13, scope: !2147)
!2150 = !DILocation(line: 2115, column: 13, scope: !2123)
!2151 = !DILocation(line: 2115, column: 24, scope: !2123)
!2152 = !DILocation(line: 2115, column: 22, scope: !2123)
!2153 = !DILocation(line: 2115, column: 11, scope: !2123)
!2154 = !DILocation(line: 2116, column: 25, scope: !2123)
!2155 = !DILocation(line: 2116, column: 35, scope: !2123)
!2156 = !DILocation(line: 2116, column: 13, scope: !2123)
!2157 = !DILocation(line: 2116, column: 11, scope: !2123)
!2158 = !DILocation(line: 2117, column: 13, scope: !2123)
!2159 = !DILocation(line: 2117, column: 22, scope: !2123)
!2160 = !DILocation(line: 2117, column: 11, scope: !2123)
!2161 = !DILocation(line: 2118, column: 14, scope: !2123)
!2162 = !DILocation(line: 2118, column: 23, scope: !2123)
!2163 = !DILocation(line: 2118, column: 11, scope: !2123)
!2164 = !DILocation(line: 2119, column: 5, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2123, file: !70, line: 2119, column: 5)
!2166 = !DILocation(line: 2119, column: 15, scope: !2165)
!2167 = !DILocation(line: 2119, column: 5, scope: !2123)
!2168 = !DILocation(line: 2121, column: 6, scope: !2169)
!2169 = distinct !DILexicalBlock(scope: !2170, file: !70, line: 2121, column: 6)
!2170 = distinct !DILexicalBlock(scope: !2165, file: !70, line: 2120, column: 2)
!2171 = !DILocation(line: 2121, column: 14, scope: !2169)
!2172 = !DILocation(line: 2121, column: 6, scope: !2170)
!2173 = !DILocation(line: 2122, column: 11, scope: !2169)
!2174 = !DILocation(line: 2122, column: 4, scope: !2169)
!2175 = !DILocation(line: 2124, column: 4, scope: !2169)
!2176 = !DILocation(line: 2128, column: 6, scope: !2177)
!2177 = distinct !DILexicalBlock(scope: !2178, file: !70, line: 2128, column: 6)
!2178 = distinct !DILexicalBlock(scope: !2165, file: !70, line: 2127, column: 2)
!2179 = !DILocation(line: 2128, column: 14, scope: !2177)
!2180 = !DILocation(line: 2128, column: 6, scope: !2178)
!2181 = !DILocation(line: 2129, column: 12, scope: !2177)
!2182 = !DILocation(line: 2129, column: 11, scope: !2177)
!2183 = !DILocation(line: 2129, column: 4, scope: !2177)
!2184 = !DILocation(line: 2131, column: 4, scope: !2177)
!2185 = !DILocation(line: 2133, column: 1, scope: !2123)
!2186 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !70, file: !70, line: 2151, type: !2187, scopeLine: 2152, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2187 = !DISubroutineType(types: !2188)
!2188 = !{!20, !20, !20}
!2189 = !DILocalVariable(name: "value", arg: 1, scope: !2186, file: !70, line: 2151, type: !20)
!2190 = !DILocation(line: 2151, column: 30, scope: !2186)
!2191 = !DILocalVariable(name: "factor", arg: 2, scope: !2186, file: !70, line: 2151, type: !20)
!2192 = !DILocation(line: 2151, column: 41, scope: !2186)
!2193 = !DILocalVariable(name: "u32Temp1", scope: !2186, file: !70, line: 2153, type: !733)
!2194 = !DILocation(line: 2153, column: 6, scope: !2186)
!2195 = !DILocalVariable(name: "u32Temp2", scope: !2186, file: !70, line: 2153, type: !733)
!2196 = !DILocation(line: 2153, column: 17, scope: !2186)
!2197 = !DILocalVariable(name: "u32Temp3", scope: !2186, file: !70, line: 2153, type: !733)
!2198 = !DILocation(line: 2153, column: 26, scope: !2186)
!2199 = !DILocalVariable(name: "u32Temp4", scope: !2186, file: !70, line: 2153, type: !733)
!2200 = !DILocation(line: 2153, column: 35, scope: !2186)
!2201 = !DILocalVariable(name: "u8SignBit", scope: !2186, file: !70, line: 2154, type: !24)
!2202 = !DILocation(line: 2154, column: 5, scope: !2186)
!2203 = !DILocation(line: 2156, column: 7, scope: !2204)
!2204 = distinct !DILexicalBlock(scope: !2186, file: !70, line: 2156, column: 5)
!2205 = !DILocation(line: 2156, column: 12, scope: !2204)
!2206 = !DILocation(line: 2156, column: 16, scope: !2204)
!2207 = !DILocation(line: 2156, column: 36, scope: !2204)
!2208 = !DILocation(line: 2156, column: 41, scope: !2204)
!2209 = !DILocation(line: 2156, column: 45, scope: !2204)
!2210 = !DILocation(line: 2158, column: 13, scope: !2211)
!2211 = distinct !DILexicalBlock(scope: !2204, file: !70, line: 2157, column: 2)
!2212 = !DILocation(line: 2159, column: 2, scope: !2211)
!2213 = !DILocation(line: 2162, column: 13, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2204, file: !70, line: 2161, column: 2)
!2215 = !DILocation(line: 2165, column: 5, scope: !2216)
!2216 = distinct !DILexicalBlock(scope: !2186, file: !70, line: 2165, column: 5)
!2217 = !DILocation(line: 2165, column: 10, scope: !2216)
!2218 = !DILocation(line: 2165, column: 5, scope: !2186)
!2219 = !DILocation(line: 2167, column: 15, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2216, file: !70, line: 2166, column: 2)
!2221 = !DILocation(line: 2167, column: 14, scope: !2220)
!2222 = !DILocation(line: 2167, column: 12, scope: !2220)
!2223 = !DILocation(line: 2168, column: 2, scope: !2220)
!2224 = !DILocation(line: 2171, column: 14, scope: !2225)
!2225 = distinct !DILexicalBlock(scope: !2216, file: !70, line: 2170, column: 2)
!2226 = !DILocation(line: 2171, column: 12, scope: !2225)
!2227 = !DILocation(line: 2174, column: 5, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2186, file: !70, line: 2174, column: 5)
!2229 = !DILocation(line: 2174, column: 11, scope: !2228)
!2230 = !DILocation(line: 2174, column: 5, scope: !2186)
!2231 = !DILocation(line: 2176, column: 15, scope: !2232)
!2232 = distinct !DILexicalBlock(scope: !2228, file: !70, line: 2175, column: 2)
!2233 = !DILocation(line: 2176, column: 14, scope: !2232)
!2234 = !DILocation(line: 2176, column: 12, scope: !2232)
!2235 = !DILocation(line: 2177, column: 2, scope: !2232)
!2236 = !DILocation(line: 2180, column: 14, scope: !2237)
!2237 = distinct !DILexicalBlock(scope: !2228, file: !70, line: 2179, column: 2)
!2238 = !DILocation(line: 2180, column: 12, scope: !2237)
!2239 = !DILocation(line: 2183, column: 13, scope: !2186)
!2240 = !DILocation(line: 2183, column: 24, scope: !2186)
!2241 = !DILocation(line: 2183, column: 22, scope: !2186)
!2242 = !DILocation(line: 2183, column: 11, scope: !2186)
!2243 = !DILocation(line: 2184, column: 25, scope: !2186)
!2244 = !DILocation(line: 2184, column: 35, scope: !2186)
!2245 = !DILocation(line: 2184, column: 13, scope: !2186)
!2246 = !DILocation(line: 2184, column: 11, scope: !2186)
!2247 = !DILocation(line: 2185, column: 13, scope: !2186)
!2248 = !DILocation(line: 2185, column: 22, scope: !2186)
!2249 = !DILocation(line: 2185, column: 11, scope: !2186)
!2250 = !DILocation(line: 2186, column: 14, scope: !2186)
!2251 = !DILocation(line: 2186, column: 23, scope: !2186)
!2252 = !DILocation(line: 2186, column: 11, scope: !2186)
!2253 = !DILocation(line: 2187, column: 5, scope: !2254)
!2254 = distinct !DILexicalBlock(scope: !2186, file: !70, line: 2187, column: 5)
!2255 = !DILocation(line: 2187, column: 15, scope: !2254)
!2256 = !DILocation(line: 2187, column: 5, scope: !2186)
!2257 = !DILocation(line: 2189, column: 6, scope: !2258)
!2258 = distinct !DILexicalBlock(scope: !2259, file: !70, line: 2189, column: 6)
!2259 = distinct !DILexicalBlock(scope: !2254, file: !70, line: 2188, column: 2)
!2260 = !DILocation(line: 2189, column: 14, scope: !2258)
!2261 = !DILocation(line: 2189, column: 6, scope: !2259)
!2262 = !DILocation(line: 2190, column: 11, scope: !2258)
!2263 = !DILocation(line: 2190, column: 4, scope: !2258)
!2264 = !DILocation(line: 2192, column: 4, scope: !2258)
!2265 = !DILocation(line: 2196, column: 11, scope: !2266)
!2266 = distinct !DILexicalBlock(scope: !2254, file: !70, line: 2195, column: 2)
!2267 = !DILocation(line: 2196, column: 10, scope: !2266)
!2268 = !DILocation(line: 2196, column: 3, scope: !2266)
!2269 = !DILocation(line: 2198, column: 1, scope: !2186)
!2270 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !70, file: !70, line: 2217, type: !2187, scopeLine: 2218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2271 = !DILocalVariable(name: "value", arg: 1, scope: !2270, file: !70, line: 2217, type: !20)
!2272 = !DILocation(line: 2217, column: 30, scope: !2270)
!2273 = !DILocalVariable(name: "factor", arg: 2, scope: !2270, file: !70, line: 2217, type: !20)
!2274 = !DILocation(line: 2217, column: 41, scope: !2270)
!2275 = !DILocalVariable(name: "u32Temp1", scope: !2270, file: !70, line: 2219, type: !733)
!2276 = !DILocation(line: 2219, column: 6, scope: !2270)
!2277 = !DILocalVariable(name: "u32Temp2", scope: !2270, file: !70, line: 2219, type: !733)
!2278 = !DILocation(line: 2219, column: 17, scope: !2270)
!2279 = !DILocalVariable(name: "u32Temp3", scope: !2270, file: !70, line: 2219, type: !733)
!2280 = !DILocation(line: 2219, column: 26, scope: !2270)
!2281 = !DILocalVariable(name: "u32Temp4", scope: !2270, file: !70, line: 2219, type: !733)
!2282 = !DILocation(line: 2219, column: 35, scope: !2270)
!2283 = !DILocalVariable(name: "u8SignBit", scope: !2270, file: !70, line: 2220, type: !24)
!2284 = !DILocation(line: 2220, column: 5, scope: !2270)
!2285 = !DILocation(line: 2222, column: 7, scope: !2286)
!2286 = distinct !DILexicalBlock(scope: !2270, file: !70, line: 2222, column: 5)
!2287 = !DILocation(line: 2222, column: 12, scope: !2286)
!2288 = !DILocation(line: 2222, column: 16, scope: !2286)
!2289 = !DILocation(line: 2222, column: 36, scope: !2286)
!2290 = !DILocation(line: 2222, column: 41, scope: !2286)
!2291 = !DILocation(line: 2222, column: 45, scope: !2286)
!2292 = !DILocation(line: 2224, column: 13, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2286, file: !70, line: 2223, column: 2)
!2294 = !DILocation(line: 2225, column: 2, scope: !2293)
!2295 = !DILocation(line: 2228, column: 13, scope: !2296)
!2296 = distinct !DILexicalBlock(scope: !2286, file: !70, line: 2227, column: 2)
!2297 = !DILocation(line: 2231, column: 5, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2270, file: !70, line: 2231, column: 5)
!2299 = !DILocation(line: 2231, column: 10, scope: !2298)
!2300 = !DILocation(line: 2231, column: 5, scope: !2270)
!2301 = !DILocation(line: 2233, column: 15, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2298, file: !70, line: 2232, column: 2)
!2303 = !DILocation(line: 2233, column: 14, scope: !2302)
!2304 = !DILocation(line: 2233, column: 12, scope: !2302)
!2305 = !DILocation(line: 2234, column: 2, scope: !2302)
!2306 = !DILocation(line: 2237, column: 14, scope: !2307)
!2307 = distinct !DILexicalBlock(scope: !2298, file: !70, line: 2236, column: 2)
!2308 = !DILocation(line: 2237, column: 12, scope: !2307)
!2309 = !DILocation(line: 2240, column: 5, scope: !2310)
!2310 = distinct !DILexicalBlock(scope: !2270, file: !70, line: 2240, column: 5)
!2311 = !DILocation(line: 2240, column: 11, scope: !2310)
!2312 = !DILocation(line: 2240, column: 5, scope: !2270)
!2313 = !DILocation(line: 2242, column: 15, scope: !2314)
!2314 = distinct !DILexicalBlock(scope: !2310, file: !70, line: 2241, column: 2)
!2315 = !DILocation(line: 2242, column: 14, scope: !2314)
!2316 = !DILocation(line: 2242, column: 12, scope: !2314)
!2317 = !DILocation(line: 2243, column: 2, scope: !2314)
!2318 = !DILocation(line: 2246, column: 14, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2310, file: !70, line: 2245, column: 2)
!2320 = !DILocation(line: 2246, column: 12, scope: !2319)
!2321 = !DILocation(line: 2249, column: 13, scope: !2270)
!2322 = !DILocation(line: 2249, column: 24, scope: !2270)
!2323 = !DILocation(line: 2249, column: 22, scope: !2270)
!2324 = !DILocation(line: 2249, column: 11, scope: !2270)
!2325 = !DILocation(line: 2250, column: 25, scope: !2270)
!2326 = !DILocation(line: 2250, column: 35, scope: !2270)
!2327 = !DILocation(line: 2250, column: 13, scope: !2270)
!2328 = !DILocation(line: 2250, column: 11, scope: !2270)
!2329 = !DILocation(line: 2251, column: 13, scope: !2270)
!2330 = !DILocation(line: 2251, column: 22, scope: !2270)
!2331 = !DILocation(line: 2251, column: 11, scope: !2270)
!2332 = !DILocation(line: 2252, column: 14, scope: !2270)
!2333 = !DILocation(line: 2252, column: 23, scope: !2270)
!2334 = !DILocation(line: 2252, column: 11, scope: !2270)
!2335 = !DILocation(line: 2253, column: 6, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2270, file: !70, line: 2253, column: 5)
!2337 = !DILocation(line: 2253, column: 14, scope: !2336)
!2338 = !DILocation(line: 2253, column: 19, scope: !2336)
!2339 = !DILocation(line: 2253, column: 5, scope: !2270)
!2340 = !DILocation(line: 2255, column: 6, scope: !2341)
!2341 = distinct !DILexicalBlock(scope: !2342, file: !70, line: 2255, column: 6)
!2342 = distinct !DILexicalBlock(scope: !2336, file: !70, line: 2254, column: 2)
!2343 = !DILocation(line: 2255, column: 16, scope: !2341)
!2344 = !DILocation(line: 2255, column: 6, scope: !2342)
!2345 = !DILocation(line: 2257, column: 7, scope: !2346)
!2346 = distinct !DILexicalBlock(scope: !2347, file: !70, line: 2257, column: 7)
!2347 = distinct !DILexicalBlock(scope: !2341, file: !70, line: 2256, column: 3)
!2348 = !DILocation(line: 2257, column: 15, scope: !2346)
!2349 = !DILocation(line: 2257, column: 7, scope: !2347)
!2350 = !DILocation(line: 2258, column: 12, scope: !2346)
!2351 = !DILocation(line: 2258, column: 5, scope: !2346)
!2352 = !DILocation(line: 2260, column: 5, scope: !2346)
!2353 = !DILocation(line: 2264, column: 7, scope: !2354)
!2354 = distinct !DILexicalBlock(scope: !2355, file: !70, line: 2264, column: 7)
!2355 = distinct !DILexicalBlock(scope: !2341, file: !70, line: 2263, column: 3)
!2356 = !DILocation(line: 2264, column: 15, scope: !2354)
!2357 = !DILocation(line: 2264, column: 7, scope: !2355)
!2358 = !DILocation(line: 2265, column: 13, scope: !2354)
!2359 = !DILocation(line: 2265, column: 12, scope: !2354)
!2360 = !DILocation(line: 2265, column: 5, scope: !2354)
!2361 = !DILocation(line: 2267, column: 5, scope: !2354)
!2362 = !DILocation(line: 2272, column: 4, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2336, file: !70, line: 2271, column: 2)
!2364 = !DILocation(line: 2274, column: 1, scope: !2270)
!2365 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !70, file: !70, line: 2292, type: !2366, scopeLine: 2293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2366 = !DISubroutineType(types: !2367)
!2367 = !{!20, !20, !24}
!2368 = !DILocalVariable(name: "value", arg: 1, scope: !2365, file: !70, line: 2292, type: !20)
!2369 = !DILocation(line: 2292, column: 29, scope: !2365)
!2370 = !DILocalVariable(name: "factor", arg: 2, scope: !2365, file: !70, line: 2292, type: !24)
!2371 = !DILocation(line: 2292, column: 39, scope: !2365)
!2372 = !DILocalVariable(name: "u32Temp1", scope: !2365, file: !70, line: 2294, type: !733)
!2373 = !DILocation(line: 2294, column: 6, scope: !2365)
!2374 = !DILocalVariable(name: "u32Temp2", scope: !2365, file: !70, line: 2294, type: !733)
!2375 = !DILocation(line: 2294, column: 17, scope: !2365)
!2376 = !DILocalVariable(name: "u32Temp3", scope: !2365, file: !70, line: 2294, type: !733)
!2377 = !DILocation(line: 2294, column: 26, scope: !2365)
!2378 = !DILocalVariable(name: "u8SignBit", scope: !2365, file: !70, line: 2295, type: !24)
!2379 = !DILocation(line: 2295, column: 5, scope: !2365)
!2380 = !DILocation(line: 2297, column: 5, scope: !2381)
!2381 = distinct !DILexicalBlock(scope: !2365, file: !70, line: 2297, column: 5)
!2382 = !DILocation(line: 2297, column: 10, scope: !2381)
!2383 = !DILocation(line: 2297, column: 5, scope: !2365)
!2384 = !DILocation(line: 2299, column: 15, scope: !2385)
!2385 = distinct !DILexicalBlock(scope: !2381, file: !70, line: 2298, column: 2)
!2386 = !DILocation(line: 2299, column: 14, scope: !2385)
!2387 = !DILocation(line: 2299, column: 12, scope: !2385)
!2388 = !DILocation(line: 2300, column: 13, scope: !2385)
!2389 = !DILocation(line: 2301, column: 2, scope: !2385)
!2390 = !DILocation(line: 2304, column: 14, scope: !2391)
!2391 = distinct !DILexicalBlock(scope: !2381, file: !70, line: 2303, column: 2)
!2392 = !DILocation(line: 2304, column: 12, scope: !2391)
!2393 = !DILocation(line: 2305, column: 13, scope: !2391)
!2394 = !DILocation(line: 2308, column: 13, scope: !2365)
!2395 = !DILocation(line: 2308, column: 24, scope: !2365)
!2396 = !DILocation(line: 2308, column: 22, scope: !2365)
!2397 = !DILocation(line: 2308, column: 11, scope: !2365)
!2398 = !DILocation(line: 2309, column: 25, scope: !2365)
!2399 = !DILocation(line: 2309, column: 35, scope: !2365)
!2400 = !DILocation(line: 2309, column: 13, scope: !2365)
!2401 = !DILocation(line: 2309, column: 11, scope: !2365)
!2402 = !DILocation(line: 2310, column: 13, scope: !2365)
!2403 = !DILocation(line: 2310, column: 22, scope: !2365)
!2404 = !DILocation(line: 2310, column: 11, scope: !2365)
!2405 = !DILocation(line: 2311, column: 14, scope: !2365)
!2406 = !DILocation(line: 2311, column: 23, scope: !2365)
!2407 = !DILocation(line: 2311, column: 11, scope: !2365)
!2408 = !DILocation(line: 2312, column: 5, scope: !2409)
!2409 = distinct !DILexicalBlock(scope: !2365, file: !70, line: 2312, column: 5)
!2410 = !DILocation(line: 2312, column: 15, scope: !2409)
!2411 = !DILocation(line: 2312, column: 5, scope: !2365)
!2412 = !DILocation(line: 2314, column: 10, scope: !2413)
!2413 = distinct !DILexicalBlock(scope: !2409, file: !70, line: 2313, column: 2)
!2414 = !DILocation(line: 2314, column: 3, scope: !2413)
!2415 = !DILocation(line: 2318, column: 11, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2409, file: !70, line: 2317, column: 2)
!2417 = !DILocation(line: 2318, column: 10, scope: !2416)
!2418 = !DILocation(line: 2318, column: 3, scope: !2416)
!2419 = !DILocation(line: 2320, column: 1, scope: !2365)
!2420 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !70, file: !70, line: 2339, type: !2366, scopeLine: 2340, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2421 = !DILocalVariable(name: "value", arg: 1, scope: !2420, file: !70, line: 2339, type: !20)
!2422 = !DILocation(line: 2339, column: 29, scope: !2420)
!2423 = !DILocalVariable(name: "factor", arg: 2, scope: !2420, file: !70, line: 2339, type: !24)
!2424 = !DILocation(line: 2339, column: 39, scope: !2420)
!2425 = !DILocalVariable(name: "u32Temp1", scope: !2420, file: !70, line: 2341, type: !733)
!2426 = !DILocation(line: 2341, column: 6, scope: !2420)
!2427 = !DILocalVariable(name: "u32Temp2", scope: !2420, file: !70, line: 2341, type: !733)
!2428 = !DILocation(line: 2341, column: 17, scope: !2420)
!2429 = !DILocalVariable(name: "u32Temp3", scope: !2420, file: !70, line: 2341, type: !733)
!2430 = !DILocation(line: 2341, column: 26, scope: !2420)
!2431 = !DILocalVariable(name: "u8SignBit", scope: !2420, file: !70, line: 2342, type: !24)
!2432 = !DILocation(line: 2342, column: 5, scope: !2420)
!2433 = !DILocation(line: 2344, column: 5, scope: !2434)
!2434 = distinct !DILexicalBlock(scope: !2420, file: !70, line: 2344, column: 5)
!2435 = !DILocation(line: 2344, column: 10, scope: !2434)
!2436 = !DILocation(line: 2344, column: 5, scope: !2420)
!2437 = !DILocation(line: 2346, column: 15, scope: !2438)
!2438 = distinct !DILexicalBlock(scope: !2434, file: !70, line: 2345, column: 2)
!2439 = !DILocation(line: 2346, column: 14, scope: !2438)
!2440 = !DILocation(line: 2346, column: 12, scope: !2438)
!2441 = !DILocation(line: 2347, column: 13, scope: !2438)
!2442 = !DILocation(line: 2348, column: 2, scope: !2438)
!2443 = !DILocation(line: 2351, column: 14, scope: !2444)
!2444 = distinct !DILexicalBlock(scope: !2434, file: !70, line: 2350, column: 2)
!2445 = !DILocation(line: 2351, column: 12, scope: !2444)
!2446 = !DILocation(line: 2352, column: 13, scope: !2444)
!2447 = !DILocation(line: 2355, column: 13, scope: !2420)
!2448 = !DILocation(line: 2355, column: 24, scope: !2420)
!2449 = !DILocation(line: 2355, column: 22, scope: !2420)
!2450 = !DILocation(line: 2355, column: 11, scope: !2420)
!2451 = !DILocation(line: 2356, column: 25, scope: !2420)
!2452 = !DILocation(line: 2356, column: 35, scope: !2420)
!2453 = !DILocation(line: 2356, column: 13, scope: !2420)
!2454 = !DILocation(line: 2356, column: 11, scope: !2420)
!2455 = !DILocation(line: 2357, column: 13, scope: !2420)
!2456 = !DILocation(line: 2357, column: 22, scope: !2420)
!2457 = !DILocation(line: 2357, column: 11, scope: !2420)
!2458 = !DILocation(line: 2358, column: 14, scope: !2420)
!2459 = !DILocation(line: 2358, column: 23, scope: !2420)
!2460 = !DILocation(line: 2358, column: 11, scope: !2420)
!2461 = !DILocation(line: 2359, column: 5, scope: !2462)
!2462 = distinct !DILexicalBlock(scope: !2420, file: !70, line: 2359, column: 5)
!2463 = !DILocation(line: 2359, column: 15, scope: !2462)
!2464 = !DILocation(line: 2359, column: 5, scope: !2420)
!2465 = !DILocation(line: 2361, column: 6, scope: !2466)
!2466 = distinct !DILexicalBlock(scope: !2467, file: !70, line: 2361, column: 6)
!2467 = distinct !DILexicalBlock(scope: !2462, file: !70, line: 2360, column: 2)
!2468 = !DILocation(line: 2361, column: 14, scope: !2466)
!2469 = !DILocation(line: 2361, column: 6, scope: !2467)
!2470 = !DILocation(line: 2362, column: 11, scope: !2466)
!2471 = !DILocation(line: 2362, column: 4, scope: !2466)
!2472 = !DILocation(line: 2364, column: 4, scope: !2466)
!2473 = !DILocation(line: 2368, column: 6, scope: !2474)
!2474 = distinct !DILexicalBlock(scope: !2475, file: !70, line: 2368, column: 6)
!2475 = distinct !DILexicalBlock(scope: !2462, file: !70, line: 2367, column: 2)
!2476 = !DILocation(line: 2368, column: 14, scope: !2474)
!2477 = !DILocation(line: 2368, column: 6, scope: !2475)
!2478 = !DILocation(line: 2369, column: 12, scope: !2474)
!2479 = !DILocation(line: 2369, column: 11, scope: !2474)
!2480 = !DILocation(line: 2369, column: 4, scope: !2474)
!2481 = !DILocation(line: 2371, column: 4, scope: !2474)
!2482 = !DILocation(line: 2373, column: 1, scope: !2420)
!2483 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !70, file: !70, line: 2390, type: !2484, scopeLine: 2391, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2484 = !DISubroutineType(types: !2485)
!2485 = !{!733, !733, !733, !24}
!2486 = !DILocalVariable(name: "value", arg: 1, scope: !2483, file: !70, line: 2390, type: !733)
!2487 = !DILocation(line: 2390, column: 39, scope: !2483)
!2488 = !DILocalVariable(name: "factor", arg: 2, scope: !2483, file: !70, line: 2390, type: !733)
!2489 = !DILocation(line: 2390, column: 49, scope: !2483)
!2490 = !DILocalVariable(name: "power", arg: 3, scope: !2483, file: !70, line: 2390, type: !24)
!2491 = !DILocation(line: 2390, column: 60, scope: !2483)
!2492 = !DILocalVariable(name: "u32Temp1", scope: !2483, file: !70, line: 2392, type: !733)
!2493 = !DILocation(line: 2392, column: 6, scope: !2483)
!2494 = !DILocalVariable(name: "u32Temp2", scope: !2483, file: !70, line: 2392, type: !733)
!2495 = !DILocation(line: 2392, column: 20, scope: !2483)
!2496 = !DILocation(line: 2393, column: 5, scope: !2497)
!2497 = distinct !DILexicalBlock(scope: !2483, file: !70, line: 2393, column: 5)
!2498 = !DILocation(line: 2393, column: 10, scope: !2497)
!2499 = !DILocation(line: 2393, column: 5, scope: !2483)
!2500 = !DILocation(line: 2395, column: 9, scope: !2501)
!2501 = distinct !DILexicalBlock(scope: !2497, file: !70, line: 2394, column: 2)
!2502 = !DILocation(line: 2396, column: 2, scope: !2501)
!2503 = !DILocation(line: 2397, column: 10, scope: !2504)
!2504 = distinct !DILexicalBlock(scope: !2497, file: !70, line: 2397, column: 10)
!2505 = !DILocation(line: 2397, column: 15, scope: !2504)
!2506 = !DILocation(line: 2397, column: 10, scope: !2497)
!2507 = !DILocation(line: 2399, column: 9, scope: !2508)
!2508 = distinct !DILexicalBlock(scope: !2504, file: !70, line: 2398, column: 2)
!2509 = !DILocation(line: 2400, column: 2, scope: !2508)
!2510 = !DILocation(line: 2405, column: 13, scope: !2483)
!2511 = !DILocation(line: 2405, column: 21, scope: !2483)
!2512 = !DILocation(line: 2405, column: 19, scope: !2483)
!2513 = !DILocation(line: 2405, column: 11, scope: !2483)
!2514 = !DILocation(line: 2406, column: 25, scope: !2483)
!2515 = !DILocation(line: 2406, column: 32, scope: !2483)
!2516 = !DILocation(line: 2406, column: 13, scope: !2483)
!2517 = !DILocation(line: 2406, column: 11, scope: !2483)
!2518 = !DILocation(line: 2407, column: 13, scope: !2483)
!2519 = !DILocation(line: 2407, column: 29, scope: !2483)
!2520 = !DILocation(line: 2407, column: 28, scope: !2483)
!2521 = !DILocation(line: 2407, column: 22, scope: !2483)
!2522 = !DILocation(line: 2407, column: 11, scope: !2483)
!2523 = !DILocation(line: 2408, column: 14, scope: !2483)
!2524 = !DILocation(line: 2408, column: 26, scope: !2483)
!2525 = !DILocation(line: 2408, column: 23, scope: !2483)
!2526 = !DILocation(line: 2408, column: 11, scope: !2483)
!2527 = !DILocation(line: 2409, column: 6, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !2483, file: !70, line: 2409, column: 5)
!2529 = !DILocation(line: 2409, column: 20, scope: !2528)
!2530 = !DILocation(line: 2409, column: 19, scope: !2528)
!2531 = !DILocation(line: 2409, column: 14, scope: !2528)
!2532 = !DILocation(line: 2409, column: 28, scope: !2528)
!2533 = !DILocation(line: 2409, column: 5, scope: !2483)
!2534 = !DILocation(line: 2411, column: 10, scope: !2535)
!2535 = distinct !DILexicalBlock(scope: !2528, file: !70, line: 2410, column: 2)
!2536 = !DILocation(line: 2411, column: 3, scope: !2535)
!2537 = !DILocation(line: 2415, column: 3, scope: !2538)
!2538 = distinct !DILexicalBlock(scope: !2528, file: !70, line: 2414, column: 2)
!2539 = !DILocation(line: 2417, column: 1, scope: !2483)
!2540 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !70, file: !70, line: 2435, type: !2541, scopeLine: 2436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2541 = !DISubroutineType(types: !2542)
!2542 = !{!20, !20, !20, !24}
!2543 = !DILocalVariable(name: "value", arg: 1, scope: !2540, file: !70, line: 2435, type: !20)
!2544 = !DILocation(line: 2435, column: 39, scope: !2540)
!2545 = !DILocalVariable(name: "factor", arg: 2, scope: !2540, file: !70, line: 2435, type: !20)
!2546 = !DILocation(line: 2435, column: 50, scope: !2540)
!2547 = !DILocalVariable(name: "power", arg: 3, scope: !2540, file: !70, line: 2435, type: !24)
!2548 = !DILocation(line: 2435, column: 61, scope: !2540)
!2549 = !DILocalVariable(name: "u32Temp1", scope: !2540, file: !70, line: 2437, type: !733)
!2550 = !DILocation(line: 2437, column: 6, scope: !2540)
!2551 = !DILocalVariable(name: "u32Temp2", scope: !2540, file: !70, line: 2437, type: !733)
!2552 = !DILocation(line: 2437, column: 17, scope: !2540)
!2553 = !DILocalVariable(name: "u32Temp3", scope: !2540, file: !70, line: 2437, type: !733)
!2554 = !DILocation(line: 2437, column: 26, scope: !2540)
!2555 = !DILocalVariable(name: "u32Temp4", scope: !2540, file: !70, line: 2437, type: !733)
!2556 = !DILocation(line: 2437, column: 35, scope: !2540)
!2557 = !DILocalVariable(name: "u8SignBit", scope: !2540, file: !70, line: 2438, type: !24)
!2558 = !DILocation(line: 2438, column: 5, scope: !2540)
!2559 = !DILocation(line: 2440, column: 5, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2540, file: !70, line: 2440, column: 5)
!2561 = !DILocation(line: 2440, column: 10, scope: !2560)
!2562 = !DILocation(line: 2440, column: 5, scope: !2540)
!2563 = !DILocation(line: 2442, column: 9, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2441, column: 2)
!2565 = !DILocation(line: 2443, column: 2, scope: !2564)
!2566 = !DILocation(line: 2444, column: 10, scope: !2567)
!2567 = distinct !DILexicalBlock(scope: !2560, file: !70, line: 2444, column: 10)
!2568 = !DILocation(line: 2444, column: 15, scope: !2567)
!2569 = !DILocation(line: 2444, column: 10, scope: !2560)
!2570 = !DILocation(line: 2446, column: 9, scope: !2571)
!2571 = distinct !DILexicalBlock(scope: !2567, file: !70, line: 2445, column: 2)
!2572 = !DILocation(line: 2447, column: 2, scope: !2571)
!2573 = !DILocation(line: 2453, column: 7, scope: !2574)
!2574 = distinct !DILexicalBlock(scope: !2540, file: !70, line: 2453, column: 5)
!2575 = !DILocation(line: 2453, column: 12, scope: !2574)
!2576 = !DILocation(line: 2453, column: 16, scope: !2574)
!2577 = !DILocation(line: 2453, column: 36, scope: !2574)
!2578 = !DILocation(line: 2453, column: 41, scope: !2574)
!2579 = !DILocation(line: 2453, column: 45, scope: !2574)
!2580 = !DILocation(line: 2455, column: 13, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2574, file: !70, line: 2454, column: 2)
!2582 = !DILocation(line: 2456, column: 2, scope: !2581)
!2583 = !DILocation(line: 2459, column: 13, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2574, file: !70, line: 2458, column: 2)
!2585 = !DILocation(line: 2462, column: 5, scope: !2586)
!2586 = distinct !DILexicalBlock(scope: !2540, file: !70, line: 2462, column: 5)
!2587 = !DILocation(line: 2462, column: 10, scope: !2586)
!2588 = !DILocation(line: 2462, column: 5, scope: !2540)
!2589 = !DILocation(line: 2464, column: 15, scope: !2590)
!2590 = distinct !DILexicalBlock(scope: !2586, file: !70, line: 2463, column: 2)
!2591 = !DILocation(line: 2464, column: 14, scope: !2590)
!2592 = !DILocation(line: 2464, column: 12, scope: !2590)
!2593 = !DILocation(line: 2465, column: 2, scope: !2590)
!2594 = !DILocation(line: 2468, column: 14, scope: !2595)
!2595 = distinct !DILexicalBlock(scope: !2586, file: !70, line: 2467, column: 2)
!2596 = !DILocation(line: 2468, column: 12, scope: !2595)
!2597 = !DILocation(line: 2471, column: 5, scope: !2598)
!2598 = distinct !DILexicalBlock(scope: !2540, file: !70, line: 2471, column: 5)
!2599 = !DILocation(line: 2471, column: 11, scope: !2598)
!2600 = !DILocation(line: 2471, column: 5, scope: !2540)
!2601 = !DILocation(line: 2473, column: 15, scope: !2602)
!2602 = distinct !DILexicalBlock(scope: !2598, file: !70, line: 2472, column: 2)
!2603 = !DILocation(line: 2473, column: 14, scope: !2602)
!2604 = !DILocation(line: 2473, column: 12, scope: !2602)
!2605 = !DILocation(line: 2474, column: 2, scope: !2602)
!2606 = !DILocation(line: 2477, column: 14, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2598, file: !70, line: 2476, column: 2)
!2608 = !DILocation(line: 2477, column: 12, scope: !2607)
!2609 = !DILocation(line: 2480, column: 13, scope: !2540)
!2610 = !DILocation(line: 2480, column: 24, scope: !2540)
!2611 = !DILocation(line: 2480, column: 22, scope: !2540)
!2612 = !DILocation(line: 2480, column: 11, scope: !2540)
!2613 = !DILocation(line: 2481, column: 25, scope: !2540)
!2614 = !DILocation(line: 2481, column: 35, scope: !2540)
!2615 = !DILocation(line: 2481, column: 13, scope: !2540)
!2616 = !DILocation(line: 2481, column: 11, scope: !2540)
!2617 = !DILocation(line: 2482, column: 13, scope: !2540)
!2618 = !DILocation(line: 2482, column: 29, scope: !2540)
!2619 = !DILocation(line: 2482, column: 28, scope: !2540)
!2620 = !DILocation(line: 2482, column: 22, scope: !2540)
!2621 = !DILocation(line: 2482, column: 11, scope: !2540)
!2622 = !DILocation(line: 2483, column: 14, scope: !2540)
!2623 = !DILocation(line: 2483, column: 26, scope: !2540)
!2624 = !DILocation(line: 2483, column: 23, scope: !2540)
!2625 = !DILocation(line: 2483, column: 11, scope: !2540)
!2626 = !DILocation(line: 2484, column: 6, scope: !2627)
!2627 = distinct !DILexicalBlock(scope: !2540, file: !70, line: 2484, column: 5)
!2628 = !DILocation(line: 2484, column: 20, scope: !2627)
!2629 = !DILocation(line: 2484, column: 19, scope: !2627)
!2630 = !DILocation(line: 2484, column: 14, scope: !2627)
!2631 = !DILocation(line: 2484, column: 27, scope: !2627)
!2632 = !DILocation(line: 2484, column: 5, scope: !2540)
!2633 = !DILocation(line: 2486, column: 6, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2635, file: !70, line: 2486, column: 6)
!2635 = distinct !DILexicalBlock(scope: !2627, file: !70, line: 2485, column: 2)
!2636 = !DILocation(line: 2486, column: 16, scope: !2634)
!2637 = !DILocation(line: 2486, column: 6, scope: !2635)
!2638 = !DILocation(line: 2488, column: 7, scope: !2639)
!2639 = distinct !DILexicalBlock(scope: !2640, file: !70, line: 2488, column: 7)
!2640 = distinct !DILexicalBlock(scope: !2634, file: !70, line: 2487, column: 3)
!2641 = !DILocation(line: 2488, column: 15, scope: !2639)
!2642 = !DILocation(line: 2488, column: 7, scope: !2640)
!2643 = !DILocation(line: 2489, column: 12, scope: !2639)
!2644 = !DILocation(line: 2489, column: 5, scope: !2639)
!2645 = !DILocation(line: 2491, column: 5, scope: !2639)
!2646 = !DILocation(line: 2495, column: 12, scope: !2647)
!2647 = distinct !DILexicalBlock(scope: !2634, file: !70, line: 2494, column: 3)
!2648 = !DILocation(line: 2495, column: 11, scope: !2647)
!2649 = !DILocation(line: 2495, column: 4, scope: !2647)
!2650 = !DILocation(line: 2500, column: 6, scope: !2651)
!2651 = distinct !DILexicalBlock(scope: !2652, file: !70, line: 2500, column: 6)
!2652 = distinct !DILexicalBlock(scope: !2627, file: !70, line: 2499, column: 2)
!2653 = !DILocation(line: 2500, column: 16, scope: !2651)
!2654 = !DILocation(line: 2500, column: 6, scope: !2652)
!2655 = !DILocation(line: 2502, column: 4, scope: !2656)
!2656 = distinct !DILexicalBlock(scope: !2651, file: !70, line: 2501, column: 3)
!2657 = !DILocation(line: 2506, column: 4, scope: !2658)
!2658 = distinct !DILexicalBlock(scope: !2651, file: !70, line: 2505, column: 3)
!2659 = !DILocation(line: 2509, column: 1, scope: !2540)
!2660 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !70, file: !70, line: 2528, type: !2661, scopeLine: 2529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2661 = !DISubroutineType(types: !2662)
!2662 = !{!20, !20, !6}
!2663 = !DILocalVariable(name: "value", arg: 1, scope: !2660, file: !70, line: 2528, type: !20)
!2664 = !DILocation(line: 2528, column: 29, scope: !2660)
!2665 = !DILocalVariable(name: "factor", arg: 2, scope: !2660, file: !70, line: 2528, type: !6)
!2666 = !DILocation(line: 2528, column: 39, scope: !2660)
!2667 = !DILocalVariable(name: "u32Temp1", scope: !2660, file: !70, line: 2530, type: !733)
!2668 = !DILocation(line: 2530, column: 6, scope: !2660)
!2669 = !DILocalVariable(name: "u32Temp2", scope: !2660, file: !70, line: 2530, type: !733)
!2670 = !DILocation(line: 2530, column: 17, scope: !2660)
!2671 = !DILocalVariable(name: "u32Temp3", scope: !2660, file: !70, line: 2530, type: !733)
!2672 = !DILocation(line: 2530, column: 26, scope: !2660)
!2673 = !DILocalVariable(name: "u32Temp4", scope: !2660, file: !70, line: 2530, type: !733)
!2674 = !DILocation(line: 2530, column: 35, scope: !2660)
!2675 = !DILocalVariable(name: "u8SignBit", scope: !2660, file: !70, line: 2531, type: !24)
!2676 = !DILocation(line: 2531, column: 5, scope: !2660)
!2677 = !DILocation(line: 2533, column: 7, scope: !2678)
!2678 = distinct !DILexicalBlock(scope: !2660, file: !70, line: 2533, column: 5)
!2679 = !DILocation(line: 2533, column: 12, scope: !2678)
!2680 = !DILocation(line: 2533, column: 16, scope: !2678)
!2681 = !DILocation(line: 2533, column: 20, scope: !2678)
!2682 = !DILocation(line: 2533, column: 26, scope: !2678)
!2683 = !DILocation(line: 2533, column: 31, scope: !2678)
!2684 = !DILocation(line: 2533, column: 36, scope: !2678)
!2685 = !DILocation(line: 2533, column: 41, scope: !2678)
!2686 = !DILocation(line: 2533, column: 45, scope: !2678)
!2687 = !DILocation(line: 2533, column: 49, scope: !2678)
!2688 = !DILocation(line: 2533, column: 55, scope: !2678)
!2689 = !DILocation(line: 2533, column: 5, scope: !2660)
!2690 = !DILocation(line: 2535, column: 13, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2678, file: !70, line: 2534, column: 2)
!2692 = !DILocation(line: 2536, column: 2, scope: !2691)
!2693 = !DILocation(line: 2539, column: 13, scope: !2694)
!2694 = distinct !DILexicalBlock(scope: !2678, file: !70, line: 2538, column: 2)
!2695 = !DILocation(line: 2542, column: 5, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2660, file: !70, line: 2542, column: 5)
!2697 = !DILocation(line: 2542, column: 10, scope: !2696)
!2698 = !DILocation(line: 2542, column: 5, scope: !2660)
!2699 = !DILocation(line: 2544, column: 15, scope: !2700)
!2700 = distinct !DILexicalBlock(scope: !2696, file: !70, line: 2543, column: 2)
!2701 = !DILocation(line: 2544, column: 14, scope: !2700)
!2702 = !DILocation(line: 2544, column: 12, scope: !2700)
!2703 = !DILocation(line: 2545, column: 2, scope: !2700)
!2704 = !DILocation(line: 2548, column: 14, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2696, file: !70, line: 2547, column: 2)
!2706 = !DILocation(line: 2548, column: 12, scope: !2705)
!2707 = !DILocation(line: 2551, column: 5, scope: !2708)
!2708 = distinct !DILexicalBlock(scope: !2660, file: !70, line: 2551, column: 5)
!2709 = !DILocation(line: 2551, column: 11, scope: !2708)
!2710 = !DILocation(line: 2551, column: 5, scope: !2660)
!2711 = !DILocation(line: 2553, column: 15, scope: !2712)
!2712 = distinct !DILexicalBlock(scope: !2708, file: !70, line: 2552, column: 2)
!2713 = !DILocation(line: 2553, column: 14, scope: !2712)
!2714 = !DILocation(line: 2553, column: 12, scope: !2712)
!2715 = !DILocation(line: 2554, column: 2, scope: !2712)
!2716 = !DILocation(line: 2557, column: 14, scope: !2717)
!2717 = distinct !DILexicalBlock(scope: !2708, file: !70, line: 2556, column: 2)
!2718 = !DILocation(line: 2557, column: 12, scope: !2717)
!2719 = !DILocation(line: 2560, column: 13, scope: !2660)
!2720 = !DILocation(line: 2560, column: 24, scope: !2660)
!2721 = !DILocation(line: 2560, column: 22, scope: !2660)
!2722 = !DILocation(line: 2560, column: 11, scope: !2660)
!2723 = !DILocation(line: 2561, column: 25, scope: !2660)
!2724 = !DILocation(line: 2561, column: 35, scope: !2660)
!2725 = !DILocation(line: 2561, column: 13, scope: !2660)
!2726 = !DILocation(line: 2561, column: 11, scope: !2660)
!2727 = !DILocation(line: 2562, column: 13, scope: !2660)
!2728 = !DILocation(line: 2562, column: 22, scope: !2660)
!2729 = !DILocation(line: 2562, column: 11, scope: !2660)
!2730 = !DILocation(line: 2563, column: 14, scope: !2660)
!2731 = !DILocation(line: 2563, column: 23, scope: !2660)
!2732 = !DILocation(line: 2563, column: 11, scope: !2660)
!2733 = !DILocation(line: 2564, column: 5, scope: !2734)
!2734 = distinct !DILexicalBlock(scope: !2660, file: !70, line: 2564, column: 5)
!2735 = !DILocation(line: 2564, column: 15, scope: !2734)
!2736 = !DILocation(line: 2564, column: 5, scope: !2660)
!2737 = !DILocation(line: 2566, column: 6, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2739, file: !70, line: 2566, column: 6)
!2739 = distinct !DILexicalBlock(scope: !2734, file: !70, line: 2565, column: 2)
!2740 = !DILocation(line: 2566, column: 14, scope: !2738)
!2741 = !DILocation(line: 2566, column: 6, scope: !2739)
!2742 = !DILocation(line: 2567, column: 11, scope: !2738)
!2743 = !DILocation(line: 2567, column: 4, scope: !2738)
!2744 = !DILocation(line: 2569, column: 4, scope: !2738)
!2745 = !DILocation(line: 2573, column: 11, scope: !2746)
!2746 = distinct !DILexicalBlock(scope: !2734, file: !70, line: 2572, column: 2)
!2747 = !DILocation(line: 2573, column: 10, scope: !2746)
!2748 = !DILocation(line: 2573, column: 3, scope: !2746)
!2749 = !DILocation(line: 2575, column: 1, scope: !2660)
!2750 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !70, file: !70, line: 2594, type: !2661, scopeLine: 2595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2751 = !DILocalVariable(name: "value", arg: 1, scope: !2750, file: !70, line: 2594, type: !20)
!2752 = !DILocation(line: 2594, column: 29, scope: !2750)
!2753 = !DILocalVariable(name: "factor", arg: 2, scope: !2750, file: !70, line: 2594, type: !6)
!2754 = !DILocation(line: 2594, column: 39, scope: !2750)
!2755 = !DILocalVariable(name: "u32Temp1", scope: !2750, file: !70, line: 2596, type: !733)
!2756 = !DILocation(line: 2596, column: 6, scope: !2750)
!2757 = !DILocalVariable(name: "u32Temp2", scope: !2750, file: !70, line: 2596, type: !733)
!2758 = !DILocation(line: 2596, column: 17, scope: !2750)
!2759 = !DILocalVariable(name: "u32Temp3", scope: !2750, file: !70, line: 2596, type: !733)
!2760 = !DILocation(line: 2596, column: 26, scope: !2750)
!2761 = !DILocalVariable(name: "u32Temp4", scope: !2750, file: !70, line: 2596, type: !733)
!2762 = !DILocation(line: 2596, column: 35, scope: !2750)
!2763 = !DILocalVariable(name: "u8SignBit", scope: !2750, file: !70, line: 2597, type: !24)
!2764 = !DILocation(line: 2597, column: 5, scope: !2750)
!2765 = !DILocation(line: 2599, column: 7, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2750, file: !70, line: 2599, column: 5)
!2767 = !DILocation(line: 2599, column: 12, scope: !2766)
!2768 = !DILocation(line: 2599, column: 16, scope: !2766)
!2769 = !DILocation(line: 2599, column: 20, scope: !2766)
!2770 = !DILocation(line: 2599, column: 26, scope: !2766)
!2771 = !DILocation(line: 2599, column: 31, scope: !2766)
!2772 = !DILocation(line: 2599, column: 36, scope: !2766)
!2773 = !DILocation(line: 2599, column: 41, scope: !2766)
!2774 = !DILocation(line: 2599, column: 45, scope: !2766)
!2775 = !DILocation(line: 2599, column: 49, scope: !2766)
!2776 = !DILocation(line: 2599, column: 55, scope: !2766)
!2777 = !DILocation(line: 2599, column: 5, scope: !2750)
!2778 = !DILocation(line: 2601, column: 13, scope: !2779)
!2779 = distinct !DILexicalBlock(scope: !2766, file: !70, line: 2600, column: 2)
!2780 = !DILocation(line: 2602, column: 2, scope: !2779)
!2781 = !DILocation(line: 2605, column: 13, scope: !2782)
!2782 = distinct !DILexicalBlock(scope: !2766, file: !70, line: 2604, column: 2)
!2783 = !DILocation(line: 2608, column: 5, scope: !2784)
!2784 = distinct !DILexicalBlock(scope: !2750, file: !70, line: 2608, column: 5)
!2785 = !DILocation(line: 2608, column: 10, scope: !2784)
!2786 = !DILocation(line: 2608, column: 5, scope: !2750)
!2787 = !DILocation(line: 2610, column: 15, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2784, file: !70, line: 2609, column: 2)
!2789 = !DILocation(line: 2610, column: 14, scope: !2788)
!2790 = !DILocation(line: 2610, column: 12, scope: !2788)
!2791 = !DILocation(line: 2611, column: 2, scope: !2788)
!2792 = !DILocation(line: 2614, column: 14, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2784, file: !70, line: 2613, column: 2)
!2794 = !DILocation(line: 2614, column: 12, scope: !2793)
!2795 = !DILocation(line: 2617, column: 5, scope: !2796)
!2796 = distinct !DILexicalBlock(scope: !2750, file: !70, line: 2617, column: 5)
!2797 = !DILocation(line: 2617, column: 11, scope: !2796)
!2798 = !DILocation(line: 2617, column: 5, scope: !2750)
!2799 = !DILocation(line: 2619, column: 15, scope: !2800)
!2800 = distinct !DILexicalBlock(scope: !2796, file: !70, line: 2618, column: 2)
!2801 = !DILocation(line: 2619, column: 14, scope: !2800)
!2802 = !DILocation(line: 2619, column: 12, scope: !2800)
!2803 = !DILocation(line: 2620, column: 2, scope: !2800)
!2804 = !DILocation(line: 2623, column: 14, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2796, file: !70, line: 2622, column: 2)
!2806 = !DILocation(line: 2623, column: 12, scope: !2805)
!2807 = !DILocation(line: 2626, column: 13, scope: !2750)
!2808 = !DILocation(line: 2626, column: 24, scope: !2750)
!2809 = !DILocation(line: 2626, column: 22, scope: !2750)
!2810 = !DILocation(line: 2626, column: 11, scope: !2750)
!2811 = !DILocation(line: 2627, column: 25, scope: !2750)
!2812 = !DILocation(line: 2627, column: 35, scope: !2750)
!2813 = !DILocation(line: 2627, column: 13, scope: !2750)
!2814 = !DILocation(line: 2627, column: 11, scope: !2750)
!2815 = !DILocation(line: 2628, column: 13, scope: !2750)
!2816 = !DILocation(line: 2628, column: 22, scope: !2750)
!2817 = !DILocation(line: 2628, column: 11, scope: !2750)
!2818 = !DILocation(line: 2629, column: 14, scope: !2750)
!2819 = !DILocation(line: 2629, column: 23, scope: !2750)
!2820 = !DILocation(line: 2629, column: 11, scope: !2750)
!2821 = !DILocation(line: 2630, column: 6, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2750, file: !70, line: 2630, column: 5)
!2823 = !DILocation(line: 2630, column: 14, scope: !2822)
!2824 = !DILocation(line: 2630, column: 18, scope: !2822)
!2825 = !DILocation(line: 2630, column: 5, scope: !2750)
!2826 = !DILocation(line: 2632, column: 6, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2828, file: !70, line: 2632, column: 6)
!2828 = distinct !DILexicalBlock(scope: !2822, file: !70, line: 2631, column: 2)
!2829 = !DILocation(line: 2632, column: 16, scope: !2827)
!2830 = !DILocation(line: 2632, column: 6, scope: !2828)
!2831 = !DILocation(line: 2634, column: 7, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2833, file: !70, line: 2634, column: 7)
!2833 = distinct !DILexicalBlock(scope: !2827, file: !70, line: 2633, column: 3)
!2834 = !DILocation(line: 2634, column: 15, scope: !2832)
!2835 = !DILocation(line: 2634, column: 7, scope: !2833)
!2836 = !DILocation(line: 2635, column: 12, scope: !2832)
!2837 = !DILocation(line: 2635, column: 5, scope: !2832)
!2838 = !DILocation(line: 2637, column: 5, scope: !2832)
!2839 = !DILocation(line: 2641, column: 7, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2841, file: !70, line: 2641, column: 7)
!2841 = distinct !DILexicalBlock(scope: !2827, file: !70, line: 2640, column: 3)
!2842 = !DILocation(line: 2641, column: 15, scope: !2840)
!2843 = !DILocation(line: 2641, column: 7, scope: !2841)
!2844 = !DILocation(line: 2642, column: 13, scope: !2840)
!2845 = !DILocation(line: 2642, column: 12, scope: !2840)
!2846 = !DILocation(line: 2642, column: 5, scope: !2840)
!2847 = !DILocation(line: 2644, column: 5, scope: !2840)
!2848 = !DILocation(line: 2649, column: 3, scope: !2849)
!2849 = distinct !DILexicalBlock(scope: !2822, file: !70, line: 2648, column: 2)
!2850 = !DILocation(line: 2651, column: 1, scope: !2750)
!2851 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !70, file: !70, line: 2666, type: !2187, scopeLine: 2667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2852 = !DILocalVariable(name: "val1", arg: 1, scope: !2851, file: !70, line: 2666, type: !20)
!2853 = !DILocation(line: 2666, column: 25, scope: !2851)
!2854 = !DILocalVariable(name: "val2", arg: 2, scope: !2851, file: !70, line: 2666, type: !20)
!2855 = !DILocation(line: 2666, column: 35, scope: !2851)
!2856 = !DILocalVariable(name: "u32Temp1", scope: !2851, file: !70, line: 2668, type: !733)
!2857 = !DILocation(line: 2668, column: 6, scope: !2851)
!2858 = !DILocalVariable(name: "u32Temp2", scope: !2851, file: !70, line: 2668, type: !733)
!2859 = !DILocation(line: 2668, column: 17, scope: !2851)
!2860 = !DILocalVariable(name: "u32Temp3", scope: !2851, file: !70, line: 2668, type: !733)
!2861 = !DILocation(line: 2668, column: 26, scope: !2851)
!2862 = !DILocalVariable(name: "u32Temp4", scope: !2851, file: !70, line: 2668, type: !733)
!2863 = !DILocation(line: 2668, column: 35, scope: !2851)
!2864 = !DILocalVariable(name: "u8SignBit", scope: !2851, file: !70, line: 2669, type: !24)
!2865 = !DILocation(line: 2669, column: 5, scope: !2851)
!2866 = !DILocation(line: 2671, column: 7, scope: !2867)
!2867 = distinct !DILexicalBlock(scope: !2851, file: !70, line: 2671, column: 5)
!2868 = !DILocation(line: 2671, column: 11, scope: !2867)
!2869 = !DILocation(line: 2671, column: 15, scope: !2867)
!2870 = !DILocation(line: 2671, column: 33, scope: !2867)
!2871 = !DILocation(line: 2671, column: 37, scope: !2867)
!2872 = !DILocation(line: 2671, column: 41, scope: !2867)
!2873 = !DILocation(line: 2673, column: 13, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2867, file: !70, line: 2672, column: 2)
!2875 = !DILocation(line: 2674, column: 2, scope: !2874)
!2876 = !DILocation(line: 2677, column: 13, scope: !2877)
!2877 = distinct !DILexicalBlock(scope: !2867, file: !70, line: 2676, column: 2)
!2878 = !DILocation(line: 2680, column: 5, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2851, file: !70, line: 2680, column: 5)
!2880 = !DILocation(line: 2680, column: 9, scope: !2879)
!2881 = !DILocation(line: 2680, column: 5, scope: !2851)
!2882 = !DILocation(line: 2682, column: 15, scope: !2883)
!2883 = distinct !DILexicalBlock(scope: !2879, file: !70, line: 2681, column: 2)
!2884 = !DILocation(line: 2682, column: 14, scope: !2883)
!2885 = !DILocation(line: 2682, column: 12, scope: !2883)
!2886 = !DILocation(line: 2683, column: 2, scope: !2883)
!2887 = !DILocation(line: 2686, column: 14, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2879, file: !70, line: 2685, column: 2)
!2889 = !DILocation(line: 2686, column: 12, scope: !2888)
!2890 = !DILocation(line: 2689, column: 5, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2851, file: !70, line: 2689, column: 5)
!2892 = !DILocation(line: 2689, column: 9, scope: !2891)
!2893 = !DILocation(line: 2689, column: 5, scope: !2851)
!2894 = !DILocation(line: 2691, column: 15, scope: !2895)
!2895 = distinct !DILexicalBlock(scope: !2891, file: !70, line: 2690, column: 2)
!2896 = !DILocation(line: 2691, column: 14, scope: !2895)
!2897 = !DILocation(line: 2691, column: 12, scope: !2895)
!2898 = !DILocation(line: 2692, column: 2, scope: !2895)
!2899 = !DILocation(line: 2695, column: 14, scope: !2900)
!2900 = distinct !DILexicalBlock(scope: !2891, file: !70, line: 2694, column: 2)
!2901 = !DILocation(line: 2695, column: 12, scope: !2900)
!2902 = !DILocation(line: 2698, column: 13, scope: !2851)
!2903 = !DILocation(line: 2698, column: 24, scope: !2851)
!2904 = !DILocation(line: 2698, column: 22, scope: !2851)
!2905 = !DILocation(line: 2698, column: 11, scope: !2851)
!2906 = !DILocation(line: 2699, column: 25, scope: !2851)
!2907 = !DILocation(line: 2699, column: 35, scope: !2851)
!2908 = !DILocation(line: 2699, column: 13, scope: !2851)
!2909 = !DILocation(line: 2699, column: 11, scope: !2851)
!2910 = !DILocation(line: 2700, column: 5, scope: !2911)
!2911 = distinct !DILexicalBlock(scope: !2851, file: !70, line: 2700, column: 5)
!2912 = !DILocation(line: 2700, column: 13, scope: !2911)
!2913 = !DILocation(line: 2700, column: 5, scope: !2851)
!2914 = !DILocation(line: 2702, column: 6, scope: !2915)
!2915 = distinct !DILexicalBlock(scope: !2916, file: !70, line: 2702, column: 6)
!2916 = distinct !DILexicalBlock(scope: !2911, file: !70, line: 2701, column: 2)
!2917 = !DILocation(line: 2702, column: 16, scope: !2915)
!2918 = !DILocation(line: 2702, column: 6, scope: !2916)
!2919 = !DILocation(line: 2704, column: 7, scope: !2920)
!2920 = distinct !DILexicalBlock(scope: !2921, file: !70, line: 2704, column: 7)
!2921 = distinct !DILexicalBlock(scope: !2915, file: !70, line: 2703, column: 3)
!2922 = !DILocation(line: 2704, column: 15, scope: !2920)
!2923 = !DILocation(line: 2704, column: 7, scope: !2921)
!2924 = !DILocation(line: 2705, column: 12, scope: !2920)
!2925 = !DILocation(line: 2705, column: 5, scope: !2920)
!2926 = !DILocation(line: 2707, column: 5, scope: !2920)
!2927 = !DILocation(line: 2711, column: 7, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2929, file: !70, line: 2711, column: 7)
!2929 = distinct !DILexicalBlock(scope: !2915, file: !70, line: 2710, column: 3)
!2930 = !DILocation(line: 2711, column: 15, scope: !2928)
!2931 = !DILocation(line: 2711, column: 7, scope: !2929)
!2932 = !DILocation(line: 2712, column: 13, scope: !2928)
!2933 = !DILocation(line: 2712, column: 12, scope: !2928)
!2934 = !DILocation(line: 2712, column: 5, scope: !2928)
!2935 = !DILocation(line: 2714, column: 5, scope: !2928)
!2936 = !DILocation(line: 2719, column: 6, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2938, file: !70, line: 2719, column: 6)
!2938 = distinct !DILexicalBlock(scope: !2911, file: !70, line: 2718, column: 2)
!2939 = !DILocation(line: 2719, column: 16, scope: !2937)
!2940 = !DILocation(line: 2719, column: 6, scope: !2938)
!2941 = !DILocation(line: 2721, column: 4, scope: !2942)
!2942 = distinct !DILexicalBlock(scope: !2937, file: !70, line: 2720, column: 3)
!2943 = !DILocation(line: 2725, column: 4, scope: !2944)
!2944 = distinct !DILexicalBlock(scope: !2937, file: !70, line: 2724, column: 3)
!2945 = !DILocation(line: 2729, column: 1, scope: !2851)
!2946 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !70, file: !70, line: 2747, type: !2083, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2947 = !DILocalVariable(name: "value", arg: 1, scope: !2946, file: !70, line: 2747, type: !20)
!2948 = !DILocation(line: 2747, column: 31, scope: !2946)
!2949 = !DILocalVariable(name: "factor", arg: 2, scope: !2946, file: !70, line: 2747, type: !733)
!2950 = !DILocation(line: 2747, column: 42, scope: !2946)
!2951 = !DILocalVariable(name: "u32Temp1", scope: !2946, file: !70, line: 2749, type: !733)
!2952 = !DILocation(line: 2749, column: 6, scope: !2946)
!2953 = !DILocalVariable(name: "u32Temp2", scope: !2946, file: !70, line: 2749, type: !733)
!2954 = !DILocation(line: 2749, column: 17, scope: !2946)
!2955 = !DILocalVariable(name: "u8SignBit", scope: !2946, file: !70, line: 2750, type: !24)
!2956 = !DILocation(line: 2750, column: 5, scope: !2946)
!2957 = !DILocation(line: 2752, column: 5, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2946, file: !70, line: 2752, column: 5)
!2959 = !DILocation(line: 2752, column: 10, scope: !2958)
!2960 = !DILocation(line: 2752, column: 5, scope: !2946)
!2961 = !DILocation(line: 2754, column: 15, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2958, file: !70, line: 2753, column: 2)
!2963 = !DILocation(line: 2754, column: 14, scope: !2962)
!2964 = !DILocation(line: 2754, column: 12, scope: !2962)
!2965 = !DILocation(line: 2755, column: 13, scope: !2962)
!2966 = !DILocation(line: 2756, column: 2, scope: !2962)
!2967 = !DILocation(line: 2759, column: 14, scope: !2968)
!2968 = distinct !DILexicalBlock(scope: !2958, file: !70, line: 2758, column: 2)
!2969 = !DILocation(line: 2759, column: 12, scope: !2968)
!2970 = !DILocation(line: 2760, column: 13, scope: !2968)
!2971 = !DILocation(line: 2763, column: 25, scope: !2946)
!2972 = !DILocation(line: 2763, column: 35, scope: !2946)
!2973 = !DILocation(line: 2763, column: 13, scope: !2946)
!2974 = !DILocation(line: 2763, column: 11, scope: !2946)
!2975 = !DILocation(line: 2764, column: 13, scope: !2946)
!2976 = !DILocation(line: 2764, column: 22, scope: !2946)
!2977 = !DILocation(line: 2764, column: 11, scope: !2946)
!2978 = !DILocation(line: 2765, column: 5, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2946, file: !70, line: 2765, column: 5)
!2980 = !DILocation(line: 2765, column: 15, scope: !2979)
!2981 = !DILocation(line: 2765, column: 5, scope: !2946)
!2982 = !DILocation(line: 2767, column: 10, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2979, file: !70, line: 2766, column: 2)
!2984 = !DILocation(line: 2767, column: 3, scope: !2983)
!2985 = !DILocation(line: 2771, column: 11, scope: !2986)
!2986 = distinct !DILexicalBlock(scope: !2979, file: !70, line: 2770, column: 2)
!2987 = !DILocation(line: 2771, column: 10, scope: !2986)
!2988 = !DILocation(line: 2771, column: 3, scope: !2986)
!2989 = !DILocation(line: 2773, column: 1, scope: !2946)
!2990 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !70, file: !70, line: 2789, type: !2187, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2991 = !DILocalVariable(name: "value", arg: 1, scope: !2990, file: !70, line: 2789, type: !20)
!2992 = !DILocation(line: 2789, column: 31, scope: !2990)
!2993 = !DILocalVariable(name: "factor", arg: 2, scope: !2990, file: !70, line: 2789, type: !20)
!2994 = !DILocation(line: 2789, column: 42, scope: !2990)
!2995 = !DILocalVariable(name: "u32Temp1", scope: !2990, file: !70, line: 2791, type: !733)
!2996 = !DILocation(line: 2791, column: 6, scope: !2990)
!2997 = !DILocalVariable(name: "u32Temp2", scope: !2990, file: !70, line: 2791, type: !733)
!2998 = !DILocation(line: 2791, column: 17, scope: !2990)
!2999 = !DILocalVariable(name: "u32Temp3", scope: !2990, file: !70, line: 2791, type: !733)
!3000 = !DILocation(line: 2791, column: 26, scope: !2990)
!3001 = !DILocalVariable(name: "u8SignBit", scope: !2990, file: !70, line: 2792, type: !24)
!3002 = !DILocation(line: 2792, column: 5, scope: !2990)
!3003 = !DILocation(line: 2794, column: 7, scope: !3004)
!3004 = distinct !DILexicalBlock(scope: !2990, file: !70, line: 2794, column: 5)
!3005 = !DILocation(line: 2794, column: 12, scope: !3004)
!3006 = !DILocation(line: 2794, column: 16, scope: !3004)
!3007 = !DILocation(line: 2794, column: 36, scope: !3004)
!3008 = !DILocation(line: 2794, column: 41, scope: !3004)
!3009 = !DILocation(line: 2794, column: 45, scope: !3004)
!3010 = !DILocation(line: 2796, column: 13, scope: !3011)
!3011 = distinct !DILexicalBlock(scope: !3004, file: !70, line: 2795, column: 2)
!3012 = !DILocation(line: 2797, column: 2, scope: !3011)
!3013 = !DILocation(line: 2800, column: 13, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3004, file: !70, line: 2799, column: 2)
!3015 = !DILocation(line: 2803, column: 5, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !2990, file: !70, line: 2803, column: 5)
!3017 = !DILocation(line: 2803, column: 10, scope: !3016)
!3018 = !DILocation(line: 2803, column: 5, scope: !2990)
!3019 = !DILocation(line: 2805, column: 15, scope: !3020)
!3020 = distinct !DILexicalBlock(scope: !3016, file: !70, line: 2804, column: 2)
!3021 = !DILocation(line: 2805, column: 14, scope: !3020)
!3022 = !DILocation(line: 2805, column: 12, scope: !3020)
!3023 = !DILocation(line: 2806, column: 2, scope: !3020)
!3024 = !DILocation(line: 2809, column: 14, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !3016, file: !70, line: 2808, column: 2)
!3026 = !DILocation(line: 2809, column: 12, scope: !3025)
!3027 = !DILocation(line: 2812, column: 5, scope: !3028)
!3028 = distinct !DILexicalBlock(scope: !2990, file: !70, line: 2812, column: 5)
!3029 = !DILocation(line: 2812, column: 11, scope: !3028)
!3030 = !DILocation(line: 2812, column: 5, scope: !2990)
!3031 = !DILocation(line: 2814, column: 15, scope: !3032)
!3032 = distinct !DILexicalBlock(scope: !3028, file: !70, line: 2813, column: 2)
!3033 = !DILocation(line: 2814, column: 14, scope: !3032)
!3034 = !DILocation(line: 2814, column: 12, scope: !3032)
!3035 = !DILocation(line: 2815, column: 2, scope: !3032)
!3036 = !DILocation(line: 2818, column: 14, scope: !3037)
!3037 = distinct !DILexicalBlock(scope: !3028, file: !70, line: 2817, column: 2)
!3038 = !DILocation(line: 2818, column: 12, scope: !3037)
!3039 = !DILocation(line: 2821, column: 25, scope: !2990)
!3040 = !DILocation(line: 2821, column: 35, scope: !2990)
!3041 = !DILocation(line: 2821, column: 13, scope: !2990)
!3042 = !DILocation(line: 2821, column: 11, scope: !2990)
!3043 = !DILocation(line: 2822, column: 5, scope: !3044)
!3044 = distinct !DILexicalBlock(scope: !2990, file: !70, line: 2822, column: 5)
!3045 = !DILocation(line: 2822, column: 15, scope: !3044)
!3046 = !DILocation(line: 2822, column: 5, scope: !2990)
!3047 = !DILocation(line: 2824, column: 10, scope: !3048)
!3048 = distinct !DILexicalBlock(scope: !3044, file: !70, line: 2823, column: 2)
!3049 = !DILocation(line: 2824, column: 3, scope: !3048)
!3050 = !DILocation(line: 2828, column: 11, scope: !3051)
!3051 = distinct !DILexicalBlock(scope: !3044, file: !70, line: 2827, column: 2)
!3052 = !DILocation(line: 2828, column: 10, scope: !3051)
!3053 = !DILocation(line: 2828, column: 3, scope: !3051)
!3054 = !DILocation(line: 2830, column: 1, scope: !2990)
!3055 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !70, file: !70, line: 2847, type: !3056, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3056 = !DISubroutineType(types: !3057)
!3057 = !{!733, !733, !24}
!3058 = !DILocalVariable(name: "value", arg: 1, scope: !3055, file: !70, line: 2847, type: !733)
!3059 = !DILocation(line: 2847, column: 29, scope: !3055)
!3060 = !DILocalVariable(name: "factor", arg: 2, scope: !3055, file: !70, line: 2847, type: !24)
!3061 = !DILocation(line: 2847, column: 39, scope: !3055)
!3062 = !DILocalVariable(name: "u32Temp1", scope: !3055, file: !70, line: 2849, type: !733)
!3063 = !DILocation(line: 2849, column: 6, scope: !3055)
!3064 = !DILocalVariable(name: "u32Temp2", scope: !3055, file: !70, line: 2849, type: !733)
!3065 = !DILocation(line: 2849, column: 20, scope: !3055)
!3066 = !DILocation(line: 2850, column: 13, scope: !3055)
!3067 = !DILocation(line: 2850, column: 21, scope: !3055)
!3068 = !DILocation(line: 2850, column: 19, scope: !3055)
!3069 = !DILocation(line: 2850, column: 11, scope: !3055)
!3070 = !DILocation(line: 2851, column: 25, scope: !3055)
!3071 = !DILocation(line: 2851, column: 32, scope: !3055)
!3072 = !DILocation(line: 2851, column: 13, scope: !3055)
!3073 = !DILocation(line: 2851, column: 11, scope: !3055)
!3074 = !DILocation(line: 2852, column: 14, scope: !3055)
!3075 = !DILocation(line: 2852, column: 23, scope: !3055)
!3076 = !DILocation(line: 2852, column: 11, scope: !3055)
!3077 = !DILocation(line: 2853, column: 14, scope: !3055)
!3078 = !DILocation(line: 2853, column: 23, scope: !3055)
!3079 = !DILocation(line: 2853, column: 11, scope: !3055)
!3080 = !DILocation(line: 2854, column: 9, scope: !3055)
!3081 = !DILocation(line: 2854, column: 2, scope: !3055)
!3082 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !70, file: !70, line: 2873, type: !3056, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3083 = !DILocalVariable(name: "value", arg: 1, scope: !3082, file: !70, line: 2873, type: !733)
!3084 = !DILocation(line: 2873, column: 29, scope: !3082)
!3085 = !DILocalVariable(name: "factor", arg: 2, scope: !3082, file: !70, line: 2873, type: !24)
!3086 = !DILocation(line: 2873, column: 39, scope: !3082)
!3087 = !DILocalVariable(name: "u32Temp1", scope: !3082, file: !70, line: 2875, type: !733)
!3088 = !DILocation(line: 2875, column: 6, scope: !3082)
!3089 = !DILocalVariable(name: "u32Temp2", scope: !3082, file: !70, line: 2875, type: !733)
!3090 = !DILocation(line: 2875, column: 20, scope: !3082)
!3091 = !DILocation(line: 2876, column: 13, scope: !3082)
!3092 = !DILocation(line: 2876, column: 21, scope: !3082)
!3093 = !DILocation(line: 2876, column: 19, scope: !3082)
!3094 = !DILocation(line: 2876, column: 11, scope: !3082)
!3095 = !DILocation(line: 2877, column: 25, scope: !3082)
!3096 = !DILocation(line: 2877, column: 32, scope: !3082)
!3097 = !DILocation(line: 2877, column: 13, scope: !3082)
!3098 = !DILocation(line: 2877, column: 11, scope: !3082)
!3099 = !DILocation(line: 2878, column: 14, scope: !3082)
!3100 = !DILocation(line: 2878, column: 23, scope: !3082)
!3101 = !DILocation(line: 2878, column: 11, scope: !3082)
!3102 = !DILocation(line: 2879, column: 14, scope: !3082)
!3103 = !DILocation(line: 2879, column: 23, scope: !3082)
!3104 = !DILocation(line: 2879, column: 11, scope: !3082)
!3105 = !DILocation(line: 2880, column: 6, scope: !3106)
!3106 = distinct !DILexicalBlock(scope: !3082, file: !70, line: 2880, column: 5)
!3107 = !DILocation(line: 2880, column: 14, scope: !3106)
!3108 = !DILocation(line: 2880, column: 19, scope: !3106)
!3109 = !DILocation(line: 2880, column: 5, scope: !3082)
!3110 = !DILocation(line: 2882, column: 10, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3106, file: !70, line: 2881, column: 2)
!3112 = !DILocation(line: 2882, column: 3, scope: !3111)
!3113 = !DILocation(line: 2886, column: 3, scope: !3114)
!3114 = distinct !DILexicalBlock(scope: !3106, file: !70, line: 2885, column: 2)
!3115 = !DILocation(line: 2889, column: 1, scope: !3082)
!3116 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !70, file: !70, line: 2908, type: !3117, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3117 = !DISubroutineType(types: !3118)
!3118 = !{!733, !733, !6}
!3119 = !DILocalVariable(name: "value", arg: 1, scope: !3116, file: !70, line: 2908, type: !733)
!3120 = !DILocation(line: 2908, column: 29, scope: !3116)
!3121 = !DILocalVariable(name: "factor", arg: 2, scope: !3116, file: !70, line: 2908, type: !6)
!3122 = !DILocation(line: 2908, column: 39, scope: !3116)
!3123 = !DILocalVariable(name: "u32Temp1", scope: !3116, file: !70, line: 2910, type: !733)
!3124 = !DILocation(line: 2910, column: 6, scope: !3116)
!3125 = !DILocalVariable(name: "u32Temp2", scope: !3116, file: !70, line: 2910, type: !733)
!3126 = !DILocation(line: 2910, column: 20, scope: !3116)
!3127 = !DILocation(line: 2911, column: 5, scope: !3128)
!3128 = distinct !DILexicalBlock(scope: !3116, file: !70, line: 2911, column: 5)
!3129 = !DILocation(line: 2911, column: 12, scope: !3128)
!3130 = !DILocation(line: 2911, column: 5, scope: !3116)
!3131 = !DILocation(line: 2914, column: 14, scope: !3132)
!3132 = distinct !DILexicalBlock(scope: !3128, file: !70, line: 2912, column: 2)
!3133 = !DILocation(line: 2914, column: 22, scope: !3132)
!3134 = !DILocation(line: 2914, column: 20, scope: !3132)
!3135 = !DILocation(line: 2914, column: 12, scope: !3132)
!3136 = !DILocation(line: 2915, column: 26, scope: !3132)
!3137 = !DILocation(line: 2915, column: 33, scope: !3132)
!3138 = !DILocation(line: 2915, column: 14, scope: !3132)
!3139 = !DILocation(line: 2915, column: 12, scope: !3132)
!3140 = !DILocation(line: 2916, column: 14, scope: !3132)
!3141 = !DILocation(line: 2916, column: 23, scope: !3132)
!3142 = !DILocation(line: 2916, column: 12, scope: !3132)
!3143 = !DILocation(line: 2917, column: 15, scope: !3132)
!3144 = !DILocation(line: 2917, column: 24, scope: !3132)
!3145 = !DILocation(line: 2917, column: 12, scope: !3132)
!3146 = !DILocation(line: 2918, column: 10, scope: !3132)
!3147 = !DILocation(line: 2918, column: 3, scope: !3132)
!3148 = !DILocation(line: 2922, column: 3, scope: !3149)
!3149 = distinct !DILexicalBlock(scope: !3128, file: !70, line: 2921, column: 2)
!3150 = !DILocation(line: 2924, column: 1, scope: !3116)
!3151 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !70, file: !70, line: 2943, type: !3117, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3152 = !DILocalVariable(name: "value", arg: 1, scope: !3151, file: !70, line: 2943, type: !733)
!3153 = !DILocation(line: 2943, column: 29, scope: !3151)
!3154 = !DILocalVariable(name: "factor", arg: 2, scope: !3151, file: !70, line: 2943, type: !6)
!3155 = !DILocation(line: 2943, column: 39, scope: !3151)
!3156 = !DILocalVariable(name: "u32Temp1", scope: !3151, file: !70, line: 2945, type: !733)
!3157 = !DILocation(line: 2945, column: 6, scope: !3151)
!3158 = !DILocalVariable(name: "u32Temp2", scope: !3151, file: !70, line: 2945, type: !733)
!3159 = !DILocation(line: 2945, column: 20, scope: !3151)
!3160 = !DILocation(line: 2946, column: 5, scope: !3161)
!3161 = distinct !DILexicalBlock(scope: !3151, file: !70, line: 2946, column: 5)
!3162 = !DILocation(line: 2946, column: 12, scope: !3161)
!3163 = !DILocation(line: 2946, column: 5, scope: !3151)
!3164 = !DILocation(line: 2948, column: 3, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3161, file: !70, line: 2947, column: 2)
!3166 = !DILocation(line: 2952, column: 14, scope: !3167)
!3167 = distinct !DILexicalBlock(scope: !3161, file: !70, line: 2951, column: 2)
!3168 = !DILocation(line: 2952, column: 22, scope: !3167)
!3169 = !DILocation(line: 2952, column: 20, scope: !3167)
!3170 = !DILocation(line: 2952, column: 12, scope: !3167)
!3171 = !DILocation(line: 2953, column: 26, scope: !3167)
!3172 = !DILocation(line: 2953, column: 33, scope: !3167)
!3173 = !DILocation(line: 2953, column: 14, scope: !3167)
!3174 = !DILocation(line: 2953, column: 12, scope: !3167)
!3175 = !DILocation(line: 2954, column: 14, scope: !3167)
!3176 = !DILocation(line: 2954, column: 23, scope: !3167)
!3177 = !DILocation(line: 2954, column: 12, scope: !3167)
!3178 = !DILocation(line: 2955, column: 15, scope: !3167)
!3179 = !DILocation(line: 2955, column: 24, scope: !3167)
!3180 = !DILocation(line: 2955, column: 12, scope: !3167)
!3181 = !DILocation(line: 2956, column: 7, scope: !3182)
!3182 = distinct !DILexicalBlock(scope: !3167, file: !70, line: 2956, column: 6)
!3183 = !DILocation(line: 2956, column: 16, scope: !3182)
!3184 = !DILocation(line: 2956, column: 22, scope: !3182)
!3185 = !DILocation(line: 2956, column: 6, scope: !3167)
!3186 = !DILocation(line: 2958, column: 11, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3182, file: !70, line: 2957, column: 3)
!3188 = !DILocation(line: 2958, column: 4, scope: !3187)
!3189 = !DILocation(line: 2962, column: 4, scope: !3190)
!3190 = distinct !DILexicalBlock(scope: !3182, file: !70, line: 2961, column: 3)
!3191 = !DILocation(line: 2965, column: 1, scope: !3151)
!3192 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !70, file: !70, line: 2987, type: !298, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3193 = !DILocalVariable(name: "value", arg: 1, scope: !3192, file: !70, line: 2987, type: !13)
!3194 = !DILocation(line: 2987, column: 33, scope: !3192)
!3195 = !DILocalVariable(name: "factor", arg: 2, scope: !3192, file: !70, line: 2987, type: !13)
!3196 = !DILocation(line: 2987, column: 44, scope: !3192)
!3197 = !DILocation(line: 2989, column: 40, scope: !3192)
!3198 = !DILocation(line: 2989, column: 46, scope: !3192)
!3199 = !DILocation(line: 2989, column: 9, scope: !3192)
!3200 = !DILocation(line: 2989, column: 2, scope: !3192)
!3201 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !70, file: !70, line: 3011, type: !298, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3202 = !DILocalVariable(name: "value", arg: 1, scope: !3201, file: !70, line: 3011, type: !13)
!3203 = !DILocation(line: 3011, column: 33, scope: !3201)
!3204 = !DILocalVariable(name: "factor", arg: 2, scope: !3201, file: !70, line: 3011, type: !13)
!3205 = !DILocation(line: 3011, column: 44, scope: !3201)
!3206 = !DILocation(line: 3013, column: 41, scope: !3201)
!3207 = !DILocation(line: 3013, column: 47, scope: !3201)
!3208 = !DILocation(line: 3013, column: 10, scope: !3201)
!3209 = !DILocation(line: 3013, column: 3, scope: !3201)
!3210 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !70, file: !70, line: 3036, type: !298, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3211 = !DILocalVariable(name: "value", arg: 1, scope: !3210, file: !70, line: 3036, type: !13)
!3212 = !DILocation(line: 3036, column: 32, scope: !3210)
!3213 = !DILocalVariable(name: "factor", arg: 2, scope: !3210, file: !70, line: 3036, type: !13)
!3214 = !DILocation(line: 3036, column: 43, scope: !3210)
!3215 = !DILocation(line: 3038, column: 41, scope: !3210)
!3216 = !DILocation(line: 3038, column: 47, scope: !3210)
!3217 = !DILocation(line: 3038, column: 10, scope: !3210)
!3218 = !DILocation(line: 3038, column: 3, scope: !3210)
!3219 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !70, file: !70, line: 3061, type: !298, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3220 = !DILocalVariable(name: "value", arg: 1, scope: !3219, file: !70, line: 3061, type: !13)
!3221 = !DILocation(line: 3061, column: 34, scope: !3219)
!3222 = !DILocalVariable(name: "factor", arg: 2, scope: !3219, file: !70, line: 3061, type: !13)
!3223 = !DILocation(line: 3061, column: 45, scope: !3219)
!3224 = !DILocation(line: 3063, column: 44, scope: !3219)
!3225 = !DILocation(line: 3063, column: 50, scope: !3219)
!3226 = !DILocation(line: 3063, column: 10, scope: !3219)
!3227 = !DILocation(line: 3063, column: 3, scope: !3219)
!3228 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !70, file: !70, line: 3086, type: !298, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3229 = !DILocalVariable(name: "value", arg: 1, scope: !3228, file: !70, line: 3086, type: !13)
!3230 = !DILocation(line: 3086, column: 33, scope: !3228)
!3231 = !DILocalVariable(name: "factor", arg: 2, scope: !3228, file: !70, line: 3086, type: !13)
!3232 = !DILocation(line: 3086, column: 44, scope: !3228)
!3233 = !DILocation(line: 3088, column: 44, scope: !3228)
!3234 = !DILocation(line: 3088, column: 50, scope: !3228)
!3235 = !DILocation(line: 3088, column: 10, scope: !3228)
!3236 = !DILocation(line: 3088, column: 3, scope: !3228)
!3237 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !70, file: !70, line: 3111, type: !298, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3238 = !DILocalVariable(name: "value", arg: 1, scope: !3237, file: !70, line: 3111, type: !13)
!3239 = !DILocation(line: 3111, column: 31, scope: !3237)
!3240 = !DILocalVariable(name: "factor", arg: 2, scope: !3237, file: !70, line: 3111, type: !13)
!3241 = !DILocation(line: 3111, column: 42, scope: !3237)
!3242 = !DILocation(line: 3113, column: 44, scope: !3237)
!3243 = !DILocation(line: 3113, column: 50, scope: !3237)
!3244 = !DILocation(line: 3113, column: 10, scope: !3237)
!3245 = !DILocation(line: 3113, column: 3, scope: !3237)
!3246 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !70, file: !70, line: 3136, type: !298, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3247 = !DILocalVariable(name: "value", arg: 1, scope: !3246, file: !70, line: 3136, type: !13)
!3248 = !DILocation(line: 3136, column: 33, scope: !3246)
!3249 = !DILocalVariable(name: "factor", arg: 2, scope: !3246, file: !70, line: 3136, type: !13)
!3250 = !DILocation(line: 3136, column: 44, scope: !3246)
!3251 = !DILocation(line: 3138, column: 44, scope: !3246)
!3252 = !DILocation(line: 3138, column: 50, scope: !3246)
!3253 = !DILocation(line: 3138, column: 10, scope: !3246)
!3254 = !DILocation(line: 3138, column: 3, scope: !3246)
!3255 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !70, file: !70, line: 3161, type: !298, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3256 = !DILocalVariable(name: "value", arg: 1, scope: !3255, file: !70, line: 3161, type: !13)
!3257 = !DILocation(line: 3161, column: 32, scope: !3255)
!3258 = !DILocalVariable(name: "factor", arg: 2, scope: !3255, file: !70, line: 3161, type: !13)
!3259 = !DILocation(line: 3161, column: 43, scope: !3255)
!3260 = !DILocation(line: 3163, column: 44, scope: !3255)
!3261 = !DILocation(line: 3163, column: 50, scope: !3255)
!3262 = !DILocation(line: 3163, column: 10, scope: !3255)
!3263 = !DILocation(line: 3163, column: 3, scope: !3255)
!3264 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !70, file: !70, line: 3185, type: !298, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3265 = !DILocalVariable(name: "value", arg: 1, scope: !3264, file: !70, line: 3185, type: !13)
!3266 = !DILocation(line: 3185, column: 31, scope: !3264)
!3267 = !DILocalVariable(name: "factor", arg: 2, scope: !3264, file: !70, line: 3185, type: !13)
!3268 = !DILocation(line: 3185, column: 42, scope: !3264)
!3269 = !DILocation(line: 3187, column: 44, scope: !3264)
!3270 = !DILocation(line: 3187, column: 50, scope: !3264)
!3271 = !DILocation(line: 3187, column: 10, scope: !3264)
!3272 = !DILocation(line: 3187, column: 3, scope: !3264)
!3273 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !70, file: !70, line: 3209, type: !298, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3274 = !DILocalVariable(name: "value", arg: 1, scope: !3273, file: !70, line: 3209, type: !13)
!3275 = !DILocation(line: 3209, column: 30, scope: !3273)
!3276 = !DILocalVariable(name: "factor", arg: 2, scope: !3273, file: !70, line: 3209, type: !13)
!3277 = !DILocation(line: 3209, column: 41, scope: !3273)
!3278 = !DILocation(line: 3211, column: 44, scope: !3273)
!3279 = !DILocation(line: 3211, column: 50, scope: !3273)
!3280 = !DILocation(line: 3211, column: 10, scope: !3273)
!3281 = !DILocation(line: 3211, column: 3, scope: !3273)
!3282 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !70, file: !70, line: 3233, type: !298, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3283 = !DILocalVariable(name: "value", arg: 1, scope: !3282, file: !70, line: 3233, type: !13)
!3284 = !DILocation(line: 3233, column: 33, scope: !3282)
!3285 = !DILocalVariable(name: "factor", arg: 2, scope: !3282, file: !70, line: 3233, type: !13)
!3286 = !DILocation(line: 3233, column: 44, scope: !3282)
!3287 = !DILocation(line: 3235, column: 44, scope: !3282)
!3288 = !DILocation(line: 3235, column: 50, scope: !3282)
!3289 = !DILocation(line: 3235, column: 10, scope: !3282)
!3290 = !DILocation(line: 3235, column: 3, scope: !3282)
!3291 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !70, file: !70, line: 3257, type: !298, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3292 = !DILocalVariable(name: "value", arg: 1, scope: !3291, file: !70, line: 3257, type: !13)
!3293 = !DILocation(line: 3257, column: 32, scope: !3291)
!3294 = !DILocalVariable(name: "factor", arg: 2, scope: !3291, file: !70, line: 3257, type: !13)
!3295 = !DILocation(line: 3257, column: 43, scope: !3291)
!3296 = !DILocation(line: 3259, column: 44, scope: !3291)
!3297 = !DILocation(line: 3259, column: 50, scope: !3291)
!3298 = !DILocation(line: 3259, column: 10, scope: !3291)
!3299 = !DILocation(line: 3259, column: 3, scope: !3291)
!3300 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !70, file: !70, line: 3281, type: !298, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3301 = !DILocalVariable(name: "value", arg: 1, scope: !3300, file: !70, line: 3281, type: !13)
!3302 = !DILocation(line: 3281, column: 31, scope: !3300)
!3303 = !DILocalVariable(name: "factor", arg: 2, scope: !3300, file: !70, line: 3281, type: !13)
!3304 = !DILocation(line: 3281, column: 42, scope: !3300)
!3305 = !DILocation(line: 3283, column: 44, scope: !3300)
!3306 = !DILocation(line: 3283, column: 50, scope: !3300)
!3307 = !DILocation(line: 3283, column: 10, scope: !3300)
!3308 = !DILocation(line: 3283, column: 3, scope: !3300)
!3309 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !70, file: !70, line: 3305, type: !298, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3310 = !DILocalVariable(name: "value", arg: 1, scope: !3309, file: !70, line: 3305, type: !13)
!3311 = !DILocation(line: 3305, column: 30, scope: !3309)
!3312 = !DILocalVariable(name: "factor", arg: 2, scope: !3309, file: !70, line: 3305, type: !13)
!3313 = !DILocation(line: 3305, column: 41, scope: !3309)
!3314 = !DILocation(line: 3307, column: 44, scope: !3309)
!3315 = !DILocation(line: 3307, column: 50, scope: !3309)
!3316 = !DILocation(line: 3307, column: 10, scope: !3309)
!3317 = !DILocation(line: 3307, column: 3, scope: !3309)
!3318 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !70, file: !70, line: 3328, type: !387, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3319 = !DILocalVariable(name: "value", arg: 1, scope: !3318, file: !70, line: 3328, type: !13)
!3320 = !DILocation(line: 3328, column: 33, scope: !3318)
!3321 = !DILocalVariable(name: "factor", arg: 2, scope: !3318, file: !70, line: 3328, type: !29)
!3322 = !DILocation(line: 3328, column: 44, scope: !3318)
!3323 = !DILocation(line: 3330, column: 41, scope: !3318)
!3324 = !DILocation(line: 3330, column: 47, scope: !3318)
!3325 = !DILocation(line: 3330, column: 10, scope: !3318)
!3326 = !DILocation(line: 3330, column: 3, scope: !3318)
!3327 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !70, file: !70, line: 3351, type: !387, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3328 = !DILocalVariable(name: "value", arg: 1, scope: !3327, file: !70, line: 3351, type: !13)
!3329 = !DILocation(line: 3351, column: 32, scope: !3327)
!3330 = !DILocalVariable(name: "factor", arg: 2, scope: !3327, file: !70, line: 3351, type: !29)
!3331 = !DILocation(line: 3351, column: 43, scope: !3327)
!3332 = !DILocation(line: 3353, column: 33, scope: !3327)
!3333 = !DILocation(line: 3353, column: 39, scope: !3327)
!3334 = !DILocation(line: 3353, column: 2, scope: !3327)
!3335 = !DILocation(line: 3354, column: 1, scope: !3327)
!3336 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !70, file: !70, line: 3375, type: !387, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3337 = !DILocalVariable(name: "value", arg: 1, scope: !3336, file: !70, line: 3375, type: !13)
!3338 = !DILocation(line: 3375, column: 31, scope: !3336)
!3339 = !DILocalVariable(name: "factor", arg: 2, scope: !3336, file: !70, line: 3375, type: !29)
!3340 = !DILocation(line: 3375, column: 42, scope: !3336)
!3341 = !DILocation(line: 3377, column: 41, scope: !3336)
!3342 = !DILocation(line: 3377, column: 47, scope: !3336)
!3343 = !DILocation(line: 3377, column: 10, scope: !3336)
!3344 = !DILocation(line: 3377, column: 3, scope: !3336)
!3345 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !70, file: !70, line: 3400, type: !387, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3346 = !DILocalVariable(name: "value", arg: 1, scope: !3345, file: !70, line: 3400, type: !13)
!3347 = !DILocation(line: 3400, column: 33, scope: !3345)
!3348 = !DILocalVariable(name: "factor", arg: 2, scope: !3345, file: !70, line: 3400, type: !29)
!3349 = !DILocation(line: 3400, column: 44, scope: !3345)
!3350 = !DILocation(line: 3402, column: 44, scope: !3345)
!3351 = !DILocation(line: 3402, column: 50, scope: !3345)
!3352 = !DILocation(line: 3402, column: 10, scope: !3345)
!3353 = !DILocation(line: 3402, column: 3, scope: !3345)
!3354 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !70, file: !70, line: 3425, type: !387, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3355 = !DILocalVariable(name: "value", arg: 1, scope: !3354, file: !70, line: 3425, type: !13)
!3356 = !DILocation(line: 3425, column: 32, scope: !3354)
!3357 = !DILocalVariable(name: "factor", arg: 2, scope: !3354, file: !70, line: 3425, type: !29)
!3358 = !DILocation(line: 3425, column: 43, scope: !3354)
!3359 = !DILocation(line: 3427, column: 44, scope: !3354)
!3360 = !DILocation(line: 3427, column: 50, scope: !3354)
!3361 = !DILocation(line: 3427, column: 10, scope: !3354)
!3362 = !DILocation(line: 3427, column: 3, scope: !3354)
!3363 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !70, file: !70, line: 3450, type: !387, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3364 = !DILocalVariable(name: "value", arg: 1, scope: !3363, file: !70, line: 3450, type: !13)
!3365 = !DILocation(line: 3450, column: 31, scope: !3363)
!3366 = !DILocalVariable(name: "factor", arg: 2, scope: !3363, file: !70, line: 3450, type: !29)
!3367 = !DILocation(line: 3450, column: 42, scope: !3363)
!3368 = !DILocation(line: 3452, column: 44, scope: !3363)
!3369 = !DILocation(line: 3452, column: 50, scope: !3363)
!3370 = !DILocation(line: 3452, column: 10, scope: !3363)
!3371 = !DILocation(line: 3452, column: 3, scope: !3363)
!3372 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !70, file: !70, line: 3475, type: !387, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3373 = !DILocalVariable(name: "value", arg: 1, scope: !3372, file: !70, line: 3475, type: !13)
!3374 = !DILocation(line: 3475, column: 33, scope: !3372)
!3375 = !DILocalVariable(name: "factor", arg: 2, scope: !3372, file: !70, line: 3475, type: !29)
!3376 = !DILocation(line: 3475, column: 44, scope: !3372)
!3377 = !DILocation(line: 3477, column: 44, scope: !3372)
!3378 = !DILocation(line: 3477, column: 50, scope: !3372)
!3379 = !DILocation(line: 3477, column: 10, scope: !3372)
!3380 = !DILocation(line: 3477, column: 3, scope: !3372)
!3381 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !70, file: !70, line: 3500, type: !387, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3382 = !DILocalVariable(name: "value", arg: 1, scope: !3381, file: !70, line: 3500, type: !13)
!3383 = !DILocation(line: 3500, column: 32, scope: !3381)
!3384 = !DILocalVariable(name: "factor", arg: 2, scope: !3381, file: !70, line: 3500, type: !29)
!3385 = !DILocation(line: 3500, column: 43, scope: !3381)
!3386 = !DILocation(line: 3502, column: 44, scope: !3381)
!3387 = !DILocation(line: 3502, column: 50, scope: !3381)
!3388 = !DILocation(line: 3502, column: 10, scope: !3381)
!3389 = !DILocation(line: 3502, column: 3, scope: !3381)
!3390 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !70, file: !70, line: 3524, type: !387, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3391 = !DILocalVariable(name: "value", arg: 1, scope: !3390, file: !70, line: 3524, type: !13)
!3392 = !DILocation(line: 3524, column: 31, scope: !3390)
!3393 = !DILocalVariable(name: "factor", arg: 2, scope: !3390, file: !70, line: 3524, type: !29)
!3394 = !DILocation(line: 3524, column: 42, scope: !3390)
!3395 = !DILocation(line: 3526, column: 44, scope: !3390)
!3396 = !DILocation(line: 3526, column: 50, scope: !3390)
!3397 = !DILocation(line: 3526, column: 10, scope: !3390)
!3398 = !DILocation(line: 3526, column: 3, scope: !3390)
!3399 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !70, file: !70, line: 3548, type: !387, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3400 = !DILocalVariable(name: "value", arg: 1, scope: !3399, file: !70, line: 3548, type: !13)
!3401 = !DILocation(line: 3548, column: 30, scope: !3399)
!3402 = !DILocalVariable(name: "factor", arg: 2, scope: !3399, file: !70, line: 3548, type: !29)
!3403 = !DILocation(line: 3548, column: 41, scope: !3399)
!3404 = !DILocation(line: 3550, column: 44, scope: !3399)
!3405 = !DILocation(line: 3550, column: 50, scope: !3399)
!3406 = !DILocation(line: 3550, column: 10, scope: !3399)
!3407 = !DILocation(line: 3550, column: 3, scope: !3399)
!3408 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !70, file: !70, line: 3572, type: !387, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3409 = !DILocalVariable(name: "value", arg: 1, scope: !3408, file: !70, line: 3572, type: !13)
!3410 = !DILocation(line: 3572, column: 33, scope: !3408)
!3411 = !DILocalVariable(name: "factor", arg: 2, scope: !3408, file: !70, line: 3572, type: !29)
!3412 = !DILocation(line: 3572, column: 44, scope: !3408)
!3413 = !DILocation(line: 3574, column: 44, scope: !3408)
!3414 = !DILocation(line: 3574, column: 50, scope: !3408)
!3415 = !DILocation(line: 3574, column: 10, scope: !3408)
!3416 = !DILocation(line: 3574, column: 3, scope: !3408)
!3417 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !70, file: !70, line: 3596, type: !387, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3418 = !DILocalVariable(name: "value", arg: 1, scope: !3417, file: !70, line: 3596, type: !13)
!3419 = !DILocation(line: 3596, column: 32, scope: !3417)
!3420 = !DILocalVariable(name: "factor", arg: 2, scope: !3417, file: !70, line: 3596, type: !29)
!3421 = !DILocation(line: 3596, column: 43, scope: !3417)
!3422 = !DILocation(line: 3598, column: 44, scope: !3417)
!3423 = !DILocation(line: 3598, column: 50, scope: !3417)
!3424 = !DILocation(line: 3598, column: 10, scope: !3417)
!3425 = !DILocation(line: 3598, column: 3, scope: !3417)
!3426 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !70, file: !70, line: 3620, type: !387, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3427 = !DILocalVariable(name: "value", arg: 1, scope: !3426, file: !70, line: 3620, type: !13)
!3428 = !DILocation(line: 3620, column: 31, scope: !3426)
!3429 = !DILocalVariable(name: "factor", arg: 2, scope: !3426, file: !70, line: 3620, type: !29)
!3430 = !DILocation(line: 3620, column: 42, scope: !3426)
!3431 = !DILocation(line: 3622, column: 44, scope: !3426)
!3432 = !DILocation(line: 3622, column: 50, scope: !3426)
!3433 = !DILocation(line: 3622, column: 10, scope: !3426)
!3434 = !DILocation(line: 3622, column: 3, scope: !3426)
!3435 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !70, file: !70, line: 3644, type: !387, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3436 = !DILocalVariable(name: "value", arg: 1, scope: !3435, file: !70, line: 3644, type: !13)
!3437 = !DILocation(line: 3644, column: 30, scope: !3435)
!3438 = !DILocalVariable(name: "factor", arg: 2, scope: !3435, file: !70, line: 3644, type: !29)
!3439 = !DILocation(line: 3644, column: 41, scope: !3435)
!3440 = !DILocation(line: 3646, column: 44, scope: !3435)
!3441 = !DILocation(line: 3646, column: 50, scope: !3435)
!3442 = !DILocation(line: 3646, column: 10, scope: !3435)
!3443 = !DILocation(line: 3646, column: 3, scope: !3435)
!3444 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !70, file: !70, line: 3666, type: !472, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3445 = !DILocalVariable(name: "value", arg: 1, scope: !3444, file: !70, line: 3666, type: !13)
!3446 = !DILocation(line: 3666, column: 32, scope: !3444)
!3447 = !DILocalVariable(name: "factor", arg: 2, scope: !3444, file: !70, line: 3666, type: !24)
!3448 = !DILocation(line: 3666, column: 42, scope: !3444)
!3449 = !DILocation(line: 3668, column: 40, scope: !3444)
!3450 = !DILocation(line: 3668, column: 58, scope: !3444)
!3451 = !DILocation(line: 3668, column: 52, scope: !3444)
!3452 = !DILocation(line: 3668, column: 66, scope: !3444)
!3453 = !DILocation(line: 3668, column: 46, scope: !3444)
!3454 = !DILocation(line: 3668, column: 10, scope: !3444)
!3455 = !DILocation(line: 3668, column: 3, scope: !3444)
!3456 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !70, file: !70, line: 3688, type: !472, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3457 = !DILocalVariable(name: "value", arg: 1, scope: !3456, file: !70, line: 3688, type: !13)
!3458 = !DILocation(line: 3688, column: 31, scope: !3456)
!3459 = !DILocalVariable(name: "factor", arg: 2, scope: !3456, file: !70, line: 3688, type: !24)
!3460 = !DILocation(line: 3688, column: 41, scope: !3456)
!3461 = !DILocation(line: 3690, column: 40, scope: !3456)
!3462 = !DILocation(line: 3690, column: 58, scope: !3456)
!3463 = !DILocation(line: 3690, column: 52, scope: !3456)
!3464 = !DILocation(line: 3690, column: 66, scope: !3456)
!3465 = !DILocation(line: 3690, column: 46, scope: !3456)
!3466 = !DILocation(line: 3690, column: 10, scope: !3456)
!3467 = !DILocation(line: 3690, column: 3, scope: !3456)
!3468 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !70, file: !70, line: 3711, type: !472, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3469 = !DILocalVariable(name: "value", arg: 1, scope: !3468, file: !70, line: 3711, type: !13)
!3470 = !DILocation(line: 3711, column: 30, scope: !3468)
!3471 = !DILocalVariable(name: "factor", arg: 2, scope: !3468, file: !70, line: 3711, type: !24)
!3472 = !DILocation(line: 3711, column: 40, scope: !3468)
!3473 = !DILocation(line: 3713, column: 40, scope: !3468)
!3474 = !DILocation(line: 3713, column: 58, scope: !3468)
!3475 = !DILocation(line: 3713, column: 52, scope: !3468)
!3476 = !DILocation(line: 3713, column: 66, scope: !3468)
!3477 = !DILocation(line: 3713, column: 46, scope: !3468)
!3478 = !DILocation(line: 3713, column: 10, scope: !3468)
!3479 = !DILocation(line: 3713, column: 3, scope: !3468)
!3480 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !70, file: !70, line: 3734, type: !472, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3481 = !DILocalVariable(name: "value", arg: 1, scope: !3480, file: !70, line: 3734, type: !13)
!3482 = !DILocation(line: 3734, column: 31, scope: !3480)
!3483 = !DILocalVariable(name: "factor", arg: 2, scope: !3480, file: !70, line: 3734, type: !24)
!3484 = !DILocation(line: 3734, column: 41, scope: !3480)
!3485 = !DILocation(line: 3736, column: 43, scope: !3480)
!3486 = !DILocation(line: 3736, column: 61, scope: !3480)
!3487 = !DILocation(line: 3736, column: 55, scope: !3480)
!3488 = !DILocation(line: 3736, column: 69, scope: !3480)
!3489 = !DILocation(line: 3736, column: 49, scope: !3480)
!3490 = !DILocation(line: 3736, column: 10, scope: !3480)
!3491 = !DILocation(line: 3736, column: 3, scope: !3480)
!3492 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !70, file: !70, line: 3757, type: !472, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3493 = !DILocalVariable(name: "value", arg: 1, scope: !3492, file: !70, line: 3757, type: !13)
!3494 = !DILocation(line: 3757, column: 30, scope: !3492)
!3495 = !DILocalVariable(name: "factor", arg: 2, scope: !3492, file: !70, line: 3757, type: !24)
!3496 = !DILocation(line: 3757, column: 40, scope: !3492)
!3497 = !DILocation(line: 3759, column: 43, scope: !3492)
!3498 = !DILocation(line: 3759, column: 61, scope: !3492)
!3499 = !DILocation(line: 3759, column: 55, scope: !3492)
!3500 = !DILocation(line: 3759, column: 69, scope: !3492)
!3501 = !DILocation(line: 3759, column: 49, scope: !3492)
!3502 = !DILocation(line: 3759, column: 10, scope: !3492)
!3503 = !DILocation(line: 3759, column: 3, scope: !3492)
!3504 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !70, file: !70, line: 3779, type: !472, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3505 = !DILocalVariable(name: "value", arg: 1, scope: !3504, file: !70, line: 3779, type: !13)
!3506 = !DILocation(line: 3779, column: 30, scope: !3504)
!3507 = !DILocalVariable(name: "factor", arg: 2, scope: !3504, file: !70, line: 3779, type: !24)
!3508 = !DILocation(line: 3779, column: 40, scope: !3504)
!3509 = !DILocation(line: 3781, column: 43, scope: !3504)
!3510 = !DILocation(line: 3781, column: 61, scope: !3504)
!3511 = !DILocation(line: 3781, column: 55, scope: !3504)
!3512 = !DILocation(line: 3781, column: 69, scope: !3504)
!3513 = !DILocation(line: 3781, column: 49, scope: !3504)
!3514 = !DILocation(line: 3781, column: 10, scope: !3504)
!3515 = !DILocation(line: 3781, column: 3, scope: !3504)
!3516 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !70, file: !70, line: 3801, type: !472, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3517 = !DILocalVariable(name: "value", arg: 1, scope: !3516, file: !70, line: 3801, type: !13)
!3518 = !DILocation(line: 3801, column: 29, scope: !3516)
!3519 = !DILocalVariable(name: "factor", arg: 2, scope: !3516, file: !70, line: 3801, type: !24)
!3520 = !DILocation(line: 3801, column: 39, scope: !3516)
!3521 = !DILocation(line: 3803, column: 43, scope: !3516)
!3522 = !DILocation(line: 3803, column: 61, scope: !3516)
!3523 = !DILocation(line: 3803, column: 55, scope: !3516)
!3524 = !DILocation(line: 3803, column: 69, scope: !3516)
!3525 = !DILocation(line: 3803, column: 49, scope: !3516)
!3526 = !DILocation(line: 3803, column: 10, scope: !3516)
!3527 = !DILocation(line: 3803, column: 3, scope: !3516)
!3528 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !70, file: !70, line: 3823, type: !472, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3529 = !DILocalVariable(name: "value", arg: 1, scope: !3528, file: !70, line: 3823, type: !13)
!3530 = !DILocation(line: 3823, column: 30, scope: !3528)
!3531 = !DILocalVariable(name: "factor", arg: 2, scope: !3528, file: !70, line: 3823, type: !24)
!3532 = !DILocation(line: 3823, column: 40, scope: !3528)
!3533 = !DILocation(line: 3825, column: 43, scope: !3528)
!3534 = !DILocation(line: 3825, column: 61, scope: !3528)
!3535 = !DILocation(line: 3825, column: 55, scope: !3528)
!3536 = !DILocation(line: 3825, column: 69, scope: !3528)
!3537 = !DILocation(line: 3825, column: 49, scope: !3528)
!3538 = !DILocation(line: 3825, column: 10, scope: !3528)
!3539 = !DILocation(line: 3825, column: 3, scope: !3528)
!3540 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !70, file: !70, line: 3845, type: !472, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3541 = !DILocalVariable(name: "value", arg: 1, scope: !3540, file: !70, line: 3845, type: !13)
!3542 = !DILocation(line: 3845, column: 29, scope: !3540)
!3543 = !DILocalVariable(name: "factor", arg: 2, scope: !3540, file: !70, line: 3845, type: !24)
!3544 = !DILocation(line: 3845, column: 39, scope: !3540)
!3545 = !DILocation(line: 3847, column: 43, scope: !3540)
!3546 = !DILocation(line: 3847, column: 61, scope: !3540)
!3547 = !DILocation(line: 3847, column: 55, scope: !3540)
!3548 = !DILocation(line: 3847, column: 69, scope: !3540)
!3549 = !DILocation(line: 3847, column: 49, scope: !3540)
!3550 = !DILocation(line: 3847, column: 10, scope: !3540)
!3551 = !DILocation(line: 3847, column: 3, scope: !3540)
!3552 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !70, file: !70, line: 3869, type: !1892, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3553 = !DILocalVariable(name: "value", arg: 1, scope: !3552, file: !70, line: 3869, type: !20)
!3554 = !DILocation(line: 3869, column: 31, scope: !3552)
!3555 = !DILocalVariable(name: "factor", arg: 2, scope: !3552, file: !70, line: 3869, type: !13)
!3556 = !DILocation(line: 3869, column: 42, scope: !3552)
!3557 = !DILocation(line: 3871, column: 41, scope: !3552)
!3558 = !DILocation(line: 3871, column: 47, scope: !3552)
!3559 = !DILocation(line: 3871, column: 10, scope: !3552)
!3560 = !DILocation(line: 3871, column: 3, scope: !3552)
!3561 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !70, file: !70, line: 5065, type: !3562, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3562 = !DISubroutineType(types: !3563)
!3563 = !{!20, !20, !13, !733}
!3564 = !DILocalVariable(name: "value", arg: 1, scope: !3561, file: !70, line: 5065, type: !20)
!3565 = !DILocation(line: 5065, column: 40, scope: !3561)
!3566 = !DILocalVariable(name: "factor", arg: 2, scope: !3561, file: !70, line: 5065, type: !13)
!3567 = !DILocation(line: 5065, column: 51, scope: !3561)
!3568 = !DILocalVariable(name: "count", arg: 3, scope: !3561, file: !70, line: 5065, type: !733)
!3569 = !DILocation(line: 5065, column: 63, scope: !3561)
!3570 = !DILocalVariable(name: "u32Temp1", scope: !3561, file: !70, line: 5067, type: !733)
!3571 = !DILocation(line: 5067, column: 6, scope: !3561)
!3572 = !DILocalVariable(name: "u32Temp2", scope: !3561, file: !70, line: 5067, type: !733)
!3573 = !DILocation(line: 5067, column: 17, scope: !3561)
!3574 = !DILocalVariable(name: "u32Temp3", scope: !3561, file: !70, line: 5067, type: !733)
!3575 = !DILocation(line: 5067, column: 26, scope: !3561)
!3576 = !DILocalVariable(name: "u32Temp4", scope: !3561, file: !70, line: 5067, type: !733)
!3577 = !DILocation(line: 5067, column: 35, scope: !3561)
!3578 = !DILocalVariable(name: "u8SignBit", scope: !3561, file: !70, line: 5068, type: !24)
!3579 = !DILocation(line: 5068, column: 5, scope: !3561)
!3580 = !DILocation(line: 5070, column: 7, scope: !3581)
!3581 = distinct !DILexicalBlock(scope: !3561, file: !70, line: 5070, column: 5)
!3582 = !DILocation(line: 5070, column: 12, scope: !3581)
!3583 = !DILocation(line: 5070, column: 16, scope: !3581)
!3584 = !DILocation(line: 5070, column: 20, scope: !3581)
!3585 = !DILocation(line: 5070, column: 26, scope: !3581)
!3586 = !DILocation(line: 5070, column: 31, scope: !3581)
!3587 = !DILocation(line: 5070, column: 36, scope: !3581)
!3588 = !DILocation(line: 5070, column: 41, scope: !3581)
!3589 = !DILocation(line: 5070, column: 45, scope: !3581)
!3590 = !DILocation(line: 5070, column: 49, scope: !3581)
!3591 = !DILocation(line: 5070, column: 55, scope: !3581)
!3592 = !DILocation(line: 5070, column: 5, scope: !3561)
!3593 = !DILocation(line: 5072, column: 13, scope: !3594)
!3594 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5071, column: 2)
!3595 = !DILocation(line: 5073, column: 2, scope: !3594)
!3596 = !DILocation(line: 5076, column: 13, scope: !3597)
!3597 = distinct !DILexicalBlock(scope: !3581, file: !70, line: 5075, column: 2)
!3598 = !DILocation(line: 5079, column: 5, scope: !3599)
!3599 = distinct !DILexicalBlock(scope: !3561, file: !70, line: 5079, column: 5)
!3600 = !DILocation(line: 5079, column: 10, scope: !3599)
!3601 = !DILocation(line: 5079, column: 5, scope: !3561)
!3602 = !DILocation(line: 5081, column: 15, scope: !3603)
!3603 = distinct !DILexicalBlock(scope: !3599, file: !70, line: 5080, column: 2)
!3604 = !DILocation(line: 5081, column: 14, scope: !3603)
!3605 = !DILocation(line: 5081, column: 12, scope: !3603)
!3606 = !DILocation(line: 5082, column: 2, scope: !3603)
!3607 = !DILocation(line: 5085, column: 14, scope: !3608)
!3608 = distinct !DILexicalBlock(scope: !3599, file: !70, line: 5084, column: 2)
!3609 = !DILocation(line: 5085, column: 12, scope: !3608)
!3610 = !DILocation(line: 5088, column: 5, scope: !3611)
!3611 = distinct !DILexicalBlock(scope: !3561, file: !70, line: 5088, column: 5)
!3612 = !DILocation(line: 5088, column: 11, scope: !3611)
!3613 = !DILocation(line: 5088, column: 5, scope: !3561)
!3614 = !DILocation(line: 5090, column: 15, scope: !3615)
!3615 = distinct !DILexicalBlock(scope: !3611, file: !70, line: 5089, column: 2)
!3616 = !DILocation(line: 5090, column: 14, scope: !3615)
!3617 = !DILocation(line: 5090, column: 12, scope: !3615)
!3618 = !DILocation(line: 5091, column: 2, scope: !3615)
!3619 = !DILocation(line: 5094, column: 14, scope: !3620)
!3620 = distinct !DILexicalBlock(scope: !3611, file: !70, line: 5093, column: 2)
!3621 = !DILocation(line: 5094, column: 12, scope: !3620)
!3622 = !DILocation(line: 5097, column: 13, scope: !3561)
!3623 = !DILocation(line: 5097, column: 24, scope: !3561)
!3624 = !DILocation(line: 5097, column: 22, scope: !3561)
!3625 = !DILocation(line: 5097, column: 11, scope: !3561)
!3626 = !DILocation(line: 5098, column: 25, scope: !3561)
!3627 = !DILocation(line: 5098, column: 35, scope: !3561)
!3628 = !DILocation(line: 5098, column: 13, scope: !3561)
!3629 = !DILocation(line: 5098, column: 11, scope: !3561)
!3630 = !DILocation(line: 5099, column: 13, scope: !3561)
!3631 = !DILocation(line: 5099, column: 25, scope: !3561)
!3632 = !DILocation(line: 5099, column: 22, scope: !3561)
!3633 = !DILocation(line: 5099, column: 11, scope: !3561)
!3634 = !DILocation(line: 5100, column: 14, scope: !3561)
!3635 = !DILocation(line: 5100, column: 30, scope: !3561)
!3636 = !DILocation(line: 5100, column: 29, scope: !3561)
!3637 = !DILocation(line: 5100, column: 23, scope: !3561)
!3638 = !DILocation(line: 5100, column: 11, scope: !3561)
!3639 = !DILocation(line: 5101, column: 6, scope: !3640)
!3640 = distinct !DILexicalBlock(scope: !3561, file: !70, line: 5101, column: 5)
!3641 = !DILocation(line: 5101, column: 16, scope: !3640)
!3642 = !DILocation(line: 5101, column: 14, scope: !3640)
!3643 = !DILocation(line: 5101, column: 22, scope: !3640)
!3644 = !DILocation(line: 5101, column: 5, scope: !3561)
!3645 = !DILocation(line: 5103, column: 6, scope: !3646)
!3646 = distinct !DILexicalBlock(scope: !3647, file: !70, line: 5103, column: 6)
!3647 = distinct !DILexicalBlock(scope: !3640, file: !70, line: 5102, column: 2)
!3648 = !DILocation(line: 5103, column: 16, scope: !3646)
!3649 = !DILocation(line: 5103, column: 6, scope: !3647)
!3650 = !DILocation(line: 5105, column: 7, scope: !3651)
!3651 = distinct !DILexicalBlock(scope: !3652, file: !70, line: 5105, column: 7)
!3652 = distinct !DILexicalBlock(scope: !3646, file: !70, line: 5104, column: 3)
!3653 = !DILocation(line: 5105, column: 15, scope: !3651)
!3654 = !DILocation(line: 5105, column: 7, scope: !3652)
!3655 = !DILocation(line: 5106, column: 12, scope: !3651)
!3656 = !DILocation(line: 5106, column: 5, scope: !3651)
!3657 = !DILocation(line: 5108, column: 5, scope: !3651)
!3658 = !DILocation(line: 5112, column: 7, scope: !3659)
!3659 = distinct !DILexicalBlock(scope: !3660, file: !70, line: 5112, column: 7)
!3660 = distinct !DILexicalBlock(scope: !3646, file: !70, line: 5111, column: 3)
!3661 = !DILocation(line: 5112, column: 15, scope: !3659)
!3662 = !DILocation(line: 5112, column: 7, scope: !3660)
!3663 = !DILocation(line: 5113, column: 13, scope: !3659)
!3664 = !DILocation(line: 5113, column: 12, scope: !3659)
!3665 = !DILocation(line: 5113, column: 5, scope: !3659)
!3666 = !DILocation(line: 5115, column: 5, scope: !3659)
!3667 = !DILocation(line: 5120, column: 3, scope: !3668)
!3668 = distinct !DILexicalBlock(scope: !3640, file: !70, line: 5119, column: 2)
!3669 = !DILocation(line: 5122, column: 1, scope: !3561)
!3670 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !70, file: !70, line: 3893, type: !2661, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3671 = !DILocalVariable(name: "value", arg: 1, scope: !3670, file: !70, line: 3893, type: !20)
!3672 = !DILocation(line: 3893, column: 30, scope: !3670)
!3673 = !DILocalVariable(name: "factor", arg: 2, scope: !3670, file: !70, line: 3893, type: !6)
!3674 = !DILocation(line: 3893, column: 40, scope: !3670)
!3675 = !DILocation(line: 3895, column: 40, scope: !3670)
!3676 = !DILocation(line: 3895, column: 46, scope: !3670)
!3677 = !DILocation(line: 3895, column: 10, scope: !3670)
!3678 = !DILocation(line: 3895, column: 3, scope: !3670)
!3679 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !70, file: !70, line: 5217, type: !3680, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3680 = !DISubroutineType(types: !3681)
!3681 = !{!20, !20, !6, !733}
!3682 = !DILocalVariable(name: "value", arg: 1, scope: !3679, file: !70, line: 5217, type: !20)
!3683 = !DILocation(line: 5217, column: 39, scope: !3679)
!3684 = !DILocalVariable(name: "factor", arg: 2, scope: !3679, file: !70, line: 5217, type: !6)
!3685 = !DILocation(line: 5217, column: 49, scope: !3679)
!3686 = !DILocalVariable(name: "count", arg: 3, scope: !3679, file: !70, line: 5217, type: !733)
!3687 = !DILocation(line: 5217, column: 61, scope: !3679)
!3688 = !DILocalVariable(name: "u32Temp1", scope: !3679, file: !70, line: 5219, type: !733)
!3689 = !DILocation(line: 5219, column: 6, scope: !3679)
!3690 = !DILocalVariable(name: "u32Temp2", scope: !3679, file: !70, line: 5219, type: !733)
!3691 = !DILocation(line: 5219, column: 17, scope: !3679)
!3692 = !DILocalVariable(name: "u32Temp3", scope: !3679, file: !70, line: 5219, type: !733)
!3693 = !DILocation(line: 5219, column: 26, scope: !3679)
!3694 = !DILocalVariable(name: "u32Temp4", scope: !3679, file: !70, line: 5219, type: !733)
!3695 = !DILocation(line: 5219, column: 35, scope: !3679)
!3696 = !DILocalVariable(name: "u8SignBit", scope: !3679, file: !70, line: 5220, type: !24)
!3697 = !DILocation(line: 5220, column: 5, scope: !3679)
!3698 = !DILocation(line: 5222, column: 7, scope: !3699)
!3699 = distinct !DILexicalBlock(scope: !3679, file: !70, line: 5222, column: 5)
!3700 = !DILocation(line: 5222, column: 12, scope: !3699)
!3701 = !DILocation(line: 5222, column: 16, scope: !3699)
!3702 = !DILocation(line: 5222, column: 20, scope: !3699)
!3703 = !DILocation(line: 5222, column: 26, scope: !3699)
!3704 = !DILocation(line: 5222, column: 31, scope: !3699)
!3705 = !DILocation(line: 5222, column: 36, scope: !3699)
!3706 = !DILocation(line: 5222, column: 41, scope: !3699)
!3707 = !DILocation(line: 5222, column: 45, scope: !3699)
!3708 = !DILocation(line: 5222, column: 49, scope: !3699)
!3709 = !DILocation(line: 5222, column: 55, scope: !3699)
!3710 = !DILocation(line: 5222, column: 5, scope: !3679)
!3711 = !DILocation(line: 5224, column: 13, scope: !3712)
!3712 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5223, column: 2)
!3713 = !DILocation(line: 5225, column: 2, scope: !3712)
!3714 = !DILocation(line: 5228, column: 13, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3699, file: !70, line: 5227, column: 2)
!3716 = !DILocation(line: 5231, column: 5, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3679, file: !70, line: 5231, column: 5)
!3718 = !DILocation(line: 5231, column: 10, scope: !3717)
!3719 = !DILocation(line: 5231, column: 5, scope: !3679)
!3720 = !DILocation(line: 5233, column: 15, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3717, file: !70, line: 5232, column: 2)
!3722 = !DILocation(line: 5233, column: 14, scope: !3721)
!3723 = !DILocation(line: 5233, column: 12, scope: !3721)
!3724 = !DILocation(line: 5234, column: 2, scope: !3721)
!3725 = !DILocation(line: 5237, column: 14, scope: !3726)
!3726 = distinct !DILexicalBlock(scope: !3717, file: !70, line: 5236, column: 2)
!3727 = !DILocation(line: 5237, column: 12, scope: !3726)
!3728 = !DILocation(line: 5240, column: 5, scope: !3729)
!3729 = distinct !DILexicalBlock(scope: !3679, file: !70, line: 5240, column: 5)
!3730 = !DILocation(line: 5240, column: 11, scope: !3729)
!3731 = !DILocation(line: 5240, column: 5, scope: !3679)
!3732 = !DILocation(line: 5242, column: 15, scope: !3733)
!3733 = distinct !DILexicalBlock(scope: !3729, file: !70, line: 5241, column: 2)
!3734 = !DILocation(line: 5242, column: 14, scope: !3733)
!3735 = !DILocation(line: 5242, column: 12, scope: !3733)
!3736 = !DILocation(line: 5243, column: 2, scope: !3733)
!3737 = !DILocation(line: 5246, column: 14, scope: !3738)
!3738 = distinct !DILexicalBlock(scope: !3729, file: !70, line: 5245, column: 2)
!3739 = !DILocation(line: 5246, column: 12, scope: !3738)
!3740 = !DILocation(line: 5249, column: 13, scope: !3679)
!3741 = !DILocation(line: 5249, column: 24, scope: !3679)
!3742 = !DILocation(line: 5249, column: 22, scope: !3679)
!3743 = !DILocation(line: 5249, column: 11, scope: !3679)
!3744 = !DILocation(line: 5250, column: 25, scope: !3679)
!3745 = !DILocation(line: 5250, column: 35, scope: !3679)
!3746 = !DILocation(line: 5250, column: 13, scope: !3679)
!3747 = !DILocation(line: 5250, column: 11, scope: !3679)
!3748 = !DILocation(line: 5251, column: 13, scope: !3679)
!3749 = !DILocation(line: 5251, column: 25, scope: !3679)
!3750 = !DILocation(line: 5251, column: 22, scope: !3679)
!3751 = !DILocation(line: 5251, column: 11, scope: !3679)
!3752 = !DILocation(line: 5252, column: 14, scope: !3679)
!3753 = !DILocation(line: 5252, column: 30, scope: !3679)
!3754 = !DILocation(line: 5252, column: 29, scope: !3679)
!3755 = !DILocation(line: 5252, column: 23, scope: !3679)
!3756 = !DILocation(line: 5252, column: 11, scope: !3679)
!3757 = !DILocation(line: 5253, column: 6, scope: !3758)
!3758 = distinct !DILexicalBlock(scope: !3679, file: !70, line: 5253, column: 5)
!3759 = !DILocation(line: 5253, column: 16, scope: !3758)
!3760 = !DILocation(line: 5253, column: 14, scope: !3758)
!3761 = !DILocation(line: 5253, column: 22, scope: !3758)
!3762 = !DILocation(line: 5253, column: 5, scope: !3679)
!3763 = !DILocation(line: 5255, column: 6, scope: !3764)
!3764 = distinct !DILexicalBlock(scope: !3765, file: !70, line: 5255, column: 6)
!3765 = distinct !DILexicalBlock(scope: !3758, file: !70, line: 5254, column: 2)
!3766 = !DILocation(line: 5255, column: 16, scope: !3764)
!3767 = !DILocation(line: 5255, column: 6, scope: !3765)
!3768 = !DILocation(line: 5257, column: 7, scope: !3769)
!3769 = distinct !DILexicalBlock(scope: !3770, file: !70, line: 5257, column: 7)
!3770 = distinct !DILexicalBlock(scope: !3764, file: !70, line: 5256, column: 3)
!3771 = !DILocation(line: 5257, column: 15, scope: !3769)
!3772 = !DILocation(line: 5257, column: 7, scope: !3770)
!3773 = !DILocation(line: 5258, column: 12, scope: !3769)
!3774 = !DILocation(line: 5258, column: 5, scope: !3769)
!3775 = !DILocation(line: 5260, column: 5, scope: !3769)
!3776 = !DILocation(line: 5264, column: 7, scope: !3777)
!3777 = distinct !DILexicalBlock(scope: !3778, file: !70, line: 5264, column: 7)
!3778 = distinct !DILexicalBlock(scope: !3764, file: !70, line: 5263, column: 3)
!3779 = !DILocation(line: 5264, column: 15, scope: !3777)
!3780 = !DILocation(line: 5264, column: 7, scope: !3778)
!3781 = !DILocation(line: 5265, column: 13, scope: !3777)
!3782 = !DILocation(line: 5265, column: 12, scope: !3777)
!3783 = !DILocation(line: 5265, column: 5, scope: !3777)
!3784 = !DILocation(line: 5267, column: 5, scope: !3777)
!3785 = !DILocation(line: 5272, column: 3, scope: !3786)
!3786 = distinct !DILexicalBlock(scope: !3758, file: !70, line: 5271, column: 2)
!3787 = !DILocation(line: 5274, column: 1, scope: !3679)
!3788 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !70, file: !70, line: 3917, type: !772, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3789 = !DILocalVariable(name: "value", arg: 1, scope: !3788, file: !70, line: 3917, type: !20)
!3790 = !DILocation(line: 3917, column: 31, scope: !3788)
!3791 = !DILocalVariable(name: "factor", arg: 2, scope: !3788, file: !70, line: 3917, type: !29)
!3792 = !DILocation(line: 3917, column: 42, scope: !3788)
!3793 = !DILocation(line: 3919, column: 41, scope: !3788)
!3794 = !DILocation(line: 3919, column: 47, scope: !3788)
!3795 = !DILocation(line: 3919, column: 10, scope: !3788)
!3796 = !DILocation(line: 3919, column: 3, scope: !3788)
!3797 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !70, file: !70, line: 5141, type: !3798, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3798 = !DISubroutineType(types: !3799)
!3799 = !{!20, !20, !29, !733}
!3800 = !DILocalVariable(name: "value", arg: 1, scope: !3797, file: !70, line: 5141, type: !20)
!3801 = !DILocation(line: 5141, column: 40, scope: !3797)
!3802 = !DILocalVariable(name: "factor", arg: 2, scope: !3797, file: !70, line: 5141, type: !29)
!3803 = !DILocation(line: 5141, column: 50, scope: !3797)
!3804 = !DILocalVariable(name: "count", arg: 3, scope: !3797, file: !70, line: 5141, type: !733)
!3805 = !DILocation(line: 5141, column: 62, scope: !3797)
!3806 = !DILocalVariable(name: "u32Temp1", scope: !3797, file: !70, line: 5143, type: !733)
!3807 = !DILocation(line: 5143, column: 6, scope: !3797)
!3808 = !DILocalVariable(name: "u32Temp2", scope: !3797, file: !70, line: 5143, type: !733)
!3809 = !DILocation(line: 5143, column: 17, scope: !3797)
!3810 = !DILocalVariable(name: "u32Temp3", scope: !3797, file: !70, line: 5143, type: !733)
!3811 = !DILocation(line: 5143, column: 26, scope: !3797)
!3812 = !DILocalVariable(name: "u32Temp4", scope: !3797, file: !70, line: 5143, type: !733)
!3813 = !DILocation(line: 5143, column: 35, scope: !3797)
!3814 = !DILocalVariable(name: "u8SignBit", scope: !3797, file: !70, line: 5144, type: !24)
!3815 = !DILocation(line: 5144, column: 5, scope: !3797)
!3816 = !DILocation(line: 5146, column: 7, scope: !3817)
!3817 = distinct !DILexicalBlock(scope: !3797, file: !70, line: 5146, column: 5)
!3818 = !DILocation(line: 5146, column: 12, scope: !3817)
!3819 = !DILocation(line: 5146, column: 16, scope: !3817)
!3820 = !DILocation(line: 5146, column: 20, scope: !3817)
!3821 = !DILocation(line: 5146, column: 26, scope: !3817)
!3822 = !DILocation(line: 5146, column: 31, scope: !3817)
!3823 = !DILocation(line: 5146, column: 36, scope: !3817)
!3824 = !DILocation(line: 5146, column: 41, scope: !3817)
!3825 = !DILocation(line: 5146, column: 45, scope: !3817)
!3826 = !DILocation(line: 5146, column: 49, scope: !3817)
!3827 = !DILocation(line: 5146, column: 55, scope: !3817)
!3828 = !DILocation(line: 5146, column: 5, scope: !3797)
!3829 = !DILocation(line: 5148, column: 13, scope: !3830)
!3830 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5147, column: 2)
!3831 = !DILocation(line: 5149, column: 2, scope: !3830)
!3832 = !DILocation(line: 5152, column: 13, scope: !3833)
!3833 = distinct !DILexicalBlock(scope: !3817, file: !70, line: 5151, column: 2)
!3834 = !DILocation(line: 5155, column: 5, scope: !3835)
!3835 = distinct !DILexicalBlock(scope: !3797, file: !70, line: 5155, column: 5)
!3836 = !DILocation(line: 5155, column: 10, scope: !3835)
!3837 = !DILocation(line: 5155, column: 5, scope: !3797)
!3838 = !DILocation(line: 5157, column: 15, scope: !3839)
!3839 = distinct !DILexicalBlock(scope: !3835, file: !70, line: 5156, column: 2)
!3840 = !DILocation(line: 5157, column: 14, scope: !3839)
!3841 = !DILocation(line: 5157, column: 12, scope: !3839)
!3842 = !DILocation(line: 5158, column: 2, scope: !3839)
!3843 = !DILocation(line: 5161, column: 14, scope: !3844)
!3844 = distinct !DILexicalBlock(scope: !3835, file: !70, line: 5160, column: 2)
!3845 = !DILocation(line: 5161, column: 12, scope: !3844)
!3846 = !DILocation(line: 5164, column: 5, scope: !3847)
!3847 = distinct !DILexicalBlock(scope: !3797, file: !70, line: 5164, column: 5)
!3848 = !DILocation(line: 5164, column: 11, scope: !3847)
!3849 = !DILocation(line: 5164, column: 5, scope: !3797)
!3850 = !DILocation(line: 5166, column: 15, scope: !3851)
!3851 = distinct !DILexicalBlock(scope: !3847, file: !70, line: 5165, column: 2)
!3852 = !DILocation(line: 5166, column: 14, scope: !3851)
!3853 = !DILocation(line: 5166, column: 12, scope: !3851)
!3854 = !DILocation(line: 5167, column: 2, scope: !3851)
!3855 = !DILocation(line: 5170, column: 14, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3847, file: !70, line: 5169, column: 2)
!3857 = !DILocation(line: 5170, column: 12, scope: !3856)
!3858 = !DILocation(line: 5173, column: 13, scope: !3797)
!3859 = !DILocation(line: 5173, column: 24, scope: !3797)
!3860 = !DILocation(line: 5173, column: 22, scope: !3797)
!3861 = !DILocation(line: 5173, column: 11, scope: !3797)
!3862 = !DILocation(line: 5174, column: 25, scope: !3797)
!3863 = !DILocation(line: 5174, column: 35, scope: !3797)
!3864 = !DILocation(line: 5174, column: 13, scope: !3797)
!3865 = !DILocation(line: 5174, column: 11, scope: !3797)
!3866 = !DILocation(line: 5175, column: 13, scope: !3797)
!3867 = !DILocation(line: 5175, column: 25, scope: !3797)
!3868 = !DILocation(line: 5175, column: 22, scope: !3797)
!3869 = !DILocation(line: 5175, column: 11, scope: !3797)
!3870 = !DILocation(line: 5176, column: 14, scope: !3797)
!3871 = !DILocation(line: 5176, column: 30, scope: !3797)
!3872 = !DILocation(line: 5176, column: 29, scope: !3797)
!3873 = !DILocation(line: 5176, column: 23, scope: !3797)
!3874 = !DILocation(line: 5176, column: 11, scope: !3797)
!3875 = !DILocation(line: 5177, column: 6, scope: !3876)
!3876 = distinct !DILexicalBlock(scope: !3797, file: !70, line: 5177, column: 5)
!3877 = !DILocation(line: 5177, column: 16, scope: !3876)
!3878 = !DILocation(line: 5177, column: 14, scope: !3876)
!3879 = !DILocation(line: 5177, column: 22, scope: !3876)
!3880 = !DILocation(line: 5177, column: 5, scope: !3797)
!3881 = !DILocation(line: 5179, column: 6, scope: !3882)
!3882 = distinct !DILexicalBlock(scope: !3883, file: !70, line: 5179, column: 6)
!3883 = distinct !DILexicalBlock(scope: !3876, file: !70, line: 5178, column: 2)
!3884 = !DILocation(line: 5179, column: 16, scope: !3882)
!3885 = !DILocation(line: 5179, column: 6, scope: !3883)
!3886 = !DILocation(line: 5181, column: 7, scope: !3887)
!3887 = distinct !DILexicalBlock(scope: !3888, file: !70, line: 5181, column: 7)
!3888 = distinct !DILexicalBlock(scope: !3882, file: !70, line: 5180, column: 3)
!3889 = !DILocation(line: 5181, column: 15, scope: !3887)
!3890 = !DILocation(line: 5181, column: 7, scope: !3888)
!3891 = !DILocation(line: 5182, column: 12, scope: !3887)
!3892 = !DILocation(line: 5182, column: 5, scope: !3887)
!3893 = !DILocation(line: 5184, column: 5, scope: !3887)
!3894 = !DILocation(line: 5188, column: 7, scope: !3895)
!3895 = distinct !DILexicalBlock(scope: !3896, file: !70, line: 5188, column: 7)
!3896 = distinct !DILexicalBlock(scope: !3882, file: !70, line: 5187, column: 3)
!3897 = !DILocation(line: 5188, column: 15, scope: !3895)
!3898 = !DILocation(line: 5188, column: 7, scope: !3896)
!3899 = !DILocation(line: 5189, column: 13, scope: !3895)
!3900 = !DILocation(line: 5189, column: 12, scope: !3895)
!3901 = !DILocation(line: 5189, column: 5, scope: !3895)
!3902 = !DILocation(line: 5191, column: 5, scope: !3895)
!3903 = !DILocation(line: 5196, column: 3, scope: !3904)
!3904 = distinct !DILexicalBlock(scope: !3876, file: !70, line: 5195, column: 2)
!3905 = !DILocation(line: 5198, column: 1, scope: !3797)
!3906 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !70, file: !70, line: 3941, type: !2366, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3907 = !DILocalVariable(name: "value", arg: 1, scope: !3906, file: !70, line: 3941, type: !20)
!3908 = !DILocation(line: 3941, column: 30, scope: !3906)
!3909 = !DILocalVariable(name: "factor", arg: 2, scope: !3906, file: !70, line: 3941, type: !24)
!3910 = !DILocation(line: 3941, column: 40, scope: !3906)
!3911 = !DILocation(line: 3943, column: 40, scope: !3906)
!3912 = !DILocation(line: 3943, column: 46, scope: !3906)
!3913 = !DILocation(line: 3943, column: 10, scope: !3906)
!3914 = !DILocation(line: 3943, column: 3, scope: !3906)
!3915 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !70, file: !70, line: 5536, type: !3916, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3916 = !DISubroutineType(types: !3917)
!3917 = !{!20, !20, !24, !733}
!3918 = !DILocalVariable(name: "value", arg: 1, scope: !3915, file: !70, line: 5536, type: !20)
!3919 = !DILocation(line: 5536, column: 39, scope: !3915)
!3920 = !DILocalVariable(name: "factor", arg: 2, scope: !3915, file: !70, line: 5536, type: !24)
!3921 = !DILocation(line: 5536, column: 49, scope: !3915)
!3922 = !DILocalVariable(name: "count", arg: 3, scope: !3915, file: !70, line: 5536, type: !733)
!3923 = !DILocation(line: 5536, column: 61, scope: !3915)
!3924 = !DILocalVariable(name: "u32Temp1", scope: !3915, file: !70, line: 5538, type: !733)
!3925 = !DILocation(line: 5538, column: 6, scope: !3915)
!3926 = !DILocalVariable(name: "u32Temp2", scope: !3915, file: !70, line: 5538, type: !733)
!3927 = !DILocation(line: 5538, column: 17, scope: !3915)
!3928 = !DILocalVariable(name: "u32Temp3", scope: !3915, file: !70, line: 5538, type: !733)
!3929 = !DILocation(line: 5538, column: 26, scope: !3915)
!3930 = !DILocalVariable(name: "u8SignBit", scope: !3915, file: !70, line: 5539, type: !24)
!3931 = !DILocation(line: 5539, column: 5, scope: !3915)
!3932 = !DILocation(line: 5541, column: 5, scope: !3933)
!3933 = distinct !DILexicalBlock(scope: !3915, file: !70, line: 5541, column: 5)
!3934 = !DILocation(line: 5541, column: 10, scope: !3933)
!3935 = !DILocation(line: 5541, column: 5, scope: !3915)
!3936 = !DILocation(line: 5543, column: 13, scope: !3937)
!3937 = distinct !DILexicalBlock(scope: !3933, file: !70, line: 5542, column: 2)
!3938 = !DILocation(line: 5544, column: 15, scope: !3937)
!3939 = !DILocation(line: 5544, column: 14, scope: !3937)
!3940 = !DILocation(line: 5544, column: 12, scope: !3937)
!3941 = !DILocation(line: 5545, column: 2, scope: !3937)
!3942 = !DILocation(line: 5548, column: 13, scope: !3943)
!3943 = distinct !DILexicalBlock(scope: !3933, file: !70, line: 5547, column: 2)
!3944 = !DILocation(line: 5549, column: 14, scope: !3943)
!3945 = !DILocation(line: 5549, column: 12, scope: !3943)
!3946 = !DILocation(line: 5552, column: 13, scope: !3915)
!3947 = !DILocation(line: 5552, column: 24, scope: !3915)
!3948 = !DILocation(line: 5552, column: 22, scope: !3915)
!3949 = !DILocation(line: 5552, column: 11, scope: !3915)
!3950 = !DILocation(line: 5553, column: 25, scope: !3915)
!3951 = !DILocation(line: 5553, column: 34, scope: !3915)
!3952 = !DILocation(line: 5553, column: 13, scope: !3915)
!3953 = !DILocation(line: 5553, column: 11, scope: !3915)
!3954 = !DILocation(line: 5554, column: 13, scope: !3915)
!3955 = !DILocation(line: 5554, column: 25, scope: !3915)
!3956 = !DILocation(line: 5554, column: 22, scope: !3915)
!3957 = !DILocation(line: 5554, column: 11, scope: !3915)
!3958 = !DILocation(line: 5555, column: 14, scope: !3915)
!3959 = !DILocation(line: 5555, column: 30, scope: !3915)
!3960 = !DILocation(line: 5555, column: 29, scope: !3915)
!3961 = !DILocation(line: 5555, column: 23, scope: !3915)
!3962 = !DILocation(line: 5555, column: 11, scope: !3915)
!3963 = !DILocation(line: 5556, column: 6, scope: !3964)
!3964 = distinct !DILexicalBlock(scope: !3915, file: !70, line: 5556, column: 5)
!3965 = !DILocation(line: 5556, column: 16, scope: !3964)
!3966 = !DILocation(line: 5556, column: 14, scope: !3964)
!3967 = !DILocation(line: 5556, column: 22, scope: !3964)
!3968 = !DILocation(line: 5556, column: 5, scope: !3915)
!3969 = !DILocation(line: 5558, column: 6, scope: !3970)
!3970 = distinct !DILexicalBlock(scope: !3971, file: !70, line: 5558, column: 6)
!3971 = distinct !DILexicalBlock(scope: !3964, file: !70, line: 5557, column: 2)
!3972 = !DILocation(line: 5558, column: 16, scope: !3970)
!3973 = !DILocation(line: 5558, column: 6, scope: !3971)
!3974 = !DILocation(line: 5560, column: 7, scope: !3975)
!3975 = distinct !DILexicalBlock(scope: !3976, file: !70, line: 5560, column: 7)
!3976 = distinct !DILexicalBlock(scope: !3970, file: !70, line: 5559, column: 3)
!3977 = !DILocation(line: 5560, column: 15, scope: !3975)
!3978 = !DILocation(line: 5560, column: 7, scope: !3976)
!3979 = !DILocation(line: 5561, column: 12, scope: !3975)
!3980 = !DILocation(line: 5561, column: 5, scope: !3975)
!3981 = !DILocation(line: 5563, column: 5, scope: !3975)
!3982 = !DILocation(line: 5567, column: 7, scope: !3983)
!3983 = distinct !DILexicalBlock(scope: !3984, file: !70, line: 5567, column: 7)
!3984 = distinct !DILexicalBlock(scope: !3970, file: !70, line: 5566, column: 3)
!3985 = !DILocation(line: 5567, column: 15, scope: !3983)
!3986 = !DILocation(line: 5567, column: 7, scope: !3984)
!3987 = !DILocation(line: 5569, column: 13, scope: !3988)
!3988 = distinct !DILexicalBlock(scope: !3983, file: !70, line: 5568, column: 4)
!3989 = !DILocation(line: 5569, column: 12, scope: !3988)
!3990 = !DILocation(line: 5569, column: 5, scope: !3988)
!3991 = !DILocation(line: 5573, column: 5, scope: !3992)
!3992 = distinct !DILexicalBlock(scope: !3983, file: !70, line: 5572, column: 4)
!3993 = !DILocation(line: 5579, column: 6, scope: !3994)
!3994 = distinct !DILexicalBlock(scope: !3995, file: !70, line: 5579, column: 6)
!3995 = distinct !DILexicalBlock(scope: !3964, file: !70, line: 5578, column: 2)
!3996 = !DILocation(line: 5579, column: 16, scope: !3994)
!3997 = !DILocation(line: 5579, column: 6, scope: !3995)
!3998 = !DILocation(line: 5581, column: 4, scope: !3999)
!3999 = distinct !DILexicalBlock(scope: !3994, file: !70, line: 5580, column: 3)
!4000 = !DILocation(line: 5585, column: 4, scope: !4001)
!4001 = distinct !DILexicalBlock(scope: !3994, file: !70, line: 5584, column: 3)
!4002 = !DILocation(line: 5588, column: 1, scope: !3915)
!4003 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !70, file: !70, line: 3965, type: !156, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4004 = !DILocalVariable(name: "value", arg: 1, scope: !4003, file: !70, line: 3965, type: !6)
!4005 = !DILocation(line: 3965, column: 28, scope: !4003)
!4006 = !DILocalVariable(name: "factor", arg: 2, scope: !4003, file: !70, line: 3965, type: !24)
!4007 = !DILocation(line: 3965, column: 38, scope: !4003)
!4008 = !DILocation(line: 3967, column: 38, scope: !4003)
!4009 = !DILocation(line: 3967, column: 56, scope: !4003)
!4010 = !DILocation(line: 3967, column: 50, scope: !4003)
!4011 = !DILocation(line: 3967, column: 64, scope: !4003)
!4012 = !DILocation(line: 3967, column: 44, scope: !4003)
!4013 = !DILocation(line: 3967, column: 10, scope: !4003)
!4014 = !DILocation(line: 3967, column: 3, scope: !4003)
!4015 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !70, file: !70, line: 3989, type: !156, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4016 = !DILocalVariable(name: "value", arg: 1, scope: !4015, file: !70, line: 3989, type: !6)
!4017 = !DILocation(line: 3989, column: 27, scope: !4015)
!4018 = !DILocalVariable(name: "factor", arg: 2, scope: !4015, file: !70, line: 3989, type: !24)
!4019 = !DILocation(line: 3989, column: 37, scope: !4015)
!4020 = !DILocation(line: 3991, column: 38, scope: !4015)
!4021 = !DILocation(line: 3991, column: 56, scope: !4015)
!4022 = !DILocation(line: 3991, column: 50, scope: !4015)
!4023 = !DILocation(line: 3991, column: 64, scope: !4015)
!4024 = !DILocation(line: 3991, column: 44, scope: !4015)
!4025 = !DILocation(line: 3991, column: 10, scope: !4015)
!4026 = !DILocation(line: 3991, column: 3, scope: !4015)
!4027 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !70, file: !70, line: 4014, type: !156, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4028 = !DILocalVariable(name: "value", arg: 1, scope: !4027, file: !70, line: 4014, type: !6)
!4029 = !DILocation(line: 4014, column: 26, scope: !4027)
!4030 = !DILocalVariable(name: "factor", arg: 2, scope: !4027, file: !70, line: 4014, type: !24)
!4031 = !DILocation(line: 4014, column: 36, scope: !4027)
!4032 = !DILocation(line: 4016, column: 38, scope: !4027)
!4033 = !DILocation(line: 4016, column: 56, scope: !4027)
!4034 = !DILocation(line: 4016, column: 50, scope: !4027)
!4035 = !DILocation(line: 4016, column: 64, scope: !4027)
!4036 = !DILocation(line: 4016, column: 44, scope: !4027)
!4037 = !DILocation(line: 4016, column: 10, scope: !4027)
!4038 = !DILocation(line: 4016, column: 3, scope: !4027)
!4039 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !70, file: !70, line: 4039, type: !156, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4040 = !DILocalVariable(name: "value", arg: 1, scope: !4039, file: !70, line: 4039, type: !6)
!4041 = !DILocation(line: 4039, column: 27, scope: !4039)
!4042 = !DILocalVariable(name: "factor", arg: 2, scope: !4039, file: !70, line: 4039, type: !24)
!4043 = !DILocation(line: 4039, column: 37, scope: !4039)
!4044 = !DILocation(line: 4041, column: 41, scope: !4039)
!4045 = !DILocation(line: 4041, column: 59, scope: !4039)
!4046 = !DILocation(line: 4041, column: 53, scope: !4039)
!4047 = !DILocation(line: 4041, column: 67, scope: !4039)
!4048 = !DILocation(line: 4041, column: 47, scope: !4039)
!4049 = !DILocation(line: 4041, column: 10, scope: !4039)
!4050 = !DILocation(line: 4041, column: 3, scope: !4039)
!4051 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !70, file: !70, line: 4064, type: !156, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4052 = !DILocalVariable(name: "value", arg: 1, scope: !4051, file: !70, line: 4064, type: !6)
!4053 = !DILocation(line: 4064, column: 26, scope: !4051)
!4054 = !DILocalVariable(name: "factor", arg: 2, scope: !4051, file: !70, line: 4064, type: !24)
!4055 = !DILocation(line: 4064, column: 36, scope: !4051)
!4056 = !DILocation(line: 4066, column: 41, scope: !4051)
!4057 = !DILocation(line: 4066, column: 59, scope: !4051)
!4058 = !DILocation(line: 4066, column: 53, scope: !4051)
!4059 = !DILocation(line: 4066, column: 67, scope: !4051)
!4060 = !DILocation(line: 4066, column: 47, scope: !4051)
!4061 = !DILocation(line: 4066, column: 10, scope: !4051)
!4062 = !DILocation(line: 4066, column: 3, scope: !4051)
!4063 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !70, file: !70, line: 4088, type: !156, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4064 = !DILocalVariable(name: "value", arg: 1, scope: !4063, file: !70, line: 4088, type: !6)
!4065 = !DILocation(line: 4088, column: 26, scope: !4063)
!4066 = !DILocalVariable(name: "factor", arg: 2, scope: !4063, file: !70, line: 4088, type: !24)
!4067 = !DILocation(line: 4088, column: 36, scope: !4063)
!4068 = !DILocation(line: 4090, column: 41, scope: !4063)
!4069 = !DILocation(line: 4090, column: 59, scope: !4063)
!4070 = !DILocation(line: 4090, column: 53, scope: !4063)
!4071 = !DILocation(line: 4090, column: 67, scope: !4063)
!4072 = !DILocation(line: 4090, column: 47, scope: !4063)
!4073 = !DILocation(line: 4090, column: 10, scope: !4063)
!4074 = !DILocation(line: 4090, column: 3, scope: !4063)
!4075 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !70, file: !70, line: 4112, type: !156, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4076 = !DILocalVariable(name: "value", arg: 1, scope: !4075, file: !70, line: 4112, type: !6)
!4077 = !DILocation(line: 4112, column: 25, scope: !4075)
!4078 = !DILocalVariable(name: "factor", arg: 2, scope: !4075, file: !70, line: 4112, type: !24)
!4079 = !DILocation(line: 4112, column: 35, scope: !4075)
!4080 = !DILocation(line: 4114, column: 41, scope: !4075)
!4081 = !DILocation(line: 4114, column: 59, scope: !4075)
!4082 = !DILocation(line: 4114, column: 53, scope: !4075)
!4083 = !DILocation(line: 4114, column: 67, scope: !4075)
!4084 = !DILocation(line: 4114, column: 47, scope: !4075)
!4085 = !DILocation(line: 4114, column: 10, scope: !4075)
!4086 = !DILocation(line: 4114, column: 3, scope: !4075)
!4087 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !70, file: !70, line: 4136, type: !156, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4088 = !DILocalVariable(name: "value", arg: 1, scope: !4087, file: !70, line: 4136, type: !6)
!4089 = !DILocation(line: 4136, column: 26, scope: !4087)
!4090 = !DILocalVariable(name: "factor", arg: 2, scope: !4087, file: !70, line: 4136, type: !24)
!4091 = !DILocation(line: 4136, column: 36, scope: !4087)
!4092 = !DILocation(line: 4138, column: 41, scope: !4087)
!4093 = !DILocation(line: 4138, column: 59, scope: !4087)
!4094 = !DILocation(line: 4138, column: 53, scope: !4087)
!4095 = !DILocation(line: 4138, column: 67, scope: !4087)
!4096 = !DILocation(line: 4138, column: 47, scope: !4087)
!4097 = !DILocation(line: 4138, column: 10, scope: !4087)
!4098 = !DILocation(line: 4138, column: 3, scope: !4087)
!4099 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !70, file: !70, line: 4160, type: !156, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4100 = !DILocalVariable(name: "value", arg: 1, scope: !4099, file: !70, line: 4160, type: !6)
!4101 = !DILocation(line: 4160, column: 25, scope: !4099)
!4102 = !DILocalVariable(name: "factor", arg: 2, scope: !4099, file: !70, line: 4160, type: !24)
!4103 = !DILocation(line: 4160, column: 35, scope: !4099)
!4104 = !DILocation(line: 4162, column: 41, scope: !4099)
!4105 = !DILocation(line: 4162, column: 59, scope: !4099)
!4106 = !DILocation(line: 4162, column: 53, scope: !4099)
!4107 = !DILocation(line: 4162, column: 67, scope: !4099)
!4108 = !DILocation(line: 4162, column: 47, scope: !4099)
!4109 = !DILocation(line: 4162, column: 10, scope: !4099)
!4110 = !DILocation(line: 4162, column: 3, scope: !4099)
!4111 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !70, file: !70, line: 4183, type: !951, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4112 = !DILocalVariable(name: "value", arg: 1, scope: !4111, file: !70, line: 4183, type: !29)
!4113 = !DILocation(line: 4183, column: 33, scope: !4111)
!4114 = !DILocalVariable(name: "factor", arg: 2, scope: !4111, file: !70, line: 4183, type: !29)
!4115 = !DILocation(line: 4183, column: 44, scope: !4111)
!4116 = !DILocation(line: 4185, column: 41, scope: !4111)
!4117 = !DILocation(line: 4185, column: 47, scope: !4111)
!4118 = !DILocation(line: 4185, column: 10, scope: !4111)
!4119 = !DILocation(line: 4185, column: 3, scope: !4111)
!4120 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !70, file: !70, line: 4206, type: !951, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4121 = !DILocalVariable(name: "value", arg: 1, scope: !4120, file: !70, line: 4206, type: !29)
!4122 = !DILocation(line: 4206, column: 32, scope: !4120)
!4123 = !DILocalVariable(name: "factor", arg: 2, scope: !4120, file: !70, line: 4206, type: !29)
!4124 = !DILocation(line: 4206, column: 43, scope: !4120)
!4125 = !DILocation(line: 4208, column: 41, scope: !4120)
!4126 = !DILocation(line: 4208, column: 47, scope: !4120)
!4127 = !DILocation(line: 4208, column: 10, scope: !4120)
!4128 = !DILocation(line: 4208, column: 3, scope: !4120)
!4129 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !70, file: !70, line: 4230, type: !951, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4130 = !DILocalVariable(name: "value", arg: 1, scope: !4129, file: !70, line: 4230, type: !29)
!4131 = !DILocation(line: 4230, column: 31, scope: !4129)
!4132 = !DILocalVariable(name: "factor", arg: 2, scope: !4129, file: !70, line: 4230, type: !29)
!4133 = !DILocation(line: 4230, column: 42, scope: !4129)
!4134 = !DILocation(line: 4232, column: 41, scope: !4129)
!4135 = !DILocation(line: 4232, column: 47, scope: !4129)
!4136 = !DILocation(line: 4232, column: 10, scope: !4129)
!4137 = !DILocation(line: 4232, column: 3, scope: !4129)
!4138 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !70, file: !70, line: 4254, type: !951, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4139 = !DILocalVariable(name: "value", arg: 1, scope: !4138, file: !70, line: 4254, type: !29)
!4140 = !DILocation(line: 4254, column: 34, scope: !4138)
!4141 = !DILocalVariable(name: "factor", arg: 2, scope: !4138, file: !70, line: 4254, type: !29)
!4142 = !DILocation(line: 4254, column: 45, scope: !4138)
!4143 = !DILocation(line: 4256, column: 44, scope: !4138)
!4144 = !DILocation(line: 4256, column: 50, scope: !4138)
!4145 = !DILocation(line: 4256, column: 10, scope: !4138)
!4146 = !DILocation(line: 4256, column: 3, scope: !4138)
!4147 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !70, file: !70, line: 4278, type: !951, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4148 = !DILocalVariable(name: "value", arg: 1, scope: !4147, file: !70, line: 4278, type: !29)
!4149 = !DILocation(line: 4278, column: 32, scope: !4147)
!4150 = !DILocalVariable(name: "factor", arg: 2, scope: !4147, file: !70, line: 4278, type: !29)
!4151 = !DILocation(line: 4278, column: 43, scope: !4147)
!4152 = !DILocation(line: 4280, column: 44, scope: !4147)
!4153 = !DILocation(line: 4280, column: 50, scope: !4147)
!4154 = !DILocation(line: 4280, column: 10, scope: !4147)
!4155 = !DILocation(line: 4280, column: 3, scope: !4147)
!4156 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !70, file: !70, line: 4302, type: !951, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4157 = !DILocalVariable(name: "value", arg: 1, scope: !4156, file: !70, line: 4302, type: !29)
!4158 = !DILocation(line: 4302, column: 31, scope: !4156)
!4159 = !DILocalVariable(name: "factor", arg: 2, scope: !4156, file: !70, line: 4302, type: !29)
!4160 = !DILocation(line: 4302, column: 42, scope: !4156)
!4161 = !DILocation(line: 4304, column: 44, scope: !4156)
!4162 = !DILocation(line: 4304, column: 50, scope: !4156)
!4163 = !DILocation(line: 4304, column: 10, scope: !4156)
!4164 = !DILocation(line: 4304, column: 3, scope: !4156)
!4165 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !70, file: !70, line: 4326, type: !951, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4166 = !DILocalVariable(name: "value", arg: 1, scope: !4165, file: !70, line: 4326, type: !29)
!4167 = !DILocation(line: 4326, column: 33, scope: !4165)
!4168 = !DILocalVariable(name: "factor", arg: 2, scope: !4165, file: !70, line: 4326, type: !29)
!4169 = !DILocation(line: 4326, column: 44, scope: !4165)
!4170 = !DILocation(line: 4328, column: 44, scope: !4165)
!4171 = !DILocation(line: 4328, column: 50, scope: !4165)
!4172 = !DILocation(line: 4328, column: 10, scope: !4165)
!4173 = !DILocation(line: 4328, column: 3, scope: !4165)
!4174 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !70, file: !70, line: 4350, type: !951, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4175 = !DILocalVariable(name: "value", arg: 1, scope: !4174, file: !70, line: 4350, type: !29)
!4176 = !DILocation(line: 4350, column: 32, scope: !4174)
!4177 = !DILocalVariable(name: "factor", arg: 2, scope: !4174, file: !70, line: 4350, type: !29)
!4178 = !DILocation(line: 4350, column: 43, scope: !4174)
!4179 = !DILocation(line: 4352, column: 44, scope: !4174)
!4180 = !DILocation(line: 4352, column: 50, scope: !4174)
!4181 = !DILocation(line: 4352, column: 10, scope: !4174)
!4182 = !DILocation(line: 4352, column: 3, scope: !4174)
!4183 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !70, file: !70, line: 4373, type: !951, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4184 = !DILocalVariable(name: "value", arg: 1, scope: !4183, file: !70, line: 4373, type: !29)
!4185 = !DILocation(line: 4373, column: 31, scope: !4183)
!4186 = !DILocalVariable(name: "factor", arg: 2, scope: !4183, file: !70, line: 4373, type: !29)
!4187 = !DILocation(line: 4373, column: 42, scope: !4183)
!4188 = !DILocation(line: 4375, column: 44, scope: !4183)
!4189 = !DILocation(line: 4375, column: 50, scope: !4183)
!4190 = !DILocation(line: 4375, column: 10, scope: !4183)
!4191 = !DILocation(line: 4375, column: 3, scope: !4183)
!4192 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !70, file: !70, line: 4396, type: !951, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4193 = !DILocalVariable(name: "value", arg: 1, scope: !4192, file: !70, line: 4396, type: !29)
!4194 = !DILocation(line: 4396, column: 30, scope: !4192)
!4195 = !DILocalVariable(name: "factor", arg: 2, scope: !4192, file: !70, line: 4396, type: !29)
!4196 = !DILocation(line: 4396, column: 41, scope: !4192)
!4197 = !DILocation(line: 4398, column: 44, scope: !4192)
!4198 = !DILocation(line: 4398, column: 50, scope: !4192)
!4199 = !DILocation(line: 4398, column: 10, scope: !4192)
!4200 = !DILocation(line: 4398, column: 3, scope: !4192)
!4201 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !70, file: !70, line: 4419, type: !951, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4202 = !DILocalVariable(name: "value", arg: 1, scope: !4201, file: !70, line: 4419, type: !29)
!4203 = !DILocation(line: 4419, column: 33, scope: !4201)
!4204 = !DILocalVariable(name: "factor", arg: 2, scope: !4201, file: !70, line: 4419, type: !29)
!4205 = !DILocation(line: 4419, column: 44, scope: !4201)
!4206 = !DILocation(line: 4421, column: 44, scope: !4201)
!4207 = !DILocation(line: 4421, column: 50, scope: !4201)
!4208 = !DILocation(line: 4421, column: 10, scope: !4201)
!4209 = !DILocation(line: 4421, column: 3, scope: !4201)
!4210 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !70, file: !70, line: 4442, type: !951, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4211 = !DILocalVariable(name: "value", arg: 1, scope: !4210, file: !70, line: 4442, type: !29)
!4212 = !DILocation(line: 4442, column: 32, scope: !4210)
!4213 = !DILocalVariable(name: "factor", arg: 2, scope: !4210, file: !70, line: 4442, type: !29)
!4214 = !DILocation(line: 4442, column: 43, scope: !4210)
!4215 = !DILocation(line: 4444, column: 44, scope: !4210)
!4216 = !DILocation(line: 4444, column: 50, scope: !4210)
!4217 = !DILocation(line: 4444, column: 10, scope: !4210)
!4218 = !DILocation(line: 4444, column: 3, scope: !4210)
!4219 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !70, file: !70, line: 4465, type: !951, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4220 = !DILocalVariable(name: "value", arg: 1, scope: !4219, file: !70, line: 4465, type: !29)
!4221 = !DILocation(line: 4465, column: 31, scope: !4219)
!4222 = !DILocalVariable(name: "factor", arg: 2, scope: !4219, file: !70, line: 4465, type: !29)
!4223 = !DILocation(line: 4465, column: 42, scope: !4219)
!4224 = !DILocation(line: 4467, column: 44, scope: !4219)
!4225 = !DILocation(line: 4467, column: 50, scope: !4219)
!4226 = !DILocation(line: 4467, column: 10, scope: !4219)
!4227 = !DILocation(line: 4467, column: 3, scope: !4219)
!4228 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !70, file: !70, line: 4488, type: !951, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4229 = !DILocalVariable(name: "value", arg: 1, scope: !4228, file: !70, line: 4488, type: !29)
!4230 = !DILocation(line: 4488, column: 30, scope: !4228)
!4231 = !DILocalVariable(name: "factor", arg: 2, scope: !4228, file: !70, line: 4488, type: !29)
!4232 = !DILocation(line: 4488, column: 41, scope: !4228)
!4233 = !DILocation(line: 4490, column: 44, scope: !4228)
!4234 = !DILocation(line: 4490, column: 50, scope: !4228)
!4235 = !DILocation(line: 4490, column: 10, scope: !4228)
!4236 = !DILocation(line: 4490, column: 3, scope: !4228)
!4237 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !70, file: !70, line: 4510, type: !996, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4238 = !DILocalVariable(name: "x_value", arg: 1, scope: !4237, file: !70, line: 4510, type: !29)
!4239 = !DILocation(line: 4510, column: 32, scope: !4237)
!4240 = !DILocalVariable(name: "y_value", arg: 2, scope: !4237, file: !70, line: 4510, type: !24)
!4241 = !DILocation(line: 4510, column: 44, scope: !4237)
!4242 = !DILocation(line: 4512, column: 40, scope: !4237)
!4243 = !DILocation(line: 4512, column: 60, scope: !4237)
!4244 = !DILocation(line: 4512, column: 54, scope: !4237)
!4245 = !DILocation(line: 4512, column: 69, scope: !4237)
!4246 = !DILocation(line: 4512, column: 48, scope: !4237)
!4247 = !DILocation(line: 4512, column: 10, scope: !4237)
!4248 = !DILocation(line: 4512, column: 3, scope: !4237)
!4249 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !70, file: !70, line: 4532, type: !996, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4250 = !DILocalVariable(name: "x_value", arg: 1, scope: !4249, file: !70, line: 4532, type: !29)
!4251 = !DILocation(line: 4532, column: 31, scope: !4249)
!4252 = !DILocalVariable(name: "y_value", arg: 2, scope: !4249, file: !70, line: 4532, type: !24)
!4253 = !DILocation(line: 4532, column: 43, scope: !4249)
!4254 = !DILocation(line: 4534, column: 40, scope: !4249)
!4255 = !DILocation(line: 4534, column: 60, scope: !4249)
!4256 = !DILocation(line: 4534, column: 54, scope: !4249)
!4257 = !DILocation(line: 4534, column: 69, scope: !4249)
!4258 = !DILocation(line: 4534, column: 48, scope: !4249)
!4259 = !DILocation(line: 4534, column: 10, scope: !4249)
!4260 = !DILocation(line: 4534, column: 3, scope: !4249)
!4261 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !70, file: !70, line: 4555, type: !996, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4262 = !DILocalVariable(name: "x_value", arg: 1, scope: !4261, file: !70, line: 4555, type: !29)
!4263 = !DILocation(line: 4555, column: 30, scope: !4261)
!4264 = !DILocalVariable(name: "y_value", arg: 2, scope: !4261, file: !70, line: 4555, type: !24)
!4265 = !DILocation(line: 4555, column: 42, scope: !4261)
!4266 = !DILocation(line: 4557, column: 40, scope: !4261)
!4267 = !DILocation(line: 4557, column: 60, scope: !4261)
!4268 = !DILocation(line: 4557, column: 54, scope: !4261)
!4269 = !DILocation(line: 4557, column: 69, scope: !4261)
!4270 = !DILocation(line: 4557, column: 48, scope: !4261)
!4271 = !DILocation(line: 4557, column: 10, scope: !4261)
!4272 = !DILocation(line: 4557, column: 3, scope: !4261)
!4273 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !70, file: !70, line: 4578, type: !996, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4274 = !DILocalVariable(name: "x_value", arg: 1, scope: !4273, file: !70, line: 4578, type: !29)
!4275 = !DILocation(line: 4578, column: 31, scope: !4273)
!4276 = !DILocalVariable(name: "y_value", arg: 2, scope: !4273, file: !70, line: 4578, type: !24)
!4277 = !DILocation(line: 4578, column: 43, scope: !4273)
!4278 = !DILocation(line: 4580, column: 44, scope: !4273)
!4279 = !DILocation(line: 4580, column: 64, scope: !4273)
!4280 = !DILocation(line: 4580, column: 58, scope: !4273)
!4281 = !DILocation(line: 4580, column: 73, scope: !4273)
!4282 = !DILocation(line: 4580, column: 52, scope: !4273)
!4283 = !DILocation(line: 4580, column: 10, scope: !4273)
!4284 = !DILocation(line: 4580, column: 3, scope: !4273)
!4285 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !70, file: !70, line: 4601, type: !996, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4286 = !DILocalVariable(name: "x_value", arg: 1, scope: !4285, file: !70, line: 4601, type: !29)
!4287 = !DILocation(line: 4601, column: 30, scope: !4285)
!4288 = !DILocalVariable(name: "y_value", arg: 2, scope: !4285, file: !70, line: 4601, type: !24)
!4289 = !DILocation(line: 4601, column: 42, scope: !4285)
!4290 = !DILocation(line: 4603, column: 44, scope: !4285)
!4291 = !DILocation(line: 4603, column: 64, scope: !4285)
!4292 = !DILocation(line: 4603, column: 58, scope: !4285)
!4293 = !DILocation(line: 4603, column: 73, scope: !4285)
!4294 = !DILocation(line: 4603, column: 52, scope: !4285)
!4295 = !DILocation(line: 4603, column: 10, scope: !4285)
!4296 = !DILocation(line: 4603, column: 3, scope: !4285)
!4297 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !70, file: !70, line: 4623, type: !996, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4298 = !DILocalVariable(name: "x_value", arg: 1, scope: !4297, file: !70, line: 4623, type: !29)
!4299 = !DILocation(line: 4623, column: 30, scope: !4297)
!4300 = !DILocalVariable(name: "y_value", arg: 2, scope: !4297, file: !70, line: 4623, type: !24)
!4301 = !DILocation(line: 4623, column: 42, scope: !4297)
!4302 = !DILocation(line: 4625, column: 44, scope: !4297)
!4303 = !DILocation(line: 4625, column: 64, scope: !4297)
!4304 = !DILocation(line: 4625, column: 58, scope: !4297)
!4305 = !DILocation(line: 4625, column: 73, scope: !4297)
!4306 = !DILocation(line: 4625, column: 52, scope: !4297)
!4307 = !DILocation(line: 4625, column: 10, scope: !4297)
!4308 = !DILocation(line: 4625, column: 3, scope: !4297)
!4309 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !70, file: !70, line: 4645, type: !996, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4310 = !DILocalVariable(name: "x_value", arg: 1, scope: !4309, file: !70, line: 4645, type: !29)
!4311 = !DILocation(line: 4645, column: 29, scope: !4309)
!4312 = !DILocalVariable(name: "y_value", arg: 2, scope: !4309, file: !70, line: 4645, type: !24)
!4313 = !DILocation(line: 4645, column: 41, scope: !4309)
!4314 = !DILocation(line: 4647, column: 44, scope: !4309)
!4315 = !DILocation(line: 4647, column: 64, scope: !4309)
!4316 = !DILocation(line: 4647, column: 58, scope: !4309)
!4317 = !DILocation(line: 4647, column: 73, scope: !4309)
!4318 = !DILocation(line: 4647, column: 52, scope: !4309)
!4319 = !DILocation(line: 4647, column: 10, scope: !4309)
!4320 = !DILocation(line: 4647, column: 3, scope: !4309)
!4321 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !70, file: !70, line: 4667, type: !996, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4322 = !DILocalVariable(name: "x_value", arg: 1, scope: !4321, file: !70, line: 4667, type: !29)
!4323 = !DILocation(line: 4667, column: 30, scope: !4321)
!4324 = !DILocalVariable(name: "y_value", arg: 2, scope: !4321, file: !70, line: 4667, type: !24)
!4325 = !DILocation(line: 4667, column: 42, scope: !4321)
!4326 = !DILocation(line: 4669, column: 44, scope: !4321)
!4327 = !DILocation(line: 4669, column: 64, scope: !4321)
!4328 = !DILocation(line: 4669, column: 58, scope: !4321)
!4329 = !DILocation(line: 4669, column: 73, scope: !4321)
!4330 = !DILocation(line: 4669, column: 52, scope: !4321)
!4331 = !DILocation(line: 4669, column: 10, scope: !4321)
!4332 = !DILocation(line: 4669, column: 3, scope: !4321)
!4333 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !70, file: !70, line: 4689, type: !996, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4334 = !DILocalVariable(name: "x_value", arg: 1, scope: !4333, file: !70, line: 4689, type: !29)
!4335 = !DILocation(line: 4689, column: 29, scope: !4333)
!4336 = !DILocalVariable(name: "y_value", arg: 2, scope: !4333, file: !70, line: 4689, type: !24)
!4337 = !DILocation(line: 4689, column: 41, scope: !4333)
!4338 = !DILocation(line: 4691, column: 44, scope: !4333)
!4339 = !DILocation(line: 4691, column: 64, scope: !4333)
!4340 = !DILocation(line: 4691, column: 58, scope: !4333)
!4341 = !DILocation(line: 4691, column: 73, scope: !4333)
!4342 = !DILocation(line: 4691, column: 52, scope: !4333)
!4343 = !DILocation(line: 4691, column: 10, scope: !4333)
!4344 = !DILocation(line: 4691, column: 3, scope: !4333)
!4345 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !70, file: !70, line: 4713, type: !1525, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4346 = !DILocalVariable(name: "value", arg: 1, scope: !4345, file: !70, line: 4713, type: !733)
!4347 = !DILocation(line: 4713, column: 31, scope: !4345)
!4348 = !DILocalVariable(name: "factor", arg: 2, scope: !4345, file: !70, line: 4713, type: !13)
!4349 = !DILocation(line: 4713, column: 42, scope: !4345)
!4350 = !DILocation(line: 4715, column: 41, scope: !4345)
!4351 = !DILocation(line: 4715, column: 47, scope: !4345)
!4352 = !DILocation(line: 4715, column: 10, scope: !4345)
!4353 = !DILocation(line: 4715, column: 3, scope: !4345)
!4354 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !70, file: !70, line: 5293, type: !4355, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4355 = !DISubroutineType(types: !4356)
!4356 = !{!733, !733, !13, !733}
!4357 = !DILocalVariable(name: "value", arg: 1, scope: !4354, file: !70, line: 5293, type: !733)
!4358 = !DILocation(line: 5293, column: 40, scope: !4354)
!4359 = !DILocalVariable(name: "factor", arg: 2, scope: !4354, file: !70, line: 5293, type: !13)
!4360 = !DILocation(line: 5293, column: 50, scope: !4354)
!4361 = !DILocalVariable(name: "count", arg: 3, scope: !4354, file: !70, line: 5293, type: !733)
!4362 = !DILocation(line: 5293, column: 62, scope: !4354)
!4363 = !DILocalVariable(name: "u32Temp1", scope: !4354, file: !70, line: 5295, type: !733)
!4364 = !DILocation(line: 5295, column: 6, scope: !4354)
!4365 = !DILocalVariable(name: "u32Temp2", scope: !4354, file: !70, line: 5295, type: !733)
!4366 = !DILocation(line: 5295, column: 17, scope: !4354)
!4367 = !DILocalVariable(name: "u32Temp3", scope: !4354, file: !70, line: 5295, type: !733)
!4368 = !DILocation(line: 5295, column: 26, scope: !4354)
!4369 = !DILocalVariable(name: "u8SignBit", scope: !4354, file: !70, line: 5296, type: !24)
!4370 = !DILocation(line: 5296, column: 5, scope: !4354)
!4371 = !DILocation(line: 5298, column: 5, scope: !4372)
!4372 = distinct !DILexicalBlock(scope: !4354, file: !70, line: 5298, column: 5)
!4373 = !DILocation(line: 5298, column: 11, scope: !4372)
!4374 = !DILocation(line: 5298, column: 5, scope: !4354)
!4375 = !DILocation(line: 5300, column: 13, scope: !4376)
!4376 = distinct !DILexicalBlock(scope: !4372, file: !70, line: 5299, column: 2)
!4377 = !DILocation(line: 5301, column: 2, scope: !4376)
!4378 = !DILocation(line: 5304, column: 13, scope: !4379)
!4379 = distinct !DILexicalBlock(scope: !4372, file: !70, line: 5303, column: 2)
!4380 = !DILocation(line: 5308, column: 5, scope: !4381)
!4381 = distinct !DILexicalBlock(scope: !4354, file: !70, line: 5308, column: 5)
!4382 = !DILocation(line: 5308, column: 11, scope: !4381)
!4383 = !DILocation(line: 5308, column: 5, scope: !4354)
!4384 = !DILocation(line: 5310, column: 15, scope: !4385)
!4385 = distinct !DILexicalBlock(scope: !4381, file: !70, line: 5309, column: 2)
!4386 = !DILocation(line: 5310, column: 14, scope: !4385)
!4387 = !DILocation(line: 5310, column: 12, scope: !4385)
!4388 = !DILocation(line: 5311, column: 2, scope: !4385)
!4389 = !DILocation(line: 5314, column: 14, scope: !4390)
!4390 = distinct !DILexicalBlock(scope: !4381, file: !70, line: 5313, column: 2)
!4391 = !DILocation(line: 5314, column: 12, scope: !4390)
!4392 = !DILocation(line: 5317, column: 13, scope: !4354)
!4393 = !DILocation(line: 5317, column: 21, scope: !4354)
!4394 = !DILocation(line: 5317, column: 19, scope: !4354)
!4395 = !DILocation(line: 5317, column: 11, scope: !4354)
!4396 = !DILocation(line: 5318, column: 25, scope: !4354)
!4397 = !DILocation(line: 5318, column: 32, scope: !4354)
!4398 = !DILocation(line: 5318, column: 13, scope: !4354)
!4399 = !DILocation(line: 5318, column: 11, scope: !4354)
!4400 = !DILocation(line: 5319, column: 13, scope: !4354)
!4401 = !DILocation(line: 5319, column: 25, scope: !4354)
!4402 = !DILocation(line: 5319, column: 22, scope: !4354)
!4403 = !DILocation(line: 5319, column: 11, scope: !4354)
!4404 = !DILocation(line: 5320, column: 14, scope: !4354)
!4405 = !DILocation(line: 5320, column: 30, scope: !4354)
!4406 = !DILocation(line: 5320, column: 29, scope: !4354)
!4407 = !DILocation(line: 5320, column: 23, scope: !4354)
!4408 = !DILocation(line: 5320, column: 11, scope: !4354)
!4409 = !DILocation(line: 5321, column: 6, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4354, file: !70, line: 5321, column: 5)
!4411 = !DILocation(line: 5321, column: 16, scope: !4410)
!4412 = !DILocation(line: 5321, column: 14, scope: !4410)
!4413 = !DILocation(line: 5321, column: 22, scope: !4410)
!4414 = !DILocation(line: 5321, column: 5, scope: !4354)
!4415 = !DILocation(line: 5323, column: 6, scope: !4416)
!4416 = distinct !DILexicalBlock(scope: !4417, file: !70, line: 5323, column: 6)
!4417 = distinct !DILexicalBlock(scope: !4410, file: !70, line: 5322, column: 2)
!4418 = !DILocation(line: 5323, column: 16, scope: !4416)
!4419 = !DILocation(line: 5323, column: 6, scope: !4417)
!4420 = !DILocation(line: 5325, column: 7, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4422, file: !70, line: 5325, column: 7)
!4422 = distinct !DILexicalBlock(scope: !4416, file: !70, line: 5324, column: 3)
!4423 = !DILocation(line: 5325, column: 15, scope: !4421)
!4424 = !DILocation(line: 5325, column: 7, scope: !4422)
!4425 = !DILocation(line: 5326, column: 12, scope: !4421)
!4426 = !DILocation(line: 5326, column: 5, scope: !4421)
!4427 = !DILocation(line: 5328, column: 5, scope: !4421)
!4428 = !DILocation(line: 5332, column: 4, scope: !4429)
!4429 = distinct !DILexicalBlock(scope: !4416, file: !70, line: 5331, column: 3)
!4430 = !DILocation(line: 5337, column: 3, scope: !4431)
!4431 = distinct !DILexicalBlock(scope: !4410, file: !70, line: 5336, column: 2)
!4432 = !DILocation(line: 5339, column: 1, scope: !4354)
!4433 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !70, file: !70, line: 4737, type: !1343, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4434 = !DILocalVariable(name: "value", arg: 1, scope: !4433, file: !70, line: 4737, type: !733)
!4435 = !DILocation(line: 4737, column: 31, scope: !4433)
!4436 = !DILocalVariable(name: "factor", arg: 2, scope: !4433, file: !70, line: 4737, type: !20)
!4437 = !DILocation(line: 4737, column: 42, scope: !4433)
!4438 = !DILocation(line: 4739, column: 41, scope: !4433)
!4439 = !DILocation(line: 4739, column: 47, scope: !4433)
!4440 = !DILocation(line: 4739, column: 10, scope: !4433)
!4441 = !DILocation(line: 4739, column: 3, scope: !4433)
!4442 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !70, file: !70, line: 5357, type: !4443, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4443 = !DISubroutineType(types: !4444)
!4444 = !{!733, !733, !20, !733}
!4445 = !DILocalVariable(name: "value", arg: 1, scope: !4442, file: !70, line: 5357, type: !733)
!4446 = !DILocation(line: 5357, column: 40, scope: !4442)
!4447 = !DILocalVariable(name: "factor", arg: 2, scope: !4442, file: !70, line: 5357, type: !20)
!4448 = !DILocation(line: 5357, column: 51, scope: !4442)
!4449 = !DILocalVariable(name: "count", arg: 3, scope: !4442, file: !70, line: 5357, type: !733)
!4450 = !DILocation(line: 5357, column: 63, scope: !4442)
!4451 = !DILocalVariable(name: "u32Temp1", scope: !4442, file: !70, line: 5359, type: !733)
!4452 = !DILocation(line: 5359, column: 6, scope: !4442)
!4453 = !DILocalVariable(name: "u32Temp2", scope: !4442, file: !70, line: 5359, type: !733)
!4454 = !DILocation(line: 5359, column: 17, scope: !4442)
!4455 = !DILocalVariable(name: "u8SignBit", scope: !4442, file: !70, line: 5360, type: !24)
!4456 = !DILocation(line: 5360, column: 5, scope: !4442)
!4457 = !DILocation(line: 5362, column: 5, scope: !4458)
!4458 = distinct !DILexicalBlock(scope: !4442, file: !70, line: 5362, column: 5)
!4459 = !DILocation(line: 5362, column: 11, scope: !4458)
!4460 = !DILocation(line: 5362, column: 5, scope: !4442)
!4461 = !DILocation(line: 5364, column: 13, scope: !4462)
!4462 = distinct !DILexicalBlock(scope: !4458, file: !70, line: 5363, column: 2)
!4463 = !DILocation(line: 5365, column: 2, scope: !4462)
!4464 = !DILocation(line: 5368, column: 13, scope: !4465)
!4465 = distinct !DILexicalBlock(scope: !4458, file: !70, line: 5367, column: 2)
!4466 = !DILocation(line: 5372, column: 5, scope: !4467)
!4467 = distinct !DILexicalBlock(scope: !4442, file: !70, line: 5372, column: 5)
!4468 = !DILocation(line: 5372, column: 11, scope: !4467)
!4469 = !DILocation(line: 5372, column: 5, scope: !4442)
!4470 = !DILocation(line: 5374, column: 15, scope: !4471)
!4471 = distinct !DILexicalBlock(scope: !4467, file: !70, line: 5373, column: 2)
!4472 = !DILocation(line: 5374, column: 14, scope: !4471)
!4473 = !DILocation(line: 5374, column: 12, scope: !4471)
!4474 = !DILocation(line: 5375, column: 2, scope: !4471)
!4475 = !DILocation(line: 5378, column: 14, scope: !4476)
!4476 = distinct !DILexicalBlock(scope: !4467, file: !70, line: 5377, column: 2)
!4477 = !DILocation(line: 5378, column: 12, scope: !4476)
!4478 = !DILocation(line: 5381, column: 25, scope: !4442)
!4479 = !DILocation(line: 5381, column: 32, scope: !4442)
!4480 = !DILocation(line: 5381, column: 13, scope: !4442)
!4481 = !DILocation(line: 5381, column: 11, scope: !4442)
!4482 = !DILocation(line: 5382, column: 13, scope: !4442)
!4483 = !DILocation(line: 5382, column: 26, scope: !4442)
!4484 = !DILocation(line: 5382, column: 31, scope: !4442)
!4485 = !DILocation(line: 5382, column: 22, scope: !4442)
!4486 = !DILocation(line: 5382, column: 11, scope: !4442)
!4487 = !DILocation(line: 5383, column: 5, scope: !4488)
!4488 = distinct !DILexicalBlock(scope: !4442, file: !70, line: 5383, column: 5)
!4489 = !DILocation(line: 5383, column: 15, scope: !4488)
!4490 = !DILocation(line: 5383, column: 5, scope: !4442)
!4491 = !DILocation(line: 5385, column: 10, scope: !4492)
!4492 = distinct !DILexicalBlock(scope: !4488, file: !70, line: 5384, column: 2)
!4493 = !DILocation(line: 5385, column: 3, scope: !4492)
!4494 = !DILocation(line: 5389, column: 3, scope: !4495)
!4495 = distinct !DILexicalBlock(scope: !4488, file: !70, line: 5388, column: 2)
!4496 = !DILocation(line: 5391, column: 1, scope: !4442)
!4497 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !70, file: !70, line: 4761, type: !3117, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4498 = !DILocalVariable(name: "value", arg: 1, scope: !4497, file: !70, line: 4761, type: !733)
!4499 = !DILocation(line: 4761, column: 30, scope: !4497)
!4500 = !DILocalVariable(name: "factor", arg: 2, scope: !4497, file: !70, line: 4761, type: !6)
!4501 = !DILocation(line: 4761, column: 40, scope: !4497)
!4502 = !DILocation(line: 4763, column: 40, scope: !4497)
!4503 = !DILocation(line: 4763, column: 46, scope: !4497)
!4504 = !DILocation(line: 4763, column: 10, scope: !4497)
!4505 = !DILocation(line: 4763, column: 3, scope: !4497)
!4506 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !70, file: !70, line: 5435, type: !4507, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4507 = !DISubroutineType(types: !4508)
!4508 = !{!733, !733, !6, !733}
!4509 = !DILocalVariable(name: "value", arg: 1, scope: !4506, file: !70, line: 5435, type: !733)
!4510 = !DILocation(line: 5435, column: 39, scope: !4506)
!4511 = !DILocalVariable(name: "factor", arg: 2, scope: !4506, file: !70, line: 5435, type: !6)
!4512 = !DILocation(line: 5435, column: 49, scope: !4506)
!4513 = !DILocalVariable(name: "count", arg: 3, scope: !4506, file: !70, line: 5435, type: !733)
!4514 = !DILocation(line: 5435, column: 61, scope: !4506)
!4515 = !DILocalVariable(name: "u32Temp1", scope: !4506, file: !70, line: 5437, type: !733)
!4516 = !DILocation(line: 5437, column: 6, scope: !4506)
!4517 = !DILocalVariable(name: "u32Temp2", scope: !4506, file: !70, line: 5437, type: !733)
!4518 = !DILocation(line: 5437, column: 17, scope: !4506)
!4519 = !DILocalVariable(name: "u32Temp3", scope: !4506, file: !70, line: 5437, type: !733)
!4520 = !DILocation(line: 5437, column: 26, scope: !4506)
!4521 = !DILocalVariable(name: "u8SignBit", scope: !4506, file: !70, line: 5438, type: !24)
!4522 = !DILocation(line: 5438, column: 5, scope: !4506)
!4523 = !DILocation(line: 5440, column: 5, scope: !4524)
!4524 = distinct !DILexicalBlock(scope: !4506, file: !70, line: 5440, column: 5)
!4525 = !DILocation(line: 5440, column: 11, scope: !4524)
!4526 = !DILocation(line: 5440, column: 5, scope: !4506)
!4527 = !DILocation(line: 5442, column: 13, scope: !4528)
!4528 = distinct !DILexicalBlock(scope: !4524, file: !70, line: 5441, column: 2)
!4529 = !DILocation(line: 5443, column: 2, scope: !4528)
!4530 = !DILocation(line: 5446, column: 13, scope: !4531)
!4531 = distinct !DILexicalBlock(scope: !4524, file: !70, line: 5445, column: 2)
!4532 = !DILocation(line: 5450, column: 5, scope: !4533)
!4533 = distinct !DILexicalBlock(scope: !4506, file: !70, line: 5450, column: 5)
!4534 = !DILocation(line: 5450, column: 11, scope: !4533)
!4535 = !DILocation(line: 5450, column: 5, scope: !4506)
!4536 = !DILocation(line: 5452, column: 15, scope: !4537)
!4537 = distinct !DILexicalBlock(scope: !4533, file: !70, line: 5451, column: 2)
!4538 = !DILocation(line: 5452, column: 14, scope: !4537)
!4539 = !DILocation(line: 5452, column: 12, scope: !4537)
!4540 = !DILocation(line: 5453, column: 2, scope: !4537)
!4541 = !DILocation(line: 5456, column: 14, scope: !4542)
!4542 = distinct !DILexicalBlock(scope: !4533, file: !70, line: 5455, column: 2)
!4543 = !DILocation(line: 5456, column: 12, scope: !4542)
!4544 = !DILocation(line: 5459, column: 13, scope: !4506)
!4545 = !DILocation(line: 5459, column: 21, scope: !4506)
!4546 = !DILocation(line: 5459, column: 19, scope: !4506)
!4547 = !DILocation(line: 5459, column: 11, scope: !4506)
!4548 = !DILocation(line: 5460, column: 25, scope: !4506)
!4549 = !DILocation(line: 5460, column: 32, scope: !4506)
!4550 = !DILocation(line: 5460, column: 13, scope: !4506)
!4551 = !DILocation(line: 5460, column: 11, scope: !4506)
!4552 = !DILocation(line: 5461, column: 13, scope: !4506)
!4553 = !DILocation(line: 5461, column: 25, scope: !4506)
!4554 = !DILocation(line: 5461, column: 22, scope: !4506)
!4555 = !DILocation(line: 5461, column: 11, scope: !4506)
!4556 = !DILocation(line: 5462, column: 14, scope: !4506)
!4557 = !DILocation(line: 5462, column: 30, scope: !4506)
!4558 = !DILocation(line: 5462, column: 29, scope: !4506)
!4559 = !DILocation(line: 5462, column: 23, scope: !4506)
!4560 = !DILocation(line: 5462, column: 11, scope: !4506)
!4561 = !DILocation(line: 5463, column: 6, scope: !4562)
!4562 = distinct !DILexicalBlock(scope: !4506, file: !70, line: 5463, column: 5)
!4563 = !DILocation(line: 5463, column: 16, scope: !4562)
!4564 = !DILocation(line: 5463, column: 14, scope: !4562)
!4565 = !DILocation(line: 5463, column: 22, scope: !4562)
!4566 = !DILocation(line: 5463, column: 5, scope: !4506)
!4567 = !DILocation(line: 5465, column: 6, scope: !4568)
!4568 = distinct !DILexicalBlock(scope: !4569, file: !70, line: 5465, column: 6)
!4569 = distinct !DILexicalBlock(scope: !4562, file: !70, line: 5464, column: 2)
!4570 = !DILocation(line: 5465, column: 16, scope: !4568)
!4571 = !DILocation(line: 5465, column: 6, scope: !4569)
!4572 = !DILocation(line: 5467, column: 7, scope: !4573)
!4573 = distinct !DILexicalBlock(scope: !4574, file: !70, line: 5467, column: 7)
!4574 = distinct !DILexicalBlock(scope: !4568, file: !70, line: 5466, column: 3)
!4575 = !DILocation(line: 5467, column: 15, scope: !4573)
!4576 = !DILocation(line: 5467, column: 7, scope: !4574)
!4577 = !DILocation(line: 5468, column: 12, scope: !4573)
!4578 = !DILocation(line: 5468, column: 5, scope: !4573)
!4579 = !DILocation(line: 5470, column: 5, scope: !4573)
!4580 = !DILocation(line: 5474, column: 4, scope: !4581)
!4581 = distinct !DILexicalBlock(scope: !4568, file: !70, line: 5473, column: 3)
!4582 = !DILocation(line: 5479, column: 3, scope: !4583)
!4583 = distinct !DILexicalBlock(scope: !4562, file: !70, line: 5478, column: 2)
!4584 = !DILocation(line: 5481, column: 1, scope: !4506)
!4585 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !70, file: !70, line: 4785, type: !1139, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4586 = !DILocalVariable(name: "value", arg: 1, scope: !4585, file: !70, line: 4785, type: !733)
!4587 = !DILocation(line: 4785, column: 31, scope: !4585)
!4588 = !DILocalVariable(name: "factor", arg: 2, scope: !4585, file: !70, line: 4785, type: !29)
!4589 = !DILocation(line: 4785, column: 42, scope: !4585)
!4590 = !DILocation(line: 4787, column: 41, scope: !4585)
!4591 = !DILocation(line: 4787, column: 47, scope: !4585)
!4592 = !DILocation(line: 4787, column: 10, scope: !4585)
!4593 = !DILocation(line: 4787, column: 3, scope: !4585)
!4594 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !70, file: !70, line: 4809, type: !1434, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4595 = !DILocalVariable(name: "value", arg: 1, scope: !4594, file: !70, line: 4809, type: !733)
!4596 = !DILocation(line: 4809, column: 31, scope: !4594)
!4597 = !DILocalVariable(name: "factor", arg: 2, scope: !4594, file: !70, line: 4809, type: !733)
!4598 = !DILocation(line: 4809, column: 42, scope: !4594)
!4599 = !DILocation(line: 4811, column: 41, scope: !4594)
!4600 = !DILocation(line: 4811, column: 47, scope: !4594)
!4601 = !DILocation(line: 4811, column: 10, scope: !4594)
!4602 = !DILocation(line: 4811, column: 3, scope: !4594)
!4603 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !70, file: !70, line: 5408, type: !4604, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4604 = !DISubroutineType(types: !4605)
!4605 = !{!733, !733, !733, !733}
!4606 = !DILocalVariable(name: "value", arg: 1, scope: !4603, file: !70, line: 5408, type: !733)
!4607 = !DILocation(line: 5408, column: 40, scope: !4603)
!4608 = !DILocalVariable(name: "factor", arg: 2, scope: !4603, file: !70, line: 5408, type: !733)
!4609 = !DILocation(line: 5408, column: 50, scope: !4603)
!4610 = !DILocalVariable(name: "count", arg: 3, scope: !4603, file: !70, line: 5408, type: !733)
!4611 = !DILocation(line: 5408, column: 62, scope: !4603)
!4612 = !DILocalVariable(name: "u32Temp1", scope: !4603, file: !70, line: 5410, type: !733)
!4613 = !DILocation(line: 5410, column: 6, scope: !4603)
!4614 = !DILocalVariable(name: "u32Temp2", scope: !4603, file: !70, line: 5410, type: !733)
!4615 = !DILocation(line: 5410, column: 17, scope: !4603)
!4616 = !DILocalVariable(name: "u32Temp3", scope: !4603, file: !70, line: 5410, type: !733)
!4617 = !DILocation(line: 5410, column: 26, scope: !4603)
!4618 = !DILocalVariable(name: "u32Temp4", scope: !4603, file: !70, line: 5410, type: !733)
!4619 = !DILocation(line: 5410, column: 35, scope: !4603)
!4620 = !DILocalVariable(name: "u8SignBit", scope: !4603, file: !70, line: 5411, type: !24)
!4621 = !DILocation(line: 5411, column: 5, scope: !4603)
!4622 = !DILocation(line: 5413, column: 25, scope: !4603)
!4623 = !DILocation(line: 5413, column: 32, scope: !4603)
!4624 = !DILocation(line: 5413, column: 13, scope: !4603)
!4625 = !DILocation(line: 5413, column: 11, scope: !4603)
!4626 = !DILocation(line: 5414, column: 13, scope: !4603)
!4627 = !DILocation(line: 5414, column: 26, scope: !4603)
!4628 = !DILocation(line: 5414, column: 31, scope: !4603)
!4629 = !DILocation(line: 5414, column: 22, scope: !4603)
!4630 = !DILocation(line: 5414, column: 11, scope: !4603)
!4631 = !DILocation(line: 5415, column: 9, scope: !4603)
!4632 = !DILocation(line: 5415, column: 2, scope: !4603)
!4633 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !70, file: !70, line: 4833, type: !3056, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4634 = !DILocalVariable(name: "value", arg: 1, scope: !4633, file: !70, line: 4833, type: !733)
!4635 = !DILocation(line: 4833, column: 30, scope: !4633)
!4636 = !DILocalVariable(name: "factor", arg: 2, scope: !4633, file: !70, line: 4833, type: !24)
!4637 = !DILocation(line: 4833, column: 40, scope: !4633)
!4638 = !DILocation(line: 4835, column: 40, scope: !4633)
!4639 = !DILocation(line: 4835, column: 46, scope: !4633)
!4640 = !DILocation(line: 4835, column: 10, scope: !4633)
!4641 = !DILocation(line: 4835, column: 3, scope: !4633)
!4642 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !70, file: !70, line: 5499, type: !4643, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4643 = !DISubroutineType(types: !4644)
!4644 = !{!733, !733, !24, !733}
!4645 = !DILocalVariable(name: "value", arg: 1, scope: !4642, file: !70, line: 5499, type: !733)
!4646 = !DILocation(line: 5499, column: 39, scope: !4642)
!4647 = !DILocalVariable(name: "factor", arg: 2, scope: !4642, file: !70, line: 5499, type: !24)
!4648 = !DILocation(line: 5499, column: 49, scope: !4642)
!4649 = !DILocalVariable(name: "count", arg: 3, scope: !4642, file: !70, line: 5499, type: !733)
!4650 = !DILocation(line: 5499, column: 61, scope: !4642)
!4651 = !DILocalVariable(name: "u32Temp1", scope: !4642, file: !70, line: 5501, type: !733)
!4652 = !DILocation(line: 5501, column: 6, scope: !4642)
!4653 = !DILocalVariable(name: "u32Temp2", scope: !4642, file: !70, line: 5501, type: !733)
!4654 = !DILocation(line: 5501, column: 17, scope: !4642)
!4655 = !DILocation(line: 5503, column: 13, scope: !4642)
!4656 = !DILocation(line: 5503, column: 21, scope: !4642)
!4657 = !DILocation(line: 5503, column: 19, scope: !4642)
!4658 = !DILocation(line: 5503, column: 11, scope: !4642)
!4659 = !DILocation(line: 5504, column: 25, scope: !4642)
!4660 = !DILocation(line: 5504, column: 32, scope: !4642)
!4661 = !DILocation(line: 5504, column: 13, scope: !4642)
!4662 = !DILocation(line: 5504, column: 11, scope: !4642)
!4663 = !DILocation(line: 5505, column: 13, scope: !4642)
!4664 = !DILocation(line: 5505, column: 25, scope: !4642)
!4665 = !DILocation(line: 5505, column: 22, scope: !4642)
!4666 = !DILocation(line: 5505, column: 11, scope: !4642)
!4667 = !DILocation(line: 5506, column: 14, scope: !4642)
!4668 = !DILocation(line: 5506, column: 30, scope: !4642)
!4669 = !DILocation(line: 5506, column: 29, scope: !4642)
!4670 = !DILocation(line: 5506, column: 23, scope: !4642)
!4671 = !DILocation(line: 5506, column: 11, scope: !4642)
!4672 = !DILocation(line: 5507, column: 6, scope: !4673)
!4673 = distinct !DILexicalBlock(scope: !4642, file: !70, line: 5507, column: 5)
!4674 = !DILocation(line: 5507, column: 16, scope: !4673)
!4675 = !DILocation(line: 5507, column: 14, scope: !4673)
!4676 = !DILocation(line: 5507, column: 22, scope: !4673)
!4677 = !DILocation(line: 5507, column: 5, scope: !4642)
!4678 = !DILocation(line: 5509, column: 6, scope: !4679)
!4679 = distinct !DILexicalBlock(scope: !4680, file: !70, line: 5509, column: 6)
!4680 = distinct !DILexicalBlock(scope: !4673, file: !70, line: 5508, column: 2)
!4681 = !DILocation(line: 5509, column: 14, scope: !4679)
!4682 = !DILocation(line: 5509, column: 6, scope: !4680)
!4683 = !DILocation(line: 5510, column: 11, scope: !4679)
!4684 = !DILocation(line: 5510, column: 4, scope: !4679)
!4685 = !DILocation(line: 5512, column: 4, scope: !4679)
!4686 = !DILocation(line: 5516, column: 3, scope: !4687)
!4687 = distinct !DILexicalBlock(scope: !4673, file: !70, line: 5515, column: 2)
!4688 = !DILocation(line: 5518, column: 1, scope: !4642)
!4689 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !70, file: !70, line: 4856, type: !907, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4690 = !DILocalVariable(name: "value", arg: 1, scope: !4689, file: !70, line: 4856, type: !24)
!4691 = !DILocation(line: 4856, column: 28, scope: !4689)
!4692 = !DILocalVariable(name: "factor", arg: 2, scope: !4689, file: !70, line: 4856, type: !24)
!4693 = !DILocation(line: 4856, column: 38, scope: !4689)
!4694 = !DILocation(line: 4858, column: 38, scope: !4689)
!4695 = !DILocation(line: 4858, column: 44, scope: !4689)
!4696 = !DILocation(line: 4858, column: 10, scope: !4689)
!4697 = !DILocation(line: 4858, column: 3, scope: !4689)
!4698 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !70, file: !70, line: 4879, type: !907, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4699 = !DILocalVariable(name: "value", arg: 1, scope: !4698, file: !70, line: 4879, type: !24)
!4700 = !DILocation(line: 4879, column: 28, scope: !4698)
!4701 = !DILocalVariable(name: "factor", arg: 2, scope: !4698, file: !70, line: 4879, type: !24)
!4702 = !DILocation(line: 4879, column: 38, scope: !4698)
!4703 = !DILocation(line: 4881, column: 38, scope: !4698)
!4704 = !DILocation(line: 4881, column: 44, scope: !4698)
!4705 = !DILocation(line: 4881, column: 10, scope: !4698)
!4706 = !DILocation(line: 4881, column: 3, scope: !4698)
!4707 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !70, file: !70, line: 4903, type: !907, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4708 = !DILocalVariable(name: "value", arg: 1, scope: !4707, file: !70, line: 4903, type: !24)
!4709 = !DILocation(line: 4903, column: 26, scope: !4707)
!4710 = !DILocalVariable(name: "factor", arg: 2, scope: !4707, file: !70, line: 4903, type: !24)
!4711 = !DILocation(line: 4903, column: 36, scope: !4707)
!4712 = !DILocation(line: 4905, column: 38, scope: !4707)
!4713 = !DILocation(line: 4905, column: 44, scope: !4707)
!4714 = !DILocation(line: 4905, column: 10, scope: !4707)
!4715 = !DILocation(line: 4905, column: 3, scope: !4707)
!4716 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !70, file: !70, line: 4927, type: !907, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4717 = !DILocalVariable(name: "value", arg: 1, scope: !4716, file: !70, line: 4927, type: !24)
!4718 = !DILocation(line: 4927, column: 28, scope: !4716)
!4719 = !DILocalVariable(name: "factor", arg: 2, scope: !4716, file: !70, line: 4927, type: !24)
!4720 = !DILocation(line: 4927, column: 38, scope: !4716)
!4721 = !DILocation(line: 4929, column: 41, scope: !4716)
!4722 = !DILocation(line: 4929, column: 47, scope: !4716)
!4723 = !DILocation(line: 4929, column: 10, scope: !4716)
!4724 = !DILocation(line: 4929, column: 3, scope: !4716)
!4725 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !70, file: !70, line: 4951, type: !907, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4726 = !DILocalVariable(name: "value", arg: 1, scope: !4725, file: !70, line: 4951, type: !24)
!4727 = !DILocation(line: 4951, column: 26, scope: !4725)
!4728 = !DILocalVariable(name: "factor", arg: 2, scope: !4725, file: !70, line: 4951, type: !24)
!4729 = !DILocation(line: 4951, column: 36, scope: !4725)
!4730 = !DILocation(line: 4953, column: 41, scope: !4725)
!4731 = !DILocation(line: 4953, column: 47, scope: !4725)
!4732 = !DILocation(line: 4953, column: 10, scope: !4725)
!4733 = !DILocation(line: 4953, column: 3, scope: !4725)
!4734 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !70, file: !70, line: 4974, type: !907, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4735 = !DILocalVariable(name: "value", arg: 1, scope: !4734, file: !70, line: 4974, type: !24)
!4736 = !DILocation(line: 4974, column: 26, scope: !4734)
!4737 = !DILocalVariable(name: "factor", arg: 2, scope: !4734, file: !70, line: 4974, type: !24)
!4738 = !DILocation(line: 4974, column: 36, scope: !4734)
!4739 = !DILocation(line: 4976, column: 41, scope: !4734)
!4740 = !DILocation(line: 4976, column: 47, scope: !4734)
!4741 = !DILocation(line: 4976, column: 10, scope: !4734)
!4742 = !DILocation(line: 4976, column: 3, scope: !4734)
!4743 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !70, file: !70, line: 4997, type: !907, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4744 = !DILocalVariable(name: "value", arg: 1, scope: !4743, file: !70, line: 4997, type: !24)
!4745 = !DILocation(line: 4997, column: 25, scope: !4743)
!4746 = !DILocalVariable(name: "factor", arg: 2, scope: !4743, file: !70, line: 4997, type: !24)
!4747 = !DILocation(line: 4997, column: 35, scope: !4743)
!4748 = !DILocation(line: 4999, column: 41, scope: !4743)
!4749 = !DILocation(line: 4999, column: 47, scope: !4743)
!4750 = !DILocation(line: 4999, column: 10, scope: !4743)
!4751 = !DILocation(line: 4999, column: 3, scope: !4743)
!4752 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !70, file: !70, line: 5020, type: !907, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4753 = !DILocalVariable(name: "value", arg: 1, scope: !4752, file: !70, line: 5020, type: !24)
!4754 = !DILocation(line: 5020, column: 26, scope: !4752)
!4755 = !DILocalVariable(name: "factor", arg: 2, scope: !4752, file: !70, line: 5020, type: !24)
!4756 = !DILocation(line: 5020, column: 35, scope: !4752)
!4757 = !DILocation(line: 5022, column: 41, scope: !4752)
!4758 = !DILocation(line: 5022, column: 47, scope: !4752)
!4759 = !DILocation(line: 5022, column: 10, scope: !4752)
!4760 = !DILocation(line: 5022, column: 3, scope: !4752)
!4761 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !70, file: !70, line: 5043, type: !907, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4762 = !DILocalVariable(name: "value", arg: 1, scope: !4761, file: !70, line: 5043, type: !24)
!4763 = !DILocation(line: 5043, column: 25, scope: !4761)
!4764 = !DILocalVariable(name: "factor", arg: 2, scope: !4761, file: !70, line: 5043, type: !24)
!4765 = !DILocation(line: 5043, column: 35, scope: !4761)
!4766 = !DILocation(line: 5045, column: 41, scope: !4761)
!4767 = !DILocation(line: 5045, column: 47, scope: !4761)
!4768 = !DILocation(line: 5045, column: 10, scope: !4761)
!4769 = !DILocation(line: 5045, column: 3, scope: !4761)
!4770 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4771, file: !4771, line: 12, type: !4772, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4775)
!4771 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4772 = !DISubroutineType(types: !4773)
!4773 = !{null, !4774}
!4774 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4775 = !{!4776}
!4776 = !DILocalVariable(name: "z", arg: 1, scope: !4770, file: !4771, line: 12, type: !4774)
!4777 = !DILocation(line: 0, scope: !4770)
!4778 = !DILocation(line: 13, column: 9, scope: !4779)
!4779 = distinct !DILexicalBlock(scope: !4770, file: !4771, line: 13, column: 7)
!4780 = !DILocation(line: 13, column: 7, scope: !4770)
!4781 = !DILocation(line: 14, column: 5, scope: !4779)
!4782 = !DILocation(line: 15, column: 1, scope: !4770)
!4783 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4784, file: !4784, line: 20, type: !4785, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4788)
!4784 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4785 = !DISubroutineType(types: !4786)
!4786 = !{null, !4787, !4787}
!4787 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4788 = !{!4789, !4790}
!4789 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4783, file: !4784, line: 20, type: !4787)
!4790 = !DILocalVariable(name: "shift", arg: 2, scope: !4783, file: !4784, line: 20, type: !4787)
!4791 = !DILocation(line: 0, scope: !4783)
!4792 = !DILocation(line: 21, column: 13, scope: !4793)
!4793 = distinct !DILexicalBlock(scope: !4783, file: !4784, line: 21, column: 7)
!4794 = !DILocation(line: 21, column: 7, scope: !4783)
!4795 = !DILocation(line: 27, column: 5, scope: !4796)
!4796 = distinct !DILexicalBlock(scope: !4793, file: !4784, line: 21, column: 26)
!4797 = !DILocation(line: 29, column: 1, scope: !4783)
