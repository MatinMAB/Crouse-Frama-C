; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054/build/s16_fac05_div_s16_u16_alarm_0054.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [123 x i8] c"KLEE-ALARM-0054: signed overflow. assert (int)((int)((int)numerator << 16) / (int)u16Temp1) * (int)u16Temp1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0054.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i16, align 2
  %denominator = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i16* %numerator, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i16* %denominator, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i16* %result, metadata !48, metadata !DIExpression()), !dbg !49
  %0 = bitcast i16* %numerator to i8*, !dbg !50
  call void @klee_make_symbolic(i8* %0, i64 2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !51
  %1 = bitcast i16* %denominator to i8*, !dbg !52
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  %2 = load i16, i16* %numerator, align 2, !dbg !54
  %3 = load i16, i16* %denominator, align 2, !dbg !55
  %call = call signext i16 @s16_fac05_div_s16_u16(i16 signext %2, i16 zeroext %3), !dbg !56
  store i16 %call, i16* %result, align 2, !dbg !57
  %4 = load i16, i16* %result, align 2, !dbg !58
  ret i32 0, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !60 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i16, i16* %numerator.addr, align 2, !dbg !75
  %conv = sext i16 %0 to i32, !dbg !75
  %shl = shl i32 %conv, 16, !dbg !76
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !77
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !78
  %conv1 = sext i16 %1 to i32, !dbg !78
  %cmp = icmp eq i32 %conv1, 0, !dbg !80
  br i1 %cmp, label %if.then, label %if.else7, !dbg !81

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !82
  %conv3 = sext i16 %2 to i32, !dbg !82
  %cmp4 = icmp slt i32 %conv3, 0, !dbg !85
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !86

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !87
  br label %return, !dbg !87

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !89
  br label %return, !dbg !89

if.else7:                                         ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !91
  %cmp8 = icmp ne i32 %3, -2147483648, !dbg !94
  br i1 %cmp8, label %if.then10, label %if.else29, !dbg !95

if.then10:                                        ; preds = %if.else7
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !96
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !98
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !99
  %conv11 = sext i16 %6 to i32, !dbg !99
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !100
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !100
  %div = sdiv i32 %5, %conv11, !dbg !100, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !102
  %conv12 = sext i16 %7 to i32, !dbg !102
  %mul = mul nsw i32 %div, %conv12, !dbg !103
  %sub = sub nsw i32 %4, %mul, !dbg !104
  %shl13 = shl i32 %sub, 1, !dbg !105
  store i32 %shl13, i32* %s32Temp2, align 4, !dbg !106
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !107
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !108
  %conv14 = sext i16 %9 to i32, !dbg !108
  %int_cast_to_i641 = zext i32 %conv14 to i64, !dbg !109
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !109
  %div15 = sdiv i32 %8, %conv14, !dbg !109, !klee.check.div !101
  store i32 %div15, i32* %s32Temp1, align 4, !dbg !110
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !111
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !112
  %conv16 = sext i16 %11 to i32, !dbg !112
  %shl17 = shl i32 %conv16, 16, !dbg !113
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !114
  %conv18 = sext i16 %12 to i32, !dbg !114
  %int_cast_to_i642 = zext i32 %conv18 to i64, !dbg !115
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !115
  %div19 = sdiv i32 %shl17, %conv18, !dbg !115, !klee.check.div !101
  %add = add nsw i32 %10, %div19, !dbg !116
  store i32 %add, i32* %s32Temp1, align 4, !dbg !117
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !118
  %cmp20 = icmp slt i32 %13, 32767, !dbg !120
  br i1 %cmp20, label %if.then22, label %if.else28, !dbg !121

if.then22:                                        ; preds = %if.then10
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !122
  %cmp23 = icmp sgt i32 %14, -32768, !dbg !125
  br i1 %cmp23, label %if.then25, label %if.else27, !dbg !126

if.then25:                                        ; preds = %if.then22
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !127
  %conv26 = trunc i32 %15 to i16, !dbg !129
  store i16 %conv26, i16* %retval, align 2, !dbg !130
  br label %return, !dbg !130

if.else27:                                        ; preds = %if.then22
  store i16 -32768, i16* %retval, align 2, !dbg !131
  br label %return, !dbg !131

if.else28:                                        ; preds = %if.then10
  store i16 32767, i16* %retval, align 2, !dbg !133
  br label %return, !dbg !133

if.else29:                                        ; preds = %if.else7
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !135
  %conv30 = sext i16 %16 to i32, !dbg !135
  %cmp31 = icmp ne i32 %conv30, -1, !dbg !138
  br i1 %cmp31, label %if.then33, label %if.else56, !dbg !139

if.then33:                                        ; preds = %if.else29
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !140
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !142
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !143
  %conv34 = sext i16 %19 to i32, !dbg !143
  %int_cast_to_i643 = zext i32 %conv34 to i64, !dbg !144
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !144
  %div35 = sdiv i32 %18, %conv34, !dbg !144, !klee.check.div !101
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !145
  %conv36 = sext i16 %20 to i32, !dbg !145
  %mul37 = mul nsw i32 %div35, %conv36, !dbg !146
  %sub38 = sub nsw i32 %17, %mul37, !dbg !147
  %shl39 = shl i32 %sub38, 1, !dbg !148
  store i32 %shl39, i32* %s32Temp2, align 4, !dbg !149
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !150
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !151
  %conv40 = sext i16 %22 to i32, !dbg !151
  %int_cast_to_i644 = zext i32 %conv40 to i64, !dbg !152
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !152
  %div41 = sdiv i32 %21, %conv40, !dbg !152, !klee.check.div !101
  store i32 %div41, i32* %s32Temp1, align 4, !dbg !153
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !154
  %24 = load i16, i16* %numerator.addr, align 2, !dbg !155
  %conv42 = sext i16 %24 to i32, !dbg !155
  %shl43 = shl i32 %conv42, 16, !dbg !156
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !157
  %conv44 = sext i16 %25 to i32, !dbg !157
  %int_cast_to_i645 = zext i32 %conv44 to i64, !dbg !158
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !158
  %div45 = sdiv i32 %shl43, %conv44, !dbg !158, !klee.check.div !101
  %add46 = add nsw i32 %23, %div45, !dbg !159
  store i32 %add46, i32* %s32Temp1, align 4, !dbg !160
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !161
  %cmp47 = icmp slt i32 %26, 32767, !dbg !163
  br i1 %cmp47, label %if.then49, label %if.else55, !dbg !164

if.then49:                                        ; preds = %if.then33
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !165
  %cmp50 = icmp sgt i32 %27, -32768, !dbg !168
  br i1 %cmp50, label %if.then52, label %if.else54, !dbg !169

if.then52:                                        ; preds = %if.then49
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !170
  %conv53 = trunc i32 %28 to i16, !dbg !172
  store i16 %conv53, i16* %retval, align 2, !dbg !173
  br label %return, !dbg !173

if.else54:                                        ; preds = %if.then49
  store i16 -32768, i16* %retval, align 2, !dbg !174
  br label %return, !dbg !174

if.else55:                                        ; preds = %if.then33
  store i16 32767, i16* %retval, align 2, !dbg !176
  br label %return, !dbg !176

if.else56:                                        ; preds = %if.else29
  store i16 32767, i16* %retval, align 2, !dbg !178
  br label %return, !dbg !178

return:                                           ; preds = %if.else56, %if.else55, %if.else54, %if.then52, %if.else28, %if.else27, %if.then25, %if.else, %if.then6
  %29 = load i16, i16* %retval, align 2, !dbg !180
  ret i16 %29, !dbg !180
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_s16(i32 %numerator, i16 signext %denominator) #0 !dbg !181 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !184, metadata !DIExpression()), !dbg !185
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 0, i32* %s32Temp1, align 4, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 0, i32* %s32Temp2, align 4, !dbg !191
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !192
  store i32 %0, i32* %s32Temp1, align 4, !dbg !193
  %1 = load i16, i16* %denominator.addr, align 2, !dbg !194
  %conv = sext i16 %1 to i32, !dbg !194
  %cmp = icmp eq i32 %conv, 0, !dbg !196
  br i1 %cmp, label %if.then, label %if.else5, !dbg !197

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !198
  %cmp2 = icmp slt i32 %2, 0, !dbg !201
  br i1 %cmp2, label %if.then4, label %if.else, !dbg !202

if.then4:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !203
  br label %return, !dbg !203

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !205
  br label %return, !dbg !205

if.else5:                                         ; preds = %entry
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !207
  %cmp6 = icmp ne i32 %3, -2147483648, !dbg !210
  br i1 %cmp6, label %if.then8, label %if.else24, !dbg !211

if.then8:                                         ; preds = %if.else5
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !212
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !214
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !215
  %conv9 = sext i16 %6 to i32, !dbg !215
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !216
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !216
  %div = sdiv i32 %5, %conv9, !dbg !216, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !217
  %conv10 = sext i16 %7 to i32, !dbg !217
  %mul = mul nsw i32 %div, %conv10, !dbg !218
  %sub = sub nsw i32 %4, %mul, !dbg !219
  %shl = shl i32 %sub, 1, !dbg !220
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !221
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !222
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !223
  %conv11 = sext i16 %9 to i32, !dbg !223
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !224
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !224
  %div12 = sdiv i32 %8, %conv11, !dbg !224, !klee.check.div !101
  store i32 %div12, i32* %s32Temp1, align 4, !dbg !225
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !226
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !227
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !228
  %conv13 = sext i16 %12 to i32, !dbg !228
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !229
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !229
  %div14 = sdiv i32 %11, %conv13, !dbg !229, !klee.check.div !101
  %add = add nsw i32 %10, %div14, !dbg !230
  store i32 %add, i32* %s32Temp1, align 4, !dbg !231
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !232
  %cmp15 = icmp slt i32 %13, 32767, !dbg !234
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !235

if.then17:                                        ; preds = %if.then8
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !236
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !239
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !240

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !241
  %conv21 = trunc i32 %15 to i16, !dbg !243
  store i16 %conv21, i16* %retval, align 2, !dbg !244
  br label %return, !dbg !244

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !245
  br label %return, !dbg !245

if.else23:                                        ; preds = %if.then8
  store i16 32767, i16* %retval, align 2, !dbg !247
  br label %return, !dbg !247

if.else24:                                        ; preds = %if.else5
  %16 = load i16, i16* %denominator.addr, align 2, !dbg !249
  %conv25 = sext i16 %16 to i32, !dbg !249
  %cmp26 = icmp ne i32 %conv25, -1, !dbg !252
  br i1 %cmp26, label %if.then28, label %if.else49, !dbg !253

if.then28:                                        ; preds = %if.else24
  %17 = load i32, i32* %s32Temp1, align 4, !dbg !254
  %18 = load i32, i32* %s32Temp1, align 4, !dbg !256
  %19 = load i16, i16* %denominator.addr, align 2, !dbg !257
  %conv29 = sext i16 %19 to i32, !dbg !257
  %int_cast_to_i643 = zext i32 %conv29 to i64, !dbg !258
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !258
  %div30 = sdiv i32 %18, %conv29, !dbg !258, !klee.check.div !101
  %20 = load i16, i16* %denominator.addr, align 2, !dbg !259
  %conv31 = sext i16 %20 to i32, !dbg !259
  %mul32 = mul nsw i32 %div30, %conv31, !dbg !260
  %sub33 = sub nsw i32 %17, %mul32, !dbg !261
  %shl34 = shl i32 %sub33, 1, !dbg !262
  store i32 %shl34, i32* %s32Temp2, align 4, !dbg !263
  %21 = load i32, i32* %s32Temp2, align 4, !dbg !264
  %22 = load i16, i16* %denominator.addr, align 2, !dbg !265
  %conv35 = sext i16 %22 to i32, !dbg !265
  %int_cast_to_i644 = zext i32 %conv35 to i64, !dbg !266
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !266
  %div36 = sdiv i32 %21, %conv35, !dbg !266, !klee.check.div !101
  store i32 %div36, i32* %s32Temp1, align 4, !dbg !267
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !268
  %24 = load i32, i32* %numerator.addr, align 4, !dbg !269
  %25 = load i16, i16* %denominator.addr, align 2, !dbg !270
  %conv37 = sext i16 %25 to i32, !dbg !270
  %int_cast_to_i645 = zext i32 %conv37 to i64, !dbg !271
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !271
  %div38 = sdiv i32 %24, %conv37, !dbg !271, !klee.check.div !101
  %add39 = add nsw i32 %23, %div38, !dbg !272
  store i32 %add39, i32* %s32Temp1, align 4, !dbg !273
  %26 = load i32, i32* %s32Temp1, align 4, !dbg !274
  %cmp40 = icmp slt i32 %26, 32767, !dbg !276
  br i1 %cmp40, label %if.then42, label %if.else48, !dbg !277

if.then42:                                        ; preds = %if.then28
  %27 = load i32, i32* %s32Temp1, align 4, !dbg !278
  %cmp43 = icmp sgt i32 %27, -32768, !dbg !281
  br i1 %cmp43, label %if.then45, label %if.else47, !dbg !282

if.then45:                                        ; preds = %if.then42
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !283
  %conv46 = trunc i32 %28 to i16, !dbg !285
  store i16 %conv46, i16* %retval, align 2, !dbg !286
  br label %return, !dbg !286

if.else47:                                        ; preds = %if.then42
  store i16 -32768, i16* %retval, align 2, !dbg !287
  br label %return, !dbg !287

if.else48:                                        ; preds = %if.then28
  store i16 32767, i16* %retval, align 2, !dbg !289
  br label %return, !dbg !289

if.else49:                                        ; preds = %if.else24
  store i16 32767, i16* %retval, align 2, !dbg !291
  br label %return, !dbg !291

return:                                           ; preds = %if.else49, %if.else48, %if.else47, %if.then45, %if.else23, %if.else22, %if.then20, %if.else, %if.then4
  %29 = load i16, i16* %retval, align 2, !dbg !293
  ret i16 %29, !dbg !293
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_u16(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !294 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !297, metadata !DIExpression()), !dbg !298
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !299, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !301, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !303, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !305, metadata !DIExpression()), !dbg !306
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !307
  %conv = zext i16 %0 to i32, !dbg !307
  %and = and i32 %conv, 65535, !dbg !308
  %conv1 = trunc i32 %and to i16, !dbg !307
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !309
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !310
  %conv2 = sext i16 %1 to i32, !dbg !312
  %conv3 = sext i32 %conv2 to i64, !dbg !313
  %call = call i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %conv3), !dbg !314
  %tobool = icmp ne i32 %call, 0, !dbg !314
  br i1 %tobool, label %if.end, label %if.then, !dbg !315

if.then:                                          ; preds = %entry
  store i16 0, i16* %retval, align 2, !dbg !316
  br label %return, !dbg !316

if.end:                                           ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !318
  %conv4 = sext i16 %2 to i32, !dbg !318
  %shl = shl i32 %conv4, 16, !dbg !319
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !320
  %3 = load i16, i16* %u16Temp1, align 2, !dbg !321
  %conv5 = zext i16 %3 to i32, !dbg !321
  %cmp = icmp eq i32 %conv5, 0, !dbg !323
  br i1 %cmp, label %if.then7, label %if.else12, !dbg !324

if.then7:                                         ; preds = %if.end
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !325
  %conv8 = sext i16 %4 to i32, !dbg !325
  %cmp9 = icmp slt i32 %conv8, 0, !dbg !328
  br i1 %cmp9, label %if.then11, label %if.else, !dbg !329

if.then11:                                        ; preds = %if.then7
  store i16 -32768, i16* %retval, align 2, !dbg !330
  br label %return, !dbg !330

if.else:                                          ; preds = %if.then7
  store i16 32767, i16* %retval, align 2, !dbg !332
  br label %return, !dbg !332

if.else12:                                        ; preds = %if.end
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !334
  %conv13 = sext i16 %5 to i32, !dbg !337
  %shl14 = shl i32 %conv13, 16, !dbg !338
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !339
  %conv15 = zext i16 %6 to i32, !dbg !340
  %int_cast_to_i64 = zext i32 %conv15 to i64, !dbg !341
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !341
  %div = sdiv i32 %shl14, %conv15, !dbg !341, !klee.check.div !101
  %conv16 = sext i32 %div to i64, !dbg !342
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !343
  %conv17 = zext i16 %7 to i32, !dbg !344
  %conv18 = sext i32 %conv17 to i64, !dbg !345
  %call19 = call i32 @klee_alarm_s32_mul_upper(i64 %conv16, i64 %conv18), !dbg !346
  %tobool20 = icmp ne i32 %call19, 0, !dbg !346
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !347

if.then21:                                        ; preds = %if.else12
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 370, i8* getelementptr inbounds ([123 x i8], [123 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !348
  unreachable, !dbg !348

if.end22:                                         ; preds = %if.else12
  %8 = load i16, i16* %numerator.addr, align 2, !dbg !350
  %conv23 = sext i16 %8 to i32, !dbg !351
  %shl24 = shl i32 %conv23, 16, !dbg !352
  %9 = load i16, i16* %u16Temp1, align 2, !dbg !353
  %conv25 = zext i16 %9 to i32, !dbg !354
  %int_cast_to_i641 = zext i32 %conv25 to i64, !dbg !355
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !355
  %div26 = sdiv i32 %shl24, %conv25, !dbg !355, !klee.check.div !101
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !356
  %conv27 = zext i16 %10 to i32, !dbg !357
  %mul = mul nsw i32 %div26, %conv27, !dbg !358
  %conv28 = sext i32 %mul to i64, !dbg !359
  store volatile i64 %conv28, i64* @klee_alarm_sink_s64, align 8, !dbg !360
  store i16 0, i16* %retval, align 2, !dbg !361
  br label %return, !dbg !361

return:                                           ; preds = %if.end22, %if.else, %if.then11, %if.then
  %11 = load i16, i16* %retval, align 2, !dbg !362
  ret i16 %11, !dbg !362
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !363 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !366, metadata !DIExpression()), !dbg !367
  %0 = load i64, i64* %left.addr, align 8, !dbg !368
  %cmp = icmp sge i64 %0, 0, !dbg !369
  %conv = zext i1 %cmp to i32, !dbg !369
  ret i32 %conv, !dbg !370
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !371 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !374, metadata !DIExpression()), !dbg !375
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !376, metadata !DIExpression()), !dbg !377
  %0 = load i64, i64* %left.addr, align 8, !dbg !378
  %1 = load i64, i64* %right.addr, align 8, !dbg !379
  %mul = mul nsw i64 %0, %1, !dbg !380
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !381
  %conv = zext i1 %cmp to i32, !dbg !381
  ret i32 %conv, !dbg !382
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !383 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !384, metadata !DIExpression()), !dbg !385
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !386, metadata !DIExpression()), !dbg !387
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !388, metadata !DIExpression()), !dbg !389
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !390, metadata !DIExpression()), !dbg !391
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !392
  %conv = zext i16 %0 to i32, !dbg !392
  %and = and i32 %conv, 65535, !dbg !393
  %conv1 = trunc i32 %and to i16, !dbg !392
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !394
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !395
  %conv2 = zext i16 %1 to i32, !dbg !395
  %cmp = icmp eq i32 %conv2, 0, !dbg !397
  br i1 %cmp, label %if.then, label %if.else8, !dbg !398

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !399
  %conv4 = sext i16 %2 to i32, !dbg !399
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !402
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !403

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !404
  br label %return, !dbg !404

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !406
  br label %return, !dbg !406

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !408
  %conv9 = sext i16 %3 to i32, !dbg !408
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !410
  %conv10 = sext i16 %4 to i32, !dbg !410
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !411
  %conv11 = zext i16 %5 to i32, !dbg !411
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !412
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !412
  %div = sdiv i32 %conv10, %conv11, !dbg !412, !klee.check.div !101
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !413
  %conv12 = zext i16 %6 to i32, !dbg !413
  %mul = mul nsw i32 %div, %conv12, !dbg !414
  %sub = sub nsw i32 %conv9, %mul, !dbg !415
  %shl = shl i32 %sub, 1, !dbg !416
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !417
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !418
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !419
  %conv13 = zext i16 %8 to i32, !dbg !419
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !420
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !420
  %div14 = sdiv i32 %7, %conv13, !dbg !420, !klee.check.div !101
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !421
  %conv15 = sext i16 %9 to i32, !dbg !421
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !422
  %conv16 = zext i16 %10 to i32, !dbg !422
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !423
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !423
  %div17 = sdiv i32 %conv15, %conv16, !dbg !423, !klee.check.div !101
  %add = add nsw i32 %div14, %div17, !dbg !424
  store i32 %add, i32* %s32Temp1, align 4, !dbg !425
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !426
  %conv18 = trunc i32 %11 to i16, !dbg !426
  store i16 %conv18, i16* %retval, align 2, !dbg !427
  br label %return, !dbg !427

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !428
  ret i16 %12, !dbg !428
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !429 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !432, metadata !DIExpression()), !dbg !433
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !434, metadata !DIExpression()), !dbg !435
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !436, metadata !DIExpression()), !dbg !441
  store i32 0, i32* %u32Temp1, align 4, !dbg !441
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !442, metadata !DIExpression()), !dbg !443
  store i32 0, i32* %u32Temp2, align 4, !dbg !443
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !444, metadata !DIExpression()), !dbg !445
  store i32 0, i32* %u32Temp3, align 4, !dbg !445
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !446
  %conv = zext i16 %0 to i32, !dbg !446
  %cmp = icmp eq i32 %conv, 0, !dbg !448
  br i1 %cmp, label %if.then, label %if.else, !dbg !449

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !450
  br label %return, !dbg !450

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !452
  %conv2 = zext i16 %1 to i32, !dbg !452
  %shl = shl i32 %conv2, 16, !dbg !454
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !455
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !456
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !457
  %conv3 = zext i16 %3 to i32, !dbg !457
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !458
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !458
  %div = udiv i32 %2, %conv3, !dbg !458, !klee.check.div !101
  store i32 %div, i32* %u32Temp2, align 4, !dbg !459
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !460
  %add = add i32 %4, 128, !dbg !461
  %shr = lshr i32 %add, 8, !dbg !462
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !463
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !464
  %cmp4 = icmp ult i32 %5, 255, !dbg !466
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !467

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !468
  %conv7 = trunc i32 %6 to i8, !dbg !470
  store i8 %conv7, i8* %retval, align 1, !dbg !471
  br label %return, !dbg !471

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !472
  br label %return, !dbg !472

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !474
  ret i8 %7, !dbg !474
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !475 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !478, metadata !DIExpression()), !dbg !479
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !480, metadata !DIExpression()), !dbg !481
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !482, metadata !DIExpression()), !dbg !483
  store i32 0, i32* %s32Temp1, align 4, !dbg !483
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !484
  %conv = zext i16 %0 to i32, !dbg !484
  %and = and i32 %conv, 65535, !dbg !485
  %conv1 = trunc i32 %and to i16, !dbg !484
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !486
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !487
  %conv2 = zext i16 %1 to i32, !dbg !487
  %and3 = and i32 %conv2, 65535, !dbg !489
  %cmp = icmp eq i32 %and3, 0, !dbg !490
  br i1 %cmp, label %if.then, label %if.else8, !dbg !491

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !492
  %cmp5 = icmp sge i32 %2, 0, !dbg !495
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !496

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !497
  br label %return, !dbg !497

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !499
  br label %return, !dbg !499

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !501
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !503
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !504
  %conv9 = zext i16 %5 to i32, !dbg !504
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !505
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !505
  %div = sdiv i32 %4, %conv9, !dbg !505, !klee.check.div !101
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !506
  %conv10 = zext i16 %6 to i32, !dbg !506
  %mul = mul nsw i32 %div, %conv10, !dbg !507
  %sub = sub nsw i32 %3, %mul, !dbg !508
  %shl = shl i32 %sub, 1, !dbg !509
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !510
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !511
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !512
  %conv11 = zext i16 %8 to i32, !dbg !512
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !513
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !513
  %div12 = sdiv i32 %7, %conv11, !dbg !513, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !514
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !515
  %conv13 = zext i16 %10 to i32, !dbg !515
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !516
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !516
  %div14 = sdiv i32 %9, %conv13, !dbg !516, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !517
  store i32 %add, i32* %s32Temp1, align 4, !dbg !518
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !519
  %cmp15 = icmp slt i32 %11, 65535, !dbg !521
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !522

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !523
  %cmp18 = icmp sgt i32 %12, 0, !dbg !526
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !527

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !528
  %conv21 = trunc i32 %13 to i16, !dbg !530
  store i16 %conv21, i16* %retval, align 2, !dbg !531
  br label %return, !dbg !531

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !532
  br label %return, !dbg !532

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !534
  br label %return, !dbg !534

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !536
  ret i16 %14, !dbg !536
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !537 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !540, metadata !DIExpression()), !dbg !541
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !542, metadata !DIExpression()), !dbg !543
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !544, metadata !DIExpression()), !dbg !545
  store i32 0, i32* %u32Temp, align 4, !dbg !545
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !546
  %conv = zext i16 %0 to i32, !dbg !546
  %cmp = icmp eq i32 %conv, 0, !dbg !548
  br i1 %cmp, label %if.then, label %if.else, !dbg !549

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !550
  br label %return, !dbg !550

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !552
  %conv2 = zext i16 %1 to i32, !dbg !552
  %shl = shl i32 %conv2, 16, !dbg !554
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !555
  %conv3 = zext i16 %2 to i32, !dbg !555
  %shr = ashr i32 %conv3, 1, !dbg !556
  %add = add nsw i32 %shl, %shr, !dbg !557
  store i32 %add, i32* %u32Temp, align 4, !dbg !558
  %3 = load i32, i32* %u32Temp, align 4, !dbg !559
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !560
  %conv4 = zext i16 %4 to i32, !dbg !560
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !561
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !561
  %div = udiv i32 %3, %conv4, !dbg !561, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !562
  %5 = load i32, i32* %u32Temp, align 4, !dbg !563
  %cmp5 = icmp ult i32 %5, 65535, !dbg !565
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !566

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !567
  %and = and i32 %6, 65535, !dbg !569
  %conv8 = trunc i32 %and to i16, !dbg !567
  store i16 %conv8, i16* %retval, align 2, !dbg !570
  br label %return, !dbg !570

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !571
  br label %return, !dbg !571

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !573
  ret i16 %7, !dbg !573
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !574 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !581, metadata !DIExpression()), !dbg !582
  store i32 0, i32* %u32Temp1, align 4, !dbg !582
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 0, i32* %u32Temp2, align 4, !dbg !584
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !585
  %conv = zext i16 %0 to i32, !dbg !585
  %and = and i32 %conv, 65535, !dbg !586
  %conv1 = trunc i32 %and to i16, !dbg !585
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !587
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !588
  %conv2 = zext i16 %1 to i32, !dbg !588
  %cmp = icmp eq i32 %conv2, 0, !dbg !590
  br i1 %cmp, label %if.then, label %if.else, !dbg !591

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !592
  br label %return, !dbg !592

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !594
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !596
  %conv4 = zext i16 %3 to i32, !dbg !596
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !597
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !597
  %div = udiv i32 %2, %conv4, !dbg !597, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !598
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !599
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !600
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !601
  %conv5 = zext i16 %6 to i32, !dbg !601
  %mul = mul i32 %5, %conv5, !dbg !602
  %sub = sub i32 %4, %mul, !dbg !603
  %shl = shl i32 %sub, 1, !dbg !604
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !605
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !606
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !607
  %conv6 = zext i16 %8 to i32, !dbg !607
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !608
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !608
  %div7 = udiv i32 %7, %conv6, !dbg !608, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !609
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !610
  %conv8 = zext i16 %10 to i32, !dbg !610
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !611
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !611
  %div9 = udiv i32 %9, %conv8, !dbg !611, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !612
  store i32 %add, i32* %u32Temp2, align 4, !dbg !613
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !614
  %cmp10 = icmp ult i32 %11, 65535, !dbg !616
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !617

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !618
  %and13 = and i32 %12, 65535, !dbg !620
  %conv14 = trunc i32 %and13 to i16, !dbg !618
  store i16 %conv14, i16* %retval, align 2, !dbg !621
  br label %return, !dbg !621

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !622
  br label %return, !dbg !622

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !624
  ret i16 %13, !dbg !624
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !625 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !628, metadata !DIExpression()), !dbg !629
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !630, metadata !DIExpression()), !dbg !631
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !632, metadata !DIExpression()), !dbg !633
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !634, metadata !DIExpression()), !dbg !635
  store i32 0, i32* %s32Result, align 4, !dbg !635
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !636, metadata !DIExpression()), !dbg !637
  store i32 0, i32* %s32Temp1, align 4, !dbg !637
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !638
  %conv = sext i16 %0 to i32, !dbg !638
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !639
  %conv1 = zext i16 %1 to i32, !dbg !639
  %mul = mul nsw i32 %conv, %conv1, !dbg !640
  store i32 %mul, i32* %s32Result, align 4, !dbg !641
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !642
  %conv2 = sext i16 %2 to i32, !dbg !642
  %cmp = icmp eq i32 %conv2, 0, !dbg !644
  br i1 %cmp, label %if.then, label %if.else7, !dbg !645

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !646
  %cmp4 = icmp slt i32 %3, 0, !dbg !649
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !650

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !651
  br label %return, !dbg !651

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !653
  br label %return, !dbg !653

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !655
  %5 = load i32, i32* %s32Result, align 4, !dbg !657
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !658
  %conv8 = sext i16 %6 to i32, !dbg !658
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !659
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !659
  %div = sdiv i32 %5, %conv8, !dbg !659, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !660
  %conv9 = sext i16 %7 to i32, !dbg !660
  %mul10 = mul nsw i32 %div, %conv9, !dbg !661
  %sub = sub nsw i32 %4, %mul10, !dbg !662
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !663
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !664
  %shl = shl i32 %8, 1, !dbg !665
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !666
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !667
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !668
  %conv11 = sext i16 %10 to i32, !dbg !668
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !669
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !669
  %div12 = sdiv i32 %9, %conv11, !dbg !669, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !670
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !671
  %conv13 = sext i16 %12 to i32, !dbg !671
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !672
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !672
  %div14 = sdiv i32 %11, %conv13, !dbg !672, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !673
  store i32 %add, i32* %s32Result, align 4, !dbg !674
  %13 = load i32, i32* %s32Result, align 4, !dbg !675
  %cmp15 = icmp slt i32 %13, 32767, !dbg !677
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !678

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !679
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !682
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !683

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !684
  %conv21 = trunc i32 %15 to i16, !dbg !686
  store i16 %conv21, i16* %retval, align 2, !dbg !687
  br label %return, !dbg !687

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !688
  br label %return, !dbg !688

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !690
  br label %return, !dbg !690

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !692
  ret i16 %16, !dbg !692
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !693 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !696, metadata !DIExpression()), !dbg !697
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !698, metadata !DIExpression()), !dbg !699
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !700, metadata !DIExpression()), !dbg !701
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !702, metadata !DIExpression()), !dbg !703
  store i32 0, i32* %s32Result, align 4, !dbg !703
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !704, metadata !DIExpression()), !dbg !705
  store i32 0, i32* %s32Temp1, align 4, !dbg !705
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !706
  %conv = zext i16 %0 to i32, !dbg !706
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !707
  %conv1 = sext i16 %1 to i32, !dbg !707
  %mul = mul nsw i32 %conv, %conv1, !dbg !708
  store i32 %mul, i32* %s32Result, align 4, !dbg !709
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !710
  %conv2 = zext i16 %2 to i32, !dbg !710
  %cmp = icmp eq i32 %conv2, 0, !dbg !712
  br i1 %cmp, label %if.then, label %if.else7, !dbg !713

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !714
  %cmp4 = icmp slt i32 %3, 0, !dbg !717
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !718

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !719
  br label %return, !dbg !719

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !721
  br label %return, !dbg !721

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !723
  %5 = load i32, i32* %s32Result, align 4, !dbg !725
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !726
  %conv8 = zext i16 %6 to i32, !dbg !726
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !727
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !727
  %div = sdiv i32 %5, %conv8, !dbg !727, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !728
  %conv9 = zext i16 %7 to i32, !dbg !728
  %mul10 = mul nsw i32 %div, %conv9, !dbg !729
  %sub = sub nsw i32 %4, %mul10, !dbg !730
  %shl = shl i32 %sub, 1, !dbg !731
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !732
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !733
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !734
  %conv11 = zext i16 %9 to i32, !dbg !734
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !735
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !735
  %div12 = sdiv i32 %8, %conv11, !dbg !735, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !736
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !737
  %conv13 = zext i16 %11 to i32, !dbg !737
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !738
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !738
  %div14 = sdiv i32 %10, %conv13, !dbg !738, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !739
  store i32 %add, i32* %s32Result, align 4, !dbg !740
  %12 = load i32, i32* %s32Result, align 4, !dbg !741
  %cmp15 = icmp slt i32 %12, 32767, !dbg !743
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !744

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !745
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !748
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !749

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !750
  %conv21 = trunc i32 %14 to i16, !dbg !752
  store i16 %conv21, i16* %retval, align 2, !dbg !753
  br label %return, !dbg !753

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !754
  br label %return, !dbg !754

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !756
  br label %return, !dbg !756

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !758
  ret i16 %15, !dbg !758
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !759 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Result = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !762, metadata !DIExpression()), !dbg !763
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !764, metadata !DIExpression()), !dbg !765
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !766, metadata !DIExpression()), !dbg !767
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !768, metadata !DIExpression()), !dbg !769
  store i32 0, i32* %u32Result, align 4, !dbg !769
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !770, metadata !DIExpression()), !dbg !771
  store i32 0, i32* %u32Temp1, align 4, !dbg !771
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !772, metadata !DIExpression()), !dbg !773
  store i32 0, i32* %s32Result, align 4, !dbg !773
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !774, metadata !DIExpression()), !dbg !775
  store i32 0, i32* %s32Temp1, align 4, !dbg !775
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !776
  %conv = sext i16 %0 to i32, !dbg !776
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !777
  %conv1 = zext i16 %1 to i32, !dbg !777
  %mul = mul nsw i32 %conv, %conv1, !dbg !778
  store i32 %mul, i32* %s32Result, align 4, !dbg !779
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !780
  %conv2 = sext i16 %2 to i32, !dbg !780
  %cmp = icmp eq i32 %conv2, 0, !dbg !782
  br i1 %cmp, label %if.then, label %if.else7, !dbg !783

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !784
  %cmp4 = icmp sge i32 %3, 0, !dbg !787
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !788

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !789
  br label %return, !dbg !789

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !791
  br label %return, !dbg !791

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !793
  %5 = load i32, i32* %s32Result, align 4, !dbg !795
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !796
  %conv8 = sext i16 %6 to i32, !dbg !796
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !797
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !797
  %div = sdiv i32 %5, %conv8, !dbg !797, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !798
  %conv9 = sext i16 %7 to i32, !dbg !798
  %mul10 = mul nsw i32 %div, %conv9, !dbg !799
  %sub = sub nsw i32 %4, %mul10, !dbg !800
  %shl = shl i32 %sub, 1, !dbg !801
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !802
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !803
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !804
  %conv11 = sext i16 %9 to i32, !dbg !804
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !805
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !805
  %div12 = sdiv i32 %8, %conv11, !dbg !805, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !806
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !807
  %conv13 = sext i16 %11 to i32, !dbg !807
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !808
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !808
  %div14 = sdiv i32 %10, %conv13, !dbg !808, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !809
  store i32 %add, i32* %s32Result, align 4, !dbg !810
  %12 = load i32, i32* %s32Result, align 4, !dbg !811
  %cmp15 = icmp slt i32 %12, 65535, !dbg !813
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !814

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !815
  %cmp18 = icmp sgt i32 %13, 0, !dbg !818
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !819

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !820
  %conv21 = trunc i32 %14 to i16, !dbg !822
  store i16 %conv21, i16* %retval, align 2, !dbg !823
  br label %return, !dbg !823

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !824
  br label %return, !dbg !824

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !826
  br label %return, !dbg !826

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !828
  ret i16 %15, !dbg !828
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !829 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !832, metadata !DIExpression()), !dbg !833
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !834, metadata !DIExpression()), !dbg !835
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !836, metadata !DIExpression()), !dbg !837
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !838, metadata !DIExpression()), !dbg !839
  store i32 0, i32* %s32Result, align 4, !dbg !839
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !840, metadata !DIExpression()), !dbg !841
  store i32 0, i32* %s32Temp1, align 4, !dbg !841
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !842
  %conv = sext i16 %0 to i32, !dbg !842
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !843
  %conv1 = zext i16 %1 to i32, !dbg !843
  %mul = mul nsw i32 %conv, %conv1, !dbg !844
  store i32 %mul, i32* %s32Result, align 4, !dbg !845
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !846
  %conv2 = zext i16 %2 to i32, !dbg !846
  %cmp = icmp eq i32 %conv2, 0, !dbg !848
  br i1 %cmp, label %if.then, label %if.else7, !dbg !849

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !850
  %cmp4 = icmp sge i32 %3, 0, !dbg !853
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !854

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !855
  br label %return, !dbg !855

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !857
  br label %return, !dbg !857

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !859
  %5 = load i32, i32* %s32Result, align 4, !dbg !861
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !862
  %conv8 = zext i16 %6 to i32, !dbg !862
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !863
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !863
  %div = sdiv i32 %5, %conv8, !dbg !863, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !864
  %conv9 = zext i16 %7 to i32, !dbg !864
  %mul10 = mul nsw i32 %div, %conv9, !dbg !865
  %sub = sub nsw i32 %4, %mul10, !dbg !866
  %shl = shl i32 %sub, 1, !dbg !867
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !868
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !869
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !870
  %conv11 = zext i16 %9 to i32, !dbg !870
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !871
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !871
  %div12 = sdiv i32 %8, %conv11, !dbg !871, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !872
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !873
  %conv13 = zext i16 %11 to i32, !dbg !873
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !874
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !874
  %div14 = sdiv i32 %10, %conv13, !dbg !874, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !875
  store i32 %add, i32* %s32Result, align 4, !dbg !876
  %12 = load i32, i32* %s32Result, align 4, !dbg !877
  %cmp15 = icmp slt i32 %12, 65535, !dbg !879
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !880

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !881
  %cmp18 = icmp sgt i32 %13, 0, !dbg !884
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !885

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !886
  %conv21 = trunc i32 %14 to i16, !dbg !888
  store i16 %conv21, i16* %retval, align 2, !dbg !889
  br label %return, !dbg !889

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !890
  br label %return, !dbg !890

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !892
  br label %return, !dbg !892

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !894
  ret i16 %15, !dbg !894
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !895 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !898, metadata !DIExpression()), !dbg !899
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !900, metadata !DIExpression()), !dbg !901
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !902, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !904, metadata !DIExpression()), !dbg !905
  store i32 0, i32* %u32Temp1, align 4, !dbg !905
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !906, metadata !DIExpression()), !dbg !907
  store i16 0, i16* %u16TempDenom, align 2, !dbg !907
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !908
  %conv = zext i16 %0 to i32, !dbg !908
  %cmp = icmp eq i32 %conv, 0, !dbg !910
  br i1 %cmp, label %if.then, label %if.else, !dbg !911

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !912
  br label %return, !dbg !912

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !914
  %conv2 = zext i16 %1 to i32, !dbg !914
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !916
  %conv3 = zext i16 %2 to i32, !dbg !916
  %mul = mul nsw i32 %conv2, %conv3, !dbg !917
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !918
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !919
  %conv4 = zext i16 %3 to i32, !dbg !919
  %shr = ashr i32 %conv4, 1, !dbg !920
  %conv5 = trunc i32 %shr to i16, !dbg !919
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !921
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !922
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !923
  %conv6 = zext i16 %5 to i32, !dbg !923
  %add = add i32 %4, %conv6, !dbg !924
  store i32 %add, i32* %u32Temp1, align 4, !dbg !925
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !926
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !927
  %conv7 = zext i16 %7 to i32, !dbg !927
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !928
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !928
  %div = udiv i32 %6, %conv7, !dbg !928, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !929
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !930
  %cmp8 = icmp ult i32 %8, 65535, !dbg !932
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !933

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !934
  %and = and i32 %9, 65535, !dbg !936
  %conv11 = trunc i32 %and to i16, !dbg !937
  store i16 %conv11, i16* %retval, align 2, !dbg !938
  br label %return, !dbg !938

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !939
  br label %return, !dbg !939

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !941
  ret i16 %10, !dbg !941
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !942 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !947, metadata !DIExpression()), !dbg !948
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !951, metadata !DIExpression()), !dbg !952
  store i32 0, i32* %u32Temp1, align 4, !dbg !952
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !953
  %cmp = icmp eq i32 %0, 0, !dbg !955
  br i1 %cmp, label %if.then, label %if.else, !dbg !956

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !957
  br label %return, !dbg !957

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !959
  %conv = zext i16 %1 to i32, !dbg !959
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !961
  %conv1 = zext i16 %2 to i32, !dbg !961
  %mul = mul nsw i32 %conv, %conv1, !dbg !962
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !963
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !964
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !964
  %div = udiv i32 %mul, %3, !dbg !964, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !965
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !966
  %conv2 = zext i16 %4 to i32, !dbg !966
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !968
  %conv3 = zext i16 %5 to i32, !dbg !968
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !969
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !970
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !971
  %mul5 = mul i32 %6, %7, !dbg !972
  %sub = sub i32 %mul4, %mul5, !dbg !973
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !974
  %div6 = udiv i32 %8, 2, !dbg !975
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !976
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !977

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !978
  %inc = add i32 %9, 1, !dbg !978
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !978
  br label %if.end, !dbg !980

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !981
  %cmp10 = icmp ult i32 %10, 65535, !dbg !983
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !984

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !985
  %and = and i32 %11, 65535, !dbg !987
  %conv13 = trunc i32 %and to i16, !dbg !988
  store i16 %conv13, i16* %retval, align 2, !dbg !989
  br label %return, !dbg !989

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !990
  br label %return, !dbg !990

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !992
  ret i16 %12, !dbg !992
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !993 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !996, metadata !DIExpression()), !dbg !997
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !998, metadata !DIExpression()), !dbg !999
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1000, metadata !DIExpression()), !dbg !1001
  store i32 0, i32* %u32Temp1, align 4, !dbg !1001
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1002
  %conv = zext i16 %0 to i32, !dbg !1002
  %cmp = icmp eq i32 %conv, 0, !dbg !1004
  br i1 %cmp, label %if.then, label %if.else, !dbg !1005

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1006
  br label %return, !dbg !1006

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1008
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1010
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1011
  %conv2 = zext i16 %3 to i32, !dbg !1011
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1012
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1012
  %div = udiv i32 %2, %conv2, !dbg !1012, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1013
  %conv3 = zext i16 %4 to i32, !dbg !1013
  %mul = mul i32 %div, %conv3, !dbg !1014
  %sub = sub i32 %1, %mul, !dbg !1015
  %shl = shl i32 %sub, 1, !dbg !1016
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1017
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1018
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1019
  %conv4 = zext i16 %6 to i32, !dbg !1019
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1020
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1020
  %div5 = udiv i32 %5, %conv4, !dbg !1020, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1021
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1022
  %conv6 = zext i16 %8 to i32, !dbg !1022
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1023
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1023
  %div7 = udiv i32 %7, %conv6, !dbg !1023, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !1024
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1025
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1026
  store i32 %9, i32* %retval, align 4, !dbg !1027
  br label %return, !dbg !1027

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1028
  ret i32 %10, !dbg !1028
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1029 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1032, metadata !DIExpression()), !dbg !1033
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1034, metadata !DIExpression()), !dbg !1035
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1036, metadata !DIExpression()), !dbg !1037
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1038, metadata !DIExpression()), !dbg !1039
  store i32 0, i32* %s32Temp1, align 4, !dbg !1039
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1040, metadata !DIExpression()), !dbg !1041
  store i32 0, i32* %s32Temp2, align 4, !dbg !1041
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i32 0, i32* %s32Temp3, align 4, !dbg !1043
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1044
  %conv = sext i16 %0 to i32, !dbg !1044
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1045
  %conv1 = sext i16 %1 to i32, !dbg !1045
  %mul = mul nsw i32 %conv, %conv1, !dbg !1046
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1047
  %2 = load i16, i16* %div.addr, align 2, !dbg !1048
  %conv2 = sext i16 %2 to i32, !dbg !1048
  %cmp = icmp eq i32 %conv2, 0, !dbg !1050
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1051

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1052
  %cmp4 = icmp slt i32 %3, 0, !dbg !1055
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1056

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1057
  br label %return, !dbg !1057

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1059
  br label %return, !dbg !1059

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1061
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1063
  %6 = load i16, i16* %div.addr, align 2, !dbg !1064
  %conv8 = sext i16 %6 to i32, !dbg !1064
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1065
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1065
  %div9 = sdiv i32 %5, %conv8, !dbg !1065, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1066
  %conv10 = sext i16 %7 to i32, !dbg !1066
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1067
  %sub = sub nsw i32 %4, %mul11, !dbg !1068
  %shl = shl i32 %sub, 1, !dbg !1069
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1070
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1071
  %9 = load i16, i16* %div.addr, align 2, !dbg !1072
  %conv12 = sext i16 %9 to i32, !dbg !1072
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1073
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1073
  %div13 = sdiv i32 %8, %conv12, !dbg !1073, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1074
  %11 = load i16, i16* %div.addr, align 2, !dbg !1075
  %conv14 = sext i16 %11 to i32, !dbg !1075
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1076
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1076
  %div15 = sdiv i32 %10, %conv14, !dbg !1076, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1077
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1078
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1079
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1081
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1082

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1083
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1086
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1087

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1088
  %conv22 = trunc i32 %14 to i16, !dbg !1090
  store i16 %conv22, i16* %retval, align 2, !dbg !1091
  br label %return, !dbg !1091

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1092
  br label %return, !dbg !1092

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1094
  br label %return, !dbg !1094

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1096
  ret i16 %15, !dbg !1096
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1097 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1100, metadata !DIExpression()), !dbg !1101
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1102, metadata !DIExpression()), !dbg !1103
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1104, metadata !DIExpression()), !dbg !1105
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1106, metadata !DIExpression()), !dbg !1107
  store i32 0, i32* %s32Result, align 4, !dbg !1107
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1108, metadata !DIExpression()), !dbg !1109
  store i32 0, i32* %s32Temp1, align 4, !dbg !1109
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1110
  %conv = sext i16 %0 to i32, !dbg !1110
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1111
  %conv1 = sext i16 %1 to i32, !dbg !1111
  %mul = mul nsw i32 %conv, %conv1, !dbg !1112
  store i32 %mul, i32* %s32Result, align 4, !dbg !1113
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1114
  %conv2 = zext i16 %2 to i32, !dbg !1114
  %cmp = icmp eq i32 %conv2, 0, !dbg !1116
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1117

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1118
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1121
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1122

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1123
  br label %return, !dbg !1123

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1125
  %cmp7 = icmp eq i32 %4, 0, !dbg !1127
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1128

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1129
  br label %return, !dbg !1129

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1131
  br label %return, !dbg !1131

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1133
  %6 = load i32, i32* %s32Result, align 4, !dbg !1135
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1136
  %conv12 = zext i16 %7 to i32, !dbg !1136
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1137
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1137
  %div = sdiv i32 %6, %conv12, !dbg !1137, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1138
  %conv13 = zext i16 %8 to i32, !dbg !1138
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1139
  %sub = sub nsw i32 %5, %mul14, !dbg !1140
  %shl = shl i32 %sub, 1, !dbg !1141
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1142
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1143
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1144
  %conv15 = zext i16 %10 to i32, !dbg !1144
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1145
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1145
  %div16 = sdiv i32 %9, %conv15, !dbg !1145, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1146
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1147
  %conv17 = zext i16 %12 to i32, !dbg !1147
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1148
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1148
  %div18 = sdiv i32 %11, %conv17, !dbg !1148, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1149
  store i32 %add, i32* %s32Result, align 4, !dbg !1150
  %13 = load i32, i32* %s32Result, align 4, !dbg !1151
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1153
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1154

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1155
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1158
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1159

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1160
  %conv25 = trunc i32 %15 to i16, !dbg !1162
  store i16 %conv25, i16* %retval, align 2, !dbg !1163
  br label %return, !dbg !1163

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1164
  br label %return, !dbg !1164

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1166
  br label %return, !dbg !1166

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1168
  ret i16 %16, !dbg !1168
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1169 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1172, metadata !DIExpression()), !dbg !1173
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1174, metadata !DIExpression()), !dbg !1175
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1176, metadata !DIExpression()), !dbg !1177
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1178
  %cmp = icmp eq i32 %0, 0, !dbg !1180
  br i1 %cmp, label %if.then, label %if.else, !dbg !1181

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1182
  br label %return, !dbg !1182

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1184
  %cmp1 = icmp sle i32 %1, 0, !dbg !1187
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1188

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1189
  br label %return, !dbg !1189

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1191
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1193
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1194
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1195
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1195
  %div = udiv i32 %3, %4, !dbg !1195, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1196
  %mul = mul i32 %div, %5, !dbg !1197
  %sub = sub i32 %2, %mul, !dbg !1198
  %shl = shl i32 %sub, 1, !dbg !1199
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1200
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1201
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1202
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1203
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1203
  %div4 = udiv i32 %6, %7, !dbg !1203, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1204
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1205
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1206
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1206
  %div5 = udiv i32 %8, %9, !dbg !1206, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1207
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1208
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1209
  store i32 %10, i32* %retval, align 4, !dbg !1210
  br label %return, !dbg !1210

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1211
  ret i32 %11, !dbg !1211
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1212 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1215, metadata !DIExpression()), !dbg !1216
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1217, metadata !DIExpression()), !dbg !1218
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1219, metadata !DIExpression()), !dbg !1220
  store i32 0, i32* %s32Temp1, align 4, !dbg !1220
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1221
  %cmp = icmp eq i32 %0, 0, !dbg !1223
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1224

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1225
  %cmp1 = icmp sge i32 %1, 0, !dbg !1228
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1229

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1230
  br label %return, !dbg !1230

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1232
  br label %return, !dbg !1232

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1234
  %cmp4 = icmp sge i32 %2, 0, !dbg !1237
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1238

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1239
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1241
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1242
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1243
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1243
  %div = udiv i32 %4, %5, !dbg !1243, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1244
  %mul = mul i32 %div, %6, !dbg !1245
  %sub = sub i32 %3, %mul, !dbg !1246
  %shl = shl i32 %sub, 1, !dbg !1247
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1248
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1249
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1250
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1251
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1251
  %div6 = udiv i32 %7, %8, !dbg !1251, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1252
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1253
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1254
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1254
  %div7 = udiv i32 %9, %10, !dbg !1254, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1255
  store i32 %add, i32* %retval, align 4, !dbg !1256
  br label %return, !dbg !1256

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1257
  br label %return, !dbg !1257

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1259
  ret i32 %11, !dbg !1259
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1260 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1263, metadata !DIExpression()), !dbg !1264
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1265, metadata !DIExpression()), !dbg !1266
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1267, metadata !DIExpression()), !dbg !1268
  store i32 0, i32* %u32Temp1, align 4, !dbg !1268
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1269, metadata !DIExpression()), !dbg !1270
  store i32 0, i32* %u32Temp2, align 4, !dbg !1270
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1271
  %cmp = icmp eq i32 %0, 0, !dbg !1273
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1274

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1275
  %cmp1 = icmp slt i32 %1, 0, !dbg !1278
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1279

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1280
  br label %return, !dbg !1280

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1282
  br label %return, !dbg !1282

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1284
  %cmp4 = icmp sge i32 %2, 0, !dbg !1287
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1288

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1289
  %cmp6 = icmp eq i32 %3, 0, !dbg !1292
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1293

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1294
  br label %return, !dbg !1294

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1296
  %cmp9 = icmp sle i32 %4, 0, !dbg !1299
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1300

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1301
  br label %return, !dbg !1301

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1303
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1305
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1306
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1307
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1307
  %div = sdiv i32 %6, %7, !dbg !1307, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1308
  %mul = mul nsw i32 %div, %8, !dbg !1309
  %sub = sub nsw i32 %5, %mul, !dbg !1310
  %shl = shl i32 %sub, 1, !dbg !1311
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1312
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1313
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1314
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1315
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1315
  %div12 = udiv i32 %9, %10, !dbg !1315, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1317
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1318
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1318
  %div13 = sdiv i32 %11, %12, !dbg !1318, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1319
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1320
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1321
  store i32 %13, i32* %retval, align 4, !dbg !1322
  br label %return, !dbg !1322

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1323
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1326
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1327

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1328
  br label %return, !dbg !1328

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1330
  %sub18 = sub nsw i32 0, %15, !dbg !1332
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1333
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1334
  %sub19 = sub nsw i32 0, %16, !dbg !1335
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1336
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1337
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1338
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1339
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1340
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1340
  %div20 = sdiv i32 %18, %19, !dbg !1340, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1341
  %mul21 = mul nsw i32 %div20, %20, !dbg !1342
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1343
  %shl23 = shl i32 %sub22, 1, !dbg !1344
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1345
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1346
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1347
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1348
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1348
  %div24 = udiv i32 %21, %22, !dbg !1348, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1349
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1350
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1351
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1351
  %div25 = sdiv i32 %23, %24, !dbg !1351, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1352
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1353
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1354
  store i32 %25, i32* %retval, align 4, !dbg !1355
  br label %return, !dbg !1355

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1356
  ret i32 %26, !dbg !1356
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1357 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1360, metadata !DIExpression()), !dbg !1361
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1362, metadata !DIExpression()), !dbg !1363
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1364, metadata !DIExpression()), !dbg !1365
  store i32 0, i32* %u32Temp1, align 4, !dbg !1365
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1366, metadata !DIExpression()), !dbg !1367
  store i32 0, i32* %u32Temp2, align 4, !dbg !1367
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1368, metadata !DIExpression()), !dbg !1369
  store i32 0, i32* %u32Temp3, align 4, !dbg !1369
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1370, metadata !DIExpression()), !dbg !1371
  store i32 0, i32* %numerator_old, align 4, !dbg !1371
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1372
  %cmp = icmp eq i32 %0, 0, !dbg !1374
  br i1 %cmp, label %if.then, label %if.else, !dbg !1375

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1376
  br label %return, !dbg !1376

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1378
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1380
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1381
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1383
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1383
  %div = udiv i32 %3, %4, !dbg !1383, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1384
  %sub = sub i32 %1, %mul, !dbg !1385
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1386
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1387
  %and = and i32 %5, 1, !dbg !1389
  %cmp1 = icmp eq i32 %and, 0, !dbg !1390
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1391

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %shr = lshr i32 %6, 1, !dbg !1394
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1395
  br label %if.end, !dbg !1396

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1397
  %shr4 = lshr i32 %7, 1, !dbg !1399
  %add = add i32 %shr4, 1, !dbg !1400
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1401
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1402
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1404
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1405
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1406

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1407
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1409
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1410
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1410
  %div7 = udiv i32 %10, %11, !dbg !1410, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1411
  br label %return, !dbg !1411

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1412
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1414
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1415
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1415
  %div9 = udiv i32 %12, %13, !dbg !1415, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1416
  store i32 %add10, i32* %retval, align 4, !dbg !1417
  br label %return, !dbg !1417

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1418
  ret i32 %14, !dbg !1418
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1419 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1422, metadata !DIExpression()), !dbg !1423
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1424, metadata !DIExpression()), !dbg !1425
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1426, metadata !DIExpression()), !dbg !1427
  store i32 0, i32* %u32Temp1, align 4, !dbg !1427
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1428, metadata !DIExpression()), !dbg !1429
  store i32 0, i32* %u32Temp2, align 4, !dbg !1429
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1430
  %cmp = icmp sle i32 %0, 0, !dbg !1432
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1433

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1434
  %cmp1 = icmp sge i32 %1, 0, !dbg !1437
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1438

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1439
  br label %return, !dbg !1439

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1441
  %sub = sub nsw i32 0, %2, !dbg !1443
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1444
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1445
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1446
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1447
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1448
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1448
  %div = udiv i32 %4, %5, !dbg !1448, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1449
  %mul = mul i32 %div, %6, !dbg !1450
  %sub3 = sub i32 %3, %mul, !dbg !1451
  %shl = shl i32 %sub3, 1, !dbg !1452
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1453
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1454
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1455
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1456
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1456
  %div4 = udiv i32 %7, %8, !dbg !1456, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1457
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1458
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1459
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1459
  %div5 = udiv i32 %9, %10, !dbg !1459, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1460
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1461
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1462
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1464
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1465

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1466
  %sub8 = sub i32 0, %12, !dbg !1468
  store i32 %sub8, i32* %retval, align 4, !dbg !1469
  br label %return, !dbg !1469

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1470
  br label %return, !dbg !1470

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1472
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1474
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1475
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1476
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1476
  %div11 = udiv i32 %14, %15, !dbg !1476, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1477
  %mul12 = mul i32 %div11, %16, !dbg !1478
  %sub13 = sub i32 %13, %mul12, !dbg !1479
  %shl14 = shl i32 %sub13, 1, !dbg !1480
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1481
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1482
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1483
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1484
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1484
  %div15 = udiv i32 %17, %18, !dbg !1484, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1485
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1486
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1487
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1487
  %div16 = udiv i32 %19, %20, !dbg !1487, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1488
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1489
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1490
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1492
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1493

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1494
  store i32 %22, i32* %retval, align 4, !dbg !1496
  br label %return, !dbg !1496

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1497
  br label %return, !dbg !1497

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1499
  ret i32 %23, !dbg !1499
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1500 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %u32Temp0 = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1503, metadata !DIExpression()), !dbg !1504
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1505, metadata !DIExpression()), !dbg !1506
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1507, metadata !DIExpression()), !dbg !1508
  store i32 0, i32* %s32Temp1, align 4, !dbg !1508
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1509, metadata !DIExpression()), !dbg !1510
  store i32 0, i32* %s32Temp2, align 4, !dbg !1510
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1511, metadata !DIExpression()), !dbg !1512
  store i32 0, i32* %u32Temp0, align 4, !dbg !1512
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1513, metadata !DIExpression()), !dbg !1514
  store i32 0, i32* %u32Temp1, align 4, !dbg !1514
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1515, metadata !DIExpression()), !dbg !1516
  store i32 0, i32* %u32Temp2, align 4, !dbg !1516
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %cmp = icmp eq i32 %0, 0, !dbg !1519
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1520

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1521
  %cmp1 = icmp slt i32 %1, 0, !dbg !1524
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1525

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1526
  br label %return, !dbg !1526

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1528
  br label %return, !dbg !1528

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1530
  %cmp4 = icmp sle i32 %2, 0, !dbg !1533
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1534

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1535
  %sub = sub nsw i32 0, %3, !dbg !1537
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1538
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1539
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1540
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1541
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1541
  %div = udiv i32 %4, %5, !dbg !1541, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1542
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1543
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1544
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1546
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1546
  %div6 = udiv i32 %7, %8, !dbg !1546, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1547
  %mul = mul i32 %div6, %9, !dbg !1548
  %sub7 = sub i32 %6, %mul, !dbg !1549
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1550
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1551
  %and = and i32 %10, 1, !dbg !1553
  %cmp8 = icmp eq i32 %and, 0, !dbg !1554
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1555

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1556
  %shr = lshr i32 %11, 1, !dbg !1558
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1559
  br label %if.end, !dbg !1560

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1561
  %shr11 = lshr i32 %12, 1, !dbg !1563
  %add = add i32 %shr11, 1, !dbg !1564
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1565
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1566
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1568
  %cmp12 = icmp ult i32 %13, %14, !dbg !1569
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1570

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1571
  %neg = xor i32 %15, -1, !dbg !1573
  %add14 = add i32 %neg, 1, !dbg !1574
  store i32 %add14, i32* %retval, align 4, !dbg !1575
  br label %return, !dbg !1575

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1576
  %add16 = add i32 %16, 1, !dbg !1578
  %neg17 = xor i32 %add16, -1, !dbg !1579
  %add18 = add i32 %neg17, 1, !dbg !1580
  store i32 %add18, i32* %retval, align 4, !dbg !1581
  br label %return, !dbg !1581

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1582
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1584
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1585
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1586
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1586
  %div20 = udiv i32 %18, %19, !dbg !1586, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1587
  %mul21 = mul i32 %div20, %20, !dbg !1588
  %sub22 = sub i32 %17, %mul21, !dbg !1589
  %shl = shl i32 %sub22, 1, !dbg !1590
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1591
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1592
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1593
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1594
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1594
  %div23 = udiv i32 %21, %22, !dbg !1594, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1595
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1596
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1597
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1597
  %div24 = udiv i32 %23, %24, !dbg !1597, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1598
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1599
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1600
  store i32 %25, i32* %retval, align 4, !dbg !1601
  br label %return, !dbg !1601

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1602
  ret i32 %26, !dbg !1602
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1603 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %denominator_prime = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32numerator = alloca i32, align 4
  %u32denominator = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1606, metadata !DIExpression()), !dbg !1607
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1608, metadata !DIExpression()), !dbg !1609
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1610, metadata !DIExpression()), !dbg !1611
  store i32 0, i32* %s32Temp1, align 4, !dbg !1611
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1612, metadata !DIExpression()), !dbg !1613
  store i32 0, i32* %s32Temp2, align 4, !dbg !1613
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1614, metadata !DIExpression()), !dbg !1615
  store i32 0, i32* %denominator_prime, align 4, !dbg !1615
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1616, metadata !DIExpression()), !dbg !1617
  store i32 0, i32* %u32Temp1, align 4, !dbg !1617
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1618, metadata !DIExpression()), !dbg !1619
  store i32 0, i32* %u32Temp2, align 4, !dbg !1619
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 0, i32* %u32numerator, align 4, !dbg !1621
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i32 0, i32* %u32denominator, align 4, !dbg !1623
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1624
  %cmp = icmp slt i32 %0, 0, !dbg !1626
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1627

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1628
  %cmp1 = icmp sle i32 %1, 0, !dbg !1631
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1632

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1633
  %cmp3 = icmp sge i32 %2, 0, !dbg !1636
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1637

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1638
  br label %return, !dbg !1638

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1640
  %sub = sub nsw i32 0, %3, !dbg !1642
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1643
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %sub5 = sub nsw i32 0, %4, !dbg !1645
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1646
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1647
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1648
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1649
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1650
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1650
  %div = udiv i32 %6, %7, !dbg !1650, !klee.check.div !101
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1651
  %mul = mul i32 %div, %8, !dbg !1652
  %sub6 = sub i32 %5, %mul, !dbg !1653
  %shl = shl i32 %sub6, 1, !dbg !1654
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1655
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1656
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1657
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1658
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1658
  %div7 = udiv i32 %9, %10, !dbg !1658, !klee.check.div !101
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1659
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1660
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1661
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1661
  %div8 = udiv i32 %11, %12, !dbg !1661, !klee.check.div !101
  %add = add i32 %div7, %div8, !dbg !1662
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1663
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1664
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1666
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1667

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1668
  store i32 %14, i32* %retval, align 4, !dbg !1670
  br label %return, !dbg !1670

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1671
  br label %return, !dbg !1671

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1673
  %neg = xor i32 %15, -1, !dbg !1675
  %add13 = add nsw i32 %neg, 1, !dbg !1676
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1677
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1678
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1679
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1680
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1681
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1681
  %div14 = udiv i32 %17, %18, !dbg !1681, !klee.check.div !101
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1682
  %mul15 = mul i32 %div14, %19, !dbg !1683
  %sub16 = sub i32 %16, %mul15, !dbg !1684
  %shl17 = shl i32 %sub16, 1, !dbg !1685
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1686
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1687
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1688
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1689
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1689
  %div18 = udiv i32 %20, %21, !dbg !1689, !klee.check.div !101
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1690
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1692
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1692
  %div19 = sdiv i32 %22, %23, !dbg !1692, !klee.check.div !101
  %add20 = add i32 %div18, %div19, !dbg !1693
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1694
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1695
  %neg21 = xor i32 %24, -1, !dbg !1696
  %add22 = add nsw i32 %neg21, 1, !dbg !1697
  store i32 %add22, i32* %retval, align 4, !dbg !1698
  br label %return, !dbg !1698

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1699
  %cmp24 = icmp sle i32 %25, 0, !dbg !1702
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1703

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1704
  %cmp26 = icmp sge i32 %26, 0, !dbg !1707
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1708

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1709
  br label %return, !dbg !1709

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1711
  %neg29 = xor i32 %27, -1, !dbg !1713
  %add30 = add nsw i32 %neg29, 1, !dbg !1714
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1715
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1716
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1717
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1718
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1719
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1719
  %div31 = udiv i32 %29, %30, !dbg !1719, !klee.check.div !101
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1720
  %mul32 = mul i32 %div31, %31, !dbg !1721
  %sub33 = sub i32 %28, %mul32, !dbg !1722
  %shl34 = shl i32 %sub33, 1, !dbg !1723
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1724
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1725
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1726
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1727
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1727
  %div35 = udiv i32 %32, %33, !dbg !1727, !klee.check.div !101
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1728
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1729
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1730
  %div36 = udiv i32 %34, %35, !dbg !1730, !klee.check.div !101
  %add37 = add i32 %div35, %div36, !dbg !1731
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1732
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1733
  %neg38 = xor i32 %36, -1, !dbg !1734
  %add39 = add nsw i32 %neg38, 1, !dbg !1735
  store i32 %add39, i32* %retval, align 4, !dbg !1736
  br label %return, !dbg !1736

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1737
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1739
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1740
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1741
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1741
  %div41 = sdiv i32 %38, %39, !dbg !1741, !klee.check.div !101
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1742
  %mul42 = mul nsw i32 %div41, %40, !dbg !1743
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1744
  %shl44 = shl i32 %sub43, 1, !dbg !1745
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1746
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1747
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1748
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1749
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1749
  %div45 = sdiv i32 %41, %42, !dbg !1749, !klee.check.div !101
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1750
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1751
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1752
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1752
  %div46 = udiv i32 %43, %44, !dbg !1752, !klee.check.div !101
  %add47 = add i32 %div45, %div46, !dbg !1753
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1754
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1755
  store i32 %45, i32* %retval, align 4, !dbg !1756
  br label %return, !dbg !1756

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1757
  ret i32 %46, !dbg !1757
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1758 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %numerator_prime = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1761, metadata !DIExpression()), !dbg !1762
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1763, metadata !DIExpression()), !dbg !1764
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1765, metadata !DIExpression()), !dbg !1766
  store i32 0, i32* %numerator_prime, align 4, !dbg !1766
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1767, metadata !DIExpression()), !dbg !1768
  store i32 0, i32* %u32Temp1, align 4, !dbg !1768
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1769, metadata !DIExpression()), !dbg !1770
  store i32 0, i32* %u32Temp2, align 4, !dbg !1770
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1771, metadata !DIExpression()), !dbg !1772
  store i32 0, i32* %u32Temp3, align 4, !dbg !1772
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1773, metadata !DIExpression()), !dbg !1774
  store i32 0, i32* %s32Temp1, align 4, !dbg !1774
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1775, metadata !DIExpression()), !dbg !1776
  store i32 0, i32* %s32Temp2, align 4, !dbg !1776
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1777, metadata !DIExpression()), !dbg !1778
  store i32 0, i32* %s32Temp3, align 4, !dbg !1778
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1779
  %cmp = icmp eq i32 %0, 0, !dbg !1781
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1782

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1783
  %cmp1 = icmp slt i32 %1, 0, !dbg !1786
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1787

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1788
  br label %return, !dbg !1788

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1790
  br label %return, !dbg !1790

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1792
  %cmp4 = icmp slt i32 %2, 0, !dbg !1795
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1796

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1797
  %sub = sub nsw i32 0, %3, !dbg !1799
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1800
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1801
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1802
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1803
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1803
  %div = udiv i32 %4, %5, !dbg !1803, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1804
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1805
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1806
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1807
  %mul = mul i32 %7, %8, !dbg !1808
  %sub6 = sub i32 %6, %mul, !dbg !1809
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1810
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1811
  %and = and i32 %9, 1, !dbg !1813
  %cmp7 = icmp eq i32 %and, 0, !dbg !1814
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1815

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %shr = lshr i32 %10, 1, !dbg !1818
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1819
  br label %if.end, !dbg !1820

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %shr10 = lshr i32 %11, 1, !dbg !1823
  %add = add i32 %shr10, 1, !dbg !1824
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1825
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1826
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1828
  %cmp11 = icmp ult i32 %12, %13, !dbg !1829
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1830

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1831
  %neg = xor i32 %14, -1, !dbg !1833
  %add13 = add i32 %neg, 1, !dbg !1834
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1835
  br label %if.end18, !dbg !1836

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1837
  %add15 = add i32 %15, 1, !dbg !1839
  %neg16 = xor i32 %add15, -1, !dbg !1840
  %add17 = add i32 %neg16, 1, !dbg !1841
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1842
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1843
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1845
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1846

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1847
  %conv = trunc i32 %17 to i16, !dbg !1849
  store i16 %conv, i16* %retval, align 2, !dbg !1850
  br label %return, !dbg !1850

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1851
  br label %return, !dbg !1851

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1853
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1855
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1856
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1856
  %div23 = udiv i32 %18, %19, !dbg !1856, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1857
  %mul24 = mul i32 %div23, %20, !dbg !1858
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1859
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1860
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1861
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1862
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1863
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1863
  %div25 = udiv i32 %22, %23, !dbg !1863, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1864
  %mul26 = mul i32 %div25, %24, !dbg !1865
  %sub27 = sub i32 %21, %mul26, !dbg !1866
  %shl = shl i32 %sub27, 1, !dbg !1867
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1868
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1869
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1870
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1871
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1871
  %div28 = udiv i32 %25, %26, !dbg !1871, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1872
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1873
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1874
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1874
  %div29 = udiv i32 %27, %28, !dbg !1874, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1875
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1876
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1877
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1879
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1880

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1881
  %conv34 = trunc i32 %30 to i16, !dbg !1883
  store i16 %conv34, i16* %retval, align 2, !dbg !1884
  br label %return, !dbg !1884

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1885
  br label %return, !dbg !1885

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1887
  ret i16 %31, !dbg !1887
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1888 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1894, metadata !DIExpression()), !dbg !1895
  %2 = icmp eq i64 %0, 0, !dbg !1896
  br i1 %2, label %3, label %4, !dbg !1898

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1899
  unreachable, !dbg !1899

4:                                                ; preds = %1
  ret void, !dbg !1900
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!29, !2, !31}
!llvm.ident = !{!33, !33, !34}
!llvm.module.flags = !{!35, !36, !37, !38, !39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !27, line: 21, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054/div_Ccode_alarm_0054.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!4 = !{}
!5 = !{!6, !13, !16, !17, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !15)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !19, line: 24, baseType: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !21)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !19, line: 25, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !{!0}
!27 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!28 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!30 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!31 = distinct !DICompileUnit(language: DW_LANG_C89, file: !32, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!32 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!33 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!34 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{i32 7, !"uwtable", i32 1}
!39 = !{i32 7, !"frame-pointer", i32 2}
!40 = distinct !DISubprogram(name: "main", scope: !41, file: !41, line: 7, type: !42, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !29, retainedNodes: !4)
!41 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!42 = !DISubroutineType(types: !43)
!43 = !{!16}
!44 = !DILocalVariable(name: "numerator", scope: !40, file: !41, line: 9, type: !8)
!45 = !DILocation(line: 9, column: 13, scope: !40)
!46 = !DILocalVariable(name: "denominator", scope: !40, file: !41, line: 10, type: !23)
!47 = !DILocation(line: 10, column: 14, scope: !40)
!48 = !DILocalVariable(name: "result", scope: !40, file: !41, line: 11, type: !8)
!49 = !DILocation(line: 11, column: 13, scope: !40)
!50 = !DILocation(line: 13, column: 24, scope: !40)
!51 = !DILocation(line: 13, column: 5, scope: !40)
!52 = !DILocation(line: 14, column: 24, scope: !40)
!53 = !DILocation(line: 14, column: 5, scope: !40)
!54 = !DILocation(line: 16, column: 36, scope: !40)
!55 = !DILocation(line: 16, column: 47, scope: !40)
!56 = !DILocation(line: 16, column: 14, scope: !40)
!57 = !DILocation(line: 16, column: 12, scope: !40)
!58 = !DILocation(line: 18, column: 11, scope: !40)
!59 = !DILocation(line: 19, column: 5, scope: !40)
!60 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !61, file: !61, line: 170, type: !62, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0054")
!62 = !DISubroutineType(types: !63)
!63 = !{!6, !6, !6}
!64 = !DILocalVariable(name: "numerator", arg: 1, scope: !60, file: !61, line: 170, type: !6)
!65 = !DILocation(line: 170, column: 31, scope: !60)
!66 = !DILocalVariable(name: "denominator", arg: 2, scope: !60, file: !61, line: 170, type: !6)
!67 = !DILocation(line: 170, column: 47, scope: !60)
!68 = !DILocalVariable(name: "s32Temp1", scope: !60, file: !61, line: 172, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !16)
!72 = !DILocation(line: 172, column: 6, scope: !60)
!73 = !DILocalVariable(name: "s32Temp2", scope: !60, file: !61, line: 172, type: !69)
!74 = !DILocation(line: 172, column: 15, scope: !60)
!75 = !DILocation(line: 173, column: 13, scope: !60)
!76 = !DILocation(line: 173, column: 22, scope: !60)
!77 = !DILocation(line: 173, column: 11, scope: !60)
!78 = !DILocation(line: 175, column: 6, scope: !79)
!79 = distinct !DILexicalBlock(scope: !60, file: !61, line: 175, column: 6)
!80 = !DILocation(line: 175, column: 18, scope: !79)
!81 = !DILocation(line: 175, column: 6, scope: !60)
!82 = !DILocation(line: 177, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !61, line: 177, column: 7)
!84 = distinct !DILexicalBlock(scope: !79, file: !61, line: 176, column: 2)
!85 = !DILocation(line: 177, column: 17, scope: !83)
!86 = !DILocation(line: 177, column: 7, scope: !84)
!87 = !DILocation(line: 179, column: 4, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !61, line: 178, column: 3)
!89 = !DILocation(line: 183, column: 4, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !61, line: 182, column: 3)
!91 = !DILocation(line: 188, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !61, line: 188, column: 7)
!93 = distinct !DILexicalBlock(scope: !79, file: !61, line: 187, column: 2)
!94 = !DILocation(line: 188, column: 16, scope: !92)
!95 = !DILocation(line: 188, column: 7, scope: !93)
!96 = !DILocation(line: 190, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !61, line: 189, column: 3)
!98 = !DILocation(line: 190, column: 28, scope: !97)
!99 = !DILocation(line: 190, column: 37, scope: !97)
!100 = !DILocation(line: 190, column: 36, scope: !97)
!101 = !{!"True"}
!102 = !DILocation(line: 190, column: 52, scope: !97)
!103 = !DILocation(line: 190, column: 50, scope: !97)
!104 = !DILocation(line: 190, column: 25, scope: !97)
!105 = !DILocation(line: 190, column: 65, scope: !97)
!106 = !DILocation(line: 190, column: 13, scope: !97)
!107 = !DILocation(line: 191, column: 15, scope: !97)
!108 = !DILocation(line: 191, column: 24, scope: !97)
!109 = !DILocation(line: 191, column: 23, scope: !97)
!110 = !DILocation(line: 191, column: 13, scope: !97)
!111 = !DILocation(line: 192, column: 15, scope: !97)
!112 = !DILocation(line: 192, column: 27, scope: !97)
!113 = !DILocation(line: 192, column: 36, scope: !97)
!114 = !DILocation(line: 192, column: 42, scope: !97)
!115 = !DILocation(line: 192, column: 41, scope: !97)
!116 = !DILocation(line: 192, column: 24, scope: !97)
!117 = !DILocation(line: 192, column: 13, scope: !97)
!118 = !DILocation(line: 193, column: 7, scope: !119)
!119 = distinct !DILexicalBlock(scope: !97, file: !61, line: 193, column: 7)
!120 = !DILocation(line: 193, column: 16, scope: !119)
!121 = !DILocation(line: 193, column: 7, scope: !97)
!122 = !DILocation(line: 195, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !61, line: 195, column: 8)
!124 = distinct !DILexicalBlock(scope: !119, file: !61, line: 194, column: 4)
!125 = !DILocation(line: 195, column: 17, scope: !123)
!126 = !DILocation(line: 195, column: 8, scope: !124)
!127 = !DILocation(line: 197, column: 18, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !61, line: 196, column: 5)
!129 = !DILocation(line: 197, column: 13, scope: !128)
!130 = !DILocation(line: 197, column: 6, scope: !128)
!131 = !DILocation(line: 201, column: 6, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !61, line: 200, column: 5)
!133 = !DILocation(line: 206, column: 5, scope: !134)
!134 = distinct !DILexicalBlock(scope: !119, file: !61, line: 205, column: 4)
!135 = !DILocation(line: 211, column: 7, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !61, line: 211, column: 7)
!137 = distinct !DILexicalBlock(scope: !92, file: !61, line: 210, column: 3)
!138 = !DILocation(line: 211, column: 19, scope: !136)
!139 = !DILocation(line: 211, column: 7, scope: !137)
!140 = !DILocation(line: 213, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !61, line: 212, column: 4)
!142 = !DILocation(line: 213, column: 29, scope: !141)
!143 = !DILocation(line: 213, column: 38, scope: !141)
!144 = !DILocation(line: 213, column: 37, scope: !141)
!145 = !DILocation(line: 213, column: 53, scope: !141)
!146 = !DILocation(line: 213, column: 51, scope: !141)
!147 = !DILocation(line: 213, column: 26, scope: !141)
!148 = !DILocation(line: 213, column: 66, scope: !141)
!149 = !DILocation(line: 213, column: 14, scope: !141)
!150 = !DILocation(line: 214, column: 16, scope: !141)
!151 = !DILocation(line: 214, column: 25, scope: !141)
!152 = !DILocation(line: 214, column: 24, scope: !141)
!153 = !DILocation(line: 214, column: 14, scope: !141)
!154 = !DILocation(line: 215, column: 16, scope: !141)
!155 = !DILocation(line: 215, column: 28, scope: !141)
!156 = !DILocation(line: 215, column: 37, scope: !141)
!157 = !DILocation(line: 215, column: 43, scope: !141)
!158 = !DILocation(line: 215, column: 42, scope: !141)
!159 = !DILocation(line: 215, column: 25, scope: !141)
!160 = !DILocation(line: 215, column: 14, scope: !141)
!161 = !DILocation(line: 216, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !141, file: !61, line: 216, column: 8)
!163 = !DILocation(line: 216, column: 17, scope: !162)
!164 = !DILocation(line: 216, column: 8, scope: !141)
!165 = !DILocation(line: 218, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !61, line: 218, column: 9)
!167 = distinct !DILexicalBlock(scope: !162, file: !61, line: 217, column: 5)
!168 = !DILocation(line: 218, column: 18, scope: !166)
!169 = !DILocation(line: 218, column: 9, scope: !167)
!170 = !DILocation(line: 220, column: 19, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !61, line: 219, column: 6)
!172 = !DILocation(line: 220, column: 14, scope: !171)
!173 = !DILocation(line: 220, column: 7, scope: !171)
!174 = !DILocation(line: 224, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !61, line: 223, column: 6)
!176 = !DILocation(line: 229, column: 6, scope: !177)
!177 = distinct !DILexicalBlock(scope: !162, file: !61, line: 228, column: 5)
!178 = !DILocation(line: 234, column: 5, scope: !179)
!179 = distinct !DILexicalBlock(scope: !136, file: !61, line: 233, column: 4)
!180 = !DILocation(line: 238, column: 1, scope: !60)
!181 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !61, file: !61, line: 255, type: !182, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DISubroutineType(types: !183)
!183 = !{!6, !69, !6}
!184 = !DILocalVariable(name: "numerator", arg: 1, scope: !181, file: !61, line: 255, type: !69)
!185 = !DILocation(line: 255, column: 25, scope: !181)
!186 = !DILocalVariable(name: "denominator", arg: 2, scope: !181, file: !61, line: 255, type: !6)
!187 = !DILocation(line: 255, column: 41, scope: !181)
!188 = !DILocalVariable(name: "s32Temp1", scope: !181, file: !61, line: 257, type: !69)
!189 = !DILocation(line: 257, column: 6, scope: !181)
!190 = !DILocalVariable(name: "s32Temp2", scope: !181, file: !61, line: 257, type: !69)
!191 = !DILocation(line: 257, column: 17, scope: !181)
!192 = !DILocation(line: 258, column: 13, scope: !181)
!193 = !DILocation(line: 258, column: 11, scope: !181)
!194 = !DILocation(line: 259, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !181, file: !61, line: 259, column: 5)
!196 = !DILocation(line: 259, column: 17, scope: !195)
!197 = !DILocation(line: 259, column: 5, scope: !181)
!198 = !DILocation(line: 261, column: 7, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !61, line: 261, column: 7)
!200 = distinct !DILexicalBlock(scope: !195, file: !61, line: 260, column: 2)
!201 = !DILocation(line: 261, column: 17, scope: !199)
!202 = !DILocation(line: 261, column: 7, scope: !200)
!203 = !DILocation(line: 263, column: 4, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !61, line: 262, column: 3)
!205 = !DILocation(line: 267, column: 4, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !61, line: 266, column: 3)
!207 = !DILocation(line: 272, column: 6, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !61, line: 272, column: 6)
!209 = distinct !DILexicalBlock(scope: !195, file: !61, line: 271, column: 2)
!210 = !DILocation(line: 272, column: 16, scope: !208)
!211 = !DILocation(line: 272, column: 6, scope: !209)
!212 = !DILocation(line: 274, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !61, line: 273, column: 3)
!214 = !DILocation(line: 274, column: 28, scope: !213)
!215 = !DILocation(line: 274, column: 37, scope: !213)
!216 = !DILocation(line: 274, column: 36, scope: !213)
!217 = !DILocation(line: 274, column: 52, scope: !213)
!218 = !DILocation(line: 274, column: 50, scope: !213)
!219 = !DILocation(line: 274, column: 25, scope: !213)
!220 = !DILocation(line: 274, column: 65, scope: !213)
!221 = !DILocation(line: 274, column: 13, scope: !213)
!222 = !DILocation(line: 275, column: 15, scope: !213)
!223 = !DILocation(line: 275, column: 24, scope: !213)
!224 = !DILocation(line: 275, column: 23, scope: !213)
!225 = !DILocation(line: 275, column: 13, scope: !213)
!226 = !DILocation(line: 276, column: 15, scope: !213)
!227 = !DILocation(line: 276, column: 27, scope: !213)
!228 = !DILocation(line: 276, column: 38, scope: !213)
!229 = !DILocation(line: 276, column: 37, scope: !213)
!230 = !DILocation(line: 276, column: 24, scope: !213)
!231 = !DILocation(line: 276, column: 13, scope: !213)
!232 = !DILocation(line: 277, column: 7, scope: !233)
!233 = distinct !DILexicalBlock(scope: !213, file: !61, line: 277, column: 7)
!234 = !DILocation(line: 277, column: 16, scope: !233)
!235 = !DILocation(line: 277, column: 7, scope: !213)
!236 = !DILocation(line: 279, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !238, file: !61, line: 279, column: 8)
!238 = distinct !DILexicalBlock(scope: !233, file: !61, line: 278, column: 4)
!239 = !DILocation(line: 279, column: 17, scope: !237)
!240 = !DILocation(line: 279, column: 8, scope: !238)
!241 = !DILocation(line: 281, column: 18, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !61, line: 280, column: 5)
!243 = !DILocation(line: 281, column: 13, scope: !242)
!244 = !DILocation(line: 281, column: 6, scope: !242)
!245 = !DILocation(line: 285, column: 6, scope: !246)
!246 = distinct !DILexicalBlock(scope: !237, file: !61, line: 284, column: 5)
!247 = !DILocation(line: 290, column: 5, scope: !248)
!248 = distinct !DILexicalBlock(scope: !233, file: !61, line: 289, column: 4)
!249 = !DILocation(line: 295, column: 7, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !61, line: 295, column: 7)
!251 = distinct !DILexicalBlock(scope: !208, file: !61, line: 294, column: 3)
!252 = !DILocation(line: 295, column: 19, scope: !250)
!253 = !DILocation(line: 295, column: 7, scope: !251)
!254 = !DILocation(line: 297, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !61, line: 296, column: 4)
!256 = !DILocation(line: 297, column: 29, scope: !255)
!257 = !DILocation(line: 297, column: 38, scope: !255)
!258 = !DILocation(line: 297, column: 37, scope: !255)
!259 = !DILocation(line: 297, column: 53, scope: !255)
!260 = !DILocation(line: 297, column: 51, scope: !255)
!261 = !DILocation(line: 297, column: 26, scope: !255)
!262 = !DILocation(line: 297, column: 66, scope: !255)
!263 = !DILocation(line: 297, column: 14, scope: !255)
!264 = !DILocation(line: 298, column: 16, scope: !255)
!265 = !DILocation(line: 298, column: 25, scope: !255)
!266 = !DILocation(line: 298, column: 24, scope: !255)
!267 = !DILocation(line: 298, column: 14, scope: !255)
!268 = !DILocation(line: 299, column: 16, scope: !255)
!269 = !DILocation(line: 299, column: 28, scope: !255)
!270 = !DILocation(line: 299, column: 39, scope: !255)
!271 = !DILocation(line: 299, column: 38, scope: !255)
!272 = !DILocation(line: 299, column: 25, scope: !255)
!273 = !DILocation(line: 299, column: 14, scope: !255)
!274 = !DILocation(line: 300, column: 8, scope: !275)
!275 = distinct !DILexicalBlock(scope: !255, file: !61, line: 300, column: 8)
!276 = !DILocation(line: 300, column: 17, scope: !275)
!277 = !DILocation(line: 300, column: 8, scope: !255)
!278 = !DILocation(line: 302, column: 9, scope: !279)
!279 = distinct !DILexicalBlock(scope: !280, file: !61, line: 302, column: 9)
!280 = distinct !DILexicalBlock(scope: !275, file: !61, line: 301, column: 5)
!281 = !DILocation(line: 302, column: 18, scope: !279)
!282 = !DILocation(line: 302, column: 9, scope: !280)
!283 = !DILocation(line: 304, column: 19, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !61, line: 303, column: 6)
!285 = !DILocation(line: 304, column: 14, scope: !284)
!286 = !DILocation(line: 304, column: 7, scope: !284)
!287 = !DILocation(line: 308, column: 7, scope: !288)
!288 = distinct !DILexicalBlock(scope: !279, file: !61, line: 307, column: 6)
!289 = !DILocation(line: 313, column: 6, scope: !290)
!290 = distinct !DILexicalBlock(scope: !275, file: !61, line: 312, column: 5)
!291 = !DILocation(line: 319, column: 5, scope: !292)
!292 = distinct !DILexicalBlock(scope: !250, file: !61, line: 318, column: 4)
!293 = !DILocation(line: 325, column: 1, scope: !181)
!294 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !61, file: !61, line: 343, type: !295, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!295 = !DISubroutineType(types: !296)
!296 = !{!6, !6, !22}
!297 = !DILocalVariable(name: "numerator", arg: 1, scope: !294, file: !61, line: 343, type: !6)
!298 = !DILocation(line: 343, column: 31, scope: !294)
!299 = !DILocalVariable(name: "denominator", arg: 2, scope: !294, file: !61, line: 343, type: !22)
!300 = !DILocation(line: 343, column: 47, scope: !294)
!301 = !DILocalVariable(name: "u16Temp1", scope: !294, file: !61, line: 345, type: !22)
!302 = !DILocation(line: 345, column: 6, scope: !294)
!303 = !DILocalVariable(name: "s32Temp1", scope: !294, file: !61, line: 346, type: !69)
!304 = !DILocation(line: 346, column: 6, scope: !294)
!305 = !DILocalVariable(name: "s32Temp2", scope: !294, file: !61, line: 346, type: !69)
!306 = !DILocation(line: 346, column: 15, scope: !294)
!307 = !DILocation(line: 347, column: 13, scope: !294)
!308 = !DILocation(line: 347, column: 25, scope: !294)
!309 = !DILocation(line: 347, column: 11, scope: !294)
!310 = !DILocation(line: 349, column: 61, scope: !311)
!311 = distinct !DILexicalBlock(scope: !294, file: !61, line: 349, column: 6)
!312 = !DILocation(line: 349, column: 56, scope: !311)
!313 = !DILocation(line: 349, column: 46, scope: !311)
!314 = !DILocation(line: 349, column: 8, scope: !311)
!315 = !DILocation(line: 349, column: 6, scope: !294)
!316 = !DILocation(line: 350, column: 6, scope: !317)
!317 = distinct !DILexicalBlock(scope: !311, file: !61, line: 349, column: 75)
!318 = !DILocation(line: 352, column: 13, scope: !294)
!319 = !DILocation(line: 352, column: 22, scope: !294)
!320 = !DILocation(line: 352, column: 11, scope: !294)
!321 = !DILocation(line: 353, column: 5, scope: !322)
!322 = distinct !DILexicalBlock(scope: !294, file: !61, line: 353, column: 5)
!323 = !DILocation(line: 353, column: 14, scope: !322)
!324 = !DILocation(line: 353, column: 5, scope: !294)
!325 = !DILocation(line: 355, column: 7, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !61, line: 355, column: 7)
!327 = distinct !DILexicalBlock(scope: !322, file: !61, line: 354, column: 2)
!328 = !DILocation(line: 355, column: 17, scope: !326)
!329 = !DILocation(line: 355, column: 7, scope: !327)
!330 = !DILocation(line: 357, column: 4, scope: !331)
!331 = distinct !DILexicalBlock(scope: !326, file: !61, line: 356, column: 3)
!332 = !DILocation(line: 361, column: 4, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !61, line: 360, column: 3)
!334 = !DILocation(line: 367, column: 61, scope: !335)
!335 = distinct !DILexicalBlock(scope: !336, file: !61, line: 367, column: 7)
!336 = distinct !DILexicalBlock(scope: !322, file: !61, line: 365, column: 2)
!337 = !DILocation(line: 367, column: 56, scope: !335)
!338 = !DILocation(line: 367, column: 71, scope: !335)
!339 = !DILocation(line: 367, column: 85, scope: !335)
!340 = !DILocation(line: 367, column: 80, scope: !335)
!341 = !DILocation(line: 367, column: 78, scope: !335)
!342 = !DILocation(line: 367, column: 34, scope: !335)
!343 = !DILocation(line: 367, column: 112, scope: !335)
!344 = !DILocation(line: 367, column: 107, scope: !335)
!345 = !DILocation(line: 367, column: 97, scope: !335)
!346 = !DILocation(line: 367, column: 9, scope: !335)
!347 = !DILocation(line: 367, column: 7, scope: !336)
!348 = !DILocation(line: 368, column: 7, scope: !349)
!349 = distinct !DILexicalBlock(scope: !335, file: !61, line: 367, column: 125)
!350 = !DILocation(line: 375, column: 52, scope: !336)
!351 = !DILocation(line: 375, column: 47, scope: !336)
!352 = !DILocation(line: 375, column: 62, scope: !336)
!353 = !DILocation(line: 375, column: 76, scope: !336)
!354 = !DILocation(line: 375, column: 71, scope: !336)
!355 = !DILocation(line: 375, column: 69, scope: !336)
!356 = !DILocation(line: 375, column: 93, scope: !336)
!357 = !DILocation(line: 375, column: 88, scope: !336)
!358 = !DILocation(line: 375, column: 86, scope: !336)
!359 = !DILocation(line: 375, column: 25, scope: !336)
!360 = !DILocation(line: 375, column: 23, scope: !336)
!361 = !DILocation(line: 376, column: 3, scope: !336)
!362 = !DILocation(line: 396, column: 1, scope: !294)
!363 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !27, file: !27, line: 84, type: !364, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!364 = !DISubroutineType(types: !365)
!365 = !{!16, !13}
!366 = !DILocalVariable(name: "left", arg: 1, scope: !363, file: !27, line: 84, type: !13)
!367 = !DILocation(line: 84, column: 51, scope: !363)
!368 = !DILocation(line: 86, column: 12, scope: !363)
!369 = !DILocation(line: 86, column: 17, scope: !363)
!370 = !DILocation(line: 86, column: 5, scope: !363)
!371 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !27, file: !27, line: 78, type: !372, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!372 = !DISubroutineType(types: !373)
!373 = !{!16, !13, !13}
!374 = !DILocalVariable(name: "left", arg: 1, scope: !371, file: !27, line: 78, type: !13)
!375 = !DILocation(line: 78, column: 38, scope: !371)
!376 = !DILocalVariable(name: "right", arg: 2, scope: !371, file: !27, line: 78, type: !13)
!377 = !DILocation(line: 78, column: 52, scope: !371)
!378 = !DILocation(line: 80, column: 12, scope: !371)
!379 = !DILocation(line: 80, column: 19, scope: !371)
!380 = !DILocation(line: 80, column: 17, scope: !371)
!381 = !DILocation(line: 80, column: 25, scope: !371)
!382 = !DILocation(line: 80, column: 5, scope: !371)
!383 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !61, file: !61, line: 413, type: !295, scopeLine: 414, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!384 = !DILocalVariable(name: "numerator", arg: 1, scope: !383, file: !61, line: 413, type: !6)
!385 = !DILocation(line: 413, column: 30, scope: !383)
!386 = !DILocalVariable(name: "denominator", arg: 2, scope: !383, file: !61, line: 413, type: !22)
!387 = !DILocation(line: 413, column: 45, scope: !383)
!388 = !DILocalVariable(name: "u16Temp1", scope: !383, file: !61, line: 415, type: !22)
!389 = !DILocation(line: 415, column: 6, scope: !383)
!390 = !DILocalVariable(name: "s32Temp1", scope: !383, file: !61, line: 416, type: !69)
!391 = !DILocation(line: 416, column: 6, scope: !383)
!392 = !DILocation(line: 417, column: 13, scope: !383)
!393 = !DILocation(line: 417, column: 25, scope: !383)
!394 = !DILocation(line: 417, column: 11, scope: !383)
!395 = !DILocation(line: 418, column: 5, scope: !396)
!396 = distinct !DILexicalBlock(scope: !383, file: !61, line: 418, column: 5)
!397 = !DILocation(line: 418, column: 13, scope: !396)
!398 = !DILocation(line: 418, column: 5, scope: !383)
!399 = !DILocation(line: 420, column: 6, scope: !400)
!400 = distinct !DILexicalBlock(scope: !401, file: !61, line: 420, column: 6)
!401 = distinct !DILexicalBlock(scope: !396, file: !61, line: 419, column: 2)
!402 = !DILocation(line: 420, column: 15, scope: !400)
!403 = !DILocation(line: 420, column: 6, scope: !401)
!404 = !DILocation(line: 422, column: 4, scope: !405)
!405 = distinct !DILexicalBlock(scope: !400, file: !61, line: 421, column: 3)
!406 = !DILocation(line: 426, column: 4, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !61, line: 425, column: 3)
!408 = !DILocation(line: 432, column: 15, scope: !409)
!409 = distinct !DILexicalBlock(scope: !396, file: !61, line: 431, column: 2)
!410 = !DILocation(line: 432, column: 27, scope: !409)
!411 = !DILocation(line: 432, column: 37, scope: !409)
!412 = !DILocation(line: 432, column: 36, scope: !409)
!413 = !DILocation(line: 432, column: 49, scope: !409)
!414 = !DILocation(line: 432, column: 47, scope: !409)
!415 = !DILocation(line: 432, column: 25, scope: !409)
!416 = !DILocation(line: 432, column: 59, scope: !409)
!417 = !DILocation(line: 432, column: 12, scope: !409)
!418 = !DILocation(line: 433, column: 15, scope: !409)
!419 = !DILocation(line: 433, column: 24, scope: !409)
!420 = !DILocation(line: 433, column: 23, scope: !409)
!421 = !DILocation(line: 433, column: 37, scope: !409)
!422 = !DILocation(line: 433, column: 47, scope: !409)
!423 = !DILocation(line: 433, column: 46, scope: !409)
!424 = !DILocation(line: 433, column: 34, scope: !409)
!425 = !DILocation(line: 433, column: 12, scope: !409)
!426 = !DILocation(line: 434, column: 10, scope: !409)
!427 = !DILocation(line: 434, column: 3, scope: !409)
!428 = !DILocation(line: 436, column: 1, scope: !383)
!429 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !61, file: !61, line: 454, type: !430, scopeLine: 455, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!430 = !DISubroutineType(types: !431)
!431 = !{!17, !22, !22}
!432 = !DILocalVariable(name: "numerator", arg: 1, scope: !429, file: !61, line: 454, type: !22)
!433 = !DILocation(line: 454, column: 28, scope: !429)
!434 = !DILocalVariable(name: "denominator", arg: 2, scope: !429, file: !61, line: 454, type: !22)
!435 = !DILocation(line: 454, column: 43, scope: !429)
!436 = !DILocalVariable(name: "u32Temp1", scope: !429, file: !61, line: 456, type: !437)
!437 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !438)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !439)
!439 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !440)
!440 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!441 = !DILocation(line: 456, column: 6, scope: !429)
!442 = !DILocalVariable(name: "u32Temp2", scope: !429, file: !61, line: 456, type: !437)
!443 = !DILocation(line: 456, column: 20, scope: !429)
!444 = !DILocalVariable(name: "u32Temp3", scope: !429, file: !61, line: 456, type: !437)
!445 = !DILocation(line: 456, column: 33, scope: !429)
!446 = !DILocation(line: 457, column: 5, scope: !447)
!447 = distinct !DILexicalBlock(scope: !429, file: !61, line: 457, column: 5)
!448 = !DILocation(line: 457, column: 16, scope: !447)
!449 = !DILocation(line: 457, column: 5, scope: !429)
!450 = !DILocation(line: 459, column: 3, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !61, line: 458, column: 2)
!452 = !DILocation(line: 463, column: 15, scope: !453)
!453 = distinct !DILexicalBlock(scope: !447, file: !61, line: 462, column: 2)
!454 = !DILocation(line: 463, column: 24, scope: !453)
!455 = !DILocation(line: 463, column: 12, scope: !453)
!456 = !DILocation(line: 464, column: 14, scope: !453)
!457 = !DILocation(line: 464, column: 25, scope: !453)
!458 = !DILocation(line: 464, column: 23, scope: !453)
!459 = !DILocation(line: 464, column: 12, scope: !453)
!460 = !DILocation(line: 465, column: 15, scope: !453)
!461 = !DILocation(line: 465, column: 24, scope: !453)
!462 = !DILocation(line: 465, column: 32, scope: !453)
!463 = !DILocation(line: 465, column: 12, scope: !453)
!464 = !DILocation(line: 466, column: 6, scope: !465)
!465 = distinct !DILexicalBlock(scope: !453, file: !61, line: 466, column: 6)
!466 = !DILocation(line: 466, column: 15, scope: !465)
!467 = !DILocation(line: 466, column: 6, scope: !453)
!468 = !DILocation(line: 468, column: 15, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !61, line: 467, column: 3)
!470 = !DILocation(line: 468, column: 11, scope: !469)
!471 = !DILocation(line: 468, column: 4, scope: !469)
!472 = !DILocation(line: 472, column: 4, scope: !473)
!473 = distinct !DILexicalBlock(scope: !465, file: !61, line: 471, column: 3)
!474 = !DILocation(line: 475, column: 1, scope: !429)
!475 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !61, file: !61, line: 492, type: !476, scopeLine: 493, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!476 = !DISubroutineType(types: !477)
!477 = !{!22, !69, !22}
!478 = !DILocalVariable(name: "x_value", arg: 1, scope: !475, file: !61, line: 492, type: !69)
!479 = !DILocation(line: 492, column: 25, scope: !475)
!480 = !DILocalVariable(name: "y_value", arg: 2, scope: !475, file: !61, line: 492, type: !22)
!481 = !DILocation(line: 492, column: 38, scope: !475)
!482 = !DILocalVariable(name: "s32Temp1", scope: !475, file: !61, line: 494, type: !69)
!483 = !DILocation(line: 494, column: 6, scope: !475)
!484 = !DILocation(line: 495, column: 12, scope: !475)
!485 = !DILocation(line: 495, column: 20, scope: !475)
!486 = !DILocation(line: 495, column: 10, scope: !475)
!487 = !DILocation(line: 496, column: 6, scope: !488)
!488 = distinct !DILexicalBlock(scope: !475, file: !61, line: 496, column: 5)
!489 = !DILocation(line: 496, column: 14, scope: !488)
!490 = !DILocation(line: 496, column: 24, scope: !488)
!491 = !DILocation(line: 496, column: 5, scope: !475)
!492 = !DILocation(line: 498, column: 6, scope: !493)
!493 = distinct !DILexicalBlock(scope: !494, file: !61, line: 498, column: 6)
!494 = distinct !DILexicalBlock(scope: !488, file: !61, line: 497, column: 2)
!495 = !DILocation(line: 498, column: 14, scope: !493)
!496 = !DILocation(line: 498, column: 6, scope: !494)
!497 = !DILocation(line: 500, column: 4, scope: !498)
!498 = distinct !DILexicalBlock(scope: !493, file: !61, line: 499, column: 3)
!499 = !DILocation(line: 504, column: 4, scope: !500)
!500 = distinct !DILexicalBlock(scope: !493, file: !61, line: 503, column: 3)
!501 = !DILocation(line: 509, column: 15, scope: !502)
!502 = distinct !DILexicalBlock(scope: !488, file: !61, line: 508, column: 2)
!503 = !DILocation(line: 509, column: 27, scope: !502)
!504 = !DILocation(line: 509, column: 35, scope: !502)
!505 = !DILocation(line: 509, column: 34, scope: !502)
!506 = !DILocation(line: 509, column: 46, scope: !502)
!507 = !DILocation(line: 509, column: 44, scope: !502)
!508 = !DILocation(line: 509, column: 23, scope: !502)
!509 = !DILocation(line: 509, column: 56, scope: !502)
!510 = !DILocation(line: 509, column: 12, scope: !502)
!511 = !DILocation(line: 510, column: 15, scope: !502)
!512 = !DILocation(line: 510, column: 24, scope: !502)
!513 = !DILocation(line: 510, column: 23, scope: !502)
!514 = !DILocation(line: 510, column: 36, scope: !502)
!515 = !DILocation(line: 510, column: 44, scope: !502)
!516 = !DILocation(line: 510, column: 43, scope: !502)
!517 = !DILocation(line: 510, column: 33, scope: !502)
!518 = !DILocation(line: 510, column: 12, scope: !502)
!519 = !DILocation(line: 511, column: 6, scope: !520)
!520 = distinct !DILexicalBlock(scope: !502, file: !61, line: 511, column: 6)
!521 = !DILocation(line: 511, column: 15, scope: !520)
!522 = !DILocation(line: 511, column: 6, scope: !502)
!523 = !DILocation(line: 513, column: 7, scope: !524)
!524 = distinct !DILexicalBlock(scope: !525, file: !61, line: 513, column: 7)
!525 = distinct !DILexicalBlock(scope: !520, file: !61, line: 512, column: 3)
!526 = !DILocation(line: 513, column: 16, scope: !524)
!527 = !DILocation(line: 513, column: 7, scope: !525)
!528 = !DILocation(line: 515, column: 17, scope: !529)
!529 = distinct !DILexicalBlock(scope: !524, file: !61, line: 514, column: 4)
!530 = !DILocation(line: 515, column: 12, scope: !529)
!531 = !DILocation(line: 515, column: 5, scope: !529)
!532 = !DILocation(line: 519, column: 5, scope: !533)
!533 = distinct !DILexicalBlock(scope: !524, file: !61, line: 518, column: 4)
!534 = !DILocation(line: 524, column: 4, scope: !535)
!535 = distinct !DILexicalBlock(scope: !520, file: !61, line: 523, column: 3)
!536 = !DILocation(line: 527, column: 1, scope: !475)
!537 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !61, file: !61, line: 545, type: !538, scopeLine: 546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!538 = !DISubroutineType(types: !539)
!539 = !{!22, !22, !22}
!540 = !DILocalVariable(name: "numerator", arg: 1, scope: !537, file: !61, line: 545, type: !22)
!541 = !DILocation(line: 545, column: 31, scope: !537)
!542 = !DILocalVariable(name: "denominator", arg: 2, scope: !537, file: !61, line: 545, type: !22)
!543 = !DILocation(line: 545, column: 46, scope: !537)
!544 = !DILocalVariable(name: "u32Temp", scope: !537, file: !61, line: 547, type: !437)
!545 = !DILocation(line: 547, column: 6, scope: !537)
!546 = !DILocation(line: 548, column: 5, scope: !547)
!547 = distinct !DILexicalBlock(scope: !537, file: !61, line: 548, column: 5)
!548 = !DILocation(line: 548, column: 17, scope: !547)
!549 = !DILocation(line: 548, column: 5, scope: !537)
!550 = !DILocation(line: 550, column: 3, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !61, line: 549, column: 2)
!552 = !DILocation(line: 554, column: 14, scope: !553)
!553 = distinct !DILexicalBlock(scope: !547, file: !61, line: 553, column: 2)
!554 = !DILocation(line: 554, column: 23, scope: !553)
!555 = !DILocation(line: 554, column: 32, scope: !553)
!556 = !DILocation(line: 554, column: 44, scope: !553)
!557 = !DILocation(line: 554, column: 29, scope: !553)
!558 = !DILocation(line: 554, column: 11, scope: !553)
!559 = !DILocation(line: 555, column: 13, scope: !553)
!560 = !DILocation(line: 555, column: 21, scope: !553)
!561 = !DILocation(line: 555, column: 20, scope: !553)
!562 = !DILocation(line: 555, column: 11, scope: !553)
!563 = !DILocation(line: 556, column: 6, scope: !564)
!564 = distinct !DILexicalBlock(scope: !553, file: !61, line: 556, column: 6)
!565 = !DILocation(line: 556, column: 14, scope: !564)
!566 = !DILocation(line: 556, column: 6, scope: !553)
!567 = !DILocation(line: 558, column: 11, scope: !568)
!568 = distinct !DILexicalBlock(scope: !564, file: !61, line: 557, column: 3)
!569 = !DILocation(line: 558, column: 19, scope: !568)
!570 = !DILocation(line: 558, column: 4, scope: !568)
!571 = !DILocation(line: 562, column: 4, scope: !572)
!572 = distinct !DILexicalBlock(scope: !564, file: !61, line: 561, column: 3)
!573 = !DILocation(line: 566, column: 1, scope: !537)
!574 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !61, file: !61, line: 583, type: !575, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!575 = !DISubroutineType(types: !576)
!576 = !{!22, !437, !22}
!577 = !DILocalVariable(name: "x_value", arg: 1, scope: !574, file: !61, line: 583, type: !437)
!578 = !DILocation(line: 583, column: 25, scope: !574)
!579 = !DILocalVariable(name: "y_value", arg: 2, scope: !574, file: !61, line: 583, type: !22)
!580 = !DILocation(line: 583, column: 38, scope: !574)
!581 = !DILocalVariable(name: "u32Temp1", scope: !574, file: !61, line: 585, type: !437)
!582 = !DILocation(line: 585, column: 6, scope: !574)
!583 = !DILocalVariable(name: "u32Temp2", scope: !574, file: !61, line: 585, type: !437)
!584 = !DILocation(line: 585, column: 17, scope: !574)
!585 = !DILocation(line: 586, column: 12, scope: !574)
!586 = !DILocation(line: 586, column: 20, scope: !574)
!587 = !DILocation(line: 586, column: 10, scope: !574)
!588 = !DILocation(line: 587, column: 5, scope: !589)
!589 = distinct !DILexicalBlock(scope: !574, file: !61, line: 587, column: 5)
!590 = !DILocation(line: 587, column: 13, scope: !589)
!591 = !DILocation(line: 587, column: 5, scope: !574)
!592 = !DILocation(line: 589, column: 3, scope: !593)
!593 = distinct !DILexicalBlock(scope: !589, file: !61, line: 588, column: 2)
!594 = !DILocation(line: 593, column: 14, scope: !595)
!595 = distinct !DILexicalBlock(scope: !589, file: !61, line: 592, column: 2)
!596 = !DILocation(line: 593, column: 22, scope: !595)
!597 = !DILocation(line: 593, column: 21, scope: !595)
!598 = !DILocation(line: 593, column: 12, scope: !595)
!599 = !DILocation(line: 594, column: 14, scope: !595)
!600 = !DILocation(line: 594, column: 25, scope: !595)
!601 = !DILocation(line: 594, column: 36, scope: !595)
!602 = !DILocation(line: 594, column: 34, scope: !595)
!603 = !DILocation(line: 594, column: 22, scope: !595)
!604 = !DILocation(line: 594, column: 45, scope: !595)
!605 = !DILocation(line: 594, column: 12, scope: !595)
!606 = !DILocation(line: 595, column: 15, scope: !595)
!607 = !DILocation(line: 595, column: 24, scope: !595)
!608 = !DILocation(line: 595, column: 23, scope: !595)
!609 = !DILocation(line: 595, column: 36, scope: !595)
!610 = !DILocation(line: 595, column: 44, scope: !595)
!611 = !DILocation(line: 595, column: 43, scope: !595)
!612 = !DILocation(line: 595, column: 33, scope: !595)
!613 = !DILocation(line: 595, column: 12, scope: !595)
!614 = !DILocation(line: 596, column: 6, scope: !615)
!615 = distinct !DILexicalBlock(scope: !595, file: !61, line: 596, column: 6)
!616 = !DILocation(line: 596, column: 15, scope: !615)
!617 = !DILocation(line: 596, column: 6, scope: !595)
!618 = !DILocation(line: 598, column: 11, scope: !619)
!619 = distinct !DILexicalBlock(scope: !615, file: !61, line: 597, column: 3)
!620 = !DILocation(line: 598, column: 20, scope: !619)
!621 = !DILocation(line: 598, column: 4, scope: !619)
!622 = !DILocation(line: 602, column: 4, scope: !623)
!623 = distinct !DILexicalBlock(scope: !615, file: !61, line: 601, column: 3)
!624 = !DILocation(line: 606, column: 1, scope: !574)
!625 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 625, type: !626, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!626 = !DISubroutineType(types: !627)
!627 = !{!6, !6, !22, !6}
!628 = !DILocalVariable(name: "factor1", arg: 1, scope: !625, file: !61, line: 625, type: !6)
!629 = !DILocation(line: 625, column: 33, scope: !625)
!630 = !DILocalVariable(name: "factor2", arg: 2, scope: !625, file: !61, line: 625, type: !22)
!631 = !DILocation(line: 625, column: 46, scope: !625)
!632 = !DILocalVariable(name: "denominator", arg: 3, scope: !625, file: !61, line: 625, type: !6)
!633 = !DILocation(line: 625, column: 59, scope: !625)
!634 = !DILocalVariable(name: "s32Result", scope: !625, file: !61, line: 627, type: !69)
!635 = !DILocation(line: 627, column: 6, scope: !625)
!636 = !DILocalVariable(name: "s32Temp1", scope: !625, file: !61, line: 627, type: !69)
!637 = !DILocation(line: 627, column: 21, scope: !625)
!638 = !DILocation(line: 628, column: 14, scope: !625)
!639 = !DILocation(line: 628, column: 24, scope: !625)
!640 = !DILocation(line: 628, column: 22, scope: !625)
!641 = !DILocation(line: 628, column: 12, scope: !625)
!642 = !DILocation(line: 629, column: 5, scope: !643)
!643 = distinct !DILexicalBlock(scope: !625, file: !61, line: 629, column: 5)
!644 = !DILocation(line: 629, column: 17, scope: !643)
!645 = !DILocation(line: 629, column: 5, scope: !625)
!646 = !DILocation(line: 631, column: 6, scope: !647)
!647 = distinct !DILexicalBlock(scope: !648, file: !61, line: 631, column: 6)
!648 = distinct !DILexicalBlock(scope: !643, file: !61, line: 630, column: 2)
!649 = !DILocation(line: 631, column: 16, scope: !647)
!650 = !DILocation(line: 631, column: 6, scope: !648)
!651 = !DILocation(line: 633, column: 4, scope: !652)
!652 = distinct !DILexicalBlock(scope: !647, file: !61, line: 632, column: 3)
!653 = !DILocation(line: 637, column: 4, scope: !654)
!654 = distinct !DILexicalBlock(scope: !647, file: !61, line: 636, column: 3)
!655 = !DILocation(line: 642, column: 14, scope: !656)
!656 = distinct !DILexicalBlock(scope: !643, file: !61, line: 641, column: 2)
!657 = !DILocation(line: 642, column: 27, scope: !656)
!658 = !DILocation(line: 642, column: 37, scope: !656)
!659 = !DILocation(line: 642, column: 36, scope: !656)
!660 = !DILocation(line: 642, column: 50, scope: !656)
!661 = !DILocation(line: 642, column: 49, scope: !656)
!662 = !DILocation(line: 642, column: 24, scope: !656)
!663 = !DILocation(line: 642, column: 12, scope: !656)
!664 = !DILocation(line: 643, column: 14, scope: !656)
!665 = !DILocation(line: 643, column: 23, scope: !656)
!666 = !DILocation(line: 643, column: 12, scope: !656)
!667 = !DILocation(line: 644, column: 16, scope: !656)
!668 = !DILocation(line: 644, column: 25, scope: !656)
!669 = !DILocation(line: 644, column: 24, scope: !656)
!670 = !DILocation(line: 644, column: 41, scope: !656)
!671 = !DILocation(line: 644, column: 51, scope: !656)
!672 = !DILocation(line: 644, column: 50, scope: !656)
!673 = !DILocation(line: 644, column: 38, scope: !656)
!674 = !DILocation(line: 644, column: 13, scope: !656)
!675 = !DILocation(line: 645, column: 6, scope: !676)
!676 = distinct !DILexicalBlock(scope: !656, file: !61, line: 645, column: 6)
!677 = !DILocation(line: 645, column: 16, scope: !676)
!678 = !DILocation(line: 645, column: 6, scope: !656)
!679 = !DILocation(line: 647, column: 7, scope: !680)
!680 = distinct !DILexicalBlock(scope: !681, file: !61, line: 647, column: 7)
!681 = distinct !DILexicalBlock(scope: !676, file: !61, line: 646, column: 3)
!682 = !DILocation(line: 647, column: 17, scope: !680)
!683 = !DILocation(line: 647, column: 7, scope: !681)
!684 = !DILocation(line: 649, column: 17, scope: !685)
!685 = distinct !DILexicalBlock(scope: !680, file: !61, line: 648, column: 4)
!686 = !DILocation(line: 649, column: 12, scope: !685)
!687 = !DILocation(line: 649, column: 5, scope: !685)
!688 = !DILocation(line: 654, column: 5, scope: !689)
!689 = distinct !DILexicalBlock(scope: !680, file: !61, line: 653, column: 4)
!690 = !DILocation(line: 659, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !676, file: !61, line: 658, column: 3)
!692 = !DILocation(line: 663, column: 1, scope: !625)
!693 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !61, file: !61, line: 681, type: !694, scopeLine: 682, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!694 = !DISubroutineType(types: !695)
!695 = !{!6, !22, !6, !22}
!696 = !DILocalVariable(name: "factor1", arg: 1, scope: !693, file: !61, line: 681, type: !22)
!697 = !DILocation(line: 681, column: 33, scope: !693)
!698 = !DILocalVariable(name: "factor2", arg: 2, scope: !693, file: !61, line: 681, type: !6)
!699 = !DILocation(line: 681, column: 46, scope: !693)
!700 = !DILocalVariable(name: "denominator", arg: 3, scope: !693, file: !61, line: 681, type: !22)
!701 = !DILocation(line: 681, column: 59, scope: !693)
!702 = !DILocalVariable(name: "s32Result", scope: !693, file: !61, line: 683, type: !69)
!703 = !DILocation(line: 683, column: 6, scope: !693)
!704 = !DILocalVariable(name: "s32Temp1", scope: !693, file: !61, line: 683, type: !69)
!705 = !DILocation(line: 683, column: 21, scope: !693)
!706 = !DILocation(line: 684, column: 14, scope: !693)
!707 = !DILocation(line: 684, column: 24, scope: !693)
!708 = !DILocation(line: 684, column: 22, scope: !693)
!709 = !DILocation(line: 684, column: 12, scope: !693)
!710 = !DILocation(line: 685, column: 5, scope: !711)
!711 = distinct !DILexicalBlock(scope: !693, file: !61, line: 685, column: 5)
!712 = !DILocation(line: 685, column: 16, scope: !711)
!713 = !DILocation(line: 685, column: 5, scope: !693)
!714 = !DILocation(line: 687, column: 6, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !61, line: 687, column: 6)
!716 = distinct !DILexicalBlock(scope: !711, file: !61, line: 686, column: 2)
!717 = !DILocation(line: 687, column: 16, scope: !715)
!718 = !DILocation(line: 687, column: 6, scope: !716)
!719 = !DILocation(line: 689, column: 4, scope: !720)
!720 = distinct !DILexicalBlock(scope: !715, file: !61, line: 688, column: 3)
!721 = !DILocation(line: 693, column: 4, scope: !722)
!722 = distinct !DILexicalBlock(scope: !715, file: !61, line: 692, column: 3)
!723 = !DILocation(line: 698, column: 14, scope: !724)
!724 = distinct !DILexicalBlock(scope: !711, file: !61, line: 697, column: 2)
!725 = !DILocation(line: 698, column: 28, scope: !724)
!726 = !DILocation(line: 698, column: 38, scope: !724)
!727 = !DILocation(line: 698, column: 37, scope: !724)
!728 = !DILocation(line: 698, column: 53, scope: !724)
!729 = !DILocation(line: 698, column: 51, scope: !724)
!730 = !DILocation(line: 698, column: 24, scope: !724)
!731 = !DILocation(line: 698, column: 66, scope: !724)
!732 = !DILocation(line: 698, column: 12, scope: !724)
!733 = !DILocation(line: 699, column: 16, scope: !724)
!734 = !DILocation(line: 699, column: 25, scope: !724)
!735 = !DILocation(line: 699, column: 24, scope: !724)
!736 = !DILocation(line: 699, column: 41, scope: !724)
!737 = !DILocation(line: 699, column: 51, scope: !724)
!738 = !DILocation(line: 699, column: 50, scope: !724)
!739 = !DILocation(line: 699, column: 38, scope: !724)
!740 = !DILocation(line: 699, column: 13, scope: !724)
!741 = !DILocation(line: 700, column: 6, scope: !742)
!742 = distinct !DILexicalBlock(scope: !724, file: !61, line: 700, column: 6)
!743 = !DILocation(line: 700, column: 16, scope: !742)
!744 = !DILocation(line: 700, column: 6, scope: !724)
!745 = !DILocation(line: 702, column: 7, scope: !746)
!746 = distinct !DILexicalBlock(scope: !747, file: !61, line: 702, column: 7)
!747 = distinct !DILexicalBlock(scope: !742, file: !61, line: 701, column: 3)
!748 = !DILocation(line: 702, column: 17, scope: !746)
!749 = !DILocation(line: 702, column: 7, scope: !747)
!750 = !DILocation(line: 704, column: 17, scope: !751)
!751 = distinct !DILexicalBlock(scope: !746, file: !61, line: 703, column: 4)
!752 = !DILocation(line: 704, column: 12, scope: !751)
!753 = !DILocation(line: 704, column: 5, scope: !751)
!754 = !DILocation(line: 708, column: 5, scope: !755)
!755 = distinct !DILexicalBlock(scope: !746, file: !61, line: 707, column: 4)
!756 = !DILocation(line: 713, column: 4, scope: !757)
!757 = distinct !DILexicalBlock(scope: !742, file: !61, line: 712, column: 3)
!758 = !DILocation(line: 716, column: 1, scope: !693)
!759 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 735, type: !760, scopeLine: 736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!760 = !DISubroutineType(types: !761)
!761 = !{!22, !6, !22, !6}
!762 = !DILocalVariable(name: "factor1", arg: 1, scope: !759, file: !61, line: 735, type: !6)
!763 = !DILocation(line: 735, column: 33, scope: !759)
!764 = !DILocalVariable(name: "factor2", arg: 2, scope: !759, file: !61, line: 735, type: !22)
!765 = !DILocation(line: 735, column: 46, scope: !759)
!766 = !DILocalVariable(name: "denominator", arg: 3, scope: !759, file: !61, line: 735, type: !6)
!767 = !DILocation(line: 735, column: 59, scope: !759)
!768 = !DILocalVariable(name: "u32Result", scope: !759, file: !61, line: 737, type: !437)
!769 = !DILocation(line: 737, column: 6, scope: !759)
!770 = !DILocalVariable(name: "u32Temp1", scope: !759, file: !61, line: 737, type: !437)
!771 = !DILocation(line: 737, column: 21, scope: !759)
!772 = !DILocalVariable(name: "s32Result", scope: !759, file: !61, line: 738, type: !69)
!773 = !DILocation(line: 738, column: 6, scope: !759)
!774 = !DILocalVariable(name: "s32Temp1", scope: !759, file: !61, line: 738, type: !69)
!775 = !DILocation(line: 738, column: 21, scope: !759)
!776 = !DILocation(line: 739, column: 14, scope: !759)
!777 = !DILocation(line: 739, column: 24, scope: !759)
!778 = !DILocation(line: 739, column: 22, scope: !759)
!779 = !DILocation(line: 739, column: 12, scope: !759)
!780 = !DILocation(line: 741, column: 5, scope: !781)
!781 = distinct !DILexicalBlock(scope: !759, file: !61, line: 741, column: 5)
!782 = !DILocation(line: 741, column: 17, scope: !781)
!783 = !DILocation(line: 741, column: 5, scope: !759)
!784 = !DILocation(line: 743, column: 6, scope: !785)
!785 = distinct !DILexicalBlock(scope: !786, file: !61, line: 743, column: 6)
!786 = distinct !DILexicalBlock(scope: !781, file: !61, line: 742, column: 2)
!787 = !DILocation(line: 743, column: 16, scope: !785)
!788 = !DILocation(line: 743, column: 6, scope: !786)
!789 = !DILocation(line: 745, column: 4, scope: !790)
!790 = distinct !DILexicalBlock(scope: !785, file: !61, line: 744, column: 3)
!791 = !DILocation(line: 749, column: 4, scope: !792)
!792 = distinct !DILexicalBlock(scope: !785, file: !61, line: 748, column: 3)
!793 = !DILocation(line: 754, column: 15, scope: !794)
!794 = distinct !DILexicalBlock(scope: !781, file: !61, line: 753, column: 2)
!795 = !DILocation(line: 754, column: 29, scope: !794)
!796 = !DILocation(line: 754, column: 39, scope: !794)
!797 = !DILocation(line: 754, column: 38, scope: !794)
!798 = !DILocation(line: 754, column: 54, scope: !794)
!799 = !DILocation(line: 754, column: 52, scope: !794)
!800 = !DILocation(line: 754, column: 25, scope: !794)
!801 = !DILocation(line: 754, column: 68, scope: !794)
!802 = !DILocation(line: 754, column: 12, scope: !794)
!803 = !DILocation(line: 755, column: 16, scope: !794)
!804 = !DILocation(line: 755, column: 25, scope: !794)
!805 = !DILocation(line: 755, column: 24, scope: !794)
!806 = !DILocation(line: 755, column: 41, scope: !794)
!807 = !DILocation(line: 755, column: 51, scope: !794)
!808 = !DILocation(line: 755, column: 50, scope: !794)
!809 = !DILocation(line: 755, column: 38, scope: !794)
!810 = !DILocation(line: 755, column: 13, scope: !794)
!811 = !DILocation(line: 756, column: 6, scope: !812)
!812 = distinct !DILexicalBlock(scope: !794, file: !61, line: 756, column: 6)
!813 = !DILocation(line: 756, column: 16, scope: !812)
!814 = !DILocation(line: 756, column: 6, scope: !794)
!815 = !DILocation(line: 758, column: 7, scope: !816)
!816 = distinct !DILexicalBlock(scope: !817, file: !61, line: 758, column: 7)
!817 = distinct !DILexicalBlock(scope: !812, file: !61, line: 757, column: 3)
!818 = !DILocation(line: 758, column: 17, scope: !816)
!819 = !DILocation(line: 758, column: 7, scope: !817)
!820 = !DILocation(line: 760, column: 17, scope: !821)
!821 = distinct !DILexicalBlock(scope: !816, file: !61, line: 759, column: 4)
!822 = !DILocation(line: 760, column: 12, scope: !821)
!823 = !DILocation(line: 760, column: 5, scope: !821)
!824 = !DILocation(line: 764, column: 5, scope: !825)
!825 = distinct !DILexicalBlock(scope: !816, file: !61, line: 763, column: 4)
!826 = !DILocation(line: 769, column: 4, scope: !827)
!827 = distinct !DILexicalBlock(scope: !812, file: !61, line: 768, column: 3)
!828 = !DILocation(line: 772, column: 1, scope: !759)
!829 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !61, file: !61, line: 791, type: !830, scopeLine: 792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!830 = !DISubroutineType(types: !831)
!831 = !{!22, !6, !22, !22}
!832 = !DILocalVariable(name: "factor1", arg: 1, scope: !829, file: !61, line: 791, type: !6)
!833 = !DILocation(line: 791, column: 33, scope: !829)
!834 = !DILocalVariable(name: "factor2", arg: 2, scope: !829, file: !61, line: 791, type: !22)
!835 = !DILocation(line: 791, column: 46, scope: !829)
!836 = !DILocalVariable(name: "denominator", arg: 3, scope: !829, file: !61, line: 791, type: !22)
!837 = !DILocation(line: 791, column: 59, scope: !829)
!838 = !DILocalVariable(name: "s32Result", scope: !829, file: !61, line: 793, type: !69)
!839 = !DILocation(line: 793, column: 6, scope: !829)
!840 = !DILocalVariable(name: "s32Temp1", scope: !829, file: !61, line: 793, type: !69)
!841 = !DILocation(line: 793, column: 21, scope: !829)
!842 = !DILocation(line: 794, column: 14, scope: !829)
!843 = !DILocation(line: 794, column: 24, scope: !829)
!844 = !DILocation(line: 794, column: 22, scope: !829)
!845 = !DILocation(line: 794, column: 12, scope: !829)
!846 = !DILocation(line: 796, column: 5, scope: !847)
!847 = distinct !DILexicalBlock(scope: !829, file: !61, line: 796, column: 5)
!848 = !DILocation(line: 796, column: 17, scope: !847)
!849 = !DILocation(line: 796, column: 5, scope: !829)
!850 = !DILocation(line: 798, column: 6, scope: !851)
!851 = distinct !DILexicalBlock(scope: !852, file: !61, line: 798, column: 6)
!852 = distinct !DILexicalBlock(scope: !847, file: !61, line: 797, column: 2)
!853 = !DILocation(line: 798, column: 16, scope: !851)
!854 = !DILocation(line: 798, column: 6, scope: !852)
!855 = !DILocation(line: 800, column: 4, scope: !856)
!856 = distinct !DILexicalBlock(scope: !851, file: !61, line: 799, column: 3)
!857 = !DILocation(line: 804, column: 4, scope: !858)
!858 = distinct !DILexicalBlock(scope: !851, file: !61, line: 803, column: 3)
!859 = !DILocation(line: 809, column: 15, scope: !860)
!860 = distinct !DILexicalBlock(scope: !847, file: !61, line: 808, column: 2)
!861 = !DILocation(line: 809, column: 29, scope: !860)
!862 = !DILocation(line: 809, column: 39, scope: !860)
!863 = !DILocation(line: 809, column: 38, scope: !860)
!864 = !DILocation(line: 809, column: 54, scope: !860)
!865 = !DILocation(line: 809, column: 52, scope: !860)
!866 = !DILocation(line: 809, column: 25, scope: !860)
!867 = !DILocation(line: 809, column: 68, scope: !860)
!868 = !DILocation(line: 809, column: 12, scope: !860)
!869 = !DILocation(line: 810, column: 16, scope: !860)
!870 = !DILocation(line: 810, column: 25, scope: !860)
!871 = !DILocation(line: 810, column: 24, scope: !860)
!872 = !DILocation(line: 810, column: 41, scope: !860)
!873 = !DILocation(line: 810, column: 51, scope: !860)
!874 = !DILocation(line: 810, column: 50, scope: !860)
!875 = !DILocation(line: 810, column: 38, scope: !860)
!876 = !DILocation(line: 810, column: 13, scope: !860)
!877 = !DILocation(line: 811, column: 6, scope: !878)
!878 = distinct !DILexicalBlock(scope: !860, file: !61, line: 811, column: 6)
!879 = !DILocation(line: 811, column: 16, scope: !878)
!880 = !DILocation(line: 811, column: 6, scope: !860)
!881 = !DILocation(line: 813, column: 7, scope: !882)
!882 = distinct !DILexicalBlock(scope: !883, file: !61, line: 813, column: 7)
!883 = distinct !DILexicalBlock(scope: !878, file: !61, line: 812, column: 3)
!884 = !DILocation(line: 813, column: 17, scope: !882)
!885 = !DILocation(line: 813, column: 7, scope: !883)
!886 = !DILocation(line: 815, column: 17, scope: !887)
!887 = distinct !DILexicalBlock(scope: !882, file: !61, line: 814, column: 4)
!888 = !DILocation(line: 815, column: 12, scope: !887)
!889 = !DILocation(line: 815, column: 5, scope: !887)
!890 = !DILocation(line: 819, column: 5, scope: !891)
!891 = distinct !DILexicalBlock(scope: !882, file: !61, line: 818, column: 4)
!892 = !DILocation(line: 824, column: 4, scope: !893)
!893 = distinct !DILexicalBlock(scope: !878, file: !61, line: 823, column: 3)
!894 = !DILocation(line: 828, column: 1, scope: !829)
!895 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !61, file: !61, line: 846, type: !896, scopeLine: 847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!896 = !DISubroutineType(types: !897)
!897 = !{!22, !22, !22, !22}
!898 = !DILocalVariable(name: "factor1", arg: 1, scope: !895, file: !61, line: 846, type: !22)
!899 = !DILocation(line: 846, column: 33, scope: !895)
!900 = !DILocalVariable(name: "factor2", arg: 2, scope: !895, file: !61, line: 846, type: !22)
!901 = !DILocation(line: 846, column: 46, scope: !895)
!902 = !DILocalVariable(name: "denominator", arg: 3, scope: !895, file: !61, line: 846, type: !22)
!903 = !DILocation(line: 846, column: 59, scope: !895)
!904 = !DILocalVariable(name: "u32Temp1", scope: !895, file: !61, line: 848, type: !437)
!905 = !DILocation(line: 848, column: 6, scope: !895)
!906 = !DILocalVariable(name: "u16TempDenom", scope: !895, file: !61, line: 849, type: !22)
!907 = !DILocation(line: 849, column: 6, scope: !895)
!908 = !DILocation(line: 851, column: 5, scope: !909)
!909 = distinct !DILexicalBlock(scope: !895, file: !61, line: 851, column: 5)
!910 = !DILocation(line: 851, column: 17, scope: !909)
!911 = !DILocation(line: 851, column: 5, scope: !895)
!912 = !DILocation(line: 853, column: 3, scope: !913)
!913 = distinct !DILexicalBlock(scope: !909, file: !61, line: 852, column: 2)
!914 = !DILocation(line: 857, column: 14, scope: !915)
!915 = distinct !DILexicalBlock(scope: !909, file: !61, line: 856, column: 2)
!916 = !DILocation(line: 857, column: 24, scope: !915)
!917 = !DILocation(line: 857, column: 22, scope: !915)
!918 = !DILocation(line: 857, column: 12, scope: !915)
!919 = !DILocation(line: 858, column: 18, scope: !915)
!920 = !DILocation(line: 858, column: 30, scope: !915)
!921 = !DILocation(line: 858, column: 16, scope: !915)
!922 = !DILocation(line: 859, column: 14, scope: !915)
!923 = !DILocation(line: 859, column: 25, scope: !915)
!924 = !DILocation(line: 859, column: 23, scope: !915)
!925 = !DILocation(line: 859, column: 12, scope: !915)
!926 = !DILocation(line: 860, column: 14, scope: !915)
!927 = !DILocation(line: 860, column: 25, scope: !915)
!928 = !DILocation(line: 860, column: 23, scope: !915)
!929 = !DILocation(line: 860, column: 12, scope: !915)
!930 = !DILocation(line: 861, column: 6, scope: !931)
!931 = distinct !DILexicalBlock(scope: !915, file: !61, line: 861, column: 6)
!932 = !DILocation(line: 861, column: 15, scope: !931)
!933 = !DILocation(line: 861, column: 6, scope: !915)
!934 = !DILocation(line: 863, column: 12, scope: !935)
!935 = distinct !DILexicalBlock(scope: !931, file: !61, line: 862, column: 3)
!936 = !DILocation(line: 863, column: 21, scope: !935)
!937 = !DILocation(line: 863, column: 11, scope: !935)
!938 = !DILocation(line: 863, column: 4, scope: !935)
!939 = !DILocation(line: 868, column: 4, scope: !940)
!940 = distinct !DILexicalBlock(scope: !931, file: !61, line: 867, column: 3)
!941 = !DILocation(line: 873, column: 1, scope: !895)
!942 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !61, file: !61, line: 890, type: !943, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!943 = !DISubroutineType(types: !944)
!944 = !{!22, !22, !22, !437}
!945 = !DILocalVariable(name: "factor1", arg: 1, scope: !942, file: !61, line: 890, type: !22)
!946 = !DILocation(line: 890, column: 33, scope: !942)
!947 = !DILocalVariable(name: "factor2", arg: 2, scope: !942, file: !61, line: 890, type: !22)
!948 = !DILocation(line: 890, column: 46, scope: !942)
!949 = !DILocalVariable(name: "denominator", arg: 3, scope: !942, file: !61, line: 890, type: !437)
!950 = !DILocation(line: 890, column: 59, scope: !942)
!951 = !DILocalVariable(name: "u32Temp1", scope: !942, file: !61, line: 892, type: !437)
!952 = !DILocation(line: 892, column: 6, scope: !942)
!953 = !DILocation(line: 893, column: 5, scope: !954)
!954 = distinct !DILexicalBlock(scope: !942, file: !61, line: 893, column: 5)
!955 = !DILocation(line: 893, column: 17, scope: !954)
!956 = !DILocation(line: 893, column: 5, scope: !942)
!957 = !DILocation(line: 895, column: 3, scope: !958)
!958 = distinct !DILexicalBlock(scope: !954, file: !61, line: 894, column: 2)
!959 = !DILocation(line: 899, column: 15, scope: !960)
!960 = distinct !DILexicalBlock(scope: !954, file: !61, line: 898, column: 2)
!961 = !DILocation(line: 899, column: 25, scope: !960)
!962 = !DILocation(line: 899, column: 23, scope: !960)
!963 = !DILocation(line: 899, column: 36, scope: !960)
!964 = !DILocation(line: 899, column: 34, scope: !960)
!965 = !DILocation(line: 899, column: 12, scope: !960)
!966 = !DILocation(line: 900, column: 8, scope: !967)
!967 = distinct !DILexicalBlock(scope: !960, file: !61, line: 900, column: 6)
!968 = !DILocation(line: 900, column: 18, scope: !967)
!969 = !DILocation(line: 900, column: 16, scope: !967)
!970 = !DILocation(line: 900, column: 28, scope: !967)
!971 = !DILocation(line: 900, column: 40, scope: !967)
!972 = !DILocation(line: 900, column: 39, scope: !967)
!973 = !DILocation(line: 900, column: 26, scope: !967)
!974 = !DILocation(line: 900, column: 53, scope: !967)
!975 = !DILocation(line: 900, column: 64, scope: !967)
!976 = !DILocation(line: 900, column: 50, scope: !967)
!977 = !DILocation(line: 900, column: 6, scope: !960)
!978 = !DILocation(line: 902, column: 12, scope: !979)
!979 = distinct !DILexicalBlock(scope: !967, file: !61, line: 901, column: 3)
!980 = !DILocation(line: 903, column: 3, scope: !979)
!981 = !DILocation(line: 904, column: 6, scope: !982)
!982 = distinct !DILexicalBlock(scope: !960, file: !61, line: 904, column: 6)
!983 = !DILocation(line: 904, column: 15, scope: !982)
!984 = !DILocation(line: 904, column: 6, scope: !960)
!985 = !DILocation(line: 906, column: 12, scope: !986)
!986 = distinct !DILexicalBlock(scope: !982, file: !61, line: 905, column: 3)
!987 = !DILocation(line: 906, column: 21, scope: !986)
!988 = !DILocation(line: 906, column: 11, scope: !986)
!989 = !DILocation(line: 906, column: 4, scope: !986)
!990 = !DILocation(line: 910, column: 4, scope: !991)
!991 = distinct !DILexicalBlock(scope: !982, file: !61, line: 909, column: 3)
!992 = !DILocation(line: 913, column: 1, scope: !942)
!993 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !61, file: !61, line: 930, type: !994, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!994 = !DISubroutineType(types: !995)
!995 = !{!437, !437, !22}
!996 = !DILocalVariable(name: "x_value", arg: 1, scope: !993, file: !61, line: 930, type: !437)
!997 = !DILocation(line: 930, column: 25, scope: !993)
!998 = !DILocalVariable(name: "y_value", arg: 2, scope: !993, file: !61, line: 930, type: !22)
!999 = !DILocation(line: 930, column: 38, scope: !993)
!1000 = !DILocalVariable(name: "u32Temp1", scope: !993, file: !61, line: 932, type: !437)
!1001 = !DILocation(line: 932, column: 6, scope: !993)
!1002 = !DILocation(line: 933, column: 5, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !993, file: !61, line: 933, column: 5)
!1004 = !DILocation(line: 933, column: 13, scope: !1003)
!1005 = !DILocation(line: 933, column: 5, scope: !993)
!1006 = !DILocation(line: 935, column: 3, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1003, file: !61, line: 934, column: 2)
!1008 = !DILocation(line: 939, column: 15, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1003, file: !61, line: 938, column: 2)
!1010 = !DILocation(line: 939, column: 26, scope: !1009)
!1011 = !DILocation(line: 939, column: 34, scope: !1009)
!1012 = !DILocation(line: 939, column: 33, scope: !1009)
!1013 = !DILocation(line: 939, column: 45, scope: !1009)
!1014 = !DILocation(line: 939, column: 43, scope: !1009)
!1015 = !DILocation(line: 939, column: 23, scope: !1009)
!1016 = !DILocation(line: 939, column: 54, scope: !1009)
!1017 = !DILocation(line: 939, column: 12, scope: !1009)
!1018 = !DILocation(line: 940, column: 15, scope: !1009)
!1019 = !DILocation(line: 940, column: 23, scope: !1009)
!1020 = !DILocation(line: 940, column: 22, scope: !1009)
!1021 = !DILocation(line: 940, column: 35, scope: !1009)
!1022 = !DILocation(line: 940, column: 44, scope: !1009)
!1023 = !DILocation(line: 940, column: 43, scope: !1009)
!1024 = !DILocation(line: 940, column: 32, scope: !1009)
!1025 = !DILocation(line: 940, column: 12, scope: !1009)
!1026 = !DILocation(line: 941, column: 10, scope: !1009)
!1027 = !DILocation(line: 941, column: 3, scope: !1009)
!1028 = !DILocation(line: 943, column: 1, scope: !993)
!1029 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !61, file: !61, line: 961, type: !1030, scopeLine: 962, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!6, !6, !6, !6}
!1032 = !DILocalVariable(name: "fak1", arg: 1, scope: !1029, file: !61, line: 961, type: !6)
!1033 = !DILocation(line: 961, column: 33, scope: !1029)
!1034 = !DILocalVariable(name: "fak2", arg: 2, scope: !1029, file: !61, line: 961, type: !6)
!1035 = !DILocation(line: 961, column: 43, scope: !1029)
!1036 = !DILocalVariable(name: "div", arg: 3, scope: !1029, file: !61, line: 961, type: !6)
!1037 = !DILocation(line: 961, column: 53, scope: !1029)
!1038 = !DILocalVariable(name: "s32Temp1", scope: !1029, file: !61, line: 963, type: !69)
!1039 = !DILocation(line: 963, column: 6, scope: !1029)
!1040 = !DILocalVariable(name: "s32Temp2", scope: !1029, file: !61, line: 963, type: !69)
!1041 = !DILocation(line: 963, column: 20, scope: !1029)
!1042 = !DILocalVariable(name: "s32Temp3", scope: !1029, file: !61, line: 963, type: !69)
!1043 = !DILocation(line: 963, column: 34, scope: !1029)
!1044 = !DILocation(line: 964, column: 13, scope: !1029)
!1045 = !DILocation(line: 964, column: 20, scope: !1029)
!1046 = !DILocation(line: 964, column: 18, scope: !1029)
!1047 = !DILocation(line: 964, column: 11, scope: !1029)
!1048 = !DILocation(line: 965, column: 5, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1029, file: !61, line: 965, column: 5)
!1050 = !DILocation(line: 965, column: 9, scope: !1049)
!1051 = !DILocation(line: 965, column: 5, scope: !1029)
!1052 = !DILocation(line: 967, column: 6, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1054, file: !61, line: 967, column: 6)
!1054 = distinct !DILexicalBlock(scope: !1049, file: !61, line: 966, column: 2)
!1055 = !DILocation(line: 967, column: 15, scope: !1053)
!1056 = !DILocation(line: 967, column: 6, scope: !1054)
!1057 = !DILocation(line: 969, column: 4, scope: !1058)
!1058 = distinct !DILexicalBlock(scope: !1053, file: !61, line: 968, column: 3)
!1059 = !DILocation(line: 973, column: 4, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1053, file: !61, line: 972, column: 3)
!1061 = !DILocation(line: 978, column: 15, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1049, file: !61, line: 977, column: 2)
!1063 = !DILocation(line: 978, column: 28, scope: !1062)
!1064 = !DILocation(line: 978, column: 39, scope: !1062)
!1065 = !DILocation(line: 978, column: 37, scope: !1062)
!1066 = !DILocation(line: 978, column: 46, scope: !1062)
!1067 = !DILocation(line: 978, column: 44, scope: !1062)
!1068 = !DILocation(line: 978, column: 24, scope: !1062)
!1069 = !DILocation(line: 978, column: 52, scope: !1062)
!1070 = !DILocation(line: 978, column: 12, scope: !1062)
!1071 = !DILocation(line: 979, column: 15, scope: !1062)
!1072 = !DILocation(line: 979, column: 24, scope: !1062)
!1073 = !DILocation(line: 979, column: 23, scope: !1062)
!1074 = !DILocation(line: 979, column: 32, scope: !1062)
!1075 = !DILocation(line: 979, column: 41, scope: !1062)
!1076 = !DILocation(line: 979, column: 40, scope: !1062)
!1077 = !DILocation(line: 979, column: 29, scope: !1062)
!1078 = !DILocation(line: 979, column: 12, scope: !1062)
!1079 = !DILocation(line: 980, column: 6, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1062, file: !61, line: 980, column: 6)
!1081 = !DILocation(line: 980, column: 15, scope: !1080)
!1082 = !DILocation(line: 980, column: 6, scope: !1062)
!1083 = !DILocation(line: 982, column: 7, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !1085, file: !61, line: 982, column: 7)
!1085 = distinct !DILexicalBlock(scope: !1080, file: !61, line: 981, column: 3)
!1086 = !DILocation(line: 982, column: 16, scope: !1084)
!1087 = !DILocation(line: 982, column: 7, scope: !1085)
!1088 = !DILocation(line: 984, column: 17, scope: !1089)
!1089 = distinct !DILexicalBlock(scope: !1084, file: !61, line: 983, column: 4)
!1090 = !DILocation(line: 984, column: 12, scope: !1089)
!1091 = !DILocation(line: 984, column: 5, scope: !1089)
!1092 = !DILocation(line: 988, column: 5, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1084, file: !61, line: 987, column: 4)
!1094 = !DILocation(line: 993, column: 4, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1080, file: !61, line: 992, column: 3)
!1096 = !DILocation(line: 996, column: 1, scope: !1029)
!1097 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !61, file: !61, line: 1014, type: !1098, scopeLine: 1015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1098 = !DISubroutineType(types: !1099)
!1099 = !{!6, !6, !6, !22}
!1100 = !DILocalVariable(name: "data1", arg: 1, scope: !1097, file: !61, line: 1014, type: !6)
!1101 = !DILocation(line: 1014, column: 33, scope: !1097)
!1102 = !DILocalVariable(name: "data2", arg: 2, scope: !1097, file: !61, line: 1014, type: !6)
!1103 = !DILocation(line: 1014, column: 43, scope: !1097)
!1104 = !DILocalVariable(name: "denominator", arg: 3, scope: !1097, file: !61, line: 1014, type: !22)
!1105 = !DILocation(line: 1014, column: 53, scope: !1097)
!1106 = !DILocalVariable(name: "s32Result", scope: !1097, file: !61, line: 1016, type: !69)
!1107 = !DILocation(line: 1016, column: 6, scope: !1097)
!1108 = !DILocalVariable(name: "s32Temp1", scope: !1097, file: !61, line: 1016, type: !69)
!1109 = !DILocation(line: 1016, column: 21, scope: !1097)
!1110 = !DILocation(line: 1017, column: 14, scope: !1097)
!1111 = !DILocation(line: 1017, column: 22, scope: !1097)
!1112 = !DILocation(line: 1017, column: 20, scope: !1097)
!1113 = !DILocation(line: 1017, column: 12, scope: !1097)
!1114 = !DILocation(line: 1019, column: 5, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1097, file: !61, line: 1019, column: 5)
!1116 = !DILocation(line: 1019, column: 17, scope: !1115)
!1117 = !DILocation(line: 1019, column: 5, scope: !1097)
!1118 = !DILocation(line: 1021, column: 6, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1120, file: !61, line: 1021, column: 6)
!1120 = distinct !DILexicalBlock(scope: !1115, file: !61, line: 1020, column: 2)
!1121 = !DILocation(line: 1021, column: 16, scope: !1119)
!1122 = !DILocation(line: 1021, column: 6, scope: !1120)
!1123 = !DILocation(line: 1023, column: 4, scope: !1124)
!1124 = distinct !DILexicalBlock(scope: !1119, file: !61, line: 1022, column: 3)
!1125 = !DILocation(line: 1025, column: 11, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1119, file: !61, line: 1025, column: 11)
!1127 = !DILocation(line: 1025, column: 21, scope: !1126)
!1128 = !DILocation(line: 1025, column: 11, scope: !1119)
!1129 = !DILocation(line: 1027, column: 4, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1126, file: !61, line: 1026, column: 3)
!1131 = !DILocation(line: 1031, column: 4, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1126, file: !61, line: 1030, column: 3)
!1133 = !DILocation(line: 1036, column: 15, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1115, file: !61, line: 1035, column: 2)
!1135 = !DILocation(line: 1036, column: 28, scope: !1134)
!1136 = !DILocation(line: 1036, column: 38, scope: !1134)
!1137 = !DILocation(line: 1036, column: 37, scope: !1134)
!1138 = !DILocation(line: 1036, column: 51, scope: !1134)
!1139 = !DILocation(line: 1036, column: 50, scope: !1134)
!1140 = !DILocation(line: 1036, column: 25, scope: !1134)
!1141 = !DILocation(line: 1036, column: 64, scope: !1134)
!1142 = !DILocation(line: 1036, column: 12, scope: !1134)
!1143 = !DILocation(line: 1037, column: 16, scope: !1134)
!1144 = !DILocation(line: 1037, column: 25, scope: !1134)
!1145 = !DILocation(line: 1037, column: 24, scope: !1134)
!1146 = !DILocation(line: 1037, column: 41, scope: !1134)
!1147 = !DILocation(line: 1037, column: 51, scope: !1134)
!1148 = !DILocation(line: 1037, column: 50, scope: !1134)
!1149 = !DILocation(line: 1037, column: 38, scope: !1134)
!1150 = !DILocation(line: 1037, column: 13, scope: !1134)
!1151 = !DILocation(line: 1038, column: 6, scope: !1152)
!1152 = distinct !DILexicalBlock(scope: !1134, file: !61, line: 1038, column: 6)
!1153 = !DILocation(line: 1038, column: 16, scope: !1152)
!1154 = !DILocation(line: 1038, column: 6, scope: !1134)
!1155 = !DILocation(line: 1040, column: 7, scope: !1156)
!1156 = distinct !DILexicalBlock(scope: !1157, file: !61, line: 1040, column: 7)
!1157 = distinct !DILexicalBlock(scope: !1152, file: !61, line: 1039, column: 3)
!1158 = !DILocation(line: 1040, column: 17, scope: !1156)
!1159 = !DILocation(line: 1040, column: 7, scope: !1157)
!1160 = !DILocation(line: 1042, column: 17, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1156, file: !61, line: 1041, column: 4)
!1162 = !DILocation(line: 1042, column: 12, scope: !1161)
!1163 = !DILocation(line: 1042, column: 5, scope: !1161)
!1164 = !DILocation(line: 1046, column: 5, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1156, file: !61, line: 1045, column: 4)
!1166 = !DILocation(line: 1051, column: 4, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1152, file: !61, line: 1050, column: 3)
!1168 = !DILocation(line: 1055, column: 1, scope: !1097)
!1169 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !61, file: !61, line: 1072, type: !1170, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1170 = !DISubroutineType(types: !1171)
!1171 = !{!437, !437, !69}
!1172 = !DILocalVariable(name: "numerator", arg: 1, scope: !1169, file: !61, line: 1072, type: !437)
!1173 = !DILocation(line: 1072, column: 25, scope: !1169)
!1174 = !DILocalVariable(name: "denominator", arg: 2, scope: !1169, file: !61, line: 1072, type: !69)
!1175 = !DILocation(line: 1072, column: 40, scope: !1169)
!1176 = !DILocalVariable(name: "u32Temp1", scope: !1169, file: !61, line: 1074, type: !437)
!1177 = !DILocation(line: 1074, column: 6, scope: !1169)
!1178 = !DILocation(line: 1075, column: 5, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1169, file: !61, line: 1075, column: 5)
!1180 = !DILocation(line: 1075, column: 17, scope: !1179)
!1181 = !DILocation(line: 1075, column: 5, scope: !1169)
!1182 = !DILocation(line: 1077, column: 3, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1179, file: !61, line: 1076, column: 2)
!1184 = !DILocation(line: 1081, column: 6, scope: !1185)
!1185 = distinct !DILexicalBlock(scope: !1186, file: !61, line: 1081, column: 6)
!1186 = distinct !DILexicalBlock(scope: !1179, file: !61, line: 1080, column: 2)
!1187 = !DILocation(line: 1081, column: 18, scope: !1185)
!1188 = !DILocation(line: 1081, column: 6, scope: !1186)
!1189 = !DILocation(line: 1083, column: 4, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1185, file: !61, line: 1082, column: 3)
!1191 = !DILocation(line: 1087, column: 16, scope: !1192)
!1192 = distinct !DILexicalBlock(scope: !1185, file: !61, line: 1086, column: 3)
!1193 = !DILocation(line: 1087, column: 30, scope: !1192)
!1194 = !DILocation(line: 1087, column: 40, scope: !1192)
!1195 = !DILocation(line: 1087, column: 39, scope: !1192)
!1196 = !DILocation(line: 1087, column: 55, scope: !1192)
!1197 = !DILocation(line: 1087, column: 53, scope: !1192)
!1198 = !DILocation(line: 1087, column: 26, scope: !1192)
!1199 = !DILocation(line: 1087, column: 68, scope: !1192)
!1200 = !DILocation(line: 1087, column: 13, scope: !1192)
!1201 = !DILocation(line: 1088, column: 16, scope: !1192)
!1202 = !DILocation(line: 1088, column: 25, scope: !1192)
!1203 = !DILocation(line: 1088, column: 24, scope: !1192)
!1204 = !DILocation(line: 1088, column: 41, scope: !1192)
!1205 = !DILocation(line: 1088, column: 51, scope: !1192)
!1206 = !DILocation(line: 1088, column: 50, scope: !1192)
!1207 = !DILocation(line: 1088, column: 38, scope: !1192)
!1208 = !DILocation(line: 1088, column: 13, scope: !1192)
!1209 = !DILocation(line: 1089, column: 11, scope: !1192)
!1210 = !DILocation(line: 1089, column: 4, scope: !1192)
!1211 = !DILocation(line: 1092, column: 1, scope: !1169)
!1212 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !61, file: !61, line: 1109, type: !1213, scopeLine: 1110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1213 = !DISubroutineType(types: !1214)
!1214 = !{!437, !69, !437}
!1215 = !DILocalVariable(name: "numerator", arg: 1, scope: !1212, file: !61, line: 1109, type: !69)
!1216 = !DILocation(line: 1109, column: 25, scope: !1212)
!1217 = !DILocalVariable(name: "denominator", arg: 2, scope: !1212, file: !61, line: 1109, type: !437)
!1218 = !DILocation(line: 1109, column: 40, scope: !1212)
!1219 = !DILocalVariable(name: "s32Temp1", scope: !1212, file: !61, line: 1111, type: !69)
!1220 = !DILocation(line: 1111, column: 6, scope: !1212)
!1221 = !DILocation(line: 1112, column: 5, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1212, file: !61, line: 1112, column: 5)
!1223 = !DILocation(line: 1112, column: 17, scope: !1222)
!1224 = !DILocation(line: 1112, column: 5, scope: !1212)
!1225 = !DILocation(line: 1114, column: 6, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1227, file: !61, line: 1114, column: 6)
!1227 = distinct !DILexicalBlock(scope: !1222, file: !61, line: 1113, column: 2)
!1228 = !DILocation(line: 1114, column: 16, scope: !1226)
!1229 = !DILocation(line: 1114, column: 6, scope: !1227)
!1230 = !DILocation(line: 1116, column: 4, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1226, file: !61, line: 1115, column: 3)
!1232 = !DILocation(line: 1120, column: 4, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1226, file: !61, line: 1119, column: 3)
!1234 = !DILocation(line: 1125, column: 6, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1236, file: !61, line: 1125, column: 6)
!1236 = distinct !DILexicalBlock(scope: !1222, file: !61, line: 1124, column: 2)
!1237 = !DILocation(line: 1125, column: 16, scope: !1235)
!1238 = !DILocation(line: 1125, column: 6, scope: !1236)
!1239 = !DILocation(line: 1127, column: 17, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1235, file: !61, line: 1126, column: 3)
!1241 = !DILocation(line: 1127, column: 31, scope: !1240)
!1242 = !DILocation(line: 1127, column: 41, scope: !1240)
!1243 = !DILocation(line: 1127, column: 40, scope: !1240)
!1244 = !DILocation(line: 1127, column: 56, scope: !1240)
!1245 = !DILocation(line: 1127, column: 54, scope: !1240)
!1246 = !DILocation(line: 1127, column: 27, scope: !1240)
!1247 = !DILocation(line: 1127, column: 69, scope: !1240)
!1248 = !DILocation(line: 1127, column: 13, scope: !1240)
!1249 = !DILocation(line: 1128, column: 13, scope: !1240)
!1250 = !DILocation(line: 1128, column: 23, scope: !1240)
!1251 = !DILocation(line: 1128, column: 22, scope: !1240)
!1252 = !DILocation(line: 1128, column: 39, scope: !1240)
!1253 = !DILocation(line: 1128, column: 48, scope: !1240)
!1254 = !DILocation(line: 1128, column: 47, scope: !1240)
!1255 = !DILocation(line: 1128, column: 36, scope: !1240)
!1256 = !DILocation(line: 1128, column: 4, scope: !1240)
!1257 = !DILocation(line: 1132, column: 4, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1235, file: !61, line: 1131, column: 3)
!1259 = !DILocation(line: 1135, column: 1, scope: !1212)
!1260 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !61, file: !61, line: 1152, type: !1261, scopeLine: 1153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1261 = !DISubroutineType(types: !1262)
!1262 = !{!437, !69, !69}
!1263 = !DILocalVariable(name: "numerator", arg: 1, scope: !1260, file: !61, line: 1152, type: !69)
!1264 = !DILocation(line: 1152, column: 25, scope: !1260)
!1265 = !DILocalVariable(name: "denominator", arg: 2, scope: !1260, file: !61, line: 1152, type: !69)
!1266 = !DILocation(line: 1152, column: 40, scope: !1260)
!1267 = !DILocalVariable(name: "u32Temp1", scope: !1260, file: !61, line: 1154, type: !437)
!1268 = !DILocation(line: 1154, column: 6, scope: !1260)
!1269 = !DILocalVariable(name: "u32Temp2", scope: !1260, file: !61, line: 1154, type: !437)
!1270 = !DILocation(line: 1154, column: 20, scope: !1260)
!1271 = !DILocation(line: 1155, column: 5, scope: !1272)
!1272 = distinct !DILexicalBlock(scope: !1260, file: !61, line: 1155, column: 5)
!1273 = !DILocation(line: 1155, column: 17, scope: !1272)
!1274 = !DILocation(line: 1155, column: 5, scope: !1260)
!1275 = !DILocation(line: 1157, column: 6, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1277, file: !61, line: 1157, column: 6)
!1277 = distinct !DILexicalBlock(scope: !1272, file: !61, line: 1156, column: 2)
!1278 = !DILocation(line: 1157, column: 16, scope: !1276)
!1279 = !DILocation(line: 1157, column: 6, scope: !1277)
!1280 = !DILocation(line: 1159, column: 4, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !61, line: 1158, column: 3)
!1282 = !DILocation(line: 1163, column: 4, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1276, file: !61, line: 1162, column: 3)
!1284 = !DILocation(line: 1168, column: 6, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1286, file: !61, line: 1168, column: 6)
!1286 = distinct !DILexicalBlock(scope: !1272, file: !61, line: 1167, column: 2)
!1287 = !DILocation(line: 1168, column: 16, scope: !1285)
!1288 = !DILocation(line: 1168, column: 6, scope: !1286)
!1289 = !DILocation(line: 1170, column: 7, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1291, file: !61, line: 1170, column: 7)
!1291 = distinct !DILexicalBlock(scope: !1285, file: !61, line: 1169, column: 3)
!1292 = !DILocation(line: 1170, column: 17, scope: !1290)
!1293 = !DILocation(line: 1170, column: 7, scope: !1291)
!1294 = !DILocation(line: 1172, column: 5, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1290, file: !61, line: 1171, column: 4)
!1296 = !DILocation(line: 1176, column: 8, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1298, file: !61, line: 1176, column: 8)
!1298 = distinct !DILexicalBlock(scope: !1290, file: !61, line: 1175, column: 4)
!1299 = !DILocation(line: 1176, column: 20, scope: !1297)
!1300 = !DILocation(line: 1176, column: 8, scope: !1298)
!1301 = !DILocation(line: 1178, column: 6, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1297, file: !61, line: 1177, column: 5)
!1303 = !DILocation(line: 1182, column: 18, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1297, file: !61, line: 1181, column: 5)
!1305 = !DILocation(line: 1182, column: 32, scope: !1304)
!1306 = !DILocation(line: 1182, column: 42, scope: !1304)
!1307 = !DILocation(line: 1182, column: 41, scope: !1304)
!1308 = !DILocation(line: 1182, column: 57, scope: !1304)
!1309 = !DILocation(line: 1182, column: 55, scope: !1304)
!1310 = !DILocation(line: 1182, column: 28, scope: !1304)
!1311 = !DILocation(line: 1182, column: 71, scope: !1304)
!1312 = !DILocation(line: 1182, column: 15, scope: !1304)
!1313 = !DILocation(line: 1183, column: 18, scope: !1304)
!1314 = !DILocation(line: 1183, column: 29, scope: !1304)
!1315 = !DILocation(line: 1183, column: 27, scope: !1304)
!1316 = !DILocation(line: 1183, column: 45, scope: !1304)
!1317 = !DILocation(line: 1183, column: 57, scope: !1304)
!1318 = !DILocation(line: 1183, column: 55, scope: !1304)
!1319 = !DILocation(line: 1183, column: 42, scope: !1304)
!1320 = !DILocation(line: 1183, column: 15, scope: !1304)
!1321 = !DILocation(line: 1184, column: 13, scope: !1304)
!1322 = !DILocation(line: 1184, column: 6, scope: !1304)
!1323 = !DILocation(line: 1190, column: 7, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1325, file: !61, line: 1190, column: 7)
!1325 = distinct !DILexicalBlock(scope: !1285, file: !61, line: 1189, column: 3)
!1326 = !DILocation(line: 1190, column: 19, scope: !1324)
!1327 = !DILocation(line: 1190, column: 7, scope: !1325)
!1328 = !DILocation(line: 1192, column: 5, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1324, file: !61, line: 1191, column: 4)
!1330 = !DILocation(line: 1196, column: 18, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1324, file: !61, line: 1195, column: 4)
!1332 = !DILocation(line: 1196, column: 17, scope: !1331)
!1333 = !DILocation(line: 1196, column: 15, scope: !1331)
!1334 = !DILocation(line: 1197, column: 20, scope: !1331)
!1335 = !DILocation(line: 1197, column: 19, scope: !1331)
!1336 = !DILocation(line: 1197, column: 17, scope: !1331)
!1337 = !DILocation(line: 1198, column: 17, scope: !1331)
!1338 = !DILocation(line: 1198, column: 31, scope: !1331)
!1339 = !DILocation(line: 1198, column: 41, scope: !1331)
!1340 = !DILocation(line: 1198, column: 40, scope: !1331)
!1341 = !DILocation(line: 1198, column: 56, scope: !1331)
!1342 = !DILocation(line: 1198, column: 54, scope: !1331)
!1343 = !DILocation(line: 1198, column: 27, scope: !1331)
!1344 = !DILocation(line: 1198, column: 70, scope: !1331)
!1345 = !DILocation(line: 1198, column: 14, scope: !1331)
!1346 = !DILocation(line: 1199, column: 17, scope: !1331)
!1347 = !DILocation(line: 1199, column: 28, scope: !1331)
!1348 = !DILocation(line: 1199, column: 26, scope: !1331)
!1349 = !DILocation(line: 1199, column: 44, scope: !1331)
!1350 = !DILocation(line: 1199, column: 56, scope: !1331)
!1351 = !DILocation(line: 1199, column: 54, scope: !1331)
!1352 = !DILocation(line: 1199, column: 41, scope: !1331)
!1353 = !DILocation(line: 1199, column: 14, scope: !1331)
!1354 = !DILocation(line: 1200, column: 12, scope: !1331)
!1355 = !DILocation(line: 1200, column: 5, scope: !1331)
!1356 = !DILocation(line: 1205, column: 1, scope: !1260)
!1357 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !61, file: !61, line: 1222, type: !1358, scopeLine: 1223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1358 = !DISubroutineType(types: !1359)
!1359 = !{!437, !437, !437}
!1360 = !DILocalVariable(name: "numerator", arg: 1, scope: !1357, file: !61, line: 1222, type: !437)
!1361 = !DILocation(line: 1222, column: 25, scope: !1357)
!1362 = !DILocalVariable(name: "denominator", arg: 2, scope: !1357, file: !61, line: 1222, type: !437)
!1363 = !DILocation(line: 1222, column: 40, scope: !1357)
!1364 = !DILocalVariable(name: "u32Temp1", scope: !1357, file: !61, line: 1225, type: !437)
!1365 = !DILocation(line: 1225, column: 6, scope: !1357)
!1366 = !DILocalVariable(name: "u32Temp2", scope: !1357, file: !61, line: 1225, type: !437)
!1367 = !DILocation(line: 1225, column: 20, scope: !1357)
!1368 = !DILocalVariable(name: "u32Temp3", scope: !1357, file: !61, line: 1225, type: !437)
!1369 = !DILocation(line: 1225, column: 34, scope: !1357)
!1370 = !DILocalVariable(name: "numerator_old", scope: !1357, file: !61, line: 1225, type: !437)
!1371 = !DILocation(line: 1225, column: 48, scope: !1357)
!1372 = !DILocation(line: 1226, column: 5, scope: !1373)
!1373 = distinct !DILexicalBlock(scope: !1357, file: !61, line: 1226, column: 5)
!1374 = !DILocation(line: 1226, column: 16, scope: !1373)
!1375 = !DILocation(line: 1226, column: 5, scope: !1357)
!1376 = !DILocation(line: 1228, column: 3, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1373, file: !61, line: 1227, column: 2)
!1378 = !DILocation(line: 1232, column: 14, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1373, file: !61, line: 1231, column: 2)
!1380 = !DILocation(line: 1232, column: 26, scope: !1379)
!1381 = !DILocation(line: 1232, column: 41, scope: !1379)
!1382 = !DILocation(line: 1232, column: 51, scope: !1379)
!1383 = !DILocation(line: 1232, column: 50, scope: !1379)
!1384 = !DILocation(line: 1232, column: 38, scope: !1379)
!1385 = !DILocation(line: 1232, column: 24, scope: !1379)
!1386 = !DILocation(line: 1232, column: 12, scope: !1379)
!1387 = !DILocation(line: 1233, column: 7, scope: !1388)
!1388 = distinct !DILexicalBlock(scope: !1379, file: !61, line: 1233, column: 6)
!1389 = !DILocation(line: 1233, column: 16, scope: !1388)
!1390 = !DILocation(line: 1233, column: 24, scope: !1388)
!1391 = !DILocation(line: 1233, column: 6, scope: !1379)
!1392 = !DILocation(line: 1235, column: 16, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1388, file: !61, line: 1234, column: 3)
!1394 = !DILocation(line: 1235, column: 27, scope: !1393)
!1395 = !DILocation(line: 1235, column: 13, scope: !1393)
!1396 = !DILocation(line: 1236, column: 3, scope: !1393)
!1397 = !DILocation(line: 1239, column: 16, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1388, file: !61, line: 1238, column: 3)
!1399 = !DILocation(line: 1239, column: 27, scope: !1398)
!1400 = !DILocation(line: 1239, column: 32, scope: !1398)
!1401 = !DILocation(line: 1239, column: 13, scope: !1398)
!1402 = !DILocation(line: 1242, column: 6, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1379, file: !61, line: 1242, column: 6)
!1404 = !DILocation(line: 1242, column: 17, scope: !1403)
!1405 = !DILocation(line: 1242, column: 15, scope: !1403)
!1406 = !DILocation(line: 1242, column: 6, scope: !1379)
!1407 = !DILocation(line: 1244, column: 12, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1403, file: !61, line: 1243, column: 3)
!1409 = !DILocation(line: 1244, column: 22, scope: !1408)
!1410 = !DILocation(line: 1244, column: 21, scope: !1408)
!1411 = !DILocation(line: 1244, column: 4, scope: !1408)
!1412 = !DILocation(line: 1248, column: 13, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1403, file: !61, line: 1247, column: 3)
!1414 = !DILocation(line: 1248, column: 23, scope: !1413)
!1415 = !DILocation(line: 1248, column: 22, scope: !1413)
!1416 = !DILocation(line: 1248, column: 36, scope: !1413)
!1417 = !DILocation(line: 1248, column: 4, scope: !1413)
!1418 = !DILocation(line: 1253, column: 1, scope: !1357)
!1419 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !61, file: !61, line: 1270, type: !1420, scopeLine: 1271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1420 = !DISubroutineType(types: !1421)
!1421 = !{!69, !437, !69}
!1422 = !DILocalVariable(name: "numerator", arg: 1, scope: !1419, file: !61, line: 1270, type: !437)
!1423 = !DILocation(line: 1270, column: 25, scope: !1419)
!1424 = !DILocalVariable(name: "denominator", arg: 2, scope: !1419, file: !61, line: 1270, type: !69)
!1425 = !DILocation(line: 1270, column: 40, scope: !1419)
!1426 = !DILocalVariable(name: "u32Temp1", scope: !1419, file: !61, line: 1272, type: !437)
!1427 = !DILocation(line: 1272, column: 6, scope: !1419)
!1428 = !DILocalVariable(name: "u32Temp2", scope: !1419, file: !61, line: 1272, type: !437)
!1429 = !DILocation(line: 1272, column: 20, scope: !1419)
!1430 = !DILocation(line: 1273, column: 5, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1419, file: !61, line: 1273, column: 5)
!1432 = !DILocation(line: 1273, column: 17, scope: !1431)
!1433 = !DILocation(line: 1273, column: 5, scope: !1419)
!1434 = !DILocation(line: 1275, column: 6, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1436, file: !61, line: 1275, column: 6)
!1436 = distinct !DILexicalBlock(scope: !1431, file: !61, line: 1274, column: 2)
!1437 = !DILocation(line: 1275, column: 18, scope: !1435)
!1438 = !DILocation(line: 1275, column: 6, scope: !1436)
!1439 = !DILocation(line: 1277, column: 4, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1435, file: !61, line: 1276, column: 3)
!1441 = !DILocation(line: 1281, column: 19, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1435, file: !61, line: 1280, column: 3)
!1443 = !DILocation(line: 1281, column: 18, scope: !1442)
!1444 = !DILocation(line: 1281, column: 16, scope: !1442)
!1445 = !DILocation(line: 1282, column: 16, scope: !1442)
!1446 = !DILocation(line: 1282, column: 30, scope: !1442)
!1447 = !DILocation(line: 1282, column: 40, scope: !1442)
!1448 = !DILocation(line: 1282, column: 39, scope: !1442)
!1449 = !DILocation(line: 1282, column: 55, scope: !1442)
!1450 = !DILocation(line: 1282, column: 53, scope: !1442)
!1451 = !DILocation(line: 1282, column: 26, scope: !1442)
!1452 = !DILocation(line: 1282, column: 69, scope: !1442)
!1453 = !DILocation(line: 1282, column: 13, scope: !1442)
!1454 = !DILocation(line: 1283, column: 16, scope: !1442)
!1455 = !DILocation(line: 1283, column: 25, scope: !1442)
!1456 = !DILocation(line: 1283, column: 24, scope: !1442)
!1457 = !DILocation(line: 1283, column: 41, scope: !1442)
!1458 = !DILocation(line: 1283, column: 51, scope: !1442)
!1459 = !DILocation(line: 1283, column: 50, scope: !1442)
!1460 = !DILocation(line: 1283, column: 38, scope: !1442)
!1461 = !DILocation(line: 1283, column: 13, scope: !1442)
!1462 = !DILocation(line: 1284, column: 7, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1442, file: !61, line: 1284, column: 7)
!1464 = !DILocation(line: 1284, column: 16, scope: !1463)
!1465 = !DILocation(line: 1284, column: 7, scope: !1442)
!1466 = !DILocation(line: 1286, column: 13, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1463, file: !61, line: 1285, column: 4)
!1468 = !DILocation(line: 1286, column: 12, scope: !1467)
!1469 = !DILocation(line: 1286, column: 5, scope: !1467)
!1470 = !DILocation(line: 1290, column: 5, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1463, file: !61, line: 1289, column: 4)
!1472 = !DILocation(line: 1296, column: 15, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1431, file: !61, line: 1295, column: 2)
!1474 = !DILocation(line: 1296, column: 29, scope: !1473)
!1475 = !DILocation(line: 1296, column: 39, scope: !1473)
!1476 = !DILocation(line: 1296, column: 38, scope: !1473)
!1477 = !DILocation(line: 1296, column: 54, scope: !1473)
!1478 = !DILocation(line: 1296, column: 52, scope: !1473)
!1479 = !DILocation(line: 1296, column: 25, scope: !1473)
!1480 = !DILocation(line: 1296, column: 68, scope: !1473)
!1481 = !DILocation(line: 1296, column: 12, scope: !1473)
!1482 = !DILocation(line: 1297, column: 15, scope: !1473)
!1483 = !DILocation(line: 1297, column: 24, scope: !1473)
!1484 = !DILocation(line: 1297, column: 23, scope: !1473)
!1485 = !DILocation(line: 1297, column: 40, scope: !1473)
!1486 = !DILocation(line: 1297, column: 50, scope: !1473)
!1487 = !DILocation(line: 1297, column: 49, scope: !1473)
!1488 = !DILocation(line: 1297, column: 37, scope: !1473)
!1489 = !DILocation(line: 1297, column: 12, scope: !1473)
!1490 = !DILocation(line: 1298, column: 6, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1473, file: !61, line: 1298, column: 6)
!1492 = !DILocation(line: 1298, column: 15, scope: !1491)
!1493 = !DILocation(line: 1298, column: 6, scope: !1473)
!1494 = !DILocation(line: 1300, column: 11, scope: !1495)
!1495 = distinct !DILexicalBlock(scope: !1491, file: !61, line: 1299, column: 3)
!1496 = !DILocation(line: 1300, column: 4, scope: !1495)
!1497 = !DILocation(line: 1304, column: 4, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1491, file: !61, line: 1303, column: 3)
!1499 = !DILocation(line: 1307, column: 1, scope: !1419)
!1500 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !61, file: !61, line: 1325, type: !1501, scopeLine: 1326, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1501 = !DISubroutineType(types: !1502)
!1502 = !{!69, !69, !437}
!1503 = !DILocalVariable(name: "numerator", arg: 1, scope: !1500, file: !61, line: 1325, type: !69)
!1504 = !DILocation(line: 1325, column: 25, scope: !1500)
!1505 = !DILocalVariable(name: "denominator", arg: 2, scope: !1500, file: !61, line: 1325, type: !437)
!1506 = !DILocation(line: 1325, column: 40, scope: !1500)
!1507 = !DILocalVariable(name: "s32Temp1", scope: !1500, file: !61, line: 1327, type: !69)
!1508 = !DILocation(line: 1327, column: 6, scope: !1500)
!1509 = !DILocalVariable(name: "s32Temp2", scope: !1500, file: !61, line: 1327, type: !69)
!1510 = !DILocation(line: 1327, column: 20, scope: !1500)
!1511 = !DILocalVariable(name: "u32Temp0", scope: !1500, file: !61, line: 1328, type: !437)
!1512 = !DILocation(line: 1328, column: 6, scope: !1500)
!1513 = !DILocalVariable(name: "u32Temp1", scope: !1500, file: !61, line: 1328, type: !437)
!1514 = !DILocation(line: 1328, column: 20, scope: !1500)
!1515 = !DILocalVariable(name: "u32Temp2", scope: !1500, file: !61, line: 1328, type: !437)
!1516 = !DILocation(line: 1328, column: 34, scope: !1500)
!1517 = !DILocation(line: 1329, column: 5, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1500, file: !61, line: 1329, column: 5)
!1519 = !DILocation(line: 1329, column: 17, scope: !1518)
!1520 = !DILocation(line: 1329, column: 5, scope: !1500)
!1521 = !DILocation(line: 1331, column: 6, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1523, file: !61, line: 1331, column: 6)
!1523 = distinct !DILexicalBlock(scope: !1518, file: !61, line: 1330, column: 2)
!1524 = !DILocation(line: 1331, column: 16, scope: !1522)
!1525 = !DILocation(line: 1331, column: 6, scope: !1523)
!1526 = !DILocation(line: 1333, column: 4, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1522, file: !61, line: 1332, column: 3)
!1528 = !DILocation(line: 1337, column: 4, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1522, file: !61, line: 1336, column: 3)
!1530 = !DILocation(line: 1342, column: 6, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1532, file: !61, line: 1342, column: 6)
!1532 = distinct !DILexicalBlock(scope: !1518, file: !61, line: 1341, column: 2)
!1533 = !DILocation(line: 1342, column: 16, scope: !1531)
!1534 = !DILocation(line: 1342, column: 6, scope: !1532)
!1535 = !DILocation(line: 1344, column: 16, scope: !1536)
!1536 = distinct !DILexicalBlock(scope: !1531, file: !61, line: 1343, column: 3)
!1537 = !DILocation(line: 1344, column: 15, scope: !1536)
!1538 = !DILocation(line: 1344, column: 13, scope: !1536)
!1539 = !DILocation(line: 1345, column: 16, scope: !1536)
!1540 = !DILocation(line: 1345, column: 25, scope: !1536)
!1541 = !DILocation(line: 1345, column: 24, scope: !1536)
!1542 = !DILocation(line: 1345, column: 13, scope: !1536)
!1543 = !DILocation(line: 1346, column: 15, scope: !1536)
!1544 = !DILocation(line: 1346, column: 28, scope: !1536)
!1545 = !DILocation(line: 1346, column: 37, scope: !1536)
!1546 = !DILocation(line: 1346, column: 36, scope: !1536)
!1547 = !DILocation(line: 1346, column: 52, scope: !1536)
!1548 = !DILocation(line: 1346, column: 50, scope: !1536)
!1549 = !DILocation(line: 1346, column: 24, scope: !1536)
!1550 = !DILocation(line: 1346, column: 13, scope: !1536)
!1551 = !DILocation(line: 1348, column: 8, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1536, file: !61, line: 1348, column: 7)
!1553 = !DILocation(line: 1348, column: 20, scope: !1552)
!1554 = !DILocation(line: 1348, column: 27, scope: !1552)
!1555 = !DILocation(line: 1348, column: 7, scope: !1536)
!1556 = !DILocation(line: 1350, column: 20, scope: !1557)
!1557 = distinct !DILexicalBlock(scope: !1552, file: !61, line: 1349, column: 4)
!1558 = !DILocation(line: 1350, column: 32, scope: !1557)
!1559 = !DILocation(line: 1350, column: 17, scope: !1557)
!1560 = !DILocation(line: 1351, column: 4, scope: !1557)
!1561 = !DILocation(line: 1354, column: 20, scope: !1562)
!1562 = distinct !DILexicalBlock(scope: !1552, file: !61, line: 1353, column: 4)
!1563 = !DILocation(line: 1354, column: 32, scope: !1562)
!1564 = !DILocation(line: 1354, column: 38, scope: !1562)
!1565 = !DILocation(line: 1354, column: 17, scope: !1562)
!1566 = !DILocation(line: 1358, column: 7, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1536, file: !61, line: 1358, column: 7)
!1568 = !DILocation(line: 1358, column: 18, scope: !1567)
!1569 = !DILocation(line: 1358, column: 16, scope: !1567)
!1570 = !DILocation(line: 1358, column: 7, scope: !1536)
!1571 = !DILocation(line: 1360, column: 14, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1567, file: !61, line: 1359, column: 4)
!1573 = !DILocation(line: 1360, column: 13, scope: !1572)
!1574 = !DILocation(line: 1360, column: 23, scope: !1572)
!1575 = !DILocation(line: 1360, column: 5, scope: !1572)
!1576 = !DILocation(line: 1364, column: 14, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1567, file: !61, line: 1363, column: 4)
!1578 = !DILocation(line: 1364, column: 23, scope: !1577)
!1579 = !DILocation(line: 1364, column: 12, scope: !1577)
!1580 = !DILocation(line: 1364, column: 27, scope: !1577)
!1581 = !DILocation(line: 1364, column: 5, scope: !1577)
!1582 = !DILocation(line: 1371, column: 16, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1531, file: !61, line: 1370, column: 3)
!1584 = !DILocation(line: 1371, column: 30, scope: !1583)
!1585 = !DILocation(line: 1371, column: 40, scope: !1583)
!1586 = !DILocation(line: 1371, column: 39, scope: !1583)
!1587 = !DILocation(line: 1371, column: 55, scope: !1583)
!1588 = !DILocation(line: 1371, column: 53, scope: !1583)
!1589 = !DILocation(line: 1371, column: 26, scope: !1583)
!1590 = !DILocation(line: 1371, column: 69, scope: !1583)
!1591 = !DILocation(line: 1371, column: 13, scope: !1583)
!1592 = !DILocation(line: 1372, column: 16, scope: !1583)
!1593 = !DILocation(line: 1372, column: 26, scope: !1583)
!1594 = !DILocation(line: 1372, column: 25, scope: !1583)
!1595 = !DILocation(line: 1372, column: 42, scope: !1583)
!1596 = !DILocation(line: 1372, column: 51, scope: !1583)
!1597 = !DILocation(line: 1372, column: 50, scope: !1583)
!1598 = !DILocation(line: 1372, column: 39, scope: !1583)
!1599 = !DILocation(line: 1372, column: 13, scope: !1583)
!1600 = !DILocation(line: 1373, column: 11, scope: !1583)
!1601 = !DILocation(line: 1373, column: 4, scope: !1583)
!1602 = !DILocation(line: 1376, column: 1, scope: !1500)
!1603 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !61, file: !61, line: 1393, type: !1604, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1604 = !DISubroutineType(types: !1605)
!1605 = !{!69, !69, !69}
!1606 = !DILocalVariable(name: "numerator", arg: 1, scope: !1603, file: !61, line: 1393, type: !69)
!1607 = !DILocation(line: 1393, column: 25, scope: !1603)
!1608 = !DILocalVariable(name: "denominator", arg: 2, scope: !1603, file: !61, line: 1393, type: !69)
!1609 = !DILocation(line: 1393, column: 40, scope: !1603)
!1610 = !DILocalVariable(name: "s32Temp1", scope: !1603, file: !61, line: 1395, type: !69)
!1611 = !DILocation(line: 1395, column: 6, scope: !1603)
!1612 = !DILocalVariable(name: "s32Temp2", scope: !1603, file: !61, line: 1395, type: !69)
!1613 = !DILocation(line: 1395, column: 20, scope: !1603)
!1614 = !DILocalVariable(name: "denominator_prime", scope: !1603, file: !61, line: 1396, type: !437)
!1615 = !DILocation(line: 1396, column: 6, scope: !1603)
!1616 = !DILocalVariable(name: "u32Temp1", scope: !1603, file: !61, line: 1396, type: !437)
!1617 = !DILocation(line: 1396, column: 29, scope: !1603)
!1618 = !DILocalVariable(name: "u32Temp2", scope: !1603, file: !61, line: 1396, type: !437)
!1619 = !DILocation(line: 1396, column: 43, scope: !1603)
!1620 = !DILocalVariable(name: "u32numerator", scope: !1603, file: !61, line: 1397, type: !437)
!1621 = !DILocation(line: 1397, column: 6, scope: !1603)
!1622 = !DILocalVariable(name: "u32denominator", scope: !1603, file: !61, line: 1397, type: !437)
!1623 = !DILocation(line: 1397, column: 23, scope: !1603)
!1624 = !DILocation(line: 1398, column: 5, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1603, file: !61, line: 1398, column: 5)
!1626 = !DILocation(line: 1398, column: 15, scope: !1625)
!1627 = !DILocation(line: 1398, column: 5, scope: !1603)
!1628 = !DILocation(line: 1400, column: 6, scope: !1629)
!1629 = distinct !DILexicalBlock(scope: !1630, file: !61, line: 1400, column: 6)
!1630 = distinct !DILexicalBlock(scope: !1625, file: !61, line: 1399, column: 2)
!1631 = !DILocation(line: 1400, column: 18, scope: !1629)
!1632 = !DILocation(line: 1400, column: 6, scope: !1630)
!1633 = !DILocation(line: 1402, column: 7, scope: !1634)
!1634 = distinct !DILexicalBlock(scope: !1635, file: !61, line: 1402, column: 7)
!1635 = distinct !DILexicalBlock(scope: !1629, file: !61, line: 1401, column: 3)
!1636 = !DILocation(line: 1402, column: 19, scope: !1634)
!1637 = !DILocation(line: 1402, column: 7, scope: !1635)
!1638 = !DILocation(line: 1404, column: 5, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1634, file: !61, line: 1403, column: 4)
!1640 = !DILocation(line: 1408, column: 21, scope: !1641)
!1641 = distinct !DILexicalBlock(scope: !1634, file: !61, line: 1407, column: 4)
!1642 = !DILocation(line: 1408, column: 20, scope: !1641)
!1643 = !DILocation(line: 1408, column: 18, scope: !1641)
!1644 = !DILocation(line: 1409, column: 23, scope: !1641)
!1645 = !DILocation(line: 1409, column: 22, scope: !1641)
!1646 = !DILocation(line: 1409, column: 20, scope: !1641)
!1647 = !DILocation(line: 1410, column: 16, scope: !1641)
!1648 = !DILocation(line: 1410, column: 33, scope: !1641)
!1649 = !DILocation(line: 1410, column: 46, scope: !1641)
!1650 = !DILocation(line: 1410, column: 45, scope: !1641)
!1651 = !DILocation(line: 1410, column: 64, scope: !1641)
!1652 = !DILocation(line: 1410, column: 62, scope: !1641)
!1653 = !DILocation(line: 1410, column: 29, scope: !1641)
!1654 = !DILocation(line: 1410, column: 81, scope: !1641)
!1655 = !DILocation(line: 1410, column: 14, scope: !1641)
!1656 = !DILocation(line: 1411, column: 17, scope: !1641)
!1657 = !DILocation(line: 1411, column: 30, scope: !1641)
!1658 = !DILocation(line: 1411, column: 29, scope: !1641)
!1659 = !DILocation(line: 1411, column: 49, scope: !1641)
!1660 = !DILocation(line: 1411, column: 58, scope: !1641)
!1661 = !DILocation(line: 1411, column: 57, scope: !1641)
!1662 = !DILocation(line: 1411, column: 46, scope: !1641)
!1663 = !DILocation(line: 1411, column: 14, scope: !1641)
!1664 = !DILocation(line: 1412, column: 8, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1641, file: !61, line: 1412, column: 8)
!1666 = !DILocation(line: 1412, column: 17, scope: !1665)
!1667 = !DILocation(line: 1412, column: 8, scope: !1641)
!1668 = !DILocation(line: 1414, column: 13, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1665, file: !61, line: 1413, column: 5)
!1670 = !DILocation(line: 1414, column: 6, scope: !1669)
!1671 = !DILocation(line: 1418, column: 6, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1665, file: !61, line: 1417, column: 5)
!1673 = !DILocation(line: 1424, column: 20, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1629, file: !61, line: 1423, column: 3)
!1675 = !DILocation(line: 1424, column: 19, scope: !1674)
!1676 = !DILocation(line: 1424, column: 29, scope: !1674)
!1677 = !DILocation(line: 1424, column: 17, scope: !1674)
!1678 = !DILocation(line: 1425, column: 16, scope: !1674)
!1679 = !DILocation(line: 1425, column: 33, scope: !1674)
!1680 = !DILocation(line: 1425, column: 46, scope: !1674)
!1681 = !DILocation(line: 1425, column: 45, scope: !1674)
!1682 = !DILocation(line: 1425, column: 61, scope: !1674)
!1683 = !DILocation(line: 1425, column: 59, scope: !1674)
!1684 = !DILocation(line: 1425, column: 29, scope: !1674)
!1685 = !DILocation(line: 1425, column: 75, scope: !1674)
!1686 = !DILocation(line: 1425, column: 13, scope: !1674)
!1687 = !DILocation(line: 1426, column: 16, scope: !1674)
!1688 = !DILocation(line: 1426, column: 29, scope: !1674)
!1689 = !DILocation(line: 1426, column: 28, scope: !1674)
!1690 = !DILocation(line: 1426, column: 45, scope: !1674)
!1691 = !DILocation(line: 1426, column: 54, scope: !1674)
!1692 = !DILocation(line: 1426, column: 53, scope: !1674)
!1693 = !DILocation(line: 1426, column: 42, scope: !1674)
!1694 = !DILocation(line: 1426, column: 13, scope: !1674)
!1695 = !DILocation(line: 1427, column: 13, scope: !1674)
!1696 = !DILocation(line: 1427, column: 12, scope: !1674)
!1697 = !DILocation(line: 1427, column: 22, scope: !1674)
!1698 = !DILocation(line: 1427, column: 4, scope: !1674)
!1699 = !DILocation(line: 1432, column: 6, scope: !1700)
!1700 = distinct !DILexicalBlock(scope: !1701, file: !61, line: 1432, column: 6)
!1701 = distinct !DILexicalBlock(scope: !1625, file: !61, line: 1431, column: 2)
!1702 = !DILocation(line: 1432, column: 18, scope: !1700)
!1703 = !DILocation(line: 1432, column: 6, scope: !1701)
!1704 = !DILocation(line: 1434, column: 7, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1706, file: !61, line: 1434, column: 7)
!1706 = distinct !DILexicalBlock(scope: !1700, file: !61, line: 1433, column: 3)
!1707 = !DILocation(line: 1434, column: 19, scope: !1705)
!1708 = !DILocation(line: 1434, column: 7, scope: !1706)
!1709 = !DILocation(line: 1436, column: 5, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1705, file: !61, line: 1435, column: 4)
!1711 = !DILocation(line: 1440, column: 23, scope: !1712)
!1712 = distinct !DILexicalBlock(scope: !1705, file: !61, line: 1439, column: 4)
!1713 = !DILocation(line: 1440, column: 22, scope: !1712)
!1714 = !DILocation(line: 1440, column: 35, scope: !1712)
!1715 = !DILocation(line: 1440, column: 20, scope: !1712)
!1716 = !DILocation(line: 1441, column: 17, scope: !1712)
!1717 = !DILocation(line: 1441, column: 31, scope: !1712)
!1718 = !DILocation(line: 1441, column: 41, scope: !1712)
!1719 = !DILocation(line: 1441, column: 40, scope: !1712)
!1720 = !DILocation(line: 1441, column: 59, scope: !1712)
!1721 = !DILocation(line: 1441, column: 57, scope: !1712)
!1722 = !DILocation(line: 1441, column: 27, scope: !1712)
!1723 = !DILocation(line: 1441, column: 76, scope: !1712)
!1724 = !DILocation(line: 1441, column: 14, scope: !1712)
!1725 = !DILocation(line: 1442, column: 17, scope: !1712)
!1726 = !DILocation(line: 1442, column: 27, scope: !1712)
!1727 = !DILocation(line: 1442, column: 26, scope: !1712)
!1728 = !DILocation(line: 1442, column: 46, scope: !1712)
!1729 = !DILocation(line: 1442, column: 55, scope: !1712)
!1730 = !DILocation(line: 1442, column: 54, scope: !1712)
!1731 = !DILocation(line: 1442, column: 43, scope: !1712)
!1732 = !DILocation(line: 1442, column: 14, scope: !1712)
!1733 = !DILocation(line: 1443, column: 14, scope: !1712)
!1734 = !DILocation(line: 1443, column: 13, scope: !1712)
!1735 = !DILocation(line: 1443, column: 23, scope: !1712)
!1736 = !DILocation(line: 1443, column: 5, scope: !1712)
!1737 = !DILocation(line: 1448, column: 16, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1700, file: !61, line: 1447, column: 3)
!1739 = !DILocation(line: 1448, column: 30, scope: !1738)
!1740 = !DILocation(line: 1448, column: 40, scope: !1738)
!1741 = !DILocation(line: 1448, column: 39, scope: !1738)
!1742 = !DILocation(line: 1448, column: 55, scope: !1738)
!1743 = !DILocation(line: 1448, column: 53, scope: !1738)
!1744 = !DILocation(line: 1448, column: 26, scope: !1738)
!1745 = !DILocation(line: 1448, column: 69, scope: !1738)
!1746 = !DILocation(line: 1448, column: 13, scope: !1738)
!1747 = !DILocation(line: 1449, column: 16, scope: !1738)
!1748 = !DILocation(line: 1449, column: 26, scope: !1738)
!1749 = !DILocation(line: 1449, column: 25, scope: !1738)
!1750 = !DILocation(line: 1449, column: 42, scope: !1738)
!1751 = !DILocation(line: 1449, column: 51, scope: !1738)
!1752 = !DILocation(line: 1449, column: 50, scope: !1738)
!1753 = !DILocation(line: 1449, column: 39, scope: !1738)
!1754 = !DILocation(line: 1449, column: 13, scope: !1738)
!1755 = !DILocation(line: 1450, column: 11, scope: !1738)
!1756 = !DILocation(line: 1450, column: 4, scope: !1738)
!1757 = !DILocation(line: 1453, column: 1, scope: !1603)
!1758 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !61, file: !61, line: 1471, type: !1759, scopeLine: 1472, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1759 = !DISubroutineType(types: !1760)
!1760 = !{!6, !69, !437}
!1761 = !DILocalVariable(name: "numerator", arg: 1, scope: !1758, file: !61, line: 1471, type: !69)
!1762 = !DILocation(line: 1471, column: 25, scope: !1758)
!1763 = !DILocalVariable(name: "denominator", arg: 2, scope: !1758, file: !61, line: 1471, type: !437)
!1764 = !DILocation(line: 1471, column: 40, scope: !1758)
!1765 = !DILocalVariable(name: "numerator_prime", scope: !1758, file: !61, line: 1474, type: !437)
!1766 = !DILocation(line: 1474, column: 6, scope: !1758)
!1767 = !DILocalVariable(name: "u32Temp1", scope: !1758, file: !61, line: 1474, type: !437)
!1768 = !DILocation(line: 1474, column: 27, scope: !1758)
!1769 = !DILocalVariable(name: "u32Temp2", scope: !1758, file: !61, line: 1474, type: !437)
!1770 = !DILocation(line: 1474, column: 41, scope: !1758)
!1771 = !DILocalVariable(name: "u32Temp3", scope: !1758, file: !61, line: 1474, type: !437)
!1772 = !DILocation(line: 1474, column: 55, scope: !1758)
!1773 = !DILocalVariable(name: "s32Temp1", scope: !1758, file: !61, line: 1475, type: !69)
!1774 = !DILocation(line: 1475, column: 6, scope: !1758)
!1775 = !DILocalVariable(name: "s32Temp2", scope: !1758, file: !61, line: 1475, type: !69)
!1776 = !DILocation(line: 1475, column: 20, scope: !1758)
!1777 = !DILocalVariable(name: "s32Temp3", scope: !1758, file: !61, line: 1475, type: !69)
!1778 = !DILocation(line: 1475, column: 34, scope: !1758)
!1779 = !DILocation(line: 1476, column: 5, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1758, file: !61, line: 1476, column: 5)
!1781 = !DILocation(line: 1476, column: 17, scope: !1780)
!1782 = !DILocation(line: 1476, column: 5, scope: !1758)
!1783 = !DILocation(line: 1478, column: 6, scope: !1784)
!1784 = distinct !DILexicalBlock(scope: !1785, file: !61, line: 1478, column: 6)
!1785 = distinct !DILexicalBlock(scope: !1780, file: !61, line: 1477, column: 2)
!1786 = !DILocation(line: 1478, column: 15, scope: !1784)
!1787 = !DILocation(line: 1478, column: 6, scope: !1785)
!1788 = !DILocation(line: 1480, column: 4, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1784, file: !61, line: 1479, column: 3)
!1790 = !DILocation(line: 1484, column: 4, scope: !1791)
!1791 = distinct !DILexicalBlock(scope: !1784, file: !61, line: 1483, column: 3)
!1792 = !DILocation(line: 1489, column: 6, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1794, file: !61, line: 1489, column: 6)
!1794 = distinct !DILexicalBlock(scope: !1780, file: !61, line: 1488, column: 2)
!1795 = !DILocation(line: 1489, column: 16, scope: !1793)
!1796 = !DILocation(line: 1489, column: 6, scope: !1794)
!1797 = !DILocation(line: 1491, column: 23, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1793, file: !61, line: 1490, column: 3)
!1799 = !DILocation(line: 1491, column: 22, scope: !1798)
!1800 = !DILocation(line: 1491, column: 20, scope: !1798)
!1801 = !DILocation(line: 1492, column: 16, scope: !1798)
!1802 = !DILocation(line: 1492, column: 32, scope: !1798)
!1803 = !DILocation(line: 1492, column: 31, scope: !1798)
!1804 = !DILocation(line: 1492, column: 13, scope: !1798)
!1805 = !DILocation(line: 1493, column: 15, scope: !1798)
!1806 = !DILocation(line: 1493, column: 34, scope: !1798)
!1807 = !DILocation(line: 1493, column: 45, scope: !1798)
!1808 = !DILocation(line: 1493, column: 43, scope: !1798)
!1809 = !DILocation(line: 1493, column: 31, scope: !1798)
!1810 = !DILocation(line: 1493, column: 13, scope: !1798)
!1811 = !DILocation(line: 1495, column: 8, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1798, file: !61, line: 1495, column: 7)
!1813 = !DILocation(line: 1495, column: 20, scope: !1812)
!1814 = !DILocation(line: 1495, column: 27, scope: !1812)
!1815 = !DILocation(line: 1495, column: 7, scope: !1798)
!1816 = !DILocation(line: 1497, column: 19, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1812, file: !61, line: 1496, column: 4)
!1818 = !DILocation(line: 1497, column: 31, scope: !1817)
!1819 = !DILocation(line: 1497, column: 17, scope: !1817)
!1820 = !DILocation(line: 1498, column: 4, scope: !1817)
!1821 = !DILocation(line: 1501, column: 20, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1812, file: !61, line: 1500, column: 4)
!1823 = !DILocation(line: 1501, column: 32, scope: !1822)
!1824 = !DILocation(line: 1501, column: 38, scope: !1822)
!1825 = !DILocation(line: 1501, column: 17, scope: !1822)
!1826 = !DILocation(line: 1504, column: 7, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1798, file: !61, line: 1504, column: 7)
!1828 = !DILocation(line: 1504, column: 18, scope: !1827)
!1829 = !DILocation(line: 1504, column: 16, scope: !1827)
!1830 = !DILocation(line: 1504, column: 7, scope: !1798)
!1831 = !DILocation(line: 1506, column: 18, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1827, file: !61, line: 1505, column: 4)
!1833 = !DILocation(line: 1506, column: 16, scope: !1832)
!1834 = !DILocation(line: 1506, column: 28, scope: !1832)
!1835 = !DILocation(line: 1506, column: 14, scope: !1832)
!1836 = !DILocation(line: 1507, column: 4, scope: !1832)
!1837 = !DILocation(line: 1510, column: 18, scope: !1838)
!1838 = distinct !DILexicalBlock(scope: !1827, file: !61, line: 1509, column: 4)
!1839 = !DILocation(line: 1510, column: 26, scope: !1838)
!1840 = !DILocation(line: 1510, column: 16, scope: !1838)
!1841 = !DILocation(line: 1510, column: 30, scope: !1838)
!1842 = !DILocation(line: 1510, column: 14, scope: !1838)
!1843 = !DILocation(line: 1512, column: 8, scope: !1844)
!1844 = distinct !DILexicalBlock(scope: !1798, file: !61, line: 1512, column: 7)
!1845 = !DILocation(line: 1512, column: 18, scope: !1844)
!1846 = !DILocation(line: 1512, column: 7, scope: !1798)
!1847 = !DILocation(line: 1514, column: 18, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1844, file: !61, line: 1513, column: 4)
!1849 = !DILocation(line: 1514, column: 12, scope: !1848)
!1850 = !DILocation(line: 1514, column: 5, scope: !1848)
!1851 = !DILocation(line: 1518, column: 5, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1844, file: !61, line: 1517, column: 4)
!1853 = !DILocation(line: 1523, column: 16, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1793, file: !61, line: 1522, column: 3)
!1855 = !DILocation(line: 1523, column: 26, scope: !1854)
!1856 = !DILocation(line: 1523, column: 25, scope: !1854)
!1857 = !DILocation(line: 1523, column: 41, scope: !1854)
!1858 = !DILocation(line: 1523, column: 39, scope: !1854)
!1859 = !DILocation(line: 1523, column: 13, scope: !1854)
!1860 = !DILocation(line: 1524, column: 16, scope: !1854)
!1861 = !DILocation(line: 1524, column: 30, scope: !1854)
!1862 = !DILocation(line: 1524, column: 40, scope: !1854)
!1863 = !DILocation(line: 1524, column: 39, scope: !1854)
!1864 = !DILocation(line: 1524, column: 55, scope: !1854)
!1865 = !DILocation(line: 1524, column: 53, scope: !1854)
!1866 = !DILocation(line: 1524, column: 26, scope: !1854)
!1867 = !DILocation(line: 1524, column: 68, scope: !1854)
!1868 = !DILocation(line: 1524, column: 13, scope: !1854)
!1869 = !DILocation(line: 1525, column: 16, scope: !1854)
!1870 = !DILocation(line: 1525, column: 25, scope: !1854)
!1871 = !DILocation(line: 1525, column: 24, scope: !1854)
!1872 = !DILocation(line: 1525, column: 41, scope: !1854)
!1873 = !DILocation(line: 1525, column: 51, scope: !1854)
!1874 = !DILocation(line: 1525, column: 50, scope: !1854)
!1875 = !DILocation(line: 1525, column: 38, scope: !1854)
!1876 = !DILocation(line: 1525, column: 13, scope: !1854)
!1877 = !DILocation(line: 1526, column: 7, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1854, file: !61, line: 1526, column: 7)
!1879 = !DILocation(line: 1526, column: 16, scope: !1878)
!1880 = !DILocation(line: 1526, column: 7, scope: !1854)
!1881 = !DILocation(line: 1528, column: 17, scope: !1882)
!1882 = distinct !DILexicalBlock(scope: !1878, file: !61, line: 1527, column: 4)
!1883 = !DILocation(line: 1528, column: 12, scope: !1882)
!1884 = !DILocation(line: 1528, column: 5, scope: !1882)
!1885 = !DILocation(line: 1532, column: 5, scope: !1886)
!1886 = distinct !DILexicalBlock(scope: !1878, file: !61, line: 1531, column: 4)
!1887 = !DILocation(line: 1536, column: 1, scope: !1758)
!1888 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1889, file: !1889, line: 12, type: !1890, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !1893)
!1889 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1890 = !DISubroutineType(types: !1891)
!1891 = !{null, !1892}
!1892 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1893 = !{!1894}
!1894 = !DILocalVariable(name: "z", arg: 1, scope: !1888, file: !1889, line: 12, type: !1892)
!1895 = !DILocation(line: 0, scope: !1888)
!1896 = !DILocation(line: 13, column: 9, scope: !1897)
!1897 = distinct !DILexicalBlock(scope: !1888, file: !1889, line: 13, column: 7)
!1898 = !DILocation(line: 13, column: 7, scope: !1888)
!1899 = !DILocation(line: 14, column: 5, scope: !1897)
!1900 = !DILocation(line: 15, column: 1, scope: !1888)
