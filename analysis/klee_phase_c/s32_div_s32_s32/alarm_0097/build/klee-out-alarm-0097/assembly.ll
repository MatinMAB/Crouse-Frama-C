; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/build/s32_div_s32_s32_alarm_0097.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"numerator\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"denominator\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [78 x i8] c"KLEE-ALARM-0097: signed overflow. assert (s32)(~numerator) + 1 <= 2147483647;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0097.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %numerator = alloca i32, align 4
  %denominator = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %denominator, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %result, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i32* %numerator to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !54
  %1 = bitcast i32* %denominator to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %1, i64 4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  %2 = load i32, i32* %numerator, align 4, !dbg !57
  %3 = load i32, i32* %denominator, align 4, !dbg !58
  %call = call i32 @s32_div_s32_s32(i32 %2, i32 %3), !dbg !59
  store i32 %call, i32* %result, align 4, !dbg !60
  %4 = load i32, i32* %result, align 4, !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_fac05_div_s16_s16(i16 signext %numerator, i16 signext %denominator) #0 !dbg !63 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !71, metadata !DIExpression()), !dbg !72
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
  %conv2 = sext i16 %1 to i32, !dbg !310
  %shl = shl i32 %conv2, 16, !dbg !311
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !312
  %2 = load i16, i16* %u16Temp1, align 2, !dbg !313
  %conv3 = zext i16 %2 to i32, !dbg !313
  %cmp = icmp eq i32 %conv3, 0, !dbg !315
  br i1 %cmp, label %if.then, label %if.else9, !dbg !316

if.then:                                          ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !317
  %conv5 = sext i16 %3 to i32, !dbg !317
  %cmp6 = icmp slt i32 %conv5, 0, !dbg !320
  br i1 %cmp6, label %if.then8, label %if.else, !dbg !321

if.then8:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !322
  br label %return, !dbg !322

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !324
  br label %return, !dbg !324

if.else9:                                         ; preds = %entry
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !326
  %conv10 = sext i16 %4 to i32, !dbg !326
  %shl11 = shl i32 %conv10, 16, !dbg !328
  %5 = load i16, i16* %numerator.addr, align 2, !dbg !329
  %conv12 = sext i16 %5 to i32, !dbg !329
  %shl13 = shl i32 %conv12, 16, !dbg !330
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !331
  %conv14 = zext i16 %6 to i32, !dbg !331
  %int_cast_to_i64 = zext i32 %conv14 to i64, !dbg !332
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !332
  %div = sdiv i32 %shl13, %conv14, !dbg !332, !klee.check.div !101
  %7 = load i16, i16* %u16Temp1, align 2, !dbg !333
  %conv15 = zext i16 %7 to i32, !dbg !333
  %mul = mul nsw i32 %div, %conv15, !dbg !334
  %sub = sub nsw i32 %shl11, %mul, !dbg !335
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !336
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !337
  %shl16 = shl i32 %8, 1, !dbg !338
  store i32 %shl16, i32* %s32Temp2, align 4, !dbg !339
  %9 = load i32, i32* %s32Temp2, align 4, !dbg !340
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !341
  %conv17 = zext i16 %10 to i32, !dbg !341
  %int_cast_to_i641 = zext i32 %conv17 to i64, !dbg !342
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !342
  %div18 = sdiv i32 %9, %conv17, !dbg !342, !klee.check.div !101
  store i32 %div18, i32* %s32Temp1, align 4, !dbg !343
  %11 = load i16, i16* %numerator.addr, align 2, !dbg !344
  %conv19 = sext i16 %11 to i32, !dbg !344
  %shl20 = shl i32 %conv19, 16, !dbg !345
  %12 = load i16, i16* %u16Temp1, align 2, !dbg !346
  %conv21 = zext i16 %12 to i32, !dbg !346
  %int_cast_to_i642 = zext i32 %conv21 to i64, !dbg !347
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !347
  %div22 = sdiv i32 %shl20, %conv21, !dbg !347, !klee.check.div !101
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !348
  %add = add nsw i32 %div22, %13, !dbg !349
  store i32 %add, i32* %s32Temp1, align 4, !dbg !350
  %14 = load i32, i32* %s32Temp1, align 4, !dbg !351
  %cmp23 = icmp slt i32 %14, 32767, !dbg !353
  br i1 %cmp23, label %if.then25, label %if.else31, !dbg !354

if.then25:                                        ; preds = %if.else9
  %15 = load i32, i32* %s32Temp1, align 4, !dbg !355
  %cmp26 = icmp sgt i32 %15, -32768, !dbg !358
  br i1 %cmp26, label %if.then28, label %if.else30, !dbg !359

if.then28:                                        ; preds = %if.then25
  %16 = load i32, i32* %s32Temp1, align 4, !dbg !360
  %conv29 = trunc i32 %16 to i16, !dbg !362
  store i16 %conv29, i16* %retval, align 2, !dbg !363
  br label %return, !dbg !363

if.else30:                                        ; preds = %if.then25
  store i16 -32768, i16* %retval, align 2, !dbg !364
  br label %return, !dbg !364

if.else31:                                        ; preds = %if.else9
  store i16 32767, i16* %retval, align 2, !dbg !366
  br label %return, !dbg !366

return:                                           ; preds = %if.else31, %if.else30, %if.then28, %if.else, %if.then8
  %17 = load i16, i16* %retval, align 2, !dbg !368
  ret i16 %17, !dbg !368
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s16_u16_shl0(i16 signext %numerator, i16 zeroext %denominator) #0 !dbg !369 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u16Temp1 = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !370, metadata !DIExpression()), !dbg !371
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i16* %u16Temp1, metadata !374, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !376, metadata !DIExpression()), !dbg !377
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !378
  %conv = zext i16 %0 to i32, !dbg !378
  %and = and i32 %conv, 65535, !dbg !379
  %conv1 = trunc i32 %and to i16, !dbg !378
  store i16 %conv1, i16* %u16Temp1, align 2, !dbg !380
  %1 = load i16, i16* %u16Temp1, align 2, !dbg !381
  %conv2 = zext i16 %1 to i32, !dbg !381
  %cmp = icmp eq i32 %conv2, 0, !dbg !383
  br i1 %cmp, label %if.then, label %if.else8, !dbg !384

if.then:                                          ; preds = %entry
  %2 = load i16, i16* %numerator.addr, align 2, !dbg !385
  %conv4 = sext i16 %2 to i32, !dbg !385
  %cmp5 = icmp sge i32 %conv4, 0, !dbg !388
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !389

if.then7:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !390
  br label %return, !dbg !390

if.else:                                          ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !392
  br label %return, !dbg !392

if.else8:                                         ; preds = %entry
  %3 = load i16, i16* %numerator.addr, align 2, !dbg !394
  %conv9 = sext i16 %3 to i32, !dbg !394
  %4 = load i16, i16* %numerator.addr, align 2, !dbg !396
  %conv10 = sext i16 %4 to i32, !dbg !396
  %5 = load i16, i16* %u16Temp1, align 2, !dbg !397
  %conv11 = zext i16 %5 to i32, !dbg !397
  %int_cast_to_i64 = zext i32 %conv11 to i64, !dbg !398
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !398
  %div = sdiv i32 %conv10, %conv11, !dbg !398, !klee.check.div !101
  %6 = load i16, i16* %u16Temp1, align 2, !dbg !399
  %conv12 = zext i16 %6 to i32, !dbg !399
  %mul = mul nsw i32 %div, %conv12, !dbg !400
  %sub = sub nsw i32 %conv9, %mul, !dbg !401
  %shl = shl i32 %sub, 1, !dbg !402
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !403
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !404
  %8 = load i16, i16* %u16Temp1, align 2, !dbg !405
  %conv13 = zext i16 %8 to i32, !dbg !405
  %int_cast_to_i641 = zext i32 %conv13 to i64, !dbg !406
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !406
  %div14 = sdiv i32 %7, %conv13, !dbg !406, !klee.check.div !101
  %9 = load i16, i16* %numerator.addr, align 2, !dbg !407
  %conv15 = sext i16 %9 to i32, !dbg !407
  %10 = load i16, i16* %u16Temp1, align 2, !dbg !408
  %conv16 = zext i16 %10 to i32, !dbg !408
  %int_cast_to_i642 = zext i32 %conv16 to i64, !dbg !409
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !409
  %div17 = sdiv i32 %conv15, %conv16, !dbg !409, !klee.check.div !101
  %add = add nsw i32 %div14, %div17, !dbg !410
  store i32 %add, i32* %s32Temp1, align 4, !dbg !411
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !412
  %conv18 = trunc i32 %11 to i16, !dbg !412
  store i16 %conv18, i16* %retval, align 2, !dbg !413
  br label %return, !dbg !413

return:                                           ; preds = %if.else8, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !414
  ret i16 %12, !dbg !414
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i8 @u8_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !415 {
entry:
  %retval = alloca i8, align 1
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !418, metadata !DIExpression()), !dbg !419
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !420, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !422, metadata !DIExpression()), !dbg !427
  store i32 0, i32* %u32Temp1, align 4, !dbg !427
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !428, metadata !DIExpression()), !dbg !429
  store i32 0, i32* %u32Temp2, align 4, !dbg !429
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !430, metadata !DIExpression()), !dbg !431
  store i32 0, i32* %u32Temp3, align 4, !dbg !431
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !432
  %conv = zext i16 %0 to i32, !dbg !432
  %cmp = icmp eq i32 %conv, 0, !dbg !434
  br i1 %cmp, label %if.then, label %if.else, !dbg !435

if.then:                                          ; preds = %entry
  store i8 -1, i8* %retval, align 1, !dbg !436
  br label %return, !dbg !436

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !438
  %conv2 = zext i16 %1 to i32, !dbg !438
  %shl = shl i32 %conv2, 16, !dbg !440
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !441
  %2 = load i32, i32* %u32Temp1, align 4, !dbg !442
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !443
  %conv3 = zext i16 %3 to i32, !dbg !443
  %int_cast_to_i64 = zext i32 %conv3 to i64, !dbg !444
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !444
  %div = udiv i32 %2, %conv3, !dbg !444, !klee.check.div !101
  store i32 %div, i32* %u32Temp2, align 4, !dbg !445
  %4 = load i32, i32* %u32Temp2, align 4, !dbg !446
  %add = add i32 %4, 128, !dbg !447
  %shr = lshr i32 %add, 8, !dbg !448
  store i32 %shr, i32* %u32Temp3, align 4, !dbg !449
  %5 = load i32, i32* %u32Temp3, align 4, !dbg !450
  %cmp4 = icmp ult i32 %5, 255, !dbg !452
  br i1 %cmp4, label %if.then6, label %if.else8, !dbg !453

if.then6:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp3, align 4, !dbg !454
  %conv7 = trunc i32 %6 to i8, !dbg !456
  store i8 %conv7, i8* %retval, align 1, !dbg !457
  br label %return, !dbg !457

if.else8:                                         ; preds = %if.else
  store i8 -1, i8* %retval, align 1, !dbg !458
  br label %return, !dbg !458

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !460
  ret i8 %7, !dbg !460
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_s32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !461 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !464, metadata !DIExpression()), !dbg !465
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !466, metadata !DIExpression()), !dbg !467
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !468, metadata !DIExpression()), !dbg !469
  store i32 0, i32* %s32Temp1, align 4, !dbg !469
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !470
  %conv = zext i16 %0 to i32, !dbg !470
  %and = and i32 %conv, 65535, !dbg !471
  %conv1 = trunc i32 %and to i16, !dbg !470
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !472
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !473
  %conv2 = zext i16 %1 to i32, !dbg !473
  %and3 = and i32 %conv2, 65535, !dbg !475
  %cmp = icmp eq i32 %and3, 0, !dbg !476
  br i1 %cmp, label %if.then, label %if.else8, !dbg !477

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !478
  %cmp5 = icmp sge i32 %2, 0, !dbg !481
  br i1 %cmp5, label %if.then7, label %if.else, !dbg !482

if.then7:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !483
  br label %return, !dbg !483

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !485
  br label %return, !dbg !485

if.else8:                                         ; preds = %entry
  %3 = load i32, i32* %x_value.addr, align 4, !dbg !487
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !489
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !490
  %conv9 = zext i16 %5 to i32, !dbg !490
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !491
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !491
  %div = sdiv i32 %4, %conv9, !dbg !491, !klee.check.div !101
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !492
  %conv10 = zext i16 %6 to i32, !dbg !492
  %mul = mul nsw i32 %div, %conv10, !dbg !493
  %sub = sub nsw i32 %3, %mul, !dbg !494
  %shl = shl i32 %sub, 1, !dbg !495
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !496
  %7 = load i32, i32* %s32Temp1, align 4, !dbg !497
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !498
  %conv11 = zext i16 %8 to i32, !dbg !498
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !499
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !499
  %div12 = sdiv i32 %7, %conv11, !dbg !499, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !500
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !501
  %conv13 = zext i16 %10 to i32, !dbg !501
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !502
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !502
  %div14 = sdiv i32 %9, %conv13, !dbg !502, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !503
  store i32 %add, i32* %s32Temp1, align 4, !dbg !504
  %11 = load i32, i32* %s32Temp1, align 4, !dbg !505
  %cmp15 = icmp slt i32 %11, 65535, !dbg !507
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !508

if.then17:                                        ; preds = %if.else8
  %12 = load i32, i32* %s32Temp1, align 4, !dbg !509
  %cmp18 = icmp sgt i32 %12, 0, !dbg !512
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !513

if.then20:                                        ; preds = %if.then17
  %13 = load i32, i32* %s32Temp1, align 4, !dbg !514
  %conv21 = trunc i32 %13 to i16, !dbg !516
  store i16 %conv21, i16* %retval, align 2, !dbg !517
  br label %return, !dbg !517

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !518
  br label %return, !dbg !518

if.else23:                                        ; preds = %if.else8
  store i16 -1, i16* %retval, align 2, !dbg !520
  br label %return, !dbg !520

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then7
  %14 = load i16, i16* %retval, align 2, !dbg !522
  ret i16 %14, !dbg !522
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !523 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !526, metadata !DIExpression()), !dbg !527
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !528, metadata !DIExpression()), !dbg !529
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !530, metadata !DIExpression()), !dbg !531
  store i32 0, i32* %u32Temp, align 4, !dbg !531
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !532
  %conv = zext i16 %0 to i32, !dbg !532
  %cmp = icmp eq i32 %conv, 0, !dbg !534
  br i1 %cmp, label %if.then, label %if.else, !dbg !535

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !536
  br label %return, !dbg !536

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !538
  %conv2 = zext i16 %1 to i32, !dbg !538
  %shl = shl i32 %conv2, 16, !dbg !540
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !541
  %conv3 = zext i16 %2 to i32, !dbg !541
  %shr = ashr i32 %conv3, 1, !dbg !542
  %add = add nsw i32 %shl, %shr, !dbg !543
  store i32 %add, i32* %u32Temp, align 4, !dbg !544
  %3 = load i32, i32* %u32Temp, align 4, !dbg !545
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !546
  %conv4 = zext i16 %4 to i32, !dbg !546
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !547
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !547
  %div = udiv i32 %3, %conv4, !dbg !547, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !548
  %5 = load i32, i32* %u32Temp, align 4, !dbg !549
  %cmp5 = icmp ult i32 %5, 65535, !dbg !551
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !552

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !553
  %and = and i32 %6, 65535, !dbg !555
  %conv8 = trunc i32 %and to i16, !dbg !553
  store i16 %conv8, i16* %retval, align 2, !dbg !556
  br label %return, !dbg !556

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !557
  br label %return, !dbg !557

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !559
  ret i16 %7, !dbg !559
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !560 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !563, metadata !DIExpression()), !dbg !564
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !565, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !567, metadata !DIExpression()), !dbg !568
  store i32 0, i32* %u32Temp1, align 4, !dbg !568
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !569, metadata !DIExpression()), !dbg !570
  store i32 0, i32* %u32Temp2, align 4, !dbg !570
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !571
  %conv = zext i16 %0 to i32, !dbg !571
  %and = and i32 %conv, 65535, !dbg !572
  %conv1 = trunc i32 %and to i16, !dbg !571
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !573
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !574
  %conv2 = zext i16 %1 to i32, !dbg !574
  %cmp = icmp eq i32 %conv2, 0, !dbg !576
  br i1 %cmp, label %if.then, label %if.else, !dbg !577

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !578
  br label %return, !dbg !578

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !580
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !582
  %conv4 = zext i16 %3 to i32, !dbg !582
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !583
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !583
  %div = udiv i32 %2, %conv4, !dbg !583, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !584
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !585
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !586
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !587
  %conv5 = zext i16 %6 to i32, !dbg !587
  %mul = mul i32 %5, %conv5, !dbg !588
  %sub = sub i32 %4, %mul, !dbg !589
  %shl = shl i32 %sub, 1, !dbg !590
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !591
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !592
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !593
  %conv6 = zext i16 %8 to i32, !dbg !593
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !594
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !594
  %div7 = udiv i32 %7, %conv6, !dbg !594, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !595
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !596
  %conv8 = zext i16 %10 to i32, !dbg !596
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !597
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !597
  %div9 = udiv i32 %9, %conv8, !dbg !597, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !598
  store i32 %add, i32* %u32Temp2, align 4, !dbg !599
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !600
  %cmp10 = icmp ult i32 %11, 65535, !dbg !602
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !603

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !604
  %and13 = and i32 %12, 65535, !dbg !606
  %conv14 = trunc i32 %and13 to i16, !dbg !604
  store i16 %conv14, i16* %retval, align 2, !dbg !607
  br label %return, !dbg !607

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !608
  br label %return, !dbg !608

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !610
  ret i16 %13, !dbg !610
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !611 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !614, metadata !DIExpression()), !dbg !615
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !618, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !620, metadata !DIExpression()), !dbg !621
  store i32 0, i32* %s32Result, align 4, !dbg !621
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !622, metadata !DIExpression()), !dbg !623
  store i32 0, i32* %s32Temp1, align 4, !dbg !623
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !624
  %conv = sext i16 %0 to i32, !dbg !624
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !625
  %conv1 = zext i16 %1 to i32, !dbg !625
  %mul = mul nsw i32 %conv, %conv1, !dbg !626
  store i32 %mul, i32* %s32Result, align 4, !dbg !627
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !628
  %conv2 = sext i16 %2 to i32, !dbg !628
  %cmp = icmp eq i32 %conv2, 0, !dbg !630
  br i1 %cmp, label %if.then, label %if.else7, !dbg !631

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !632
  %cmp4 = icmp slt i32 %3, 0, !dbg !635
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !636

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !637
  br label %return, !dbg !637

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !639
  br label %return, !dbg !639

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !641
  %5 = load i32, i32* %s32Result, align 4, !dbg !643
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !644
  %conv8 = sext i16 %6 to i32, !dbg !644
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !645
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !645
  %div = sdiv i32 %5, %conv8, !dbg !645, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !646
  %conv9 = sext i16 %7 to i32, !dbg !646
  %mul10 = mul nsw i32 %div, %conv9, !dbg !647
  %sub = sub nsw i32 %4, %mul10, !dbg !648
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !649
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !650
  %shl = shl i32 %8, 1, !dbg !651
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !652
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !653
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !654
  %conv11 = sext i16 %10 to i32, !dbg !654
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !655
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !655
  %div12 = sdiv i32 %9, %conv11, !dbg !655, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !656
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !657
  %conv13 = sext i16 %12 to i32, !dbg !657
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !658
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !658
  %div14 = sdiv i32 %11, %conv13, !dbg !658, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !659
  store i32 %add, i32* %s32Result, align 4, !dbg !660
  %13 = load i32, i32* %s32Result, align 4, !dbg !661
  %cmp15 = icmp slt i32 %13, 32767, !dbg !663
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !664

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !665
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !668
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !669

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !670
  %conv21 = trunc i32 %15 to i16, !dbg !672
  store i16 %conv21, i16* %retval, align 2, !dbg !673
  br label %return, !dbg !673

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !674
  br label %return, !dbg !674

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !676
  br label %return, !dbg !676

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !678
  ret i16 %16, !dbg !678
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !679 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !684, metadata !DIExpression()), !dbg !685
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !686, metadata !DIExpression()), !dbg !687
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !688, metadata !DIExpression()), !dbg !689
  store i32 0, i32* %s32Result, align 4, !dbg !689
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !690, metadata !DIExpression()), !dbg !691
  store i32 0, i32* %s32Temp1, align 4, !dbg !691
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !692
  %conv = zext i16 %0 to i32, !dbg !692
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !693
  %conv1 = sext i16 %1 to i32, !dbg !693
  %mul = mul nsw i32 %conv, %conv1, !dbg !694
  store i32 %mul, i32* %s32Result, align 4, !dbg !695
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !696
  %conv2 = zext i16 %2 to i32, !dbg !696
  %cmp = icmp eq i32 %conv2, 0, !dbg !698
  br i1 %cmp, label %if.then, label %if.else7, !dbg !699

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !700
  %cmp4 = icmp slt i32 %3, 0, !dbg !703
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !704

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !705
  br label %return, !dbg !705

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !707
  br label %return, !dbg !707

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !709
  %5 = load i32, i32* %s32Result, align 4, !dbg !711
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !712
  %conv8 = zext i16 %6 to i32, !dbg !712
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !713
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !713
  %div = sdiv i32 %5, %conv8, !dbg !713, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !714
  %conv9 = zext i16 %7 to i32, !dbg !714
  %mul10 = mul nsw i32 %div, %conv9, !dbg !715
  %sub = sub nsw i32 %4, %mul10, !dbg !716
  %shl = shl i32 %sub, 1, !dbg !717
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !718
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !719
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !720
  %conv11 = zext i16 %9 to i32, !dbg !720
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !721
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !721
  %div12 = sdiv i32 %8, %conv11, !dbg !721, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !722
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !723
  %conv13 = zext i16 %11 to i32, !dbg !723
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !724
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !724
  %div14 = sdiv i32 %10, %conv13, !dbg !724, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !725
  store i32 %add, i32* %s32Result, align 4, !dbg !726
  %12 = load i32, i32* %s32Result, align 4, !dbg !727
  %cmp15 = icmp slt i32 %12, 32767, !dbg !729
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !730

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !731
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !734
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !735

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !736
  %conv21 = trunc i32 %14 to i16, !dbg !738
  store i16 %conv21, i16* %retval, align 2, !dbg !739
  br label %return, !dbg !739

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !740
  br label %return, !dbg !740

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !742
  br label %return, !dbg !742

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !744
  ret i16 %15, !dbg !744
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !745 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !748, metadata !DIExpression()), !dbg !749
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !750, metadata !DIExpression()), !dbg !751
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !752, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !754, metadata !DIExpression()), !dbg !755
  store i32 0, i32* %u32Result, align 4, !dbg !755
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !756, metadata !DIExpression()), !dbg !757
  store i32 0, i32* %u32Temp1, align 4, !dbg !757
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !758, metadata !DIExpression()), !dbg !759
  store i32 0, i32* %s32Result, align 4, !dbg !759
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !760, metadata !DIExpression()), !dbg !761
  store i32 0, i32* %s32Temp1, align 4, !dbg !761
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !762
  %conv = sext i16 %0 to i32, !dbg !762
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !763
  %conv1 = zext i16 %1 to i32, !dbg !763
  %mul = mul nsw i32 %conv, %conv1, !dbg !764
  store i32 %mul, i32* %s32Result, align 4, !dbg !765
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !766
  %conv2 = sext i16 %2 to i32, !dbg !766
  %cmp = icmp eq i32 %conv2, 0, !dbg !768
  br i1 %cmp, label %if.then, label %if.else7, !dbg !769

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !770
  %cmp4 = icmp sge i32 %3, 0, !dbg !773
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !774

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !775
  br label %return, !dbg !775

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !777
  br label %return, !dbg !777

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !779
  %5 = load i32, i32* %s32Result, align 4, !dbg !781
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !782
  %conv8 = sext i16 %6 to i32, !dbg !782
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !783
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !783
  %div = sdiv i32 %5, %conv8, !dbg !783, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !784
  %conv9 = sext i16 %7 to i32, !dbg !784
  %mul10 = mul nsw i32 %div, %conv9, !dbg !785
  %sub = sub nsw i32 %4, %mul10, !dbg !786
  %shl = shl i32 %sub, 1, !dbg !787
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !788
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !789
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !790
  %conv11 = sext i16 %9 to i32, !dbg !790
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !791
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !791
  %div12 = sdiv i32 %8, %conv11, !dbg !791, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !792
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !793
  %conv13 = sext i16 %11 to i32, !dbg !793
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !794
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !794
  %div14 = sdiv i32 %10, %conv13, !dbg !794, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !795
  store i32 %add, i32* %s32Result, align 4, !dbg !796
  %12 = load i32, i32* %s32Result, align 4, !dbg !797
  %cmp15 = icmp slt i32 %12, 65535, !dbg !799
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !800

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !801
  %cmp18 = icmp sgt i32 %13, 0, !dbg !804
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !805

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !806
  %conv21 = trunc i32 %14 to i16, !dbg !808
  store i16 %conv21, i16* %retval, align 2, !dbg !809
  br label %return, !dbg !809

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !810
  br label %return, !dbg !810

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !812
  br label %return, !dbg !812

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !814
  ret i16 %15, !dbg !814
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !815 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !818, metadata !DIExpression()), !dbg !819
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !820, metadata !DIExpression()), !dbg !821
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !822, metadata !DIExpression()), !dbg !823
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !824, metadata !DIExpression()), !dbg !825
  store i32 0, i32* %s32Result, align 4, !dbg !825
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !826, metadata !DIExpression()), !dbg !827
  store i32 0, i32* %s32Temp1, align 4, !dbg !827
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !828
  %conv = sext i16 %0 to i32, !dbg !828
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !829
  %conv1 = zext i16 %1 to i32, !dbg !829
  %mul = mul nsw i32 %conv, %conv1, !dbg !830
  store i32 %mul, i32* %s32Result, align 4, !dbg !831
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !832
  %conv2 = zext i16 %2 to i32, !dbg !832
  %cmp = icmp eq i32 %conv2, 0, !dbg !834
  br i1 %cmp, label %if.then, label %if.else7, !dbg !835

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !836
  %cmp4 = icmp sge i32 %3, 0, !dbg !839
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !840

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !841
  br label %return, !dbg !841

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !843
  br label %return, !dbg !843

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !845
  %5 = load i32, i32* %s32Result, align 4, !dbg !847
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !848
  %conv8 = zext i16 %6 to i32, !dbg !848
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !849
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !849
  %div = sdiv i32 %5, %conv8, !dbg !849, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !850
  %conv9 = zext i16 %7 to i32, !dbg !850
  %mul10 = mul nsw i32 %div, %conv9, !dbg !851
  %sub = sub nsw i32 %4, %mul10, !dbg !852
  %shl = shl i32 %sub, 1, !dbg !853
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !854
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !855
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !856
  %conv11 = zext i16 %9 to i32, !dbg !856
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !857
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !857
  %div12 = sdiv i32 %8, %conv11, !dbg !857, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !858
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !859
  %conv13 = zext i16 %11 to i32, !dbg !859
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !860
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !860
  %div14 = sdiv i32 %10, %conv13, !dbg !860, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !861
  store i32 %add, i32* %s32Result, align 4, !dbg !862
  %12 = load i32, i32* %s32Result, align 4, !dbg !863
  %cmp15 = icmp slt i32 %12, 65535, !dbg !865
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !866

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !867
  %cmp18 = icmp sgt i32 %13, 0, !dbg !870
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !871

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !872
  %conv21 = trunc i32 %14 to i16, !dbg !874
  store i16 %conv21, i16* %retval, align 2, !dbg !875
  br label %return, !dbg !875

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !876
  br label %return, !dbg !876

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !878
  br label %return, !dbg !878

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !880
  ret i16 %15, !dbg !880
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !881 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !884, metadata !DIExpression()), !dbg !885
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !886, metadata !DIExpression()), !dbg !887
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !888, metadata !DIExpression()), !dbg !889
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !890, metadata !DIExpression()), !dbg !891
  store i32 0, i32* %u32Temp1, align 4, !dbg !891
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !892, metadata !DIExpression()), !dbg !893
  store i16 0, i16* %u16TempDenom, align 2, !dbg !893
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !894
  %conv = zext i16 %0 to i32, !dbg !894
  %cmp = icmp eq i32 %conv, 0, !dbg !896
  br i1 %cmp, label %if.then, label %if.else, !dbg !897

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !898
  br label %return, !dbg !898

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !900
  %conv2 = zext i16 %1 to i32, !dbg !900
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !902
  %conv3 = zext i16 %2 to i32, !dbg !902
  %mul = mul nsw i32 %conv2, %conv3, !dbg !903
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !904
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !905
  %conv4 = zext i16 %3 to i32, !dbg !905
  %shr = ashr i32 %conv4, 1, !dbg !906
  %conv5 = trunc i32 %shr to i16, !dbg !905
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !907
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !908
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !909
  %conv6 = zext i16 %5 to i32, !dbg !909
  %add = add i32 %4, %conv6, !dbg !910
  store i32 %add, i32* %u32Temp1, align 4, !dbg !911
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !912
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !913
  %conv7 = zext i16 %7 to i32, !dbg !913
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !914
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !914
  %div = udiv i32 %6, %conv7, !dbg !914, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !915
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !916
  %cmp8 = icmp ult i32 %8, 65535, !dbg !918
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !919

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !920
  %and = and i32 %9, 65535, !dbg !922
  %conv11 = trunc i32 %and to i16, !dbg !923
  store i16 %conv11, i16* %retval, align 2, !dbg !924
  br label %return, !dbg !924

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !925
  br label %return, !dbg !925

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !927
  ret i16 %10, !dbg !927
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !928 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !931, metadata !DIExpression()), !dbg !932
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !933, metadata !DIExpression()), !dbg !934
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !935, metadata !DIExpression()), !dbg !936
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !937, metadata !DIExpression()), !dbg !938
  store i32 0, i32* %u32Temp1, align 4, !dbg !938
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !939
  %cmp = icmp eq i32 %0, 0, !dbg !941
  br i1 %cmp, label %if.then, label %if.else, !dbg !942

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !943
  br label %return, !dbg !943

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !945
  %conv = zext i16 %1 to i32, !dbg !945
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !947
  %conv1 = zext i16 %2 to i32, !dbg !947
  %mul = mul nsw i32 %conv, %conv1, !dbg !948
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !949
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !950
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !950
  %div = udiv i32 %mul, %3, !dbg !950, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !951
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !952
  %conv2 = zext i16 %4 to i32, !dbg !952
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !954
  %conv3 = zext i16 %5 to i32, !dbg !954
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !955
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !956
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !957
  %mul5 = mul i32 %6, %7, !dbg !958
  %sub = sub i32 %mul4, %mul5, !dbg !959
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !960
  %div6 = udiv i32 %8, 2, !dbg !961
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !962
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !963

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !964
  %inc = add i32 %9, 1, !dbg !964
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !964
  br label %if.end, !dbg !966

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !967
  %cmp10 = icmp ult i32 %10, 65535, !dbg !969
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !970

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !971
  %and = and i32 %11, 65535, !dbg !973
  %conv13 = trunc i32 %and to i16, !dbg !974
  store i16 %conv13, i16* %retval, align 2, !dbg !975
  br label %return, !dbg !975

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !976
  br label %return, !dbg !976

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !978
  ret i16 %12, !dbg !978
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !979 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !982, metadata !DIExpression()), !dbg !983
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !984, metadata !DIExpression()), !dbg !985
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !986, metadata !DIExpression()), !dbg !987
  store i32 0, i32* %u32Temp1, align 4, !dbg !987
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !988
  %conv = zext i16 %0 to i32, !dbg !988
  %cmp = icmp eq i32 %conv, 0, !dbg !990
  br i1 %cmp, label %if.then, label %if.else, !dbg !991

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !992
  br label %return, !dbg !992

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !994
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !996
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !997
  %conv2 = zext i16 %3 to i32, !dbg !997
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !998
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !998
  %div = udiv i32 %2, %conv2, !dbg !998, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !999
  %conv3 = zext i16 %4 to i32, !dbg !999
  %mul = mul i32 %div, %conv3, !dbg !1000
  %sub = sub i32 %1, %mul, !dbg !1001
  %shl = shl i32 %sub, 1, !dbg !1002
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1003
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1004
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1005
  %conv4 = zext i16 %6 to i32, !dbg !1005
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1006
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1006
  %div5 = udiv i32 %5, %conv4, !dbg !1006, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1007
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1008
  %conv6 = zext i16 %8 to i32, !dbg !1008
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1009
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1009
  %div7 = udiv i32 %7, %conv6, !dbg !1009, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !1010
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1011
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1012
  store i32 %9, i32* %retval, align 4, !dbg !1013
  br label %return, !dbg !1013

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1014
  ret i32 %10, !dbg !1014
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1015 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1018, metadata !DIExpression()), !dbg !1019
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1020, metadata !DIExpression()), !dbg !1021
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1022, metadata !DIExpression()), !dbg !1023
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1024, metadata !DIExpression()), !dbg !1025
  store i32 0, i32* %s32Temp1, align 4, !dbg !1025
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1026, metadata !DIExpression()), !dbg !1027
  store i32 0, i32* %s32Temp2, align 4, !dbg !1027
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1028, metadata !DIExpression()), !dbg !1029
  store i32 0, i32* %s32Temp3, align 4, !dbg !1029
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1030
  %conv = sext i16 %0 to i32, !dbg !1030
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1031
  %conv1 = sext i16 %1 to i32, !dbg !1031
  %mul = mul nsw i32 %conv, %conv1, !dbg !1032
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1033
  %2 = load i16, i16* %div.addr, align 2, !dbg !1034
  %conv2 = sext i16 %2 to i32, !dbg !1034
  %cmp = icmp eq i32 %conv2, 0, !dbg !1036
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1037

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1038
  %cmp4 = icmp slt i32 %3, 0, !dbg !1041
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1042

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1043
  br label %return, !dbg !1043

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1045
  br label %return, !dbg !1045

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1047
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1049
  %6 = load i16, i16* %div.addr, align 2, !dbg !1050
  %conv8 = sext i16 %6 to i32, !dbg !1050
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1051
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1051
  %div9 = sdiv i32 %5, %conv8, !dbg !1051, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1052
  %conv10 = sext i16 %7 to i32, !dbg !1052
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1053
  %sub = sub nsw i32 %4, %mul11, !dbg !1054
  %shl = shl i32 %sub, 1, !dbg !1055
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1056
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1057
  %9 = load i16, i16* %div.addr, align 2, !dbg !1058
  %conv12 = sext i16 %9 to i32, !dbg !1058
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1059
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1059
  %div13 = sdiv i32 %8, %conv12, !dbg !1059, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1060
  %11 = load i16, i16* %div.addr, align 2, !dbg !1061
  %conv14 = sext i16 %11 to i32, !dbg !1061
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1062
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1062
  %div15 = sdiv i32 %10, %conv14, !dbg !1062, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1063
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1064
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1065
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1067
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1068

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1069
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1072
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1073

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1074
  %conv22 = trunc i32 %14 to i16, !dbg !1076
  store i16 %conv22, i16* %retval, align 2, !dbg !1077
  br label %return, !dbg !1077

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1078
  br label %return, !dbg !1078

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1080
  br label %return, !dbg !1080

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1082
  ret i16 %15, !dbg !1082
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1083 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1086, metadata !DIExpression()), !dbg !1087
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1088, metadata !DIExpression()), !dbg !1089
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1090, metadata !DIExpression()), !dbg !1091
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1092, metadata !DIExpression()), !dbg !1093
  store i32 0, i32* %s32Result, align 4, !dbg !1093
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1094, metadata !DIExpression()), !dbg !1095
  store i32 0, i32* %s32Temp1, align 4, !dbg !1095
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1096
  %conv = sext i16 %0 to i32, !dbg !1096
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1097
  %conv1 = sext i16 %1 to i32, !dbg !1097
  %mul = mul nsw i32 %conv, %conv1, !dbg !1098
  store i32 %mul, i32* %s32Result, align 4, !dbg !1099
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1100
  %conv2 = zext i16 %2 to i32, !dbg !1100
  %cmp = icmp eq i32 %conv2, 0, !dbg !1102
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1103

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1104
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1107
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1108

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1109
  br label %return, !dbg !1109

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1111
  %cmp7 = icmp eq i32 %4, 0, !dbg !1113
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1114

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1115
  br label %return, !dbg !1115

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1117
  br label %return, !dbg !1117

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1119
  %6 = load i32, i32* %s32Result, align 4, !dbg !1121
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1122
  %conv12 = zext i16 %7 to i32, !dbg !1122
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1123
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1123
  %div = sdiv i32 %6, %conv12, !dbg !1123, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1124
  %conv13 = zext i16 %8 to i32, !dbg !1124
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1125
  %sub = sub nsw i32 %5, %mul14, !dbg !1126
  %shl = shl i32 %sub, 1, !dbg !1127
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1128
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1129
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1130
  %conv15 = zext i16 %10 to i32, !dbg !1130
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1131
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1131
  %div16 = sdiv i32 %9, %conv15, !dbg !1131, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1132
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1133
  %conv17 = zext i16 %12 to i32, !dbg !1133
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1134
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1134
  %div18 = sdiv i32 %11, %conv17, !dbg !1134, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1135
  store i32 %add, i32* %s32Result, align 4, !dbg !1136
  %13 = load i32, i32* %s32Result, align 4, !dbg !1137
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1139
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1140

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1141
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1144
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1145

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1146
  %conv25 = trunc i32 %15 to i16, !dbg !1148
  store i16 %conv25, i16* %retval, align 2, !dbg !1149
  br label %return, !dbg !1149

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1150
  br label %return, !dbg !1150

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1152
  br label %return, !dbg !1152

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1154
  ret i16 %16, !dbg !1154
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1155 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1158, metadata !DIExpression()), !dbg !1159
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1160, metadata !DIExpression()), !dbg !1161
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1162, metadata !DIExpression()), !dbg !1163
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1164
  %cmp = icmp eq i32 %0, 0, !dbg !1166
  br i1 %cmp, label %if.then, label %if.else, !dbg !1167

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1168
  br label %return, !dbg !1168

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1170
  %cmp1 = icmp sle i32 %1, 0, !dbg !1173
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1174

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1175
  br label %return, !dbg !1175

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1177
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1179
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1180
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1181
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1181
  %div = udiv i32 %3, %4, !dbg !1181, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1182
  %mul = mul i32 %div, %5, !dbg !1183
  %sub = sub i32 %2, %mul, !dbg !1184
  %shl = shl i32 %sub, 1, !dbg !1185
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1186
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1187
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1188
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1189
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1189
  %div4 = udiv i32 %6, %7, !dbg !1189, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1190
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1191
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1192
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1192
  %div5 = udiv i32 %8, %9, !dbg !1192, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1193
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1194
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1195
  store i32 %10, i32* %retval, align 4, !dbg !1196
  br label %return, !dbg !1196

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1197
  ret i32 %11, !dbg !1197
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1198 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1201, metadata !DIExpression()), !dbg !1202
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1203, metadata !DIExpression()), !dbg !1204
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1205, metadata !DIExpression()), !dbg !1206
  store i32 0, i32* %s32Temp1, align 4, !dbg !1206
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1207
  %cmp = icmp eq i32 %0, 0, !dbg !1209
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1210

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1211
  %cmp1 = icmp sge i32 %1, 0, !dbg !1214
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1215

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1216
  br label %return, !dbg !1216

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1218
  br label %return, !dbg !1218

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1220
  %cmp4 = icmp sge i32 %2, 0, !dbg !1223
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1224

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1225
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1227
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1228
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1229
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1229
  %div = udiv i32 %4, %5, !dbg !1229, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1230
  %mul = mul i32 %div, %6, !dbg !1231
  %sub = sub i32 %3, %mul, !dbg !1232
  %shl = shl i32 %sub, 1, !dbg !1233
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1234
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1235
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1236
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1237
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1237
  %div6 = udiv i32 %7, %8, !dbg !1237, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1238
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1239
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1240
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1240
  %div7 = udiv i32 %9, %10, !dbg !1240, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1241
  store i32 %add, i32* %retval, align 4, !dbg !1242
  br label %return, !dbg !1242

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1243
  br label %return, !dbg !1243

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1245
  ret i32 %11, !dbg !1245
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1246 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1249, metadata !DIExpression()), !dbg !1250
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1251, metadata !DIExpression()), !dbg !1252
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1253, metadata !DIExpression()), !dbg !1254
  store i32 0, i32* %u32Temp1, align 4, !dbg !1254
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1255, metadata !DIExpression()), !dbg !1256
  store i32 0, i32* %u32Temp2, align 4, !dbg !1256
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1257
  %cmp = icmp eq i32 %0, 0, !dbg !1259
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1260

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1261
  %cmp1 = icmp slt i32 %1, 0, !dbg !1264
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1265

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1268
  br label %return, !dbg !1268

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1270
  %cmp4 = icmp sge i32 %2, 0, !dbg !1273
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1274

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1275
  %cmp6 = icmp eq i32 %3, 0, !dbg !1278
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1279

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1280
  br label %return, !dbg !1280

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1282
  %cmp9 = icmp sle i32 %4, 0, !dbg !1285
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1286

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1287
  br label %return, !dbg !1287

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1289
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1291
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1292
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1293
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1293
  %div = sdiv i32 %6, %7, !dbg !1293, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1294
  %mul = mul nsw i32 %div, %8, !dbg !1295
  %sub = sub nsw i32 %5, %mul, !dbg !1296
  %shl = shl i32 %sub, 1, !dbg !1297
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1298
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1299
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1300
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1301
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1301
  %div12 = udiv i32 %9, %10, !dbg !1301, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1302
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1303
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1304
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1304
  %div13 = sdiv i32 %11, %12, !dbg !1304, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1305
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1306
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1307
  store i32 %13, i32* %retval, align 4, !dbg !1308
  br label %return, !dbg !1308

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1309
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1312
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1313

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1314
  br label %return, !dbg !1314

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1316
  %sub18 = sub nsw i32 0, %15, !dbg !1318
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1319
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1320
  %sub19 = sub nsw i32 0, %16, !dbg !1321
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1322
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1323
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1324
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1325
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1326
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1326
  %div20 = sdiv i32 %18, %19, !dbg !1326, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %mul21 = mul nsw i32 %div20, %20, !dbg !1328
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1329
  %shl23 = shl i32 %sub22, 1, !dbg !1330
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1331
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1332
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1334
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1334
  %div24 = udiv i32 %21, %22, !dbg !1334, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1335
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1336
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1337
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1337
  %div25 = sdiv i32 %23, %24, !dbg !1337, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1338
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1339
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1340
  store i32 %25, i32* %retval, align 4, !dbg !1341
  br label %return, !dbg !1341

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1342
  ret i32 %26, !dbg !1342
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1343 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1346, metadata !DIExpression()), !dbg !1347
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1348, metadata !DIExpression()), !dbg !1349
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1350, metadata !DIExpression()), !dbg !1351
  store i32 0, i32* %u32Temp1, align 4, !dbg !1351
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1352, metadata !DIExpression()), !dbg !1353
  store i32 0, i32* %u32Temp2, align 4, !dbg !1353
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1354, metadata !DIExpression()), !dbg !1355
  store i32 0, i32* %u32Temp3, align 4, !dbg !1355
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1356, metadata !DIExpression()), !dbg !1357
  store i32 0, i32* %numerator_old, align 4, !dbg !1357
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1358
  %cmp = icmp eq i32 %0, 0, !dbg !1360
  br i1 %cmp, label %if.then, label %if.else, !dbg !1361

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1362
  br label %return, !dbg !1362

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1364
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1366
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1367
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1368
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1369
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1369
  %div = udiv i32 %3, %4, !dbg !1369, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1370
  %sub = sub i32 %1, %mul, !dbg !1371
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1372
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1373
  %and = and i32 %5, 1, !dbg !1375
  %cmp1 = icmp eq i32 %and, 0, !dbg !1376
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1377

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1378
  %shr = lshr i32 %6, 1, !dbg !1380
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1381
  br label %if.end, !dbg !1382

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1383
  %shr4 = lshr i32 %7, 1, !dbg !1385
  %add = add i32 %shr4, 1, !dbg !1386
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1387
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1388
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1390
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1391
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1392

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1393
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1395
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1396
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1396
  %div7 = udiv i32 %10, %11, !dbg !1396, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1397
  br label %return, !dbg !1397

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1398
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1400
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1401
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1401
  %div9 = udiv i32 %12, %13, !dbg !1401, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1402
  store i32 %add10, i32* %retval, align 4, !dbg !1403
  br label %return, !dbg !1403

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1404
  ret i32 %14, !dbg !1404
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1405 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1408, metadata !DIExpression()), !dbg !1409
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1410, metadata !DIExpression()), !dbg !1411
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1412, metadata !DIExpression()), !dbg !1413
  store i32 0, i32* %u32Temp1, align 4, !dbg !1413
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1414, metadata !DIExpression()), !dbg !1415
  store i32 0, i32* %u32Temp2, align 4, !dbg !1415
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1416
  %cmp = icmp sle i32 %0, 0, !dbg !1418
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1419

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1420
  %cmp1 = icmp sge i32 %1, 0, !dbg !1423
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1424

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1425
  br label %return, !dbg !1425

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1427
  %sub = sub nsw i32 0, %2, !dbg !1429
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1430
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1431
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1432
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1433
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1434
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1434
  %div = udiv i32 %4, %5, !dbg !1434, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1435
  %mul = mul i32 %div, %6, !dbg !1436
  %sub3 = sub i32 %3, %mul, !dbg !1437
  %shl = shl i32 %sub3, 1, !dbg !1438
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1439
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1440
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1441
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1442
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1442
  %div4 = udiv i32 %7, %8, !dbg !1442, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1443
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1444
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1445
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1445
  %div5 = udiv i32 %9, %10, !dbg !1445, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1446
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1447
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1448
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1450
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1451

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1452
  %sub8 = sub i32 0, %12, !dbg !1454
  store i32 %sub8, i32* %retval, align 4, !dbg !1455
  br label %return, !dbg !1455

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1456
  br label %return, !dbg !1456

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1458
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1460
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1461
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1462
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1462
  %div11 = udiv i32 %14, %15, !dbg !1462, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1463
  %mul12 = mul i32 %div11, %16, !dbg !1464
  %sub13 = sub i32 %13, %mul12, !dbg !1465
  %shl14 = shl i32 %sub13, 1, !dbg !1466
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1467
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1468
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1469
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1470
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1470
  %div15 = udiv i32 %17, %18, !dbg !1470, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1471
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1472
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1473
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1473
  %div16 = udiv i32 %19, %20, !dbg !1473, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1474
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1475
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1476
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1478
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1479

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1480
  store i32 %22, i32* %retval, align 4, !dbg !1482
  br label %return, !dbg !1482

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1483
  br label %return, !dbg !1483

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1485
  ret i32 %23, !dbg !1485
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1486 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1489, metadata !DIExpression()), !dbg !1490
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1491, metadata !DIExpression()), !dbg !1492
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1493, metadata !DIExpression()), !dbg !1494
  store i32 0, i32* %s32Temp1, align 4, !dbg !1494
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1495, metadata !DIExpression()), !dbg !1496
  store i32 0, i32* %s32Temp2, align 4, !dbg !1496
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1497, metadata !DIExpression()), !dbg !1498
  store i32 0, i32* %u32Temp0, align 4, !dbg !1498
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1499, metadata !DIExpression()), !dbg !1500
  store i32 0, i32* %u32Temp1, align 4, !dbg !1500
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1501, metadata !DIExpression()), !dbg !1502
  store i32 0, i32* %u32Temp2, align 4, !dbg !1502
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1503
  %cmp = icmp eq i32 %0, 0, !dbg !1505
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1506

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1507
  %cmp1 = icmp slt i32 %1, 0, !dbg !1510
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1511

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1512
  br label %return, !dbg !1512

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1514
  br label %return, !dbg !1514

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1516
  %cmp4 = icmp sle i32 %2, 0, !dbg !1519
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1520

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1521
  %sub = sub nsw i32 0, %3, !dbg !1523
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1524
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1525
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1526
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1527
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1527
  %div = udiv i32 %4, %5, !dbg !1527, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1528
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1529
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1530
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1531
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1532
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1532
  %div6 = udiv i32 %7, %8, !dbg !1532, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1533
  %mul = mul i32 %div6, %9, !dbg !1534
  %sub7 = sub i32 %6, %mul, !dbg !1535
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1536
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1537
  %and = and i32 %10, 1, !dbg !1539
  %cmp8 = icmp eq i32 %and, 0, !dbg !1540
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1541

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1542
  %shr = lshr i32 %11, 1, !dbg !1544
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1545
  br label %if.end, !dbg !1546

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1547
  %shr11 = lshr i32 %12, 1, !dbg !1549
  %add = add i32 %shr11, 1, !dbg !1550
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1551
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1552
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1554
  %cmp12 = icmp ult i32 %13, %14, !dbg !1555
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1556

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1557
  %neg = xor i32 %15, -1, !dbg !1559
  %add14 = add i32 %neg, 1, !dbg !1560
  store i32 %add14, i32* %retval, align 4, !dbg !1561
  br label %return, !dbg !1561

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1562
  %add16 = add i32 %16, 1, !dbg !1564
  %neg17 = xor i32 %add16, -1, !dbg !1565
  %add18 = add i32 %neg17, 1, !dbg !1566
  store i32 %add18, i32* %retval, align 4, !dbg !1567
  br label %return, !dbg !1567

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1568
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1570
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1572
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1572
  %div20 = udiv i32 %18, %19, !dbg !1572, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1573
  %mul21 = mul i32 %div20, %20, !dbg !1574
  %sub22 = sub i32 %17, %mul21, !dbg !1575
  %shl = shl i32 %sub22, 1, !dbg !1576
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1577
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1578
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1579
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1580
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1580
  %div23 = udiv i32 %21, %22, !dbg !1580, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1581
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1582
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1583
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1583
  %div24 = udiv i32 %23, %24, !dbg !1583, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1584
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1585
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1586
  store i32 %25, i32* %retval, align 4, !dbg !1587
  br label %return, !dbg !1587

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1588
  ret i32 %26, !dbg !1588
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1589 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1592, metadata !DIExpression()), !dbg !1593
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1594, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1596, metadata !DIExpression()), !dbg !1597
  store i32 0, i32* %s32Temp1, align 4, !dbg !1597
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1598, metadata !DIExpression()), !dbg !1599
  store i32 0, i32* %s32Temp2, align 4, !dbg !1599
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1600, metadata !DIExpression()), !dbg !1601
  store i32 0, i32* %denominator_prime, align 4, !dbg !1601
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1602, metadata !DIExpression()), !dbg !1603
  store i32 0, i32* %u32Temp1, align 4, !dbg !1603
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1604, metadata !DIExpression()), !dbg !1605
  store i32 0, i32* %u32Temp2, align 4, !dbg !1605
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1606, metadata !DIExpression()), !dbg !1607
  store i32 0, i32* %u32numerator, align 4, !dbg !1607
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1608, metadata !DIExpression()), !dbg !1609
  store i32 0, i32* %u32denominator, align 4, !dbg !1609
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1610
  %cmp = icmp slt i32 %0, 0, !dbg !1612
  br i1 %cmp, label %if.then, label %if.else28, !dbg !1613

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1614
  %cmp1 = icmp sle i32 %1, 0, !dbg !1617
  br i1 %cmp1, label %if.then2, label %if.else19, !dbg !1618

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1619
  %cmp3 = icmp sge i32 %2, 0, !dbg !1622
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1623

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1624
  br label %return, !dbg !1624

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1626
  %conv = sext i32 %3 to i64, !dbg !1629
  %call = call i32 @klee_alarm_s32_neg_valid(i64 %conv), !dbg !1630
  %tobool = icmp ne i32 %call, 0, !dbg !1630
  br i1 %tobool, label %if.end, label %if.then5, !dbg !1631

if.then5:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1632
  br label %return, !dbg !1632

if.end:                                           ; preds = %if.else
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1634
  %sub = sub nsw i32 0, %4, !dbg !1635
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1636
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1637
  %conv6 = sext i32 %5 to i64, !dbg !1639
  %call7 = call i32 @klee_alarm_s32_neg_valid(i64 %conv6), !dbg !1640
  %tobool8 = icmp ne i32 %call7, 0, !dbg !1640
  br i1 %tobool8, label %if.end10, label %if.then9, !dbg !1641

if.then9:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !1642
  br label %return, !dbg !1642

if.end10:                                         ; preds = %if.end
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1644
  %sub11 = sub nsw i32 0, %6, !dbg !1645
  store i32 %sub11, i32* %u32denominator, align 4, !dbg !1646
  %7 = load i32, i32* %u32numerator, align 4, !dbg !1647
  %8 = load i32, i32* %u32numerator, align 4, !dbg !1648
  %9 = load i32, i32* %u32denominator, align 4, !dbg !1649
  %int_cast_to_i64 = zext i32 %9 to i64, !dbg !1650
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1650
  %div = udiv i32 %8, %9, !dbg !1650, !klee.check.div !101
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1651
  %mul = mul i32 %div, %10, !dbg !1652
  %sub12 = sub i32 %7, %mul, !dbg !1653
  %shl = shl i32 %sub12, 1, !dbg !1654
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1655
  %11 = load i32, i32* %u32numerator, align 4, !dbg !1656
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1657
  %int_cast_to_i641 = zext i32 %12 to i64, !dbg !1658
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1658
  %div13 = udiv i32 %11, %12, !dbg !1658, !klee.check.div !101
  %13 = load i32, i32* %u32Temp1, align 4, !dbg !1659
  %14 = load i32, i32* %u32denominator, align 4, !dbg !1660
  %int_cast_to_i642 = zext i32 %14 to i64, !dbg !1661
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1661
  %div14 = udiv i32 %13, %14, !dbg !1661, !klee.check.div !101
  %add = add i32 %div13, %div14, !dbg !1662
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1663
  %15 = load i32, i32* %u32Temp2, align 4, !dbg !1664
  %cmp15 = icmp ule i32 %15, 2147483647, !dbg !1666
  br i1 %cmp15, label %if.then17, label %if.else18, !dbg !1667

if.then17:                                        ; preds = %if.end10
  %16 = load i32, i32* %u32Temp2, align 4, !dbg !1668
  store i32 %16, i32* %retval, align 4, !dbg !1670
  br label %return, !dbg !1670

if.else18:                                        ; preds = %if.end10
  store i32 2147483647, i32* %retval, align 4, !dbg !1671
  br label %return, !dbg !1671

if.else19:                                        ; preds = %if.then
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1673
  %neg = xor i32 %17, -1, !dbg !1676
  %conv20 = sext i32 %neg to i64, !dbg !1677
  %call21 = call i32 @klee_alarm_s32_add_upper(i64 %conv20, i64 1), !dbg !1678
  %tobool22 = icmp ne i32 %call21, 0, !dbg !1678
  br i1 %tobool22, label %if.end24, label %if.then23, !dbg !1679

if.then23:                                        ; preds = %if.else19
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 1422, i8* getelementptr inbounds ([78 x i8], [78 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !1680
  unreachable, !dbg !1680

if.end24:                                         ; preds = %if.else19
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1682
  %neg25 = xor i32 %18, -1, !dbg !1683
  %add26 = add nsw i32 %neg25, 1, !dbg !1684
  %conv27 = sext i32 %add26 to i64, !dbg !1685
  store volatile i64 %conv27, i64* @klee_alarm_sink_s64, align 8, !dbg !1686
  store i32 0, i32* %retval, align 4, !dbg !1687
  br label %return, !dbg !1687

if.else28:                                        ; preds = %entry
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1688
  %cmp29 = icmp sle i32 %19, 0, !dbg !1691
  br i1 %cmp29, label %if.then31, label %if.else47, !dbg !1692

if.then31:                                        ; preds = %if.else28
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1693
  %cmp32 = icmp sge i32 %20, 0, !dbg !1696
  br i1 %cmp32, label %if.then34, label %if.else35, !dbg !1697

if.then34:                                        ; preds = %if.then31
  store i32 2147483647, i32* %retval, align 4, !dbg !1698
  br label %return, !dbg !1698

if.else35:                                        ; preds = %if.then31
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1700
  %neg36 = xor i32 %21, -1, !dbg !1702
  %add37 = add nsw i32 %neg36, 1, !dbg !1703
  store i32 %add37, i32* %u32denominator, align 4, !dbg !1704
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1705
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1706
  %24 = load i32, i32* %u32denominator, align 4, !dbg !1707
  %int_cast_to_i643 = zext i32 %24 to i64, !dbg !1708
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1708
  %div38 = udiv i32 %23, %24, !dbg !1708, !klee.check.div !101
  %25 = load i32, i32* %u32denominator, align 4, !dbg !1709
  %mul39 = mul i32 %div38, %25, !dbg !1710
  %sub40 = sub i32 %22, %mul39, !dbg !1711
  %shl41 = shl i32 %sub40, 1, !dbg !1712
  store i32 %shl41, i32* %s32Temp1, align 4, !dbg !1713
  %26 = load i32, i32* %numerator.addr, align 4, !dbg !1714
  %27 = load i32, i32* %u32denominator, align 4, !dbg !1715
  %int_cast_to_i644 = zext i32 %27 to i64, !dbg !1716
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1716
  %div42 = udiv i32 %26, %27, !dbg !1716, !klee.check.div !101
  %28 = load i32, i32* %s32Temp1, align 4, !dbg !1717
  %29 = load i32, i32* %u32denominator, align 4, !dbg !1718
  %int_cast_to_i645 = zext i32 %29 to i64, !dbg !1719
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1719
  %div43 = udiv i32 %28, %29, !dbg !1719, !klee.check.div !101
  %add44 = add i32 %div42, %div43, !dbg !1720
  store i32 %add44, i32* %s32Temp2, align 4, !dbg !1721
  %30 = load i32, i32* %s32Temp2, align 4, !dbg !1722
  %neg45 = xor i32 %30, -1, !dbg !1723
  %add46 = add nsw i32 %neg45, 1, !dbg !1724
  store i32 %add46, i32* %retval, align 4, !dbg !1725
  br label %return, !dbg !1725

if.else47:                                        ; preds = %if.else28
  %31 = load i32, i32* %numerator.addr, align 4, !dbg !1726
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1728
  %33 = load i32, i32* %denominator.addr, align 4, !dbg !1729
  %int_cast_to_i646 = zext i32 %33 to i64, !dbg !1730
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1730
  %div48 = sdiv i32 %32, %33, !dbg !1730, !klee.check.div !101
  %34 = load i32, i32* %denominator.addr, align 4, !dbg !1731
  %mul49 = mul nsw i32 %div48, %34, !dbg !1732
  %sub50 = sub nsw i32 %31, %mul49, !dbg !1733
  %shl51 = shl i32 %sub50, 1, !dbg !1734
  store i32 %shl51, i32* %u32Temp1, align 4, !dbg !1735
  %35 = load i32, i32* %numerator.addr, align 4, !dbg !1736
  %36 = load i32, i32* %denominator.addr, align 4, !dbg !1737
  %int_cast_to_i647 = zext i32 %36 to i64, !dbg !1738
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1738
  %div52 = sdiv i32 %35, %36, !dbg !1738, !klee.check.div !101
  %37 = load i32, i32* %u32Temp1, align 4, !dbg !1739
  %38 = load i32, i32* %denominator.addr, align 4, !dbg !1740
  %int_cast_to_i648 = zext i32 %38 to i64, !dbg !1741
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1741
  %div53 = udiv i32 %37, %38, !dbg !1741, !klee.check.div !101
  %add54 = add i32 %div52, %div53, !dbg !1742
  store i32 %add54, i32* %s32Temp2, align 4, !dbg !1743
  %39 = load i32, i32* %s32Temp2, align 4, !dbg !1744
  store i32 %39, i32* %retval, align 4, !dbg !1745
  br label %return, !dbg !1745

return:                                           ; preds = %if.else47, %if.else35, %if.then34, %if.end24, %if.else18, %if.then17, %if.then9, %if.then5, %if.then4
  %40 = load i32, i32* %retval, align 4, !dbg !1746
  ret i32 %40, !dbg !1746
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_neg_valid(i64 %value) #0 !dbg !1747 {
entry:
  %value.addr = alloca i64, align 8
  store i64 %value, i64* %value.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %value.addr, metadata !1750, metadata !DIExpression()), !dbg !1751
  %0 = load i64, i64* %value.addr, align 8, !dbg !1752
  %cmp = icmp ne i64 %0, -2147483648, !dbg !1753
  %conv = zext i1 %cmp to i32, !dbg !1753
  ret i32 %conv, !dbg !1754
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_add_upper(i64 %left, i64 %right) #0 !dbg !1755 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !1758, metadata !DIExpression()), !dbg !1759
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !1760, metadata !DIExpression()), !dbg !1761
  %0 = load i64, i64* %left.addr, align 8, !dbg !1762
  %1 = load i64, i64* %right.addr, align 8, !dbg !1763
  %add = add nsw i64 %0, %1, !dbg !1764
  %cmp = icmp sle i64 %add, 2147483647, !dbg !1765
  %conv = zext i1 %cmp to i32, !dbg !1765
  ret i32 %conv, !dbg !1766
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1767 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1770, metadata !DIExpression()), !dbg !1771
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1772, metadata !DIExpression()), !dbg !1773
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1774, metadata !DIExpression()), !dbg !1775
  store i32 0, i32* %numerator_prime, align 4, !dbg !1775
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1776, metadata !DIExpression()), !dbg !1777
  store i32 0, i32* %u32Temp1, align 4, !dbg !1777
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1778, metadata !DIExpression()), !dbg !1779
  store i32 0, i32* %u32Temp2, align 4, !dbg !1779
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1780, metadata !DIExpression()), !dbg !1781
  store i32 0, i32* %u32Temp3, align 4, !dbg !1781
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1782, metadata !DIExpression()), !dbg !1783
  store i32 0, i32* %s32Temp1, align 4, !dbg !1783
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1784, metadata !DIExpression()), !dbg !1785
  store i32 0, i32* %s32Temp2, align 4, !dbg !1785
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1786, metadata !DIExpression()), !dbg !1787
  store i32 0, i32* %s32Temp3, align 4, !dbg !1787
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1788
  %cmp = icmp eq i32 %0, 0, !dbg !1790
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1791

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1792
  %cmp1 = icmp slt i32 %1, 0, !dbg !1795
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1796

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1797
  br label %return, !dbg !1797

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1799
  br label %return, !dbg !1799

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1801
  %cmp4 = icmp slt i32 %2, 0, !dbg !1804
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1805

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1806
  %sub = sub nsw i32 0, %3, !dbg !1808
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1809
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1810
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1811
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1812
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1812
  %div = udiv i32 %4, %5, !dbg !1812, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1813
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1814
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1815
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1816
  %mul = mul i32 %7, %8, !dbg !1817
  %sub6 = sub i32 %6, %mul, !dbg !1818
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1819
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1820
  %and = and i32 %9, 1, !dbg !1822
  %cmp7 = icmp eq i32 %and, 0, !dbg !1823
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1824

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1825
  %shr = lshr i32 %10, 1, !dbg !1827
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1828
  br label %if.end, !dbg !1829

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1830
  %shr10 = lshr i32 %11, 1, !dbg !1832
  %add = add i32 %shr10, 1, !dbg !1833
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1834
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1835
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1837
  %cmp11 = icmp ult i32 %12, %13, !dbg !1838
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1839

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1840
  %neg = xor i32 %14, -1, !dbg !1842
  %add13 = add i32 %neg, 1, !dbg !1843
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1844
  br label %if.end18, !dbg !1845

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1846
  %add15 = add i32 %15, 1, !dbg !1848
  %neg16 = xor i32 %add15, -1, !dbg !1849
  %add17 = add i32 %neg16, 1, !dbg !1850
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1851
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1852
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1854
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1855

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1856
  %conv = trunc i32 %17 to i16, !dbg !1858
  store i16 %conv, i16* %retval, align 2, !dbg !1859
  br label %return, !dbg !1859

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1860
  br label %return, !dbg !1860

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1862
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1864
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1865
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1865
  %div23 = udiv i32 %18, %19, !dbg !1865, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1866
  %mul24 = mul i32 %div23, %20, !dbg !1867
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1868
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1869
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1870
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1871
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1872
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1872
  %div25 = udiv i32 %22, %23, !dbg !1872, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1873
  %mul26 = mul i32 %div25, %24, !dbg !1874
  %sub27 = sub i32 %21, %mul26, !dbg !1875
  %shl = shl i32 %sub27, 1, !dbg !1876
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1877
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1878
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1879
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1880
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1880
  %div28 = udiv i32 %25, %26, !dbg !1880, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1881
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1882
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1883
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1883
  %div29 = udiv i32 %27, %28, !dbg !1883, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1884
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1885
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1886
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1888
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1889

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1890
  %conv34 = trunc i32 %30 to i16, !dbg !1892
  store i16 %conv34, i16* %retval, align 2, !dbg !1893
  br label %return, !dbg !1893

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1894
  br label %return, !dbg !1894

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1896
  ret i16 %31, !dbg !1896
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1897 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1903, metadata !DIExpression()), !dbg !1904
  %2 = icmp eq i64 %0, 0, !dbg !1905
  br i1 %2, label %3, label %4, !dbg !1907

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1908
  unreachable, !dbg !1908

4:                                                ; preds = %1
  ret void, !dbg !1909
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

!llvm.dbg.cu = !{!32, !2, !34}
!llvm.ident = !{!36, !36, !37}
!llvm.module.flags = !{!38, !39, !40, !41, !42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "klee_alarm_sink_s64", scope: !2, file: !30, line: 21, type: !31, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !29, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/div_Ccode_alarm_0097.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!4 = !{}
!5 = !{!6, !13, !18, !22, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !9, line: 25, baseType: !10)
!9 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !11, line: 39, baseType: !12)
!11 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!12 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "u8", file: !7, line: 6, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !15, line: 24, baseType: !16)
!15 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 38, baseType: !17)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !15, line: 25, baseType: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !21)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !24)
!24 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !28)
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !22)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!34 = distinct !DICompileUnit(language: DW_LANG_C89, file: !35, producer: "Ubuntu clang version 13.0.1-2ubuntu2.2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!35 = !DIFile(filename: "/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee/build/runtime/Intrinsic")
!36 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)"}
!37 = !{!"Ubuntu clang version 13.0.1-2ubuntu2.2"}
!38 = !{i32 7, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 3}
!40 = !{i32 1, !"wchar_size", i32 4}
!41 = !{i32 7, !"uwtable", i32 1}
!42 = !{i32 7, !"frame-pointer", i32 2}
!43 = distinct !DISubprogram(name: "main", scope: !44, file: !44, line: 7, type: !45, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !32, retainedNodes: !4)
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!45 = !DISubroutineType(types: !46)
!46 = !{!28}
!47 = !DILocalVariable(name: "numerator", scope: !43, file: !44, line: 9, type: !26)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "denominator", scope: !43, file: !44, line: 10, type: !26)
!50 = !DILocation(line: 10, column: 13, scope: !43)
!51 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 11, type: !26)
!52 = !DILocation(line: 11, column: 13, scope: !43)
!53 = !DILocation(line: 13, column: 24, scope: !43)
!54 = !DILocation(line: 13, column: 5, scope: !43)
!55 = !DILocation(line: 14, column: 24, scope: !43)
!56 = !DILocation(line: 14, column: 5, scope: !43)
!57 = !DILocation(line: 16, column: 30, scope: !43)
!58 = !DILocation(line: 16, column: 41, scope: !43)
!59 = !DILocation(line: 16, column: 14, scope: !43)
!60 = !DILocation(line: 16, column: 12, scope: !43)
!61 = !DILocation(line: 18, column: 11, scope: !43)
!62 = !DILocation(line: 19, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !64, file: !64, line: 170, type: !65, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/s32_div_s32_s32/alarm_0097")
!65 = !DISubroutineType(types: !66)
!66 = !{!6, !6, !6}
!67 = !DILocalVariable(name: "numerator", arg: 1, scope: !63, file: !64, line: 170, type: !6)
!68 = !DILocation(line: 170, column: 31, scope: !63)
!69 = !DILocalVariable(name: "denominator", arg: 2, scope: !63, file: !64, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 47, scope: !63)
!71 = !DILocalVariable(name: "s32Temp1", scope: !63, file: !64, line: 172, type: !25)
!72 = !DILocation(line: 172, column: 6, scope: !63)
!73 = !DILocalVariable(name: "s32Temp2", scope: !63, file: !64, line: 172, type: !25)
!74 = !DILocation(line: 172, column: 15, scope: !63)
!75 = !DILocation(line: 173, column: 13, scope: !63)
!76 = !DILocation(line: 173, column: 22, scope: !63)
!77 = !DILocation(line: 173, column: 11, scope: !63)
!78 = !DILocation(line: 175, column: 6, scope: !79)
!79 = distinct !DILexicalBlock(scope: !63, file: !64, line: 175, column: 6)
!80 = !DILocation(line: 175, column: 18, scope: !79)
!81 = !DILocation(line: 175, column: 6, scope: !63)
!82 = !DILocation(line: 177, column: 7, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !64, line: 177, column: 7)
!84 = distinct !DILexicalBlock(scope: !79, file: !64, line: 176, column: 2)
!85 = !DILocation(line: 177, column: 17, scope: !83)
!86 = !DILocation(line: 177, column: 7, scope: !84)
!87 = !DILocation(line: 179, column: 4, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !64, line: 178, column: 3)
!89 = !DILocation(line: 183, column: 4, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !64, line: 182, column: 3)
!91 = !DILocation(line: 188, column: 7, scope: !92)
!92 = distinct !DILexicalBlock(scope: !93, file: !64, line: 188, column: 7)
!93 = distinct !DILexicalBlock(scope: !79, file: !64, line: 187, column: 2)
!94 = !DILocation(line: 188, column: 16, scope: !92)
!95 = !DILocation(line: 188, column: 7, scope: !93)
!96 = !DILocation(line: 190, column: 16, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !64, line: 189, column: 3)
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
!119 = distinct !DILexicalBlock(scope: !97, file: !64, line: 193, column: 7)
!120 = !DILocation(line: 193, column: 16, scope: !119)
!121 = !DILocation(line: 193, column: 7, scope: !97)
!122 = !DILocation(line: 195, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !64, line: 195, column: 8)
!124 = distinct !DILexicalBlock(scope: !119, file: !64, line: 194, column: 4)
!125 = !DILocation(line: 195, column: 17, scope: !123)
!126 = !DILocation(line: 195, column: 8, scope: !124)
!127 = !DILocation(line: 197, column: 18, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !64, line: 196, column: 5)
!129 = !DILocation(line: 197, column: 13, scope: !128)
!130 = !DILocation(line: 197, column: 6, scope: !128)
!131 = !DILocation(line: 201, column: 6, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !64, line: 200, column: 5)
!133 = !DILocation(line: 206, column: 5, scope: !134)
!134 = distinct !DILexicalBlock(scope: !119, file: !64, line: 205, column: 4)
!135 = !DILocation(line: 211, column: 7, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !64, line: 211, column: 7)
!137 = distinct !DILexicalBlock(scope: !92, file: !64, line: 210, column: 3)
!138 = !DILocation(line: 211, column: 19, scope: !136)
!139 = !DILocation(line: 211, column: 7, scope: !137)
!140 = !DILocation(line: 213, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !64, line: 212, column: 4)
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
!162 = distinct !DILexicalBlock(scope: !141, file: !64, line: 216, column: 8)
!163 = !DILocation(line: 216, column: 17, scope: !162)
!164 = !DILocation(line: 216, column: 8, scope: !141)
!165 = !DILocation(line: 218, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !167, file: !64, line: 218, column: 9)
!167 = distinct !DILexicalBlock(scope: !162, file: !64, line: 217, column: 5)
!168 = !DILocation(line: 218, column: 18, scope: !166)
!169 = !DILocation(line: 218, column: 9, scope: !167)
!170 = !DILocation(line: 220, column: 19, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !64, line: 219, column: 6)
!172 = !DILocation(line: 220, column: 14, scope: !171)
!173 = !DILocation(line: 220, column: 7, scope: !171)
!174 = !DILocation(line: 224, column: 7, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !64, line: 223, column: 6)
!176 = !DILocation(line: 229, column: 6, scope: !177)
!177 = distinct !DILexicalBlock(scope: !162, file: !64, line: 228, column: 5)
!178 = !DILocation(line: 234, column: 5, scope: !179)
!179 = distinct !DILexicalBlock(scope: !136, file: !64, line: 233, column: 4)
!180 = !DILocation(line: 238, column: 1, scope: !63)
!181 = distinct !DISubprogram(name: "s16_div_s32_s16", scope: !64, file: !64, line: 255, type: !182, scopeLine: 256, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DISubroutineType(types: !183)
!183 = !{!6, !25, !6}
!184 = !DILocalVariable(name: "numerator", arg: 1, scope: !181, file: !64, line: 255, type: !25)
!185 = !DILocation(line: 255, column: 25, scope: !181)
!186 = !DILocalVariable(name: "denominator", arg: 2, scope: !181, file: !64, line: 255, type: !6)
!187 = !DILocation(line: 255, column: 41, scope: !181)
!188 = !DILocalVariable(name: "s32Temp1", scope: !181, file: !64, line: 257, type: !25)
!189 = !DILocation(line: 257, column: 6, scope: !181)
!190 = !DILocalVariable(name: "s32Temp2", scope: !181, file: !64, line: 257, type: !25)
!191 = !DILocation(line: 257, column: 17, scope: !181)
!192 = !DILocation(line: 258, column: 13, scope: !181)
!193 = !DILocation(line: 258, column: 11, scope: !181)
!194 = !DILocation(line: 259, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !181, file: !64, line: 259, column: 5)
!196 = !DILocation(line: 259, column: 17, scope: !195)
!197 = !DILocation(line: 259, column: 5, scope: !181)
!198 = !DILocation(line: 261, column: 7, scope: !199)
!199 = distinct !DILexicalBlock(scope: !200, file: !64, line: 261, column: 7)
!200 = distinct !DILexicalBlock(scope: !195, file: !64, line: 260, column: 2)
!201 = !DILocation(line: 261, column: 17, scope: !199)
!202 = !DILocation(line: 261, column: 7, scope: !200)
!203 = !DILocation(line: 263, column: 4, scope: !204)
!204 = distinct !DILexicalBlock(scope: !199, file: !64, line: 262, column: 3)
!205 = !DILocation(line: 267, column: 4, scope: !206)
!206 = distinct !DILexicalBlock(scope: !199, file: !64, line: 266, column: 3)
!207 = !DILocation(line: 272, column: 6, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !64, line: 272, column: 6)
!209 = distinct !DILexicalBlock(scope: !195, file: !64, line: 271, column: 2)
!210 = !DILocation(line: 272, column: 16, scope: !208)
!211 = !DILocation(line: 272, column: 6, scope: !209)
!212 = !DILocation(line: 274, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !64, line: 273, column: 3)
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
!233 = distinct !DILexicalBlock(scope: !213, file: !64, line: 277, column: 7)
!234 = !DILocation(line: 277, column: 16, scope: !233)
!235 = !DILocation(line: 277, column: 7, scope: !213)
!236 = !DILocation(line: 279, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !238, file: !64, line: 279, column: 8)
!238 = distinct !DILexicalBlock(scope: !233, file: !64, line: 278, column: 4)
!239 = !DILocation(line: 279, column: 17, scope: !237)
!240 = !DILocation(line: 279, column: 8, scope: !238)
!241 = !DILocation(line: 281, column: 18, scope: !242)
!242 = distinct !DILexicalBlock(scope: !237, file: !64, line: 280, column: 5)
!243 = !DILocation(line: 281, column: 13, scope: !242)
!244 = !DILocation(line: 281, column: 6, scope: !242)
!245 = !DILocation(line: 285, column: 6, scope: !246)
!246 = distinct !DILexicalBlock(scope: !237, file: !64, line: 284, column: 5)
!247 = !DILocation(line: 290, column: 5, scope: !248)
!248 = distinct !DILexicalBlock(scope: !233, file: !64, line: 289, column: 4)
!249 = !DILocation(line: 295, column: 7, scope: !250)
!250 = distinct !DILexicalBlock(scope: !251, file: !64, line: 295, column: 7)
!251 = distinct !DILexicalBlock(scope: !208, file: !64, line: 294, column: 3)
!252 = !DILocation(line: 295, column: 19, scope: !250)
!253 = !DILocation(line: 295, column: 7, scope: !251)
!254 = !DILocation(line: 297, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !64, line: 296, column: 4)
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
!275 = distinct !DILexicalBlock(scope: !255, file: !64, line: 300, column: 8)
!276 = !DILocation(line: 300, column: 17, scope: !275)
!277 = !DILocation(line: 300, column: 8, scope: !255)
!278 = !DILocation(line: 302, column: 9, scope: !279)
!279 = distinct !DILexicalBlock(scope: !280, file: !64, line: 302, column: 9)
!280 = distinct !DILexicalBlock(scope: !275, file: !64, line: 301, column: 5)
!281 = !DILocation(line: 302, column: 18, scope: !279)
!282 = !DILocation(line: 302, column: 9, scope: !280)
!283 = !DILocation(line: 304, column: 19, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !64, line: 303, column: 6)
!285 = !DILocation(line: 304, column: 14, scope: !284)
!286 = !DILocation(line: 304, column: 7, scope: !284)
!287 = !DILocation(line: 308, column: 7, scope: !288)
!288 = distinct !DILexicalBlock(scope: !279, file: !64, line: 307, column: 6)
!289 = !DILocation(line: 313, column: 6, scope: !290)
!290 = distinct !DILexicalBlock(scope: !275, file: !64, line: 312, column: 5)
!291 = !DILocation(line: 319, column: 5, scope: !292)
!292 = distinct !DILexicalBlock(scope: !250, file: !64, line: 318, column: 4)
!293 = !DILocation(line: 325, column: 1, scope: !181)
!294 = distinct !DISubprogram(name: "s16_fac05_div_s16_u16", scope: !64, file: !64, line: 343, type: !295, scopeLine: 344, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!295 = !DISubroutineType(types: !296)
!296 = !{!6, !6, !18}
!297 = !DILocalVariable(name: "numerator", arg: 1, scope: !294, file: !64, line: 343, type: !6)
!298 = !DILocation(line: 343, column: 31, scope: !294)
!299 = !DILocalVariable(name: "denominator", arg: 2, scope: !294, file: !64, line: 343, type: !18)
!300 = !DILocation(line: 343, column: 47, scope: !294)
!301 = !DILocalVariable(name: "u16Temp1", scope: !294, file: !64, line: 345, type: !18)
!302 = !DILocation(line: 345, column: 6, scope: !294)
!303 = !DILocalVariable(name: "s32Temp1", scope: !294, file: !64, line: 346, type: !25)
!304 = !DILocation(line: 346, column: 6, scope: !294)
!305 = !DILocalVariable(name: "s32Temp2", scope: !294, file: !64, line: 346, type: !25)
!306 = !DILocation(line: 346, column: 15, scope: !294)
!307 = !DILocation(line: 347, column: 13, scope: !294)
!308 = !DILocation(line: 347, column: 25, scope: !294)
!309 = !DILocation(line: 347, column: 11, scope: !294)
!310 = !DILocation(line: 348, column: 13, scope: !294)
!311 = !DILocation(line: 348, column: 22, scope: !294)
!312 = !DILocation(line: 348, column: 11, scope: !294)
!313 = !DILocation(line: 349, column: 5, scope: !314)
!314 = distinct !DILexicalBlock(scope: !294, file: !64, line: 349, column: 5)
!315 = !DILocation(line: 349, column: 14, scope: !314)
!316 = !DILocation(line: 349, column: 5, scope: !294)
!317 = !DILocation(line: 351, column: 7, scope: !318)
!318 = distinct !DILexicalBlock(scope: !319, file: !64, line: 351, column: 7)
!319 = distinct !DILexicalBlock(scope: !314, file: !64, line: 350, column: 2)
!320 = !DILocation(line: 351, column: 17, scope: !318)
!321 = !DILocation(line: 351, column: 7, scope: !319)
!322 = !DILocation(line: 353, column: 4, scope: !323)
!323 = distinct !DILexicalBlock(scope: !318, file: !64, line: 352, column: 3)
!324 = !DILocation(line: 357, column: 4, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !64, line: 356, column: 3)
!326 = !DILocation(line: 362, column: 15, scope: !327)
!327 = distinct !DILexicalBlock(scope: !314, file: !64, line: 361, column: 2)
!328 = !DILocation(line: 362, column: 24, scope: !327)
!329 = !DILocation(line: 362, column: 32, scope: !327)
!330 = !DILocation(line: 362, column: 41, scope: !327)
!331 = !DILocation(line: 362, column: 47, scope: !327)
!332 = !DILocation(line: 362, column: 46, scope: !327)
!333 = !DILocation(line: 362, column: 57, scope: !327)
!334 = !DILocation(line: 362, column: 56, scope: !327)
!335 = !DILocation(line: 362, column: 29, scope: !327)
!336 = !DILocation(line: 362, column: 12, scope: !327)
!337 = !DILocation(line: 363, column: 14, scope: !327)
!338 = !DILocation(line: 363, column: 22, scope: !327)
!339 = !DILocation(line: 363, column: 12, scope: !327)
!340 = !DILocation(line: 364, column: 14, scope: !327)
!341 = !DILocation(line: 364, column: 23, scope: !327)
!342 = !DILocation(line: 364, column: 22, scope: !327)
!343 = !DILocation(line: 364, column: 12, scope: !327)
!344 = !DILocation(line: 365, column: 16, scope: !327)
!345 = !DILocation(line: 365, column: 25, scope: !327)
!346 = !DILocation(line: 365, column: 31, scope: !327)
!347 = !DILocation(line: 365, column: 30, scope: !327)
!348 = !DILocation(line: 365, column: 43, scope: !327)
!349 = !DILocation(line: 365, column: 41, scope: !327)
!350 = !DILocation(line: 365, column: 12, scope: !327)
!351 = !DILocation(line: 366, column: 6, scope: !352)
!352 = distinct !DILexicalBlock(scope: !327, file: !64, line: 366, column: 6)
!353 = !DILocation(line: 366, column: 15, scope: !352)
!354 = !DILocation(line: 366, column: 6, scope: !327)
!355 = !DILocation(line: 368, column: 7, scope: !356)
!356 = distinct !DILexicalBlock(scope: !357, file: !64, line: 368, column: 7)
!357 = distinct !DILexicalBlock(scope: !352, file: !64, line: 367, column: 3)
!358 = !DILocation(line: 368, column: 16, scope: !356)
!359 = !DILocation(line: 368, column: 7, scope: !357)
!360 = !DILocation(line: 370, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !64, line: 369, column: 4)
!362 = !DILocation(line: 370, column: 12, scope: !361)
!363 = !DILocation(line: 370, column: 5, scope: !361)
!364 = !DILocation(line: 374, column: 5, scope: !365)
!365 = distinct !DILexicalBlock(scope: !356, file: !64, line: 373, column: 4)
!366 = !DILocation(line: 379, column: 4, scope: !367)
!367 = distinct !DILexicalBlock(scope: !352, file: !64, line: 378, column: 3)
!368 = !DILocation(line: 382, column: 1, scope: !294)
!369 = distinct !DISubprogram(name: "s16_div_s16_u16_shl0", scope: !64, file: !64, line: 399, type: !295, scopeLine: 400, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!370 = !DILocalVariable(name: "numerator", arg: 1, scope: !369, file: !64, line: 399, type: !6)
!371 = !DILocation(line: 399, column: 30, scope: !369)
!372 = !DILocalVariable(name: "denominator", arg: 2, scope: !369, file: !64, line: 399, type: !18)
!373 = !DILocation(line: 399, column: 45, scope: !369)
!374 = !DILocalVariable(name: "u16Temp1", scope: !369, file: !64, line: 401, type: !18)
!375 = !DILocation(line: 401, column: 6, scope: !369)
!376 = !DILocalVariable(name: "s32Temp1", scope: !369, file: !64, line: 402, type: !25)
!377 = !DILocation(line: 402, column: 6, scope: !369)
!378 = !DILocation(line: 403, column: 13, scope: !369)
!379 = !DILocation(line: 403, column: 25, scope: !369)
!380 = !DILocation(line: 403, column: 11, scope: !369)
!381 = !DILocation(line: 404, column: 5, scope: !382)
!382 = distinct !DILexicalBlock(scope: !369, file: !64, line: 404, column: 5)
!383 = !DILocation(line: 404, column: 13, scope: !382)
!384 = !DILocation(line: 404, column: 5, scope: !369)
!385 = !DILocation(line: 406, column: 6, scope: !386)
!386 = distinct !DILexicalBlock(scope: !387, file: !64, line: 406, column: 6)
!387 = distinct !DILexicalBlock(scope: !382, file: !64, line: 405, column: 2)
!388 = !DILocation(line: 406, column: 15, scope: !386)
!389 = !DILocation(line: 406, column: 6, scope: !387)
!390 = !DILocation(line: 408, column: 4, scope: !391)
!391 = distinct !DILexicalBlock(scope: !386, file: !64, line: 407, column: 3)
!392 = !DILocation(line: 412, column: 4, scope: !393)
!393 = distinct !DILexicalBlock(scope: !386, file: !64, line: 411, column: 3)
!394 = !DILocation(line: 418, column: 15, scope: !395)
!395 = distinct !DILexicalBlock(scope: !382, file: !64, line: 417, column: 2)
!396 = !DILocation(line: 418, column: 27, scope: !395)
!397 = !DILocation(line: 418, column: 37, scope: !395)
!398 = !DILocation(line: 418, column: 36, scope: !395)
!399 = !DILocation(line: 418, column: 49, scope: !395)
!400 = !DILocation(line: 418, column: 47, scope: !395)
!401 = !DILocation(line: 418, column: 25, scope: !395)
!402 = !DILocation(line: 418, column: 59, scope: !395)
!403 = !DILocation(line: 418, column: 12, scope: !395)
!404 = !DILocation(line: 419, column: 15, scope: !395)
!405 = !DILocation(line: 419, column: 24, scope: !395)
!406 = !DILocation(line: 419, column: 23, scope: !395)
!407 = !DILocation(line: 419, column: 37, scope: !395)
!408 = !DILocation(line: 419, column: 47, scope: !395)
!409 = !DILocation(line: 419, column: 46, scope: !395)
!410 = !DILocation(line: 419, column: 34, scope: !395)
!411 = !DILocation(line: 419, column: 12, scope: !395)
!412 = !DILocation(line: 420, column: 10, scope: !395)
!413 = !DILocation(line: 420, column: 3, scope: !395)
!414 = !DILocation(line: 422, column: 1, scope: !369)
!415 = distinct !DISubprogram(name: "u8_fac1_div_u16_u16", scope: !64, file: !64, line: 440, type: !416, scopeLine: 441, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!416 = !DISubroutineType(types: !417)
!417 = !{!13, !18, !18}
!418 = !DILocalVariable(name: "numerator", arg: 1, scope: !415, file: !64, line: 440, type: !18)
!419 = !DILocation(line: 440, column: 28, scope: !415)
!420 = !DILocalVariable(name: "denominator", arg: 2, scope: !415, file: !64, line: 440, type: !18)
!421 = !DILocation(line: 440, column: 43, scope: !415)
!422 = !DILocalVariable(name: "u32Temp1", scope: !415, file: !64, line: 442, type: !423)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "u32", file: !7, line: 10, baseType: !424)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !15, line: 26, baseType: !425)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !11, line: 42, baseType: !426)
!426 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!427 = !DILocation(line: 442, column: 6, scope: !415)
!428 = !DILocalVariable(name: "u32Temp2", scope: !415, file: !64, line: 442, type: !423)
!429 = !DILocation(line: 442, column: 20, scope: !415)
!430 = !DILocalVariable(name: "u32Temp3", scope: !415, file: !64, line: 442, type: !423)
!431 = !DILocation(line: 442, column: 33, scope: !415)
!432 = !DILocation(line: 443, column: 5, scope: !433)
!433 = distinct !DILexicalBlock(scope: !415, file: !64, line: 443, column: 5)
!434 = !DILocation(line: 443, column: 16, scope: !433)
!435 = !DILocation(line: 443, column: 5, scope: !415)
!436 = !DILocation(line: 445, column: 3, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !64, line: 444, column: 2)
!438 = !DILocation(line: 449, column: 15, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !64, line: 448, column: 2)
!440 = !DILocation(line: 449, column: 24, scope: !439)
!441 = !DILocation(line: 449, column: 12, scope: !439)
!442 = !DILocation(line: 450, column: 14, scope: !439)
!443 = !DILocation(line: 450, column: 25, scope: !439)
!444 = !DILocation(line: 450, column: 23, scope: !439)
!445 = !DILocation(line: 450, column: 12, scope: !439)
!446 = !DILocation(line: 451, column: 15, scope: !439)
!447 = !DILocation(line: 451, column: 24, scope: !439)
!448 = !DILocation(line: 451, column: 32, scope: !439)
!449 = !DILocation(line: 451, column: 12, scope: !439)
!450 = !DILocation(line: 452, column: 6, scope: !451)
!451 = distinct !DILexicalBlock(scope: !439, file: !64, line: 452, column: 6)
!452 = !DILocation(line: 452, column: 15, scope: !451)
!453 = !DILocation(line: 452, column: 6, scope: !439)
!454 = !DILocation(line: 454, column: 15, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !64, line: 453, column: 3)
!456 = !DILocation(line: 454, column: 11, scope: !455)
!457 = !DILocation(line: 454, column: 4, scope: !455)
!458 = !DILocation(line: 458, column: 4, scope: !459)
!459 = distinct !DILexicalBlock(scope: !451, file: !64, line: 457, column: 3)
!460 = !DILocation(line: 461, column: 1, scope: !415)
!461 = distinct !DISubprogram(name: "u16_div_s32_u16", scope: !64, file: !64, line: 478, type: !462, scopeLine: 479, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!462 = !DISubroutineType(types: !463)
!463 = !{!18, !25, !18}
!464 = !DILocalVariable(name: "x_value", arg: 1, scope: !461, file: !64, line: 478, type: !25)
!465 = !DILocation(line: 478, column: 25, scope: !461)
!466 = !DILocalVariable(name: "y_value", arg: 2, scope: !461, file: !64, line: 478, type: !18)
!467 = !DILocation(line: 478, column: 38, scope: !461)
!468 = !DILocalVariable(name: "s32Temp1", scope: !461, file: !64, line: 480, type: !25)
!469 = !DILocation(line: 480, column: 6, scope: !461)
!470 = !DILocation(line: 481, column: 12, scope: !461)
!471 = !DILocation(line: 481, column: 20, scope: !461)
!472 = !DILocation(line: 481, column: 10, scope: !461)
!473 = !DILocation(line: 482, column: 6, scope: !474)
!474 = distinct !DILexicalBlock(scope: !461, file: !64, line: 482, column: 5)
!475 = !DILocation(line: 482, column: 14, scope: !474)
!476 = !DILocation(line: 482, column: 24, scope: !474)
!477 = !DILocation(line: 482, column: 5, scope: !461)
!478 = !DILocation(line: 484, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !64, line: 484, column: 6)
!480 = distinct !DILexicalBlock(scope: !474, file: !64, line: 483, column: 2)
!481 = !DILocation(line: 484, column: 14, scope: !479)
!482 = !DILocation(line: 484, column: 6, scope: !480)
!483 = !DILocation(line: 486, column: 4, scope: !484)
!484 = distinct !DILexicalBlock(scope: !479, file: !64, line: 485, column: 3)
!485 = !DILocation(line: 490, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !479, file: !64, line: 489, column: 3)
!487 = !DILocation(line: 495, column: 15, scope: !488)
!488 = distinct !DILexicalBlock(scope: !474, file: !64, line: 494, column: 2)
!489 = !DILocation(line: 495, column: 27, scope: !488)
!490 = !DILocation(line: 495, column: 35, scope: !488)
!491 = !DILocation(line: 495, column: 34, scope: !488)
!492 = !DILocation(line: 495, column: 46, scope: !488)
!493 = !DILocation(line: 495, column: 44, scope: !488)
!494 = !DILocation(line: 495, column: 23, scope: !488)
!495 = !DILocation(line: 495, column: 56, scope: !488)
!496 = !DILocation(line: 495, column: 12, scope: !488)
!497 = !DILocation(line: 496, column: 15, scope: !488)
!498 = !DILocation(line: 496, column: 24, scope: !488)
!499 = !DILocation(line: 496, column: 23, scope: !488)
!500 = !DILocation(line: 496, column: 36, scope: !488)
!501 = !DILocation(line: 496, column: 44, scope: !488)
!502 = !DILocation(line: 496, column: 43, scope: !488)
!503 = !DILocation(line: 496, column: 33, scope: !488)
!504 = !DILocation(line: 496, column: 12, scope: !488)
!505 = !DILocation(line: 497, column: 6, scope: !506)
!506 = distinct !DILexicalBlock(scope: !488, file: !64, line: 497, column: 6)
!507 = !DILocation(line: 497, column: 15, scope: !506)
!508 = !DILocation(line: 497, column: 6, scope: !488)
!509 = !DILocation(line: 499, column: 7, scope: !510)
!510 = distinct !DILexicalBlock(scope: !511, file: !64, line: 499, column: 7)
!511 = distinct !DILexicalBlock(scope: !506, file: !64, line: 498, column: 3)
!512 = !DILocation(line: 499, column: 16, scope: !510)
!513 = !DILocation(line: 499, column: 7, scope: !511)
!514 = !DILocation(line: 501, column: 17, scope: !515)
!515 = distinct !DILexicalBlock(scope: !510, file: !64, line: 500, column: 4)
!516 = !DILocation(line: 501, column: 12, scope: !515)
!517 = !DILocation(line: 501, column: 5, scope: !515)
!518 = !DILocation(line: 505, column: 5, scope: !519)
!519 = distinct !DILexicalBlock(scope: !510, file: !64, line: 504, column: 4)
!520 = !DILocation(line: 510, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !506, file: !64, line: 509, column: 3)
!522 = !DILocation(line: 513, column: 1, scope: !461)
!523 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !64, file: !64, line: 531, type: !524, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!524 = !DISubroutineType(types: !525)
!525 = !{!18, !18, !18}
!526 = !DILocalVariable(name: "numerator", arg: 1, scope: !523, file: !64, line: 531, type: !18)
!527 = !DILocation(line: 531, column: 31, scope: !523)
!528 = !DILocalVariable(name: "denominator", arg: 2, scope: !523, file: !64, line: 531, type: !18)
!529 = !DILocation(line: 531, column: 46, scope: !523)
!530 = !DILocalVariable(name: "u32Temp", scope: !523, file: !64, line: 533, type: !423)
!531 = !DILocation(line: 533, column: 6, scope: !523)
!532 = !DILocation(line: 534, column: 5, scope: !533)
!533 = distinct !DILexicalBlock(scope: !523, file: !64, line: 534, column: 5)
!534 = !DILocation(line: 534, column: 17, scope: !533)
!535 = !DILocation(line: 534, column: 5, scope: !523)
!536 = !DILocation(line: 536, column: 3, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !64, line: 535, column: 2)
!538 = !DILocation(line: 540, column: 14, scope: !539)
!539 = distinct !DILexicalBlock(scope: !533, file: !64, line: 539, column: 2)
!540 = !DILocation(line: 540, column: 23, scope: !539)
!541 = !DILocation(line: 540, column: 32, scope: !539)
!542 = !DILocation(line: 540, column: 44, scope: !539)
!543 = !DILocation(line: 540, column: 29, scope: !539)
!544 = !DILocation(line: 540, column: 11, scope: !539)
!545 = !DILocation(line: 541, column: 13, scope: !539)
!546 = !DILocation(line: 541, column: 21, scope: !539)
!547 = !DILocation(line: 541, column: 20, scope: !539)
!548 = !DILocation(line: 541, column: 11, scope: !539)
!549 = !DILocation(line: 542, column: 6, scope: !550)
!550 = distinct !DILexicalBlock(scope: !539, file: !64, line: 542, column: 6)
!551 = !DILocation(line: 542, column: 14, scope: !550)
!552 = !DILocation(line: 542, column: 6, scope: !539)
!553 = !DILocation(line: 544, column: 11, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !64, line: 543, column: 3)
!555 = !DILocation(line: 544, column: 19, scope: !554)
!556 = !DILocation(line: 544, column: 4, scope: !554)
!557 = !DILocation(line: 548, column: 4, scope: !558)
!558 = distinct !DILexicalBlock(scope: !550, file: !64, line: 547, column: 3)
!559 = !DILocation(line: 552, column: 1, scope: !523)
!560 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !64, file: !64, line: 569, type: !561, scopeLine: 570, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!561 = !DISubroutineType(types: !562)
!562 = !{!18, !423, !18}
!563 = !DILocalVariable(name: "x_value", arg: 1, scope: !560, file: !64, line: 569, type: !423)
!564 = !DILocation(line: 569, column: 25, scope: !560)
!565 = !DILocalVariable(name: "y_value", arg: 2, scope: !560, file: !64, line: 569, type: !18)
!566 = !DILocation(line: 569, column: 38, scope: !560)
!567 = !DILocalVariable(name: "u32Temp1", scope: !560, file: !64, line: 571, type: !423)
!568 = !DILocation(line: 571, column: 6, scope: !560)
!569 = !DILocalVariable(name: "u32Temp2", scope: !560, file: !64, line: 571, type: !423)
!570 = !DILocation(line: 571, column: 17, scope: !560)
!571 = !DILocation(line: 572, column: 12, scope: !560)
!572 = !DILocation(line: 572, column: 20, scope: !560)
!573 = !DILocation(line: 572, column: 10, scope: !560)
!574 = !DILocation(line: 573, column: 5, scope: !575)
!575 = distinct !DILexicalBlock(scope: !560, file: !64, line: 573, column: 5)
!576 = !DILocation(line: 573, column: 13, scope: !575)
!577 = !DILocation(line: 573, column: 5, scope: !560)
!578 = !DILocation(line: 575, column: 3, scope: !579)
!579 = distinct !DILexicalBlock(scope: !575, file: !64, line: 574, column: 2)
!580 = !DILocation(line: 579, column: 14, scope: !581)
!581 = distinct !DILexicalBlock(scope: !575, file: !64, line: 578, column: 2)
!582 = !DILocation(line: 579, column: 22, scope: !581)
!583 = !DILocation(line: 579, column: 21, scope: !581)
!584 = !DILocation(line: 579, column: 12, scope: !581)
!585 = !DILocation(line: 580, column: 14, scope: !581)
!586 = !DILocation(line: 580, column: 25, scope: !581)
!587 = !DILocation(line: 580, column: 36, scope: !581)
!588 = !DILocation(line: 580, column: 34, scope: !581)
!589 = !DILocation(line: 580, column: 22, scope: !581)
!590 = !DILocation(line: 580, column: 45, scope: !581)
!591 = !DILocation(line: 580, column: 12, scope: !581)
!592 = !DILocation(line: 581, column: 15, scope: !581)
!593 = !DILocation(line: 581, column: 24, scope: !581)
!594 = !DILocation(line: 581, column: 23, scope: !581)
!595 = !DILocation(line: 581, column: 36, scope: !581)
!596 = !DILocation(line: 581, column: 44, scope: !581)
!597 = !DILocation(line: 581, column: 43, scope: !581)
!598 = !DILocation(line: 581, column: 33, scope: !581)
!599 = !DILocation(line: 581, column: 12, scope: !581)
!600 = !DILocation(line: 582, column: 6, scope: !601)
!601 = distinct !DILexicalBlock(scope: !581, file: !64, line: 582, column: 6)
!602 = !DILocation(line: 582, column: 15, scope: !601)
!603 = !DILocation(line: 582, column: 6, scope: !581)
!604 = !DILocation(line: 584, column: 11, scope: !605)
!605 = distinct !DILexicalBlock(scope: !601, file: !64, line: 583, column: 3)
!606 = !DILocation(line: 584, column: 20, scope: !605)
!607 = !DILocation(line: 584, column: 4, scope: !605)
!608 = !DILocation(line: 588, column: 4, scope: !609)
!609 = distinct !DILexicalBlock(scope: !601, file: !64, line: 587, column: 3)
!610 = !DILocation(line: 592, column: 1, scope: !560)
!611 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 611, type: !612, scopeLine: 612, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!612 = !DISubroutineType(types: !613)
!613 = !{!6, !6, !18, !6}
!614 = !DILocalVariable(name: "factor1", arg: 1, scope: !611, file: !64, line: 611, type: !6)
!615 = !DILocation(line: 611, column: 33, scope: !611)
!616 = !DILocalVariable(name: "factor2", arg: 2, scope: !611, file: !64, line: 611, type: !18)
!617 = !DILocation(line: 611, column: 46, scope: !611)
!618 = !DILocalVariable(name: "denominator", arg: 3, scope: !611, file: !64, line: 611, type: !6)
!619 = !DILocation(line: 611, column: 59, scope: !611)
!620 = !DILocalVariable(name: "s32Result", scope: !611, file: !64, line: 613, type: !25)
!621 = !DILocation(line: 613, column: 6, scope: !611)
!622 = !DILocalVariable(name: "s32Temp1", scope: !611, file: !64, line: 613, type: !25)
!623 = !DILocation(line: 613, column: 21, scope: !611)
!624 = !DILocation(line: 614, column: 14, scope: !611)
!625 = !DILocation(line: 614, column: 24, scope: !611)
!626 = !DILocation(line: 614, column: 22, scope: !611)
!627 = !DILocation(line: 614, column: 12, scope: !611)
!628 = !DILocation(line: 615, column: 5, scope: !629)
!629 = distinct !DILexicalBlock(scope: !611, file: !64, line: 615, column: 5)
!630 = !DILocation(line: 615, column: 17, scope: !629)
!631 = !DILocation(line: 615, column: 5, scope: !611)
!632 = !DILocation(line: 617, column: 6, scope: !633)
!633 = distinct !DILexicalBlock(scope: !634, file: !64, line: 617, column: 6)
!634 = distinct !DILexicalBlock(scope: !629, file: !64, line: 616, column: 2)
!635 = !DILocation(line: 617, column: 16, scope: !633)
!636 = !DILocation(line: 617, column: 6, scope: !634)
!637 = !DILocation(line: 619, column: 4, scope: !638)
!638 = distinct !DILexicalBlock(scope: !633, file: !64, line: 618, column: 3)
!639 = !DILocation(line: 623, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !633, file: !64, line: 622, column: 3)
!641 = !DILocation(line: 628, column: 14, scope: !642)
!642 = distinct !DILexicalBlock(scope: !629, file: !64, line: 627, column: 2)
!643 = !DILocation(line: 628, column: 27, scope: !642)
!644 = !DILocation(line: 628, column: 37, scope: !642)
!645 = !DILocation(line: 628, column: 36, scope: !642)
!646 = !DILocation(line: 628, column: 50, scope: !642)
!647 = !DILocation(line: 628, column: 49, scope: !642)
!648 = !DILocation(line: 628, column: 24, scope: !642)
!649 = !DILocation(line: 628, column: 12, scope: !642)
!650 = !DILocation(line: 629, column: 14, scope: !642)
!651 = !DILocation(line: 629, column: 23, scope: !642)
!652 = !DILocation(line: 629, column: 12, scope: !642)
!653 = !DILocation(line: 630, column: 16, scope: !642)
!654 = !DILocation(line: 630, column: 25, scope: !642)
!655 = !DILocation(line: 630, column: 24, scope: !642)
!656 = !DILocation(line: 630, column: 41, scope: !642)
!657 = !DILocation(line: 630, column: 51, scope: !642)
!658 = !DILocation(line: 630, column: 50, scope: !642)
!659 = !DILocation(line: 630, column: 38, scope: !642)
!660 = !DILocation(line: 630, column: 13, scope: !642)
!661 = !DILocation(line: 631, column: 6, scope: !662)
!662 = distinct !DILexicalBlock(scope: !642, file: !64, line: 631, column: 6)
!663 = !DILocation(line: 631, column: 16, scope: !662)
!664 = !DILocation(line: 631, column: 6, scope: !642)
!665 = !DILocation(line: 633, column: 7, scope: !666)
!666 = distinct !DILexicalBlock(scope: !667, file: !64, line: 633, column: 7)
!667 = distinct !DILexicalBlock(scope: !662, file: !64, line: 632, column: 3)
!668 = !DILocation(line: 633, column: 17, scope: !666)
!669 = !DILocation(line: 633, column: 7, scope: !667)
!670 = !DILocation(line: 635, column: 17, scope: !671)
!671 = distinct !DILexicalBlock(scope: !666, file: !64, line: 634, column: 4)
!672 = !DILocation(line: 635, column: 12, scope: !671)
!673 = !DILocation(line: 635, column: 5, scope: !671)
!674 = !DILocation(line: 640, column: 5, scope: !675)
!675 = distinct !DILexicalBlock(scope: !666, file: !64, line: 639, column: 4)
!676 = !DILocation(line: 645, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !662, file: !64, line: 644, column: 3)
!678 = !DILocation(line: 649, column: 1, scope: !611)
!679 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !64, file: !64, line: 667, type: !680, scopeLine: 668, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!680 = !DISubroutineType(types: !681)
!681 = !{!6, !18, !6, !18}
!682 = !DILocalVariable(name: "factor1", arg: 1, scope: !679, file: !64, line: 667, type: !18)
!683 = !DILocation(line: 667, column: 33, scope: !679)
!684 = !DILocalVariable(name: "factor2", arg: 2, scope: !679, file: !64, line: 667, type: !6)
!685 = !DILocation(line: 667, column: 46, scope: !679)
!686 = !DILocalVariable(name: "denominator", arg: 3, scope: !679, file: !64, line: 667, type: !18)
!687 = !DILocation(line: 667, column: 59, scope: !679)
!688 = !DILocalVariable(name: "s32Result", scope: !679, file: !64, line: 669, type: !25)
!689 = !DILocation(line: 669, column: 6, scope: !679)
!690 = !DILocalVariable(name: "s32Temp1", scope: !679, file: !64, line: 669, type: !25)
!691 = !DILocation(line: 669, column: 21, scope: !679)
!692 = !DILocation(line: 670, column: 14, scope: !679)
!693 = !DILocation(line: 670, column: 24, scope: !679)
!694 = !DILocation(line: 670, column: 22, scope: !679)
!695 = !DILocation(line: 670, column: 12, scope: !679)
!696 = !DILocation(line: 671, column: 5, scope: !697)
!697 = distinct !DILexicalBlock(scope: !679, file: !64, line: 671, column: 5)
!698 = !DILocation(line: 671, column: 16, scope: !697)
!699 = !DILocation(line: 671, column: 5, scope: !679)
!700 = !DILocation(line: 673, column: 6, scope: !701)
!701 = distinct !DILexicalBlock(scope: !702, file: !64, line: 673, column: 6)
!702 = distinct !DILexicalBlock(scope: !697, file: !64, line: 672, column: 2)
!703 = !DILocation(line: 673, column: 16, scope: !701)
!704 = !DILocation(line: 673, column: 6, scope: !702)
!705 = !DILocation(line: 675, column: 4, scope: !706)
!706 = distinct !DILexicalBlock(scope: !701, file: !64, line: 674, column: 3)
!707 = !DILocation(line: 679, column: 4, scope: !708)
!708 = distinct !DILexicalBlock(scope: !701, file: !64, line: 678, column: 3)
!709 = !DILocation(line: 684, column: 14, scope: !710)
!710 = distinct !DILexicalBlock(scope: !697, file: !64, line: 683, column: 2)
!711 = !DILocation(line: 684, column: 28, scope: !710)
!712 = !DILocation(line: 684, column: 38, scope: !710)
!713 = !DILocation(line: 684, column: 37, scope: !710)
!714 = !DILocation(line: 684, column: 53, scope: !710)
!715 = !DILocation(line: 684, column: 51, scope: !710)
!716 = !DILocation(line: 684, column: 24, scope: !710)
!717 = !DILocation(line: 684, column: 66, scope: !710)
!718 = !DILocation(line: 684, column: 12, scope: !710)
!719 = !DILocation(line: 685, column: 16, scope: !710)
!720 = !DILocation(line: 685, column: 25, scope: !710)
!721 = !DILocation(line: 685, column: 24, scope: !710)
!722 = !DILocation(line: 685, column: 41, scope: !710)
!723 = !DILocation(line: 685, column: 51, scope: !710)
!724 = !DILocation(line: 685, column: 50, scope: !710)
!725 = !DILocation(line: 685, column: 38, scope: !710)
!726 = !DILocation(line: 685, column: 13, scope: !710)
!727 = !DILocation(line: 686, column: 6, scope: !728)
!728 = distinct !DILexicalBlock(scope: !710, file: !64, line: 686, column: 6)
!729 = !DILocation(line: 686, column: 16, scope: !728)
!730 = !DILocation(line: 686, column: 6, scope: !710)
!731 = !DILocation(line: 688, column: 7, scope: !732)
!732 = distinct !DILexicalBlock(scope: !733, file: !64, line: 688, column: 7)
!733 = distinct !DILexicalBlock(scope: !728, file: !64, line: 687, column: 3)
!734 = !DILocation(line: 688, column: 17, scope: !732)
!735 = !DILocation(line: 688, column: 7, scope: !733)
!736 = !DILocation(line: 690, column: 17, scope: !737)
!737 = distinct !DILexicalBlock(scope: !732, file: !64, line: 689, column: 4)
!738 = !DILocation(line: 690, column: 12, scope: !737)
!739 = !DILocation(line: 690, column: 5, scope: !737)
!740 = !DILocation(line: 694, column: 5, scope: !741)
!741 = distinct !DILexicalBlock(scope: !732, file: !64, line: 693, column: 4)
!742 = !DILocation(line: 699, column: 4, scope: !743)
!743 = distinct !DILexicalBlock(scope: !728, file: !64, line: 698, column: 3)
!744 = !DILocation(line: 702, column: 1, scope: !679)
!745 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 721, type: !746, scopeLine: 722, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!746 = !DISubroutineType(types: !747)
!747 = !{!18, !6, !18, !6}
!748 = !DILocalVariable(name: "factor1", arg: 1, scope: !745, file: !64, line: 721, type: !6)
!749 = !DILocation(line: 721, column: 33, scope: !745)
!750 = !DILocalVariable(name: "factor2", arg: 2, scope: !745, file: !64, line: 721, type: !18)
!751 = !DILocation(line: 721, column: 46, scope: !745)
!752 = !DILocalVariable(name: "denominator", arg: 3, scope: !745, file: !64, line: 721, type: !6)
!753 = !DILocation(line: 721, column: 59, scope: !745)
!754 = !DILocalVariable(name: "u32Result", scope: !745, file: !64, line: 723, type: !423)
!755 = !DILocation(line: 723, column: 6, scope: !745)
!756 = !DILocalVariable(name: "u32Temp1", scope: !745, file: !64, line: 723, type: !423)
!757 = !DILocation(line: 723, column: 21, scope: !745)
!758 = !DILocalVariable(name: "s32Result", scope: !745, file: !64, line: 724, type: !25)
!759 = !DILocation(line: 724, column: 6, scope: !745)
!760 = !DILocalVariable(name: "s32Temp1", scope: !745, file: !64, line: 724, type: !25)
!761 = !DILocation(line: 724, column: 21, scope: !745)
!762 = !DILocation(line: 725, column: 14, scope: !745)
!763 = !DILocation(line: 725, column: 24, scope: !745)
!764 = !DILocation(line: 725, column: 22, scope: !745)
!765 = !DILocation(line: 725, column: 12, scope: !745)
!766 = !DILocation(line: 727, column: 5, scope: !767)
!767 = distinct !DILexicalBlock(scope: !745, file: !64, line: 727, column: 5)
!768 = !DILocation(line: 727, column: 17, scope: !767)
!769 = !DILocation(line: 727, column: 5, scope: !745)
!770 = !DILocation(line: 729, column: 6, scope: !771)
!771 = distinct !DILexicalBlock(scope: !772, file: !64, line: 729, column: 6)
!772 = distinct !DILexicalBlock(scope: !767, file: !64, line: 728, column: 2)
!773 = !DILocation(line: 729, column: 16, scope: !771)
!774 = !DILocation(line: 729, column: 6, scope: !772)
!775 = !DILocation(line: 731, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !771, file: !64, line: 730, column: 3)
!777 = !DILocation(line: 735, column: 4, scope: !778)
!778 = distinct !DILexicalBlock(scope: !771, file: !64, line: 734, column: 3)
!779 = !DILocation(line: 740, column: 15, scope: !780)
!780 = distinct !DILexicalBlock(scope: !767, file: !64, line: 739, column: 2)
!781 = !DILocation(line: 740, column: 29, scope: !780)
!782 = !DILocation(line: 740, column: 39, scope: !780)
!783 = !DILocation(line: 740, column: 38, scope: !780)
!784 = !DILocation(line: 740, column: 54, scope: !780)
!785 = !DILocation(line: 740, column: 52, scope: !780)
!786 = !DILocation(line: 740, column: 25, scope: !780)
!787 = !DILocation(line: 740, column: 68, scope: !780)
!788 = !DILocation(line: 740, column: 12, scope: !780)
!789 = !DILocation(line: 741, column: 16, scope: !780)
!790 = !DILocation(line: 741, column: 25, scope: !780)
!791 = !DILocation(line: 741, column: 24, scope: !780)
!792 = !DILocation(line: 741, column: 41, scope: !780)
!793 = !DILocation(line: 741, column: 51, scope: !780)
!794 = !DILocation(line: 741, column: 50, scope: !780)
!795 = !DILocation(line: 741, column: 38, scope: !780)
!796 = !DILocation(line: 741, column: 13, scope: !780)
!797 = !DILocation(line: 742, column: 6, scope: !798)
!798 = distinct !DILexicalBlock(scope: !780, file: !64, line: 742, column: 6)
!799 = !DILocation(line: 742, column: 16, scope: !798)
!800 = !DILocation(line: 742, column: 6, scope: !780)
!801 = !DILocation(line: 744, column: 7, scope: !802)
!802 = distinct !DILexicalBlock(scope: !803, file: !64, line: 744, column: 7)
!803 = distinct !DILexicalBlock(scope: !798, file: !64, line: 743, column: 3)
!804 = !DILocation(line: 744, column: 17, scope: !802)
!805 = !DILocation(line: 744, column: 7, scope: !803)
!806 = !DILocation(line: 746, column: 17, scope: !807)
!807 = distinct !DILexicalBlock(scope: !802, file: !64, line: 745, column: 4)
!808 = !DILocation(line: 746, column: 12, scope: !807)
!809 = !DILocation(line: 746, column: 5, scope: !807)
!810 = !DILocation(line: 750, column: 5, scope: !811)
!811 = distinct !DILexicalBlock(scope: !802, file: !64, line: 749, column: 4)
!812 = !DILocation(line: 755, column: 4, scope: !813)
!813 = distinct !DILexicalBlock(scope: !798, file: !64, line: 754, column: 3)
!814 = !DILocation(line: 758, column: 1, scope: !745)
!815 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !64, file: !64, line: 777, type: !816, scopeLine: 778, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!816 = !DISubroutineType(types: !817)
!817 = !{!18, !6, !18, !18}
!818 = !DILocalVariable(name: "factor1", arg: 1, scope: !815, file: !64, line: 777, type: !6)
!819 = !DILocation(line: 777, column: 33, scope: !815)
!820 = !DILocalVariable(name: "factor2", arg: 2, scope: !815, file: !64, line: 777, type: !18)
!821 = !DILocation(line: 777, column: 46, scope: !815)
!822 = !DILocalVariable(name: "denominator", arg: 3, scope: !815, file: !64, line: 777, type: !18)
!823 = !DILocation(line: 777, column: 59, scope: !815)
!824 = !DILocalVariable(name: "s32Result", scope: !815, file: !64, line: 779, type: !25)
!825 = !DILocation(line: 779, column: 6, scope: !815)
!826 = !DILocalVariable(name: "s32Temp1", scope: !815, file: !64, line: 779, type: !25)
!827 = !DILocation(line: 779, column: 21, scope: !815)
!828 = !DILocation(line: 780, column: 14, scope: !815)
!829 = !DILocation(line: 780, column: 24, scope: !815)
!830 = !DILocation(line: 780, column: 22, scope: !815)
!831 = !DILocation(line: 780, column: 12, scope: !815)
!832 = !DILocation(line: 782, column: 5, scope: !833)
!833 = distinct !DILexicalBlock(scope: !815, file: !64, line: 782, column: 5)
!834 = !DILocation(line: 782, column: 17, scope: !833)
!835 = !DILocation(line: 782, column: 5, scope: !815)
!836 = !DILocation(line: 784, column: 6, scope: !837)
!837 = distinct !DILexicalBlock(scope: !838, file: !64, line: 784, column: 6)
!838 = distinct !DILexicalBlock(scope: !833, file: !64, line: 783, column: 2)
!839 = !DILocation(line: 784, column: 16, scope: !837)
!840 = !DILocation(line: 784, column: 6, scope: !838)
!841 = !DILocation(line: 786, column: 4, scope: !842)
!842 = distinct !DILexicalBlock(scope: !837, file: !64, line: 785, column: 3)
!843 = !DILocation(line: 790, column: 4, scope: !844)
!844 = distinct !DILexicalBlock(scope: !837, file: !64, line: 789, column: 3)
!845 = !DILocation(line: 795, column: 15, scope: !846)
!846 = distinct !DILexicalBlock(scope: !833, file: !64, line: 794, column: 2)
!847 = !DILocation(line: 795, column: 29, scope: !846)
!848 = !DILocation(line: 795, column: 39, scope: !846)
!849 = !DILocation(line: 795, column: 38, scope: !846)
!850 = !DILocation(line: 795, column: 54, scope: !846)
!851 = !DILocation(line: 795, column: 52, scope: !846)
!852 = !DILocation(line: 795, column: 25, scope: !846)
!853 = !DILocation(line: 795, column: 68, scope: !846)
!854 = !DILocation(line: 795, column: 12, scope: !846)
!855 = !DILocation(line: 796, column: 16, scope: !846)
!856 = !DILocation(line: 796, column: 25, scope: !846)
!857 = !DILocation(line: 796, column: 24, scope: !846)
!858 = !DILocation(line: 796, column: 41, scope: !846)
!859 = !DILocation(line: 796, column: 51, scope: !846)
!860 = !DILocation(line: 796, column: 50, scope: !846)
!861 = !DILocation(line: 796, column: 38, scope: !846)
!862 = !DILocation(line: 796, column: 13, scope: !846)
!863 = !DILocation(line: 797, column: 6, scope: !864)
!864 = distinct !DILexicalBlock(scope: !846, file: !64, line: 797, column: 6)
!865 = !DILocation(line: 797, column: 16, scope: !864)
!866 = !DILocation(line: 797, column: 6, scope: !846)
!867 = !DILocation(line: 799, column: 7, scope: !868)
!868 = distinct !DILexicalBlock(scope: !869, file: !64, line: 799, column: 7)
!869 = distinct !DILexicalBlock(scope: !864, file: !64, line: 798, column: 3)
!870 = !DILocation(line: 799, column: 17, scope: !868)
!871 = !DILocation(line: 799, column: 7, scope: !869)
!872 = !DILocation(line: 801, column: 17, scope: !873)
!873 = distinct !DILexicalBlock(scope: !868, file: !64, line: 800, column: 4)
!874 = !DILocation(line: 801, column: 12, scope: !873)
!875 = !DILocation(line: 801, column: 5, scope: !873)
!876 = !DILocation(line: 805, column: 5, scope: !877)
!877 = distinct !DILexicalBlock(scope: !868, file: !64, line: 804, column: 4)
!878 = !DILocation(line: 810, column: 4, scope: !879)
!879 = distinct !DILexicalBlock(scope: !864, file: !64, line: 809, column: 3)
!880 = !DILocation(line: 814, column: 1, scope: !815)
!881 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !64, file: !64, line: 832, type: !882, scopeLine: 833, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!882 = !DISubroutineType(types: !883)
!883 = !{!18, !18, !18, !18}
!884 = !DILocalVariable(name: "factor1", arg: 1, scope: !881, file: !64, line: 832, type: !18)
!885 = !DILocation(line: 832, column: 33, scope: !881)
!886 = !DILocalVariable(name: "factor2", arg: 2, scope: !881, file: !64, line: 832, type: !18)
!887 = !DILocation(line: 832, column: 46, scope: !881)
!888 = !DILocalVariable(name: "denominator", arg: 3, scope: !881, file: !64, line: 832, type: !18)
!889 = !DILocation(line: 832, column: 59, scope: !881)
!890 = !DILocalVariable(name: "u32Temp1", scope: !881, file: !64, line: 834, type: !423)
!891 = !DILocation(line: 834, column: 6, scope: !881)
!892 = !DILocalVariable(name: "u16TempDenom", scope: !881, file: !64, line: 835, type: !18)
!893 = !DILocation(line: 835, column: 6, scope: !881)
!894 = !DILocation(line: 837, column: 5, scope: !895)
!895 = distinct !DILexicalBlock(scope: !881, file: !64, line: 837, column: 5)
!896 = !DILocation(line: 837, column: 17, scope: !895)
!897 = !DILocation(line: 837, column: 5, scope: !881)
!898 = !DILocation(line: 839, column: 3, scope: !899)
!899 = distinct !DILexicalBlock(scope: !895, file: !64, line: 838, column: 2)
!900 = !DILocation(line: 843, column: 14, scope: !901)
!901 = distinct !DILexicalBlock(scope: !895, file: !64, line: 842, column: 2)
!902 = !DILocation(line: 843, column: 24, scope: !901)
!903 = !DILocation(line: 843, column: 22, scope: !901)
!904 = !DILocation(line: 843, column: 12, scope: !901)
!905 = !DILocation(line: 844, column: 18, scope: !901)
!906 = !DILocation(line: 844, column: 30, scope: !901)
!907 = !DILocation(line: 844, column: 16, scope: !901)
!908 = !DILocation(line: 845, column: 14, scope: !901)
!909 = !DILocation(line: 845, column: 25, scope: !901)
!910 = !DILocation(line: 845, column: 23, scope: !901)
!911 = !DILocation(line: 845, column: 12, scope: !901)
!912 = !DILocation(line: 846, column: 14, scope: !901)
!913 = !DILocation(line: 846, column: 25, scope: !901)
!914 = !DILocation(line: 846, column: 23, scope: !901)
!915 = !DILocation(line: 846, column: 12, scope: !901)
!916 = !DILocation(line: 847, column: 6, scope: !917)
!917 = distinct !DILexicalBlock(scope: !901, file: !64, line: 847, column: 6)
!918 = !DILocation(line: 847, column: 15, scope: !917)
!919 = !DILocation(line: 847, column: 6, scope: !901)
!920 = !DILocation(line: 849, column: 12, scope: !921)
!921 = distinct !DILexicalBlock(scope: !917, file: !64, line: 848, column: 3)
!922 = !DILocation(line: 849, column: 21, scope: !921)
!923 = !DILocation(line: 849, column: 11, scope: !921)
!924 = !DILocation(line: 849, column: 4, scope: !921)
!925 = !DILocation(line: 854, column: 4, scope: !926)
!926 = distinct !DILexicalBlock(scope: !917, file: !64, line: 853, column: 3)
!927 = !DILocation(line: 859, column: 1, scope: !881)
!928 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !64, file: !64, line: 876, type: !929, scopeLine: 877, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!929 = !DISubroutineType(types: !930)
!930 = !{!18, !18, !18, !423}
!931 = !DILocalVariable(name: "factor1", arg: 1, scope: !928, file: !64, line: 876, type: !18)
!932 = !DILocation(line: 876, column: 33, scope: !928)
!933 = !DILocalVariable(name: "factor2", arg: 2, scope: !928, file: !64, line: 876, type: !18)
!934 = !DILocation(line: 876, column: 46, scope: !928)
!935 = !DILocalVariable(name: "denominator", arg: 3, scope: !928, file: !64, line: 876, type: !423)
!936 = !DILocation(line: 876, column: 59, scope: !928)
!937 = !DILocalVariable(name: "u32Temp1", scope: !928, file: !64, line: 878, type: !423)
!938 = !DILocation(line: 878, column: 6, scope: !928)
!939 = !DILocation(line: 879, column: 5, scope: !940)
!940 = distinct !DILexicalBlock(scope: !928, file: !64, line: 879, column: 5)
!941 = !DILocation(line: 879, column: 17, scope: !940)
!942 = !DILocation(line: 879, column: 5, scope: !928)
!943 = !DILocation(line: 881, column: 3, scope: !944)
!944 = distinct !DILexicalBlock(scope: !940, file: !64, line: 880, column: 2)
!945 = !DILocation(line: 885, column: 15, scope: !946)
!946 = distinct !DILexicalBlock(scope: !940, file: !64, line: 884, column: 2)
!947 = !DILocation(line: 885, column: 25, scope: !946)
!948 = !DILocation(line: 885, column: 23, scope: !946)
!949 = !DILocation(line: 885, column: 36, scope: !946)
!950 = !DILocation(line: 885, column: 34, scope: !946)
!951 = !DILocation(line: 885, column: 12, scope: !946)
!952 = !DILocation(line: 886, column: 8, scope: !953)
!953 = distinct !DILexicalBlock(scope: !946, file: !64, line: 886, column: 6)
!954 = !DILocation(line: 886, column: 18, scope: !953)
!955 = !DILocation(line: 886, column: 16, scope: !953)
!956 = !DILocation(line: 886, column: 28, scope: !953)
!957 = !DILocation(line: 886, column: 40, scope: !953)
!958 = !DILocation(line: 886, column: 39, scope: !953)
!959 = !DILocation(line: 886, column: 26, scope: !953)
!960 = !DILocation(line: 886, column: 53, scope: !953)
!961 = !DILocation(line: 886, column: 64, scope: !953)
!962 = !DILocation(line: 886, column: 50, scope: !953)
!963 = !DILocation(line: 886, column: 6, scope: !946)
!964 = !DILocation(line: 888, column: 12, scope: !965)
!965 = distinct !DILexicalBlock(scope: !953, file: !64, line: 887, column: 3)
!966 = !DILocation(line: 889, column: 3, scope: !965)
!967 = !DILocation(line: 890, column: 6, scope: !968)
!968 = distinct !DILexicalBlock(scope: !946, file: !64, line: 890, column: 6)
!969 = !DILocation(line: 890, column: 15, scope: !968)
!970 = !DILocation(line: 890, column: 6, scope: !946)
!971 = !DILocation(line: 892, column: 12, scope: !972)
!972 = distinct !DILexicalBlock(scope: !968, file: !64, line: 891, column: 3)
!973 = !DILocation(line: 892, column: 21, scope: !972)
!974 = !DILocation(line: 892, column: 11, scope: !972)
!975 = !DILocation(line: 892, column: 4, scope: !972)
!976 = !DILocation(line: 896, column: 4, scope: !977)
!977 = distinct !DILexicalBlock(scope: !968, file: !64, line: 895, column: 3)
!978 = !DILocation(line: 899, column: 1, scope: !928)
!979 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !64, file: !64, line: 916, type: !980, scopeLine: 917, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!980 = !DISubroutineType(types: !981)
!981 = !{!423, !423, !18}
!982 = !DILocalVariable(name: "x_value", arg: 1, scope: !979, file: !64, line: 916, type: !423)
!983 = !DILocation(line: 916, column: 25, scope: !979)
!984 = !DILocalVariable(name: "y_value", arg: 2, scope: !979, file: !64, line: 916, type: !18)
!985 = !DILocation(line: 916, column: 38, scope: !979)
!986 = !DILocalVariable(name: "u32Temp1", scope: !979, file: !64, line: 918, type: !423)
!987 = !DILocation(line: 918, column: 6, scope: !979)
!988 = !DILocation(line: 919, column: 5, scope: !989)
!989 = distinct !DILexicalBlock(scope: !979, file: !64, line: 919, column: 5)
!990 = !DILocation(line: 919, column: 13, scope: !989)
!991 = !DILocation(line: 919, column: 5, scope: !979)
!992 = !DILocation(line: 921, column: 3, scope: !993)
!993 = distinct !DILexicalBlock(scope: !989, file: !64, line: 920, column: 2)
!994 = !DILocation(line: 925, column: 15, scope: !995)
!995 = distinct !DILexicalBlock(scope: !989, file: !64, line: 924, column: 2)
!996 = !DILocation(line: 925, column: 26, scope: !995)
!997 = !DILocation(line: 925, column: 34, scope: !995)
!998 = !DILocation(line: 925, column: 33, scope: !995)
!999 = !DILocation(line: 925, column: 45, scope: !995)
!1000 = !DILocation(line: 925, column: 43, scope: !995)
!1001 = !DILocation(line: 925, column: 23, scope: !995)
!1002 = !DILocation(line: 925, column: 54, scope: !995)
!1003 = !DILocation(line: 925, column: 12, scope: !995)
!1004 = !DILocation(line: 926, column: 15, scope: !995)
!1005 = !DILocation(line: 926, column: 23, scope: !995)
!1006 = !DILocation(line: 926, column: 22, scope: !995)
!1007 = !DILocation(line: 926, column: 35, scope: !995)
!1008 = !DILocation(line: 926, column: 44, scope: !995)
!1009 = !DILocation(line: 926, column: 43, scope: !995)
!1010 = !DILocation(line: 926, column: 32, scope: !995)
!1011 = !DILocation(line: 926, column: 12, scope: !995)
!1012 = !DILocation(line: 927, column: 10, scope: !995)
!1013 = !DILocation(line: 927, column: 3, scope: !995)
!1014 = !DILocation(line: 929, column: 1, scope: !979)
!1015 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !64, file: !64, line: 947, type: !1016, scopeLine: 948, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!6, !6, !6, !6}
!1018 = !DILocalVariable(name: "fak1", arg: 1, scope: !1015, file: !64, line: 947, type: !6)
!1019 = !DILocation(line: 947, column: 33, scope: !1015)
!1020 = !DILocalVariable(name: "fak2", arg: 2, scope: !1015, file: !64, line: 947, type: !6)
!1021 = !DILocation(line: 947, column: 43, scope: !1015)
!1022 = !DILocalVariable(name: "div", arg: 3, scope: !1015, file: !64, line: 947, type: !6)
!1023 = !DILocation(line: 947, column: 53, scope: !1015)
!1024 = !DILocalVariable(name: "s32Temp1", scope: !1015, file: !64, line: 949, type: !25)
!1025 = !DILocation(line: 949, column: 6, scope: !1015)
!1026 = !DILocalVariable(name: "s32Temp2", scope: !1015, file: !64, line: 949, type: !25)
!1027 = !DILocation(line: 949, column: 20, scope: !1015)
!1028 = !DILocalVariable(name: "s32Temp3", scope: !1015, file: !64, line: 949, type: !25)
!1029 = !DILocation(line: 949, column: 34, scope: !1015)
!1030 = !DILocation(line: 950, column: 13, scope: !1015)
!1031 = !DILocation(line: 950, column: 20, scope: !1015)
!1032 = !DILocation(line: 950, column: 18, scope: !1015)
!1033 = !DILocation(line: 950, column: 11, scope: !1015)
!1034 = !DILocation(line: 951, column: 5, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1015, file: !64, line: 951, column: 5)
!1036 = !DILocation(line: 951, column: 9, scope: !1035)
!1037 = !DILocation(line: 951, column: 5, scope: !1015)
!1038 = !DILocation(line: 953, column: 6, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1040, file: !64, line: 953, column: 6)
!1040 = distinct !DILexicalBlock(scope: !1035, file: !64, line: 952, column: 2)
!1041 = !DILocation(line: 953, column: 15, scope: !1039)
!1042 = !DILocation(line: 953, column: 6, scope: !1040)
!1043 = !DILocation(line: 955, column: 4, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1039, file: !64, line: 954, column: 3)
!1045 = !DILocation(line: 959, column: 4, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1039, file: !64, line: 958, column: 3)
!1047 = !DILocation(line: 964, column: 15, scope: !1048)
!1048 = distinct !DILexicalBlock(scope: !1035, file: !64, line: 963, column: 2)
!1049 = !DILocation(line: 964, column: 28, scope: !1048)
!1050 = !DILocation(line: 964, column: 39, scope: !1048)
!1051 = !DILocation(line: 964, column: 37, scope: !1048)
!1052 = !DILocation(line: 964, column: 46, scope: !1048)
!1053 = !DILocation(line: 964, column: 44, scope: !1048)
!1054 = !DILocation(line: 964, column: 24, scope: !1048)
!1055 = !DILocation(line: 964, column: 52, scope: !1048)
!1056 = !DILocation(line: 964, column: 12, scope: !1048)
!1057 = !DILocation(line: 965, column: 15, scope: !1048)
!1058 = !DILocation(line: 965, column: 24, scope: !1048)
!1059 = !DILocation(line: 965, column: 23, scope: !1048)
!1060 = !DILocation(line: 965, column: 32, scope: !1048)
!1061 = !DILocation(line: 965, column: 41, scope: !1048)
!1062 = !DILocation(line: 965, column: 40, scope: !1048)
!1063 = !DILocation(line: 965, column: 29, scope: !1048)
!1064 = !DILocation(line: 965, column: 12, scope: !1048)
!1065 = !DILocation(line: 966, column: 6, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !1048, file: !64, line: 966, column: 6)
!1067 = !DILocation(line: 966, column: 15, scope: !1066)
!1068 = !DILocation(line: 966, column: 6, scope: !1048)
!1069 = !DILocation(line: 968, column: 7, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1071, file: !64, line: 968, column: 7)
!1071 = distinct !DILexicalBlock(scope: !1066, file: !64, line: 967, column: 3)
!1072 = !DILocation(line: 968, column: 16, scope: !1070)
!1073 = !DILocation(line: 968, column: 7, scope: !1071)
!1074 = !DILocation(line: 970, column: 17, scope: !1075)
!1075 = distinct !DILexicalBlock(scope: !1070, file: !64, line: 969, column: 4)
!1076 = !DILocation(line: 970, column: 12, scope: !1075)
!1077 = !DILocation(line: 970, column: 5, scope: !1075)
!1078 = !DILocation(line: 974, column: 5, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1070, file: !64, line: 973, column: 4)
!1080 = !DILocation(line: 979, column: 4, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1066, file: !64, line: 978, column: 3)
!1082 = !DILocation(line: 982, column: 1, scope: !1015)
!1083 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !64, file: !64, line: 1000, type: !1084, scopeLine: 1001, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!6, !6, !6, !18}
!1086 = !DILocalVariable(name: "data1", arg: 1, scope: !1083, file: !64, line: 1000, type: !6)
!1087 = !DILocation(line: 1000, column: 33, scope: !1083)
!1088 = !DILocalVariable(name: "data2", arg: 2, scope: !1083, file: !64, line: 1000, type: !6)
!1089 = !DILocation(line: 1000, column: 43, scope: !1083)
!1090 = !DILocalVariable(name: "denominator", arg: 3, scope: !1083, file: !64, line: 1000, type: !18)
!1091 = !DILocation(line: 1000, column: 53, scope: !1083)
!1092 = !DILocalVariable(name: "s32Result", scope: !1083, file: !64, line: 1002, type: !25)
!1093 = !DILocation(line: 1002, column: 6, scope: !1083)
!1094 = !DILocalVariable(name: "s32Temp1", scope: !1083, file: !64, line: 1002, type: !25)
!1095 = !DILocation(line: 1002, column: 21, scope: !1083)
!1096 = !DILocation(line: 1003, column: 14, scope: !1083)
!1097 = !DILocation(line: 1003, column: 22, scope: !1083)
!1098 = !DILocation(line: 1003, column: 20, scope: !1083)
!1099 = !DILocation(line: 1003, column: 12, scope: !1083)
!1100 = !DILocation(line: 1005, column: 5, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1083, file: !64, line: 1005, column: 5)
!1102 = !DILocation(line: 1005, column: 17, scope: !1101)
!1103 = !DILocation(line: 1005, column: 5, scope: !1083)
!1104 = !DILocation(line: 1007, column: 6, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1106, file: !64, line: 1007, column: 6)
!1106 = distinct !DILexicalBlock(scope: !1101, file: !64, line: 1006, column: 2)
!1107 = !DILocation(line: 1007, column: 16, scope: !1105)
!1108 = !DILocation(line: 1007, column: 6, scope: !1106)
!1109 = !DILocation(line: 1009, column: 4, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1105, file: !64, line: 1008, column: 3)
!1111 = !DILocation(line: 1011, column: 11, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1105, file: !64, line: 1011, column: 11)
!1113 = !DILocation(line: 1011, column: 21, scope: !1112)
!1114 = !DILocation(line: 1011, column: 11, scope: !1105)
!1115 = !DILocation(line: 1013, column: 4, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1112, file: !64, line: 1012, column: 3)
!1117 = !DILocation(line: 1017, column: 4, scope: !1118)
!1118 = distinct !DILexicalBlock(scope: !1112, file: !64, line: 1016, column: 3)
!1119 = !DILocation(line: 1022, column: 15, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1101, file: !64, line: 1021, column: 2)
!1121 = !DILocation(line: 1022, column: 28, scope: !1120)
!1122 = !DILocation(line: 1022, column: 38, scope: !1120)
!1123 = !DILocation(line: 1022, column: 37, scope: !1120)
!1124 = !DILocation(line: 1022, column: 51, scope: !1120)
!1125 = !DILocation(line: 1022, column: 50, scope: !1120)
!1126 = !DILocation(line: 1022, column: 25, scope: !1120)
!1127 = !DILocation(line: 1022, column: 64, scope: !1120)
!1128 = !DILocation(line: 1022, column: 12, scope: !1120)
!1129 = !DILocation(line: 1023, column: 16, scope: !1120)
!1130 = !DILocation(line: 1023, column: 25, scope: !1120)
!1131 = !DILocation(line: 1023, column: 24, scope: !1120)
!1132 = !DILocation(line: 1023, column: 41, scope: !1120)
!1133 = !DILocation(line: 1023, column: 51, scope: !1120)
!1134 = !DILocation(line: 1023, column: 50, scope: !1120)
!1135 = !DILocation(line: 1023, column: 38, scope: !1120)
!1136 = !DILocation(line: 1023, column: 13, scope: !1120)
!1137 = !DILocation(line: 1024, column: 6, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1120, file: !64, line: 1024, column: 6)
!1139 = !DILocation(line: 1024, column: 16, scope: !1138)
!1140 = !DILocation(line: 1024, column: 6, scope: !1120)
!1141 = !DILocation(line: 1026, column: 7, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1143, file: !64, line: 1026, column: 7)
!1143 = distinct !DILexicalBlock(scope: !1138, file: !64, line: 1025, column: 3)
!1144 = !DILocation(line: 1026, column: 17, scope: !1142)
!1145 = !DILocation(line: 1026, column: 7, scope: !1143)
!1146 = !DILocation(line: 1028, column: 17, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1142, file: !64, line: 1027, column: 4)
!1148 = !DILocation(line: 1028, column: 12, scope: !1147)
!1149 = !DILocation(line: 1028, column: 5, scope: !1147)
!1150 = !DILocation(line: 1032, column: 5, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1142, file: !64, line: 1031, column: 4)
!1152 = !DILocation(line: 1037, column: 4, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1138, file: !64, line: 1036, column: 3)
!1154 = !DILocation(line: 1041, column: 1, scope: !1083)
!1155 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !64, file: !64, line: 1058, type: !1156, scopeLine: 1059, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1156 = !DISubroutineType(types: !1157)
!1157 = !{!423, !423, !25}
!1158 = !DILocalVariable(name: "numerator", arg: 1, scope: !1155, file: !64, line: 1058, type: !423)
!1159 = !DILocation(line: 1058, column: 25, scope: !1155)
!1160 = !DILocalVariable(name: "denominator", arg: 2, scope: !1155, file: !64, line: 1058, type: !25)
!1161 = !DILocation(line: 1058, column: 40, scope: !1155)
!1162 = !DILocalVariable(name: "u32Temp1", scope: !1155, file: !64, line: 1060, type: !423)
!1163 = !DILocation(line: 1060, column: 6, scope: !1155)
!1164 = !DILocation(line: 1061, column: 5, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1155, file: !64, line: 1061, column: 5)
!1166 = !DILocation(line: 1061, column: 17, scope: !1165)
!1167 = !DILocation(line: 1061, column: 5, scope: !1155)
!1168 = !DILocation(line: 1063, column: 3, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1165, file: !64, line: 1062, column: 2)
!1170 = !DILocation(line: 1067, column: 6, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !64, line: 1067, column: 6)
!1172 = distinct !DILexicalBlock(scope: !1165, file: !64, line: 1066, column: 2)
!1173 = !DILocation(line: 1067, column: 18, scope: !1171)
!1174 = !DILocation(line: 1067, column: 6, scope: !1172)
!1175 = !DILocation(line: 1069, column: 4, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1171, file: !64, line: 1068, column: 3)
!1177 = !DILocation(line: 1073, column: 16, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1171, file: !64, line: 1072, column: 3)
!1179 = !DILocation(line: 1073, column: 30, scope: !1178)
!1180 = !DILocation(line: 1073, column: 40, scope: !1178)
!1181 = !DILocation(line: 1073, column: 39, scope: !1178)
!1182 = !DILocation(line: 1073, column: 55, scope: !1178)
!1183 = !DILocation(line: 1073, column: 53, scope: !1178)
!1184 = !DILocation(line: 1073, column: 26, scope: !1178)
!1185 = !DILocation(line: 1073, column: 68, scope: !1178)
!1186 = !DILocation(line: 1073, column: 13, scope: !1178)
!1187 = !DILocation(line: 1074, column: 16, scope: !1178)
!1188 = !DILocation(line: 1074, column: 25, scope: !1178)
!1189 = !DILocation(line: 1074, column: 24, scope: !1178)
!1190 = !DILocation(line: 1074, column: 41, scope: !1178)
!1191 = !DILocation(line: 1074, column: 51, scope: !1178)
!1192 = !DILocation(line: 1074, column: 50, scope: !1178)
!1193 = !DILocation(line: 1074, column: 38, scope: !1178)
!1194 = !DILocation(line: 1074, column: 13, scope: !1178)
!1195 = !DILocation(line: 1075, column: 11, scope: !1178)
!1196 = !DILocation(line: 1075, column: 4, scope: !1178)
!1197 = !DILocation(line: 1078, column: 1, scope: !1155)
!1198 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !64, file: !64, line: 1095, type: !1199, scopeLine: 1096, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1199 = !DISubroutineType(types: !1200)
!1200 = !{!423, !25, !423}
!1201 = !DILocalVariable(name: "numerator", arg: 1, scope: !1198, file: !64, line: 1095, type: !25)
!1202 = !DILocation(line: 1095, column: 25, scope: !1198)
!1203 = !DILocalVariable(name: "denominator", arg: 2, scope: !1198, file: !64, line: 1095, type: !423)
!1204 = !DILocation(line: 1095, column: 40, scope: !1198)
!1205 = !DILocalVariable(name: "s32Temp1", scope: !1198, file: !64, line: 1097, type: !25)
!1206 = !DILocation(line: 1097, column: 6, scope: !1198)
!1207 = !DILocation(line: 1098, column: 5, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1198, file: !64, line: 1098, column: 5)
!1209 = !DILocation(line: 1098, column: 17, scope: !1208)
!1210 = !DILocation(line: 1098, column: 5, scope: !1198)
!1211 = !DILocation(line: 1100, column: 6, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1213, file: !64, line: 1100, column: 6)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !64, line: 1099, column: 2)
!1214 = !DILocation(line: 1100, column: 16, scope: !1212)
!1215 = !DILocation(line: 1100, column: 6, scope: !1213)
!1216 = !DILocation(line: 1102, column: 4, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1212, file: !64, line: 1101, column: 3)
!1218 = !DILocation(line: 1106, column: 4, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1212, file: !64, line: 1105, column: 3)
!1220 = !DILocation(line: 1111, column: 6, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1222, file: !64, line: 1111, column: 6)
!1222 = distinct !DILexicalBlock(scope: !1208, file: !64, line: 1110, column: 2)
!1223 = !DILocation(line: 1111, column: 16, scope: !1221)
!1224 = !DILocation(line: 1111, column: 6, scope: !1222)
!1225 = !DILocation(line: 1113, column: 17, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !64, line: 1112, column: 3)
!1227 = !DILocation(line: 1113, column: 31, scope: !1226)
!1228 = !DILocation(line: 1113, column: 41, scope: !1226)
!1229 = !DILocation(line: 1113, column: 40, scope: !1226)
!1230 = !DILocation(line: 1113, column: 56, scope: !1226)
!1231 = !DILocation(line: 1113, column: 54, scope: !1226)
!1232 = !DILocation(line: 1113, column: 27, scope: !1226)
!1233 = !DILocation(line: 1113, column: 69, scope: !1226)
!1234 = !DILocation(line: 1113, column: 13, scope: !1226)
!1235 = !DILocation(line: 1114, column: 13, scope: !1226)
!1236 = !DILocation(line: 1114, column: 23, scope: !1226)
!1237 = !DILocation(line: 1114, column: 22, scope: !1226)
!1238 = !DILocation(line: 1114, column: 39, scope: !1226)
!1239 = !DILocation(line: 1114, column: 48, scope: !1226)
!1240 = !DILocation(line: 1114, column: 47, scope: !1226)
!1241 = !DILocation(line: 1114, column: 36, scope: !1226)
!1242 = !DILocation(line: 1114, column: 4, scope: !1226)
!1243 = !DILocation(line: 1118, column: 4, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1221, file: !64, line: 1117, column: 3)
!1245 = !DILocation(line: 1121, column: 1, scope: !1198)
!1246 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !64, file: !64, line: 1138, type: !1247, scopeLine: 1139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1247 = !DISubroutineType(types: !1248)
!1248 = !{!423, !25, !25}
!1249 = !DILocalVariable(name: "numerator", arg: 1, scope: !1246, file: !64, line: 1138, type: !25)
!1250 = !DILocation(line: 1138, column: 25, scope: !1246)
!1251 = !DILocalVariable(name: "denominator", arg: 2, scope: !1246, file: !64, line: 1138, type: !25)
!1252 = !DILocation(line: 1138, column: 40, scope: !1246)
!1253 = !DILocalVariable(name: "u32Temp1", scope: !1246, file: !64, line: 1140, type: !423)
!1254 = !DILocation(line: 1140, column: 6, scope: !1246)
!1255 = !DILocalVariable(name: "u32Temp2", scope: !1246, file: !64, line: 1140, type: !423)
!1256 = !DILocation(line: 1140, column: 20, scope: !1246)
!1257 = !DILocation(line: 1141, column: 5, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1246, file: !64, line: 1141, column: 5)
!1259 = !DILocation(line: 1141, column: 17, scope: !1258)
!1260 = !DILocation(line: 1141, column: 5, scope: !1246)
!1261 = !DILocation(line: 1143, column: 6, scope: !1262)
!1262 = distinct !DILexicalBlock(scope: !1263, file: !64, line: 1143, column: 6)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !64, line: 1142, column: 2)
!1264 = !DILocation(line: 1143, column: 16, scope: !1262)
!1265 = !DILocation(line: 1143, column: 6, scope: !1263)
!1266 = !DILocation(line: 1145, column: 4, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !64, line: 1144, column: 3)
!1268 = !DILocation(line: 1149, column: 4, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1262, file: !64, line: 1148, column: 3)
!1270 = !DILocation(line: 1154, column: 6, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1272, file: !64, line: 1154, column: 6)
!1272 = distinct !DILexicalBlock(scope: !1258, file: !64, line: 1153, column: 2)
!1273 = !DILocation(line: 1154, column: 16, scope: !1271)
!1274 = !DILocation(line: 1154, column: 6, scope: !1272)
!1275 = !DILocation(line: 1156, column: 7, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1277, file: !64, line: 1156, column: 7)
!1277 = distinct !DILexicalBlock(scope: !1271, file: !64, line: 1155, column: 3)
!1278 = !DILocation(line: 1156, column: 17, scope: !1276)
!1279 = !DILocation(line: 1156, column: 7, scope: !1277)
!1280 = !DILocation(line: 1158, column: 5, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1276, file: !64, line: 1157, column: 4)
!1282 = !DILocation(line: 1162, column: 8, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1284, file: !64, line: 1162, column: 8)
!1284 = distinct !DILexicalBlock(scope: !1276, file: !64, line: 1161, column: 4)
!1285 = !DILocation(line: 1162, column: 20, scope: !1283)
!1286 = !DILocation(line: 1162, column: 8, scope: !1284)
!1287 = !DILocation(line: 1164, column: 6, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1283, file: !64, line: 1163, column: 5)
!1289 = !DILocation(line: 1168, column: 18, scope: !1290)
!1290 = distinct !DILexicalBlock(scope: !1283, file: !64, line: 1167, column: 5)
!1291 = !DILocation(line: 1168, column: 32, scope: !1290)
!1292 = !DILocation(line: 1168, column: 42, scope: !1290)
!1293 = !DILocation(line: 1168, column: 41, scope: !1290)
!1294 = !DILocation(line: 1168, column: 57, scope: !1290)
!1295 = !DILocation(line: 1168, column: 55, scope: !1290)
!1296 = !DILocation(line: 1168, column: 28, scope: !1290)
!1297 = !DILocation(line: 1168, column: 71, scope: !1290)
!1298 = !DILocation(line: 1168, column: 15, scope: !1290)
!1299 = !DILocation(line: 1169, column: 18, scope: !1290)
!1300 = !DILocation(line: 1169, column: 29, scope: !1290)
!1301 = !DILocation(line: 1169, column: 27, scope: !1290)
!1302 = !DILocation(line: 1169, column: 45, scope: !1290)
!1303 = !DILocation(line: 1169, column: 57, scope: !1290)
!1304 = !DILocation(line: 1169, column: 55, scope: !1290)
!1305 = !DILocation(line: 1169, column: 42, scope: !1290)
!1306 = !DILocation(line: 1169, column: 15, scope: !1290)
!1307 = !DILocation(line: 1170, column: 13, scope: !1290)
!1308 = !DILocation(line: 1170, column: 6, scope: !1290)
!1309 = !DILocation(line: 1176, column: 7, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1311, file: !64, line: 1176, column: 7)
!1311 = distinct !DILexicalBlock(scope: !1271, file: !64, line: 1175, column: 3)
!1312 = !DILocation(line: 1176, column: 19, scope: !1310)
!1313 = !DILocation(line: 1176, column: 7, scope: !1311)
!1314 = !DILocation(line: 1178, column: 5, scope: !1315)
!1315 = distinct !DILexicalBlock(scope: !1310, file: !64, line: 1177, column: 4)
!1316 = !DILocation(line: 1182, column: 18, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1310, file: !64, line: 1181, column: 4)
!1318 = !DILocation(line: 1182, column: 17, scope: !1317)
!1319 = !DILocation(line: 1182, column: 15, scope: !1317)
!1320 = !DILocation(line: 1183, column: 20, scope: !1317)
!1321 = !DILocation(line: 1183, column: 19, scope: !1317)
!1322 = !DILocation(line: 1183, column: 17, scope: !1317)
!1323 = !DILocation(line: 1184, column: 17, scope: !1317)
!1324 = !DILocation(line: 1184, column: 31, scope: !1317)
!1325 = !DILocation(line: 1184, column: 41, scope: !1317)
!1326 = !DILocation(line: 1184, column: 40, scope: !1317)
!1327 = !DILocation(line: 1184, column: 56, scope: !1317)
!1328 = !DILocation(line: 1184, column: 54, scope: !1317)
!1329 = !DILocation(line: 1184, column: 27, scope: !1317)
!1330 = !DILocation(line: 1184, column: 70, scope: !1317)
!1331 = !DILocation(line: 1184, column: 14, scope: !1317)
!1332 = !DILocation(line: 1185, column: 17, scope: !1317)
!1333 = !DILocation(line: 1185, column: 28, scope: !1317)
!1334 = !DILocation(line: 1185, column: 26, scope: !1317)
!1335 = !DILocation(line: 1185, column: 44, scope: !1317)
!1336 = !DILocation(line: 1185, column: 56, scope: !1317)
!1337 = !DILocation(line: 1185, column: 54, scope: !1317)
!1338 = !DILocation(line: 1185, column: 41, scope: !1317)
!1339 = !DILocation(line: 1185, column: 14, scope: !1317)
!1340 = !DILocation(line: 1186, column: 12, scope: !1317)
!1341 = !DILocation(line: 1186, column: 5, scope: !1317)
!1342 = !DILocation(line: 1191, column: 1, scope: !1246)
!1343 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !64, file: !64, line: 1208, type: !1344, scopeLine: 1209, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!423, !423, !423}
!1346 = !DILocalVariable(name: "numerator", arg: 1, scope: !1343, file: !64, line: 1208, type: !423)
!1347 = !DILocation(line: 1208, column: 25, scope: !1343)
!1348 = !DILocalVariable(name: "denominator", arg: 2, scope: !1343, file: !64, line: 1208, type: !423)
!1349 = !DILocation(line: 1208, column: 40, scope: !1343)
!1350 = !DILocalVariable(name: "u32Temp1", scope: !1343, file: !64, line: 1211, type: !423)
!1351 = !DILocation(line: 1211, column: 6, scope: !1343)
!1352 = !DILocalVariable(name: "u32Temp2", scope: !1343, file: !64, line: 1211, type: !423)
!1353 = !DILocation(line: 1211, column: 20, scope: !1343)
!1354 = !DILocalVariable(name: "u32Temp3", scope: !1343, file: !64, line: 1211, type: !423)
!1355 = !DILocation(line: 1211, column: 34, scope: !1343)
!1356 = !DILocalVariable(name: "numerator_old", scope: !1343, file: !64, line: 1211, type: !423)
!1357 = !DILocation(line: 1211, column: 48, scope: !1343)
!1358 = !DILocation(line: 1212, column: 5, scope: !1359)
!1359 = distinct !DILexicalBlock(scope: !1343, file: !64, line: 1212, column: 5)
!1360 = !DILocation(line: 1212, column: 16, scope: !1359)
!1361 = !DILocation(line: 1212, column: 5, scope: !1343)
!1362 = !DILocation(line: 1214, column: 3, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1359, file: !64, line: 1213, column: 2)
!1364 = !DILocation(line: 1218, column: 14, scope: !1365)
!1365 = distinct !DILexicalBlock(scope: !1359, file: !64, line: 1217, column: 2)
!1366 = !DILocation(line: 1218, column: 26, scope: !1365)
!1367 = !DILocation(line: 1218, column: 41, scope: !1365)
!1368 = !DILocation(line: 1218, column: 51, scope: !1365)
!1369 = !DILocation(line: 1218, column: 50, scope: !1365)
!1370 = !DILocation(line: 1218, column: 38, scope: !1365)
!1371 = !DILocation(line: 1218, column: 24, scope: !1365)
!1372 = !DILocation(line: 1218, column: 12, scope: !1365)
!1373 = !DILocation(line: 1219, column: 7, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1365, file: !64, line: 1219, column: 6)
!1375 = !DILocation(line: 1219, column: 16, scope: !1374)
!1376 = !DILocation(line: 1219, column: 24, scope: !1374)
!1377 = !DILocation(line: 1219, column: 6, scope: !1365)
!1378 = !DILocation(line: 1221, column: 16, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1374, file: !64, line: 1220, column: 3)
!1380 = !DILocation(line: 1221, column: 27, scope: !1379)
!1381 = !DILocation(line: 1221, column: 13, scope: !1379)
!1382 = !DILocation(line: 1222, column: 3, scope: !1379)
!1383 = !DILocation(line: 1225, column: 16, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1374, file: !64, line: 1224, column: 3)
!1385 = !DILocation(line: 1225, column: 27, scope: !1384)
!1386 = !DILocation(line: 1225, column: 32, scope: !1384)
!1387 = !DILocation(line: 1225, column: 13, scope: !1384)
!1388 = !DILocation(line: 1228, column: 6, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1365, file: !64, line: 1228, column: 6)
!1390 = !DILocation(line: 1228, column: 17, scope: !1389)
!1391 = !DILocation(line: 1228, column: 15, scope: !1389)
!1392 = !DILocation(line: 1228, column: 6, scope: !1365)
!1393 = !DILocation(line: 1230, column: 12, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1389, file: !64, line: 1229, column: 3)
!1395 = !DILocation(line: 1230, column: 22, scope: !1394)
!1396 = !DILocation(line: 1230, column: 21, scope: !1394)
!1397 = !DILocation(line: 1230, column: 4, scope: !1394)
!1398 = !DILocation(line: 1234, column: 13, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1389, file: !64, line: 1233, column: 3)
!1400 = !DILocation(line: 1234, column: 23, scope: !1399)
!1401 = !DILocation(line: 1234, column: 22, scope: !1399)
!1402 = !DILocation(line: 1234, column: 36, scope: !1399)
!1403 = !DILocation(line: 1234, column: 4, scope: !1399)
!1404 = !DILocation(line: 1239, column: 1, scope: !1343)
!1405 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !64, file: !64, line: 1256, type: !1406, scopeLine: 1257, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1406 = !DISubroutineType(types: !1407)
!1407 = !{!25, !423, !25}
!1408 = !DILocalVariable(name: "numerator", arg: 1, scope: !1405, file: !64, line: 1256, type: !423)
!1409 = !DILocation(line: 1256, column: 25, scope: !1405)
!1410 = !DILocalVariable(name: "denominator", arg: 2, scope: !1405, file: !64, line: 1256, type: !25)
!1411 = !DILocation(line: 1256, column: 40, scope: !1405)
!1412 = !DILocalVariable(name: "u32Temp1", scope: !1405, file: !64, line: 1258, type: !423)
!1413 = !DILocation(line: 1258, column: 6, scope: !1405)
!1414 = !DILocalVariable(name: "u32Temp2", scope: !1405, file: !64, line: 1258, type: !423)
!1415 = !DILocation(line: 1258, column: 20, scope: !1405)
!1416 = !DILocation(line: 1259, column: 5, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1405, file: !64, line: 1259, column: 5)
!1418 = !DILocation(line: 1259, column: 17, scope: !1417)
!1419 = !DILocation(line: 1259, column: 5, scope: !1405)
!1420 = !DILocation(line: 1261, column: 6, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1422, file: !64, line: 1261, column: 6)
!1422 = distinct !DILexicalBlock(scope: !1417, file: !64, line: 1260, column: 2)
!1423 = !DILocation(line: 1261, column: 18, scope: !1421)
!1424 = !DILocation(line: 1261, column: 6, scope: !1422)
!1425 = !DILocation(line: 1263, column: 4, scope: !1426)
!1426 = distinct !DILexicalBlock(scope: !1421, file: !64, line: 1262, column: 3)
!1427 = !DILocation(line: 1267, column: 19, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1421, file: !64, line: 1266, column: 3)
!1429 = !DILocation(line: 1267, column: 18, scope: !1428)
!1430 = !DILocation(line: 1267, column: 16, scope: !1428)
!1431 = !DILocation(line: 1268, column: 16, scope: !1428)
!1432 = !DILocation(line: 1268, column: 30, scope: !1428)
!1433 = !DILocation(line: 1268, column: 40, scope: !1428)
!1434 = !DILocation(line: 1268, column: 39, scope: !1428)
!1435 = !DILocation(line: 1268, column: 55, scope: !1428)
!1436 = !DILocation(line: 1268, column: 53, scope: !1428)
!1437 = !DILocation(line: 1268, column: 26, scope: !1428)
!1438 = !DILocation(line: 1268, column: 69, scope: !1428)
!1439 = !DILocation(line: 1268, column: 13, scope: !1428)
!1440 = !DILocation(line: 1269, column: 16, scope: !1428)
!1441 = !DILocation(line: 1269, column: 25, scope: !1428)
!1442 = !DILocation(line: 1269, column: 24, scope: !1428)
!1443 = !DILocation(line: 1269, column: 41, scope: !1428)
!1444 = !DILocation(line: 1269, column: 51, scope: !1428)
!1445 = !DILocation(line: 1269, column: 50, scope: !1428)
!1446 = !DILocation(line: 1269, column: 38, scope: !1428)
!1447 = !DILocation(line: 1269, column: 13, scope: !1428)
!1448 = !DILocation(line: 1270, column: 7, scope: !1449)
!1449 = distinct !DILexicalBlock(scope: !1428, file: !64, line: 1270, column: 7)
!1450 = !DILocation(line: 1270, column: 16, scope: !1449)
!1451 = !DILocation(line: 1270, column: 7, scope: !1428)
!1452 = !DILocation(line: 1272, column: 13, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1449, file: !64, line: 1271, column: 4)
!1454 = !DILocation(line: 1272, column: 12, scope: !1453)
!1455 = !DILocation(line: 1272, column: 5, scope: !1453)
!1456 = !DILocation(line: 1276, column: 5, scope: !1457)
!1457 = distinct !DILexicalBlock(scope: !1449, file: !64, line: 1275, column: 4)
!1458 = !DILocation(line: 1282, column: 15, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1417, file: !64, line: 1281, column: 2)
!1460 = !DILocation(line: 1282, column: 29, scope: !1459)
!1461 = !DILocation(line: 1282, column: 39, scope: !1459)
!1462 = !DILocation(line: 1282, column: 38, scope: !1459)
!1463 = !DILocation(line: 1282, column: 54, scope: !1459)
!1464 = !DILocation(line: 1282, column: 52, scope: !1459)
!1465 = !DILocation(line: 1282, column: 25, scope: !1459)
!1466 = !DILocation(line: 1282, column: 68, scope: !1459)
!1467 = !DILocation(line: 1282, column: 12, scope: !1459)
!1468 = !DILocation(line: 1283, column: 15, scope: !1459)
!1469 = !DILocation(line: 1283, column: 24, scope: !1459)
!1470 = !DILocation(line: 1283, column: 23, scope: !1459)
!1471 = !DILocation(line: 1283, column: 40, scope: !1459)
!1472 = !DILocation(line: 1283, column: 50, scope: !1459)
!1473 = !DILocation(line: 1283, column: 49, scope: !1459)
!1474 = !DILocation(line: 1283, column: 37, scope: !1459)
!1475 = !DILocation(line: 1283, column: 12, scope: !1459)
!1476 = !DILocation(line: 1284, column: 6, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1459, file: !64, line: 1284, column: 6)
!1478 = !DILocation(line: 1284, column: 15, scope: !1477)
!1479 = !DILocation(line: 1284, column: 6, scope: !1459)
!1480 = !DILocation(line: 1286, column: 11, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1477, file: !64, line: 1285, column: 3)
!1482 = !DILocation(line: 1286, column: 4, scope: !1481)
!1483 = !DILocation(line: 1290, column: 4, scope: !1484)
!1484 = distinct !DILexicalBlock(scope: !1477, file: !64, line: 1289, column: 3)
!1485 = !DILocation(line: 1293, column: 1, scope: !1405)
!1486 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !64, file: !64, line: 1311, type: !1487, scopeLine: 1312, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1487 = !DISubroutineType(types: !1488)
!1488 = !{!25, !25, !423}
!1489 = !DILocalVariable(name: "numerator", arg: 1, scope: !1486, file: !64, line: 1311, type: !25)
!1490 = !DILocation(line: 1311, column: 25, scope: !1486)
!1491 = !DILocalVariable(name: "denominator", arg: 2, scope: !1486, file: !64, line: 1311, type: !423)
!1492 = !DILocation(line: 1311, column: 40, scope: !1486)
!1493 = !DILocalVariable(name: "s32Temp1", scope: !1486, file: !64, line: 1313, type: !25)
!1494 = !DILocation(line: 1313, column: 6, scope: !1486)
!1495 = !DILocalVariable(name: "s32Temp2", scope: !1486, file: !64, line: 1313, type: !25)
!1496 = !DILocation(line: 1313, column: 20, scope: !1486)
!1497 = !DILocalVariable(name: "u32Temp0", scope: !1486, file: !64, line: 1314, type: !423)
!1498 = !DILocation(line: 1314, column: 6, scope: !1486)
!1499 = !DILocalVariable(name: "u32Temp1", scope: !1486, file: !64, line: 1314, type: !423)
!1500 = !DILocation(line: 1314, column: 20, scope: !1486)
!1501 = !DILocalVariable(name: "u32Temp2", scope: !1486, file: !64, line: 1314, type: !423)
!1502 = !DILocation(line: 1314, column: 34, scope: !1486)
!1503 = !DILocation(line: 1315, column: 5, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1486, file: !64, line: 1315, column: 5)
!1505 = !DILocation(line: 1315, column: 17, scope: !1504)
!1506 = !DILocation(line: 1315, column: 5, scope: !1486)
!1507 = !DILocation(line: 1317, column: 6, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1509, file: !64, line: 1317, column: 6)
!1509 = distinct !DILexicalBlock(scope: !1504, file: !64, line: 1316, column: 2)
!1510 = !DILocation(line: 1317, column: 16, scope: !1508)
!1511 = !DILocation(line: 1317, column: 6, scope: !1509)
!1512 = !DILocation(line: 1319, column: 4, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1508, file: !64, line: 1318, column: 3)
!1514 = !DILocation(line: 1323, column: 4, scope: !1515)
!1515 = distinct !DILexicalBlock(scope: !1508, file: !64, line: 1322, column: 3)
!1516 = !DILocation(line: 1328, column: 6, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1518, file: !64, line: 1328, column: 6)
!1518 = distinct !DILexicalBlock(scope: !1504, file: !64, line: 1327, column: 2)
!1519 = !DILocation(line: 1328, column: 16, scope: !1517)
!1520 = !DILocation(line: 1328, column: 6, scope: !1518)
!1521 = !DILocation(line: 1330, column: 16, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1517, file: !64, line: 1329, column: 3)
!1523 = !DILocation(line: 1330, column: 15, scope: !1522)
!1524 = !DILocation(line: 1330, column: 13, scope: !1522)
!1525 = !DILocation(line: 1331, column: 16, scope: !1522)
!1526 = !DILocation(line: 1331, column: 25, scope: !1522)
!1527 = !DILocation(line: 1331, column: 24, scope: !1522)
!1528 = !DILocation(line: 1331, column: 13, scope: !1522)
!1529 = !DILocation(line: 1332, column: 15, scope: !1522)
!1530 = !DILocation(line: 1332, column: 28, scope: !1522)
!1531 = !DILocation(line: 1332, column: 37, scope: !1522)
!1532 = !DILocation(line: 1332, column: 36, scope: !1522)
!1533 = !DILocation(line: 1332, column: 52, scope: !1522)
!1534 = !DILocation(line: 1332, column: 50, scope: !1522)
!1535 = !DILocation(line: 1332, column: 24, scope: !1522)
!1536 = !DILocation(line: 1332, column: 13, scope: !1522)
!1537 = !DILocation(line: 1334, column: 8, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1522, file: !64, line: 1334, column: 7)
!1539 = !DILocation(line: 1334, column: 20, scope: !1538)
!1540 = !DILocation(line: 1334, column: 27, scope: !1538)
!1541 = !DILocation(line: 1334, column: 7, scope: !1522)
!1542 = !DILocation(line: 1336, column: 20, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1538, file: !64, line: 1335, column: 4)
!1544 = !DILocation(line: 1336, column: 32, scope: !1543)
!1545 = !DILocation(line: 1336, column: 17, scope: !1543)
!1546 = !DILocation(line: 1337, column: 4, scope: !1543)
!1547 = !DILocation(line: 1340, column: 20, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1538, file: !64, line: 1339, column: 4)
!1549 = !DILocation(line: 1340, column: 32, scope: !1548)
!1550 = !DILocation(line: 1340, column: 38, scope: !1548)
!1551 = !DILocation(line: 1340, column: 17, scope: !1548)
!1552 = !DILocation(line: 1344, column: 7, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1522, file: !64, line: 1344, column: 7)
!1554 = !DILocation(line: 1344, column: 18, scope: !1553)
!1555 = !DILocation(line: 1344, column: 16, scope: !1553)
!1556 = !DILocation(line: 1344, column: 7, scope: !1522)
!1557 = !DILocation(line: 1346, column: 14, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1553, file: !64, line: 1345, column: 4)
!1559 = !DILocation(line: 1346, column: 13, scope: !1558)
!1560 = !DILocation(line: 1346, column: 23, scope: !1558)
!1561 = !DILocation(line: 1346, column: 5, scope: !1558)
!1562 = !DILocation(line: 1350, column: 14, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1553, file: !64, line: 1349, column: 4)
!1564 = !DILocation(line: 1350, column: 23, scope: !1563)
!1565 = !DILocation(line: 1350, column: 12, scope: !1563)
!1566 = !DILocation(line: 1350, column: 27, scope: !1563)
!1567 = !DILocation(line: 1350, column: 5, scope: !1563)
!1568 = !DILocation(line: 1357, column: 16, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1517, file: !64, line: 1356, column: 3)
!1570 = !DILocation(line: 1357, column: 30, scope: !1569)
!1571 = !DILocation(line: 1357, column: 40, scope: !1569)
!1572 = !DILocation(line: 1357, column: 39, scope: !1569)
!1573 = !DILocation(line: 1357, column: 55, scope: !1569)
!1574 = !DILocation(line: 1357, column: 53, scope: !1569)
!1575 = !DILocation(line: 1357, column: 26, scope: !1569)
!1576 = !DILocation(line: 1357, column: 69, scope: !1569)
!1577 = !DILocation(line: 1357, column: 13, scope: !1569)
!1578 = !DILocation(line: 1358, column: 16, scope: !1569)
!1579 = !DILocation(line: 1358, column: 26, scope: !1569)
!1580 = !DILocation(line: 1358, column: 25, scope: !1569)
!1581 = !DILocation(line: 1358, column: 42, scope: !1569)
!1582 = !DILocation(line: 1358, column: 51, scope: !1569)
!1583 = !DILocation(line: 1358, column: 50, scope: !1569)
!1584 = !DILocation(line: 1358, column: 39, scope: !1569)
!1585 = !DILocation(line: 1358, column: 13, scope: !1569)
!1586 = !DILocation(line: 1359, column: 11, scope: !1569)
!1587 = !DILocation(line: 1359, column: 4, scope: !1569)
!1588 = !DILocation(line: 1362, column: 1, scope: !1486)
!1589 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !64, file: !64, line: 1379, type: !1590, scopeLine: 1380, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{!25, !25, !25}
!1592 = !DILocalVariable(name: "numerator", arg: 1, scope: !1589, file: !64, line: 1379, type: !25)
!1593 = !DILocation(line: 1379, column: 25, scope: !1589)
!1594 = !DILocalVariable(name: "denominator", arg: 2, scope: !1589, file: !64, line: 1379, type: !25)
!1595 = !DILocation(line: 1379, column: 40, scope: !1589)
!1596 = !DILocalVariable(name: "s32Temp1", scope: !1589, file: !64, line: 1381, type: !25)
!1597 = !DILocation(line: 1381, column: 6, scope: !1589)
!1598 = !DILocalVariable(name: "s32Temp2", scope: !1589, file: !64, line: 1381, type: !25)
!1599 = !DILocation(line: 1381, column: 20, scope: !1589)
!1600 = !DILocalVariable(name: "denominator_prime", scope: !1589, file: !64, line: 1382, type: !423)
!1601 = !DILocation(line: 1382, column: 6, scope: !1589)
!1602 = !DILocalVariable(name: "u32Temp1", scope: !1589, file: !64, line: 1382, type: !423)
!1603 = !DILocation(line: 1382, column: 29, scope: !1589)
!1604 = !DILocalVariable(name: "u32Temp2", scope: !1589, file: !64, line: 1382, type: !423)
!1605 = !DILocation(line: 1382, column: 43, scope: !1589)
!1606 = !DILocalVariable(name: "u32numerator", scope: !1589, file: !64, line: 1383, type: !423)
!1607 = !DILocation(line: 1383, column: 6, scope: !1589)
!1608 = !DILocalVariable(name: "u32denominator", scope: !1589, file: !64, line: 1383, type: !423)
!1609 = !DILocation(line: 1383, column: 23, scope: !1589)
!1610 = !DILocation(line: 1384, column: 5, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1589, file: !64, line: 1384, column: 5)
!1612 = !DILocation(line: 1384, column: 15, scope: !1611)
!1613 = !DILocation(line: 1384, column: 5, scope: !1589)
!1614 = !DILocation(line: 1386, column: 6, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1616, file: !64, line: 1386, column: 6)
!1616 = distinct !DILexicalBlock(scope: !1611, file: !64, line: 1385, column: 2)
!1617 = !DILocation(line: 1386, column: 18, scope: !1615)
!1618 = !DILocation(line: 1386, column: 6, scope: !1616)
!1619 = !DILocation(line: 1388, column: 7, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1621, file: !64, line: 1388, column: 7)
!1621 = distinct !DILexicalBlock(scope: !1615, file: !64, line: 1387, column: 3)
!1622 = !DILocation(line: 1388, column: 19, scope: !1620)
!1623 = !DILocation(line: 1388, column: 7, scope: !1621)
!1624 = !DILocation(line: 1390, column: 5, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !64, line: 1389, column: 4)
!1626 = !DILocation(line: 1395, column: 46, scope: !1627)
!1627 = distinct !DILexicalBlock(scope: !1628, file: !64, line: 1395, column: 9)
!1628 = distinct !DILexicalBlock(scope: !1620, file: !64, line: 1393, column: 4)
!1629 = !DILocation(line: 1395, column: 36, scope: !1627)
!1630 = !DILocation(line: 1395, column: 11, scope: !1627)
!1631 = !DILocation(line: 1395, column: 9, scope: !1628)
!1632 = !DILocation(line: 1396, column: 9, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1627, file: !64, line: 1395, column: 60)
!1634 = !DILocation(line: 1398, column: 21, scope: !1628)
!1635 = !DILocation(line: 1398, column: 20, scope: !1628)
!1636 = !DILocation(line: 1398, column: 18, scope: !1628)
!1637 = !DILocation(line: 1400, column: 46, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1628, file: !64, line: 1400, column: 9)
!1639 = !DILocation(line: 1400, column: 36, scope: !1638)
!1640 = !DILocation(line: 1400, column: 11, scope: !1638)
!1641 = !DILocation(line: 1400, column: 9, scope: !1628)
!1642 = !DILocation(line: 1401, column: 9, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1638, file: !64, line: 1400, column: 62)
!1644 = !DILocation(line: 1403, column: 23, scope: !1628)
!1645 = !DILocation(line: 1403, column: 22, scope: !1628)
!1646 = !DILocation(line: 1403, column: 20, scope: !1628)
!1647 = !DILocation(line: 1404, column: 16, scope: !1628)
!1648 = !DILocation(line: 1404, column: 33, scope: !1628)
!1649 = !DILocation(line: 1404, column: 46, scope: !1628)
!1650 = !DILocation(line: 1404, column: 45, scope: !1628)
!1651 = !DILocation(line: 1404, column: 64, scope: !1628)
!1652 = !DILocation(line: 1404, column: 62, scope: !1628)
!1653 = !DILocation(line: 1404, column: 29, scope: !1628)
!1654 = !DILocation(line: 1404, column: 81, scope: !1628)
!1655 = !DILocation(line: 1404, column: 14, scope: !1628)
!1656 = !DILocation(line: 1405, column: 17, scope: !1628)
!1657 = !DILocation(line: 1405, column: 30, scope: !1628)
!1658 = !DILocation(line: 1405, column: 29, scope: !1628)
!1659 = !DILocation(line: 1405, column: 49, scope: !1628)
!1660 = !DILocation(line: 1405, column: 58, scope: !1628)
!1661 = !DILocation(line: 1405, column: 57, scope: !1628)
!1662 = !DILocation(line: 1405, column: 46, scope: !1628)
!1663 = !DILocation(line: 1405, column: 14, scope: !1628)
!1664 = !DILocation(line: 1406, column: 8, scope: !1665)
!1665 = distinct !DILexicalBlock(scope: !1628, file: !64, line: 1406, column: 8)
!1666 = !DILocation(line: 1406, column: 17, scope: !1665)
!1667 = !DILocation(line: 1406, column: 8, scope: !1628)
!1668 = !DILocation(line: 1408, column: 13, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1665, file: !64, line: 1407, column: 5)
!1670 = !DILocation(line: 1408, column: 6, scope: !1669)
!1671 = !DILocation(line: 1412, column: 6, scope: !1672)
!1672 = distinct !DILexicalBlock(scope: !1665, file: !64, line: 1411, column: 5)
!1673 = !DILocation(line: 1419, column: 52, scope: !1674)
!1674 = distinct !DILexicalBlock(scope: !1675, file: !64, line: 1419, column: 8)
!1675 = distinct !DILexicalBlock(scope: !1615, file: !64, line: 1417, column: 3)
!1676 = !DILocation(line: 1419, column: 51, scope: !1674)
!1677 = !DILocation(line: 1419, column: 35, scope: !1674)
!1678 = !DILocation(line: 1419, column: 10, scope: !1674)
!1679 = !DILocation(line: 1419, column: 8, scope: !1675)
!1680 = !DILocation(line: 1420, column: 8, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1674, file: !64, line: 1419, column: 81)
!1682 = !DILocation(line: 1427, column: 43, scope: !1675)
!1683 = !DILocation(line: 1427, column: 42, scope: !1675)
!1684 = !DILocation(line: 1427, column: 54, scope: !1675)
!1685 = !DILocation(line: 1427, column: 26, scope: !1675)
!1686 = !DILocation(line: 1427, column: 24, scope: !1675)
!1687 = !DILocation(line: 1428, column: 4, scope: !1675)
!1688 = !DILocation(line: 1436, column: 6, scope: !1689)
!1689 = distinct !DILexicalBlock(scope: !1690, file: !64, line: 1436, column: 6)
!1690 = distinct !DILexicalBlock(scope: !1611, file: !64, line: 1435, column: 2)
!1691 = !DILocation(line: 1436, column: 18, scope: !1689)
!1692 = !DILocation(line: 1436, column: 6, scope: !1690)
!1693 = !DILocation(line: 1438, column: 7, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1695, file: !64, line: 1438, column: 7)
!1695 = distinct !DILexicalBlock(scope: !1689, file: !64, line: 1437, column: 3)
!1696 = !DILocation(line: 1438, column: 19, scope: !1694)
!1697 = !DILocation(line: 1438, column: 7, scope: !1695)
!1698 = !DILocation(line: 1440, column: 5, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1694, file: !64, line: 1439, column: 4)
!1700 = !DILocation(line: 1444, column: 23, scope: !1701)
!1701 = distinct !DILexicalBlock(scope: !1694, file: !64, line: 1443, column: 4)
!1702 = !DILocation(line: 1444, column: 22, scope: !1701)
!1703 = !DILocation(line: 1444, column: 35, scope: !1701)
!1704 = !DILocation(line: 1444, column: 20, scope: !1701)
!1705 = !DILocation(line: 1445, column: 17, scope: !1701)
!1706 = !DILocation(line: 1445, column: 31, scope: !1701)
!1707 = !DILocation(line: 1445, column: 41, scope: !1701)
!1708 = !DILocation(line: 1445, column: 40, scope: !1701)
!1709 = !DILocation(line: 1445, column: 59, scope: !1701)
!1710 = !DILocation(line: 1445, column: 57, scope: !1701)
!1711 = !DILocation(line: 1445, column: 27, scope: !1701)
!1712 = !DILocation(line: 1445, column: 76, scope: !1701)
!1713 = !DILocation(line: 1445, column: 14, scope: !1701)
!1714 = !DILocation(line: 1446, column: 17, scope: !1701)
!1715 = !DILocation(line: 1446, column: 27, scope: !1701)
!1716 = !DILocation(line: 1446, column: 26, scope: !1701)
!1717 = !DILocation(line: 1446, column: 46, scope: !1701)
!1718 = !DILocation(line: 1446, column: 55, scope: !1701)
!1719 = !DILocation(line: 1446, column: 54, scope: !1701)
!1720 = !DILocation(line: 1446, column: 43, scope: !1701)
!1721 = !DILocation(line: 1446, column: 14, scope: !1701)
!1722 = !DILocation(line: 1447, column: 14, scope: !1701)
!1723 = !DILocation(line: 1447, column: 13, scope: !1701)
!1724 = !DILocation(line: 1447, column: 23, scope: !1701)
!1725 = !DILocation(line: 1447, column: 5, scope: !1701)
!1726 = !DILocation(line: 1452, column: 16, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1689, file: !64, line: 1451, column: 3)
!1728 = !DILocation(line: 1452, column: 30, scope: !1727)
!1729 = !DILocation(line: 1452, column: 40, scope: !1727)
!1730 = !DILocation(line: 1452, column: 39, scope: !1727)
!1731 = !DILocation(line: 1452, column: 55, scope: !1727)
!1732 = !DILocation(line: 1452, column: 53, scope: !1727)
!1733 = !DILocation(line: 1452, column: 26, scope: !1727)
!1734 = !DILocation(line: 1452, column: 69, scope: !1727)
!1735 = !DILocation(line: 1452, column: 13, scope: !1727)
!1736 = !DILocation(line: 1453, column: 16, scope: !1727)
!1737 = !DILocation(line: 1453, column: 26, scope: !1727)
!1738 = !DILocation(line: 1453, column: 25, scope: !1727)
!1739 = !DILocation(line: 1453, column: 42, scope: !1727)
!1740 = !DILocation(line: 1453, column: 51, scope: !1727)
!1741 = !DILocation(line: 1453, column: 50, scope: !1727)
!1742 = !DILocation(line: 1453, column: 39, scope: !1727)
!1743 = !DILocation(line: 1453, column: 13, scope: !1727)
!1744 = !DILocation(line: 1454, column: 11, scope: !1727)
!1745 = !DILocation(line: 1454, column: 4, scope: !1727)
!1746 = !DILocation(line: 1457, column: 1, scope: !1589)
!1747 = distinct !DISubprogram(name: "klee_alarm_s32_neg_valid", scope: !30, file: !30, line: 42, type: !1748, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1748 = !DISubroutineType(types: !1749)
!1749 = !{!28, !22}
!1750 = !DILocalVariable(name: "value", arg: 1, scope: !1747, file: !30, line: 42, type: !22)
!1751 = !DILocation(line: 42, column: 38, scope: !1747)
!1752 = !DILocation(line: 44, column: 12, scope: !1747)
!1753 = !DILocation(line: 44, column: 18, scope: !1747)
!1754 = !DILocation(line: 44, column: 5, scope: !1747)
!1755 = distinct !DISubprogram(name: "klee_alarm_s32_add_upper", scope: !30, file: !30, line: 54, type: !1756, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1756 = !DISubroutineType(types: !1757)
!1757 = !{!28, !22, !22}
!1758 = !DILocalVariable(name: "left", arg: 1, scope: !1755, file: !30, line: 54, type: !22)
!1759 = !DILocation(line: 54, column: 38, scope: !1755)
!1760 = !DILocalVariable(name: "right", arg: 2, scope: !1755, file: !30, line: 54, type: !22)
!1761 = !DILocation(line: 54, column: 52, scope: !1755)
!1762 = !DILocation(line: 56, column: 12, scope: !1755)
!1763 = !DILocation(line: 56, column: 19, scope: !1755)
!1764 = !DILocation(line: 56, column: 17, scope: !1755)
!1765 = !DILocation(line: 56, column: 25, scope: !1755)
!1766 = !DILocation(line: 56, column: 5, scope: !1755)
!1767 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !64, file: !64, line: 1475, type: !1768, scopeLine: 1476, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1768 = !DISubroutineType(types: !1769)
!1769 = !{!6, !25, !423}
!1770 = !DILocalVariable(name: "numerator", arg: 1, scope: !1767, file: !64, line: 1475, type: !25)
!1771 = !DILocation(line: 1475, column: 25, scope: !1767)
!1772 = !DILocalVariable(name: "denominator", arg: 2, scope: !1767, file: !64, line: 1475, type: !423)
!1773 = !DILocation(line: 1475, column: 40, scope: !1767)
!1774 = !DILocalVariable(name: "numerator_prime", scope: !1767, file: !64, line: 1478, type: !423)
!1775 = !DILocation(line: 1478, column: 6, scope: !1767)
!1776 = !DILocalVariable(name: "u32Temp1", scope: !1767, file: !64, line: 1478, type: !423)
!1777 = !DILocation(line: 1478, column: 27, scope: !1767)
!1778 = !DILocalVariable(name: "u32Temp2", scope: !1767, file: !64, line: 1478, type: !423)
!1779 = !DILocation(line: 1478, column: 41, scope: !1767)
!1780 = !DILocalVariable(name: "u32Temp3", scope: !1767, file: !64, line: 1478, type: !423)
!1781 = !DILocation(line: 1478, column: 55, scope: !1767)
!1782 = !DILocalVariable(name: "s32Temp1", scope: !1767, file: !64, line: 1479, type: !25)
!1783 = !DILocation(line: 1479, column: 6, scope: !1767)
!1784 = !DILocalVariable(name: "s32Temp2", scope: !1767, file: !64, line: 1479, type: !25)
!1785 = !DILocation(line: 1479, column: 20, scope: !1767)
!1786 = !DILocalVariable(name: "s32Temp3", scope: !1767, file: !64, line: 1479, type: !25)
!1787 = !DILocation(line: 1479, column: 34, scope: !1767)
!1788 = !DILocation(line: 1480, column: 5, scope: !1789)
!1789 = distinct !DILexicalBlock(scope: !1767, file: !64, line: 1480, column: 5)
!1790 = !DILocation(line: 1480, column: 17, scope: !1789)
!1791 = !DILocation(line: 1480, column: 5, scope: !1767)
!1792 = !DILocation(line: 1482, column: 6, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1794, file: !64, line: 1482, column: 6)
!1794 = distinct !DILexicalBlock(scope: !1789, file: !64, line: 1481, column: 2)
!1795 = !DILocation(line: 1482, column: 15, scope: !1793)
!1796 = !DILocation(line: 1482, column: 6, scope: !1794)
!1797 = !DILocation(line: 1484, column: 4, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1793, file: !64, line: 1483, column: 3)
!1799 = !DILocation(line: 1488, column: 4, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1793, file: !64, line: 1487, column: 3)
!1801 = !DILocation(line: 1493, column: 6, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1803, file: !64, line: 1493, column: 6)
!1803 = distinct !DILexicalBlock(scope: !1789, file: !64, line: 1492, column: 2)
!1804 = !DILocation(line: 1493, column: 16, scope: !1802)
!1805 = !DILocation(line: 1493, column: 6, scope: !1803)
!1806 = !DILocation(line: 1495, column: 23, scope: !1807)
!1807 = distinct !DILexicalBlock(scope: !1802, file: !64, line: 1494, column: 3)
!1808 = !DILocation(line: 1495, column: 22, scope: !1807)
!1809 = !DILocation(line: 1495, column: 20, scope: !1807)
!1810 = !DILocation(line: 1496, column: 16, scope: !1807)
!1811 = !DILocation(line: 1496, column: 32, scope: !1807)
!1812 = !DILocation(line: 1496, column: 31, scope: !1807)
!1813 = !DILocation(line: 1496, column: 13, scope: !1807)
!1814 = !DILocation(line: 1497, column: 15, scope: !1807)
!1815 = !DILocation(line: 1497, column: 34, scope: !1807)
!1816 = !DILocation(line: 1497, column: 45, scope: !1807)
!1817 = !DILocation(line: 1497, column: 43, scope: !1807)
!1818 = !DILocation(line: 1497, column: 31, scope: !1807)
!1819 = !DILocation(line: 1497, column: 13, scope: !1807)
!1820 = !DILocation(line: 1499, column: 8, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1499, column: 7)
!1822 = !DILocation(line: 1499, column: 20, scope: !1821)
!1823 = !DILocation(line: 1499, column: 27, scope: !1821)
!1824 = !DILocation(line: 1499, column: 7, scope: !1807)
!1825 = !DILocation(line: 1501, column: 19, scope: !1826)
!1826 = distinct !DILexicalBlock(scope: !1821, file: !64, line: 1500, column: 4)
!1827 = !DILocation(line: 1501, column: 31, scope: !1826)
!1828 = !DILocation(line: 1501, column: 17, scope: !1826)
!1829 = !DILocation(line: 1502, column: 4, scope: !1826)
!1830 = !DILocation(line: 1505, column: 20, scope: !1831)
!1831 = distinct !DILexicalBlock(scope: !1821, file: !64, line: 1504, column: 4)
!1832 = !DILocation(line: 1505, column: 32, scope: !1831)
!1833 = !DILocation(line: 1505, column: 38, scope: !1831)
!1834 = !DILocation(line: 1505, column: 17, scope: !1831)
!1835 = !DILocation(line: 1508, column: 7, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1508, column: 7)
!1837 = !DILocation(line: 1508, column: 18, scope: !1836)
!1838 = !DILocation(line: 1508, column: 16, scope: !1836)
!1839 = !DILocation(line: 1508, column: 7, scope: !1807)
!1840 = !DILocation(line: 1510, column: 18, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1836, file: !64, line: 1509, column: 4)
!1842 = !DILocation(line: 1510, column: 16, scope: !1841)
!1843 = !DILocation(line: 1510, column: 28, scope: !1841)
!1844 = !DILocation(line: 1510, column: 14, scope: !1841)
!1845 = !DILocation(line: 1511, column: 4, scope: !1841)
!1846 = !DILocation(line: 1514, column: 18, scope: !1847)
!1847 = distinct !DILexicalBlock(scope: !1836, file: !64, line: 1513, column: 4)
!1848 = !DILocation(line: 1514, column: 26, scope: !1847)
!1849 = !DILocation(line: 1514, column: 16, scope: !1847)
!1850 = !DILocation(line: 1514, column: 30, scope: !1847)
!1851 = !DILocation(line: 1514, column: 14, scope: !1847)
!1852 = !DILocation(line: 1516, column: 8, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1807, file: !64, line: 1516, column: 7)
!1854 = !DILocation(line: 1516, column: 18, scope: !1853)
!1855 = !DILocation(line: 1516, column: 7, scope: !1807)
!1856 = !DILocation(line: 1518, column: 18, scope: !1857)
!1857 = distinct !DILexicalBlock(scope: !1853, file: !64, line: 1517, column: 4)
!1858 = !DILocation(line: 1518, column: 12, scope: !1857)
!1859 = !DILocation(line: 1518, column: 5, scope: !1857)
!1860 = !DILocation(line: 1522, column: 5, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1853, file: !64, line: 1521, column: 4)
!1862 = !DILocation(line: 1527, column: 16, scope: !1863)
!1863 = distinct !DILexicalBlock(scope: !1802, file: !64, line: 1526, column: 3)
!1864 = !DILocation(line: 1527, column: 26, scope: !1863)
!1865 = !DILocation(line: 1527, column: 25, scope: !1863)
!1866 = !DILocation(line: 1527, column: 41, scope: !1863)
!1867 = !DILocation(line: 1527, column: 39, scope: !1863)
!1868 = !DILocation(line: 1527, column: 13, scope: !1863)
!1869 = !DILocation(line: 1528, column: 16, scope: !1863)
!1870 = !DILocation(line: 1528, column: 30, scope: !1863)
!1871 = !DILocation(line: 1528, column: 40, scope: !1863)
!1872 = !DILocation(line: 1528, column: 39, scope: !1863)
!1873 = !DILocation(line: 1528, column: 55, scope: !1863)
!1874 = !DILocation(line: 1528, column: 53, scope: !1863)
!1875 = !DILocation(line: 1528, column: 26, scope: !1863)
!1876 = !DILocation(line: 1528, column: 68, scope: !1863)
!1877 = !DILocation(line: 1528, column: 13, scope: !1863)
!1878 = !DILocation(line: 1529, column: 16, scope: !1863)
!1879 = !DILocation(line: 1529, column: 25, scope: !1863)
!1880 = !DILocation(line: 1529, column: 24, scope: !1863)
!1881 = !DILocation(line: 1529, column: 41, scope: !1863)
!1882 = !DILocation(line: 1529, column: 51, scope: !1863)
!1883 = !DILocation(line: 1529, column: 50, scope: !1863)
!1884 = !DILocation(line: 1529, column: 38, scope: !1863)
!1885 = !DILocation(line: 1529, column: 13, scope: !1863)
!1886 = !DILocation(line: 1530, column: 7, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1863, file: !64, line: 1530, column: 7)
!1888 = !DILocation(line: 1530, column: 16, scope: !1887)
!1889 = !DILocation(line: 1530, column: 7, scope: !1863)
!1890 = !DILocation(line: 1532, column: 17, scope: !1891)
!1891 = distinct !DILexicalBlock(scope: !1887, file: !64, line: 1531, column: 4)
!1892 = !DILocation(line: 1532, column: 12, scope: !1891)
!1893 = !DILocation(line: 1532, column: 5, scope: !1891)
!1894 = !DILocation(line: 1536, column: 5, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1887, file: !64, line: 1535, column: 4)
!1896 = !DILocation(line: 1540, column: 1, scope: !1767)
!1897 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1898, file: !1898, line: 12, type: !1899, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1902)
!1898 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1899 = !DISubroutineType(types: !1900)
!1900 = !{null, !1901}
!1901 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1902 = !{!1903}
!1903 = !DILocalVariable(name: "z", arg: 1, scope: !1897, file: !1898, line: 12, type: !1901)
!1904 = !DILocation(line: 0, scope: !1897)
!1905 = !DILocation(line: 13, column: 9, scope: !1906)
!1906 = distinct !DILexicalBlock(scope: !1897, file: !1898, line: 13, column: 7)
!1907 = !DILocation(line: 13, column: 7, scope: !1897)
!1908 = !DILocation(line: 14, column: 5, scope: !1906)
!1909 = !DILocation(line: 15, column: 1, scope: !1897)
