; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/build/s16_fac05_div_s16_u16_alarm_0053.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [81 x i8] c"KLEE-ALARM-0053: invalid LHS operand for left shift. assert 0 <= (int)numerator;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0053.err\00", align 1
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
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 352, i8* getelementptr inbounds ([81 x i8], [81 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !316
  unreachable, !dbg !316

if.end:                                           ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !318
  %conv4 = sext i16 %2 to i32, !dbg !319
  %shl = shl i32 %conv4, 16, !dbg !320
  %conv5 = sext i32 %shl to i64, !dbg !321
  store volatile i64 %conv5, i64* @klee_alarm_sink_s64, align 8, !dbg !322
  ret i16 0, !dbg !323
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_lshift_lhs_nonnegative(i64 %left) #0 !dbg !324 {
entry:
  %left.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !327, metadata !DIExpression()), !dbg !328
  %0 = load i64, i64* %left.addr, align 8, !dbg !329
  %cmp = icmp sge i64 %0, 0, !dbg !330
  %conv = zext i1 %cmp to i32, !dbg !330
  ret i32 %conv, !dbg !331
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !332 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !333, metadata !DIExpression()), !dbg !334
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !335, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !337, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !339, metadata !DIExpression()), !dbg !340
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !341
  %conv = zext i16 %0 to i32, !dbg !341
  %and = and i32 %conv, 65535, !dbg !342
  %conv1 = trunc i32 %and to i16, !dbg !341
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !343
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !344
  %conv2 = zext i16 %1 to i32, !dbg !344
  %cmp = icmp eq i32 %conv2, 0, !dbg !346
  br i1 %cmp, label %if.then, label %if.else8, !dbg !347

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !348
  %conv4 = sext i16 %2 to i32, !dbg !348
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !351
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !352

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !353
  br label %return, !dbg !353

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !355
  br label %return, !dbg !355

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !357
  %conv9 = sext i16 %3 to i32, !dbg !357
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !359
  %conv10 = sext i16 %4 to i32, !dbg !359
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !360
  %conv11 = zext i16 %5 to i32, !dbg !360
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !361
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !361
  %div = sdiv i32 %conv10, %conv11, !dbg !361, !klee.check.div !101
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !362
  %conv12 = zext i16 %6 to i32, !dbg !362
  %mul = mul nsw i32 %div, %conv12, !dbg !363
  %sub = sub nsw i32 %conv9, %mul, !dbg !364
  %shl = shl i32 %sub, 1, !dbg !365
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !366
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !367
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !368
  %conv13 = zext i16 %8 to i32, !dbg !368
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !369
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !369
  %div14 = sdiv i32 %7, %conv13, !dbg !369, !klee.check.div !101
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !370
  %conv15 = sext i16 %9 to i32, !dbg !370
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !371
  %conv16 = zext i16 %10 to i32, !dbg !371
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !372
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !372
  %div17 = sdiv i32 %conv15, %conv16, !dbg !372, !klee.check.div !101
  %add = add nsw i32 %div14, %div17, !dbg !373
  store i32 %add, i32* %s32Temp1, align 4, !dbg !374
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !375
  %conv18 = trunc i32 %11 to i16, !dbg !375
  store i16 %conv18, i16* %retval, align 2, !dbg !376
  br label %return, !dbg !376

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !377
  ret i16 %12, !dbg !377
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !378 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !381, metadata !DIExpression()), !dbg !382
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !385, metadata !DIExpression()), !dbg !390
  store i32 0, i32* %u32Temp1, align 4, !dbg !390
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !391, metadata !DIExpression()), !dbg !392
  store i32 0, i32* %u32Temp2, align 4, !dbg !392
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !393, metadata !DIExpression()), !dbg !394
  store i32 0, i32* %u32Temp3, align 4, !dbg !394
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !395
  %conv = zext i16 %0 to i32, !dbg !395
  %cmp = icmp eq i32 %conv, 0, !dbg !397
  br i1 %cmp, label %if.then, label %if.else, !dbg !398

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !399
  br label %return, !dbg !399

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !401
  %conv2 = zext i16 %1 to i32, !dbg !401
  %shl = shl i32 %conv2, 16, !dbg !403
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !404
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !405
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !406
  %conv3 = zext i16 %3 to i32, !dbg !406
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !407
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !407
  %div = udiv i32 %2, %conv3, !dbg !407, !klee.check.div !101
  store i32 %div, i32* %u32Temp2, align 4, !dbg !408
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !409
  %add = add i32 %4, 128, !dbg !410
  %shr = lshr i32 %add, 8, !dbg !411
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !412
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !413
  %cmp4 = icmp ult i32 %5, 255, !dbg !415
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !416

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !417
  %conv7 = trunc i32 %6 to i8, !dbg !419
  store i8 %conv7, i8* %retval, align 1, !dbg !420
  br label %return, !dbg !420

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !421
  br label %return, !dbg !421

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !423
  ret i8 %7, !dbg !423
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !424 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !427, metadata !DIExpression()), !dbg !428
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 0, i32* %s32Temp1, align 4, !dbg !432
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !433
  %conv = zext i16 %0 to i32, !dbg !433
  %and = and i32 %conv, 65535, !dbg !434
  %conv1 = trunc i32 %and to i16, !dbg !433
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !435
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !436
  %conv2 = zext i16 %1 to i32, !dbg !436
  %and3 = and i32 %conv2, 65535, !dbg !438
  %cmp = icmp eq i32 %and3, 0, !dbg !439
  br i1 %cmp, label %if.then, label %if.else8, !dbg !440

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !441
  %cmp5 = icmp sge i32 %2, 0, !dbg !444
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !445

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !446
  br label %return, !dbg !446

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !448
  br label %return, !dbg !448

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !450
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !452
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !453
  %conv9 = zext i16 %5 to i32, !dbg !453
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !454
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !454
  %div = sdiv i32 %4, %conv9, !dbg !454, !klee.check.div !101
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !455
  %conv10 = zext i16 %6 to i32, !dbg !455
  %mul = mul nsw i32 %div, %conv10, !dbg !456
  %sub = sub nsw i32 %3, %mul, !dbg !457
  %shl = shl i32 %sub, 1, !dbg !458
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !459
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !460
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !461
  %conv11 = zext i16 %8 to i32, !dbg !461
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !462
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !462
  %div12 = sdiv i32 %7, %conv11, !dbg !462, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !463
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !464
  %conv13 = zext i16 %10 to i32, !dbg !464
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !465
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !465
  %div14 = sdiv i32 %9, %conv13, !dbg !465, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !466
  store i32 %add, i32* %s32Temp1, align 4, !dbg !467
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !468
  %cmp15 = icmp slt i32 %11, 65535, !dbg !470
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !471

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !472
  %cmp18 = icmp sgt i32 %12, 0, !dbg !475
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !476

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !477
  %conv21 = trunc i32 %13 to i16, !dbg !479
  store i16 %conv21, i16* %retval, align 2, !dbg !480
  br label %return, !dbg !480

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !481
  br label %return, !dbg !481

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !483
  br label %return, !dbg !483

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !485
  ret i16 %14, !dbg !485
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !486 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !489, metadata !DIExpression()), !dbg !490
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !491, metadata !DIExpression()), !dbg !492
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !493, metadata !DIExpression()), !dbg !494
  store i32 0, i32* %u32Temp, align 4, !dbg !494
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !495
  %conv = zext i16 %0 to i32, !dbg !495
  %cmp = icmp eq i32 %conv, 0, !dbg !497
  br i1 %cmp, label %if.then, label %if.else, !dbg !498

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !499
  br label %return, !dbg !499

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !501
  %conv2 = zext i16 %1 to i32, !dbg !501
  %shl = shl i32 %conv2, 16, !dbg !503
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !504
  %conv3 = zext i16 %2 to i32, !dbg !504
  %shr = ashr i32 %conv3, 1, !dbg !505
  %add = add nsw i32 %shl, %shr, !dbg !506
  store i32 %add, i32* %u32Temp, align 4, !dbg !507
  %3 = load i32, i32* %u32Temp, align 4, !dbg !508
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !509
  %conv4 = zext i16 %4 to i32, !dbg !509
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !510
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !510
  %div = udiv i32 %3, %conv4, !dbg !510, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !511
  %5 = load i32, i32* %u32Temp, align 4, !dbg !512
  %cmp5 = icmp ult i32 %5, 65535, !dbg !514
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !515

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !516
  %and = and i32 %6, 65535, !dbg !518
  %conv8 = trunc i32 %and to i16, !dbg !516
  store i16 %conv8, i16* %retval, align 2, !dbg !519
  br label %return, !dbg !519

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !520
  br label %return, !dbg !520

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !522
  ret i16 %7, !dbg !522
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !523 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !526, metadata !DIExpression()), !dbg !527
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !528, metadata !DIExpression()), !dbg !529
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !530, metadata !DIExpression()), !dbg !531
  store i32 0, i32* %u32Temp1, align 4, !dbg !531
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !532, metadata !DIExpression()), !dbg !533
  store i32 0, i32* %u32Temp2, align 4, !dbg !533
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !534
  %conv = zext i16 %0 to i32, !dbg !534
  %and = and i32 %conv, 65535, !dbg !535
  %conv1 = trunc i32 %and to i16, !dbg !534
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !536
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !537
  %conv2 = zext i16 %1 to i32, !dbg !537
  %cmp = icmp eq i32 %conv2, 0, !dbg !539
  br i1 %cmp, label %if.then, label %if.else, !dbg !540

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !541
  br label %return, !dbg !541

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !543
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !545
  %conv4 = zext i16 %3 to i32, !dbg !545
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !546
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !546
  %div = udiv i32 %2, %conv4, !dbg !546, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !547
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !548
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !549
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !550
  %conv5 = zext i16 %6 to i32, !dbg !550
  %mul = mul i32 %5, %conv5, !dbg !551
  %sub = sub i32 %4, %mul, !dbg !552
  %shl = shl i32 %sub, 1, !dbg !553
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !554
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !555
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !556
  %conv6 = zext i16 %8 to i32, !dbg !556
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !557
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !557
  %div7 = udiv i32 %7, %conv6, !dbg !557, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !558
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !559
  %conv8 = zext i16 %10 to i32, !dbg !559
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !560
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !560
  %div9 = udiv i32 %9, %conv8, !dbg !560, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !561
  store i32 %add, i32* %u32Temp2, align 4, !dbg !562
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !563
  %cmp10 = icmp ult i32 %11, 65535, !dbg !565
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !566

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !567
  %and13 = and i32 %12, 65535, !dbg !569
  %conv14 = trunc i32 %and13 to i16, !dbg !567
  store i16 %conv14, i16* %retval, align 2, !dbg !570
  br label %return, !dbg !570

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !571
  br label %return, !dbg !571

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !573
  ret i16 %13, !dbg !573
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !574 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !579, metadata !DIExpression()), !dbg !580
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !581, metadata !DIExpression()), !dbg !582
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 0, i32* %s32Result, align 4, !dbg !584
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !585, metadata !DIExpression()), !dbg !586
  store i32 0, i32* %s32Temp1, align 4, !dbg !586
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !587
  %conv = sext i16 %0 to i32, !dbg !587
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !588
  %conv1 = zext i16 %1 to i32, !dbg !588
  %mul = mul nsw i32 %conv, %conv1, !dbg !589
  store i32 %mul, i32* %s32Result, align 4, !dbg !590
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !591
  %conv2 = sext i16 %2 to i32, !dbg !591
  %cmp = icmp eq i32 %conv2, 0, !dbg !593
  br i1 %cmp, label %if.then, label %if.else7, !dbg !594

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !595
  %cmp4 = icmp slt i32 %3, 0, !dbg !598
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !599

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !600
  br label %return, !dbg !600

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !602
  br label %return, !dbg !602

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !604
  %5 = load i32, i32* %s32Result, align 4, !dbg !606
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !607
  %conv8 = sext i16 %6 to i32, !dbg !607
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !608
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !608
  %div = sdiv i32 %5, %conv8, !dbg !608, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !609
  %conv9 = sext i16 %7 to i32, !dbg !609
  %mul10 = mul nsw i32 %div, %conv9, !dbg !610
  %sub = sub nsw i32 %4, %mul10, !dbg !611
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !612
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !613
  %shl = shl i32 %8, 1, !dbg !614
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !615
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !616
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !617
  %conv11 = sext i16 %10 to i32, !dbg !617
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !618
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !618
  %div12 = sdiv i32 %9, %conv11, !dbg !618, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !619
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !620
  %conv13 = sext i16 %12 to i32, !dbg !620
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !621
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !621
  %div14 = sdiv i32 %11, %conv13, !dbg !621, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !622
  store i32 %add, i32* %s32Result, align 4, !dbg !623
  %13 = load i32, i32* %s32Result, align 4, !dbg !624
  %cmp15 = icmp slt i32 %13, 32767, !dbg !626
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !627

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !628
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !631
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !632

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !633
  %conv21 = trunc i32 %15 to i16, !dbg !635
  store i16 %conv21, i16* %retval, align 2, !dbg !636
  br label %return, !dbg !636

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !637
  br label %return, !dbg !637

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !641
  ret i16 %16, !dbg !641
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !642 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !645, metadata !DIExpression()), !dbg !646
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !647, metadata !DIExpression()), !dbg !648
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !649, metadata !DIExpression()), !dbg !650
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !651, metadata !DIExpression()), !dbg !652
  store i32 0, i32* %s32Result, align 4, !dbg !652
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !653, metadata !DIExpression()), !dbg !654
  store i32 0, i32* %s32Temp1, align 4, !dbg !654
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !655
  %conv = zext i16 %0 to i32, !dbg !655
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !656
  %conv1 = sext i16 %1 to i32, !dbg !656
  %mul = mul nsw i32 %conv, %conv1, !dbg !657
  store i32 %mul, i32* %s32Result, align 4, !dbg !658
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !659
  %conv2 = zext i16 %2 to i32, !dbg !659
  %cmp = icmp eq i32 %conv2, 0, !dbg !661
  br i1 %cmp, label %if.then, label %if.else7, !dbg !662

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !663
  %cmp4 = icmp slt i32 %3, 0, !dbg !666
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !667

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !668
  br label %return, !dbg !668

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !670
  br label %return, !dbg !670

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !672
  %5 = load i32, i32* %s32Result, align 4, !dbg !674
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !675
  %conv8 = zext i16 %6 to i32, !dbg !675
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !676
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !676
  %div = sdiv i32 %5, %conv8, !dbg !676, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !677
  %conv9 = zext i16 %7 to i32, !dbg !677
  %mul10 = mul nsw i32 %div, %conv9, !dbg !678
  %sub = sub nsw i32 %4, %mul10, !dbg !679
  %shl = shl i32 %sub, 1, !dbg !680
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !681
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !682
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !683
  %conv11 = zext i16 %9 to i32, !dbg !683
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !684
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !684
  %div12 = sdiv i32 %8, %conv11, !dbg !684, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !685
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !686
  %conv13 = zext i16 %11 to i32, !dbg !686
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !687
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !687
  %div14 = sdiv i32 %10, %conv13, !dbg !687, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !688
  store i32 %add, i32* %s32Result, align 4, !dbg !689
  %12 = load i32, i32* %s32Result, align 4, !dbg !690
  %cmp15 = icmp slt i32 %12, 32767, !dbg !692
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !693

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !694
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !697
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !698

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !699
  %conv21 = trunc i32 %14 to i16, !dbg !701
  store i16 %conv21, i16* %retval, align 2, !dbg !702
  br label %return, !dbg !702

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !703
  br label %return, !dbg !703

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !705
  br label %return, !dbg !705

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !707
  ret i16 %15, !dbg !707
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !708 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !711, metadata !DIExpression()), !dbg !712
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !713, metadata !DIExpression()), !dbg !714
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !715, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !717, metadata !DIExpression()), !dbg !718
  store i32 0, i32* %u32Result, align 4, !dbg !718
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !719, metadata !DIExpression()), !dbg !720
  store i32 0, i32* %u32Temp1, align 4, !dbg !720
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !721, metadata !DIExpression()), !dbg !722
  store i32 0, i32* %s32Result, align 4, !dbg !722
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !723, metadata !DIExpression()), !dbg !724
  store i32 0, i32* %s32Temp1, align 4, !dbg !724
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !725
  %conv = sext i16 %0 to i32, !dbg !725
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !726
  %conv1 = zext i16 %1 to i32, !dbg !726
  %mul = mul nsw i32 %conv, %conv1, !dbg !727
  store i32 %mul, i32* %s32Result, align 4, !dbg !728
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !729
  %conv2 = sext i16 %2 to i32, !dbg !729
  %cmp = icmp eq i32 %conv2, 0, !dbg !731
  br i1 %cmp, label %if.then, label %if.else7, !dbg !732

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !733
  %cmp4 = icmp sge i32 %3, 0, !dbg !736
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !737

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !738
  br label %return, !dbg !738

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !740
  br label %return, !dbg !740

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !742
  %5 = load i32, i32* %s32Result, align 4, !dbg !744
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !745
  %conv8 = sext i16 %6 to i32, !dbg !745
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !746
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !746
  %div = sdiv i32 %5, %conv8, !dbg !746, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv9 = sext i16 %7 to i32, !dbg !747
  %mul10 = mul nsw i32 %div, %conv9, !dbg !748
  %sub = sub nsw i32 %4, %mul10, !dbg !749
  %shl = shl i32 %sub, 1, !dbg !750
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !751
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !752
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !753
  %conv11 = sext i16 %9 to i32, !dbg !753
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !754
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !754
  %div12 = sdiv i32 %8, %conv11, !dbg !754, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !755
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !756
  %conv13 = sext i16 %11 to i32, !dbg !756
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !757
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !757
  %div14 = sdiv i32 %10, %conv13, !dbg !757, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !758
  store i32 %add, i32* %s32Result, align 4, !dbg !759
  %12 = load i32, i32* %s32Result, align 4, !dbg !760
  %cmp15 = icmp slt i32 %12, 65535, !dbg !762
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !763

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !764
  %cmp18 = icmp sgt i32 %13, 0, !dbg !767
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !768

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !769
  %conv21 = trunc i32 %14 to i16, !dbg !771
  store i16 %conv21, i16* %retval, align 2, !dbg !772
  br label %return, !dbg !772

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !773
  br label %return, !dbg !773

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !775
  br label %return, !dbg !775

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !777
  ret i16 %15, !dbg !777
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !778 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !781, metadata !DIExpression()), !dbg !782
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !783, metadata !DIExpression()), !dbg !784
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !785, metadata !DIExpression()), !dbg !786
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !787, metadata !DIExpression()), !dbg !788
  store i32 0, i32* %s32Result, align 4, !dbg !788
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !789, metadata !DIExpression()), !dbg !790
  store i32 0, i32* %s32Temp1, align 4, !dbg !790
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !791
  %conv = sext i16 %0 to i32, !dbg !791
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !792
  %conv1 = zext i16 %1 to i32, !dbg !792
  %mul = mul nsw i32 %conv, %conv1, !dbg !793
  store i32 %mul, i32* %s32Result, align 4, !dbg !794
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !795
  %conv2 = zext i16 %2 to i32, !dbg !795
  %cmp = icmp eq i32 %conv2, 0, !dbg !797
  br i1 %cmp, label %if.then, label %if.else7, !dbg !798

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !799
  %cmp4 = icmp sge i32 %3, 0, !dbg !802
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !803

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !804
  br label %return, !dbg !804

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !806
  br label %return, !dbg !806

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !808
  %5 = load i32, i32* %s32Result, align 4, !dbg !810
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !811
  %conv8 = zext i16 %6 to i32, !dbg !811
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !812
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !812
  %div = sdiv i32 %5, %conv8, !dbg !812, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !813
  %conv9 = zext i16 %7 to i32, !dbg !813
  %mul10 = mul nsw i32 %div, %conv9, !dbg !814
  %sub = sub nsw i32 %4, %mul10, !dbg !815
  %shl = shl i32 %sub, 1, !dbg !816
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !817
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !818
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !819
  %conv11 = zext i16 %9 to i32, !dbg !819
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !820
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !820
  %div12 = sdiv i32 %8, %conv11, !dbg !820, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !821
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !822
  %conv13 = zext i16 %11 to i32, !dbg !822
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !823
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !823
  %div14 = sdiv i32 %10, %conv13, !dbg !823, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !824
  store i32 %add, i32* %s32Result, align 4, !dbg !825
  %12 = load i32, i32* %s32Result, align 4, !dbg !826
  %cmp15 = icmp slt i32 %12, 65535, !dbg !828
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !829

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !830
  %cmp18 = icmp sgt i32 %13, 0, !dbg !833
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !834

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !835
  %conv21 = trunc i32 %14 to i16, !dbg !837
  store i16 %conv21, i16* %retval, align 2, !dbg !838
  br label %return, !dbg !838

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !839
  br label %return, !dbg !839

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !843
  ret i16 %15, !dbg !843
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !844 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !847, metadata !DIExpression()), !dbg !848
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !849, metadata !DIExpression()), !dbg !850
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !851, metadata !DIExpression()), !dbg !852
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !853, metadata !DIExpression()), !dbg !854
  store i32 0, i32* %u32Temp1, align 4, !dbg !854
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !855, metadata !DIExpression()), !dbg !856
  store i16 0, i16* %u16TempDenom, align 2, !dbg !856
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !857
  %conv = zext i16 %0 to i32, !dbg !857
  %cmp = icmp eq i32 %conv, 0, !dbg !859
  br i1 %cmp, label %if.then, label %if.else, !dbg !860

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !861
  br label %return, !dbg !861

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !863
  %conv2 = zext i16 %1 to i32, !dbg !863
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !865
  %conv3 = zext i16 %2 to i32, !dbg !865
  %mul = mul nsw i32 %conv2, %conv3, !dbg !866
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !867
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !868
  %conv4 = zext i16 %3 to i32, !dbg !868
  %shr = ashr i32 %conv4, 1, !dbg !869
  %conv5 = trunc i32 %shr to i16, !dbg !868
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !870
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !871
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !872
  %conv6 = zext i16 %5 to i32, !dbg !872
  %add = add i32 %4, %conv6, !dbg !873
  store i32 %add, i32* %u32Temp1, align 4, !dbg !874
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !875
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !876
  %conv7 = zext i16 %7 to i32, !dbg !876
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !877
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !877
  %div = udiv i32 %6, %conv7, !dbg !877, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !878
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !879
  %cmp8 = icmp ult i32 %8, 65535, !dbg !881
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !882

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !883
  %and = and i32 %9, 65535, !dbg !885
  %conv11 = trunc i32 %and to i16, !dbg !886
  store i16 %conv11, i16* %retval, align 2, !dbg !887
  br label %return, !dbg !887

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !888
  br label %return, !dbg !888

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !890
  ret i16 %10, !dbg !890
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !891 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !894, metadata !DIExpression()), !dbg !895
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !896, metadata !DIExpression()), !dbg !897
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !898, metadata !DIExpression()), !dbg !899
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !900, metadata !DIExpression()), !dbg !901
  store i32 0, i32* %u32Temp1, align 4, !dbg !901
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !902
  %cmp = icmp eq i32 %0, 0, !dbg !904
  br i1 %cmp, label %if.then, label %if.else, !dbg !905

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !906
  br label %return, !dbg !906

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !908
  %conv = zext i16 %1 to i32, !dbg !908
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !910
  %conv1 = zext i16 %2 to i32, !dbg !910
  %mul = mul nsw i32 %conv, %conv1, !dbg !911
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !912
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !913
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !913
  %div = udiv i32 %mul, %3, !dbg !913, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !914
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !915
  %conv2 = zext i16 %4 to i32, !dbg !915
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !917
  %conv3 = zext i16 %5 to i32, !dbg !917
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !918
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !919
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !920
  %mul5 = mul i32 %6, %7, !dbg !921
  %sub = sub i32 %mul4, %mul5, !dbg !922
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !923
  %div6 = udiv i32 %8, 2, !dbg !924
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !925
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !926

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !927
  %inc = add i32 %9, 1, !dbg !927
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !927
  br label %if.end, !dbg !929

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !930
  %cmp10 = icmp ult i32 %10, 65535, !dbg !932
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !933

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !934
  %and = and i32 %11, 65535, !dbg !936
  %conv13 = trunc i32 %and to i16, !dbg !937
  store i16 %conv13, i16* %retval, align 2, !dbg !938
  br label %return, !dbg !938

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !939
  br label %return, !dbg !939

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !941
  ret i16 %12, !dbg !941
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !942 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !945, metadata !DIExpression()), !dbg !946
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !947, metadata !DIExpression()), !dbg !948
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !949, metadata !DIExpression()), !dbg !950
  store i32 0, i32* %u32Temp1, align 4, !dbg !950
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !951
  %conv = zext i16 %0 to i32, !dbg !951
  %cmp = icmp eq i32 %conv, 0, !dbg !953
  br i1 %cmp, label %if.then, label %if.else, !dbg !954

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !955
  br label %return, !dbg !955

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !957
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !959
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !960
  %conv2 = zext i16 %3 to i32, !dbg !960
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !961
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !961
  %div = udiv i32 %2, %conv2, !dbg !961, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !962
  %conv3 = zext i16 %4 to i32, !dbg !962
  %mul = mul i32 %div, %conv3, !dbg !963
  %sub = sub i32 %1, %mul, !dbg !964
  %shl = shl i32 %sub, 1, !dbg !965
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !966
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !967
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !968
  %conv4 = zext i16 %6 to i32, !dbg !968
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !969
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !969
  %div5 = udiv i32 %5, %conv4, !dbg !969, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !970
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !971
  %conv6 = zext i16 %8 to i32, !dbg !971
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !972
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !972
  %div7 = udiv i32 %7, %conv6, !dbg !972, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !973
  store i32 %add, i32* %u32Temp1, align 4, !dbg !974
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !975
  store i32 %9, i32* %retval, align 4, !dbg !976
  br label %return, !dbg !976

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !977
  ret i32 %10, !dbg !977
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !978 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !981, metadata !DIExpression()), !dbg !982
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !983, metadata !DIExpression()), !dbg !984
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !985, metadata !DIExpression()), !dbg !986
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !987, metadata !DIExpression()), !dbg !988
  store i32 0, i32* %s32Temp1, align 4, !dbg !988
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !989, metadata !DIExpression()), !dbg !990
  store i32 0, i32* %s32Temp2, align 4, !dbg !990
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !991, metadata !DIExpression()), !dbg !992
  store i32 0, i32* %s32Temp3, align 4, !dbg !992
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !993
  %conv = sext i16 %0 to i32, !dbg !993
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !994
  %conv1 = sext i16 %1 to i32, !dbg !994
  %mul = mul nsw i32 %conv, %conv1, !dbg !995
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !996
  %2 = load i16, i16* %div.addr, align 2, !dbg !997
  %conv2 = sext i16 %2 to i32, !dbg !997
  %cmp = icmp eq i32 %conv2, 0, !dbg !999
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1000

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1001
  %cmp4 = icmp slt i32 %3, 0, !dbg !1004
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1005

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1006
  br label %return, !dbg !1006

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1008
  br label %return, !dbg !1008

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1010
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1012
  %6 = load i16, i16* %div.addr, align 2, !dbg !1013
  %conv8 = sext i16 %6 to i32, !dbg !1013
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1014
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1014
  %div9 = sdiv i32 %5, %conv8, !dbg !1014, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1015
  %conv10 = sext i16 %7 to i32, !dbg !1015
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1016
  %sub = sub nsw i32 %4, %mul11, !dbg !1017
  %shl = shl i32 %sub, 1, !dbg !1018
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1019
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1020
  %9 = load i16, i16* %div.addr, align 2, !dbg !1021
  %conv12 = sext i16 %9 to i32, !dbg !1021
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1022
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1022
  %div13 = sdiv i32 %8, %conv12, !dbg !1022, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1023
  %11 = load i16, i16* %div.addr, align 2, !dbg !1024
  %conv14 = sext i16 %11 to i32, !dbg !1024
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1025
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1025
  %div15 = sdiv i32 %10, %conv14, !dbg !1025, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1026
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1027
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1028
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1030
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1031

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1032
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1035
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1036

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1037
  %conv22 = trunc i32 %14 to i16, !dbg !1039
  store i16 %conv22, i16* %retval, align 2, !dbg !1040
  br label %return, !dbg !1040

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1041
  br label %return, !dbg !1041

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1043
  br label %return, !dbg !1043

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1045
  ret i16 %15, !dbg !1045
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1046 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1049, metadata !DIExpression()), !dbg !1050
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1051, metadata !DIExpression()), !dbg !1052
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1053, metadata !DIExpression()), !dbg !1054
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1055, metadata !DIExpression()), !dbg !1056
  store i32 0, i32* %s32Result, align 4, !dbg !1056
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1057, metadata !DIExpression()), !dbg !1058
  store i32 0, i32* %s32Temp1, align 4, !dbg !1058
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1059
  %conv = sext i16 %0 to i32, !dbg !1059
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1060
  %conv1 = sext i16 %1 to i32, !dbg !1060
  %mul = mul nsw i32 %conv, %conv1, !dbg !1061
  store i32 %mul, i32* %s32Result, align 4, !dbg !1062
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1063
  %conv2 = zext i16 %2 to i32, !dbg !1063
  %cmp = icmp eq i32 %conv2, 0, !dbg !1065
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1066

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1067
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1070
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1071

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1072
  br label %return, !dbg !1072

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1074
  %cmp7 = icmp eq i32 %4, 0, !dbg !1076
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1077

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1078
  br label %return, !dbg !1078

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1082
  %6 = load i32, i32* %s32Result, align 4, !dbg !1084
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1085
  %conv12 = zext i16 %7 to i32, !dbg !1085
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1086
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1086
  %div = sdiv i32 %6, %conv12, !dbg !1086, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1087
  %conv13 = zext i16 %8 to i32, !dbg !1087
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1088
  %sub = sub nsw i32 %5, %mul14, !dbg !1089
  %shl = shl i32 %sub, 1, !dbg !1090
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1091
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1092
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1093
  %conv15 = zext i16 %10 to i32, !dbg !1093
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1094
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1094
  %div16 = sdiv i32 %9, %conv15, !dbg !1094, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1095
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1096
  %conv17 = zext i16 %12 to i32, !dbg !1096
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1097
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1097
  %div18 = sdiv i32 %11, %conv17, !dbg !1097, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1098
  store i32 %add, i32* %s32Result, align 4, !dbg !1099
  %13 = load i32, i32* %s32Result, align 4, !dbg !1100
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1102
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1103

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1104
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1107
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1108

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1109
  %conv25 = trunc i32 %15 to i16, !dbg !1111
  store i16 %conv25, i16* %retval, align 2, !dbg !1112
  br label %return, !dbg !1112

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1113
  br label %return, !dbg !1113

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1117
  ret i16 %16, !dbg !1117
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1118 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1121, metadata !DIExpression()), !dbg !1122
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1123, metadata !DIExpression()), !dbg !1124
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1125, metadata !DIExpression()), !dbg !1126
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1127
  %cmp = icmp eq i32 %0, 0, !dbg !1129
  br i1 %cmp, label %if.then, label %if.else, !dbg !1130

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1131
  br label %return, !dbg !1131

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1133
  %cmp1 = icmp sle i32 %1, 0, !dbg !1136
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1137

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1138
  br label %return, !dbg !1138

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1140
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1142
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1143
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1144
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1144
  %div = udiv i32 %3, %4, !dbg !1144, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1145
  %mul = mul i32 %div, %5, !dbg !1146
  %sub = sub i32 %2, %mul, !dbg !1147
  %shl = shl i32 %sub, 1, !dbg !1148
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1149
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1150
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1151
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1152
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1152
  %div4 = udiv i32 %6, %7, !dbg !1152, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1153
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1154
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1155
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1155
  %div5 = udiv i32 %8, %9, !dbg !1155, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1156
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1157
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1158
  store i32 %10, i32* %retval, align 4, !dbg !1159
  br label %return, !dbg !1159

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1160
  ret i32 %11, !dbg !1160
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1161 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1164, metadata !DIExpression()), !dbg !1165
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1166, metadata !DIExpression()), !dbg !1167
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1168, metadata !DIExpression()), !dbg !1169
  store i32 0, i32* %s32Temp1, align 4, !dbg !1169
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1170
  %cmp = icmp eq i32 %0, 0, !dbg !1172
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1173

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1174
  %cmp1 = icmp sge i32 %1, 0, !dbg !1177
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1178

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1179
  br label %return, !dbg !1179

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1181
  br label %return, !dbg !1181

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1183
  %cmp4 = icmp sge i32 %2, 0, !dbg !1186
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1187

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1188
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1190
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1191
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1192
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1192
  %div = udiv i32 %4, %5, !dbg !1192, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1193
  %mul = mul i32 %div, %6, !dbg !1194
  %sub = sub i32 %3, %mul, !dbg !1195
  %shl = shl i32 %sub, 1, !dbg !1196
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1197
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1198
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1199
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1200
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1200
  %div6 = udiv i32 %7, %8, !dbg !1200, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1201
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1202
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1203
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1203
  %div7 = udiv i32 %9, %10, !dbg !1203, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1204
  store i32 %add, i32* %retval, align 4, !dbg !1205
  br label %return, !dbg !1205

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1206
  br label %return, !dbg !1206

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1208
  ret i32 %11, !dbg !1208
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1209 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1212, metadata !DIExpression()), !dbg !1213
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1214, metadata !DIExpression()), !dbg !1215
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1216, metadata !DIExpression()), !dbg !1217
  store i32 0, i32* %u32Temp1, align 4, !dbg !1217
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1218, metadata !DIExpression()), !dbg !1219
  store i32 0, i32* %u32Temp2, align 4, !dbg !1219
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1220
  %cmp = icmp eq i32 %0, 0, !dbg !1222
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1223

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1224
  %cmp1 = icmp slt i32 %1, 0, !dbg !1227
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1228

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1229
  br label %return, !dbg !1229

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1231
  br label %return, !dbg !1231

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1233
  %cmp4 = icmp sge i32 %2, 0, !dbg !1236
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1237

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1238
  %cmp6 = icmp eq i32 %3, 0, !dbg !1241
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1242

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1243
  br label %return, !dbg !1243

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1245
  %cmp9 = icmp sle i32 %4, 0, !dbg !1248
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1249

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1250
  br label %return, !dbg !1250

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1252
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1254
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1255
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1256
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1256
  %div = sdiv i32 %6, %7, !dbg !1256, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1257
  %mul = mul nsw i32 %div, %8, !dbg !1258
  %sub = sub nsw i32 %5, %mul, !dbg !1259
  %shl = shl i32 %sub, 1, !dbg !1260
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1261
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1262
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1263
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1264
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1264
  %div12 = udiv i32 %9, %10, !dbg !1264, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1265
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1266
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1267
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1267
  %div13 = sdiv i32 %11, %12, !dbg !1267, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1268
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1269
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1270
  store i32 %13, i32* %retval, align 4, !dbg !1271
  br label %return, !dbg !1271

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1272
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1275
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1276

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1277
  br label %return, !dbg !1277

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1279
  %sub18 = sub nsw i32 0, %15, !dbg !1281
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1282
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1283
  %sub19 = sub nsw i32 0, %16, !dbg !1284
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1285
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1286
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1287
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1288
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1289
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1289
  %div20 = sdiv i32 %18, %19, !dbg !1289, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1290
  %mul21 = mul nsw i32 %div20, %20, !dbg !1291
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1292
  %shl23 = shl i32 %sub22, 1, !dbg !1293
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1294
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1295
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1296
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1297
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1297
  %div24 = udiv i32 %21, %22, !dbg !1297, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1298
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1299
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1300
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1300
  %div25 = sdiv i32 %23, %24, !dbg !1300, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1301
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1302
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1303
  store i32 %25, i32* %retval, align 4, !dbg !1304
  br label %return, !dbg !1304

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1305
  ret i32 %26, !dbg !1305
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1306 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1309, metadata !DIExpression()), !dbg !1310
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1311, metadata !DIExpression()), !dbg !1312
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1313, metadata !DIExpression()), !dbg !1314
  store i32 0, i32* %u32Temp1, align 4, !dbg !1314
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1315, metadata !DIExpression()), !dbg !1316
  store i32 0, i32* %u32Temp2, align 4, !dbg !1316
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1317, metadata !DIExpression()), !dbg !1318
  store i32 0, i32* %u32Temp3, align 4, !dbg !1318
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1319, metadata !DIExpression()), !dbg !1320
  store i32 0, i32* %numerator_old, align 4, !dbg !1320
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1321
  %cmp = icmp eq i32 %0, 0, !dbg !1323
  br i1 %cmp, label %if.then, label %if.else, !dbg !1324

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1325
  br label %return, !dbg !1325

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1327
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1329
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1330
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1331
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1332
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1332
  %div = udiv i32 %3, %4, !dbg !1332, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1333
  %sub = sub i32 %1, %mul, !dbg !1334
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1335
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1336
  %and = and i32 %5, 1, !dbg !1338
  %cmp1 = icmp eq i32 %and, 0, !dbg !1339
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1340

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1341
  %shr = lshr i32 %6, 1, !dbg !1343
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1344
  br label %if.end, !dbg !1345

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1346
  %shr4 = lshr i32 %7, 1, !dbg !1348
  %add = add i32 %shr4, 1, !dbg !1349
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1350
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1351
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1353
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1354
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1355

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1356
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1359
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1359
  %div7 = udiv i32 %10, %11, !dbg !1359, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1360
  br label %return, !dbg !1360

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1361
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1363
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1364
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1364
  %div9 = udiv i32 %12, %13, !dbg !1364, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1365
  store i32 %add10, i32* %retval, align 4, !dbg !1366
  br label %return, !dbg !1366

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1367
  ret i32 %14, !dbg !1367
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1368 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1371, metadata !DIExpression()), !dbg !1372
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1373, metadata !DIExpression()), !dbg !1374
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1375, metadata !DIExpression()), !dbg !1376
  store i32 0, i32* %u32Temp1, align 4, !dbg !1376
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1377, metadata !DIExpression()), !dbg !1378
  store i32 0, i32* %u32Temp2, align 4, !dbg !1378
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1379
  %cmp = icmp sle i32 %0, 0, !dbg !1381
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1382

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1383
  %cmp1 = icmp sge i32 %1, 0, !dbg !1386
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1387

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1388
  br label %return, !dbg !1388

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %sub = sub nsw i32 0, %2, !dbg !1392
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1393
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1394
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1395
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1396
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1397
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1397
  %div = udiv i32 %4, %5, !dbg !1397, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1398
  %mul = mul i32 %div, %6, !dbg !1399
  %sub3 = sub i32 %3, %mul, !dbg !1400
  %shl = shl i32 %sub3, 1, !dbg !1401
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1402
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1403
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1404
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1405
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1405
  %div4 = udiv i32 %7, %8, !dbg !1405, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1406
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1408
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1408
  %div5 = udiv i32 %9, %10, !dbg !1408, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1409
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1410
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1411
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1413
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1414

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1415
  %sub8 = sub i32 0, %12, !dbg !1417
  store i32 %sub8, i32* %retval, align 4, !dbg !1418
  br label %return, !dbg !1418

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1419
  br label %return, !dbg !1419

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1421
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1423
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1425
  %div11 = udiv i32 %14, %15, !dbg !1425, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1426
  %mul12 = mul i32 %div11, %16, !dbg !1427
  %sub13 = sub i32 %13, %mul12, !dbg !1428
  %shl14 = shl i32 %sub13, 1, !dbg !1429
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1430
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1431
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1432
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1433
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1433
  %div15 = udiv i32 %17, %18, !dbg !1433, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1434
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1435
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1436
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1436
  %div16 = udiv i32 %19, %20, !dbg !1436, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1437
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1438
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1439
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1441
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1442

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1443
  store i32 %22, i32* %retval, align 4, !dbg !1445
  br label %return, !dbg !1445

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1446
  br label %return, !dbg !1446

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1448
  ret i32 %23, !dbg !1448
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1449 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1452, metadata !DIExpression()), !dbg !1453
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1454, metadata !DIExpression()), !dbg !1455
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1456, metadata !DIExpression()), !dbg !1457
  store i32 0, i32* %s32Temp1, align 4, !dbg !1457
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1458, metadata !DIExpression()), !dbg !1459
  store i32 0, i32* %s32Temp2, align 4, !dbg !1459
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1460, metadata !DIExpression()), !dbg !1461
  store i32 0, i32* %u32Temp0, align 4, !dbg !1461
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1462, metadata !DIExpression()), !dbg !1463
  store i32 0, i32* %u32Temp1, align 4, !dbg !1463
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1464, metadata !DIExpression()), !dbg !1465
  store i32 0, i32* %u32Temp2, align 4, !dbg !1465
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1466
  %cmp = icmp eq i32 %0, 0, !dbg !1468
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1469

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1470
  %cmp1 = icmp slt i32 %1, 0, !dbg !1473
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1474

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1475
  br label %return, !dbg !1475

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1477
  br label %return, !dbg !1477

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1479
  %cmp4 = icmp sle i32 %2, 0, !dbg !1482
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1483

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %sub = sub nsw i32 0, %3, !dbg !1486
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1487
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1488
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1489
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1490
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1490
  %div = udiv i32 %4, %5, !dbg !1490, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1491
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1492
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1493
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1494
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1495
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1495
  %div6 = udiv i32 %7, %8, !dbg !1495, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %mul = mul i32 %div6, %9, !dbg !1497
  %sub7 = sub i32 %6, %mul, !dbg !1498
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1499
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1500
  %and = and i32 %10, 1, !dbg !1502
  %cmp8 = icmp eq i32 %and, 0, !dbg !1503
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1504

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1505
  %shr = lshr i32 %11, 1, !dbg !1507
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1508
  br label %if.end, !dbg !1509

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1510
  %shr11 = lshr i32 %12, 1, !dbg !1512
  %add = add i32 %shr11, 1, !dbg !1513
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1514
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1515
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1517
  %cmp12 = icmp ult i32 %13, %14, !dbg !1518
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1519

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1520
  %neg = xor i32 %15, -1, !dbg !1522
  %add14 = add i32 %neg, 1, !dbg !1523
  store i32 %add14, i32* %retval, align 4, !dbg !1524
  br label %return, !dbg !1524

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1525
  %add16 = add i32 %16, 1, !dbg !1527
  %neg17 = xor i32 %add16, -1, !dbg !1528
  %add18 = add i32 %neg17, 1, !dbg !1529
  store i32 %add18, i32* %retval, align 4, !dbg !1530
  br label %return, !dbg !1530

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1531
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1533
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1534
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1535
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1535
  %div20 = udiv i32 %18, %19, !dbg !1535, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1536
  %mul21 = mul i32 %div20, %20, !dbg !1537
  %sub22 = sub i32 %17, %mul21, !dbg !1538
  %shl = shl i32 %sub22, 1, !dbg !1539
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1540
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1541
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1543
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1543
  %div23 = udiv i32 %21, %22, !dbg !1543, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1544
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1545
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1546
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1546
  %div24 = udiv i32 %23, %24, !dbg !1546, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1547
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1548
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1549
  store i32 %25, i32* %retval, align 4, !dbg !1550
  br label %return, !dbg !1550

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1551
  ret i32 %26, !dbg !1551
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1552 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1555, metadata !DIExpression()), !dbg !1556
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1557, metadata !DIExpression()), !dbg !1558
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1559, metadata !DIExpression()), !dbg !1560
  store i32 0, i32* %s32Temp1, align 4, !dbg !1560
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1561, metadata !DIExpression()), !dbg !1562
  store i32 0, i32* %s32Temp2, align 4, !dbg !1562
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1563, metadata !DIExpression()), !dbg !1564
  store i32 0, i32* %denominator_prime, align 4, !dbg !1564
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1565, metadata !DIExpression()), !dbg !1566
  store i32 0, i32* %u32Temp1, align 4, !dbg !1566
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1567, metadata !DIExpression()), !dbg !1568
  store i32 0, i32* %u32Temp2, align 4, !dbg !1568
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1569, metadata !DIExpression()), !dbg !1570
  store i32 0, i32* %u32numerator, align 4, !dbg !1570
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1571, metadata !DIExpression()), !dbg !1572
  store i32 0, i32* %u32denominator, align 4, !dbg !1572
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1573
  %cmp = icmp slt i32 %0, 0, !dbg !1575
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1576

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1577
  %cmp1 = icmp sle i32 %1, 0, !dbg !1580
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1581

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1582
  %cmp3 = icmp sge i32 %2, 0, !dbg !1585
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1586

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1587
  br label %return, !dbg !1587

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1589
  %sub = sub nsw i32 0, %3, !dbg !1591
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1592
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1593
  %sub5 = sub nsw i32 0, %4, !dbg !1594
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1595
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1596
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1597
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1598
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1599
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1599
  %div = udiv i32 %6, %7, !dbg !1599, !klee.check.div !101
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1600
  %mul = mul i32 %div, %8, !dbg !1601
  %sub6 = sub i32 %5, %mul, !dbg !1602
  %shl = shl i32 %sub6, 1, !dbg !1603
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1604
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1605
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1606
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1607
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1607
  %div7 = udiv i32 %9, %10, !dbg !1607, !klee.check.div !101
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1608
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1609
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1610
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1610
  %div8 = udiv i32 %11, %12, !dbg !1610, !klee.check.div !101
  %add = add i32 %div7, %div8, !dbg !1611
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1612
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1613
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1615
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1616

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1617
  store i32 %14, i32* %retval, align 4, !dbg !1619
  br label %return, !dbg !1619

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1620
  br label %return, !dbg !1620

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1622
  %neg = xor i32 %15, -1, !dbg !1624
  %add13 = add nsw i32 %neg, 1, !dbg !1625
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1626
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1627
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1628
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1629
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1630
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1630
  %div14 = udiv i32 %17, %18, !dbg !1630, !klee.check.div !101
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1631
  %mul15 = mul i32 %div14, %19, !dbg !1632
  %sub16 = sub i32 %16, %mul15, !dbg !1633
  %shl17 = shl i32 %sub16, 1, !dbg !1634
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1635
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1636
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1637
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1638
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1638
  %div18 = udiv i32 %20, %21, !dbg !1638, !klee.check.div !101
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1639
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1640
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1641
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1641
  %div19 = sdiv i32 %22, %23, !dbg !1641, !klee.check.div !101
  %add20 = add i32 %div18, %div19, !dbg !1642
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1643
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1644
  %neg21 = xor i32 %24, -1, !dbg !1645
  %add22 = add nsw i32 %neg21, 1, !dbg !1646
  store i32 %add22, i32* %retval, align 4, !dbg !1647
  br label %return, !dbg !1647

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1648
  %cmp24 = icmp sle i32 %25, 0, !dbg !1651
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1652

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1653
  %cmp26 = icmp sge i32 %26, 0, !dbg !1656
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1657

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1658
  br label %return, !dbg !1658

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1660
  %neg29 = xor i32 %27, -1, !dbg !1662
  %add30 = add nsw i32 %neg29, 1, !dbg !1663
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1664
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1665
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1666
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1667
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1668
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1668
  %div31 = udiv i32 %29, %30, !dbg !1668, !klee.check.div !101
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1669
  %mul32 = mul i32 %div31, %31, !dbg !1670
  %sub33 = sub i32 %28, %mul32, !dbg !1671
  %shl34 = shl i32 %sub33, 1, !dbg !1672
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1673
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1674
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1675
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1676
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1676
  %div35 = udiv i32 %32, %33, !dbg !1676, !klee.check.div !101
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1677
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1678
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1679
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1679
  %div36 = udiv i32 %34, %35, !dbg !1679, !klee.check.div !101
  %add37 = add i32 %div35, %div36, !dbg !1680
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1681
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1682
  %neg38 = xor i32 %36, -1, !dbg !1683
  %add39 = add nsw i32 %neg38, 1, !dbg !1684
  store i32 %add39, i32* %retval, align 4, !dbg !1685
  br label %return, !dbg !1685

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1686
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1688
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1689
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1690
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1690
  %div41 = sdiv i32 %38, %39, !dbg !1690, !klee.check.div !101
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1691
  %mul42 = mul nsw i32 %div41, %40, !dbg !1692
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1693
  %shl44 = shl i32 %sub43, 1, !dbg !1694
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1695
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1696
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1697
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1698
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1698
  %div45 = sdiv i32 %41, %42, !dbg !1698, !klee.check.div !101
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1699
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1700
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1701
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1701
  %div46 = udiv i32 %43, %44, !dbg !1701, !klee.check.div !101
  %add47 = add i32 %div45, %div46, !dbg !1702
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1703
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1704
  store i32 %45, i32* %retval, align 4, !dbg !1705
  br label %return, !dbg !1705

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1706
  ret i32 %46, !dbg !1706
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1707 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1710, metadata !DIExpression()), !dbg !1711
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1712, metadata !DIExpression()), !dbg !1713
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1714, metadata !DIExpression()), !dbg !1715
  store i32 0, i32* %numerator_prime, align 4, !dbg !1715
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1716, metadata !DIExpression()), !dbg !1717
  store i32 0, i32* %u32Temp1, align 4, !dbg !1717
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1718, metadata !DIExpression()), !dbg !1719
  store i32 0, i32* %u32Temp2, align 4, !dbg !1719
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1720, metadata !DIExpression()), !dbg !1721
  store i32 0, i32* %u32Temp3, align 4, !dbg !1721
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1722, metadata !DIExpression()), !dbg !1723
  store i32 0, i32* %s32Temp1, align 4, !dbg !1723
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1724, metadata !DIExpression()), !dbg !1725
  store i32 0, i32* %s32Temp2, align 4, !dbg !1725
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1726, metadata !DIExpression()), !dbg !1727
  store i32 0, i32* %s32Temp3, align 4, !dbg !1727
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1728
  %cmp = icmp eq i32 %0, 0, !dbg !1730
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1731

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1732
  %cmp1 = icmp slt i32 %1, 0, !dbg !1735
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1736

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1737
  br label %return, !dbg !1737

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1739
  br label %return, !dbg !1739

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1741
  %cmp4 = icmp slt i32 %2, 0, !dbg !1744
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1745

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1746
  %sub = sub nsw i32 0, %3, !dbg !1748
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1749
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1750
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1751
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1752
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1752
  %div = udiv i32 %4, %5, !dbg !1752, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1753
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1754
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1755
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1756
  %mul = mul i32 %7, %8, !dbg !1757
  %sub6 = sub i32 %6, %mul, !dbg !1758
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1759
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1760
  %and = and i32 %9, 1, !dbg !1762
  %cmp7 = icmp eq i32 %and, 0, !dbg !1763
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1764

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1765
  %shr = lshr i32 %10, 1, !dbg !1767
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1768
  br label %if.end, !dbg !1769

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1770
  %shr10 = lshr i32 %11, 1, !dbg !1772
  %add = add i32 %shr10, 1, !dbg !1773
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1774
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1775
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1777
  %cmp11 = icmp ult i32 %12, %13, !dbg !1778
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1779

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1780
  %neg = xor i32 %14, -1, !dbg !1782
  %add13 = add i32 %neg, 1, !dbg !1783
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1784
  br label %if.end18, !dbg !1785

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1786
  %add15 = add i32 %15, 1, !dbg !1788
  %neg16 = xor i32 %add15, -1, !dbg !1789
  %add17 = add i32 %neg16, 1, !dbg !1790
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1791
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1792
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1794
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1795

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1796
  %conv = trunc i32 %17 to i16, !dbg !1798
  store i16 %conv, i16* %retval, align 2, !dbg !1799
  br label %return, !dbg !1799

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1800
  br label %return, !dbg !1800

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1802
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1804
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1805
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1805
  %div23 = udiv i32 %18, %19, !dbg !1805, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1806
  %mul24 = mul i32 %div23, %20, !dbg !1807
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1808
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1809
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1810
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1811
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1812
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1812
  %div25 = udiv i32 %22, %23, !dbg !1812, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1813
  %mul26 = mul i32 %div25, %24, !dbg !1814
  %sub27 = sub i32 %21, %mul26, !dbg !1815
  %shl = shl i32 %sub27, 1, !dbg !1816
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1817
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1818
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1819
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1820
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1820
  %div28 = udiv i32 %25, %26, !dbg !1820, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1821
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1822
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1823
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1823
  %div29 = udiv i32 %27, %28, !dbg !1823, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1824
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1825
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1826
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1828
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1829

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1830
  %conv34 = trunc i32 %30 to i16, !dbg !1832
  store i16 %conv34, i16* %retval, align 2, !dbg !1833
  br label %return, !dbg !1833

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1834
  br label %return, !dbg !1834

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1836
  ret i16 %31, !dbg !1836
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1837 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1843, metadata !DIExpression()), !dbg !1844
  %2 = icmp eq i64 %0, 0, !dbg !1845
  br i1 %2, label %3, label %4, !dbg !1847

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1848
  unreachable, !dbg !1848

4:                                                ; preds = %1
  ret void, !dbg !1849
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/div_Ccode_alarm_0053.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
!4 = !{}
!5 = !{!6, !13, !16, !17, !22}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
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
!27 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
!28 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !13)
!29 = distinct !DICompileUnit(language: DW_LANG_C99, file: !30, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!30 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
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
!41 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
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
!61 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s16_fac05_div_s16_u16/alarm_0053")
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
!318 = !DILocation(line: 357, column: 39, scope: !294)
!319 = !DILocation(line: 357, column: 34, scope: !294)
!320 = !DILocation(line: 357, column: 49, scope: !294)
!321 = !DILocation(line: 357, column: 24, scope: !294)
!322 = !DILocation(line: 357, column: 22, scope: !294)
!323 = !DILocation(line: 358, column: 2, scope: !294)
!324 = distinct !DISubprogram(name: "klee_alarm_s32_lshift_lhs_nonnegative", scope: !27, file: !27, line: 84, type: !325, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!325 = !DISubroutineType(types: !326)
!326 = !{!16, !13}
!327 = !DILocalVariable(name: "left", arg: 1, scope: !324, file: !27, line: 84, type: !13)
!328 = !DILocation(line: 84, column: 51, scope: !324)
!329 = !DILocation(line: 86, column: 12, scope: !324)
!330 = !DILocation(line: 86, column: 17, scope: !324)
!331 = !DILocation(line: 86, column: 5, scope: !324)
!332 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !61, file: !61, line: 409, type: !295, scopeLine: 410, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!333 = !DILocalVariable(name: "numerator", arg: 1, scope: !332, file: !61, line: 409, type: !6)
!334 = !DILocation(line: 409, column: 30, scope: !332)
!335 = !DILocalVariable(name: "denominator", arg: 2, scope: !332, file: !61, line: 409, type: !22)
!336 = !DILocation(line: 409, column: 45, scope: !332)
!337 = !DILocalVariable(name: "u16Temp1", scope: !332, file: !61, line: 411, type: !22)
!338 = !DILocation(line: 411, column: 6, scope: !332)
!339 = !DILocalVariable(name: "s32Temp1", scope: !332, file: !61, line: 412, type: !69)
!340 = !DILocation(line: 412, column: 6, scope: !332)
!341 = !DILocation(line: 413, column: 13, scope: !332)
!342 = !DILocation(line: 413, column: 25, scope: !332)
!343 = !DILocation(line: 413, column: 11, scope: !332)
!344 = !DILocation(line: 414, column: 5, scope: !345)
!345 = distinct !DILexicalBlock(scope: !332, file: !61, line: 414, column: 5)
!346 = !DILocation(line: 414, column: 13, scope: !345)
!347 = !DILocation(line: 414, column: 5, scope: !332)
!348 = !DILocation(line: 416, column: 6, scope: !349)
!349 = distinct !DILexicalBlock(scope: !350, file: !61, line: 416, column: 6)
!350 = distinct !DILexicalBlock(scope: !345, file: !61, line: 415, column: 2)
!351 = !DILocation(line: 416, column: 15, scope: !349)
!352 = !DILocation(line: 416, column: 6, scope: !350)
!353 = !DILocation(line: 418, column: 4, scope: !354)
!354 = distinct !DILexicalBlock(scope: !349, file: !61, line: 417, column: 3)
!355 = !DILocation(line: 422, column: 4, scope: !356)
!356 = distinct !DILexicalBlock(scope: !349, file: !61, line: 421, column: 3)
!357 = !DILocation(line: 428, column: 15, scope: !358)
!358 = distinct !DILexicalBlock(scope: !345, file: !61, line: 427, column: 2)
!359 = !DILocation(line: 428, column: 27, scope: !358)
!360 = !DILocation(line: 428, column: 37, scope: !358)
!361 = !DILocation(line: 428, column: 36, scope: !358)
!362 = !DILocation(line: 428, column: 49, scope: !358)
!363 = !DILocation(line: 428, column: 47, scope: !358)
!364 = !DILocation(line: 428, column: 25, scope: !358)
!365 = !DILocation(line: 428, column: 59, scope: !358)
!366 = !DILocation(line: 428, column: 12, scope: !358)
!367 = !DILocation(line: 429, column: 15, scope: !358)
!368 = !DILocation(line: 429, column: 24, scope: !358)
!369 = !DILocation(line: 429, column: 23, scope: !358)
!370 = !DILocation(line: 429, column: 37, scope: !358)
!371 = !DILocation(line: 429, column: 47, scope: !358)
!372 = !DILocation(line: 429, column: 46, scope: !358)
!373 = !DILocation(line: 429, column: 34, scope: !358)
!374 = !DILocation(line: 429, column: 12, scope: !358)
!375 = !DILocation(line: 430, column: 10, scope: !358)
!376 = !DILocation(line: 430, column: 3, scope: !358)
!377 = !DILocation(line: 432, column: 1, scope: !332)
!378 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !61, file: !61, line: 450, type: !379, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!379 = !DISubroutineType(types: !380)
!380 = !{!17, !22, !22}
!381 = !DILocalVariable(name: "numerator", arg: 1, scope: !378, file: !61, line: 450, type: !22)
!382 = !DILocation(line: 450, column: 28, scope: !378)
!383 = !DILocalVariable(name: "denominator", arg: 2, scope: !378, file: !61, line: 450, type: !22)
!384 = !DILocation(line: 450, column: 43, scope: !378)
!385 = !DILocalVariable(name: "u32Temp1", scope: !378, file: !61, line: 452, type: !386)
!386 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !387)
!387 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !19, line: 26, baseType: !388)
!388 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !389)
!389 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!390 = !DILocation(line: 452, column: 6, scope: !378)
!391 = !DILocalVariable(name: "u32Temp2", scope: !378, file: !61, line: 452, type: !386)
!392 = !DILocation(line: 452, column: 20, scope: !378)
!393 = !DILocalVariable(name: "u32Temp3", scope: !378, file: !61, line: 452, type: !386)
!394 = !DILocation(line: 452, column: 33, scope: !378)
!395 = !DILocation(line: 453, column: 5, scope: !396)
!396 = distinct !DILexicalBlock(scope: !378, file: !61, line: 453, column: 5)
!397 = !DILocation(line: 453, column: 16, scope: !396)
!398 = !DILocation(line: 453, column: 5, scope: !378)
!399 = !DILocation(line: 455, column: 3, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !61, line: 454, column: 2)
!401 = !DILocation(line: 459, column: 15, scope: !402)
!402 = distinct !DILexicalBlock(scope: !396, file: !61, line: 458, column: 2)
!403 = !DILocation(line: 459, column: 24, scope: !402)
!404 = !DILocation(line: 459, column: 12, scope: !402)
!405 = !DILocation(line: 460, column: 14, scope: !402)
!406 = !DILocation(line: 460, column: 25, scope: !402)
!407 = !DILocation(line: 460, column: 23, scope: !402)
!408 = !DILocation(line: 460, column: 12, scope: !402)
!409 = !DILocation(line: 461, column: 15, scope: !402)
!410 = !DILocation(line: 461, column: 24, scope: !402)
!411 = !DILocation(line: 461, column: 32, scope: !402)
!412 = !DILocation(line: 461, column: 12, scope: !402)
!413 = !DILocation(line: 462, column: 6, scope: !414)
!414 = distinct !DILexicalBlock(scope: !402, file: !61, line: 462, column: 6)
!415 = !DILocation(line: 462, column: 15, scope: !414)
!416 = !DILocation(line: 462, column: 6, scope: !402)
!417 = !DILocation(line: 464, column: 15, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !61, line: 463, column: 3)
!419 = !DILocation(line: 464, column: 11, scope: !418)
!420 = !DILocation(line: 464, column: 4, scope: !418)
!421 = !DILocation(line: 468, column: 4, scope: !422)
!422 = distinct !DILexicalBlock(scope: !414, file: !61, line: 467, column: 3)
!423 = !DILocation(line: 471, column: 1, scope: !378)
!424 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !61, file: !61, line: 488, type: !425, scopeLine: 489, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!425 = !DISubroutineType(types: !426)
!426 = !{!22, !69, !22}
!427 = !DILocalVariable(name: "x_value", arg: 1, scope: !424, file: !61, line: 488, type: !69)
!428 = !DILocation(line: 488, column: 25, scope: !424)
!429 = !DILocalVariable(name: "y_value", arg: 2, scope: !424, file: !61, line: 488, type: !22)
!430 = !DILocation(line: 488, column: 38, scope: !424)
!431 = !DILocalVariable(name: "s32Temp1", scope: !424, file: !61, line: 490, type: !69)
!432 = !DILocation(line: 490, column: 6, scope: !424)
!433 = !DILocation(line: 491, column: 12, scope: !424)
!434 = !DILocation(line: 491, column: 20, scope: !424)
!435 = !DILocation(line: 491, column: 10, scope: !424)
!436 = !DILocation(line: 492, column: 6, scope: !437)
!437 = distinct !DILexicalBlock(scope: !424, file: !61, line: 492, column: 5)
!438 = !DILocation(line: 492, column: 14, scope: !437)
!439 = !DILocation(line: 492, column: 24, scope: !437)
!440 = !DILocation(line: 492, column: 5, scope: !424)
!441 = !DILocation(line: 494, column: 6, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !61, line: 494, column: 6)
!443 = distinct !DILexicalBlock(scope: !437, file: !61, line: 493, column: 2)
!444 = !DILocation(line: 494, column: 14, scope: !442)
!445 = !DILocation(line: 494, column: 6, scope: !443)
!446 = !DILocation(line: 496, column: 4, scope: !447)
!447 = distinct !DILexicalBlock(scope: !442, file: !61, line: 495, column: 3)
!448 = !DILocation(line: 500, column: 4, scope: !449)
!449 = distinct !DILexicalBlock(scope: !442, file: !61, line: 499, column: 3)
!450 = !DILocation(line: 505, column: 15, scope: !451)
!451 = distinct !DILexicalBlock(scope: !437, file: !61, line: 504, column: 2)
!452 = !DILocation(line: 505, column: 27, scope: !451)
!453 = !DILocation(line: 505, column: 35, scope: !451)
!454 = !DILocation(line: 505, column: 34, scope: !451)
!455 = !DILocation(line: 505, column: 46, scope: !451)
!456 = !DILocation(line: 505, column: 44, scope: !451)
!457 = !DILocation(line: 505, column: 23, scope: !451)
!458 = !DILocation(line: 505, column: 56, scope: !451)
!459 = !DILocation(line: 505, column: 12, scope: !451)
!460 = !DILocation(line: 506, column: 15, scope: !451)
!461 = !DILocation(line: 506, column: 24, scope: !451)
!462 = !DILocation(line: 506, column: 23, scope: !451)
!463 = !DILocation(line: 506, column: 36, scope: !451)
!464 = !DILocation(line: 506, column: 44, scope: !451)
!465 = !DILocation(line: 506, column: 43, scope: !451)
!466 = !DILocation(line: 506, column: 33, scope: !451)
!467 = !DILocation(line: 506, column: 12, scope: !451)
!468 = !DILocation(line: 507, column: 6, scope: !469)
!469 = distinct !DILexicalBlock(scope: !451, file: !61, line: 507, column: 6)
!470 = !DILocation(line: 507, column: 15, scope: !469)
!471 = !DILocation(line: 507, column: 6, scope: !451)
!472 = !DILocation(line: 509, column: 7, scope: !473)
!473 = distinct !DILexicalBlock(scope: !474, file: !61, line: 509, column: 7)
!474 = distinct !DILexicalBlock(scope: !469, file: !61, line: 508, column: 3)
!475 = !DILocation(line: 509, column: 16, scope: !473)
!476 = !DILocation(line: 509, column: 7, scope: !474)
!477 = !DILocation(line: 511, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !473, file: !61, line: 510, column: 4)
!479 = !DILocation(line: 511, column: 12, scope: !478)
!480 = !DILocation(line: 511, column: 5, scope: !478)
!481 = !DILocation(line: 515, column: 5, scope: !482)
!482 = distinct !DILexicalBlock(scope: !473, file: !61, line: 514, column: 4)
!483 = !DILocation(line: 520, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !469, file: !61, line: 519, column: 3)
!485 = !DILocation(line: 523, column: 1, scope: !424)
!486 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !61, file: !61, line: 541, type: !487, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!487 = !DISubroutineType(types: !488)
!488 = !{!22, !22, !22}
!489 = !DILocalVariable(name: "numerator", arg: 1, scope: !486, file: !61, line: 541, type: !22)
!490 = !DILocation(line: 541, column: 31, scope: !486)
!491 = !DILocalVariable(name: "denominator", arg: 2, scope: !486, file: !61, line: 541, type: !22)
!492 = !DILocation(line: 541, column: 46, scope: !486)
!493 = !DILocalVariable(name: "u32Temp", scope: !486, file: !61, line: 543, type: !386)
!494 = !DILocation(line: 543, column: 6, scope: !486)
!495 = !DILocation(line: 544, column: 5, scope: !496)
!496 = distinct !DILexicalBlock(scope: !486, file: !61, line: 544, column: 5)
!497 = !DILocation(line: 544, column: 17, scope: !496)
!498 = !DILocation(line: 544, column: 5, scope: !486)
!499 = !DILocation(line: 546, column: 3, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !61, line: 545, column: 2)
!501 = !DILocation(line: 550, column: 14, scope: !502)
!502 = distinct !DILexicalBlock(scope: !496, file: !61, line: 549, column: 2)
!503 = !DILocation(line: 550, column: 23, scope: !502)
!504 = !DILocation(line: 550, column: 32, scope: !502)
!505 = !DILocation(line: 550, column: 44, scope: !502)
!506 = !DILocation(line: 550, column: 29, scope: !502)
!507 = !DILocation(line: 550, column: 11, scope: !502)
!508 = !DILocation(line: 551, column: 13, scope: !502)
!509 = !DILocation(line: 551, column: 21, scope: !502)
!510 = !DILocation(line: 551, column: 20, scope: !502)
!511 = !DILocation(line: 551, column: 11, scope: !502)
!512 = !DILocation(line: 552, column: 6, scope: !513)
!513 = distinct !DILexicalBlock(scope: !502, file: !61, line: 552, column: 6)
!514 = !DILocation(line: 552, column: 14, scope: !513)
!515 = !DILocation(line: 552, column: 6, scope: !502)
!516 = !DILocation(line: 554, column: 11, scope: !517)
!517 = distinct !DILexicalBlock(scope: !513, file: !61, line: 553, column: 3)
!518 = !DILocation(line: 554, column: 19, scope: !517)
!519 = !DILocation(line: 554, column: 4, scope: !517)
!520 = !DILocation(line: 558, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !513, file: !61, line: 557, column: 3)
!522 = !DILocation(line: 562, column: 1, scope: !486)
!523 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !61, file: !61, line: 579, type: !524, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!524 = !DISubroutineType(types: !525)
!525 = !{!22, !386, !22}
!526 = !DILocalVariable(name: "x_value", arg: 1, scope: !523, file: !61, line: 579, type: !386)
!527 = !DILocation(line: 579, column: 25, scope: !523)
!528 = !DILocalVariable(name: "y_value", arg: 2, scope: !523, file: !61, line: 579, type: !22)
!529 = !DILocation(line: 579, column: 38, scope: !523)
!530 = !DILocalVariable(name: "u32Temp1", scope: !523, file: !61, line: 581, type: !386)
!531 = !DILocation(line: 581, column: 6, scope: !523)
!532 = !DILocalVariable(name: "u32Temp2", scope: !523, file: !61, line: 581, type: !386)
!533 = !DILocation(line: 581, column: 17, scope: !523)
!534 = !DILocation(line: 582, column: 12, scope: !523)
!535 = !DILocation(line: 582, column: 20, scope: !523)
!536 = !DILocation(line: 582, column: 10, scope: !523)
!537 = !DILocation(line: 583, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !523, file: !61, line: 583, column: 5)
!539 = !DILocation(line: 583, column: 13, scope: !538)
!540 = !DILocation(line: 583, column: 5, scope: !523)
!541 = !DILocation(line: 585, column: 3, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !61, line: 584, column: 2)
!543 = !DILocation(line: 589, column: 14, scope: !544)
!544 = distinct !DILexicalBlock(scope: !538, file: !61, line: 588, column: 2)
!545 = !DILocation(line: 589, column: 22, scope: !544)
!546 = !DILocation(line: 589, column: 21, scope: !544)
!547 = !DILocation(line: 589, column: 12, scope: !544)
!548 = !DILocation(line: 590, column: 14, scope: !544)
!549 = !DILocation(line: 590, column: 25, scope: !544)
!550 = !DILocation(line: 590, column: 36, scope: !544)
!551 = !DILocation(line: 590, column: 34, scope: !544)
!552 = !DILocation(line: 590, column: 22, scope: !544)
!553 = !DILocation(line: 590, column: 45, scope: !544)
!554 = !DILocation(line: 590, column: 12, scope: !544)
!555 = !DILocation(line: 591, column: 15, scope: !544)
!556 = !DILocation(line: 591, column: 24, scope: !544)
!557 = !DILocation(line: 591, column: 23, scope: !544)
!558 = !DILocation(line: 591, column: 36, scope: !544)
!559 = !DILocation(line: 591, column: 44, scope: !544)
!560 = !DILocation(line: 591, column: 43, scope: !544)
!561 = !DILocation(line: 591, column: 33, scope: !544)
!562 = !DILocation(line: 591, column: 12, scope: !544)
!563 = !DILocation(line: 592, column: 6, scope: !564)
!564 = distinct !DILexicalBlock(scope: !544, file: !61, line: 592, column: 6)
!565 = !DILocation(line: 592, column: 15, scope: !564)
!566 = !DILocation(line: 592, column: 6, scope: !544)
!567 = !DILocation(line: 594, column: 11, scope: !568)
!568 = distinct !DILexicalBlock(scope: !564, file: !61, line: 593, column: 3)
!569 = !DILocation(line: 594, column: 20, scope: !568)
!570 = !DILocation(line: 594, column: 4, scope: !568)
!571 = !DILocation(line: 598, column: 4, scope: !572)
!572 = distinct !DILexicalBlock(scope: !564, file: !61, line: 597, column: 3)
!573 = !DILocation(line: 602, column: 1, scope: !523)
!574 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 621, type: !575, scopeLine: 622, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!575 = !DISubroutineType(types: !576)
!576 = !{!6, !6, !22, !6}
!577 = !DILocalVariable(name: "factor1", arg: 1, scope: !574, file: !61, line: 621, type: !6)
!578 = !DILocation(line: 621, column: 33, scope: !574)
!579 = !DILocalVariable(name: "factor2", arg: 2, scope: !574, file: !61, line: 621, type: !22)
!580 = !DILocation(line: 621, column: 46, scope: !574)
!581 = !DILocalVariable(name: "denominator", arg: 3, scope: !574, file: !61, line: 621, type: !6)
!582 = !DILocation(line: 621, column: 59, scope: !574)
!583 = !DILocalVariable(name: "s32Result", scope: !574, file: !61, line: 623, type: !69)
!584 = !DILocation(line: 623, column: 6, scope: !574)
!585 = !DILocalVariable(name: "s32Temp1", scope: !574, file: !61, line: 623, type: !69)
!586 = !DILocation(line: 623, column: 21, scope: !574)
!587 = !DILocation(line: 624, column: 14, scope: !574)
!588 = !DILocation(line: 624, column: 24, scope: !574)
!589 = !DILocation(line: 624, column: 22, scope: !574)
!590 = !DILocation(line: 624, column: 12, scope: !574)
!591 = !DILocation(line: 625, column: 5, scope: !592)
!592 = distinct !DILexicalBlock(scope: !574, file: !61, line: 625, column: 5)
!593 = !DILocation(line: 625, column: 17, scope: !592)
!594 = !DILocation(line: 625, column: 5, scope: !574)
!595 = !DILocation(line: 627, column: 6, scope: !596)
!596 = distinct !DILexicalBlock(scope: !597, file: !61, line: 627, column: 6)
!597 = distinct !DILexicalBlock(scope: !592, file: !61, line: 626, column: 2)
!598 = !DILocation(line: 627, column: 16, scope: !596)
!599 = !DILocation(line: 627, column: 6, scope: !597)
!600 = !DILocation(line: 629, column: 4, scope: !601)
!601 = distinct !DILexicalBlock(scope: !596, file: !61, line: 628, column: 3)
!602 = !DILocation(line: 633, column: 4, scope: !603)
!603 = distinct !DILexicalBlock(scope: !596, file: !61, line: 632, column: 3)
!604 = !DILocation(line: 638, column: 14, scope: !605)
!605 = distinct !DILexicalBlock(scope: !592, file: !61, line: 637, column: 2)
!606 = !DILocation(line: 638, column: 27, scope: !605)
!607 = !DILocation(line: 638, column: 37, scope: !605)
!608 = !DILocation(line: 638, column: 36, scope: !605)
!609 = !DILocation(line: 638, column: 50, scope: !605)
!610 = !DILocation(line: 638, column: 49, scope: !605)
!611 = !DILocation(line: 638, column: 24, scope: !605)
!612 = !DILocation(line: 638, column: 12, scope: !605)
!613 = !DILocation(line: 639, column: 14, scope: !605)
!614 = !DILocation(line: 639, column: 23, scope: !605)
!615 = !DILocation(line: 639, column: 12, scope: !605)
!616 = !DILocation(line: 640, column: 16, scope: !605)
!617 = !DILocation(line: 640, column: 25, scope: !605)
!618 = !DILocation(line: 640, column: 24, scope: !605)
!619 = !DILocation(line: 640, column: 41, scope: !605)
!620 = !DILocation(line: 640, column: 51, scope: !605)
!621 = !DILocation(line: 640, column: 50, scope: !605)
!622 = !DILocation(line: 640, column: 38, scope: !605)
!623 = !DILocation(line: 640, column: 13, scope: !605)
!624 = !DILocation(line: 641, column: 6, scope: !625)
!625 = distinct !DILexicalBlock(scope: !605, file: !61, line: 641, column: 6)
!626 = !DILocation(line: 641, column: 16, scope: !625)
!627 = !DILocation(line: 641, column: 6, scope: !605)
!628 = !DILocation(line: 643, column: 7, scope: !629)
!629 = distinct !DILexicalBlock(scope: !630, file: !61, line: 643, column: 7)
!630 = distinct !DILexicalBlock(scope: !625, file: !61, line: 642, column: 3)
!631 = !DILocation(line: 643, column: 17, scope: !629)
!632 = !DILocation(line: 643, column: 7, scope: !630)
!633 = !DILocation(line: 645, column: 17, scope: !634)
!634 = distinct !DILexicalBlock(scope: !629, file: !61, line: 644, column: 4)
!635 = !DILocation(line: 645, column: 12, scope: !634)
!636 = !DILocation(line: 645, column: 5, scope: !634)
!637 = !DILocation(line: 650, column: 5, scope: !638)
!638 = distinct !DILexicalBlock(scope: !629, file: !61, line: 649, column: 4)
!639 = !DILocation(line: 655, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !625, file: !61, line: 654, column: 3)
!641 = !DILocation(line: 659, column: 1, scope: !574)
!642 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !61, file: !61, line: 677, type: !643, scopeLine: 678, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!643 = !DISubroutineType(types: !644)
!644 = !{!6, !22, !6, !22}
!645 = !DILocalVariable(name: "factor1", arg: 1, scope: !642, file: !61, line: 677, type: !22)
!646 = !DILocation(line: 677, column: 33, scope: !642)
!647 = !DILocalVariable(name: "factor2", arg: 2, scope: !642, file: !61, line: 677, type: !6)
!648 = !DILocation(line: 677, column: 46, scope: !642)
!649 = !DILocalVariable(name: "denominator", arg: 3, scope: !642, file: !61, line: 677, type: !22)
!650 = !DILocation(line: 677, column: 59, scope: !642)
!651 = !DILocalVariable(name: "s32Result", scope: !642, file: !61, line: 679, type: !69)
!652 = !DILocation(line: 679, column: 6, scope: !642)
!653 = !DILocalVariable(name: "s32Temp1", scope: !642, file: !61, line: 679, type: !69)
!654 = !DILocation(line: 679, column: 21, scope: !642)
!655 = !DILocation(line: 680, column: 14, scope: !642)
!656 = !DILocation(line: 680, column: 24, scope: !642)
!657 = !DILocation(line: 680, column: 22, scope: !642)
!658 = !DILocation(line: 680, column: 12, scope: !642)
!659 = !DILocation(line: 681, column: 5, scope: !660)
!660 = distinct !DILexicalBlock(scope: !642, file: !61, line: 681, column: 5)
!661 = !DILocation(line: 681, column: 16, scope: !660)
!662 = !DILocation(line: 681, column: 5, scope: !642)
!663 = !DILocation(line: 683, column: 6, scope: !664)
!664 = distinct !DILexicalBlock(scope: !665, file: !61, line: 683, column: 6)
!665 = distinct !DILexicalBlock(scope: !660, file: !61, line: 682, column: 2)
!666 = !DILocation(line: 683, column: 16, scope: !664)
!667 = !DILocation(line: 683, column: 6, scope: !665)
!668 = !DILocation(line: 685, column: 4, scope: !669)
!669 = distinct !DILexicalBlock(scope: !664, file: !61, line: 684, column: 3)
!670 = !DILocation(line: 689, column: 4, scope: !671)
!671 = distinct !DILexicalBlock(scope: !664, file: !61, line: 688, column: 3)
!672 = !DILocation(line: 694, column: 14, scope: !673)
!673 = distinct !DILexicalBlock(scope: !660, file: !61, line: 693, column: 2)
!674 = !DILocation(line: 694, column: 28, scope: !673)
!675 = !DILocation(line: 694, column: 38, scope: !673)
!676 = !DILocation(line: 694, column: 37, scope: !673)
!677 = !DILocation(line: 694, column: 53, scope: !673)
!678 = !DILocation(line: 694, column: 51, scope: !673)
!679 = !DILocation(line: 694, column: 24, scope: !673)
!680 = !DILocation(line: 694, column: 66, scope: !673)
!681 = !DILocation(line: 694, column: 12, scope: !673)
!682 = !DILocation(line: 695, column: 16, scope: !673)
!683 = !DILocation(line: 695, column: 25, scope: !673)
!684 = !DILocation(line: 695, column: 24, scope: !673)
!685 = !DILocation(line: 695, column: 41, scope: !673)
!686 = !DILocation(line: 695, column: 51, scope: !673)
!687 = !DILocation(line: 695, column: 50, scope: !673)
!688 = !DILocation(line: 695, column: 38, scope: !673)
!689 = !DILocation(line: 695, column: 13, scope: !673)
!690 = !DILocation(line: 696, column: 6, scope: !691)
!691 = distinct !DILexicalBlock(scope: !673, file: !61, line: 696, column: 6)
!692 = !DILocation(line: 696, column: 16, scope: !691)
!693 = !DILocation(line: 696, column: 6, scope: !673)
!694 = !DILocation(line: 698, column: 7, scope: !695)
!695 = distinct !DILexicalBlock(scope: !696, file: !61, line: 698, column: 7)
!696 = distinct !DILexicalBlock(scope: !691, file: !61, line: 697, column: 3)
!697 = !DILocation(line: 698, column: 17, scope: !695)
!698 = !DILocation(line: 698, column: 7, scope: !696)
!699 = !DILocation(line: 700, column: 17, scope: !700)
!700 = distinct !DILexicalBlock(scope: !695, file: !61, line: 699, column: 4)
!701 = !DILocation(line: 700, column: 12, scope: !700)
!702 = !DILocation(line: 700, column: 5, scope: !700)
!703 = !DILocation(line: 704, column: 5, scope: !704)
!704 = distinct !DILexicalBlock(scope: !695, file: !61, line: 703, column: 4)
!705 = !DILocation(line: 709, column: 4, scope: !706)
!706 = distinct !DILexicalBlock(scope: !691, file: !61, line: 708, column: 3)
!707 = !DILocation(line: 712, column: 1, scope: !642)
!708 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !61, file: !61, line: 731, type: !709, scopeLine: 732, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!709 = !DISubroutineType(types: !710)
!710 = !{!22, !6, !22, !6}
!711 = !DILocalVariable(name: "factor1", arg: 1, scope: !708, file: !61, line: 731, type: !6)
!712 = !DILocation(line: 731, column: 33, scope: !708)
!713 = !DILocalVariable(name: "factor2", arg: 2, scope: !708, file: !61, line: 731, type: !22)
!714 = !DILocation(line: 731, column: 46, scope: !708)
!715 = !DILocalVariable(name: "denominator", arg: 3, scope: !708, file: !61, line: 731, type: !6)
!716 = !DILocation(line: 731, column: 59, scope: !708)
!717 = !DILocalVariable(name: "u32Result", scope: !708, file: !61, line: 733, type: !386)
!718 = !DILocation(line: 733, column: 6, scope: !708)
!719 = !DILocalVariable(name: "u32Temp1", scope: !708, file: !61, line: 733, type: !386)
!720 = !DILocation(line: 733, column: 21, scope: !708)
!721 = !DILocalVariable(name: "s32Result", scope: !708, file: !61, line: 734, type: !69)
!722 = !DILocation(line: 734, column: 6, scope: !708)
!723 = !DILocalVariable(name: "s32Temp1", scope: !708, file: !61, line: 734, type: !69)
!724 = !DILocation(line: 734, column: 21, scope: !708)
!725 = !DILocation(line: 735, column: 14, scope: !708)
!726 = !DILocation(line: 735, column: 24, scope: !708)
!727 = !DILocation(line: 735, column: 22, scope: !708)
!728 = !DILocation(line: 735, column: 12, scope: !708)
!729 = !DILocation(line: 737, column: 5, scope: !730)
!730 = distinct !DILexicalBlock(scope: !708, file: !61, line: 737, column: 5)
!731 = !DILocation(line: 737, column: 17, scope: !730)
!732 = !DILocation(line: 737, column: 5, scope: !708)
!733 = !DILocation(line: 739, column: 6, scope: !734)
!734 = distinct !DILexicalBlock(scope: !735, file: !61, line: 739, column: 6)
!735 = distinct !DILexicalBlock(scope: !730, file: !61, line: 738, column: 2)
!736 = !DILocation(line: 739, column: 16, scope: !734)
!737 = !DILocation(line: 739, column: 6, scope: !735)
!738 = !DILocation(line: 741, column: 4, scope: !739)
!739 = distinct !DILexicalBlock(scope: !734, file: !61, line: 740, column: 3)
!740 = !DILocation(line: 745, column: 4, scope: !741)
!741 = distinct !DILexicalBlock(scope: !734, file: !61, line: 744, column: 3)
!742 = !DILocation(line: 750, column: 15, scope: !743)
!743 = distinct !DILexicalBlock(scope: !730, file: !61, line: 749, column: 2)
!744 = !DILocation(line: 750, column: 29, scope: !743)
!745 = !DILocation(line: 750, column: 39, scope: !743)
!746 = !DILocation(line: 750, column: 38, scope: !743)
!747 = !DILocation(line: 750, column: 54, scope: !743)
!748 = !DILocation(line: 750, column: 52, scope: !743)
!749 = !DILocation(line: 750, column: 25, scope: !743)
!750 = !DILocation(line: 750, column: 68, scope: !743)
!751 = !DILocation(line: 750, column: 12, scope: !743)
!752 = !DILocation(line: 751, column: 16, scope: !743)
!753 = !DILocation(line: 751, column: 25, scope: !743)
!754 = !DILocation(line: 751, column: 24, scope: !743)
!755 = !DILocation(line: 751, column: 41, scope: !743)
!756 = !DILocation(line: 751, column: 51, scope: !743)
!757 = !DILocation(line: 751, column: 50, scope: !743)
!758 = !DILocation(line: 751, column: 38, scope: !743)
!759 = !DILocation(line: 751, column: 13, scope: !743)
!760 = !DILocation(line: 752, column: 6, scope: !761)
!761 = distinct !DILexicalBlock(scope: !743, file: !61, line: 752, column: 6)
!762 = !DILocation(line: 752, column: 16, scope: !761)
!763 = !DILocation(line: 752, column: 6, scope: !743)
!764 = !DILocation(line: 754, column: 7, scope: !765)
!765 = distinct !DILexicalBlock(scope: !766, file: !61, line: 754, column: 7)
!766 = distinct !DILexicalBlock(scope: !761, file: !61, line: 753, column: 3)
!767 = !DILocation(line: 754, column: 17, scope: !765)
!768 = !DILocation(line: 754, column: 7, scope: !766)
!769 = !DILocation(line: 756, column: 17, scope: !770)
!770 = distinct !DILexicalBlock(scope: !765, file: !61, line: 755, column: 4)
!771 = !DILocation(line: 756, column: 12, scope: !770)
!772 = !DILocation(line: 756, column: 5, scope: !770)
!773 = !DILocation(line: 760, column: 5, scope: !774)
!774 = distinct !DILexicalBlock(scope: !765, file: !61, line: 759, column: 4)
!775 = !DILocation(line: 765, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !761, file: !61, line: 764, column: 3)
!777 = !DILocation(line: 768, column: 1, scope: !708)
!778 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !61, file: !61, line: 787, type: !779, scopeLine: 788, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!779 = !DISubroutineType(types: !780)
!780 = !{!22, !6, !22, !22}
!781 = !DILocalVariable(name: "factor1", arg: 1, scope: !778, file: !61, line: 787, type: !6)
!782 = !DILocation(line: 787, column: 33, scope: !778)
!783 = !DILocalVariable(name: "factor2", arg: 2, scope: !778, file: !61, line: 787, type: !22)
!784 = !DILocation(line: 787, column: 46, scope: !778)
!785 = !DILocalVariable(name: "denominator", arg: 3, scope: !778, file: !61, line: 787, type: !22)
!786 = !DILocation(line: 787, column: 59, scope: !778)
!787 = !DILocalVariable(name: "s32Result", scope: !778, file: !61, line: 789, type: !69)
!788 = !DILocation(line: 789, column: 6, scope: !778)
!789 = !DILocalVariable(name: "s32Temp1", scope: !778, file: !61, line: 789, type: !69)
!790 = !DILocation(line: 789, column: 21, scope: !778)
!791 = !DILocation(line: 790, column: 14, scope: !778)
!792 = !DILocation(line: 790, column: 24, scope: !778)
!793 = !DILocation(line: 790, column: 22, scope: !778)
!794 = !DILocation(line: 790, column: 12, scope: !778)
!795 = !DILocation(line: 792, column: 5, scope: !796)
!796 = distinct !DILexicalBlock(scope: !778, file: !61, line: 792, column: 5)
!797 = !DILocation(line: 792, column: 17, scope: !796)
!798 = !DILocation(line: 792, column: 5, scope: !778)
!799 = !DILocation(line: 794, column: 6, scope: !800)
!800 = distinct !DILexicalBlock(scope: !801, file: !61, line: 794, column: 6)
!801 = distinct !DILexicalBlock(scope: !796, file: !61, line: 793, column: 2)
!802 = !DILocation(line: 794, column: 16, scope: !800)
!803 = !DILocation(line: 794, column: 6, scope: !801)
!804 = !DILocation(line: 796, column: 4, scope: !805)
!805 = distinct !DILexicalBlock(scope: !800, file: !61, line: 795, column: 3)
!806 = !DILocation(line: 800, column: 4, scope: !807)
!807 = distinct !DILexicalBlock(scope: !800, file: !61, line: 799, column: 3)
!808 = !DILocation(line: 805, column: 15, scope: !809)
!809 = distinct !DILexicalBlock(scope: !796, file: !61, line: 804, column: 2)
!810 = !DILocation(line: 805, column: 29, scope: !809)
!811 = !DILocation(line: 805, column: 39, scope: !809)
!812 = !DILocation(line: 805, column: 38, scope: !809)
!813 = !DILocation(line: 805, column: 54, scope: !809)
!814 = !DILocation(line: 805, column: 52, scope: !809)
!815 = !DILocation(line: 805, column: 25, scope: !809)
!816 = !DILocation(line: 805, column: 68, scope: !809)
!817 = !DILocation(line: 805, column: 12, scope: !809)
!818 = !DILocation(line: 806, column: 16, scope: !809)
!819 = !DILocation(line: 806, column: 25, scope: !809)
!820 = !DILocation(line: 806, column: 24, scope: !809)
!821 = !DILocation(line: 806, column: 41, scope: !809)
!822 = !DILocation(line: 806, column: 51, scope: !809)
!823 = !DILocation(line: 806, column: 50, scope: !809)
!824 = !DILocation(line: 806, column: 38, scope: !809)
!825 = !DILocation(line: 806, column: 13, scope: !809)
!826 = !DILocation(line: 807, column: 6, scope: !827)
!827 = distinct !DILexicalBlock(scope: !809, file: !61, line: 807, column: 6)
!828 = !DILocation(line: 807, column: 16, scope: !827)
!829 = !DILocation(line: 807, column: 6, scope: !809)
!830 = !DILocation(line: 809, column: 7, scope: !831)
!831 = distinct !DILexicalBlock(scope: !832, file: !61, line: 809, column: 7)
!832 = distinct !DILexicalBlock(scope: !827, file: !61, line: 808, column: 3)
!833 = !DILocation(line: 809, column: 17, scope: !831)
!834 = !DILocation(line: 809, column: 7, scope: !832)
!835 = !DILocation(line: 811, column: 17, scope: !836)
!836 = distinct !DILexicalBlock(scope: !831, file: !61, line: 810, column: 4)
!837 = !DILocation(line: 811, column: 12, scope: !836)
!838 = !DILocation(line: 811, column: 5, scope: !836)
!839 = !DILocation(line: 815, column: 5, scope: !840)
!840 = distinct !DILexicalBlock(scope: !831, file: !61, line: 814, column: 4)
!841 = !DILocation(line: 820, column: 4, scope: !842)
!842 = distinct !DILexicalBlock(scope: !827, file: !61, line: 819, column: 3)
!843 = !DILocation(line: 824, column: 1, scope: !778)
!844 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !61, file: !61, line: 842, type: !845, scopeLine: 843, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!845 = !DISubroutineType(types: !846)
!846 = !{!22, !22, !22, !22}
!847 = !DILocalVariable(name: "factor1", arg: 1, scope: !844, file: !61, line: 842, type: !22)
!848 = !DILocation(line: 842, column: 33, scope: !844)
!849 = !DILocalVariable(name: "factor2", arg: 2, scope: !844, file: !61, line: 842, type: !22)
!850 = !DILocation(line: 842, column: 46, scope: !844)
!851 = !DILocalVariable(name: "denominator", arg: 3, scope: !844, file: !61, line: 842, type: !22)
!852 = !DILocation(line: 842, column: 59, scope: !844)
!853 = !DILocalVariable(name: "u32Temp1", scope: !844, file: !61, line: 844, type: !386)
!854 = !DILocation(line: 844, column: 6, scope: !844)
!855 = !DILocalVariable(name: "u16TempDenom", scope: !844, file: !61, line: 845, type: !22)
!856 = !DILocation(line: 845, column: 6, scope: !844)
!857 = !DILocation(line: 847, column: 5, scope: !858)
!858 = distinct !DILexicalBlock(scope: !844, file: !61, line: 847, column: 5)
!859 = !DILocation(line: 847, column: 17, scope: !858)
!860 = !DILocation(line: 847, column: 5, scope: !844)
!861 = !DILocation(line: 849, column: 3, scope: !862)
!862 = distinct !DILexicalBlock(scope: !858, file: !61, line: 848, column: 2)
!863 = !DILocation(line: 853, column: 14, scope: !864)
!864 = distinct !DILexicalBlock(scope: !858, file: !61, line: 852, column: 2)
!865 = !DILocation(line: 853, column: 24, scope: !864)
!866 = !DILocation(line: 853, column: 22, scope: !864)
!867 = !DILocation(line: 853, column: 12, scope: !864)
!868 = !DILocation(line: 854, column: 18, scope: !864)
!869 = !DILocation(line: 854, column: 30, scope: !864)
!870 = !DILocation(line: 854, column: 16, scope: !864)
!871 = !DILocation(line: 855, column: 14, scope: !864)
!872 = !DILocation(line: 855, column: 25, scope: !864)
!873 = !DILocation(line: 855, column: 23, scope: !864)
!874 = !DILocation(line: 855, column: 12, scope: !864)
!875 = !DILocation(line: 856, column: 14, scope: !864)
!876 = !DILocation(line: 856, column: 25, scope: !864)
!877 = !DILocation(line: 856, column: 23, scope: !864)
!878 = !DILocation(line: 856, column: 12, scope: !864)
!879 = !DILocation(line: 857, column: 6, scope: !880)
!880 = distinct !DILexicalBlock(scope: !864, file: !61, line: 857, column: 6)
!881 = !DILocation(line: 857, column: 15, scope: !880)
!882 = !DILocation(line: 857, column: 6, scope: !864)
!883 = !DILocation(line: 859, column: 12, scope: !884)
!884 = distinct !DILexicalBlock(scope: !880, file: !61, line: 858, column: 3)
!885 = !DILocation(line: 859, column: 21, scope: !884)
!886 = !DILocation(line: 859, column: 11, scope: !884)
!887 = !DILocation(line: 859, column: 4, scope: !884)
!888 = !DILocation(line: 864, column: 4, scope: !889)
!889 = distinct !DILexicalBlock(scope: !880, file: !61, line: 863, column: 3)
!890 = !DILocation(line: 869, column: 1, scope: !844)
!891 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !61, file: !61, line: 886, type: !892, scopeLine: 887, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!892 = !DISubroutineType(types: !893)
!893 = !{!22, !22, !22, !386}
!894 = !DILocalVariable(name: "factor1", arg: 1, scope: !891, file: !61, line: 886, type: !22)
!895 = !DILocation(line: 886, column: 33, scope: !891)
!896 = !DILocalVariable(name: "factor2", arg: 2, scope: !891, file: !61, line: 886, type: !22)
!897 = !DILocation(line: 886, column: 46, scope: !891)
!898 = !DILocalVariable(name: "denominator", arg: 3, scope: !891, file: !61, line: 886, type: !386)
!899 = !DILocation(line: 886, column: 59, scope: !891)
!900 = !DILocalVariable(name: "u32Temp1", scope: !891, file: !61, line: 888, type: !386)
!901 = !DILocation(line: 888, column: 6, scope: !891)
!902 = !DILocation(line: 889, column: 5, scope: !903)
!903 = distinct !DILexicalBlock(scope: !891, file: !61, line: 889, column: 5)
!904 = !DILocation(line: 889, column: 17, scope: !903)
!905 = !DILocation(line: 889, column: 5, scope: !891)
!906 = !DILocation(line: 891, column: 3, scope: !907)
!907 = distinct !DILexicalBlock(scope: !903, file: !61, line: 890, column: 2)
!908 = !DILocation(line: 895, column: 15, scope: !909)
!909 = distinct !DILexicalBlock(scope: !903, file: !61, line: 894, column: 2)
!910 = !DILocation(line: 895, column: 25, scope: !909)
!911 = !DILocation(line: 895, column: 23, scope: !909)
!912 = !DILocation(line: 895, column: 36, scope: !909)
!913 = !DILocation(line: 895, column: 34, scope: !909)
!914 = !DILocation(line: 895, column: 12, scope: !909)
!915 = !DILocation(line: 896, column: 8, scope: !916)
!916 = distinct !DILexicalBlock(scope: !909, file: !61, line: 896, column: 6)
!917 = !DILocation(line: 896, column: 18, scope: !916)
!918 = !DILocation(line: 896, column: 16, scope: !916)
!919 = !DILocation(line: 896, column: 28, scope: !916)
!920 = !DILocation(line: 896, column: 40, scope: !916)
!921 = !DILocation(line: 896, column: 39, scope: !916)
!922 = !DILocation(line: 896, column: 26, scope: !916)
!923 = !DILocation(line: 896, column: 53, scope: !916)
!924 = !DILocation(line: 896, column: 64, scope: !916)
!925 = !DILocation(line: 896, column: 50, scope: !916)
!926 = !DILocation(line: 896, column: 6, scope: !909)
!927 = !DILocation(line: 898, column: 12, scope: !928)
!928 = distinct !DILexicalBlock(scope: !916, file: !61, line: 897, column: 3)
!929 = !DILocation(line: 899, column: 3, scope: !928)
!930 = !DILocation(line: 900, column: 6, scope: !931)
!931 = distinct !DILexicalBlock(scope: !909, file: !61, line: 900, column: 6)
!932 = !DILocation(line: 900, column: 15, scope: !931)
!933 = !DILocation(line: 900, column: 6, scope: !909)
!934 = !DILocation(line: 902, column: 12, scope: !935)
!935 = distinct !DILexicalBlock(scope: !931, file: !61, line: 901, column: 3)
!936 = !DILocation(line: 902, column: 21, scope: !935)
!937 = !DILocation(line: 902, column: 11, scope: !935)
!938 = !DILocation(line: 902, column: 4, scope: !935)
!939 = !DILocation(line: 906, column: 4, scope: !940)
!940 = distinct !DILexicalBlock(scope: !931, file: !61, line: 905, column: 3)
!941 = !DILocation(line: 909, column: 1, scope: !891)
!942 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !61, file: !61, line: 926, type: !943, scopeLine: 927, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!943 = !DISubroutineType(types: !944)
!944 = !{!386, !386, !22}
!945 = !DILocalVariable(name: "x_value", arg: 1, scope: !942, file: !61, line: 926, type: !386)
!946 = !DILocation(line: 926, column: 25, scope: !942)
!947 = !DILocalVariable(name: "y_value", arg: 2, scope: !942, file: !61, line: 926, type: !22)
!948 = !DILocation(line: 926, column: 38, scope: !942)
!949 = !DILocalVariable(name: "u32Temp1", scope: !942, file: !61, line: 928, type: !386)
!950 = !DILocation(line: 928, column: 6, scope: !942)
!951 = !DILocation(line: 929, column: 5, scope: !952)
!952 = distinct !DILexicalBlock(scope: !942, file: !61, line: 929, column: 5)
!953 = !DILocation(line: 929, column: 13, scope: !952)
!954 = !DILocation(line: 929, column: 5, scope: !942)
!955 = !DILocation(line: 931, column: 3, scope: !956)
!956 = distinct !DILexicalBlock(scope: !952, file: !61, line: 930, column: 2)
!957 = !DILocation(line: 935, column: 15, scope: !958)
!958 = distinct !DILexicalBlock(scope: !952, file: !61, line: 934, column: 2)
!959 = !DILocation(line: 935, column: 26, scope: !958)
!960 = !DILocation(line: 935, column: 34, scope: !958)
!961 = !DILocation(line: 935, column: 33, scope: !958)
!962 = !DILocation(line: 935, column: 45, scope: !958)
!963 = !DILocation(line: 935, column: 43, scope: !958)
!964 = !DILocation(line: 935, column: 23, scope: !958)
!965 = !DILocation(line: 935, column: 54, scope: !958)
!966 = !DILocation(line: 935, column: 12, scope: !958)
!967 = !DILocation(line: 936, column: 15, scope: !958)
!968 = !DILocation(line: 936, column: 23, scope: !958)
!969 = !DILocation(line: 936, column: 22, scope: !958)
!970 = !DILocation(line: 936, column: 35, scope: !958)
!971 = !DILocation(line: 936, column: 44, scope: !958)
!972 = !DILocation(line: 936, column: 43, scope: !958)
!973 = !DILocation(line: 936, column: 32, scope: !958)
!974 = !DILocation(line: 936, column: 12, scope: !958)
!975 = !DILocation(line: 937, column: 10, scope: !958)
!976 = !DILocation(line: 937, column: 3, scope: !958)
!977 = !DILocation(line: 939, column: 1, scope: !942)
!978 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !61, file: !61, line: 957, type: !979, scopeLine: 958, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!979 = !DISubroutineType(types: !980)
!980 = !{!6, !6, !6, !6}
!981 = !DILocalVariable(name: "fak1", arg: 1, scope: !978, file: !61, line: 957, type: !6)
!982 = !DILocation(line: 957, column: 33, scope: !978)
!983 = !DILocalVariable(name: "fak2", arg: 2, scope: !978, file: !61, line: 957, type: !6)
!984 = !DILocation(line: 957, column: 43, scope: !978)
!985 = !DILocalVariable(name: "div", arg: 3, scope: !978, file: !61, line: 957, type: !6)
!986 = !DILocation(line: 957, column: 53, scope: !978)
!987 = !DILocalVariable(name: "s32Temp1", scope: !978, file: !61, line: 959, type: !69)
!988 = !DILocation(line: 959, column: 6, scope: !978)
!989 = !DILocalVariable(name: "s32Temp2", scope: !978, file: !61, line: 959, type: !69)
!990 = !DILocation(line: 959, column: 20, scope: !978)
!991 = !DILocalVariable(name: "s32Temp3", scope: !978, file: !61, line: 959, type: !69)
!992 = !DILocation(line: 959, column: 34, scope: !978)
!993 = !DILocation(line: 960, column: 13, scope: !978)
!994 = !DILocation(line: 960, column: 20, scope: !978)
!995 = !DILocation(line: 960, column: 18, scope: !978)
!996 = !DILocation(line: 960, column: 11, scope: !978)
!997 = !DILocation(line: 961, column: 5, scope: !998)
!998 = distinct !DILexicalBlock(scope: !978, file: !61, line: 961, column: 5)
!999 = !DILocation(line: 961, column: 9, scope: !998)
!1000 = !DILocation(line: 961, column: 5, scope: !978)
!1001 = !DILocation(line: 963, column: 6, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !1003, file: !61, line: 963, column: 6)
!1003 = distinct !DILexicalBlock(scope: !998, file: !61, line: 962, column: 2)
!1004 = !DILocation(line: 963, column: 15, scope: !1002)
!1005 = !DILocation(line: 963, column: 6, scope: !1003)
!1006 = !DILocation(line: 965, column: 4, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !1002, file: !61, line: 964, column: 3)
!1008 = !DILocation(line: 969, column: 4, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1002, file: !61, line: 968, column: 3)
!1010 = !DILocation(line: 974, column: 15, scope: !1011)
!1011 = distinct !DILexicalBlock(scope: !998, file: !61, line: 973, column: 2)
!1012 = !DILocation(line: 974, column: 28, scope: !1011)
!1013 = !DILocation(line: 974, column: 39, scope: !1011)
!1014 = !DILocation(line: 974, column: 37, scope: !1011)
!1015 = !DILocation(line: 974, column: 46, scope: !1011)
!1016 = !DILocation(line: 974, column: 44, scope: !1011)
!1017 = !DILocation(line: 974, column: 24, scope: !1011)
!1018 = !DILocation(line: 974, column: 52, scope: !1011)
!1019 = !DILocation(line: 974, column: 12, scope: !1011)
!1020 = !DILocation(line: 975, column: 15, scope: !1011)
!1021 = !DILocation(line: 975, column: 24, scope: !1011)
!1022 = !DILocation(line: 975, column: 23, scope: !1011)
!1023 = !DILocation(line: 975, column: 32, scope: !1011)
!1024 = !DILocation(line: 975, column: 41, scope: !1011)
!1025 = !DILocation(line: 975, column: 40, scope: !1011)
!1026 = !DILocation(line: 975, column: 29, scope: !1011)
!1027 = !DILocation(line: 975, column: 12, scope: !1011)
!1028 = !DILocation(line: 976, column: 6, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1011, file: !61, line: 976, column: 6)
!1030 = !DILocation(line: 976, column: 15, scope: !1029)
!1031 = !DILocation(line: 976, column: 6, scope: !1011)
!1032 = !DILocation(line: 978, column: 7, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1034, file: !61, line: 978, column: 7)
!1034 = distinct !DILexicalBlock(scope: !1029, file: !61, line: 977, column: 3)
!1035 = !DILocation(line: 978, column: 16, scope: !1033)
!1036 = !DILocation(line: 978, column: 7, scope: !1034)
!1037 = !DILocation(line: 980, column: 17, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !61, line: 979, column: 4)
!1039 = !DILocation(line: 980, column: 12, scope: !1038)
!1040 = !DILocation(line: 980, column: 5, scope: !1038)
!1041 = !DILocation(line: 984, column: 5, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1033, file: !61, line: 983, column: 4)
!1043 = !DILocation(line: 989, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1029, file: !61, line: 988, column: 3)
!1045 = !DILocation(line: 992, column: 1, scope: !978)
!1046 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !61, file: !61, line: 1010, type: !1047, scopeLine: 1011, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1047 = !DISubroutineType(types: !1048)
!1048 = !{!6, !6, !6, !22}
!1049 = !DILocalVariable(name: "data1", arg: 1, scope: !1046, file: !61, line: 1010, type: !6)
!1050 = !DILocation(line: 1010, column: 33, scope: !1046)
!1051 = !DILocalVariable(name: "data2", arg: 2, scope: !1046, file: !61, line: 1010, type: !6)
!1052 = !DILocation(line: 1010, column: 43, scope: !1046)
!1053 = !DILocalVariable(name: "denominator", arg: 3, scope: !1046, file: !61, line: 1010, type: !22)
!1054 = !DILocation(line: 1010, column: 53, scope: !1046)
!1055 = !DILocalVariable(name: "s32Result", scope: !1046, file: !61, line: 1012, type: !69)
!1056 = !DILocation(line: 1012, column: 6, scope: !1046)
!1057 = !DILocalVariable(name: "s32Temp1", scope: !1046, file: !61, line: 1012, type: !69)
!1058 = !DILocation(line: 1012, column: 21, scope: !1046)
!1059 = !DILocation(line: 1013, column: 14, scope: !1046)
!1060 = !DILocation(line: 1013, column: 22, scope: !1046)
!1061 = !DILocation(line: 1013, column: 20, scope: !1046)
!1062 = !DILocation(line: 1013, column: 12, scope: !1046)
!1063 = !DILocation(line: 1015, column: 5, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1046, file: !61, line: 1015, column: 5)
!1065 = !DILocation(line: 1015, column: 17, scope: !1064)
!1066 = !DILocation(line: 1015, column: 5, scope: !1046)
!1067 = !DILocation(line: 1017, column: 6, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1069, file: !61, line: 1017, column: 6)
!1069 = distinct !DILexicalBlock(scope: !1064, file: !61, line: 1016, column: 2)
!1070 = !DILocation(line: 1017, column: 16, scope: !1068)
!1071 = !DILocation(line: 1017, column: 6, scope: !1069)
!1072 = !DILocation(line: 1019, column: 4, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1068, file: !61, line: 1018, column: 3)
!1074 = !DILocation(line: 1021, column: 11, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1068, file: !61, line: 1021, column: 11)
!1076 = !DILocation(line: 1021, column: 21, scope: !1075)
!1077 = !DILocation(line: 1021, column: 11, scope: !1068)
!1078 = !DILocation(line: 1023, column: 4, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1075, file: !61, line: 1022, column: 3)
!1080 = !DILocation(line: 1027, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1075, file: !61, line: 1026, column: 3)
!1082 = !DILocation(line: 1032, column: 15, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1064, file: !61, line: 1031, column: 2)
!1084 = !DILocation(line: 1032, column: 28, scope: !1083)
!1085 = !DILocation(line: 1032, column: 38, scope: !1083)
!1086 = !DILocation(line: 1032, column: 37, scope: !1083)
!1087 = !DILocation(line: 1032, column: 51, scope: !1083)
!1088 = !DILocation(line: 1032, column: 50, scope: !1083)
!1089 = !DILocation(line: 1032, column: 25, scope: !1083)
!1090 = !DILocation(line: 1032, column: 64, scope: !1083)
!1091 = !DILocation(line: 1032, column: 12, scope: !1083)
!1092 = !DILocation(line: 1033, column: 16, scope: !1083)
!1093 = !DILocation(line: 1033, column: 25, scope: !1083)
!1094 = !DILocation(line: 1033, column: 24, scope: !1083)
!1095 = !DILocation(line: 1033, column: 41, scope: !1083)
!1096 = !DILocation(line: 1033, column: 51, scope: !1083)
!1097 = !DILocation(line: 1033, column: 50, scope: !1083)
!1098 = !DILocation(line: 1033, column: 38, scope: !1083)
!1099 = !DILocation(line: 1033, column: 13, scope: !1083)
!1100 = !DILocation(line: 1034, column: 6, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1083, file: !61, line: 1034, column: 6)
!1102 = !DILocation(line: 1034, column: 16, scope: !1101)
!1103 = !DILocation(line: 1034, column: 6, scope: !1083)
!1104 = !DILocation(line: 1036, column: 7, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1106, file: !61, line: 1036, column: 7)
!1106 = distinct !DILexicalBlock(scope: !1101, file: !61, line: 1035, column: 3)
!1107 = !DILocation(line: 1036, column: 17, scope: !1105)
!1108 = !DILocation(line: 1036, column: 7, scope: !1106)
!1109 = !DILocation(line: 1038, column: 17, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1105, file: !61, line: 1037, column: 4)
!1111 = !DILocation(line: 1038, column: 12, scope: !1110)
!1112 = !DILocation(line: 1038, column: 5, scope: !1110)
!1113 = !DILocation(line: 1042, column: 5, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1105, file: !61, line: 1041, column: 4)
!1115 = !DILocation(line: 1047, column: 4, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1101, file: !61, line: 1046, column: 3)
!1117 = !DILocation(line: 1051, column: 1, scope: !1046)
!1118 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !61, file: !61, line: 1068, type: !1119, scopeLine: 1069, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!386, !386, !69}
!1121 = !DILocalVariable(name: "numerator", arg: 1, scope: !1118, file: !61, line: 1068, type: !386)
!1122 = !DILocation(line: 1068, column: 25, scope: !1118)
!1123 = !DILocalVariable(name: "denominator", arg: 2, scope: !1118, file: !61, line: 1068, type: !69)
!1124 = !DILocation(line: 1068, column: 40, scope: !1118)
!1125 = !DILocalVariable(name: "u32Temp1", scope: !1118, file: !61, line: 1070, type: !386)
!1126 = !DILocation(line: 1070, column: 6, scope: !1118)
!1127 = !DILocation(line: 1071, column: 5, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1118, file: !61, line: 1071, column: 5)
!1129 = !DILocation(line: 1071, column: 17, scope: !1128)
!1130 = !DILocation(line: 1071, column: 5, scope: !1118)
!1131 = !DILocation(line: 1073, column: 3, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1128, file: !61, line: 1072, column: 2)
!1133 = !DILocation(line: 1077, column: 6, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1135, file: !61, line: 1077, column: 6)
!1135 = distinct !DILexicalBlock(scope: !1128, file: !61, line: 1076, column: 2)
!1136 = !DILocation(line: 1077, column: 18, scope: !1134)
!1137 = !DILocation(line: 1077, column: 6, scope: !1135)
!1138 = !DILocation(line: 1079, column: 4, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1134, file: !61, line: 1078, column: 3)
!1140 = !DILocation(line: 1083, column: 16, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1134, file: !61, line: 1082, column: 3)
!1142 = !DILocation(line: 1083, column: 30, scope: !1141)
!1143 = !DILocation(line: 1083, column: 40, scope: !1141)
!1144 = !DILocation(line: 1083, column: 39, scope: !1141)
!1145 = !DILocation(line: 1083, column: 55, scope: !1141)
!1146 = !DILocation(line: 1083, column: 53, scope: !1141)
!1147 = !DILocation(line: 1083, column: 26, scope: !1141)
!1148 = !DILocation(line: 1083, column: 68, scope: !1141)
!1149 = !DILocation(line: 1083, column: 13, scope: !1141)
!1150 = !DILocation(line: 1084, column: 16, scope: !1141)
!1151 = !DILocation(line: 1084, column: 25, scope: !1141)
!1152 = !DILocation(line: 1084, column: 24, scope: !1141)
!1153 = !DILocation(line: 1084, column: 41, scope: !1141)
!1154 = !DILocation(line: 1084, column: 51, scope: !1141)
!1155 = !DILocation(line: 1084, column: 50, scope: !1141)
!1156 = !DILocation(line: 1084, column: 38, scope: !1141)
!1157 = !DILocation(line: 1084, column: 13, scope: !1141)
!1158 = !DILocation(line: 1085, column: 11, scope: !1141)
!1159 = !DILocation(line: 1085, column: 4, scope: !1141)
!1160 = !DILocation(line: 1088, column: 1, scope: !1118)
!1161 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !61, file: !61, line: 1105, type: !1162, scopeLine: 1106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!386, !69, !386}
!1164 = !DILocalVariable(name: "numerator", arg: 1, scope: !1161, file: !61, line: 1105, type: !69)
!1165 = !DILocation(line: 1105, column: 25, scope: !1161)
!1166 = !DILocalVariable(name: "denominator", arg: 2, scope: !1161, file: !61, line: 1105, type: !386)
!1167 = !DILocation(line: 1105, column: 40, scope: !1161)
!1168 = !DILocalVariable(name: "s32Temp1", scope: !1161, file: !61, line: 1107, type: !69)
!1169 = !DILocation(line: 1107, column: 6, scope: !1161)
!1170 = !DILocation(line: 1108, column: 5, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1161, file: !61, line: 1108, column: 5)
!1172 = !DILocation(line: 1108, column: 17, scope: !1171)
!1173 = !DILocation(line: 1108, column: 5, scope: !1161)
!1174 = !DILocation(line: 1110, column: 6, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1176, file: !61, line: 1110, column: 6)
!1176 = distinct !DILexicalBlock(scope: !1171, file: !61, line: 1109, column: 2)
!1177 = !DILocation(line: 1110, column: 16, scope: !1175)
!1178 = !DILocation(line: 1110, column: 6, scope: !1176)
!1179 = !DILocation(line: 1112, column: 4, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1175, file: !61, line: 1111, column: 3)
!1181 = !DILocation(line: 1116, column: 4, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1175, file: !61, line: 1115, column: 3)
!1183 = !DILocation(line: 1121, column: 6, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1185, file: !61, line: 1121, column: 6)
!1185 = distinct !DILexicalBlock(scope: !1171, file: !61, line: 1120, column: 2)
!1186 = !DILocation(line: 1121, column: 16, scope: !1184)
!1187 = !DILocation(line: 1121, column: 6, scope: !1185)
!1188 = !DILocation(line: 1123, column: 17, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1184, file: !61, line: 1122, column: 3)
!1190 = !DILocation(line: 1123, column: 31, scope: !1189)
!1191 = !DILocation(line: 1123, column: 41, scope: !1189)
!1192 = !DILocation(line: 1123, column: 40, scope: !1189)
!1193 = !DILocation(line: 1123, column: 56, scope: !1189)
!1194 = !DILocation(line: 1123, column: 54, scope: !1189)
!1195 = !DILocation(line: 1123, column: 27, scope: !1189)
!1196 = !DILocation(line: 1123, column: 69, scope: !1189)
!1197 = !DILocation(line: 1123, column: 13, scope: !1189)
!1198 = !DILocation(line: 1124, column: 13, scope: !1189)
!1199 = !DILocation(line: 1124, column: 23, scope: !1189)
!1200 = !DILocation(line: 1124, column: 22, scope: !1189)
!1201 = !DILocation(line: 1124, column: 39, scope: !1189)
!1202 = !DILocation(line: 1124, column: 48, scope: !1189)
!1203 = !DILocation(line: 1124, column: 47, scope: !1189)
!1204 = !DILocation(line: 1124, column: 36, scope: !1189)
!1205 = !DILocation(line: 1124, column: 4, scope: !1189)
!1206 = !DILocation(line: 1128, column: 4, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1184, file: !61, line: 1127, column: 3)
!1208 = !DILocation(line: 1131, column: 1, scope: !1161)
!1209 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !61, file: !61, line: 1148, type: !1210, scopeLine: 1149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!386, !69, !69}
!1212 = !DILocalVariable(name: "numerator", arg: 1, scope: !1209, file: !61, line: 1148, type: !69)
!1213 = !DILocation(line: 1148, column: 25, scope: !1209)
!1214 = !DILocalVariable(name: "denominator", arg: 2, scope: !1209, file: !61, line: 1148, type: !69)
!1215 = !DILocation(line: 1148, column: 40, scope: !1209)
!1216 = !DILocalVariable(name: "u32Temp1", scope: !1209, file: !61, line: 1150, type: !386)
!1217 = !DILocation(line: 1150, column: 6, scope: !1209)
!1218 = !DILocalVariable(name: "u32Temp2", scope: !1209, file: !61, line: 1150, type: !386)
!1219 = !DILocation(line: 1150, column: 20, scope: !1209)
!1220 = !DILocation(line: 1151, column: 5, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1209, file: !61, line: 1151, column: 5)
!1222 = !DILocation(line: 1151, column: 17, scope: !1221)
!1223 = !DILocation(line: 1151, column: 5, scope: !1209)
!1224 = !DILocation(line: 1153, column: 6, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1226, file: !61, line: 1153, column: 6)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !61, line: 1152, column: 2)
!1227 = !DILocation(line: 1153, column: 16, scope: !1225)
!1228 = !DILocation(line: 1153, column: 6, scope: !1226)
!1229 = !DILocation(line: 1155, column: 4, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !61, line: 1154, column: 3)
!1231 = !DILocation(line: 1159, column: 4, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1225, file: !61, line: 1158, column: 3)
!1233 = !DILocation(line: 1164, column: 6, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1235, file: !61, line: 1164, column: 6)
!1235 = distinct !DILexicalBlock(scope: !1221, file: !61, line: 1163, column: 2)
!1236 = !DILocation(line: 1164, column: 16, scope: !1234)
!1237 = !DILocation(line: 1164, column: 6, scope: !1235)
!1238 = !DILocation(line: 1166, column: 7, scope: !1239)
!1239 = distinct !DILexicalBlock(scope: !1240, file: !61, line: 1166, column: 7)
!1240 = distinct !DILexicalBlock(scope: !1234, file: !61, line: 1165, column: 3)
!1241 = !DILocation(line: 1166, column: 17, scope: !1239)
!1242 = !DILocation(line: 1166, column: 7, scope: !1240)
!1243 = !DILocation(line: 1168, column: 5, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1239, file: !61, line: 1167, column: 4)
!1245 = !DILocation(line: 1172, column: 8, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1247, file: !61, line: 1172, column: 8)
!1247 = distinct !DILexicalBlock(scope: !1239, file: !61, line: 1171, column: 4)
!1248 = !DILocation(line: 1172, column: 20, scope: !1246)
!1249 = !DILocation(line: 1172, column: 8, scope: !1247)
!1250 = !DILocation(line: 1174, column: 6, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1246, file: !61, line: 1173, column: 5)
!1252 = !DILocation(line: 1178, column: 18, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1246, file: !61, line: 1177, column: 5)
!1254 = !DILocation(line: 1178, column: 32, scope: !1253)
!1255 = !DILocation(line: 1178, column: 42, scope: !1253)
!1256 = !DILocation(line: 1178, column: 41, scope: !1253)
!1257 = !DILocation(line: 1178, column: 57, scope: !1253)
!1258 = !DILocation(line: 1178, column: 55, scope: !1253)
!1259 = !DILocation(line: 1178, column: 28, scope: !1253)
!1260 = !DILocation(line: 1178, column: 71, scope: !1253)
!1261 = !DILocation(line: 1178, column: 15, scope: !1253)
!1262 = !DILocation(line: 1179, column: 18, scope: !1253)
!1263 = !DILocation(line: 1179, column: 29, scope: !1253)
!1264 = !DILocation(line: 1179, column: 27, scope: !1253)
!1265 = !DILocation(line: 1179, column: 45, scope: !1253)
!1266 = !DILocation(line: 1179, column: 57, scope: !1253)
!1267 = !DILocation(line: 1179, column: 55, scope: !1253)
!1268 = !DILocation(line: 1179, column: 42, scope: !1253)
!1269 = !DILocation(line: 1179, column: 15, scope: !1253)
!1270 = !DILocation(line: 1180, column: 13, scope: !1253)
!1271 = !DILocation(line: 1180, column: 6, scope: !1253)
!1272 = !DILocation(line: 1186, column: 7, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1274, file: !61, line: 1186, column: 7)
!1274 = distinct !DILexicalBlock(scope: !1234, file: !61, line: 1185, column: 3)
!1275 = !DILocation(line: 1186, column: 19, scope: !1273)
!1276 = !DILocation(line: 1186, column: 7, scope: !1274)
!1277 = !DILocation(line: 1188, column: 5, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1273, file: !61, line: 1187, column: 4)
!1279 = !DILocation(line: 1192, column: 18, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1273, file: !61, line: 1191, column: 4)
!1281 = !DILocation(line: 1192, column: 17, scope: !1280)
!1282 = !DILocation(line: 1192, column: 15, scope: !1280)
!1283 = !DILocation(line: 1193, column: 20, scope: !1280)
!1284 = !DILocation(line: 1193, column: 19, scope: !1280)
!1285 = !DILocation(line: 1193, column: 17, scope: !1280)
!1286 = !DILocation(line: 1194, column: 17, scope: !1280)
!1287 = !DILocation(line: 1194, column: 31, scope: !1280)
!1288 = !DILocation(line: 1194, column: 41, scope: !1280)
!1289 = !DILocation(line: 1194, column: 40, scope: !1280)
!1290 = !DILocation(line: 1194, column: 56, scope: !1280)
!1291 = !DILocation(line: 1194, column: 54, scope: !1280)
!1292 = !DILocation(line: 1194, column: 27, scope: !1280)
!1293 = !DILocation(line: 1194, column: 70, scope: !1280)
!1294 = !DILocation(line: 1194, column: 14, scope: !1280)
!1295 = !DILocation(line: 1195, column: 17, scope: !1280)
!1296 = !DILocation(line: 1195, column: 28, scope: !1280)
!1297 = !DILocation(line: 1195, column: 26, scope: !1280)
!1298 = !DILocation(line: 1195, column: 44, scope: !1280)
!1299 = !DILocation(line: 1195, column: 56, scope: !1280)
!1300 = !DILocation(line: 1195, column: 54, scope: !1280)
!1301 = !DILocation(line: 1195, column: 41, scope: !1280)
!1302 = !DILocation(line: 1195, column: 14, scope: !1280)
!1303 = !DILocation(line: 1196, column: 12, scope: !1280)
!1304 = !DILocation(line: 1196, column: 5, scope: !1280)
!1305 = !DILocation(line: 1201, column: 1, scope: !1209)
!1306 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !61, file: !61, line: 1218, type: !1307, scopeLine: 1219, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1307 = !DISubroutineType(types: !1308)
!1308 = !{!386, !386, !386}
!1309 = !DILocalVariable(name: "numerator", arg: 1, scope: !1306, file: !61, line: 1218, type: !386)
!1310 = !DILocation(line: 1218, column: 25, scope: !1306)
!1311 = !DILocalVariable(name: "denominator", arg: 2, scope: !1306, file: !61, line: 1218, type: !386)
!1312 = !DILocation(line: 1218, column: 40, scope: !1306)
!1313 = !DILocalVariable(name: "u32Temp1", scope: !1306, file: !61, line: 1221, type: !386)
!1314 = !DILocation(line: 1221, column: 6, scope: !1306)
!1315 = !DILocalVariable(name: "u32Temp2", scope: !1306, file: !61, line: 1221, type: !386)
!1316 = !DILocation(line: 1221, column: 20, scope: !1306)
!1317 = !DILocalVariable(name: "u32Temp3", scope: !1306, file: !61, line: 1221, type: !386)
!1318 = !DILocation(line: 1221, column: 34, scope: !1306)
!1319 = !DILocalVariable(name: "numerator_old", scope: !1306, file: !61, line: 1221, type: !386)
!1320 = !DILocation(line: 1221, column: 48, scope: !1306)
!1321 = !DILocation(line: 1222, column: 5, scope: !1322)
!1322 = distinct !DILexicalBlock(scope: !1306, file: !61, line: 1222, column: 5)
!1323 = !DILocation(line: 1222, column: 16, scope: !1322)
!1324 = !DILocation(line: 1222, column: 5, scope: !1306)
!1325 = !DILocation(line: 1224, column: 3, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1322, file: !61, line: 1223, column: 2)
!1327 = !DILocation(line: 1228, column: 14, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1322, file: !61, line: 1227, column: 2)
!1329 = !DILocation(line: 1228, column: 26, scope: !1328)
!1330 = !DILocation(line: 1228, column: 41, scope: !1328)
!1331 = !DILocation(line: 1228, column: 51, scope: !1328)
!1332 = !DILocation(line: 1228, column: 50, scope: !1328)
!1333 = !DILocation(line: 1228, column: 38, scope: !1328)
!1334 = !DILocation(line: 1228, column: 24, scope: !1328)
!1335 = !DILocation(line: 1228, column: 12, scope: !1328)
!1336 = !DILocation(line: 1229, column: 7, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1328, file: !61, line: 1229, column: 6)
!1338 = !DILocation(line: 1229, column: 16, scope: !1337)
!1339 = !DILocation(line: 1229, column: 24, scope: !1337)
!1340 = !DILocation(line: 1229, column: 6, scope: !1328)
!1341 = !DILocation(line: 1231, column: 16, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1337, file: !61, line: 1230, column: 3)
!1343 = !DILocation(line: 1231, column: 27, scope: !1342)
!1344 = !DILocation(line: 1231, column: 13, scope: !1342)
!1345 = !DILocation(line: 1232, column: 3, scope: !1342)
!1346 = !DILocation(line: 1235, column: 16, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1337, file: !61, line: 1234, column: 3)
!1348 = !DILocation(line: 1235, column: 27, scope: !1347)
!1349 = !DILocation(line: 1235, column: 32, scope: !1347)
!1350 = !DILocation(line: 1235, column: 13, scope: !1347)
!1351 = !DILocation(line: 1238, column: 6, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1328, file: !61, line: 1238, column: 6)
!1353 = !DILocation(line: 1238, column: 17, scope: !1352)
!1354 = !DILocation(line: 1238, column: 15, scope: !1352)
!1355 = !DILocation(line: 1238, column: 6, scope: !1328)
!1356 = !DILocation(line: 1240, column: 12, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1352, file: !61, line: 1239, column: 3)
!1358 = !DILocation(line: 1240, column: 22, scope: !1357)
!1359 = !DILocation(line: 1240, column: 21, scope: !1357)
!1360 = !DILocation(line: 1240, column: 4, scope: !1357)
!1361 = !DILocation(line: 1244, column: 13, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1352, file: !61, line: 1243, column: 3)
!1363 = !DILocation(line: 1244, column: 23, scope: !1362)
!1364 = !DILocation(line: 1244, column: 22, scope: !1362)
!1365 = !DILocation(line: 1244, column: 36, scope: !1362)
!1366 = !DILocation(line: 1244, column: 4, scope: !1362)
!1367 = !DILocation(line: 1249, column: 1, scope: !1306)
!1368 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !61, file: !61, line: 1266, type: !1369, scopeLine: 1267, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!69, !386, !69}
!1371 = !DILocalVariable(name: "numerator", arg: 1, scope: !1368, file: !61, line: 1266, type: !386)
!1372 = !DILocation(line: 1266, column: 25, scope: !1368)
!1373 = !DILocalVariable(name: "denominator", arg: 2, scope: !1368, file: !61, line: 1266, type: !69)
!1374 = !DILocation(line: 1266, column: 40, scope: !1368)
!1375 = !DILocalVariable(name: "u32Temp1", scope: !1368, file: !61, line: 1268, type: !386)
!1376 = !DILocation(line: 1268, column: 6, scope: !1368)
!1377 = !DILocalVariable(name: "u32Temp2", scope: !1368, file: !61, line: 1268, type: !386)
!1378 = !DILocation(line: 1268, column: 20, scope: !1368)
!1379 = !DILocation(line: 1269, column: 5, scope: !1380)
!1380 = distinct !DILexicalBlock(scope: !1368, file: !61, line: 1269, column: 5)
!1381 = !DILocation(line: 1269, column: 17, scope: !1380)
!1382 = !DILocation(line: 1269, column: 5, scope: !1368)
!1383 = !DILocation(line: 1271, column: 6, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1385, file: !61, line: 1271, column: 6)
!1385 = distinct !DILexicalBlock(scope: !1380, file: !61, line: 1270, column: 2)
!1386 = !DILocation(line: 1271, column: 18, scope: !1384)
!1387 = !DILocation(line: 1271, column: 6, scope: !1385)
!1388 = !DILocation(line: 1273, column: 4, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1384, file: !61, line: 1272, column: 3)
!1390 = !DILocation(line: 1277, column: 19, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1384, file: !61, line: 1276, column: 3)
!1392 = !DILocation(line: 1277, column: 18, scope: !1391)
!1393 = !DILocation(line: 1277, column: 16, scope: !1391)
!1394 = !DILocation(line: 1278, column: 16, scope: !1391)
!1395 = !DILocation(line: 1278, column: 30, scope: !1391)
!1396 = !DILocation(line: 1278, column: 40, scope: !1391)
!1397 = !DILocation(line: 1278, column: 39, scope: !1391)
!1398 = !DILocation(line: 1278, column: 55, scope: !1391)
!1399 = !DILocation(line: 1278, column: 53, scope: !1391)
!1400 = !DILocation(line: 1278, column: 26, scope: !1391)
!1401 = !DILocation(line: 1278, column: 69, scope: !1391)
!1402 = !DILocation(line: 1278, column: 13, scope: !1391)
!1403 = !DILocation(line: 1279, column: 16, scope: !1391)
!1404 = !DILocation(line: 1279, column: 25, scope: !1391)
!1405 = !DILocation(line: 1279, column: 24, scope: !1391)
!1406 = !DILocation(line: 1279, column: 41, scope: !1391)
!1407 = !DILocation(line: 1279, column: 51, scope: !1391)
!1408 = !DILocation(line: 1279, column: 50, scope: !1391)
!1409 = !DILocation(line: 1279, column: 38, scope: !1391)
!1410 = !DILocation(line: 1279, column: 13, scope: !1391)
!1411 = !DILocation(line: 1280, column: 7, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1391, file: !61, line: 1280, column: 7)
!1413 = !DILocation(line: 1280, column: 16, scope: !1412)
!1414 = !DILocation(line: 1280, column: 7, scope: !1391)
!1415 = !DILocation(line: 1282, column: 13, scope: !1416)
!1416 = distinct !DILexicalBlock(scope: !1412, file: !61, line: 1281, column: 4)
!1417 = !DILocation(line: 1282, column: 12, scope: !1416)
!1418 = !DILocation(line: 1282, column: 5, scope: !1416)
!1419 = !DILocation(line: 1286, column: 5, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1412, file: !61, line: 1285, column: 4)
!1421 = !DILocation(line: 1292, column: 15, scope: !1422)
!1422 = distinct !DILexicalBlock(scope: !1380, file: !61, line: 1291, column: 2)
!1423 = !DILocation(line: 1292, column: 29, scope: !1422)
!1424 = !DILocation(line: 1292, column: 39, scope: !1422)
!1425 = !DILocation(line: 1292, column: 38, scope: !1422)
!1426 = !DILocation(line: 1292, column: 54, scope: !1422)
!1427 = !DILocation(line: 1292, column: 52, scope: !1422)
!1428 = !DILocation(line: 1292, column: 25, scope: !1422)
!1429 = !DILocation(line: 1292, column: 68, scope: !1422)
!1430 = !DILocation(line: 1292, column: 12, scope: !1422)
!1431 = !DILocation(line: 1293, column: 15, scope: !1422)
!1432 = !DILocation(line: 1293, column: 24, scope: !1422)
!1433 = !DILocation(line: 1293, column: 23, scope: !1422)
!1434 = !DILocation(line: 1293, column: 40, scope: !1422)
!1435 = !DILocation(line: 1293, column: 50, scope: !1422)
!1436 = !DILocation(line: 1293, column: 49, scope: !1422)
!1437 = !DILocation(line: 1293, column: 37, scope: !1422)
!1438 = !DILocation(line: 1293, column: 12, scope: !1422)
!1439 = !DILocation(line: 1294, column: 6, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1422, file: !61, line: 1294, column: 6)
!1441 = !DILocation(line: 1294, column: 15, scope: !1440)
!1442 = !DILocation(line: 1294, column: 6, scope: !1422)
!1443 = !DILocation(line: 1296, column: 11, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1440, file: !61, line: 1295, column: 3)
!1445 = !DILocation(line: 1296, column: 4, scope: !1444)
!1446 = !DILocation(line: 1300, column: 4, scope: !1447)
!1447 = distinct !DILexicalBlock(scope: !1440, file: !61, line: 1299, column: 3)
!1448 = !DILocation(line: 1303, column: 1, scope: !1368)
!1449 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !61, file: !61, line: 1321, type: !1450, scopeLine: 1322, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1450 = !DISubroutineType(types: !1451)
!1451 = !{!69, !69, !386}
!1452 = !DILocalVariable(name: "numerator", arg: 1, scope: !1449, file: !61, line: 1321, type: !69)
!1453 = !DILocation(line: 1321, column: 25, scope: !1449)
!1454 = !DILocalVariable(name: "denominator", arg: 2, scope: !1449, file: !61, line: 1321, type: !386)
!1455 = !DILocation(line: 1321, column: 40, scope: !1449)
!1456 = !DILocalVariable(name: "s32Temp1", scope: !1449, file: !61, line: 1323, type: !69)
!1457 = !DILocation(line: 1323, column: 6, scope: !1449)
!1458 = !DILocalVariable(name: "s32Temp2", scope: !1449, file: !61, line: 1323, type: !69)
!1459 = !DILocation(line: 1323, column: 20, scope: !1449)
!1460 = !DILocalVariable(name: "u32Temp0", scope: !1449, file: !61, line: 1324, type: !386)
!1461 = !DILocation(line: 1324, column: 6, scope: !1449)
!1462 = !DILocalVariable(name: "u32Temp1", scope: !1449, file: !61, line: 1324, type: !386)
!1463 = !DILocation(line: 1324, column: 20, scope: !1449)
!1464 = !DILocalVariable(name: "u32Temp2", scope: !1449, file: !61, line: 1324, type: !386)
!1465 = !DILocation(line: 1324, column: 34, scope: !1449)
!1466 = !DILocation(line: 1325, column: 5, scope: !1467)
!1467 = distinct !DILexicalBlock(scope: !1449, file: !61, line: 1325, column: 5)
!1468 = !DILocation(line: 1325, column: 17, scope: !1467)
!1469 = !DILocation(line: 1325, column: 5, scope: !1449)
!1470 = !DILocation(line: 1327, column: 6, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1472, file: !61, line: 1327, column: 6)
!1472 = distinct !DILexicalBlock(scope: !1467, file: !61, line: 1326, column: 2)
!1473 = !DILocation(line: 1327, column: 16, scope: !1471)
!1474 = !DILocation(line: 1327, column: 6, scope: !1472)
!1475 = !DILocation(line: 1329, column: 4, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1471, file: !61, line: 1328, column: 3)
!1477 = !DILocation(line: 1333, column: 4, scope: !1478)
!1478 = distinct !DILexicalBlock(scope: !1471, file: !61, line: 1332, column: 3)
!1479 = !DILocation(line: 1338, column: 6, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1481, file: !61, line: 1338, column: 6)
!1481 = distinct !DILexicalBlock(scope: !1467, file: !61, line: 1337, column: 2)
!1482 = !DILocation(line: 1338, column: 16, scope: !1480)
!1483 = !DILocation(line: 1338, column: 6, scope: !1481)
!1484 = !DILocation(line: 1340, column: 16, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !61, line: 1339, column: 3)
!1486 = !DILocation(line: 1340, column: 15, scope: !1485)
!1487 = !DILocation(line: 1340, column: 13, scope: !1485)
!1488 = !DILocation(line: 1341, column: 16, scope: !1485)
!1489 = !DILocation(line: 1341, column: 25, scope: !1485)
!1490 = !DILocation(line: 1341, column: 24, scope: !1485)
!1491 = !DILocation(line: 1341, column: 13, scope: !1485)
!1492 = !DILocation(line: 1342, column: 15, scope: !1485)
!1493 = !DILocation(line: 1342, column: 28, scope: !1485)
!1494 = !DILocation(line: 1342, column: 37, scope: !1485)
!1495 = !DILocation(line: 1342, column: 36, scope: !1485)
!1496 = !DILocation(line: 1342, column: 52, scope: !1485)
!1497 = !DILocation(line: 1342, column: 50, scope: !1485)
!1498 = !DILocation(line: 1342, column: 24, scope: !1485)
!1499 = !DILocation(line: 1342, column: 13, scope: !1485)
!1500 = !DILocation(line: 1344, column: 8, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1485, file: !61, line: 1344, column: 7)
!1502 = !DILocation(line: 1344, column: 20, scope: !1501)
!1503 = !DILocation(line: 1344, column: 27, scope: !1501)
!1504 = !DILocation(line: 1344, column: 7, scope: !1485)
!1505 = !DILocation(line: 1346, column: 20, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1501, file: !61, line: 1345, column: 4)
!1507 = !DILocation(line: 1346, column: 32, scope: !1506)
!1508 = !DILocation(line: 1346, column: 17, scope: !1506)
!1509 = !DILocation(line: 1347, column: 4, scope: !1506)
!1510 = !DILocation(line: 1350, column: 20, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1501, file: !61, line: 1349, column: 4)
!1512 = !DILocation(line: 1350, column: 32, scope: !1511)
!1513 = !DILocation(line: 1350, column: 38, scope: !1511)
!1514 = !DILocation(line: 1350, column: 17, scope: !1511)
!1515 = !DILocation(line: 1354, column: 7, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1485, file: !61, line: 1354, column: 7)
!1517 = !DILocation(line: 1354, column: 18, scope: !1516)
!1518 = !DILocation(line: 1354, column: 16, scope: !1516)
!1519 = !DILocation(line: 1354, column: 7, scope: !1485)
!1520 = !DILocation(line: 1356, column: 14, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1516, file: !61, line: 1355, column: 4)
!1522 = !DILocation(line: 1356, column: 13, scope: !1521)
!1523 = !DILocation(line: 1356, column: 23, scope: !1521)
!1524 = !DILocation(line: 1356, column: 5, scope: !1521)
!1525 = !DILocation(line: 1360, column: 14, scope: !1526)
!1526 = distinct !DILexicalBlock(scope: !1516, file: !61, line: 1359, column: 4)
!1527 = !DILocation(line: 1360, column: 23, scope: !1526)
!1528 = !DILocation(line: 1360, column: 12, scope: !1526)
!1529 = !DILocation(line: 1360, column: 27, scope: !1526)
!1530 = !DILocation(line: 1360, column: 5, scope: !1526)
!1531 = !DILocation(line: 1367, column: 16, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1480, file: !61, line: 1366, column: 3)
!1533 = !DILocation(line: 1367, column: 30, scope: !1532)
!1534 = !DILocation(line: 1367, column: 40, scope: !1532)
!1535 = !DILocation(line: 1367, column: 39, scope: !1532)
!1536 = !DILocation(line: 1367, column: 55, scope: !1532)
!1537 = !DILocation(line: 1367, column: 53, scope: !1532)
!1538 = !DILocation(line: 1367, column: 26, scope: !1532)
!1539 = !DILocation(line: 1367, column: 69, scope: !1532)
!1540 = !DILocation(line: 1367, column: 13, scope: !1532)
!1541 = !DILocation(line: 1368, column: 16, scope: !1532)
!1542 = !DILocation(line: 1368, column: 26, scope: !1532)
!1543 = !DILocation(line: 1368, column: 25, scope: !1532)
!1544 = !DILocation(line: 1368, column: 42, scope: !1532)
!1545 = !DILocation(line: 1368, column: 51, scope: !1532)
!1546 = !DILocation(line: 1368, column: 50, scope: !1532)
!1547 = !DILocation(line: 1368, column: 39, scope: !1532)
!1548 = !DILocation(line: 1368, column: 13, scope: !1532)
!1549 = !DILocation(line: 1369, column: 11, scope: !1532)
!1550 = !DILocation(line: 1369, column: 4, scope: !1532)
!1551 = !DILocation(line: 1372, column: 1, scope: !1449)
!1552 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !61, file: !61, line: 1389, type: !1553, scopeLine: 1390, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1553 = !DISubroutineType(types: !1554)
!1554 = !{!69, !69, !69}
!1555 = !DILocalVariable(name: "numerator", arg: 1, scope: !1552, file: !61, line: 1389, type: !69)
!1556 = !DILocation(line: 1389, column: 25, scope: !1552)
!1557 = !DILocalVariable(name: "denominator", arg: 2, scope: !1552, file: !61, line: 1389, type: !69)
!1558 = !DILocation(line: 1389, column: 40, scope: !1552)
!1559 = !DILocalVariable(name: "s32Temp1", scope: !1552, file: !61, line: 1391, type: !69)
!1560 = !DILocation(line: 1391, column: 6, scope: !1552)
!1561 = !DILocalVariable(name: "s32Temp2", scope: !1552, file: !61, line: 1391, type: !69)
!1562 = !DILocation(line: 1391, column: 20, scope: !1552)
!1563 = !DILocalVariable(name: "denominator_prime", scope: !1552, file: !61, line: 1392, type: !386)
!1564 = !DILocation(line: 1392, column: 6, scope: !1552)
!1565 = !DILocalVariable(name: "u32Temp1", scope: !1552, file: !61, line: 1392, type: !386)
!1566 = !DILocation(line: 1392, column: 29, scope: !1552)
!1567 = !DILocalVariable(name: "u32Temp2", scope: !1552, file: !61, line: 1392, type: !386)
!1568 = !DILocation(line: 1392, column: 43, scope: !1552)
!1569 = !DILocalVariable(name: "u32numerator", scope: !1552, file: !61, line: 1393, type: !386)
!1570 = !DILocation(line: 1393, column: 6, scope: !1552)
!1571 = !DILocalVariable(name: "u32denominator", scope: !1552, file: !61, line: 1393, type: !386)
!1572 = !DILocation(line: 1393, column: 23, scope: !1552)
!1573 = !DILocation(line: 1394, column: 5, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1552, file: !61, line: 1394, column: 5)
!1575 = !DILocation(line: 1394, column: 15, scope: !1574)
!1576 = !DILocation(line: 1394, column: 5, scope: !1552)
!1577 = !DILocation(line: 1396, column: 6, scope: !1578)
!1578 = distinct !DILexicalBlock(scope: !1579, file: !61, line: 1396, column: 6)
!1579 = distinct !DILexicalBlock(scope: !1574, file: !61, line: 1395, column: 2)
!1580 = !DILocation(line: 1396, column: 18, scope: !1578)
!1581 = !DILocation(line: 1396, column: 6, scope: !1579)
!1582 = !DILocation(line: 1398, column: 7, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1584, file: !61, line: 1398, column: 7)
!1584 = distinct !DILexicalBlock(scope: !1578, file: !61, line: 1397, column: 3)
!1585 = !DILocation(line: 1398, column: 19, scope: !1583)
!1586 = !DILocation(line: 1398, column: 7, scope: !1584)
!1587 = !DILocation(line: 1400, column: 5, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1583, file: !61, line: 1399, column: 4)
!1589 = !DILocation(line: 1404, column: 21, scope: !1590)
!1590 = distinct !DILexicalBlock(scope: !1583, file: !61, line: 1403, column: 4)
!1591 = !DILocation(line: 1404, column: 20, scope: !1590)
!1592 = !DILocation(line: 1404, column: 18, scope: !1590)
!1593 = !DILocation(line: 1405, column: 23, scope: !1590)
!1594 = !DILocation(line: 1405, column: 22, scope: !1590)
!1595 = !DILocation(line: 1405, column: 20, scope: !1590)
!1596 = !DILocation(line: 1406, column: 16, scope: !1590)
!1597 = !DILocation(line: 1406, column: 33, scope: !1590)
!1598 = !DILocation(line: 1406, column: 46, scope: !1590)
!1599 = !DILocation(line: 1406, column: 45, scope: !1590)
!1600 = !DILocation(line: 1406, column: 64, scope: !1590)
!1601 = !DILocation(line: 1406, column: 62, scope: !1590)
!1602 = !DILocation(line: 1406, column: 29, scope: !1590)
!1603 = !DILocation(line: 1406, column: 81, scope: !1590)
!1604 = !DILocation(line: 1406, column: 14, scope: !1590)
!1605 = !DILocation(line: 1407, column: 17, scope: !1590)
!1606 = !DILocation(line: 1407, column: 30, scope: !1590)
!1607 = !DILocation(line: 1407, column: 29, scope: !1590)
!1608 = !DILocation(line: 1407, column: 49, scope: !1590)
!1609 = !DILocation(line: 1407, column: 58, scope: !1590)
!1610 = !DILocation(line: 1407, column: 57, scope: !1590)
!1611 = !DILocation(line: 1407, column: 46, scope: !1590)
!1612 = !DILocation(line: 1407, column: 14, scope: !1590)
!1613 = !DILocation(line: 1408, column: 8, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1590, file: !61, line: 1408, column: 8)
!1615 = !DILocation(line: 1408, column: 17, scope: !1614)
!1616 = !DILocation(line: 1408, column: 8, scope: !1590)
!1617 = !DILocation(line: 1410, column: 13, scope: !1618)
!1618 = distinct !DILexicalBlock(scope: !1614, file: !61, line: 1409, column: 5)
!1619 = !DILocation(line: 1410, column: 6, scope: !1618)
!1620 = !DILocation(line: 1414, column: 6, scope: !1621)
!1621 = distinct !DILexicalBlock(scope: !1614, file: !61, line: 1413, column: 5)
!1622 = !DILocation(line: 1420, column: 20, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1578, file: !61, line: 1419, column: 3)
!1624 = !DILocation(line: 1420, column: 19, scope: !1623)
!1625 = !DILocation(line: 1420, column: 29, scope: !1623)
!1626 = !DILocation(line: 1420, column: 17, scope: !1623)
!1627 = !DILocation(line: 1421, column: 16, scope: !1623)
!1628 = !DILocation(line: 1421, column: 33, scope: !1623)
!1629 = !DILocation(line: 1421, column: 46, scope: !1623)
!1630 = !DILocation(line: 1421, column: 45, scope: !1623)
!1631 = !DILocation(line: 1421, column: 61, scope: !1623)
!1632 = !DILocation(line: 1421, column: 59, scope: !1623)
!1633 = !DILocation(line: 1421, column: 29, scope: !1623)
!1634 = !DILocation(line: 1421, column: 75, scope: !1623)
!1635 = !DILocation(line: 1421, column: 13, scope: !1623)
!1636 = !DILocation(line: 1422, column: 16, scope: !1623)
!1637 = !DILocation(line: 1422, column: 29, scope: !1623)
!1638 = !DILocation(line: 1422, column: 28, scope: !1623)
!1639 = !DILocation(line: 1422, column: 45, scope: !1623)
!1640 = !DILocation(line: 1422, column: 54, scope: !1623)
!1641 = !DILocation(line: 1422, column: 53, scope: !1623)
!1642 = !DILocation(line: 1422, column: 42, scope: !1623)
!1643 = !DILocation(line: 1422, column: 13, scope: !1623)
!1644 = !DILocation(line: 1423, column: 13, scope: !1623)
!1645 = !DILocation(line: 1423, column: 12, scope: !1623)
!1646 = !DILocation(line: 1423, column: 22, scope: !1623)
!1647 = !DILocation(line: 1423, column: 4, scope: !1623)
!1648 = !DILocation(line: 1428, column: 6, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1650, file: !61, line: 1428, column: 6)
!1650 = distinct !DILexicalBlock(scope: !1574, file: !61, line: 1427, column: 2)
!1651 = !DILocation(line: 1428, column: 18, scope: !1649)
!1652 = !DILocation(line: 1428, column: 6, scope: !1650)
!1653 = !DILocation(line: 1430, column: 7, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1655, file: !61, line: 1430, column: 7)
!1655 = distinct !DILexicalBlock(scope: !1649, file: !61, line: 1429, column: 3)
!1656 = !DILocation(line: 1430, column: 19, scope: !1654)
!1657 = !DILocation(line: 1430, column: 7, scope: !1655)
!1658 = !DILocation(line: 1432, column: 5, scope: !1659)
!1659 = distinct !DILexicalBlock(scope: !1654, file: !61, line: 1431, column: 4)
!1660 = !DILocation(line: 1436, column: 23, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1654, file: !61, line: 1435, column: 4)
!1662 = !DILocation(line: 1436, column: 22, scope: !1661)
!1663 = !DILocation(line: 1436, column: 35, scope: !1661)
!1664 = !DILocation(line: 1436, column: 20, scope: !1661)
!1665 = !DILocation(line: 1437, column: 17, scope: !1661)
!1666 = !DILocation(line: 1437, column: 31, scope: !1661)
!1667 = !DILocation(line: 1437, column: 41, scope: !1661)
!1668 = !DILocation(line: 1437, column: 40, scope: !1661)
!1669 = !DILocation(line: 1437, column: 59, scope: !1661)
!1670 = !DILocation(line: 1437, column: 57, scope: !1661)
!1671 = !DILocation(line: 1437, column: 27, scope: !1661)
!1672 = !DILocation(line: 1437, column: 76, scope: !1661)
!1673 = !DILocation(line: 1437, column: 14, scope: !1661)
!1674 = !DILocation(line: 1438, column: 17, scope: !1661)
!1675 = !DILocation(line: 1438, column: 27, scope: !1661)
!1676 = !DILocation(line: 1438, column: 26, scope: !1661)
!1677 = !DILocation(line: 1438, column: 46, scope: !1661)
!1678 = !DILocation(line: 1438, column: 55, scope: !1661)
!1679 = !DILocation(line: 1438, column: 54, scope: !1661)
!1680 = !DILocation(line: 1438, column: 43, scope: !1661)
!1681 = !DILocation(line: 1438, column: 14, scope: !1661)
!1682 = !DILocation(line: 1439, column: 14, scope: !1661)
!1683 = !DILocation(line: 1439, column: 13, scope: !1661)
!1684 = !DILocation(line: 1439, column: 23, scope: !1661)
!1685 = !DILocation(line: 1439, column: 5, scope: !1661)
!1686 = !DILocation(line: 1444, column: 16, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1649, file: !61, line: 1443, column: 3)
!1688 = !DILocation(line: 1444, column: 30, scope: !1687)
!1689 = !DILocation(line: 1444, column: 40, scope: !1687)
!1690 = !DILocation(line: 1444, column: 39, scope: !1687)
!1691 = !DILocation(line: 1444, column: 55, scope: !1687)
!1692 = !DILocation(line: 1444, column: 53, scope: !1687)
!1693 = !DILocation(line: 1444, column: 26, scope: !1687)
!1694 = !DILocation(line: 1444, column: 69, scope: !1687)
!1695 = !DILocation(line: 1444, column: 13, scope: !1687)
!1696 = !DILocation(line: 1445, column: 16, scope: !1687)
!1697 = !DILocation(line: 1445, column: 26, scope: !1687)
!1698 = !DILocation(line: 1445, column: 25, scope: !1687)
!1699 = !DILocation(line: 1445, column: 42, scope: !1687)
!1700 = !DILocation(line: 1445, column: 51, scope: !1687)
!1701 = !DILocation(line: 1445, column: 50, scope: !1687)
!1702 = !DILocation(line: 1445, column: 39, scope: !1687)
!1703 = !DILocation(line: 1445, column: 13, scope: !1687)
!1704 = !DILocation(line: 1446, column: 11, scope: !1687)
!1705 = !DILocation(line: 1446, column: 4, scope: !1687)
!1706 = !DILocation(line: 1449, column: 1, scope: !1552)
!1707 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !61, file: !61, line: 1467, type: !1708, scopeLine: 1468, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1708 = !DISubroutineType(types: !1709)
!1709 = !{!6, !69, !386}
!1710 = !DILocalVariable(name: "numerator", arg: 1, scope: !1707, file: !61, line: 1467, type: !69)
!1711 = !DILocation(line: 1467, column: 25, scope: !1707)
!1712 = !DILocalVariable(name: "denominator", arg: 2, scope: !1707, file: !61, line: 1467, type: !386)
!1713 = !DILocation(line: 1467, column: 40, scope: !1707)
!1714 = !DILocalVariable(name: "numerator_prime", scope: !1707, file: !61, line: 1470, type: !386)
!1715 = !DILocation(line: 1470, column: 6, scope: !1707)
!1716 = !DILocalVariable(name: "u32Temp1", scope: !1707, file: !61, line: 1470, type: !386)
!1717 = !DILocation(line: 1470, column: 27, scope: !1707)
!1718 = !DILocalVariable(name: "u32Temp2", scope: !1707, file: !61, line: 1470, type: !386)
!1719 = !DILocation(line: 1470, column: 41, scope: !1707)
!1720 = !DILocalVariable(name: "u32Temp3", scope: !1707, file: !61, line: 1470, type: !386)
!1721 = !DILocation(line: 1470, column: 55, scope: !1707)
!1722 = !DILocalVariable(name: "s32Temp1", scope: !1707, file: !61, line: 1471, type: !69)
!1723 = !DILocation(line: 1471, column: 6, scope: !1707)
!1724 = !DILocalVariable(name: "s32Temp2", scope: !1707, file: !61, line: 1471, type: !69)
!1725 = !DILocation(line: 1471, column: 20, scope: !1707)
!1726 = !DILocalVariable(name: "s32Temp3", scope: !1707, file: !61, line: 1471, type: !69)
!1727 = !DILocation(line: 1471, column: 34, scope: !1707)
!1728 = !DILocation(line: 1472, column: 5, scope: !1729)
!1729 = distinct !DILexicalBlock(scope: !1707, file: !61, line: 1472, column: 5)
!1730 = !DILocation(line: 1472, column: 17, scope: !1729)
!1731 = !DILocation(line: 1472, column: 5, scope: !1707)
!1732 = !DILocation(line: 1474, column: 6, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !61, line: 1474, column: 6)
!1734 = distinct !DILexicalBlock(scope: !1729, file: !61, line: 1473, column: 2)
!1735 = !DILocation(line: 1474, column: 15, scope: !1733)
!1736 = !DILocation(line: 1474, column: 6, scope: !1734)
!1737 = !DILocation(line: 1476, column: 4, scope: !1738)
!1738 = distinct !DILexicalBlock(scope: !1733, file: !61, line: 1475, column: 3)
!1739 = !DILocation(line: 1480, column: 4, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1733, file: !61, line: 1479, column: 3)
!1741 = !DILocation(line: 1485, column: 6, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !61, line: 1485, column: 6)
!1743 = distinct !DILexicalBlock(scope: !1729, file: !61, line: 1484, column: 2)
!1744 = !DILocation(line: 1485, column: 16, scope: !1742)
!1745 = !DILocation(line: 1485, column: 6, scope: !1743)
!1746 = !DILocation(line: 1487, column: 23, scope: !1747)
!1747 = distinct !DILexicalBlock(scope: !1742, file: !61, line: 1486, column: 3)
!1748 = !DILocation(line: 1487, column: 22, scope: !1747)
!1749 = !DILocation(line: 1487, column: 20, scope: !1747)
!1750 = !DILocation(line: 1488, column: 16, scope: !1747)
!1751 = !DILocation(line: 1488, column: 32, scope: !1747)
!1752 = !DILocation(line: 1488, column: 31, scope: !1747)
!1753 = !DILocation(line: 1488, column: 13, scope: !1747)
!1754 = !DILocation(line: 1489, column: 15, scope: !1747)
!1755 = !DILocation(line: 1489, column: 34, scope: !1747)
!1756 = !DILocation(line: 1489, column: 45, scope: !1747)
!1757 = !DILocation(line: 1489, column: 43, scope: !1747)
!1758 = !DILocation(line: 1489, column: 31, scope: !1747)
!1759 = !DILocation(line: 1489, column: 13, scope: !1747)
!1760 = !DILocation(line: 1491, column: 8, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1747, file: !61, line: 1491, column: 7)
!1762 = !DILocation(line: 1491, column: 20, scope: !1761)
!1763 = !DILocation(line: 1491, column: 27, scope: !1761)
!1764 = !DILocation(line: 1491, column: 7, scope: !1747)
!1765 = !DILocation(line: 1493, column: 19, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1761, file: !61, line: 1492, column: 4)
!1767 = !DILocation(line: 1493, column: 31, scope: !1766)
!1768 = !DILocation(line: 1493, column: 17, scope: !1766)
!1769 = !DILocation(line: 1494, column: 4, scope: !1766)
!1770 = !DILocation(line: 1497, column: 20, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1761, file: !61, line: 1496, column: 4)
!1772 = !DILocation(line: 1497, column: 32, scope: !1771)
!1773 = !DILocation(line: 1497, column: 38, scope: !1771)
!1774 = !DILocation(line: 1497, column: 17, scope: !1771)
!1775 = !DILocation(line: 1500, column: 7, scope: !1776)
!1776 = distinct !DILexicalBlock(scope: !1747, file: !61, line: 1500, column: 7)
!1777 = !DILocation(line: 1500, column: 18, scope: !1776)
!1778 = !DILocation(line: 1500, column: 16, scope: !1776)
!1779 = !DILocation(line: 1500, column: 7, scope: !1747)
!1780 = !DILocation(line: 1502, column: 18, scope: !1781)
!1781 = distinct !DILexicalBlock(scope: !1776, file: !61, line: 1501, column: 4)
!1782 = !DILocation(line: 1502, column: 16, scope: !1781)
!1783 = !DILocation(line: 1502, column: 28, scope: !1781)
!1784 = !DILocation(line: 1502, column: 14, scope: !1781)
!1785 = !DILocation(line: 1503, column: 4, scope: !1781)
!1786 = !DILocation(line: 1506, column: 18, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !1776, file: !61, line: 1505, column: 4)
!1788 = !DILocation(line: 1506, column: 26, scope: !1787)
!1789 = !DILocation(line: 1506, column: 16, scope: !1787)
!1790 = !DILocation(line: 1506, column: 30, scope: !1787)
!1791 = !DILocation(line: 1506, column: 14, scope: !1787)
!1792 = !DILocation(line: 1508, column: 8, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1747, file: !61, line: 1508, column: 7)
!1794 = !DILocation(line: 1508, column: 18, scope: !1793)
!1795 = !DILocation(line: 1508, column: 7, scope: !1747)
!1796 = !DILocation(line: 1510, column: 18, scope: !1797)
!1797 = distinct !DILexicalBlock(scope: !1793, file: !61, line: 1509, column: 4)
!1798 = !DILocation(line: 1510, column: 12, scope: !1797)
!1799 = !DILocation(line: 1510, column: 5, scope: !1797)
!1800 = !DILocation(line: 1514, column: 5, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1793, file: !61, line: 1513, column: 4)
!1802 = !DILocation(line: 1519, column: 16, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1742, file: !61, line: 1518, column: 3)
!1804 = !DILocation(line: 1519, column: 26, scope: !1803)
!1805 = !DILocation(line: 1519, column: 25, scope: !1803)
!1806 = !DILocation(line: 1519, column: 41, scope: !1803)
!1807 = !DILocation(line: 1519, column: 39, scope: !1803)
!1808 = !DILocation(line: 1519, column: 13, scope: !1803)
!1809 = !DILocation(line: 1520, column: 16, scope: !1803)
!1810 = !DILocation(line: 1520, column: 30, scope: !1803)
!1811 = !DILocation(line: 1520, column: 40, scope: !1803)
!1812 = !DILocation(line: 1520, column: 39, scope: !1803)
!1813 = !DILocation(line: 1520, column: 55, scope: !1803)
!1814 = !DILocation(line: 1520, column: 53, scope: !1803)
!1815 = !DILocation(line: 1520, column: 26, scope: !1803)
!1816 = !DILocation(line: 1520, column: 68, scope: !1803)
!1817 = !DILocation(line: 1520, column: 13, scope: !1803)
!1818 = !DILocation(line: 1521, column: 16, scope: !1803)
!1819 = !DILocation(line: 1521, column: 25, scope: !1803)
!1820 = !DILocation(line: 1521, column: 24, scope: !1803)
!1821 = !DILocation(line: 1521, column: 41, scope: !1803)
!1822 = !DILocation(line: 1521, column: 51, scope: !1803)
!1823 = !DILocation(line: 1521, column: 50, scope: !1803)
!1824 = !DILocation(line: 1521, column: 38, scope: !1803)
!1825 = !DILocation(line: 1521, column: 13, scope: !1803)
!1826 = !DILocation(line: 1522, column: 7, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1803, file: !61, line: 1522, column: 7)
!1828 = !DILocation(line: 1522, column: 16, scope: !1827)
!1829 = !DILocation(line: 1522, column: 7, scope: !1803)
!1830 = !DILocation(line: 1524, column: 17, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1827, file: !61, line: 1523, column: 4)
!1832 = !DILocation(line: 1524, column: 12, scope: !1831)
!1833 = !DILocation(line: 1524, column: 5, scope: !1831)
!1834 = !DILocation(line: 1528, column: 5, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1827, file: !61, line: 1527, column: 4)
!1836 = !DILocation(line: 1532, column: 1, scope: !1707)
!1837 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1838, file: !1838, line: 12, type: !1839, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !31, retainedNodes: !1842)
!1838 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1839 = !DISubroutineType(types: !1840)
!1840 = !{null, !1841}
!1841 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1842 = !{!1843}
!1843 = !DILocalVariable(name: "z", arg: 1, scope: !1837, file: !1838, line: 12, type: !1841)
!1844 = !DILocation(line: 0, scope: !1837)
!1845 = !DILocation(line: 13, column: 9, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1837, file: !1838, line: 13, column: 7)
!1847 = !DILocation(line: 13, column: 7, scope: !1837)
!1848 = !DILocation(line: 14, column: 5, scope: !1846)
!1849 = !DILocation(line: 15, column: 1, scope: !1837)
