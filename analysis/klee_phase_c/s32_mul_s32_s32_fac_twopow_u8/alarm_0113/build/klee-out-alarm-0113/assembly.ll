; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/build/s32_mul_s32_s32_fac_twopow_u8_alarm_0113.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"power\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"src_analysis/sources/MulHword.c\00", align 1
@.str.1.6 = private unnamed_addr constant [84 x i8] c"KLEE-ALARM-0113: signed overflow. assert (int)arg1_LW * (int)arg2_LW <= 2147483647;\00", align 1
@.str.2.7 = private unnamed_addr constant [20 x i8] c"klee-alarm-0113.err\00", align 1
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
  %value = alloca i32, align 4
  %factor = alloca i32, align 4
  %power = alloca i8, align 1
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %value, metadata !53, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %factor, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i8* %power, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %result, metadata !61, metadata !DIExpression()), !dbg !62
  %0 = bitcast i32* %value to i8*, !dbg !63
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0)), !dbg !64
  %1 = bitcast i32* %factor to i8*, !dbg !65
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @klee_make_symbolic(i8* %power, i64 1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  %2 = load i32, i32* %value, align 4, !dbg !68
  %3 = load i32, i32* %factor, align 4, !dbg !69
  %4 = load i8, i8* %power, align 1, !dbg !70
  %call = call i32 @s32_mul_s32_s32_fac_twopow_u8(i32 %2, i32 %3, i8 zeroext %4), !dbg !71
  store i32 %call, i32* %result, align 4, !dbg !72
  %5 = load i32, i32* %result, align 4, !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %value, i16 zeroext %factor) #0 !dbg !75 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !83, metadata !DIExpression()), !dbg !85
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !85
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !86, metadata !DIExpression()), !dbg !87
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !87
  %0 = load i8, i8* %value.addr, align 1, !dbg !88
  %conv = sext i8 %0 to i32, !dbg !88
  %1 = load i16, i16* %factor.addr, align 2, !dbg !89
  %conv1 = zext i16 %1 to i32, !dbg !89
  %mul = mul nsw i32 %conv, %conv1, !dbg !90
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !91
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !92
  %shr = ashr i32 %2, 16, !dbg !93
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !94
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !95
  %cmp = icmp slt i32 %3, 0, !dbg !97
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !98

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !99
  %and = and i32 %4, 65535, !dbg !100
  %cmp3 = icmp ne i32 %and, 0, !dbg !101
  br i1 %cmp3, label %if.then, label %if.else, !dbg !102

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !103
  %add = add nsw i32 %5, 1, !dbg !105
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !106
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !107
  %conv5 = trunc i32 %6 to i8, !dbg !108
  store i8 %conv5, i8* %retval, align 1, !dbg !109
  br label %return, !dbg !109

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !110
  %conv6 = trunc i32 %7 to i8, !dbg !112
  store i8 %conv6, i8* %retval, align 1, !dbg !113
  br label %return, !dbg !113

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !114
  ret i8 %8, !dbg !114
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %value, i16 zeroext %factor) #0 !dbg !115 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !116, metadata !DIExpression()), !dbg !117
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !122, metadata !DIExpression()), !dbg !123
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !123
  %0 = load i8, i8* %value.addr, align 1, !dbg !124
  %conv = sext i8 %0 to i32, !dbg !124
  %1 = load i16, i16* %factor.addr, align 2, !dbg !125
  %conv1 = zext i16 %1 to i32, !dbg !125
  %mul = mul nsw i32 %conv, %conv1, !dbg !126
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !127
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !128
  %shr = ashr i32 %2, 8, !dbg !129
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !130
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !131
  %cmp = icmp slt i32 %3, 0, !dbg !133
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !134

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !135
  %and = and i32 %4, 255, !dbg !136
  %cmp3 = icmp ne i32 %and, 0, !dbg !137
  br i1 %cmp3, label %if.then, label %if.end, !dbg !138

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !139
  %add = add nsw i32 %5, 1, !dbg !141
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !142
  br label %if.end, !dbg !143

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !144
  %cmp5 = icmp slt i32 %6, 127, !dbg !146
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !147

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !148
  %cmp8 = icmp sgt i32 %7, -128, !dbg !151
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !152

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !153
  %conv11 = trunc i32 %8 to i8, !dbg !155
  store i8 %conv11, i8* %retval, align 1, !dbg !156
  br label %return, !dbg !156

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !157
  br label %return, !dbg !157

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !159
  br label %return, !dbg !159

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !161
  ret i8 %9, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac1(i8 signext %value, i8 zeroext %factor) #0 !dbg !162 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !165, metadata !DIExpression()), !dbg !166
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !167, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !170
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !171, metadata !DIExpression()), !dbg !172
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !172
  %0 = load i8, i8* %value.addr, align 1, !dbg !173
  %conv = sext i8 %0 to i32, !dbg !173
  %1 = load i8, i8* %factor.addr, align 1, !dbg !174
  %conv1 = zext i8 %1 to i32, !dbg !174
  %mul = mul nsw i32 %conv, %conv1, !dbg !175
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !176
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !177
  %shr = ashr i32 %2, 8, !dbg !178
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !179
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !180
  %cmp = icmp slt i32 %3, 0, !dbg !182
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !183

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !184
  %and = and i32 %4, 255, !dbg !185
  %cmp3 = icmp ne i32 %and, 0, !dbg !186
  br i1 %cmp3, label %if.then, label %if.else, !dbg !187

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !188
  %add = add nsw i32 %5, 1, !dbg !190
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !191
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !192
  %conv5 = trunc i32 %6 to i8, !dbg !193
  store i8 %conv5, i8* %retval, align 1, !dbg !194
  br label %return, !dbg !194

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !195
  %conv6 = trunc i32 %7 to i8, !dbg !197
  store i8 %conv6, i8* %retval, align 1, !dbg !198
  br label %return, !dbg !198

return:                                           ; preds = %if.else, %if.then
  %8 = load i8, i8* %retval, align 1, !dbg !199
  ret i8 %8, !dbg !199
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac2(i8 signext %value, i8 zeroext %factor) #0 !dbg !200 {
entry:
  %retval = alloca i8, align 1
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !201, metadata !DIExpression()), !dbg !202
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !208
  %0 = load i8, i8* %value.addr, align 1, !dbg !209
  %conv = sext i8 %0 to i32, !dbg !209
  %1 = load i8, i8* %factor.addr, align 1, !dbg !210
  %conv1 = zext i8 %1 to i32, !dbg !210
  %mul = mul nsw i32 %conv, %conv1, !dbg !211
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !212
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !213
  %shr = ashr i32 %2, 7, !dbg !214
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !215
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !216
  %cmp = icmp slt i32 %3, 0, !dbg !218
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !219

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !220
  %and = and i32 %4, 127, !dbg !221
  %cmp3 = icmp ne i32 %and, 0, !dbg !222
  br i1 %cmp3, label %if.then, label %if.end, !dbg !223

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !224
  %add = add nsw i32 %5, 1, !dbg !226
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !227
  br label %if.end, !dbg !228

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !229
  %cmp5 = icmp slt i32 %6, 127, !dbg !231
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !232

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !233
  %cmp8 = icmp sgt i32 %7, -128, !dbg !236
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !237

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !238
  %conv11 = trunc i32 %8 to i8, !dbg !240
  store i8 %conv11, i8* %retval, align 1, !dbg !241
  br label %return, !dbg !241

if.else12:                                        ; preds = %if.then7
  store i8 -128, i8* %retval, align 1, !dbg !242
  br label %return, !dbg !242

if.else13:                                        ; preds = %if.end
  store i8 127, i8* %retval, align 1, !dbg !244
  br label %return, !dbg !244

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i8, i8* %retval, align 1, !dbg !246
  ret i8 %9, !dbg !246
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !247 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !250, metadata !DIExpression()), !dbg !251
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !254, metadata !DIExpression()), !dbg !255
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !256, metadata !DIExpression()), !dbg !257
  store i32 0, i32* %s32MulTemp, align 4, !dbg !257
  %0 = load i16, i16* %value.addr, align 2, !dbg !258
  %conv = sext i16 %0 to i32, !dbg !258
  %1 = load i16, i16* %factor.addr, align 2, !dbg !259
  %conv1 = sext i16 %1 to i32, !dbg !259
  %mul = mul nsw i32 %conv, %conv1, !dbg !260
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !261
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !262
  %3 = load i32, i32* %count.addr, align 4, !dbg !263
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !264
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !264
  %div = sdiv i32 %2, %3, !dbg !264, !klee.check.div !265
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !266
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !267
  %conv2 = trunc i32 %4 to i16, !dbg !267
  ret i16 %conv2, !dbg !268
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %value, i16 signext %factor, i32 %count) #0 !dbg !269 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !270, metadata !DIExpression()), !dbg !271
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !272, metadata !DIExpression()), !dbg !273
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !276, metadata !DIExpression()), !dbg !277
  store i32 0, i32* %s32MulTemp, align 4, !dbg !277
  %0 = load i16, i16* %value.addr, align 2, !dbg !278
  %conv = sext i16 %0 to i32, !dbg !278
  %1 = load i16, i16* %factor.addr, align 2, !dbg !279
  %conv1 = sext i16 %1 to i32, !dbg !279
  %mul = mul nsw i32 %conv, %conv1, !dbg !280
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !281
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !282
  %3 = load i32, i32* %count.addr, align 4, !dbg !283
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !284
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !284
  %div = sdiv i32 %2, %3, !dbg !284, !klee.check.div !265
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !285
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !286
  %cmp = icmp slt i32 %4, 32767, !dbg !288
  br i1 %cmp, label %if.then, label %if.else7, !dbg !289

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !290
  %cmp3 = icmp sgt i32 %5, -32768, !dbg !293
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !294

if.then5:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !295
  %conv6 = trunc i32 %6 to i16, !dbg !297
  store i16 %conv6, i16* %retval, align 2, !dbg !298
  br label %return, !dbg !298

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !299
  br label %return, !dbg !299

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !301
  br label %return, !dbg !301

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %7 = load i16, i16* %retval, align 2, !dbg !303
  ret i16 %7, !dbg !303
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1(i16 signext %value, i16 signext %factor) #0 !dbg !304 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !307, metadata !DIExpression()), !dbg !308
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !309, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !311, metadata !DIExpression()), !dbg !312
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !312
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !313, metadata !DIExpression()), !dbg !314
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !314
  %0 = load i16, i16* %value.addr, align 2, !dbg !315
  %conv = sext i16 %0 to i32, !dbg !315
  %1 = load i16, i16* %factor.addr, align 2, !dbg !316
  %conv1 = sext i16 %1 to i32, !dbg !316
  %mul = mul nsw i32 %conv, %conv1, !dbg !317
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !318
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !319
  %shr = ashr i32 %2, 15, !dbg !320
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !321
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !322
  %cmp = icmp slt i32 %3, 0, !dbg !324
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !325

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !326
  %and = and i32 %4, 32767, !dbg !327
  %cmp3 = icmp ne i32 %and, 0, !dbg !328
  br i1 %cmp3, label %if.then, label %if.end, !dbg !329

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !330
  %add = add nsw i32 %5, 1, !dbg !332
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !333
  br label %if.end, !dbg !334

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !335
  %cmp5 = icmp slt i32 %6, 32767, !dbg !337
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !338

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !339
  %conv8 = trunc i32 %7 to i16, !dbg !341
  store i16 %conv8, i16* %retval, align 2, !dbg !342
  br label %return, !dbg !342

if.else9:                                         ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !343
  br label %return, !dbg !343

return:                                           ; preds = %if.else9, %if.then7
  %8 = load i16, i16* %retval, align 2, !dbg !345
  ret i16 %8, !dbg !345
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2(i16 signext %value, i16 signext %factor) #0 !dbg !346 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !347, metadata !DIExpression()), !dbg !348
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !349, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !353, metadata !DIExpression()), !dbg !354
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !354
  %0 = load i16, i16* %value.addr, align 2, !dbg !355
  %conv = sext i16 %0 to i32, !dbg !355
  %1 = load i16, i16* %factor.addr, align 2, !dbg !356
  %conv1 = sext i16 %1 to i32, !dbg !356
  %mul = mul nsw i32 %conv, %conv1, !dbg !357
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !358
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !359
  %shr = ashr i32 %2, 14, !dbg !360
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !361
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !362
  %cmp = icmp slt i32 %3, 0, !dbg !364
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !365

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !366
  %and = and i32 %4, 16383, !dbg !367
  %cmp3 = icmp ne i32 %and, 0, !dbg !368
  br i1 %cmp3, label %if.then, label %if.end, !dbg !369

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !370
  %add = add nsw i32 %5, 1, !dbg !372
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !373
  br label %if.end, !dbg !374

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !375
  %cmp5 = icmp slt i32 %6, 32767, !dbg !377
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !378

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !379
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !382
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !383

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !384
  %conv11 = trunc i32 %8 to i16, !dbg !386
  store i16 %conv11, i16* %retval, align 2, !dbg !387
  br label %return, !dbg !387

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !388
  br label %return, !dbg !388

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !392
  ret i16 %9, !dbg !392
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %value, i16 zeroext %factor) #0 !dbg !393 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !396, metadata !DIExpression()), !dbg !397
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !398, metadata !DIExpression()), !dbg !399
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !400, metadata !DIExpression()), !dbg !401
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !401
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !402, metadata !DIExpression()), !dbg !403
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !403
  %0 = load i16, i16* %value.addr, align 2, !dbg !404
  %conv = sext i16 %0 to i32, !dbg !404
  %1 = load i16, i16* %factor.addr, align 2, !dbg !405
  %conv1 = zext i16 %1 to i32, !dbg !405
  %mul = mul nsw i32 %conv, %conv1, !dbg !406
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !407
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !408
  %shr = ashr i32 %2, 16, !dbg !409
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !410
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !411
  %cmp = icmp slt i32 %3, 0, !dbg !413
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !414

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !415
  %and = and i32 %4, 32767, !dbg !416
  %cmp3 = icmp ne i32 %and, 0, !dbg !417
  br i1 %cmp3, label %if.then, label %if.else, !dbg !418

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !419
  %add = add nsw i32 %5, 1, !dbg !421
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !422
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !423
  %conv5 = trunc i32 %6 to i16, !dbg !424
  store i16 %conv5, i16* %retval, align 2, !dbg !425
  br label %return, !dbg !425

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !426
  %conv6 = trunc i32 %7 to i16, !dbg !428
  store i16 %conv6, i16* %retval, align 2, !dbg !429
  br label %return, !dbg !429

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !430
  ret i16 %8, !dbg !430
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %value, i16 zeroext %factor) #0 !dbg !431 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !432, metadata !DIExpression()), !dbg !433
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !434, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !436, metadata !DIExpression()), !dbg !437
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !437
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !438, metadata !DIExpression()), !dbg !439
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !439
  %0 = load i16, i16* %value.addr, align 2, !dbg !440
  %conv = sext i16 %0 to i32, !dbg !440
  %1 = load i16, i16* %factor.addr, align 2, !dbg !441
  %conv1 = zext i16 %1 to i32, !dbg !441
  %mul = mul nsw i32 %conv, %conv1, !dbg !442
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !443
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !444
  %shr = ashr i32 %2, 8, !dbg !445
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !446
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !447
  %cmp = icmp slt i32 %3, 0, !dbg !449
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !450

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !451
  %and = and i32 %4, 255, !dbg !452
  %cmp3 = icmp ne i32 %and, 0, !dbg !453
  br i1 %cmp3, label %if.then, label %if.end, !dbg !454

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !455
  %add = add nsw i32 %5, 1, !dbg !457
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !458
  br label %if.end, !dbg !459

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !460
  %cmp5 = icmp slt i32 %6, 32767, !dbg !462
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !463

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !464
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !467
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !468

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !469
  %conv11 = trunc i32 %8 to i16, !dbg !471
  store i16 %conv11, i16* %retval, align 2, !dbg !472
  br label %return, !dbg !472

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !473
  br label %return, !dbg !473

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !475
  br label %return, !dbg !475

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !477
  ret i16 %9, !dbg !477
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac1(i16 signext %value, i8 zeroext %factor) #0 !dbg !478 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !481, metadata !DIExpression()), !dbg !482
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !483, metadata !DIExpression()), !dbg !484
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !485, metadata !DIExpression()), !dbg !486
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !486
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !487, metadata !DIExpression()), !dbg !488
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !488
  %0 = load i16, i16* %value.addr, align 2, !dbg !489
  %conv = sext i16 %0 to i32, !dbg !489
  %1 = load i8, i8* %factor.addr, align 1, !dbg !490
  %conv1 = zext i8 %1 to i32, !dbg !490
  %mul = mul nsw i32 %conv, %conv1, !dbg !491
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !492
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !493
  %shr = ashr i32 %2, 8, !dbg !494
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !495
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !496
  %cmp = icmp slt i32 %3, 0, !dbg !498
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !499

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !500
  %and = and i32 %4, 255, !dbg !501
  %cmp3 = icmp ne i32 %and, 0, !dbg !502
  br i1 %cmp3, label %if.then, label %if.else, !dbg !503

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !504
  %add = add nsw i32 %5, 1, !dbg !506
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !507
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !508
  %conv5 = trunc i32 %6 to i16, !dbg !508
  store i16 %conv5, i16* %retval, align 2, !dbg !509
  br label %return, !dbg !509

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !510
  %conv6 = trunc i32 %7 to i16, !dbg !510
  store i16 %conv6, i16* %retval, align 2, !dbg !512
  br label %return, !dbg !512

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !513
  ret i16 %8, !dbg !513
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac2(i16 signext %value, i8 zeroext %factor) #0 !dbg !514 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !515, metadata !DIExpression()), !dbg !516
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !517, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !519, metadata !DIExpression()), !dbg !520
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !520
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !521, metadata !DIExpression()), !dbg !522
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !522
  %0 = load i16, i16* %value.addr, align 2, !dbg !523
  %conv = sext i16 %0 to i32, !dbg !523
  %1 = load i8, i8* %factor.addr, align 1, !dbg !524
  %conv1 = zext i8 %1 to i32, !dbg !524
  %mul = mul nsw i32 %conv, %conv1, !dbg !525
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !526
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !527
  %shr = ashr i32 %2, 7, !dbg !528
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !529
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !530
  %cmp = icmp slt i32 %3, 0, !dbg !532
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !533

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !534
  %and = and i32 %4, 127, !dbg !535
  %cmp3 = icmp ne i32 %and, 0, !dbg !536
  br i1 %cmp3, label %if.then, label %if.end, !dbg !537

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !538
  %add = add nsw i32 %5, 1, !dbg !540
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !541
  br label %if.end, !dbg !542

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !543
  %cmp5 = icmp slt i32 %6, 32767, !dbg !545
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !546

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !547
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !550
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !551

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !552
  %conv11 = trunc i32 %8 to i16, !dbg !554
  store i16 %conv11, i16* %retval, align 2, !dbg !555
  br label %return, !dbg !555

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !556
  br label %return, !dbg !556

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !558
  br label %return, !dbg !558

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !560
  ret i16 %9, !dbg !560
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16(i16 signext %value, i16 zeroext %factor) #0 !dbg !561 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !562, metadata !DIExpression()), !dbg !563
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !564, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !566, metadata !DIExpression()), !dbg !567
  store i32 0, i32* %s32MulTemp, align 4, !dbg !567
  %0 = load i16, i16* %value.addr, align 2, !dbg !568
  %conv = sext i16 %0 to i32, !dbg !568
  %1 = load i16, i16* %factor.addr, align 2, !dbg !569
  %conv1 = zext i16 %1 to i32, !dbg !569
  %mul = mul nsw i32 %conv, %conv1, !dbg !570
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !571
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !572
  %cmp = icmp slt i32 %2, 32767, !dbg !574
  br i1 %cmp, label %if.then, label %if.else7, !dbg !575

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32MulTemp, align 4, !dbg !576
  %cmp3 = icmp sgt i32 %3, -32768, !dbg !579
  br i1 %cmp3, label %if.then5, label %if.else, !dbg !580

if.then5:                                         ; preds = %if.then
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !581
  %conv6 = trunc i32 %4 to i16, !dbg !583
  store i16 %conv6, i16* %retval, align 2, !dbg !584
  br label %return, !dbg !584

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !585
  br label %return, !dbg !585

if.else7:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !587
  br label %return, !dbg !587

return:                                           ; preds = %if.else7, %if.else, %if.then5
  %5 = load i16, i16* %retval, align 2, !dbg !589
  ret i16 %5, !dbg !589
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %value, i16 zeroext %factor, i32 %count) #0 !dbg !590 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i32, align 4
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !593, metadata !DIExpression()), !dbg !594
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !595, metadata !DIExpression()), !dbg !596
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !599, metadata !DIExpression()), !dbg !600
  store i32 0, i32* %s32MulTemp, align 4, !dbg !600
  %0 = load i16, i16* %value.addr, align 2, !dbg !601
  %conv = sext i16 %0 to i32, !dbg !601
  %1 = load i16, i16* %factor.addr, align 2, !dbg !602
  %conv1 = zext i16 %1 to i32, !dbg !602
  %mul = mul nsw i32 %conv, %conv1, !dbg !603
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !604
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !605
  %3 = load i32, i32* %count.addr, align 4, !dbg !606
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !607
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !607
  %div = sdiv i32 %2, %3, !dbg !607, !klee.check.div !265
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !608
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !609
  %conv2 = trunc i32 %4 to i16, !dbg !610
  ret i16 %conv2, !dbg !611
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %value, i16 zeroext %factor, i16 zeroext %count) #0 !dbg !612 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %count.addr = alloca i16, align 2
  %s32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !615, metadata !DIExpression()), !dbg !616
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !617, metadata !DIExpression()), !dbg !618
  store i16 %count, i16* %count.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %count.addr, metadata !619, metadata !DIExpression()), !dbg !620
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp, metadata !621, metadata !DIExpression()), !dbg !622
  store i32 0, i32* %s32MulTemp, align 4, !dbg !622
  %0 = load i16, i16* %value.addr, align 2, !dbg !623
  %conv = sext i16 %0 to i32, !dbg !623
  %1 = load i16, i16* %factor.addr, align 2, !dbg !624
  %conv1 = zext i16 %1 to i32, !dbg !624
  %mul = mul nsw i32 %conv, %conv1, !dbg !625
  store i32 %mul, i32* %s32MulTemp, align 4, !dbg !626
  %2 = load i32, i32* %s32MulTemp, align 4, !dbg !627
  %3 = load i16, i16* %count.addr, align 2, !dbg !628
  %conv2 = zext i16 %3 to i32, !dbg !628
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !629
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !629
  %div = sdiv i32 %2, %conv2, !dbg !629, !klee.check.div !265
  store i32 %div, i32* %s32MulTemp, align 4, !dbg !630
  %4 = load i32, i32* %s32MulTemp, align 4, !dbg !631
  %cmp = icmp slt i32 %4, 32767, !dbg !633
  br i1 %cmp, label %if.then, label %if.else8, !dbg !634

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %s32MulTemp, align 4, !dbg !635
  %cmp4 = icmp sgt i32 %5, -32768, !dbg !638
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !639

if.then6:                                         ; preds = %if.then
  %6 = load i32, i32* %s32MulTemp, align 4, !dbg !640
  %conv7 = trunc i32 %6 to i16, !dbg !642
  store i16 %conv7, i16* %retval, align 2, !dbg !643
  br label %return, !dbg !643

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !644
  br label %return, !dbg !644

if.else8:                                         ; preds = %entry
  store i16 32767, i16* %retval, align 2, !dbg !646
  br label %return, !dbg !646

return:                                           ; preds = %if.else8, %if.else, %if.then6
  %7 = load i16, i16* %retval, align 2, !dbg !648
  ret i16 %7, !dbg !648
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1(i16 signext %value, i16 zeroext %factor) #0 !dbg !649 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !650, metadata !DIExpression()), !dbg !651
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !652, metadata !DIExpression()), !dbg !653
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !654, metadata !DIExpression()), !dbg !655
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !655
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !656, metadata !DIExpression()), !dbg !657
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !657
  %0 = load i16, i16* %value.addr, align 2, !dbg !658
  %conv = sext i16 %0 to i32, !dbg !658
  %1 = load i16, i16* %factor.addr, align 2, !dbg !659
  %conv1 = zext i16 %1 to i32, !dbg !659
  %mul = mul nsw i32 %conv, %conv1, !dbg !660
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !661
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !662
  %shr = ashr i32 %2, 16, !dbg !663
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !664
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !665
  %cmp = icmp slt i32 %3, 0, !dbg !667
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !668

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !669
  %and = and i32 %4, 65535, !dbg !670
  %cmp3 = icmp ne i32 %and, 0, !dbg !671
  br i1 %cmp3, label %if.then, label %if.else, !dbg !672

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !673
  %add = add nsw i32 %5, 1, !dbg !675
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !676
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !677
  %conv5 = trunc i32 %6 to i16, !dbg !678
  store i16 %conv5, i16* %retval, align 2, !dbg !679
  br label %return, !dbg !679

if.else:                                          ; preds = %land.lhs.true, %entry
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !680
  %conv6 = trunc i32 %7 to i16, !dbg !682
  store i16 %conv6, i16* %retval, align 2, !dbg !683
  br label %return, !dbg !683

return:                                           ; preds = %if.else, %if.then
  %8 = load i16, i16* %retval, align 2, !dbg !684
  ret i16 %8, !dbg !684
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2(i16 signext %value, i16 zeroext %factor) #0 !dbg !685 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %s32MulTemp1 = alloca i32, align 4
  %s32MulTemp2 = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !686, metadata !DIExpression()), !dbg !687
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !688, metadata !DIExpression()), !dbg !689
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp1, metadata !690, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %s32MulTemp1, align 4, !dbg !691
  call void @llvm.dbg.declare(metadata i32* %s32MulTemp2, metadata !692, metadata !DIExpression()), !dbg !693
  store i32 0, i32* %s32MulTemp2, align 4, !dbg !693
  %0 = load i16, i16* %value.addr, align 2, !dbg !694
  %conv = sext i16 %0 to i32, !dbg !694
  %1 = load i16, i16* %factor.addr, align 2, !dbg !695
  %conv1 = zext i16 %1 to i32, !dbg !695
  %mul = mul nsw i32 %conv, %conv1, !dbg !696
  store i32 %mul, i32* %s32MulTemp1, align 4, !dbg !697
  %2 = load i32, i32* %s32MulTemp1, align 4, !dbg !698
  %shr = ashr i32 %2, 15, !dbg !699
  store i32 %shr, i32* %s32MulTemp2, align 4, !dbg !700
  %3 = load i32, i32* %s32MulTemp1, align 4, !dbg !701
  %cmp = icmp slt i32 %3, 0, !dbg !703
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !704

land.lhs.true:                                    ; preds = %entry
  %4 = load i32, i32* %s32MulTemp1, align 4, !dbg !705
  %and = and i32 %4, 32767, !dbg !706
  %cmp3 = icmp ne i32 %and, 0, !dbg !707
  br i1 %cmp3, label %if.then, label %if.end, !dbg !708

if.then:                                          ; preds = %land.lhs.true
  %5 = load i32, i32* %s32MulTemp2, align 4, !dbg !709
  %add = add nsw i32 %5, 1, !dbg !711
  store i32 %add, i32* %s32MulTemp2, align 4, !dbg !712
  br label %if.end, !dbg !713

if.end:                                           ; preds = %entry, %land.lhs.true, %if.then
  %6 = load i32, i32* %s32MulTemp2, align 4, !dbg !714
  %cmp5 = icmp slt i32 %6, 32767, !dbg !716
  br i1 %cmp5, label %if.then7, label %if.else13, !dbg !717

if.then7:                                         ; preds = %if.end
  %7 = load i32, i32* %s32MulTemp2, align 4, !dbg !718
  %cmp8 = icmp sgt i32 %7, -32768, !dbg !721
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !722

if.then10:                                        ; preds = %if.then7
  %8 = load i32, i32* %s32MulTemp2, align 4, !dbg !723
  %conv11 = trunc i32 %8 to i16, !dbg !725
  store i16 %conv11, i16* %retval, align 2, !dbg !726
  br label %return, !dbg !726

if.else12:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !727
  br label %return, !dbg !727

if.else13:                                        ; preds = %if.end
  store i16 32767, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

return:                                           ; preds = %if.else13, %if.else12, %if.then10
  %9 = load i16, i16* %retval, align 2, !dbg !731
  ret i16 %9, !dbg !731
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !732 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  %u32MulTemp = alloca i32, align 4
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !735, metadata !DIExpression()), !dbg !736
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !737, metadata !DIExpression()), !dbg !738
  call void @llvm.dbg.declare(metadata i32* %u32MulTemp, metadata !739, metadata !DIExpression()), !dbg !744
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
  %div = sdiv i32 %3, %4, !dbg !805, !klee.check.div !265
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
  %div12 = udiv i32 2147483647, %conv11, !dbg !822, !klee.check.div !265
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
  %div = sdiv i32 %conv3, %conv4, !dbg !853, !klee.check.div !265
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
  %div = sdiv i32 %conv3, %conv4, !dbg !875, !klee.check.div !265
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
  %div = udiv i32 %2, %3, !dbg !1039, !klee.check.div !265
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
  %div = udiv i32 %2, %conv2, !dbg !1062, !klee.check.div !265
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
  %div = udiv i32 -1, %conv2, !dbg !1135, !klee.check.div !265
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
  %shr = lshr i32 %4, %5, !dbg !1175, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !1176
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !1177
  %7 = load i32, i32* %count.addr, align 4, !dbg !1178
  %sub = sub i32 32, %7, !dbg !1179
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !1180
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !1180
  %shl = shl i32 %6, %sub, !dbg !1180, !klee.check.shift !265
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !1181
  %or = or i32 %8, %shl, !dbg !1181
  store i32 %or, i32* %u32Temp1, align 4, !dbg !1181
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !1182
  %10 = load i32, i32* %count.addr, align 4, !dbg !1184
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1185
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !1185
  %shr2 = lshr i32 %9, %10, !dbg !1185, !klee.check.shift !265
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
  %div = udiv i32 -1, %1, !dbg !1339, !klee.check.div !265
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
  %div = udiv i32 -1, %1, !dbg !1430, !klee.check.div !265
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
  %div = udiv i32 -2147483648, %4, !dbg !1729, !klee.check.div !265
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
  %div8 = sdiv i32 2147483647, %8, !dbg !1743, !klee.check.div !265
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
  %shr = lshr i32 %6, %sub, !dbg !2503, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !2504
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2505
  %9 = load i8, i8* %power.addr, align 1, !dbg !2506
  %conv9 = zext i8 %9 to i32, !dbg !2506
  %int_cast_to_i641 = zext i32 %conv9 to i64, !dbg !2507
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2507
  %shl = shl i32 %8, %conv9, !dbg !2507, !klee.check.shift !265
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2508
  %or = or i32 %10, %shl, !dbg !2508
  store i32 %or, i32* %u32Temp1, align 4, !dbg !2508
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2509
  %12 = load i8, i8* %power.addr, align 1, !dbg !2511
  %conv10 = zext i8 %12 to i32, !dbg !2511
  %sub11 = sub nsw i32 32, %conv10, !dbg !2512
  %int_cast_to_i642 = zext i32 %sub11 to i64, !dbg !2513
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2513
  %shr12 = lshr i32 %11, %sub11, !dbg !2513, !klee.check.shift !265
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
  %or.cond1 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2561
  br i1 %or.cond1, label %if.then17, label %if.else18, !dbg !2561

if.then17:                                        ; preds = %lor.lhs.false, %if.end7
  store i8 1, i8* %u8SignBit, align 1, !dbg !2562
  br label %if.end19, !dbg !2564

if.else18:                                        ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2565
  br label %if.end19

if.end19:                                         ; preds = %if.else18, %if.then17
  %6 = load i32, i32* %value.addr, align 4, !dbg !2567
  %cmp20 = icmp slt i32 %6, 0, !dbg !2569
  br i1 %cmp20, label %if.then22, label %if.else26, !dbg !2570

if.then22:                                        ; preds = %if.end19
  %7 = load i32, i32* %value.addr, align 4, !dbg !2571
  %conv23 = sext i32 %7 to i64, !dbg !2574
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv23), !dbg !2575
  %tobool = icmp ne i32 %call, 0, !dbg !2575
  br i1 %tobool, label %if.end25, label %if.then24, !dbg !2576

if.then24:                                        ; preds = %if.then22
  store i32 0, i32* %retval, align 4, !dbg !2577
  br label %return, !dbg !2577

if.end25:                                         ; preds = %if.then22
  %8 = load i32, i32* %value.addr, align 4, !dbg !2579
  %sub = sub nsw i32 0, %8, !dbg !2580
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2581
  br label %if.end27, !dbg !2582

if.else26:                                        ; preds = %if.end19
  %9 = load i32, i32* %value.addr, align 4, !dbg !2583
  store i32 %9, i32* %u32Temp1, align 4, !dbg !2585
  br label %if.end27

if.end27:                                         ; preds = %if.else26, %if.end25
  %10 = load i32, i32* %factor.addr, align 4, !dbg !2586
  %cmp28 = icmp slt i32 %10, 0, !dbg !2588
  br i1 %cmp28, label %if.then30, label %if.else37, !dbg !2589

if.then30:                                        ; preds = %if.end27
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2590
  %conv31 = sext i32 %11 to i64, !dbg !2593
  %call32 = call i32 @klee_alarm_s32_neg_valid(i64 %conv31), !dbg !2594
  %tobool33 = icmp ne i32 %call32, 0, !dbg !2594
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !2595

if.then34:                                        ; preds = %if.then30
  store i32 0, i32* %retval, align 4, !dbg !2596
  br label %return, !dbg !2596

if.end35:                                         ; preds = %if.then30
  %12 = load i32, i32* %factor.addr, align 4, !dbg !2598
  %sub36 = sub nsw i32 0, %12, !dbg !2599
  store i32 %sub36, i32* %u32Temp2, align 4, !dbg !2600
  br label %if.end38, !dbg !2601

if.else37:                                        ; preds = %if.end27
  %13 = load i32, i32* %factor.addr, align 4, !dbg !2602
  store i32 %13, i32* %u32Temp2, align 4, !dbg !2604
  br label %if.end38

if.end38:                                         ; preds = %if.else37, %if.end35
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2605
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2606
  %mul = mul i32 %14, %15, !dbg !2607
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2608
  %16 = load i32, i32* %u32Temp1, align 4, !dbg !2609
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !2610
  %call39 = call i32 @MulHighWord(i32 %16, i32 %17), !dbg !2611
  store i32 %call39, i32* %u32Temp4, align 4, !dbg !2612
  store i32 0, i32* %retval, align 4, !dbg !2613
  br label %return, !dbg !2613

return:                                           ; preds = %if.end38, %if.then34, %if.then24
  %18 = load i32, i32* %retval, align 4, !dbg !2614
  ret i32 %18, !dbg !2614
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2615 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2618, metadata !DIExpression()), !dbg !2619
  %0 = load i64, i64* %value.addr, align 8, !dbg !2620
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2621
  %conv = zext i1 %cmp to i32, !dbg !2621
  ret i32 %conv, !dbg !2622
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2623 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2626, metadata !DIExpression()), !dbg !2627
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2628, metadata !DIExpression()), !dbg !2629
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2630, metadata !DIExpression()), !dbg !2631
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2632, metadata !DIExpression()), !dbg !2633
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2634, metadata !DIExpression()), !dbg !2635
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2636, metadata !DIExpression()), !dbg !2637
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2638, metadata !DIExpression()), !dbg !2639
  %0 = load i32, i32* %value.addr, align 4, !dbg !2640
  %cmp = icmp slt i32 %0, 0, !dbg !2642
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2643

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2644
  %conv = sext i8 %1 to i32, !dbg !2644
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2645
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2646

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2647
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2648
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2649

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2650
  %conv6 = sext i8 %3 to i32, !dbg !2650
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2651
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2652

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2653
  br label %if.end, !dbg !2655

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2656
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2658
  %cmp9 = icmp slt i32 %4, 0, !dbg !2660
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2661

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2662
  %sub = sub nsw i32 0, %5, !dbg !2664
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2665
  br label %if.end13, !dbg !2666

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2667
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2669
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2670
  %conv14 = sext i8 %7 to i32, !dbg !2670
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2672
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2673

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2674
  %conv18 = sext i8 %8 to i32, !dbg !2674
  %sub19 = sub nsw i32 0, %conv18, !dbg !2676
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2677
  br label %if.end22, !dbg !2678

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2679
  %conv21 = sext i8 %9 to i32, !dbg !2679
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2681
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2682
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2683
  %mul = mul i32 %10, %11, !dbg !2684
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2685
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2686
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2687
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2688
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2689
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2690
  %shr = lshr i32 %14, 7, !dbg !2691
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2692
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2693
  %shl = shl i32 %15, 25, !dbg !2694
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2695
  %or = or i32 %16, %shl, !dbg !2695
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2695
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2696
  %conv23 = zext i8 %17 to i32, !dbg !2696
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2698
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2699

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2700
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2703
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2704

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2705
  store i32 %19, i32* %retval, align 4, !dbg !2706
  br label %return, !dbg !2706

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2707
  br label %return, !dbg !2707

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2708
  %sub32 = sub i32 0, %20, !dbg !2710
  store i32 %sub32, i32* %retval, align 4, !dbg !2711
  br label %return, !dbg !2711

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2712
  ret i32 %21, !dbg !2712
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2713 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2714, metadata !DIExpression()), !dbg !2715
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2716, metadata !DIExpression()), !dbg !2717
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2718, metadata !DIExpression()), !dbg !2719
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2720, metadata !DIExpression()), !dbg !2721
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2722, metadata !DIExpression()), !dbg !2723
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2724, metadata !DIExpression()), !dbg !2725
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2726, metadata !DIExpression()), !dbg !2727
  %0 = load i32, i32* %value.addr, align 4, !dbg !2728
  %cmp = icmp slt i32 %0, 0, !dbg !2730
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2731

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2732
  %conv = sext i8 %1 to i32, !dbg !2732
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2733
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2734

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2735
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2736
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2737

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2738
  %conv6 = sext i8 %3 to i32, !dbg !2738
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2739
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2740

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2741
  br label %if.end, !dbg !2743

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2744
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2746
  %cmp9 = icmp slt i32 %4, 0, !dbg !2748
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2749

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2750
  %sub = sub nsw i32 0, %5, !dbg !2752
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2753
  br label %if.end13, !dbg !2754

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2755
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2757
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2758
  %conv14 = sext i8 %7 to i32, !dbg !2758
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2760
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2761

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2762
  %conv18 = sext i8 %8 to i32, !dbg !2762
  %sub19 = sub nsw i32 0, %conv18, !dbg !2764
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2765
  br label %if.end22, !dbg !2766

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2767
  %conv21 = sext i8 %9 to i32, !dbg !2767
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2769
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2770
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2771
  %mul = mul i32 %10, %11, !dbg !2772
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2773
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2774
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2775
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2776
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2777
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2778
  %shr = lshr i32 %14, 6, !dbg !2779
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2780
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2781
  %shl = shl i32 %15, 26, !dbg !2782
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2783
  %or = or i32 %16, %shl, !dbg !2783
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2783
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2784
  %shr23 = lshr i32 %17, 6, !dbg !2786
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2787
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2788

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2789
  %conv27 = zext i8 %18 to i32, !dbg !2789
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2792
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2793

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2794
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2797
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2798

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2799
  store i32 %20, i32* %retval, align 4, !dbg !2800
  br label %return, !dbg !2800

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2801
  br label %return, !dbg !2801

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2802
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2805
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2806

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2807
  %sub39 = sub i32 0, %22, !dbg !2808
  store i32 %sub39, i32* %retval, align 4, !dbg !2809
  br label %return, !dbg !2809

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2810
  br label %return, !dbg !2810

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2811
  br label %return, !dbg !2811

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2813
  ret i32 %23, !dbg !2813
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2814 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2815, metadata !DIExpression()), !dbg !2816
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2817, metadata !DIExpression()), !dbg !2818
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2819, metadata !DIExpression()), !dbg !2820
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2821, metadata !DIExpression()), !dbg !2822
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2823, metadata !DIExpression()), !dbg !2824
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2825, metadata !DIExpression()), !dbg !2826
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2827, metadata !DIExpression()), !dbg !2828
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2829
  %cmp = icmp slt i32 %0, 0, !dbg !2831
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2832
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2832

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2833
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2834
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2835
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2835

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2836
  br label %if.end, !dbg !2838

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2839
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2841
  %cmp5 = icmp slt i32 %4, 0, !dbg !2843
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2844

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2845
  %sub = sub nsw i32 0, %5, !dbg !2847
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2848
  br label %if.end8, !dbg !2849

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2850
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2852
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2853
  %cmp9 = icmp slt i32 %7, 0, !dbg !2855
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2856

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2857
  %sub11 = sub nsw i32 0, %8, !dbg !2859
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2860
  br label %if.end13, !dbg !2861

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2862
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2864
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2865
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2866
  %mul = mul i32 %10, %11, !dbg !2867
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2868
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2869
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2870
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2871
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2872
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2873
  %cmp14 = icmp eq i32 %14, 0, !dbg !2875
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2876

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2877
  %conv = zext i8 %15 to i32, !dbg !2877
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2880
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2881

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2882
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2885
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2886

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2887
  store i32 %17, i32* %retval, align 4, !dbg !2888
  br label %return, !dbg !2888

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2889
  br label %return, !dbg !2889

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2890
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2893
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2894

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2895
  %sub27 = sub i32 0, %19, !dbg !2896
  store i32 %sub27, i32* %retval, align 4, !dbg !2897
  br label %return, !dbg !2897

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2898
  br label %return, !dbg !2898

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2899
  %conv30 = zext i8 %20 to i32, !dbg !2899
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2902
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2903

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2904
  br label %return, !dbg !2904

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2906
  br label %return, !dbg !2906

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2908
  ret i32 %21, !dbg !2908
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2909 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2910, metadata !DIExpression()), !dbg !2911
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2912, metadata !DIExpression()), !dbg !2913
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2914, metadata !DIExpression()), !dbg !2915
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2916, metadata !DIExpression()), !dbg !2917
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2918, metadata !DIExpression()), !dbg !2919
  %0 = load i32, i32* %value.addr, align 4, !dbg !2920
  %cmp = icmp slt i32 %0, 0, !dbg !2922
  br i1 %cmp, label %if.then, label %if.else, !dbg !2923

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2924
  %sub = sub nsw i32 0, %1, !dbg !2926
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2927
  store i8 1, i8* %u8SignBit, align 1, !dbg !2928
  br label %if.end, !dbg !2929

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2930
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2932
  store i8 0, i8* %u8SignBit, align 1, !dbg !2933
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2934
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2935
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2936
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2937
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2938
  %shr = lshr i32 %5, 1, !dbg !2939
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2940
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2941
  %conv = zext i8 %6 to i32, !dbg !2941
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2943
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2944

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2945
  store i32 %7, i32* %retval, align 4, !dbg !2947
  br label %return, !dbg !2947

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2948
  %sub5 = sub i32 0, %8, !dbg !2950
  store i32 %sub5, i32* %retval, align 4, !dbg !2951
  br label %return, !dbg !2951

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2952
  ret i32 %9, !dbg !2952
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2953 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2954, metadata !DIExpression()), !dbg !2955
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2956, metadata !DIExpression()), !dbg !2957
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2958, metadata !DIExpression()), !dbg !2959
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2960, metadata !DIExpression()), !dbg !2961
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2962, metadata !DIExpression()), !dbg !2963
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2964, metadata !DIExpression()), !dbg !2965
  %0 = load i32, i32* %value.addr, align 4, !dbg !2966
  %cmp = icmp slt i32 %0, 0, !dbg !2968
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2969
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2969

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2970
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2971
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2972
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2972

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2973
  br label %if.end, !dbg !2975

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2976
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2978
  %cmp5 = icmp slt i32 %4, 0, !dbg !2980
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2981

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2982
  %sub = sub nsw i32 0, %5, !dbg !2984
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2985
  br label %if.end8, !dbg !2986

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2987
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2989
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !2990
  %cmp9 = icmp slt i32 %7, 0, !dbg !2992
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2993

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !2994
  %sub11 = sub nsw i32 0, %8, !dbg !2996
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2997
  br label %if.end13, !dbg !2998

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !2999
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3001
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3002
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3003
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3004
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3005
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3006
  %conv = zext i8 %12 to i32, !dbg !3006
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3008
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3009

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3010
  store i32 %13, i32* %retval, align 4, !dbg !3012
  br label %return, !dbg !3012

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3013
  %sub18 = sub i32 0, %14, !dbg !3015
  store i32 %sub18, i32* %retval, align 4, !dbg !3016
  br label %return, !dbg !3016

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3017
  ret i32 %15, !dbg !3017
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3018 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3021, metadata !DIExpression()), !dbg !3022
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3023, metadata !DIExpression()), !dbg !3024
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3025, metadata !DIExpression()), !dbg !3026
  store i32 0, i32* %u32Temp1, align 4, !dbg !3026
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3027, metadata !DIExpression()), !dbg !3028
  store i32 0, i32* %u32Temp2, align 4, !dbg !3028
  %0 = load i32, i32* %value.addr, align 4, !dbg !3029
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3030
  %conv = zext i8 %1 to i32, !dbg !3030
  %mul = mul i32 %0, %conv, !dbg !3031
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3032
  %2 = load i32, i32* %value.addr, align 4, !dbg !3033
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3034
  %conv1 = zext i8 %3 to i32, !dbg !3034
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3035
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3036
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3037
  %shr = lshr i32 %4, 8, !dbg !3038
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3039
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3040
  %shl = shl i32 %5, 24, !dbg !3041
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3042
  %or = or i32 %6, %shl, !dbg !3042
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3042
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3043
  ret i32 %7, !dbg !3044
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3045 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3046, metadata !DIExpression()), !dbg !3047
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3048, metadata !DIExpression()), !dbg !3049
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3050, metadata !DIExpression()), !dbg !3051
  store i32 0, i32* %u32Temp1, align 4, !dbg !3051
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3052, metadata !DIExpression()), !dbg !3053
  store i32 0, i32* %u32Temp2, align 4, !dbg !3053
  %0 = load i32, i32* %value.addr, align 4, !dbg !3054
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3055
  %conv = zext i8 %1 to i32, !dbg !3055
  %mul = mul i32 %0, %conv, !dbg !3056
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3057
  %2 = load i32, i32* %value.addr, align 4, !dbg !3058
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3059
  %conv1 = zext i8 %3 to i32, !dbg !3059
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3060
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3061
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3062
  %shr = lshr i32 %4, 7, !dbg !3063
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3064
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3065
  %shl = shl i32 %5, 25, !dbg !3066
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3067
  %or = or i32 %6, %shl, !dbg !3067
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3067
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3068
  %shr2 = lshr i32 %7, 7, !dbg !3070
  %cmp = icmp eq i32 %shr2, 0, !dbg !3071
  br i1 %cmp, label %if.then, label %if.else, !dbg !3072

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3073
  store i32 %8, i32* %retval, align 4, !dbg !3075
  br label %return, !dbg !3075

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3076
  br label %return, !dbg !3076

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3078
  ret i32 %9, !dbg !3078
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3079 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3082, metadata !DIExpression()), !dbg !3083
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3084, metadata !DIExpression()), !dbg !3085
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3086, metadata !DIExpression()), !dbg !3087
  store i32 0, i32* %u32Temp1, align 4, !dbg !3087
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3088, metadata !DIExpression()), !dbg !3089
  store i32 0, i32* %u32Temp2, align 4, !dbg !3089
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3090
  %conv = sext i8 %0 to i32, !dbg !3090
  %cmp = icmp sgt i32 %conv, 0, !dbg !3092
  br i1 %cmp, label %if.then, label %if.else, !dbg !3093

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3094
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3096
  %conv2 = sext i8 %2 to i32, !dbg !3096
  %mul = mul i32 %1, %conv2, !dbg !3097
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3098
  %3 = load i32, i32* %value.addr, align 4, !dbg !3099
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3100
  %conv3 = sext i8 %4 to i32, !dbg !3100
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3101
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3102
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3103
  %shr = lshr i32 %5, 7, !dbg !3104
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3105
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3106
  %shl = shl i32 %6, 25, !dbg !3107
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3108
  %or = or i32 %7, %shl, !dbg !3108
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3108
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3109
  store i32 %8, i32* %retval, align 4, !dbg !3110
  br label %return, !dbg !3110

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3111
  br label %return, !dbg !3111

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3113
  ret i32 %9, !dbg !3113
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3114 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3115, metadata !DIExpression()), !dbg !3116
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3117, metadata !DIExpression()), !dbg !3118
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3119, metadata !DIExpression()), !dbg !3120
  store i32 0, i32* %u32Temp1, align 4, !dbg !3120
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3121, metadata !DIExpression()), !dbg !3122
  store i32 0, i32* %u32Temp2, align 4, !dbg !3122
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3123
  %conv = sext i8 %0 to i32, !dbg !3123
  %cmp = icmp sle i32 %conv, 0, !dbg !3125
  br i1 %cmp, label %if.then, label %if.else, !dbg !3126

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3127
  br label %return, !dbg !3127

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3129
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3131
  %conv2 = sext i8 %2 to i32, !dbg !3131
  %mul = mul i32 %1, %conv2, !dbg !3132
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3133
  %3 = load i32, i32* %value.addr, align 4, !dbg !3134
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3135
  %conv3 = sext i8 %4 to i32, !dbg !3135
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3136
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3137
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3138
  %shr = lshr i32 %5, 6, !dbg !3139
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3140
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3141
  %shl = shl i32 %6, 26, !dbg !3142
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3143
  %or = or i32 %7, %shl, !dbg !3143
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3143
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3144
  %shr4 = lshr i32 %8, 6, !dbg !3146
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3147
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3148

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3149
  store i32 %9, i32* %retval, align 4, !dbg !3151
  br label %return, !dbg !3151

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3152
  br label %return, !dbg !3152

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3154
  ret i32 %10, !dbg !3154
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3155 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3156, metadata !DIExpression()), !dbg !3157
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3158, metadata !DIExpression()), !dbg !3159
  %0 = load i16, i16* %value.addr, align 2, !dbg !3160
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3161
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3162
  ret i16 %call, !dbg !3163
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3164 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3165, metadata !DIExpression()), !dbg !3166
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3167, metadata !DIExpression()), !dbg !3168
  %0 = load i16, i16* %value.addr, align 2, !dbg !3169
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3170
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3171
  ret i16 %call, !dbg !3172
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3173 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3174, metadata !DIExpression()), !dbg !3175
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3176, metadata !DIExpression()), !dbg !3177
  %0 = load i16, i16* %value.addr, align 2, !dbg !3178
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3179
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3180
  ret i16 %call, !dbg !3181
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3182 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3183, metadata !DIExpression()), !dbg !3184
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3185, metadata !DIExpression()), !dbg !3186
  %0 = load i16, i16* %value.addr, align 2, !dbg !3187
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3188
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3189
  ret i16 %call, !dbg !3190
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3191 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3192, metadata !DIExpression()), !dbg !3193
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3194, metadata !DIExpression()), !dbg !3195
  %0 = load i16, i16* %value.addr, align 2, !dbg !3196
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3197
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3198
  ret i16 %call, !dbg !3199
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3200 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3201, metadata !DIExpression()), !dbg !3202
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3203, metadata !DIExpression()), !dbg !3204
  %0 = load i16, i16* %value.addr, align 2, !dbg !3205
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3206
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3207
  ret i16 %call, !dbg !3208
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3209 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3210, metadata !DIExpression()), !dbg !3211
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3212, metadata !DIExpression()), !dbg !3213
  %0 = load i16, i16* %value.addr, align 2, !dbg !3214
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3215
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3216
  ret i16 %call, !dbg !3217
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3218 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3219, metadata !DIExpression()), !dbg !3220
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3221, metadata !DIExpression()), !dbg !3222
  %0 = load i16, i16* %value.addr, align 2, !dbg !3223
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3224
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3225
  ret i16 %call, !dbg !3226
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3227 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3228, metadata !DIExpression()), !dbg !3229
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3230, metadata !DIExpression()), !dbg !3231
  %0 = load i16, i16* %value.addr, align 2, !dbg !3232
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3233
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3234
  ret i16 %call, !dbg !3235
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3236 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3237, metadata !DIExpression()), !dbg !3238
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3239, metadata !DIExpression()), !dbg !3240
  %0 = load i16, i16* %value.addr, align 2, !dbg !3241
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3242
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3243
  ret i16 %call, !dbg !3244
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3245 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3246, metadata !DIExpression()), !dbg !3247
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3248, metadata !DIExpression()), !dbg !3249
  %0 = load i16, i16* %value.addr, align 2, !dbg !3250
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3251
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3252
  ret i16 %call, !dbg !3253
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3254 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3255, metadata !DIExpression()), !dbg !3256
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3257, metadata !DIExpression()), !dbg !3258
  %0 = load i16, i16* %value.addr, align 2, !dbg !3259
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3260
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3261
  ret i16 %call, !dbg !3262
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3263 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3264, metadata !DIExpression()), !dbg !3265
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3266, metadata !DIExpression()), !dbg !3267
  %0 = load i16, i16* %value.addr, align 2, !dbg !3268
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3269
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3270
  ret i16 %call, !dbg !3271
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3272 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3273, metadata !DIExpression()), !dbg !3274
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3275, metadata !DIExpression()), !dbg !3276
  %0 = load i16, i16* %value.addr, align 2, !dbg !3277
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3278
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3279
  ret i16 %call, !dbg !3280
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3281 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3282, metadata !DIExpression()), !dbg !3283
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3284, metadata !DIExpression()), !dbg !3285
  %0 = load i16, i16* %value.addr, align 2, !dbg !3286
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3287
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3288
  ret i16 %call, !dbg !3289
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3290 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3291, metadata !DIExpression()), !dbg !3292
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3293, metadata !DIExpression()), !dbg !3294
  %0 = load i16, i16* %value.addr, align 2, !dbg !3295
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3296
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3297
  %2 = load i16, i16* %retval, align 2, !dbg !3298
  ret i16 %2, !dbg !3298
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3299 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3300, metadata !DIExpression()), !dbg !3301
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3302, metadata !DIExpression()), !dbg !3303
  %0 = load i16, i16* %value.addr, align 2, !dbg !3304
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3305
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3306
  ret i16 %call, !dbg !3307
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3308 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3309, metadata !DIExpression()), !dbg !3310
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3311, metadata !DIExpression()), !dbg !3312
  %0 = load i16, i16* %value.addr, align 2, !dbg !3313
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3314
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3315
  ret i16 %call, !dbg !3316
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3317 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3318, metadata !DIExpression()), !dbg !3319
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3320, metadata !DIExpression()), !dbg !3321
  %0 = load i16, i16* %value.addr, align 2, !dbg !3322
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3323
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3324
  ret i16 %call, !dbg !3325
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3326 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3327, metadata !DIExpression()), !dbg !3328
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3329, metadata !DIExpression()), !dbg !3330
  %0 = load i16, i16* %value.addr, align 2, !dbg !3331
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3332
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3333
  ret i16 %call, !dbg !3334
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3335 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3336, metadata !DIExpression()), !dbg !3337
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3338, metadata !DIExpression()), !dbg !3339
  %0 = load i16, i16* %value.addr, align 2, !dbg !3340
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3341
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3342
  ret i16 %call, !dbg !3343
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3344 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3345, metadata !DIExpression()), !dbg !3346
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3347, metadata !DIExpression()), !dbg !3348
  %0 = load i16, i16* %value.addr, align 2, !dbg !3349
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3350
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3351
  ret i16 %call, !dbg !3352
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3353 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3354, metadata !DIExpression()), !dbg !3355
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3356, metadata !DIExpression()), !dbg !3357
  %0 = load i16, i16* %value.addr, align 2, !dbg !3358
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3359
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3360
  ret i16 %call, !dbg !3361
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3362 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3363, metadata !DIExpression()), !dbg !3364
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3365, metadata !DIExpression()), !dbg !3366
  %0 = load i16, i16* %value.addr, align 2, !dbg !3367
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3368
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3369
  ret i16 %call, !dbg !3370
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3371 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3372, metadata !DIExpression()), !dbg !3373
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3374, metadata !DIExpression()), !dbg !3375
  %0 = load i16, i16* %value.addr, align 2, !dbg !3376
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3377
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3378
  ret i16 %call, !dbg !3379
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3380 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3381, metadata !DIExpression()), !dbg !3382
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3383, metadata !DIExpression()), !dbg !3384
  %0 = load i16, i16* %value.addr, align 2, !dbg !3385
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3386
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3387
  ret i16 %call, !dbg !3388
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3389 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3390, metadata !DIExpression()), !dbg !3391
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3392, metadata !DIExpression()), !dbg !3393
  %0 = load i16, i16* %value.addr, align 2, !dbg !3394
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3395
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3396
  ret i16 %call, !dbg !3397
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3398 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3399, metadata !DIExpression()), !dbg !3400
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3401, metadata !DIExpression()), !dbg !3402
  %0 = load i16, i16* %value.addr, align 2, !dbg !3403
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3404
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3405
  ret i16 %call, !dbg !3406
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3407 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3408, metadata !DIExpression()), !dbg !3409
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3410, metadata !DIExpression()), !dbg !3411
  %0 = load i16, i16* %value.addr, align 2, !dbg !3412
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3413
  %conv = zext i8 %1 to i16, !dbg !3414
  %conv1 = zext i16 %conv to i32, !dbg !3414
  %shl = shl i32 %conv1, 5, !dbg !3415
  %conv2 = trunc i32 %shl to i16, !dbg !3416
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3417
  ret i16 %call, !dbg !3418
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3419 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3420, metadata !DIExpression()), !dbg !3421
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3422, metadata !DIExpression()), !dbg !3423
  %0 = load i16, i16* %value.addr, align 2, !dbg !3424
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3425
  %conv = zext i8 %1 to i16, !dbg !3426
  %conv1 = zext i16 %conv to i32, !dbg !3426
  %shl = shl i32 %conv1, 6, !dbg !3427
  %conv2 = trunc i32 %shl to i16, !dbg !3428
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3429
  ret i16 %call, !dbg !3430
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3431 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3432, metadata !DIExpression()), !dbg !3433
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3434, metadata !DIExpression()), !dbg !3435
  %0 = load i16, i16* %value.addr, align 2, !dbg !3436
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3437
  %conv = zext i8 %1 to i16, !dbg !3438
  %conv1 = zext i16 %conv to i32, !dbg !3438
  %shl = shl i32 %conv1, 7, !dbg !3439
  %conv2 = trunc i32 %shl to i16, !dbg !3440
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3441
  ret i16 %call, !dbg !3442
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3443 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3444, metadata !DIExpression()), !dbg !3445
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3446, metadata !DIExpression()), !dbg !3447
  %0 = load i16, i16* %value.addr, align 2, !dbg !3448
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3449
  %conv = zext i8 %1 to i16, !dbg !3450
  %conv1 = zext i16 %conv to i32, !dbg !3450
  %shl = shl i32 %conv1, 7, !dbg !3451
  %conv2 = trunc i32 %shl to i16, !dbg !3452
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3453
  ret i16 %call, !dbg !3454
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3455 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3456, metadata !DIExpression()), !dbg !3457
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3458, metadata !DIExpression()), !dbg !3459
  %0 = load i16, i16* %value.addr, align 2, !dbg !3460
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3461
  %conv = zext i8 %1 to i16, !dbg !3462
  %conv1 = zext i16 %conv to i32, !dbg !3462
  %shl = shl i32 %conv1, 4, !dbg !3463
  %conv2 = trunc i32 %shl to i16, !dbg !3464
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3465
  ret i16 %call, !dbg !3466
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3467 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3468, metadata !DIExpression()), !dbg !3469
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3470, metadata !DIExpression()), !dbg !3471
  %0 = load i16, i16* %value.addr, align 2, !dbg !3472
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3473
  %conv = zext i8 %1 to i16, !dbg !3474
  %conv1 = zext i16 %conv to i32, !dbg !3474
  %shl = shl i32 %conv1, 5, !dbg !3475
  %conv2 = trunc i32 %shl to i16, !dbg !3476
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3477
  ret i16 %call, !dbg !3478
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3479 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3480, metadata !DIExpression()), !dbg !3481
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3482, metadata !DIExpression()), !dbg !3483
  %0 = load i16, i16* %value.addr, align 2, !dbg !3484
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3485
  %conv = zext i8 %1 to i16, !dbg !3486
  %conv1 = zext i16 %conv to i32, !dbg !3486
  %shl = shl i32 %conv1, 2, !dbg !3487
  %conv2 = trunc i32 %shl to i16, !dbg !3488
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3489
  ret i16 %call, !dbg !3490
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3491 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3492, metadata !DIExpression()), !dbg !3493
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3494, metadata !DIExpression()), !dbg !3495
  %0 = load i16, i16* %value.addr, align 2, !dbg !3496
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3497
  %conv = zext i8 %1 to i16, !dbg !3498
  %conv1 = zext i16 %conv to i32, !dbg !3498
  %shl = shl i32 %conv1, 6, !dbg !3499
  %conv2 = trunc i32 %shl to i16, !dbg !3500
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3501
  ret i16 %call, !dbg !3502
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3503 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3504, metadata !DIExpression()), !dbg !3505
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3506, metadata !DIExpression()), !dbg !3507
  %0 = load i16, i16* %value.addr, align 2, !dbg !3508
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3509
  %conv = zext i8 %1 to i16, !dbg !3510
  %conv1 = zext i16 %conv to i32, !dbg !3510
  %shl = shl i32 %conv1, 3, !dbg !3511
  %conv2 = trunc i32 %shl to i16, !dbg !3512
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3513
  ret i16 %call, !dbg !3514
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3515 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3516, metadata !DIExpression()), !dbg !3517
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3518, metadata !DIExpression()), !dbg !3519
  %0 = load i32, i32* %value.addr, align 4, !dbg !3520
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3521
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3522
  ret i32 %call, !dbg !3523
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3524 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3527, metadata !DIExpression()), !dbg !3528
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3529, metadata !DIExpression()), !dbg !3530
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3531, metadata !DIExpression()), !dbg !3532
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3533, metadata !DIExpression()), !dbg !3534
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3535, metadata !DIExpression()), !dbg !3536
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3537, metadata !DIExpression()), !dbg !3538
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3539, metadata !DIExpression()), !dbg !3540
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3541, metadata !DIExpression()), !dbg !3542
  %0 = load i32, i32* %value.addr, align 4, !dbg !3543
  %cmp = icmp slt i32 %0, 0, !dbg !3545
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3546

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3547
  %conv = sext i16 %1 to i32, !dbg !3547
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3548
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3549

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3550
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3551
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3552

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3553
  %conv6 = sext i16 %3 to i32, !dbg !3553
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3554
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3555

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3556
  br label %if.end, !dbg !3558

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3559
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3561
  %cmp9 = icmp slt i32 %4, 0, !dbg !3563
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3564

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3565
  %sub = sub nsw i32 0, %5, !dbg !3567
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3568
  br label %if.end13, !dbg !3569

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3570
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3572
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3573
  %conv14 = sext i16 %7 to i32, !dbg !3573
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3575
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3576

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3577
  %conv18 = sext i16 %8 to i32, !dbg !3577
  %sub19 = sub nsw i32 0, %conv18, !dbg !3579
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3580
  br label %if.end22, !dbg !3581

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3582
  %conv21 = sext i16 %9 to i32, !dbg !3582
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3584
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3585
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3586
  %mul = mul i32 %10, %11, !dbg !3587
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3588
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3589
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3590
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3591
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3592
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3593
  %15 = load i32, i32* %count.addr, align 4, !dbg !3594
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3595
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3595
  %shr = lshr i32 %14, %15, !dbg !3595, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3596
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3597
  %17 = load i32, i32* %count.addr, align 4, !dbg !3598
  %sub23 = sub i32 32, %17, !dbg !3599
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3600
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3600
  %shl = shl i32 %16, %sub23, !dbg !3600, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3601
  %or = or i32 %18, %shl, !dbg !3601
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3601
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3602
  %20 = load i32, i32* %count.addr, align 4, !dbg !3604
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3605
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3605
  %shr24 = lshr i32 %19, %20, !dbg !3605, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3606
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3607

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3608
  %conv28 = zext i8 %21 to i32, !dbg !3608
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3611
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3612

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3613
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3616
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3617

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3618
  store i32 %23, i32* %retval, align 4, !dbg !3619
  br label %return, !dbg !3619

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3620
  br label %return, !dbg !3620

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3621
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3624
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3625

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3626
  %sub40 = sub i32 0, %25, !dbg !3627
  store i32 %sub40, i32* %retval, align 4, !dbg !3628
  br label %return, !dbg !3628

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3629
  br label %return, !dbg !3629

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3630
  br label %return, !dbg !3630

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3632
  ret i32 %26, !dbg !3632
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3633 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3634, metadata !DIExpression()), !dbg !3635
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3636, metadata !DIExpression()), !dbg !3637
  %0 = load i32, i32* %value.addr, align 4, !dbg !3638
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3639
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3640
  ret i32 %call, !dbg !3641
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3642 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3645, metadata !DIExpression()), !dbg !3646
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3647, metadata !DIExpression()), !dbg !3648
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3649, metadata !DIExpression()), !dbg !3650
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3651, metadata !DIExpression()), !dbg !3652
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3653, metadata !DIExpression()), !dbg !3654
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3655, metadata !DIExpression()), !dbg !3656
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3657, metadata !DIExpression()), !dbg !3658
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3659, metadata !DIExpression()), !dbg !3660
  %0 = load i32, i32* %value.addr, align 4, !dbg !3661
  %cmp = icmp slt i32 %0, 0, !dbg !3663
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3664

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3665
  %conv = sext i8 %1 to i32, !dbg !3665
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3666
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3667

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3668
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3669
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3670

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3671
  %conv6 = sext i8 %3 to i32, !dbg !3671
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3672
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3673

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3674
  br label %if.end, !dbg !3676

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3677
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3679
  %cmp9 = icmp slt i32 %4, 0, !dbg !3681
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3682

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3683
  %sub = sub nsw i32 0, %5, !dbg !3685
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3686
  br label %if.end13, !dbg !3687

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3688
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3690
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3691
  %conv14 = sext i8 %7 to i32, !dbg !3691
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3693
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3694

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3695
  %conv18 = sext i8 %8 to i32, !dbg !3695
  %sub19 = sub nsw i32 0, %conv18, !dbg !3697
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3698
  br label %if.end22, !dbg !3699

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3700
  %conv21 = sext i8 %9 to i32, !dbg !3700
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3702
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3703
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3704
  %mul = mul i32 %10, %11, !dbg !3705
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3706
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3707
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3708
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3709
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3710
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3711
  %15 = load i32, i32* %count.addr, align 4, !dbg !3712
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3713
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3713
  %shr = lshr i32 %14, %15, !dbg !3713, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3714
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3715
  %17 = load i32, i32* %count.addr, align 4, !dbg !3716
  %sub23 = sub i32 32, %17, !dbg !3717
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3718
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3718
  %shl = shl i32 %16, %sub23, !dbg !3718, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3719
  %or = or i32 %18, %shl, !dbg !3719
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3719
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3720
  %20 = load i32, i32* %count.addr, align 4, !dbg !3722
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3723
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3723
  %shr24 = lshr i32 %19, %20, !dbg !3723, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3724
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3725

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3726
  %conv28 = zext i8 %21 to i32, !dbg !3726
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3729
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3730

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3731
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3734
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3735

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3736
  store i32 %23, i32* %retval, align 4, !dbg !3737
  br label %return, !dbg !3737

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3738
  br label %return, !dbg !3738

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3739
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3742
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3743

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3744
  %sub40 = sub i32 0, %25, !dbg !3745
  store i32 %sub40, i32* %retval, align 4, !dbg !3746
  br label %return, !dbg !3746

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3747
  br label %return, !dbg !3747

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3748
  br label %return, !dbg !3748

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3750
  ret i32 %26, !dbg !3750
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3751 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3752, metadata !DIExpression()), !dbg !3753
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3754, metadata !DIExpression()), !dbg !3755
  %0 = load i32, i32* %value.addr, align 4, !dbg !3756
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3757
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3758
  ret i32 %call, !dbg !3759
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3760 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3763, metadata !DIExpression()), !dbg !3764
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3765, metadata !DIExpression()), !dbg !3766
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3767, metadata !DIExpression()), !dbg !3768
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3769, metadata !DIExpression()), !dbg !3770
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3771, metadata !DIExpression()), !dbg !3772
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3773, metadata !DIExpression()), !dbg !3774
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3775, metadata !DIExpression()), !dbg !3776
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3777, metadata !DIExpression()), !dbg !3778
  %0 = load i32, i32* %value.addr, align 4, !dbg !3779
  %cmp = icmp slt i32 %0, 0, !dbg !3781
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3782

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3783
  %conv = zext i16 %1 to i32, !dbg !3783
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3784
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3785

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3786
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3787
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3788

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3789
  %conv6 = zext i16 %3 to i32, !dbg !3789
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3790
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3791

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3792
  br label %if.end, !dbg !3794

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3795
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3797
  %cmp9 = icmp slt i32 %4, 0, !dbg !3799
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3800

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3801
  %sub = sub nsw i32 0, %5, !dbg !3803
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3804
  br label %if.end13, !dbg !3805

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3806
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3808
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3809
  %conv14 = zext i16 %7 to i32, !dbg !3809
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3811
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3812

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3813
  %conv18 = zext i16 %8 to i32, !dbg !3813
  %sub19 = sub nsw i32 0, %conv18, !dbg !3815
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3816
  br label %if.end22, !dbg !3817

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3818
  %conv21 = zext i16 %9 to i32, !dbg !3818
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3820
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3821
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3822
  %mul = mul i32 %10, %11, !dbg !3823
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3824
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3825
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3826
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3827
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3828
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3829
  %15 = load i32, i32* %count.addr, align 4, !dbg !3830
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3831
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3831
  %shr = lshr i32 %14, %15, !dbg !3831, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3832
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3833
  %17 = load i32, i32* %count.addr, align 4, !dbg !3834
  %sub23 = sub i32 32, %17, !dbg !3835
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3836
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3836
  %shl = shl i32 %16, %sub23, !dbg !3836, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3837
  %or = or i32 %18, %shl, !dbg !3837
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3837
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3838
  %20 = load i32, i32* %count.addr, align 4, !dbg !3840
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3841
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3841
  %shr24 = lshr i32 %19, %20, !dbg !3841, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3842
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3843

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3844
  %conv28 = zext i8 %21 to i32, !dbg !3844
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3847
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3848

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3849
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3852
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3853

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3854
  store i32 %23, i32* %retval, align 4, !dbg !3855
  br label %return, !dbg !3855

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3856
  br label %return, !dbg !3856

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3857
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3860
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3861

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3862
  %sub40 = sub i32 0, %25, !dbg !3863
  store i32 %sub40, i32* %retval, align 4, !dbg !3864
  br label %return, !dbg !3864

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3865
  br label %return, !dbg !3865

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3866
  br label %return, !dbg !3866

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3868
  ret i32 %26, !dbg !3868
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3869 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3870, metadata !DIExpression()), !dbg !3871
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3872, metadata !DIExpression()), !dbg !3873
  %0 = load i32, i32* %value.addr, align 4, !dbg !3874
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3875
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3876
  ret i32 %call, !dbg !3877
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3878 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3881, metadata !DIExpression()), !dbg !3882
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3883, metadata !DIExpression()), !dbg !3884
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3885, metadata !DIExpression()), !dbg !3886
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3887, metadata !DIExpression()), !dbg !3888
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3889, metadata !DIExpression()), !dbg !3890
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3891, metadata !DIExpression()), !dbg !3892
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3893, metadata !DIExpression()), !dbg !3894
  %0 = load i32, i32* %value.addr, align 4, !dbg !3895
  %cmp = icmp slt i32 %0, 0, !dbg !3897
  br i1 %cmp, label %if.then, label %if.else, !dbg !3898

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3899
  %1 = load i32, i32* %value.addr, align 4, !dbg !3901
  %sub = sub nsw i32 0, %1, !dbg !3902
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3903
  br label %if.end, !dbg !3904

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3905
  %2 = load i32, i32* %value.addr, align 4, !dbg !3907
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3908
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3909
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3910
  %conv = zext i8 %4 to i32, !dbg !3910
  %mul = mul i32 %3, %conv, !dbg !3911
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3912
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3913
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3914
  %conv1 = zext i8 %6 to i32, !dbg !3914
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3915
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3916
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3917
  %8 = load i32, i32* %count.addr, align 4, !dbg !3918
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3919
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3919
  %shr = lshr i32 %7, %8, !dbg !3919, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3920
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3921
  %10 = load i32, i32* %count.addr, align 4, !dbg !3922
  %sub2 = sub i32 32, %10, !dbg !3923
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3924
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3924
  %shl = shl i32 %9, %sub2, !dbg !3924, !klee.check.shift !265
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3925
  %or = or i32 %11, %shl, !dbg !3925
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3925
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3926
  %13 = load i32, i32* %count.addr, align 4, !dbg !3928
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3929
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3929
  %shr3 = lshr i32 %12, %13, !dbg !3929, !klee.check.shift !265
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3930
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3931

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3932
  %conv7 = zext i8 %14 to i32, !dbg !3932
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3935
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3936

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3937
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3940
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3941

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3942
  store i32 %16, i32* %retval, align 4, !dbg !3943
  br label %return, !dbg !3943

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3944
  br label %return, !dbg !3944

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3945
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3948
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3949

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3950
  %sub19 = sub i32 0, %18, !dbg !3952
  store i32 %sub19, i32* %retval, align 4, !dbg !3953
  br label %return, !dbg !3953

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3954
  br label %return, !dbg !3954

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3956
  %conv22 = zext i8 %19 to i32, !dbg !3956
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !3959
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !3960

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !3961
  br label %return, !dbg !3961

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !3963
  br label %return, !dbg !3963

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !3965
  ret i32 %20, !dbg !3965
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !3966 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3967, metadata !DIExpression()), !dbg !3968
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3969, metadata !DIExpression()), !dbg !3970
  %0 = load i8, i8* %value.addr, align 1, !dbg !3971
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3972
  %conv = zext i8 %1 to i16, !dbg !3973
  %conv1 = zext i16 %conv to i32, !dbg !3973
  %shl = shl i32 %conv1, 5, !dbg !3974
  %conv2 = trunc i32 %shl to i16, !dbg !3975
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3976
  ret i8 %call, !dbg !3977
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !3978 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3979, metadata !DIExpression()), !dbg !3980
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3981, metadata !DIExpression()), !dbg !3982
  %0 = load i8, i8* %value.addr, align 1, !dbg !3983
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3984
  %conv = zext i8 %1 to i16, !dbg !3985
  %conv1 = zext i16 %conv to i32, !dbg !3985
  %shl = shl i32 %conv1, 6, !dbg !3986
  %conv2 = trunc i32 %shl to i16, !dbg !3987
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !3988
  ret i8 %call, !dbg !3989
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !3990 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !3991, metadata !DIExpression()), !dbg !3992
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3993, metadata !DIExpression()), !dbg !3994
  %0 = load i8, i8* %value.addr, align 1, !dbg !3995
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3996
  %conv = zext i8 %1 to i16, !dbg !3997
  %conv1 = zext i16 %conv to i32, !dbg !3997
  %shl = shl i32 %conv1, 7, !dbg !3998
  %conv2 = trunc i32 %shl to i16, !dbg !3999
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4000
  ret i8 %call, !dbg !4001
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4002 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4003, metadata !DIExpression()), !dbg !4004
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4005, metadata !DIExpression()), !dbg !4006
  %0 = load i8, i8* %value.addr, align 1, !dbg !4007
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4008
  %conv = zext i8 %1 to i16, !dbg !4009
  %conv1 = zext i16 %conv to i32, !dbg !4009
  %shl = shl i32 %conv1, 7, !dbg !4010
  %conv2 = trunc i32 %shl to i16, !dbg !4011
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4012
  ret i8 %call, !dbg !4013
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4014 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4015, metadata !DIExpression()), !dbg !4016
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4017, metadata !DIExpression()), !dbg !4018
  %0 = load i8, i8* %value.addr, align 1, !dbg !4019
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4020
  %conv = zext i8 %1 to i16, !dbg !4021
  %conv1 = zext i16 %conv to i32, !dbg !4021
  %shl = shl i32 %conv1, 4, !dbg !4022
  %conv2 = trunc i32 %shl to i16, !dbg !4023
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4024
  ret i8 %call, !dbg !4025
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4026 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4027, metadata !DIExpression()), !dbg !4028
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4029, metadata !DIExpression()), !dbg !4030
  %0 = load i8, i8* %value.addr, align 1, !dbg !4031
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4032
  %conv = zext i8 %1 to i16, !dbg !4033
  %conv1 = zext i16 %conv to i32, !dbg !4033
  %shl = shl i32 %conv1, 5, !dbg !4034
  %conv2 = trunc i32 %shl to i16, !dbg !4035
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4036
  ret i8 %call, !dbg !4037
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4038 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4039, metadata !DIExpression()), !dbg !4040
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4041, metadata !DIExpression()), !dbg !4042
  %0 = load i8, i8* %value.addr, align 1, !dbg !4043
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4044
  %conv = zext i8 %1 to i16, !dbg !4045
  %conv1 = zext i16 %conv to i32, !dbg !4045
  %shl = shl i32 %conv1, 2, !dbg !4046
  %conv2 = trunc i32 %shl to i16, !dbg !4047
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4048
  ret i8 %call, !dbg !4049
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4050 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4051, metadata !DIExpression()), !dbg !4052
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4053, metadata !DIExpression()), !dbg !4054
  %0 = load i8, i8* %value.addr, align 1, !dbg !4055
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4056
  %conv = zext i8 %1 to i16, !dbg !4057
  %conv1 = zext i16 %conv to i32, !dbg !4057
  %shl = shl i32 %conv1, 6, !dbg !4058
  %conv2 = trunc i32 %shl to i16, !dbg !4059
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4060
  ret i8 %call, !dbg !4061
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4062 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4063, metadata !DIExpression()), !dbg !4064
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4065, metadata !DIExpression()), !dbg !4066
  %0 = load i8, i8* %value.addr, align 1, !dbg !4067
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4068
  %conv = zext i8 %1 to i16, !dbg !4069
  %conv1 = zext i16 %conv to i32, !dbg !4069
  %shl = shl i32 %conv1, 3, !dbg !4070
  %conv2 = trunc i32 %shl to i16, !dbg !4071
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4072
  ret i8 %call, !dbg !4073
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4074 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4075, metadata !DIExpression()), !dbg !4076
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4077, metadata !DIExpression()), !dbg !4078
  %0 = load i16, i16* %value.addr, align 2, !dbg !4079
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4080
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4081
  ret i16 %call, !dbg !4082
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4083 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4084, metadata !DIExpression()), !dbg !4085
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4086, metadata !DIExpression()), !dbg !4087
  %0 = load i16, i16* %value.addr, align 2, !dbg !4088
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4089
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4090
  ret i16 %call, !dbg !4091
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4092 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4093, metadata !DIExpression()), !dbg !4094
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4095, metadata !DIExpression()), !dbg !4096
  %0 = load i16, i16* %value.addr, align 2, !dbg !4097
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4098
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4099
  ret i16 %call, !dbg !4100
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4101 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4102, metadata !DIExpression()), !dbg !4103
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4104, metadata !DIExpression()), !dbg !4105
  %0 = load i16, i16* %value.addr, align 2, !dbg !4106
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4107
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4108
  ret i16 %call, !dbg !4109
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4110 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4111, metadata !DIExpression()), !dbg !4112
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4113, metadata !DIExpression()), !dbg !4114
  %0 = load i16, i16* %value.addr, align 2, !dbg !4115
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4116
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4117
  ret i16 %call, !dbg !4118
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4119 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4120, metadata !DIExpression()), !dbg !4121
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4122, metadata !DIExpression()), !dbg !4123
  %0 = load i16, i16* %value.addr, align 2, !dbg !4124
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4125
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4126
  ret i16 %call, !dbg !4127
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4128 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4129, metadata !DIExpression()), !dbg !4130
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4131, metadata !DIExpression()), !dbg !4132
  %0 = load i16, i16* %value.addr, align 2, !dbg !4133
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4134
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4135
  ret i16 %call, !dbg !4136
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4137 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4138, metadata !DIExpression()), !dbg !4139
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4140, metadata !DIExpression()), !dbg !4141
  %0 = load i16, i16* %value.addr, align 2, !dbg !4142
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4143
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4144
  ret i16 %call, !dbg !4145
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4146 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4147, metadata !DIExpression()), !dbg !4148
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4149, metadata !DIExpression()), !dbg !4150
  %0 = load i16, i16* %value.addr, align 2, !dbg !4151
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4152
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4153
  ret i16 %call, !dbg !4154
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4155 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4156, metadata !DIExpression()), !dbg !4157
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4158, metadata !DIExpression()), !dbg !4159
  %0 = load i16, i16* %value.addr, align 2, !dbg !4160
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4161
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4162
  ret i16 %call, !dbg !4163
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4164 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4165, metadata !DIExpression()), !dbg !4166
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4167, metadata !DIExpression()), !dbg !4168
  %0 = load i16, i16* %value.addr, align 2, !dbg !4169
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4170
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4171
  ret i16 %call, !dbg !4172
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4173 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4174, metadata !DIExpression()), !dbg !4175
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4176, metadata !DIExpression()), !dbg !4177
  %0 = load i16, i16* %value.addr, align 2, !dbg !4178
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4179
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4180
  ret i16 %call, !dbg !4181
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4182 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4183, metadata !DIExpression()), !dbg !4184
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4185, metadata !DIExpression()), !dbg !4186
  %0 = load i16, i16* %value.addr, align 2, !dbg !4187
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4188
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4189
  ret i16 %call, !dbg !4190
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4191 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4192, metadata !DIExpression()), !dbg !4193
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4194, metadata !DIExpression()), !dbg !4195
  %0 = load i16, i16* %value.addr, align 2, !dbg !4196
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4197
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4198
  ret i16 %call, !dbg !4199
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4200 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4201, metadata !DIExpression()), !dbg !4202
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4203, metadata !DIExpression()), !dbg !4204
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4205
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4206
  %conv = zext i8 %1 to i16, !dbg !4207
  %conv1 = zext i16 %conv to i32, !dbg !4207
  %shl = shl i32 %conv1, 5, !dbg !4208
  %conv2 = trunc i32 %shl to i16, !dbg !4209
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4210
  ret i16 %call, !dbg !4211
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4212 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4213, metadata !DIExpression()), !dbg !4214
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4215, metadata !DIExpression()), !dbg !4216
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4217
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4218
  %conv = zext i8 %1 to i16, !dbg !4219
  %conv1 = zext i16 %conv to i32, !dbg !4219
  %shl = shl i32 %conv1, 6, !dbg !4220
  %conv2 = trunc i32 %shl to i16, !dbg !4221
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4222
  ret i16 %call, !dbg !4223
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4224 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4225, metadata !DIExpression()), !dbg !4226
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4227, metadata !DIExpression()), !dbg !4228
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4229
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4230
  %conv = zext i8 %1 to i16, !dbg !4231
  %conv1 = zext i16 %conv to i32, !dbg !4231
  %shl = shl i32 %conv1, 7, !dbg !4232
  %conv2 = trunc i32 %shl to i16, !dbg !4233
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4234
  ret i16 %call, !dbg !4235
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4236 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4237, metadata !DIExpression()), !dbg !4238
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4239, metadata !DIExpression()), !dbg !4240
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4241
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4242
  %conv = zext i8 %1 to i16, !dbg !4243
  %conv1 = zext i16 %conv to i32, !dbg !4243
  %shl = shl i32 %conv1, 7, !dbg !4244
  %conv2 = trunc i32 %shl to i16, !dbg !4245
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4246
  ret i16 %call, !dbg !4247
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4248 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4249, metadata !DIExpression()), !dbg !4250
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4251, metadata !DIExpression()), !dbg !4252
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4253
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4254
  %conv = zext i8 %1 to i16, !dbg !4255
  %conv1 = zext i16 %conv to i32, !dbg !4255
  %shl = shl i32 %conv1, 4, !dbg !4256
  %conv2 = trunc i32 %shl to i16, !dbg !4257
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4258
  ret i16 %call, !dbg !4259
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4260 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4261, metadata !DIExpression()), !dbg !4262
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4263, metadata !DIExpression()), !dbg !4264
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4265
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4266
  %conv = zext i8 %1 to i16, !dbg !4267
  %conv1 = zext i16 %conv to i32, !dbg !4267
  %shl = shl i32 %conv1, 5, !dbg !4268
  %conv2 = trunc i32 %shl to i16, !dbg !4269
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4270
  ret i16 %call, !dbg !4271
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4272 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4273, metadata !DIExpression()), !dbg !4274
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4275, metadata !DIExpression()), !dbg !4276
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4277
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4278
  %conv = zext i8 %1 to i16, !dbg !4279
  %conv1 = zext i16 %conv to i32, !dbg !4279
  %shl = shl i32 %conv1, 2, !dbg !4280
  %conv2 = trunc i32 %shl to i16, !dbg !4281
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4282
  ret i16 %call, !dbg !4283
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4284 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4285, metadata !DIExpression()), !dbg !4286
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4287, metadata !DIExpression()), !dbg !4288
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4289
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4290
  %conv = zext i8 %1 to i16, !dbg !4291
  %conv1 = zext i16 %conv to i32, !dbg !4291
  %shl = shl i32 %conv1, 6, !dbg !4292
  %conv2 = trunc i32 %shl to i16, !dbg !4293
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4294
  ret i16 %call, !dbg !4295
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4296 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4297, metadata !DIExpression()), !dbg !4298
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4299, metadata !DIExpression()), !dbg !4300
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4301
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4302
  %conv = zext i8 %1 to i16, !dbg !4303
  %conv1 = zext i16 %conv to i32, !dbg !4303
  %shl = shl i32 %conv1, 3, !dbg !4304
  %conv2 = trunc i32 %shl to i16, !dbg !4305
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4306
  ret i16 %call, !dbg !4307
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4308 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4309, metadata !DIExpression()), !dbg !4310
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4311, metadata !DIExpression()), !dbg !4312
  %0 = load i32, i32* %value.addr, align 4, !dbg !4313
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4314
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4315
  ret i32 %call, !dbg !4316
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4317 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4320, metadata !DIExpression()), !dbg !4321
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4322, metadata !DIExpression()), !dbg !4323
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4324, metadata !DIExpression()), !dbg !4325
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4326, metadata !DIExpression()), !dbg !4327
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4328, metadata !DIExpression()), !dbg !4329
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4330, metadata !DIExpression()), !dbg !4331
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4332, metadata !DIExpression()), !dbg !4333
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4334
  %conv = sext i16 %0 to i32, !dbg !4334
  %cmp = icmp slt i32 %conv, 0, !dbg !4336
  br i1 %cmp, label %if.then, label %if.else, !dbg !4337

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4338
  br label %if.end, !dbg !4340

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4341
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4343
  %conv2 = sext i16 %1 to i32, !dbg !4343
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4345
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4346

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4347
  %conv6 = sext i16 %2 to i32, !dbg !4347
  %sub = sub nsw i32 0, %conv6, !dbg !4349
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4350
  br label %if.end9, !dbg !4351

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4352
  %conv8 = sext i16 %3 to i32, !dbg !4352
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4354
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4355
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4356
  %mul = mul i32 %4, %5, !dbg !4357
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4358
  %6 = load i32, i32* %value.addr, align 4, !dbg !4359
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4360
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4361
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4362
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4363
  %9 = load i32, i32* %count.addr, align 4, !dbg !4364
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4365
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4365
  %shr = lshr i32 %8, %9, !dbg !4365, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4366
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4367
  %11 = load i32, i32* %count.addr, align 4, !dbg !4368
  %sub10 = sub i32 32, %11, !dbg !4369
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4370
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4370
  %shl = shl i32 %10, %sub10, !dbg !4370, !klee.check.shift !265
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4371
  %or = or i32 %12, %shl, !dbg !4371
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4371
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4372
  %14 = load i32, i32* %count.addr, align 4, !dbg !4374
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4375
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4375
  %shr11 = lshr i32 %13, %14, !dbg !4375, !klee.check.shift !265
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4376
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4377

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4378
  %conv15 = zext i8 %15 to i32, !dbg !4378
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4381
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4382

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4383
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4386
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4387

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4388
  store i32 %17, i32* %retval, align 4, !dbg !4389
  br label %return, !dbg !4389

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4390
  br label %return, !dbg !4390

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4391
  br label %return, !dbg !4391

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4393
  br label %return, !dbg !4393

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4395
  ret i32 %18, !dbg !4395
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4396 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4397, metadata !DIExpression()), !dbg !4398
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4399, metadata !DIExpression()), !dbg !4400
  %0 = load i32, i32* %value.addr, align 4, !dbg !4401
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4402
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4403
  ret i32 %call, !dbg !4404
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4405 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4408, metadata !DIExpression()), !dbg !4409
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4410, metadata !DIExpression()), !dbg !4411
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4412, metadata !DIExpression()), !dbg !4413
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4414, metadata !DIExpression()), !dbg !4415
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4416, metadata !DIExpression()), !dbg !4417
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4418, metadata !DIExpression()), !dbg !4419
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4420
  %cmp = icmp slt i32 %0, 0, !dbg !4422
  br i1 %cmp, label %if.then, label %if.else, !dbg !4423

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4424
  br label %if.end, !dbg !4426

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4427
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4429
  %cmp1 = icmp slt i32 %1, 0, !dbg !4431
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4432

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4433
  %sub = sub nsw i32 0, %2, !dbg !4435
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4436
  br label %if.end4, !dbg !4437

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4438
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4440
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4441
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4442
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4443
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4444
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4445
  %7 = load i32, i32* %count.addr, align 4, !dbg !4446
  %sub5 = sub i32 %7, 32, !dbg !4447
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4448
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4448
  %shr = lshr i32 %6, %sub5, !dbg !4448, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4449
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4450
  %conv = zext i8 %8 to i32, !dbg !4450
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4452
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4453

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4454
  store i32 %9, i32* %retval, align 4, !dbg !4456
  br label %return, !dbg !4456

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4457
  br label %return, !dbg !4457

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4459
  ret i32 %10, !dbg !4459
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4460 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4461, metadata !DIExpression()), !dbg !4462
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4463, metadata !DIExpression()), !dbg !4464
  %0 = load i32, i32* %value.addr, align 4, !dbg !4465
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4466
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4467
  ret i32 %call, !dbg !4468
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4469 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4472, metadata !DIExpression()), !dbg !4473
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4474, metadata !DIExpression()), !dbg !4475
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4476, metadata !DIExpression()), !dbg !4477
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4478, metadata !DIExpression()), !dbg !4479
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4480, metadata !DIExpression()), !dbg !4481
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4482, metadata !DIExpression()), !dbg !4483
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4484, metadata !DIExpression()), !dbg !4485
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4486
  %conv = sext i8 %0 to i32, !dbg !4486
  %cmp = icmp slt i32 %conv, 0, !dbg !4488
  br i1 %cmp, label %if.then, label %if.else, !dbg !4489

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4490
  br label %if.end, !dbg !4492

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4493
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4495
  %conv2 = sext i8 %1 to i32, !dbg !4495
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4497
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4498

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4499
  %conv6 = sext i8 %2 to i32, !dbg !4499
  %sub = sub nsw i32 0, %conv6, !dbg !4501
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4502
  br label %if.end9, !dbg !4503

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4504
  %conv8 = sext i8 %3 to i32, !dbg !4504
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4506
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4507
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4508
  %mul = mul i32 %4, %5, !dbg !4509
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4510
  %6 = load i32, i32* %value.addr, align 4, !dbg !4511
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4512
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4513
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4514
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4515
  %9 = load i32, i32* %count.addr, align 4, !dbg !4516
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4517
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4517
  %shr = lshr i32 %8, %9, !dbg !4517, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4518
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4519
  %11 = load i32, i32* %count.addr, align 4, !dbg !4520
  %sub10 = sub i32 32, %11, !dbg !4521
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4522
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4522
  %shl = shl i32 %10, %sub10, !dbg !4522, !klee.check.shift !265
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4523
  %or = or i32 %12, %shl, !dbg !4523
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4523
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4524
  %14 = load i32, i32* %count.addr, align 4, !dbg !4526
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4527
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4527
  %shr11 = lshr i32 %13, %14, !dbg !4527, !klee.check.shift !265
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4528
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4529

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4530
  %conv15 = zext i8 %15 to i32, !dbg !4530
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4533
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4534

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4535
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4538
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4539

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4540
  store i32 %17, i32* %retval, align 4, !dbg !4541
  br label %return, !dbg !4541

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4542
  br label %return, !dbg !4542

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4543
  br label %return, !dbg !4543

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4545
  br label %return, !dbg !4545

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4547
  ret i32 %18, !dbg !4547
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4548 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4549, metadata !DIExpression()), !dbg !4550
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4551, metadata !DIExpression()), !dbg !4552
  %0 = load i32, i32* %value.addr, align 4, !dbg !4553
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4554
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4555
  ret i32 %call, !dbg !4556
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4557 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4558, metadata !DIExpression()), !dbg !4559
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4560, metadata !DIExpression()), !dbg !4561
  %0 = load i32, i32* %value.addr, align 4, !dbg !4562
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4563
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4564
  ret i32 %call, !dbg !4565
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4566 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4569, metadata !DIExpression()), !dbg !4570
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4571, metadata !DIExpression()), !dbg !4572
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4573, metadata !DIExpression()), !dbg !4574
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4575, metadata !DIExpression()), !dbg !4576
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4577, metadata !DIExpression()), !dbg !4578
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4579, metadata !DIExpression()), !dbg !4580
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4581, metadata !DIExpression()), !dbg !4582
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4583, metadata !DIExpression()), !dbg !4584
  %0 = load i32, i32* %value.addr, align 4, !dbg !4585
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4586
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4587
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4588
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4589
  %3 = load i32, i32* %count.addr, align 4, !dbg !4590
  %sub = sub i32 %3, 32, !dbg !4591
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4592
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4592
  %shr = lshr i32 %2, %sub, !dbg !4592, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4593
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4594
  ret i32 %4, !dbg !4595
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4596 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4597, metadata !DIExpression()), !dbg !4598
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4599, metadata !DIExpression()), !dbg !4600
  %0 = load i32, i32* %value.addr, align 4, !dbg !4601
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4602
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4603
  ret i32 %call, !dbg !4604
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4605 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4608, metadata !DIExpression()), !dbg !4609
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4610, metadata !DIExpression()), !dbg !4611
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4612, metadata !DIExpression()), !dbg !4613
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4614, metadata !DIExpression()), !dbg !4615
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4616, metadata !DIExpression()), !dbg !4617
  %0 = load i32, i32* %value.addr, align 4, !dbg !4618
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4619
  %conv = zext i8 %1 to i32, !dbg !4619
  %mul = mul i32 %0, %conv, !dbg !4620
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4621
  %2 = load i32, i32* %value.addr, align 4, !dbg !4622
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4623
  %conv1 = zext i8 %3 to i32, !dbg !4623
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4624
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4625
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4626
  %5 = load i32, i32* %count.addr, align 4, !dbg !4627
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4628
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4628
  %shr = lshr i32 %4, %5, !dbg !4628, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4629
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4630
  %7 = load i32, i32* %count.addr, align 4, !dbg !4631
  %sub = sub i32 32, %7, !dbg !4632
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4633
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4633
  %shl = shl i32 %6, %sub, !dbg !4633, !klee.check.shift !265
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4634
  %or = or i32 %8, %shl, !dbg !4634
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4634
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4635
  %10 = load i32, i32* %count.addr, align 4, !dbg !4637
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4638
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4638
  %shr2 = lshr i32 %9, %10, !dbg !4638, !klee.check.shift !265
  %cmp = icmp eq i32 %shr2, 0, !dbg !4639
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4640

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4641
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4644
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4645

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4646
  store i32 %12, i32* %retval, align 4, !dbg !4647
  br label %return, !dbg !4647

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4648
  br label %return, !dbg !4648

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4649
  br label %return, !dbg !4649

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4651
  ret i32 %13, !dbg !4651
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4652 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4653, metadata !DIExpression()), !dbg !4654
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4655, metadata !DIExpression()), !dbg !4656
  %0 = load i8, i8* %value.addr, align 1, !dbg !4657
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4658
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4659
  ret i8 %call, !dbg !4660
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4661 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4662, metadata !DIExpression()), !dbg !4663
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4664, metadata !DIExpression()), !dbg !4665
  %0 = load i8, i8* %value.addr, align 1, !dbg !4666
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4667
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4668
  ret i8 %call, !dbg !4669
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4670 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4671, metadata !DIExpression()), !dbg !4672
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4673, metadata !DIExpression()), !dbg !4674
  %0 = load i8, i8* %value.addr, align 1, !dbg !4675
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4676
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4677
  ret i8 %call, !dbg !4678
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4679 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4680, metadata !DIExpression()), !dbg !4681
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4682, metadata !DIExpression()), !dbg !4683
  %0 = load i8, i8* %value.addr, align 1, !dbg !4684
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4685
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4686
  ret i8 %call, !dbg !4687
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4688 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4689, metadata !DIExpression()), !dbg !4690
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4691, metadata !DIExpression()), !dbg !4692
  %0 = load i8, i8* %value.addr, align 1, !dbg !4693
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4694
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4695
  ret i8 %call, !dbg !4696
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4697 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4698, metadata !DIExpression()), !dbg !4699
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4700, metadata !DIExpression()), !dbg !4701
  %0 = load i8, i8* %value.addr, align 1, !dbg !4702
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4703
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4704
  ret i8 %call, !dbg !4705
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4706 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4707, metadata !DIExpression()), !dbg !4708
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4709, metadata !DIExpression()), !dbg !4710
  %0 = load i8, i8* %value.addr, align 1, !dbg !4711
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4712
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4713
  ret i8 %call, !dbg !4714
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4715 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4716, metadata !DIExpression()), !dbg !4717
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4718, metadata !DIExpression()), !dbg !4719
  %0 = load i8, i8* %value.addr, align 1, !dbg !4720
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4721
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4722
  ret i8 %call, !dbg !4723
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4724 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4725, metadata !DIExpression()), !dbg !4726
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4727, metadata !DIExpression()), !dbg !4728
  %0 = load i8, i8* %value.addr, align 1, !dbg !4729
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4730
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4731
  ret i8 %call, !dbg !4732
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4733 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4735, metadata !DIExpression()), !dbg !4736
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4737, metadata !DIExpression()), !dbg !4738
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4739, metadata !DIExpression()), !dbg !4740
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4741, metadata !DIExpression()), !dbg !4742
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4743, metadata !DIExpression()), !dbg !4744
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4745, metadata !DIExpression()), !dbg !4746
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4747, metadata !DIExpression()), !dbg !4748
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4749, metadata !DIExpression()), !dbg !4750
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4751, metadata !DIExpression()), !dbg !4752
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4753, metadata !DIExpression()), !dbg !4754
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4755, metadata !DIExpression()), !dbg !4756
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4757, metadata !DIExpression()), !dbg !4758
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4759
  %and = and i32 %0, 65535, !dbg !4760
  %conv = trunc i32 %and to i16, !dbg !4759
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4761
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4762
  %and1 = and i32 %1, -65536, !dbg !4763
  %shr = lshr i32 %and1, 16, !dbg !4764
  %conv2 = trunc i32 %shr to i16, !dbg !4765
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4766
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4767
  %and3 = and i32 %2, 65535, !dbg !4768
  %conv4 = trunc i32 %and3 to i16, !dbg !4767
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4769
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4770
  %and5 = and i32 %3, -65536, !dbg !4771
  %shr6 = lshr i32 %and5, 16, !dbg !4772
  %conv7 = trunc i32 %shr6 to i16, !dbg !4773
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4774
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4775
  %conv8 = zext i16 %4 to i32, !dbg !4777
  %conv9 = sext i32 %conv8 to i64, !dbg !4778
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4779
  %conv10 = zext i16 %5 to i32, !dbg !4780
  %conv11 = sext i32 %conv10 to i64, !dbg !4781
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4782
  %tobool = icmp ne i32 %call, 0, !dbg !4782
  br i1 %tobool, label %if.end, label %if.then, !dbg !4783

if.then:                                          ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0), i32 51, i8* getelementptr inbounds ([84 x i8], [84 x i8]* @.str.1.6, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.7, i64 0, i64 0)) #5, !dbg !4784
  unreachable, !dbg !4784

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4786
  %conv12 = zext i16 %6 to i32, !dbg !4787
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4788
  %conv13 = zext i16 %7 to i32, !dbg !4789
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4790
  %conv14 = sext i32 %mul to i64, !dbg !4791
  store volatile i64 %conv14, i64* @klee_alarm_sink_s64, align 8, !dbg !4792
  ret i32 0, !dbg !4793
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4794 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4797, metadata !DIExpression()), !dbg !4798
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4799, metadata !DIExpression()), !dbg !4800
  %0 = load i64, i64* %left.addr, align 8, !dbg !4801
  %1 = load i64, i64* %right.addr, align 8, !dbg !4802
  %mul = mul nsw i64 %0, %1, !dbg !4803
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4804
  %conv = zext i1 %cmp to i32, !dbg !4804
  ret i32 %conv, !dbg !4805
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4806 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4807, metadata !DIExpression()), !dbg !4808
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4809, metadata !DIExpression()), !dbg !4810
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4811, metadata !DIExpression()), !dbg !4812
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4813, metadata !DIExpression()), !dbg !4814
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4815, metadata !DIExpression()), !dbg !4816
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4817, metadata !DIExpression()), !dbg !4818
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4819, metadata !DIExpression()), !dbg !4820
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4821, metadata !DIExpression()), !dbg !4822
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4823, metadata !DIExpression()), !dbg !4824
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4825, metadata !DIExpression()), !dbg !4826
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4827, metadata !DIExpression()), !dbg !4828
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4829, metadata !DIExpression()), !dbg !4830
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4831
  %and = and i32 %0, 65535, !dbg !4832
  %conv = trunc i32 %and to i16, !dbg !4831
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4833
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4834
  %and1 = and i32 %1, -65536, !dbg !4835
  %shr = lshr i32 %and1, 16, !dbg !4836
  %conv2 = trunc i32 %shr to i16, !dbg !4837
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4838
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4839
  %and3 = and i32 %2, 65535, !dbg !4840
  %conv4 = trunc i32 %and3 to i16, !dbg !4839
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4841
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4842
  %and5 = and i32 %3, -65536, !dbg !4843
  %shr6 = lshr i32 %and5, 16, !dbg !4844
  %conv7 = trunc i32 %shr6 to i16, !dbg !4845
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4846
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4847
  %conv8 = zext i16 %4 to i32, !dbg !4847
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4848
  %conv9 = zext i16 %5 to i32, !dbg !4848
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4849
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4850
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4851
  %conv10 = zext i16 %6 to i32, !dbg !4851
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4852
  %conv11 = zext i16 %7 to i32, !dbg !4852
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4853
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4854
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4855
  %conv13 = zext i16 %8 to i32, !dbg !4855
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4856
  %conv14 = zext i16 %9 to i32, !dbg !4856
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4857
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4858
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4859
  %conv16 = zext i16 %10 to i32, !dbg !4859
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4860
  %conv17 = zext i16 %11 to i32, !dbg !4860
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4861
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4862
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4863
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4864
  %and19 = and i32 %13, 65535, !dbg !4865
  %shl = shl i32 %and19, 16, !dbg !4866
  %add = add i32 %12, %shl, !dbg !4867
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4868
  %and20 = and i32 %14, 65535, !dbg !4869
  %shl21 = shl i32 %and20, 16, !dbg !4870
  %add22 = add i32 %add, %shl21, !dbg !4871
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4872
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4873
  ret i32 %15, !dbg !4874
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4875 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4881, metadata !DIExpression()), !dbg !4882
  %2 = icmp eq i64 %0, 0, !dbg !4883
  br i1 %2, label %3, label %4, !dbg !4885

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.3, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.5, i64 0, i64 0)) #6, !dbg !4886
  unreachable, !dbg !4886

4:                                                ; preds = %1
  ret void, !dbg !4887
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4888 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4894, metadata !DIExpression()), !dbg !4896
  call void @llvm.dbg.value(metadata i64 %1, metadata !4895, metadata !DIExpression()), !dbg !4896
  %3 = icmp ult i64 %1, %0, !dbg !4897
  br i1 %3, label %5, label %4, !dbg !4899

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.9, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.10, i64 0, i64 0)) #6, !dbg !4900
  unreachable, !dbg !4900

5:                                                ; preds = %2
  ret void, !dbg !4902
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/MulHword_alarm_0113.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!4 = !{}
!5 = !{!6, !11}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 27, baseType: !8)
!7 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !9, line: 44, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!10 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{!0}
!13 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!14 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !6)
!15 = distinct !DICompileUnit(language: DW_LANG_C99, file: !16, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!16 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!17 = distinct !DICompileUnit(language: DW_LANG_C99, file: !18, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!18 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113/mul_Ccode_alarm_0113.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!19 = !{!20, !25, !29, !34, !6}
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !21, line: 7, baseType: !22)
!21 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
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
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!51 = !DISubroutineType(types: !52)
!52 = !{!11}
!53 = !DILocalVariable(name: "value", scope: !49, file: !50, line: 9, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !7, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !9, line: 41, baseType: !11)
!56 = !DILocation(line: 9, column: 13, scope: !49)
!57 = !DILocalVariable(name: "factor", scope: !49, file: !50, line: 10, type: !54)
!58 = !DILocation(line: 10, column: 13, scope: !49)
!59 = !DILocalVariable(name: "power", scope: !49, file: !50, line: 11, type: !30)
!60 = !DILocation(line: 11, column: 13, scope: !49)
!61 = !DILocalVariable(name: "result", scope: !49, file: !50, line: 12, type: !54)
!62 = !DILocation(line: 12, column: 13, scope: !49)
!63 = !DILocation(line: 14, column: 24, scope: !49)
!64 = !DILocation(line: 14, column: 5, scope: !49)
!65 = !DILocation(line: 15, column: 24, scope: !49)
!66 = !DILocation(line: 15, column: 5, scope: !49)
!67 = !DILocation(line: 16, column: 5, scope: !49)
!68 = !DILocation(line: 18, column: 44, scope: !49)
!69 = !DILocation(line: 18, column: 51, scope: !49)
!70 = !DILocation(line: 18, column: 59, scope: !49)
!71 = !DILocation(line: 18, column: 14, scope: !49)
!72 = !DILocation(line: 18, column: 12, scope: !49)
!73 = !DILocation(line: 20, column: 11, scope: !49)
!74 = !DILocation(line: 21, column: 5, scope: !49)
!75 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !76, file: !76, line: 43, type: !77, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!76 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!77 = !DISubroutineType(types: !78)
!78 = !{!20, !20, !34}
!79 = !DILocalVariable(name: "value", arg: 1, scope: !75, file: !76, line: 43, type: !20)
!80 = !DILocation(line: 43, column: 35, scope: !75)
!81 = !DILocalVariable(name: "factor", arg: 2, scope: !75, file: !76, line: 43, type: !34)
!82 = !DILocation(line: 43, column: 46, scope: !75)
!83 = !DILocalVariable(name: "s32MulTemp1", scope: !75, file: !76, line: 45, type: !84)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !21, line: 11, baseType: !54)
!85 = !DILocation(line: 45, column: 6, scope: !75)
!86 = !DILocalVariable(name: "s32MulTemp2", scope: !75, file: !76, line: 45, type: !84)
!87 = !DILocation(line: 45, column: 24, scope: !75)
!88 = !DILocation(line: 46, column: 16, scope: !75)
!89 = !DILocation(line: 46, column: 24, scope: !75)
!90 = !DILocation(line: 46, column: 22, scope: !75)
!91 = !DILocation(line: 46, column: 14, scope: !75)
!92 = !DILocation(line: 48, column: 16, scope: !75)
!93 = !DILocation(line: 48, column: 28, scope: !75)
!94 = !DILocation(line: 48, column: 14, scope: !75)
!95 = !DILocation(line: 50, column: 6, scope: !96)
!96 = distinct !DILexicalBlock(scope: !75, file: !76, line: 50, column: 5)
!97 = !DILocation(line: 50, column: 17, scope: !96)
!98 = !DILocation(line: 50, column: 21, scope: !96)
!99 = !DILocation(line: 50, column: 25, scope: !96)
!100 = !DILocation(line: 50, column: 37, scope: !96)
!101 = !DILocation(line: 50, column: 46, scope: !96)
!102 = !DILocation(line: 50, column: 5, scope: !75)
!103 = !DILocation(line: 52, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !76, line: 51, column: 2)
!105 = !DILocation(line: 52, column: 29, scope: !104)
!106 = !DILocation(line: 52, column: 15, scope: !104)
!107 = !DILocation(line: 53, column: 14, scope: !104)
!108 = !DILocation(line: 53, column: 10, scope: !104)
!109 = !DILocation(line: 53, column: 3, scope: !104)
!110 = !DILocation(line: 57, column: 14, scope: !111)
!111 = distinct !DILexicalBlock(scope: !96, file: !76, line: 56, column: 2)
!112 = !DILocation(line: 57, column: 10, scope: !111)
!113 = !DILocation(line: 57, column: 3, scope: !111)
!114 = !DILocation(line: 59, column: 1, scope: !75)
!115 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !76, file: !76, line: 77, type: !77, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!116 = !DILocalVariable(name: "value", arg: 1, scope: !115, file: !76, line: 77, type: !20)
!117 = !DILocation(line: 77, column: 38, scope: !115)
!118 = !DILocalVariable(name: "factor", arg: 2, scope: !115, file: !76, line: 77, type: !34)
!119 = !DILocation(line: 77, column: 49, scope: !115)
!120 = !DILocalVariable(name: "s32MulTemp1", scope: !115, file: !76, line: 79, type: !84)
!121 = !DILocation(line: 79, column: 6, scope: !115)
!122 = !DILocalVariable(name: "s32MulTemp2", scope: !115, file: !76, line: 79, type: !84)
!123 = !DILocation(line: 79, column: 24, scope: !115)
!124 = !DILocation(line: 80, column: 16, scope: !115)
!125 = !DILocation(line: 80, column: 24, scope: !115)
!126 = !DILocation(line: 80, column: 22, scope: !115)
!127 = !DILocation(line: 80, column: 14, scope: !115)
!128 = !DILocation(line: 81, column: 16, scope: !115)
!129 = !DILocation(line: 81, column: 28, scope: !115)
!130 = !DILocation(line: 81, column: 14, scope: !115)
!131 = !DILocation(line: 82, column: 6, scope: !132)
!132 = distinct !DILexicalBlock(scope: !115, file: !76, line: 82, column: 5)
!133 = !DILocation(line: 82, column: 17, scope: !132)
!134 = !DILocation(line: 82, column: 21, scope: !132)
!135 = !DILocation(line: 82, column: 25, scope: !132)
!136 = !DILocation(line: 82, column: 37, scope: !132)
!137 = !DILocation(line: 82, column: 44, scope: !132)
!138 = !DILocation(line: 82, column: 5, scope: !115)
!139 = !DILocation(line: 84, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !76, line: 83, column: 2)
!141 = !DILocation(line: 84, column: 29, scope: !140)
!142 = !DILocation(line: 84, column: 15, scope: !140)
!143 = !DILocation(line: 85, column: 2, scope: !140)
!144 = !DILocation(line: 91, column: 5, scope: !145)
!145 = distinct !DILexicalBlock(scope: !115, file: !76, line: 91, column: 5)
!146 = !DILocation(line: 91, column: 17, scope: !145)
!147 = !DILocation(line: 91, column: 5, scope: !115)
!148 = !DILocation(line: 93, column: 6, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !76, line: 93, column: 6)
!150 = distinct !DILexicalBlock(scope: !145, file: !76, line: 92, column: 2)
!151 = !DILocation(line: 93, column: 18, scope: !149)
!152 = !DILocation(line: 93, column: 6, scope: !150)
!153 = !DILocation(line: 95, column: 15, scope: !154)
!154 = distinct !DILexicalBlock(scope: !149, file: !76, line: 94, column: 3)
!155 = !DILocation(line: 95, column: 11, scope: !154)
!156 = !DILocation(line: 95, column: 4, scope: !154)
!157 = !DILocation(line: 99, column: 4, scope: !158)
!158 = distinct !DILexicalBlock(scope: !149, file: !76, line: 98, column: 3)
!159 = !DILocation(line: 104, column: 3, scope: !160)
!160 = distinct !DILexicalBlock(scope: !145, file: !76, line: 103, column: 2)
!161 = !DILocation(line: 106, column: 1, scope: !115)
!162 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !76, file: !76, line: 123, type: !163, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!163 = !DISubroutineType(types: !164)
!164 = !{!20, !20, !29}
!165 = !DILocalVariable(name: "value", arg: 1, scope: !162, file: !76, line: 123, type: !20)
!166 = !DILocation(line: 123, column: 25, scope: !162)
!167 = !DILocalVariable(name: "factor", arg: 2, scope: !162, file: !76, line: 123, type: !29)
!168 = !DILocation(line: 123, column: 35, scope: !162)
!169 = !DILocalVariable(name: "s32MulTemp1", scope: !162, file: !76, line: 125, type: !84)
!170 = !DILocation(line: 125, column: 6, scope: !162)
!171 = !DILocalVariable(name: "s32MulTemp2", scope: !162, file: !76, line: 125, type: !84)
!172 = !DILocation(line: 125, column: 24, scope: !162)
!173 = !DILocation(line: 126, column: 16, scope: !162)
!174 = !DILocation(line: 126, column: 24, scope: !162)
!175 = !DILocation(line: 126, column: 22, scope: !162)
!176 = !DILocation(line: 126, column: 14, scope: !162)
!177 = !DILocation(line: 127, column: 16, scope: !162)
!178 = !DILocation(line: 127, column: 28, scope: !162)
!179 = !DILocation(line: 127, column: 14, scope: !162)
!180 = !DILocation(line: 128, column: 6, scope: !181)
!181 = distinct !DILexicalBlock(scope: !162, file: !76, line: 128, column: 5)
!182 = !DILocation(line: 128, column: 17, scope: !181)
!183 = !DILocation(line: 128, column: 21, scope: !181)
!184 = !DILocation(line: 128, column: 25, scope: !181)
!185 = !DILocation(line: 128, column: 37, scope: !181)
!186 = !DILocation(line: 128, column: 44, scope: !181)
!187 = !DILocation(line: 128, column: 5, scope: !162)
!188 = !DILocation(line: 130, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !181, file: !76, line: 129, column: 2)
!190 = !DILocation(line: 130, column: 29, scope: !189)
!191 = !DILocation(line: 130, column: 15, scope: !189)
!192 = !DILocation(line: 131, column: 14, scope: !189)
!193 = !DILocation(line: 131, column: 10, scope: !189)
!194 = !DILocation(line: 131, column: 3, scope: !189)
!195 = !DILocation(line: 135, column: 14, scope: !196)
!196 = distinct !DILexicalBlock(scope: !181, file: !76, line: 134, column: 2)
!197 = !DILocation(line: 135, column: 10, scope: !196)
!198 = !DILocation(line: 135, column: 3, scope: !196)
!199 = !DILocation(line: 137, column: 1, scope: !162)
!200 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !76, file: !76, line: 155, type: !163, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!201 = !DILocalVariable(name: "value", arg: 1, scope: !200, file: !76, line: 155, type: !20)
!202 = !DILocation(line: 155, column: 25, scope: !200)
!203 = !DILocalVariable(name: "factor", arg: 2, scope: !200, file: !76, line: 155, type: !29)
!204 = !DILocation(line: 155, column: 35, scope: !200)
!205 = !DILocalVariable(name: "s32MulTemp1", scope: !200, file: !76, line: 157, type: !84)
!206 = !DILocation(line: 157, column: 6, scope: !200)
!207 = !DILocalVariable(name: "s32MulTemp2", scope: !200, file: !76, line: 157, type: !84)
!208 = !DILocation(line: 157, column: 24, scope: !200)
!209 = !DILocation(line: 158, column: 16, scope: !200)
!210 = !DILocation(line: 158, column: 24, scope: !200)
!211 = !DILocation(line: 158, column: 22, scope: !200)
!212 = !DILocation(line: 158, column: 14, scope: !200)
!213 = !DILocation(line: 159, column: 16, scope: !200)
!214 = !DILocation(line: 159, column: 28, scope: !200)
!215 = !DILocation(line: 159, column: 14, scope: !200)
!216 = !DILocation(line: 160, column: 6, scope: !217)
!217 = distinct !DILexicalBlock(scope: !200, file: !76, line: 160, column: 5)
!218 = !DILocation(line: 160, column: 17, scope: !217)
!219 = !DILocation(line: 160, column: 21, scope: !217)
!220 = !DILocation(line: 160, column: 25, scope: !217)
!221 = !DILocation(line: 160, column: 37, scope: !217)
!222 = !DILocation(line: 160, column: 44, scope: !217)
!223 = !DILocation(line: 160, column: 5, scope: !200)
!224 = !DILocation(line: 162, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !217, file: !76, line: 161, column: 2)
!226 = !DILocation(line: 162, column: 29, scope: !225)
!227 = !DILocation(line: 162, column: 15, scope: !225)
!228 = !DILocation(line: 163, column: 2, scope: !225)
!229 = !DILocation(line: 169, column: 5, scope: !230)
!230 = distinct !DILexicalBlock(scope: !200, file: !76, line: 169, column: 5)
!231 = !DILocation(line: 169, column: 17, scope: !230)
!232 = !DILocation(line: 169, column: 5, scope: !200)
!233 = !DILocation(line: 171, column: 6, scope: !234)
!234 = distinct !DILexicalBlock(scope: !235, file: !76, line: 171, column: 6)
!235 = distinct !DILexicalBlock(scope: !230, file: !76, line: 170, column: 2)
!236 = !DILocation(line: 171, column: 18, scope: !234)
!237 = !DILocation(line: 171, column: 6, scope: !235)
!238 = !DILocation(line: 173, column: 15, scope: !239)
!239 = distinct !DILexicalBlock(scope: !234, file: !76, line: 172, column: 3)
!240 = !DILocation(line: 173, column: 11, scope: !239)
!241 = !DILocation(line: 173, column: 4, scope: !239)
!242 = !DILocation(line: 177, column: 4, scope: !243)
!243 = distinct !DILexicalBlock(scope: !234, file: !76, line: 176, column: 3)
!244 = !DILocation(line: 182, column: 3, scope: !245)
!245 = distinct !DILexicalBlock(scope: !230, file: !76, line: 181, column: 2)
!246 = !DILocation(line: 184, column: 1, scope: !200)
!247 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !76, file: !76, line: 200, type: !248, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!248 = !DISubroutineType(types: !249)
!249 = !{!25, !25, !25, !84}
!250 = !DILocalVariable(name: "value", arg: 1, scope: !247, file: !76, line: 200, type: !25)
!251 = !DILocation(line: 200, column: 40, scope: !247)
!252 = !DILocalVariable(name: "factor", arg: 2, scope: !247, file: !76, line: 200, type: !25)
!253 = !DILocation(line: 200, column: 51, scope: !247)
!254 = !DILocalVariable(name: "count", arg: 3, scope: !247, file: !76, line: 200, type: !84)
!255 = !DILocation(line: 200, column: 63, scope: !247)
!256 = !DILocalVariable(name: "s32MulTemp", scope: !247, file: !76, line: 202, type: !84)
!257 = !DILocation(line: 202, column: 6, scope: !247)
!258 = !DILocation(line: 203, column: 15, scope: !247)
!259 = !DILocation(line: 203, column: 23, scope: !247)
!260 = !DILocation(line: 203, column: 21, scope: !247)
!261 = !DILocation(line: 203, column: 13, scope: !247)
!262 = !DILocation(line: 204, column: 15, scope: !247)
!263 = !DILocation(line: 204, column: 26, scope: !247)
!264 = !DILocation(line: 204, column: 25, scope: !247)
!265 = !{!"True"}
!266 = !DILocation(line: 204, column: 13, scope: !247)
!267 = !DILocation(line: 205, column: 9, scope: !247)
!268 = !DILocation(line: 205, column: 2, scope: !247)
!269 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !76, file: !76, line: 223, type: !248, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!270 = !DILocalVariable(name: "value", arg: 1, scope: !269, file: !76, line: 223, type: !25)
!271 = !DILocation(line: 223, column: 43, scope: !269)
!272 = !DILocalVariable(name: "factor", arg: 2, scope: !269, file: !76, line: 223, type: !25)
!273 = !DILocation(line: 223, column: 54, scope: !269)
!274 = !DILocalVariable(name: "count", arg: 3, scope: !269, file: !76, line: 223, type: !84)
!275 = !DILocation(line: 223, column: 66, scope: !269)
!276 = !DILocalVariable(name: "s32MulTemp", scope: !269, file: !76, line: 225, type: !84)
!277 = !DILocation(line: 225, column: 6, scope: !269)
!278 = !DILocation(line: 226, column: 15, scope: !269)
!279 = !DILocation(line: 226, column: 23, scope: !269)
!280 = !DILocation(line: 226, column: 21, scope: !269)
!281 = !DILocation(line: 226, column: 13, scope: !269)
!282 = !DILocation(line: 227, column: 15, scope: !269)
!283 = !DILocation(line: 227, column: 26, scope: !269)
!284 = !DILocation(line: 227, column: 25, scope: !269)
!285 = !DILocation(line: 227, column: 13, scope: !269)
!286 = !DILocation(line: 228, column: 5, scope: !287)
!287 = distinct !DILexicalBlock(scope: !269, file: !76, line: 228, column: 5)
!288 = !DILocation(line: 228, column: 16, scope: !287)
!289 = !DILocation(line: 228, column: 5, scope: !269)
!290 = !DILocation(line: 230, column: 6, scope: !291)
!291 = distinct !DILexicalBlock(scope: !292, file: !76, line: 230, column: 6)
!292 = distinct !DILexicalBlock(scope: !287, file: !76, line: 229, column: 2)
!293 = !DILocation(line: 230, column: 17, scope: !291)
!294 = !DILocation(line: 230, column: 6, scope: !292)
!295 = !DILocation(line: 232, column: 16, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !76, line: 231, column: 3)
!297 = !DILocation(line: 232, column: 11, scope: !296)
!298 = !DILocation(line: 232, column: 4, scope: !296)
!299 = !DILocation(line: 236, column: 4, scope: !300)
!300 = distinct !DILexicalBlock(scope: !291, file: !76, line: 235, column: 3)
!301 = !DILocation(line: 241, column: 3, scope: !302)
!302 = distinct !DILexicalBlock(scope: !287, file: !76, line: 240, column: 2)
!303 = !DILocation(line: 243, column: 1, scope: !269)
!304 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !76, file: !76, line: 262, type: !305, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!305 = !DISubroutineType(types: !306)
!306 = !{!25, !25, !25}
!307 = !DILocalVariable(name: "value", arg: 1, scope: !304, file: !76, line: 262, type: !25)
!308 = !DILocation(line: 262, column: 30, scope: !304)
!309 = !DILocalVariable(name: "factor", arg: 2, scope: !304, file: !76, line: 262, type: !25)
!310 = !DILocation(line: 262, column: 41, scope: !304)
!311 = !DILocalVariable(name: "s32MulTemp1", scope: !304, file: !76, line: 264, type: !84)
!312 = !DILocation(line: 264, column: 6, scope: !304)
!313 = !DILocalVariable(name: "s32MulTemp2", scope: !304, file: !76, line: 264, type: !84)
!314 = !DILocation(line: 264, column: 24, scope: !304)
!315 = !DILocation(line: 265, column: 16, scope: !304)
!316 = !DILocation(line: 265, column: 24, scope: !304)
!317 = !DILocation(line: 265, column: 22, scope: !304)
!318 = !DILocation(line: 265, column: 14, scope: !304)
!319 = !DILocation(line: 266, column: 16, scope: !304)
!320 = !DILocation(line: 266, column: 28, scope: !304)
!321 = !DILocation(line: 266, column: 14, scope: !304)
!322 = !DILocation(line: 267, column: 6, scope: !323)
!323 = distinct !DILexicalBlock(scope: !304, file: !76, line: 267, column: 5)
!324 = !DILocation(line: 267, column: 17, scope: !323)
!325 = !DILocation(line: 267, column: 21, scope: !323)
!326 = !DILocation(line: 267, column: 25, scope: !323)
!327 = !DILocation(line: 267, column: 37, scope: !323)
!328 = !DILocation(line: 267, column: 46, scope: !323)
!329 = !DILocation(line: 267, column: 5, scope: !304)
!330 = !DILocation(line: 269, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !323, file: !76, line: 268, column: 2)
!332 = !DILocation(line: 269, column: 29, scope: !331)
!333 = !DILocation(line: 269, column: 15, scope: !331)
!334 = !DILocation(line: 271, column: 2, scope: !331)
!335 = !DILocation(line: 277, column: 5, scope: !336)
!336 = distinct !DILexicalBlock(scope: !304, file: !76, line: 277, column: 5)
!337 = !DILocation(line: 277, column: 17, scope: !336)
!338 = !DILocation(line: 277, column: 5, scope: !304)
!339 = !DILocation(line: 279, column: 15, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !76, line: 278, column: 2)
!341 = !DILocation(line: 279, column: 10, scope: !340)
!342 = !DILocation(line: 279, column: 3, scope: !340)
!343 = !DILocation(line: 283, column: 3, scope: !344)
!344 = distinct !DILexicalBlock(scope: !336, file: !76, line: 282, column: 2)
!345 = !DILocation(line: 285, column: 1, scope: !304)
!346 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !76, file: !76, line: 304, type: !305, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!347 = !DILocalVariable(name: "value", arg: 1, scope: !346, file: !76, line: 304, type: !25)
!348 = !DILocation(line: 304, column: 30, scope: !346)
!349 = !DILocalVariable(name: "factor", arg: 2, scope: !346, file: !76, line: 304, type: !25)
!350 = !DILocation(line: 304, column: 41, scope: !346)
!351 = !DILocalVariable(name: "s32MulTemp1", scope: !346, file: !76, line: 306, type: !84)
!352 = !DILocation(line: 306, column: 6, scope: !346)
!353 = !DILocalVariable(name: "s32MulTemp2", scope: !346, file: !76, line: 306, type: !84)
!354 = !DILocation(line: 306, column: 24, scope: !346)
!355 = !DILocation(line: 307, column: 16, scope: !346)
!356 = !DILocation(line: 307, column: 24, scope: !346)
!357 = !DILocation(line: 307, column: 22, scope: !346)
!358 = !DILocation(line: 307, column: 14, scope: !346)
!359 = !DILocation(line: 308, column: 16, scope: !346)
!360 = !DILocation(line: 308, column: 28, scope: !346)
!361 = !DILocation(line: 308, column: 14, scope: !346)
!362 = !DILocation(line: 309, column: 6, scope: !363)
!363 = distinct !DILexicalBlock(scope: !346, file: !76, line: 309, column: 5)
!364 = !DILocation(line: 309, column: 17, scope: !363)
!365 = !DILocation(line: 309, column: 21, scope: !363)
!366 = !DILocation(line: 309, column: 25, scope: !363)
!367 = !DILocation(line: 309, column: 37, scope: !363)
!368 = !DILocation(line: 309, column: 46, scope: !363)
!369 = !DILocation(line: 309, column: 5, scope: !346)
!370 = !DILocation(line: 311, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !363, file: !76, line: 310, column: 2)
!372 = !DILocation(line: 311, column: 29, scope: !371)
!373 = !DILocation(line: 311, column: 15, scope: !371)
!374 = !DILocation(line: 312, column: 2, scope: !371)
!375 = !DILocation(line: 318, column: 6, scope: !376)
!376 = distinct !DILexicalBlock(scope: !346, file: !76, line: 318, column: 6)
!377 = !DILocation(line: 318, column: 18, scope: !376)
!378 = !DILocation(line: 318, column: 6, scope: !346)
!379 = !DILocation(line: 320, column: 6, scope: !380)
!380 = distinct !DILexicalBlock(scope: !381, file: !76, line: 320, column: 6)
!381 = distinct !DILexicalBlock(scope: !376, file: !76, line: 319, column: 2)
!382 = !DILocation(line: 320, column: 18, scope: !380)
!383 = !DILocation(line: 320, column: 6, scope: !381)
!384 = !DILocation(line: 322, column: 16, scope: !385)
!385 = distinct !DILexicalBlock(scope: !380, file: !76, line: 321, column: 3)
!386 = !DILocation(line: 322, column: 11, scope: !385)
!387 = !DILocation(line: 322, column: 4, scope: !385)
!388 = !DILocation(line: 326, column: 4, scope: !389)
!389 = distinct !DILexicalBlock(scope: !380, file: !76, line: 325, column: 3)
!390 = !DILocation(line: 331, column: 3, scope: !391)
!391 = distinct !DILexicalBlock(scope: !376, file: !76, line: 330, column: 2)
!392 = !DILocation(line: 333, column: 1, scope: !346)
!393 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !76, file: !76, line: 350, type: !394, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!394 = !DISubroutineType(types: !395)
!395 = !{!25, !25, !34}
!396 = !DILocalVariable(name: "value", arg: 1, scope: !393, file: !76, line: 350, type: !25)
!397 = !DILocation(line: 350, column: 39, scope: !393)
!398 = !DILocalVariable(name: "factor", arg: 2, scope: !393, file: !76, line: 350, type: !34)
!399 = !DILocation(line: 350, column: 50, scope: !393)
!400 = !DILocalVariable(name: "s32MulTemp1", scope: !393, file: !76, line: 352, type: !84)
!401 = !DILocation(line: 352, column: 6, scope: !393)
!402 = !DILocalVariable(name: "s32MulTemp2", scope: !393, file: !76, line: 352, type: !84)
!403 = !DILocation(line: 352, column: 24, scope: !393)
!404 = !DILocation(line: 353, column: 16, scope: !393)
!405 = !DILocation(line: 353, column: 24, scope: !393)
!406 = !DILocation(line: 353, column: 22, scope: !393)
!407 = !DILocation(line: 353, column: 14, scope: !393)
!408 = !DILocation(line: 354, column: 16, scope: !393)
!409 = !DILocation(line: 354, column: 28, scope: !393)
!410 = !DILocation(line: 354, column: 14, scope: !393)
!411 = !DILocation(line: 355, column: 6, scope: !412)
!412 = distinct !DILexicalBlock(scope: !393, file: !76, line: 355, column: 5)
!413 = !DILocation(line: 355, column: 17, scope: !412)
!414 = !DILocation(line: 355, column: 21, scope: !412)
!415 = !DILocation(line: 355, column: 25, scope: !412)
!416 = !DILocation(line: 355, column: 37, scope: !412)
!417 = !DILocation(line: 355, column: 46, scope: !412)
!418 = !DILocation(line: 355, column: 5, scope: !393)
!419 = !DILocation(line: 361, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !412, file: !76, line: 360, column: 2)
!421 = !DILocation(line: 361, column: 29, scope: !420)
!422 = !DILocation(line: 361, column: 15, scope: !420)
!423 = !DILocation(line: 362, column: 15, scope: !420)
!424 = !DILocation(line: 362, column: 10, scope: !420)
!425 = !DILocation(line: 362, column: 3, scope: !420)
!426 = !DILocation(line: 366, column: 15, scope: !427)
!427 = distinct !DILexicalBlock(scope: !412, file: !76, line: 365, column: 2)
!428 = !DILocation(line: 366, column: 10, scope: !427)
!429 = !DILocation(line: 366, column: 3, scope: !427)
!430 = !DILocation(line: 368, column: 1, scope: !393)
!431 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !76, file: !76, line: 386, type: !394, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!432 = !DILocalVariable(name: "value", arg: 1, scope: !431, file: !76, line: 386, type: !25)
!433 = !DILocation(line: 386, column: 42, scope: !431)
!434 = !DILocalVariable(name: "factor", arg: 2, scope: !431, file: !76, line: 386, type: !34)
!435 = !DILocation(line: 386, column: 53, scope: !431)
!436 = !DILocalVariable(name: "s32MulTemp1", scope: !431, file: !76, line: 388, type: !84)
!437 = !DILocation(line: 388, column: 6, scope: !431)
!438 = !DILocalVariable(name: "s32MulTemp2", scope: !431, file: !76, line: 388, type: !84)
!439 = !DILocation(line: 388, column: 24, scope: !431)
!440 = !DILocation(line: 389, column: 16, scope: !431)
!441 = !DILocation(line: 389, column: 24, scope: !431)
!442 = !DILocation(line: 389, column: 22, scope: !431)
!443 = !DILocation(line: 389, column: 14, scope: !431)
!444 = !DILocation(line: 390, column: 16, scope: !431)
!445 = !DILocation(line: 390, column: 28, scope: !431)
!446 = !DILocation(line: 390, column: 14, scope: !431)
!447 = !DILocation(line: 391, column: 6, scope: !448)
!448 = distinct !DILexicalBlock(scope: !431, file: !76, line: 391, column: 5)
!449 = !DILocation(line: 391, column: 17, scope: !448)
!450 = !DILocation(line: 391, column: 21, scope: !448)
!451 = !DILocation(line: 391, column: 25, scope: !448)
!452 = !DILocation(line: 391, column: 37, scope: !448)
!453 = !DILocation(line: 391, column: 44, scope: !448)
!454 = !DILocation(line: 391, column: 5, scope: !431)
!455 = !DILocation(line: 398, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !448, file: !76, line: 397, column: 2)
!457 = !DILocation(line: 398, column: 29, scope: !456)
!458 = !DILocation(line: 398, column: 15, scope: !456)
!459 = !DILocation(line: 399, column: 2, scope: !456)
!460 = !DILocation(line: 404, column: 5, scope: !461)
!461 = distinct !DILexicalBlock(scope: !431, file: !76, line: 404, column: 5)
!462 = !DILocation(line: 404, column: 17, scope: !461)
!463 = !DILocation(line: 404, column: 5, scope: !431)
!464 = !DILocation(line: 406, column: 6, scope: !465)
!465 = distinct !DILexicalBlock(scope: !466, file: !76, line: 406, column: 6)
!466 = distinct !DILexicalBlock(scope: !461, file: !76, line: 405, column: 2)
!467 = !DILocation(line: 406, column: 18, scope: !465)
!468 = !DILocation(line: 406, column: 6, scope: !466)
!469 = !DILocation(line: 408, column: 16, scope: !470)
!470 = distinct !DILexicalBlock(scope: !465, file: !76, line: 407, column: 3)
!471 = !DILocation(line: 408, column: 11, scope: !470)
!472 = !DILocation(line: 408, column: 4, scope: !470)
!473 = !DILocation(line: 412, column: 4, scope: !474)
!474 = distinct !DILexicalBlock(scope: !465, file: !76, line: 411, column: 3)
!475 = !DILocation(line: 417, column: 3, scope: !476)
!476 = distinct !DILexicalBlock(scope: !461, file: !76, line: 416, column: 2)
!477 = !DILocation(line: 419, column: 1, scope: !431)
!478 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !76, file: !76, line: 436, type: !479, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!479 = !DISubroutineType(types: !480)
!480 = !{!25, !25, !29}
!481 = !DILocalVariable(name: "value", arg: 1, scope: !478, file: !76, line: 436, type: !25)
!482 = !DILocation(line: 436, column: 29, scope: !478)
!483 = !DILocalVariable(name: "factor", arg: 2, scope: !478, file: !76, line: 436, type: !29)
!484 = !DILocation(line: 436, column: 39, scope: !478)
!485 = !DILocalVariable(name: "s32MulTemp1", scope: !478, file: !76, line: 438, type: !84)
!486 = !DILocation(line: 438, column: 6, scope: !478)
!487 = !DILocalVariable(name: "s32MulTemp2", scope: !478, file: !76, line: 438, type: !84)
!488 = !DILocation(line: 438, column: 24, scope: !478)
!489 = !DILocation(line: 439, column: 16, scope: !478)
!490 = !DILocation(line: 439, column: 24, scope: !478)
!491 = !DILocation(line: 439, column: 22, scope: !478)
!492 = !DILocation(line: 439, column: 14, scope: !478)
!493 = !DILocation(line: 440, column: 16, scope: !478)
!494 = !DILocation(line: 440, column: 28, scope: !478)
!495 = !DILocation(line: 440, column: 14, scope: !478)
!496 = !DILocation(line: 441, column: 6, scope: !497)
!497 = distinct !DILexicalBlock(scope: !478, file: !76, line: 441, column: 5)
!498 = !DILocation(line: 441, column: 17, scope: !497)
!499 = !DILocation(line: 441, column: 21, scope: !497)
!500 = !DILocation(line: 441, column: 25, scope: !497)
!501 = !DILocation(line: 441, column: 37, scope: !497)
!502 = !DILocation(line: 441, column: 44, scope: !497)
!503 = !DILocation(line: 441, column: 5, scope: !478)
!504 = !DILocation(line: 448, column: 17, scope: !505)
!505 = distinct !DILexicalBlock(scope: !497, file: !76, line: 447, column: 2)
!506 = !DILocation(line: 448, column: 29, scope: !505)
!507 = !DILocation(line: 448, column: 15, scope: !505)
!508 = !DILocation(line: 449, column: 10, scope: !505)
!509 = !DILocation(line: 449, column: 3, scope: !505)
!510 = !DILocation(line: 453, column: 10, scope: !511)
!511 = distinct !DILexicalBlock(scope: !497, file: !76, line: 452, column: 2)
!512 = !DILocation(line: 453, column: 3, scope: !511)
!513 = !DILocation(line: 455, column: 1, scope: !478)
!514 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !76, file: !76, line: 473, type: !479, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!515 = !DILocalVariable(name: "value", arg: 1, scope: !514, file: !76, line: 473, type: !25)
!516 = !DILocation(line: 473, column: 29, scope: !514)
!517 = !DILocalVariable(name: "factor", arg: 2, scope: !514, file: !76, line: 473, type: !29)
!518 = !DILocation(line: 473, column: 39, scope: !514)
!519 = !DILocalVariable(name: "s32MulTemp1", scope: !514, file: !76, line: 475, type: !84)
!520 = !DILocation(line: 475, column: 6, scope: !514)
!521 = !DILocalVariable(name: "s32MulTemp2", scope: !514, file: !76, line: 475, type: !84)
!522 = !DILocation(line: 475, column: 24, scope: !514)
!523 = !DILocation(line: 476, column: 16, scope: !514)
!524 = !DILocation(line: 476, column: 24, scope: !514)
!525 = !DILocation(line: 476, column: 22, scope: !514)
!526 = !DILocation(line: 476, column: 14, scope: !514)
!527 = !DILocation(line: 477, column: 16, scope: !514)
!528 = !DILocation(line: 477, column: 28, scope: !514)
!529 = !DILocation(line: 477, column: 14, scope: !514)
!530 = !DILocation(line: 478, column: 6, scope: !531)
!531 = distinct !DILexicalBlock(scope: !514, file: !76, line: 478, column: 5)
!532 = !DILocation(line: 478, column: 17, scope: !531)
!533 = !DILocation(line: 478, column: 21, scope: !531)
!534 = !DILocation(line: 478, column: 25, scope: !531)
!535 = !DILocation(line: 478, column: 37, scope: !531)
!536 = !DILocation(line: 478, column: 44, scope: !531)
!537 = !DILocation(line: 478, column: 5, scope: !514)
!538 = !DILocation(line: 484, column: 17, scope: !539)
!539 = distinct !DILexicalBlock(scope: !531, file: !76, line: 483, column: 2)
!540 = !DILocation(line: 484, column: 29, scope: !539)
!541 = !DILocation(line: 484, column: 15, scope: !539)
!542 = !DILocation(line: 485, column: 2, scope: !539)
!543 = !DILocation(line: 491, column: 6, scope: !544)
!544 = distinct !DILexicalBlock(scope: !514, file: !76, line: 491, column: 6)
!545 = !DILocation(line: 491, column: 18, scope: !544)
!546 = !DILocation(line: 491, column: 6, scope: !514)
!547 = !DILocation(line: 493, column: 6, scope: !548)
!548 = distinct !DILexicalBlock(scope: !549, file: !76, line: 493, column: 6)
!549 = distinct !DILexicalBlock(scope: !544, file: !76, line: 492, column: 2)
!550 = !DILocation(line: 493, column: 18, scope: !548)
!551 = !DILocation(line: 493, column: 6, scope: !549)
!552 = !DILocation(line: 495, column: 16, scope: !553)
!553 = distinct !DILexicalBlock(scope: !548, file: !76, line: 494, column: 3)
!554 = !DILocation(line: 495, column: 11, scope: !553)
!555 = !DILocation(line: 495, column: 4, scope: !553)
!556 = !DILocation(line: 499, column: 4, scope: !557)
!557 = distinct !DILexicalBlock(scope: !548, file: !76, line: 498, column: 3)
!558 = !DILocation(line: 504, column: 3, scope: !559)
!559 = distinct !DILexicalBlock(scope: !544, file: !76, line: 503, column: 2)
!560 = !DILocation(line: 506, column: 1, scope: !514)
!561 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !76, file: !76, line: 521, type: !394, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!562 = !DILocalVariable(name: "value", arg: 1, scope: !561, file: !76, line: 521, type: !25)
!563 = !DILocation(line: 521, column: 25, scope: !561)
!564 = !DILocalVariable(name: "factor", arg: 2, scope: !561, file: !76, line: 521, type: !34)
!565 = !DILocation(line: 521, column: 36, scope: !561)
!566 = !DILocalVariable(name: "s32MulTemp", scope: !561, file: !76, line: 523, type: !84)
!567 = !DILocation(line: 523, column: 6, scope: !561)
!568 = !DILocation(line: 524, column: 15, scope: !561)
!569 = !DILocation(line: 524, column: 23, scope: !561)
!570 = !DILocation(line: 524, column: 21, scope: !561)
!571 = !DILocation(line: 524, column: 13, scope: !561)
!572 = !DILocation(line: 525, column: 5, scope: !573)
!573 = distinct !DILexicalBlock(scope: !561, file: !76, line: 525, column: 5)
!574 = !DILocation(line: 525, column: 16, scope: !573)
!575 = !DILocation(line: 525, column: 5, scope: !561)
!576 = !DILocation(line: 527, column: 6, scope: !577)
!577 = distinct !DILexicalBlock(scope: !578, file: !76, line: 527, column: 6)
!578 = distinct !DILexicalBlock(scope: !573, file: !76, line: 526, column: 2)
!579 = !DILocation(line: 527, column: 17, scope: !577)
!580 = !DILocation(line: 527, column: 6, scope: !578)
!581 = !DILocation(line: 529, column: 16, scope: !582)
!582 = distinct !DILexicalBlock(scope: !577, file: !76, line: 528, column: 3)
!583 = !DILocation(line: 529, column: 11, scope: !582)
!584 = !DILocation(line: 529, column: 4, scope: !582)
!585 = !DILocation(line: 533, column: 4, scope: !586)
!586 = distinct !DILexicalBlock(scope: !577, file: !76, line: 532, column: 3)
!587 = !DILocation(line: 538, column: 3, scope: !588)
!588 = distinct !DILexicalBlock(scope: !573, file: !76, line: 537, column: 2)
!589 = !DILocation(line: 540, column: 1, scope: !561)
!590 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !76, file: !76, line: 556, type: !591, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!591 = !DISubroutineType(types: !592)
!592 = !{!25, !25, !34, !84}
!593 = !DILocalVariable(name: "value", arg: 1, scope: !590, file: !76, line: 556, type: !25)
!594 = !DILocation(line: 556, column: 40, scope: !590)
!595 = !DILocalVariable(name: "factor", arg: 2, scope: !590, file: !76, line: 556, type: !34)
!596 = !DILocation(line: 556, column: 50, scope: !590)
!597 = !DILocalVariable(name: "count", arg: 3, scope: !590, file: !76, line: 556, type: !84)
!598 = !DILocation(line: 556, column: 61, scope: !590)
!599 = !DILocalVariable(name: "s32MulTemp", scope: !590, file: !76, line: 558, type: !84)
!600 = !DILocation(line: 558, column: 6, scope: !590)
!601 = !DILocation(line: 559, column: 15, scope: !590)
!602 = !DILocation(line: 559, column: 23, scope: !590)
!603 = !DILocation(line: 559, column: 21, scope: !590)
!604 = !DILocation(line: 559, column: 13, scope: !590)
!605 = !DILocation(line: 560, column: 15, scope: !590)
!606 = !DILocation(line: 560, column: 26, scope: !590)
!607 = !DILocation(line: 560, column: 25, scope: !590)
!608 = !DILocation(line: 560, column: 13, scope: !590)
!609 = !DILocation(line: 561, column: 14, scope: !590)
!610 = !DILocation(line: 561, column: 9, scope: !590)
!611 = !DILocation(line: 561, column: 2, scope: !590)
!612 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !76, file: !76, line: 580, type: !613, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!613 = !DISubroutineType(types: !614)
!614 = !{!25, !25, !34, !34}
!615 = !DILocalVariable(name: "value", arg: 1, scope: !612, file: !76, line: 580, type: !25)
!616 = !DILocation(line: 580, column: 43, scope: !612)
!617 = !DILocalVariable(name: "factor", arg: 2, scope: !612, file: !76, line: 580, type: !34)
!618 = !DILocation(line: 580, column: 53, scope: !612)
!619 = !DILocalVariable(name: "count", arg: 3, scope: !612, file: !76, line: 580, type: !34)
!620 = !DILocation(line: 580, column: 64, scope: !612)
!621 = !DILocalVariable(name: "s32MulTemp", scope: !612, file: !76, line: 582, type: !84)
!622 = !DILocation(line: 582, column: 6, scope: !612)
!623 = !DILocation(line: 583, column: 15, scope: !612)
!624 = !DILocation(line: 583, column: 23, scope: !612)
!625 = !DILocation(line: 583, column: 21, scope: !612)
!626 = !DILocation(line: 583, column: 13, scope: !612)
!627 = !DILocation(line: 584, column: 15, scope: !612)
!628 = !DILocation(line: 584, column: 26, scope: !612)
!629 = !DILocation(line: 584, column: 25, scope: !612)
!630 = !DILocation(line: 584, column: 13, scope: !612)
!631 = !DILocation(line: 585, column: 5, scope: !632)
!632 = distinct !DILexicalBlock(scope: !612, file: !76, line: 585, column: 5)
!633 = !DILocation(line: 585, column: 16, scope: !632)
!634 = !DILocation(line: 585, column: 5, scope: !612)
!635 = !DILocation(line: 587, column: 6, scope: !636)
!636 = distinct !DILexicalBlock(scope: !637, file: !76, line: 587, column: 6)
!637 = distinct !DILexicalBlock(scope: !632, file: !76, line: 586, column: 2)
!638 = !DILocation(line: 587, column: 17, scope: !636)
!639 = !DILocation(line: 587, column: 6, scope: !637)
!640 = !DILocation(line: 589, column: 16, scope: !641)
!641 = distinct !DILexicalBlock(scope: !636, file: !76, line: 588, column: 3)
!642 = !DILocation(line: 589, column: 11, scope: !641)
!643 = !DILocation(line: 589, column: 4, scope: !641)
!644 = !DILocation(line: 593, column: 4, scope: !645)
!645 = distinct !DILexicalBlock(scope: !636, file: !76, line: 592, column: 3)
!646 = !DILocation(line: 598, column: 3, scope: !647)
!647 = distinct !DILexicalBlock(scope: !632, file: !76, line: 597, column: 2)
!648 = !DILocation(line: 600, column: 1, scope: !612)
!649 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !76, file: !76, line: 617, type: !394, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!650 = !DILocalVariable(name: "value", arg: 1, scope: !649, file: !76, line: 617, type: !25)
!651 = !DILocation(line: 617, column: 31, scope: !649)
!652 = !DILocalVariable(name: "factor", arg: 2, scope: !649, file: !76, line: 617, type: !34)
!653 = !DILocation(line: 617, column: 42, scope: !649)
!654 = !DILocalVariable(name: "s32MulTemp1", scope: !649, file: !76, line: 619, type: !84)
!655 = !DILocation(line: 619, column: 6, scope: !649)
!656 = !DILocalVariable(name: "s32MulTemp2", scope: !649, file: !76, line: 619, type: !84)
!657 = !DILocation(line: 619, column: 24, scope: !649)
!658 = !DILocation(line: 620, column: 16, scope: !649)
!659 = !DILocation(line: 620, column: 24, scope: !649)
!660 = !DILocation(line: 620, column: 22, scope: !649)
!661 = !DILocation(line: 620, column: 14, scope: !649)
!662 = !DILocation(line: 621, column: 16, scope: !649)
!663 = !DILocation(line: 621, column: 28, scope: !649)
!664 = !DILocation(line: 621, column: 14, scope: !649)
!665 = !DILocation(line: 622, column: 6, scope: !666)
!666 = distinct !DILexicalBlock(scope: !649, file: !76, line: 622, column: 5)
!667 = !DILocation(line: 622, column: 17, scope: !666)
!668 = !DILocation(line: 622, column: 21, scope: !666)
!669 = !DILocation(line: 622, column: 25, scope: !666)
!670 = !DILocation(line: 622, column: 37, scope: !666)
!671 = !DILocation(line: 622, column: 46, scope: !666)
!672 = !DILocation(line: 622, column: 5, scope: !649)
!673 = !DILocation(line: 629, column: 17, scope: !674)
!674 = distinct !DILexicalBlock(scope: !666, file: !76, line: 628, column: 2)
!675 = !DILocation(line: 629, column: 29, scope: !674)
!676 = !DILocation(line: 629, column: 15, scope: !674)
!677 = !DILocation(line: 630, column: 15, scope: !674)
!678 = !DILocation(line: 630, column: 10, scope: !674)
!679 = !DILocation(line: 630, column: 3, scope: !674)
!680 = !DILocation(line: 634, column: 15, scope: !681)
!681 = distinct !DILexicalBlock(scope: !666, file: !76, line: 633, column: 2)
!682 = !DILocation(line: 634, column: 10, scope: !681)
!683 = !DILocation(line: 634, column: 3, scope: !681)
!684 = !DILocation(line: 636, column: 1, scope: !649)
!685 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !76, file: !76, line: 654, type: !394, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!686 = !DILocalVariable(name: "value", arg: 1, scope: !685, file: !76, line: 654, type: !25)
!687 = !DILocation(line: 654, column: 31, scope: !685)
!688 = !DILocalVariable(name: "factor", arg: 2, scope: !685, file: !76, line: 654, type: !34)
!689 = !DILocation(line: 654, column: 42, scope: !685)
!690 = !DILocalVariable(name: "s32MulTemp1", scope: !685, file: !76, line: 656, type: !84)
!691 = !DILocation(line: 656, column: 6, scope: !685)
!692 = !DILocalVariable(name: "s32MulTemp2", scope: !685, file: !76, line: 656, type: !84)
!693 = !DILocation(line: 656, column: 24, scope: !685)
!694 = !DILocation(line: 657, column: 16, scope: !685)
!695 = !DILocation(line: 657, column: 24, scope: !685)
!696 = !DILocation(line: 657, column: 22, scope: !685)
!697 = !DILocation(line: 657, column: 14, scope: !685)
!698 = !DILocation(line: 658, column: 16, scope: !685)
!699 = !DILocation(line: 658, column: 28, scope: !685)
!700 = !DILocation(line: 658, column: 14, scope: !685)
!701 = !DILocation(line: 659, column: 6, scope: !702)
!702 = distinct !DILexicalBlock(scope: !685, file: !76, line: 659, column: 5)
!703 = !DILocation(line: 659, column: 17, scope: !702)
!704 = !DILocation(line: 659, column: 21, scope: !702)
!705 = !DILocation(line: 659, column: 25, scope: !702)
!706 = !DILocation(line: 659, column: 37, scope: !702)
!707 = !DILocation(line: 659, column: 46, scope: !702)
!708 = !DILocation(line: 659, column: 5, scope: !685)
!709 = !DILocation(line: 665, column: 17, scope: !710)
!710 = distinct !DILexicalBlock(scope: !702, file: !76, line: 664, column: 2)
!711 = !DILocation(line: 665, column: 29, scope: !710)
!712 = !DILocation(line: 665, column: 15, scope: !710)
!713 = !DILocation(line: 666, column: 2, scope: !710)
!714 = !DILocation(line: 672, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !685, file: !76, line: 672, column: 6)
!716 = !DILocation(line: 672, column: 18, scope: !715)
!717 = !DILocation(line: 672, column: 6, scope: !685)
!718 = !DILocation(line: 674, column: 6, scope: !719)
!719 = distinct !DILexicalBlock(scope: !720, file: !76, line: 674, column: 6)
!720 = distinct !DILexicalBlock(scope: !715, file: !76, line: 673, column: 2)
!721 = !DILocation(line: 674, column: 18, scope: !719)
!722 = !DILocation(line: 674, column: 6, scope: !720)
!723 = !DILocation(line: 676, column: 16, scope: !724)
!724 = distinct !DILexicalBlock(scope: !719, file: !76, line: 675, column: 3)
!725 = !DILocation(line: 676, column: 11, scope: !724)
!726 = !DILocation(line: 676, column: 4, scope: !724)
!727 = !DILocation(line: 680, column: 4, scope: !728)
!728 = distinct !DILexicalBlock(scope: !719, file: !76, line: 679, column: 3)
!729 = !DILocation(line: 685, column: 3, scope: !730)
!730 = distinct !DILexicalBlock(scope: !715, file: !76, line: 684, column: 2)
!731 = !DILocation(line: 687, column: 1, scope: !685)
!732 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !76, file: !76, line: 704, type: !733, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!733 = !DISubroutineType(types: !734)
!734 = !{!25, !34, !34}
!735 = !DILocalVariable(name: "value", arg: 1, scope: !732, file: !76, line: 704, type: !34)
!736 = !DILocation(line: 704, column: 33, scope: !732)
!737 = !DILocalVariable(name: "factor", arg: 2, scope: !732, file: !76, line: 704, type: !34)
!738 = !DILocation(line: 704, column: 44, scope: !732)
!739 = !DILocalVariable(name: "u32MulTemp", scope: !732, file: !76, line: 706, type: !740)
!740 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !21, line: 10, baseType: !741)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !31, line: 26, baseType: !742)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 42, baseType: !743)
!743 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!744 = !DILocation(line: 706, column: 6, scope: !732)
!745 = !DILocation(line: 707, column: 15, scope: !732)
!746 = !DILocation(line: 707, column: 23, scope: !732)
!747 = !DILocation(line: 707, column: 21, scope: !732)
!748 = !DILocation(line: 707, column: 13, scope: !732)
!749 = !DILocation(line: 708, column: 15, scope: !732)
!750 = !DILocation(line: 708, column: 26, scope: !732)
!751 = !DILocation(line: 708, column: 13, scope: !732)
!752 = !DILocation(line: 709, column: 5, scope: !753)
!753 = distinct !DILexicalBlock(scope: !732, file: !76, line: 709, column: 5)
!754 = !DILocation(line: 709, column: 16, scope: !753)
!755 = !DILocation(line: 709, column: 5, scope: !732)
!756 = !DILocation(line: 711, column: 15, scope: !757)
!757 = distinct !DILexicalBlock(scope: !753, file: !76, line: 710, column: 2)
!758 = !DILocation(line: 711, column: 10, scope: !757)
!759 = !DILocation(line: 711, column: 3, scope: !757)
!760 = !DILocation(line: 715, column: 3, scope: !761)
!761 = distinct !DILexicalBlock(scope: !753, file: !76, line: 714, column: 2)
!762 = !DILocation(line: 717, column: 1, scope: !732)
!763 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !76, file: !76, line: 732, type: !764, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!764 = !DISubroutineType(types: !765)
!765 = !{!84, !25, !34}
!766 = !DILocalVariable(name: "value", arg: 1, scope: !763, file: !76, line: 732, type: !25)
!767 = !DILocation(line: 732, column: 25, scope: !763)
!768 = !DILocalVariable(name: "factor", arg: 2, scope: !763, file: !76, line: 732, type: !34)
!769 = !DILocation(line: 732, column: 36, scope: !763)
!770 = !DILocalVariable(name: "s32MulTemp", scope: !763, file: !76, line: 734, type: !84)
!771 = !DILocation(line: 734, column: 6, scope: !763)
!772 = !DILocation(line: 735, column: 15, scope: !763)
!773 = !DILocation(line: 735, column: 23, scope: !763)
!774 = !DILocation(line: 735, column: 21, scope: !763)
!775 = !DILocation(line: 735, column: 13, scope: !763)
!776 = !DILocation(line: 736, column: 9, scope: !763)
!777 = !DILocation(line: 736, column: 2, scope: !763)
!778 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !76, file: !76, line: 752, type: !779, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!779 = !DISubroutineType(types: !780)
!780 = !{!84, !84, !34}
!781 = !DILocalVariable(name: "value", arg: 1, scope: !778, file: !76, line: 752, type: !84)
!782 = !DILocation(line: 752, column: 25, scope: !778)
!783 = !DILocalVariable(name: "factor", arg: 2, scope: !778, file: !76, line: 752, type: !34)
!784 = !DILocation(line: 752, column: 36, scope: !778)
!785 = !DILocalVariable(name: "s32Temp1", scope: !778, file: !76, line: 754, type: !84)
!786 = !DILocation(line: 754, column: 6, scope: !778)
!787 = !DILocalVariable(name: "s32Temp2", scope: !778, file: !76, line: 754, type: !84)
!788 = !DILocation(line: 754, column: 20, scope: !778)
!789 = !DILocalVariable(name: "s32Factor", scope: !778, file: !76, line: 754, type: !84)
!790 = !DILocation(line: 754, column: 44, scope: !778)
!791 = !DILocation(line: 755, column: 14, scope: !778)
!792 = !DILocation(line: 755, column: 12, scope: !778)
!793 = !DILocation(line: 756, column: 5, scope: !794)
!794 = distinct !DILexicalBlock(scope: !778, file: !76, line: 756, column: 5)
!795 = !DILocation(line: 756, column: 12, scope: !794)
!796 = !DILocation(line: 756, column: 5, scope: !778)
!797 = !DILocation(line: 758, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !799, file: !76, line: 758, column: 6)
!799 = distinct !DILexicalBlock(scope: !794, file: !76, line: 757, column: 2)
!800 = !DILocation(line: 758, column: 12, scope: !798)
!801 = !DILocation(line: 758, column: 6, scope: !799)
!802 = !DILocation(line: 760, column: 15, scope: !803)
!803 = distinct !DILexicalBlock(scope: !798, file: !76, line: 759, column: 3)
!804 = !DILocation(line: 760, column: 26, scope: !803)
!805 = !DILocation(line: 760, column: 24, scope: !803)
!806 = !DILocation(line: 760, column: 13, scope: !803)
!807 = !DILocation(line: 761, column: 7, scope: !808)
!808 = distinct !DILexicalBlock(scope: !803, file: !76, line: 761, column: 7)
!809 = !DILocation(line: 761, column: 19, scope: !808)
!810 = !DILocation(line: 761, column: 16, scope: !808)
!811 = !DILocation(line: 761, column: 7, scope: !803)
!812 = !DILocation(line: 763, column: 5, scope: !813)
!813 = distinct !DILexicalBlock(scope: !808, file: !76, line: 762, column: 4)
!814 = !DILocation(line: 767, column: 13, scope: !815)
!815 = distinct !DILexicalBlock(scope: !808, file: !76, line: 766, column: 4)
!816 = !DILocation(line: 767, column: 19, scope: !815)
!817 = !DILocation(line: 767, column: 18, scope: !815)
!818 = !DILocation(line: 767, column: 5, scope: !815)
!819 = !DILocation(line: 772, column: 20, scope: !820)
!820 = distinct !DILexicalBlock(scope: !821, file: !76, line: 772, column: 7)
!821 = distinct !DILexicalBlock(scope: !798, file: !76, line: 771, column: 3)
!822 = !DILocation(line: 772, column: 19, scope: !820)
!823 = !DILocation(line: 772, column: 31, scope: !820)
!824 = !DILocation(line: 772, column: 28, scope: !820)
!825 = !DILocation(line: 772, column: 7, scope: !821)
!826 = !DILocation(line: 774, column: 5, scope: !827)
!827 = distinct !DILexicalBlock(scope: !820, file: !76, line: 773, column: 4)
!828 = !DILocation(line: 778, column: 13, scope: !829)
!829 = distinct !DILexicalBlock(scope: !820, file: !76, line: 777, column: 4)
!830 = !DILocation(line: 778, column: 19, scope: !829)
!831 = !DILocation(line: 778, column: 18, scope: !829)
!832 = !DILocation(line: 778, column: 5, scope: !829)
!833 = !DILocation(line: 784, column: 3, scope: !834)
!834 = distinct !DILexicalBlock(scope: !794, file: !76, line: 783, column: 2)
!835 = !DILocation(line: 786, column: 1, scope: !778)
!836 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !76, file: !76, line: 802, type: !837, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!837 = !DISubroutineType(types: !838)
!838 = !{!29, !29, !29, !34}
!839 = !DILocalVariable(name: "value", arg: 1, scope: !836, file: !76, line: 802, type: !29)
!840 = !DILocation(line: 802, column: 35, scope: !836)
!841 = !DILocalVariable(name: "factor", arg: 2, scope: !836, file: !76, line: 802, type: !29)
!842 = !DILocation(line: 802, column: 44, scope: !836)
!843 = !DILocalVariable(name: "count", arg: 3, scope: !836, file: !76, line: 802, type: !34)
!844 = !DILocation(line: 802, column: 55, scope: !836)
!845 = !DILocalVariable(name: "u16MulTemp", scope: !836, file: !76, line: 804, type: !34)
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
!858 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !76, file: !76, line: 824, type: !859, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!859 = !DISubroutineType(types: !860)
!860 = !{!29, !29, !29, !29}
!861 = !DILocalVariable(name: "value", arg: 1, scope: !858, file: !76, line: 824, type: !29)
!862 = !DILocation(line: 824, column: 38, scope: !858)
!863 = !DILocalVariable(name: "factor", arg: 2, scope: !858, file: !76, line: 824, type: !29)
!864 = !DILocation(line: 824, column: 47, scope: !858)
!865 = !DILocalVariable(name: "count", arg: 3, scope: !858, file: !76, line: 824, type: !29)
!866 = !DILocation(line: 824, column: 57, scope: !858)
!867 = !DILocalVariable(name: "u16MulTemp", scope: !858, file: !76, line: 826, type: !34)
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
!878 = distinct !DILexicalBlock(scope: !858, file: !76, line: 829, column: 5)
!879 = !DILocation(line: 829, column: 16, scope: !878)
!880 = !DILocation(line: 829, column: 5, scope: !858)
!881 = !DILocation(line: 831, column: 10, scope: !882)
!882 = distinct !DILexicalBlock(scope: !878, file: !76, line: 830, column: 2)
!883 = !DILocation(line: 831, column: 21, scope: !882)
!884 = !DILocation(line: 831, column: 3, scope: !882)
!885 = !DILocation(line: 835, column: 3, scope: !886)
!886 = distinct !DILexicalBlock(scope: !878, file: !76, line: 834, column: 2)
!887 = !DILocation(line: 837, column: 1, scope: !858)
!888 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !76, file: !76, line: 854, type: !889, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!29, !29, !29}
!891 = !DILocalVariable(name: "x_value", arg: 1, scope: !888, file: !76, line: 854, type: !29)
!892 = !DILocation(line: 854, column: 25, scope: !888)
!893 = !DILocalVariable(name: "y_value", arg: 2, scope: !888, file: !76, line: 854, type: !29)
!894 = !DILocation(line: 854, column: 36, scope: !888)
!895 = !DILocalVariable(name: "u16MulTemp", scope: !888, file: !76, line: 856, type: !34)
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
!907 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !76, file: !76, line: 878, type: !889, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!908 = !DILocalVariable(name: "value", arg: 1, scope: !907, file: !76, line: 878, type: !29)
!909 = !DILocation(line: 878, column: 26, scope: !907)
!910 = !DILocalVariable(name: "factor", arg: 2, scope: !907, file: !76, line: 878, type: !29)
!911 = !DILocation(line: 878, column: 36, scope: !907)
!912 = !DILocalVariable(name: "u16MulTemp", scope: !907, file: !76, line: 880, type: !34)
!913 = !DILocation(line: 880, column: 6, scope: !907)
!914 = !DILocation(line: 881, column: 15, scope: !907)
!915 = !DILocation(line: 881, column: 23, scope: !907)
!916 = !DILocation(line: 881, column: 21, scope: !907)
!917 = !DILocation(line: 881, column: 13, scope: !907)
!918 = !DILocation(line: 882, column: 15, scope: !907)
!919 = !DILocation(line: 882, column: 26, scope: !907)
!920 = !DILocation(line: 882, column: 13, scope: !907)
!921 = !DILocation(line: 883, column: 5, scope: !922)
!922 = distinct !DILexicalBlock(scope: !907, file: !76, line: 883, column: 5)
!923 = !DILocation(line: 883, column: 16, scope: !922)
!924 = !DILocation(line: 883, column: 5, scope: !907)
!925 = !DILocation(line: 885, column: 14, scope: !926)
!926 = distinct !DILexicalBlock(scope: !922, file: !76, line: 884, column: 2)
!927 = !DILocation(line: 885, column: 10, scope: !926)
!928 = !DILocation(line: 885, column: 3, scope: !926)
!929 = !DILocation(line: 889, column: 3, scope: !930)
!930 = distinct !DILexicalBlock(scope: !922, file: !76, line: 888, column: 2)
!931 = !DILocation(line: 891, column: 1, scope: !907)
!932 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !76, file: !76, line: 907, type: !933, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!933 = !DISubroutineType(types: !934)
!934 = !{!34, !34, !34}
!935 = !DILocalVariable(name: "value", arg: 1, scope: !932, file: !76, line: 907, type: !34)
!936 = !DILocation(line: 907, column: 39, scope: !932)
!937 = !DILocalVariable(name: "factor", arg: 2, scope: !932, file: !76, line: 907, type: !34)
!938 = !DILocation(line: 907, column: 49, scope: !932)
!939 = !DILocalVariable(name: "u32MulTemp", scope: !932, file: !76, line: 909, type: !740)
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
!951 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !76, file: !76, line: 931, type: !933, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!952 = !DILocalVariable(name: "value", arg: 1, scope: !951, file: !76, line: 931, type: !34)
!953 = !DILocation(line: 931, column: 43, scope: !951)
!954 = !DILocalVariable(name: "factor", arg: 2, scope: !951, file: !76, line: 931, type: !34)
!955 = !DILocation(line: 931, column: 53, scope: !951)
!956 = !DILocalVariable(name: "u32MulTemp", scope: !951, file: !76, line: 933, type: !740)
!957 = !DILocation(line: 933, column: 6, scope: !951)
!958 = !DILocation(line: 934, column: 15, scope: !951)
!959 = !DILocation(line: 934, column: 23, scope: !951)
!960 = !DILocation(line: 934, column: 21, scope: !951)
!961 = !DILocation(line: 934, column: 13, scope: !951)
!962 = !DILocation(line: 935, column: 15, scope: !951)
!963 = !DILocation(line: 935, column: 26, scope: !951)
!964 = !DILocation(line: 935, column: 13, scope: !951)
!965 = !DILocation(line: 936, column: 5, scope: !966)
!966 = distinct !DILexicalBlock(scope: !951, file: !76, line: 936, column: 5)
!967 = !DILocation(line: 936, column: 16, scope: !966)
!968 = !DILocation(line: 936, column: 5, scope: !951)
!969 = !DILocation(line: 938, column: 11, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !76, line: 937, column: 2)
!971 = !DILocation(line: 938, column: 22, scope: !970)
!972 = !DILocation(line: 938, column: 10, scope: !970)
!973 = !DILocation(line: 938, column: 3, scope: !970)
!974 = !DILocation(line: 942, column: 3, scope: !975)
!975 = distinct !DILexicalBlock(scope: !966, file: !76, line: 941, column: 2)
!976 = !DILocation(line: 944, column: 1, scope: !951)
!977 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !76, file: !76, line: 962, type: !978, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!978 = !DISubroutineType(types: !979)
!979 = !{!34, !34, !29}
!980 = !DILocalVariable(name: "x_value", arg: 1, scope: !977, file: !76, line: 962, type: !34)
!981 = !DILocation(line: 962, column: 29, scope: !977)
!982 = !DILocalVariable(name: "y_value", arg: 2, scope: !977, file: !76, line: 962, type: !29)
!983 = !DILocation(line: 962, column: 41, scope: !977)
!984 = !DILocalVariable(name: "u32MulTemp", scope: !977, file: !76, line: 964, type: !740)
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
!996 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !76, file: !76, line: 986, type: !978, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!997 = !DILocalVariable(name: "x_value", arg: 1, scope: !996, file: !76, line: 986, type: !34)
!998 = !DILocation(line: 986, column: 29, scope: !996)
!999 = !DILocalVariable(name: "y_value", arg: 2, scope: !996, file: !76, line: 986, type: !29)
!1000 = !DILocation(line: 986, column: 41, scope: !996)
!1001 = !DILocalVariable(name: "u32MulTemp", scope: !996, file: !76, line: 988, type: !740)
!1002 = !DILocation(line: 988, column: 6, scope: !996)
!1003 = !DILocation(line: 989, column: 15, scope: !996)
!1004 = !DILocation(line: 989, column: 25, scope: !996)
!1005 = !DILocation(line: 989, column: 23, scope: !996)
!1006 = !DILocation(line: 989, column: 13, scope: !996)
!1007 = !DILocation(line: 990, column: 15, scope: !996)
!1008 = !DILocation(line: 990, column: 26, scope: !996)
!1009 = !DILocation(line: 990, column: 13, scope: !996)
!1010 = !DILocation(line: 991, column: 5, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !996, file: !76, line: 991, column: 5)
!1012 = !DILocation(line: 991, column: 16, scope: !1011)
!1013 = !DILocation(line: 991, column: 5, scope: !996)
!1014 = !DILocation(line: 993, column: 11, scope: !1015)
!1015 = distinct !DILexicalBlock(scope: !1011, file: !76, line: 992, column: 2)
!1016 = !DILocation(line: 993, column: 22, scope: !1015)
!1017 = !DILocation(line: 993, column: 10, scope: !1015)
!1018 = !DILocation(line: 993, column: 3, scope: !1015)
!1019 = !DILocation(line: 997, column: 3, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1011, file: !76, line: 996, column: 2)
!1021 = !DILocation(line: 999, column: 1, scope: !996)
!1022 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !76, file: !76, line: 1015, type: !1023, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!34, !34, !34, !740}
!1025 = !DILocalVariable(name: "value", arg: 1, scope: !1022, file: !76, line: 1015, type: !34)
!1026 = !DILocation(line: 1015, column: 40, scope: !1022)
!1027 = !DILocalVariable(name: "factor", arg: 2, scope: !1022, file: !76, line: 1015, type: !34)
!1028 = !DILocation(line: 1015, column: 50, scope: !1022)
!1029 = !DILocalVariable(name: "count", arg: 3, scope: !1022, file: !76, line: 1015, type: !740)
!1030 = !DILocation(line: 1015, column: 61, scope: !1022)
!1031 = !DILocalVariable(name: "u32MulTemp", scope: !1022, file: !76, line: 1017, type: !740)
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
!1045 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !76, file: !76, line: 1038, type: !1046, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!34, !34, !34, !34}
!1048 = !DILocalVariable(name: "value", arg: 1, scope: !1045, file: !76, line: 1038, type: !34)
!1049 = !DILocation(line: 1038, column: 43, scope: !1045)
!1050 = !DILocalVariable(name: "factor", arg: 2, scope: !1045, file: !76, line: 1038, type: !34)
!1051 = !DILocation(line: 1038, column: 53, scope: !1045)
!1052 = !DILocalVariable(name: "count", arg: 3, scope: !1045, file: !76, line: 1038, type: !34)
!1053 = !DILocation(line: 1038, column: 64, scope: !1045)
!1054 = !DILocalVariable(name: "u32MulTemp", scope: !1045, file: !76, line: 1040, type: !740)
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
!1065 = distinct !DILexicalBlock(scope: !1045, file: !76, line: 1043, column: 5)
!1066 = !DILocation(line: 1043, column: 16, scope: !1065)
!1067 = !DILocation(line: 1043, column: 5, scope: !1045)
!1068 = !DILocation(line: 1045, column: 11, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !76, line: 1044, column: 2)
!1070 = !DILocation(line: 1045, column: 22, scope: !1069)
!1071 = !DILocation(line: 1045, column: 10, scope: !1069)
!1072 = !DILocation(line: 1045, column: 3, scope: !1069)
!1073 = !DILocation(line: 1049, column: 3, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1065, file: !76, line: 1048, column: 2)
!1075 = !DILocation(line: 1051, column: 1, scope: !1045)
!1076 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !76, file: !76, line: 1067, type: !933, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1077 = !DILocalVariable(name: "x_value", arg: 1, scope: !1076, file: !76, line: 1067, type: !34)
!1078 = !DILocation(line: 1067, column: 30, scope: !1076)
!1079 = !DILocalVariable(name: "y_value", arg: 2, scope: !1076, file: !76, line: 1067, type: !34)
!1080 = !DILocation(line: 1067, column: 42, scope: !1076)
!1081 = !DILocalVariable(name: "u32MulTemp", scope: !1076, file: !76, line: 1069, type: !740)
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
!1094 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !76, file: !76, line: 1091, type: !933, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1095 = !DILocalVariable(name: "x_value", arg: 1, scope: !1094, file: !76, line: 1091, type: !34)
!1096 = !DILocation(line: 1091, column: 30, scope: !1094)
!1097 = !DILocalVariable(name: "y_value", arg: 2, scope: !1094, file: !76, line: 1091, type: !34)
!1098 = !DILocation(line: 1091, column: 42, scope: !1094)
!1099 = !DILocalVariable(name: "u32MulTemp", scope: !1094, file: !76, line: 1093, type: !740)
!1100 = !DILocation(line: 1093, column: 6, scope: !1094)
!1101 = !DILocation(line: 1094, column: 15, scope: !1094)
!1102 = !DILocation(line: 1094, column: 25, scope: !1094)
!1103 = !DILocation(line: 1094, column: 23, scope: !1094)
!1104 = !DILocation(line: 1094, column: 13, scope: !1094)
!1105 = !DILocation(line: 1095, column: 15, scope: !1094)
!1106 = !DILocation(line: 1095, column: 26, scope: !1094)
!1107 = !DILocation(line: 1095, column: 13, scope: !1094)
!1108 = !DILocation(line: 1096, column: 5, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1094, file: !76, line: 1096, column: 5)
!1110 = !DILocation(line: 1096, column: 16, scope: !1109)
!1111 = !DILocation(line: 1096, column: 5, scope: !1094)
!1112 = !DILocation(line: 1098, column: 11, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1109, file: !76, line: 1097, column: 2)
!1114 = !DILocation(line: 1098, column: 22, scope: !1113)
!1115 = !DILocation(line: 1098, column: 10, scope: !1113)
!1116 = !DILocation(line: 1098, column: 3, scope: !1113)
!1117 = !DILocation(line: 1102, column: 3, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1109, file: !76, line: 1101, column: 2)
!1119 = !DILocation(line: 1104, column: 1, scope: !1094)
!1120 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !76, file: !76, line: 1119, type: !1121, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!740, !740, !34}
!1123 = !DILocalVariable(name: "x_value", arg: 1, scope: !1120, file: !76, line: 1119, type: !740)
!1124 = !DILocation(line: 1119, column: 26, scope: !1120)
!1125 = !DILocalVariable(name: "y_value", arg: 2, scope: !1120, file: !76, line: 1119, type: !34)
!1126 = !DILocation(line: 1119, column: 39, scope: !1120)
!1127 = !DILocalVariable(name: "u32Temp1", scope: !1120, file: !76, line: 1122, type: !740)
!1128 = !DILocation(line: 1122, column: 6, scope: !1120)
!1129 = !DILocation(line: 1123, column: 5, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1120, file: !76, line: 1123, column: 5)
!1131 = !DILocation(line: 1123, column: 13, scope: !1130)
!1132 = !DILocation(line: 1123, column: 5, scope: !1120)
!1133 = !DILocation(line: 1125, column: 26, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1130, file: !76, line: 1124, column: 2)
!1135 = !DILocation(line: 1125, column: 25, scope: !1134)
!1136 = !DILocation(line: 1125, column: 12, scope: !1134)
!1137 = !DILocation(line: 1126, column: 6, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1134, file: !76, line: 1126, column: 6)
!1139 = !DILocation(line: 1126, column: 17, scope: !1138)
!1140 = !DILocation(line: 1126, column: 15, scope: !1138)
!1141 = !DILocation(line: 1126, column: 6, scope: !1134)
!1142 = !DILocation(line: 1128, column: 4, scope: !1143)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !76, line: 1127, column: 3)
!1144 = !DILocation(line: 1132, column: 12, scope: !1145)
!1145 = distinct !DILexicalBlock(scope: !1138, file: !76, line: 1131, column: 3)
!1146 = !DILocation(line: 1132, column: 22, scope: !1145)
!1147 = !DILocation(line: 1132, column: 20, scope: !1145)
!1148 = !DILocation(line: 1132, column: 4, scope: !1145)
!1149 = !DILocation(line: 1137, column: 3, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1130, file: !76, line: 1136, column: 2)
!1151 = !DILocation(line: 1140, column: 2, scope: !1120)
!1152 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !76, file: !76, line: 1157, type: !1153, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!740, !740, !34, !740}
!1155 = !DILocalVariable(name: "value", arg: 1, scope: !1152, file: !76, line: 1157, type: !740)
!1156 = !DILocation(line: 1157, column: 40, scope: !1152)
!1157 = !DILocalVariable(name: "factor", arg: 2, scope: !1152, file: !76, line: 1157, type: !34)
!1158 = !DILocation(line: 1157, column: 50, scope: !1152)
!1159 = !DILocalVariable(name: "count", arg: 3, scope: !1152, file: !76, line: 1157, type: !740)
!1160 = !DILocation(line: 1157, column: 62, scope: !1152)
!1161 = !DILocalVariable(name: "u32Temp1", scope: !1152, file: !76, line: 1159, type: !740)
!1162 = !DILocation(line: 1159, column: 6, scope: !1152)
!1163 = !DILocalVariable(name: "u32Temp2", scope: !1152, file: !76, line: 1159, type: !740)
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
!1183 = distinct !DILexicalBlock(scope: !1152, file: !76, line: 1164, column: 5)
!1184 = !DILocation(line: 1164, column: 16, scope: !1183)
!1185 = !DILocation(line: 1164, column: 14, scope: !1183)
!1186 = !DILocation(line: 1164, column: 23, scope: !1183)
!1187 = !DILocation(line: 1164, column: 5, scope: !1152)
!1188 = !DILocation(line: 1166, column: 10, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1183, file: !76, line: 1165, column: 2)
!1190 = !DILocation(line: 1166, column: 3, scope: !1189)
!1191 = !DILocation(line: 1170, column: 3, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1183, file: !76, line: 1169, column: 2)
!1193 = !DILocation(line: 1172, column: 1, scope: !1152)
!1194 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !76, file: !76, line: 1188, type: !1195, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!29, !29, !29, !20}
!1197 = !DILocalVariable(name: "val1", arg: 1, scope: !1194, file: !76, line: 1188, type: !29)
!1198 = !DILocation(line: 1188, column: 25, scope: !1194)
!1199 = !DILocalVariable(name: "val2", arg: 2, scope: !1194, file: !76, line: 1188, type: !29)
!1200 = !DILocation(line: 1188, column: 34, scope: !1194)
!1201 = !DILocalVariable(name: "factor", arg: 3, scope: !1194, file: !76, line: 1188, type: !20)
!1202 = !DILocation(line: 1188, column: 43, scope: !1194)
!1203 = !DILocalVariable(name: "s16Temp1", scope: !1194, file: !76, line: 1190, type: !25)
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
!1216 = distinct !DILexicalBlock(scope: !1194, file: !76, line: 1192, column: 5)
!1217 = !DILocation(line: 1192, column: 14, scope: !1216)
!1218 = !DILocation(line: 1192, column: 5, scope: !1194)
!1219 = !DILocation(line: 1194, column: 6, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !76, line: 1194, column: 6)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !76, line: 1193, column: 2)
!1222 = !DILocation(line: 1194, column: 15, scope: !1220)
!1223 = !DILocation(line: 1194, column: 6, scope: !1221)
!1224 = !DILocation(line: 1196, column: 15, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1220, file: !76, line: 1195, column: 3)
!1226 = !DILocation(line: 1196, column: 11, scope: !1225)
!1227 = !DILocation(line: 1196, column: 4, scope: !1225)
!1228 = !DILocation(line: 1200, column: 4, scope: !1229)
!1229 = distinct !DILexicalBlock(scope: !1220, file: !76, line: 1199, column: 3)
!1230 = !DILocation(line: 1205, column: 3, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1216, file: !76, line: 1204, column: 2)
!1232 = !DILocation(line: 1208, column: 1, scope: !1194)
!1233 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !76, file: !76, line: 1224, type: !1234, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!34, !34, !34, !20}
!1236 = !DILocalVariable(name: "val1", arg: 1, scope: !1233, file: !76, line: 1224, type: !34)
!1237 = !DILocation(line: 1224, column: 30, scope: !1233)
!1238 = !DILocalVariable(name: "val2", arg: 2, scope: !1233, file: !76, line: 1224, type: !34)
!1239 = !DILocation(line: 1224, column: 40, scope: !1233)
!1240 = !DILocalVariable(name: "factor", arg: 3, scope: !1233, file: !76, line: 1224, type: !20)
!1241 = !DILocation(line: 1224, column: 49, scope: !1233)
!1242 = !DILocalVariable(name: "s32Temp1", scope: !1233, file: !76, line: 1226, type: !84)
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
!1254 = distinct !DILexicalBlock(scope: !1233, file: !76, line: 1228, column: 5)
!1255 = !DILocation(line: 1228, column: 14, scope: !1254)
!1256 = !DILocation(line: 1228, column: 5, scope: !1233)
!1257 = !DILocation(line: 1230, column: 6, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1259, file: !76, line: 1230, column: 6)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !76, line: 1229, column: 2)
!1260 = !DILocation(line: 1230, column: 15, scope: !1258)
!1261 = !DILocation(line: 1230, column: 6, scope: !1259)
!1262 = !DILocation(line: 1232, column: 16, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !76, line: 1231, column: 3)
!1264 = !DILocation(line: 1232, column: 11, scope: !1263)
!1265 = !DILocation(line: 1232, column: 4, scope: !1263)
!1266 = !DILocation(line: 1236, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1258, file: !76, line: 1235, column: 3)
!1268 = !DILocation(line: 1242, column: 3, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1254, file: !76, line: 1241, column: 2)
!1270 = !DILocation(line: 1244, column: 1, scope: !1233)
!1271 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !76, file: !76, line: 1259, type: !933, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1272 = !DILocalVariable(name: "val1", arg: 1, scope: !1271, file: !76, line: 1259, type: !34)
!1273 = !DILocation(line: 1259, column: 26, scope: !1271)
!1274 = !DILocalVariable(name: "val2", arg: 2, scope: !1271, file: !76, line: 1259, type: !34)
!1275 = !DILocation(line: 1259, column: 36, scope: !1271)
!1276 = !DILocalVariable(name: "u32Temp1", scope: !1271, file: !76, line: 1261, type: !740)
!1277 = !DILocation(line: 1261, column: 6, scope: !1271)
!1278 = !DILocation(line: 1262, column: 13, scope: !1271)
!1279 = !DILocation(line: 1262, column: 20, scope: !1271)
!1280 = !DILocation(line: 1262, column: 18, scope: !1271)
!1281 = !DILocation(line: 1262, column: 11, scope: !1271)
!1282 = !DILocation(line: 1263, column: 5, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1271, file: !76, line: 1263, column: 5)
!1284 = !DILocation(line: 1263, column: 14, scope: !1283)
!1285 = !DILocation(line: 1263, column: 5, scope: !1271)
!1286 = !DILocation(line: 1265, column: 11, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1283, file: !76, line: 1264, column: 2)
!1288 = !DILocation(line: 1265, column: 20, scope: !1287)
!1289 = !DILocation(line: 1265, column: 10, scope: !1287)
!1290 = !DILocation(line: 1265, column: 3, scope: !1287)
!1291 = !DILocation(line: 1269, column: 3, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1283, file: !76, line: 1268, column: 2)
!1293 = !DILocation(line: 1271, column: 1, scope: !1271)
!1294 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !76, file: !76, line: 1285, type: !1295, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!740, !34, !34}
!1297 = !DILocalVariable(name: "x_value", arg: 1, scope: !1294, file: !76, line: 1285, type: !34)
!1298 = !DILocation(line: 1285, column: 25, scope: !1294)
!1299 = !DILocalVariable(name: "y_value", arg: 2, scope: !1294, file: !76, line: 1285, type: !34)
!1300 = !DILocation(line: 1285, column: 38, scope: !1294)
!1301 = !DILocalVariable(name: "u32Temp1", scope: !1294, file: !76, line: 1287, type: !740)
!1302 = !DILocation(line: 1287, column: 6, scope: !1294)
!1303 = !DILocation(line: 1288, column: 13, scope: !1294)
!1304 = !DILocation(line: 1288, column: 23, scope: !1294)
!1305 = !DILocation(line: 1288, column: 21, scope: !1294)
!1306 = !DILocation(line: 1288, column: 11, scope: !1294)
!1307 = !DILocation(line: 1289, column: 9, scope: !1294)
!1308 = !DILocation(line: 1289, column: 2, scope: !1294)
!1309 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !76, file: !76, line: 1307, type: !1310, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!84, !25, !25}
!1312 = !DILocalVariable(name: "x_value", arg: 1, scope: !1309, file: !76, line: 1307, type: !25)
!1313 = !DILocation(line: 1307, column: 25, scope: !1309)
!1314 = !DILocalVariable(name: "y_value", arg: 2, scope: !1309, file: !76, line: 1307, type: !25)
!1315 = !DILocation(line: 1307, column: 38, scope: !1309)
!1316 = !DILocalVariable(name: "s32Temp1", scope: !1309, file: !76, line: 1309, type: !84)
!1317 = !DILocation(line: 1309, column: 6, scope: !1309)
!1318 = !DILocation(line: 1310, column: 13, scope: !1309)
!1319 = !DILocation(line: 1310, column: 23, scope: !1309)
!1320 = !DILocation(line: 1310, column: 21, scope: !1309)
!1321 = !DILocation(line: 1310, column: 11, scope: !1309)
!1322 = !DILocation(line: 1311, column: 9, scope: !1309)
!1323 = !DILocation(line: 1311, column: 2, scope: !1309)
!1324 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !76, file: !76, line: 1328, type: !1325, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1325 = !DISubroutineType(types: !1326)
!1326 = !{!740, !740, !84}
!1327 = !DILocalVariable(name: "val1", arg: 1, scope: !1324, file: !76, line: 1328, type: !740)
!1328 = !DILocation(line: 1328, column: 25, scope: !1324)
!1329 = !DILocalVariable(name: "val2", arg: 2, scope: !1324, file: !76, line: 1328, type: !84)
!1330 = !DILocation(line: 1328, column: 35, scope: !1324)
!1331 = !DILocalVariable(name: "s32Temp1", scope: !1324, file: !76, line: 1330, type: !84)
!1332 = !DILocation(line: 1330, column: 6, scope: !1324)
!1333 = !DILocation(line: 1331, column: 5, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1324, file: !76, line: 1331, column: 5)
!1335 = !DILocation(line: 1331, column: 10, scope: !1334)
!1336 = !DILocation(line: 1331, column: 5, scope: !1324)
!1337 = !DILocation(line: 1333, column: 25, scope: !1338)
!1338 = distinct !DILexicalBlock(scope: !1334, file: !76, line: 1332, column: 2)
!1339 = !DILocation(line: 1333, column: 24, scope: !1338)
!1340 = !DILocation(line: 1333, column: 12, scope: !1338)
!1341 = !DILocation(line: 1334, column: 6, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1338, file: !76, line: 1334, column: 6)
!1343 = !DILocation(line: 1334, column: 17, scope: !1342)
!1344 = !DILocation(line: 1334, column: 15, scope: !1342)
!1345 = !DILocation(line: 1334, column: 6, scope: !1338)
!1346 = !DILocation(line: 1336, column: 4, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1342, file: !76, line: 1335, column: 3)
!1348 = !DILocation(line: 1340, column: 12, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1342, file: !76, line: 1339, column: 3)
!1350 = !DILocation(line: 1340, column: 19, scope: !1349)
!1351 = !DILocation(line: 1340, column: 17, scope: !1349)
!1352 = !DILocation(line: 1340, column: 4, scope: !1349)
!1353 = !DILocation(line: 1345, column: 3, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1334, file: !76, line: 1344, column: 2)
!1355 = !DILocation(line: 1347, column: 1, scope: !1324)
!1356 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !76, file: !76, line: 1362, type: !1357, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!740, !84, !84}
!1359 = !DILocalVariable(name: "val1", arg: 1, scope: !1356, file: !76, line: 1362, type: !84)
!1360 = !DILocation(line: 1362, column: 25, scope: !1356)
!1361 = !DILocalVariable(name: "val2", arg: 2, scope: !1356, file: !76, line: 1362, type: !84)
!1362 = !DILocation(line: 1362, column: 35, scope: !1356)
!1363 = !DILocalVariable(name: "u32Temp1", scope: !1356, file: !76, line: 1364, type: !740)
!1364 = !DILocation(line: 1364, column: 6, scope: !1356)
!1365 = !DILocalVariable(name: "u32Temp2", scope: !1356, file: !76, line: 1364, type: !740)
!1366 = !DILocation(line: 1364, column: 17, scope: !1356)
!1367 = !DILocalVariable(name: "u32Temp3", scope: !1356, file: !76, line: 1364, type: !740)
!1368 = !DILocation(line: 1364, column: 27, scope: !1356)
!1369 = !DILocalVariable(name: "u8SignBit", scope: !1356, file: !76, line: 1365, type: !29)
!1370 = !DILocation(line: 1365, column: 5, scope: !1356)
!1371 = !DILocation(line: 1367, column: 5, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1356, file: !76, line: 1367, column: 5)
!1373 = !DILocation(line: 1367, column: 9, scope: !1372)
!1374 = !DILocation(line: 1367, column: 5, scope: !1356)
!1375 = !DILocation(line: 1368, column: 15, scope: !1372)
!1376 = !DILocation(line: 1368, column: 14, scope: !1372)
!1377 = !DILocation(line: 1368, column: 12, scope: !1372)
!1378 = !DILocation(line: 1368, column: 3, scope: !1372)
!1379 = !DILocation(line: 1370, column: 14, scope: !1372)
!1380 = !DILocation(line: 1370, column: 12, scope: !1372)
!1381 = !DILocation(line: 1372, column: 5, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1356, file: !76, line: 1372, column: 5)
!1383 = !DILocation(line: 1372, column: 9, scope: !1382)
!1384 = !DILocation(line: 1372, column: 5, scope: !1356)
!1385 = !DILocation(line: 1373, column: 15, scope: !1382)
!1386 = !DILocation(line: 1373, column: 14, scope: !1382)
!1387 = !DILocation(line: 1373, column: 12, scope: !1382)
!1388 = !DILocation(line: 1373, column: 3, scope: !1382)
!1389 = !DILocation(line: 1375, column: 14, scope: !1382)
!1390 = !DILocation(line: 1375, column: 12, scope: !1382)
!1391 = !DILocation(line: 1377, column: 6, scope: !1392)
!1392 = distinct !DILexicalBlock(scope: !1356, file: !76, line: 1377, column: 5)
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
!1406 = distinct !DILexicalBlock(scope: !1356, file: !76, line: 1383, column: 5)
!1407 = !DILocation(line: 1383, column: 14, scope: !1406)
!1408 = !DILocation(line: 1383, column: 5, scope: !1356)
!1409 = !DILocation(line: 1385, column: 3, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1406, file: !76, line: 1384, column: 2)
!1411 = !DILocation(line: 1389, column: 10, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1406, file: !76, line: 1388, column: 2)
!1413 = !DILocation(line: 1389, column: 3, scope: !1412)
!1414 = !DILocation(line: 1440, column: 1, scope: !1356)
!1415 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !76, file: !76, line: 1455, type: !1416, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1416 = !DISubroutineType(types: !1417)
!1417 = !{!740, !740, !740}
!1418 = !DILocalVariable(name: "val1", arg: 1, scope: !1415, file: !76, line: 1455, type: !740)
!1419 = !DILocation(line: 1455, column: 25, scope: !1415)
!1420 = !DILocalVariable(name: "val2", arg: 2, scope: !1415, file: !76, line: 1455, type: !740)
!1421 = !DILocation(line: 1455, column: 35, scope: !1415)
!1422 = !DILocalVariable(name: "u32Temp1", scope: !1415, file: !76, line: 1457, type: !740)
!1423 = !DILocation(line: 1457, column: 6, scope: !1415)
!1424 = !DILocation(line: 1458, column: 5, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1415, file: !76, line: 1458, column: 5)
!1426 = !DILocation(line: 1458, column: 10, scope: !1425)
!1427 = !DILocation(line: 1458, column: 5, scope: !1415)
!1428 = !DILocation(line: 1460, column: 26, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1425, file: !76, line: 1459, column: 2)
!1430 = !DILocation(line: 1460, column: 25, scope: !1429)
!1431 = !DILocation(line: 1460, column: 12, scope: !1429)
!1432 = !DILocation(line: 1461, column: 6, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1429, file: !76, line: 1461, column: 6)
!1434 = !DILocation(line: 1461, column: 17, scope: !1433)
!1435 = !DILocation(line: 1461, column: 15, scope: !1433)
!1436 = !DILocation(line: 1461, column: 6, scope: !1429)
!1437 = !DILocation(line: 1463, column: 4, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1433, file: !76, line: 1462, column: 3)
!1439 = !DILocation(line: 1467, column: 12, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1433, file: !76, line: 1466, column: 3)
!1441 = !DILocation(line: 1467, column: 19, scope: !1440)
!1442 = !DILocation(line: 1467, column: 17, scope: !1440)
!1443 = !DILocation(line: 1467, column: 4, scope: !1440)
!1444 = !DILocation(line: 1472, column: 3, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1425, file: !76, line: 1471, column: 2)
!1446 = !DILocation(line: 1474, column: 1, scope: !1415)
!1447 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !76, file: !76, line: 1501, type: !1121, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1448 = !DILocalVariable(name: "value", arg: 1, scope: !1447, file: !76, line: 1501, type: !740)
!1449 = !DILocation(line: 1501, column: 30, scope: !1447)
!1450 = !DILocalVariable(name: "factor", arg: 2, scope: !1447, file: !76, line: 1501, type: !34)
!1451 = !DILocation(line: 1501, column: 41, scope: !1447)
!1452 = !DILocalVariable(name: "u32Temp1", scope: !1447, file: !76, line: 1503, type: !740)
!1453 = !DILocation(line: 1503, column: 6, scope: !1447)
!1454 = !DILocalVariable(name: "u32Temp2", scope: !1447, file: !76, line: 1503, type: !740)
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
!1472 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !76, file: !76, line: 1527, type: !1121, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1473 = !DILocalVariable(name: "value", arg: 1, scope: !1472, file: !76, line: 1527, type: !740)
!1474 = !DILocation(line: 1527, column: 30, scope: !1472)
!1475 = !DILocalVariable(name: "factor", arg: 2, scope: !1472, file: !76, line: 1527, type: !34)
!1476 = !DILocation(line: 1527, column: 41, scope: !1472)
!1477 = !DILocalVariable(name: "u32Temp1", scope: !1472, file: !76, line: 1529, type: !740)
!1478 = !DILocation(line: 1529, column: 6, scope: !1472)
!1479 = !DILocalVariable(name: "u32Temp2", scope: !1472, file: !76, line: 1529, type: !740)
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
!1496 = distinct !DILexicalBlock(scope: !1472, file: !76, line: 1534, column: 5)
!1497 = !DILocation(line: 1534, column: 14, scope: !1496)
!1498 = !DILocation(line: 1534, column: 20, scope: !1496)
!1499 = !DILocation(line: 1534, column: 5, scope: !1472)
!1500 = !DILocation(line: 1536, column: 10, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1496, file: !76, line: 1535, column: 2)
!1502 = !DILocation(line: 1536, column: 3, scope: !1501)
!1503 = !DILocation(line: 1540, column: 3, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1496, file: !76, line: 1539, column: 2)
!1505 = !DILocation(line: 1542, column: 1, scope: !1472)
!1506 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !76, file: !76, line: 1560, type: !1507, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!740, !740, !25}
!1509 = !DILocalVariable(name: "value", arg: 1, scope: !1506, file: !76, line: 1560, type: !740)
!1510 = !DILocation(line: 1560, column: 30, scope: !1506)
!1511 = !DILocalVariable(name: "factor", arg: 2, scope: !1506, file: !76, line: 1560, type: !25)
!1512 = !DILocation(line: 1560, column: 41, scope: !1506)
!1513 = !DILocalVariable(name: "u32Temp1", scope: !1506, file: !76, line: 1562, type: !740)
!1514 = !DILocation(line: 1562, column: 6, scope: !1506)
!1515 = !DILocalVariable(name: "u32Temp2", scope: !1506, file: !76, line: 1562, type: !740)
!1516 = !DILocation(line: 1562, column: 20, scope: !1506)
!1517 = !DILocation(line: 1563, column: 5, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1506, file: !76, line: 1563, column: 5)
!1519 = !DILocation(line: 1563, column: 12, scope: !1518)
!1520 = !DILocation(line: 1563, column: 5, scope: !1506)
!1521 = !DILocation(line: 1566, column: 14, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1518, file: !76, line: 1564, column: 2)
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
!1539 = distinct !DILexicalBlock(scope: !1518, file: !76, line: 1573, column: 2)
!1540 = !DILocation(line: 1576, column: 1, scope: !1506)
!1541 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !76, file: !76, line: 1595, type: !1507, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1542 = !DILocalVariable(name: "value", arg: 1, scope: !1541, file: !76, line: 1595, type: !740)
!1543 = !DILocation(line: 1595, column: 31, scope: !1541)
!1544 = !DILocalVariable(name: "factor", arg: 2, scope: !1541, file: !76, line: 1595, type: !25)
!1545 = !DILocation(line: 1595, column: 42, scope: !1541)
!1546 = !DILocalVariable(name: "u32Temp1", scope: !1541, file: !76, line: 1597, type: !740)
!1547 = !DILocation(line: 1597, column: 6, scope: !1541)
!1548 = !DILocalVariable(name: "u32Temp2", scope: !1541, file: !76, line: 1597, type: !740)
!1549 = !DILocation(line: 1597, column: 20, scope: !1541)
!1550 = !DILocation(line: 1598, column: 5, scope: !1551)
!1551 = distinct !DILexicalBlock(scope: !1541, file: !76, line: 1598, column: 5)
!1552 = !DILocation(line: 1598, column: 12, scope: !1551)
!1553 = !DILocation(line: 1598, column: 5, scope: !1541)
!1554 = !DILocation(line: 1600, column: 3, scope: !1555)
!1555 = distinct !DILexicalBlock(scope: !1551, file: !76, line: 1599, column: 2)
!1556 = !DILocation(line: 1604, column: 14, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1551, file: !76, line: 1603, column: 2)
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
!1572 = distinct !DILexicalBlock(scope: !1557, file: !76, line: 1608, column: 6)
!1573 = !DILocation(line: 1608, column: 16, scope: !1572)
!1574 = !DILocation(line: 1608, column: 23, scope: !1572)
!1575 = !DILocation(line: 1608, column: 6, scope: !1557)
!1576 = !DILocation(line: 1610, column: 11, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1572, file: !76, line: 1609, column: 3)
!1578 = !DILocation(line: 1610, column: 4, scope: !1577)
!1579 = !DILocation(line: 1614, column: 4, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1572, file: !76, line: 1613, column: 3)
!1581 = !DILocation(line: 1617, column: 1, scope: !1541)
!1582 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !76, file: !76, line: 1632, type: !1416, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1583 = !DILocalVariable(name: "value", arg: 1, scope: !1582, file: !76, line: 1632, type: !740)
!1584 = !DILocation(line: 1632, column: 30, scope: !1582)
!1585 = !DILocalVariable(name: "factor", arg: 2, scope: !1582, file: !76, line: 1632, type: !740)
!1586 = !DILocation(line: 1632, column: 40, scope: !1582)
!1587 = !DILocation(line: 1634, column: 21, scope: !1582)
!1588 = !DILocation(line: 1634, column: 28, scope: !1582)
!1589 = !DILocation(line: 1634, column: 9, scope: !1582)
!1590 = !DILocation(line: 1634, column: 2, scope: !1582)
!1591 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !76, file: !76, line: 1653, type: !1416, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1592 = !DILocalVariable(name: "value", arg: 1, scope: !1591, file: !76, line: 1653, type: !740)
!1593 = !DILocation(line: 1653, column: 30, scope: !1591)
!1594 = !DILocalVariable(name: "factor", arg: 2, scope: !1591, file: !76, line: 1653, type: !740)
!1595 = !DILocation(line: 1653, column: 40, scope: !1591)
!1596 = !DILocalVariable(name: "u32Temp1", scope: !1591, file: !76, line: 1655, type: !740)
!1597 = !DILocation(line: 1655, column: 6, scope: !1591)
!1598 = !DILocalVariable(name: "u32Temp2", scope: !1591, file: !76, line: 1655, type: !740)
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
!1615 = distinct !DILexicalBlock(scope: !1591, file: !76, line: 1660, column: 5)
!1616 = !DILocation(line: 1660, column: 14, scope: !1615)
!1617 = !DILocation(line: 1660, column: 20, scope: !1615)
!1618 = !DILocation(line: 1660, column: 5, scope: !1591)
!1619 = !DILocation(line: 1662, column: 10, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1615, file: !76, line: 1661, column: 2)
!1621 = !DILocation(line: 1662, column: 3, scope: !1620)
!1622 = !DILocation(line: 1666, column: 3, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1615, file: !76, line: 1665, column: 2)
!1624 = !DILocation(line: 1668, column: 1, scope: !1591)
!1625 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !76, file: !76, line: 1686, type: !1325, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1626 = !DILocalVariable(name: "value", arg: 1, scope: !1625, file: !76, line: 1686, type: !740)
!1627 = !DILocation(line: 1686, column: 30, scope: !1625)
!1628 = !DILocalVariable(name: "factor", arg: 2, scope: !1625, file: !76, line: 1686, type: !84)
!1629 = !DILocation(line: 1686, column: 40, scope: !1625)
!1630 = !DILocalVariable(name: "u32Temp1", scope: !1625, file: !76, line: 1688, type: !740)
!1631 = !DILocation(line: 1688, column: 6, scope: !1625)
!1632 = !DILocalVariable(name: "u32Temp2", scope: !1625, file: !76, line: 1688, type: !740)
!1633 = !DILocation(line: 1688, column: 20, scope: !1625)
!1634 = !DILocation(line: 1689, column: 5, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1625, file: !76, line: 1689, column: 5)
!1636 = !DILocation(line: 1689, column: 12, scope: !1635)
!1637 = !DILocation(line: 1689, column: 5, scope: !1625)
!1638 = !DILocation(line: 1691, column: 14, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1635, file: !76, line: 1690, column: 2)
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
!1656 = distinct !DILexicalBlock(scope: !1635, file: !76, line: 1698, column: 2)
!1657 = !DILocation(line: 1701, column: 1, scope: !1625)
!1658 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !76, file: !76, line: 1720, type: !1325, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1659 = !DILocalVariable(name: "value", arg: 1, scope: !1658, file: !76, line: 1720, type: !740)
!1660 = !DILocation(line: 1720, column: 30, scope: !1658)
!1661 = !DILocalVariable(name: "factor", arg: 2, scope: !1658, file: !76, line: 1720, type: !84)
!1662 = !DILocation(line: 1720, column: 40, scope: !1658)
!1663 = !DILocalVariable(name: "u32Temp1", scope: !1658, file: !76, line: 1722, type: !740)
!1664 = !DILocation(line: 1722, column: 6, scope: !1658)
!1665 = !DILocalVariable(name: "u32Temp2", scope: !1658, file: !76, line: 1722, type: !740)
!1666 = !DILocation(line: 1722, column: 20, scope: !1658)
!1667 = !DILocation(line: 1723, column: 5, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1658, file: !76, line: 1723, column: 5)
!1669 = !DILocation(line: 1723, column: 12, scope: !1668)
!1670 = !DILocation(line: 1723, column: 5, scope: !1658)
!1671 = !DILocation(line: 1725, column: 3, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1668, file: !76, line: 1724, column: 2)
!1673 = !DILocation(line: 1729, column: 14, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1668, file: !76, line: 1728, column: 2)
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
!1689 = distinct !DILexicalBlock(scope: !1674, file: !76, line: 1733, column: 6)
!1690 = !DILocation(line: 1733, column: 15, scope: !1689)
!1691 = !DILocation(line: 1733, column: 21, scope: !1689)
!1692 = !DILocation(line: 1733, column: 6, scope: !1674)
!1693 = !DILocation(line: 1735, column: 11, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1689, file: !76, line: 1734, column: 3)
!1695 = !DILocation(line: 1735, column: 4, scope: !1694)
!1696 = !DILocation(line: 1739, column: 4, scope: !1697)
!1697 = distinct !DILexicalBlock(scope: !1689, file: !76, line: 1738, column: 3)
!1698 = !DILocation(line: 1742, column: 1, scope: !1658)
!1699 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !76, file: !76, line: 1757, type: !1700, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1700 = !DISubroutineType(types: !1701)
!1701 = !{!84, !740, !84}
!1702 = !DILocalVariable(name: "val1", arg: 1, scope: !1699, file: !76, line: 1757, type: !740)
!1703 = !DILocation(line: 1757, column: 25, scope: !1699)
!1704 = !DILocalVariable(name: "val2", arg: 2, scope: !1699, file: !76, line: 1757, type: !84)
!1705 = !DILocation(line: 1757, column: 35, scope: !1699)
!1706 = !DILocalVariable(name: "s32Val2prime", scope: !1699, file: !76, line: 1759, type: !84)
!1707 = !DILocation(line: 1759, column: 6, scope: !1699)
!1708 = !DILocation(line: 1760, column: 5, scope: !1709)
!1709 = distinct !DILexicalBlock(scope: !1699, file: !76, line: 1760, column: 5)
!1710 = !DILocation(line: 1760, column: 10, scope: !1709)
!1711 = !DILocation(line: 1760, column: 5, scope: !1699)
!1712 = !DILocation(line: 1762, column: 19, scope: !1713)
!1713 = distinct !DILexicalBlock(scope: !1709, file: !76, line: 1761, column: 2)
!1714 = !DILocation(line: 1762, column: 18, scope: !1713)
!1715 = !DILocation(line: 1762, column: 16, scope: !1713)
!1716 = !DILocation(line: 1763, column: 2, scope: !1713)
!1717 = !DILocation(line: 1764, column: 5, scope: !1718)
!1718 = distinct !DILexicalBlock(scope: !1699, file: !76, line: 1764, column: 5)
!1719 = !DILocation(line: 1764, column: 10, scope: !1718)
!1720 = !DILocation(line: 1764, column: 5, scope: !1699)
!1721 = !DILocation(line: 1766, column: 6, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1723, file: !76, line: 1766, column: 6)
!1723 = distinct !DILexicalBlock(scope: !1718, file: !76, line: 1765, column: 2)
!1724 = !DILocation(line: 1766, column: 11, scope: !1722)
!1725 = !DILocation(line: 1766, column: 6, scope: !1723)
!1726 = !DILocation(line: 1768, column: 21, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !76, line: 1768, column: 7)
!1728 = distinct !DILexicalBlock(scope: !1722, file: !76, line: 1767, column: 3)
!1729 = !DILocation(line: 1768, column: 19, scope: !1727)
!1730 = !DILocation(line: 1768, column: 37, scope: !1727)
!1731 = !DILocation(line: 1768, column: 35, scope: !1727)
!1732 = !DILocation(line: 1768, column: 7, scope: !1728)
!1733 = !DILocation(line: 1770, column: 13, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1727, file: !76, line: 1769, column: 4)
!1735 = !DILocation(line: 1770, column: 20, scope: !1734)
!1736 = !DILocation(line: 1770, column: 18, scope: !1734)
!1737 = !DILocation(line: 1770, column: 5, scope: !1734)
!1738 = !DILocation(line: 1774, column: 5, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1727, file: !76, line: 1773, column: 4)
!1740 = !DILocation(line: 1779, column: 21, scope: !1741)
!1741 = distinct !DILexicalBlock(scope: !1742, file: !76, line: 1779, column: 7)
!1742 = distinct !DILexicalBlock(scope: !1722, file: !76, line: 1778, column: 3)
!1743 = !DILocation(line: 1779, column: 19, scope: !1741)
!1744 = !DILocation(line: 1779, column: 29, scope: !1741)
!1745 = !DILocation(line: 1779, column: 27, scope: !1741)
!1746 = !DILocation(line: 1779, column: 7, scope: !1742)
!1747 = !DILocation(line: 1781, column: 5, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1741, file: !76, line: 1780, column: 4)
!1749 = !DILocation(line: 1785, column: 13, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1741, file: !76, line: 1784, column: 4)
!1751 = !DILocation(line: 1785, column: 20, scope: !1750)
!1752 = !DILocation(line: 1785, column: 18, scope: !1750)
!1753 = !DILocation(line: 1785, column: 5, scope: !1750)
!1754 = !DILocation(line: 1791, column: 3, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1718, file: !76, line: 1790, column: 2)
!1756 = !DILocation(line: 1793, column: 1, scope: !1699)
!1757 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !76, file: !76, line: 1810, type: !779, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1758 = !DILocalVariable(name: "val1", arg: 1, scope: !1757, file: !76, line: 1810, type: !84)
!1759 = !DILocation(line: 1810, column: 30, scope: !1757)
!1760 = !DILocalVariable(name: "val2", arg: 2, scope: !1757, file: !76, line: 1810, type: !34)
!1761 = !DILocation(line: 1810, column: 39, scope: !1757)
!1762 = !DILocalVariable(name: "u32Temp1", scope: !1757, file: !76, line: 1812, type: !740)
!1763 = !DILocation(line: 1812, column: 6, scope: !1757)
!1764 = !DILocalVariable(name: "u32Temp2", scope: !1757, file: !76, line: 1812, type: !740)
!1765 = !DILocation(line: 1812, column: 17, scope: !1757)
!1766 = !DILocalVariable(name: "u32Temp3", scope: !1757, file: !76, line: 1812, type: !740)
!1767 = !DILocation(line: 1812, column: 26, scope: !1757)
!1768 = !DILocalVariable(name: "u8SignBit", scope: !1757, file: !76, line: 1813, type: !29)
!1769 = !DILocation(line: 1813, column: 5, scope: !1757)
!1770 = !DILocation(line: 1815, column: 5, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1757, file: !76, line: 1815, column: 5)
!1772 = !DILocation(line: 1815, column: 9, scope: !1771)
!1773 = !DILocation(line: 1815, column: 5, scope: !1757)
!1774 = !DILocation(line: 1817, column: 15, scope: !1775)
!1775 = distinct !DILexicalBlock(scope: !1771, file: !76, line: 1816, column: 2)
!1776 = !DILocation(line: 1817, column: 14, scope: !1775)
!1777 = !DILocation(line: 1817, column: 12, scope: !1775)
!1778 = !DILocation(line: 1818, column: 13, scope: !1775)
!1779 = !DILocation(line: 1819, column: 2, scope: !1775)
!1780 = !DILocation(line: 1822, column: 14, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1771, file: !76, line: 1821, column: 2)
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
!1799 = distinct !DILexicalBlock(scope: !1757, file: !76, line: 1830, column: 5)
!1800 = !DILocation(line: 1830, column: 15, scope: !1799)
!1801 = !DILocation(line: 1830, column: 5, scope: !1757)
!1802 = !DILocation(line: 1832, column: 10, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1799, file: !76, line: 1831, column: 2)
!1804 = !DILocation(line: 1832, column: 3, scope: !1803)
!1805 = !DILocation(line: 1836, column: 11, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1799, file: !76, line: 1835, column: 2)
!1807 = !DILocation(line: 1836, column: 10, scope: !1806)
!1808 = !DILocation(line: 1836, column: 3, scope: !1806)
!1809 = !DILocation(line: 1838, column: 1, scope: !1757)
!1810 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !76, file: !76, line: 1857, type: !779, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1811 = !DILocalVariable(name: "val1", arg: 1, scope: !1810, file: !76, line: 1857, type: !84)
!1812 = !DILocation(line: 1857, column: 30, scope: !1810)
!1813 = !DILocalVariable(name: "val2", arg: 2, scope: !1810, file: !76, line: 1857, type: !34)
!1814 = !DILocation(line: 1857, column: 39, scope: !1810)
!1815 = !DILocalVariable(name: "u32Temp1", scope: !1810, file: !76, line: 1859, type: !740)
!1816 = !DILocation(line: 1859, column: 6, scope: !1810)
!1817 = !DILocalVariable(name: "u32Temp2", scope: !1810, file: !76, line: 1859, type: !740)
!1818 = !DILocation(line: 1859, column: 17, scope: !1810)
!1819 = !DILocalVariable(name: "u32Temp3", scope: !1810, file: !76, line: 1859, type: !740)
!1820 = !DILocation(line: 1859, column: 26, scope: !1810)
!1821 = !DILocalVariable(name: "u8SignBit", scope: !1810, file: !76, line: 1860, type: !29)
!1822 = !DILocation(line: 1860, column: 5, scope: !1810)
!1823 = !DILocation(line: 1862, column: 5, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1810, file: !76, line: 1862, column: 5)
!1825 = !DILocation(line: 1862, column: 9, scope: !1824)
!1826 = !DILocation(line: 1862, column: 5, scope: !1810)
!1827 = !DILocation(line: 1864, column: 15, scope: !1828)
!1828 = distinct !DILexicalBlock(scope: !1824, file: !76, line: 1863, column: 2)
!1829 = !DILocation(line: 1864, column: 14, scope: !1828)
!1830 = !DILocation(line: 1864, column: 12, scope: !1828)
!1831 = !DILocation(line: 1865, column: 13, scope: !1828)
!1832 = !DILocation(line: 1866, column: 2, scope: !1828)
!1833 = !DILocation(line: 1869, column: 14, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1824, file: !76, line: 1868, column: 2)
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
!1852 = distinct !DILexicalBlock(scope: !1810, file: !76, line: 1877, column: 5)
!1853 = !DILocation(line: 1877, column: 15, scope: !1852)
!1854 = !DILocation(line: 1877, column: 5, scope: !1810)
!1855 = !DILocation(line: 1879, column: 6, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1857, file: !76, line: 1879, column: 6)
!1857 = distinct !DILexicalBlock(scope: !1852, file: !76, line: 1878, column: 2)
!1858 = !DILocation(line: 1879, column: 14, scope: !1856)
!1859 = !DILocation(line: 1879, column: 6, scope: !1857)
!1860 = !DILocation(line: 1880, column: 11, scope: !1856)
!1861 = !DILocation(line: 1880, column: 4, scope: !1856)
!1862 = !DILocation(line: 1882, column: 4, scope: !1856)
!1863 = !DILocation(line: 1886, column: 6, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1865, file: !76, line: 1886, column: 6)
!1865 = distinct !DILexicalBlock(scope: !1852, file: !76, line: 1885, column: 2)
!1866 = !DILocation(line: 1886, column: 14, scope: !1864)
!1867 = !DILocation(line: 1886, column: 6, scope: !1865)
!1868 = !DILocation(line: 1887, column: 12, scope: !1864)
!1869 = !DILocation(line: 1887, column: 11, scope: !1864)
!1870 = !DILocation(line: 1887, column: 4, scope: !1864)
!1871 = !DILocation(line: 1889, column: 4, scope: !1864)
!1872 = !DILocation(line: 1891, column: 1, scope: !1810)
!1873 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !76, file: !76, line: 1911, type: !1874, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{!84, !84, !25}
!1876 = !DILocalVariable(name: "val1", arg: 1, scope: !1873, file: !76, line: 1911, type: !84)
!1877 = !DILocation(line: 1911, column: 30, scope: !1873)
!1878 = !DILocalVariable(name: "val2", arg: 2, scope: !1873, file: !76, line: 1911, type: !25)
!1879 = !DILocation(line: 1911, column: 39, scope: !1873)
!1880 = !DILocalVariable(name: "u32Temp1", scope: !1873, file: !76, line: 1913, type: !740)
!1881 = !DILocation(line: 1913, column: 6, scope: !1873)
!1882 = !DILocalVariable(name: "u32Temp2", scope: !1873, file: !76, line: 1913, type: !740)
!1883 = !DILocation(line: 1913, column: 17, scope: !1873)
!1884 = !DILocalVariable(name: "u32Temp3", scope: !1873, file: !76, line: 1913, type: !740)
!1885 = !DILocation(line: 1913, column: 26, scope: !1873)
!1886 = !DILocalVariable(name: "u32Temp4", scope: !1873, file: !76, line: 1913, type: !740)
!1887 = !DILocation(line: 1913, column: 35, scope: !1873)
!1888 = !DILocalVariable(name: "u8SignBit", scope: !1873, file: !76, line: 1914, type: !29)
!1889 = !DILocation(line: 1914, column: 5, scope: !1873)
!1890 = !DILocation(line: 1916, column: 7, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1873, file: !76, line: 1916, column: 5)
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
!1904 = distinct !DILexicalBlock(scope: !1891, file: !76, line: 1917, column: 2)
!1905 = !DILocation(line: 1919, column: 2, scope: !1904)
!1906 = !DILocation(line: 1922, column: 13, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1891, file: !76, line: 1921, column: 2)
!1908 = !DILocation(line: 1925, column: 5, scope: !1909)
!1909 = distinct !DILexicalBlock(scope: !1873, file: !76, line: 1925, column: 5)
!1910 = !DILocation(line: 1925, column: 9, scope: !1909)
!1911 = !DILocation(line: 1925, column: 5, scope: !1873)
!1912 = !DILocation(line: 1927, column: 15, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1909, file: !76, line: 1926, column: 2)
!1914 = !DILocation(line: 1927, column: 14, scope: !1913)
!1915 = !DILocation(line: 1927, column: 12, scope: !1913)
!1916 = !DILocation(line: 1928, column: 2, scope: !1913)
!1917 = !DILocation(line: 1931, column: 14, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1909, file: !76, line: 1930, column: 2)
!1919 = !DILocation(line: 1931, column: 12, scope: !1918)
!1920 = !DILocation(line: 1934, column: 5, scope: !1921)
!1921 = distinct !DILexicalBlock(scope: !1873, file: !76, line: 1934, column: 5)
!1922 = !DILocation(line: 1934, column: 9, scope: !1921)
!1923 = !DILocation(line: 1934, column: 5, scope: !1873)
!1924 = !DILocation(line: 1936, column: 15, scope: !1925)
!1925 = distinct !DILexicalBlock(scope: !1921, file: !76, line: 1935, column: 2)
!1926 = !DILocation(line: 1936, column: 14, scope: !1925)
!1927 = !DILocation(line: 1936, column: 12, scope: !1925)
!1928 = !DILocation(line: 1937, column: 2, scope: !1925)
!1929 = !DILocation(line: 1940, column: 14, scope: !1930)
!1930 = distinct !DILexicalBlock(scope: !1921, file: !76, line: 1939, column: 2)
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
!1947 = distinct !DILexicalBlock(scope: !1873, file: !76, line: 1947, column: 5)
!1948 = !DILocation(line: 1947, column: 15, scope: !1947)
!1949 = !DILocation(line: 1947, column: 5, scope: !1873)
!1950 = !DILocation(line: 1949, column: 6, scope: !1951)
!1951 = distinct !DILexicalBlock(scope: !1952, file: !76, line: 1949, column: 6)
!1952 = distinct !DILexicalBlock(scope: !1947, file: !76, line: 1948, column: 2)
!1953 = !DILocation(line: 1949, column: 14, scope: !1951)
!1954 = !DILocation(line: 1949, column: 6, scope: !1952)
!1955 = !DILocation(line: 1950, column: 11, scope: !1951)
!1956 = !DILocation(line: 1950, column: 4, scope: !1951)
!1957 = !DILocation(line: 1952, column: 4, scope: !1951)
!1958 = !DILocation(line: 1956, column: 11, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1947, file: !76, line: 1955, column: 2)
!1960 = !DILocation(line: 1956, column: 10, scope: !1959)
!1961 = !DILocation(line: 1956, column: 3, scope: !1959)
!1962 = !DILocation(line: 1958, column: 1, scope: !1873)
!1963 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !76, file: !76, line: 1977, type: !1874, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!1964 = !DILocalVariable(name: "val1", arg: 1, scope: !1963, file: !76, line: 1977, type: !84)
!1965 = !DILocation(line: 1977, column: 30, scope: !1963)
!1966 = !DILocalVariable(name: "val2", arg: 2, scope: !1963, file: !76, line: 1977, type: !25)
!1967 = !DILocation(line: 1977, column: 39, scope: !1963)
!1968 = !DILocalVariable(name: "u32Temp1", scope: !1963, file: !76, line: 1979, type: !740)
!1969 = !DILocation(line: 1979, column: 6, scope: !1963)
!1970 = !DILocalVariable(name: "u32Temp2", scope: !1963, file: !76, line: 1979, type: !740)
!1971 = !DILocation(line: 1979, column: 17, scope: !1963)
!1972 = !DILocalVariable(name: "u32Temp3", scope: !1963, file: !76, line: 1979, type: !740)
!1973 = !DILocation(line: 1979, column: 26, scope: !1963)
!1974 = !DILocalVariable(name: "u32Temp4", scope: !1963, file: !76, line: 1979, type: !740)
!1975 = !DILocation(line: 1979, column: 35, scope: !1963)
!1976 = !DILocalVariable(name: "u8SignBit", scope: !1963, file: !76, line: 1980, type: !29)
!1977 = !DILocation(line: 1980, column: 5, scope: !1963)
!1978 = !DILocation(line: 1982, column: 7, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1963, file: !76, line: 1982, column: 5)
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
!1992 = distinct !DILexicalBlock(scope: !1979, file: !76, line: 1983, column: 2)
!1993 = !DILocation(line: 1985, column: 2, scope: !1992)
!1994 = !DILocation(line: 1988, column: 13, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1979, file: !76, line: 1987, column: 2)
!1996 = !DILocation(line: 1991, column: 5, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1963, file: !76, line: 1991, column: 5)
!1998 = !DILocation(line: 1991, column: 9, scope: !1997)
!1999 = !DILocation(line: 1991, column: 5, scope: !1963)
!2000 = !DILocation(line: 1993, column: 15, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1997, file: !76, line: 1992, column: 2)
!2002 = !DILocation(line: 1993, column: 14, scope: !2001)
!2003 = !DILocation(line: 1993, column: 12, scope: !2001)
!2004 = !DILocation(line: 1994, column: 2, scope: !2001)
!2005 = !DILocation(line: 1997, column: 14, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !1997, file: !76, line: 1996, column: 2)
!2007 = !DILocation(line: 1997, column: 12, scope: !2006)
!2008 = !DILocation(line: 2000, column: 5, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !1963, file: !76, line: 2000, column: 5)
!2010 = !DILocation(line: 2000, column: 9, scope: !2009)
!2011 = !DILocation(line: 2000, column: 5, scope: !1963)
!2012 = !DILocation(line: 2002, column: 15, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2009, file: !76, line: 2001, column: 2)
!2014 = !DILocation(line: 2002, column: 14, scope: !2013)
!2015 = !DILocation(line: 2002, column: 12, scope: !2013)
!2016 = !DILocation(line: 2003, column: 2, scope: !2013)
!2017 = !DILocation(line: 2006, column: 14, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !2009, file: !76, line: 2005, column: 2)
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
!2035 = distinct !DILexicalBlock(scope: !1963, file: !76, line: 2013, column: 5)
!2036 = !DILocation(line: 2013, column: 14, scope: !2035)
!2037 = !DILocation(line: 2013, column: 19, scope: !2035)
!2038 = !DILocation(line: 2013, column: 5, scope: !1963)
!2039 = !DILocation(line: 2015, column: 6, scope: !2040)
!2040 = distinct !DILexicalBlock(scope: !2041, file: !76, line: 2015, column: 6)
!2041 = distinct !DILexicalBlock(scope: !2035, file: !76, line: 2014, column: 2)
!2042 = !DILocation(line: 2015, column: 16, scope: !2040)
!2043 = !DILocation(line: 2015, column: 6, scope: !2041)
!2044 = !DILocation(line: 2017, column: 7, scope: !2045)
!2045 = distinct !DILexicalBlock(scope: !2046, file: !76, line: 2017, column: 7)
!2046 = distinct !DILexicalBlock(scope: !2040, file: !76, line: 2016, column: 3)
!2047 = !DILocation(line: 2017, column: 15, scope: !2045)
!2048 = !DILocation(line: 2017, column: 7, scope: !2046)
!2049 = !DILocation(line: 2018, column: 12, scope: !2045)
!2050 = !DILocation(line: 2018, column: 5, scope: !2045)
!2051 = !DILocation(line: 2020, column: 5, scope: !2045)
!2052 = !DILocation(line: 2024, column: 7, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2054, file: !76, line: 2024, column: 7)
!2054 = distinct !DILexicalBlock(scope: !2040, file: !76, line: 2023, column: 3)
!2055 = !DILocation(line: 2024, column: 15, scope: !2053)
!2056 = !DILocation(line: 2024, column: 7, scope: !2054)
!2057 = !DILocation(line: 2025, column: 13, scope: !2053)
!2058 = !DILocation(line: 2025, column: 12, scope: !2053)
!2059 = !DILocation(line: 2025, column: 5, scope: !2053)
!2060 = !DILocation(line: 2027, column: 5, scope: !2053)
!2061 = !DILocation(line: 2032, column: 3, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2035, file: !76, line: 2031, column: 2)
!2063 = !DILocation(line: 2034, column: 1, scope: !1963)
!2064 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !76, file: !76, line: 2049, type: !2065, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2065 = !DISubroutineType(types: !2066)
!2066 = !{!84, !84, !740}
!2067 = !DILocalVariable(name: "val1", arg: 1, scope: !2064, file: !76, line: 2049, type: !84)
!2068 = !DILocation(line: 2049, column: 30, scope: !2064)
!2069 = !DILocalVariable(name: "val2", arg: 2, scope: !2064, file: !76, line: 2049, type: !740)
!2070 = !DILocation(line: 2049, column: 39, scope: !2064)
!2071 = !DILocalVariable(name: "u32Temp1", scope: !2064, file: !76, line: 2051, type: !740)
!2072 = !DILocation(line: 2051, column: 6, scope: !2064)
!2073 = !DILocalVariable(name: "u32Temp2", scope: !2064, file: !76, line: 2051, type: !740)
!2074 = !DILocation(line: 2051, column: 17, scope: !2064)
!2075 = !DILocalVariable(name: "u8SignBit", scope: !2064, file: !76, line: 2052, type: !29)
!2076 = !DILocation(line: 2052, column: 5, scope: !2064)
!2077 = !DILocation(line: 2054, column: 5, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2064, file: !76, line: 2054, column: 5)
!2079 = !DILocation(line: 2054, column: 9, scope: !2078)
!2080 = !DILocation(line: 2054, column: 5, scope: !2064)
!2081 = !DILocation(line: 2056, column: 15, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2078, file: !76, line: 2055, column: 2)
!2083 = !DILocation(line: 2056, column: 14, scope: !2082)
!2084 = !DILocation(line: 2056, column: 12, scope: !2082)
!2085 = !DILocation(line: 2057, column: 13, scope: !2082)
!2086 = !DILocation(line: 2058, column: 2, scope: !2082)
!2087 = !DILocation(line: 2061, column: 14, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2078, file: !76, line: 2060, column: 2)
!2089 = !DILocation(line: 2061, column: 12, scope: !2088)
!2090 = !DILocation(line: 2062, column: 13, scope: !2088)
!2091 = !DILocation(line: 2065, column: 25, scope: !2064)
!2092 = !DILocation(line: 2065, column: 35, scope: !2064)
!2093 = !DILocation(line: 2065, column: 13, scope: !2064)
!2094 = !DILocation(line: 2065, column: 11, scope: !2064)
!2095 = !DILocation(line: 2066, column: 5, scope: !2096)
!2096 = distinct !DILexicalBlock(scope: !2064, file: !76, line: 2066, column: 5)
!2097 = !DILocation(line: 2066, column: 15, scope: !2096)
!2098 = !DILocation(line: 2066, column: 5, scope: !2064)
!2099 = !DILocation(line: 2067, column: 10, scope: !2096)
!2100 = !DILocation(line: 2067, column: 3, scope: !2096)
!2101 = !DILocation(line: 2069, column: 11, scope: !2096)
!2102 = !DILocation(line: 2069, column: 10, scope: !2096)
!2103 = !DILocation(line: 2069, column: 3, scope: !2096)
!2104 = !DILocation(line: 2070, column: 1, scope: !2064)
!2105 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !76, file: !76, line: 2089, type: !2065, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2106 = !DILocalVariable(name: "val1", arg: 1, scope: !2105, file: !76, line: 2089, type: !84)
!2107 = !DILocation(line: 2089, column: 30, scope: !2105)
!2108 = !DILocalVariable(name: "val2", arg: 2, scope: !2105, file: !76, line: 2089, type: !740)
!2109 = !DILocation(line: 2089, column: 39, scope: !2105)
!2110 = !DILocalVariable(name: "u32Temp1", scope: !2105, file: !76, line: 2091, type: !740)
!2111 = !DILocation(line: 2091, column: 6, scope: !2105)
!2112 = !DILocalVariable(name: "u32Temp2", scope: !2105, file: !76, line: 2091, type: !740)
!2113 = !DILocation(line: 2091, column: 17, scope: !2105)
!2114 = !DILocalVariable(name: "u32Temp3", scope: !2105, file: !76, line: 2091, type: !740)
!2115 = !DILocation(line: 2091, column: 26, scope: !2105)
!2116 = !DILocalVariable(name: "u8SignBit", scope: !2105, file: !76, line: 2092, type: !29)
!2117 = !DILocation(line: 2092, column: 5, scope: !2105)
!2118 = !DILocation(line: 2094, column: 5, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2105, file: !76, line: 2094, column: 5)
!2120 = !DILocation(line: 2094, column: 9, scope: !2119)
!2121 = !DILocation(line: 2094, column: 5, scope: !2105)
!2122 = !DILocation(line: 2096, column: 15, scope: !2123)
!2123 = distinct !DILexicalBlock(scope: !2119, file: !76, line: 2095, column: 2)
!2124 = !DILocation(line: 2096, column: 14, scope: !2123)
!2125 = !DILocation(line: 2096, column: 12, scope: !2123)
!2126 = !DILocation(line: 2097, column: 13, scope: !2123)
!2127 = !DILocation(line: 2098, column: 2, scope: !2123)
!2128 = !DILocation(line: 2101, column: 14, scope: !2129)
!2129 = distinct !DILexicalBlock(scope: !2119, file: !76, line: 2100, column: 2)
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
!2147 = distinct !DILexicalBlock(scope: !2105, file: !76, line: 2109, column: 5)
!2148 = !DILocation(line: 2109, column: 15, scope: !2147)
!2149 = !DILocation(line: 2109, column: 5, scope: !2105)
!2150 = !DILocation(line: 2111, column: 6, scope: !2151)
!2151 = distinct !DILexicalBlock(scope: !2152, file: !76, line: 2111, column: 6)
!2152 = distinct !DILexicalBlock(scope: !2147, file: !76, line: 2110, column: 2)
!2153 = !DILocation(line: 2111, column: 14, scope: !2151)
!2154 = !DILocation(line: 2111, column: 6, scope: !2152)
!2155 = !DILocation(line: 2112, column: 11, scope: !2151)
!2156 = !DILocation(line: 2112, column: 4, scope: !2151)
!2157 = !DILocation(line: 2114, column: 4, scope: !2151)
!2158 = !DILocation(line: 2118, column: 6, scope: !2159)
!2159 = distinct !DILexicalBlock(scope: !2160, file: !76, line: 2118, column: 6)
!2160 = distinct !DILexicalBlock(scope: !2147, file: !76, line: 2117, column: 2)
!2161 = !DILocation(line: 2118, column: 14, scope: !2159)
!2162 = !DILocation(line: 2118, column: 6, scope: !2160)
!2163 = !DILocation(line: 2119, column: 12, scope: !2159)
!2164 = !DILocation(line: 2119, column: 11, scope: !2159)
!2165 = !DILocation(line: 2119, column: 4, scope: !2159)
!2166 = !DILocation(line: 2121, column: 4, scope: !2159)
!2167 = !DILocation(line: 2123, column: 1, scope: !2105)
!2168 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !76, file: !76, line: 2141, type: !2169, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2169 = !DISubroutineType(types: !2170)
!2170 = !{!84, !84, !84}
!2171 = !DILocalVariable(name: "value", arg: 1, scope: !2168, file: !76, line: 2141, type: !84)
!2172 = !DILocation(line: 2141, column: 30, scope: !2168)
!2173 = !DILocalVariable(name: "factor", arg: 2, scope: !2168, file: !76, line: 2141, type: !84)
!2174 = !DILocation(line: 2141, column: 41, scope: !2168)
!2175 = !DILocalVariable(name: "u32Temp1", scope: !2168, file: !76, line: 2143, type: !740)
!2176 = !DILocation(line: 2143, column: 6, scope: !2168)
!2177 = !DILocalVariable(name: "u32Temp2", scope: !2168, file: !76, line: 2143, type: !740)
!2178 = !DILocation(line: 2143, column: 17, scope: !2168)
!2179 = !DILocalVariable(name: "u32Temp3", scope: !2168, file: !76, line: 2143, type: !740)
!2180 = !DILocation(line: 2143, column: 26, scope: !2168)
!2181 = !DILocalVariable(name: "u32Temp4", scope: !2168, file: !76, line: 2143, type: !740)
!2182 = !DILocation(line: 2143, column: 35, scope: !2168)
!2183 = !DILocalVariable(name: "u8SignBit", scope: !2168, file: !76, line: 2144, type: !29)
!2184 = !DILocation(line: 2144, column: 5, scope: !2168)
!2185 = !DILocation(line: 2146, column: 7, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2168, file: !76, line: 2146, column: 5)
!2187 = !DILocation(line: 2146, column: 12, scope: !2186)
!2188 = !DILocation(line: 2146, column: 16, scope: !2186)
!2189 = !DILocation(line: 2146, column: 36, scope: !2186)
!2190 = !DILocation(line: 2146, column: 41, scope: !2186)
!2191 = !DILocation(line: 2146, column: 45, scope: !2186)
!2192 = !DILocation(line: 2148, column: 13, scope: !2193)
!2193 = distinct !DILexicalBlock(scope: !2186, file: !76, line: 2147, column: 2)
!2194 = !DILocation(line: 2149, column: 2, scope: !2193)
!2195 = !DILocation(line: 2152, column: 13, scope: !2196)
!2196 = distinct !DILexicalBlock(scope: !2186, file: !76, line: 2151, column: 2)
!2197 = !DILocation(line: 2155, column: 5, scope: !2198)
!2198 = distinct !DILexicalBlock(scope: !2168, file: !76, line: 2155, column: 5)
!2199 = !DILocation(line: 2155, column: 10, scope: !2198)
!2200 = !DILocation(line: 2155, column: 5, scope: !2168)
!2201 = !DILocation(line: 2157, column: 15, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2198, file: !76, line: 2156, column: 2)
!2203 = !DILocation(line: 2157, column: 14, scope: !2202)
!2204 = !DILocation(line: 2157, column: 12, scope: !2202)
!2205 = !DILocation(line: 2158, column: 2, scope: !2202)
!2206 = !DILocation(line: 2161, column: 14, scope: !2207)
!2207 = distinct !DILexicalBlock(scope: !2198, file: !76, line: 2160, column: 2)
!2208 = !DILocation(line: 2161, column: 12, scope: !2207)
!2209 = !DILocation(line: 2164, column: 5, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2168, file: !76, line: 2164, column: 5)
!2211 = !DILocation(line: 2164, column: 11, scope: !2210)
!2212 = !DILocation(line: 2164, column: 5, scope: !2168)
!2213 = !DILocation(line: 2166, column: 15, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2210, file: !76, line: 2165, column: 2)
!2215 = !DILocation(line: 2166, column: 14, scope: !2214)
!2216 = !DILocation(line: 2166, column: 12, scope: !2214)
!2217 = !DILocation(line: 2167, column: 2, scope: !2214)
!2218 = !DILocation(line: 2170, column: 14, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2210, file: !76, line: 2169, column: 2)
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
!2236 = distinct !DILexicalBlock(scope: !2168, file: !76, line: 2177, column: 5)
!2237 = !DILocation(line: 2177, column: 15, scope: !2236)
!2238 = !DILocation(line: 2177, column: 5, scope: !2168)
!2239 = !DILocation(line: 2179, column: 6, scope: !2240)
!2240 = distinct !DILexicalBlock(scope: !2241, file: !76, line: 2179, column: 6)
!2241 = distinct !DILexicalBlock(scope: !2236, file: !76, line: 2178, column: 2)
!2242 = !DILocation(line: 2179, column: 14, scope: !2240)
!2243 = !DILocation(line: 2179, column: 6, scope: !2241)
!2244 = !DILocation(line: 2180, column: 11, scope: !2240)
!2245 = !DILocation(line: 2180, column: 4, scope: !2240)
!2246 = !DILocation(line: 2182, column: 4, scope: !2240)
!2247 = !DILocation(line: 2186, column: 11, scope: !2248)
!2248 = distinct !DILexicalBlock(scope: !2236, file: !76, line: 2185, column: 2)
!2249 = !DILocation(line: 2186, column: 10, scope: !2248)
!2250 = !DILocation(line: 2186, column: 3, scope: !2248)
!2251 = !DILocation(line: 2188, column: 1, scope: !2168)
!2252 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !76, file: !76, line: 2207, type: !2169, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2253 = !DILocalVariable(name: "value", arg: 1, scope: !2252, file: !76, line: 2207, type: !84)
!2254 = !DILocation(line: 2207, column: 30, scope: !2252)
!2255 = !DILocalVariable(name: "factor", arg: 2, scope: !2252, file: !76, line: 2207, type: !84)
!2256 = !DILocation(line: 2207, column: 41, scope: !2252)
!2257 = !DILocalVariable(name: "u32Temp1", scope: !2252, file: !76, line: 2209, type: !740)
!2258 = !DILocation(line: 2209, column: 6, scope: !2252)
!2259 = !DILocalVariable(name: "u32Temp2", scope: !2252, file: !76, line: 2209, type: !740)
!2260 = !DILocation(line: 2209, column: 17, scope: !2252)
!2261 = !DILocalVariable(name: "u32Temp3", scope: !2252, file: !76, line: 2209, type: !740)
!2262 = !DILocation(line: 2209, column: 26, scope: !2252)
!2263 = !DILocalVariable(name: "u32Temp4", scope: !2252, file: !76, line: 2209, type: !740)
!2264 = !DILocation(line: 2209, column: 35, scope: !2252)
!2265 = !DILocalVariable(name: "u8SignBit", scope: !2252, file: !76, line: 2210, type: !29)
!2266 = !DILocation(line: 2210, column: 5, scope: !2252)
!2267 = !DILocation(line: 2212, column: 7, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2252, file: !76, line: 2212, column: 5)
!2269 = !DILocation(line: 2212, column: 12, scope: !2268)
!2270 = !DILocation(line: 2212, column: 16, scope: !2268)
!2271 = !DILocation(line: 2212, column: 36, scope: !2268)
!2272 = !DILocation(line: 2212, column: 41, scope: !2268)
!2273 = !DILocation(line: 2212, column: 45, scope: !2268)
!2274 = !DILocation(line: 2214, column: 13, scope: !2275)
!2275 = distinct !DILexicalBlock(scope: !2268, file: !76, line: 2213, column: 2)
!2276 = !DILocation(line: 2215, column: 2, scope: !2275)
!2277 = !DILocation(line: 2218, column: 13, scope: !2278)
!2278 = distinct !DILexicalBlock(scope: !2268, file: !76, line: 2217, column: 2)
!2279 = !DILocation(line: 2221, column: 5, scope: !2280)
!2280 = distinct !DILexicalBlock(scope: !2252, file: !76, line: 2221, column: 5)
!2281 = !DILocation(line: 2221, column: 10, scope: !2280)
!2282 = !DILocation(line: 2221, column: 5, scope: !2252)
!2283 = !DILocation(line: 2223, column: 15, scope: !2284)
!2284 = distinct !DILexicalBlock(scope: !2280, file: !76, line: 2222, column: 2)
!2285 = !DILocation(line: 2223, column: 14, scope: !2284)
!2286 = !DILocation(line: 2223, column: 12, scope: !2284)
!2287 = !DILocation(line: 2224, column: 2, scope: !2284)
!2288 = !DILocation(line: 2227, column: 14, scope: !2289)
!2289 = distinct !DILexicalBlock(scope: !2280, file: !76, line: 2226, column: 2)
!2290 = !DILocation(line: 2227, column: 12, scope: !2289)
!2291 = !DILocation(line: 2230, column: 5, scope: !2292)
!2292 = distinct !DILexicalBlock(scope: !2252, file: !76, line: 2230, column: 5)
!2293 = !DILocation(line: 2230, column: 11, scope: !2292)
!2294 = !DILocation(line: 2230, column: 5, scope: !2252)
!2295 = !DILocation(line: 2232, column: 15, scope: !2296)
!2296 = distinct !DILexicalBlock(scope: !2292, file: !76, line: 2231, column: 2)
!2297 = !DILocation(line: 2232, column: 14, scope: !2296)
!2298 = !DILocation(line: 2232, column: 12, scope: !2296)
!2299 = !DILocation(line: 2233, column: 2, scope: !2296)
!2300 = !DILocation(line: 2236, column: 14, scope: !2301)
!2301 = distinct !DILexicalBlock(scope: !2292, file: !76, line: 2235, column: 2)
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
!2318 = distinct !DILexicalBlock(scope: !2252, file: !76, line: 2243, column: 5)
!2319 = !DILocation(line: 2243, column: 14, scope: !2318)
!2320 = !DILocation(line: 2243, column: 19, scope: !2318)
!2321 = !DILocation(line: 2243, column: 5, scope: !2252)
!2322 = !DILocation(line: 2245, column: 6, scope: !2323)
!2323 = distinct !DILexicalBlock(scope: !2324, file: !76, line: 2245, column: 6)
!2324 = distinct !DILexicalBlock(scope: !2318, file: !76, line: 2244, column: 2)
!2325 = !DILocation(line: 2245, column: 16, scope: !2323)
!2326 = !DILocation(line: 2245, column: 6, scope: !2324)
!2327 = !DILocation(line: 2247, column: 7, scope: !2328)
!2328 = distinct !DILexicalBlock(scope: !2329, file: !76, line: 2247, column: 7)
!2329 = distinct !DILexicalBlock(scope: !2323, file: !76, line: 2246, column: 3)
!2330 = !DILocation(line: 2247, column: 15, scope: !2328)
!2331 = !DILocation(line: 2247, column: 7, scope: !2329)
!2332 = !DILocation(line: 2248, column: 12, scope: !2328)
!2333 = !DILocation(line: 2248, column: 5, scope: !2328)
!2334 = !DILocation(line: 2250, column: 5, scope: !2328)
!2335 = !DILocation(line: 2254, column: 7, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2337, file: !76, line: 2254, column: 7)
!2337 = distinct !DILexicalBlock(scope: !2323, file: !76, line: 2253, column: 3)
!2338 = !DILocation(line: 2254, column: 15, scope: !2336)
!2339 = !DILocation(line: 2254, column: 7, scope: !2337)
!2340 = !DILocation(line: 2255, column: 13, scope: !2336)
!2341 = !DILocation(line: 2255, column: 12, scope: !2336)
!2342 = !DILocation(line: 2255, column: 5, scope: !2336)
!2343 = !DILocation(line: 2257, column: 5, scope: !2336)
!2344 = !DILocation(line: 2262, column: 4, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2318, file: !76, line: 2261, column: 2)
!2346 = !DILocation(line: 2264, column: 1, scope: !2252)
!2347 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !76, file: !76, line: 2282, type: !2348, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!84, !84, !29}
!2350 = !DILocalVariable(name: "value", arg: 1, scope: !2347, file: !76, line: 2282, type: !84)
!2351 = !DILocation(line: 2282, column: 29, scope: !2347)
!2352 = !DILocalVariable(name: "factor", arg: 2, scope: !2347, file: !76, line: 2282, type: !29)
!2353 = !DILocation(line: 2282, column: 39, scope: !2347)
!2354 = !DILocalVariable(name: "u32Temp1", scope: !2347, file: !76, line: 2284, type: !740)
!2355 = !DILocation(line: 2284, column: 6, scope: !2347)
!2356 = !DILocalVariable(name: "u32Temp2", scope: !2347, file: !76, line: 2284, type: !740)
!2357 = !DILocation(line: 2284, column: 17, scope: !2347)
!2358 = !DILocalVariable(name: "u32Temp3", scope: !2347, file: !76, line: 2284, type: !740)
!2359 = !DILocation(line: 2284, column: 26, scope: !2347)
!2360 = !DILocalVariable(name: "u8SignBit", scope: !2347, file: !76, line: 2285, type: !29)
!2361 = !DILocation(line: 2285, column: 5, scope: !2347)
!2362 = !DILocation(line: 2287, column: 5, scope: !2363)
!2363 = distinct !DILexicalBlock(scope: !2347, file: !76, line: 2287, column: 5)
!2364 = !DILocation(line: 2287, column: 10, scope: !2363)
!2365 = !DILocation(line: 2287, column: 5, scope: !2347)
!2366 = !DILocation(line: 2289, column: 15, scope: !2367)
!2367 = distinct !DILexicalBlock(scope: !2363, file: !76, line: 2288, column: 2)
!2368 = !DILocation(line: 2289, column: 14, scope: !2367)
!2369 = !DILocation(line: 2289, column: 12, scope: !2367)
!2370 = !DILocation(line: 2290, column: 13, scope: !2367)
!2371 = !DILocation(line: 2291, column: 2, scope: !2367)
!2372 = !DILocation(line: 2294, column: 14, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2363, file: !76, line: 2293, column: 2)
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
!2391 = distinct !DILexicalBlock(scope: !2347, file: !76, line: 2302, column: 5)
!2392 = !DILocation(line: 2302, column: 15, scope: !2391)
!2393 = !DILocation(line: 2302, column: 5, scope: !2347)
!2394 = !DILocation(line: 2304, column: 10, scope: !2395)
!2395 = distinct !DILexicalBlock(scope: !2391, file: !76, line: 2303, column: 2)
!2396 = !DILocation(line: 2304, column: 3, scope: !2395)
!2397 = !DILocation(line: 2308, column: 11, scope: !2398)
!2398 = distinct !DILexicalBlock(scope: !2391, file: !76, line: 2307, column: 2)
!2399 = !DILocation(line: 2308, column: 10, scope: !2398)
!2400 = !DILocation(line: 2308, column: 3, scope: !2398)
!2401 = !DILocation(line: 2310, column: 1, scope: !2347)
!2402 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !76, file: !76, line: 2329, type: !2348, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2403 = !DILocalVariable(name: "value", arg: 1, scope: !2402, file: !76, line: 2329, type: !84)
!2404 = !DILocation(line: 2329, column: 29, scope: !2402)
!2405 = !DILocalVariable(name: "factor", arg: 2, scope: !2402, file: !76, line: 2329, type: !29)
!2406 = !DILocation(line: 2329, column: 39, scope: !2402)
!2407 = !DILocalVariable(name: "u32Temp1", scope: !2402, file: !76, line: 2331, type: !740)
!2408 = !DILocation(line: 2331, column: 6, scope: !2402)
!2409 = !DILocalVariable(name: "u32Temp2", scope: !2402, file: !76, line: 2331, type: !740)
!2410 = !DILocation(line: 2331, column: 17, scope: !2402)
!2411 = !DILocalVariable(name: "u32Temp3", scope: !2402, file: !76, line: 2331, type: !740)
!2412 = !DILocation(line: 2331, column: 26, scope: !2402)
!2413 = !DILocalVariable(name: "u8SignBit", scope: !2402, file: !76, line: 2332, type: !29)
!2414 = !DILocation(line: 2332, column: 5, scope: !2402)
!2415 = !DILocation(line: 2334, column: 5, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2402, file: !76, line: 2334, column: 5)
!2417 = !DILocation(line: 2334, column: 10, scope: !2416)
!2418 = !DILocation(line: 2334, column: 5, scope: !2402)
!2419 = !DILocation(line: 2336, column: 15, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2416, file: !76, line: 2335, column: 2)
!2421 = !DILocation(line: 2336, column: 14, scope: !2420)
!2422 = !DILocation(line: 2336, column: 12, scope: !2420)
!2423 = !DILocation(line: 2337, column: 13, scope: !2420)
!2424 = !DILocation(line: 2338, column: 2, scope: !2420)
!2425 = !DILocation(line: 2341, column: 14, scope: !2426)
!2426 = distinct !DILexicalBlock(scope: !2416, file: !76, line: 2340, column: 2)
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
!2444 = distinct !DILexicalBlock(scope: !2402, file: !76, line: 2349, column: 5)
!2445 = !DILocation(line: 2349, column: 15, scope: !2444)
!2446 = !DILocation(line: 2349, column: 5, scope: !2402)
!2447 = !DILocation(line: 2351, column: 6, scope: !2448)
!2448 = distinct !DILexicalBlock(scope: !2449, file: !76, line: 2351, column: 6)
!2449 = distinct !DILexicalBlock(scope: !2444, file: !76, line: 2350, column: 2)
!2450 = !DILocation(line: 2351, column: 14, scope: !2448)
!2451 = !DILocation(line: 2351, column: 6, scope: !2449)
!2452 = !DILocation(line: 2352, column: 11, scope: !2448)
!2453 = !DILocation(line: 2352, column: 4, scope: !2448)
!2454 = !DILocation(line: 2354, column: 4, scope: !2448)
!2455 = !DILocation(line: 2358, column: 6, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2457, file: !76, line: 2358, column: 6)
!2457 = distinct !DILexicalBlock(scope: !2444, file: !76, line: 2357, column: 2)
!2458 = !DILocation(line: 2358, column: 14, scope: !2456)
!2459 = !DILocation(line: 2358, column: 6, scope: !2457)
!2460 = !DILocation(line: 2359, column: 12, scope: !2456)
!2461 = !DILocation(line: 2359, column: 11, scope: !2456)
!2462 = !DILocation(line: 2359, column: 4, scope: !2456)
!2463 = !DILocation(line: 2361, column: 4, scope: !2456)
!2464 = !DILocation(line: 2363, column: 1, scope: !2402)
!2465 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !76, file: !76, line: 2380, type: !2466, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2466 = !DISubroutineType(types: !2467)
!2467 = !{!740, !740, !740, !29}
!2468 = !DILocalVariable(name: "value", arg: 1, scope: !2465, file: !76, line: 2380, type: !740)
!2469 = !DILocation(line: 2380, column: 39, scope: !2465)
!2470 = !DILocalVariable(name: "factor", arg: 2, scope: !2465, file: !76, line: 2380, type: !740)
!2471 = !DILocation(line: 2380, column: 49, scope: !2465)
!2472 = !DILocalVariable(name: "power", arg: 3, scope: !2465, file: !76, line: 2380, type: !29)
!2473 = !DILocation(line: 2380, column: 60, scope: !2465)
!2474 = !DILocalVariable(name: "u32Temp1", scope: !2465, file: !76, line: 2382, type: !740)
!2475 = !DILocation(line: 2382, column: 6, scope: !2465)
!2476 = !DILocalVariable(name: "u32Temp2", scope: !2465, file: !76, line: 2382, type: !740)
!2477 = !DILocation(line: 2382, column: 20, scope: !2465)
!2478 = !DILocation(line: 2383, column: 5, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2465, file: !76, line: 2383, column: 5)
!2480 = !DILocation(line: 2383, column: 10, scope: !2479)
!2481 = !DILocation(line: 2383, column: 5, scope: !2465)
!2482 = !DILocation(line: 2385, column: 9, scope: !2483)
!2483 = distinct !DILexicalBlock(scope: !2479, file: !76, line: 2384, column: 2)
!2484 = !DILocation(line: 2386, column: 2, scope: !2483)
!2485 = !DILocation(line: 2387, column: 10, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2479, file: !76, line: 2387, column: 10)
!2487 = !DILocation(line: 2387, column: 15, scope: !2486)
!2488 = !DILocation(line: 2387, column: 10, scope: !2479)
!2489 = !DILocation(line: 2389, column: 9, scope: !2490)
!2490 = distinct !DILexicalBlock(scope: !2486, file: !76, line: 2388, column: 2)
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
!2510 = distinct !DILexicalBlock(scope: !2465, file: !76, line: 2399, column: 5)
!2511 = !DILocation(line: 2399, column: 20, scope: !2510)
!2512 = !DILocation(line: 2399, column: 19, scope: !2510)
!2513 = !DILocation(line: 2399, column: 14, scope: !2510)
!2514 = !DILocation(line: 2399, column: 28, scope: !2510)
!2515 = !DILocation(line: 2399, column: 5, scope: !2465)
!2516 = !DILocation(line: 2401, column: 10, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2510, file: !76, line: 2400, column: 2)
!2518 = !DILocation(line: 2401, column: 3, scope: !2517)
!2519 = !DILocation(line: 2405, column: 3, scope: !2520)
!2520 = distinct !DILexicalBlock(scope: !2510, file: !76, line: 2404, column: 2)
!2521 = !DILocation(line: 2407, column: 1, scope: !2465)
!2522 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !76, file: !76, line: 2425, type: !2523, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2523 = !DISubroutineType(types: !2524)
!2524 = !{!84, !84, !84, !29}
!2525 = !DILocalVariable(name: "value", arg: 1, scope: !2522, file: !76, line: 2425, type: !84)
!2526 = !DILocation(line: 2425, column: 39, scope: !2522)
!2527 = !DILocalVariable(name: "factor", arg: 2, scope: !2522, file: !76, line: 2425, type: !84)
!2528 = !DILocation(line: 2425, column: 50, scope: !2522)
!2529 = !DILocalVariable(name: "power", arg: 3, scope: !2522, file: !76, line: 2425, type: !29)
!2530 = !DILocation(line: 2425, column: 61, scope: !2522)
!2531 = !DILocalVariable(name: "u32Temp1", scope: !2522, file: !76, line: 2427, type: !740)
!2532 = !DILocation(line: 2427, column: 6, scope: !2522)
!2533 = !DILocalVariable(name: "u32Temp2", scope: !2522, file: !76, line: 2427, type: !740)
!2534 = !DILocation(line: 2427, column: 17, scope: !2522)
!2535 = !DILocalVariable(name: "u32Temp3", scope: !2522, file: !76, line: 2427, type: !740)
!2536 = !DILocation(line: 2427, column: 26, scope: !2522)
!2537 = !DILocalVariable(name: "u32Temp4", scope: !2522, file: !76, line: 2427, type: !740)
!2538 = !DILocation(line: 2427, column: 35, scope: !2522)
!2539 = !DILocalVariable(name: "u8SignBit", scope: !2522, file: !76, line: 2428, type: !29)
!2540 = !DILocation(line: 2428, column: 5, scope: !2522)
!2541 = !DILocation(line: 2430, column: 5, scope: !2542)
!2542 = distinct !DILexicalBlock(scope: !2522, file: !76, line: 2430, column: 5)
!2543 = !DILocation(line: 2430, column: 10, scope: !2542)
!2544 = !DILocation(line: 2430, column: 5, scope: !2522)
!2545 = !DILocation(line: 2432, column: 9, scope: !2546)
!2546 = distinct !DILexicalBlock(scope: !2542, file: !76, line: 2431, column: 2)
!2547 = !DILocation(line: 2433, column: 2, scope: !2546)
!2548 = !DILocation(line: 2434, column: 10, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2542, file: !76, line: 2434, column: 10)
!2550 = !DILocation(line: 2434, column: 15, scope: !2549)
!2551 = !DILocation(line: 2434, column: 10, scope: !2542)
!2552 = !DILocation(line: 2436, column: 9, scope: !2553)
!2553 = distinct !DILexicalBlock(scope: !2549, file: !76, line: 2435, column: 2)
!2554 = !DILocation(line: 2437, column: 2, scope: !2553)
!2555 = !DILocation(line: 2443, column: 7, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2522, file: !76, line: 2443, column: 5)
!2557 = !DILocation(line: 2443, column: 12, scope: !2556)
!2558 = !DILocation(line: 2443, column: 16, scope: !2556)
!2559 = !DILocation(line: 2443, column: 36, scope: !2556)
!2560 = !DILocation(line: 2443, column: 41, scope: !2556)
!2561 = !DILocation(line: 2443, column: 45, scope: !2556)
!2562 = !DILocation(line: 2445, column: 13, scope: !2563)
!2563 = distinct !DILexicalBlock(scope: !2556, file: !76, line: 2444, column: 2)
!2564 = !DILocation(line: 2446, column: 2, scope: !2563)
!2565 = !DILocation(line: 2449, column: 13, scope: !2566)
!2566 = distinct !DILexicalBlock(scope: !2556, file: !76, line: 2448, column: 2)
!2567 = !DILocation(line: 2452, column: 5, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2522, file: !76, line: 2452, column: 5)
!2569 = !DILocation(line: 2452, column: 10, scope: !2568)
!2570 = !DILocation(line: 2452, column: 5, scope: !2522)
!2571 = !DILocation(line: 2455, column: 44, scope: !2572)
!2572 = distinct !DILexicalBlock(scope: !2573, file: !76, line: 2455, column: 7)
!2573 = distinct !DILexicalBlock(scope: !2568, file: !76, line: 2453, column: 2)
!2574 = !DILocation(line: 2455, column: 34, scope: !2572)
!2575 = !DILocation(line: 2455, column: 9, scope: !2572)
!2576 = !DILocation(line: 2455, column: 7, scope: !2573)
!2577 = !DILocation(line: 2456, column: 7, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2572, file: !76, line: 2455, column: 54)
!2579 = !DILocation(line: 2458, column: 15, scope: !2573)
!2580 = !DILocation(line: 2458, column: 14, scope: !2573)
!2581 = !DILocation(line: 2458, column: 12, scope: !2573)
!2582 = !DILocation(line: 2459, column: 2, scope: !2573)
!2583 = !DILocation(line: 2462, column: 14, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2568, file: !76, line: 2461, column: 2)
!2585 = !DILocation(line: 2462, column: 12, scope: !2584)
!2586 = !DILocation(line: 2465, column: 5, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2522, file: !76, line: 2465, column: 5)
!2588 = !DILocation(line: 2465, column: 11, scope: !2587)
!2589 = !DILocation(line: 2465, column: 5, scope: !2522)
!2590 = !DILocation(line: 2468, column: 44, scope: !2591)
!2591 = distinct !DILexicalBlock(scope: !2592, file: !76, line: 2468, column: 7)
!2592 = distinct !DILexicalBlock(scope: !2587, file: !76, line: 2466, column: 2)
!2593 = !DILocation(line: 2468, column: 34, scope: !2591)
!2594 = !DILocation(line: 2468, column: 9, scope: !2591)
!2595 = !DILocation(line: 2468, column: 7, scope: !2592)
!2596 = !DILocation(line: 2469, column: 7, scope: !2597)
!2597 = distinct !DILexicalBlock(scope: !2591, file: !76, line: 2468, column: 55)
!2598 = !DILocation(line: 2471, column: 15, scope: !2592)
!2599 = !DILocation(line: 2471, column: 14, scope: !2592)
!2600 = !DILocation(line: 2471, column: 12, scope: !2592)
!2601 = !DILocation(line: 2472, column: 2, scope: !2592)
!2602 = !DILocation(line: 2475, column: 14, scope: !2603)
!2603 = distinct !DILexicalBlock(scope: !2587, file: !76, line: 2474, column: 2)
!2604 = !DILocation(line: 2475, column: 12, scope: !2603)
!2605 = !DILocation(line: 2478, column: 13, scope: !2522)
!2606 = !DILocation(line: 2478, column: 24, scope: !2522)
!2607 = !DILocation(line: 2478, column: 22, scope: !2522)
!2608 = !DILocation(line: 2478, column: 11, scope: !2522)
!2609 = !DILocation(line: 2479, column: 25, scope: !2522)
!2610 = !DILocation(line: 2479, column: 35, scope: !2522)
!2611 = !DILocation(line: 2479, column: 13, scope: !2522)
!2612 = !DILocation(line: 2479, column: 11, scope: !2522)
!2613 = !DILocation(line: 2481, column: 2, scope: !2522)
!2614 = !DILocation(line: 2509, column: 1, scope: !2522)
!2615 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !13, file: !13, line: 42, type: !2616, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2616 = !DISubroutineType(types: !2617)
!2617 = !{!11, !6}
!2618 = !DILocalVariable(name: "value", arg: 1, scope: !2615, file: !13, line: 42, type: !6)
!2619 = !DILocation(line: 42, column: 38, scope: !2615)
!2620 = !DILocation(line: 44, column: 12, scope: !2615)
!2621 = !DILocation(line: 44, column: 18, scope: !2615)
!2622 = !DILocation(line: 44, column: 5, scope: !2615)
!2623 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !76, file: !76, line: 2528, type: !2624, scopeLine: 2529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2624 = !DISubroutineType(types: !2625)
!2625 = !{!84, !84, !20}
!2626 = !DILocalVariable(name: "value", arg: 1, scope: !2623, file: !76, line: 2528, type: !84)
!2627 = !DILocation(line: 2528, column: 29, scope: !2623)
!2628 = !DILocalVariable(name: "factor", arg: 2, scope: !2623, file: !76, line: 2528, type: !20)
!2629 = !DILocation(line: 2528, column: 39, scope: !2623)
!2630 = !DILocalVariable(name: "u32Temp1", scope: !2623, file: !76, line: 2530, type: !740)
!2631 = !DILocation(line: 2530, column: 6, scope: !2623)
!2632 = !DILocalVariable(name: "u32Temp2", scope: !2623, file: !76, line: 2530, type: !740)
!2633 = !DILocation(line: 2530, column: 17, scope: !2623)
!2634 = !DILocalVariable(name: "u32Temp3", scope: !2623, file: !76, line: 2530, type: !740)
!2635 = !DILocation(line: 2530, column: 26, scope: !2623)
!2636 = !DILocalVariable(name: "u32Temp4", scope: !2623, file: !76, line: 2530, type: !740)
!2637 = !DILocation(line: 2530, column: 35, scope: !2623)
!2638 = !DILocalVariable(name: "u8SignBit", scope: !2623, file: !76, line: 2531, type: !29)
!2639 = !DILocation(line: 2531, column: 5, scope: !2623)
!2640 = !DILocation(line: 2533, column: 7, scope: !2641)
!2641 = distinct !DILexicalBlock(scope: !2623, file: !76, line: 2533, column: 5)
!2642 = !DILocation(line: 2533, column: 12, scope: !2641)
!2643 = !DILocation(line: 2533, column: 16, scope: !2641)
!2644 = !DILocation(line: 2533, column: 20, scope: !2641)
!2645 = !DILocation(line: 2533, column: 26, scope: !2641)
!2646 = !DILocation(line: 2533, column: 31, scope: !2641)
!2647 = !DILocation(line: 2533, column: 36, scope: !2641)
!2648 = !DILocation(line: 2533, column: 41, scope: !2641)
!2649 = !DILocation(line: 2533, column: 45, scope: !2641)
!2650 = !DILocation(line: 2533, column: 49, scope: !2641)
!2651 = !DILocation(line: 2533, column: 55, scope: !2641)
!2652 = !DILocation(line: 2533, column: 5, scope: !2623)
!2653 = !DILocation(line: 2535, column: 13, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2641, file: !76, line: 2534, column: 2)
!2655 = !DILocation(line: 2536, column: 2, scope: !2654)
!2656 = !DILocation(line: 2539, column: 13, scope: !2657)
!2657 = distinct !DILexicalBlock(scope: !2641, file: !76, line: 2538, column: 2)
!2658 = !DILocation(line: 2542, column: 5, scope: !2659)
!2659 = distinct !DILexicalBlock(scope: !2623, file: !76, line: 2542, column: 5)
!2660 = !DILocation(line: 2542, column: 10, scope: !2659)
!2661 = !DILocation(line: 2542, column: 5, scope: !2623)
!2662 = !DILocation(line: 2544, column: 15, scope: !2663)
!2663 = distinct !DILexicalBlock(scope: !2659, file: !76, line: 2543, column: 2)
!2664 = !DILocation(line: 2544, column: 14, scope: !2663)
!2665 = !DILocation(line: 2544, column: 12, scope: !2663)
!2666 = !DILocation(line: 2545, column: 2, scope: !2663)
!2667 = !DILocation(line: 2548, column: 14, scope: !2668)
!2668 = distinct !DILexicalBlock(scope: !2659, file: !76, line: 2547, column: 2)
!2669 = !DILocation(line: 2548, column: 12, scope: !2668)
!2670 = !DILocation(line: 2551, column: 5, scope: !2671)
!2671 = distinct !DILexicalBlock(scope: !2623, file: !76, line: 2551, column: 5)
!2672 = !DILocation(line: 2551, column: 11, scope: !2671)
!2673 = !DILocation(line: 2551, column: 5, scope: !2623)
!2674 = !DILocation(line: 2553, column: 15, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2671, file: !76, line: 2552, column: 2)
!2676 = !DILocation(line: 2553, column: 14, scope: !2675)
!2677 = !DILocation(line: 2553, column: 12, scope: !2675)
!2678 = !DILocation(line: 2554, column: 2, scope: !2675)
!2679 = !DILocation(line: 2557, column: 14, scope: !2680)
!2680 = distinct !DILexicalBlock(scope: !2671, file: !76, line: 2556, column: 2)
!2681 = !DILocation(line: 2557, column: 12, scope: !2680)
!2682 = !DILocation(line: 2560, column: 13, scope: !2623)
!2683 = !DILocation(line: 2560, column: 24, scope: !2623)
!2684 = !DILocation(line: 2560, column: 22, scope: !2623)
!2685 = !DILocation(line: 2560, column: 11, scope: !2623)
!2686 = !DILocation(line: 2561, column: 25, scope: !2623)
!2687 = !DILocation(line: 2561, column: 35, scope: !2623)
!2688 = !DILocation(line: 2561, column: 13, scope: !2623)
!2689 = !DILocation(line: 2561, column: 11, scope: !2623)
!2690 = !DILocation(line: 2562, column: 13, scope: !2623)
!2691 = !DILocation(line: 2562, column: 22, scope: !2623)
!2692 = !DILocation(line: 2562, column: 11, scope: !2623)
!2693 = !DILocation(line: 2563, column: 14, scope: !2623)
!2694 = !DILocation(line: 2563, column: 23, scope: !2623)
!2695 = !DILocation(line: 2563, column: 11, scope: !2623)
!2696 = !DILocation(line: 2564, column: 5, scope: !2697)
!2697 = distinct !DILexicalBlock(scope: !2623, file: !76, line: 2564, column: 5)
!2698 = !DILocation(line: 2564, column: 15, scope: !2697)
!2699 = !DILocation(line: 2564, column: 5, scope: !2623)
!2700 = !DILocation(line: 2566, column: 6, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2702, file: !76, line: 2566, column: 6)
!2702 = distinct !DILexicalBlock(scope: !2697, file: !76, line: 2565, column: 2)
!2703 = !DILocation(line: 2566, column: 14, scope: !2701)
!2704 = !DILocation(line: 2566, column: 6, scope: !2702)
!2705 = !DILocation(line: 2567, column: 11, scope: !2701)
!2706 = !DILocation(line: 2567, column: 4, scope: !2701)
!2707 = !DILocation(line: 2569, column: 4, scope: !2701)
!2708 = !DILocation(line: 2573, column: 11, scope: !2709)
!2709 = distinct !DILexicalBlock(scope: !2697, file: !76, line: 2572, column: 2)
!2710 = !DILocation(line: 2573, column: 10, scope: !2709)
!2711 = !DILocation(line: 2573, column: 3, scope: !2709)
!2712 = !DILocation(line: 2575, column: 1, scope: !2623)
!2713 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !76, file: !76, line: 2594, type: !2624, scopeLine: 2595, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2714 = !DILocalVariable(name: "value", arg: 1, scope: !2713, file: !76, line: 2594, type: !84)
!2715 = !DILocation(line: 2594, column: 29, scope: !2713)
!2716 = !DILocalVariable(name: "factor", arg: 2, scope: !2713, file: !76, line: 2594, type: !20)
!2717 = !DILocation(line: 2594, column: 39, scope: !2713)
!2718 = !DILocalVariable(name: "u32Temp1", scope: !2713, file: !76, line: 2596, type: !740)
!2719 = !DILocation(line: 2596, column: 6, scope: !2713)
!2720 = !DILocalVariable(name: "u32Temp2", scope: !2713, file: !76, line: 2596, type: !740)
!2721 = !DILocation(line: 2596, column: 17, scope: !2713)
!2722 = !DILocalVariable(name: "u32Temp3", scope: !2713, file: !76, line: 2596, type: !740)
!2723 = !DILocation(line: 2596, column: 26, scope: !2713)
!2724 = !DILocalVariable(name: "u32Temp4", scope: !2713, file: !76, line: 2596, type: !740)
!2725 = !DILocation(line: 2596, column: 35, scope: !2713)
!2726 = !DILocalVariable(name: "u8SignBit", scope: !2713, file: !76, line: 2597, type: !29)
!2727 = !DILocation(line: 2597, column: 5, scope: !2713)
!2728 = !DILocation(line: 2599, column: 7, scope: !2729)
!2729 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2599, column: 5)
!2730 = !DILocation(line: 2599, column: 12, scope: !2729)
!2731 = !DILocation(line: 2599, column: 16, scope: !2729)
!2732 = !DILocation(line: 2599, column: 20, scope: !2729)
!2733 = !DILocation(line: 2599, column: 26, scope: !2729)
!2734 = !DILocation(line: 2599, column: 31, scope: !2729)
!2735 = !DILocation(line: 2599, column: 36, scope: !2729)
!2736 = !DILocation(line: 2599, column: 41, scope: !2729)
!2737 = !DILocation(line: 2599, column: 45, scope: !2729)
!2738 = !DILocation(line: 2599, column: 49, scope: !2729)
!2739 = !DILocation(line: 2599, column: 55, scope: !2729)
!2740 = !DILocation(line: 2599, column: 5, scope: !2713)
!2741 = !DILocation(line: 2601, column: 13, scope: !2742)
!2742 = distinct !DILexicalBlock(scope: !2729, file: !76, line: 2600, column: 2)
!2743 = !DILocation(line: 2602, column: 2, scope: !2742)
!2744 = !DILocation(line: 2605, column: 13, scope: !2745)
!2745 = distinct !DILexicalBlock(scope: !2729, file: !76, line: 2604, column: 2)
!2746 = !DILocation(line: 2608, column: 5, scope: !2747)
!2747 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2608, column: 5)
!2748 = !DILocation(line: 2608, column: 10, scope: !2747)
!2749 = !DILocation(line: 2608, column: 5, scope: !2713)
!2750 = !DILocation(line: 2610, column: 15, scope: !2751)
!2751 = distinct !DILexicalBlock(scope: !2747, file: !76, line: 2609, column: 2)
!2752 = !DILocation(line: 2610, column: 14, scope: !2751)
!2753 = !DILocation(line: 2610, column: 12, scope: !2751)
!2754 = !DILocation(line: 2611, column: 2, scope: !2751)
!2755 = !DILocation(line: 2614, column: 14, scope: !2756)
!2756 = distinct !DILexicalBlock(scope: !2747, file: !76, line: 2613, column: 2)
!2757 = !DILocation(line: 2614, column: 12, scope: !2756)
!2758 = !DILocation(line: 2617, column: 5, scope: !2759)
!2759 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2617, column: 5)
!2760 = !DILocation(line: 2617, column: 11, scope: !2759)
!2761 = !DILocation(line: 2617, column: 5, scope: !2713)
!2762 = !DILocation(line: 2619, column: 15, scope: !2763)
!2763 = distinct !DILexicalBlock(scope: !2759, file: !76, line: 2618, column: 2)
!2764 = !DILocation(line: 2619, column: 14, scope: !2763)
!2765 = !DILocation(line: 2619, column: 12, scope: !2763)
!2766 = !DILocation(line: 2620, column: 2, scope: !2763)
!2767 = !DILocation(line: 2623, column: 14, scope: !2768)
!2768 = distinct !DILexicalBlock(scope: !2759, file: !76, line: 2622, column: 2)
!2769 = !DILocation(line: 2623, column: 12, scope: !2768)
!2770 = !DILocation(line: 2626, column: 13, scope: !2713)
!2771 = !DILocation(line: 2626, column: 24, scope: !2713)
!2772 = !DILocation(line: 2626, column: 22, scope: !2713)
!2773 = !DILocation(line: 2626, column: 11, scope: !2713)
!2774 = !DILocation(line: 2627, column: 25, scope: !2713)
!2775 = !DILocation(line: 2627, column: 35, scope: !2713)
!2776 = !DILocation(line: 2627, column: 13, scope: !2713)
!2777 = !DILocation(line: 2627, column: 11, scope: !2713)
!2778 = !DILocation(line: 2628, column: 13, scope: !2713)
!2779 = !DILocation(line: 2628, column: 22, scope: !2713)
!2780 = !DILocation(line: 2628, column: 11, scope: !2713)
!2781 = !DILocation(line: 2629, column: 14, scope: !2713)
!2782 = !DILocation(line: 2629, column: 23, scope: !2713)
!2783 = !DILocation(line: 2629, column: 11, scope: !2713)
!2784 = !DILocation(line: 2630, column: 6, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2630, column: 5)
!2786 = !DILocation(line: 2630, column: 14, scope: !2785)
!2787 = !DILocation(line: 2630, column: 18, scope: !2785)
!2788 = !DILocation(line: 2630, column: 5, scope: !2713)
!2789 = !DILocation(line: 2632, column: 6, scope: !2790)
!2790 = distinct !DILexicalBlock(scope: !2791, file: !76, line: 2632, column: 6)
!2791 = distinct !DILexicalBlock(scope: !2785, file: !76, line: 2631, column: 2)
!2792 = !DILocation(line: 2632, column: 16, scope: !2790)
!2793 = !DILocation(line: 2632, column: 6, scope: !2791)
!2794 = !DILocation(line: 2634, column: 7, scope: !2795)
!2795 = distinct !DILexicalBlock(scope: !2796, file: !76, line: 2634, column: 7)
!2796 = distinct !DILexicalBlock(scope: !2790, file: !76, line: 2633, column: 3)
!2797 = !DILocation(line: 2634, column: 15, scope: !2795)
!2798 = !DILocation(line: 2634, column: 7, scope: !2796)
!2799 = !DILocation(line: 2635, column: 12, scope: !2795)
!2800 = !DILocation(line: 2635, column: 5, scope: !2795)
!2801 = !DILocation(line: 2637, column: 5, scope: !2795)
!2802 = !DILocation(line: 2641, column: 7, scope: !2803)
!2803 = distinct !DILexicalBlock(scope: !2804, file: !76, line: 2641, column: 7)
!2804 = distinct !DILexicalBlock(scope: !2790, file: !76, line: 2640, column: 3)
!2805 = !DILocation(line: 2641, column: 15, scope: !2803)
!2806 = !DILocation(line: 2641, column: 7, scope: !2804)
!2807 = !DILocation(line: 2642, column: 13, scope: !2803)
!2808 = !DILocation(line: 2642, column: 12, scope: !2803)
!2809 = !DILocation(line: 2642, column: 5, scope: !2803)
!2810 = !DILocation(line: 2644, column: 5, scope: !2803)
!2811 = !DILocation(line: 2649, column: 3, scope: !2812)
!2812 = distinct !DILexicalBlock(scope: !2785, file: !76, line: 2648, column: 2)
!2813 = !DILocation(line: 2651, column: 1, scope: !2713)
!2814 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !76, file: !76, line: 2666, type: !2169, scopeLine: 2667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2815 = !DILocalVariable(name: "val1", arg: 1, scope: !2814, file: !76, line: 2666, type: !84)
!2816 = !DILocation(line: 2666, column: 25, scope: !2814)
!2817 = !DILocalVariable(name: "val2", arg: 2, scope: !2814, file: !76, line: 2666, type: !84)
!2818 = !DILocation(line: 2666, column: 35, scope: !2814)
!2819 = !DILocalVariable(name: "u32Temp1", scope: !2814, file: !76, line: 2668, type: !740)
!2820 = !DILocation(line: 2668, column: 6, scope: !2814)
!2821 = !DILocalVariable(name: "u32Temp2", scope: !2814, file: !76, line: 2668, type: !740)
!2822 = !DILocation(line: 2668, column: 17, scope: !2814)
!2823 = !DILocalVariable(name: "u32Temp3", scope: !2814, file: !76, line: 2668, type: !740)
!2824 = !DILocation(line: 2668, column: 26, scope: !2814)
!2825 = !DILocalVariable(name: "u32Temp4", scope: !2814, file: !76, line: 2668, type: !740)
!2826 = !DILocation(line: 2668, column: 35, scope: !2814)
!2827 = !DILocalVariable(name: "u8SignBit", scope: !2814, file: !76, line: 2669, type: !29)
!2828 = !DILocation(line: 2669, column: 5, scope: !2814)
!2829 = !DILocation(line: 2671, column: 7, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2814, file: !76, line: 2671, column: 5)
!2831 = !DILocation(line: 2671, column: 11, scope: !2830)
!2832 = !DILocation(line: 2671, column: 15, scope: !2830)
!2833 = !DILocation(line: 2671, column: 33, scope: !2830)
!2834 = !DILocation(line: 2671, column: 37, scope: !2830)
!2835 = !DILocation(line: 2671, column: 41, scope: !2830)
!2836 = !DILocation(line: 2673, column: 13, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2830, file: !76, line: 2672, column: 2)
!2838 = !DILocation(line: 2674, column: 2, scope: !2837)
!2839 = !DILocation(line: 2677, column: 13, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2830, file: !76, line: 2676, column: 2)
!2841 = !DILocation(line: 2680, column: 5, scope: !2842)
!2842 = distinct !DILexicalBlock(scope: !2814, file: !76, line: 2680, column: 5)
!2843 = !DILocation(line: 2680, column: 9, scope: !2842)
!2844 = !DILocation(line: 2680, column: 5, scope: !2814)
!2845 = !DILocation(line: 2682, column: 15, scope: !2846)
!2846 = distinct !DILexicalBlock(scope: !2842, file: !76, line: 2681, column: 2)
!2847 = !DILocation(line: 2682, column: 14, scope: !2846)
!2848 = !DILocation(line: 2682, column: 12, scope: !2846)
!2849 = !DILocation(line: 2683, column: 2, scope: !2846)
!2850 = !DILocation(line: 2686, column: 14, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2842, file: !76, line: 2685, column: 2)
!2852 = !DILocation(line: 2686, column: 12, scope: !2851)
!2853 = !DILocation(line: 2689, column: 5, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2814, file: !76, line: 2689, column: 5)
!2855 = !DILocation(line: 2689, column: 9, scope: !2854)
!2856 = !DILocation(line: 2689, column: 5, scope: !2814)
!2857 = !DILocation(line: 2691, column: 15, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2854, file: !76, line: 2690, column: 2)
!2859 = !DILocation(line: 2691, column: 14, scope: !2858)
!2860 = !DILocation(line: 2691, column: 12, scope: !2858)
!2861 = !DILocation(line: 2692, column: 2, scope: !2858)
!2862 = !DILocation(line: 2695, column: 14, scope: !2863)
!2863 = distinct !DILexicalBlock(scope: !2854, file: !76, line: 2694, column: 2)
!2864 = !DILocation(line: 2695, column: 12, scope: !2863)
!2865 = !DILocation(line: 2698, column: 13, scope: !2814)
!2866 = !DILocation(line: 2698, column: 24, scope: !2814)
!2867 = !DILocation(line: 2698, column: 22, scope: !2814)
!2868 = !DILocation(line: 2698, column: 11, scope: !2814)
!2869 = !DILocation(line: 2699, column: 25, scope: !2814)
!2870 = !DILocation(line: 2699, column: 35, scope: !2814)
!2871 = !DILocation(line: 2699, column: 13, scope: !2814)
!2872 = !DILocation(line: 2699, column: 11, scope: !2814)
!2873 = !DILocation(line: 2700, column: 5, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2814, file: !76, line: 2700, column: 5)
!2875 = !DILocation(line: 2700, column: 13, scope: !2874)
!2876 = !DILocation(line: 2700, column: 5, scope: !2814)
!2877 = !DILocation(line: 2702, column: 6, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2879, file: !76, line: 2702, column: 6)
!2879 = distinct !DILexicalBlock(scope: !2874, file: !76, line: 2701, column: 2)
!2880 = !DILocation(line: 2702, column: 16, scope: !2878)
!2881 = !DILocation(line: 2702, column: 6, scope: !2879)
!2882 = !DILocation(line: 2704, column: 7, scope: !2883)
!2883 = distinct !DILexicalBlock(scope: !2884, file: !76, line: 2704, column: 7)
!2884 = distinct !DILexicalBlock(scope: !2878, file: !76, line: 2703, column: 3)
!2885 = !DILocation(line: 2704, column: 15, scope: !2883)
!2886 = !DILocation(line: 2704, column: 7, scope: !2884)
!2887 = !DILocation(line: 2705, column: 12, scope: !2883)
!2888 = !DILocation(line: 2705, column: 5, scope: !2883)
!2889 = !DILocation(line: 2707, column: 5, scope: !2883)
!2890 = !DILocation(line: 2711, column: 7, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2892, file: !76, line: 2711, column: 7)
!2892 = distinct !DILexicalBlock(scope: !2878, file: !76, line: 2710, column: 3)
!2893 = !DILocation(line: 2711, column: 15, scope: !2891)
!2894 = !DILocation(line: 2711, column: 7, scope: !2892)
!2895 = !DILocation(line: 2712, column: 13, scope: !2891)
!2896 = !DILocation(line: 2712, column: 12, scope: !2891)
!2897 = !DILocation(line: 2712, column: 5, scope: !2891)
!2898 = !DILocation(line: 2714, column: 5, scope: !2891)
!2899 = !DILocation(line: 2719, column: 6, scope: !2900)
!2900 = distinct !DILexicalBlock(scope: !2901, file: !76, line: 2719, column: 6)
!2901 = distinct !DILexicalBlock(scope: !2874, file: !76, line: 2718, column: 2)
!2902 = !DILocation(line: 2719, column: 16, scope: !2900)
!2903 = !DILocation(line: 2719, column: 6, scope: !2901)
!2904 = !DILocation(line: 2721, column: 4, scope: !2905)
!2905 = distinct !DILexicalBlock(scope: !2900, file: !76, line: 2720, column: 3)
!2906 = !DILocation(line: 2725, column: 4, scope: !2907)
!2907 = distinct !DILexicalBlock(scope: !2900, file: !76, line: 2724, column: 3)
!2908 = !DILocation(line: 2729, column: 1, scope: !2814)
!2909 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !76, file: !76, line: 2747, type: !2065, scopeLine: 2748, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2910 = !DILocalVariable(name: "value", arg: 1, scope: !2909, file: !76, line: 2747, type: !84)
!2911 = !DILocation(line: 2747, column: 31, scope: !2909)
!2912 = !DILocalVariable(name: "factor", arg: 2, scope: !2909, file: !76, line: 2747, type: !740)
!2913 = !DILocation(line: 2747, column: 42, scope: !2909)
!2914 = !DILocalVariable(name: "u32Temp1", scope: !2909, file: !76, line: 2749, type: !740)
!2915 = !DILocation(line: 2749, column: 6, scope: !2909)
!2916 = !DILocalVariable(name: "u32Temp2", scope: !2909, file: !76, line: 2749, type: !740)
!2917 = !DILocation(line: 2749, column: 17, scope: !2909)
!2918 = !DILocalVariable(name: "u8SignBit", scope: !2909, file: !76, line: 2750, type: !29)
!2919 = !DILocation(line: 2750, column: 5, scope: !2909)
!2920 = !DILocation(line: 2752, column: 5, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2909, file: !76, line: 2752, column: 5)
!2922 = !DILocation(line: 2752, column: 10, scope: !2921)
!2923 = !DILocation(line: 2752, column: 5, scope: !2909)
!2924 = !DILocation(line: 2754, column: 15, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2921, file: !76, line: 2753, column: 2)
!2926 = !DILocation(line: 2754, column: 14, scope: !2925)
!2927 = !DILocation(line: 2754, column: 12, scope: !2925)
!2928 = !DILocation(line: 2755, column: 13, scope: !2925)
!2929 = !DILocation(line: 2756, column: 2, scope: !2925)
!2930 = !DILocation(line: 2759, column: 14, scope: !2931)
!2931 = distinct !DILexicalBlock(scope: !2921, file: !76, line: 2758, column: 2)
!2932 = !DILocation(line: 2759, column: 12, scope: !2931)
!2933 = !DILocation(line: 2760, column: 13, scope: !2931)
!2934 = !DILocation(line: 2763, column: 25, scope: !2909)
!2935 = !DILocation(line: 2763, column: 35, scope: !2909)
!2936 = !DILocation(line: 2763, column: 13, scope: !2909)
!2937 = !DILocation(line: 2763, column: 11, scope: !2909)
!2938 = !DILocation(line: 2764, column: 13, scope: !2909)
!2939 = !DILocation(line: 2764, column: 22, scope: !2909)
!2940 = !DILocation(line: 2764, column: 11, scope: !2909)
!2941 = !DILocation(line: 2765, column: 5, scope: !2942)
!2942 = distinct !DILexicalBlock(scope: !2909, file: !76, line: 2765, column: 5)
!2943 = !DILocation(line: 2765, column: 15, scope: !2942)
!2944 = !DILocation(line: 2765, column: 5, scope: !2909)
!2945 = !DILocation(line: 2767, column: 10, scope: !2946)
!2946 = distinct !DILexicalBlock(scope: !2942, file: !76, line: 2766, column: 2)
!2947 = !DILocation(line: 2767, column: 3, scope: !2946)
!2948 = !DILocation(line: 2771, column: 11, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2942, file: !76, line: 2770, column: 2)
!2950 = !DILocation(line: 2771, column: 10, scope: !2949)
!2951 = !DILocation(line: 2771, column: 3, scope: !2949)
!2952 = !DILocation(line: 2773, column: 1, scope: !2909)
!2953 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !76, file: !76, line: 2789, type: !2169, scopeLine: 2790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!2954 = !DILocalVariable(name: "value", arg: 1, scope: !2953, file: !76, line: 2789, type: !84)
!2955 = !DILocation(line: 2789, column: 31, scope: !2953)
!2956 = !DILocalVariable(name: "factor", arg: 2, scope: !2953, file: !76, line: 2789, type: !84)
!2957 = !DILocation(line: 2789, column: 42, scope: !2953)
!2958 = !DILocalVariable(name: "u32Temp1", scope: !2953, file: !76, line: 2791, type: !740)
!2959 = !DILocation(line: 2791, column: 6, scope: !2953)
!2960 = !DILocalVariable(name: "u32Temp2", scope: !2953, file: !76, line: 2791, type: !740)
!2961 = !DILocation(line: 2791, column: 17, scope: !2953)
!2962 = !DILocalVariable(name: "u32Temp3", scope: !2953, file: !76, line: 2791, type: !740)
!2963 = !DILocation(line: 2791, column: 26, scope: !2953)
!2964 = !DILocalVariable(name: "u8SignBit", scope: !2953, file: !76, line: 2792, type: !29)
!2965 = !DILocation(line: 2792, column: 5, scope: !2953)
!2966 = !DILocation(line: 2794, column: 7, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2953, file: !76, line: 2794, column: 5)
!2968 = !DILocation(line: 2794, column: 12, scope: !2967)
!2969 = !DILocation(line: 2794, column: 16, scope: !2967)
!2970 = !DILocation(line: 2794, column: 36, scope: !2967)
!2971 = !DILocation(line: 2794, column: 41, scope: !2967)
!2972 = !DILocation(line: 2794, column: 45, scope: !2967)
!2973 = !DILocation(line: 2796, column: 13, scope: !2974)
!2974 = distinct !DILexicalBlock(scope: !2967, file: !76, line: 2795, column: 2)
!2975 = !DILocation(line: 2797, column: 2, scope: !2974)
!2976 = !DILocation(line: 2800, column: 13, scope: !2977)
!2977 = distinct !DILexicalBlock(scope: !2967, file: !76, line: 2799, column: 2)
!2978 = !DILocation(line: 2803, column: 5, scope: !2979)
!2979 = distinct !DILexicalBlock(scope: !2953, file: !76, line: 2803, column: 5)
!2980 = !DILocation(line: 2803, column: 10, scope: !2979)
!2981 = !DILocation(line: 2803, column: 5, scope: !2953)
!2982 = !DILocation(line: 2805, column: 15, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2979, file: !76, line: 2804, column: 2)
!2984 = !DILocation(line: 2805, column: 14, scope: !2983)
!2985 = !DILocation(line: 2805, column: 12, scope: !2983)
!2986 = !DILocation(line: 2806, column: 2, scope: !2983)
!2987 = !DILocation(line: 2809, column: 14, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2979, file: !76, line: 2808, column: 2)
!2989 = !DILocation(line: 2809, column: 12, scope: !2988)
!2990 = !DILocation(line: 2812, column: 5, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2953, file: !76, line: 2812, column: 5)
!2992 = !DILocation(line: 2812, column: 11, scope: !2991)
!2993 = !DILocation(line: 2812, column: 5, scope: !2953)
!2994 = !DILocation(line: 2814, column: 15, scope: !2995)
!2995 = distinct !DILexicalBlock(scope: !2991, file: !76, line: 2813, column: 2)
!2996 = !DILocation(line: 2814, column: 14, scope: !2995)
!2997 = !DILocation(line: 2814, column: 12, scope: !2995)
!2998 = !DILocation(line: 2815, column: 2, scope: !2995)
!2999 = !DILocation(line: 2818, column: 14, scope: !3000)
!3000 = distinct !DILexicalBlock(scope: !2991, file: !76, line: 2817, column: 2)
!3001 = !DILocation(line: 2818, column: 12, scope: !3000)
!3002 = !DILocation(line: 2821, column: 25, scope: !2953)
!3003 = !DILocation(line: 2821, column: 35, scope: !2953)
!3004 = !DILocation(line: 2821, column: 13, scope: !2953)
!3005 = !DILocation(line: 2821, column: 11, scope: !2953)
!3006 = !DILocation(line: 2822, column: 5, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !2953, file: !76, line: 2822, column: 5)
!3008 = !DILocation(line: 2822, column: 15, scope: !3007)
!3009 = !DILocation(line: 2822, column: 5, scope: !2953)
!3010 = !DILocation(line: 2824, column: 10, scope: !3011)
!3011 = distinct !DILexicalBlock(scope: !3007, file: !76, line: 2823, column: 2)
!3012 = !DILocation(line: 2824, column: 3, scope: !3011)
!3013 = !DILocation(line: 2828, column: 11, scope: !3014)
!3014 = distinct !DILexicalBlock(scope: !3007, file: !76, line: 2827, column: 2)
!3015 = !DILocation(line: 2828, column: 10, scope: !3014)
!3016 = !DILocation(line: 2828, column: 3, scope: !3014)
!3017 = !DILocation(line: 2830, column: 1, scope: !2953)
!3018 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !76, file: !76, line: 2847, type: !3019, scopeLine: 2848, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3019 = !DISubroutineType(types: !3020)
!3020 = !{!740, !740, !29}
!3021 = !DILocalVariable(name: "value", arg: 1, scope: !3018, file: !76, line: 2847, type: !740)
!3022 = !DILocation(line: 2847, column: 29, scope: !3018)
!3023 = !DILocalVariable(name: "factor", arg: 2, scope: !3018, file: !76, line: 2847, type: !29)
!3024 = !DILocation(line: 2847, column: 39, scope: !3018)
!3025 = !DILocalVariable(name: "u32Temp1", scope: !3018, file: !76, line: 2849, type: !740)
!3026 = !DILocation(line: 2849, column: 6, scope: !3018)
!3027 = !DILocalVariable(name: "u32Temp2", scope: !3018, file: !76, line: 2849, type: !740)
!3028 = !DILocation(line: 2849, column: 20, scope: !3018)
!3029 = !DILocation(line: 2850, column: 13, scope: !3018)
!3030 = !DILocation(line: 2850, column: 21, scope: !3018)
!3031 = !DILocation(line: 2850, column: 19, scope: !3018)
!3032 = !DILocation(line: 2850, column: 11, scope: !3018)
!3033 = !DILocation(line: 2851, column: 25, scope: !3018)
!3034 = !DILocation(line: 2851, column: 32, scope: !3018)
!3035 = !DILocation(line: 2851, column: 13, scope: !3018)
!3036 = !DILocation(line: 2851, column: 11, scope: !3018)
!3037 = !DILocation(line: 2852, column: 14, scope: !3018)
!3038 = !DILocation(line: 2852, column: 23, scope: !3018)
!3039 = !DILocation(line: 2852, column: 11, scope: !3018)
!3040 = !DILocation(line: 2853, column: 14, scope: !3018)
!3041 = !DILocation(line: 2853, column: 23, scope: !3018)
!3042 = !DILocation(line: 2853, column: 11, scope: !3018)
!3043 = !DILocation(line: 2854, column: 9, scope: !3018)
!3044 = !DILocation(line: 2854, column: 2, scope: !3018)
!3045 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !76, file: !76, line: 2873, type: !3019, scopeLine: 2874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3046 = !DILocalVariable(name: "value", arg: 1, scope: !3045, file: !76, line: 2873, type: !740)
!3047 = !DILocation(line: 2873, column: 29, scope: !3045)
!3048 = !DILocalVariable(name: "factor", arg: 2, scope: !3045, file: !76, line: 2873, type: !29)
!3049 = !DILocation(line: 2873, column: 39, scope: !3045)
!3050 = !DILocalVariable(name: "u32Temp1", scope: !3045, file: !76, line: 2875, type: !740)
!3051 = !DILocation(line: 2875, column: 6, scope: !3045)
!3052 = !DILocalVariable(name: "u32Temp2", scope: !3045, file: !76, line: 2875, type: !740)
!3053 = !DILocation(line: 2875, column: 20, scope: !3045)
!3054 = !DILocation(line: 2876, column: 13, scope: !3045)
!3055 = !DILocation(line: 2876, column: 21, scope: !3045)
!3056 = !DILocation(line: 2876, column: 19, scope: !3045)
!3057 = !DILocation(line: 2876, column: 11, scope: !3045)
!3058 = !DILocation(line: 2877, column: 25, scope: !3045)
!3059 = !DILocation(line: 2877, column: 32, scope: !3045)
!3060 = !DILocation(line: 2877, column: 13, scope: !3045)
!3061 = !DILocation(line: 2877, column: 11, scope: !3045)
!3062 = !DILocation(line: 2878, column: 14, scope: !3045)
!3063 = !DILocation(line: 2878, column: 23, scope: !3045)
!3064 = !DILocation(line: 2878, column: 11, scope: !3045)
!3065 = !DILocation(line: 2879, column: 14, scope: !3045)
!3066 = !DILocation(line: 2879, column: 23, scope: !3045)
!3067 = !DILocation(line: 2879, column: 11, scope: !3045)
!3068 = !DILocation(line: 2880, column: 6, scope: !3069)
!3069 = distinct !DILexicalBlock(scope: !3045, file: !76, line: 2880, column: 5)
!3070 = !DILocation(line: 2880, column: 14, scope: !3069)
!3071 = !DILocation(line: 2880, column: 19, scope: !3069)
!3072 = !DILocation(line: 2880, column: 5, scope: !3045)
!3073 = !DILocation(line: 2882, column: 10, scope: !3074)
!3074 = distinct !DILexicalBlock(scope: !3069, file: !76, line: 2881, column: 2)
!3075 = !DILocation(line: 2882, column: 3, scope: !3074)
!3076 = !DILocation(line: 2886, column: 3, scope: !3077)
!3077 = distinct !DILexicalBlock(scope: !3069, file: !76, line: 2885, column: 2)
!3078 = !DILocation(line: 2889, column: 1, scope: !3045)
!3079 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !76, file: !76, line: 2908, type: !3080, scopeLine: 2909, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3080 = !DISubroutineType(types: !3081)
!3081 = !{!740, !740, !20}
!3082 = !DILocalVariable(name: "value", arg: 1, scope: !3079, file: !76, line: 2908, type: !740)
!3083 = !DILocation(line: 2908, column: 29, scope: !3079)
!3084 = !DILocalVariable(name: "factor", arg: 2, scope: !3079, file: !76, line: 2908, type: !20)
!3085 = !DILocation(line: 2908, column: 39, scope: !3079)
!3086 = !DILocalVariable(name: "u32Temp1", scope: !3079, file: !76, line: 2910, type: !740)
!3087 = !DILocation(line: 2910, column: 6, scope: !3079)
!3088 = !DILocalVariable(name: "u32Temp2", scope: !3079, file: !76, line: 2910, type: !740)
!3089 = !DILocation(line: 2910, column: 20, scope: !3079)
!3090 = !DILocation(line: 2911, column: 5, scope: !3091)
!3091 = distinct !DILexicalBlock(scope: !3079, file: !76, line: 2911, column: 5)
!3092 = !DILocation(line: 2911, column: 12, scope: !3091)
!3093 = !DILocation(line: 2911, column: 5, scope: !3079)
!3094 = !DILocation(line: 2914, column: 14, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3091, file: !76, line: 2912, column: 2)
!3096 = !DILocation(line: 2914, column: 22, scope: !3095)
!3097 = !DILocation(line: 2914, column: 20, scope: !3095)
!3098 = !DILocation(line: 2914, column: 12, scope: !3095)
!3099 = !DILocation(line: 2915, column: 26, scope: !3095)
!3100 = !DILocation(line: 2915, column: 33, scope: !3095)
!3101 = !DILocation(line: 2915, column: 14, scope: !3095)
!3102 = !DILocation(line: 2915, column: 12, scope: !3095)
!3103 = !DILocation(line: 2916, column: 14, scope: !3095)
!3104 = !DILocation(line: 2916, column: 23, scope: !3095)
!3105 = !DILocation(line: 2916, column: 12, scope: !3095)
!3106 = !DILocation(line: 2917, column: 15, scope: !3095)
!3107 = !DILocation(line: 2917, column: 24, scope: !3095)
!3108 = !DILocation(line: 2917, column: 12, scope: !3095)
!3109 = !DILocation(line: 2918, column: 10, scope: !3095)
!3110 = !DILocation(line: 2918, column: 3, scope: !3095)
!3111 = !DILocation(line: 2922, column: 3, scope: !3112)
!3112 = distinct !DILexicalBlock(scope: !3091, file: !76, line: 2921, column: 2)
!3113 = !DILocation(line: 2924, column: 1, scope: !3079)
!3114 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !76, file: !76, line: 2943, type: !3080, scopeLine: 2944, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3115 = !DILocalVariable(name: "value", arg: 1, scope: !3114, file: !76, line: 2943, type: !740)
!3116 = !DILocation(line: 2943, column: 29, scope: !3114)
!3117 = !DILocalVariable(name: "factor", arg: 2, scope: !3114, file: !76, line: 2943, type: !20)
!3118 = !DILocation(line: 2943, column: 39, scope: !3114)
!3119 = !DILocalVariable(name: "u32Temp1", scope: !3114, file: !76, line: 2945, type: !740)
!3120 = !DILocation(line: 2945, column: 6, scope: !3114)
!3121 = !DILocalVariable(name: "u32Temp2", scope: !3114, file: !76, line: 2945, type: !740)
!3122 = !DILocation(line: 2945, column: 20, scope: !3114)
!3123 = !DILocation(line: 2946, column: 5, scope: !3124)
!3124 = distinct !DILexicalBlock(scope: !3114, file: !76, line: 2946, column: 5)
!3125 = !DILocation(line: 2946, column: 12, scope: !3124)
!3126 = !DILocation(line: 2946, column: 5, scope: !3114)
!3127 = !DILocation(line: 2948, column: 3, scope: !3128)
!3128 = distinct !DILexicalBlock(scope: !3124, file: !76, line: 2947, column: 2)
!3129 = !DILocation(line: 2952, column: 14, scope: !3130)
!3130 = distinct !DILexicalBlock(scope: !3124, file: !76, line: 2951, column: 2)
!3131 = !DILocation(line: 2952, column: 22, scope: !3130)
!3132 = !DILocation(line: 2952, column: 20, scope: !3130)
!3133 = !DILocation(line: 2952, column: 12, scope: !3130)
!3134 = !DILocation(line: 2953, column: 26, scope: !3130)
!3135 = !DILocation(line: 2953, column: 33, scope: !3130)
!3136 = !DILocation(line: 2953, column: 14, scope: !3130)
!3137 = !DILocation(line: 2953, column: 12, scope: !3130)
!3138 = !DILocation(line: 2954, column: 14, scope: !3130)
!3139 = !DILocation(line: 2954, column: 23, scope: !3130)
!3140 = !DILocation(line: 2954, column: 12, scope: !3130)
!3141 = !DILocation(line: 2955, column: 15, scope: !3130)
!3142 = !DILocation(line: 2955, column: 24, scope: !3130)
!3143 = !DILocation(line: 2955, column: 12, scope: !3130)
!3144 = !DILocation(line: 2956, column: 7, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !3130, file: !76, line: 2956, column: 6)
!3146 = !DILocation(line: 2956, column: 16, scope: !3145)
!3147 = !DILocation(line: 2956, column: 22, scope: !3145)
!3148 = !DILocation(line: 2956, column: 6, scope: !3130)
!3149 = !DILocation(line: 2958, column: 11, scope: !3150)
!3150 = distinct !DILexicalBlock(scope: !3145, file: !76, line: 2957, column: 3)
!3151 = !DILocation(line: 2958, column: 4, scope: !3150)
!3152 = !DILocation(line: 2962, column: 4, scope: !3153)
!3153 = distinct !DILexicalBlock(scope: !3145, file: !76, line: 2961, column: 3)
!3154 = !DILocation(line: 2965, column: 1, scope: !3114)
!3155 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !76, file: !76, line: 2987, type: !305, scopeLine: 2988, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3156 = !DILocalVariable(name: "value", arg: 1, scope: !3155, file: !76, line: 2987, type: !25)
!3157 = !DILocation(line: 2987, column: 33, scope: !3155)
!3158 = !DILocalVariable(name: "factor", arg: 2, scope: !3155, file: !76, line: 2987, type: !25)
!3159 = !DILocation(line: 2987, column: 44, scope: !3155)
!3160 = !DILocation(line: 2989, column: 40, scope: !3155)
!3161 = !DILocation(line: 2989, column: 46, scope: !3155)
!3162 = !DILocation(line: 2989, column: 9, scope: !3155)
!3163 = !DILocation(line: 2989, column: 2, scope: !3155)
!3164 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !76, file: !76, line: 3011, type: !305, scopeLine: 3012, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3165 = !DILocalVariable(name: "value", arg: 1, scope: !3164, file: !76, line: 3011, type: !25)
!3166 = !DILocation(line: 3011, column: 33, scope: !3164)
!3167 = !DILocalVariable(name: "factor", arg: 2, scope: !3164, file: !76, line: 3011, type: !25)
!3168 = !DILocation(line: 3011, column: 44, scope: !3164)
!3169 = !DILocation(line: 3013, column: 41, scope: !3164)
!3170 = !DILocation(line: 3013, column: 47, scope: !3164)
!3171 = !DILocation(line: 3013, column: 10, scope: !3164)
!3172 = !DILocation(line: 3013, column: 3, scope: !3164)
!3173 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !76, file: !76, line: 3036, type: !305, scopeLine: 3037, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3174 = !DILocalVariable(name: "value", arg: 1, scope: !3173, file: !76, line: 3036, type: !25)
!3175 = !DILocation(line: 3036, column: 32, scope: !3173)
!3176 = !DILocalVariable(name: "factor", arg: 2, scope: !3173, file: !76, line: 3036, type: !25)
!3177 = !DILocation(line: 3036, column: 43, scope: !3173)
!3178 = !DILocation(line: 3038, column: 41, scope: !3173)
!3179 = !DILocation(line: 3038, column: 47, scope: !3173)
!3180 = !DILocation(line: 3038, column: 10, scope: !3173)
!3181 = !DILocation(line: 3038, column: 3, scope: !3173)
!3182 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !76, file: !76, line: 3061, type: !305, scopeLine: 3062, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3183 = !DILocalVariable(name: "value", arg: 1, scope: !3182, file: !76, line: 3061, type: !25)
!3184 = !DILocation(line: 3061, column: 34, scope: !3182)
!3185 = !DILocalVariable(name: "factor", arg: 2, scope: !3182, file: !76, line: 3061, type: !25)
!3186 = !DILocation(line: 3061, column: 45, scope: !3182)
!3187 = !DILocation(line: 3063, column: 44, scope: !3182)
!3188 = !DILocation(line: 3063, column: 50, scope: !3182)
!3189 = !DILocation(line: 3063, column: 10, scope: !3182)
!3190 = !DILocation(line: 3063, column: 3, scope: !3182)
!3191 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !76, file: !76, line: 3086, type: !305, scopeLine: 3087, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3192 = !DILocalVariable(name: "value", arg: 1, scope: !3191, file: !76, line: 3086, type: !25)
!3193 = !DILocation(line: 3086, column: 33, scope: !3191)
!3194 = !DILocalVariable(name: "factor", arg: 2, scope: !3191, file: !76, line: 3086, type: !25)
!3195 = !DILocation(line: 3086, column: 44, scope: !3191)
!3196 = !DILocation(line: 3088, column: 44, scope: !3191)
!3197 = !DILocation(line: 3088, column: 50, scope: !3191)
!3198 = !DILocation(line: 3088, column: 10, scope: !3191)
!3199 = !DILocation(line: 3088, column: 3, scope: !3191)
!3200 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !76, file: !76, line: 3111, type: !305, scopeLine: 3112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3201 = !DILocalVariable(name: "value", arg: 1, scope: !3200, file: !76, line: 3111, type: !25)
!3202 = !DILocation(line: 3111, column: 31, scope: !3200)
!3203 = !DILocalVariable(name: "factor", arg: 2, scope: !3200, file: !76, line: 3111, type: !25)
!3204 = !DILocation(line: 3111, column: 42, scope: !3200)
!3205 = !DILocation(line: 3113, column: 44, scope: !3200)
!3206 = !DILocation(line: 3113, column: 50, scope: !3200)
!3207 = !DILocation(line: 3113, column: 10, scope: !3200)
!3208 = !DILocation(line: 3113, column: 3, scope: !3200)
!3209 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !76, file: !76, line: 3136, type: !305, scopeLine: 3137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3210 = !DILocalVariable(name: "value", arg: 1, scope: !3209, file: !76, line: 3136, type: !25)
!3211 = !DILocation(line: 3136, column: 33, scope: !3209)
!3212 = !DILocalVariable(name: "factor", arg: 2, scope: !3209, file: !76, line: 3136, type: !25)
!3213 = !DILocation(line: 3136, column: 44, scope: !3209)
!3214 = !DILocation(line: 3138, column: 44, scope: !3209)
!3215 = !DILocation(line: 3138, column: 50, scope: !3209)
!3216 = !DILocation(line: 3138, column: 10, scope: !3209)
!3217 = !DILocation(line: 3138, column: 3, scope: !3209)
!3218 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !76, file: !76, line: 3161, type: !305, scopeLine: 3162, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3219 = !DILocalVariable(name: "value", arg: 1, scope: !3218, file: !76, line: 3161, type: !25)
!3220 = !DILocation(line: 3161, column: 32, scope: !3218)
!3221 = !DILocalVariable(name: "factor", arg: 2, scope: !3218, file: !76, line: 3161, type: !25)
!3222 = !DILocation(line: 3161, column: 43, scope: !3218)
!3223 = !DILocation(line: 3163, column: 44, scope: !3218)
!3224 = !DILocation(line: 3163, column: 50, scope: !3218)
!3225 = !DILocation(line: 3163, column: 10, scope: !3218)
!3226 = !DILocation(line: 3163, column: 3, scope: !3218)
!3227 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !76, file: !76, line: 3185, type: !305, scopeLine: 3186, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3228 = !DILocalVariable(name: "value", arg: 1, scope: !3227, file: !76, line: 3185, type: !25)
!3229 = !DILocation(line: 3185, column: 31, scope: !3227)
!3230 = !DILocalVariable(name: "factor", arg: 2, scope: !3227, file: !76, line: 3185, type: !25)
!3231 = !DILocation(line: 3185, column: 42, scope: !3227)
!3232 = !DILocation(line: 3187, column: 44, scope: !3227)
!3233 = !DILocation(line: 3187, column: 50, scope: !3227)
!3234 = !DILocation(line: 3187, column: 10, scope: !3227)
!3235 = !DILocation(line: 3187, column: 3, scope: !3227)
!3236 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !76, file: !76, line: 3209, type: !305, scopeLine: 3210, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3237 = !DILocalVariable(name: "value", arg: 1, scope: !3236, file: !76, line: 3209, type: !25)
!3238 = !DILocation(line: 3209, column: 30, scope: !3236)
!3239 = !DILocalVariable(name: "factor", arg: 2, scope: !3236, file: !76, line: 3209, type: !25)
!3240 = !DILocation(line: 3209, column: 41, scope: !3236)
!3241 = !DILocation(line: 3211, column: 44, scope: !3236)
!3242 = !DILocation(line: 3211, column: 50, scope: !3236)
!3243 = !DILocation(line: 3211, column: 10, scope: !3236)
!3244 = !DILocation(line: 3211, column: 3, scope: !3236)
!3245 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !76, file: !76, line: 3233, type: !305, scopeLine: 3234, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3246 = !DILocalVariable(name: "value", arg: 1, scope: !3245, file: !76, line: 3233, type: !25)
!3247 = !DILocation(line: 3233, column: 33, scope: !3245)
!3248 = !DILocalVariable(name: "factor", arg: 2, scope: !3245, file: !76, line: 3233, type: !25)
!3249 = !DILocation(line: 3233, column: 44, scope: !3245)
!3250 = !DILocation(line: 3235, column: 44, scope: !3245)
!3251 = !DILocation(line: 3235, column: 50, scope: !3245)
!3252 = !DILocation(line: 3235, column: 10, scope: !3245)
!3253 = !DILocation(line: 3235, column: 3, scope: !3245)
!3254 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !76, file: !76, line: 3257, type: !305, scopeLine: 3258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3255 = !DILocalVariable(name: "value", arg: 1, scope: !3254, file: !76, line: 3257, type: !25)
!3256 = !DILocation(line: 3257, column: 32, scope: !3254)
!3257 = !DILocalVariable(name: "factor", arg: 2, scope: !3254, file: !76, line: 3257, type: !25)
!3258 = !DILocation(line: 3257, column: 43, scope: !3254)
!3259 = !DILocation(line: 3259, column: 44, scope: !3254)
!3260 = !DILocation(line: 3259, column: 50, scope: !3254)
!3261 = !DILocation(line: 3259, column: 10, scope: !3254)
!3262 = !DILocation(line: 3259, column: 3, scope: !3254)
!3263 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !76, file: !76, line: 3281, type: !305, scopeLine: 3282, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3264 = !DILocalVariable(name: "value", arg: 1, scope: !3263, file: !76, line: 3281, type: !25)
!3265 = !DILocation(line: 3281, column: 31, scope: !3263)
!3266 = !DILocalVariable(name: "factor", arg: 2, scope: !3263, file: !76, line: 3281, type: !25)
!3267 = !DILocation(line: 3281, column: 42, scope: !3263)
!3268 = !DILocation(line: 3283, column: 44, scope: !3263)
!3269 = !DILocation(line: 3283, column: 50, scope: !3263)
!3270 = !DILocation(line: 3283, column: 10, scope: !3263)
!3271 = !DILocation(line: 3283, column: 3, scope: !3263)
!3272 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !76, file: !76, line: 3305, type: !305, scopeLine: 3306, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3273 = !DILocalVariable(name: "value", arg: 1, scope: !3272, file: !76, line: 3305, type: !25)
!3274 = !DILocation(line: 3305, column: 30, scope: !3272)
!3275 = !DILocalVariable(name: "factor", arg: 2, scope: !3272, file: !76, line: 3305, type: !25)
!3276 = !DILocation(line: 3305, column: 41, scope: !3272)
!3277 = !DILocation(line: 3307, column: 44, scope: !3272)
!3278 = !DILocation(line: 3307, column: 50, scope: !3272)
!3279 = !DILocation(line: 3307, column: 10, scope: !3272)
!3280 = !DILocation(line: 3307, column: 3, scope: !3272)
!3281 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !76, file: !76, line: 3328, type: !394, scopeLine: 3329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3282 = !DILocalVariable(name: "value", arg: 1, scope: !3281, file: !76, line: 3328, type: !25)
!3283 = !DILocation(line: 3328, column: 33, scope: !3281)
!3284 = !DILocalVariable(name: "factor", arg: 2, scope: !3281, file: !76, line: 3328, type: !34)
!3285 = !DILocation(line: 3328, column: 44, scope: !3281)
!3286 = !DILocation(line: 3330, column: 41, scope: !3281)
!3287 = !DILocation(line: 3330, column: 47, scope: !3281)
!3288 = !DILocation(line: 3330, column: 10, scope: !3281)
!3289 = !DILocation(line: 3330, column: 3, scope: !3281)
!3290 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !76, file: !76, line: 3351, type: !394, scopeLine: 3352, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3291 = !DILocalVariable(name: "value", arg: 1, scope: !3290, file: !76, line: 3351, type: !25)
!3292 = !DILocation(line: 3351, column: 32, scope: !3290)
!3293 = !DILocalVariable(name: "factor", arg: 2, scope: !3290, file: !76, line: 3351, type: !34)
!3294 = !DILocation(line: 3351, column: 43, scope: !3290)
!3295 = !DILocation(line: 3353, column: 33, scope: !3290)
!3296 = !DILocation(line: 3353, column: 39, scope: !3290)
!3297 = !DILocation(line: 3353, column: 2, scope: !3290)
!3298 = !DILocation(line: 3354, column: 1, scope: !3290)
!3299 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !76, file: !76, line: 3375, type: !394, scopeLine: 3376, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3300 = !DILocalVariable(name: "value", arg: 1, scope: !3299, file: !76, line: 3375, type: !25)
!3301 = !DILocation(line: 3375, column: 31, scope: !3299)
!3302 = !DILocalVariable(name: "factor", arg: 2, scope: !3299, file: !76, line: 3375, type: !34)
!3303 = !DILocation(line: 3375, column: 42, scope: !3299)
!3304 = !DILocation(line: 3377, column: 41, scope: !3299)
!3305 = !DILocation(line: 3377, column: 47, scope: !3299)
!3306 = !DILocation(line: 3377, column: 10, scope: !3299)
!3307 = !DILocation(line: 3377, column: 3, scope: !3299)
!3308 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !76, file: !76, line: 3400, type: !394, scopeLine: 3401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3309 = !DILocalVariable(name: "value", arg: 1, scope: !3308, file: !76, line: 3400, type: !25)
!3310 = !DILocation(line: 3400, column: 33, scope: !3308)
!3311 = !DILocalVariable(name: "factor", arg: 2, scope: !3308, file: !76, line: 3400, type: !34)
!3312 = !DILocation(line: 3400, column: 44, scope: !3308)
!3313 = !DILocation(line: 3402, column: 44, scope: !3308)
!3314 = !DILocation(line: 3402, column: 50, scope: !3308)
!3315 = !DILocation(line: 3402, column: 10, scope: !3308)
!3316 = !DILocation(line: 3402, column: 3, scope: !3308)
!3317 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !76, file: !76, line: 3425, type: !394, scopeLine: 3426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3318 = !DILocalVariable(name: "value", arg: 1, scope: !3317, file: !76, line: 3425, type: !25)
!3319 = !DILocation(line: 3425, column: 32, scope: !3317)
!3320 = !DILocalVariable(name: "factor", arg: 2, scope: !3317, file: !76, line: 3425, type: !34)
!3321 = !DILocation(line: 3425, column: 43, scope: !3317)
!3322 = !DILocation(line: 3427, column: 44, scope: !3317)
!3323 = !DILocation(line: 3427, column: 50, scope: !3317)
!3324 = !DILocation(line: 3427, column: 10, scope: !3317)
!3325 = !DILocation(line: 3427, column: 3, scope: !3317)
!3326 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !76, file: !76, line: 3450, type: !394, scopeLine: 3451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3327 = !DILocalVariable(name: "value", arg: 1, scope: !3326, file: !76, line: 3450, type: !25)
!3328 = !DILocation(line: 3450, column: 31, scope: !3326)
!3329 = !DILocalVariable(name: "factor", arg: 2, scope: !3326, file: !76, line: 3450, type: !34)
!3330 = !DILocation(line: 3450, column: 42, scope: !3326)
!3331 = !DILocation(line: 3452, column: 44, scope: !3326)
!3332 = !DILocation(line: 3452, column: 50, scope: !3326)
!3333 = !DILocation(line: 3452, column: 10, scope: !3326)
!3334 = !DILocation(line: 3452, column: 3, scope: !3326)
!3335 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !76, file: !76, line: 3475, type: !394, scopeLine: 3476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3336 = !DILocalVariable(name: "value", arg: 1, scope: !3335, file: !76, line: 3475, type: !25)
!3337 = !DILocation(line: 3475, column: 33, scope: !3335)
!3338 = !DILocalVariable(name: "factor", arg: 2, scope: !3335, file: !76, line: 3475, type: !34)
!3339 = !DILocation(line: 3475, column: 44, scope: !3335)
!3340 = !DILocation(line: 3477, column: 44, scope: !3335)
!3341 = !DILocation(line: 3477, column: 50, scope: !3335)
!3342 = !DILocation(line: 3477, column: 10, scope: !3335)
!3343 = !DILocation(line: 3477, column: 3, scope: !3335)
!3344 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !76, file: !76, line: 3500, type: !394, scopeLine: 3501, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3345 = !DILocalVariable(name: "value", arg: 1, scope: !3344, file: !76, line: 3500, type: !25)
!3346 = !DILocation(line: 3500, column: 32, scope: !3344)
!3347 = !DILocalVariable(name: "factor", arg: 2, scope: !3344, file: !76, line: 3500, type: !34)
!3348 = !DILocation(line: 3500, column: 43, scope: !3344)
!3349 = !DILocation(line: 3502, column: 44, scope: !3344)
!3350 = !DILocation(line: 3502, column: 50, scope: !3344)
!3351 = !DILocation(line: 3502, column: 10, scope: !3344)
!3352 = !DILocation(line: 3502, column: 3, scope: !3344)
!3353 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !76, file: !76, line: 3524, type: !394, scopeLine: 3525, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3354 = !DILocalVariable(name: "value", arg: 1, scope: !3353, file: !76, line: 3524, type: !25)
!3355 = !DILocation(line: 3524, column: 31, scope: !3353)
!3356 = !DILocalVariable(name: "factor", arg: 2, scope: !3353, file: !76, line: 3524, type: !34)
!3357 = !DILocation(line: 3524, column: 42, scope: !3353)
!3358 = !DILocation(line: 3526, column: 44, scope: !3353)
!3359 = !DILocation(line: 3526, column: 50, scope: !3353)
!3360 = !DILocation(line: 3526, column: 10, scope: !3353)
!3361 = !DILocation(line: 3526, column: 3, scope: !3353)
!3362 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !76, file: !76, line: 3548, type: !394, scopeLine: 3549, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3363 = !DILocalVariable(name: "value", arg: 1, scope: !3362, file: !76, line: 3548, type: !25)
!3364 = !DILocation(line: 3548, column: 30, scope: !3362)
!3365 = !DILocalVariable(name: "factor", arg: 2, scope: !3362, file: !76, line: 3548, type: !34)
!3366 = !DILocation(line: 3548, column: 41, scope: !3362)
!3367 = !DILocation(line: 3550, column: 44, scope: !3362)
!3368 = !DILocation(line: 3550, column: 50, scope: !3362)
!3369 = !DILocation(line: 3550, column: 10, scope: !3362)
!3370 = !DILocation(line: 3550, column: 3, scope: !3362)
!3371 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !76, file: !76, line: 3572, type: !394, scopeLine: 3573, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3372 = !DILocalVariable(name: "value", arg: 1, scope: !3371, file: !76, line: 3572, type: !25)
!3373 = !DILocation(line: 3572, column: 33, scope: !3371)
!3374 = !DILocalVariable(name: "factor", arg: 2, scope: !3371, file: !76, line: 3572, type: !34)
!3375 = !DILocation(line: 3572, column: 44, scope: !3371)
!3376 = !DILocation(line: 3574, column: 44, scope: !3371)
!3377 = !DILocation(line: 3574, column: 50, scope: !3371)
!3378 = !DILocation(line: 3574, column: 10, scope: !3371)
!3379 = !DILocation(line: 3574, column: 3, scope: !3371)
!3380 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !76, file: !76, line: 3596, type: !394, scopeLine: 3597, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3381 = !DILocalVariable(name: "value", arg: 1, scope: !3380, file: !76, line: 3596, type: !25)
!3382 = !DILocation(line: 3596, column: 32, scope: !3380)
!3383 = !DILocalVariable(name: "factor", arg: 2, scope: !3380, file: !76, line: 3596, type: !34)
!3384 = !DILocation(line: 3596, column: 43, scope: !3380)
!3385 = !DILocation(line: 3598, column: 44, scope: !3380)
!3386 = !DILocation(line: 3598, column: 50, scope: !3380)
!3387 = !DILocation(line: 3598, column: 10, scope: !3380)
!3388 = !DILocation(line: 3598, column: 3, scope: !3380)
!3389 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !76, file: !76, line: 3620, type: !394, scopeLine: 3621, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3390 = !DILocalVariable(name: "value", arg: 1, scope: !3389, file: !76, line: 3620, type: !25)
!3391 = !DILocation(line: 3620, column: 31, scope: !3389)
!3392 = !DILocalVariable(name: "factor", arg: 2, scope: !3389, file: !76, line: 3620, type: !34)
!3393 = !DILocation(line: 3620, column: 42, scope: !3389)
!3394 = !DILocation(line: 3622, column: 44, scope: !3389)
!3395 = !DILocation(line: 3622, column: 50, scope: !3389)
!3396 = !DILocation(line: 3622, column: 10, scope: !3389)
!3397 = !DILocation(line: 3622, column: 3, scope: !3389)
!3398 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !76, file: !76, line: 3644, type: !394, scopeLine: 3645, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3399 = !DILocalVariable(name: "value", arg: 1, scope: !3398, file: !76, line: 3644, type: !25)
!3400 = !DILocation(line: 3644, column: 30, scope: !3398)
!3401 = !DILocalVariable(name: "factor", arg: 2, scope: !3398, file: !76, line: 3644, type: !34)
!3402 = !DILocation(line: 3644, column: 41, scope: !3398)
!3403 = !DILocation(line: 3646, column: 44, scope: !3398)
!3404 = !DILocation(line: 3646, column: 50, scope: !3398)
!3405 = !DILocation(line: 3646, column: 10, scope: !3398)
!3406 = !DILocation(line: 3646, column: 3, scope: !3398)
!3407 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !76, file: !76, line: 3666, type: !479, scopeLine: 3667, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3408 = !DILocalVariable(name: "value", arg: 1, scope: !3407, file: !76, line: 3666, type: !25)
!3409 = !DILocation(line: 3666, column: 32, scope: !3407)
!3410 = !DILocalVariable(name: "factor", arg: 2, scope: !3407, file: !76, line: 3666, type: !29)
!3411 = !DILocation(line: 3666, column: 42, scope: !3407)
!3412 = !DILocation(line: 3668, column: 40, scope: !3407)
!3413 = !DILocation(line: 3668, column: 58, scope: !3407)
!3414 = !DILocation(line: 3668, column: 52, scope: !3407)
!3415 = !DILocation(line: 3668, column: 66, scope: !3407)
!3416 = !DILocation(line: 3668, column: 46, scope: !3407)
!3417 = !DILocation(line: 3668, column: 10, scope: !3407)
!3418 = !DILocation(line: 3668, column: 3, scope: !3407)
!3419 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !76, file: !76, line: 3688, type: !479, scopeLine: 3689, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3420 = !DILocalVariable(name: "value", arg: 1, scope: !3419, file: !76, line: 3688, type: !25)
!3421 = !DILocation(line: 3688, column: 31, scope: !3419)
!3422 = !DILocalVariable(name: "factor", arg: 2, scope: !3419, file: !76, line: 3688, type: !29)
!3423 = !DILocation(line: 3688, column: 41, scope: !3419)
!3424 = !DILocation(line: 3690, column: 40, scope: !3419)
!3425 = !DILocation(line: 3690, column: 58, scope: !3419)
!3426 = !DILocation(line: 3690, column: 52, scope: !3419)
!3427 = !DILocation(line: 3690, column: 66, scope: !3419)
!3428 = !DILocation(line: 3690, column: 46, scope: !3419)
!3429 = !DILocation(line: 3690, column: 10, scope: !3419)
!3430 = !DILocation(line: 3690, column: 3, scope: !3419)
!3431 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !76, file: !76, line: 3711, type: !479, scopeLine: 3712, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3432 = !DILocalVariable(name: "value", arg: 1, scope: !3431, file: !76, line: 3711, type: !25)
!3433 = !DILocation(line: 3711, column: 30, scope: !3431)
!3434 = !DILocalVariable(name: "factor", arg: 2, scope: !3431, file: !76, line: 3711, type: !29)
!3435 = !DILocation(line: 3711, column: 40, scope: !3431)
!3436 = !DILocation(line: 3713, column: 40, scope: !3431)
!3437 = !DILocation(line: 3713, column: 58, scope: !3431)
!3438 = !DILocation(line: 3713, column: 52, scope: !3431)
!3439 = !DILocation(line: 3713, column: 66, scope: !3431)
!3440 = !DILocation(line: 3713, column: 46, scope: !3431)
!3441 = !DILocation(line: 3713, column: 10, scope: !3431)
!3442 = !DILocation(line: 3713, column: 3, scope: !3431)
!3443 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !76, file: !76, line: 3734, type: !479, scopeLine: 3735, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3444 = !DILocalVariable(name: "value", arg: 1, scope: !3443, file: !76, line: 3734, type: !25)
!3445 = !DILocation(line: 3734, column: 31, scope: !3443)
!3446 = !DILocalVariable(name: "factor", arg: 2, scope: !3443, file: !76, line: 3734, type: !29)
!3447 = !DILocation(line: 3734, column: 41, scope: !3443)
!3448 = !DILocation(line: 3736, column: 43, scope: !3443)
!3449 = !DILocation(line: 3736, column: 61, scope: !3443)
!3450 = !DILocation(line: 3736, column: 55, scope: !3443)
!3451 = !DILocation(line: 3736, column: 69, scope: !3443)
!3452 = !DILocation(line: 3736, column: 49, scope: !3443)
!3453 = !DILocation(line: 3736, column: 10, scope: !3443)
!3454 = !DILocation(line: 3736, column: 3, scope: !3443)
!3455 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !76, file: !76, line: 3757, type: !479, scopeLine: 3758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3456 = !DILocalVariable(name: "value", arg: 1, scope: !3455, file: !76, line: 3757, type: !25)
!3457 = !DILocation(line: 3757, column: 30, scope: !3455)
!3458 = !DILocalVariable(name: "factor", arg: 2, scope: !3455, file: !76, line: 3757, type: !29)
!3459 = !DILocation(line: 3757, column: 40, scope: !3455)
!3460 = !DILocation(line: 3759, column: 43, scope: !3455)
!3461 = !DILocation(line: 3759, column: 61, scope: !3455)
!3462 = !DILocation(line: 3759, column: 55, scope: !3455)
!3463 = !DILocation(line: 3759, column: 69, scope: !3455)
!3464 = !DILocation(line: 3759, column: 49, scope: !3455)
!3465 = !DILocation(line: 3759, column: 10, scope: !3455)
!3466 = !DILocation(line: 3759, column: 3, scope: !3455)
!3467 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !76, file: !76, line: 3779, type: !479, scopeLine: 3780, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3468 = !DILocalVariable(name: "value", arg: 1, scope: !3467, file: !76, line: 3779, type: !25)
!3469 = !DILocation(line: 3779, column: 30, scope: !3467)
!3470 = !DILocalVariable(name: "factor", arg: 2, scope: !3467, file: !76, line: 3779, type: !29)
!3471 = !DILocation(line: 3779, column: 40, scope: !3467)
!3472 = !DILocation(line: 3781, column: 43, scope: !3467)
!3473 = !DILocation(line: 3781, column: 61, scope: !3467)
!3474 = !DILocation(line: 3781, column: 55, scope: !3467)
!3475 = !DILocation(line: 3781, column: 69, scope: !3467)
!3476 = !DILocation(line: 3781, column: 49, scope: !3467)
!3477 = !DILocation(line: 3781, column: 10, scope: !3467)
!3478 = !DILocation(line: 3781, column: 3, scope: !3467)
!3479 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !76, file: !76, line: 3801, type: !479, scopeLine: 3802, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3480 = !DILocalVariable(name: "value", arg: 1, scope: !3479, file: !76, line: 3801, type: !25)
!3481 = !DILocation(line: 3801, column: 29, scope: !3479)
!3482 = !DILocalVariable(name: "factor", arg: 2, scope: !3479, file: !76, line: 3801, type: !29)
!3483 = !DILocation(line: 3801, column: 39, scope: !3479)
!3484 = !DILocation(line: 3803, column: 43, scope: !3479)
!3485 = !DILocation(line: 3803, column: 61, scope: !3479)
!3486 = !DILocation(line: 3803, column: 55, scope: !3479)
!3487 = !DILocation(line: 3803, column: 69, scope: !3479)
!3488 = !DILocation(line: 3803, column: 49, scope: !3479)
!3489 = !DILocation(line: 3803, column: 10, scope: !3479)
!3490 = !DILocation(line: 3803, column: 3, scope: !3479)
!3491 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !76, file: !76, line: 3823, type: !479, scopeLine: 3824, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3492 = !DILocalVariable(name: "value", arg: 1, scope: !3491, file: !76, line: 3823, type: !25)
!3493 = !DILocation(line: 3823, column: 30, scope: !3491)
!3494 = !DILocalVariable(name: "factor", arg: 2, scope: !3491, file: !76, line: 3823, type: !29)
!3495 = !DILocation(line: 3823, column: 40, scope: !3491)
!3496 = !DILocation(line: 3825, column: 43, scope: !3491)
!3497 = !DILocation(line: 3825, column: 61, scope: !3491)
!3498 = !DILocation(line: 3825, column: 55, scope: !3491)
!3499 = !DILocation(line: 3825, column: 69, scope: !3491)
!3500 = !DILocation(line: 3825, column: 49, scope: !3491)
!3501 = !DILocation(line: 3825, column: 10, scope: !3491)
!3502 = !DILocation(line: 3825, column: 3, scope: !3491)
!3503 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !76, file: !76, line: 3845, type: !479, scopeLine: 3846, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3504 = !DILocalVariable(name: "value", arg: 1, scope: !3503, file: !76, line: 3845, type: !25)
!3505 = !DILocation(line: 3845, column: 29, scope: !3503)
!3506 = !DILocalVariable(name: "factor", arg: 2, scope: !3503, file: !76, line: 3845, type: !29)
!3507 = !DILocation(line: 3845, column: 39, scope: !3503)
!3508 = !DILocation(line: 3847, column: 43, scope: !3503)
!3509 = !DILocation(line: 3847, column: 61, scope: !3503)
!3510 = !DILocation(line: 3847, column: 55, scope: !3503)
!3511 = !DILocation(line: 3847, column: 69, scope: !3503)
!3512 = !DILocation(line: 3847, column: 49, scope: !3503)
!3513 = !DILocation(line: 3847, column: 10, scope: !3503)
!3514 = !DILocation(line: 3847, column: 3, scope: !3503)
!3515 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !76, file: !76, line: 3869, type: !1874, scopeLine: 3870, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3516 = !DILocalVariable(name: "value", arg: 1, scope: !3515, file: !76, line: 3869, type: !84)
!3517 = !DILocation(line: 3869, column: 31, scope: !3515)
!3518 = !DILocalVariable(name: "factor", arg: 2, scope: !3515, file: !76, line: 3869, type: !25)
!3519 = !DILocation(line: 3869, column: 42, scope: !3515)
!3520 = !DILocation(line: 3871, column: 41, scope: !3515)
!3521 = !DILocation(line: 3871, column: 47, scope: !3515)
!3522 = !DILocation(line: 3871, column: 10, scope: !3515)
!3523 = !DILocation(line: 3871, column: 3, scope: !3515)
!3524 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !76, file: !76, line: 5065, type: !3525, scopeLine: 5066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3525 = !DISubroutineType(types: !3526)
!3526 = !{!84, !84, !25, !740}
!3527 = !DILocalVariable(name: "value", arg: 1, scope: !3524, file: !76, line: 5065, type: !84)
!3528 = !DILocation(line: 5065, column: 40, scope: !3524)
!3529 = !DILocalVariable(name: "factor", arg: 2, scope: !3524, file: !76, line: 5065, type: !25)
!3530 = !DILocation(line: 5065, column: 51, scope: !3524)
!3531 = !DILocalVariable(name: "count", arg: 3, scope: !3524, file: !76, line: 5065, type: !740)
!3532 = !DILocation(line: 5065, column: 63, scope: !3524)
!3533 = !DILocalVariable(name: "u32Temp1", scope: !3524, file: !76, line: 5067, type: !740)
!3534 = !DILocation(line: 5067, column: 6, scope: !3524)
!3535 = !DILocalVariable(name: "u32Temp2", scope: !3524, file: !76, line: 5067, type: !740)
!3536 = !DILocation(line: 5067, column: 17, scope: !3524)
!3537 = !DILocalVariable(name: "u32Temp3", scope: !3524, file: !76, line: 5067, type: !740)
!3538 = !DILocation(line: 5067, column: 26, scope: !3524)
!3539 = !DILocalVariable(name: "u32Temp4", scope: !3524, file: !76, line: 5067, type: !740)
!3540 = !DILocation(line: 5067, column: 35, scope: !3524)
!3541 = !DILocalVariable(name: "u8SignBit", scope: !3524, file: !76, line: 5068, type: !29)
!3542 = !DILocation(line: 5068, column: 5, scope: !3524)
!3543 = !DILocation(line: 5070, column: 7, scope: !3544)
!3544 = distinct !DILexicalBlock(scope: !3524, file: !76, line: 5070, column: 5)
!3545 = !DILocation(line: 5070, column: 12, scope: !3544)
!3546 = !DILocation(line: 5070, column: 16, scope: !3544)
!3547 = !DILocation(line: 5070, column: 20, scope: !3544)
!3548 = !DILocation(line: 5070, column: 26, scope: !3544)
!3549 = !DILocation(line: 5070, column: 31, scope: !3544)
!3550 = !DILocation(line: 5070, column: 36, scope: !3544)
!3551 = !DILocation(line: 5070, column: 41, scope: !3544)
!3552 = !DILocation(line: 5070, column: 45, scope: !3544)
!3553 = !DILocation(line: 5070, column: 49, scope: !3544)
!3554 = !DILocation(line: 5070, column: 55, scope: !3544)
!3555 = !DILocation(line: 5070, column: 5, scope: !3524)
!3556 = !DILocation(line: 5072, column: 13, scope: !3557)
!3557 = distinct !DILexicalBlock(scope: !3544, file: !76, line: 5071, column: 2)
!3558 = !DILocation(line: 5073, column: 2, scope: !3557)
!3559 = !DILocation(line: 5076, column: 13, scope: !3560)
!3560 = distinct !DILexicalBlock(scope: !3544, file: !76, line: 5075, column: 2)
!3561 = !DILocation(line: 5079, column: 5, scope: !3562)
!3562 = distinct !DILexicalBlock(scope: !3524, file: !76, line: 5079, column: 5)
!3563 = !DILocation(line: 5079, column: 10, scope: !3562)
!3564 = !DILocation(line: 5079, column: 5, scope: !3524)
!3565 = !DILocation(line: 5081, column: 15, scope: !3566)
!3566 = distinct !DILexicalBlock(scope: !3562, file: !76, line: 5080, column: 2)
!3567 = !DILocation(line: 5081, column: 14, scope: !3566)
!3568 = !DILocation(line: 5081, column: 12, scope: !3566)
!3569 = !DILocation(line: 5082, column: 2, scope: !3566)
!3570 = !DILocation(line: 5085, column: 14, scope: !3571)
!3571 = distinct !DILexicalBlock(scope: !3562, file: !76, line: 5084, column: 2)
!3572 = !DILocation(line: 5085, column: 12, scope: !3571)
!3573 = !DILocation(line: 5088, column: 5, scope: !3574)
!3574 = distinct !DILexicalBlock(scope: !3524, file: !76, line: 5088, column: 5)
!3575 = !DILocation(line: 5088, column: 11, scope: !3574)
!3576 = !DILocation(line: 5088, column: 5, scope: !3524)
!3577 = !DILocation(line: 5090, column: 15, scope: !3578)
!3578 = distinct !DILexicalBlock(scope: !3574, file: !76, line: 5089, column: 2)
!3579 = !DILocation(line: 5090, column: 14, scope: !3578)
!3580 = !DILocation(line: 5090, column: 12, scope: !3578)
!3581 = !DILocation(line: 5091, column: 2, scope: !3578)
!3582 = !DILocation(line: 5094, column: 14, scope: !3583)
!3583 = distinct !DILexicalBlock(scope: !3574, file: !76, line: 5093, column: 2)
!3584 = !DILocation(line: 5094, column: 12, scope: !3583)
!3585 = !DILocation(line: 5097, column: 13, scope: !3524)
!3586 = !DILocation(line: 5097, column: 24, scope: !3524)
!3587 = !DILocation(line: 5097, column: 22, scope: !3524)
!3588 = !DILocation(line: 5097, column: 11, scope: !3524)
!3589 = !DILocation(line: 5098, column: 25, scope: !3524)
!3590 = !DILocation(line: 5098, column: 35, scope: !3524)
!3591 = !DILocation(line: 5098, column: 13, scope: !3524)
!3592 = !DILocation(line: 5098, column: 11, scope: !3524)
!3593 = !DILocation(line: 5099, column: 13, scope: !3524)
!3594 = !DILocation(line: 5099, column: 25, scope: !3524)
!3595 = !DILocation(line: 5099, column: 22, scope: !3524)
!3596 = !DILocation(line: 5099, column: 11, scope: !3524)
!3597 = !DILocation(line: 5100, column: 14, scope: !3524)
!3598 = !DILocation(line: 5100, column: 30, scope: !3524)
!3599 = !DILocation(line: 5100, column: 29, scope: !3524)
!3600 = !DILocation(line: 5100, column: 23, scope: !3524)
!3601 = !DILocation(line: 5100, column: 11, scope: !3524)
!3602 = !DILocation(line: 5101, column: 6, scope: !3603)
!3603 = distinct !DILexicalBlock(scope: !3524, file: !76, line: 5101, column: 5)
!3604 = !DILocation(line: 5101, column: 16, scope: !3603)
!3605 = !DILocation(line: 5101, column: 14, scope: !3603)
!3606 = !DILocation(line: 5101, column: 22, scope: !3603)
!3607 = !DILocation(line: 5101, column: 5, scope: !3524)
!3608 = !DILocation(line: 5103, column: 6, scope: !3609)
!3609 = distinct !DILexicalBlock(scope: !3610, file: !76, line: 5103, column: 6)
!3610 = distinct !DILexicalBlock(scope: !3603, file: !76, line: 5102, column: 2)
!3611 = !DILocation(line: 5103, column: 16, scope: !3609)
!3612 = !DILocation(line: 5103, column: 6, scope: !3610)
!3613 = !DILocation(line: 5105, column: 7, scope: !3614)
!3614 = distinct !DILexicalBlock(scope: !3615, file: !76, line: 5105, column: 7)
!3615 = distinct !DILexicalBlock(scope: !3609, file: !76, line: 5104, column: 3)
!3616 = !DILocation(line: 5105, column: 15, scope: !3614)
!3617 = !DILocation(line: 5105, column: 7, scope: !3615)
!3618 = !DILocation(line: 5106, column: 12, scope: !3614)
!3619 = !DILocation(line: 5106, column: 5, scope: !3614)
!3620 = !DILocation(line: 5108, column: 5, scope: !3614)
!3621 = !DILocation(line: 5112, column: 7, scope: !3622)
!3622 = distinct !DILexicalBlock(scope: !3623, file: !76, line: 5112, column: 7)
!3623 = distinct !DILexicalBlock(scope: !3609, file: !76, line: 5111, column: 3)
!3624 = !DILocation(line: 5112, column: 15, scope: !3622)
!3625 = !DILocation(line: 5112, column: 7, scope: !3623)
!3626 = !DILocation(line: 5113, column: 13, scope: !3622)
!3627 = !DILocation(line: 5113, column: 12, scope: !3622)
!3628 = !DILocation(line: 5113, column: 5, scope: !3622)
!3629 = !DILocation(line: 5115, column: 5, scope: !3622)
!3630 = !DILocation(line: 5120, column: 3, scope: !3631)
!3631 = distinct !DILexicalBlock(scope: !3603, file: !76, line: 5119, column: 2)
!3632 = !DILocation(line: 5122, column: 1, scope: !3524)
!3633 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !76, file: !76, line: 3893, type: !2624, scopeLine: 3894, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3634 = !DILocalVariable(name: "value", arg: 1, scope: !3633, file: !76, line: 3893, type: !84)
!3635 = !DILocation(line: 3893, column: 30, scope: !3633)
!3636 = !DILocalVariable(name: "factor", arg: 2, scope: !3633, file: !76, line: 3893, type: !20)
!3637 = !DILocation(line: 3893, column: 40, scope: !3633)
!3638 = !DILocation(line: 3895, column: 40, scope: !3633)
!3639 = !DILocation(line: 3895, column: 46, scope: !3633)
!3640 = !DILocation(line: 3895, column: 10, scope: !3633)
!3641 = !DILocation(line: 3895, column: 3, scope: !3633)
!3642 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !76, file: !76, line: 5217, type: !3643, scopeLine: 5218, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3643 = !DISubroutineType(types: !3644)
!3644 = !{!84, !84, !20, !740}
!3645 = !DILocalVariable(name: "value", arg: 1, scope: !3642, file: !76, line: 5217, type: !84)
!3646 = !DILocation(line: 5217, column: 39, scope: !3642)
!3647 = !DILocalVariable(name: "factor", arg: 2, scope: !3642, file: !76, line: 5217, type: !20)
!3648 = !DILocation(line: 5217, column: 49, scope: !3642)
!3649 = !DILocalVariable(name: "count", arg: 3, scope: !3642, file: !76, line: 5217, type: !740)
!3650 = !DILocation(line: 5217, column: 61, scope: !3642)
!3651 = !DILocalVariable(name: "u32Temp1", scope: !3642, file: !76, line: 5219, type: !740)
!3652 = !DILocation(line: 5219, column: 6, scope: !3642)
!3653 = !DILocalVariable(name: "u32Temp2", scope: !3642, file: !76, line: 5219, type: !740)
!3654 = !DILocation(line: 5219, column: 17, scope: !3642)
!3655 = !DILocalVariable(name: "u32Temp3", scope: !3642, file: !76, line: 5219, type: !740)
!3656 = !DILocation(line: 5219, column: 26, scope: !3642)
!3657 = !DILocalVariable(name: "u32Temp4", scope: !3642, file: !76, line: 5219, type: !740)
!3658 = !DILocation(line: 5219, column: 35, scope: !3642)
!3659 = !DILocalVariable(name: "u8SignBit", scope: !3642, file: !76, line: 5220, type: !29)
!3660 = !DILocation(line: 5220, column: 5, scope: !3642)
!3661 = !DILocation(line: 5222, column: 7, scope: !3662)
!3662 = distinct !DILexicalBlock(scope: !3642, file: !76, line: 5222, column: 5)
!3663 = !DILocation(line: 5222, column: 12, scope: !3662)
!3664 = !DILocation(line: 5222, column: 16, scope: !3662)
!3665 = !DILocation(line: 5222, column: 20, scope: !3662)
!3666 = !DILocation(line: 5222, column: 26, scope: !3662)
!3667 = !DILocation(line: 5222, column: 31, scope: !3662)
!3668 = !DILocation(line: 5222, column: 36, scope: !3662)
!3669 = !DILocation(line: 5222, column: 41, scope: !3662)
!3670 = !DILocation(line: 5222, column: 45, scope: !3662)
!3671 = !DILocation(line: 5222, column: 49, scope: !3662)
!3672 = !DILocation(line: 5222, column: 55, scope: !3662)
!3673 = !DILocation(line: 5222, column: 5, scope: !3642)
!3674 = !DILocation(line: 5224, column: 13, scope: !3675)
!3675 = distinct !DILexicalBlock(scope: !3662, file: !76, line: 5223, column: 2)
!3676 = !DILocation(line: 5225, column: 2, scope: !3675)
!3677 = !DILocation(line: 5228, column: 13, scope: !3678)
!3678 = distinct !DILexicalBlock(scope: !3662, file: !76, line: 5227, column: 2)
!3679 = !DILocation(line: 5231, column: 5, scope: !3680)
!3680 = distinct !DILexicalBlock(scope: !3642, file: !76, line: 5231, column: 5)
!3681 = !DILocation(line: 5231, column: 10, scope: !3680)
!3682 = !DILocation(line: 5231, column: 5, scope: !3642)
!3683 = !DILocation(line: 5233, column: 15, scope: !3684)
!3684 = distinct !DILexicalBlock(scope: !3680, file: !76, line: 5232, column: 2)
!3685 = !DILocation(line: 5233, column: 14, scope: !3684)
!3686 = !DILocation(line: 5233, column: 12, scope: !3684)
!3687 = !DILocation(line: 5234, column: 2, scope: !3684)
!3688 = !DILocation(line: 5237, column: 14, scope: !3689)
!3689 = distinct !DILexicalBlock(scope: !3680, file: !76, line: 5236, column: 2)
!3690 = !DILocation(line: 5237, column: 12, scope: !3689)
!3691 = !DILocation(line: 5240, column: 5, scope: !3692)
!3692 = distinct !DILexicalBlock(scope: !3642, file: !76, line: 5240, column: 5)
!3693 = !DILocation(line: 5240, column: 11, scope: !3692)
!3694 = !DILocation(line: 5240, column: 5, scope: !3642)
!3695 = !DILocation(line: 5242, column: 15, scope: !3696)
!3696 = distinct !DILexicalBlock(scope: !3692, file: !76, line: 5241, column: 2)
!3697 = !DILocation(line: 5242, column: 14, scope: !3696)
!3698 = !DILocation(line: 5242, column: 12, scope: !3696)
!3699 = !DILocation(line: 5243, column: 2, scope: !3696)
!3700 = !DILocation(line: 5246, column: 14, scope: !3701)
!3701 = distinct !DILexicalBlock(scope: !3692, file: !76, line: 5245, column: 2)
!3702 = !DILocation(line: 5246, column: 12, scope: !3701)
!3703 = !DILocation(line: 5249, column: 13, scope: !3642)
!3704 = !DILocation(line: 5249, column: 24, scope: !3642)
!3705 = !DILocation(line: 5249, column: 22, scope: !3642)
!3706 = !DILocation(line: 5249, column: 11, scope: !3642)
!3707 = !DILocation(line: 5250, column: 25, scope: !3642)
!3708 = !DILocation(line: 5250, column: 35, scope: !3642)
!3709 = !DILocation(line: 5250, column: 13, scope: !3642)
!3710 = !DILocation(line: 5250, column: 11, scope: !3642)
!3711 = !DILocation(line: 5251, column: 13, scope: !3642)
!3712 = !DILocation(line: 5251, column: 25, scope: !3642)
!3713 = !DILocation(line: 5251, column: 22, scope: !3642)
!3714 = !DILocation(line: 5251, column: 11, scope: !3642)
!3715 = !DILocation(line: 5252, column: 14, scope: !3642)
!3716 = !DILocation(line: 5252, column: 30, scope: !3642)
!3717 = !DILocation(line: 5252, column: 29, scope: !3642)
!3718 = !DILocation(line: 5252, column: 23, scope: !3642)
!3719 = !DILocation(line: 5252, column: 11, scope: !3642)
!3720 = !DILocation(line: 5253, column: 6, scope: !3721)
!3721 = distinct !DILexicalBlock(scope: !3642, file: !76, line: 5253, column: 5)
!3722 = !DILocation(line: 5253, column: 16, scope: !3721)
!3723 = !DILocation(line: 5253, column: 14, scope: !3721)
!3724 = !DILocation(line: 5253, column: 22, scope: !3721)
!3725 = !DILocation(line: 5253, column: 5, scope: !3642)
!3726 = !DILocation(line: 5255, column: 6, scope: !3727)
!3727 = distinct !DILexicalBlock(scope: !3728, file: !76, line: 5255, column: 6)
!3728 = distinct !DILexicalBlock(scope: !3721, file: !76, line: 5254, column: 2)
!3729 = !DILocation(line: 5255, column: 16, scope: !3727)
!3730 = !DILocation(line: 5255, column: 6, scope: !3728)
!3731 = !DILocation(line: 5257, column: 7, scope: !3732)
!3732 = distinct !DILexicalBlock(scope: !3733, file: !76, line: 5257, column: 7)
!3733 = distinct !DILexicalBlock(scope: !3727, file: !76, line: 5256, column: 3)
!3734 = !DILocation(line: 5257, column: 15, scope: !3732)
!3735 = !DILocation(line: 5257, column: 7, scope: !3733)
!3736 = !DILocation(line: 5258, column: 12, scope: !3732)
!3737 = !DILocation(line: 5258, column: 5, scope: !3732)
!3738 = !DILocation(line: 5260, column: 5, scope: !3732)
!3739 = !DILocation(line: 5264, column: 7, scope: !3740)
!3740 = distinct !DILexicalBlock(scope: !3741, file: !76, line: 5264, column: 7)
!3741 = distinct !DILexicalBlock(scope: !3727, file: !76, line: 5263, column: 3)
!3742 = !DILocation(line: 5264, column: 15, scope: !3740)
!3743 = !DILocation(line: 5264, column: 7, scope: !3741)
!3744 = !DILocation(line: 5265, column: 13, scope: !3740)
!3745 = !DILocation(line: 5265, column: 12, scope: !3740)
!3746 = !DILocation(line: 5265, column: 5, scope: !3740)
!3747 = !DILocation(line: 5267, column: 5, scope: !3740)
!3748 = !DILocation(line: 5272, column: 3, scope: !3749)
!3749 = distinct !DILexicalBlock(scope: !3721, file: !76, line: 5271, column: 2)
!3750 = !DILocation(line: 5274, column: 1, scope: !3642)
!3751 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !76, file: !76, line: 3917, type: !779, scopeLine: 3918, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3752 = !DILocalVariable(name: "value", arg: 1, scope: !3751, file: !76, line: 3917, type: !84)
!3753 = !DILocation(line: 3917, column: 31, scope: !3751)
!3754 = !DILocalVariable(name: "factor", arg: 2, scope: !3751, file: !76, line: 3917, type: !34)
!3755 = !DILocation(line: 3917, column: 42, scope: !3751)
!3756 = !DILocation(line: 3919, column: 41, scope: !3751)
!3757 = !DILocation(line: 3919, column: 47, scope: !3751)
!3758 = !DILocation(line: 3919, column: 10, scope: !3751)
!3759 = !DILocation(line: 3919, column: 3, scope: !3751)
!3760 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !76, file: !76, line: 5141, type: !3761, scopeLine: 5142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3761 = !DISubroutineType(types: !3762)
!3762 = !{!84, !84, !34, !740}
!3763 = !DILocalVariable(name: "value", arg: 1, scope: !3760, file: !76, line: 5141, type: !84)
!3764 = !DILocation(line: 5141, column: 40, scope: !3760)
!3765 = !DILocalVariable(name: "factor", arg: 2, scope: !3760, file: !76, line: 5141, type: !34)
!3766 = !DILocation(line: 5141, column: 50, scope: !3760)
!3767 = !DILocalVariable(name: "count", arg: 3, scope: !3760, file: !76, line: 5141, type: !740)
!3768 = !DILocation(line: 5141, column: 62, scope: !3760)
!3769 = !DILocalVariable(name: "u32Temp1", scope: !3760, file: !76, line: 5143, type: !740)
!3770 = !DILocation(line: 5143, column: 6, scope: !3760)
!3771 = !DILocalVariable(name: "u32Temp2", scope: !3760, file: !76, line: 5143, type: !740)
!3772 = !DILocation(line: 5143, column: 17, scope: !3760)
!3773 = !DILocalVariable(name: "u32Temp3", scope: !3760, file: !76, line: 5143, type: !740)
!3774 = !DILocation(line: 5143, column: 26, scope: !3760)
!3775 = !DILocalVariable(name: "u32Temp4", scope: !3760, file: !76, line: 5143, type: !740)
!3776 = !DILocation(line: 5143, column: 35, scope: !3760)
!3777 = !DILocalVariable(name: "u8SignBit", scope: !3760, file: !76, line: 5144, type: !29)
!3778 = !DILocation(line: 5144, column: 5, scope: !3760)
!3779 = !DILocation(line: 5146, column: 7, scope: !3780)
!3780 = distinct !DILexicalBlock(scope: !3760, file: !76, line: 5146, column: 5)
!3781 = !DILocation(line: 5146, column: 12, scope: !3780)
!3782 = !DILocation(line: 5146, column: 16, scope: !3780)
!3783 = !DILocation(line: 5146, column: 20, scope: !3780)
!3784 = !DILocation(line: 5146, column: 26, scope: !3780)
!3785 = !DILocation(line: 5146, column: 31, scope: !3780)
!3786 = !DILocation(line: 5146, column: 36, scope: !3780)
!3787 = !DILocation(line: 5146, column: 41, scope: !3780)
!3788 = !DILocation(line: 5146, column: 45, scope: !3780)
!3789 = !DILocation(line: 5146, column: 49, scope: !3780)
!3790 = !DILocation(line: 5146, column: 55, scope: !3780)
!3791 = !DILocation(line: 5146, column: 5, scope: !3760)
!3792 = !DILocation(line: 5148, column: 13, scope: !3793)
!3793 = distinct !DILexicalBlock(scope: !3780, file: !76, line: 5147, column: 2)
!3794 = !DILocation(line: 5149, column: 2, scope: !3793)
!3795 = !DILocation(line: 5152, column: 13, scope: !3796)
!3796 = distinct !DILexicalBlock(scope: !3780, file: !76, line: 5151, column: 2)
!3797 = !DILocation(line: 5155, column: 5, scope: !3798)
!3798 = distinct !DILexicalBlock(scope: !3760, file: !76, line: 5155, column: 5)
!3799 = !DILocation(line: 5155, column: 10, scope: !3798)
!3800 = !DILocation(line: 5155, column: 5, scope: !3760)
!3801 = !DILocation(line: 5157, column: 15, scope: !3802)
!3802 = distinct !DILexicalBlock(scope: !3798, file: !76, line: 5156, column: 2)
!3803 = !DILocation(line: 5157, column: 14, scope: !3802)
!3804 = !DILocation(line: 5157, column: 12, scope: !3802)
!3805 = !DILocation(line: 5158, column: 2, scope: !3802)
!3806 = !DILocation(line: 5161, column: 14, scope: !3807)
!3807 = distinct !DILexicalBlock(scope: !3798, file: !76, line: 5160, column: 2)
!3808 = !DILocation(line: 5161, column: 12, scope: !3807)
!3809 = !DILocation(line: 5164, column: 5, scope: !3810)
!3810 = distinct !DILexicalBlock(scope: !3760, file: !76, line: 5164, column: 5)
!3811 = !DILocation(line: 5164, column: 11, scope: !3810)
!3812 = !DILocation(line: 5164, column: 5, scope: !3760)
!3813 = !DILocation(line: 5166, column: 15, scope: !3814)
!3814 = distinct !DILexicalBlock(scope: !3810, file: !76, line: 5165, column: 2)
!3815 = !DILocation(line: 5166, column: 14, scope: !3814)
!3816 = !DILocation(line: 5166, column: 12, scope: !3814)
!3817 = !DILocation(line: 5167, column: 2, scope: !3814)
!3818 = !DILocation(line: 5170, column: 14, scope: !3819)
!3819 = distinct !DILexicalBlock(scope: !3810, file: !76, line: 5169, column: 2)
!3820 = !DILocation(line: 5170, column: 12, scope: !3819)
!3821 = !DILocation(line: 5173, column: 13, scope: !3760)
!3822 = !DILocation(line: 5173, column: 24, scope: !3760)
!3823 = !DILocation(line: 5173, column: 22, scope: !3760)
!3824 = !DILocation(line: 5173, column: 11, scope: !3760)
!3825 = !DILocation(line: 5174, column: 25, scope: !3760)
!3826 = !DILocation(line: 5174, column: 35, scope: !3760)
!3827 = !DILocation(line: 5174, column: 13, scope: !3760)
!3828 = !DILocation(line: 5174, column: 11, scope: !3760)
!3829 = !DILocation(line: 5175, column: 13, scope: !3760)
!3830 = !DILocation(line: 5175, column: 25, scope: !3760)
!3831 = !DILocation(line: 5175, column: 22, scope: !3760)
!3832 = !DILocation(line: 5175, column: 11, scope: !3760)
!3833 = !DILocation(line: 5176, column: 14, scope: !3760)
!3834 = !DILocation(line: 5176, column: 30, scope: !3760)
!3835 = !DILocation(line: 5176, column: 29, scope: !3760)
!3836 = !DILocation(line: 5176, column: 23, scope: !3760)
!3837 = !DILocation(line: 5176, column: 11, scope: !3760)
!3838 = !DILocation(line: 5177, column: 6, scope: !3839)
!3839 = distinct !DILexicalBlock(scope: !3760, file: !76, line: 5177, column: 5)
!3840 = !DILocation(line: 5177, column: 16, scope: !3839)
!3841 = !DILocation(line: 5177, column: 14, scope: !3839)
!3842 = !DILocation(line: 5177, column: 22, scope: !3839)
!3843 = !DILocation(line: 5177, column: 5, scope: !3760)
!3844 = !DILocation(line: 5179, column: 6, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3846, file: !76, line: 5179, column: 6)
!3846 = distinct !DILexicalBlock(scope: !3839, file: !76, line: 5178, column: 2)
!3847 = !DILocation(line: 5179, column: 16, scope: !3845)
!3848 = !DILocation(line: 5179, column: 6, scope: !3846)
!3849 = !DILocation(line: 5181, column: 7, scope: !3850)
!3850 = distinct !DILexicalBlock(scope: !3851, file: !76, line: 5181, column: 7)
!3851 = distinct !DILexicalBlock(scope: !3845, file: !76, line: 5180, column: 3)
!3852 = !DILocation(line: 5181, column: 15, scope: !3850)
!3853 = !DILocation(line: 5181, column: 7, scope: !3851)
!3854 = !DILocation(line: 5182, column: 12, scope: !3850)
!3855 = !DILocation(line: 5182, column: 5, scope: !3850)
!3856 = !DILocation(line: 5184, column: 5, scope: !3850)
!3857 = !DILocation(line: 5188, column: 7, scope: !3858)
!3858 = distinct !DILexicalBlock(scope: !3859, file: !76, line: 5188, column: 7)
!3859 = distinct !DILexicalBlock(scope: !3845, file: !76, line: 5187, column: 3)
!3860 = !DILocation(line: 5188, column: 15, scope: !3858)
!3861 = !DILocation(line: 5188, column: 7, scope: !3859)
!3862 = !DILocation(line: 5189, column: 13, scope: !3858)
!3863 = !DILocation(line: 5189, column: 12, scope: !3858)
!3864 = !DILocation(line: 5189, column: 5, scope: !3858)
!3865 = !DILocation(line: 5191, column: 5, scope: !3858)
!3866 = !DILocation(line: 5196, column: 3, scope: !3867)
!3867 = distinct !DILexicalBlock(scope: !3839, file: !76, line: 5195, column: 2)
!3868 = !DILocation(line: 5198, column: 1, scope: !3760)
!3869 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !76, file: !76, line: 3941, type: !2348, scopeLine: 3942, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3870 = !DILocalVariable(name: "value", arg: 1, scope: !3869, file: !76, line: 3941, type: !84)
!3871 = !DILocation(line: 3941, column: 30, scope: !3869)
!3872 = !DILocalVariable(name: "factor", arg: 2, scope: !3869, file: !76, line: 3941, type: !29)
!3873 = !DILocation(line: 3941, column: 40, scope: !3869)
!3874 = !DILocation(line: 3943, column: 40, scope: !3869)
!3875 = !DILocation(line: 3943, column: 46, scope: !3869)
!3876 = !DILocation(line: 3943, column: 10, scope: !3869)
!3877 = !DILocation(line: 3943, column: 3, scope: !3869)
!3878 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !76, file: !76, line: 5536, type: !3879, scopeLine: 5537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3879 = !DISubroutineType(types: !3880)
!3880 = !{!84, !84, !29, !740}
!3881 = !DILocalVariable(name: "value", arg: 1, scope: !3878, file: !76, line: 5536, type: !84)
!3882 = !DILocation(line: 5536, column: 39, scope: !3878)
!3883 = !DILocalVariable(name: "factor", arg: 2, scope: !3878, file: !76, line: 5536, type: !29)
!3884 = !DILocation(line: 5536, column: 49, scope: !3878)
!3885 = !DILocalVariable(name: "count", arg: 3, scope: !3878, file: !76, line: 5536, type: !740)
!3886 = !DILocation(line: 5536, column: 61, scope: !3878)
!3887 = !DILocalVariable(name: "u32Temp1", scope: !3878, file: !76, line: 5538, type: !740)
!3888 = !DILocation(line: 5538, column: 6, scope: !3878)
!3889 = !DILocalVariable(name: "u32Temp2", scope: !3878, file: !76, line: 5538, type: !740)
!3890 = !DILocation(line: 5538, column: 17, scope: !3878)
!3891 = !DILocalVariable(name: "u32Temp3", scope: !3878, file: !76, line: 5538, type: !740)
!3892 = !DILocation(line: 5538, column: 26, scope: !3878)
!3893 = !DILocalVariable(name: "u8SignBit", scope: !3878, file: !76, line: 5539, type: !29)
!3894 = !DILocation(line: 5539, column: 5, scope: !3878)
!3895 = !DILocation(line: 5541, column: 5, scope: !3896)
!3896 = distinct !DILexicalBlock(scope: !3878, file: !76, line: 5541, column: 5)
!3897 = !DILocation(line: 5541, column: 10, scope: !3896)
!3898 = !DILocation(line: 5541, column: 5, scope: !3878)
!3899 = !DILocation(line: 5543, column: 13, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3896, file: !76, line: 5542, column: 2)
!3901 = !DILocation(line: 5544, column: 15, scope: !3900)
!3902 = !DILocation(line: 5544, column: 14, scope: !3900)
!3903 = !DILocation(line: 5544, column: 12, scope: !3900)
!3904 = !DILocation(line: 5545, column: 2, scope: !3900)
!3905 = !DILocation(line: 5548, column: 13, scope: !3906)
!3906 = distinct !DILexicalBlock(scope: !3896, file: !76, line: 5547, column: 2)
!3907 = !DILocation(line: 5549, column: 14, scope: !3906)
!3908 = !DILocation(line: 5549, column: 12, scope: !3906)
!3909 = !DILocation(line: 5552, column: 13, scope: !3878)
!3910 = !DILocation(line: 5552, column: 24, scope: !3878)
!3911 = !DILocation(line: 5552, column: 22, scope: !3878)
!3912 = !DILocation(line: 5552, column: 11, scope: !3878)
!3913 = !DILocation(line: 5553, column: 25, scope: !3878)
!3914 = !DILocation(line: 5553, column: 34, scope: !3878)
!3915 = !DILocation(line: 5553, column: 13, scope: !3878)
!3916 = !DILocation(line: 5553, column: 11, scope: !3878)
!3917 = !DILocation(line: 5554, column: 13, scope: !3878)
!3918 = !DILocation(line: 5554, column: 25, scope: !3878)
!3919 = !DILocation(line: 5554, column: 22, scope: !3878)
!3920 = !DILocation(line: 5554, column: 11, scope: !3878)
!3921 = !DILocation(line: 5555, column: 14, scope: !3878)
!3922 = !DILocation(line: 5555, column: 30, scope: !3878)
!3923 = !DILocation(line: 5555, column: 29, scope: !3878)
!3924 = !DILocation(line: 5555, column: 23, scope: !3878)
!3925 = !DILocation(line: 5555, column: 11, scope: !3878)
!3926 = !DILocation(line: 5556, column: 6, scope: !3927)
!3927 = distinct !DILexicalBlock(scope: !3878, file: !76, line: 5556, column: 5)
!3928 = !DILocation(line: 5556, column: 16, scope: !3927)
!3929 = !DILocation(line: 5556, column: 14, scope: !3927)
!3930 = !DILocation(line: 5556, column: 22, scope: !3927)
!3931 = !DILocation(line: 5556, column: 5, scope: !3878)
!3932 = !DILocation(line: 5558, column: 6, scope: !3933)
!3933 = distinct !DILexicalBlock(scope: !3934, file: !76, line: 5558, column: 6)
!3934 = distinct !DILexicalBlock(scope: !3927, file: !76, line: 5557, column: 2)
!3935 = !DILocation(line: 5558, column: 16, scope: !3933)
!3936 = !DILocation(line: 5558, column: 6, scope: !3934)
!3937 = !DILocation(line: 5560, column: 7, scope: !3938)
!3938 = distinct !DILexicalBlock(scope: !3939, file: !76, line: 5560, column: 7)
!3939 = distinct !DILexicalBlock(scope: !3933, file: !76, line: 5559, column: 3)
!3940 = !DILocation(line: 5560, column: 15, scope: !3938)
!3941 = !DILocation(line: 5560, column: 7, scope: !3939)
!3942 = !DILocation(line: 5561, column: 12, scope: !3938)
!3943 = !DILocation(line: 5561, column: 5, scope: !3938)
!3944 = !DILocation(line: 5563, column: 5, scope: !3938)
!3945 = !DILocation(line: 5567, column: 7, scope: !3946)
!3946 = distinct !DILexicalBlock(scope: !3947, file: !76, line: 5567, column: 7)
!3947 = distinct !DILexicalBlock(scope: !3933, file: !76, line: 5566, column: 3)
!3948 = !DILocation(line: 5567, column: 15, scope: !3946)
!3949 = !DILocation(line: 5567, column: 7, scope: !3947)
!3950 = !DILocation(line: 5569, column: 13, scope: !3951)
!3951 = distinct !DILexicalBlock(scope: !3946, file: !76, line: 5568, column: 4)
!3952 = !DILocation(line: 5569, column: 12, scope: !3951)
!3953 = !DILocation(line: 5569, column: 5, scope: !3951)
!3954 = !DILocation(line: 5573, column: 5, scope: !3955)
!3955 = distinct !DILexicalBlock(scope: !3946, file: !76, line: 5572, column: 4)
!3956 = !DILocation(line: 5579, column: 6, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3958, file: !76, line: 5579, column: 6)
!3958 = distinct !DILexicalBlock(scope: !3927, file: !76, line: 5578, column: 2)
!3959 = !DILocation(line: 5579, column: 16, scope: !3957)
!3960 = !DILocation(line: 5579, column: 6, scope: !3958)
!3961 = !DILocation(line: 5581, column: 4, scope: !3962)
!3962 = distinct !DILexicalBlock(scope: !3957, file: !76, line: 5580, column: 3)
!3963 = !DILocation(line: 5585, column: 4, scope: !3964)
!3964 = distinct !DILexicalBlock(scope: !3957, file: !76, line: 5584, column: 3)
!3965 = !DILocation(line: 5588, column: 1, scope: !3878)
!3966 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !76, file: !76, line: 3965, type: !163, scopeLine: 3966, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3967 = !DILocalVariable(name: "value", arg: 1, scope: !3966, file: !76, line: 3965, type: !20)
!3968 = !DILocation(line: 3965, column: 28, scope: !3966)
!3969 = !DILocalVariable(name: "factor", arg: 2, scope: !3966, file: !76, line: 3965, type: !29)
!3970 = !DILocation(line: 3965, column: 38, scope: !3966)
!3971 = !DILocation(line: 3967, column: 38, scope: !3966)
!3972 = !DILocation(line: 3967, column: 56, scope: !3966)
!3973 = !DILocation(line: 3967, column: 50, scope: !3966)
!3974 = !DILocation(line: 3967, column: 64, scope: !3966)
!3975 = !DILocation(line: 3967, column: 44, scope: !3966)
!3976 = !DILocation(line: 3967, column: 10, scope: !3966)
!3977 = !DILocation(line: 3967, column: 3, scope: !3966)
!3978 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !76, file: !76, line: 3989, type: !163, scopeLine: 3990, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3979 = !DILocalVariable(name: "value", arg: 1, scope: !3978, file: !76, line: 3989, type: !20)
!3980 = !DILocation(line: 3989, column: 27, scope: !3978)
!3981 = !DILocalVariable(name: "factor", arg: 2, scope: !3978, file: !76, line: 3989, type: !29)
!3982 = !DILocation(line: 3989, column: 37, scope: !3978)
!3983 = !DILocation(line: 3991, column: 38, scope: !3978)
!3984 = !DILocation(line: 3991, column: 56, scope: !3978)
!3985 = !DILocation(line: 3991, column: 50, scope: !3978)
!3986 = !DILocation(line: 3991, column: 64, scope: !3978)
!3987 = !DILocation(line: 3991, column: 44, scope: !3978)
!3988 = !DILocation(line: 3991, column: 10, scope: !3978)
!3989 = !DILocation(line: 3991, column: 3, scope: !3978)
!3990 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !76, file: !76, line: 4014, type: !163, scopeLine: 4015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!3991 = !DILocalVariable(name: "value", arg: 1, scope: !3990, file: !76, line: 4014, type: !20)
!3992 = !DILocation(line: 4014, column: 26, scope: !3990)
!3993 = !DILocalVariable(name: "factor", arg: 2, scope: !3990, file: !76, line: 4014, type: !29)
!3994 = !DILocation(line: 4014, column: 36, scope: !3990)
!3995 = !DILocation(line: 4016, column: 38, scope: !3990)
!3996 = !DILocation(line: 4016, column: 56, scope: !3990)
!3997 = !DILocation(line: 4016, column: 50, scope: !3990)
!3998 = !DILocation(line: 4016, column: 64, scope: !3990)
!3999 = !DILocation(line: 4016, column: 44, scope: !3990)
!4000 = !DILocation(line: 4016, column: 10, scope: !3990)
!4001 = !DILocation(line: 4016, column: 3, scope: !3990)
!4002 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !76, file: !76, line: 4039, type: !163, scopeLine: 4040, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4003 = !DILocalVariable(name: "value", arg: 1, scope: !4002, file: !76, line: 4039, type: !20)
!4004 = !DILocation(line: 4039, column: 27, scope: !4002)
!4005 = !DILocalVariable(name: "factor", arg: 2, scope: !4002, file: !76, line: 4039, type: !29)
!4006 = !DILocation(line: 4039, column: 37, scope: !4002)
!4007 = !DILocation(line: 4041, column: 41, scope: !4002)
!4008 = !DILocation(line: 4041, column: 59, scope: !4002)
!4009 = !DILocation(line: 4041, column: 53, scope: !4002)
!4010 = !DILocation(line: 4041, column: 67, scope: !4002)
!4011 = !DILocation(line: 4041, column: 47, scope: !4002)
!4012 = !DILocation(line: 4041, column: 10, scope: !4002)
!4013 = !DILocation(line: 4041, column: 3, scope: !4002)
!4014 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !76, file: !76, line: 4064, type: !163, scopeLine: 4065, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4015 = !DILocalVariable(name: "value", arg: 1, scope: !4014, file: !76, line: 4064, type: !20)
!4016 = !DILocation(line: 4064, column: 26, scope: !4014)
!4017 = !DILocalVariable(name: "factor", arg: 2, scope: !4014, file: !76, line: 4064, type: !29)
!4018 = !DILocation(line: 4064, column: 36, scope: !4014)
!4019 = !DILocation(line: 4066, column: 41, scope: !4014)
!4020 = !DILocation(line: 4066, column: 59, scope: !4014)
!4021 = !DILocation(line: 4066, column: 53, scope: !4014)
!4022 = !DILocation(line: 4066, column: 67, scope: !4014)
!4023 = !DILocation(line: 4066, column: 47, scope: !4014)
!4024 = !DILocation(line: 4066, column: 10, scope: !4014)
!4025 = !DILocation(line: 4066, column: 3, scope: !4014)
!4026 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !76, file: !76, line: 4088, type: !163, scopeLine: 4089, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4027 = !DILocalVariable(name: "value", arg: 1, scope: !4026, file: !76, line: 4088, type: !20)
!4028 = !DILocation(line: 4088, column: 26, scope: !4026)
!4029 = !DILocalVariable(name: "factor", arg: 2, scope: !4026, file: !76, line: 4088, type: !29)
!4030 = !DILocation(line: 4088, column: 36, scope: !4026)
!4031 = !DILocation(line: 4090, column: 41, scope: !4026)
!4032 = !DILocation(line: 4090, column: 59, scope: !4026)
!4033 = !DILocation(line: 4090, column: 53, scope: !4026)
!4034 = !DILocation(line: 4090, column: 67, scope: !4026)
!4035 = !DILocation(line: 4090, column: 47, scope: !4026)
!4036 = !DILocation(line: 4090, column: 10, scope: !4026)
!4037 = !DILocation(line: 4090, column: 3, scope: !4026)
!4038 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !76, file: !76, line: 4112, type: !163, scopeLine: 4113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4039 = !DILocalVariable(name: "value", arg: 1, scope: !4038, file: !76, line: 4112, type: !20)
!4040 = !DILocation(line: 4112, column: 25, scope: !4038)
!4041 = !DILocalVariable(name: "factor", arg: 2, scope: !4038, file: !76, line: 4112, type: !29)
!4042 = !DILocation(line: 4112, column: 35, scope: !4038)
!4043 = !DILocation(line: 4114, column: 41, scope: !4038)
!4044 = !DILocation(line: 4114, column: 59, scope: !4038)
!4045 = !DILocation(line: 4114, column: 53, scope: !4038)
!4046 = !DILocation(line: 4114, column: 67, scope: !4038)
!4047 = !DILocation(line: 4114, column: 47, scope: !4038)
!4048 = !DILocation(line: 4114, column: 10, scope: !4038)
!4049 = !DILocation(line: 4114, column: 3, scope: !4038)
!4050 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !76, file: !76, line: 4136, type: !163, scopeLine: 4137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4051 = !DILocalVariable(name: "value", arg: 1, scope: !4050, file: !76, line: 4136, type: !20)
!4052 = !DILocation(line: 4136, column: 26, scope: !4050)
!4053 = !DILocalVariable(name: "factor", arg: 2, scope: !4050, file: !76, line: 4136, type: !29)
!4054 = !DILocation(line: 4136, column: 36, scope: !4050)
!4055 = !DILocation(line: 4138, column: 41, scope: !4050)
!4056 = !DILocation(line: 4138, column: 59, scope: !4050)
!4057 = !DILocation(line: 4138, column: 53, scope: !4050)
!4058 = !DILocation(line: 4138, column: 67, scope: !4050)
!4059 = !DILocation(line: 4138, column: 47, scope: !4050)
!4060 = !DILocation(line: 4138, column: 10, scope: !4050)
!4061 = !DILocation(line: 4138, column: 3, scope: !4050)
!4062 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !76, file: !76, line: 4160, type: !163, scopeLine: 4161, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4063 = !DILocalVariable(name: "value", arg: 1, scope: !4062, file: !76, line: 4160, type: !20)
!4064 = !DILocation(line: 4160, column: 25, scope: !4062)
!4065 = !DILocalVariable(name: "factor", arg: 2, scope: !4062, file: !76, line: 4160, type: !29)
!4066 = !DILocation(line: 4160, column: 35, scope: !4062)
!4067 = !DILocation(line: 4162, column: 41, scope: !4062)
!4068 = !DILocation(line: 4162, column: 59, scope: !4062)
!4069 = !DILocation(line: 4162, column: 53, scope: !4062)
!4070 = !DILocation(line: 4162, column: 67, scope: !4062)
!4071 = !DILocation(line: 4162, column: 47, scope: !4062)
!4072 = !DILocation(line: 4162, column: 10, scope: !4062)
!4073 = !DILocation(line: 4162, column: 3, scope: !4062)
!4074 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !76, file: !76, line: 4183, type: !933, scopeLine: 4184, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4075 = !DILocalVariable(name: "value", arg: 1, scope: !4074, file: !76, line: 4183, type: !34)
!4076 = !DILocation(line: 4183, column: 33, scope: !4074)
!4077 = !DILocalVariable(name: "factor", arg: 2, scope: !4074, file: !76, line: 4183, type: !34)
!4078 = !DILocation(line: 4183, column: 44, scope: !4074)
!4079 = !DILocation(line: 4185, column: 41, scope: !4074)
!4080 = !DILocation(line: 4185, column: 47, scope: !4074)
!4081 = !DILocation(line: 4185, column: 10, scope: !4074)
!4082 = !DILocation(line: 4185, column: 3, scope: !4074)
!4083 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !76, file: !76, line: 4206, type: !933, scopeLine: 4207, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4084 = !DILocalVariable(name: "value", arg: 1, scope: !4083, file: !76, line: 4206, type: !34)
!4085 = !DILocation(line: 4206, column: 32, scope: !4083)
!4086 = !DILocalVariable(name: "factor", arg: 2, scope: !4083, file: !76, line: 4206, type: !34)
!4087 = !DILocation(line: 4206, column: 43, scope: !4083)
!4088 = !DILocation(line: 4208, column: 41, scope: !4083)
!4089 = !DILocation(line: 4208, column: 47, scope: !4083)
!4090 = !DILocation(line: 4208, column: 10, scope: !4083)
!4091 = !DILocation(line: 4208, column: 3, scope: !4083)
!4092 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !76, file: !76, line: 4230, type: !933, scopeLine: 4231, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4093 = !DILocalVariable(name: "value", arg: 1, scope: !4092, file: !76, line: 4230, type: !34)
!4094 = !DILocation(line: 4230, column: 31, scope: !4092)
!4095 = !DILocalVariable(name: "factor", arg: 2, scope: !4092, file: !76, line: 4230, type: !34)
!4096 = !DILocation(line: 4230, column: 42, scope: !4092)
!4097 = !DILocation(line: 4232, column: 41, scope: !4092)
!4098 = !DILocation(line: 4232, column: 47, scope: !4092)
!4099 = !DILocation(line: 4232, column: 10, scope: !4092)
!4100 = !DILocation(line: 4232, column: 3, scope: !4092)
!4101 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !76, file: !76, line: 4254, type: !933, scopeLine: 4255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4102 = !DILocalVariable(name: "value", arg: 1, scope: !4101, file: !76, line: 4254, type: !34)
!4103 = !DILocation(line: 4254, column: 34, scope: !4101)
!4104 = !DILocalVariable(name: "factor", arg: 2, scope: !4101, file: !76, line: 4254, type: !34)
!4105 = !DILocation(line: 4254, column: 45, scope: !4101)
!4106 = !DILocation(line: 4256, column: 44, scope: !4101)
!4107 = !DILocation(line: 4256, column: 50, scope: !4101)
!4108 = !DILocation(line: 4256, column: 10, scope: !4101)
!4109 = !DILocation(line: 4256, column: 3, scope: !4101)
!4110 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !76, file: !76, line: 4278, type: !933, scopeLine: 4279, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4111 = !DILocalVariable(name: "value", arg: 1, scope: !4110, file: !76, line: 4278, type: !34)
!4112 = !DILocation(line: 4278, column: 32, scope: !4110)
!4113 = !DILocalVariable(name: "factor", arg: 2, scope: !4110, file: !76, line: 4278, type: !34)
!4114 = !DILocation(line: 4278, column: 43, scope: !4110)
!4115 = !DILocation(line: 4280, column: 44, scope: !4110)
!4116 = !DILocation(line: 4280, column: 50, scope: !4110)
!4117 = !DILocation(line: 4280, column: 10, scope: !4110)
!4118 = !DILocation(line: 4280, column: 3, scope: !4110)
!4119 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !76, file: !76, line: 4302, type: !933, scopeLine: 4303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4120 = !DILocalVariable(name: "value", arg: 1, scope: !4119, file: !76, line: 4302, type: !34)
!4121 = !DILocation(line: 4302, column: 31, scope: !4119)
!4122 = !DILocalVariable(name: "factor", arg: 2, scope: !4119, file: !76, line: 4302, type: !34)
!4123 = !DILocation(line: 4302, column: 42, scope: !4119)
!4124 = !DILocation(line: 4304, column: 44, scope: !4119)
!4125 = !DILocation(line: 4304, column: 50, scope: !4119)
!4126 = !DILocation(line: 4304, column: 10, scope: !4119)
!4127 = !DILocation(line: 4304, column: 3, scope: !4119)
!4128 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !76, file: !76, line: 4326, type: !933, scopeLine: 4327, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4129 = !DILocalVariable(name: "value", arg: 1, scope: !4128, file: !76, line: 4326, type: !34)
!4130 = !DILocation(line: 4326, column: 33, scope: !4128)
!4131 = !DILocalVariable(name: "factor", arg: 2, scope: !4128, file: !76, line: 4326, type: !34)
!4132 = !DILocation(line: 4326, column: 44, scope: !4128)
!4133 = !DILocation(line: 4328, column: 44, scope: !4128)
!4134 = !DILocation(line: 4328, column: 50, scope: !4128)
!4135 = !DILocation(line: 4328, column: 10, scope: !4128)
!4136 = !DILocation(line: 4328, column: 3, scope: !4128)
!4137 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !76, file: !76, line: 4350, type: !933, scopeLine: 4351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4138 = !DILocalVariable(name: "value", arg: 1, scope: !4137, file: !76, line: 4350, type: !34)
!4139 = !DILocation(line: 4350, column: 32, scope: !4137)
!4140 = !DILocalVariable(name: "factor", arg: 2, scope: !4137, file: !76, line: 4350, type: !34)
!4141 = !DILocation(line: 4350, column: 43, scope: !4137)
!4142 = !DILocation(line: 4352, column: 44, scope: !4137)
!4143 = !DILocation(line: 4352, column: 50, scope: !4137)
!4144 = !DILocation(line: 4352, column: 10, scope: !4137)
!4145 = !DILocation(line: 4352, column: 3, scope: !4137)
!4146 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !76, file: !76, line: 4373, type: !933, scopeLine: 4374, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4147 = !DILocalVariable(name: "value", arg: 1, scope: !4146, file: !76, line: 4373, type: !34)
!4148 = !DILocation(line: 4373, column: 31, scope: !4146)
!4149 = !DILocalVariable(name: "factor", arg: 2, scope: !4146, file: !76, line: 4373, type: !34)
!4150 = !DILocation(line: 4373, column: 42, scope: !4146)
!4151 = !DILocation(line: 4375, column: 44, scope: !4146)
!4152 = !DILocation(line: 4375, column: 50, scope: !4146)
!4153 = !DILocation(line: 4375, column: 10, scope: !4146)
!4154 = !DILocation(line: 4375, column: 3, scope: !4146)
!4155 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !76, file: !76, line: 4396, type: !933, scopeLine: 4397, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4156 = !DILocalVariable(name: "value", arg: 1, scope: !4155, file: !76, line: 4396, type: !34)
!4157 = !DILocation(line: 4396, column: 30, scope: !4155)
!4158 = !DILocalVariable(name: "factor", arg: 2, scope: !4155, file: !76, line: 4396, type: !34)
!4159 = !DILocation(line: 4396, column: 41, scope: !4155)
!4160 = !DILocation(line: 4398, column: 44, scope: !4155)
!4161 = !DILocation(line: 4398, column: 50, scope: !4155)
!4162 = !DILocation(line: 4398, column: 10, scope: !4155)
!4163 = !DILocation(line: 4398, column: 3, scope: !4155)
!4164 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !76, file: !76, line: 4419, type: !933, scopeLine: 4420, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4165 = !DILocalVariable(name: "value", arg: 1, scope: !4164, file: !76, line: 4419, type: !34)
!4166 = !DILocation(line: 4419, column: 33, scope: !4164)
!4167 = !DILocalVariable(name: "factor", arg: 2, scope: !4164, file: !76, line: 4419, type: !34)
!4168 = !DILocation(line: 4419, column: 44, scope: !4164)
!4169 = !DILocation(line: 4421, column: 44, scope: !4164)
!4170 = !DILocation(line: 4421, column: 50, scope: !4164)
!4171 = !DILocation(line: 4421, column: 10, scope: !4164)
!4172 = !DILocation(line: 4421, column: 3, scope: !4164)
!4173 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !76, file: !76, line: 4442, type: !933, scopeLine: 4443, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4174 = !DILocalVariable(name: "value", arg: 1, scope: !4173, file: !76, line: 4442, type: !34)
!4175 = !DILocation(line: 4442, column: 32, scope: !4173)
!4176 = !DILocalVariable(name: "factor", arg: 2, scope: !4173, file: !76, line: 4442, type: !34)
!4177 = !DILocation(line: 4442, column: 43, scope: !4173)
!4178 = !DILocation(line: 4444, column: 44, scope: !4173)
!4179 = !DILocation(line: 4444, column: 50, scope: !4173)
!4180 = !DILocation(line: 4444, column: 10, scope: !4173)
!4181 = !DILocation(line: 4444, column: 3, scope: !4173)
!4182 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !76, file: !76, line: 4465, type: !933, scopeLine: 4466, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4183 = !DILocalVariable(name: "value", arg: 1, scope: !4182, file: !76, line: 4465, type: !34)
!4184 = !DILocation(line: 4465, column: 31, scope: !4182)
!4185 = !DILocalVariable(name: "factor", arg: 2, scope: !4182, file: !76, line: 4465, type: !34)
!4186 = !DILocation(line: 4465, column: 42, scope: !4182)
!4187 = !DILocation(line: 4467, column: 44, scope: !4182)
!4188 = !DILocation(line: 4467, column: 50, scope: !4182)
!4189 = !DILocation(line: 4467, column: 10, scope: !4182)
!4190 = !DILocation(line: 4467, column: 3, scope: !4182)
!4191 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !76, file: !76, line: 4488, type: !933, scopeLine: 4489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4192 = !DILocalVariable(name: "value", arg: 1, scope: !4191, file: !76, line: 4488, type: !34)
!4193 = !DILocation(line: 4488, column: 30, scope: !4191)
!4194 = !DILocalVariable(name: "factor", arg: 2, scope: !4191, file: !76, line: 4488, type: !34)
!4195 = !DILocation(line: 4488, column: 41, scope: !4191)
!4196 = !DILocation(line: 4490, column: 44, scope: !4191)
!4197 = !DILocation(line: 4490, column: 50, scope: !4191)
!4198 = !DILocation(line: 4490, column: 10, scope: !4191)
!4199 = !DILocation(line: 4490, column: 3, scope: !4191)
!4200 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !76, file: !76, line: 4510, type: !978, scopeLine: 4511, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4201 = !DILocalVariable(name: "x_value", arg: 1, scope: !4200, file: !76, line: 4510, type: !34)
!4202 = !DILocation(line: 4510, column: 32, scope: !4200)
!4203 = !DILocalVariable(name: "y_value", arg: 2, scope: !4200, file: !76, line: 4510, type: !29)
!4204 = !DILocation(line: 4510, column: 44, scope: !4200)
!4205 = !DILocation(line: 4512, column: 40, scope: !4200)
!4206 = !DILocation(line: 4512, column: 60, scope: !4200)
!4207 = !DILocation(line: 4512, column: 54, scope: !4200)
!4208 = !DILocation(line: 4512, column: 69, scope: !4200)
!4209 = !DILocation(line: 4512, column: 48, scope: !4200)
!4210 = !DILocation(line: 4512, column: 10, scope: !4200)
!4211 = !DILocation(line: 4512, column: 3, scope: !4200)
!4212 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !76, file: !76, line: 4532, type: !978, scopeLine: 4533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4213 = !DILocalVariable(name: "x_value", arg: 1, scope: !4212, file: !76, line: 4532, type: !34)
!4214 = !DILocation(line: 4532, column: 31, scope: !4212)
!4215 = !DILocalVariable(name: "y_value", arg: 2, scope: !4212, file: !76, line: 4532, type: !29)
!4216 = !DILocation(line: 4532, column: 43, scope: !4212)
!4217 = !DILocation(line: 4534, column: 40, scope: !4212)
!4218 = !DILocation(line: 4534, column: 60, scope: !4212)
!4219 = !DILocation(line: 4534, column: 54, scope: !4212)
!4220 = !DILocation(line: 4534, column: 69, scope: !4212)
!4221 = !DILocation(line: 4534, column: 48, scope: !4212)
!4222 = !DILocation(line: 4534, column: 10, scope: !4212)
!4223 = !DILocation(line: 4534, column: 3, scope: !4212)
!4224 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !76, file: !76, line: 4555, type: !978, scopeLine: 4556, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4225 = !DILocalVariable(name: "x_value", arg: 1, scope: !4224, file: !76, line: 4555, type: !34)
!4226 = !DILocation(line: 4555, column: 30, scope: !4224)
!4227 = !DILocalVariable(name: "y_value", arg: 2, scope: !4224, file: !76, line: 4555, type: !29)
!4228 = !DILocation(line: 4555, column: 42, scope: !4224)
!4229 = !DILocation(line: 4557, column: 40, scope: !4224)
!4230 = !DILocation(line: 4557, column: 60, scope: !4224)
!4231 = !DILocation(line: 4557, column: 54, scope: !4224)
!4232 = !DILocation(line: 4557, column: 69, scope: !4224)
!4233 = !DILocation(line: 4557, column: 48, scope: !4224)
!4234 = !DILocation(line: 4557, column: 10, scope: !4224)
!4235 = !DILocation(line: 4557, column: 3, scope: !4224)
!4236 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !76, file: !76, line: 4578, type: !978, scopeLine: 4579, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4237 = !DILocalVariable(name: "x_value", arg: 1, scope: !4236, file: !76, line: 4578, type: !34)
!4238 = !DILocation(line: 4578, column: 31, scope: !4236)
!4239 = !DILocalVariable(name: "y_value", arg: 2, scope: !4236, file: !76, line: 4578, type: !29)
!4240 = !DILocation(line: 4578, column: 43, scope: !4236)
!4241 = !DILocation(line: 4580, column: 44, scope: !4236)
!4242 = !DILocation(line: 4580, column: 64, scope: !4236)
!4243 = !DILocation(line: 4580, column: 58, scope: !4236)
!4244 = !DILocation(line: 4580, column: 73, scope: !4236)
!4245 = !DILocation(line: 4580, column: 52, scope: !4236)
!4246 = !DILocation(line: 4580, column: 10, scope: !4236)
!4247 = !DILocation(line: 4580, column: 3, scope: !4236)
!4248 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !76, file: !76, line: 4601, type: !978, scopeLine: 4602, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4249 = !DILocalVariable(name: "x_value", arg: 1, scope: !4248, file: !76, line: 4601, type: !34)
!4250 = !DILocation(line: 4601, column: 30, scope: !4248)
!4251 = !DILocalVariable(name: "y_value", arg: 2, scope: !4248, file: !76, line: 4601, type: !29)
!4252 = !DILocation(line: 4601, column: 42, scope: !4248)
!4253 = !DILocation(line: 4603, column: 44, scope: !4248)
!4254 = !DILocation(line: 4603, column: 64, scope: !4248)
!4255 = !DILocation(line: 4603, column: 58, scope: !4248)
!4256 = !DILocation(line: 4603, column: 73, scope: !4248)
!4257 = !DILocation(line: 4603, column: 52, scope: !4248)
!4258 = !DILocation(line: 4603, column: 10, scope: !4248)
!4259 = !DILocation(line: 4603, column: 3, scope: !4248)
!4260 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !76, file: !76, line: 4623, type: !978, scopeLine: 4624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4261 = !DILocalVariable(name: "x_value", arg: 1, scope: !4260, file: !76, line: 4623, type: !34)
!4262 = !DILocation(line: 4623, column: 30, scope: !4260)
!4263 = !DILocalVariable(name: "y_value", arg: 2, scope: !4260, file: !76, line: 4623, type: !29)
!4264 = !DILocation(line: 4623, column: 42, scope: !4260)
!4265 = !DILocation(line: 4625, column: 44, scope: !4260)
!4266 = !DILocation(line: 4625, column: 64, scope: !4260)
!4267 = !DILocation(line: 4625, column: 58, scope: !4260)
!4268 = !DILocation(line: 4625, column: 73, scope: !4260)
!4269 = !DILocation(line: 4625, column: 52, scope: !4260)
!4270 = !DILocation(line: 4625, column: 10, scope: !4260)
!4271 = !DILocation(line: 4625, column: 3, scope: !4260)
!4272 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !76, file: !76, line: 4645, type: !978, scopeLine: 4646, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4273 = !DILocalVariable(name: "x_value", arg: 1, scope: !4272, file: !76, line: 4645, type: !34)
!4274 = !DILocation(line: 4645, column: 29, scope: !4272)
!4275 = !DILocalVariable(name: "y_value", arg: 2, scope: !4272, file: !76, line: 4645, type: !29)
!4276 = !DILocation(line: 4645, column: 41, scope: !4272)
!4277 = !DILocation(line: 4647, column: 44, scope: !4272)
!4278 = !DILocation(line: 4647, column: 64, scope: !4272)
!4279 = !DILocation(line: 4647, column: 58, scope: !4272)
!4280 = !DILocation(line: 4647, column: 73, scope: !4272)
!4281 = !DILocation(line: 4647, column: 52, scope: !4272)
!4282 = !DILocation(line: 4647, column: 10, scope: !4272)
!4283 = !DILocation(line: 4647, column: 3, scope: !4272)
!4284 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !76, file: !76, line: 4667, type: !978, scopeLine: 4668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4285 = !DILocalVariable(name: "x_value", arg: 1, scope: !4284, file: !76, line: 4667, type: !34)
!4286 = !DILocation(line: 4667, column: 30, scope: !4284)
!4287 = !DILocalVariable(name: "y_value", arg: 2, scope: !4284, file: !76, line: 4667, type: !29)
!4288 = !DILocation(line: 4667, column: 42, scope: !4284)
!4289 = !DILocation(line: 4669, column: 44, scope: !4284)
!4290 = !DILocation(line: 4669, column: 64, scope: !4284)
!4291 = !DILocation(line: 4669, column: 58, scope: !4284)
!4292 = !DILocation(line: 4669, column: 73, scope: !4284)
!4293 = !DILocation(line: 4669, column: 52, scope: !4284)
!4294 = !DILocation(line: 4669, column: 10, scope: !4284)
!4295 = !DILocation(line: 4669, column: 3, scope: !4284)
!4296 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !76, file: !76, line: 4689, type: !978, scopeLine: 4690, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4297 = !DILocalVariable(name: "x_value", arg: 1, scope: !4296, file: !76, line: 4689, type: !34)
!4298 = !DILocation(line: 4689, column: 29, scope: !4296)
!4299 = !DILocalVariable(name: "y_value", arg: 2, scope: !4296, file: !76, line: 4689, type: !29)
!4300 = !DILocation(line: 4689, column: 41, scope: !4296)
!4301 = !DILocation(line: 4691, column: 44, scope: !4296)
!4302 = !DILocation(line: 4691, column: 64, scope: !4296)
!4303 = !DILocation(line: 4691, column: 58, scope: !4296)
!4304 = !DILocation(line: 4691, column: 73, scope: !4296)
!4305 = !DILocation(line: 4691, column: 52, scope: !4296)
!4306 = !DILocation(line: 4691, column: 10, scope: !4296)
!4307 = !DILocation(line: 4691, column: 3, scope: !4296)
!4308 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !76, file: !76, line: 4713, type: !1507, scopeLine: 4714, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4309 = !DILocalVariable(name: "value", arg: 1, scope: !4308, file: !76, line: 4713, type: !740)
!4310 = !DILocation(line: 4713, column: 31, scope: !4308)
!4311 = !DILocalVariable(name: "factor", arg: 2, scope: !4308, file: !76, line: 4713, type: !25)
!4312 = !DILocation(line: 4713, column: 42, scope: !4308)
!4313 = !DILocation(line: 4715, column: 41, scope: !4308)
!4314 = !DILocation(line: 4715, column: 47, scope: !4308)
!4315 = !DILocation(line: 4715, column: 10, scope: !4308)
!4316 = !DILocation(line: 4715, column: 3, scope: !4308)
!4317 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !76, file: !76, line: 5293, type: !4318, scopeLine: 5294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4318 = !DISubroutineType(types: !4319)
!4319 = !{!740, !740, !25, !740}
!4320 = !DILocalVariable(name: "value", arg: 1, scope: !4317, file: !76, line: 5293, type: !740)
!4321 = !DILocation(line: 5293, column: 40, scope: !4317)
!4322 = !DILocalVariable(name: "factor", arg: 2, scope: !4317, file: !76, line: 5293, type: !25)
!4323 = !DILocation(line: 5293, column: 50, scope: !4317)
!4324 = !DILocalVariable(name: "count", arg: 3, scope: !4317, file: !76, line: 5293, type: !740)
!4325 = !DILocation(line: 5293, column: 62, scope: !4317)
!4326 = !DILocalVariable(name: "u32Temp1", scope: !4317, file: !76, line: 5295, type: !740)
!4327 = !DILocation(line: 5295, column: 6, scope: !4317)
!4328 = !DILocalVariable(name: "u32Temp2", scope: !4317, file: !76, line: 5295, type: !740)
!4329 = !DILocation(line: 5295, column: 17, scope: !4317)
!4330 = !DILocalVariable(name: "u32Temp3", scope: !4317, file: !76, line: 5295, type: !740)
!4331 = !DILocation(line: 5295, column: 26, scope: !4317)
!4332 = !DILocalVariable(name: "u8SignBit", scope: !4317, file: !76, line: 5296, type: !29)
!4333 = !DILocation(line: 5296, column: 5, scope: !4317)
!4334 = !DILocation(line: 5298, column: 5, scope: !4335)
!4335 = distinct !DILexicalBlock(scope: !4317, file: !76, line: 5298, column: 5)
!4336 = !DILocation(line: 5298, column: 11, scope: !4335)
!4337 = !DILocation(line: 5298, column: 5, scope: !4317)
!4338 = !DILocation(line: 5300, column: 13, scope: !4339)
!4339 = distinct !DILexicalBlock(scope: !4335, file: !76, line: 5299, column: 2)
!4340 = !DILocation(line: 5301, column: 2, scope: !4339)
!4341 = !DILocation(line: 5304, column: 13, scope: !4342)
!4342 = distinct !DILexicalBlock(scope: !4335, file: !76, line: 5303, column: 2)
!4343 = !DILocation(line: 5308, column: 5, scope: !4344)
!4344 = distinct !DILexicalBlock(scope: !4317, file: !76, line: 5308, column: 5)
!4345 = !DILocation(line: 5308, column: 11, scope: !4344)
!4346 = !DILocation(line: 5308, column: 5, scope: !4317)
!4347 = !DILocation(line: 5310, column: 15, scope: !4348)
!4348 = distinct !DILexicalBlock(scope: !4344, file: !76, line: 5309, column: 2)
!4349 = !DILocation(line: 5310, column: 14, scope: !4348)
!4350 = !DILocation(line: 5310, column: 12, scope: !4348)
!4351 = !DILocation(line: 5311, column: 2, scope: !4348)
!4352 = !DILocation(line: 5314, column: 14, scope: !4353)
!4353 = distinct !DILexicalBlock(scope: !4344, file: !76, line: 5313, column: 2)
!4354 = !DILocation(line: 5314, column: 12, scope: !4353)
!4355 = !DILocation(line: 5317, column: 13, scope: !4317)
!4356 = !DILocation(line: 5317, column: 21, scope: !4317)
!4357 = !DILocation(line: 5317, column: 19, scope: !4317)
!4358 = !DILocation(line: 5317, column: 11, scope: !4317)
!4359 = !DILocation(line: 5318, column: 25, scope: !4317)
!4360 = !DILocation(line: 5318, column: 32, scope: !4317)
!4361 = !DILocation(line: 5318, column: 13, scope: !4317)
!4362 = !DILocation(line: 5318, column: 11, scope: !4317)
!4363 = !DILocation(line: 5319, column: 13, scope: !4317)
!4364 = !DILocation(line: 5319, column: 25, scope: !4317)
!4365 = !DILocation(line: 5319, column: 22, scope: !4317)
!4366 = !DILocation(line: 5319, column: 11, scope: !4317)
!4367 = !DILocation(line: 5320, column: 14, scope: !4317)
!4368 = !DILocation(line: 5320, column: 30, scope: !4317)
!4369 = !DILocation(line: 5320, column: 29, scope: !4317)
!4370 = !DILocation(line: 5320, column: 23, scope: !4317)
!4371 = !DILocation(line: 5320, column: 11, scope: !4317)
!4372 = !DILocation(line: 5321, column: 6, scope: !4373)
!4373 = distinct !DILexicalBlock(scope: !4317, file: !76, line: 5321, column: 5)
!4374 = !DILocation(line: 5321, column: 16, scope: !4373)
!4375 = !DILocation(line: 5321, column: 14, scope: !4373)
!4376 = !DILocation(line: 5321, column: 22, scope: !4373)
!4377 = !DILocation(line: 5321, column: 5, scope: !4317)
!4378 = !DILocation(line: 5323, column: 6, scope: !4379)
!4379 = distinct !DILexicalBlock(scope: !4380, file: !76, line: 5323, column: 6)
!4380 = distinct !DILexicalBlock(scope: !4373, file: !76, line: 5322, column: 2)
!4381 = !DILocation(line: 5323, column: 16, scope: !4379)
!4382 = !DILocation(line: 5323, column: 6, scope: !4380)
!4383 = !DILocation(line: 5325, column: 7, scope: !4384)
!4384 = distinct !DILexicalBlock(scope: !4385, file: !76, line: 5325, column: 7)
!4385 = distinct !DILexicalBlock(scope: !4379, file: !76, line: 5324, column: 3)
!4386 = !DILocation(line: 5325, column: 15, scope: !4384)
!4387 = !DILocation(line: 5325, column: 7, scope: !4385)
!4388 = !DILocation(line: 5326, column: 12, scope: !4384)
!4389 = !DILocation(line: 5326, column: 5, scope: !4384)
!4390 = !DILocation(line: 5328, column: 5, scope: !4384)
!4391 = !DILocation(line: 5332, column: 4, scope: !4392)
!4392 = distinct !DILexicalBlock(scope: !4379, file: !76, line: 5331, column: 3)
!4393 = !DILocation(line: 5337, column: 3, scope: !4394)
!4394 = distinct !DILexicalBlock(scope: !4373, file: !76, line: 5336, column: 2)
!4395 = !DILocation(line: 5339, column: 1, scope: !4317)
!4396 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !76, file: !76, line: 4737, type: !1325, scopeLine: 4738, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4397 = !DILocalVariable(name: "value", arg: 1, scope: !4396, file: !76, line: 4737, type: !740)
!4398 = !DILocation(line: 4737, column: 31, scope: !4396)
!4399 = !DILocalVariable(name: "factor", arg: 2, scope: !4396, file: !76, line: 4737, type: !84)
!4400 = !DILocation(line: 4737, column: 42, scope: !4396)
!4401 = !DILocation(line: 4739, column: 41, scope: !4396)
!4402 = !DILocation(line: 4739, column: 47, scope: !4396)
!4403 = !DILocation(line: 4739, column: 10, scope: !4396)
!4404 = !DILocation(line: 4739, column: 3, scope: !4396)
!4405 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !76, file: !76, line: 5357, type: !4406, scopeLine: 5358, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4406 = !DISubroutineType(types: !4407)
!4407 = !{!740, !740, !84, !740}
!4408 = !DILocalVariable(name: "value", arg: 1, scope: !4405, file: !76, line: 5357, type: !740)
!4409 = !DILocation(line: 5357, column: 40, scope: !4405)
!4410 = !DILocalVariable(name: "factor", arg: 2, scope: !4405, file: !76, line: 5357, type: !84)
!4411 = !DILocation(line: 5357, column: 51, scope: !4405)
!4412 = !DILocalVariable(name: "count", arg: 3, scope: !4405, file: !76, line: 5357, type: !740)
!4413 = !DILocation(line: 5357, column: 63, scope: !4405)
!4414 = !DILocalVariable(name: "u32Temp1", scope: !4405, file: !76, line: 5359, type: !740)
!4415 = !DILocation(line: 5359, column: 6, scope: !4405)
!4416 = !DILocalVariable(name: "u32Temp2", scope: !4405, file: !76, line: 5359, type: !740)
!4417 = !DILocation(line: 5359, column: 17, scope: !4405)
!4418 = !DILocalVariable(name: "u8SignBit", scope: !4405, file: !76, line: 5360, type: !29)
!4419 = !DILocation(line: 5360, column: 5, scope: !4405)
!4420 = !DILocation(line: 5362, column: 5, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4405, file: !76, line: 5362, column: 5)
!4422 = !DILocation(line: 5362, column: 11, scope: !4421)
!4423 = !DILocation(line: 5362, column: 5, scope: !4405)
!4424 = !DILocation(line: 5364, column: 13, scope: !4425)
!4425 = distinct !DILexicalBlock(scope: !4421, file: !76, line: 5363, column: 2)
!4426 = !DILocation(line: 5365, column: 2, scope: !4425)
!4427 = !DILocation(line: 5368, column: 13, scope: !4428)
!4428 = distinct !DILexicalBlock(scope: !4421, file: !76, line: 5367, column: 2)
!4429 = !DILocation(line: 5372, column: 5, scope: !4430)
!4430 = distinct !DILexicalBlock(scope: !4405, file: !76, line: 5372, column: 5)
!4431 = !DILocation(line: 5372, column: 11, scope: !4430)
!4432 = !DILocation(line: 5372, column: 5, scope: !4405)
!4433 = !DILocation(line: 5374, column: 15, scope: !4434)
!4434 = distinct !DILexicalBlock(scope: !4430, file: !76, line: 5373, column: 2)
!4435 = !DILocation(line: 5374, column: 14, scope: !4434)
!4436 = !DILocation(line: 5374, column: 12, scope: !4434)
!4437 = !DILocation(line: 5375, column: 2, scope: !4434)
!4438 = !DILocation(line: 5378, column: 14, scope: !4439)
!4439 = distinct !DILexicalBlock(scope: !4430, file: !76, line: 5377, column: 2)
!4440 = !DILocation(line: 5378, column: 12, scope: !4439)
!4441 = !DILocation(line: 5381, column: 25, scope: !4405)
!4442 = !DILocation(line: 5381, column: 32, scope: !4405)
!4443 = !DILocation(line: 5381, column: 13, scope: !4405)
!4444 = !DILocation(line: 5381, column: 11, scope: !4405)
!4445 = !DILocation(line: 5382, column: 13, scope: !4405)
!4446 = !DILocation(line: 5382, column: 26, scope: !4405)
!4447 = !DILocation(line: 5382, column: 31, scope: !4405)
!4448 = !DILocation(line: 5382, column: 22, scope: !4405)
!4449 = !DILocation(line: 5382, column: 11, scope: !4405)
!4450 = !DILocation(line: 5383, column: 5, scope: !4451)
!4451 = distinct !DILexicalBlock(scope: !4405, file: !76, line: 5383, column: 5)
!4452 = !DILocation(line: 5383, column: 15, scope: !4451)
!4453 = !DILocation(line: 5383, column: 5, scope: !4405)
!4454 = !DILocation(line: 5385, column: 10, scope: !4455)
!4455 = distinct !DILexicalBlock(scope: !4451, file: !76, line: 5384, column: 2)
!4456 = !DILocation(line: 5385, column: 3, scope: !4455)
!4457 = !DILocation(line: 5389, column: 3, scope: !4458)
!4458 = distinct !DILexicalBlock(scope: !4451, file: !76, line: 5388, column: 2)
!4459 = !DILocation(line: 5391, column: 1, scope: !4405)
!4460 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !76, file: !76, line: 4761, type: !3080, scopeLine: 4762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4461 = !DILocalVariable(name: "value", arg: 1, scope: !4460, file: !76, line: 4761, type: !740)
!4462 = !DILocation(line: 4761, column: 30, scope: !4460)
!4463 = !DILocalVariable(name: "factor", arg: 2, scope: !4460, file: !76, line: 4761, type: !20)
!4464 = !DILocation(line: 4761, column: 40, scope: !4460)
!4465 = !DILocation(line: 4763, column: 40, scope: !4460)
!4466 = !DILocation(line: 4763, column: 46, scope: !4460)
!4467 = !DILocation(line: 4763, column: 10, scope: !4460)
!4468 = !DILocation(line: 4763, column: 3, scope: !4460)
!4469 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !76, file: !76, line: 5435, type: !4470, scopeLine: 5436, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4470 = !DISubroutineType(types: !4471)
!4471 = !{!740, !740, !20, !740}
!4472 = !DILocalVariable(name: "value", arg: 1, scope: !4469, file: !76, line: 5435, type: !740)
!4473 = !DILocation(line: 5435, column: 39, scope: !4469)
!4474 = !DILocalVariable(name: "factor", arg: 2, scope: !4469, file: !76, line: 5435, type: !20)
!4475 = !DILocation(line: 5435, column: 49, scope: !4469)
!4476 = !DILocalVariable(name: "count", arg: 3, scope: !4469, file: !76, line: 5435, type: !740)
!4477 = !DILocation(line: 5435, column: 61, scope: !4469)
!4478 = !DILocalVariable(name: "u32Temp1", scope: !4469, file: !76, line: 5437, type: !740)
!4479 = !DILocation(line: 5437, column: 6, scope: !4469)
!4480 = !DILocalVariable(name: "u32Temp2", scope: !4469, file: !76, line: 5437, type: !740)
!4481 = !DILocation(line: 5437, column: 17, scope: !4469)
!4482 = !DILocalVariable(name: "u32Temp3", scope: !4469, file: !76, line: 5437, type: !740)
!4483 = !DILocation(line: 5437, column: 26, scope: !4469)
!4484 = !DILocalVariable(name: "u8SignBit", scope: !4469, file: !76, line: 5438, type: !29)
!4485 = !DILocation(line: 5438, column: 5, scope: !4469)
!4486 = !DILocation(line: 5440, column: 5, scope: !4487)
!4487 = distinct !DILexicalBlock(scope: !4469, file: !76, line: 5440, column: 5)
!4488 = !DILocation(line: 5440, column: 11, scope: !4487)
!4489 = !DILocation(line: 5440, column: 5, scope: !4469)
!4490 = !DILocation(line: 5442, column: 13, scope: !4491)
!4491 = distinct !DILexicalBlock(scope: !4487, file: !76, line: 5441, column: 2)
!4492 = !DILocation(line: 5443, column: 2, scope: !4491)
!4493 = !DILocation(line: 5446, column: 13, scope: !4494)
!4494 = distinct !DILexicalBlock(scope: !4487, file: !76, line: 5445, column: 2)
!4495 = !DILocation(line: 5450, column: 5, scope: !4496)
!4496 = distinct !DILexicalBlock(scope: !4469, file: !76, line: 5450, column: 5)
!4497 = !DILocation(line: 5450, column: 11, scope: !4496)
!4498 = !DILocation(line: 5450, column: 5, scope: !4469)
!4499 = !DILocation(line: 5452, column: 15, scope: !4500)
!4500 = distinct !DILexicalBlock(scope: !4496, file: !76, line: 5451, column: 2)
!4501 = !DILocation(line: 5452, column: 14, scope: !4500)
!4502 = !DILocation(line: 5452, column: 12, scope: !4500)
!4503 = !DILocation(line: 5453, column: 2, scope: !4500)
!4504 = !DILocation(line: 5456, column: 14, scope: !4505)
!4505 = distinct !DILexicalBlock(scope: !4496, file: !76, line: 5455, column: 2)
!4506 = !DILocation(line: 5456, column: 12, scope: !4505)
!4507 = !DILocation(line: 5459, column: 13, scope: !4469)
!4508 = !DILocation(line: 5459, column: 21, scope: !4469)
!4509 = !DILocation(line: 5459, column: 19, scope: !4469)
!4510 = !DILocation(line: 5459, column: 11, scope: !4469)
!4511 = !DILocation(line: 5460, column: 25, scope: !4469)
!4512 = !DILocation(line: 5460, column: 32, scope: !4469)
!4513 = !DILocation(line: 5460, column: 13, scope: !4469)
!4514 = !DILocation(line: 5460, column: 11, scope: !4469)
!4515 = !DILocation(line: 5461, column: 13, scope: !4469)
!4516 = !DILocation(line: 5461, column: 25, scope: !4469)
!4517 = !DILocation(line: 5461, column: 22, scope: !4469)
!4518 = !DILocation(line: 5461, column: 11, scope: !4469)
!4519 = !DILocation(line: 5462, column: 14, scope: !4469)
!4520 = !DILocation(line: 5462, column: 30, scope: !4469)
!4521 = !DILocation(line: 5462, column: 29, scope: !4469)
!4522 = !DILocation(line: 5462, column: 23, scope: !4469)
!4523 = !DILocation(line: 5462, column: 11, scope: !4469)
!4524 = !DILocation(line: 5463, column: 6, scope: !4525)
!4525 = distinct !DILexicalBlock(scope: !4469, file: !76, line: 5463, column: 5)
!4526 = !DILocation(line: 5463, column: 16, scope: !4525)
!4527 = !DILocation(line: 5463, column: 14, scope: !4525)
!4528 = !DILocation(line: 5463, column: 22, scope: !4525)
!4529 = !DILocation(line: 5463, column: 5, scope: !4469)
!4530 = !DILocation(line: 5465, column: 6, scope: !4531)
!4531 = distinct !DILexicalBlock(scope: !4532, file: !76, line: 5465, column: 6)
!4532 = distinct !DILexicalBlock(scope: !4525, file: !76, line: 5464, column: 2)
!4533 = !DILocation(line: 5465, column: 16, scope: !4531)
!4534 = !DILocation(line: 5465, column: 6, scope: !4532)
!4535 = !DILocation(line: 5467, column: 7, scope: !4536)
!4536 = distinct !DILexicalBlock(scope: !4537, file: !76, line: 5467, column: 7)
!4537 = distinct !DILexicalBlock(scope: !4531, file: !76, line: 5466, column: 3)
!4538 = !DILocation(line: 5467, column: 15, scope: !4536)
!4539 = !DILocation(line: 5467, column: 7, scope: !4537)
!4540 = !DILocation(line: 5468, column: 12, scope: !4536)
!4541 = !DILocation(line: 5468, column: 5, scope: !4536)
!4542 = !DILocation(line: 5470, column: 5, scope: !4536)
!4543 = !DILocation(line: 5474, column: 4, scope: !4544)
!4544 = distinct !DILexicalBlock(scope: !4531, file: !76, line: 5473, column: 3)
!4545 = !DILocation(line: 5479, column: 3, scope: !4546)
!4546 = distinct !DILexicalBlock(scope: !4525, file: !76, line: 5478, column: 2)
!4547 = !DILocation(line: 5481, column: 1, scope: !4469)
!4548 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !76, file: !76, line: 4785, type: !1121, scopeLine: 4786, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4549 = !DILocalVariable(name: "value", arg: 1, scope: !4548, file: !76, line: 4785, type: !740)
!4550 = !DILocation(line: 4785, column: 31, scope: !4548)
!4551 = !DILocalVariable(name: "factor", arg: 2, scope: !4548, file: !76, line: 4785, type: !34)
!4552 = !DILocation(line: 4785, column: 42, scope: !4548)
!4553 = !DILocation(line: 4787, column: 41, scope: !4548)
!4554 = !DILocation(line: 4787, column: 47, scope: !4548)
!4555 = !DILocation(line: 4787, column: 10, scope: !4548)
!4556 = !DILocation(line: 4787, column: 3, scope: !4548)
!4557 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !76, file: !76, line: 4809, type: !1416, scopeLine: 4810, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4558 = !DILocalVariable(name: "value", arg: 1, scope: !4557, file: !76, line: 4809, type: !740)
!4559 = !DILocation(line: 4809, column: 31, scope: !4557)
!4560 = !DILocalVariable(name: "factor", arg: 2, scope: !4557, file: !76, line: 4809, type: !740)
!4561 = !DILocation(line: 4809, column: 42, scope: !4557)
!4562 = !DILocation(line: 4811, column: 41, scope: !4557)
!4563 = !DILocation(line: 4811, column: 47, scope: !4557)
!4564 = !DILocation(line: 4811, column: 10, scope: !4557)
!4565 = !DILocation(line: 4811, column: 3, scope: !4557)
!4566 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !76, file: !76, line: 5408, type: !4567, scopeLine: 5409, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4567 = !DISubroutineType(types: !4568)
!4568 = !{!740, !740, !740, !740}
!4569 = !DILocalVariable(name: "value", arg: 1, scope: !4566, file: !76, line: 5408, type: !740)
!4570 = !DILocation(line: 5408, column: 40, scope: !4566)
!4571 = !DILocalVariable(name: "factor", arg: 2, scope: !4566, file: !76, line: 5408, type: !740)
!4572 = !DILocation(line: 5408, column: 50, scope: !4566)
!4573 = !DILocalVariable(name: "count", arg: 3, scope: !4566, file: !76, line: 5408, type: !740)
!4574 = !DILocation(line: 5408, column: 62, scope: !4566)
!4575 = !DILocalVariable(name: "u32Temp1", scope: !4566, file: !76, line: 5410, type: !740)
!4576 = !DILocation(line: 5410, column: 6, scope: !4566)
!4577 = !DILocalVariable(name: "u32Temp2", scope: !4566, file: !76, line: 5410, type: !740)
!4578 = !DILocation(line: 5410, column: 17, scope: !4566)
!4579 = !DILocalVariable(name: "u32Temp3", scope: !4566, file: !76, line: 5410, type: !740)
!4580 = !DILocation(line: 5410, column: 26, scope: !4566)
!4581 = !DILocalVariable(name: "u32Temp4", scope: !4566, file: !76, line: 5410, type: !740)
!4582 = !DILocation(line: 5410, column: 35, scope: !4566)
!4583 = !DILocalVariable(name: "u8SignBit", scope: !4566, file: !76, line: 5411, type: !29)
!4584 = !DILocation(line: 5411, column: 5, scope: !4566)
!4585 = !DILocation(line: 5413, column: 25, scope: !4566)
!4586 = !DILocation(line: 5413, column: 32, scope: !4566)
!4587 = !DILocation(line: 5413, column: 13, scope: !4566)
!4588 = !DILocation(line: 5413, column: 11, scope: !4566)
!4589 = !DILocation(line: 5414, column: 13, scope: !4566)
!4590 = !DILocation(line: 5414, column: 26, scope: !4566)
!4591 = !DILocation(line: 5414, column: 31, scope: !4566)
!4592 = !DILocation(line: 5414, column: 22, scope: !4566)
!4593 = !DILocation(line: 5414, column: 11, scope: !4566)
!4594 = !DILocation(line: 5415, column: 9, scope: !4566)
!4595 = !DILocation(line: 5415, column: 2, scope: !4566)
!4596 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !76, file: !76, line: 4833, type: !3019, scopeLine: 4834, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4597 = !DILocalVariable(name: "value", arg: 1, scope: !4596, file: !76, line: 4833, type: !740)
!4598 = !DILocation(line: 4833, column: 30, scope: !4596)
!4599 = !DILocalVariable(name: "factor", arg: 2, scope: !4596, file: !76, line: 4833, type: !29)
!4600 = !DILocation(line: 4833, column: 40, scope: !4596)
!4601 = !DILocation(line: 4835, column: 40, scope: !4596)
!4602 = !DILocation(line: 4835, column: 46, scope: !4596)
!4603 = !DILocation(line: 4835, column: 10, scope: !4596)
!4604 = !DILocation(line: 4835, column: 3, scope: !4596)
!4605 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !76, file: !76, line: 5499, type: !4606, scopeLine: 5500, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4606 = !DISubroutineType(types: !4607)
!4607 = !{!740, !740, !29, !740}
!4608 = !DILocalVariable(name: "value", arg: 1, scope: !4605, file: !76, line: 5499, type: !740)
!4609 = !DILocation(line: 5499, column: 39, scope: !4605)
!4610 = !DILocalVariable(name: "factor", arg: 2, scope: !4605, file: !76, line: 5499, type: !29)
!4611 = !DILocation(line: 5499, column: 49, scope: !4605)
!4612 = !DILocalVariable(name: "count", arg: 3, scope: !4605, file: !76, line: 5499, type: !740)
!4613 = !DILocation(line: 5499, column: 61, scope: !4605)
!4614 = !DILocalVariable(name: "u32Temp1", scope: !4605, file: !76, line: 5501, type: !740)
!4615 = !DILocation(line: 5501, column: 6, scope: !4605)
!4616 = !DILocalVariable(name: "u32Temp2", scope: !4605, file: !76, line: 5501, type: !740)
!4617 = !DILocation(line: 5501, column: 17, scope: !4605)
!4618 = !DILocation(line: 5503, column: 13, scope: !4605)
!4619 = !DILocation(line: 5503, column: 21, scope: !4605)
!4620 = !DILocation(line: 5503, column: 19, scope: !4605)
!4621 = !DILocation(line: 5503, column: 11, scope: !4605)
!4622 = !DILocation(line: 5504, column: 25, scope: !4605)
!4623 = !DILocation(line: 5504, column: 32, scope: !4605)
!4624 = !DILocation(line: 5504, column: 13, scope: !4605)
!4625 = !DILocation(line: 5504, column: 11, scope: !4605)
!4626 = !DILocation(line: 5505, column: 13, scope: !4605)
!4627 = !DILocation(line: 5505, column: 25, scope: !4605)
!4628 = !DILocation(line: 5505, column: 22, scope: !4605)
!4629 = !DILocation(line: 5505, column: 11, scope: !4605)
!4630 = !DILocation(line: 5506, column: 14, scope: !4605)
!4631 = !DILocation(line: 5506, column: 30, scope: !4605)
!4632 = !DILocation(line: 5506, column: 29, scope: !4605)
!4633 = !DILocation(line: 5506, column: 23, scope: !4605)
!4634 = !DILocation(line: 5506, column: 11, scope: !4605)
!4635 = !DILocation(line: 5507, column: 6, scope: !4636)
!4636 = distinct !DILexicalBlock(scope: !4605, file: !76, line: 5507, column: 5)
!4637 = !DILocation(line: 5507, column: 16, scope: !4636)
!4638 = !DILocation(line: 5507, column: 14, scope: !4636)
!4639 = !DILocation(line: 5507, column: 22, scope: !4636)
!4640 = !DILocation(line: 5507, column: 5, scope: !4605)
!4641 = !DILocation(line: 5509, column: 6, scope: !4642)
!4642 = distinct !DILexicalBlock(scope: !4643, file: !76, line: 5509, column: 6)
!4643 = distinct !DILexicalBlock(scope: !4636, file: !76, line: 5508, column: 2)
!4644 = !DILocation(line: 5509, column: 14, scope: !4642)
!4645 = !DILocation(line: 5509, column: 6, scope: !4643)
!4646 = !DILocation(line: 5510, column: 11, scope: !4642)
!4647 = !DILocation(line: 5510, column: 4, scope: !4642)
!4648 = !DILocation(line: 5512, column: 4, scope: !4642)
!4649 = !DILocation(line: 5516, column: 3, scope: !4650)
!4650 = distinct !DILexicalBlock(scope: !4636, file: !76, line: 5515, column: 2)
!4651 = !DILocation(line: 5518, column: 1, scope: !4605)
!4652 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !76, file: !76, line: 4856, type: !889, scopeLine: 4857, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4653 = !DILocalVariable(name: "value", arg: 1, scope: !4652, file: !76, line: 4856, type: !29)
!4654 = !DILocation(line: 4856, column: 28, scope: !4652)
!4655 = !DILocalVariable(name: "factor", arg: 2, scope: !4652, file: !76, line: 4856, type: !29)
!4656 = !DILocation(line: 4856, column: 38, scope: !4652)
!4657 = !DILocation(line: 4858, column: 38, scope: !4652)
!4658 = !DILocation(line: 4858, column: 44, scope: !4652)
!4659 = !DILocation(line: 4858, column: 10, scope: !4652)
!4660 = !DILocation(line: 4858, column: 3, scope: !4652)
!4661 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !76, file: !76, line: 4879, type: !889, scopeLine: 4880, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4662 = !DILocalVariable(name: "value", arg: 1, scope: !4661, file: !76, line: 4879, type: !29)
!4663 = !DILocation(line: 4879, column: 28, scope: !4661)
!4664 = !DILocalVariable(name: "factor", arg: 2, scope: !4661, file: !76, line: 4879, type: !29)
!4665 = !DILocation(line: 4879, column: 38, scope: !4661)
!4666 = !DILocation(line: 4881, column: 38, scope: !4661)
!4667 = !DILocation(line: 4881, column: 44, scope: !4661)
!4668 = !DILocation(line: 4881, column: 10, scope: !4661)
!4669 = !DILocation(line: 4881, column: 3, scope: !4661)
!4670 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !76, file: !76, line: 4903, type: !889, scopeLine: 4904, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4671 = !DILocalVariable(name: "value", arg: 1, scope: !4670, file: !76, line: 4903, type: !29)
!4672 = !DILocation(line: 4903, column: 26, scope: !4670)
!4673 = !DILocalVariable(name: "factor", arg: 2, scope: !4670, file: !76, line: 4903, type: !29)
!4674 = !DILocation(line: 4903, column: 36, scope: !4670)
!4675 = !DILocation(line: 4905, column: 38, scope: !4670)
!4676 = !DILocation(line: 4905, column: 44, scope: !4670)
!4677 = !DILocation(line: 4905, column: 10, scope: !4670)
!4678 = !DILocation(line: 4905, column: 3, scope: !4670)
!4679 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !76, file: !76, line: 4927, type: !889, scopeLine: 4928, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4680 = !DILocalVariable(name: "value", arg: 1, scope: !4679, file: !76, line: 4927, type: !29)
!4681 = !DILocation(line: 4927, column: 28, scope: !4679)
!4682 = !DILocalVariable(name: "factor", arg: 2, scope: !4679, file: !76, line: 4927, type: !29)
!4683 = !DILocation(line: 4927, column: 38, scope: !4679)
!4684 = !DILocation(line: 4929, column: 41, scope: !4679)
!4685 = !DILocation(line: 4929, column: 47, scope: !4679)
!4686 = !DILocation(line: 4929, column: 10, scope: !4679)
!4687 = !DILocation(line: 4929, column: 3, scope: !4679)
!4688 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !76, file: !76, line: 4951, type: !889, scopeLine: 4952, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4689 = !DILocalVariable(name: "value", arg: 1, scope: !4688, file: !76, line: 4951, type: !29)
!4690 = !DILocation(line: 4951, column: 26, scope: !4688)
!4691 = !DILocalVariable(name: "factor", arg: 2, scope: !4688, file: !76, line: 4951, type: !29)
!4692 = !DILocation(line: 4951, column: 36, scope: !4688)
!4693 = !DILocation(line: 4953, column: 41, scope: !4688)
!4694 = !DILocation(line: 4953, column: 47, scope: !4688)
!4695 = !DILocation(line: 4953, column: 10, scope: !4688)
!4696 = !DILocation(line: 4953, column: 3, scope: !4688)
!4697 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !76, file: !76, line: 4974, type: !889, scopeLine: 4975, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4698 = !DILocalVariable(name: "value", arg: 1, scope: !4697, file: !76, line: 4974, type: !29)
!4699 = !DILocation(line: 4974, column: 26, scope: !4697)
!4700 = !DILocalVariable(name: "factor", arg: 2, scope: !4697, file: !76, line: 4974, type: !29)
!4701 = !DILocation(line: 4974, column: 36, scope: !4697)
!4702 = !DILocation(line: 4976, column: 41, scope: !4697)
!4703 = !DILocation(line: 4976, column: 47, scope: !4697)
!4704 = !DILocation(line: 4976, column: 10, scope: !4697)
!4705 = !DILocation(line: 4976, column: 3, scope: !4697)
!4706 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !76, file: !76, line: 4997, type: !889, scopeLine: 4998, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4707 = !DILocalVariable(name: "value", arg: 1, scope: !4706, file: !76, line: 4997, type: !29)
!4708 = !DILocation(line: 4997, column: 25, scope: !4706)
!4709 = !DILocalVariable(name: "factor", arg: 2, scope: !4706, file: !76, line: 4997, type: !29)
!4710 = !DILocation(line: 4997, column: 35, scope: !4706)
!4711 = !DILocation(line: 4999, column: 41, scope: !4706)
!4712 = !DILocation(line: 4999, column: 47, scope: !4706)
!4713 = !DILocation(line: 4999, column: 10, scope: !4706)
!4714 = !DILocation(line: 4999, column: 3, scope: !4706)
!4715 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !76, file: !76, line: 5020, type: !889, scopeLine: 5021, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4716 = !DILocalVariable(name: "value", arg: 1, scope: !4715, file: !76, line: 5020, type: !29)
!4717 = !DILocation(line: 5020, column: 26, scope: !4715)
!4718 = !DILocalVariable(name: "factor", arg: 2, scope: !4715, file: !76, line: 5020, type: !29)
!4719 = !DILocation(line: 5020, column: 35, scope: !4715)
!4720 = !DILocation(line: 5022, column: 41, scope: !4715)
!4721 = !DILocation(line: 5022, column: 47, scope: !4715)
!4722 = !DILocation(line: 5022, column: 10, scope: !4715)
!4723 = !DILocation(line: 5022, column: 3, scope: !4715)
!4724 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !76, file: !76, line: 5043, type: !889, scopeLine: 5044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !17, retainedNodes: !4)
!4725 = !DILocalVariable(name: "value", arg: 1, scope: !4724, file: !76, line: 5043, type: !29)
!4726 = !DILocation(line: 5043, column: 25, scope: !4724)
!4727 = !DILocalVariable(name: "factor", arg: 2, scope: !4724, file: !76, line: 5043, type: !29)
!4728 = !DILocation(line: 5043, column: 35, scope: !4724)
!4729 = !DILocation(line: 5045, column: 41, scope: !4724)
!4730 = !DILocation(line: 5045, column: 47, scope: !4724)
!4731 = !DILocation(line: 5045, column: 10, scope: !4724)
!4732 = !DILocation(line: 5045, column: 3, scope: !4724)
!4733 = distinct !DISubprogram(name: "MulHighWord", scope: !4734, file: !4734, line: 39, type: !1416, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4734 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0113")
!4735 = !DILocalVariable(name: "arg1", arg: 1, scope: !4733, file: !4734, line: 39, type: !740)
!4736 = !DILocation(line: 39, column: 30, scope: !4733)
!4737 = !DILocalVariable(name: "arg2", arg: 2, scope: !4733, file: !4734, line: 39, type: !740)
!4738 = !DILocation(line: 39, column: 48, scope: !4733)
!4739 = !DILocalVariable(name: "arg1_LW", scope: !4733, file: !4734, line: 41, type: !34)
!4740 = !DILocation(line: 41, column: 6, scope: !4733)
!4741 = !DILocalVariable(name: "arg1_HW", scope: !4733, file: !4734, line: 41, type: !34)
!4742 = !DILocation(line: 41, column: 14, scope: !4733)
!4743 = !DILocalVariable(name: "arg2_LW", scope: !4733, file: !4734, line: 41, type: !34)
!4744 = !DILocation(line: 41, column: 22, scope: !4733)
!4745 = !DILocalVariable(name: "arg2_HW", scope: !4733, file: !4734, line: 41, type: !34)
!4746 = !DILocation(line: 41, column: 30, scope: !4733)
!4747 = !DILocalVariable(name: "MulTemp1", scope: !4733, file: !4734, line: 42, type: !740)
!4748 = !DILocation(line: 42, column: 6, scope: !4733)
!4749 = !DILocalVariable(name: "MulTemp2", scope: !4733, file: !4734, line: 42, type: !740)
!4750 = !DILocation(line: 42, column: 16, scope: !4733)
!4751 = !DILocalVariable(name: "MulTemp3", scope: !4733, file: !4734, line: 42, type: !740)
!4752 = !DILocation(line: 42, column: 26, scope: !4733)
!4753 = !DILocalVariable(name: "MulTemp4", scope: !4733, file: !4734, line: 42, type: !740)
!4754 = !DILocation(line: 42, column: 36, scope: !4733)
!4755 = !DILocalVariable(name: "HIGHWORD", scope: !4733, file: !4734, line: 42, type: !740)
!4756 = !DILocation(line: 42, column: 47, scope: !4733)
!4757 = !DILocalVariable(name: "OverFlow", scope: !4733, file: !4734, line: 42, type: !740)
!4758 = !DILocation(line: 42, column: 57, scope: !4733)
!4759 = !DILocation(line: 43, column: 12, scope: !4733)
!4760 = !DILocation(line: 43, column: 17, scope: !4733)
!4761 = !DILocation(line: 43, column: 10, scope: !4733)
!4762 = !DILocation(line: 44, column: 13, scope: !4733)
!4763 = !DILocation(line: 44, column: 18, scope: !4733)
!4764 = !DILocation(line: 44, column: 31, scope: !4733)
!4765 = !DILocation(line: 44, column: 12, scope: !4733)
!4766 = !DILocation(line: 44, column: 10, scope: !4733)
!4767 = !DILocation(line: 45, column: 12, scope: !4733)
!4768 = !DILocation(line: 45, column: 17, scope: !4733)
!4769 = !DILocation(line: 45, column: 10, scope: !4733)
!4770 = !DILocation(line: 46, column: 13, scope: !4733)
!4771 = !DILocation(line: 46, column: 18, scope: !4733)
!4772 = !DILocation(line: 46, column: 31, scope: !4733)
!4773 = !DILocation(line: 46, column: 12, scope: !4733)
!4774 = !DILocation(line: 46, column: 10, scope: !4733)
!4775 = !DILocation(line: 48, column: 48, scope: !4776)
!4776 = distinct !DILexicalBlock(scope: !4733, file: !4734, line: 48, column: 6)
!4777 = !DILocation(line: 48, column: 43, scope: !4776)
!4778 = !DILocation(line: 48, column: 33, scope: !4776)
!4779 = !DILocation(line: 48, column: 73, scope: !4776)
!4780 = !DILocation(line: 48, column: 68, scope: !4776)
!4781 = !DILocation(line: 48, column: 58, scope: !4776)
!4782 = !DILocation(line: 48, column: 8, scope: !4776)
!4783 = !DILocation(line: 48, column: 6, scope: !4733)
!4784 = !DILocation(line: 49, column: 6, scope: !4785)
!4785 = distinct !DILexicalBlock(scope: !4776, file: !4734, line: 48, column: 85)
!4786 = !DILocation(line: 56, column: 39, scope: !4733)
!4787 = !DILocation(line: 56, column: 34, scope: !4733)
!4788 = !DILocation(line: 56, column: 54, scope: !4733)
!4789 = !DILocation(line: 56, column: 49, scope: !4733)
!4790 = !DILocation(line: 56, column: 47, scope: !4733)
!4791 = !DILocation(line: 56, column: 24, scope: !4733)
!4792 = !DILocation(line: 56, column: 22, scope: !4733)
!4793 = !DILocation(line: 57, column: 2, scope: !4733)
!4794 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !13, file: !13, line: 78, type: !4795, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4795 = !DISubroutineType(types: !4796)
!4796 = !{!11, !6, !6}
!4797 = !DILocalVariable(name: "left", arg: 1, scope: !4794, file: !13, line: 78, type: !6)
!4798 = !DILocation(line: 78, column: 38, scope: !4794)
!4799 = !DILocalVariable(name: "right", arg: 2, scope: !4794, file: !13, line: 78, type: !6)
!4800 = !DILocation(line: 78, column: 52, scope: !4794)
!4801 = !DILocation(line: 80, column: 12, scope: !4794)
!4802 = !DILocation(line: 80, column: 19, scope: !4794)
!4803 = !DILocation(line: 80, column: 17, scope: !4794)
!4804 = !DILocation(line: 80, column: 25, scope: !4794)
!4805 = !DILocation(line: 80, column: 5, scope: !4794)
!4806 = distinct !DISubprogram(name: "MulLowWord", scope: !4734, file: !4734, line: 88, type: !1416, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4807 = !DILocalVariable(name: "arg1", arg: 1, scope: !4806, file: !4734, line: 88, type: !740)
!4808 = !DILocation(line: 88, column: 29, scope: !4806)
!4809 = !DILocalVariable(name: "arg2", arg: 2, scope: !4806, file: !4734, line: 88, type: !740)
!4810 = !DILocation(line: 88, column: 47, scope: !4806)
!4811 = !DILocalVariable(name: "arg1_LW", scope: !4806, file: !4734, line: 90, type: !34)
!4812 = !DILocation(line: 90, column: 6, scope: !4806)
!4813 = !DILocalVariable(name: "arg1_HW", scope: !4806, file: !4734, line: 90, type: !34)
!4814 = !DILocation(line: 90, column: 14, scope: !4806)
!4815 = !DILocalVariable(name: "arg2_LW", scope: !4806, file: !4734, line: 90, type: !34)
!4816 = !DILocation(line: 90, column: 22, scope: !4806)
!4817 = !DILocalVariable(name: "arg2_HW", scope: !4806, file: !4734, line: 90, type: !34)
!4818 = !DILocation(line: 90, column: 30, scope: !4806)
!4819 = !DILocalVariable(name: "MulTemp1", scope: !4806, file: !4734, line: 91, type: !740)
!4820 = !DILocation(line: 91, column: 6, scope: !4806)
!4821 = !DILocalVariable(name: "MulTemp2", scope: !4806, file: !4734, line: 91, type: !740)
!4822 = !DILocation(line: 91, column: 16, scope: !4806)
!4823 = !DILocalVariable(name: "MulTemp3", scope: !4806, file: !4734, line: 91, type: !740)
!4824 = !DILocation(line: 91, column: 26, scope: !4806)
!4825 = !DILocalVariable(name: "MulTemp4", scope: !4806, file: !4734, line: 91, type: !740)
!4826 = !DILocation(line: 91, column: 36, scope: !4806)
!4827 = !DILocalVariable(name: "HIGHWORD", scope: !4806, file: !4734, line: 91, type: !740)
!4828 = !DILocation(line: 91, column: 47, scope: !4806)
!4829 = !DILocalVariable(name: "OverFlow", scope: !4806, file: !4734, line: 91, type: !740)
!4830 = !DILocation(line: 91, column: 57, scope: !4806)
!4831 = !DILocation(line: 92, column: 12, scope: !4806)
!4832 = !DILocation(line: 92, column: 17, scope: !4806)
!4833 = !DILocation(line: 92, column: 10, scope: !4806)
!4834 = !DILocation(line: 93, column: 13, scope: !4806)
!4835 = !DILocation(line: 93, column: 18, scope: !4806)
!4836 = !DILocation(line: 93, column: 31, scope: !4806)
!4837 = !DILocation(line: 93, column: 12, scope: !4806)
!4838 = !DILocation(line: 93, column: 10, scope: !4806)
!4839 = !DILocation(line: 94, column: 12, scope: !4806)
!4840 = !DILocation(line: 94, column: 17, scope: !4806)
!4841 = !DILocation(line: 94, column: 10, scope: !4806)
!4842 = !DILocation(line: 95, column: 13, scope: !4806)
!4843 = !DILocation(line: 95, column: 18, scope: !4806)
!4844 = !DILocation(line: 95, column: 31, scope: !4806)
!4845 = !DILocation(line: 95, column: 12, scope: !4806)
!4846 = !DILocation(line: 95, column: 10, scope: !4806)
!4847 = !DILocation(line: 96, column: 13, scope: !4806)
!4848 = !DILocation(line: 96, column: 23, scope: !4806)
!4849 = !DILocation(line: 96, column: 21, scope: !4806)
!4850 = !DILocation(line: 96, column: 11, scope: !4806)
!4851 = !DILocation(line: 97, column: 13, scope: !4806)
!4852 = !DILocation(line: 97, column: 23, scope: !4806)
!4853 = !DILocation(line: 97, column: 21, scope: !4806)
!4854 = !DILocation(line: 97, column: 11, scope: !4806)
!4855 = !DILocation(line: 98, column: 13, scope: !4806)
!4856 = !DILocation(line: 98, column: 23, scope: !4806)
!4857 = !DILocation(line: 98, column: 21, scope: !4806)
!4858 = !DILocation(line: 98, column: 11, scope: !4806)
!4859 = !DILocation(line: 99, column: 13, scope: !4806)
!4860 = !DILocation(line: 99, column: 23, scope: !4806)
!4861 = !DILocation(line: 99, column: 21, scope: !4806)
!4862 = !DILocation(line: 99, column: 11, scope: !4806)
!4863 = !DILocation(line: 100, column: 14, scope: !4806)
!4864 = !DILocation(line: 100, column: 28, scope: !4806)
!4865 = !DILocation(line: 100, column: 37, scope: !4806)
!4866 = !DILocation(line: 100, column: 46, scope: !4806)
!4867 = !DILocation(line: 100, column: 24, scope: !4806)
!4868 = !DILocation(line: 100, column: 56, scope: !4806)
!4869 = !DILocation(line: 100, column: 65, scope: !4806)
!4870 = !DILocation(line: 100, column: 74, scope: !4806)
!4871 = !DILocation(line: 100, column: 52, scope: !4806)
!4872 = !DILocation(line: 100, column: 11, scope: !4806)
!4873 = !DILocation(line: 102, column: 9, scope: !4806)
!4874 = !DILocation(line: 102, column: 2, scope: !4806)
!4875 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4876, file: !4876, line: 12, type: !4877, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4880)
!4876 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4877 = !DISubroutineType(types: !4878)
!4878 = !{null, !4879}
!4879 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4880 = !{!4881}
!4881 = !DILocalVariable(name: "z", arg: 1, scope: !4875, file: !4876, line: 12, type: !4879)
!4882 = !DILocation(line: 0, scope: !4875)
!4883 = !DILocation(line: 13, column: 9, scope: !4884)
!4884 = distinct !DILexicalBlock(scope: !4875, file: !4876, line: 13, column: 7)
!4885 = !DILocation(line: 13, column: 7, scope: !4875)
!4886 = !DILocation(line: 14, column: 5, scope: !4884)
!4887 = !DILocation(line: 15, column: 1, scope: !4875)
!4888 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4889, file: !4889, line: 20, type: !4890, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4893)
!4889 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4890 = !DISubroutineType(types: !4891)
!4891 = !{null, !4892, !4892}
!4892 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4893 = !{!4894, !4895}
!4894 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4888, file: !4889, line: 20, type: !4892)
!4895 = !DILocalVariable(name: "shift", arg: 2, scope: !4888, file: !4889, line: 20, type: !4892)
!4896 = !DILocation(line: 0, scope: !4888)
!4897 = !DILocation(line: 21, column: 13, scope: !4898)
!4898 = distinct !DILexicalBlock(scope: !4888, file: !4889, line: 21, column: 7)
!4899 = !DILocation(line: 21, column: 7, scope: !4888)
!4900 = !DILocation(line: 27, column: 5, scope: !4901)
!4901 = distinct !DILexicalBlock(scope: !4898, file: !4889, line: 21, column: 26)
!4902 = !DILocation(line: 29, column: 1, scope: !4888)
