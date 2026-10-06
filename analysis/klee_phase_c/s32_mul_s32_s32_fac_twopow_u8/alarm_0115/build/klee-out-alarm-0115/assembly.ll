; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/build/s32_mul_s32_s32_fac_twopow_u8_alarm_0115.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"factor\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"power\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/mul_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [64 x i8] c"KLEE-ALARM-0115: signed overflow. assert -factor <= 2147483647;\00", align 1
@.str.2.5 = private unnamed_addr constant [20 x i8] c"klee-alarm-0115.err\00", align 1
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
  %or.cond3 = select i1 %cmp12, i1 %cmp15, i1 false, !dbg !2561
  br i1 %or.cond3, label %if.then17, label %if.else18, !dbg !2561

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
  br i1 %cmp28, label %if.then30, label %if.else38, !dbg !2589

if.then30:                                        ; preds = %if.end27
  %11 = load i32, i32* %factor.addr, align 4, !dbg !2590
  %conv31 = sext i32 %11 to i64, !dbg !2593
  %call32 = call i32 @klee_alarm_s32_neg_valid(i64 %conv31), !dbg !2594
  %tobool33 = icmp ne i32 %call32, 0, !dbg !2594
  br i1 %tobool33, label %if.end35, label %if.then34, !dbg !2595

if.then34:                                        ; preds = %if.then30
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 2471, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2.5, i64 0, i64 0)) #5, !dbg !2596
  unreachable, !dbg !2596

if.end35:                                         ; preds = %if.then30
  %12 = load i32, i32* %factor.addr, align 4, !dbg !2598
  %sub36 = sub nsw i32 0, %12, !dbg !2599
  %conv37 = sext i32 %sub36 to i64, !dbg !2600
  store volatile i64 %conv37, i64* @klee_alarm_sink_s64, align 8, !dbg !2601
  store i32 0, i32* %retval, align 4, !dbg !2602
  br label %return, !dbg !2602

if.else38:                                        ; preds = %if.end27
  %13 = load i32, i32* %factor.addr, align 4, !dbg !2603
  store i32 %13, i32* %u32Temp2, align 4, !dbg !2605
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !2606
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !2607
  %mul = mul i32 %14, %15, !dbg !2608
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2609
  %16 = load i32, i32* %u32Temp1, align 4, !dbg !2610
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !2611
  %call40 = call i32 @MulHighWord(i32 %16, i32 %17), !dbg !2612
  store i32 %call40, i32* %u32Temp4, align 4, !dbg !2613
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2614
  %19 = load i8, i8* %power.addr, align 1, !dbg !2615
  %conv41 = zext i8 %19 to i32, !dbg !2615
  %sub42 = sub nsw i32 32, %conv41, !dbg !2616
  %int_cast_to_i64 = zext i32 %sub42 to i64, !dbg !2617
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !2617
  %shr = lshr i32 %18, %sub42, !dbg !2617, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2618
  %20 = load i32, i32* %u32Temp4, align 4, !dbg !2619
  %21 = load i8, i8* %power.addr, align 1, !dbg !2620
  %conv43 = zext i8 %21 to i32, !dbg !2620
  %int_cast_to_i641 = zext i32 %conv43 to i64, !dbg !2621
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !2621
  %shl = shl i32 %20, %conv43, !dbg !2621, !klee.check.shift !265
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2622
  %or = or i32 %22, %shl, !dbg !2622
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2622
  %23 = load i32, i32* %u32Temp4, align 4, !dbg !2623
  %24 = load i8, i8* %power.addr, align 1, !dbg !2625
  %conv44 = zext i8 %24 to i32, !dbg !2625
  %sub45 = sub nsw i32 32, %conv44, !dbg !2626
  %int_cast_to_i642 = zext i32 %sub45 to i64, !dbg !2627
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !2627
  %shr46 = lshr i32 %23, %sub45, !dbg !2627, !klee.check.shift !265
  %cmp47 = icmp eq i32 %shr46, 0, !dbg !2628
  br i1 %cmp47, label %if.then49, label %if.else60, !dbg !2629

if.then49:                                        ; preds = %if.else38
  %25 = load i8, i8* %u8SignBit, align 1, !dbg !2630
  %conv50 = zext i8 %25 to i32, !dbg !2630
  %cmp51 = icmp eq i32 %conv50, 0, !dbg !2633
  br i1 %cmp51, label %if.then53, label %if.else58, !dbg !2634

if.then53:                                        ; preds = %if.then49
  %26 = load i32, i32* %u32Temp3, align 4, !dbg !2635
  %cmp54 = icmp ule i32 %26, 2147483647, !dbg !2638
  br i1 %cmp54, label %if.then56, label %if.else57, !dbg !2639

if.then56:                                        ; preds = %if.then53
  %27 = load i32, i32* %u32Temp3, align 4, !dbg !2640
  store i32 %27, i32* %retval, align 4, !dbg !2641
  br label %return, !dbg !2641

if.else57:                                        ; preds = %if.then53
  store i32 2147483647, i32* %retval, align 4, !dbg !2642
  br label %return, !dbg !2642

if.else58:                                        ; preds = %if.then49
  %28 = load i32, i32* %u32Temp3, align 4, !dbg !2643
  %sub59 = sub i32 0, %28, !dbg !2645
  store i32 %sub59, i32* %retval, align 4, !dbg !2646
  br label %return, !dbg !2646

if.else60:                                        ; preds = %if.else38
  %29 = load i8, i8* %u8SignBit, align 1, !dbg !2647
  %conv61 = zext i8 %29 to i32, !dbg !2647
  %cmp62 = icmp eq i32 %conv61, 0, !dbg !2650
  br i1 %cmp62, label %if.then64, label %if.else65, !dbg !2651

if.then64:                                        ; preds = %if.else60
  store i32 2147483647, i32* %retval, align 4, !dbg !2652
  br label %return, !dbg !2652

if.else65:                                        ; preds = %if.else60
  store i32 -2147483648, i32* %retval, align 4, !dbg !2654
  br label %return, !dbg !2654

return:                                           ; preds = %if.else65, %if.then64, %if.else58, %if.else57, %if.then56, %if.end35, %if.then24
  %30 = load i32, i32* %retval, align 4, !dbg !2656
  ret i32 %30, !dbg !2656
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !2657 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !2660, metadata !DIExpression()), !dbg !2661
  %0 = load i64, i64* %value.addr, align 8, !dbg !2662
  %cmp = icmp ne i64 %0, -2147483648, !dbg !2663
  %conv = zext i1 %cmp to i32, !dbg !2663
  ret i32 %conv, !dbg !2664
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !2665 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2668, metadata !DIExpression()), !dbg !2669
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2670, metadata !DIExpression()), !dbg !2671
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2672, metadata !DIExpression()), !dbg !2673
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2674, metadata !DIExpression()), !dbg !2675
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2676, metadata !DIExpression()), !dbg !2677
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2678, metadata !DIExpression()), !dbg !2679
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2680, metadata !DIExpression()), !dbg !2681
  %0 = load i32, i32* %value.addr, align 4, !dbg !2682
  %cmp = icmp slt i32 %0, 0, !dbg !2684
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2685

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2686
  %conv = sext i8 %1 to i32, !dbg !2686
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2687
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2688

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2689
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2690
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2691

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2692
  %conv6 = sext i8 %3 to i32, !dbg !2692
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2693
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2694

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2695
  br label %if.end, !dbg !2697

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2698
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2700
  %cmp9 = icmp slt i32 %4, 0, !dbg !2702
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2703

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2704
  %sub = sub nsw i32 0, %5, !dbg !2706
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2707
  br label %if.end13, !dbg !2708

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2709
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2711
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2712
  %conv14 = sext i8 %7 to i32, !dbg !2712
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2714
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2715

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2716
  %conv18 = sext i8 %8 to i32, !dbg !2716
  %sub19 = sub nsw i32 0, %conv18, !dbg !2718
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2719
  br label %if.end22, !dbg !2720

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2721
  %conv21 = sext i8 %9 to i32, !dbg !2721
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2723
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2724
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2725
  %mul = mul i32 %10, %11, !dbg !2726
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2727
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2728
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2729
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2730
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2731
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2732
  %shr = lshr i32 %14, 7, !dbg !2733
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2734
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2735
  %shl = shl i32 %15, 25, !dbg !2736
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2737
  %or = or i32 %16, %shl, !dbg !2737
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2737
  %17 = load i8, i8* %u8SignBit, align 1, !dbg !2738
  %conv23 = zext i8 %17 to i32, !dbg !2738
  %cmp24 = icmp eq i32 %conv23, 0, !dbg !2740
  br i1 %cmp24, label %if.then26, label %if.else31, !dbg !2741

if.then26:                                        ; preds = %if.end22
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2742
  %cmp27 = icmp ule i32 %18, 2147483647, !dbg !2745
  br i1 %cmp27, label %if.then29, label %if.else30, !dbg !2746

if.then29:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2747
  store i32 %19, i32* %retval, align 4, !dbg !2748
  br label %return, !dbg !2748

if.else30:                                        ; preds = %if.then26
  store i32 2147483647, i32* %retval, align 4, !dbg !2749
  br label %return, !dbg !2749

if.else31:                                        ; preds = %if.end22
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2750
  %sub32 = sub i32 0, %20, !dbg !2752
  store i32 %sub32, i32* %retval, align 4, !dbg !2753
  br label %return, !dbg !2753

return:                                           ; preds = %if.else31, %if.else30, %if.then29
  %21 = load i32, i32* %retval, align 4, !dbg !2754
  ret i32 %21, !dbg !2754
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !2755 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2756, metadata !DIExpression()), !dbg !2757
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !2758, metadata !DIExpression()), !dbg !2759
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2760, metadata !DIExpression()), !dbg !2761
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2762, metadata !DIExpression()), !dbg !2763
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2764, metadata !DIExpression()), !dbg !2765
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2766, metadata !DIExpression()), !dbg !2767
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2768, metadata !DIExpression()), !dbg !2769
  %0 = load i32, i32* %value.addr, align 4, !dbg !2770
  %cmp = icmp slt i32 %0, 0, !dbg !2772
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !2773

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !2774
  %conv = sext i8 %1 to i32, !dbg !2774
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !2775
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !2776

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2777
  %cmp3 = icmp sgt i32 %2, 0, !dbg !2778
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !2779

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !2780
  %conv6 = sext i8 %3 to i32, !dbg !2780
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !2781
  br i1 %cmp7, label %if.then, label %if.else, !dbg !2782

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !2783
  br label %if.end, !dbg !2785

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2786
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !2788
  %cmp9 = icmp slt i32 %4, 0, !dbg !2790
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !2791

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !2792
  %sub = sub nsw i32 0, %5, !dbg !2794
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2795
  br label %if.end13, !dbg !2796

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !2797
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2799
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !2800
  %conv14 = sext i8 %7 to i32, !dbg !2800
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !2802
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !2803

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !2804
  %conv18 = sext i8 %8 to i32, !dbg !2804
  %sub19 = sub nsw i32 0, %conv18, !dbg !2806
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !2807
  br label %if.end22, !dbg !2808

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !2809
  %conv21 = sext i8 %9 to i32, !dbg !2809
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !2811
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2812
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2813
  %mul = mul i32 %10, %11, !dbg !2814
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2815
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2816
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2817
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2818
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2819
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !2820
  %shr = lshr i32 %14, 6, !dbg !2821
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !2822
  %15 = load i32, i32* %u32Temp4, align 4, !dbg !2823
  %shl = shl i32 %15, 26, !dbg !2824
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2825
  %or = or i32 %16, %shl, !dbg !2825
  store i32 %or, i32* %u32Temp3, align 4, !dbg !2825
  %17 = load i32, i32* %u32Temp4, align 4, !dbg !2826
  %shr23 = lshr i32 %17, 6, !dbg !2828
  %cmp24 = icmp eq i32 %shr23, 0, !dbg !2829
  br i1 %cmp24, label %if.then26, label %if.else41, !dbg !2830

if.then26:                                        ; preds = %if.end22
  %18 = load i8, i8* %u8SignBit, align 1, !dbg !2831
  %conv27 = zext i8 %18 to i32, !dbg !2831
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2834
  br i1 %cmp28, label %if.then30, label %if.else35, !dbg !2835

if.then30:                                        ; preds = %if.then26
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2836
  %cmp31 = icmp ule i32 %19, 2147483647, !dbg !2839
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2840

if.then33:                                        ; preds = %if.then30
  %20 = load i32, i32* %u32Temp3, align 4, !dbg !2841
  store i32 %20, i32* %retval, align 4, !dbg !2842
  br label %return, !dbg !2842

if.else34:                                        ; preds = %if.then30
  store i32 2147483647, i32* %retval, align 4, !dbg !2843
  br label %return, !dbg !2843

if.else35:                                        ; preds = %if.then26
  %21 = load i32, i32* %u32Temp3, align 4, !dbg !2844
  %cmp36 = icmp ule i32 %21, -2147483648, !dbg !2847
  br i1 %cmp36, label %if.then38, label %if.else40, !dbg !2848

if.then38:                                        ; preds = %if.else35
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !2849
  %sub39 = sub i32 0, %22, !dbg !2850
  store i32 %sub39, i32* %retval, align 4, !dbg !2851
  br label %return, !dbg !2851

if.else40:                                        ; preds = %if.else35
  store i32 -2147483648, i32* %retval, align 4, !dbg !2852
  br label %return, !dbg !2852

if.else41:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !2853
  br label %return, !dbg !2853

return:                                           ; preds = %if.else41, %if.else40, %if.then38, %if.else34, %if.then33
  %23 = load i32, i32* %retval, align 4, !dbg !2855
  ret i32 %23, !dbg !2855
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32(i32 %val1, i32 %val2) #0 !dbg !2856 {
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
  call void @llvm.dbg.declare(metadata i32* %val1.addr, metadata !2857, metadata !DIExpression()), !dbg !2858
  store i32 %val2, i32* %val2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %val2.addr, metadata !2859, metadata !DIExpression()), !dbg !2860
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2861, metadata !DIExpression()), !dbg !2862
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2863, metadata !DIExpression()), !dbg !2864
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !2865, metadata !DIExpression()), !dbg !2866
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !2867, metadata !DIExpression()), !dbg !2868
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2869, metadata !DIExpression()), !dbg !2870
  %0 = load i32, i32* %val1.addr, align 4, !dbg !2871
  %cmp = icmp slt i32 %0, 0, !dbg !2873
  %1 = load i32, i32* %val2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !2874
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !2874

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %val1.addr, align 4, !dbg !2875
  %cmp2 = icmp sgt i32 %2, 0, !dbg !2876
  %3 = load i32, i32* %val2.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !2877
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !2877

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !2878
  br label %if.end, !dbg !2880

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !2881
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %val1.addr, align 4, !dbg !2883
  %cmp5 = icmp slt i32 %4, 0, !dbg !2885
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !2886

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %val1.addr, align 4, !dbg !2887
  %sub = sub nsw i32 0, %5, !dbg !2889
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2890
  br label %if.end8, !dbg !2891

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %val1.addr, align 4, !dbg !2892
  store i32 %6, i32* %u32Temp1, align 4, !dbg !2894
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %val2.addr, align 4, !dbg !2895
  %cmp9 = icmp slt i32 %7, 0, !dbg !2897
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !2898

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %val2.addr, align 4, !dbg !2899
  %sub11 = sub nsw i32 0, %8, !dbg !2901
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !2902
  br label %if.end13, !dbg !2903

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %val2.addr, align 4, !dbg !2904
  store i32 %9, i32* %u32Temp2, align 4, !dbg !2906
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !2907
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !2908
  %mul = mul i32 %10, %11, !dbg !2909
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !2910
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !2911
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !2912
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !2913
  store i32 %call, i32* %u32Temp4, align 4, !dbg !2914
  %14 = load i32, i32* %u32Temp4, align 4, !dbg !2915
  %cmp14 = icmp eq i32 %14, 0, !dbg !2917
  br i1 %cmp14, label %if.then15, label %if.else29, !dbg !2918

if.then15:                                        ; preds = %if.end13
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !2919
  %conv = zext i8 %15 to i32, !dbg !2919
  %cmp16 = icmp eq i32 %conv, 0, !dbg !2922
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !2923

if.then18:                                        ; preds = %if.then15
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !2924
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !2927
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !2928

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !2929
  store i32 %17, i32* %retval, align 4, !dbg !2930
  br label %return, !dbg !2930

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !2931
  br label %return, !dbg !2931

if.else23:                                        ; preds = %if.then15
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !2932
  %cmp24 = icmp ule i32 %18, -2147483648, !dbg !2935
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !2936

if.then26:                                        ; preds = %if.else23
  %19 = load i32, i32* %u32Temp3, align 4, !dbg !2937
  %sub27 = sub i32 0, %19, !dbg !2938
  store i32 %sub27, i32* %retval, align 4, !dbg !2939
  br label %return, !dbg !2939

if.else28:                                        ; preds = %if.else23
  store i32 -2147483648, i32* %retval, align 4, !dbg !2940
  br label %return, !dbg !2940

if.else29:                                        ; preds = %if.end13
  %20 = load i8, i8* %u8SignBit, align 1, !dbg !2941
  %conv30 = zext i8 %20 to i32, !dbg !2941
  %cmp31 = icmp eq i32 %conv30, 0, !dbg !2944
  br i1 %cmp31, label %if.then33, label %if.else34, !dbg !2945

if.then33:                                        ; preds = %if.else29
  store i32 2147483647, i32* %retval, align 4, !dbg !2946
  br label %return, !dbg !2946

if.else34:                                        ; preds = %if.else29
  store i32 -2147483648, i32* %retval, align 4, !dbg !2948
  br label %return, !dbg !2948

return:                                           ; preds = %if.else34, %if.then33, %if.else28, %if.then26, %if.else22, %if.then21
  %21 = load i32, i32* %retval, align 4, !dbg !2950
  ret i32 %21, !dbg !2950
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !2951 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2952, metadata !DIExpression()), !dbg !2953
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2954, metadata !DIExpression()), !dbg !2955
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !2956, metadata !DIExpression()), !dbg !2957
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !2958, metadata !DIExpression()), !dbg !2959
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !2960, metadata !DIExpression()), !dbg !2961
  %0 = load i32, i32* %value.addr, align 4, !dbg !2962
  %cmp = icmp slt i32 %0, 0, !dbg !2964
  br i1 %cmp, label %if.then, label %if.else, !dbg !2965

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !2966
  %sub = sub nsw i32 0, %1, !dbg !2968
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !2969
  store i8 1, i8* %u8SignBit, align 1, !dbg !2970
  br label %if.end, !dbg !2971

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !2972
  store i32 %2, i32* %u32Temp1, align 4, !dbg !2974
  store i8 0, i8* %u8SignBit, align 1, !dbg !2975
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !2976
  %4 = load i32, i32* %factor.addr, align 4, !dbg !2977
  %call = call i32 @MulHighWord(i32 %3, i32 %4), !dbg !2978
  store i32 %call, i32* %u32Temp2, align 4, !dbg !2979
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !2980
  %shr = lshr i32 %5, 1, !dbg !2981
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !2982
  %6 = load i8, i8* %u8SignBit, align 1, !dbg !2983
  %conv = zext i8 %6 to i32, !dbg !2983
  %cmp1 = icmp eq i32 %conv, 0, !dbg !2985
  br i1 %cmp1, label %if.then3, label %if.else4, !dbg !2986

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !2987
  store i32 %7, i32* %retval, align 4, !dbg !2989
  br label %return, !dbg !2989

if.else4:                                         ; preds = %if.end
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !2990
  %sub5 = sub i32 0, %8, !dbg !2992
  store i32 %sub5, i32* %retval, align 4, !dbg !2993
  br label %return, !dbg !2993

return:                                           ; preds = %if.else4, %if.then3
  %9 = load i32, i32* %retval, align 4, !dbg !2994
  ret i32 %9, !dbg !2994
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !2995 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !2996, metadata !DIExpression()), !dbg !2997
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !2998, metadata !DIExpression()), !dbg !2999
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3000, metadata !DIExpression()), !dbg !3001
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3002, metadata !DIExpression()), !dbg !3003
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3004, metadata !DIExpression()), !dbg !3005
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3006, metadata !DIExpression()), !dbg !3007
  %0 = load i32, i32* %value.addr, align 4, !dbg !3008
  %cmp = icmp slt i32 %0, 0, !dbg !3010
  %1 = load i32, i32* %factor.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  %or.cond = select i1 %cmp, i1 %cmp1, i1 false, !dbg !3011
  br i1 %or.cond, label %if.then, label %lor.lhs.false, !dbg !3011

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3012
  %cmp2 = icmp sgt i32 %2, 0, !dbg !3013
  %3 = load i32, i32* %factor.addr, align 4
  %cmp4 = icmp slt i32 %3, 0
  %or.cond1 = select i1 %cmp2, i1 %cmp4, i1 false, !dbg !3014
  br i1 %or.cond1, label %if.then, label %if.else, !dbg !3014

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3015
  br label %if.end, !dbg !3017

if.else:                                          ; preds = %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3018
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3020
  %cmp5 = icmp slt i32 %4, 0, !dbg !3022
  br i1 %cmp5, label %if.then6, label %if.else7, !dbg !3023

if.then6:                                         ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3024
  %sub = sub nsw i32 0, %5, !dbg !3026
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3027
  br label %if.end8, !dbg !3028

if.else7:                                         ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3029
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3031
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %if.then6
  %7 = load i32, i32* %factor.addr, align 4, !dbg !3032
  %cmp9 = icmp slt i32 %7, 0, !dbg !3034
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !3035

if.then10:                                        ; preds = %if.end8
  %8 = load i32, i32* %factor.addr, align 4, !dbg !3036
  %sub11 = sub nsw i32 0, %8, !dbg !3038
  store i32 %sub11, i32* %u32Temp2, align 4, !dbg !3039
  br label %if.end13, !dbg !3040

if.else12:                                        ; preds = %if.end8
  %9 = load i32, i32* %factor.addr, align 4, !dbg !3041
  store i32 %9, i32* %u32Temp2, align 4, !dbg !3043
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3044
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3045
  %call = call i32 @MulHighWord(i32 %10, i32 %11), !dbg !3046
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3047
  %12 = load i8, i8* %u8SignBit, align 1, !dbg !3048
  %conv = zext i8 %12 to i32, !dbg !3048
  %cmp14 = icmp eq i32 %conv, 0, !dbg !3050
  br i1 %cmp14, label %if.then16, label %if.else17, !dbg !3051

if.then16:                                        ; preds = %if.end13
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !3052
  store i32 %13, i32* %retval, align 4, !dbg !3054
  br label %return, !dbg !3054

if.else17:                                        ; preds = %if.end13
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3055
  %sub18 = sub i32 0, %14, !dbg !3057
  store i32 %sub18, i32* %retval, align 4, !dbg !3058
  br label %return, !dbg !3058

return:                                           ; preds = %if.else17, %if.then16
  %15 = load i32, i32* %retval, align 4, !dbg !3059
  ret i32 %15, !dbg !3059
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac1(i32 %value, i8 zeroext %factor) #0 !dbg !3060 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3063, metadata !DIExpression()), !dbg !3064
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3065, metadata !DIExpression()), !dbg !3066
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3067, metadata !DIExpression()), !dbg !3068
  store i32 0, i32* %u32Temp1, align 4, !dbg !3068
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3069, metadata !DIExpression()), !dbg !3070
  store i32 0, i32* %u32Temp2, align 4, !dbg !3070
  %0 = load i32, i32* %value.addr, align 4, !dbg !3071
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3072
  %conv = zext i8 %1 to i32, !dbg !3072
  %mul = mul i32 %0, %conv, !dbg !3073
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3074
  %2 = load i32, i32* %value.addr, align 4, !dbg !3075
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3076
  %conv1 = zext i8 %3 to i32, !dbg !3076
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3077
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3078
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3079
  %shr = lshr i32 %4, 8, !dbg !3080
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3081
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3082
  %shl = shl i32 %5, 24, !dbg !3083
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3084
  %or = or i32 %6, %shl, !dbg !3084
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3084
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3085
  ret i32 %7, !dbg !3086
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac2(i32 %value, i8 zeroext %factor) #0 !dbg !3087 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3088, metadata !DIExpression()), !dbg !3089
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3090, metadata !DIExpression()), !dbg !3091
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3092, metadata !DIExpression()), !dbg !3093
  store i32 0, i32* %u32Temp1, align 4, !dbg !3093
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3094, metadata !DIExpression()), !dbg !3095
  store i32 0, i32* %u32Temp2, align 4, !dbg !3095
  %0 = load i32, i32* %value.addr, align 4, !dbg !3096
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3097
  %conv = zext i8 %1 to i32, !dbg !3097
  %mul = mul i32 %0, %conv, !dbg !3098
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3099
  %2 = load i32, i32* %value.addr, align 4, !dbg !3100
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3101
  %conv1 = zext i8 %3 to i32, !dbg !3101
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !3102
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3103
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !3104
  %shr = lshr i32 %4, 7, !dbg !3105
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3106
  %5 = load i32, i32* %u32Temp2, align 4, !dbg !3107
  %shl = shl i32 %5, 25, !dbg !3108
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !3109
  %or = or i32 %6, %shl, !dbg !3109
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3109
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3110
  %shr2 = lshr i32 %7, 7, !dbg !3112
  %cmp = icmp eq i32 %shr2, 0, !dbg !3113
  br i1 %cmp, label %if.then, label %if.else, !dbg !3114

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3115
  store i32 %8, i32* %retval, align 4, !dbg !3117
  br label %return, !dbg !3117

if.else:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !3118
  br label %return, !dbg !3118

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3120
  ret i32 %9, !dbg !3120
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac1(i32 %value, i8 signext %factor) #0 !dbg !3121 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3124, metadata !DIExpression()), !dbg !3125
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3126, metadata !DIExpression()), !dbg !3127
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3128, metadata !DIExpression()), !dbg !3129
  store i32 0, i32* %u32Temp1, align 4, !dbg !3129
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3130, metadata !DIExpression()), !dbg !3131
  store i32 0, i32* %u32Temp2, align 4, !dbg !3131
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3132
  %conv = sext i8 %0 to i32, !dbg !3132
  %cmp = icmp sgt i32 %conv, 0, !dbg !3134
  br i1 %cmp, label %if.then, label %if.else, !dbg !3135

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3136
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3138
  %conv2 = sext i8 %2 to i32, !dbg !3138
  %mul = mul i32 %1, %conv2, !dbg !3139
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3140
  %3 = load i32, i32* %value.addr, align 4, !dbg !3141
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3142
  %conv3 = sext i8 %4 to i32, !dbg !3142
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3143
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3144
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3145
  %shr = lshr i32 %5, 7, !dbg !3146
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3147
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3148
  %shl = shl i32 %6, 25, !dbg !3149
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3150
  %or = or i32 %7, %shl, !dbg !3150
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3150
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !3151
  store i32 %8, i32* %retval, align 4, !dbg !3152
  br label %return, !dbg !3152

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3153
  br label %return, !dbg !3153

return:                                           ; preds = %if.else, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !3155
  ret i32 %9, !dbg !3155
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac2(i32 %value, i8 signext %factor) #0 !dbg !3156 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3157, metadata !DIExpression()), !dbg !3158
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3159, metadata !DIExpression()), !dbg !3160
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3161, metadata !DIExpression()), !dbg !3162
  store i32 0, i32* %u32Temp1, align 4, !dbg !3162
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3163, metadata !DIExpression()), !dbg !3164
  store i32 0, i32* %u32Temp2, align 4, !dbg !3164
  %0 = load i8, i8* %factor.addr, align 1, !dbg !3165
  %conv = sext i8 %0 to i32, !dbg !3165
  %cmp = icmp sle i32 %conv, 0, !dbg !3167
  br i1 %cmp, label %if.then, label %if.else, !dbg !3168

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !3169
  br label %return, !dbg !3169

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %value.addr, align 4, !dbg !3171
  %2 = load i8, i8* %factor.addr, align 1, !dbg !3173
  %conv2 = sext i8 %2 to i32, !dbg !3173
  %mul = mul i32 %1, %conv2, !dbg !3174
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !3175
  %3 = load i32, i32* %value.addr, align 4, !dbg !3176
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3177
  %conv3 = sext i8 %4 to i32, !dbg !3177
  %call = call i32 @MulHighWord(i32 %3, i32 %conv3), !dbg !3178
  store i32 %call, i32* %u32Temp2, align 4, !dbg !3179
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3180
  %shr = lshr i32 %5, 6, !dbg !3181
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !3182
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !3183
  %shl = shl i32 %6, 26, !dbg !3184
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !3185
  %or = or i32 %7, %shl, !dbg !3185
  store i32 %or, i32* %u32Temp1, align 4, !dbg !3185
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !3186
  %shr4 = lshr i32 %8, 6, !dbg !3188
  %cmp5 = icmp eq i32 %shr4, 0, !dbg !3189
  br i1 %cmp5, label %if.then7, label %if.else8, !dbg !3190

if.then7:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !3191
  store i32 %9, i32* %retval, align 4, !dbg !3193
  br label %return, !dbg !3193

if.else8:                                         ; preds = %if.else
  store i32 -1, i32* %retval, align 4, !dbg !3194
  br label %return, !dbg !3194

return:                                           ; preds = %if.else8, %if.then7, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !3196
  ret i32 %10, !dbg !3196
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac0125(i16 signext %value, i16 signext %factor) #0 !dbg !3197 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3198, metadata !DIExpression()), !dbg !3199
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3200, metadata !DIExpression()), !dbg !3201
  %0 = load i16, i16* %value.addr, align 2, !dbg !3202
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3203
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 262144), !dbg !3204
  ret i16 %call, !dbg !3205
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac025(i16 signext %value, i16 signext %factor) #0 !dbg !3206 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3207, metadata !DIExpression()), !dbg !3208
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3209, metadata !DIExpression()), !dbg !3210
  %0 = load i16, i16* %value.addr, align 2, !dbg !3211
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3212
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 131072), !dbg !3213
  ret i16 %call, !dbg !3214
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac05(i16 signext %value, i16 signext %factor) #0 !dbg !3215 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3216, metadata !DIExpression()), !dbg !3217
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3218, metadata !DIExpression()), !dbg !3219
  %0 = load i16, i16* %value.addr, align 2, !dbg !3220
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3221
  %call = call signext i16 @root_s16_mul_s16_s16_fac_less1(i16 signext %0, i16 signext %1, i32 65536), !dbg !3222
  ret i16 %call, !dbg !3223
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac1024(i16 signext %value, i16 signext %factor) #0 !dbg !3224 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3225, metadata !DIExpression()), !dbg !3226
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3227, metadata !DIExpression()), !dbg !3228
  %0 = load i16, i16* %value.addr, align 2, !dbg !3229
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3230
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 32), !dbg !3231
  ret i16 %call, !dbg !3232
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac128(i16 signext %value, i16 signext %factor) #0 !dbg !3233 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3234, metadata !DIExpression()), !dbg !3235
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3236, metadata !DIExpression()), !dbg !3237
  %0 = load i16, i16* %value.addr, align 2, !dbg !3238
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3239
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 256), !dbg !3240
  ret i16 %call, !dbg !3241
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac16(i16 signext %value, i16 signext %factor) #0 !dbg !3242 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3243, metadata !DIExpression()), !dbg !3244
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3245, metadata !DIExpression()), !dbg !3246
  %0 = load i16, i16* %value.addr, align 2, !dbg !3247
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3248
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 2048), !dbg !3249
  ret i16 %call, !dbg !3250
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac2048(i16 signext %value, i16 signext %factor) #0 !dbg !3251 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3252, metadata !DIExpression()), !dbg !3253
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3254, metadata !DIExpression()), !dbg !3255
  %0 = load i16, i16* %value.addr, align 2, !dbg !3256
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3257
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 16), !dbg !3258
  ret i16 %call, !dbg !3259
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac256(i16 signext %value, i16 signext %factor) #0 !dbg !3260 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3261, metadata !DIExpression()), !dbg !3262
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3263, metadata !DIExpression()), !dbg !3264
  %0 = load i16, i16* %value.addr, align 2, !dbg !3265
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3266
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 128), !dbg !3267
  ret i16 %call, !dbg !3268
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac32(i16 signext %value, i16 signext %factor) #0 !dbg !3269 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3270, metadata !DIExpression()), !dbg !3271
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3272, metadata !DIExpression()), !dbg !3273
  %0 = load i16, i16* %value.addr, align 2, !dbg !3274
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3275
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 1024), !dbg !3276
  ret i16 %call, !dbg !3277
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4(i16 signext %value, i16 signext %factor) #0 !dbg !3278 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3279, metadata !DIExpression()), !dbg !3280
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3281, metadata !DIExpression()), !dbg !3282
  %0 = load i16, i16* %value.addr, align 2, !dbg !3283
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3284
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8192), !dbg !3285
  ret i16 %call, !dbg !3286
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac4096(i16 signext %value, i16 signext %factor) #0 !dbg !3287 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3288, metadata !DIExpression()), !dbg !3289
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3290, metadata !DIExpression()), !dbg !3291
  %0 = load i16, i16* %value.addr, align 2, !dbg !3292
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3293
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 8), !dbg !3294
  ret i16 %call, !dbg !3295
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac512(i16 signext %value, i16 signext %factor) #0 !dbg !3296 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3297, metadata !DIExpression()), !dbg !3298
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3299, metadata !DIExpression()), !dbg !3300
  %0 = load i16, i16* %value.addr, align 2, !dbg !3301
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3302
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 64), !dbg !3303
  ret i16 %call, !dbg !3304
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac64(i16 signext %value, i16 signext %factor) #0 !dbg !3305 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3306, metadata !DIExpression()), !dbg !3307
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3308, metadata !DIExpression()), !dbg !3309
  %0 = load i16, i16* %value.addr, align 2, !dbg !3310
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3311
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 512), !dbg !3312
  ret i16 %call, !dbg !3313
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_fac8(i16 signext %value, i16 signext %factor) #0 !dbg !3314 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3315, metadata !DIExpression()), !dbg !3316
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3317, metadata !DIExpression()), !dbg !3318
  %0 = load i16, i16* %value.addr, align 2, !dbg !3319
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3320
  %call = call signext i16 @root_s16_mul_s16_s16_fac_greater1(i16 signext %0, i16 signext %1, i32 4096), !dbg !3321
  ret i16 %call, !dbg !3322
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac0125(i16 signext %value, i16 zeroext %factor) #0 !dbg !3323 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3324, metadata !DIExpression()), !dbg !3325
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3326, metadata !DIExpression()), !dbg !3327
  %0 = load i16, i16* %value.addr, align 2, !dbg !3328
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3329
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 524288), !dbg !3330
  ret i16 %call, !dbg !3331
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac025(i16 signext %value, i16 zeroext %factor) #0 !dbg !3332 {
entry:
  %retval = alloca i16, align 2
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3333, metadata !DIExpression()), !dbg !3334
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3335, metadata !DIExpression()), !dbg !3336
  %0 = load i16, i16* %value.addr, align 2, !dbg !3337
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3338
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 262144), !dbg !3339
  %2 = load i16, i16* %retval, align 2, !dbg !3340
  ret i16 %2, !dbg !3340
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac05(i16 signext %value, i16 zeroext %factor) #0 !dbg !3341 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3342, metadata !DIExpression()), !dbg !3343
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3344, metadata !DIExpression()), !dbg !3345
  %0 = load i16, i16* %value.addr, align 2, !dbg !3346
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3347
  %call = call signext i16 @root_s16_mul_s16_u16_fac_less1(i16 signext %0, i16 zeroext %1, i32 131072), !dbg !3348
  ret i16 %call, !dbg !3349
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac1024(i16 signext %value, i16 zeroext %factor) #0 !dbg !3350 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3351, metadata !DIExpression()), !dbg !3352
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3353, metadata !DIExpression()), !dbg !3354
  %0 = load i16, i16* %value.addr, align 2, !dbg !3355
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3356
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 64), !dbg !3357
  ret i16 %call, !dbg !3358
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac128(i16 signext %value, i16 zeroext %factor) #0 !dbg !3359 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3360, metadata !DIExpression()), !dbg !3361
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3362, metadata !DIExpression()), !dbg !3363
  %0 = load i16, i16* %value.addr, align 2, !dbg !3364
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3365
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 512), !dbg !3366
  ret i16 %call, !dbg !3367
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac16(i16 signext %value, i16 zeroext %factor) #0 !dbg !3368 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3369, metadata !DIExpression()), !dbg !3370
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3371, metadata !DIExpression()), !dbg !3372
  %0 = load i16, i16* %value.addr, align 2, !dbg !3373
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3374
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !3375
  ret i16 %call, !dbg !3376
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac2048(i16 signext %value, i16 zeroext %factor) #0 !dbg !3377 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3378, metadata !DIExpression()), !dbg !3379
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3380, metadata !DIExpression()), !dbg !3381
  %0 = load i16, i16* %value.addr, align 2, !dbg !3382
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3383
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 32), !dbg !3384
  ret i16 %call, !dbg !3385
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac256(i16 signext %value, i16 zeroext %factor) #0 !dbg !3386 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3387, metadata !DIExpression()), !dbg !3388
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3389, metadata !DIExpression()), !dbg !3390
  %0 = load i16, i16* %value.addr, align 2, !dbg !3391
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3392
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 256), !dbg !3393
  ret i16 %call, !dbg !3394
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac32(i16 signext %value, i16 zeroext %factor) #0 !dbg !3395 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3396, metadata !DIExpression()), !dbg !3397
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3398, metadata !DIExpression()), !dbg !3399
  %0 = load i16, i16* %value.addr, align 2, !dbg !3400
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3401
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !3402
  ret i16 %call, !dbg !3403
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4(i16 signext %value, i16 zeroext %factor) #0 !dbg !3404 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3405, metadata !DIExpression()), !dbg !3406
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3407, metadata !DIExpression()), !dbg !3408
  %0 = load i16, i16* %value.addr, align 2, !dbg !3409
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3410
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !3411
  ret i16 %call, !dbg !3412
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac4096(i16 signext %value, i16 zeroext %factor) #0 !dbg !3413 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3414, metadata !DIExpression()), !dbg !3415
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3416, metadata !DIExpression()), !dbg !3417
  %0 = load i16, i16* %value.addr, align 2, !dbg !3418
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3419
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 16), !dbg !3420
  ret i16 %call, !dbg !3421
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac512(i16 signext %value, i16 zeroext %factor) #0 !dbg !3422 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3423, metadata !DIExpression()), !dbg !3424
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3425, metadata !DIExpression()), !dbg !3426
  %0 = load i16, i16* %value.addr, align 2, !dbg !3427
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3428
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 128), !dbg !3429
  ret i16 %call, !dbg !3430
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac64(i16 signext %value, i16 zeroext %factor) #0 !dbg !3431 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3432, metadata !DIExpression()), !dbg !3433
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3434, metadata !DIExpression()), !dbg !3435
  %0 = load i16, i16* %value.addr, align 2, !dbg !3436
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3437
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !3438
  ret i16 %call, !dbg !3439
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_fac8(i16 signext %value, i16 zeroext %factor) #0 !dbg !3440 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3441, metadata !DIExpression()), !dbg !3442
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3443, metadata !DIExpression()), !dbg !3444
  %0 = load i16, i16* %value.addr, align 2, !dbg !3445
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3446
  %call = call signext i16 @root_s16_mul_s16_u16_fac_greater1(i16 signext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !3447
  ret i16 %call, !dbg !3448
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac0125(i16 signext %value, i8 zeroext %factor) #0 !dbg !3449 {
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
  %shl = shl i32 %conv1, 5, !dbg !3457
  %conv2 = trunc i32 %shl to i16, !dbg !3458
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3459
  ret i16 %call, !dbg !3460
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac025(i16 signext %value, i8 zeroext %factor) #0 !dbg !3461 {
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
  %shl = shl i32 %conv1, 6, !dbg !3469
  %conv2 = trunc i32 %shl to i16, !dbg !3470
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3471
  ret i16 %call, !dbg !3472
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac05(i16 signext %value, i8 zeroext %factor) #0 !dbg !3473 {
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
  %call = call signext i16 @root_s16_mul_s16_u8_fac_less1(i16 signext %0, i16 zeroext %conv2), !dbg !3483
  ret i16 %call, !dbg !3484
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac128(i16 signext %value, i8 zeroext %factor) #0 !dbg !3485 {
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
  %shl = shl i32 %conv1, 7, !dbg !3493
  %conv2 = trunc i32 %shl to i16, !dbg !3494
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3495
  ret i16 %call, !dbg !3496
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac16(i16 signext %value, i8 zeroext %factor) #0 !dbg !3497 {
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
  %shl = shl i32 %conv1, 4, !dbg !3505
  %conv2 = trunc i32 %shl to i16, !dbg !3506
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3507
  ret i16 %call, !dbg !3508
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac32(i16 signext %value, i8 zeroext %factor) #0 !dbg !3509 {
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
  %shl = shl i32 %conv1, 5, !dbg !3517
  %conv2 = trunc i32 %shl to i16, !dbg !3518
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3519
  ret i16 %call, !dbg !3520
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac4(i16 signext %value, i8 zeroext %factor) #0 !dbg !3521 {
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
  %shl = shl i32 %conv1, 2, !dbg !3529
  %conv2 = trunc i32 %shl to i16, !dbg !3530
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3531
  ret i16 %call, !dbg !3532
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac64(i16 signext %value, i8 zeroext %factor) #0 !dbg !3533 {
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
  %shl = shl i32 %conv1, 6, !dbg !3541
  %conv2 = trunc i32 %shl to i16, !dbg !3542
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3543
  ret i16 %call, !dbg !3544
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u8_fac8(i16 signext %value, i8 zeroext %factor) #0 !dbg !3545 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i8, align 1
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !3546, metadata !DIExpression()), !dbg !3547
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3548, metadata !DIExpression()), !dbg !3549
  %0 = load i16, i16* %value.addr, align 2, !dbg !3550
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3551
  %conv = zext i8 %1 to i16, !dbg !3552
  %conv1 = zext i16 %conv to i32, !dbg !3552
  %shl = shl i32 %conv1, 3, !dbg !3553
  %conv2 = trunc i32 %shl to i16, !dbg !3554
  %call = call signext i16 @root_s16_mul_s16_u8_fac_greater1(i16 signext %0, i16 zeroext %conv2), !dbg !3555
  ret i16 %call, !dbg !3556
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !3557 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3558, metadata !DIExpression()), !dbg !3559
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3560, metadata !DIExpression()), !dbg !3561
  %0 = load i32, i32* %value.addr, align 4, !dbg !3562
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3563
  %call = call i32 @root_s32_mul_s32_s16_fac_less1(i32 %0, i16 signext %1, i32 16), !dbg !3564
  ret i32 %call, !dbg !3565
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !3566 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3569, metadata !DIExpression()), !dbg !3570
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3571, metadata !DIExpression()), !dbg !3572
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3573, metadata !DIExpression()), !dbg !3574
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3575, metadata !DIExpression()), !dbg !3576
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3577, metadata !DIExpression()), !dbg !3578
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3579, metadata !DIExpression()), !dbg !3580
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3581, metadata !DIExpression()), !dbg !3582
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3583, metadata !DIExpression()), !dbg !3584
  %0 = load i32, i32* %value.addr, align 4, !dbg !3585
  %cmp = icmp slt i32 %0, 0, !dbg !3587
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3588

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3589
  %conv = sext i16 %1 to i32, !dbg !3589
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3590
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3591

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3592
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3593
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3594

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3595
  %conv6 = sext i16 %3 to i32, !dbg !3595
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3596
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3597

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3598
  br label %if.end, !dbg !3600

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3601
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3603
  %cmp9 = icmp slt i32 %4, 0, !dbg !3605
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3606

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3607
  %sub = sub nsw i32 0, %5, !dbg !3609
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3610
  br label %if.end13, !dbg !3611

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3612
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3614
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3615
  %conv14 = sext i16 %7 to i32, !dbg !3615
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3617
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3618

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3619
  %conv18 = sext i16 %8 to i32, !dbg !3619
  %sub19 = sub nsw i32 0, %conv18, !dbg !3621
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3622
  br label %if.end22, !dbg !3623

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3624
  %conv21 = sext i16 %9 to i32, !dbg !3624
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3626
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3627
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3628
  %mul = mul i32 %10, %11, !dbg !3629
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3630
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3631
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3632
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3633
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3634
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3635
  %15 = load i32, i32* %count.addr, align 4, !dbg !3636
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3637
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3637
  %shr = lshr i32 %14, %15, !dbg !3637, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3638
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3639
  %17 = load i32, i32* %count.addr, align 4, !dbg !3640
  %sub23 = sub i32 32, %17, !dbg !3641
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3642
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3642
  %shl = shl i32 %16, %sub23, !dbg !3642, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3643
  %or = or i32 %18, %shl, !dbg !3643
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3643
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3644
  %20 = load i32, i32* %count.addr, align 4, !dbg !3646
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3647
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3647
  %shr24 = lshr i32 %19, %20, !dbg !3647, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3648
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3649

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3650
  %conv28 = zext i8 %21 to i32, !dbg !3650
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3653
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3654

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3655
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3658
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3659

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3660
  store i32 %23, i32* %retval, align 4, !dbg !3661
  br label %return, !dbg !3661

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3662
  br label %return, !dbg !3662

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3663
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3666
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3667

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3668
  %sub40 = sub i32 0, %25, !dbg !3669
  store i32 %sub40, i32* %retval, align 4, !dbg !3670
  br label %return, !dbg !3670

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3671
  br label %return, !dbg !3671

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3672
  br label %return, !dbg !3672

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3674
  ret i32 %26, !dbg !3674
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !3675 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3676, metadata !DIExpression()), !dbg !3677
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3678, metadata !DIExpression()), !dbg !3679
  %0 = load i32, i32* %value.addr, align 4, !dbg !3680
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3681
  %call = call i32 @root_s32_mul_s32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !3682
  ret i32 %call, !dbg !3683
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !3684 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3687, metadata !DIExpression()), !dbg !3688
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3689, metadata !DIExpression()), !dbg !3690
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3691, metadata !DIExpression()), !dbg !3692
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3693, metadata !DIExpression()), !dbg !3694
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3695, metadata !DIExpression()), !dbg !3696
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3697, metadata !DIExpression()), !dbg !3698
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3699, metadata !DIExpression()), !dbg !3700
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3701, metadata !DIExpression()), !dbg !3702
  %0 = load i32, i32* %value.addr, align 4, !dbg !3703
  %cmp = icmp slt i32 %0, 0, !dbg !3705
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3706

land.lhs.true:                                    ; preds = %entry
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3707
  %conv = sext i8 %1 to i32, !dbg !3707
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3708
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3709

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3710
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3711
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3712

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i8, i8* %factor.addr, align 1, !dbg !3713
  %conv6 = sext i8 %3 to i32, !dbg !3713
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3714
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3715

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3716
  br label %if.end, !dbg !3718

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3719
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3721
  %cmp9 = icmp slt i32 %4, 0, !dbg !3723
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3724

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3725
  %sub = sub nsw i32 0, %5, !dbg !3727
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3728
  br label %if.end13, !dbg !3729

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3730
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3732
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i8, i8* %factor.addr, align 1, !dbg !3733
  %conv14 = sext i8 %7 to i32, !dbg !3733
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3735
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3736

if.then17:                                        ; preds = %if.end13
  %8 = load i8, i8* %factor.addr, align 1, !dbg !3737
  %conv18 = sext i8 %8 to i32, !dbg !3737
  %sub19 = sub nsw i32 0, %conv18, !dbg !3739
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3740
  br label %if.end22, !dbg !3741

if.else20:                                        ; preds = %if.end13
  %9 = load i8, i8* %factor.addr, align 1, !dbg !3742
  %conv21 = sext i8 %9 to i32, !dbg !3742
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3744
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3745
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3746
  %mul = mul i32 %10, %11, !dbg !3747
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3748
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3749
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3750
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3751
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3752
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3753
  %15 = load i32, i32* %count.addr, align 4, !dbg !3754
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3755
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3755
  %shr = lshr i32 %14, %15, !dbg !3755, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3756
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3757
  %17 = load i32, i32* %count.addr, align 4, !dbg !3758
  %sub23 = sub i32 32, %17, !dbg !3759
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3760
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3760
  %shl = shl i32 %16, %sub23, !dbg !3760, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3761
  %or = or i32 %18, %shl, !dbg !3761
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3761
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3762
  %20 = load i32, i32* %count.addr, align 4, !dbg !3764
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3765
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3765
  %shr24 = lshr i32 %19, %20, !dbg !3765, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3766
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3767

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3768
  %conv28 = zext i8 %21 to i32, !dbg !3768
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3771
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3772

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3773
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3776
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3777

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3778
  store i32 %23, i32* %retval, align 4, !dbg !3779
  br label %return, !dbg !3779

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3780
  br label %return, !dbg !3780

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3781
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3784
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3785

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3786
  %sub40 = sub i32 0, %25, !dbg !3787
  store i32 %sub40, i32* %retval, align 4, !dbg !3788
  br label %return, !dbg !3788

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3789
  br label %return, !dbg !3789

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3790
  br label %return, !dbg !3790

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3792
  ret i32 %26, !dbg !3792
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !3793 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3794, metadata !DIExpression()), !dbg !3795
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3796, metadata !DIExpression()), !dbg !3797
  %0 = load i32, i32* %value.addr, align 4, !dbg !3798
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3799
  %call = call i32 @root_s32_mul_s32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !3800
  ret i32 %call, !dbg !3801
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u16_fac_less1(i32 %value, i16 zeroext %factor, i32 %count) #0 !dbg !3802 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3805, metadata !DIExpression()), !dbg !3806
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !3807, metadata !DIExpression()), !dbg !3808
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3809, metadata !DIExpression()), !dbg !3810
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3811, metadata !DIExpression()), !dbg !3812
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3813, metadata !DIExpression()), !dbg !3814
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3815, metadata !DIExpression()), !dbg !3816
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !3817, metadata !DIExpression()), !dbg !3818
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3819, metadata !DIExpression()), !dbg !3820
  %0 = load i32, i32* %value.addr, align 4, !dbg !3821
  %cmp = icmp slt i32 %0, 0, !dbg !3823
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !3824

land.lhs.true:                                    ; preds = %entry
  %1 = load i16, i16* %factor.addr, align 2, !dbg !3825
  %conv = zext i16 %1 to i32, !dbg !3825
  %cmp1 = icmp sgt i32 %conv, 0, !dbg !3826
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !3827

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %value.addr, align 4, !dbg !3828
  %cmp3 = icmp sgt i32 %2, 0, !dbg !3829
  br i1 %cmp3, label %land.lhs.true5, label %if.else, !dbg !3830

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %3 = load i16, i16* %factor.addr, align 2, !dbg !3831
  %conv6 = zext i16 %3 to i32, !dbg !3831
  %cmp7 = icmp slt i32 %conv6, 0, !dbg !3832
  br i1 %cmp7, label %if.then, label %if.else, !dbg !3833

if.then:                                          ; preds = %land.lhs.true5, %land.lhs.true
  store i8 1, i8* %u8SignBit, align 1, !dbg !3834
  br label %if.end, !dbg !3836

if.else:                                          ; preds = %land.lhs.true5, %lor.lhs.false
  store i8 0, i8* %u8SignBit, align 1, !dbg !3837
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %value.addr, align 4, !dbg !3839
  %cmp9 = icmp slt i32 %4, 0, !dbg !3841
  br i1 %cmp9, label %if.then11, label %if.else12, !dbg !3842

if.then11:                                        ; preds = %if.end
  %5 = load i32, i32* %value.addr, align 4, !dbg !3843
  %sub = sub nsw i32 0, %5, !dbg !3845
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3846
  br label %if.end13, !dbg !3847

if.else12:                                        ; preds = %if.end
  %6 = load i32, i32* %value.addr, align 4, !dbg !3848
  store i32 %6, i32* %u32Temp1, align 4, !dbg !3850
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then11
  %7 = load i16, i16* %factor.addr, align 2, !dbg !3851
  %conv14 = zext i16 %7 to i32, !dbg !3851
  %cmp15 = icmp slt i32 %conv14, 0, !dbg !3853
  br i1 %cmp15, label %if.then17, label %if.else20, !dbg !3854

if.then17:                                        ; preds = %if.end13
  %8 = load i16, i16* %factor.addr, align 2, !dbg !3855
  %conv18 = zext i16 %8 to i32, !dbg !3855
  %sub19 = sub nsw i32 0, %conv18, !dbg !3857
  store i32 %sub19, i32* %u32Temp2, align 4, !dbg !3858
  br label %if.end22, !dbg !3859

if.else20:                                        ; preds = %if.end13
  %9 = load i16, i16* %factor.addr, align 2, !dbg !3860
  %conv21 = zext i16 %9 to i32, !dbg !3860
  store i32 %conv21, i32* %u32Temp2, align 4, !dbg !3862
  br label %if.end22

if.end22:                                         ; preds = %if.else20, %if.then17
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !3863
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3864
  %mul = mul i32 %10, %11, !dbg !3865
  store i32 %mul, i32* %u32Temp3, align 4, !dbg !3866
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !3867
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !3868
  %call = call i32 @MulHighWord(i32 %12, i32 %13), !dbg !3869
  store i32 %call, i32* %u32Temp4, align 4, !dbg !3870
  %14 = load i32, i32* %u32Temp3, align 4, !dbg !3871
  %15 = load i32, i32* %count.addr, align 4, !dbg !3872
  %int_cast_to_i64 = zext i32 %15 to i64, !dbg !3873
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3873
  %shr = lshr i32 %14, %15, !dbg !3873, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !3874
  %16 = load i32, i32* %u32Temp4, align 4, !dbg !3875
  %17 = load i32, i32* %count.addr, align 4, !dbg !3876
  %sub23 = sub i32 32, %17, !dbg !3877
  %int_cast_to_i641 = zext i32 %sub23 to i64, !dbg !3878
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3878
  %shl = shl i32 %16, %sub23, !dbg !3878, !klee.check.shift !265
  %18 = load i32, i32* %u32Temp3, align 4, !dbg !3879
  %or = or i32 %18, %shl, !dbg !3879
  store i32 %or, i32* %u32Temp3, align 4, !dbg !3879
  %19 = load i32, i32* %u32Temp4, align 4, !dbg !3880
  %20 = load i32, i32* %count.addr, align 4, !dbg !3882
  %int_cast_to_i642 = zext i32 %20 to i64, !dbg !3883
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3883
  %shr24 = lshr i32 %19, %20, !dbg !3883, !klee.check.shift !265
  %cmp25 = icmp eq i32 %shr24, 0, !dbg !3884
  br i1 %cmp25, label %if.then27, label %if.else42, !dbg !3885

if.then27:                                        ; preds = %if.end22
  %21 = load i8, i8* %u8SignBit, align 1, !dbg !3886
  %conv28 = zext i8 %21 to i32, !dbg !3886
  %cmp29 = icmp eq i32 %conv28, 0, !dbg !3889
  br i1 %cmp29, label %if.then31, label %if.else36, !dbg !3890

if.then31:                                        ; preds = %if.then27
  %22 = load i32, i32* %u32Temp3, align 4, !dbg !3891
  %cmp32 = icmp ule i32 %22, 2147483647, !dbg !3894
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !3895

if.then34:                                        ; preds = %if.then31
  %23 = load i32, i32* %u32Temp3, align 4, !dbg !3896
  store i32 %23, i32* %retval, align 4, !dbg !3897
  br label %return, !dbg !3897

if.else35:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !3898
  br label %return, !dbg !3898

if.else36:                                        ; preds = %if.then27
  %24 = load i32, i32* %u32Temp3, align 4, !dbg !3899
  %cmp37 = icmp ule i32 %24, -2147483648, !dbg !3902
  br i1 %cmp37, label %if.then39, label %if.else41, !dbg !3903

if.then39:                                        ; preds = %if.else36
  %25 = load i32, i32* %u32Temp3, align 4, !dbg !3904
  %sub40 = sub i32 0, %25, !dbg !3905
  store i32 %sub40, i32* %retval, align 4, !dbg !3906
  br label %return, !dbg !3906

if.else41:                                        ; preds = %if.else36
  store i32 -2147483648, i32* %retval, align 4, !dbg !3907
  br label %return, !dbg !3907

if.else42:                                        ; preds = %if.end22
  store i32 2147483647, i32* %retval, align 4, !dbg !3908
  br label %return, !dbg !3908

return:                                           ; preds = %if.else42, %if.else41, %if.then39, %if.else35, %if.then34
  %26 = load i32, i32* %retval, align 4, !dbg !3910
  ret i32 %26, !dbg !3910
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_mul_s32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !3911 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3912, metadata !DIExpression()), !dbg !3913
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3914, metadata !DIExpression()), !dbg !3915
  %0 = load i32, i32* %value.addr, align 4, !dbg !3916
  %1 = load i8, i8* %factor.addr, align 1, !dbg !3917
  %call = call i32 @root_s32_mul_s32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !3918
  ret i32 %call, !dbg !3919
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_s32_mul_s32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !3920 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !3923, metadata !DIExpression()), !dbg !3924
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !3925, metadata !DIExpression()), !dbg !3926
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !3927, metadata !DIExpression()), !dbg !3928
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !3929, metadata !DIExpression()), !dbg !3930
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !3931, metadata !DIExpression()), !dbg !3932
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !3933, metadata !DIExpression()), !dbg !3934
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !3935, metadata !DIExpression()), !dbg !3936
  %0 = load i32, i32* %value.addr, align 4, !dbg !3937
  %cmp = icmp slt i32 %0, 0, !dbg !3939
  br i1 %cmp, label %if.then, label %if.else, !dbg !3940

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !3941
  %1 = load i32, i32* %value.addr, align 4, !dbg !3943
  %sub = sub nsw i32 0, %1, !dbg !3944
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !3945
  br label %if.end, !dbg !3946

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !3947
  %2 = load i32, i32* %value.addr, align 4, !dbg !3949
  store i32 %2, i32* %u32Temp1, align 4, !dbg !3950
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %u32Temp1, align 4, !dbg !3951
  %4 = load i8, i8* %factor.addr, align 1, !dbg !3952
  %conv = zext i8 %4 to i32, !dbg !3952
  %mul = mul i32 %3, %conv, !dbg !3953
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !3954
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !3955
  %6 = load i8, i8* %factor.addr, align 1, !dbg !3956
  %conv1 = zext i8 %6 to i32, !dbg !3956
  %call = call i32 @MulHighWord(i32 %5, i32 %conv1), !dbg !3957
  store i32 %call, i32* %u32Temp3, align 4, !dbg !3958
  %7 = load i32, i32* %u32Temp2, align 4, !dbg !3959
  %8 = load i32, i32* %count.addr, align 4, !dbg !3960
  %int_cast_to_i64 = zext i32 %8 to i64, !dbg !3961
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !3961
  %shr = lshr i32 %7, %8, !dbg !3961, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !3962
  %9 = load i32, i32* %u32Temp3, align 4, !dbg !3963
  %10 = load i32, i32* %count.addr, align 4, !dbg !3964
  %sub2 = sub i32 32, %10, !dbg !3965
  %int_cast_to_i641 = zext i32 %sub2 to i64, !dbg !3966
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !3966
  %shl = shl i32 %9, %sub2, !dbg !3966, !klee.check.shift !265
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !3967
  %or = or i32 %11, %shl, !dbg !3967
  store i32 %or, i32* %u32Temp2, align 4, !dbg !3967
  %12 = load i32, i32* %u32Temp3, align 4, !dbg !3968
  %13 = load i32, i32* %count.addr, align 4, !dbg !3970
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !3971
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !3971
  %shr3 = lshr i32 %12, %13, !dbg !3971, !klee.check.shift !265
  %cmp4 = icmp eq i32 %shr3, 0, !dbg !3972
  br i1 %cmp4, label %if.then6, label %if.else21, !dbg !3973

if.then6:                                         ; preds = %if.end
  %14 = load i8, i8* %u8SignBit, align 1, !dbg !3974
  %conv7 = zext i8 %14 to i32, !dbg !3974
  %cmp8 = icmp eq i32 %conv7, 0, !dbg !3977
  br i1 %cmp8, label %if.then10, label %if.else15, !dbg !3978

if.then10:                                        ; preds = %if.then6
  %15 = load i32, i32* %u32Temp3, align 4, !dbg !3979
  %cmp11 = icmp ule i32 %15, 2147483647, !dbg !3982
  br i1 %cmp11, label %if.then13, label %if.else14, !dbg !3983

if.then13:                                        ; preds = %if.then10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !3984
  store i32 %16, i32* %retval, align 4, !dbg !3985
  br label %return, !dbg !3985

if.else14:                                        ; preds = %if.then10
  store i32 2147483647, i32* %retval, align 4, !dbg !3986
  br label %return, !dbg !3986

if.else15:                                        ; preds = %if.then6
  %17 = load i32, i32* %u32Temp3, align 4, !dbg !3987
  %cmp16 = icmp ule i32 %17, -2147483648, !dbg !3990
  br i1 %cmp16, label %if.then18, label %if.else20, !dbg !3991

if.then18:                                        ; preds = %if.else15
  %18 = load i32, i32* %u32Temp2, align 4, !dbg !3992
  %sub19 = sub i32 0, %18, !dbg !3994
  store i32 %sub19, i32* %retval, align 4, !dbg !3995
  br label %return, !dbg !3995

if.else20:                                        ; preds = %if.else15
  store i32 -2147483648, i32* %retval, align 4, !dbg !3996
  br label %return, !dbg !3996

if.else21:                                        ; preds = %if.end
  %19 = load i8, i8* %u8SignBit, align 1, !dbg !3998
  %conv22 = zext i8 %19 to i32, !dbg !3998
  %cmp23 = icmp eq i32 %conv22, 0, !dbg !4001
  br i1 %cmp23, label %if.then25, label %if.else26, !dbg !4002

if.then25:                                        ; preds = %if.else21
  store i32 2147483647, i32* %retval, align 4, !dbg !4003
  br label %return, !dbg !4003

if.else26:                                        ; preds = %if.else21
  store i32 -2147483648, i32* %retval, align 4, !dbg !4005
  br label %return, !dbg !4005

return:                                           ; preds = %if.else26, %if.then25, %if.else20, %if.then18, %if.else14, %if.then13
  %20 = load i32, i32* %retval, align 4, !dbg !4007
  ret i32 %20, !dbg !4007
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac0125(i8 signext %value, i8 zeroext %factor) #0 !dbg !4008 {
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
  %shl = shl i32 %conv1, 5, !dbg !4016
  %conv2 = trunc i32 %shl to i16, !dbg !4017
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4018
  ret i8 %call, !dbg !4019
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac025(i8 signext %value, i8 zeroext %factor) #0 !dbg !4020 {
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
  %shl = shl i32 %conv1, 6, !dbg !4028
  %conv2 = trunc i32 %shl to i16, !dbg !4029
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4030
  ret i8 %call, !dbg !4031
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac05(i8 signext %value, i8 zeroext %factor) #0 !dbg !4032 {
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
  %call = call signext i8 @root_s8_mul_s8_u8_fac_less1(i8 signext %0, i16 zeroext %conv2), !dbg !4042
  ret i8 %call, !dbg !4043
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac128(i8 signext %value, i8 zeroext %factor) #0 !dbg !4044 {
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
  %shl = shl i32 %conv1, 7, !dbg !4052
  %conv2 = trunc i32 %shl to i16, !dbg !4053
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4054
  ret i8 %call, !dbg !4055
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac16(i8 signext %value, i8 zeroext %factor) #0 !dbg !4056 {
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
  %shl = shl i32 %conv1, 4, !dbg !4064
  %conv2 = trunc i32 %shl to i16, !dbg !4065
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4066
  ret i8 %call, !dbg !4067
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac32(i8 signext %value, i8 zeroext %factor) #0 !dbg !4068 {
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
  %shl = shl i32 %conv1, 5, !dbg !4076
  %conv2 = trunc i32 %shl to i16, !dbg !4077
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4078
  ret i8 %call, !dbg !4079
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac4(i8 signext %value, i8 zeroext %factor) #0 !dbg !4080 {
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
  %shl = shl i32 %conv1, 2, !dbg !4088
  %conv2 = trunc i32 %shl to i16, !dbg !4089
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4090
  ret i8 %call, !dbg !4091
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac64(i8 signext %value, i8 zeroext %factor) #0 !dbg !4092 {
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
  %shl = shl i32 %conv1, 6, !dbg !4100
  %conv2 = trunc i32 %shl to i16, !dbg !4101
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4102
  ret i8 %call, !dbg !4103
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i8 @s8_mul_s8_u8_fac8(i8 signext %value, i8 zeroext %factor) #0 !dbg !4104 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4105, metadata !DIExpression()), !dbg !4106
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4107, metadata !DIExpression()), !dbg !4108
  %0 = load i8, i8* %value.addr, align 1, !dbg !4109
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4110
  %conv = zext i8 %1 to i16, !dbg !4111
  %conv1 = zext i16 %conv to i32, !dbg !4111
  %shl = shl i32 %conv1, 3, !dbg !4112
  %conv2 = trunc i32 %shl to i16, !dbg !4113
  %call = call signext i8 @root_s8_mul_s8_u8_fac_greater1(i8 signext %0, i16 zeroext %conv2), !dbg !4114
  ret i8 %call, !dbg !4115
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac0125(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4116 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4117, metadata !DIExpression()), !dbg !4118
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4119, metadata !DIExpression()), !dbg !4120
  %0 = load i16, i16* %value.addr, align 2, !dbg !4121
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4122
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 524288), !dbg !4123
  ret i16 %call, !dbg !4124
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac025(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4125 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4126, metadata !DIExpression()), !dbg !4127
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4128, metadata !DIExpression()), !dbg !4129
  %0 = load i16, i16* %value.addr, align 2, !dbg !4130
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4131
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 262144), !dbg !4132
  ret i16 %call, !dbg !4133
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac05(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4134 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4135, metadata !DIExpression()), !dbg !4136
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4137, metadata !DIExpression()), !dbg !4138
  %0 = load i16, i16* %value.addr, align 2, !dbg !4139
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4140
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_less1(i16 zeroext %0, i16 zeroext %1, i32 131072), !dbg !4141
  ret i16 %call, !dbg !4142
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac1024(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4143 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4144, metadata !DIExpression()), !dbg !4145
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4146, metadata !DIExpression()), !dbg !4147
  %0 = load i16, i16* %value.addr, align 2, !dbg !4148
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4149
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 64), !dbg !4150
  ret i16 %call, !dbg !4151
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac128(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4152 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4153, metadata !DIExpression()), !dbg !4154
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4155, metadata !DIExpression()), !dbg !4156
  %0 = load i16, i16* %value.addr, align 2, !dbg !4157
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4158
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 512), !dbg !4159
  ret i16 %call, !dbg !4160
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac16(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4161 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4162, metadata !DIExpression()), !dbg !4163
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4164, metadata !DIExpression()), !dbg !4165
  %0 = load i16, i16* %value.addr, align 2, !dbg !4166
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4167
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 4096), !dbg !4168
  ret i16 %call, !dbg !4169
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac2048(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4170 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4171, metadata !DIExpression()), !dbg !4172
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4173, metadata !DIExpression()), !dbg !4174
  %0 = load i16, i16* %value.addr, align 2, !dbg !4175
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4176
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 32), !dbg !4177
  ret i16 %call, !dbg !4178
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac256(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4179 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4180, metadata !DIExpression()), !dbg !4181
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4182, metadata !DIExpression()), !dbg !4183
  %0 = load i16, i16* %value.addr, align 2, !dbg !4184
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4185
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 256), !dbg !4186
  ret i16 %call, !dbg !4187
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac32(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4188 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4189, metadata !DIExpression()), !dbg !4190
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4191, metadata !DIExpression()), !dbg !4192
  %0 = load i16, i16* %value.addr, align 2, !dbg !4193
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4194
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 2048), !dbg !4195
  ret i16 %call, !dbg !4196
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4197 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4198, metadata !DIExpression()), !dbg !4199
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4200, metadata !DIExpression()), !dbg !4201
  %0 = load i16, i16* %value.addr, align 2, !dbg !4202
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4203
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16384), !dbg !4204
  ret i16 %call, !dbg !4205
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac4096(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4206 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4207, metadata !DIExpression()), !dbg !4208
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4209, metadata !DIExpression()), !dbg !4210
  %0 = load i16, i16* %value.addr, align 2, !dbg !4211
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4212
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 16), !dbg !4213
  ret i16 %call, !dbg !4214
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac512(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4215 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4216, metadata !DIExpression()), !dbg !4217
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4218, metadata !DIExpression()), !dbg !4219
  %0 = load i16, i16* %value.addr, align 2, !dbg !4220
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4221
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 128), !dbg !4222
  ret i16 %call, !dbg !4223
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac64(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4224 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4225, metadata !DIExpression()), !dbg !4226
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4227, metadata !DIExpression()), !dbg !4228
  %0 = load i16, i16* %value.addr, align 2, !dbg !4229
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4230
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 1024), !dbg !4231
  ret i16 %call, !dbg !4232
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_fac8(i16 zeroext %value, i16 zeroext %factor) #0 !dbg !4233 {
entry:
  %value.addr = alloca i16, align 2
  %factor.addr = alloca i16, align 2
  store i16 %value, i16* %value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %value.addr, metadata !4234, metadata !DIExpression()), !dbg !4235
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4236, metadata !DIExpression()), !dbg !4237
  %0 = load i16, i16* %value.addr, align 2, !dbg !4238
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4239
  %call = call zeroext i16 @root_u16_mul_u16_u16_fac_greater1(i16 zeroext %0, i16 zeroext %1, i16 zeroext 8192), !dbg !4240
  ret i16 %call, !dbg !4241
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac0125(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4242 {
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
  %shl = shl i32 %conv1, 5, !dbg !4250
  %conv2 = trunc i32 %shl to i16, !dbg !4251
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4252
  ret i16 %call, !dbg !4253
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac025(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4254 {
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
  %shl = shl i32 %conv1, 6, !dbg !4262
  %conv2 = trunc i32 %shl to i16, !dbg !4263
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4264
  ret i16 %call, !dbg !4265
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac05(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4266 {
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
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_less1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4276
  ret i16 %call, !dbg !4277
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac128(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4278 {
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
  %shl = shl i32 %conv1, 7, !dbg !4286
  %conv2 = trunc i32 %shl to i16, !dbg !4287
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4288
  ret i16 %call, !dbg !4289
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac16(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4290 {
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
  %shl = shl i32 %conv1, 4, !dbg !4298
  %conv2 = trunc i32 %shl to i16, !dbg !4299
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4300
  ret i16 %call, !dbg !4301
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac32(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4302 {
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
  %shl = shl i32 %conv1, 5, !dbg !4310
  %conv2 = trunc i32 %shl to i16, !dbg !4311
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4312
  ret i16 %call, !dbg !4313
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac4(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4314 {
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
  %shl = shl i32 %conv1, 2, !dbg !4322
  %conv2 = trunc i32 %shl to i16, !dbg !4323
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4324
  ret i16 %call, !dbg !4325
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac64(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4326 {
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
  %shl = shl i32 %conv1, 6, !dbg !4334
  %conv2 = trunc i32 %shl to i16, !dbg !4335
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4336
  ret i16 %call, !dbg !4337
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u8_fac8(i16 zeroext %x_value, i8 zeroext %y_value) #0 !dbg !4338 {
entry:
  %x_value.addr = alloca i16, align 2
  %y_value.addr = alloca i8, align 1
  store i16 %x_value, i16* %x_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %x_value.addr, metadata !4339, metadata !DIExpression()), !dbg !4340
  store i8 %y_value, i8* %y_value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %y_value.addr, metadata !4341, metadata !DIExpression()), !dbg !4342
  %0 = load i16, i16* %x_value.addr, align 2, !dbg !4343
  %1 = load i8, i8* %y_value.addr, align 1, !dbg !4344
  %conv = zext i8 %1 to i16, !dbg !4345
  %conv1 = zext i16 %conv to i32, !dbg !4345
  %shl = shl i32 %conv1, 3, !dbg !4346
  %conv2 = trunc i32 %shl to i16, !dbg !4347
  %call = call zeroext i16 @root_u16_mul_u16_u8_fac_greater_1(i16 zeroext %0, i16 zeroext %conv2), !dbg !4348
  ret i16 %call, !dbg !4349
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s16_fac05(i32 %value, i16 signext %factor) #0 !dbg !4350 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4351, metadata !DIExpression()), !dbg !4352
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4353, metadata !DIExpression()), !dbg !4354
  %0 = load i32, i32* %value.addr, align 4, !dbg !4355
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4356
  %call = call i32 @root_u32_mul_u32_s16_fac_less1(i32 %0, i16 signext %1, i32 15), !dbg !4357
  ret i32 %call, !dbg !4358
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s16_fac_less1(i32 %value, i16 signext %factor, i32 %count) #0 !dbg !4359 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4362, metadata !DIExpression()), !dbg !4363
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4364, metadata !DIExpression()), !dbg !4365
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4366, metadata !DIExpression()), !dbg !4367
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4368, metadata !DIExpression()), !dbg !4369
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4370, metadata !DIExpression()), !dbg !4371
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4372, metadata !DIExpression()), !dbg !4373
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4374, metadata !DIExpression()), !dbg !4375
  %0 = load i16, i16* %factor.addr, align 2, !dbg !4376
  %conv = sext i16 %0 to i32, !dbg !4376
  %cmp = icmp slt i32 %conv, 0, !dbg !4378
  br i1 %cmp, label %if.then, label %if.else, !dbg !4379

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4380
  br label %if.end, !dbg !4382

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4383
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4385
  %conv2 = sext i16 %1 to i32, !dbg !4385
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4387
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4388

if.then5:                                         ; preds = %if.end
  %2 = load i16, i16* %factor.addr, align 2, !dbg !4389
  %conv6 = sext i16 %2 to i32, !dbg !4389
  %sub = sub nsw i32 0, %conv6, !dbg !4391
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4392
  br label %if.end9, !dbg !4393

if.else7:                                         ; preds = %if.end
  %3 = load i16, i16* %factor.addr, align 2, !dbg !4394
  %conv8 = sext i16 %3 to i32, !dbg !4394
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4396
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4397
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4398
  %mul = mul i32 %4, %5, !dbg !4399
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4400
  %6 = load i32, i32* %value.addr, align 4, !dbg !4401
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4402
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4403
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4404
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4405
  %9 = load i32, i32* %count.addr, align 4, !dbg !4406
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4407
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4407
  %shr = lshr i32 %8, %9, !dbg !4407, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4408
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4409
  %11 = load i32, i32* %count.addr, align 4, !dbg !4410
  %sub10 = sub i32 32, %11, !dbg !4411
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4412
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4412
  %shl = shl i32 %10, %sub10, !dbg !4412, !klee.check.shift !265
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4413
  %or = or i32 %12, %shl, !dbg !4413
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4413
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4414
  %14 = load i32, i32* %count.addr, align 4, !dbg !4416
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4417
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4417
  %shr11 = lshr i32 %13, %14, !dbg !4417, !klee.check.shift !265
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4418
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4419

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4420
  %conv15 = zext i8 %15 to i32, !dbg !4420
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4423
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4424

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4425
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4428
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4429

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4430
  store i32 %17, i32* %retval, align 4, !dbg !4431
  br label %return, !dbg !4431

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4432
  br label %return, !dbg !4432

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4433
  br label %return, !dbg !4433

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4435
  br label %return, !dbg !4435

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4437
  ret i32 %18, !dbg !4437
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s32_fac05(i32 %value, i32 %factor) #0 !dbg !4438 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4439, metadata !DIExpression()), !dbg !4440
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4441, metadata !DIExpression()), !dbg !4442
  %0 = load i32, i32* %value.addr, align 4, !dbg !4443
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4444
  %call = call i32 @root_u32_mul_u32_s32_fac_less1(i32 %0, i32 %1, i32 32), !dbg !4445
  ret i32 %call, !dbg !4446
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4447 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u8SignBit = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4450, metadata !DIExpression()), !dbg !4451
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4452, metadata !DIExpression()), !dbg !4453
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4454, metadata !DIExpression()), !dbg !4455
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4456, metadata !DIExpression()), !dbg !4457
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4458, metadata !DIExpression()), !dbg !4459
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4460, metadata !DIExpression()), !dbg !4461
  %0 = load i32, i32* %factor.addr, align 4, !dbg !4462
  %cmp = icmp slt i32 %0, 0, !dbg !4464
  br i1 %cmp, label %if.then, label %if.else, !dbg !4465

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4466
  br label %if.end, !dbg !4468

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4469
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4471
  %cmp1 = icmp slt i32 %1, 0, !dbg !4473
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !4474

if.then2:                                         ; preds = %if.end
  %2 = load i32, i32* %factor.addr, align 4, !dbg !4475
  %sub = sub nsw i32 0, %2, !dbg !4477
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4478
  br label %if.end4, !dbg !4479

if.else3:                                         ; preds = %if.end
  %3 = load i32, i32* %factor.addr, align 4, !dbg !4480
  store i32 %3, i32* %u32Temp1, align 4, !dbg !4482
  br label %if.end4

if.end4:                                          ; preds = %if.else3, %if.then2
  %4 = load i32, i32* %value.addr, align 4, !dbg !4483
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4484
  %call = call i32 @MulHighWord(i32 %4, i32 %5), !dbg !4485
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4486
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4487
  %7 = load i32, i32* %count.addr, align 4, !dbg !4488
  %sub5 = sub i32 %7, 32, !dbg !4489
  %int_cast_to_i64 = zext i32 %sub5 to i64, !dbg !4490
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4490
  %shr = lshr i32 %6, %sub5, !dbg !4490, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4491
  %8 = load i8, i8* %u8SignBit, align 1, !dbg !4492
  %conv = zext i8 %8 to i32, !dbg !4492
  %cmp6 = icmp eq i32 %conv, 0, !dbg !4494
  br i1 %cmp6, label %if.then8, label %if.else9, !dbg !4495

if.then8:                                         ; preds = %if.end4
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4496
  store i32 %9, i32* %retval, align 4, !dbg !4498
  br label %return, !dbg !4498

if.else9:                                         ; preds = %if.end4
  store i32 0, i32* %retval, align 4, !dbg !4499
  br label %return, !dbg !4499

return:                                           ; preds = %if.else9, %if.then8
  %10 = load i32, i32* %retval, align 4, !dbg !4501
  ret i32 %10, !dbg !4501
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_s8_fac05(i32 %value, i8 signext %factor) #0 !dbg !4502 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4503, metadata !DIExpression()), !dbg !4504
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4505, metadata !DIExpression()), !dbg !4506
  %0 = load i32, i32* %value.addr, align 4, !dbg !4507
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4508
  %call = call i32 @root_u32_mul_u32_s8_fac_less1(i32 %0, i8 signext %1, i32 8), !dbg !4509
  ret i32 %call, !dbg !4510
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_s8_fac_less1(i32 %value, i8 signext %factor, i32 %count) #0 !dbg !4511 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4514, metadata !DIExpression()), !dbg !4515
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4516, metadata !DIExpression()), !dbg !4517
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4518, metadata !DIExpression()), !dbg !4519
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4520, metadata !DIExpression()), !dbg !4521
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4522, metadata !DIExpression()), !dbg !4523
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4524, metadata !DIExpression()), !dbg !4525
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4526, metadata !DIExpression()), !dbg !4527
  %0 = load i8, i8* %factor.addr, align 1, !dbg !4528
  %conv = sext i8 %0 to i32, !dbg !4528
  %cmp = icmp slt i32 %conv, 0, !dbg !4530
  br i1 %cmp, label %if.then, label %if.else, !dbg !4531

if.then:                                          ; preds = %entry
  store i8 1, i8* %u8SignBit, align 1, !dbg !4532
  br label %if.end, !dbg !4534

if.else:                                          ; preds = %entry
  store i8 0, i8* %u8SignBit, align 1, !dbg !4535
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4537
  %conv2 = sext i8 %1 to i32, !dbg !4537
  %cmp3 = icmp slt i32 %conv2, 0, !dbg !4539
  br i1 %cmp3, label %if.then5, label %if.else7, !dbg !4540

if.then5:                                         ; preds = %if.end
  %2 = load i8, i8* %factor.addr, align 1, !dbg !4541
  %conv6 = sext i8 %2 to i32, !dbg !4541
  %sub = sub nsw i32 0, %conv6, !dbg !4543
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !4544
  br label %if.end9, !dbg !4545

if.else7:                                         ; preds = %if.end
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4546
  %conv8 = sext i8 %3 to i32, !dbg !4546
  store i32 %conv8, i32* %u32Temp1, align 4, !dbg !4548
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %4 = load i32, i32* %value.addr, align 4, !dbg !4549
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !4550
  %mul = mul i32 %4, %5, !dbg !4551
  store i32 %mul, i32* %u32Temp2, align 4, !dbg !4552
  %6 = load i32, i32* %value.addr, align 4, !dbg !4553
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !4554
  %call = call i32 @MulHighWord(i32 %6, i32 %7), !dbg !4555
  store i32 %call, i32* %u32Temp3, align 4, !dbg !4556
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !4557
  %9 = load i32, i32* %count.addr, align 4, !dbg !4558
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !4559
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4559
  %shr = lshr i32 %8, %9, !dbg !4559, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !4560
  %10 = load i32, i32* %u32Temp3, align 4, !dbg !4561
  %11 = load i32, i32* %count.addr, align 4, !dbg !4562
  %sub10 = sub i32 32, %11, !dbg !4563
  %int_cast_to_i641 = zext i32 %sub10 to i64, !dbg !4564
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4564
  %shl = shl i32 %10, %sub10, !dbg !4564, !klee.check.shift !265
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !4565
  %or = or i32 %12, %shl, !dbg !4565
  store i32 %or, i32* %u32Temp2, align 4, !dbg !4565
  %13 = load i32, i32* %u32Temp3, align 4, !dbg !4566
  %14 = load i32, i32* %count.addr, align 4, !dbg !4568
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !4569
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4569
  %shr11 = lshr i32 %13, %14, !dbg !4569, !klee.check.shift !265
  %cmp12 = icmp eq i32 %shr11, 0, !dbg !4570
  br i1 %cmp12, label %if.then14, label %if.else24, !dbg !4571

if.then14:                                        ; preds = %if.end9
  %15 = load i8, i8* %u8SignBit, align 1, !dbg !4572
  %conv15 = zext i8 %15 to i32, !dbg !4572
  %cmp16 = icmp eq i32 %conv15, 0, !dbg !4575
  br i1 %cmp16, label %if.then18, label %if.else23, !dbg !4576

if.then18:                                        ; preds = %if.then14
  %16 = load i32, i32* %u32Temp3, align 4, !dbg !4577
  %cmp19 = icmp ule i32 %16, 2147483647, !dbg !4580
  br i1 %cmp19, label %if.then21, label %if.else22, !dbg !4581

if.then21:                                        ; preds = %if.then18
  %17 = load i32, i32* %u32Temp2, align 4, !dbg !4582
  store i32 %17, i32* %retval, align 4, !dbg !4583
  br label %return, !dbg !4583

if.else22:                                        ; preds = %if.then18
  store i32 2147483647, i32* %retval, align 4, !dbg !4584
  br label %return, !dbg !4584

if.else23:                                        ; preds = %if.then14
  store i32 0, i32* %retval, align 4, !dbg !4585
  br label %return, !dbg !4585

if.else24:                                        ; preds = %if.end9
  store i32 2147483647, i32* %retval, align 4, !dbg !4587
  br label %return, !dbg !4587

return:                                           ; preds = %if.else24, %if.else23, %if.else22, %if.then21
  %18 = load i32, i32* %retval, align 4, !dbg !4589
  ret i32 %18, !dbg !4589
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u16_fac05(i32 %value, i16 zeroext %factor) #0 !dbg !4590 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i16, align 2
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4591, metadata !DIExpression()), !dbg !4592
  store i16 %factor, i16* %factor.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor.addr, metadata !4593, metadata !DIExpression()), !dbg !4594
  %0 = load i32, i32* %value.addr, align 4, !dbg !4595
  %1 = load i16, i16* %factor.addr, align 2, !dbg !4596
  %call = call i32 @root_u32_mul_u32_u16_fac_less1(i32 %0, i16 zeroext %1, i32 17), !dbg !4597
  ret i32 %call, !dbg !4598
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u32_fac05(i32 %value, i32 %factor) #0 !dbg !4599 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4600, metadata !DIExpression()), !dbg !4601
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4602, metadata !DIExpression()), !dbg !4603
  %0 = load i32, i32* %value.addr, align 4, !dbg !4604
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4605
  %call = call i32 @root_u32_mul_u32_u32_fac_less1(i32 %0, i32 %1, i32 33), !dbg !4606
  ret i32 %call, !dbg !4607
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u32_fac_less1(i32 %value, i32 %factor, i32 %count) #0 !dbg !4608 {
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
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4611, metadata !DIExpression()), !dbg !4612
  store i32 %factor, i32* %factor.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %factor.addr, metadata !4613, metadata !DIExpression()), !dbg !4614
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4615, metadata !DIExpression()), !dbg !4616
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4617, metadata !DIExpression()), !dbg !4618
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4619, metadata !DIExpression()), !dbg !4620
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !4621, metadata !DIExpression()), !dbg !4622
  call void @llvm.dbg.declare(metadata i32* %u32Temp4, metadata !4623, metadata !DIExpression()), !dbg !4624
  call void @llvm.dbg.declare(metadata i8* %u8SignBit, metadata !4625, metadata !DIExpression()), !dbg !4626
  %0 = load i32, i32* %value.addr, align 4, !dbg !4627
  %1 = load i32, i32* %factor.addr, align 4, !dbg !4628
  %call = call i32 @MulHighWord(i32 %0, i32 %1), !dbg !4629
  store i32 %call, i32* %u32Temp1, align 4, !dbg !4630
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !4631
  %3 = load i32, i32* %count.addr, align 4, !dbg !4632
  %sub = sub i32 %3, 32, !dbg !4633
  %int_cast_to_i64 = zext i32 %sub to i64, !dbg !4634
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4634
  %shr = lshr i32 %2, %sub, !dbg !4634, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4635
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4636
  ret i32 %4, !dbg !4637
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_mul_u32_u8_fac05(i32 %value, i8 zeroext %factor) #0 !dbg !4638 {
entry:
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4639, metadata !DIExpression()), !dbg !4640
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4641, metadata !DIExpression()), !dbg !4642
  %0 = load i32, i32* %value.addr, align 4, !dbg !4643
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4644
  %call = call i32 @root_u32_mul_u32_u8_fac_less1(i32 %0, i8 zeroext %1, i32 9), !dbg !4645
  ret i32 %call, !dbg !4646
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @root_u32_mul_u32_u8_fac_less1(i32 %value, i8 zeroext %factor, i32 %count) #0 !dbg !4647 {
entry:
  %retval = alloca i32, align 4
  %value.addr = alloca i32, align 4
  %factor.addr = alloca i8, align 1
  %count.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %value, i32* %value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %value.addr, metadata !4650, metadata !DIExpression()), !dbg !4651
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4652, metadata !DIExpression()), !dbg !4653
  store i32 %count, i32* %count.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %count.addr, metadata !4654, metadata !DIExpression()), !dbg !4655
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !4656, metadata !DIExpression()), !dbg !4657
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !4658, metadata !DIExpression()), !dbg !4659
  %0 = load i32, i32* %value.addr, align 4, !dbg !4660
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4661
  %conv = zext i8 %1 to i32, !dbg !4661
  %mul = mul i32 %0, %conv, !dbg !4662
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !4663
  %2 = load i32, i32* %value.addr, align 4, !dbg !4664
  %3 = load i8, i8* %factor.addr, align 1, !dbg !4665
  %conv1 = zext i8 %3 to i32, !dbg !4665
  %call = call i32 @MulHighWord(i32 %2, i32 %conv1), !dbg !4666
  store i32 %call, i32* %u32Temp2, align 4, !dbg !4667
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !4668
  %5 = load i32, i32* %count.addr, align 4, !dbg !4669
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !4670
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i64), !dbg !4670
  %shr = lshr i32 %4, %5, !dbg !4670, !klee.check.shift !265
  store i32 %shr, i32* %u32Temp1, align 4, !dbg !4671
  %6 = load i32, i32* %u32Temp2, align 4, !dbg !4672
  %7 = load i32, i32* %count.addr, align 4, !dbg !4673
  %sub = sub i32 32, %7, !dbg !4674
  %int_cast_to_i641 = zext i32 %sub to i64, !dbg !4675
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i641), !dbg !4675
  %shl = shl i32 %6, %sub, !dbg !4675, !klee.check.shift !265
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !4676
  %or = or i32 %8, %shl, !dbg !4676
  store i32 %or, i32* %u32Temp1, align 4, !dbg !4676
  %9 = load i32, i32* %u32Temp2, align 4, !dbg !4677
  %10 = load i32, i32* %count.addr, align 4, !dbg !4679
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !4680
  call void @klee_overshift_check(i64 32, i64 %int_cast_to_i642), !dbg !4680
  %shr2 = lshr i32 %9, %10, !dbg !4680, !klee.check.shift !265
  %cmp = icmp eq i32 %shr2, 0, !dbg !4681
  br i1 %cmp, label %if.then, label %if.else7, !dbg !4682

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !4683
  %cmp4 = icmp ule i32 %11, 2147483647, !dbg !4686
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !4687

if.then6:                                         ; preds = %if.then
  %12 = load i32, i32* %u32Temp1, align 4, !dbg !4688
  store i32 %12, i32* %retval, align 4, !dbg !4689
  br label %return, !dbg !4689

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !4690
  br label %return, !dbg !4690

if.else7:                                         ; preds = %entry
  store i32 2147483647, i32* %retval, align 4, !dbg !4691
  br label %return, !dbg !4691

return:                                           ; preds = %if.else7, %if.else, %if.then6
  %13 = load i32, i32* %retval, align 4, !dbg !4693
  ret i32 %13, !dbg !4693
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac0125(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4694 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4695, metadata !DIExpression()), !dbg !4696
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4697, metadata !DIExpression()), !dbg !4698
  %0 = load i8, i8* %value.addr, align 1, !dbg !4699
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4700
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 2048), !dbg !4701
  ret i8 %call, !dbg !4702
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac025(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4703 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4704, metadata !DIExpression()), !dbg !4705
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4706, metadata !DIExpression()), !dbg !4707
  %0 = load i8, i8* %value.addr, align 1, !dbg !4708
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4709
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 1024), !dbg !4710
  ret i8 %call, !dbg !4711
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac05(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4712 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4713, metadata !DIExpression()), !dbg !4714
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4715, metadata !DIExpression()), !dbg !4716
  %0 = load i8, i8* %value.addr, align 1, !dbg !4717
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4718
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_less1(i8 zeroext %0, i8 zeroext %1, i16 zeroext 512), !dbg !4719
  ret i8 %call, !dbg !4720
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac128(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4721 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4722, metadata !DIExpression()), !dbg !4723
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4724, metadata !DIExpression()), !dbg !4725
  %0 = load i8, i8* %value.addr, align 1, !dbg !4726
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4727
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 2), !dbg !4728
  ret i8 %call, !dbg !4729
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac16(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4730 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4731, metadata !DIExpression()), !dbg !4732
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4733, metadata !DIExpression()), !dbg !4734
  %0 = load i8, i8* %value.addr, align 1, !dbg !4735
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4736
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 16), !dbg !4737
  ret i8 %call, !dbg !4738
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac32(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4739 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4740, metadata !DIExpression()), !dbg !4741
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4742, metadata !DIExpression()), !dbg !4743
  %0 = load i8, i8* %value.addr, align 1, !dbg !4744
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4745
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 8), !dbg !4746
  ret i8 %call, !dbg !4747
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac4(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4748 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4749, metadata !DIExpression()), !dbg !4750
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4751, metadata !DIExpression()), !dbg !4752
  %0 = load i8, i8* %value.addr, align 1, !dbg !4753
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4754
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 64), !dbg !4755
  ret i8 %call, !dbg !4756
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac64(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4757 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4758, metadata !DIExpression()), !dbg !4759
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4760, metadata !DIExpression()), !dbg !4761
  %0 = load i8, i8* %value.addr, align 1, !dbg !4762
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4763
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 4), !dbg !4764
  ret i8 %call, !dbg !4765
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_mul_u8_u8_fac8(i8 zeroext %value, i8 zeroext %factor) #0 !dbg !4766 {
entry:
  %value.addr = alloca i8, align 1
  %factor.addr = alloca i8, align 1
  store i8 %value, i8* %value.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %value.addr, metadata !4767, metadata !DIExpression()), !dbg !4768
  store i8 %factor, i8* %factor.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %factor.addr, metadata !4769, metadata !DIExpression()), !dbg !4770
  %0 = load i8, i8* %value.addr, align 1, !dbg !4771
  %1 = load i8, i8* %factor.addr, align 1, !dbg !4772
  %call = call zeroext i8 @root_u8_mul_u8_u8_fac_greater1(i8 zeroext %0, i8 zeroext %1, i8 zeroext 32), !dbg !4773
  ret i8 %call, !dbg !4774
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulHighWord(i32 %arg1, i32 %arg2) #0 !dbg !4775 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4777, metadata !DIExpression()), !dbg !4778
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4779, metadata !DIExpression()), !dbg !4780
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4781, metadata !DIExpression()), !dbg !4782
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4783, metadata !DIExpression()), !dbg !4784
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4785, metadata !DIExpression()), !dbg !4786
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4787, metadata !DIExpression()), !dbg !4788
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4789, metadata !DIExpression()), !dbg !4790
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4791, metadata !DIExpression()), !dbg !4792
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4793, metadata !DIExpression()), !dbg !4794
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4795, metadata !DIExpression()), !dbg !4796
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4797, metadata !DIExpression()), !dbg !4798
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4799, metadata !DIExpression()), !dbg !4800
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4801
  %and = and i32 %0, 65535, !dbg !4802
  %conv = trunc i32 %and to i16, !dbg !4801
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4803
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4804
  %and1 = and i32 %1, -65536, !dbg !4805
  %shr = lshr i32 %and1, 16, !dbg !4806
  %conv2 = trunc i32 %shr to i16, !dbg !4807
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4808
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4809
  %and3 = and i32 %2, 65535, !dbg !4810
  %conv4 = trunc i32 %and3 to i16, !dbg !4809
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4811
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4812
  %and5 = and i32 %3, -65536, !dbg !4813
  %shr6 = lshr i32 %and5, 16, !dbg !4814
  %conv7 = trunc i32 %shr6 to i16, !dbg !4815
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4816
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4817
  %conv8 = zext i16 %4 to i32, !dbg !4819
  %conv9 = sext i32 %conv8 to i64, !dbg !4820
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4821
  %conv10 = zext i16 %5 to i32, !dbg !4822
  %conv11 = sext i32 %conv10 to i64, !dbg !4823
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv9, i64 %conv11), !dbg !4824
  %tobool = icmp ne i32 %call, 0, !dbg !4824
  br i1 %tobool, label %if.end, label %if.then, !dbg !4825

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !4826
  br label %return, !dbg !4826

if.end:                                           ; preds = %entry
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4828
  %conv12 = zext i16 %6 to i32, !dbg !4828
  %7 = load i16, i16* %arg2_LW, align 2, !dbg !4829
  %conv13 = zext i16 %7 to i32, !dbg !4829
  %mul = mul nsw i32 %conv12, %conv13, !dbg !4830
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4831
  %8 = load i16, i16* %arg1_LW, align 2, !dbg !4832
  %conv14 = zext i16 %8 to i32, !dbg !4832
  %9 = load i16, i16* %arg2_HW, align 2, !dbg !4833
  %conv15 = zext i16 %9 to i32, !dbg !4833
  %mul16 = mul nsw i32 %conv14, %conv15, !dbg !4834
  store i32 %mul16, i32* %MulTemp2, align 4, !dbg !4835
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4836
  %conv17 = zext i16 %10 to i32, !dbg !4836
  %11 = load i16, i16* %arg2_LW, align 2, !dbg !4837
  %conv18 = zext i16 %11 to i32, !dbg !4837
  %mul19 = mul nsw i32 %conv17, %conv18, !dbg !4838
  store i32 %mul19, i32* %MulTemp3, align 4, !dbg !4839
  %12 = load i16, i16* %arg1_HW, align 2, !dbg !4840
  %conv20 = zext i16 %12 to i32, !dbg !4840
  %13 = load i16, i16* %arg2_HW, align 2, !dbg !4841
  %conv21 = zext i16 %13 to i32, !dbg !4841
  %mul22 = mul nsw i32 %conv20, %conv21, !dbg !4842
  store i32 %mul22, i32* %MulTemp4, align 4, !dbg !4843
  %14 = load i32, i32* %MulTemp2, align 4, !dbg !4844
  %shr23 = lshr i32 %14, 16, !dbg !4845
  %15 = load i32, i32* %MulTemp3, align 4, !dbg !4846
  %shr24 = lshr i32 %15, 16, !dbg !4847
  %add = add i32 %shr23, %shr24, !dbg !4848
  %16 = load i32, i32* %MulTemp4, align 4, !dbg !4849
  %add25 = add i32 %add, %16, !dbg !4850
  store i32 %add25, i32* %HIGHWORD, align 4, !dbg !4851
  %17 = load i32, i32* %MulTemp1, align 4, !dbg !4852
  %shr26 = lshr i32 %17, 16, !dbg !4853
  %18 = load i32, i32* %MulTemp2, align 4, !dbg !4854
  %and27 = and i32 %18, 65535, !dbg !4855
  %add28 = add i32 %shr26, %and27, !dbg !4856
  %19 = load i32, i32* %MulTemp3, align 4, !dbg !4857
  %and29 = and i32 %19, 65535, !dbg !4858
  %add30 = add i32 %add28, %and29, !dbg !4859
  store i32 %add30, i32* %OverFlow, align 4, !dbg !4860
  %20 = load i32, i32* %OverFlow, align 4, !dbg !4861
  %cmp = icmp ugt i32 %20, 65535, !dbg !4863
  br i1 %cmp, label %if.then32, label %if.else, !dbg !4864

if.then32:                                        ; preds = %if.end
  %21 = load i32, i32* %HIGHWORD, align 4, !dbg !4865
  %22 = load i32, i32* %OverFlow, align 4, !dbg !4867
  %shr33 = lshr i32 %22, 16, !dbg !4868
  %add34 = add i32 %21, %shr33, !dbg !4869
  store i32 %add34, i32* %retval, align 4, !dbg !4870
  br label %return, !dbg !4870

if.else:                                          ; preds = %if.end
  %23 = load i32, i32* %HIGHWORD, align 4, !dbg !4871
  store i32 %23, i32* %retval, align 4, !dbg !4873
  br label %return, !dbg !4873

return:                                           ; preds = %if.else, %if.then32, %if.then
  %24 = load i32, i32* %retval, align 4, !dbg !4874
  ret i32 %24, !dbg !4874
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !4875 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !4878, metadata !DIExpression()), !dbg !4879
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !4880, metadata !DIExpression()), !dbg !4881
  %0 = load i64, i64* %left.addr, align 8, !dbg !4882
  %1 = load i64, i64* %right.addr, align 8, !dbg !4883
  %mul = mul nsw i64 %0, %1, !dbg !4884
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !4885
  %conv = zext i1 %cmp to i32, !dbg !4885
  ret i32 %conv, !dbg !4886
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @MulLowWord(i32 %arg1, i32 %arg2) #0 !dbg !4887 {
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
  call void @llvm.dbg.declare(metadata i32* %arg1.addr, metadata !4888, metadata !DIExpression()), !dbg !4889
  store i32 %arg2, i32* %arg2.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %arg2.addr, metadata !4890, metadata !DIExpression()), !dbg !4891
  call void @llvm.dbg.declare(metadata i16* %arg1_LW, metadata !4892, metadata !DIExpression()), !dbg !4893
  call void @llvm.dbg.declare(metadata i16* %arg1_HW, metadata !4894, metadata !DIExpression()), !dbg !4895
  call void @llvm.dbg.declare(metadata i16* %arg2_LW, metadata !4896, metadata !DIExpression()), !dbg !4897
  call void @llvm.dbg.declare(metadata i16* %arg2_HW, metadata !4898, metadata !DIExpression()), !dbg !4899
  call void @llvm.dbg.declare(metadata i32* %MulTemp1, metadata !4900, metadata !DIExpression()), !dbg !4901
  call void @llvm.dbg.declare(metadata i32* %MulTemp2, metadata !4902, metadata !DIExpression()), !dbg !4903
  call void @llvm.dbg.declare(metadata i32* %MulTemp3, metadata !4904, metadata !DIExpression()), !dbg !4905
  call void @llvm.dbg.declare(metadata i32* %MulTemp4, metadata !4906, metadata !DIExpression()), !dbg !4907
  call void @llvm.dbg.declare(metadata i32* %HIGHWORD, metadata !4908, metadata !DIExpression()), !dbg !4909
  call void @llvm.dbg.declare(metadata i32* %OverFlow, metadata !4910, metadata !DIExpression()), !dbg !4911
  %0 = load i32, i32* %arg1.addr, align 4, !dbg !4912
  %and = and i32 %0, 65535, !dbg !4913
  %conv = trunc i32 %and to i16, !dbg !4912
  store i16 %conv, i16* %arg1_LW, align 2, !dbg !4914
  %1 = load i32, i32* %arg1.addr, align 4, !dbg !4915
  %and1 = and i32 %1, -65536, !dbg !4916
  %shr = lshr i32 %and1, 16, !dbg !4917
  %conv2 = trunc i32 %shr to i16, !dbg !4918
  store i16 %conv2, i16* %arg1_HW, align 2, !dbg !4919
  %2 = load i32, i32* %arg2.addr, align 4, !dbg !4920
  %and3 = and i32 %2, 65535, !dbg !4921
  %conv4 = trunc i32 %and3 to i16, !dbg !4920
  store i16 %conv4, i16* %arg2_LW, align 2, !dbg !4922
  %3 = load i32, i32* %arg2.addr, align 4, !dbg !4923
  %and5 = and i32 %3, -65536, !dbg !4924
  %shr6 = lshr i32 %and5, 16, !dbg !4925
  %conv7 = trunc i32 %shr6 to i16, !dbg !4926
  store i16 %conv7, i16* %arg2_HW, align 2, !dbg !4927
  %4 = load i16, i16* %arg1_LW, align 2, !dbg !4928
  %conv8 = zext i16 %4 to i32, !dbg !4928
  %5 = load i16, i16* %arg2_LW, align 2, !dbg !4929
  %conv9 = zext i16 %5 to i32, !dbg !4929
  %mul = mul nsw i32 %conv8, %conv9, !dbg !4930
  store i32 %mul, i32* %MulTemp1, align 4, !dbg !4931
  %6 = load i16, i16* %arg1_LW, align 2, !dbg !4932
  %conv10 = zext i16 %6 to i32, !dbg !4932
  %7 = load i16, i16* %arg2_HW, align 2, !dbg !4933
  %conv11 = zext i16 %7 to i32, !dbg !4933
  %mul12 = mul nsw i32 %conv10, %conv11, !dbg !4934
  store i32 %mul12, i32* %MulTemp2, align 4, !dbg !4935
  %8 = load i16, i16* %arg1_HW, align 2, !dbg !4936
  %conv13 = zext i16 %8 to i32, !dbg !4936
  %9 = load i16, i16* %arg2_LW, align 2, !dbg !4937
  %conv14 = zext i16 %9 to i32, !dbg !4937
  %mul15 = mul nsw i32 %conv13, %conv14, !dbg !4938
  store i32 %mul15, i32* %MulTemp3, align 4, !dbg !4939
  %10 = load i16, i16* %arg1_HW, align 2, !dbg !4940
  %conv16 = zext i16 %10 to i32, !dbg !4940
  %11 = load i16, i16* %arg2_HW, align 2, !dbg !4941
  %conv17 = zext i16 %11 to i32, !dbg !4941
  %mul18 = mul nsw i32 %conv16, %conv17, !dbg !4942
  store i32 %mul18, i32* %MulTemp4, align 4, !dbg !4943
  %12 = load i32, i32* %MulTemp1, align 4, !dbg !4944
  %13 = load i32, i32* %MulTemp2, align 4, !dbg !4945
  %and19 = and i32 %13, 65535, !dbg !4946
  %shl = shl i32 %and19, 16, !dbg !4947
  %add = add i32 %12, %shl, !dbg !4948
  %14 = load i32, i32* %MulTemp3, align 4, !dbg !4949
  %and20 = and i32 %14, 65535, !dbg !4950
  %shl21 = shl i32 %and20, 16, !dbg !4951
  %add22 = add i32 %add, %shl21, !dbg !4952
  store i32 %add22, i32* %OverFlow, align 4, !dbg !4953
  %15 = load i32, i32* %OverFlow, align 4, !dbg !4954
  ret i32 %15, !dbg !4955
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !4956 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4962, metadata !DIExpression()), !dbg !4963
  %2 = icmp eq i64 %0, 0, !dbg !4964
  br i1 %2, label %3, label %4, !dbg !4966

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !4967
  unreachable, !dbg !4967

4:                                                ; preds = %1
  ret void, !dbg !4968
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define dso_local void @klee_overshift_check(i64 %0, i64 %1) #4 !dbg !4969 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !4975, metadata !DIExpression()), !dbg !4977
  call void @llvm.dbg.value(metadata i64 %1, metadata !4976, metadata !DIExpression()), !dbg !4977
  %3 = icmp ult i64 %1, %0, !dbg !4978
  br i1 %3, label %5, label %4, !dbg !4980

4:                                                ; preds = %2
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.9, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1.10, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2.11, i64 0, i64 0)) #6, !dbg !4981
  unreachable, !dbg !4981

5:                                                ; preds = %2
  ret void, !dbg !4983
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/mul_Ccode_alarm_0115.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!4 = !{}
!5 = !{!6, !13, !17, !22, !26}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s8", file: !7, line: 7, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
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
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !26)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!34 = distinct !DICompileUnit(language: DW_LANG_C99, file: !35, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !36, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115/MulHword_alarm_0115.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
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
!50 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!51 = !DISubroutineType(types: !52)
!52 = !{!37}
!53 = !DILocalVariable(name: "value", scope: !49, file: !50, line: 9, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !37)
!56 = !DILocation(line: 9, column: 13, scope: !49)
!57 = !DILocalVariable(name: "factor", scope: !49, file: !50, line: 10, type: !54)
!58 = !DILocation(line: 10, column: 13, scope: !49)
!59 = !DILocalVariable(name: "power", scope: !49, file: !50, line: 11, type: !18)
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
!75 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_less1", scope: !76, file: !76, line: 43, type: !77, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DIFile(filename: "src_analysis/sources/mul_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!77 = !DISubroutineType(types: !78)
!78 = !{!6, !6, !22}
!79 = !DILocalVariable(name: "value", arg: 1, scope: !75, file: !76, line: 43, type: !6)
!80 = !DILocation(line: 43, column: 35, scope: !75)
!81 = !DILocalVariable(name: "factor", arg: 2, scope: !75, file: !76, line: 43, type: !22)
!82 = !DILocation(line: 43, column: 46, scope: !75)
!83 = !DILocalVariable(name: "s32MulTemp1", scope: !75, file: !76, line: 45, type: !84)
!84 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !54)
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
!115 = distinct !DISubprogram(name: "root_s8_mul_s8_u8_fac_greater1", scope: !76, file: !76, line: 77, type: !77, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!116 = !DILocalVariable(name: "value", arg: 1, scope: !115, file: !76, line: 77, type: !6)
!117 = !DILocation(line: 77, column: 38, scope: !115)
!118 = !DILocalVariable(name: "factor", arg: 2, scope: !115, file: !76, line: 77, type: !22)
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
!162 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac1", scope: !76, file: !76, line: 123, type: !163, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DISubroutineType(types: !164)
!164 = !{!6, !6, !17}
!165 = !DILocalVariable(name: "value", arg: 1, scope: !162, file: !76, line: 123, type: !6)
!166 = !DILocation(line: 123, column: 25, scope: !162)
!167 = !DILocalVariable(name: "factor", arg: 2, scope: !162, file: !76, line: 123, type: !17)
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
!200 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac2", scope: !76, file: !76, line: 155, type: !163, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!201 = !DILocalVariable(name: "value", arg: 1, scope: !200, file: !76, line: 155, type: !6)
!202 = !DILocation(line: 155, column: 25, scope: !200)
!203 = !DILocalVariable(name: "factor", arg: 2, scope: !200, file: !76, line: 155, type: !17)
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
!247 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_less1", scope: !76, file: !76, line: 200, type: !248, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DISubroutineType(types: !249)
!249 = !{!13, !13, !13, !84}
!250 = !DILocalVariable(name: "value", arg: 1, scope: !247, file: !76, line: 200, type: !13)
!251 = !DILocation(line: 200, column: 40, scope: !247)
!252 = !DILocalVariable(name: "factor", arg: 2, scope: !247, file: !76, line: 200, type: !13)
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
!269 = distinct !DISubprogram(name: "root_s16_mul_s16_s16_fac_greater1", scope: !76, file: !76, line: 223, type: !248, scopeLine: 224, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!270 = !DILocalVariable(name: "value", arg: 1, scope: !269, file: !76, line: 223, type: !13)
!271 = !DILocation(line: 223, column: 43, scope: !269)
!272 = !DILocalVariable(name: "factor", arg: 2, scope: !269, file: !76, line: 223, type: !13)
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
!304 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1", scope: !76, file: !76, line: 262, type: !305, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!305 = !DISubroutineType(types: !306)
!306 = !{!13, !13, !13}
!307 = !DILocalVariable(name: "value", arg: 1, scope: !304, file: !76, line: 262, type: !13)
!308 = !DILocation(line: 262, column: 30, scope: !304)
!309 = !DILocalVariable(name: "factor", arg: 2, scope: !304, file: !76, line: 262, type: !13)
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
!346 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2", scope: !76, file: !76, line: 304, type: !305, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!347 = !DILocalVariable(name: "value", arg: 1, scope: !346, file: !76, line: 304, type: !13)
!348 = !DILocation(line: 304, column: 30, scope: !346)
!349 = !DILocalVariable(name: "factor", arg: 2, scope: !346, file: !76, line: 304, type: !13)
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
!393 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_less1", scope: !76, file: !76, line: 350, type: !394, scopeLine: 351, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!394 = !DISubroutineType(types: !395)
!395 = !{!13, !13, !22}
!396 = !DILocalVariable(name: "value", arg: 1, scope: !393, file: !76, line: 350, type: !13)
!397 = !DILocation(line: 350, column: 39, scope: !393)
!398 = !DILocalVariable(name: "factor", arg: 2, scope: !393, file: !76, line: 350, type: !22)
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
!431 = distinct !DISubprogram(name: "root_s16_mul_s16_u8_fac_greater1", scope: !76, file: !76, line: 386, type: !394, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!432 = !DILocalVariable(name: "value", arg: 1, scope: !431, file: !76, line: 386, type: !13)
!433 = !DILocation(line: 386, column: 42, scope: !431)
!434 = !DILocalVariable(name: "factor", arg: 2, scope: !431, file: !76, line: 386, type: !22)
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
!478 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac1", scope: !76, file: !76, line: 436, type: !479, scopeLine: 437, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!479 = !DISubroutineType(types: !480)
!480 = !{!13, !13, !17}
!481 = !DILocalVariable(name: "value", arg: 1, scope: !478, file: !76, line: 436, type: !13)
!482 = !DILocation(line: 436, column: 29, scope: !478)
!483 = !DILocalVariable(name: "factor", arg: 2, scope: !478, file: !76, line: 436, type: !17)
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
!514 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac2", scope: !76, file: !76, line: 473, type: !479, scopeLine: 474, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!515 = !DILocalVariable(name: "value", arg: 1, scope: !514, file: !76, line: 473, type: !13)
!516 = !DILocation(line: 473, column: 29, scope: !514)
!517 = !DILocalVariable(name: "factor", arg: 2, scope: !514, file: !76, line: 473, type: !17)
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
!561 = distinct !DISubprogram(name: "s16_mul_s16_u16", scope: !76, file: !76, line: 521, type: !394, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!562 = !DILocalVariable(name: "value", arg: 1, scope: !561, file: !76, line: 521, type: !13)
!563 = !DILocation(line: 521, column: 25, scope: !561)
!564 = !DILocalVariable(name: "factor", arg: 2, scope: !561, file: !76, line: 521, type: !22)
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
!590 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_less1", scope: !76, file: !76, line: 556, type: !591, scopeLine: 557, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!591 = !DISubroutineType(types: !592)
!592 = !{!13, !13, !22, !84}
!593 = !DILocalVariable(name: "value", arg: 1, scope: !590, file: !76, line: 556, type: !13)
!594 = !DILocation(line: 556, column: 40, scope: !590)
!595 = !DILocalVariable(name: "factor", arg: 2, scope: !590, file: !76, line: 556, type: !22)
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
!612 = distinct !DISubprogram(name: "root_s16_mul_s16_u16_fac_greater1", scope: !76, file: !76, line: 580, type: !613, scopeLine: 581, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!613 = !DISubroutineType(types: !614)
!614 = !{!13, !13, !22, !22}
!615 = !DILocalVariable(name: "value", arg: 1, scope: !612, file: !76, line: 580, type: !13)
!616 = !DILocation(line: 580, column: 43, scope: !612)
!617 = !DILocalVariable(name: "factor", arg: 2, scope: !612, file: !76, line: 580, type: !22)
!618 = !DILocation(line: 580, column: 53, scope: !612)
!619 = !DILocalVariable(name: "count", arg: 3, scope: !612, file: !76, line: 580, type: !22)
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
!649 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1", scope: !76, file: !76, line: 617, type: !394, scopeLine: 618, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!650 = !DILocalVariable(name: "value", arg: 1, scope: !649, file: !76, line: 617, type: !13)
!651 = !DILocation(line: 617, column: 31, scope: !649)
!652 = !DILocalVariable(name: "factor", arg: 2, scope: !649, file: !76, line: 617, type: !22)
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
!685 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2", scope: !76, file: !76, line: 654, type: !394, scopeLine: 655, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!686 = !DILocalVariable(name: "value", arg: 1, scope: !685, file: !76, line: 654, type: !13)
!687 = !DILocation(line: 654, column: 31, scope: !685)
!688 = !DILocalVariable(name: "factor", arg: 2, scope: !685, file: !76, line: 654, type: !22)
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
!732 = distinct !DISubprogram(name: "s16_mul_u16_u16_fac256", scope: !76, file: !76, line: 704, type: !733, scopeLine: 705, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!733 = !DISubroutineType(types: !734)
!734 = !{!13, !22, !22}
!735 = !DILocalVariable(name: "value", arg: 1, scope: !732, file: !76, line: 704, type: !22)
!736 = !DILocation(line: 704, column: 33, scope: !732)
!737 = !DILocalVariable(name: "factor", arg: 2, scope: !732, file: !76, line: 704, type: !22)
!738 = !DILocation(line: 704, column: 44, scope: !732)
!739 = !DILocalVariable(name: "u32MulTemp", scope: !732, file: !76, line: 706, type: !740)
!740 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !741)
!741 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !742)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !743)
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
!763 = distinct !DISubprogram(name: "s32_mul_s16_u16", scope: !76, file: !76, line: 732, type: !764, scopeLine: 733, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!764 = !DISubroutineType(types: !765)
!765 = !{!84, !13, !22}
!766 = !DILocalVariable(name: "value", arg: 1, scope: !763, file: !76, line: 732, type: !13)
!767 = !DILocation(line: 732, column: 25, scope: !763)
!768 = !DILocalVariable(name: "factor", arg: 2, scope: !763, file: !76, line: 732, type: !22)
!769 = !DILocation(line: 732, column: 36, scope: !763)
!770 = !DILocalVariable(name: "s32MulTemp", scope: !763, file: !76, line: 734, type: !84)
!771 = !DILocation(line: 734, column: 6, scope: !763)
!772 = !DILocation(line: 735, column: 15, scope: !763)
!773 = !DILocation(line: 735, column: 23, scope: !763)
!774 = !DILocation(line: 735, column: 21, scope: !763)
!775 = !DILocation(line: 735, column: 13, scope: !763)
!776 = !DILocation(line: 736, column: 9, scope: !763)
!777 = !DILocation(line: 736, column: 2, scope: !763)
!778 = distinct !DISubprogram(name: "s32_mul_s32_u16", scope: !76, file: !76, line: 752, type: !779, scopeLine: 753, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!779 = !DISubroutineType(types: !780)
!780 = !{!84, !84, !22}
!781 = !DILocalVariable(name: "value", arg: 1, scope: !778, file: !76, line: 752, type: !84)
!782 = !DILocation(line: 752, column: 25, scope: !778)
!783 = !DILocalVariable(name: "factor", arg: 2, scope: !778, file: !76, line: 752, type: !22)
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
!836 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_less1", scope: !76, file: !76, line: 802, type: !837, scopeLine: 803, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!837 = !DISubroutineType(types: !838)
!838 = !{!17, !17, !17, !22}
!839 = !DILocalVariable(name: "value", arg: 1, scope: !836, file: !76, line: 802, type: !17)
!840 = !DILocation(line: 802, column: 35, scope: !836)
!841 = !DILocalVariable(name: "factor", arg: 2, scope: !836, file: !76, line: 802, type: !17)
!842 = !DILocation(line: 802, column: 44, scope: !836)
!843 = !DILocalVariable(name: "count", arg: 3, scope: !836, file: !76, line: 802, type: !22)
!844 = !DILocation(line: 802, column: 55, scope: !836)
!845 = !DILocalVariable(name: "u16MulTemp", scope: !836, file: !76, line: 804, type: !22)
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
!858 = distinct !DISubprogram(name: "root_u8_mul_u8_u8_fac_greater1", scope: !76, file: !76, line: 824, type: !859, scopeLine: 825, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!859 = !DISubroutineType(types: !860)
!860 = !{!17, !17, !17, !17}
!861 = !DILocalVariable(name: "value", arg: 1, scope: !858, file: !76, line: 824, type: !17)
!862 = !DILocation(line: 824, column: 38, scope: !858)
!863 = !DILocalVariable(name: "factor", arg: 2, scope: !858, file: !76, line: 824, type: !17)
!864 = !DILocation(line: 824, column: 47, scope: !858)
!865 = !DILocalVariable(name: "count", arg: 3, scope: !858, file: !76, line: 824, type: !17)
!866 = !DILocation(line: 824, column: 57, scope: !858)
!867 = !DILocalVariable(name: "u16MulTemp", scope: !858, file: !76, line: 826, type: !22)
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
!888 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac1", scope: !76, file: !76, line: 854, type: !889, scopeLine: 855, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!889 = !DISubroutineType(types: !890)
!890 = !{!17, !17, !17}
!891 = !DILocalVariable(name: "x_value", arg: 1, scope: !888, file: !76, line: 854, type: !17)
!892 = !DILocation(line: 854, column: 25, scope: !888)
!893 = !DILocalVariable(name: "y_value", arg: 2, scope: !888, file: !76, line: 854, type: !17)
!894 = !DILocation(line: 854, column: 36, scope: !888)
!895 = !DILocalVariable(name: "u16MulTemp", scope: !888, file: !76, line: 856, type: !22)
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
!907 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac2", scope: !76, file: !76, line: 878, type: !889, scopeLine: 879, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!908 = !DILocalVariable(name: "value", arg: 1, scope: !907, file: !76, line: 878, type: !17)
!909 = !DILocation(line: 878, column: 26, scope: !907)
!910 = !DILocalVariable(name: "factor", arg: 2, scope: !907, file: !76, line: 878, type: !17)
!911 = !DILocation(line: 878, column: 36, scope: !907)
!912 = !DILocalVariable(name: "u16MulTemp", scope: !907, file: !76, line: 880, type: !22)
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
!932 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_less1", scope: !76, file: !76, line: 907, type: !933, scopeLine: 908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!933 = !DISubroutineType(types: !934)
!934 = !{!22, !22, !22}
!935 = !DILocalVariable(name: "value", arg: 1, scope: !932, file: !76, line: 907, type: !22)
!936 = !DILocation(line: 907, column: 39, scope: !932)
!937 = !DILocalVariable(name: "factor", arg: 2, scope: !932, file: !76, line: 907, type: !22)
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
!951 = distinct !DISubprogram(name: "root_u16_mul_u16_u8_fac_greater_1", scope: !76, file: !76, line: 931, type: !933, scopeLine: 932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!952 = !DILocalVariable(name: "value", arg: 1, scope: !951, file: !76, line: 931, type: !22)
!953 = !DILocation(line: 931, column: 43, scope: !951)
!954 = !DILocalVariable(name: "factor", arg: 2, scope: !951, file: !76, line: 931, type: !22)
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
!977 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac1", scope: !76, file: !76, line: 962, type: !978, scopeLine: 963, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!978 = !DISubroutineType(types: !979)
!979 = !{!22, !22, !17}
!980 = !DILocalVariable(name: "x_value", arg: 1, scope: !977, file: !76, line: 962, type: !22)
!981 = !DILocation(line: 962, column: 29, scope: !977)
!982 = !DILocalVariable(name: "y_value", arg: 2, scope: !977, file: !76, line: 962, type: !17)
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
!996 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac2", scope: !76, file: !76, line: 986, type: !978, scopeLine: 987, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!997 = !DILocalVariable(name: "x_value", arg: 1, scope: !996, file: !76, line: 986, type: !22)
!998 = !DILocation(line: 986, column: 29, scope: !996)
!999 = !DILocalVariable(name: "y_value", arg: 2, scope: !996, file: !76, line: 986, type: !17)
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
!1022 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_less1", scope: !76, file: !76, line: 1015, type: !1023, scopeLine: 1016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!22, !22, !22, !740}
!1025 = !DILocalVariable(name: "value", arg: 1, scope: !1022, file: !76, line: 1015, type: !22)
!1026 = !DILocation(line: 1015, column: 40, scope: !1022)
!1027 = !DILocalVariable(name: "factor", arg: 2, scope: !1022, file: !76, line: 1015, type: !22)
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
!1045 = distinct !DISubprogram(name: "root_u16_mul_u16_u16_fac_greater1", scope: !76, file: !76, line: 1038, type: !1046, scopeLine: 1039, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!22, !22, !22, !22}
!1048 = !DILocalVariable(name: "value", arg: 1, scope: !1045, file: !76, line: 1038, type: !22)
!1049 = !DILocation(line: 1038, column: 43, scope: !1045)
!1050 = !DILocalVariable(name: "factor", arg: 2, scope: !1045, file: !76, line: 1038, type: !22)
!1051 = !DILocation(line: 1038, column: 53, scope: !1045)
!1052 = !DILocalVariable(name: "count", arg: 3, scope: !1045, file: !76, line: 1038, type: !22)
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
!1076 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1", scope: !76, file: !76, line: 1067, type: !933, scopeLine: 1068, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1077 = !DILocalVariable(name: "x_value", arg: 1, scope: !1076, file: !76, line: 1067, type: !22)
!1078 = !DILocation(line: 1067, column: 30, scope: !1076)
!1079 = !DILocalVariable(name: "y_value", arg: 2, scope: !1076, file: !76, line: 1067, type: !22)
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
!1094 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2", scope: !76, file: !76, line: 1091, type: !933, scopeLine: 1092, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1095 = !DILocalVariable(name: "x_value", arg: 1, scope: !1094, file: !76, line: 1091, type: !22)
!1096 = !DILocation(line: 1091, column: 30, scope: !1094)
!1097 = !DILocalVariable(name: "y_value", arg: 2, scope: !1094, file: !76, line: 1091, type: !22)
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
!1120 = distinct !DISubprogram(name: "u32_mul_u32_u16", scope: !76, file: !76, line: 1119, type: !1121, scopeLine: 1120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1121 = !DISubroutineType(types: !1122)
!1122 = !{!740, !740, !22}
!1123 = !DILocalVariable(name: "x_value", arg: 1, scope: !1120, file: !76, line: 1119, type: !740)
!1124 = !DILocation(line: 1119, column: 26, scope: !1120)
!1125 = !DILocalVariable(name: "y_value", arg: 2, scope: !1120, file: !76, line: 1119, type: !22)
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
!1152 = distinct !DISubprogram(name: "root_u32_mul_u32_u16_fac_less1", scope: !76, file: !76, line: 1157, type: !1153, scopeLine: 1158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{!740, !740, !22, !740}
!1155 = !DILocalVariable(name: "value", arg: 1, scope: !1152, file: !76, line: 1157, type: !740)
!1156 = !DILocation(line: 1157, column: 40, scope: !1152)
!1157 = !DILocalVariable(name: "factor", arg: 2, scope: !1152, file: !76, line: 1157, type: !22)
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
!1194 = distinct !DISubprogram(name: "u8_cal1_u8_u8_s8", scope: !76, file: !76, line: 1188, type: !1195, scopeLine: 1189, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1195 = !DISubroutineType(types: !1196)
!1196 = !{!17, !17, !17, !6}
!1197 = !DILocalVariable(name: "val1", arg: 1, scope: !1194, file: !76, line: 1188, type: !17)
!1198 = !DILocation(line: 1188, column: 25, scope: !1194)
!1199 = !DILocalVariable(name: "val2", arg: 2, scope: !1194, file: !76, line: 1188, type: !17)
!1200 = !DILocation(line: 1188, column: 34, scope: !1194)
!1201 = !DILocalVariable(name: "factor", arg: 3, scope: !1194, file: !76, line: 1188, type: !6)
!1202 = !DILocation(line: 1188, column: 43, scope: !1194)
!1203 = !DILocalVariable(name: "s16Temp1", scope: !1194, file: !76, line: 1190, type: !13)
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
!1233 = distinct !DISubprogram(name: "u16_cal1_u16_u16_s8", scope: !76, file: !76, line: 1224, type: !1234, scopeLine: 1225, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1234 = !DISubroutineType(types: !1235)
!1235 = !{!22, !22, !22, !6}
!1236 = !DILocalVariable(name: "val1", arg: 1, scope: !1233, file: !76, line: 1224, type: !22)
!1237 = !DILocation(line: 1224, column: 30, scope: !1233)
!1238 = !DILocalVariable(name: "val2", arg: 2, scope: !1233, file: !76, line: 1224, type: !22)
!1239 = !DILocation(line: 1224, column: 40, scope: !1233)
!1240 = !DILocalVariable(name: "factor", arg: 3, scope: !1233, file: !76, line: 1224, type: !6)
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
!1271 = distinct !DISubprogram(name: "u16_mul_u16_u16", scope: !76, file: !76, line: 1259, type: !933, scopeLine: 1260, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1272 = !DILocalVariable(name: "val1", arg: 1, scope: !1271, file: !76, line: 1259, type: !22)
!1273 = !DILocation(line: 1259, column: 26, scope: !1271)
!1274 = !DILocalVariable(name: "val2", arg: 2, scope: !1271, file: !76, line: 1259, type: !22)
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
!1294 = distinct !DISubprogram(name: "u32_mul_u16_u16", scope: !76, file: !76, line: 1285, type: !1295, scopeLine: 1286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1295 = !DISubroutineType(types: !1296)
!1296 = !{!740, !22, !22}
!1297 = !DILocalVariable(name: "x_value", arg: 1, scope: !1294, file: !76, line: 1285, type: !22)
!1298 = !DILocation(line: 1285, column: 25, scope: !1294)
!1299 = !DILocalVariable(name: "y_value", arg: 2, scope: !1294, file: !76, line: 1285, type: !22)
!1300 = !DILocation(line: 1285, column: 38, scope: !1294)
!1301 = !DILocalVariable(name: "u32Temp1", scope: !1294, file: !76, line: 1287, type: !740)
!1302 = !DILocation(line: 1287, column: 6, scope: !1294)
!1303 = !DILocation(line: 1288, column: 13, scope: !1294)
!1304 = !DILocation(line: 1288, column: 23, scope: !1294)
!1305 = !DILocation(line: 1288, column: 21, scope: !1294)
!1306 = !DILocation(line: 1288, column: 11, scope: !1294)
!1307 = !DILocation(line: 1289, column: 9, scope: !1294)
!1308 = !DILocation(line: 1289, column: 2, scope: !1294)
!1309 = distinct !DISubprogram(name: "s32_mul_s16_s16", scope: !76, file: !76, line: 1307, type: !1310, scopeLine: 1308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1310 = !DISubroutineType(types: !1311)
!1311 = !{!84, !13, !13}
!1312 = !DILocalVariable(name: "x_value", arg: 1, scope: !1309, file: !76, line: 1307, type: !13)
!1313 = !DILocation(line: 1307, column: 25, scope: !1309)
!1314 = !DILocalVariable(name: "y_value", arg: 2, scope: !1309, file: !76, line: 1307, type: !13)
!1315 = !DILocation(line: 1307, column: 38, scope: !1309)
!1316 = !DILocalVariable(name: "s32Temp1", scope: !1309, file: !76, line: 1309, type: !84)
!1317 = !DILocation(line: 1309, column: 6, scope: !1309)
!1318 = !DILocation(line: 1310, column: 13, scope: !1309)
!1319 = !DILocation(line: 1310, column: 23, scope: !1309)
!1320 = !DILocation(line: 1310, column: 21, scope: !1309)
!1321 = !DILocation(line: 1310, column: 11, scope: !1309)
!1322 = !DILocation(line: 1311, column: 9, scope: !1309)
!1323 = !DILocation(line: 1311, column: 2, scope: !1309)
!1324 = distinct !DISubprogram(name: "u32_mul_u32_s32", scope: !76, file: !76, line: 1328, type: !1325, scopeLine: 1329, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1356 = distinct !DISubprogram(name: "u32_mul_s32_s32", scope: !76, file: !76, line: 1362, type: !1357, scopeLine: 1363, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1369 = !DILocalVariable(name: "u8SignBit", scope: !1356, file: !76, line: 1365, type: !17)
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
!1415 = distinct !DISubprogram(name: "u32_mul_u32_u32", scope: !76, file: !76, line: 1455, type: !1416, scopeLine: 1456, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1447 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac1", scope: !76, file: !76, line: 1501, type: !1121, scopeLine: 1502, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1448 = !DILocalVariable(name: "value", arg: 1, scope: !1447, file: !76, line: 1501, type: !740)
!1449 = !DILocation(line: 1501, column: 30, scope: !1447)
!1450 = !DILocalVariable(name: "factor", arg: 2, scope: !1447, file: !76, line: 1501, type: !22)
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
!1472 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac2", scope: !76, file: !76, line: 1527, type: !1121, scopeLine: 1528, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1473 = !DILocalVariable(name: "value", arg: 1, scope: !1472, file: !76, line: 1527, type: !740)
!1474 = !DILocation(line: 1527, column: 30, scope: !1472)
!1475 = !DILocalVariable(name: "factor", arg: 2, scope: !1472, file: !76, line: 1527, type: !22)
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
!1506 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac1", scope: !76, file: !76, line: 1560, type: !1507, scopeLine: 1561, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{!740, !740, !13}
!1509 = !DILocalVariable(name: "value", arg: 1, scope: !1506, file: !76, line: 1560, type: !740)
!1510 = !DILocation(line: 1560, column: 30, scope: !1506)
!1511 = !DILocalVariable(name: "factor", arg: 2, scope: !1506, file: !76, line: 1560, type: !13)
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
!1541 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac2", scope: !76, file: !76, line: 1595, type: !1507, scopeLine: 1596, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1542 = !DILocalVariable(name: "value", arg: 1, scope: !1541, file: !76, line: 1595, type: !740)
!1543 = !DILocation(line: 1595, column: 31, scope: !1541)
!1544 = !DILocalVariable(name: "factor", arg: 2, scope: !1541, file: !76, line: 1595, type: !13)
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
!1582 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac1", scope: !76, file: !76, line: 1632, type: !1416, scopeLine: 1633, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1583 = !DILocalVariable(name: "value", arg: 1, scope: !1582, file: !76, line: 1632, type: !740)
!1584 = !DILocation(line: 1632, column: 30, scope: !1582)
!1585 = !DILocalVariable(name: "factor", arg: 2, scope: !1582, file: !76, line: 1632, type: !740)
!1586 = !DILocation(line: 1632, column: 40, scope: !1582)
!1587 = !DILocation(line: 1634, column: 21, scope: !1582)
!1588 = !DILocation(line: 1634, column: 28, scope: !1582)
!1589 = !DILocation(line: 1634, column: 9, scope: !1582)
!1590 = !DILocation(line: 1634, column: 2, scope: !1582)
!1591 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac2", scope: !76, file: !76, line: 1653, type: !1416, scopeLine: 1654, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1625 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac1", scope: !76, file: !76, line: 1686, type: !1325, scopeLine: 1687, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1658 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac2", scope: !76, file: !76, line: 1720, type: !1325, scopeLine: 1721, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1699 = distinct !DISubprogram(name: "s32_mul_u32_s32", scope: !76, file: !76, line: 1757, type: !1700, scopeLine: 1758, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!1757 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac1", scope: !76, file: !76, line: 1810, type: !779, scopeLine: 1811, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1758 = !DILocalVariable(name: "val1", arg: 1, scope: !1757, file: !76, line: 1810, type: !84)
!1759 = !DILocation(line: 1810, column: 30, scope: !1757)
!1760 = !DILocalVariable(name: "val2", arg: 2, scope: !1757, file: !76, line: 1810, type: !22)
!1761 = !DILocation(line: 1810, column: 39, scope: !1757)
!1762 = !DILocalVariable(name: "u32Temp1", scope: !1757, file: !76, line: 1812, type: !740)
!1763 = !DILocation(line: 1812, column: 6, scope: !1757)
!1764 = !DILocalVariable(name: "u32Temp2", scope: !1757, file: !76, line: 1812, type: !740)
!1765 = !DILocation(line: 1812, column: 17, scope: !1757)
!1766 = !DILocalVariable(name: "u32Temp3", scope: !1757, file: !76, line: 1812, type: !740)
!1767 = !DILocation(line: 1812, column: 26, scope: !1757)
!1768 = !DILocalVariable(name: "u8SignBit", scope: !1757, file: !76, line: 1813, type: !17)
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
!1810 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac2", scope: !76, file: !76, line: 1857, type: !779, scopeLine: 1858, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1811 = !DILocalVariable(name: "val1", arg: 1, scope: !1810, file: !76, line: 1857, type: !84)
!1812 = !DILocation(line: 1857, column: 30, scope: !1810)
!1813 = !DILocalVariable(name: "val2", arg: 2, scope: !1810, file: !76, line: 1857, type: !22)
!1814 = !DILocation(line: 1857, column: 39, scope: !1810)
!1815 = !DILocalVariable(name: "u32Temp1", scope: !1810, file: !76, line: 1859, type: !740)
!1816 = !DILocation(line: 1859, column: 6, scope: !1810)
!1817 = !DILocalVariable(name: "u32Temp2", scope: !1810, file: !76, line: 1859, type: !740)
!1818 = !DILocation(line: 1859, column: 17, scope: !1810)
!1819 = !DILocalVariable(name: "u32Temp3", scope: !1810, file: !76, line: 1859, type: !740)
!1820 = !DILocation(line: 1859, column: 26, scope: !1810)
!1821 = !DILocalVariable(name: "u8SignBit", scope: !1810, file: !76, line: 1860, type: !17)
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
!1873 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac1", scope: !76, file: !76, line: 1911, type: !1874, scopeLine: 1912, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1874 = !DISubroutineType(types: !1875)
!1875 = !{!84, !84, !13}
!1876 = !DILocalVariable(name: "val1", arg: 1, scope: !1873, file: !76, line: 1911, type: !84)
!1877 = !DILocation(line: 1911, column: 30, scope: !1873)
!1878 = !DILocalVariable(name: "val2", arg: 2, scope: !1873, file: !76, line: 1911, type: !13)
!1879 = !DILocation(line: 1911, column: 39, scope: !1873)
!1880 = !DILocalVariable(name: "u32Temp1", scope: !1873, file: !76, line: 1913, type: !740)
!1881 = !DILocation(line: 1913, column: 6, scope: !1873)
!1882 = !DILocalVariable(name: "u32Temp2", scope: !1873, file: !76, line: 1913, type: !740)
!1883 = !DILocation(line: 1913, column: 17, scope: !1873)
!1884 = !DILocalVariable(name: "u32Temp3", scope: !1873, file: !76, line: 1913, type: !740)
!1885 = !DILocation(line: 1913, column: 26, scope: !1873)
!1886 = !DILocalVariable(name: "u32Temp4", scope: !1873, file: !76, line: 1913, type: !740)
!1887 = !DILocation(line: 1913, column: 35, scope: !1873)
!1888 = !DILocalVariable(name: "u8SignBit", scope: !1873, file: !76, line: 1914, type: !17)
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
!1963 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac2", scope: !76, file: !76, line: 1977, type: !1874, scopeLine: 1978, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1964 = !DILocalVariable(name: "val1", arg: 1, scope: !1963, file: !76, line: 1977, type: !84)
!1965 = !DILocation(line: 1977, column: 30, scope: !1963)
!1966 = !DILocalVariable(name: "val2", arg: 2, scope: !1963, file: !76, line: 1977, type: !13)
!1967 = !DILocation(line: 1977, column: 39, scope: !1963)
!1968 = !DILocalVariable(name: "u32Temp1", scope: !1963, file: !76, line: 1979, type: !740)
!1969 = !DILocation(line: 1979, column: 6, scope: !1963)
!1970 = !DILocalVariable(name: "u32Temp2", scope: !1963, file: !76, line: 1979, type: !740)
!1971 = !DILocation(line: 1979, column: 17, scope: !1963)
!1972 = !DILocalVariable(name: "u32Temp3", scope: !1963, file: !76, line: 1979, type: !740)
!1973 = !DILocation(line: 1979, column: 26, scope: !1963)
!1974 = !DILocalVariable(name: "u32Temp4", scope: !1963, file: !76, line: 1979, type: !740)
!1975 = !DILocation(line: 1979, column: 35, scope: !1963)
!1976 = !DILocalVariable(name: "u8SignBit", scope: !1963, file: !76, line: 1980, type: !17)
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
!2064 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac1", scope: !76, file: !76, line: 2049, type: !2065, scopeLine: 2050, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!2075 = !DILocalVariable(name: "u8SignBit", scope: !2064, file: !76, line: 2052, type: !17)
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
!2105 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac2", scope: !76, file: !76, line: 2089, type: !2065, scopeLine: 2090, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!2116 = !DILocalVariable(name: "u8SignBit", scope: !2105, file: !76, line: 2092, type: !17)
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
!2168 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac1", scope: !76, file: !76, line: 2141, type: !2169, scopeLine: 2142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!2183 = !DILocalVariable(name: "u8SignBit", scope: !2168, file: !76, line: 2144, type: !17)
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
!2252 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac2", scope: !76, file: !76, line: 2207, type: !2169, scopeLine: 2208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!2265 = !DILocalVariable(name: "u8SignBit", scope: !2252, file: !76, line: 2210, type: !17)
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
!2347 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac1", scope: !76, file: !76, line: 2282, type: !2348, scopeLine: 2283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2348 = !DISubroutineType(types: !2349)
!2349 = !{!84, !84, !17}
!2350 = !DILocalVariable(name: "value", arg: 1, scope: !2347, file: !76, line: 2282, type: !84)
!2351 = !DILocation(line: 2282, column: 29, scope: !2347)
!2352 = !DILocalVariable(name: "factor", arg: 2, scope: !2347, file: !76, line: 2282, type: !17)
!2353 = !DILocation(line: 2282, column: 39, scope: !2347)
!2354 = !DILocalVariable(name: "u32Temp1", scope: !2347, file: !76, line: 2284, type: !740)
!2355 = !DILocation(line: 2284, column: 6, scope: !2347)
!2356 = !DILocalVariable(name: "u32Temp2", scope: !2347, file: !76, line: 2284, type: !740)
!2357 = !DILocation(line: 2284, column: 17, scope: !2347)
!2358 = !DILocalVariable(name: "u32Temp3", scope: !2347, file: !76, line: 2284, type: !740)
!2359 = !DILocation(line: 2284, column: 26, scope: !2347)
!2360 = !DILocalVariable(name: "u8SignBit", scope: !2347, file: !76, line: 2285, type: !17)
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
!2402 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac2", scope: !76, file: !76, line: 2329, type: !2348, scopeLine: 2330, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2403 = !DILocalVariable(name: "value", arg: 1, scope: !2402, file: !76, line: 2329, type: !84)
!2404 = !DILocation(line: 2329, column: 29, scope: !2402)
!2405 = !DILocalVariable(name: "factor", arg: 2, scope: !2402, file: !76, line: 2329, type: !17)
!2406 = !DILocation(line: 2329, column: 39, scope: !2402)
!2407 = !DILocalVariable(name: "u32Temp1", scope: !2402, file: !76, line: 2331, type: !740)
!2408 = !DILocation(line: 2331, column: 6, scope: !2402)
!2409 = !DILocalVariable(name: "u32Temp2", scope: !2402, file: !76, line: 2331, type: !740)
!2410 = !DILocation(line: 2331, column: 17, scope: !2402)
!2411 = !DILocalVariable(name: "u32Temp3", scope: !2402, file: !76, line: 2331, type: !740)
!2412 = !DILocation(line: 2331, column: 26, scope: !2402)
!2413 = !DILocalVariable(name: "u8SignBit", scope: !2402, file: !76, line: 2332, type: !17)
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
!2465 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac_twopow_u8", scope: !76, file: !76, line: 2380, type: !2466, scopeLine: 2381, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2466 = !DISubroutineType(types: !2467)
!2467 = !{!740, !740, !740, !17}
!2468 = !DILocalVariable(name: "value", arg: 1, scope: !2465, file: !76, line: 2380, type: !740)
!2469 = !DILocation(line: 2380, column: 39, scope: !2465)
!2470 = !DILocalVariable(name: "factor", arg: 2, scope: !2465, file: !76, line: 2380, type: !740)
!2471 = !DILocation(line: 2380, column: 49, scope: !2465)
!2472 = !DILocalVariable(name: "power", arg: 3, scope: !2465, file: !76, line: 2380, type: !17)
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
!2522 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac_twopow_u8", scope: !76, file: !76, line: 2425, type: !2523, scopeLine: 2426, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2523 = !DISubroutineType(types: !2524)
!2524 = !{!84, !84, !84, !17}
!2525 = !DILocalVariable(name: "value", arg: 1, scope: !2522, file: !76, line: 2425, type: !84)
!2526 = !DILocation(line: 2425, column: 39, scope: !2522)
!2527 = !DILocalVariable(name: "factor", arg: 2, scope: !2522, file: !76, line: 2425, type: !84)
!2528 = !DILocation(line: 2425, column: 50, scope: !2522)
!2529 = !DILocalVariable(name: "power", arg: 3, scope: !2522, file: !76, line: 2425, type: !17)
!2530 = !DILocation(line: 2425, column: 61, scope: !2522)
!2531 = !DILocalVariable(name: "u32Temp1", scope: !2522, file: !76, line: 2427, type: !740)
!2532 = !DILocation(line: 2427, column: 6, scope: !2522)
!2533 = !DILocalVariable(name: "u32Temp2", scope: !2522, file: !76, line: 2427, type: !740)
!2534 = !DILocation(line: 2427, column: 17, scope: !2522)
!2535 = !DILocalVariable(name: "u32Temp3", scope: !2522, file: !76, line: 2427, type: !740)
!2536 = !DILocation(line: 2427, column: 26, scope: !2522)
!2537 = !DILocalVariable(name: "u32Temp4", scope: !2522, file: !76, line: 2427, type: !740)
!2538 = !DILocation(line: 2427, column: 35, scope: !2522)
!2539 = !DILocalVariable(name: "u8SignBit", scope: !2522, file: !76, line: 2428, type: !17)
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
!2598 = !DILocation(line: 2476, column: 36, scope: !2592)
!2599 = !DILocation(line: 2476, column: 35, scope: !2592)
!2600 = !DILocation(line: 2476, column: 25, scope: !2592)
!2601 = !DILocation(line: 2476, column: 23, scope: !2592)
!2602 = !DILocation(line: 2477, column: 3, scope: !2592)
!2603 = !DILocation(line: 2481, column: 14, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2587, file: !76, line: 2480, column: 2)
!2605 = !DILocation(line: 2481, column: 12, scope: !2604)
!2606 = !DILocation(line: 2484, column: 13, scope: !2522)
!2607 = !DILocation(line: 2484, column: 24, scope: !2522)
!2608 = !DILocation(line: 2484, column: 22, scope: !2522)
!2609 = !DILocation(line: 2484, column: 11, scope: !2522)
!2610 = !DILocation(line: 2485, column: 25, scope: !2522)
!2611 = !DILocation(line: 2485, column: 35, scope: !2522)
!2612 = !DILocation(line: 2485, column: 13, scope: !2522)
!2613 = !DILocation(line: 2485, column: 11, scope: !2522)
!2614 = !DILocation(line: 2486, column: 13, scope: !2522)
!2615 = !DILocation(line: 2486, column: 29, scope: !2522)
!2616 = !DILocation(line: 2486, column: 28, scope: !2522)
!2617 = !DILocation(line: 2486, column: 22, scope: !2522)
!2618 = !DILocation(line: 2486, column: 11, scope: !2522)
!2619 = !DILocation(line: 2487, column: 14, scope: !2522)
!2620 = !DILocation(line: 2487, column: 26, scope: !2522)
!2621 = !DILocation(line: 2487, column: 23, scope: !2522)
!2622 = !DILocation(line: 2487, column: 11, scope: !2522)
!2623 = !DILocation(line: 2488, column: 6, scope: !2624)
!2624 = distinct !DILexicalBlock(scope: !2522, file: !76, line: 2488, column: 5)
!2625 = !DILocation(line: 2488, column: 20, scope: !2624)
!2626 = !DILocation(line: 2488, column: 19, scope: !2624)
!2627 = !DILocation(line: 2488, column: 14, scope: !2624)
!2628 = !DILocation(line: 2488, column: 27, scope: !2624)
!2629 = !DILocation(line: 2488, column: 5, scope: !2522)
!2630 = !DILocation(line: 2490, column: 6, scope: !2631)
!2631 = distinct !DILexicalBlock(scope: !2632, file: !76, line: 2490, column: 6)
!2632 = distinct !DILexicalBlock(scope: !2624, file: !76, line: 2489, column: 2)
!2633 = !DILocation(line: 2490, column: 16, scope: !2631)
!2634 = !DILocation(line: 2490, column: 6, scope: !2632)
!2635 = !DILocation(line: 2492, column: 7, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2637, file: !76, line: 2492, column: 7)
!2637 = distinct !DILexicalBlock(scope: !2631, file: !76, line: 2491, column: 3)
!2638 = !DILocation(line: 2492, column: 15, scope: !2636)
!2639 = !DILocation(line: 2492, column: 7, scope: !2637)
!2640 = !DILocation(line: 2493, column: 12, scope: !2636)
!2641 = !DILocation(line: 2493, column: 5, scope: !2636)
!2642 = !DILocation(line: 2495, column: 5, scope: !2636)
!2643 = !DILocation(line: 2499, column: 12, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2631, file: !76, line: 2498, column: 3)
!2645 = !DILocation(line: 2499, column: 11, scope: !2644)
!2646 = !DILocation(line: 2499, column: 4, scope: !2644)
!2647 = !DILocation(line: 2504, column: 6, scope: !2648)
!2648 = distinct !DILexicalBlock(scope: !2649, file: !76, line: 2504, column: 6)
!2649 = distinct !DILexicalBlock(scope: !2624, file: !76, line: 2503, column: 2)
!2650 = !DILocation(line: 2504, column: 16, scope: !2648)
!2651 = !DILocation(line: 2504, column: 6, scope: !2649)
!2652 = !DILocation(line: 2506, column: 4, scope: !2653)
!2653 = distinct !DILexicalBlock(scope: !2648, file: !76, line: 2505, column: 3)
!2654 = !DILocation(line: 2510, column: 4, scope: !2655)
!2655 = distinct !DILexicalBlock(scope: !2648, file: !76, line: 2509, column: 3)
!2656 = !DILocation(line: 2513, column: 1, scope: !2522)
!2657 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !2658, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2658 = !DISubroutineType(types: !2659)
!2659 = !{!37, !26}
!2660 = !DILocalVariable(name: "value", arg: 1, scope: !2657, file: !30, line: 42, type: !26)
!2661 = !DILocation(line: 42, column: 38, scope: !2657)
!2662 = !DILocation(line: 44, column: 12, scope: !2657)
!2663 = !DILocation(line: 44, column: 18, scope: !2657)
!2664 = !DILocation(line: 44, column: 5, scope: !2657)
!2665 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac1", scope: !76, file: !76, line: 2532, type: !2666, scopeLine: 2533, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2666 = !DISubroutineType(types: !2667)
!2667 = !{!84, !84, !6}
!2668 = !DILocalVariable(name: "value", arg: 1, scope: !2665, file: !76, line: 2532, type: !84)
!2669 = !DILocation(line: 2532, column: 29, scope: !2665)
!2670 = !DILocalVariable(name: "factor", arg: 2, scope: !2665, file: !76, line: 2532, type: !6)
!2671 = !DILocation(line: 2532, column: 39, scope: !2665)
!2672 = !DILocalVariable(name: "u32Temp1", scope: !2665, file: !76, line: 2534, type: !740)
!2673 = !DILocation(line: 2534, column: 6, scope: !2665)
!2674 = !DILocalVariable(name: "u32Temp2", scope: !2665, file: !76, line: 2534, type: !740)
!2675 = !DILocation(line: 2534, column: 17, scope: !2665)
!2676 = !DILocalVariable(name: "u32Temp3", scope: !2665, file: !76, line: 2534, type: !740)
!2677 = !DILocation(line: 2534, column: 26, scope: !2665)
!2678 = !DILocalVariable(name: "u32Temp4", scope: !2665, file: !76, line: 2534, type: !740)
!2679 = !DILocation(line: 2534, column: 35, scope: !2665)
!2680 = !DILocalVariable(name: "u8SignBit", scope: !2665, file: !76, line: 2535, type: !17)
!2681 = !DILocation(line: 2535, column: 5, scope: !2665)
!2682 = !DILocation(line: 2537, column: 7, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2665, file: !76, line: 2537, column: 5)
!2684 = !DILocation(line: 2537, column: 12, scope: !2683)
!2685 = !DILocation(line: 2537, column: 16, scope: !2683)
!2686 = !DILocation(line: 2537, column: 20, scope: !2683)
!2687 = !DILocation(line: 2537, column: 26, scope: !2683)
!2688 = !DILocation(line: 2537, column: 31, scope: !2683)
!2689 = !DILocation(line: 2537, column: 36, scope: !2683)
!2690 = !DILocation(line: 2537, column: 41, scope: !2683)
!2691 = !DILocation(line: 2537, column: 45, scope: !2683)
!2692 = !DILocation(line: 2537, column: 49, scope: !2683)
!2693 = !DILocation(line: 2537, column: 55, scope: !2683)
!2694 = !DILocation(line: 2537, column: 5, scope: !2665)
!2695 = !DILocation(line: 2539, column: 13, scope: !2696)
!2696 = distinct !DILexicalBlock(scope: !2683, file: !76, line: 2538, column: 2)
!2697 = !DILocation(line: 2540, column: 2, scope: !2696)
!2698 = !DILocation(line: 2543, column: 13, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2683, file: !76, line: 2542, column: 2)
!2700 = !DILocation(line: 2546, column: 5, scope: !2701)
!2701 = distinct !DILexicalBlock(scope: !2665, file: !76, line: 2546, column: 5)
!2702 = !DILocation(line: 2546, column: 10, scope: !2701)
!2703 = !DILocation(line: 2546, column: 5, scope: !2665)
!2704 = !DILocation(line: 2548, column: 15, scope: !2705)
!2705 = distinct !DILexicalBlock(scope: !2701, file: !76, line: 2547, column: 2)
!2706 = !DILocation(line: 2548, column: 14, scope: !2705)
!2707 = !DILocation(line: 2548, column: 12, scope: !2705)
!2708 = !DILocation(line: 2549, column: 2, scope: !2705)
!2709 = !DILocation(line: 2552, column: 14, scope: !2710)
!2710 = distinct !DILexicalBlock(scope: !2701, file: !76, line: 2551, column: 2)
!2711 = !DILocation(line: 2552, column: 12, scope: !2710)
!2712 = !DILocation(line: 2555, column: 5, scope: !2713)
!2713 = distinct !DILexicalBlock(scope: !2665, file: !76, line: 2555, column: 5)
!2714 = !DILocation(line: 2555, column: 11, scope: !2713)
!2715 = !DILocation(line: 2555, column: 5, scope: !2665)
!2716 = !DILocation(line: 2557, column: 15, scope: !2717)
!2717 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2556, column: 2)
!2718 = !DILocation(line: 2557, column: 14, scope: !2717)
!2719 = !DILocation(line: 2557, column: 12, scope: !2717)
!2720 = !DILocation(line: 2558, column: 2, scope: !2717)
!2721 = !DILocation(line: 2561, column: 14, scope: !2722)
!2722 = distinct !DILexicalBlock(scope: !2713, file: !76, line: 2560, column: 2)
!2723 = !DILocation(line: 2561, column: 12, scope: !2722)
!2724 = !DILocation(line: 2564, column: 13, scope: !2665)
!2725 = !DILocation(line: 2564, column: 24, scope: !2665)
!2726 = !DILocation(line: 2564, column: 22, scope: !2665)
!2727 = !DILocation(line: 2564, column: 11, scope: !2665)
!2728 = !DILocation(line: 2565, column: 25, scope: !2665)
!2729 = !DILocation(line: 2565, column: 35, scope: !2665)
!2730 = !DILocation(line: 2565, column: 13, scope: !2665)
!2731 = !DILocation(line: 2565, column: 11, scope: !2665)
!2732 = !DILocation(line: 2566, column: 13, scope: !2665)
!2733 = !DILocation(line: 2566, column: 22, scope: !2665)
!2734 = !DILocation(line: 2566, column: 11, scope: !2665)
!2735 = !DILocation(line: 2567, column: 14, scope: !2665)
!2736 = !DILocation(line: 2567, column: 23, scope: !2665)
!2737 = !DILocation(line: 2567, column: 11, scope: !2665)
!2738 = !DILocation(line: 2568, column: 5, scope: !2739)
!2739 = distinct !DILexicalBlock(scope: !2665, file: !76, line: 2568, column: 5)
!2740 = !DILocation(line: 2568, column: 15, scope: !2739)
!2741 = !DILocation(line: 2568, column: 5, scope: !2665)
!2742 = !DILocation(line: 2570, column: 6, scope: !2743)
!2743 = distinct !DILexicalBlock(scope: !2744, file: !76, line: 2570, column: 6)
!2744 = distinct !DILexicalBlock(scope: !2739, file: !76, line: 2569, column: 2)
!2745 = !DILocation(line: 2570, column: 14, scope: !2743)
!2746 = !DILocation(line: 2570, column: 6, scope: !2744)
!2747 = !DILocation(line: 2571, column: 11, scope: !2743)
!2748 = !DILocation(line: 2571, column: 4, scope: !2743)
!2749 = !DILocation(line: 2573, column: 4, scope: !2743)
!2750 = !DILocation(line: 2577, column: 11, scope: !2751)
!2751 = distinct !DILexicalBlock(scope: !2739, file: !76, line: 2576, column: 2)
!2752 = !DILocation(line: 2577, column: 10, scope: !2751)
!2753 = !DILocation(line: 2577, column: 3, scope: !2751)
!2754 = !DILocation(line: 2579, column: 1, scope: !2665)
!2755 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac2", scope: !76, file: !76, line: 2598, type: !2666, scopeLine: 2599, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2756 = !DILocalVariable(name: "value", arg: 1, scope: !2755, file: !76, line: 2598, type: !84)
!2757 = !DILocation(line: 2598, column: 29, scope: !2755)
!2758 = !DILocalVariable(name: "factor", arg: 2, scope: !2755, file: !76, line: 2598, type: !6)
!2759 = !DILocation(line: 2598, column: 39, scope: !2755)
!2760 = !DILocalVariable(name: "u32Temp1", scope: !2755, file: !76, line: 2600, type: !740)
!2761 = !DILocation(line: 2600, column: 6, scope: !2755)
!2762 = !DILocalVariable(name: "u32Temp2", scope: !2755, file: !76, line: 2600, type: !740)
!2763 = !DILocation(line: 2600, column: 17, scope: !2755)
!2764 = !DILocalVariable(name: "u32Temp3", scope: !2755, file: !76, line: 2600, type: !740)
!2765 = !DILocation(line: 2600, column: 26, scope: !2755)
!2766 = !DILocalVariable(name: "u32Temp4", scope: !2755, file: !76, line: 2600, type: !740)
!2767 = !DILocation(line: 2600, column: 35, scope: !2755)
!2768 = !DILocalVariable(name: "u8SignBit", scope: !2755, file: !76, line: 2601, type: !17)
!2769 = !DILocation(line: 2601, column: 5, scope: !2755)
!2770 = !DILocation(line: 2603, column: 7, scope: !2771)
!2771 = distinct !DILexicalBlock(scope: !2755, file: !76, line: 2603, column: 5)
!2772 = !DILocation(line: 2603, column: 12, scope: !2771)
!2773 = !DILocation(line: 2603, column: 16, scope: !2771)
!2774 = !DILocation(line: 2603, column: 20, scope: !2771)
!2775 = !DILocation(line: 2603, column: 26, scope: !2771)
!2776 = !DILocation(line: 2603, column: 31, scope: !2771)
!2777 = !DILocation(line: 2603, column: 36, scope: !2771)
!2778 = !DILocation(line: 2603, column: 41, scope: !2771)
!2779 = !DILocation(line: 2603, column: 45, scope: !2771)
!2780 = !DILocation(line: 2603, column: 49, scope: !2771)
!2781 = !DILocation(line: 2603, column: 55, scope: !2771)
!2782 = !DILocation(line: 2603, column: 5, scope: !2755)
!2783 = !DILocation(line: 2605, column: 13, scope: !2784)
!2784 = distinct !DILexicalBlock(scope: !2771, file: !76, line: 2604, column: 2)
!2785 = !DILocation(line: 2606, column: 2, scope: !2784)
!2786 = !DILocation(line: 2609, column: 13, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2771, file: !76, line: 2608, column: 2)
!2788 = !DILocation(line: 2612, column: 5, scope: !2789)
!2789 = distinct !DILexicalBlock(scope: !2755, file: !76, line: 2612, column: 5)
!2790 = !DILocation(line: 2612, column: 10, scope: !2789)
!2791 = !DILocation(line: 2612, column: 5, scope: !2755)
!2792 = !DILocation(line: 2614, column: 15, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2789, file: !76, line: 2613, column: 2)
!2794 = !DILocation(line: 2614, column: 14, scope: !2793)
!2795 = !DILocation(line: 2614, column: 12, scope: !2793)
!2796 = !DILocation(line: 2615, column: 2, scope: !2793)
!2797 = !DILocation(line: 2618, column: 14, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2789, file: !76, line: 2617, column: 2)
!2799 = !DILocation(line: 2618, column: 12, scope: !2798)
!2800 = !DILocation(line: 2621, column: 5, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2755, file: !76, line: 2621, column: 5)
!2802 = !DILocation(line: 2621, column: 11, scope: !2801)
!2803 = !DILocation(line: 2621, column: 5, scope: !2755)
!2804 = !DILocation(line: 2623, column: 15, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2801, file: !76, line: 2622, column: 2)
!2806 = !DILocation(line: 2623, column: 14, scope: !2805)
!2807 = !DILocation(line: 2623, column: 12, scope: !2805)
!2808 = !DILocation(line: 2624, column: 2, scope: !2805)
!2809 = !DILocation(line: 2627, column: 14, scope: !2810)
!2810 = distinct !DILexicalBlock(scope: !2801, file: !76, line: 2626, column: 2)
!2811 = !DILocation(line: 2627, column: 12, scope: !2810)
!2812 = !DILocation(line: 2630, column: 13, scope: !2755)
!2813 = !DILocation(line: 2630, column: 24, scope: !2755)
!2814 = !DILocation(line: 2630, column: 22, scope: !2755)
!2815 = !DILocation(line: 2630, column: 11, scope: !2755)
!2816 = !DILocation(line: 2631, column: 25, scope: !2755)
!2817 = !DILocation(line: 2631, column: 35, scope: !2755)
!2818 = !DILocation(line: 2631, column: 13, scope: !2755)
!2819 = !DILocation(line: 2631, column: 11, scope: !2755)
!2820 = !DILocation(line: 2632, column: 13, scope: !2755)
!2821 = !DILocation(line: 2632, column: 22, scope: !2755)
!2822 = !DILocation(line: 2632, column: 11, scope: !2755)
!2823 = !DILocation(line: 2633, column: 14, scope: !2755)
!2824 = !DILocation(line: 2633, column: 23, scope: !2755)
!2825 = !DILocation(line: 2633, column: 11, scope: !2755)
!2826 = !DILocation(line: 2634, column: 6, scope: !2827)
!2827 = distinct !DILexicalBlock(scope: !2755, file: !76, line: 2634, column: 5)
!2828 = !DILocation(line: 2634, column: 14, scope: !2827)
!2829 = !DILocation(line: 2634, column: 18, scope: !2827)
!2830 = !DILocation(line: 2634, column: 5, scope: !2755)
!2831 = !DILocation(line: 2636, column: 6, scope: !2832)
!2832 = distinct !DILexicalBlock(scope: !2833, file: !76, line: 2636, column: 6)
!2833 = distinct !DILexicalBlock(scope: !2827, file: !76, line: 2635, column: 2)
!2834 = !DILocation(line: 2636, column: 16, scope: !2832)
!2835 = !DILocation(line: 2636, column: 6, scope: !2833)
!2836 = !DILocation(line: 2638, column: 7, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2838, file: !76, line: 2638, column: 7)
!2838 = distinct !DILexicalBlock(scope: !2832, file: !76, line: 2637, column: 3)
!2839 = !DILocation(line: 2638, column: 15, scope: !2837)
!2840 = !DILocation(line: 2638, column: 7, scope: !2838)
!2841 = !DILocation(line: 2639, column: 12, scope: !2837)
!2842 = !DILocation(line: 2639, column: 5, scope: !2837)
!2843 = !DILocation(line: 2641, column: 5, scope: !2837)
!2844 = !DILocation(line: 2645, column: 7, scope: !2845)
!2845 = distinct !DILexicalBlock(scope: !2846, file: !76, line: 2645, column: 7)
!2846 = distinct !DILexicalBlock(scope: !2832, file: !76, line: 2644, column: 3)
!2847 = !DILocation(line: 2645, column: 15, scope: !2845)
!2848 = !DILocation(line: 2645, column: 7, scope: !2846)
!2849 = !DILocation(line: 2646, column: 13, scope: !2845)
!2850 = !DILocation(line: 2646, column: 12, scope: !2845)
!2851 = !DILocation(line: 2646, column: 5, scope: !2845)
!2852 = !DILocation(line: 2648, column: 5, scope: !2845)
!2853 = !DILocation(line: 2653, column: 3, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2827, file: !76, line: 2652, column: 2)
!2855 = !DILocation(line: 2655, column: 1, scope: !2755)
!2856 = distinct !DISubprogram(name: "s32_mul_s32_s32", scope: !76, file: !76, line: 2670, type: !2169, scopeLine: 2671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2857 = !DILocalVariable(name: "val1", arg: 1, scope: !2856, file: !76, line: 2670, type: !84)
!2858 = !DILocation(line: 2670, column: 25, scope: !2856)
!2859 = !DILocalVariable(name: "val2", arg: 2, scope: !2856, file: !76, line: 2670, type: !84)
!2860 = !DILocation(line: 2670, column: 35, scope: !2856)
!2861 = !DILocalVariable(name: "u32Temp1", scope: !2856, file: !76, line: 2672, type: !740)
!2862 = !DILocation(line: 2672, column: 6, scope: !2856)
!2863 = !DILocalVariable(name: "u32Temp2", scope: !2856, file: !76, line: 2672, type: !740)
!2864 = !DILocation(line: 2672, column: 17, scope: !2856)
!2865 = !DILocalVariable(name: "u32Temp3", scope: !2856, file: !76, line: 2672, type: !740)
!2866 = !DILocation(line: 2672, column: 26, scope: !2856)
!2867 = !DILocalVariable(name: "u32Temp4", scope: !2856, file: !76, line: 2672, type: !740)
!2868 = !DILocation(line: 2672, column: 35, scope: !2856)
!2869 = !DILocalVariable(name: "u8SignBit", scope: !2856, file: !76, line: 2673, type: !17)
!2870 = !DILocation(line: 2673, column: 5, scope: !2856)
!2871 = !DILocation(line: 2675, column: 7, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2856, file: !76, line: 2675, column: 5)
!2873 = !DILocation(line: 2675, column: 11, scope: !2872)
!2874 = !DILocation(line: 2675, column: 15, scope: !2872)
!2875 = !DILocation(line: 2675, column: 33, scope: !2872)
!2876 = !DILocation(line: 2675, column: 37, scope: !2872)
!2877 = !DILocation(line: 2675, column: 41, scope: !2872)
!2878 = !DILocation(line: 2677, column: 13, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2872, file: !76, line: 2676, column: 2)
!2880 = !DILocation(line: 2678, column: 2, scope: !2879)
!2881 = !DILocation(line: 2681, column: 13, scope: !2882)
!2882 = distinct !DILexicalBlock(scope: !2872, file: !76, line: 2680, column: 2)
!2883 = !DILocation(line: 2684, column: 5, scope: !2884)
!2884 = distinct !DILexicalBlock(scope: !2856, file: !76, line: 2684, column: 5)
!2885 = !DILocation(line: 2684, column: 9, scope: !2884)
!2886 = !DILocation(line: 2684, column: 5, scope: !2856)
!2887 = !DILocation(line: 2686, column: 15, scope: !2888)
!2888 = distinct !DILexicalBlock(scope: !2884, file: !76, line: 2685, column: 2)
!2889 = !DILocation(line: 2686, column: 14, scope: !2888)
!2890 = !DILocation(line: 2686, column: 12, scope: !2888)
!2891 = !DILocation(line: 2687, column: 2, scope: !2888)
!2892 = !DILocation(line: 2690, column: 14, scope: !2893)
!2893 = distinct !DILexicalBlock(scope: !2884, file: !76, line: 2689, column: 2)
!2894 = !DILocation(line: 2690, column: 12, scope: !2893)
!2895 = !DILocation(line: 2693, column: 5, scope: !2896)
!2896 = distinct !DILexicalBlock(scope: !2856, file: !76, line: 2693, column: 5)
!2897 = !DILocation(line: 2693, column: 9, scope: !2896)
!2898 = !DILocation(line: 2693, column: 5, scope: !2856)
!2899 = !DILocation(line: 2695, column: 15, scope: !2900)
!2900 = distinct !DILexicalBlock(scope: !2896, file: !76, line: 2694, column: 2)
!2901 = !DILocation(line: 2695, column: 14, scope: !2900)
!2902 = !DILocation(line: 2695, column: 12, scope: !2900)
!2903 = !DILocation(line: 2696, column: 2, scope: !2900)
!2904 = !DILocation(line: 2699, column: 14, scope: !2905)
!2905 = distinct !DILexicalBlock(scope: !2896, file: !76, line: 2698, column: 2)
!2906 = !DILocation(line: 2699, column: 12, scope: !2905)
!2907 = !DILocation(line: 2702, column: 13, scope: !2856)
!2908 = !DILocation(line: 2702, column: 24, scope: !2856)
!2909 = !DILocation(line: 2702, column: 22, scope: !2856)
!2910 = !DILocation(line: 2702, column: 11, scope: !2856)
!2911 = !DILocation(line: 2703, column: 25, scope: !2856)
!2912 = !DILocation(line: 2703, column: 35, scope: !2856)
!2913 = !DILocation(line: 2703, column: 13, scope: !2856)
!2914 = !DILocation(line: 2703, column: 11, scope: !2856)
!2915 = !DILocation(line: 2704, column: 5, scope: !2916)
!2916 = distinct !DILexicalBlock(scope: !2856, file: !76, line: 2704, column: 5)
!2917 = !DILocation(line: 2704, column: 13, scope: !2916)
!2918 = !DILocation(line: 2704, column: 5, scope: !2856)
!2919 = !DILocation(line: 2706, column: 6, scope: !2920)
!2920 = distinct !DILexicalBlock(scope: !2921, file: !76, line: 2706, column: 6)
!2921 = distinct !DILexicalBlock(scope: !2916, file: !76, line: 2705, column: 2)
!2922 = !DILocation(line: 2706, column: 16, scope: !2920)
!2923 = !DILocation(line: 2706, column: 6, scope: !2921)
!2924 = !DILocation(line: 2708, column: 7, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2926, file: !76, line: 2708, column: 7)
!2926 = distinct !DILexicalBlock(scope: !2920, file: !76, line: 2707, column: 3)
!2927 = !DILocation(line: 2708, column: 15, scope: !2925)
!2928 = !DILocation(line: 2708, column: 7, scope: !2926)
!2929 = !DILocation(line: 2709, column: 12, scope: !2925)
!2930 = !DILocation(line: 2709, column: 5, scope: !2925)
!2931 = !DILocation(line: 2711, column: 5, scope: !2925)
!2932 = !DILocation(line: 2715, column: 7, scope: !2933)
!2933 = distinct !DILexicalBlock(scope: !2934, file: !76, line: 2715, column: 7)
!2934 = distinct !DILexicalBlock(scope: !2920, file: !76, line: 2714, column: 3)
!2935 = !DILocation(line: 2715, column: 15, scope: !2933)
!2936 = !DILocation(line: 2715, column: 7, scope: !2934)
!2937 = !DILocation(line: 2716, column: 13, scope: !2933)
!2938 = !DILocation(line: 2716, column: 12, scope: !2933)
!2939 = !DILocation(line: 2716, column: 5, scope: !2933)
!2940 = !DILocation(line: 2718, column: 5, scope: !2933)
!2941 = !DILocation(line: 2723, column: 6, scope: !2942)
!2942 = distinct !DILexicalBlock(scope: !2943, file: !76, line: 2723, column: 6)
!2943 = distinct !DILexicalBlock(scope: !2916, file: !76, line: 2722, column: 2)
!2944 = !DILocation(line: 2723, column: 16, scope: !2942)
!2945 = !DILocation(line: 2723, column: 6, scope: !2943)
!2946 = !DILocation(line: 2725, column: 4, scope: !2947)
!2947 = distinct !DILexicalBlock(scope: !2942, file: !76, line: 2724, column: 3)
!2948 = !DILocation(line: 2729, column: 4, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2942, file: !76, line: 2728, column: 3)
!2950 = !DILocation(line: 2733, column: 1, scope: !2856)
!2951 = distinct !DISubprogram(name: "s32_mul_s32_u32_fac05", scope: !76, file: !76, line: 2751, type: !2065, scopeLine: 2752, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2952 = !DILocalVariable(name: "value", arg: 1, scope: !2951, file: !76, line: 2751, type: !84)
!2953 = !DILocation(line: 2751, column: 31, scope: !2951)
!2954 = !DILocalVariable(name: "factor", arg: 2, scope: !2951, file: !76, line: 2751, type: !740)
!2955 = !DILocation(line: 2751, column: 42, scope: !2951)
!2956 = !DILocalVariable(name: "u32Temp1", scope: !2951, file: !76, line: 2753, type: !740)
!2957 = !DILocation(line: 2753, column: 6, scope: !2951)
!2958 = !DILocalVariable(name: "u32Temp2", scope: !2951, file: !76, line: 2753, type: !740)
!2959 = !DILocation(line: 2753, column: 17, scope: !2951)
!2960 = !DILocalVariable(name: "u8SignBit", scope: !2951, file: !76, line: 2754, type: !17)
!2961 = !DILocation(line: 2754, column: 5, scope: !2951)
!2962 = !DILocation(line: 2756, column: 5, scope: !2963)
!2963 = distinct !DILexicalBlock(scope: !2951, file: !76, line: 2756, column: 5)
!2964 = !DILocation(line: 2756, column: 10, scope: !2963)
!2965 = !DILocation(line: 2756, column: 5, scope: !2951)
!2966 = !DILocation(line: 2758, column: 15, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2963, file: !76, line: 2757, column: 2)
!2968 = !DILocation(line: 2758, column: 14, scope: !2967)
!2969 = !DILocation(line: 2758, column: 12, scope: !2967)
!2970 = !DILocation(line: 2759, column: 13, scope: !2967)
!2971 = !DILocation(line: 2760, column: 2, scope: !2967)
!2972 = !DILocation(line: 2763, column: 14, scope: !2973)
!2973 = distinct !DILexicalBlock(scope: !2963, file: !76, line: 2762, column: 2)
!2974 = !DILocation(line: 2763, column: 12, scope: !2973)
!2975 = !DILocation(line: 2764, column: 13, scope: !2973)
!2976 = !DILocation(line: 2767, column: 25, scope: !2951)
!2977 = !DILocation(line: 2767, column: 35, scope: !2951)
!2978 = !DILocation(line: 2767, column: 13, scope: !2951)
!2979 = !DILocation(line: 2767, column: 11, scope: !2951)
!2980 = !DILocation(line: 2768, column: 13, scope: !2951)
!2981 = !DILocation(line: 2768, column: 22, scope: !2951)
!2982 = !DILocation(line: 2768, column: 11, scope: !2951)
!2983 = !DILocation(line: 2769, column: 5, scope: !2984)
!2984 = distinct !DILexicalBlock(scope: !2951, file: !76, line: 2769, column: 5)
!2985 = !DILocation(line: 2769, column: 15, scope: !2984)
!2986 = !DILocation(line: 2769, column: 5, scope: !2951)
!2987 = !DILocation(line: 2771, column: 10, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2984, file: !76, line: 2770, column: 2)
!2989 = !DILocation(line: 2771, column: 3, scope: !2988)
!2990 = !DILocation(line: 2775, column: 11, scope: !2991)
!2991 = distinct !DILexicalBlock(scope: !2984, file: !76, line: 2774, column: 2)
!2992 = !DILocation(line: 2775, column: 10, scope: !2991)
!2993 = !DILocation(line: 2775, column: 3, scope: !2991)
!2994 = !DILocation(line: 2777, column: 1, scope: !2951)
!2995 = distinct !DISubprogram(name: "s32_mul_s32_s32_fac05", scope: !76, file: !76, line: 2793, type: !2169, scopeLine: 2794, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!2996 = !DILocalVariable(name: "value", arg: 1, scope: !2995, file: !76, line: 2793, type: !84)
!2997 = !DILocation(line: 2793, column: 31, scope: !2995)
!2998 = !DILocalVariable(name: "factor", arg: 2, scope: !2995, file: !76, line: 2793, type: !84)
!2999 = !DILocation(line: 2793, column: 42, scope: !2995)
!3000 = !DILocalVariable(name: "u32Temp1", scope: !2995, file: !76, line: 2795, type: !740)
!3001 = !DILocation(line: 2795, column: 6, scope: !2995)
!3002 = !DILocalVariable(name: "u32Temp2", scope: !2995, file: !76, line: 2795, type: !740)
!3003 = !DILocation(line: 2795, column: 17, scope: !2995)
!3004 = !DILocalVariable(name: "u32Temp3", scope: !2995, file: !76, line: 2795, type: !740)
!3005 = !DILocation(line: 2795, column: 26, scope: !2995)
!3006 = !DILocalVariable(name: "u8SignBit", scope: !2995, file: !76, line: 2796, type: !17)
!3007 = !DILocation(line: 2796, column: 5, scope: !2995)
!3008 = !DILocation(line: 2798, column: 7, scope: !3009)
!3009 = distinct !DILexicalBlock(scope: !2995, file: !76, line: 2798, column: 5)
!3010 = !DILocation(line: 2798, column: 12, scope: !3009)
!3011 = !DILocation(line: 2798, column: 16, scope: !3009)
!3012 = !DILocation(line: 2798, column: 36, scope: !3009)
!3013 = !DILocation(line: 2798, column: 41, scope: !3009)
!3014 = !DILocation(line: 2798, column: 45, scope: !3009)
!3015 = !DILocation(line: 2800, column: 13, scope: !3016)
!3016 = distinct !DILexicalBlock(scope: !3009, file: !76, line: 2799, column: 2)
!3017 = !DILocation(line: 2801, column: 2, scope: !3016)
!3018 = !DILocation(line: 2804, column: 13, scope: !3019)
!3019 = distinct !DILexicalBlock(scope: !3009, file: !76, line: 2803, column: 2)
!3020 = !DILocation(line: 2807, column: 5, scope: !3021)
!3021 = distinct !DILexicalBlock(scope: !2995, file: !76, line: 2807, column: 5)
!3022 = !DILocation(line: 2807, column: 10, scope: !3021)
!3023 = !DILocation(line: 2807, column: 5, scope: !2995)
!3024 = !DILocation(line: 2809, column: 15, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !3021, file: !76, line: 2808, column: 2)
!3026 = !DILocation(line: 2809, column: 14, scope: !3025)
!3027 = !DILocation(line: 2809, column: 12, scope: !3025)
!3028 = !DILocation(line: 2810, column: 2, scope: !3025)
!3029 = !DILocation(line: 2813, column: 14, scope: !3030)
!3030 = distinct !DILexicalBlock(scope: !3021, file: !76, line: 2812, column: 2)
!3031 = !DILocation(line: 2813, column: 12, scope: !3030)
!3032 = !DILocation(line: 2816, column: 5, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !2995, file: !76, line: 2816, column: 5)
!3034 = !DILocation(line: 2816, column: 11, scope: !3033)
!3035 = !DILocation(line: 2816, column: 5, scope: !2995)
!3036 = !DILocation(line: 2818, column: 15, scope: !3037)
!3037 = distinct !DILexicalBlock(scope: !3033, file: !76, line: 2817, column: 2)
!3038 = !DILocation(line: 2818, column: 14, scope: !3037)
!3039 = !DILocation(line: 2818, column: 12, scope: !3037)
!3040 = !DILocation(line: 2819, column: 2, scope: !3037)
!3041 = !DILocation(line: 2822, column: 14, scope: !3042)
!3042 = distinct !DILexicalBlock(scope: !3033, file: !76, line: 2821, column: 2)
!3043 = !DILocation(line: 2822, column: 12, scope: !3042)
!3044 = !DILocation(line: 2825, column: 25, scope: !2995)
!3045 = !DILocation(line: 2825, column: 35, scope: !2995)
!3046 = !DILocation(line: 2825, column: 13, scope: !2995)
!3047 = !DILocation(line: 2825, column: 11, scope: !2995)
!3048 = !DILocation(line: 2826, column: 5, scope: !3049)
!3049 = distinct !DILexicalBlock(scope: !2995, file: !76, line: 2826, column: 5)
!3050 = !DILocation(line: 2826, column: 15, scope: !3049)
!3051 = !DILocation(line: 2826, column: 5, scope: !2995)
!3052 = !DILocation(line: 2828, column: 10, scope: !3053)
!3053 = distinct !DILexicalBlock(scope: !3049, file: !76, line: 2827, column: 2)
!3054 = !DILocation(line: 2828, column: 3, scope: !3053)
!3055 = !DILocation(line: 2832, column: 11, scope: !3056)
!3056 = distinct !DILexicalBlock(scope: !3049, file: !76, line: 2831, column: 2)
!3057 = !DILocation(line: 2832, column: 10, scope: !3056)
!3058 = !DILocation(line: 2832, column: 3, scope: !3056)
!3059 = !DILocation(line: 2834, column: 1, scope: !2995)
!3060 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac1", scope: !76, file: !76, line: 2851, type: !3061, scopeLine: 2852, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3061 = !DISubroutineType(types: !3062)
!3062 = !{!740, !740, !17}
!3063 = !DILocalVariable(name: "value", arg: 1, scope: !3060, file: !76, line: 2851, type: !740)
!3064 = !DILocation(line: 2851, column: 29, scope: !3060)
!3065 = !DILocalVariable(name: "factor", arg: 2, scope: !3060, file: !76, line: 2851, type: !17)
!3066 = !DILocation(line: 2851, column: 39, scope: !3060)
!3067 = !DILocalVariable(name: "u32Temp1", scope: !3060, file: !76, line: 2853, type: !740)
!3068 = !DILocation(line: 2853, column: 6, scope: !3060)
!3069 = !DILocalVariable(name: "u32Temp2", scope: !3060, file: !76, line: 2853, type: !740)
!3070 = !DILocation(line: 2853, column: 20, scope: !3060)
!3071 = !DILocation(line: 2854, column: 13, scope: !3060)
!3072 = !DILocation(line: 2854, column: 21, scope: !3060)
!3073 = !DILocation(line: 2854, column: 19, scope: !3060)
!3074 = !DILocation(line: 2854, column: 11, scope: !3060)
!3075 = !DILocation(line: 2855, column: 25, scope: !3060)
!3076 = !DILocation(line: 2855, column: 32, scope: !3060)
!3077 = !DILocation(line: 2855, column: 13, scope: !3060)
!3078 = !DILocation(line: 2855, column: 11, scope: !3060)
!3079 = !DILocation(line: 2856, column: 14, scope: !3060)
!3080 = !DILocation(line: 2856, column: 23, scope: !3060)
!3081 = !DILocation(line: 2856, column: 11, scope: !3060)
!3082 = !DILocation(line: 2857, column: 14, scope: !3060)
!3083 = !DILocation(line: 2857, column: 23, scope: !3060)
!3084 = !DILocation(line: 2857, column: 11, scope: !3060)
!3085 = !DILocation(line: 2858, column: 9, scope: !3060)
!3086 = !DILocation(line: 2858, column: 2, scope: !3060)
!3087 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac2", scope: !76, file: !76, line: 2877, type: !3061, scopeLine: 2878, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3088 = !DILocalVariable(name: "value", arg: 1, scope: !3087, file: !76, line: 2877, type: !740)
!3089 = !DILocation(line: 2877, column: 29, scope: !3087)
!3090 = !DILocalVariable(name: "factor", arg: 2, scope: !3087, file: !76, line: 2877, type: !17)
!3091 = !DILocation(line: 2877, column: 39, scope: !3087)
!3092 = !DILocalVariable(name: "u32Temp1", scope: !3087, file: !76, line: 2879, type: !740)
!3093 = !DILocation(line: 2879, column: 6, scope: !3087)
!3094 = !DILocalVariable(name: "u32Temp2", scope: !3087, file: !76, line: 2879, type: !740)
!3095 = !DILocation(line: 2879, column: 20, scope: !3087)
!3096 = !DILocation(line: 2880, column: 13, scope: !3087)
!3097 = !DILocation(line: 2880, column: 21, scope: !3087)
!3098 = !DILocation(line: 2880, column: 19, scope: !3087)
!3099 = !DILocation(line: 2880, column: 11, scope: !3087)
!3100 = !DILocation(line: 2881, column: 25, scope: !3087)
!3101 = !DILocation(line: 2881, column: 32, scope: !3087)
!3102 = !DILocation(line: 2881, column: 13, scope: !3087)
!3103 = !DILocation(line: 2881, column: 11, scope: !3087)
!3104 = !DILocation(line: 2882, column: 14, scope: !3087)
!3105 = !DILocation(line: 2882, column: 23, scope: !3087)
!3106 = !DILocation(line: 2882, column: 11, scope: !3087)
!3107 = !DILocation(line: 2883, column: 14, scope: !3087)
!3108 = !DILocation(line: 2883, column: 23, scope: !3087)
!3109 = !DILocation(line: 2883, column: 11, scope: !3087)
!3110 = !DILocation(line: 2884, column: 6, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3087, file: !76, line: 2884, column: 5)
!3112 = !DILocation(line: 2884, column: 14, scope: !3111)
!3113 = !DILocation(line: 2884, column: 19, scope: !3111)
!3114 = !DILocation(line: 2884, column: 5, scope: !3087)
!3115 = !DILocation(line: 2886, column: 10, scope: !3116)
!3116 = distinct !DILexicalBlock(scope: !3111, file: !76, line: 2885, column: 2)
!3117 = !DILocation(line: 2886, column: 3, scope: !3116)
!3118 = !DILocation(line: 2890, column: 3, scope: !3119)
!3119 = distinct !DILexicalBlock(scope: !3111, file: !76, line: 2889, column: 2)
!3120 = !DILocation(line: 2893, column: 1, scope: !3087)
!3121 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac1", scope: !76, file: !76, line: 2912, type: !3122, scopeLine: 2913, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3122 = !DISubroutineType(types: !3123)
!3123 = !{!740, !740, !6}
!3124 = !DILocalVariable(name: "value", arg: 1, scope: !3121, file: !76, line: 2912, type: !740)
!3125 = !DILocation(line: 2912, column: 29, scope: !3121)
!3126 = !DILocalVariable(name: "factor", arg: 2, scope: !3121, file: !76, line: 2912, type: !6)
!3127 = !DILocation(line: 2912, column: 39, scope: !3121)
!3128 = !DILocalVariable(name: "u32Temp1", scope: !3121, file: !76, line: 2914, type: !740)
!3129 = !DILocation(line: 2914, column: 6, scope: !3121)
!3130 = !DILocalVariable(name: "u32Temp2", scope: !3121, file: !76, line: 2914, type: !740)
!3131 = !DILocation(line: 2914, column: 20, scope: !3121)
!3132 = !DILocation(line: 2915, column: 5, scope: !3133)
!3133 = distinct !DILexicalBlock(scope: !3121, file: !76, line: 2915, column: 5)
!3134 = !DILocation(line: 2915, column: 12, scope: !3133)
!3135 = !DILocation(line: 2915, column: 5, scope: !3121)
!3136 = !DILocation(line: 2918, column: 14, scope: !3137)
!3137 = distinct !DILexicalBlock(scope: !3133, file: !76, line: 2916, column: 2)
!3138 = !DILocation(line: 2918, column: 22, scope: !3137)
!3139 = !DILocation(line: 2918, column: 20, scope: !3137)
!3140 = !DILocation(line: 2918, column: 12, scope: !3137)
!3141 = !DILocation(line: 2919, column: 26, scope: !3137)
!3142 = !DILocation(line: 2919, column: 33, scope: !3137)
!3143 = !DILocation(line: 2919, column: 14, scope: !3137)
!3144 = !DILocation(line: 2919, column: 12, scope: !3137)
!3145 = !DILocation(line: 2920, column: 14, scope: !3137)
!3146 = !DILocation(line: 2920, column: 23, scope: !3137)
!3147 = !DILocation(line: 2920, column: 12, scope: !3137)
!3148 = !DILocation(line: 2921, column: 15, scope: !3137)
!3149 = !DILocation(line: 2921, column: 24, scope: !3137)
!3150 = !DILocation(line: 2921, column: 12, scope: !3137)
!3151 = !DILocation(line: 2922, column: 10, scope: !3137)
!3152 = !DILocation(line: 2922, column: 3, scope: !3137)
!3153 = !DILocation(line: 2926, column: 3, scope: !3154)
!3154 = distinct !DILexicalBlock(scope: !3133, file: !76, line: 2925, column: 2)
!3155 = !DILocation(line: 2928, column: 1, scope: !3121)
!3156 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac2", scope: !76, file: !76, line: 2947, type: !3122, scopeLine: 2948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3157 = !DILocalVariable(name: "value", arg: 1, scope: !3156, file: !76, line: 2947, type: !740)
!3158 = !DILocation(line: 2947, column: 29, scope: !3156)
!3159 = !DILocalVariable(name: "factor", arg: 2, scope: !3156, file: !76, line: 2947, type: !6)
!3160 = !DILocation(line: 2947, column: 39, scope: !3156)
!3161 = !DILocalVariable(name: "u32Temp1", scope: !3156, file: !76, line: 2949, type: !740)
!3162 = !DILocation(line: 2949, column: 6, scope: !3156)
!3163 = !DILocalVariable(name: "u32Temp2", scope: !3156, file: !76, line: 2949, type: !740)
!3164 = !DILocation(line: 2949, column: 20, scope: !3156)
!3165 = !DILocation(line: 2950, column: 5, scope: !3166)
!3166 = distinct !DILexicalBlock(scope: !3156, file: !76, line: 2950, column: 5)
!3167 = !DILocation(line: 2950, column: 12, scope: !3166)
!3168 = !DILocation(line: 2950, column: 5, scope: !3156)
!3169 = !DILocation(line: 2952, column: 3, scope: !3170)
!3170 = distinct !DILexicalBlock(scope: !3166, file: !76, line: 2951, column: 2)
!3171 = !DILocation(line: 2956, column: 14, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3166, file: !76, line: 2955, column: 2)
!3173 = !DILocation(line: 2956, column: 22, scope: !3172)
!3174 = !DILocation(line: 2956, column: 20, scope: !3172)
!3175 = !DILocation(line: 2956, column: 12, scope: !3172)
!3176 = !DILocation(line: 2957, column: 26, scope: !3172)
!3177 = !DILocation(line: 2957, column: 33, scope: !3172)
!3178 = !DILocation(line: 2957, column: 14, scope: !3172)
!3179 = !DILocation(line: 2957, column: 12, scope: !3172)
!3180 = !DILocation(line: 2958, column: 14, scope: !3172)
!3181 = !DILocation(line: 2958, column: 23, scope: !3172)
!3182 = !DILocation(line: 2958, column: 12, scope: !3172)
!3183 = !DILocation(line: 2959, column: 15, scope: !3172)
!3184 = !DILocation(line: 2959, column: 24, scope: !3172)
!3185 = !DILocation(line: 2959, column: 12, scope: !3172)
!3186 = !DILocation(line: 2960, column: 7, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3172, file: !76, line: 2960, column: 6)
!3188 = !DILocation(line: 2960, column: 16, scope: !3187)
!3189 = !DILocation(line: 2960, column: 22, scope: !3187)
!3190 = !DILocation(line: 2960, column: 6, scope: !3172)
!3191 = !DILocation(line: 2962, column: 11, scope: !3192)
!3192 = distinct !DILexicalBlock(scope: !3187, file: !76, line: 2961, column: 3)
!3193 = !DILocation(line: 2962, column: 4, scope: !3192)
!3194 = !DILocation(line: 2966, column: 4, scope: !3195)
!3195 = distinct !DILexicalBlock(scope: !3187, file: !76, line: 2965, column: 3)
!3196 = !DILocation(line: 2969, column: 1, scope: !3156)
!3197 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac0125", scope: !76, file: !76, line: 2991, type: !305, scopeLine: 2992, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3198 = !DILocalVariable(name: "value", arg: 1, scope: !3197, file: !76, line: 2991, type: !13)
!3199 = !DILocation(line: 2991, column: 33, scope: !3197)
!3200 = !DILocalVariable(name: "factor", arg: 2, scope: !3197, file: !76, line: 2991, type: !13)
!3201 = !DILocation(line: 2991, column: 44, scope: !3197)
!3202 = !DILocation(line: 2993, column: 40, scope: !3197)
!3203 = !DILocation(line: 2993, column: 46, scope: !3197)
!3204 = !DILocation(line: 2993, column: 9, scope: !3197)
!3205 = !DILocation(line: 2993, column: 2, scope: !3197)
!3206 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac025", scope: !76, file: !76, line: 3015, type: !305, scopeLine: 3016, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3207 = !DILocalVariable(name: "value", arg: 1, scope: !3206, file: !76, line: 3015, type: !13)
!3208 = !DILocation(line: 3015, column: 33, scope: !3206)
!3209 = !DILocalVariable(name: "factor", arg: 2, scope: !3206, file: !76, line: 3015, type: !13)
!3210 = !DILocation(line: 3015, column: 44, scope: !3206)
!3211 = !DILocation(line: 3017, column: 41, scope: !3206)
!3212 = !DILocation(line: 3017, column: 47, scope: !3206)
!3213 = !DILocation(line: 3017, column: 10, scope: !3206)
!3214 = !DILocation(line: 3017, column: 3, scope: !3206)
!3215 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac05", scope: !76, file: !76, line: 3040, type: !305, scopeLine: 3041, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3216 = !DILocalVariable(name: "value", arg: 1, scope: !3215, file: !76, line: 3040, type: !13)
!3217 = !DILocation(line: 3040, column: 32, scope: !3215)
!3218 = !DILocalVariable(name: "factor", arg: 2, scope: !3215, file: !76, line: 3040, type: !13)
!3219 = !DILocation(line: 3040, column: 43, scope: !3215)
!3220 = !DILocation(line: 3042, column: 41, scope: !3215)
!3221 = !DILocation(line: 3042, column: 47, scope: !3215)
!3222 = !DILocation(line: 3042, column: 10, scope: !3215)
!3223 = !DILocation(line: 3042, column: 3, scope: !3215)
!3224 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac1024", scope: !76, file: !76, line: 3065, type: !305, scopeLine: 3066, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3225 = !DILocalVariable(name: "value", arg: 1, scope: !3224, file: !76, line: 3065, type: !13)
!3226 = !DILocation(line: 3065, column: 34, scope: !3224)
!3227 = !DILocalVariable(name: "factor", arg: 2, scope: !3224, file: !76, line: 3065, type: !13)
!3228 = !DILocation(line: 3065, column: 45, scope: !3224)
!3229 = !DILocation(line: 3067, column: 44, scope: !3224)
!3230 = !DILocation(line: 3067, column: 50, scope: !3224)
!3231 = !DILocation(line: 3067, column: 10, scope: !3224)
!3232 = !DILocation(line: 3067, column: 3, scope: !3224)
!3233 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac128", scope: !76, file: !76, line: 3090, type: !305, scopeLine: 3091, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3234 = !DILocalVariable(name: "value", arg: 1, scope: !3233, file: !76, line: 3090, type: !13)
!3235 = !DILocation(line: 3090, column: 33, scope: !3233)
!3236 = !DILocalVariable(name: "factor", arg: 2, scope: !3233, file: !76, line: 3090, type: !13)
!3237 = !DILocation(line: 3090, column: 44, scope: !3233)
!3238 = !DILocation(line: 3092, column: 44, scope: !3233)
!3239 = !DILocation(line: 3092, column: 50, scope: !3233)
!3240 = !DILocation(line: 3092, column: 10, scope: !3233)
!3241 = !DILocation(line: 3092, column: 3, scope: !3233)
!3242 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac16", scope: !76, file: !76, line: 3115, type: !305, scopeLine: 3116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3243 = !DILocalVariable(name: "value", arg: 1, scope: !3242, file: !76, line: 3115, type: !13)
!3244 = !DILocation(line: 3115, column: 31, scope: !3242)
!3245 = !DILocalVariable(name: "factor", arg: 2, scope: !3242, file: !76, line: 3115, type: !13)
!3246 = !DILocation(line: 3115, column: 42, scope: !3242)
!3247 = !DILocation(line: 3117, column: 44, scope: !3242)
!3248 = !DILocation(line: 3117, column: 50, scope: !3242)
!3249 = !DILocation(line: 3117, column: 10, scope: !3242)
!3250 = !DILocation(line: 3117, column: 3, scope: !3242)
!3251 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac2048", scope: !76, file: !76, line: 3140, type: !305, scopeLine: 3141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3252 = !DILocalVariable(name: "value", arg: 1, scope: !3251, file: !76, line: 3140, type: !13)
!3253 = !DILocation(line: 3140, column: 33, scope: !3251)
!3254 = !DILocalVariable(name: "factor", arg: 2, scope: !3251, file: !76, line: 3140, type: !13)
!3255 = !DILocation(line: 3140, column: 44, scope: !3251)
!3256 = !DILocation(line: 3142, column: 44, scope: !3251)
!3257 = !DILocation(line: 3142, column: 50, scope: !3251)
!3258 = !DILocation(line: 3142, column: 10, scope: !3251)
!3259 = !DILocation(line: 3142, column: 3, scope: !3251)
!3260 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac256", scope: !76, file: !76, line: 3165, type: !305, scopeLine: 3166, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3261 = !DILocalVariable(name: "value", arg: 1, scope: !3260, file: !76, line: 3165, type: !13)
!3262 = !DILocation(line: 3165, column: 32, scope: !3260)
!3263 = !DILocalVariable(name: "factor", arg: 2, scope: !3260, file: !76, line: 3165, type: !13)
!3264 = !DILocation(line: 3165, column: 43, scope: !3260)
!3265 = !DILocation(line: 3167, column: 44, scope: !3260)
!3266 = !DILocation(line: 3167, column: 50, scope: !3260)
!3267 = !DILocation(line: 3167, column: 10, scope: !3260)
!3268 = !DILocation(line: 3167, column: 3, scope: !3260)
!3269 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac32", scope: !76, file: !76, line: 3189, type: !305, scopeLine: 3190, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3270 = !DILocalVariable(name: "value", arg: 1, scope: !3269, file: !76, line: 3189, type: !13)
!3271 = !DILocation(line: 3189, column: 31, scope: !3269)
!3272 = !DILocalVariable(name: "factor", arg: 2, scope: !3269, file: !76, line: 3189, type: !13)
!3273 = !DILocation(line: 3189, column: 42, scope: !3269)
!3274 = !DILocation(line: 3191, column: 44, scope: !3269)
!3275 = !DILocation(line: 3191, column: 50, scope: !3269)
!3276 = !DILocation(line: 3191, column: 10, scope: !3269)
!3277 = !DILocation(line: 3191, column: 3, scope: !3269)
!3278 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4", scope: !76, file: !76, line: 3213, type: !305, scopeLine: 3214, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3279 = !DILocalVariable(name: "value", arg: 1, scope: !3278, file: !76, line: 3213, type: !13)
!3280 = !DILocation(line: 3213, column: 30, scope: !3278)
!3281 = !DILocalVariable(name: "factor", arg: 2, scope: !3278, file: !76, line: 3213, type: !13)
!3282 = !DILocation(line: 3213, column: 41, scope: !3278)
!3283 = !DILocation(line: 3215, column: 44, scope: !3278)
!3284 = !DILocation(line: 3215, column: 50, scope: !3278)
!3285 = !DILocation(line: 3215, column: 10, scope: !3278)
!3286 = !DILocation(line: 3215, column: 3, scope: !3278)
!3287 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac4096", scope: !76, file: !76, line: 3237, type: !305, scopeLine: 3238, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3288 = !DILocalVariable(name: "value", arg: 1, scope: !3287, file: !76, line: 3237, type: !13)
!3289 = !DILocation(line: 3237, column: 33, scope: !3287)
!3290 = !DILocalVariable(name: "factor", arg: 2, scope: !3287, file: !76, line: 3237, type: !13)
!3291 = !DILocation(line: 3237, column: 44, scope: !3287)
!3292 = !DILocation(line: 3239, column: 44, scope: !3287)
!3293 = !DILocation(line: 3239, column: 50, scope: !3287)
!3294 = !DILocation(line: 3239, column: 10, scope: !3287)
!3295 = !DILocation(line: 3239, column: 3, scope: !3287)
!3296 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac512", scope: !76, file: !76, line: 3261, type: !305, scopeLine: 3262, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3297 = !DILocalVariable(name: "value", arg: 1, scope: !3296, file: !76, line: 3261, type: !13)
!3298 = !DILocation(line: 3261, column: 32, scope: !3296)
!3299 = !DILocalVariable(name: "factor", arg: 2, scope: !3296, file: !76, line: 3261, type: !13)
!3300 = !DILocation(line: 3261, column: 43, scope: !3296)
!3301 = !DILocation(line: 3263, column: 44, scope: !3296)
!3302 = !DILocation(line: 3263, column: 50, scope: !3296)
!3303 = !DILocation(line: 3263, column: 10, scope: !3296)
!3304 = !DILocation(line: 3263, column: 3, scope: !3296)
!3305 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac64", scope: !76, file: !76, line: 3285, type: !305, scopeLine: 3286, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3306 = !DILocalVariable(name: "value", arg: 1, scope: !3305, file: !76, line: 3285, type: !13)
!3307 = !DILocation(line: 3285, column: 31, scope: !3305)
!3308 = !DILocalVariable(name: "factor", arg: 2, scope: !3305, file: !76, line: 3285, type: !13)
!3309 = !DILocation(line: 3285, column: 42, scope: !3305)
!3310 = !DILocation(line: 3287, column: 44, scope: !3305)
!3311 = !DILocation(line: 3287, column: 50, scope: !3305)
!3312 = !DILocation(line: 3287, column: 10, scope: !3305)
!3313 = !DILocation(line: 3287, column: 3, scope: !3305)
!3314 = distinct !DISubprogram(name: "s16_mul_s16_s16_fac8", scope: !76, file: !76, line: 3309, type: !305, scopeLine: 3310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3315 = !DILocalVariable(name: "value", arg: 1, scope: !3314, file: !76, line: 3309, type: !13)
!3316 = !DILocation(line: 3309, column: 30, scope: !3314)
!3317 = !DILocalVariable(name: "factor", arg: 2, scope: !3314, file: !76, line: 3309, type: !13)
!3318 = !DILocation(line: 3309, column: 41, scope: !3314)
!3319 = !DILocation(line: 3311, column: 44, scope: !3314)
!3320 = !DILocation(line: 3311, column: 50, scope: !3314)
!3321 = !DILocation(line: 3311, column: 10, scope: !3314)
!3322 = !DILocation(line: 3311, column: 3, scope: !3314)
!3323 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac0125", scope: !76, file: !76, line: 3332, type: !394, scopeLine: 3333, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3324 = !DILocalVariable(name: "value", arg: 1, scope: !3323, file: !76, line: 3332, type: !13)
!3325 = !DILocation(line: 3332, column: 33, scope: !3323)
!3326 = !DILocalVariable(name: "factor", arg: 2, scope: !3323, file: !76, line: 3332, type: !22)
!3327 = !DILocation(line: 3332, column: 44, scope: !3323)
!3328 = !DILocation(line: 3334, column: 41, scope: !3323)
!3329 = !DILocation(line: 3334, column: 47, scope: !3323)
!3330 = !DILocation(line: 3334, column: 10, scope: !3323)
!3331 = !DILocation(line: 3334, column: 3, scope: !3323)
!3332 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac025", scope: !76, file: !76, line: 3355, type: !394, scopeLine: 3356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3333 = !DILocalVariable(name: "value", arg: 1, scope: !3332, file: !76, line: 3355, type: !13)
!3334 = !DILocation(line: 3355, column: 32, scope: !3332)
!3335 = !DILocalVariable(name: "factor", arg: 2, scope: !3332, file: !76, line: 3355, type: !22)
!3336 = !DILocation(line: 3355, column: 43, scope: !3332)
!3337 = !DILocation(line: 3357, column: 33, scope: !3332)
!3338 = !DILocation(line: 3357, column: 39, scope: !3332)
!3339 = !DILocation(line: 3357, column: 2, scope: !3332)
!3340 = !DILocation(line: 3358, column: 1, scope: !3332)
!3341 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac05", scope: !76, file: !76, line: 3379, type: !394, scopeLine: 3380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3342 = !DILocalVariable(name: "value", arg: 1, scope: !3341, file: !76, line: 3379, type: !13)
!3343 = !DILocation(line: 3379, column: 31, scope: !3341)
!3344 = !DILocalVariable(name: "factor", arg: 2, scope: !3341, file: !76, line: 3379, type: !22)
!3345 = !DILocation(line: 3379, column: 42, scope: !3341)
!3346 = !DILocation(line: 3381, column: 41, scope: !3341)
!3347 = !DILocation(line: 3381, column: 47, scope: !3341)
!3348 = !DILocation(line: 3381, column: 10, scope: !3341)
!3349 = !DILocation(line: 3381, column: 3, scope: !3341)
!3350 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac1024", scope: !76, file: !76, line: 3404, type: !394, scopeLine: 3405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3351 = !DILocalVariable(name: "value", arg: 1, scope: !3350, file: !76, line: 3404, type: !13)
!3352 = !DILocation(line: 3404, column: 33, scope: !3350)
!3353 = !DILocalVariable(name: "factor", arg: 2, scope: !3350, file: !76, line: 3404, type: !22)
!3354 = !DILocation(line: 3404, column: 44, scope: !3350)
!3355 = !DILocation(line: 3406, column: 44, scope: !3350)
!3356 = !DILocation(line: 3406, column: 50, scope: !3350)
!3357 = !DILocation(line: 3406, column: 10, scope: !3350)
!3358 = !DILocation(line: 3406, column: 3, scope: !3350)
!3359 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac128", scope: !76, file: !76, line: 3429, type: !394, scopeLine: 3430, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3360 = !DILocalVariable(name: "value", arg: 1, scope: !3359, file: !76, line: 3429, type: !13)
!3361 = !DILocation(line: 3429, column: 32, scope: !3359)
!3362 = !DILocalVariable(name: "factor", arg: 2, scope: !3359, file: !76, line: 3429, type: !22)
!3363 = !DILocation(line: 3429, column: 43, scope: !3359)
!3364 = !DILocation(line: 3431, column: 44, scope: !3359)
!3365 = !DILocation(line: 3431, column: 50, scope: !3359)
!3366 = !DILocation(line: 3431, column: 10, scope: !3359)
!3367 = !DILocation(line: 3431, column: 3, scope: !3359)
!3368 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac16", scope: !76, file: !76, line: 3454, type: !394, scopeLine: 3455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3369 = !DILocalVariable(name: "value", arg: 1, scope: !3368, file: !76, line: 3454, type: !13)
!3370 = !DILocation(line: 3454, column: 31, scope: !3368)
!3371 = !DILocalVariable(name: "factor", arg: 2, scope: !3368, file: !76, line: 3454, type: !22)
!3372 = !DILocation(line: 3454, column: 42, scope: !3368)
!3373 = !DILocation(line: 3456, column: 44, scope: !3368)
!3374 = !DILocation(line: 3456, column: 50, scope: !3368)
!3375 = !DILocation(line: 3456, column: 10, scope: !3368)
!3376 = !DILocation(line: 3456, column: 3, scope: !3368)
!3377 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac2048", scope: !76, file: !76, line: 3479, type: !394, scopeLine: 3480, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3378 = !DILocalVariable(name: "value", arg: 1, scope: !3377, file: !76, line: 3479, type: !13)
!3379 = !DILocation(line: 3479, column: 33, scope: !3377)
!3380 = !DILocalVariable(name: "factor", arg: 2, scope: !3377, file: !76, line: 3479, type: !22)
!3381 = !DILocation(line: 3479, column: 44, scope: !3377)
!3382 = !DILocation(line: 3481, column: 44, scope: !3377)
!3383 = !DILocation(line: 3481, column: 50, scope: !3377)
!3384 = !DILocation(line: 3481, column: 10, scope: !3377)
!3385 = !DILocation(line: 3481, column: 3, scope: !3377)
!3386 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac256", scope: !76, file: !76, line: 3504, type: !394, scopeLine: 3505, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3387 = !DILocalVariable(name: "value", arg: 1, scope: !3386, file: !76, line: 3504, type: !13)
!3388 = !DILocation(line: 3504, column: 32, scope: !3386)
!3389 = !DILocalVariable(name: "factor", arg: 2, scope: !3386, file: !76, line: 3504, type: !22)
!3390 = !DILocation(line: 3504, column: 43, scope: !3386)
!3391 = !DILocation(line: 3506, column: 44, scope: !3386)
!3392 = !DILocation(line: 3506, column: 50, scope: !3386)
!3393 = !DILocation(line: 3506, column: 10, scope: !3386)
!3394 = !DILocation(line: 3506, column: 3, scope: !3386)
!3395 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac32", scope: !76, file: !76, line: 3528, type: !394, scopeLine: 3529, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3396 = !DILocalVariable(name: "value", arg: 1, scope: !3395, file: !76, line: 3528, type: !13)
!3397 = !DILocation(line: 3528, column: 31, scope: !3395)
!3398 = !DILocalVariable(name: "factor", arg: 2, scope: !3395, file: !76, line: 3528, type: !22)
!3399 = !DILocation(line: 3528, column: 42, scope: !3395)
!3400 = !DILocation(line: 3530, column: 44, scope: !3395)
!3401 = !DILocation(line: 3530, column: 50, scope: !3395)
!3402 = !DILocation(line: 3530, column: 10, scope: !3395)
!3403 = !DILocation(line: 3530, column: 3, scope: !3395)
!3404 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4", scope: !76, file: !76, line: 3552, type: !394, scopeLine: 3553, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3405 = !DILocalVariable(name: "value", arg: 1, scope: !3404, file: !76, line: 3552, type: !13)
!3406 = !DILocation(line: 3552, column: 30, scope: !3404)
!3407 = !DILocalVariable(name: "factor", arg: 2, scope: !3404, file: !76, line: 3552, type: !22)
!3408 = !DILocation(line: 3552, column: 41, scope: !3404)
!3409 = !DILocation(line: 3554, column: 44, scope: !3404)
!3410 = !DILocation(line: 3554, column: 50, scope: !3404)
!3411 = !DILocation(line: 3554, column: 10, scope: !3404)
!3412 = !DILocation(line: 3554, column: 3, scope: !3404)
!3413 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac4096", scope: !76, file: !76, line: 3576, type: !394, scopeLine: 3577, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3414 = !DILocalVariable(name: "value", arg: 1, scope: !3413, file: !76, line: 3576, type: !13)
!3415 = !DILocation(line: 3576, column: 33, scope: !3413)
!3416 = !DILocalVariable(name: "factor", arg: 2, scope: !3413, file: !76, line: 3576, type: !22)
!3417 = !DILocation(line: 3576, column: 44, scope: !3413)
!3418 = !DILocation(line: 3578, column: 44, scope: !3413)
!3419 = !DILocation(line: 3578, column: 50, scope: !3413)
!3420 = !DILocation(line: 3578, column: 10, scope: !3413)
!3421 = !DILocation(line: 3578, column: 3, scope: !3413)
!3422 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac512", scope: !76, file: !76, line: 3600, type: !394, scopeLine: 3601, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3423 = !DILocalVariable(name: "value", arg: 1, scope: !3422, file: !76, line: 3600, type: !13)
!3424 = !DILocation(line: 3600, column: 32, scope: !3422)
!3425 = !DILocalVariable(name: "factor", arg: 2, scope: !3422, file: !76, line: 3600, type: !22)
!3426 = !DILocation(line: 3600, column: 43, scope: !3422)
!3427 = !DILocation(line: 3602, column: 44, scope: !3422)
!3428 = !DILocation(line: 3602, column: 50, scope: !3422)
!3429 = !DILocation(line: 3602, column: 10, scope: !3422)
!3430 = !DILocation(line: 3602, column: 3, scope: !3422)
!3431 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac64", scope: !76, file: !76, line: 3624, type: !394, scopeLine: 3625, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3432 = !DILocalVariable(name: "value", arg: 1, scope: !3431, file: !76, line: 3624, type: !13)
!3433 = !DILocation(line: 3624, column: 31, scope: !3431)
!3434 = !DILocalVariable(name: "factor", arg: 2, scope: !3431, file: !76, line: 3624, type: !22)
!3435 = !DILocation(line: 3624, column: 42, scope: !3431)
!3436 = !DILocation(line: 3626, column: 44, scope: !3431)
!3437 = !DILocation(line: 3626, column: 50, scope: !3431)
!3438 = !DILocation(line: 3626, column: 10, scope: !3431)
!3439 = !DILocation(line: 3626, column: 3, scope: !3431)
!3440 = distinct !DISubprogram(name: "s16_mul_s16_u16_fac8", scope: !76, file: !76, line: 3648, type: !394, scopeLine: 3649, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3441 = !DILocalVariable(name: "value", arg: 1, scope: !3440, file: !76, line: 3648, type: !13)
!3442 = !DILocation(line: 3648, column: 30, scope: !3440)
!3443 = !DILocalVariable(name: "factor", arg: 2, scope: !3440, file: !76, line: 3648, type: !22)
!3444 = !DILocation(line: 3648, column: 41, scope: !3440)
!3445 = !DILocation(line: 3650, column: 44, scope: !3440)
!3446 = !DILocation(line: 3650, column: 50, scope: !3440)
!3447 = !DILocation(line: 3650, column: 10, scope: !3440)
!3448 = !DILocation(line: 3650, column: 3, scope: !3440)
!3449 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac0125", scope: !76, file: !76, line: 3670, type: !479, scopeLine: 3671, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3450 = !DILocalVariable(name: "value", arg: 1, scope: !3449, file: !76, line: 3670, type: !13)
!3451 = !DILocation(line: 3670, column: 32, scope: !3449)
!3452 = !DILocalVariable(name: "factor", arg: 2, scope: !3449, file: !76, line: 3670, type: !17)
!3453 = !DILocation(line: 3670, column: 42, scope: !3449)
!3454 = !DILocation(line: 3672, column: 40, scope: !3449)
!3455 = !DILocation(line: 3672, column: 58, scope: !3449)
!3456 = !DILocation(line: 3672, column: 52, scope: !3449)
!3457 = !DILocation(line: 3672, column: 66, scope: !3449)
!3458 = !DILocation(line: 3672, column: 46, scope: !3449)
!3459 = !DILocation(line: 3672, column: 10, scope: !3449)
!3460 = !DILocation(line: 3672, column: 3, scope: !3449)
!3461 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac025", scope: !76, file: !76, line: 3692, type: !479, scopeLine: 3693, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3462 = !DILocalVariable(name: "value", arg: 1, scope: !3461, file: !76, line: 3692, type: !13)
!3463 = !DILocation(line: 3692, column: 31, scope: !3461)
!3464 = !DILocalVariable(name: "factor", arg: 2, scope: !3461, file: !76, line: 3692, type: !17)
!3465 = !DILocation(line: 3692, column: 41, scope: !3461)
!3466 = !DILocation(line: 3694, column: 40, scope: !3461)
!3467 = !DILocation(line: 3694, column: 58, scope: !3461)
!3468 = !DILocation(line: 3694, column: 52, scope: !3461)
!3469 = !DILocation(line: 3694, column: 66, scope: !3461)
!3470 = !DILocation(line: 3694, column: 46, scope: !3461)
!3471 = !DILocation(line: 3694, column: 10, scope: !3461)
!3472 = !DILocation(line: 3694, column: 3, scope: !3461)
!3473 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac05", scope: !76, file: !76, line: 3715, type: !479, scopeLine: 3716, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3474 = !DILocalVariable(name: "value", arg: 1, scope: !3473, file: !76, line: 3715, type: !13)
!3475 = !DILocation(line: 3715, column: 30, scope: !3473)
!3476 = !DILocalVariable(name: "factor", arg: 2, scope: !3473, file: !76, line: 3715, type: !17)
!3477 = !DILocation(line: 3715, column: 40, scope: !3473)
!3478 = !DILocation(line: 3717, column: 40, scope: !3473)
!3479 = !DILocation(line: 3717, column: 58, scope: !3473)
!3480 = !DILocation(line: 3717, column: 52, scope: !3473)
!3481 = !DILocation(line: 3717, column: 66, scope: !3473)
!3482 = !DILocation(line: 3717, column: 46, scope: !3473)
!3483 = !DILocation(line: 3717, column: 10, scope: !3473)
!3484 = !DILocation(line: 3717, column: 3, scope: !3473)
!3485 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac128", scope: !76, file: !76, line: 3738, type: !479, scopeLine: 3739, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3486 = !DILocalVariable(name: "value", arg: 1, scope: !3485, file: !76, line: 3738, type: !13)
!3487 = !DILocation(line: 3738, column: 31, scope: !3485)
!3488 = !DILocalVariable(name: "factor", arg: 2, scope: !3485, file: !76, line: 3738, type: !17)
!3489 = !DILocation(line: 3738, column: 41, scope: !3485)
!3490 = !DILocation(line: 3740, column: 43, scope: !3485)
!3491 = !DILocation(line: 3740, column: 61, scope: !3485)
!3492 = !DILocation(line: 3740, column: 55, scope: !3485)
!3493 = !DILocation(line: 3740, column: 69, scope: !3485)
!3494 = !DILocation(line: 3740, column: 49, scope: !3485)
!3495 = !DILocation(line: 3740, column: 10, scope: !3485)
!3496 = !DILocation(line: 3740, column: 3, scope: !3485)
!3497 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac16", scope: !76, file: !76, line: 3761, type: !479, scopeLine: 3762, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3498 = !DILocalVariable(name: "value", arg: 1, scope: !3497, file: !76, line: 3761, type: !13)
!3499 = !DILocation(line: 3761, column: 30, scope: !3497)
!3500 = !DILocalVariable(name: "factor", arg: 2, scope: !3497, file: !76, line: 3761, type: !17)
!3501 = !DILocation(line: 3761, column: 40, scope: !3497)
!3502 = !DILocation(line: 3763, column: 43, scope: !3497)
!3503 = !DILocation(line: 3763, column: 61, scope: !3497)
!3504 = !DILocation(line: 3763, column: 55, scope: !3497)
!3505 = !DILocation(line: 3763, column: 69, scope: !3497)
!3506 = !DILocation(line: 3763, column: 49, scope: !3497)
!3507 = !DILocation(line: 3763, column: 10, scope: !3497)
!3508 = !DILocation(line: 3763, column: 3, scope: !3497)
!3509 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac32", scope: !76, file: !76, line: 3783, type: !479, scopeLine: 3784, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3510 = !DILocalVariable(name: "value", arg: 1, scope: !3509, file: !76, line: 3783, type: !13)
!3511 = !DILocation(line: 3783, column: 30, scope: !3509)
!3512 = !DILocalVariable(name: "factor", arg: 2, scope: !3509, file: !76, line: 3783, type: !17)
!3513 = !DILocation(line: 3783, column: 40, scope: !3509)
!3514 = !DILocation(line: 3785, column: 43, scope: !3509)
!3515 = !DILocation(line: 3785, column: 61, scope: !3509)
!3516 = !DILocation(line: 3785, column: 55, scope: !3509)
!3517 = !DILocation(line: 3785, column: 69, scope: !3509)
!3518 = !DILocation(line: 3785, column: 49, scope: !3509)
!3519 = !DILocation(line: 3785, column: 10, scope: !3509)
!3520 = !DILocation(line: 3785, column: 3, scope: !3509)
!3521 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac4", scope: !76, file: !76, line: 3805, type: !479, scopeLine: 3806, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3522 = !DILocalVariable(name: "value", arg: 1, scope: !3521, file: !76, line: 3805, type: !13)
!3523 = !DILocation(line: 3805, column: 29, scope: !3521)
!3524 = !DILocalVariable(name: "factor", arg: 2, scope: !3521, file: !76, line: 3805, type: !17)
!3525 = !DILocation(line: 3805, column: 39, scope: !3521)
!3526 = !DILocation(line: 3807, column: 43, scope: !3521)
!3527 = !DILocation(line: 3807, column: 61, scope: !3521)
!3528 = !DILocation(line: 3807, column: 55, scope: !3521)
!3529 = !DILocation(line: 3807, column: 69, scope: !3521)
!3530 = !DILocation(line: 3807, column: 49, scope: !3521)
!3531 = !DILocation(line: 3807, column: 10, scope: !3521)
!3532 = !DILocation(line: 3807, column: 3, scope: !3521)
!3533 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac64", scope: !76, file: !76, line: 3827, type: !479, scopeLine: 3828, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3534 = !DILocalVariable(name: "value", arg: 1, scope: !3533, file: !76, line: 3827, type: !13)
!3535 = !DILocation(line: 3827, column: 30, scope: !3533)
!3536 = !DILocalVariable(name: "factor", arg: 2, scope: !3533, file: !76, line: 3827, type: !17)
!3537 = !DILocation(line: 3827, column: 40, scope: !3533)
!3538 = !DILocation(line: 3829, column: 43, scope: !3533)
!3539 = !DILocation(line: 3829, column: 61, scope: !3533)
!3540 = !DILocation(line: 3829, column: 55, scope: !3533)
!3541 = !DILocation(line: 3829, column: 69, scope: !3533)
!3542 = !DILocation(line: 3829, column: 49, scope: !3533)
!3543 = !DILocation(line: 3829, column: 10, scope: !3533)
!3544 = !DILocation(line: 3829, column: 3, scope: !3533)
!3545 = distinct !DISubprogram(name: "s16_mul_s16_u8_fac8", scope: !76, file: !76, line: 3849, type: !479, scopeLine: 3850, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3546 = !DILocalVariable(name: "value", arg: 1, scope: !3545, file: !76, line: 3849, type: !13)
!3547 = !DILocation(line: 3849, column: 29, scope: !3545)
!3548 = !DILocalVariable(name: "factor", arg: 2, scope: !3545, file: !76, line: 3849, type: !17)
!3549 = !DILocation(line: 3849, column: 39, scope: !3545)
!3550 = !DILocation(line: 3851, column: 43, scope: !3545)
!3551 = !DILocation(line: 3851, column: 61, scope: !3545)
!3552 = !DILocation(line: 3851, column: 55, scope: !3545)
!3553 = !DILocation(line: 3851, column: 69, scope: !3545)
!3554 = !DILocation(line: 3851, column: 49, scope: !3545)
!3555 = !DILocation(line: 3851, column: 10, scope: !3545)
!3556 = !DILocation(line: 3851, column: 3, scope: !3545)
!3557 = distinct !DISubprogram(name: "s32_mul_s32_s16_fac05", scope: !76, file: !76, line: 3873, type: !1874, scopeLine: 3874, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3558 = !DILocalVariable(name: "value", arg: 1, scope: !3557, file: !76, line: 3873, type: !84)
!3559 = !DILocation(line: 3873, column: 31, scope: !3557)
!3560 = !DILocalVariable(name: "factor", arg: 2, scope: !3557, file: !76, line: 3873, type: !13)
!3561 = !DILocation(line: 3873, column: 42, scope: !3557)
!3562 = !DILocation(line: 3875, column: 41, scope: !3557)
!3563 = !DILocation(line: 3875, column: 47, scope: !3557)
!3564 = !DILocation(line: 3875, column: 10, scope: !3557)
!3565 = !DILocation(line: 3875, column: 3, scope: !3557)
!3566 = distinct !DISubprogram(name: "root_s32_mul_s32_s16_fac_less1", scope: !76, file: !76, line: 5069, type: !3567, scopeLine: 5070, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3567 = !DISubroutineType(types: !3568)
!3568 = !{!84, !84, !13, !740}
!3569 = !DILocalVariable(name: "value", arg: 1, scope: !3566, file: !76, line: 5069, type: !84)
!3570 = !DILocation(line: 5069, column: 40, scope: !3566)
!3571 = !DILocalVariable(name: "factor", arg: 2, scope: !3566, file: !76, line: 5069, type: !13)
!3572 = !DILocation(line: 5069, column: 51, scope: !3566)
!3573 = !DILocalVariable(name: "count", arg: 3, scope: !3566, file: !76, line: 5069, type: !740)
!3574 = !DILocation(line: 5069, column: 63, scope: !3566)
!3575 = !DILocalVariable(name: "u32Temp1", scope: !3566, file: !76, line: 5071, type: !740)
!3576 = !DILocation(line: 5071, column: 6, scope: !3566)
!3577 = !DILocalVariable(name: "u32Temp2", scope: !3566, file: !76, line: 5071, type: !740)
!3578 = !DILocation(line: 5071, column: 17, scope: !3566)
!3579 = !DILocalVariable(name: "u32Temp3", scope: !3566, file: !76, line: 5071, type: !740)
!3580 = !DILocation(line: 5071, column: 26, scope: !3566)
!3581 = !DILocalVariable(name: "u32Temp4", scope: !3566, file: !76, line: 5071, type: !740)
!3582 = !DILocation(line: 5071, column: 35, scope: !3566)
!3583 = !DILocalVariable(name: "u8SignBit", scope: !3566, file: !76, line: 5072, type: !17)
!3584 = !DILocation(line: 5072, column: 5, scope: !3566)
!3585 = !DILocation(line: 5074, column: 7, scope: !3586)
!3586 = distinct !DILexicalBlock(scope: !3566, file: !76, line: 5074, column: 5)
!3587 = !DILocation(line: 5074, column: 12, scope: !3586)
!3588 = !DILocation(line: 5074, column: 16, scope: !3586)
!3589 = !DILocation(line: 5074, column: 20, scope: !3586)
!3590 = !DILocation(line: 5074, column: 26, scope: !3586)
!3591 = !DILocation(line: 5074, column: 31, scope: !3586)
!3592 = !DILocation(line: 5074, column: 36, scope: !3586)
!3593 = !DILocation(line: 5074, column: 41, scope: !3586)
!3594 = !DILocation(line: 5074, column: 45, scope: !3586)
!3595 = !DILocation(line: 5074, column: 49, scope: !3586)
!3596 = !DILocation(line: 5074, column: 55, scope: !3586)
!3597 = !DILocation(line: 5074, column: 5, scope: !3566)
!3598 = !DILocation(line: 5076, column: 13, scope: !3599)
!3599 = distinct !DILexicalBlock(scope: !3586, file: !76, line: 5075, column: 2)
!3600 = !DILocation(line: 5077, column: 2, scope: !3599)
!3601 = !DILocation(line: 5080, column: 13, scope: !3602)
!3602 = distinct !DILexicalBlock(scope: !3586, file: !76, line: 5079, column: 2)
!3603 = !DILocation(line: 5083, column: 5, scope: !3604)
!3604 = distinct !DILexicalBlock(scope: !3566, file: !76, line: 5083, column: 5)
!3605 = !DILocation(line: 5083, column: 10, scope: !3604)
!3606 = !DILocation(line: 5083, column: 5, scope: !3566)
!3607 = !DILocation(line: 5085, column: 15, scope: !3608)
!3608 = distinct !DILexicalBlock(scope: !3604, file: !76, line: 5084, column: 2)
!3609 = !DILocation(line: 5085, column: 14, scope: !3608)
!3610 = !DILocation(line: 5085, column: 12, scope: !3608)
!3611 = !DILocation(line: 5086, column: 2, scope: !3608)
!3612 = !DILocation(line: 5089, column: 14, scope: !3613)
!3613 = distinct !DILexicalBlock(scope: !3604, file: !76, line: 5088, column: 2)
!3614 = !DILocation(line: 5089, column: 12, scope: !3613)
!3615 = !DILocation(line: 5092, column: 5, scope: !3616)
!3616 = distinct !DILexicalBlock(scope: !3566, file: !76, line: 5092, column: 5)
!3617 = !DILocation(line: 5092, column: 11, scope: !3616)
!3618 = !DILocation(line: 5092, column: 5, scope: !3566)
!3619 = !DILocation(line: 5094, column: 15, scope: !3620)
!3620 = distinct !DILexicalBlock(scope: !3616, file: !76, line: 5093, column: 2)
!3621 = !DILocation(line: 5094, column: 14, scope: !3620)
!3622 = !DILocation(line: 5094, column: 12, scope: !3620)
!3623 = !DILocation(line: 5095, column: 2, scope: !3620)
!3624 = !DILocation(line: 5098, column: 14, scope: !3625)
!3625 = distinct !DILexicalBlock(scope: !3616, file: !76, line: 5097, column: 2)
!3626 = !DILocation(line: 5098, column: 12, scope: !3625)
!3627 = !DILocation(line: 5101, column: 13, scope: !3566)
!3628 = !DILocation(line: 5101, column: 24, scope: !3566)
!3629 = !DILocation(line: 5101, column: 22, scope: !3566)
!3630 = !DILocation(line: 5101, column: 11, scope: !3566)
!3631 = !DILocation(line: 5102, column: 25, scope: !3566)
!3632 = !DILocation(line: 5102, column: 35, scope: !3566)
!3633 = !DILocation(line: 5102, column: 13, scope: !3566)
!3634 = !DILocation(line: 5102, column: 11, scope: !3566)
!3635 = !DILocation(line: 5103, column: 13, scope: !3566)
!3636 = !DILocation(line: 5103, column: 25, scope: !3566)
!3637 = !DILocation(line: 5103, column: 22, scope: !3566)
!3638 = !DILocation(line: 5103, column: 11, scope: !3566)
!3639 = !DILocation(line: 5104, column: 14, scope: !3566)
!3640 = !DILocation(line: 5104, column: 30, scope: !3566)
!3641 = !DILocation(line: 5104, column: 29, scope: !3566)
!3642 = !DILocation(line: 5104, column: 23, scope: !3566)
!3643 = !DILocation(line: 5104, column: 11, scope: !3566)
!3644 = !DILocation(line: 5105, column: 6, scope: !3645)
!3645 = distinct !DILexicalBlock(scope: !3566, file: !76, line: 5105, column: 5)
!3646 = !DILocation(line: 5105, column: 16, scope: !3645)
!3647 = !DILocation(line: 5105, column: 14, scope: !3645)
!3648 = !DILocation(line: 5105, column: 22, scope: !3645)
!3649 = !DILocation(line: 5105, column: 5, scope: !3566)
!3650 = !DILocation(line: 5107, column: 6, scope: !3651)
!3651 = distinct !DILexicalBlock(scope: !3652, file: !76, line: 5107, column: 6)
!3652 = distinct !DILexicalBlock(scope: !3645, file: !76, line: 5106, column: 2)
!3653 = !DILocation(line: 5107, column: 16, scope: !3651)
!3654 = !DILocation(line: 5107, column: 6, scope: !3652)
!3655 = !DILocation(line: 5109, column: 7, scope: !3656)
!3656 = distinct !DILexicalBlock(scope: !3657, file: !76, line: 5109, column: 7)
!3657 = distinct !DILexicalBlock(scope: !3651, file: !76, line: 5108, column: 3)
!3658 = !DILocation(line: 5109, column: 15, scope: !3656)
!3659 = !DILocation(line: 5109, column: 7, scope: !3657)
!3660 = !DILocation(line: 5110, column: 12, scope: !3656)
!3661 = !DILocation(line: 5110, column: 5, scope: !3656)
!3662 = !DILocation(line: 5112, column: 5, scope: !3656)
!3663 = !DILocation(line: 5116, column: 7, scope: !3664)
!3664 = distinct !DILexicalBlock(scope: !3665, file: !76, line: 5116, column: 7)
!3665 = distinct !DILexicalBlock(scope: !3651, file: !76, line: 5115, column: 3)
!3666 = !DILocation(line: 5116, column: 15, scope: !3664)
!3667 = !DILocation(line: 5116, column: 7, scope: !3665)
!3668 = !DILocation(line: 5117, column: 13, scope: !3664)
!3669 = !DILocation(line: 5117, column: 12, scope: !3664)
!3670 = !DILocation(line: 5117, column: 5, scope: !3664)
!3671 = !DILocation(line: 5119, column: 5, scope: !3664)
!3672 = !DILocation(line: 5124, column: 3, scope: !3673)
!3673 = distinct !DILexicalBlock(scope: !3645, file: !76, line: 5123, column: 2)
!3674 = !DILocation(line: 5126, column: 1, scope: !3566)
!3675 = distinct !DISubprogram(name: "s32_mul_s32_s8_fac05", scope: !76, file: !76, line: 3897, type: !2666, scopeLine: 3898, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3676 = !DILocalVariable(name: "value", arg: 1, scope: !3675, file: !76, line: 3897, type: !84)
!3677 = !DILocation(line: 3897, column: 30, scope: !3675)
!3678 = !DILocalVariable(name: "factor", arg: 2, scope: !3675, file: !76, line: 3897, type: !6)
!3679 = !DILocation(line: 3897, column: 40, scope: !3675)
!3680 = !DILocation(line: 3899, column: 40, scope: !3675)
!3681 = !DILocation(line: 3899, column: 46, scope: !3675)
!3682 = !DILocation(line: 3899, column: 10, scope: !3675)
!3683 = !DILocation(line: 3899, column: 3, scope: !3675)
!3684 = distinct !DISubprogram(name: "root_s32_mul_s32_s8_fac_less1", scope: !76, file: !76, line: 5221, type: !3685, scopeLine: 5222, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3685 = !DISubroutineType(types: !3686)
!3686 = !{!84, !84, !6, !740}
!3687 = !DILocalVariable(name: "value", arg: 1, scope: !3684, file: !76, line: 5221, type: !84)
!3688 = !DILocation(line: 5221, column: 39, scope: !3684)
!3689 = !DILocalVariable(name: "factor", arg: 2, scope: !3684, file: !76, line: 5221, type: !6)
!3690 = !DILocation(line: 5221, column: 49, scope: !3684)
!3691 = !DILocalVariable(name: "count", arg: 3, scope: !3684, file: !76, line: 5221, type: !740)
!3692 = !DILocation(line: 5221, column: 61, scope: !3684)
!3693 = !DILocalVariable(name: "u32Temp1", scope: !3684, file: !76, line: 5223, type: !740)
!3694 = !DILocation(line: 5223, column: 6, scope: !3684)
!3695 = !DILocalVariable(name: "u32Temp2", scope: !3684, file: !76, line: 5223, type: !740)
!3696 = !DILocation(line: 5223, column: 17, scope: !3684)
!3697 = !DILocalVariable(name: "u32Temp3", scope: !3684, file: !76, line: 5223, type: !740)
!3698 = !DILocation(line: 5223, column: 26, scope: !3684)
!3699 = !DILocalVariable(name: "u32Temp4", scope: !3684, file: !76, line: 5223, type: !740)
!3700 = !DILocation(line: 5223, column: 35, scope: !3684)
!3701 = !DILocalVariable(name: "u8SignBit", scope: !3684, file: !76, line: 5224, type: !17)
!3702 = !DILocation(line: 5224, column: 5, scope: !3684)
!3703 = !DILocation(line: 5226, column: 7, scope: !3704)
!3704 = distinct !DILexicalBlock(scope: !3684, file: !76, line: 5226, column: 5)
!3705 = !DILocation(line: 5226, column: 12, scope: !3704)
!3706 = !DILocation(line: 5226, column: 16, scope: !3704)
!3707 = !DILocation(line: 5226, column: 20, scope: !3704)
!3708 = !DILocation(line: 5226, column: 26, scope: !3704)
!3709 = !DILocation(line: 5226, column: 31, scope: !3704)
!3710 = !DILocation(line: 5226, column: 36, scope: !3704)
!3711 = !DILocation(line: 5226, column: 41, scope: !3704)
!3712 = !DILocation(line: 5226, column: 45, scope: !3704)
!3713 = !DILocation(line: 5226, column: 49, scope: !3704)
!3714 = !DILocation(line: 5226, column: 55, scope: !3704)
!3715 = !DILocation(line: 5226, column: 5, scope: !3684)
!3716 = !DILocation(line: 5228, column: 13, scope: !3717)
!3717 = distinct !DILexicalBlock(scope: !3704, file: !76, line: 5227, column: 2)
!3718 = !DILocation(line: 5229, column: 2, scope: !3717)
!3719 = !DILocation(line: 5232, column: 13, scope: !3720)
!3720 = distinct !DILexicalBlock(scope: !3704, file: !76, line: 5231, column: 2)
!3721 = !DILocation(line: 5235, column: 5, scope: !3722)
!3722 = distinct !DILexicalBlock(scope: !3684, file: !76, line: 5235, column: 5)
!3723 = !DILocation(line: 5235, column: 10, scope: !3722)
!3724 = !DILocation(line: 5235, column: 5, scope: !3684)
!3725 = !DILocation(line: 5237, column: 15, scope: !3726)
!3726 = distinct !DILexicalBlock(scope: !3722, file: !76, line: 5236, column: 2)
!3727 = !DILocation(line: 5237, column: 14, scope: !3726)
!3728 = !DILocation(line: 5237, column: 12, scope: !3726)
!3729 = !DILocation(line: 5238, column: 2, scope: !3726)
!3730 = !DILocation(line: 5241, column: 14, scope: !3731)
!3731 = distinct !DILexicalBlock(scope: !3722, file: !76, line: 5240, column: 2)
!3732 = !DILocation(line: 5241, column: 12, scope: !3731)
!3733 = !DILocation(line: 5244, column: 5, scope: !3734)
!3734 = distinct !DILexicalBlock(scope: !3684, file: !76, line: 5244, column: 5)
!3735 = !DILocation(line: 5244, column: 11, scope: !3734)
!3736 = !DILocation(line: 5244, column: 5, scope: !3684)
!3737 = !DILocation(line: 5246, column: 15, scope: !3738)
!3738 = distinct !DILexicalBlock(scope: !3734, file: !76, line: 5245, column: 2)
!3739 = !DILocation(line: 5246, column: 14, scope: !3738)
!3740 = !DILocation(line: 5246, column: 12, scope: !3738)
!3741 = !DILocation(line: 5247, column: 2, scope: !3738)
!3742 = !DILocation(line: 5250, column: 14, scope: !3743)
!3743 = distinct !DILexicalBlock(scope: !3734, file: !76, line: 5249, column: 2)
!3744 = !DILocation(line: 5250, column: 12, scope: !3743)
!3745 = !DILocation(line: 5253, column: 13, scope: !3684)
!3746 = !DILocation(line: 5253, column: 24, scope: !3684)
!3747 = !DILocation(line: 5253, column: 22, scope: !3684)
!3748 = !DILocation(line: 5253, column: 11, scope: !3684)
!3749 = !DILocation(line: 5254, column: 25, scope: !3684)
!3750 = !DILocation(line: 5254, column: 35, scope: !3684)
!3751 = !DILocation(line: 5254, column: 13, scope: !3684)
!3752 = !DILocation(line: 5254, column: 11, scope: !3684)
!3753 = !DILocation(line: 5255, column: 13, scope: !3684)
!3754 = !DILocation(line: 5255, column: 25, scope: !3684)
!3755 = !DILocation(line: 5255, column: 22, scope: !3684)
!3756 = !DILocation(line: 5255, column: 11, scope: !3684)
!3757 = !DILocation(line: 5256, column: 14, scope: !3684)
!3758 = !DILocation(line: 5256, column: 30, scope: !3684)
!3759 = !DILocation(line: 5256, column: 29, scope: !3684)
!3760 = !DILocation(line: 5256, column: 23, scope: !3684)
!3761 = !DILocation(line: 5256, column: 11, scope: !3684)
!3762 = !DILocation(line: 5257, column: 6, scope: !3763)
!3763 = distinct !DILexicalBlock(scope: !3684, file: !76, line: 5257, column: 5)
!3764 = !DILocation(line: 5257, column: 16, scope: !3763)
!3765 = !DILocation(line: 5257, column: 14, scope: !3763)
!3766 = !DILocation(line: 5257, column: 22, scope: !3763)
!3767 = !DILocation(line: 5257, column: 5, scope: !3684)
!3768 = !DILocation(line: 5259, column: 6, scope: !3769)
!3769 = distinct !DILexicalBlock(scope: !3770, file: !76, line: 5259, column: 6)
!3770 = distinct !DILexicalBlock(scope: !3763, file: !76, line: 5258, column: 2)
!3771 = !DILocation(line: 5259, column: 16, scope: !3769)
!3772 = !DILocation(line: 5259, column: 6, scope: !3770)
!3773 = !DILocation(line: 5261, column: 7, scope: !3774)
!3774 = distinct !DILexicalBlock(scope: !3775, file: !76, line: 5261, column: 7)
!3775 = distinct !DILexicalBlock(scope: !3769, file: !76, line: 5260, column: 3)
!3776 = !DILocation(line: 5261, column: 15, scope: !3774)
!3777 = !DILocation(line: 5261, column: 7, scope: !3775)
!3778 = !DILocation(line: 5262, column: 12, scope: !3774)
!3779 = !DILocation(line: 5262, column: 5, scope: !3774)
!3780 = !DILocation(line: 5264, column: 5, scope: !3774)
!3781 = !DILocation(line: 5268, column: 7, scope: !3782)
!3782 = distinct !DILexicalBlock(scope: !3783, file: !76, line: 5268, column: 7)
!3783 = distinct !DILexicalBlock(scope: !3769, file: !76, line: 5267, column: 3)
!3784 = !DILocation(line: 5268, column: 15, scope: !3782)
!3785 = !DILocation(line: 5268, column: 7, scope: !3783)
!3786 = !DILocation(line: 5269, column: 13, scope: !3782)
!3787 = !DILocation(line: 5269, column: 12, scope: !3782)
!3788 = !DILocation(line: 5269, column: 5, scope: !3782)
!3789 = !DILocation(line: 5271, column: 5, scope: !3782)
!3790 = !DILocation(line: 5276, column: 3, scope: !3791)
!3791 = distinct !DILexicalBlock(scope: !3763, file: !76, line: 5275, column: 2)
!3792 = !DILocation(line: 5278, column: 1, scope: !3684)
!3793 = distinct !DISubprogram(name: "s32_mul_s32_u16_fac05", scope: !76, file: !76, line: 3921, type: !779, scopeLine: 3922, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3794 = !DILocalVariable(name: "value", arg: 1, scope: !3793, file: !76, line: 3921, type: !84)
!3795 = !DILocation(line: 3921, column: 31, scope: !3793)
!3796 = !DILocalVariable(name: "factor", arg: 2, scope: !3793, file: !76, line: 3921, type: !22)
!3797 = !DILocation(line: 3921, column: 42, scope: !3793)
!3798 = !DILocation(line: 3923, column: 41, scope: !3793)
!3799 = !DILocation(line: 3923, column: 47, scope: !3793)
!3800 = !DILocation(line: 3923, column: 10, scope: !3793)
!3801 = !DILocation(line: 3923, column: 3, scope: !3793)
!3802 = distinct !DISubprogram(name: "root_s32_mul_s32_u16_fac_less1", scope: !76, file: !76, line: 5145, type: !3803, scopeLine: 5146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3803 = !DISubroutineType(types: !3804)
!3804 = !{!84, !84, !22, !740}
!3805 = !DILocalVariable(name: "value", arg: 1, scope: !3802, file: !76, line: 5145, type: !84)
!3806 = !DILocation(line: 5145, column: 40, scope: !3802)
!3807 = !DILocalVariable(name: "factor", arg: 2, scope: !3802, file: !76, line: 5145, type: !22)
!3808 = !DILocation(line: 5145, column: 50, scope: !3802)
!3809 = !DILocalVariable(name: "count", arg: 3, scope: !3802, file: !76, line: 5145, type: !740)
!3810 = !DILocation(line: 5145, column: 62, scope: !3802)
!3811 = !DILocalVariable(name: "u32Temp1", scope: !3802, file: !76, line: 5147, type: !740)
!3812 = !DILocation(line: 5147, column: 6, scope: !3802)
!3813 = !DILocalVariable(name: "u32Temp2", scope: !3802, file: !76, line: 5147, type: !740)
!3814 = !DILocation(line: 5147, column: 17, scope: !3802)
!3815 = !DILocalVariable(name: "u32Temp3", scope: !3802, file: !76, line: 5147, type: !740)
!3816 = !DILocation(line: 5147, column: 26, scope: !3802)
!3817 = !DILocalVariable(name: "u32Temp4", scope: !3802, file: !76, line: 5147, type: !740)
!3818 = !DILocation(line: 5147, column: 35, scope: !3802)
!3819 = !DILocalVariable(name: "u8SignBit", scope: !3802, file: !76, line: 5148, type: !17)
!3820 = !DILocation(line: 5148, column: 5, scope: !3802)
!3821 = !DILocation(line: 5150, column: 7, scope: !3822)
!3822 = distinct !DILexicalBlock(scope: !3802, file: !76, line: 5150, column: 5)
!3823 = !DILocation(line: 5150, column: 12, scope: !3822)
!3824 = !DILocation(line: 5150, column: 16, scope: !3822)
!3825 = !DILocation(line: 5150, column: 20, scope: !3822)
!3826 = !DILocation(line: 5150, column: 26, scope: !3822)
!3827 = !DILocation(line: 5150, column: 31, scope: !3822)
!3828 = !DILocation(line: 5150, column: 36, scope: !3822)
!3829 = !DILocation(line: 5150, column: 41, scope: !3822)
!3830 = !DILocation(line: 5150, column: 45, scope: !3822)
!3831 = !DILocation(line: 5150, column: 49, scope: !3822)
!3832 = !DILocation(line: 5150, column: 55, scope: !3822)
!3833 = !DILocation(line: 5150, column: 5, scope: !3802)
!3834 = !DILocation(line: 5152, column: 13, scope: !3835)
!3835 = distinct !DILexicalBlock(scope: !3822, file: !76, line: 5151, column: 2)
!3836 = !DILocation(line: 5153, column: 2, scope: !3835)
!3837 = !DILocation(line: 5156, column: 13, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3822, file: !76, line: 5155, column: 2)
!3839 = !DILocation(line: 5159, column: 5, scope: !3840)
!3840 = distinct !DILexicalBlock(scope: !3802, file: !76, line: 5159, column: 5)
!3841 = !DILocation(line: 5159, column: 10, scope: !3840)
!3842 = !DILocation(line: 5159, column: 5, scope: !3802)
!3843 = !DILocation(line: 5161, column: 15, scope: !3844)
!3844 = distinct !DILexicalBlock(scope: !3840, file: !76, line: 5160, column: 2)
!3845 = !DILocation(line: 5161, column: 14, scope: !3844)
!3846 = !DILocation(line: 5161, column: 12, scope: !3844)
!3847 = !DILocation(line: 5162, column: 2, scope: !3844)
!3848 = !DILocation(line: 5165, column: 14, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3840, file: !76, line: 5164, column: 2)
!3850 = !DILocation(line: 5165, column: 12, scope: !3849)
!3851 = !DILocation(line: 5168, column: 5, scope: !3852)
!3852 = distinct !DILexicalBlock(scope: !3802, file: !76, line: 5168, column: 5)
!3853 = !DILocation(line: 5168, column: 11, scope: !3852)
!3854 = !DILocation(line: 5168, column: 5, scope: !3802)
!3855 = !DILocation(line: 5170, column: 15, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3852, file: !76, line: 5169, column: 2)
!3857 = !DILocation(line: 5170, column: 14, scope: !3856)
!3858 = !DILocation(line: 5170, column: 12, scope: !3856)
!3859 = !DILocation(line: 5171, column: 2, scope: !3856)
!3860 = !DILocation(line: 5174, column: 14, scope: !3861)
!3861 = distinct !DILexicalBlock(scope: !3852, file: !76, line: 5173, column: 2)
!3862 = !DILocation(line: 5174, column: 12, scope: !3861)
!3863 = !DILocation(line: 5177, column: 13, scope: !3802)
!3864 = !DILocation(line: 5177, column: 24, scope: !3802)
!3865 = !DILocation(line: 5177, column: 22, scope: !3802)
!3866 = !DILocation(line: 5177, column: 11, scope: !3802)
!3867 = !DILocation(line: 5178, column: 25, scope: !3802)
!3868 = !DILocation(line: 5178, column: 35, scope: !3802)
!3869 = !DILocation(line: 5178, column: 13, scope: !3802)
!3870 = !DILocation(line: 5178, column: 11, scope: !3802)
!3871 = !DILocation(line: 5179, column: 13, scope: !3802)
!3872 = !DILocation(line: 5179, column: 25, scope: !3802)
!3873 = !DILocation(line: 5179, column: 22, scope: !3802)
!3874 = !DILocation(line: 5179, column: 11, scope: !3802)
!3875 = !DILocation(line: 5180, column: 14, scope: !3802)
!3876 = !DILocation(line: 5180, column: 30, scope: !3802)
!3877 = !DILocation(line: 5180, column: 29, scope: !3802)
!3878 = !DILocation(line: 5180, column: 23, scope: !3802)
!3879 = !DILocation(line: 5180, column: 11, scope: !3802)
!3880 = !DILocation(line: 5181, column: 6, scope: !3881)
!3881 = distinct !DILexicalBlock(scope: !3802, file: !76, line: 5181, column: 5)
!3882 = !DILocation(line: 5181, column: 16, scope: !3881)
!3883 = !DILocation(line: 5181, column: 14, scope: !3881)
!3884 = !DILocation(line: 5181, column: 22, scope: !3881)
!3885 = !DILocation(line: 5181, column: 5, scope: !3802)
!3886 = !DILocation(line: 5183, column: 6, scope: !3887)
!3887 = distinct !DILexicalBlock(scope: !3888, file: !76, line: 5183, column: 6)
!3888 = distinct !DILexicalBlock(scope: !3881, file: !76, line: 5182, column: 2)
!3889 = !DILocation(line: 5183, column: 16, scope: !3887)
!3890 = !DILocation(line: 5183, column: 6, scope: !3888)
!3891 = !DILocation(line: 5185, column: 7, scope: !3892)
!3892 = distinct !DILexicalBlock(scope: !3893, file: !76, line: 5185, column: 7)
!3893 = distinct !DILexicalBlock(scope: !3887, file: !76, line: 5184, column: 3)
!3894 = !DILocation(line: 5185, column: 15, scope: !3892)
!3895 = !DILocation(line: 5185, column: 7, scope: !3893)
!3896 = !DILocation(line: 5186, column: 12, scope: !3892)
!3897 = !DILocation(line: 5186, column: 5, scope: !3892)
!3898 = !DILocation(line: 5188, column: 5, scope: !3892)
!3899 = !DILocation(line: 5192, column: 7, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3901, file: !76, line: 5192, column: 7)
!3901 = distinct !DILexicalBlock(scope: !3887, file: !76, line: 5191, column: 3)
!3902 = !DILocation(line: 5192, column: 15, scope: !3900)
!3903 = !DILocation(line: 5192, column: 7, scope: !3901)
!3904 = !DILocation(line: 5193, column: 13, scope: !3900)
!3905 = !DILocation(line: 5193, column: 12, scope: !3900)
!3906 = !DILocation(line: 5193, column: 5, scope: !3900)
!3907 = !DILocation(line: 5195, column: 5, scope: !3900)
!3908 = !DILocation(line: 5200, column: 3, scope: !3909)
!3909 = distinct !DILexicalBlock(scope: !3881, file: !76, line: 5199, column: 2)
!3910 = !DILocation(line: 5202, column: 1, scope: !3802)
!3911 = distinct !DISubprogram(name: "s32_mul_s32_u8_fac05", scope: !76, file: !76, line: 3945, type: !2348, scopeLine: 3946, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3912 = !DILocalVariable(name: "value", arg: 1, scope: !3911, file: !76, line: 3945, type: !84)
!3913 = !DILocation(line: 3945, column: 30, scope: !3911)
!3914 = !DILocalVariable(name: "factor", arg: 2, scope: !3911, file: !76, line: 3945, type: !17)
!3915 = !DILocation(line: 3945, column: 40, scope: !3911)
!3916 = !DILocation(line: 3947, column: 40, scope: !3911)
!3917 = !DILocation(line: 3947, column: 46, scope: !3911)
!3918 = !DILocation(line: 3947, column: 10, scope: !3911)
!3919 = !DILocation(line: 3947, column: 3, scope: !3911)
!3920 = distinct !DISubprogram(name: "root_s32_mul_s32_u8_fac_less1", scope: !76, file: !76, line: 5540, type: !3921, scopeLine: 5541, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!3921 = !DISubroutineType(types: !3922)
!3922 = !{!84, !84, !17, !740}
!3923 = !DILocalVariable(name: "value", arg: 1, scope: !3920, file: !76, line: 5540, type: !84)
!3924 = !DILocation(line: 5540, column: 39, scope: !3920)
!3925 = !DILocalVariable(name: "factor", arg: 2, scope: !3920, file: !76, line: 5540, type: !17)
!3926 = !DILocation(line: 5540, column: 49, scope: !3920)
!3927 = !DILocalVariable(name: "count", arg: 3, scope: !3920, file: !76, line: 5540, type: !740)
!3928 = !DILocation(line: 5540, column: 61, scope: !3920)
!3929 = !DILocalVariable(name: "u32Temp1", scope: !3920, file: !76, line: 5542, type: !740)
!3930 = !DILocation(line: 5542, column: 6, scope: !3920)
!3931 = !DILocalVariable(name: "u32Temp2", scope: !3920, file: !76, line: 5542, type: !740)
!3932 = !DILocation(line: 5542, column: 17, scope: !3920)
!3933 = !DILocalVariable(name: "u32Temp3", scope: !3920, file: !76, line: 5542, type: !740)
!3934 = !DILocation(line: 5542, column: 26, scope: !3920)
!3935 = !DILocalVariable(name: "u8SignBit", scope: !3920, file: !76, line: 5543, type: !17)
!3936 = !DILocation(line: 5543, column: 5, scope: !3920)
!3937 = !DILocation(line: 5545, column: 5, scope: !3938)
!3938 = distinct !DILexicalBlock(scope: !3920, file: !76, line: 5545, column: 5)
!3939 = !DILocation(line: 5545, column: 10, scope: !3938)
!3940 = !DILocation(line: 5545, column: 5, scope: !3920)
!3941 = !DILocation(line: 5547, column: 13, scope: !3942)
!3942 = distinct !DILexicalBlock(scope: !3938, file: !76, line: 5546, column: 2)
!3943 = !DILocation(line: 5548, column: 15, scope: !3942)
!3944 = !DILocation(line: 5548, column: 14, scope: !3942)
!3945 = !DILocation(line: 5548, column: 12, scope: !3942)
!3946 = !DILocation(line: 5549, column: 2, scope: !3942)
!3947 = !DILocation(line: 5552, column: 13, scope: !3948)
!3948 = distinct !DILexicalBlock(scope: !3938, file: !76, line: 5551, column: 2)
!3949 = !DILocation(line: 5553, column: 14, scope: !3948)
!3950 = !DILocation(line: 5553, column: 12, scope: !3948)
!3951 = !DILocation(line: 5556, column: 13, scope: !3920)
!3952 = !DILocation(line: 5556, column: 24, scope: !3920)
!3953 = !DILocation(line: 5556, column: 22, scope: !3920)
!3954 = !DILocation(line: 5556, column: 11, scope: !3920)
!3955 = !DILocation(line: 5557, column: 25, scope: !3920)
!3956 = !DILocation(line: 5557, column: 34, scope: !3920)
!3957 = !DILocation(line: 5557, column: 13, scope: !3920)
!3958 = !DILocation(line: 5557, column: 11, scope: !3920)
!3959 = !DILocation(line: 5558, column: 13, scope: !3920)
!3960 = !DILocation(line: 5558, column: 25, scope: !3920)
!3961 = !DILocation(line: 5558, column: 22, scope: !3920)
!3962 = !DILocation(line: 5558, column: 11, scope: !3920)
!3963 = !DILocation(line: 5559, column: 14, scope: !3920)
!3964 = !DILocation(line: 5559, column: 30, scope: !3920)
!3965 = !DILocation(line: 5559, column: 29, scope: !3920)
!3966 = !DILocation(line: 5559, column: 23, scope: !3920)
!3967 = !DILocation(line: 5559, column: 11, scope: !3920)
!3968 = !DILocation(line: 5560, column: 6, scope: !3969)
!3969 = distinct !DILexicalBlock(scope: !3920, file: !76, line: 5560, column: 5)
!3970 = !DILocation(line: 5560, column: 16, scope: !3969)
!3971 = !DILocation(line: 5560, column: 14, scope: !3969)
!3972 = !DILocation(line: 5560, column: 22, scope: !3969)
!3973 = !DILocation(line: 5560, column: 5, scope: !3920)
!3974 = !DILocation(line: 5562, column: 6, scope: !3975)
!3975 = distinct !DILexicalBlock(scope: !3976, file: !76, line: 5562, column: 6)
!3976 = distinct !DILexicalBlock(scope: !3969, file: !76, line: 5561, column: 2)
!3977 = !DILocation(line: 5562, column: 16, scope: !3975)
!3978 = !DILocation(line: 5562, column: 6, scope: !3976)
!3979 = !DILocation(line: 5564, column: 7, scope: !3980)
!3980 = distinct !DILexicalBlock(scope: !3981, file: !76, line: 5564, column: 7)
!3981 = distinct !DILexicalBlock(scope: !3975, file: !76, line: 5563, column: 3)
!3982 = !DILocation(line: 5564, column: 15, scope: !3980)
!3983 = !DILocation(line: 5564, column: 7, scope: !3981)
!3984 = !DILocation(line: 5565, column: 12, scope: !3980)
!3985 = !DILocation(line: 5565, column: 5, scope: !3980)
!3986 = !DILocation(line: 5567, column: 5, scope: !3980)
!3987 = !DILocation(line: 5571, column: 7, scope: !3988)
!3988 = distinct !DILexicalBlock(scope: !3989, file: !76, line: 5571, column: 7)
!3989 = distinct !DILexicalBlock(scope: !3975, file: !76, line: 5570, column: 3)
!3990 = !DILocation(line: 5571, column: 15, scope: !3988)
!3991 = !DILocation(line: 5571, column: 7, scope: !3989)
!3992 = !DILocation(line: 5573, column: 13, scope: !3993)
!3993 = distinct !DILexicalBlock(scope: !3988, file: !76, line: 5572, column: 4)
!3994 = !DILocation(line: 5573, column: 12, scope: !3993)
!3995 = !DILocation(line: 5573, column: 5, scope: !3993)
!3996 = !DILocation(line: 5577, column: 5, scope: !3997)
!3997 = distinct !DILexicalBlock(scope: !3988, file: !76, line: 5576, column: 4)
!3998 = !DILocation(line: 5583, column: 6, scope: !3999)
!3999 = distinct !DILexicalBlock(scope: !4000, file: !76, line: 5583, column: 6)
!4000 = distinct !DILexicalBlock(scope: !3969, file: !76, line: 5582, column: 2)
!4001 = !DILocation(line: 5583, column: 16, scope: !3999)
!4002 = !DILocation(line: 5583, column: 6, scope: !4000)
!4003 = !DILocation(line: 5585, column: 4, scope: !4004)
!4004 = distinct !DILexicalBlock(scope: !3999, file: !76, line: 5584, column: 3)
!4005 = !DILocation(line: 5589, column: 4, scope: !4006)
!4006 = distinct !DILexicalBlock(scope: !3999, file: !76, line: 5588, column: 3)
!4007 = !DILocation(line: 5592, column: 1, scope: !3920)
!4008 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac0125", scope: !76, file: !76, line: 3969, type: !163, scopeLine: 3970, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4009 = !DILocalVariable(name: "value", arg: 1, scope: !4008, file: !76, line: 3969, type: !6)
!4010 = !DILocation(line: 3969, column: 28, scope: !4008)
!4011 = !DILocalVariable(name: "factor", arg: 2, scope: !4008, file: !76, line: 3969, type: !17)
!4012 = !DILocation(line: 3969, column: 38, scope: !4008)
!4013 = !DILocation(line: 3971, column: 38, scope: !4008)
!4014 = !DILocation(line: 3971, column: 56, scope: !4008)
!4015 = !DILocation(line: 3971, column: 50, scope: !4008)
!4016 = !DILocation(line: 3971, column: 64, scope: !4008)
!4017 = !DILocation(line: 3971, column: 44, scope: !4008)
!4018 = !DILocation(line: 3971, column: 10, scope: !4008)
!4019 = !DILocation(line: 3971, column: 3, scope: !4008)
!4020 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac025", scope: !76, file: !76, line: 3993, type: !163, scopeLine: 3994, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4021 = !DILocalVariable(name: "value", arg: 1, scope: !4020, file: !76, line: 3993, type: !6)
!4022 = !DILocation(line: 3993, column: 27, scope: !4020)
!4023 = !DILocalVariable(name: "factor", arg: 2, scope: !4020, file: !76, line: 3993, type: !17)
!4024 = !DILocation(line: 3993, column: 37, scope: !4020)
!4025 = !DILocation(line: 3995, column: 38, scope: !4020)
!4026 = !DILocation(line: 3995, column: 56, scope: !4020)
!4027 = !DILocation(line: 3995, column: 50, scope: !4020)
!4028 = !DILocation(line: 3995, column: 64, scope: !4020)
!4029 = !DILocation(line: 3995, column: 44, scope: !4020)
!4030 = !DILocation(line: 3995, column: 10, scope: !4020)
!4031 = !DILocation(line: 3995, column: 3, scope: !4020)
!4032 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac05", scope: !76, file: !76, line: 4018, type: !163, scopeLine: 4019, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4033 = !DILocalVariable(name: "value", arg: 1, scope: !4032, file: !76, line: 4018, type: !6)
!4034 = !DILocation(line: 4018, column: 26, scope: !4032)
!4035 = !DILocalVariable(name: "factor", arg: 2, scope: !4032, file: !76, line: 4018, type: !17)
!4036 = !DILocation(line: 4018, column: 36, scope: !4032)
!4037 = !DILocation(line: 4020, column: 38, scope: !4032)
!4038 = !DILocation(line: 4020, column: 56, scope: !4032)
!4039 = !DILocation(line: 4020, column: 50, scope: !4032)
!4040 = !DILocation(line: 4020, column: 64, scope: !4032)
!4041 = !DILocation(line: 4020, column: 44, scope: !4032)
!4042 = !DILocation(line: 4020, column: 10, scope: !4032)
!4043 = !DILocation(line: 4020, column: 3, scope: !4032)
!4044 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac128", scope: !76, file: !76, line: 4043, type: !163, scopeLine: 4044, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4045 = !DILocalVariable(name: "value", arg: 1, scope: !4044, file: !76, line: 4043, type: !6)
!4046 = !DILocation(line: 4043, column: 27, scope: !4044)
!4047 = !DILocalVariable(name: "factor", arg: 2, scope: !4044, file: !76, line: 4043, type: !17)
!4048 = !DILocation(line: 4043, column: 37, scope: !4044)
!4049 = !DILocation(line: 4045, column: 41, scope: !4044)
!4050 = !DILocation(line: 4045, column: 59, scope: !4044)
!4051 = !DILocation(line: 4045, column: 53, scope: !4044)
!4052 = !DILocation(line: 4045, column: 67, scope: !4044)
!4053 = !DILocation(line: 4045, column: 47, scope: !4044)
!4054 = !DILocation(line: 4045, column: 10, scope: !4044)
!4055 = !DILocation(line: 4045, column: 3, scope: !4044)
!4056 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac16", scope: !76, file: !76, line: 4068, type: !163, scopeLine: 4069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4057 = !DILocalVariable(name: "value", arg: 1, scope: !4056, file: !76, line: 4068, type: !6)
!4058 = !DILocation(line: 4068, column: 26, scope: !4056)
!4059 = !DILocalVariable(name: "factor", arg: 2, scope: !4056, file: !76, line: 4068, type: !17)
!4060 = !DILocation(line: 4068, column: 36, scope: !4056)
!4061 = !DILocation(line: 4070, column: 41, scope: !4056)
!4062 = !DILocation(line: 4070, column: 59, scope: !4056)
!4063 = !DILocation(line: 4070, column: 53, scope: !4056)
!4064 = !DILocation(line: 4070, column: 67, scope: !4056)
!4065 = !DILocation(line: 4070, column: 47, scope: !4056)
!4066 = !DILocation(line: 4070, column: 10, scope: !4056)
!4067 = !DILocation(line: 4070, column: 3, scope: !4056)
!4068 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac32", scope: !76, file: !76, line: 4092, type: !163, scopeLine: 4093, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4069 = !DILocalVariable(name: "value", arg: 1, scope: !4068, file: !76, line: 4092, type: !6)
!4070 = !DILocation(line: 4092, column: 26, scope: !4068)
!4071 = !DILocalVariable(name: "factor", arg: 2, scope: !4068, file: !76, line: 4092, type: !17)
!4072 = !DILocation(line: 4092, column: 36, scope: !4068)
!4073 = !DILocation(line: 4094, column: 41, scope: !4068)
!4074 = !DILocation(line: 4094, column: 59, scope: !4068)
!4075 = !DILocation(line: 4094, column: 53, scope: !4068)
!4076 = !DILocation(line: 4094, column: 67, scope: !4068)
!4077 = !DILocation(line: 4094, column: 47, scope: !4068)
!4078 = !DILocation(line: 4094, column: 10, scope: !4068)
!4079 = !DILocation(line: 4094, column: 3, scope: !4068)
!4080 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac4", scope: !76, file: !76, line: 4116, type: !163, scopeLine: 4117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4081 = !DILocalVariable(name: "value", arg: 1, scope: !4080, file: !76, line: 4116, type: !6)
!4082 = !DILocation(line: 4116, column: 25, scope: !4080)
!4083 = !DILocalVariable(name: "factor", arg: 2, scope: !4080, file: !76, line: 4116, type: !17)
!4084 = !DILocation(line: 4116, column: 35, scope: !4080)
!4085 = !DILocation(line: 4118, column: 41, scope: !4080)
!4086 = !DILocation(line: 4118, column: 59, scope: !4080)
!4087 = !DILocation(line: 4118, column: 53, scope: !4080)
!4088 = !DILocation(line: 4118, column: 67, scope: !4080)
!4089 = !DILocation(line: 4118, column: 47, scope: !4080)
!4090 = !DILocation(line: 4118, column: 10, scope: !4080)
!4091 = !DILocation(line: 4118, column: 3, scope: !4080)
!4092 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac64", scope: !76, file: !76, line: 4140, type: !163, scopeLine: 4141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4093 = !DILocalVariable(name: "value", arg: 1, scope: !4092, file: !76, line: 4140, type: !6)
!4094 = !DILocation(line: 4140, column: 26, scope: !4092)
!4095 = !DILocalVariable(name: "factor", arg: 2, scope: !4092, file: !76, line: 4140, type: !17)
!4096 = !DILocation(line: 4140, column: 36, scope: !4092)
!4097 = !DILocation(line: 4142, column: 41, scope: !4092)
!4098 = !DILocation(line: 4142, column: 59, scope: !4092)
!4099 = !DILocation(line: 4142, column: 53, scope: !4092)
!4100 = !DILocation(line: 4142, column: 67, scope: !4092)
!4101 = !DILocation(line: 4142, column: 47, scope: !4092)
!4102 = !DILocation(line: 4142, column: 10, scope: !4092)
!4103 = !DILocation(line: 4142, column: 3, scope: !4092)
!4104 = distinct !DISubprogram(name: "s8_mul_s8_u8_fac8", scope: !76, file: !76, line: 4164, type: !163, scopeLine: 4165, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4105 = !DILocalVariable(name: "value", arg: 1, scope: !4104, file: !76, line: 4164, type: !6)
!4106 = !DILocation(line: 4164, column: 25, scope: !4104)
!4107 = !DILocalVariable(name: "factor", arg: 2, scope: !4104, file: !76, line: 4164, type: !17)
!4108 = !DILocation(line: 4164, column: 35, scope: !4104)
!4109 = !DILocation(line: 4166, column: 41, scope: !4104)
!4110 = !DILocation(line: 4166, column: 59, scope: !4104)
!4111 = !DILocation(line: 4166, column: 53, scope: !4104)
!4112 = !DILocation(line: 4166, column: 67, scope: !4104)
!4113 = !DILocation(line: 4166, column: 47, scope: !4104)
!4114 = !DILocation(line: 4166, column: 10, scope: !4104)
!4115 = !DILocation(line: 4166, column: 3, scope: !4104)
!4116 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac0125", scope: !76, file: !76, line: 4187, type: !933, scopeLine: 4188, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4117 = !DILocalVariable(name: "value", arg: 1, scope: !4116, file: !76, line: 4187, type: !22)
!4118 = !DILocation(line: 4187, column: 33, scope: !4116)
!4119 = !DILocalVariable(name: "factor", arg: 2, scope: !4116, file: !76, line: 4187, type: !22)
!4120 = !DILocation(line: 4187, column: 44, scope: !4116)
!4121 = !DILocation(line: 4189, column: 41, scope: !4116)
!4122 = !DILocation(line: 4189, column: 47, scope: !4116)
!4123 = !DILocation(line: 4189, column: 10, scope: !4116)
!4124 = !DILocation(line: 4189, column: 3, scope: !4116)
!4125 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac025", scope: !76, file: !76, line: 4210, type: !933, scopeLine: 4211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4126 = !DILocalVariable(name: "value", arg: 1, scope: !4125, file: !76, line: 4210, type: !22)
!4127 = !DILocation(line: 4210, column: 32, scope: !4125)
!4128 = !DILocalVariable(name: "factor", arg: 2, scope: !4125, file: !76, line: 4210, type: !22)
!4129 = !DILocation(line: 4210, column: 43, scope: !4125)
!4130 = !DILocation(line: 4212, column: 41, scope: !4125)
!4131 = !DILocation(line: 4212, column: 47, scope: !4125)
!4132 = !DILocation(line: 4212, column: 10, scope: !4125)
!4133 = !DILocation(line: 4212, column: 3, scope: !4125)
!4134 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac05", scope: !76, file: !76, line: 4234, type: !933, scopeLine: 4235, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4135 = !DILocalVariable(name: "value", arg: 1, scope: !4134, file: !76, line: 4234, type: !22)
!4136 = !DILocation(line: 4234, column: 31, scope: !4134)
!4137 = !DILocalVariable(name: "factor", arg: 2, scope: !4134, file: !76, line: 4234, type: !22)
!4138 = !DILocation(line: 4234, column: 42, scope: !4134)
!4139 = !DILocation(line: 4236, column: 41, scope: !4134)
!4140 = !DILocation(line: 4236, column: 47, scope: !4134)
!4141 = !DILocation(line: 4236, column: 10, scope: !4134)
!4142 = !DILocation(line: 4236, column: 3, scope: !4134)
!4143 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac1024", scope: !76, file: !76, line: 4258, type: !933, scopeLine: 4259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4144 = !DILocalVariable(name: "value", arg: 1, scope: !4143, file: !76, line: 4258, type: !22)
!4145 = !DILocation(line: 4258, column: 34, scope: !4143)
!4146 = !DILocalVariable(name: "factor", arg: 2, scope: !4143, file: !76, line: 4258, type: !22)
!4147 = !DILocation(line: 4258, column: 45, scope: !4143)
!4148 = !DILocation(line: 4260, column: 44, scope: !4143)
!4149 = !DILocation(line: 4260, column: 50, scope: !4143)
!4150 = !DILocation(line: 4260, column: 10, scope: !4143)
!4151 = !DILocation(line: 4260, column: 3, scope: !4143)
!4152 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac128", scope: !76, file: !76, line: 4282, type: !933, scopeLine: 4283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4153 = !DILocalVariable(name: "value", arg: 1, scope: !4152, file: !76, line: 4282, type: !22)
!4154 = !DILocation(line: 4282, column: 32, scope: !4152)
!4155 = !DILocalVariable(name: "factor", arg: 2, scope: !4152, file: !76, line: 4282, type: !22)
!4156 = !DILocation(line: 4282, column: 43, scope: !4152)
!4157 = !DILocation(line: 4284, column: 44, scope: !4152)
!4158 = !DILocation(line: 4284, column: 50, scope: !4152)
!4159 = !DILocation(line: 4284, column: 10, scope: !4152)
!4160 = !DILocation(line: 4284, column: 3, scope: !4152)
!4161 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac16", scope: !76, file: !76, line: 4306, type: !933, scopeLine: 4307, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4162 = !DILocalVariable(name: "value", arg: 1, scope: !4161, file: !76, line: 4306, type: !22)
!4163 = !DILocation(line: 4306, column: 31, scope: !4161)
!4164 = !DILocalVariable(name: "factor", arg: 2, scope: !4161, file: !76, line: 4306, type: !22)
!4165 = !DILocation(line: 4306, column: 42, scope: !4161)
!4166 = !DILocation(line: 4308, column: 44, scope: !4161)
!4167 = !DILocation(line: 4308, column: 50, scope: !4161)
!4168 = !DILocation(line: 4308, column: 10, scope: !4161)
!4169 = !DILocation(line: 4308, column: 3, scope: !4161)
!4170 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac2048", scope: !76, file: !76, line: 4330, type: !933, scopeLine: 4331, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4171 = !DILocalVariable(name: "value", arg: 1, scope: !4170, file: !76, line: 4330, type: !22)
!4172 = !DILocation(line: 4330, column: 33, scope: !4170)
!4173 = !DILocalVariable(name: "factor", arg: 2, scope: !4170, file: !76, line: 4330, type: !22)
!4174 = !DILocation(line: 4330, column: 44, scope: !4170)
!4175 = !DILocation(line: 4332, column: 44, scope: !4170)
!4176 = !DILocation(line: 4332, column: 50, scope: !4170)
!4177 = !DILocation(line: 4332, column: 10, scope: !4170)
!4178 = !DILocation(line: 4332, column: 3, scope: !4170)
!4179 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac256", scope: !76, file: !76, line: 4354, type: !933, scopeLine: 4355, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4180 = !DILocalVariable(name: "value", arg: 1, scope: !4179, file: !76, line: 4354, type: !22)
!4181 = !DILocation(line: 4354, column: 32, scope: !4179)
!4182 = !DILocalVariable(name: "factor", arg: 2, scope: !4179, file: !76, line: 4354, type: !22)
!4183 = !DILocation(line: 4354, column: 43, scope: !4179)
!4184 = !DILocation(line: 4356, column: 44, scope: !4179)
!4185 = !DILocation(line: 4356, column: 50, scope: !4179)
!4186 = !DILocation(line: 4356, column: 10, scope: !4179)
!4187 = !DILocation(line: 4356, column: 3, scope: !4179)
!4188 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac32", scope: !76, file: !76, line: 4377, type: !933, scopeLine: 4378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4189 = !DILocalVariable(name: "value", arg: 1, scope: !4188, file: !76, line: 4377, type: !22)
!4190 = !DILocation(line: 4377, column: 31, scope: !4188)
!4191 = !DILocalVariable(name: "factor", arg: 2, scope: !4188, file: !76, line: 4377, type: !22)
!4192 = !DILocation(line: 4377, column: 42, scope: !4188)
!4193 = !DILocation(line: 4379, column: 44, scope: !4188)
!4194 = !DILocation(line: 4379, column: 50, scope: !4188)
!4195 = !DILocation(line: 4379, column: 10, scope: !4188)
!4196 = !DILocation(line: 4379, column: 3, scope: !4188)
!4197 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4", scope: !76, file: !76, line: 4400, type: !933, scopeLine: 4401, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4198 = !DILocalVariable(name: "value", arg: 1, scope: !4197, file: !76, line: 4400, type: !22)
!4199 = !DILocation(line: 4400, column: 30, scope: !4197)
!4200 = !DILocalVariable(name: "factor", arg: 2, scope: !4197, file: !76, line: 4400, type: !22)
!4201 = !DILocation(line: 4400, column: 41, scope: !4197)
!4202 = !DILocation(line: 4402, column: 44, scope: !4197)
!4203 = !DILocation(line: 4402, column: 50, scope: !4197)
!4204 = !DILocation(line: 4402, column: 10, scope: !4197)
!4205 = !DILocation(line: 4402, column: 3, scope: !4197)
!4206 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac4096", scope: !76, file: !76, line: 4423, type: !933, scopeLine: 4424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4207 = !DILocalVariable(name: "value", arg: 1, scope: !4206, file: !76, line: 4423, type: !22)
!4208 = !DILocation(line: 4423, column: 33, scope: !4206)
!4209 = !DILocalVariable(name: "factor", arg: 2, scope: !4206, file: !76, line: 4423, type: !22)
!4210 = !DILocation(line: 4423, column: 44, scope: !4206)
!4211 = !DILocation(line: 4425, column: 44, scope: !4206)
!4212 = !DILocation(line: 4425, column: 50, scope: !4206)
!4213 = !DILocation(line: 4425, column: 10, scope: !4206)
!4214 = !DILocation(line: 4425, column: 3, scope: !4206)
!4215 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac512", scope: !76, file: !76, line: 4446, type: !933, scopeLine: 4447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4216 = !DILocalVariable(name: "value", arg: 1, scope: !4215, file: !76, line: 4446, type: !22)
!4217 = !DILocation(line: 4446, column: 32, scope: !4215)
!4218 = !DILocalVariable(name: "factor", arg: 2, scope: !4215, file: !76, line: 4446, type: !22)
!4219 = !DILocation(line: 4446, column: 43, scope: !4215)
!4220 = !DILocation(line: 4448, column: 44, scope: !4215)
!4221 = !DILocation(line: 4448, column: 50, scope: !4215)
!4222 = !DILocation(line: 4448, column: 10, scope: !4215)
!4223 = !DILocation(line: 4448, column: 3, scope: !4215)
!4224 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac64", scope: !76, file: !76, line: 4469, type: !933, scopeLine: 4470, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4225 = !DILocalVariable(name: "value", arg: 1, scope: !4224, file: !76, line: 4469, type: !22)
!4226 = !DILocation(line: 4469, column: 31, scope: !4224)
!4227 = !DILocalVariable(name: "factor", arg: 2, scope: !4224, file: !76, line: 4469, type: !22)
!4228 = !DILocation(line: 4469, column: 42, scope: !4224)
!4229 = !DILocation(line: 4471, column: 44, scope: !4224)
!4230 = !DILocation(line: 4471, column: 50, scope: !4224)
!4231 = !DILocation(line: 4471, column: 10, scope: !4224)
!4232 = !DILocation(line: 4471, column: 3, scope: !4224)
!4233 = distinct !DISubprogram(name: "u16_mul_u16_u16_fac8", scope: !76, file: !76, line: 4492, type: !933, scopeLine: 4493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4234 = !DILocalVariable(name: "value", arg: 1, scope: !4233, file: !76, line: 4492, type: !22)
!4235 = !DILocation(line: 4492, column: 30, scope: !4233)
!4236 = !DILocalVariable(name: "factor", arg: 2, scope: !4233, file: !76, line: 4492, type: !22)
!4237 = !DILocation(line: 4492, column: 41, scope: !4233)
!4238 = !DILocation(line: 4494, column: 44, scope: !4233)
!4239 = !DILocation(line: 4494, column: 50, scope: !4233)
!4240 = !DILocation(line: 4494, column: 10, scope: !4233)
!4241 = !DILocation(line: 4494, column: 3, scope: !4233)
!4242 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac0125", scope: !76, file: !76, line: 4514, type: !978, scopeLine: 4515, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4243 = !DILocalVariable(name: "x_value", arg: 1, scope: !4242, file: !76, line: 4514, type: !22)
!4244 = !DILocation(line: 4514, column: 32, scope: !4242)
!4245 = !DILocalVariable(name: "y_value", arg: 2, scope: !4242, file: !76, line: 4514, type: !17)
!4246 = !DILocation(line: 4514, column: 44, scope: !4242)
!4247 = !DILocation(line: 4516, column: 40, scope: !4242)
!4248 = !DILocation(line: 4516, column: 60, scope: !4242)
!4249 = !DILocation(line: 4516, column: 54, scope: !4242)
!4250 = !DILocation(line: 4516, column: 69, scope: !4242)
!4251 = !DILocation(line: 4516, column: 48, scope: !4242)
!4252 = !DILocation(line: 4516, column: 10, scope: !4242)
!4253 = !DILocation(line: 4516, column: 3, scope: !4242)
!4254 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac025", scope: !76, file: !76, line: 4536, type: !978, scopeLine: 4537, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4255 = !DILocalVariable(name: "x_value", arg: 1, scope: !4254, file: !76, line: 4536, type: !22)
!4256 = !DILocation(line: 4536, column: 31, scope: !4254)
!4257 = !DILocalVariable(name: "y_value", arg: 2, scope: !4254, file: !76, line: 4536, type: !17)
!4258 = !DILocation(line: 4536, column: 43, scope: !4254)
!4259 = !DILocation(line: 4538, column: 40, scope: !4254)
!4260 = !DILocation(line: 4538, column: 60, scope: !4254)
!4261 = !DILocation(line: 4538, column: 54, scope: !4254)
!4262 = !DILocation(line: 4538, column: 69, scope: !4254)
!4263 = !DILocation(line: 4538, column: 48, scope: !4254)
!4264 = !DILocation(line: 4538, column: 10, scope: !4254)
!4265 = !DILocation(line: 4538, column: 3, scope: !4254)
!4266 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac05", scope: !76, file: !76, line: 4559, type: !978, scopeLine: 4560, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4267 = !DILocalVariable(name: "x_value", arg: 1, scope: !4266, file: !76, line: 4559, type: !22)
!4268 = !DILocation(line: 4559, column: 30, scope: !4266)
!4269 = !DILocalVariable(name: "y_value", arg: 2, scope: !4266, file: !76, line: 4559, type: !17)
!4270 = !DILocation(line: 4559, column: 42, scope: !4266)
!4271 = !DILocation(line: 4561, column: 40, scope: !4266)
!4272 = !DILocation(line: 4561, column: 60, scope: !4266)
!4273 = !DILocation(line: 4561, column: 54, scope: !4266)
!4274 = !DILocation(line: 4561, column: 69, scope: !4266)
!4275 = !DILocation(line: 4561, column: 48, scope: !4266)
!4276 = !DILocation(line: 4561, column: 10, scope: !4266)
!4277 = !DILocation(line: 4561, column: 3, scope: !4266)
!4278 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac128", scope: !76, file: !76, line: 4582, type: !978, scopeLine: 4583, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4279 = !DILocalVariable(name: "x_value", arg: 1, scope: !4278, file: !76, line: 4582, type: !22)
!4280 = !DILocation(line: 4582, column: 31, scope: !4278)
!4281 = !DILocalVariable(name: "y_value", arg: 2, scope: !4278, file: !76, line: 4582, type: !17)
!4282 = !DILocation(line: 4582, column: 43, scope: !4278)
!4283 = !DILocation(line: 4584, column: 44, scope: !4278)
!4284 = !DILocation(line: 4584, column: 64, scope: !4278)
!4285 = !DILocation(line: 4584, column: 58, scope: !4278)
!4286 = !DILocation(line: 4584, column: 73, scope: !4278)
!4287 = !DILocation(line: 4584, column: 52, scope: !4278)
!4288 = !DILocation(line: 4584, column: 10, scope: !4278)
!4289 = !DILocation(line: 4584, column: 3, scope: !4278)
!4290 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac16", scope: !76, file: !76, line: 4605, type: !978, scopeLine: 4606, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4291 = !DILocalVariable(name: "x_value", arg: 1, scope: !4290, file: !76, line: 4605, type: !22)
!4292 = !DILocation(line: 4605, column: 30, scope: !4290)
!4293 = !DILocalVariable(name: "y_value", arg: 2, scope: !4290, file: !76, line: 4605, type: !17)
!4294 = !DILocation(line: 4605, column: 42, scope: !4290)
!4295 = !DILocation(line: 4607, column: 44, scope: !4290)
!4296 = !DILocation(line: 4607, column: 64, scope: !4290)
!4297 = !DILocation(line: 4607, column: 58, scope: !4290)
!4298 = !DILocation(line: 4607, column: 73, scope: !4290)
!4299 = !DILocation(line: 4607, column: 52, scope: !4290)
!4300 = !DILocation(line: 4607, column: 10, scope: !4290)
!4301 = !DILocation(line: 4607, column: 3, scope: !4290)
!4302 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac32", scope: !76, file: !76, line: 4627, type: !978, scopeLine: 4628, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4303 = !DILocalVariable(name: "x_value", arg: 1, scope: !4302, file: !76, line: 4627, type: !22)
!4304 = !DILocation(line: 4627, column: 30, scope: !4302)
!4305 = !DILocalVariable(name: "y_value", arg: 2, scope: !4302, file: !76, line: 4627, type: !17)
!4306 = !DILocation(line: 4627, column: 42, scope: !4302)
!4307 = !DILocation(line: 4629, column: 44, scope: !4302)
!4308 = !DILocation(line: 4629, column: 64, scope: !4302)
!4309 = !DILocation(line: 4629, column: 58, scope: !4302)
!4310 = !DILocation(line: 4629, column: 73, scope: !4302)
!4311 = !DILocation(line: 4629, column: 52, scope: !4302)
!4312 = !DILocation(line: 4629, column: 10, scope: !4302)
!4313 = !DILocation(line: 4629, column: 3, scope: !4302)
!4314 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac4", scope: !76, file: !76, line: 4649, type: !978, scopeLine: 4650, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4315 = !DILocalVariable(name: "x_value", arg: 1, scope: !4314, file: !76, line: 4649, type: !22)
!4316 = !DILocation(line: 4649, column: 29, scope: !4314)
!4317 = !DILocalVariable(name: "y_value", arg: 2, scope: !4314, file: !76, line: 4649, type: !17)
!4318 = !DILocation(line: 4649, column: 41, scope: !4314)
!4319 = !DILocation(line: 4651, column: 44, scope: !4314)
!4320 = !DILocation(line: 4651, column: 64, scope: !4314)
!4321 = !DILocation(line: 4651, column: 58, scope: !4314)
!4322 = !DILocation(line: 4651, column: 73, scope: !4314)
!4323 = !DILocation(line: 4651, column: 52, scope: !4314)
!4324 = !DILocation(line: 4651, column: 10, scope: !4314)
!4325 = !DILocation(line: 4651, column: 3, scope: !4314)
!4326 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac64", scope: !76, file: !76, line: 4671, type: !978, scopeLine: 4672, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4327 = !DILocalVariable(name: "x_value", arg: 1, scope: !4326, file: !76, line: 4671, type: !22)
!4328 = !DILocation(line: 4671, column: 30, scope: !4326)
!4329 = !DILocalVariable(name: "y_value", arg: 2, scope: !4326, file: !76, line: 4671, type: !17)
!4330 = !DILocation(line: 4671, column: 42, scope: !4326)
!4331 = !DILocation(line: 4673, column: 44, scope: !4326)
!4332 = !DILocation(line: 4673, column: 64, scope: !4326)
!4333 = !DILocation(line: 4673, column: 58, scope: !4326)
!4334 = !DILocation(line: 4673, column: 73, scope: !4326)
!4335 = !DILocation(line: 4673, column: 52, scope: !4326)
!4336 = !DILocation(line: 4673, column: 10, scope: !4326)
!4337 = !DILocation(line: 4673, column: 3, scope: !4326)
!4338 = distinct !DISubprogram(name: "u16_mul_u16_u8_fac8", scope: !76, file: !76, line: 4693, type: !978, scopeLine: 4694, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4339 = !DILocalVariable(name: "x_value", arg: 1, scope: !4338, file: !76, line: 4693, type: !22)
!4340 = !DILocation(line: 4693, column: 29, scope: !4338)
!4341 = !DILocalVariable(name: "y_value", arg: 2, scope: !4338, file: !76, line: 4693, type: !17)
!4342 = !DILocation(line: 4693, column: 41, scope: !4338)
!4343 = !DILocation(line: 4695, column: 44, scope: !4338)
!4344 = !DILocation(line: 4695, column: 64, scope: !4338)
!4345 = !DILocation(line: 4695, column: 58, scope: !4338)
!4346 = !DILocation(line: 4695, column: 73, scope: !4338)
!4347 = !DILocation(line: 4695, column: 52, scope: !4338)
!4348 = !DILocation(line: 4695, column: 10, scope: !4338)
!4349 = !DILocation(line: 4695, column: 3, scope: !4338)
!4350 = distinct !DISubprogram(name: "u32_mul_u32_s16_fac05", scope: !76, file: !76, line: 4717, type: !1507, scopeLine: 4718, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4351 = !DILocalVariable(name: "value", arg: 1, scope: !4350, file: !76, line: 4717, type: !740)
!4352 = !DILocation(line: 4717, column: 31, scope: !4350)
!4353 = !DILocalVariable(name: "factor", arg: 2, scope: !4350, file: !76, line: 4717, type: !13)
!4354 = !DILocation(line: 4717, column: 42, scope: !4350)
!4355 = !DILocation(line: 4719, column: 41, scope: !4350)
!4356 = !DILocation(line: 4719, column: 47, scope: !4350)
!4357 = !DILocation(line: 4719, column: 10, scope: !4350)
!4358 = !DILocation(line: 4719, column: 3, scope: !4350)
!4359 = distinct !DISubprogram(name: "root_u32_mul_u32_s16_fac_less1", scope: !76, file: !76, line: 5297, type: !4360, scopeLine: 5298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4360 = !DISubroutineType(types: !4361)
!4361 = !{!740, !740, !13, !740}
!4362 = !DILocalVariable(name: "value", arg: 1, scope: !4359, file: !76, line: 5297, type: !740)
!4363 = !DILocation(line: 5297, column: 40, scope: !4359)
!4364 = !DILocalVariable(name: "factor", arg: 2, scope: !4359, file: !76, line: 5297, type: !13)
!4365 = !DILocation(line: 5297, column: 50, scope: !4359)
!4366 = !DILocalVariable(name: "count", arg: 3, scope: !4359, file: !76, line: 5297, type: !740)
!4367 = !DILocation(line: 5297, column: 62, scope: !4359)
!4368 = !DILocalVariable(name: "u32Temp1", scope: !4359, file: !76, line: 5299, type: !740)
!4369 = !DILocation(line: 5299, column: 6, scope: !4359)
!4370 = !DILocalVariable(name: "u32Temp2", scope: !4359, file: !76, line: 5299, type: !740)
!4371 = !DILocation(line: 5299, column: 17, scope: !4359)
!4372 = !DILocalVariable(name: "u32Temp3", scope: !4359, file: !76, line: 5299, type: !740)
!4373 = !DILocation(line: 5299, column: 26, scope: !4359)
!4374 = !DILocalVariable(name: "u8SignBit", scope: !4359, file: !76, line: 5300, type: !17)
!4375 = !DILocation(line: 5300, column: 5, scope: !4359)
!4376 = !DILocation(line: 5302, column: 5, scope: !4377)
!4377 = distinct !DILexicalBlock(scope: !4359, file: !76, line: 5302, column: 5)
!4378 = !DILocation(line: 5302, column: 11, scope: !4377)
!4379 = !DILocation(line: 5302, column: 5, scope: !4359)
!4380 = !DILocation(line: 5304, column: 13, scope: !4381)
!4381 = distinct !DILexicalBlock(scope: !4377, file: !76, line: 5303, column: 2)
!4382 = !DILocation(line: 5305, column: 2, scope: !4381)
!4383 = !DILocation(line: 5308, column: 13, scope: !4384)
!4384 = distinct !DILexicalBlock(scope: !4377, file: !76, line: 5307, column: 2)
!4385 = !DILocation(line: 5312, column: 5, scope: !4386)
!4386 = distinct !DILexicalBlock(scope: !4359, file: !76, line: 5312, column: 5)
!4387 = !DILocation(line: 5312, column: 11, scope: !4386)
!4388 = !DILocation(line: 5312, column: 5, scope: !4359)
!4389 = !DILocation(line: 5314, column: 15, scope: !4390)
!4390 = distinct !DILexicalBlock(scope: !4386, file: !76, line: 5313, column: 2)
!4391 = !DILocation(line: 5314, column: 14, scope: !4390)
!4392 = !DILocation(line: 5314, column: 12, scope: !4390)
!4393 = !DILocation(line: 5315, column: 2, scope: !4390)
!4394 = !DILocation(line: 5318, column: 14, scope: !4395)
!4395 = distinct !DILexicalBlock(scope: !4386, file: !76, line: 5317, column: 2)
!4396 = !DILocation(line: 5318, column: 12, scope: !4395)
!4397 = !DILocation(line: 5321, column: 13, scope: !4359)
!4398 = !DILocation(line: 5321, column: 21, scope: !4359)
!4399 = !DILocation(line: 5321, column: 19, scope: !4359)
!4400 = !DILocation(line: 5321, column: 11, scope: !4359)
!4401 = !DILocation(line: 5322, column: 25, scope: !4359)
!4402 = !DILocation(line: 5322, column: 32, scope: !4359)
!4403 = !DILocation(line: 5322, column: 13, scope: !4359)
!4404 = !DILocation(line: 5322, column: 11, scope: !4359)
!4405 = !DILocation(line: 5323, column: 13, scope: !4359)
!4406 = !DILocation(line: 5323, column: 25, scope: !4359)
!4407 = !DILocation(line: 5323, column: 22, scope: !4359)
!4408 = !DILocation(line: 5323, column: 11, scope: !4359)
!4409 = !DILocation(line: 5324, column: 14, scope: !4359)
!4410 = !DILocation(line: 5324, column: 30, scope: !4359)
!4411 = !DILocation(line: 5324, column: 29, scope: !4359)
!4412 = !DILocation(line: 5324, column: 23, scope: !4359)
!4413 = !DILocation(line: 5324, column: 11, scope: !4359)
!4414 = !DILocation(line: 5325, column: 6, scope: !4415)
!4415 = distinct !DILexicalBlock(scope: !4359, file: !76, line: 5325, column: 5)
!4416 = !DILocation(line: 5325, column: 16, scope: !4415)
!4417 = !DILocation(line: 5325, column: 14, scope: !4415)
!4418 = !DILocation(line: 5325, column: 22, scope: !4415)
!4419 = !DILocation(line: 5325, column: 5, scope: !4359)
!4420 = !DILocation(line: 5327, column: 6, scope: !4421)
!4421 = distinct !DILexicalBlock(scope: !4422, file: !76, line: 5327, column: 6)
!4422 = distinct !DILexicalBlock(scope: !4415, file: !76, line: 5326, column: 2)
!4423 = !DILocation(line: 5327, column: 16, scope: !4421)
!4424 = !DILocation(line: 5327, column: 6, scope: !4422)
!4425 = !DILocation(line: 5329, column: 7, scope: !4426)
!4426 = distinct !DILexicalBlock(scope: !4427, file: !76, line: 5329, column: 7)
!4427 = distinct !DILexicalBlock(scope: !4421, file: !76, line: 5328, column: 3)
!4428 = !DILocation(line: 5329, column: 15, scope: !4426)
!4429 = !DILocation(line: 5329, column: 7, scope: !4427)
!4430 = !DILocation(line: 5330, column: 12, scope: !4426)
!4431 = !DILocation(line: 5330, column: 5, scope: !4426)
!4432 = !DILocation(line: 5332, column: 5, scope: !4426)
!4433 = !DILocation(line: 5336, column: 4, scope: !4434)
!4434 = distinct !DILexicalBlock(scope: !4421, file: !76, line: 5335, column: 3)
!4435 = !DILocation(line: 5341, column: 3, scope: !4436)
!4436 = distinct !DILexicalBlock(scope: !4415, file: !76, line: 5340, column: 2)
!4437 = !DILocation(line: 5343, column: 1, scope: !4359)
!4438 = distinct !DISubprogram(name: "u32_mul_u32_s32_fac05", scope: !76, file: !76, line: 4741, type: !1325, scopeLine: 4742, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4439 = !DILocalVariable(name: "value", arg: 1, scope: !4438, file: !76, line: 4741, type: !740)
!4440 = !DILocation(line: 4741, column: 31, scope: !4438)
!4441 = !DILocalVariable(name: "factor", arg: 2, scope: !4438, file: !76, line: 4741, type: !84)
!4442 = !DILocation(line: 4741, column: 42, scope: !4438)
!4443 = !DILocation(line: 4743, column: 41, scope: !4438)
!4444 = !DILocation(line: 4743, column: 47, scope: !4438)
!4445 = !DILocation(line: 4743, column: 10, scope: !4438)
!4446 = !DILocation(line: 4743, column: 3, scope: !4438)
!4447 = distinct !DISubprogram(name: "root_u32_mul_u32_s32_fac_less1", scope: !76, file: !76, line: 5361, type: !4448, scopeLine: 5362, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4448 = !DISubroutineType(types: !4449)
!4449 = !{!740, !740, !84, !740}
!4450 = !DILocalVariable(name: "value", arg: 1, scope: !4447, file: !76, line: 5361, type: !740)
!4451 = !DILocation(line: 5361, column: 40, scope: !4447)
!4452 = !DILocalVariable(name: "factor", arg: 2, scope: !4447, file: !76, line: 5361, type: !84)
!4453 = !DILocation(line: 5361, column: 51, scope: !4447)
!4454 = !DILocalVariable(name: "count", arg: 3, scope: !4447, file: !76, line: 5361, type: !740)
!4455 = !DILocation(line: 5361, column: 63, scope: !4447)
!4456 = !DILocalVariable(name: "u32Temp1", scope: !4447, file: !76, line: 5363, type: !740)
!4457 = !DILocation(line: 5363, column: 6, scope: !4447)
!4458 = !DILocalVariable(name: "u32Temp2", scope: !4447, file: !76, line: 5363, type: !740)
!4459 = !DILocation(line: 5363, column: 17, scope: !4447)
!4460 = !DILocalVariable(name: "u8SignBit", scope: !4447, file: !76, line: 5364, type: !17)
!4461 = !DILocation(line: 5364, column: 5, scope: !4447)
!4462 = !DILocation(line: 5366, column: 5, scope: !4463)
!4463 = distinct !DILexicalBlock(scope: !4447, file: !76, line: 5366, column: 5)
!4464 = !DILocation(line: 5366, column: 11, scope: !4463)
!4465 = !DILocation(line: 5366, column: 5, scope: !4447)
!4466 = !DILocation(line: 5368, column: 13, scope: !4467)
!4467 = distinct !DILexicalBlock(scope: !4463, file: !76, line: 5367, column: 2)
!4468 = !DILocation(line: 5369, column: 2, scope: !4467)
!4469 = !DILocation(line: 5372, column: 13, scope: !4470)
!4470 = distinct !DILexicalBlock(scope: !4463, file: !76, line: 5371, column: 2)
!4471 = !DILocation(line: 5376, column: 5, scope: !4472)
!4472 = distinct !DILexicalBlock(scope: !4447, file: !76, line: 5376, column: 5)
!4473 = !DILocation(line: 5376, column: 11, scope: !4472)
!4474 = !DILocation(line: 5376, column: 5, scope: !4447)
!4475 = !DILocation(line: 5378, column: 15, scope: !4476)
!4476 = distinct !DILexicalBlock(scope: !4472, file: !76, line: 5377, column: 2)
!4477 = !DILocation(line: 5378, column: 14, scope: !4476)
!4478 = !DILocation(line: 5378, column: 12, scope: !4476)
!4479 = !DILocation(line: 5379, column: 2, scope: !4476)
!4480 = !DILocation(line: 5382, column: 14, scope: !4481)
!4481 = distinct !DILexicalBlock(scope: !4472, file: !76, line: 5381, column: 2)
!4482 = !DILocation(line: 5382, column: 12, scope: !4481)
!4483 = !DILocation(line: 5385, column: 25, scope: !4447)
!4484 = !DILocation(line: 5385, column: 32, scope: !4447)
!4485 = !DILocation(line: 5385, column: 13, scope: !4447)
!4486 = !DILocation(line: 5385, column: 11, scope: !4447)
!4487 = !DILocation(line: 5386, column: 13, scope: !4447)
!4488 = !DILocation(line: 5386, column: 26, scope: !4447)
!4489 = !DILocation(line: 5386, column: 31, scope: !4447)
!4490 = !DILocation(line: 5386, column: 22, scope: !4447)
!4491 = !DILocation(line: 5386, column: 11, scope: !4447)
!4492 = !DILocation(line: 5387, column: 5, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4447, file: !76, line: 5387, column: 5)
!4494 = !DILocation(line: 5387, column: 15, scope: !4493)
!4495 = !DILocation(line: 5387, column: 5, scope: !4447)
!4496 = !DILocation(line: 5389, column: 10, scope: !4497)
!4497 = distinct !DILexicalBlock(scope: !4493, file: !76, line: 5388, column: 2)
!4498 = !DILocation(line: 5389, column: 3, scope: !4497)
!4499 = !DILocation(line: 5393, column: 3, scope: !4500)
!4500 = distinct !DILexicalBlock(scope: !4493, file: !76, line: 5392, column: 2)
!4501 = !DILocation(line: 5395, column: 1, scope: !4447)
!4502 = distinct !DISubprogram(name: "u32_mul_u32_s8_fac05", scope: !76, file: !76, line: 4765, type: !3122, scopeLine: 4766, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4503 = !DILocalVariable(name: "value", arg: 1, scope: !4502, file: !76, line: 4765, type: !740)
!4504 = !DILocation(line: 4765, column: 30, scope: !4502)
!4505 = !DILocalVariable(name: "factor", arg: 2, scope: !4502, file: !76, line: 4765, type: !6)
!4506 = !DILocation(line: 4765, column: 40, scope: !4502)
!4507 = !DILocation(line: 4767, column: 40, scope: !4502)
!4508 = !DILocation(line: 4767, column: 46, scope: !4502)
!4509 = !DILocation(line: 4767, column: 10, scope: !4502)
!4510 = !DILocation(line: 4767, column: 3, scope: !4502)
!4511 = distinct !DISubprogram(name: "root_u32_mul_u32_s8_fac_less1", scope: !76, file: !76, line: 5439, type: !4512, scopeLine: 5440, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4512 = !DISubroutineType(types: !4513)
!4513 = !{!740, !740, !6, !740}
!4514 = !DILocalVariable(name: "value", arg: 1, scope: !4511, file: !76, line: 5439, type: !740)
!4515 = !DILocation(line: 5439, column: 39, scope: !4511)
!4516 = !DILocalVariable(name: "factor", arg: 2, scope: !4511, file: !76, line: 5439, type: !6)
!4517 = !DILocation(line: 5439, column: 49, scope: !4511)
!4518 = !DILocalVariable(name: "count", arg: 3, scope: !4511, file: !76, line: 5439, type: !740)
!4519 = !DILocation(line: 5439, column: 61, scope: !4511)
!4520 = !DILocalVariable(name: "u32Temp1", scope: !4511, file: !76, line: 5441, type: !740)
!4521 = !DILocation(line: 5441, column: 6, scope: !4511)
!4522 = !DILocalVariable(name: "u32Temp2", scope: !4511, file: !76, line: 5441, type: !740)
!4523 = !DILocation(line: 5441, column: 17, scope: !4511)
!4524 = !DILocalVariable(name: "u32Temp3", scope: !4511, file: !76, line: 5441, type: !740)
!4525 = !DILocation(line: 5441, column: 26, scope: !4511)
!4526 = !DILocalVariable(name: "u8SignBit", scope: !4511, file: !76, line: 5442, type: !17)
!4527 = !DILocation(line: 5442, column: 5, scope: !4511)
!4528 = !DILocation(line: 5444, column: 5, scope: !4529)
!4529 = distinct !DILexicalBlock(scope: !4511, file: !76, line: 5444, column: 5)
!4530 = !DILocation(line: 5444, column: 11, scope: !4529)
!4531 = !DILocation(line: 5444, column: 5, scope: !4511)
!4532 = !DILocation(line: 5446, column: 13, scope: !4533)
!4533 = distinct !DILexicalBlock(scope: !4529, file: !76, line: 5445, column: 2)
!4534 = !DILocation(line: 5447, column: 2, scope: !4533)
!4535 = !DILocation(line: 5450, column: 13, scope: !4536)
!4536 = distinct !DILexicalBlock(scope: !4529, file: !76, line: 5449, column: 2)
!4537 = !DILocation(line: 5454, column: 5, scope: !4538)
!4538 = distinct !DILexicalBlock(scope: !4511, file: !76, line: 5454, column: 5)
!4539 = !DILocation(line: 5454, column: 11, scope: !4538)
!4540 = !DILocation(line: 5454, column: 5, scope: !4511)
!4541 = !DILocation(line: 5456, column: 15, scope: !4542)
!4542 = distinct !DILexicalBlock(scope: !4538, file: !76, line: 5455, column: 2)
!4543 = !DILocation(line: 5456, column: 14, scope: !4542)
!4544 = !DILocation(line: 5456, column: 12, scope: !4542)
!4545 = !DILocation(line: 5457, column: 2, scope: !4542)
!4546 = !DILocation(line: 5460, column: 14, scope: !4547)
!4547 = distinct !DILexicalBlock(scope: !4538, file: !76, line: 5459, column: 2)
!4548 = !DILocation(line: 5460, column: 12, scope: !4547)
!4549 = !DILocation(line: 5463, column: 13, scope: !4511)
!4550 = !DILocation(line: 5463, column: 21, scope: !4511)
!4551 = !DILocation(line: 5463, column: 19, scope: !4511)
!4552 = !DILocation(line: 5463, column: 11, scope: !4511)
!4553 = !DILocation(line: 5464, column: 25, scope: !4511)
!4554 = !DILocation(line: 5464, column: 32, scope: !4511)
!4555 = !DILocation(line: 5464, column: 13, scope: !4511)
!4556 = !DILocation(line: 5464, column: 11, scope: !4511)
!4557 = !DILocation(line: 5465, column: 13, scope: !4511)
!4558 = !DILocation(line: 5465, column: 25, scope: !4511)
!4559 = !DILocation(line: 5465, column: 22, scope: !4511)
!4560 = !DILocation(line: 5465, column: 11, scope: !4511)
!4561 = !DILocation(line: 5466, column: 14, scope: !4511)
!4562 = !DILocation(line: 5466, column: 30, scope: !4511)
!4563 = !DILocation(line: 5466, column: 29, scope: !4511)
!4564 = !DILocation(line: 5466, column: 23, scope: !4511)
!4565 = !DILocation(line: 5466, column: 11, scope: !4511)
!4566 = !DILocation(line: 5467, column: 6, scope: !4567)
!4567 = distinct !DILexicalBlock(scope: !4511, file: !76, line: 5467, column: 5)
!4568 = !DILocation(line: 5467, column: 16, scope: !4567)
!4569 = !DILocation(line: 5467, column: 14, scope: !4567)
!4570 = !DILocation(line: 5467, column: 22, scope: !4567)
!4571 = !DILocation(line: 5467, column: 5, scope: !4511)
!4572 = !DILocation(line: 5469, column: 6, scope: !4573)
!4573 = distinct !DILexicalBlock(scope: !4574, file: !76, line: 5469, column: 6)
!4574 = distinct !DILexicalBlock(scope: !4567, file: !76, line: 5468, column: 2)
!4575 = !DILocation(line: 5469, column: 16, scope: !4573)
!4576 = !DILocation(line: 5469, column: 6, scope: !4574)
!4577 = !DILocation(line: 5471, column: 7, scope: !4578)
!4578 = distinct !DILexicalBlock(scope: !4579, file: !76, line: 5471, column: 7)
!4579 = distinct !DILexicalBlock(scope: !4573, file: !76, line: 5470, column: 3)
!4580 = !DILocation(line: 5471, column: 15, scope: !4578)
!4581 = !DILocation(line: 5471, column: 7, scope: !4579)
!4582 = !DILocation(line: 5472, column: 12, scope: !4578)
!4583 = !DILocation(line: 5472, column: 5, scope: !4578)
!4584 = !DILocation(line: 5474, column: 5, scope: !4578)
!4585 = !DILocation(line: 5478, column: 4, scope: !4586)
!4586 = distinct !DILexicalBlock(scope: !4573, file: !76, line: 5477, column: 3)
!4587 = !DILocation(line: 5483, column: 3, scope: !4588)
!4588 = distinct !DILexicalBlock(scope: !4567, file: !76, line: 5482, column: 2)
!4589 = !DILocation(line: 5485, column: 1, scope: !4511)
!4590 = distinct !DISubprogram(name: "u32_mul_u32_u16_fac05", scope: !76, file: !76, line: 4789, type: !1121, scopeLine: 4790, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4591 = !DILocalVariable(name: "value", arg: 1, scope: !4590, file: !76, line: 4789, type: !740)
!4592 = !DILocation(line: 4789, column: 31, scope: !4590)
!4593 = !DILocalVariable(name: "factor", arg: 2, scope: !4590, file: !76, line: 4789, type: !22)
!4594 = !DILocation(line: 4789, column: 42, scope: !4590)
!4595 = !DILocation(line: 4791, column: 41, scope: !4590)
!4596 = !DILocation(line: 4791, column: 47, scope: !4590)
!4597 = !DILocation(line: 4791, column: 10, scope: !4590)
!4598 = !DILocation(line: 4791, column: 3, scope: !4590)
!4599 = distinct !DISubprogram(name: "u32_mul_u32_u32_fac05", scope: !76, file: !76, line: 4813, type: !1416, scopeLine: 4814, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4600 = !DILocalVariable(name: "value", arg: 1, scope: !4599, file: !76, line: 4813, type: !740)
!4601 = !DILocation(line: 4813, column: 31, scope: !4599)
!4602 = !DILocalVariable(name: "factor", arg: 2, scope: !4599, file: !76, line: 4813, type: !740)
!4603 = !DILocation(line: 4813, column: 42, scope: !4599)
!4604 = !DILocation(line: 4815, column: 41, scope: !4599)
!4605 = !DILocation(line: 4815, column: 47, scope: !4599)
!4606 = !DILocation(line: 4815, column: 10, scope: !4599)
!4607 = !DILocation(line: 4815, column: 3, scope: !4599)
!4608 = distinct !DISubprogram(name: "root_u32_mul_u32_u32_fac_less1", scope: !76, file: !76, line: 5412, type: !4609, scopeLine: 5413, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4609 = !DISubroutineType(types: !4610)
!4610 = !{!740, !740, !740, !740}
!4611 = !DILocalVariable(name: "value", arg: 1, scope: !4608, file: !76, line: 5412, type: !740)
!4612 = !DILocation(line: 5412, column: 40, scope: !4608)
!4613 = !DILocalVariable(name: "factor", arg: 2, scope: !4608, file: !76, line: 5412, type: !740)
!4614 = !DILocation(line: 5412, column: 50, scope: !4608)
!4615 = !DILocalVariable(name: "count", arg: 3, scope: !4608, file: !76, line: 5412, type: !740)
!4616 = !DILocation(line: 5412, column: 62, scope: !4608)
!4617 = !DILocalVariable(name: "u32Temp1", scope: !4608, file: !76, line: 5414, type: !740)
!4618 = !DILocation(line: 5414, column: 6, scope: !4608)
!4619 = !DILocalVariable(name: "u32Temp2", scope: !4608, file: !76, line: 5414, type: !740)
!4620 = !DILocation(line: 5414, column: 17, scope: !4608)
!4621 = !DILocalVariable(name: "u32Temp3", scope: !4608, file: !76, line: 5414, type: !740)
!4622 = !DILocation(line: 5414, column: 26, scope: !4608)
!4623 = !DILocalVariable(name: "u32Temp4", scope: !4608, file: !76, line: 5414, type: !740)
!4624 = !DILocation(line: 5414, column: 35, scope: !4608)
!4625 = !DILocalVariable(name: "u8SignBit", scope: !4608, file: !76, line: 5415, type: !17)
!4626 = !DILocation(line: 5415, column: 5, scope: !4608)
!4627 = !DILocation(line: 5417, column: 25, scope: !4608)
!4628 = !DILocation(line: 5417, column: 32, scope: !4608)
!4629 = !DILocation(line: 5417, column: 13, scope: !4608)
!4630 = !DILocation(line: 5417, column: 11, scope: !4608)
!4631 = !DILocation(line: 5418, column: 13, scope: !4608)
!4632 = !DILocation(line: 5418, column: 26, scope: !4608)
!4633 = !DILocation(line: 5418, column: 31, scope: !4608)
!4634 = !DILocation(line: 5418, column: 22, scope: !4608)
!4635 = !DILocation(line: 5418, column: 11, scope: !4608)
!4636 = !DILocation(line: 5419, column: 9, scope: !4608)
!4637 = !DILocation(line: 5419, column: 2, scope: !4608)
!4638 = distinct !DISubprogram(name: "u32_mul_u32_u8_fac05", scope: !76, file: !76, line: 4837, type: !3061, scopeLine: 4838, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4639 = !DILocalVariable(name: "value", arg: 1, scope: !4638, file: !76, line: 4837, type: !740)
!4640 = !DILocation(line: 4837, column: 30, scope: !4638)
!4641 = !DILocalVariable(name: "factor", arg: 2, scope: !4638, file: !76, line: 4837, type: !17)
!4642 = !DILocation(line: 4837, column: 40, scope: !4638)
!4643 = !DILocation(line: 4839, column: 40, scope: !4638)
!4644 = !DILocation(line: 4839, column: 46, scope: !4638)
!4645 = !DILocation(line: 4839, column: 10, scope: !4638)
!4646 = !DILocation(line: 4839, column: 3, scope: !4638)
!4647 = distinct !DISubprogram(name: "root_u32_mul_u32_u8_fac_less1", scope: !76, file: !76, line: 5503, type: !4648, scopeLine: 5504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4648 = !DISubroutineType(types: !4649)
!4649 = !{!740, !740, !17, !740}
!4650 = !DILocalVariable(name: "value", arg: 1, scope: !4647, file: !76, line: 5503, type: !740)
!4651 = !DILocation(line: 5503, column: 39, scope: !4647)
!4652 = !DILocalVariable(name: "factor", arg: 2, scope: !4647, file: !76, line: 5503, type: !17)
!4653 = !DILocation(line: 5503, column: 49, scope: !4647)
!4654 = !DILocalVariable(name: "count", arg: 3, scope: !4647, file: !76, line: 5503, type: !740)
!4655 = !DILocation(line: 5503, column: 61, scope: !4647)
!4656 = !DILocalVariable(name: "u32Temp1", scope: !4647, file: !76, line: 5505, type: !740)
!4657 = !DILocation(line: 5505, column: 6, scope: !4647)
!4658 = !DILocalVariable(name: "u32Temp2", scope: !4647, file: !76, line: 5505, type: !740)
!4659 = !DILocation(line: 5505, column: 17, scope: !4647)
!4660 = !DILocation(line: 5507, column: 13, scope: !4647)
!4661 = !DILocation(line: 5507, column: 21, scope: !4647)
!4662 = !DILocation(line: 5507, column: 19, scope: !4647)
!4663 = !DILocation(line: 5507, column: 11, scope: !4647)
!4664 = !DILocation(line: 5508, column: 25, scope: !4647)
!4665 = !DILocation(line: 5508, column: 32, scope: !4647)
!4666 = !DILocation(line: 5508, column: 13, scope: !4647)
!4667 = !DILocation(line: 5508, column: 11, scope: !4647)
!4668 = !DILocation(line: 5509, column: 13, scope: !4647)
!4669 = !DILocation(line: 5509, column: 25, scope: !4647)
!4670 = !DILocation(line: 5509, column: 22, scope: !4647)
!4671 = !DILocation(line: 5509, column: 11, scope: !4647)
!4672 = !DILocation(line: 5510, column: 14, scope: !4647)
!4673 = !DILocation(line: 5510, column: 30, scope: !4647)
!4674 = !DILocation(line: 5510, column: 29, scope: !4647)
!4675 = !DILocation(line: 5510, column: 23, scope: !4647)
!4676 = !DILocation(line: 5510, column: 11, scope: !4647)
!4677 = !DILocation(line: 5511, column: 6, scope: !4678)
!4678 = distinct !DILexicalBlock(scope: !4647, file: !76, line: 5511, column: 5)
!4679 = !DILocation(line: 5511, column: 16, scope: !4678)
!4680 = !DILocation(line: 5511, column: 14, scope: !4678)
!4681 = !DILocation(line: 5511, column: 22, scope: !4678)
!4682 = !DILocation(line: 5511, column: 5, scope: !4647)
!4683 = !DILocation(line: 5513, column: 6, scope: !4684)
!4684 = distinct !DILexicalBlock(scope: !4685, file: !76, line: 5513, column: 6)
!4685 = distinct !DILexicalBlock(scope: !4678, file: !76, line: 5512, column: 2)
!4686 = !DILocation(line: 5513, column: 14, scope: !4684)
!4687 = !DILocation(line: 5513, column: 6, scope: !4685)
!4688 = !DILocation(line: 5514, column: 11, scope: !4684)
!4689 = !DILocation(line: 5514, column: 4, scope: !4684)
!4690 = !DILocation(line: 5516, column: 4, scope: !4684)
!4691 = !DILocation(line: 5520, column: 3, scope: !4692)
!4692 = distinct !DILexicalBlock(scope: !4678, file: !76, line: 5519, column: 2)
!4693 = !DILocation(line: 5522, column: 1, scope: !4647)
!4694 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac0125", scope: !76, file: !76, line: 4860, type: !889, scopeLine: 4861, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4695 = !DILocalVariable(name: "value", arg: 1, scope: !4694, file: !76, line: 4860, type: !17)
!4696 = !DILocation(line: 4860, column: 28, scope: !4694)
!4697 = !DILocalVariable(name: "factor", arg: 2, scope: !4694, file: !76, line: 4860, type: !17)
!4698 = !DILocation(line: 4860, column: 38, scope: !4694)
!4699 = !DILocation(line: 4862, column: 38, scope: !4694)
!4700 = !DILocation(line: 4862, column: 44, scope: !4694)
!4701 = !DILocation(line: 4862, column: 10, scope: !4694)
!4702 = !DILocation(line: 4862, column: 3, scope: !4694)
!4703 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac025", scope: !76, file: !76, line: 4883, type: !889, scopeLine: 4884, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4704 = !DILocalVariable(name: "value", arg: 1, scope: !4703, file: !76, line: 4883, type: !17)
!4705 = !DILocation(line: 4883, column: 28, scope: !4703)
!4706 = !DILocalVariable(name: "factor", arg: 2, scope: !4703, file: !76, line: 4883, type: !17)
!4707 = !DILocation(line: 4883, column: 38, scope: !4703)
!4708 = !DILocation(line: 4885, column: 38, scope: !4703)
!4709 = !DILocation(line: 4885, column: 44, scope: !4703)
!4710 = !DILocation(line: 4885, column: 10, scope: !4703)
!4711 = !DILocation(line: 4885, column: 3, scope: !4703)
!4712 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac05", scope: !76, file: !76, line: 4907, type: !889, scopeLine: 4908, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4713 = !DILocalVariable(name: "value", arg: 1, scope: !4712, file: !76, line: 4907, type: !17)
!4714 = !DILocation(line: 4907, column: 26, scope: !4712)
!4715 = !DILocalVariable(name: "factor", arg: 2, scope: !4712, file: !76, line: 4907, type: !17)
!4716 = !DILocation(line: 4907, column: 36, scope: !4712)
!4717 = !DILocation(line: 4909, column: 38, scope: !4712)
!4718 = !DILocation(line: 4909, column: 44, scope: !4712)
!4719 = !DILocation(line: 4909, column: 10, scope: !4712)
!4720 = !DILocation(line: 4909, column: 3, scope: !4712)
!4721 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac128", scope: !76, file: !76, line: 4931, type: !889, scopeLine: 4932, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4722 = !DILocalVariable(name: "value", arg: 1, scope: !4721, file: !76, line: 4931, type: !17)
!4723 = !DILocation(line: 4931, column: 28, scope: !4721)
!4724 = !DILocalVariable(name: "factor", arg: 2, scope: !4721, file: !76, line: 4931, type: !17)
!4725 = !DILocation(line: 4931, column: 38, scope: !4721)
!4726 = !DILocation(line: 4933, column: 41, scope: !4721)
!4727 = !DILocation(line: 4933, column: 47, scope: !4721)
!4728 = !DILocation(line: 4933, column: 10, scope: !4721)
!4729 = !DILocation(line: 4933, column: 3, scope: !4721)
!4730 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac16", scope: !76, file: !76, line: 4955, type: !889, scopeLine: 4956, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4731 = !DILocalVariable(name: "value", arg: 1, scope: !4730, file: !76, line: 4955, type: !17)
!4732 = !DILocation(line: 4955, column: 26, scope: !4730)
!4733 = !DILocalVariable(name: "factor", arg: 2, scope: !4730, file: !76, line: 4955, type: !17)
!4734 = !DILocation(line: 4955, column: 36, scope: !4730)
!4735 = !DILocation(line: 4957, column: 41, scope: !4730)
!4736 = !DILocation(line: 4957, column: 47, scope: !4730)
!4737 = !DILocation(line: 4957, column: 10, scope: !4730)
!4738 = !DILocation(line: 4957, column: 3, scope: !4730)
!4739 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac32", scope: !76, file: !76, line: 4978, type: !889, scopeLine: 4979, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4740 = !DILocalVariable(name: "value", arg: 1, scope: !4739, file: !76, line: 4978, type: !17)
!4741 = !DILocation(line: 4978, column: 26, scope: !4739)
!4742 = !DILocalVariable(name: "factor", arg: 2, scope: !4739, file: !76, line: 4978, type: !17)
!4743 = !DILocation(line: 4978, column: 36, scope: !4739)
!4744 = !DILocation(line: 4980, column: 41, scope: !4739)
!4745 = !DILocation(line: 4980, column: 47, scope: !4739)
!4746 = !DILocation(line: 4980, column: 10, scope: !4739)
!4747 = !DILocation(line: 4980, column: 3, scope: !4739)
!4748 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac4", scope: !76, file: !76, line: 5001, type: !889, scopeLine: 5002, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4749 = !DILocalVariable(name: "value", arg: 1, scope: !4748, file: !76, line: 5001, type: !17)
!4750 = !DILocation(line: 5001, column: 25, scope: !4748)
!4751 = !DILocalVariable(name: "factor", arg: 2, scope: !4748, file: !76, line: 5001, type: !17)
!4752 = !DILocation(line: 5001, column: 35, scope: !4748)
!4753 = !DILocation(line: 5003, column: 41, scope: !4748)
!4754 = !DILocation(line: 5003, column: 47, scope: !4748)
!4755 = !DILocation(line: 5003, column: 10, scope: !4748)
!4756 = !DILocation(line: 5003, column: 3, scope: !4748)
!4757 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac64", scope: !76, file: !76, line: 5024, type: !889, scopeLine: 5025, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4758 = !DILocalVariable(name: "value", arg: 1, scope: !4757, file: !76, line: 5024, type: !17)
!4759 = !DILocation(line: 5024, column: 26, scope: !4757)
!4760 = !DILocalVariable(name: "factor", arg: 2, scope: !4757, file: !76, line: 5024, type: !17)
!4761 = !DILocation(line: 5024, column: 35, scope: !4757)
!4762 = !DILocation(line: 5026, column: 41, scope: !4757)
!4763 = !DILocation(line: 5026, column: 47, scope: !4757)
!4764 = !DILocation(line: 5026, column: 10, scope: !4757)
!4765 = !DILocation(line: 5026, column: 3, scope: !4757)
!4766 = distinct !DISubprogram(name: "u8_mul_u8_u8_fac8", scope: !76, file: !76, line: 5047, type: !889, scopeLine: 5048, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!4767 = !DILocalVariable(name: "value", arg: 1, scope: !4766, file: !76, line: 5047, type: !17)
!4768 = !DILocation(line: 5047, column: 25, scope: !4766)
!4769 = !DILocalVariable(name: "factor", arg: 2, scope: !4766, file: !76, line: 5047, type: !17)
!4770 = !DILocation(line: 5047, column: 35, scope: !4766)
!4771 = !DILocation(line: 5049, column: 41, scope: !4766)
!4772 = !DILocation(line: 5049, column: 47, scope: !4766)
!4773 = !DILocation(line: 5049, column: 10, scope: !4766)
!4774 = !DILocation(line: 5049, column: 3, scope: !4766)
!4775 = distinct !DISubprogram(name: "MulHighWord", scope: !4776, file: !4776, line: 39, type: !1416, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4776 = !DIFile(filename: "src_analysis/sources/MulHword.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_mul_s32_s32_fac_twopow_u8/alarm_0115")
!4777 = !DILocalVariable(name: "arg1", arg: 1, scope: !4775, file: !4776, line: 39, type: !740)
!4778 = !DILocation(line: 39, column: 30, scope: !4775)
!4779 = !DILocalVariable(name: "arg2", arg: 2, scope: !4775, file: !4776, line: 39, type: !740)
!4780 = !DILocation(line: 39, column: 48, scope: !4775)
!4781 = !DILocalVariable(name: "arg1_LW", scope: !4775, file: !4776, line: 41, type: !22)
!4782 = !DILocation(line: 41, column: 6, scope: !4775)
!4783 = !DILocalVariable(name: "arg1_HW", scope: !4775, file: !4776, line: 41, type: !22)
!4784 = !DILocation(line: 41, column: 14, scope: !4775)
!4785 = !DILocalVariable(name: "arg2_LW", scope: !4775, file: !4776, line: 41, type: !22)
!4786 = !DILocation(line: 41, column: 22, scope: !4775)
!4787 = !DILocalVariable(name: "arg2_HW", scope: !4775, file: !4776, line: 41, type: !22)
!4788 = !DILocation(line: 41, column: 30, scope: !4775)
!4789 = !DILocalVariable(name: "MulTemp1", scope: !4775, file: !4776, line: 42, type: !740)
!4790 = !DILocation(line: 42, column: 6, scope: !4775)
!4791 = !DILocalVariable(name: "MulTemp2", scope: !4775, file: !4776, line: 42, type: !740)
!4792 = !DILocation(line: 42, column: 16, scope: !4775)
!4793 = !DILocalVariable(name: "MulTemp3", scope: !4775, file: !4776, line: 42, type: !740)
!4794 = !DILocation(line: 42, column: 26, scope: !4775)
!4795 = !DILocalVariable(name: "MulTemp4", scope: !4775, file: !4776, line: 42, type: !740)
!4796 = !DILocation(line: 42, column: 36, scope: !4775)
!4797 = !DILocalVariable(name: "HIGHWORD", scope: !4775, file: !4776, line: 42, type: !740)
!4798 = !DILocation(line: 42, column: 47, scope: !4775)
!4799 = !DILocalVariable(name: "OverFlow", scope: !4775, file: !4776, line: 42, type: !740)
!4800 = !DILocation(line: 42, column: 57, scope: !4775)
!4801 = !DILocation(line: 43, column: 12, scope: !4775)
!4802 = !DILocation(line: 43, column: 17, scope: !4775)
!4803 = !DILocation(line: 43, column: 10, scope: !4775)
!4804 = !DILocation(line: 44, column: 13, scope: !4775)
!4805 = !DILocation(line: 44, column: 18, scope: !4775)
!4806 = !DILocation(line: 44, column: 31, scope: !4775)
!4807 = !DILocation(line: 44, column: 12, scope: !4775)
!4808 = !DILocation(line: 44, column: 10, scope: !4775)
!4809 = !DILocation(line: 45, column: 12, scope: !4775)
!4810 = !DILocation(line: 45, column: 17, scope: !4775)
!4811 = !DILocation(line: 45, column: 10, scope: !4775)
!4812 = !DILocation(line: 46, column: 13, scope: !4775)
!4813 = !DILocation(line: 46, column: 18, scope: !4775)
!4814 = !DILocation(line: 46, column: 31, scope: !4775)
!4815 = !DILocation(line: 46, column: 12, scope: !4775)
!4816 = !DILocation(line: 46, column: 10, scope: !4775)
!4817 = !DILocation(line: 48, column: 48, scope: !4818)
!4818 = distinct !DILexicalBlock(scope: !4775, file: !4776, line: 48, column: 6)
!4819 = !DILocation(line: 48, column: 43, scope: !4818)
!4820 = !DILocation(line: 48, column: 33, scope: !4818)
!4821 = !DILocation(line: 48, column: 73, scope: !4818)
!4822 = !DILocation(line: 48, column: 68, scope: !4818)
!4823 = !DILocation(line: 48, column: 58, scope: !4818)
!4824 = !DILocation(line: 48, column: 8, scope: !4818)
!4825 = !DILocation(line: 48, column: 6, scope: !4775)
!4826 = !DILocation(line: 49, column: 6, scope: !4827)
!4827 = distinct !DILexicalBlock(scope: !4818, file: !4776, line: 48, column: 85)
!4828 = !DILocation(line: 51, column: 13, scope: !4775)
!4829 = !DILocation(line: 51, column: 23, scope: !4775)
!4830 = !DILocation(line: 51, column: 21, scope: !4775)
!4831 = !DILocation(line: 51, column: 11, scope: !4775)
!4832 = !DILocation(line: 52, column: 13, scope: !4775)
!4833 = !DILocation(line: 52, column: 23, scope: !4775)
!4834 = !DILocation(line: 52, column: 21, scope: !4775)
!4835 = !DILocation(line: 52, column: 11, scope: !4775)
!4836 = !DILocation(line: 53, column: 13, scope: !4775)
!4837 = !DILocation(line: 53, column: 23, scope: !4775)
!4838 = !DILocation(line: 53, column: 21, scope: !4775)
!4839 = !DILocation(line: 53, column: 11, scope: !4775)
!4840 = !DILocation(line: 54, column: 13, scope: !4775)
!4841 = !DILocation(line: 54, column: 23, scope: !4775)
!4842 = !DILocation(line: 54, column: 21, scope: !4775)
!4843 = !DILocation(line: 54, column: 11, scope: !4775)
!4844 = !DILocation(line: 56, column: 14, scope: !4775)
!4845 = !DILocation(line: 56, column: 23, scope: !4775)
!4846 = !DILocation(line: 56, column: 33, scope: !4775)
!4847 = !DILocation(line: 56, column: 42, scope: !4775)
!4848 = !DILocation(line: 56, column: 30, scope: !4775)
!4849 = !DILocation(line: 56, column: 51, scope: !4775)
!4850 = !DILocation(line: 56, column: 49, scope: !4775)
!4851 = !DILocation(line: 56, column: 11, scope: !4775)
!4852 = !DILocation(line: 57, column: 14, scope: !4775)
!4853 = !DILocation(line: 57, column: 22, scope: !4775)
!4854 = !DILocation(line: 57, column: 31, scope: !4775)
!4855 = !DILocation(line: 57, column: 40, scope: !4775)
!4856 = !DILocation(line: 57, column: 28, scope: !4775)
!4857 = !DILocation(line: 57, column: 53, scope: !4775)
!4858 = !DILocation(line: 57, column: 62, scope: !4775)
!4859 = !DILocation(line: 57, column: 50, scope: !4775)
!4860 = !DILocation(line: 57, column: 11, scope: !4775)
!4861 = !DILocation(line: 58, column: 6, scope: !4862)
!4862 = distinct !DILexicalBlock(scope: !4775, file: !4776, line: 58, column: 6)
!4863 = !DILocation(line: 58, column: 15, scope: !4862)
!4864 = !DILocation(line: 58, column: 6, scope: !4775)
!4865 = !DILocation(line: 60, column: 10, scope: !4866)
!4866 = distinct !DILexicalBlock(scope: !4862, file: !4776, line: 59, column: 2)
!4867 = !DILocation(line: 60, column: 22, scope: !4866)
!4868 = !DILocation(line: 60, column: 30, scope: !4866)
!4869 = !DILocation(line: 60, column: 19, scope: !4866)
!4870 = !DILocation(line: 60, column: 3, scope: !4866)
!4871 = !DILocation(line: 64, column: 10, scope: !4872)
!4872 = distinct !DILexicalBlock(scope: !4862, file: !4776, line: 63, column: 2)
!4873 = !DILocation(line: 64, column: 3, scope: !4872)
!4874 = !DILocation(line: 66, column: 1, scope: !4775)
!4875 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !4876, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4876 = !DISubroutineType(types: !4877)
!4877 = !{!37, !26, !26}
!4878 = !DILocalVariable(name: "left", arg: 1, scope: !4875, file: !30, line: 78, type: !26)
!4879 = !DILocation(line: 78, column: 38, scope: !4875)
!4880 = !DILocalVariable(name: "right", arg: 2, scope: !4875, file: !30, line: 78, type: !26)
!4881 = !DILocation(line: 78, column: 52, scope: !4875)
!4882 = !DILocation(line: 80, column: 12, scope: !4875)
!4883 = !DILocation(line: 80, column: 19, scope: !4875)
!4884 = !DILocation(line: 80, column: 17, scope: !4875)
!4885 = !DILocation(line: 80, column: 25, scope: !4875)
!4886 = !DILocation(line: 80, column: 5, scope: !4875)
!4887 = distinct !DISubprogram(name: "MulLowWord", scope: !4776, file: !4776, line: 82, type: !1416, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !34, retainedNodes: !4)
!4888 = !DILocalVariable(name: "arg1", arg: 1, scope: !4887, file: !4776, line: 82, type: !740)
!4889 = !DILocation(line: 82, column: 29, scope: !4887)
!4890 = !DILocalVariable(name: "arg2", arg: 2, scope: !4887, file: !4776, line: 82, type: !740)
!4891 = !DILocation(line: 82, column: 47, scope: !4887)
!4892 = !DILocalVariable(name: "arg1_LW", scope: !4887, file: !4776, line: 84, type: !22)
!4893 = !DILocation(line: 84, column: 6, scope: !4887)
!4894 = !DILocalVariable(name: "arg1_HW", scope: !4887, file: !4776, line: 84, type: !22)
!4895 = !DILocation(line: 84, column: 14, scope: !4887)
!4896 = !DILocalVariable(name: "arg2_LW", scope: !4887, file: !4776, line: 84, type: !22)
!4897 = !DILocation(line: 84, column: 22, scope: !4887)
!4898 = !DILocalVariable(name: "arg2_HW", scope: !4887, file: !4776, line: 84, type: !22)
!4899 = !DILocation(line: 84, column: 30, scope: !4887)
!4900 = !DILocalVariable(name: "MulTemp1", scope: !4887, file: !4776, line: 85, type: !740)
!4901 = !DILocation(line: 85, column: 6, scope: !4887)
!4902 = !DILocalVariable(name: "MulTemp2", scope: !4887, file: !4776, line: 85, type: !740)
!4903 = !DILocation(line: 85, column: 16, scope: !4887)
!4904 = !DILocalVariable(name: "MulTemp3", scope: !4887, file: !4776, line: 85, type: !740)
!4905 = !DILocation(line: 85, column: 26, scope: !4887)
!4906 = !DILocalVariable(name: "MulTemp4", scope: !4887, file: !4776, line: 85, type: !740)
!4907 = !DILocation(line: 85, column: 36, scope: !4887)
!4908 = !DILocalVariable(name: "HIGHWORD", scope: !4887, file: !4776, line: 85, type: !740)
!4909 = !DILocation(line: 85, column: 47, scope: !4887)
!4910 = !DILocalVariable(name: "OverFlow", scope: !4887, file: !4776, line: 85, type: !740)
!4911 = !DILocation(line: 85, column: 57, scope: !4887)
!4912 = !DILocation(line: 86, column: 12, scope: !4887)
!4913 = !DILocation(line: 86, column: 17, scope: !4887)
!4914 = !DILocation(line: 86, column: 10, scope: !4887)
!4915 = !DILocation(line: 87, column: 13, scope: !4887)
!4916 = !DILocation(line: 87, column: 18, scope: !4887)
!4917 = !DILocation(line: 87, column: 31, scope: !4887)
!4918 = !DILocation(line: 87, column: 12, scope: !4887)
!4919 = !DILocation(line: 87, column: 10, scope: !4887)
!4920 = !DILocation(line: 88, column: 12, scope: !4887)
!4921 = !DILocation(line: 88, column: 17, scope: !4887)
!4922 = !DILocation(line: 88, column: 10, scope: !4887)
!4923 = !DILocation(line: 89, column: 13, scope: !4887)
!4924 = !DILocation(line: 89, column: 18, scope: !4887)
!4925 = !DILocation(line: 89, column: 31, scope: !4887)
!4926 = !DILocation(line: 89, column: 12, scope: !4887)
!4927 = !DILocation(line: 89, column: 10, scope: !4887)
!4928 = !DILocation(line: 90, column: 13, scope: !4887)
!4929 = !DILocation(line: 90, column: 23, scope: !4887)
!4930 = !DILocation(line: 90, column: 21, scope: !4887)
!4931 = !DILocation(line: 90, column: 11, scope: !4887)
!4932 = !DILocation(line: 91, column: 13, scope: !4887)
!4933 = !DILocation(line: 91, column: 23, scope: !4887)
!4934 = !DILocation(line: 91, column: 21, scope: !4887)
!4935 = !DILocation(line: 91, column: 11, scope: !4887)
!4936 = !DILocation(line: 92, column: 13, scope: !4887)
!4937 = !DILocation(line: 92, column: 23, scope: !4887)
!4938 = !DILocation(line: 92, column: 21, scope: !4887)
!4939 = !DILocation(line: 92, column: 11, scope: !4887)
!4940 = !DILocation(line: 93, column: 13, scope: !4887)
!4941 = !DILocation(line: 93, column: 23, scope: !4887)
!4942 = !DILocation(line: 93, column: 21, scope: !4887)
!4943 = !DILocation(line: 93, column: 11, scope: !4887)
!4944 = !DILocation(line: 94, column: 14, scope: !4887)
!4945 = !DILocation(line: 94, column: 28, scope: !4887)
!4946 = !DILocation(line: 94, column: 37, scope: !4887)
!4947 = !DILocation(line: 94, column: 46, scope: !4887)
!4948 = !DILocation(line: 94, column: 24, scope: !4887)
!4949 = !DILocation(line: 94, column: 56, scope: !4887)
!4950 = !DILocation(line: 94, column: 65, scope: !4887)
!4951 = !DILocation(line: 94, column: 74, scope: !4887)
!4952 = !DILocation(line: 94, column: 52, scope: !4887)
!4953 = !DILocation(line: 94, column: 11, scope: !4887)
!4954 = !DILocation(line: 96, column: 9, scope: !4887)
!4955 = !DILocation(line: 96, column: 2, scope: !4887)
!4956 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !4957, file: !4957, line: 12, type: !4958, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !38, retainedNodes: !4961)
!4957 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!4958 = !DISubroutineType(types: !4959)
!4959 = !{null, !4960}
!4960 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!4961 = !{!4962}
!4962 = !DILocalVariable(name: "z", arg: 1, scope: !4956, file: !4957, line: 12, type: !4960)
!4963 = !DILocation(line: 0, scope: !4956)
!4964 = !DILocation(line: 13, column: 9, scope: !4965)
!4965 = distinct !DILexicalBlock(scope: !4956, file: !4957, line: 13, column: 7)
!4966 = !DILocation(line: 13, column: 7, scope: !4956)
!4967 = !DILocation(line: 14, column: 5, scope: !4965)
!4968 = !DILocation(line: 15, column: 1, scope: !4956)
!4969 = distinct !DISubprogram(name: "klee_overshift_check", scope: !4970, file: !4970, line: 20, type: !4971, scopeLine: 20, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !40, retainedNodes: !4974)
!4970 = !DIFile(filename: "src/runtime/Intrinsic/klee_overshift_check.c", directory: "/build/klee/parts/klee")
!4971 = !DISubroutineType(types: !4972)
!4972 = !{null, !4973, !4973}
!4973 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!4974 = !{!4975, !4976}
!4975 = !DILocalVariable(name: "bitWidth", arg: 1, scope: !4969, file: !4970, line: 20, type: !4973)
!4976 = !DILocalVariable(name: "shift", arg: 2, scope: !4969, file: !4970, line: 20, type: !4973)
!4977 = !DILocation(line: 0, scope: !4969)
!4978 = !DILocation(line: 21, column: 13, scope: !4979)
!4979 = distinct !DILexicalBlock(scope: !4969, file: !4970, line: 21, column: 7)
!4980 = !DILocation(line: 21, column: 7, scope: !4969)
!4981 = !DILocation(line: 27, column: 5, scope: !4982)
!4982 = distinct !DILexicalBlock(scope: !4979, file: !4970, line: 21, column: 26)
!4983 = !DILocation(line: 29, column: 1, scope: !4969)
