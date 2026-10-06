; ModuleID = '/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123/build/u16_div_s32_u16_alarm_0123.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"x_value\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"y_value\00", align 1
@.str.3 = private unnamed_addr constant [33 x i8] c"src_analysis/sources/div_Ccode.c\00", align 1
@.str.1.4 = private unnamed_addr constant [102 x i8] c"KLEE-ALARM-0123: signed overflow. assert -2147483648 <= (s32)(x_value / (s32)y_value) * (s32)y_value;\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"klee-alarm-0123.err\00", align 1
@klee_alarm_sink_s64 = internal global i64 0, align 8, !dbg !0
@.str.4 = private unnamed_addr constant [67 x i8] c"/build/klee/parts/klee/src/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str.1.5 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str.2.6 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %x_value = alloca i32, align 4
  %y_value = alloca i16, align 2
  %result = alloca i16, align 2
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value, metadata !47, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i16* %y_value, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i16* %result, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = bitcast i32* %x_value to i8*, !dbg !53
  call void @klee_make_symbolic(i8* %0, i64 4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)), !dbg !54
  %1 = bitcast i16* %y_value to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %1, i64 2, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  %2 = load i32, i32* %x_value, align 4, !dbg !57
  %3 = load i16, i16* %y_value, align 2, !dbg !58
  %call = call zeroext i16 @u16_div_s32_u16(i32 %2, i16 zeroext %3), !dbg !59
  store i16 %call, i16* %result, align 2, !dbg !60
  %4 = load i16, i16* %result, align 2, !dbg !61
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
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !490
  %conv9 = zext i16 %4 to i32, !dbg !491
  %int_cast_to_i64 = zext i32 %conv9 to i64, !dbg !492
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !492
  %div = sdiv i32 %3, %conv9, !dbg !492, !klee.check.div !101
  %conv10 = sext i32 %div to i64, !dbg !493
  %5 = load i16, i16* %y_value.addr, align 2, !dbg !494
  %conv11 = zext i16 %5 to i32, !dbg !495
  %conv12 = sext i32 %conv11 to i64, !dbg !496
  %call = call i32 @klee_alarm_s32_mul_upper(i64 %conv10, i64 %conv12), !dbg !497
  %tobool = icmp ne i32 %call, 0, !dbg !497
  br i1 %tobool, label %if.end, label %if.then13, !dbg !498

if.then13:                                        ; preds = %if.else8
  store i16 0, i16* %retval, align 2, !dbg !499
  br label %return, !dbg !499

if.end:                                           ; preds = %if.else8
  %6 = load i32, i32* %x_value.addr, align 4, !dbg !501
  %7 = load i16, i16* %y_value.addr, align 2, !dbg !503
  %conv14 = zext i16 %7 to i32, !dbg !504
  %int_cast_to_i641 = zext i32 %conv14 to i64, !dbg !505
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !505
  %div15 = sdiv i32 %6, %conv14, !dbg !505, !klee.check.div !101
  %conv16 = sext i32 %div15 to i64, !dbg !506
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !507
  %conv17 = zext i16 %8 to i32, !dbg !508
  %conv18 = sext i32 %conv17 to i64, !dbg !509
  %call19 = call i32 @klee_alarm_s32_mul_lower(i64 %conv16, i64 %conv18), !dbg !510
  %tobool20 = icmp ne i32 %call19, 0, !dbg !510
  br i1 %tobool20, label %if.end22, label %if.then21, !dbg !511

if.then21:                                        ; preds = %if.end
  call void @klee_report_error(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.3, i64 0, i64 0), i32 503, i8* getelementptr inbounds ([102 x i8], [102 x i8]* @.str.1.4, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i64 0, i64 0)) #5, !dbg !512
  unreachable, !dbg !512

if.end22:                                         ; preds = %if.end
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !514
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !515
  %conv23 = zext i16 %10 to i32, !dbg !516
  %int_cast_to_i642 = zext i32 %conv23 to i64, !dbg !517
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !517
  %div24 = sdiv i32 %9, %conv23, !dbg !517, !klee.check.div !101
  %11 = load i16, i16* %y_value.addr, align 2, !dbg !518
  %conv25 = zext i16 %11 to i32, !dbg !519
  %mul = mul nsw i32 %div24, %conv25, !dbg !520
  %conv26 = sext i32 %mul to i64, !dbg !521
  store volatile i64 %conv26, i64* @klee_alarm_sink_s64, align 8, !dbg !522
  store i16 0, i16* %retval, align 2, !dbg !523
  br label %return, !dbg !523

return:                                           ; preds = %if.end22, %if.then13, %if.else, %if.then7
  %12 = load i16, i16* %retval, align 2, !dbg !524
  ret i16 %12, !dbg !524
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_upper(i64 %left, i64 %right) #0 !dbg !525 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !528, metadata !DIExpression()), !dbg !529
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !530, metadata !DIExpression()), !dbg !531
  %0 = load i64, i64* %left.addr, align 8, !dbg !532
  %1 = load i64, i64* %right.addr, align 8, !dbg !533
  %mul = mul nsw i64 %0, %1, !dbg !534
  %cmp = icmp sle i64 %mul, 2147483647, !dbg !535
  %conv = zext i1 %cmp to i32, !dbg !535
  ret i32 %conv, !dbg !536
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @klee_alarm_s32_mul_lower(i64 %left, i64 %right) #0 !dbg !537 {
entry:
  %left.addr = alloca i64, align 8
  %right.addr = alloca i64, align 8
  store i64 %left, i64* %left.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %left.addr, metadata !538, metadata !DIExpression()), !dbg !539
  store i64 %right, i64* %right.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %right.addr, metadata !540, metadata !DIExpression()), !dbg !541
  %0 = load i64, i64* %left.addr, align 8, !dbg !542
  %1 = load i64, i64* %right.addr, align 8, !dbg !543
  %mul = mul nsw i64 %0, %1, !dbg !544
  %cmp = icmp sge i64 %mul, -2147483648, !dbg !545
  %conv = zext i1 %cmp to i32, !dbg !545
  ret i32 %conv, !dbg !546
}

; Function Attrs: noreturn
declare dso_local void @klee_report_error(i8*, i32, i8*, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_fac1_div_u16_u16(i16 zeroext %numerator, i16 zeroext %denominator) #0 !dbg !547 {
entry:
  %retval = alloca i16, align 2
  %numerator.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp = alloca i32, align 4
  store i16 %numerator, i16* %numerator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %numerator.addr, metadata !550, metadata !DIExpression()), !dbg !551
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata i32* %u32Temp, metadata !554, metadata !DIExpression()), !dbg !555
  store i32 0, i32* %u32Temp, align 4, !dbg !555
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !556
  %conv = zext i16 %0 to i32, !dbg !556
  %cmp = icmp eq i32 %conv, 0, !dbg !558
  br i1 %cmp, label %if.then, label %if.else, !dbg !559

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !560
  br label %return, !dbg !560

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %numerator.addr, align 2, !dbg !562
  %conv2 = zext i16 %1 to i32, !dbg !562
  %shl = shl i32 %conv2, 16, !dbg !564
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !565
  %conv3 = zext i16 %2 to i32, !dbg !565
  %shr = ashr i32 %conv3, 1, !dbg !566
  %add = add nsw i32 %shl, %shr, !dbg !567
  store i32 %add, i32* %u32Temp, align 4, !dbg !568
  %3 = load i32, i32* %u32Temp, align 4, !dbg !569
  %4 = load i16, i16* %denominator.addr, align 2, !dbg !570
  %conv4 = zext i16 %4 to i32, !dbg !570
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !571
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !571
  %div = udiv i32 %3, %conv4, !dbg !571, !klee.check.div !101
  store i32 %div, i32* %u32Temp, align 4, !dbg !572
  %5 = load i32, i32* %u32Temp, align 4, !dbg !573
  %cmp5 = icmp ult i32 %5, 65535, !dbg !575
  br i1 %cmp5, label %if.then7, label %if.else9, !dbg !576

if.then7:                                         ; preds = %if.else
  %6 = load i32, i32* %u32Temp, align 4, !dbg !577
  %and = and i32 %6, 65535, !dbg !579
  %conv8 = trunc i32 %and to i16, !dbg !577
  store i16 %conv8, i16* %retval, align 2, !dbg !580
  br label %return, !dbg !580

if.else9:                                         ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !581
  br label %return, !dbg !581

return:                                           ; preds = %if.else9, %if.then7, %if.then
  %7 = load i16, i16* %retval, align 2, !dbg !583
  ret i16 %7, !dbg !583
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !584 {
entry:
  %retval = alloca i16, align 2
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !587, metadata !DIExpression()), !dbg !588
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !591, metadata !DIExpression()), !dbg !592
  store i32 0, i32* %u32Temp1, align 4, !dbg !592
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !593, metadata !DIExpression()), !dbg !594
  store i32 0, i32* %u32Temp2, align 4, !dbg !594
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !595
  %conv = zext i16 %0 to i32, !dbg !595
  %and = and i32 %conv, 65535, !dbg !596
  %conv1 = trunc i32 %and to i16, !dbg !595
  store i16 %conv1, i16* %y_value.addr, align 2, !dbg !597
  %1 = load i16, i16* %y_value.addr, align 2, !dbg !598
  %conv2 = zext i16 %1 to i32, !dbg !598
  %cmp = icmp eq i32 %conv2, 0, !dbg !600
  br i1 %cmp, label %if.then, label %if.else, !dbg !601

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !602
  br label %return, !dbg !602

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !604
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !606
  %conv4 = zext i16 %3 to i32, !dbg !606
  %int_cast_to_i64 = zext i32 %conv4 to i64, !dbg !607
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !607
  %div = udiv i32 %2, %conv4, !dbg !607, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !608
  %4 = load i32, i32* %x_value.addr, align 4, !dbg !609
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !610
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !611
  %conv5 = zext i16 %6 to i32, !dbg !611
  %mul = mul i32 %5, %conv5, !dbg !612
  %sub = sub i32 %4, %mul, !dbg !613
  %shl = shl i32 %sub, 1, !dbg !614
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !615
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !616
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !617
  %conv6 = zext i16 %8 to i32, !dbg !617
  %int_cast_to_i641 = zext i32 %conv6 to i64, !dbg !618
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !618
  %div7 = udiv i32 %7, %conv6, !dbg !618, !klee.check.div !101
  %9 = load i32, i32* %x_value.addr, align 4, !dbg !619
  %10 = load i16, i16* %y_value.addr, align 2, !dbg !620
  %conv8 = zext i16 %10 to i32, !dbg !620
  %int_cast_to_i642 = zext i32 %conv8 to i64, !dbg !621
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !621
  %div9 = udiv i32 %9, %conv8, !dbg !621, !klee.check.div !101
  %add = add i32 %div7, %div9, !dbg !622
  store i32 %add, i32* %u32Temp2, align 4, !dbg !623
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !624
  %cmp10 = icmp ult i32 %11, 65535, !dbg !626
  br i1 %cmp10, label %if.then12, label %if.else15, !dbg !627

if.then12:                                        ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !628
  %and13 = and i32 %12, 65535, !dbg !630
  %conv14 = trunc i32 %and13 to i16, !dbg !628
  store i16 %conv14, i16* %retval, align 2, !dbg !631
  br label %return, !dbg !631

if.else15:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !632
  br label %return, !dbg !632

return:                                           ; preds = %if.else15, %if.then12, %if.then
  %13 = load i16, i16* %retval, align 2, !dbg !634
  ret i16 %13, !dbg !634
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !635 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !638, metadata !DIExpression()), !dbg !639
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !640, metadata !DIExpression()), !dbg !641
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !642, metadata !DIExpression()), !dbg !643
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !644, metadata !DIExpression()), !dbg !645
  store i32 0, i32* %s32Result, align 4, !dbg !645
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !646, metadata !DIExpression()), !dbg !647
  store i32 0, i32* %s32Temp1, align 4, !dbg !647
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !648
  %conv = sext i16 %0 to i32, !dbg !648
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !649
  %conv1 = zext i16 %1 to i32, !dbg !649
  %mul = mul nsw i32 %conv, %conv1, !dbg !650
  store i32 %mul, i32* %s32Result, align 4, !dbg !651
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !652
  %conv2 = sext i16 %2 to i32, !dbg !652
  %cmp = icmp eq i32 %conv2, 0, !dbg !654
  br i1 %cmp, label %if.then, label %if.else7, !dbg !655

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !656
  %cmp4 = icmp slt i32 %3, 0, !dbg !659
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !660

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !661
  br label %return, !dbg !661

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !663
  br label %return, !dbg !663

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !665
  %5 = load i32, i32* %s32Result, align 4, !dbg !667
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !668
  %conv8 = sext i16 %6 to i32, !dbg !668
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !669
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !669
  %div = sdiv i32 %5, %conv8, !dbg !669, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !670
  %conv9 = sext i16 %7 to i32, !dbg !670
  %mul10 = mul nsw i32 %div, %conv9, !dbg !671
  %sub = sub nsw i32 %4, %mul10, !dbg !672
  store i32 %sub, i32* %s32Temp1, align 4, !dbg !673
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !674
  %shl = shl i32 %8, 1, !dbg !675
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !676
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !677
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !678
  %conv11 = sext i16 %10 to i32, !dbg !678
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !679
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !679
  %div12 = sdiv i32 %9, %conv11, !dbg !679, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !680
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !681
  %conv13 = sext i16 %12 to i32, !dbg !681
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !682
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !682
  %div14 = sdiv i32 %11, %conv13, !dbg !682, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !683
  store i32 %add, i32* %s32Result, align 4, !dbg !684
  %13 = load i32, i32* %s32Result, align 4, !dbg !685
  %cmp15 = icmp slt i32 %13, 32767, !dbg !687
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !688

if.then17:                                        ; preds = %if.else7
  %14 = load i32, i32* %s32Result, align 4, !dbg !689
  %cmp18 = icmp sgt i32 %14, -32768, !dbg !692
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !693

if.then20:                                        ; preds = %if.then17
  %15 = load i32, i32* %s32Result, align 4, !dbg !694
  %conv21 = trunc i32 %15 to i16, !dbg !696
  store i16 %conv21, i16* %retval, align 2, !dbg !697
  br label %return, !dbg !697

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !698
  br label %return, !dbg !698

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !700
  br label %return, !dbg !700

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !702
  ret i16 %16, !dbg !702
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_u16_s16_div_u16(i16 zeroext %factor1, i16 signext %factor2, i16 zeroext %denominator) #0 !dbg !703 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !706, metadata !DIExpression()), !dbg !707
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !708, metadata !DIExpression()), !dbg !709
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !710, metadata !DIExpression()), !dbg !711
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !712, metadata !DIExpression()), !dbg !713
  store i32 0, i32* %s32Result, align 4, !dbg !713
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !714, metadata !DIExpression()), !dbg !715
  store i32 0, i32* %s32Temp1, align 4, !dbg !715
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !716
  %conv = zext i16 %0 to i32, !dbg !716
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !717
  %conv1 = sext i16 %1 to i32, !dbg !717
  %mul = mul nsw i32 %conv, %conv1, !dbg !718
  store i32 %mul, i32* %s32Result, align 4, !dbg !719
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !720
  %conv2 = zext i16 %2 to i32, !dbg !720
  %cmp = icmp eq i32 %conv2, 0, !dbg !722
  br i1 %cmp, label %if.then, label %if.else7, !dbg !723

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !724
  %cmp4 = icmp slt i32 %3, 0, !dbg !727
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !728

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !729
  br label %return, !dbg !729

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !731
  br label %return, !dbg !731

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !733
  %5 = load i32, i32* %s32Result, align 4, !dbg !735
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !736
  %conv8 = zext i16 %6 to i32, !dbg !736
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !737
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !737
  %div = sdiv i32 %5, %conv8, !dbg !737, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !738
  %conv9 = zext i16 %7 to i32, !dbg !738
  %mul10 = mul nsw i32 %div, %conv9, !dbg !739
  %sub = sub nsw i32 %4, %mul10, !dbg !740
  %shl = shl i32 %sub, 1, !dbg !741
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !742
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !743
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !744
  %conv11 = zext i16 %9 to i32, !dbg !744
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !745
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !745
  %div12 = sdiv i32 %8, %conv11, !dbg !745, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !746
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !747
  %conv13 = zext i16 %11 to i32, !dbg !747
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !748
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !748
  %div14 = sdiv i32 %10, %conv13, !dbg !748, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !749
  store i32 %add, i32* %s32Result, align 4, !dbg !750
  %12 = load i32, i32* %s32Result, align 4, !dbg !751
  %cmp15 = icmp slt i32 %12, 32767, !dbg !753
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !754

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !755
  %cmp18 = icmp sgt i32 %13, -32768, !dbg !758
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !759

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !760
  %conv21 = trunc i32 %14 to i16, !dbg !762
  store i16 %conv21, i16* %retval, align 2, !dbg !763
  br label %return, !dbg !763

if.else22:                                        ; preds = %if.then17
  store i16 -32768, i16* %retval, align 2, !dbg !764
  br label %return, !dbg !764

if.else23:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !766
  br label %return, !dbg !766

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !768
  ret i16 %15, !dbg !768
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_s16(i16 signext %factor1, i16 zeroext %factor2, i16 signext %denominator) #0 !dbg !769 {
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
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !772, metadata !DIExpression()), !dbg !773
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !774, metadata !DIExpression()), !dbg !775
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !776, metadata !DIExpression()), !dbg !777
  call void @llvm.dbg.declare(metadata i32* %u32Result, metadata !778, metadata !DIExpression()), !dbg !779
  store i32 0, i32* %u32Result, align 4, !dbg !779
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !780, metadata !DIExpression()), !dbg !781
  store i32 0, i32* %u32Temp1, align 4, !dbg !781
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !782, metadata !DIExpression()), !dbg !783
  store i32 0, i32* %s32Result, align 4, !dbg !783
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !784, metadata !DIExpression()), !dbg !785
  store i32 0, i32* %s32Temp1, align 4, !dbg !785
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !786
  %conv = sext i16 %0 to i32, !dbg !786
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !787
  %conv1 = zext i16 %1 to i32, !dbg !787
  %mul = mul nsw i32 %conv, %conv1, !dbg !788
  store i32 %mul, i32* %s32Result, align 4, !dbg !789
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !790
  %conv2 = sext i16 %2 to i32, !dbg !790
  %cmp = icmp eq i32 %conv2, 0, !dbg !792
  br i1 %cmp, label %if.then, label %if.else7, !dbg !793

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !794
  %cmp4 = icmp sge i32 %3, 0, !dbg !797
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !798

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !799
  br label %return, !dbg !799

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !801
  br label %return, !dbg !801

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !803
  %5 = load i32, i32* %s32Result, align 4, !dbg !805
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !806
  %conv8 = sext i16 %6 to i32, !dbg !806
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !807
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !807
  %div = sdiv i32 %5, %conv8, !dbg !807, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !808
  %conv9 = sext i16 %7 to i32, !dbg !808
  %mul10 = mul nsw i32 %div, %conv9, !dbg !809
  %sub = sub nsw i32 %4, %mul10, !dbg !810
  %shl = shl i32 %sub, 1, !dbg !811
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !812
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !813
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !814
  %conv11 = sext i16 %9 to i32, !dbg !814
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !815
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !815
  %div12 = sdiv i32 %8, %conv11, !dbg !815, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !816
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !817
  %conv13 = sext i16 %11 to i32, !dbg !817
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !818
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !818
  %div14 = sdiv i32 %10, %conv13, !dbg !818, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !819
  store i32 %add, i32* %s32Result, align 4, !dbg !820
  %12 = load i32, i32* %s32Result, align 4, !dbg !821
  %cmp15 = icmp slt i32 %12, 65535, !dbg !823
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !824

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !825
  %cmp18 = icmp sgt i32 %13, 0, !dbg !828
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !829

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !830
  %conv21 = trunc i32 %14 to i16, !dbg !832
  store i16 %conv21, i16* %retval, align 2, !dbg !833
  br label %return, !dbg !833

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !834
  br label %return, !dbg !834

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !836
  br label %return, !dbg !836

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !838
  ret i16 %15, !dbg !838
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_s16_u16_div_u16(i16 signext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !839 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !842, metadata !DIExpression()), !dbg !843
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !844, metadata !DIExpression()), !dbg !845
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !846, metadata !DIExpression()), !dbg !847
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !848, metadata !DIExpression()), !dbg !849
  store i32 0, i32* %s32Result, align 4, !dbg !849
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !850, metadata !DIExpression()), !dbg !851
  store i32 0, i32* %s32Temp1, align 4, !dbg !851
  %0 = load i16, i16* %factor1.addr, align 2, !dbg !852
  %conv = sext i16 %0 to i32, !dbg !852
  %1 = load i16, i16* %factor2.addr, align 2, !dbg !853
  %conv1 = zext i16 %1 to i32, !dbg !853
  %mul = mul nsw i32 %conv, %conv1, !dbg !854
  store i32 %mul, i32* %s32Result, align 4, !dbg !855
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !856
  %conv2 = zext i16 %2 to i32, !dbg !856
  %cmp = icmp eq i32 %conv2, 0, !dbg !858
  br i1 %cmp, label %if.then, label %if.else7, !dbg !859

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !860
  %cmp4 = icmp sge i32 %3, 0, !dbg !863
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !864

if.then6:                                         ; preds = %if.then
  store i16 -1, i16* %retval, align 2, !dbg !865
  br label %return, !dbg !865

if.else:                                          ; preds = %if.then
  store i16 0, i16* %retval, align 2, !dbg !867
  br label %return, !dbg !867

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Result, align 4, !dbg !869
  %5 = load i32, i32* %s32Result, align 4, !dbg !871
  %6 = load i16, i16* %denominator.addr, align 2, !dbg !872
  %conv8 = zext i16 %6 to i32, !dbg !872
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !873
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !873
  %div = sdiv i32 %5, %conv8, !dbg !873, !klee.check.div !101
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !874
  %conv9 = zext i16 %7 to i32, !dbg !874
  %mul10 = mul nsw i32 %div, %conv9, !dbg !875
  %sub = sub nsw i32 %4, %mul10, !dbg !876
  %shl = shl i32 %sub, 1, !dbg !877
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !878
  %8 = load i32, i32* %s32Temp1, align 4, !dbg !879
  %9 = load i16, i16* %denominator.addr, align 2, !dbg !880
  %conv11 = zext i16 %9 to i32, !dbg !880
  %int_cast_to_i641 = zext i32 %conv11 to i64, !dbg !881
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !881
  %div12 = sdiv i32 %8, %conv11, !dbg !881, !klee.check.div !101
  %10 = load i32, i32* %s32Result, align 4, !dbg !882
  %11 = load i16, i16* %denominator.addr, align 2, !dbg !883
  %conv13 = zext i16 %11 to i32, !dbg !883
  %int_cast_to_i642 = zext i32 %conv13 to i64, !dbg !884
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !884
  %div14 = sdiv i32 %10, %conv13, !dbg !884, !klee.check.div !101
  %add = add nsw i32 %div12, %div14, !dbg !885
  store i32 %add, i32* %s32Result, align 4, !dbg !886
  %12 = load i32, i32* %s32Result, align 4, !dbg !887
  %cmp15 = icmp slt i32 %12, 65535, !dbg !889
  br i1 %cmp15, label %if.then17, label %if.else23, !dbg !890

if.then17:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Result, align 4, !dbg !891
  %cmp18 = icmp sgt i32 %13, 0, !dbg !894
  br i1 %cmp18, label %if.then20, label %if.else22, !dbg !895

if.then20:                                        ; preds = %if.then17
  %14 = load i32, i32* %s32Result, align 4, !dbg !896
  %conv21 = trunc i32 %14 to i16, !dbg !898
  store i16 %conv21, i16* %retval, align 2, !dbg !899
  br label %return, !dbg !899

if.else22:                                        ; preds = %if.then17
  store i16 0, i16* %retval, align 2, !dbg !900
  br label %return, !dbg !900

if.else23:                                        ; preds = %if.else7
  store i16 -1, i16* %retval, align 2, !dbg !902
  br label %return, !dbg !902

return:                                           ; preds = %if.else23, %if.else22, %if.then20, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !904
  ret i16 %15, !dbg !904
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u16(i16 zeroext %factor1, i16 zeroext %factor2, i16 zeroext %denominator) #0 !dbg !905 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  %u16TempDenom = alloca i16, align 2
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !908, metadata !DIExpression()), !dbg !909
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !910, metadata !DIExpression()), !dbg !911
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !912, metadata !DIExpression()), !dbg !913
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !914, metadata !DIExpression()), !dbg !915
  store i32 0, i32* %u32Temp1, align 4, !dbg !915
  call void @llvm.dbg.declare(metadata i16* %u16TempDenom, metadata !916, metadata !DIExpression()), !dbg !917
  store i16 0, i16* %u16TempDenom, align 2, !dbg !917
  %0 = load i16, i16* %denominator.addr, align 2, !dbg !918
  %conv = zext i16 %0 to i32, !dbg !918
  %cmp = icmp eq i32 %conv, 0, !dbg !920
  br i1 %cmp, label %if.then, label %if.else, !dbg !921

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !922
  br label %return, !dbg !922

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !924
  %conv2 = zext i16 %1 to i32, !dbg !924
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !926
  %conv3 = zext i16 %2 to i32, !dbg !926
  %mul = mul nsw i32 %conv2, %conv3, !dbg !927
  store i32 %mul, i32* %u32Temp1, align 4, !dbg !928
  %3 = load i16, i16* %denominator.addr, align 2, !dbg !929
  %conv4 = zext i16 %3 to i32, !dbg !929
  %shr = ashr i32 %conv4, 1, !dbg !930
  %conv5 = trunc i32 %shr to i16, !dbg !929
  store i16 %conv5, i16* %u16TempDenom, align 2, !dbg !931
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !932
  %5 = load i16, i16* %u16TempDenom, align 2, !dbg !933
  %conv6 = zext i16 %5 to i32, !dbg !933
  %add = add i32 %4, %conv6, !dbg !934
  store i32 %add, i32* %u32Temp1, align 4, !dbg !935
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !936
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !937
  %conv7 = zext i16 %7 to i32, !dbg !937
  %int_cast_to_i64 = zext i32 %conv7 to i64, !dbg !938
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !938
  %div = udiv i32 %6, %conv7, !dbg !938, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !939
  %8 = load i32, i32* %u32Temp1, align 4, !dbg !940
  %cmp8 = icmp ult i32 %8, 65535, !dbg !942
  br i1 %cmp8, label %if.then10, label %if.else12, !dbg !943

if.then10:                                        ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !944
  %and = and i32 %9, 65535, !dbg !946
  %conv11 = trunc i32 %and to i16, !dbg !947
  store i16 %conv11, i16* %retval, align 2, !dbg !948
  br label %return, !dbg !948

if.else12:                                        ; preds = %if.else
  store i16 -1, i16* %retval, align 2, !dbg !949
  br label %return, !dbg !949

return:                                           ; preds = %if.else12, %if.then10, %if.then
  %10 = load i16, i16* %retval, align 2, !dbg !951
  ret i16 %10, !dbg !951
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i16 @u16_mul_u16_u16_div_u32(i16 zeroext %factor1, i16 zeroext %factor2, i32 %denominator) #0 !dbg !952 {
entry:
  %retval = alloca i16, align 2
  %factor1.addr = alloca i16, align 2
  %factor2.addr = alloca i16, align 2
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i16 %factor1, i16* %factor1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor1.addr, metadata !955, metadata !DIExpression()), !dbg !956
  store i16 %factor2, i16* %factor2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %factor2.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !961, metadata !DIExpression()), !dbg !962
  store i32 0, i32* %u32Temp1, align 4, !dbg !962
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !963
  %cmp = icmp eq i32 %0, 0, !dbg !965
  br i1 %cmp, label %if.then, label %if.else, !dbg !966

if.then:                                          ; preds = %entry
  store i16 -1, i16* %retval, align 2, !dbg !967
  br label %return, !dbg !967

if.else:                                          ; preds = %entry
  %1 = load i16, i16* %factor1.addr, align 2, !dbg !969
  %conv = zext i16 %1 to i32, !dbg !969
  %2 = load i16, i16* %factor2.addr, align 2, !dbg !971
  %conv1 = zext i16 %2 to i32, !dbg !971
  %mul = mul nsw i32 %conv, %conv1, !dbg !972
  %3 = load i32, i32* %denominator.addr, align 4, !dbg !973
  %int_cast_to_i64 = zext i32 %3 to i64, !dbg !974
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !974
  %div = udiv i32 %mul, %3, !dbg !974, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !975
  %4 = load i16, i16* %factor1.addr, align 2, !dbg !976
  %conv2 = zext i16 %4 to i32, !dbg !976
  %5 = load i16, i16* %factor2.addr, align 2, !dbg !978
  %conv3 = zext i16 %5 to i32, !dbg !978
  %mul4 = mul nsw i32 %conv2, %conv3, !dbg !979
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !980
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !981
  %mul5 = mul i32 %6, %7, !dbg !982
  %sub = sub i32 %mul4, %mul5, !dbg !983
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !984
  %div6 = udiv i32 %8, 2, !dbg !985
  %cmp7 = icmp uge i32 %sub, %div6, !dbg !986
  br i1 %cmp7, label %if.then9, label %if.end, !dbg !987

if.then9:                                         ; preds = %if.else
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !988
  %inc = add i32 %9, 1, !dbg !988
  store i32 %inc, i32* %u32Temp1, align 4, !dbg !988
  br label %if.end, !dbg !990

if.end:                                           ; preds = %if.then9, %if.else
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !991
  %cmp10 = icmp ult i32 %10, 65535, !dbg !993
  br i1 %cmp10, label %if.then12, label %if.else14, !dbg !994

if.then12:                                        ; preds = %if.end
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !995
  %and = and i32 %11, 65535, !dbg !997
  %conv13 = trunc i32 %and to i16, !dbg !998
  store i16 %conv13, i16* %retval, align 2, !dbg !999
  br label %return, !dbg !999

if.else14:                                        ; preds = %if.end
  store i16 -1, i16* %retval, align 2, !dbg !1000
  br label %return, !dbg !1000

return:                                           ; preds = %if.else14, %if.then12, %if.then
  %12 = load i16, i16* %retval, align 2, !dbg !1002
  ret i16 %12, !dbg !1002
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u16(i32 %x_value, i16 zeroext %y_value) #0 !dbg !1003 {
entry:
  %retval = alloca i32, align 4
  %x_value.addr = alloca i32, align 4
  %y_value.addr = alloca i16, align 2
  %u32Temp1 = alloca i32, align 4
  store i32 %x_value, i32* %x_value.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x_value.addr, metadata !1006, metadata !DIExpression()), !dbg !1007
  store i16 %y_value, i16* %y_value.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %y_value.addr, metadata !1008, metadata !DIExpression()), !dbg !1009
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1010, metadata !DIExpression()), !dbg !1011
  store i32 0, i32* %u32Temp1, align 4, !dbg !1011
  %0 = load i16, i16* %y_value.addr, align 2, !dbg !1012
  %conv = zext i16 %0 to i32, !dbg !1012
  %cmp = icmp eq i32 %conv, 0, !dbg !1014
  br i1 %cmp, label %if.then, label %if.else, !dbg !1015

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1016
  br label %return, !dbg !1016

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %x_value.addr, align 4, !dbg !1018
  %2 = load i32, i32* %x_value.addr, align 4, !dbg !1020
  %3 = load i16, i16* %y_value.addr, align 2, !dbg !1021
  %conv2 = zext i16 %3 to i32, !dbg !1021
  %int_cast_to_i64 = zext i32 %conv2 to i64, !dbg !1022
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1022
  %div = udiv i32 %2, %conv2, !dbg !1022, !klee.check.div !101
  %4 = load i16, i16* %y_value.addr, align 2, !dbg !1023
  %conv3 = zext i16 %4 to i32, !dbg !1023
  %mul = mul i32 %div, %conv3, !dbg !1024
  %sub = sub i32 %1, %mul, !dbg !1025
  %shl = shl i32 %sub, 1, !dbg !1026
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1027
  %5 = load i32, i32* %x_value.addr, align 4, !dbg !1028
  %6 = load i16, i16* %y_value.addr, align 2, !dbg !1029
  %conv4 = zext i16 %6 to i32, !dbg !1029
  %int_cast_to_i641 = zext i32 %conv4 to i64, !dbg !1030
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1030
  %div5 = udiv i32 %5, %conv4, !dbg !1030, !klee.check.div !101
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1031
  %8 = load i16, i16* %y_value.addr, align 2, !dbg !1032
  %conv6 = zext i16 %8 to i32, !dbg !1032
  %int_cast_to_i642 = zext i32 %conv6 to i64, !dbg !1033
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1033
  %div7 = udiv i32 %7, %conv6, !dbg !1033, !klee.check.div !101
  %add = add i32 %div5, %div7, !dbg !1034
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1035
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1036
  store i32 %9, i32* %retval, align 4, !dbg !1037
  br label %return, !dbg !1037

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !1038
  ret i32 %10, !dbg !1038
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_s16(i16 signext %fak1, i16 signext %fak2, i16 signext %div) #0 !dbg !1039 {
entry:
  %retval = alloca i16, align 2
  %fak1.addr = alloca i16, align 2
  %fak2.addr = alloca i16, align 2
  %div.addr = alloca i16, align 2
  %s32Temp1 = alloca i32, align 4
  %s32Temp2 = alloca i32, align 4
  %s32Temp3 = alloca i32, align 4
  store i16 %fak1, i16* %fak1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak1.addr, metadata !1042, metadata !DIExpression()), !dbg !1043
  store i16 %fak2, i16* %fak2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fak2.addr, metadata !1044, metadata !DIExpression()), !dbg !1045
  store i16 %div, i16* %div.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %div.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1048, metadata !DIExpression()), !dbg !1049
  store i32 0, i32* %s32Temp1, align 4, !dbg !1049
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1050, metadata !DIExpression()), !dbg !1051
  store i32 0, i32* %s32Temp2, align 4, !dbg !1051
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1052, metadata !DIExpression()), !dbg !1053
  store i32 0, i32* %s32Temp3, align 4, !dbg !1053
  %0 = load i16, i16* %fak1.addr, align 2, !dbg !1054
  %conv = sext i16 %0 to i32, !dbg !1054
  %1 = load i16, i16* %fak2.addr, align 2, !dbg !1055
  %conv1 = sext i16 %1 to i32, !dbg !1055
  %mul = mul nsw i32 %conv, %conv1, !dbg !1056
  store i32 %mul, i32* %s32Temp1, align 4, !dbg !1057
  %2 = load i16, i16* %div.addr, align 2, !dbg !1058
  %conv2 = sext i16 %2 to i32, !dbg !1058
  %cmp = icmp eq i32 %conv2, 0, !dbg !1060
  br i1 %cmp, label %if.then, label %if.else7, !dbg !1061

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Temp1, align 4, !dbg !1062
  %cmp4 = icmp slt i32 %3, 0, !dbg !1065
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1066

if.then6:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1067
  br label %return, !dbg !1067

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1069
  br label %return, !dbg !1069

if.else7:                                         ; preds = %entry
  %4 = load i32, i32* %s32Temp1, align 4, !dbg !1071
  %5 = load i32, i32* %s32Temp1, align 4, !dbg !1073
  %6 = load i16, i16* %div.addr, align 2, !dbg !1074
  %conv8 = sext i16 %6 to i32, !dbg !1074
  %int_cast_to_i64 = zext i32 %conv8 to i64, !dbg !1075
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1075
  %div9 = sdiv i32 %5, %conv8, !dbg !1075, !klee.check.div !101
  %7 = load i16, i16* %div.addr, align 2, !dbg !1076
  %conv10 = sext i16 %7 to i32, !dbg !1076
  %mul11 = mul nsw i32 %div9, %conv10, !dbg !1077
  %sub = sub nsw i32 %4, %mul11, !dbg !1078
  %shl = shl i32 %sub, 1, !dbg !1079
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1080
  %8 = load i32, i32* %s32Temp2, align 4, !dbg !1081
  %9 = load i16, i16* %div.addr, align 2, !dbg !1082
  %conv12 = sext i16 %9 to i32, !dbg !1082
  %int_cast_to_i641 = zext i32 %conv12 to i64, !dbg !1083
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1083
  %div13 = sdiv i32 %8, %conv12, !dbg !1083, !klee.check.div !101
  %10 = load i32, i32* %s32Temp1, align 4, !dbg !1084
  %11 = load i16, i16* %div.addr, align 2, !dbg !1085
  %conv14 = sext i16 %11 to i32, !dbg !1085
  %int_cast_to_i642 = zext i32 %conv14 to i64, !dbg !1086
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1086
  %div15 = sdiv i32 %10, %conv14, !dbg !1086, !klee.check.div !101
  %add = add nsw i32 %div13, %div15, !dbg !1087
  store i32 %add, i32* %s32Temp3, align 4, !dbg !1088
  %12 = load i32, i32* %s32Temp3, align 4, !dbg !1089
  %cmp16 = icmp slt i32 %12, 32767, !dbg !1091
  br i1 %cmp16, label %if.then18, label %if.else24, !dbg !1092

if.then18:                                        ; preds = %if.else7
  %13 = load i32, i32* %s32Temp3, align 4, !dbg !1093
  %cmp19 = icmp sgt i32 %13, -32768, !dbg !1096
  br i1 %cmp19, label %if.then21, label %if.else23, !dbg !1097

if.then21:                                        ; preds = %if.then18
  %14 = load i32, i32* %s32Temp3, align 4, !dbg !1098
  %conv22 = trunc i32 %14 to i16, !dbg !1100
  store i16 %conv22, i16* %retval, align 2, !dbg !1101
  br label %return, !dbg !1101

if.else23:                                        ; preds = %if.then18
  store i16 -32768, i16* %retval, align 2, !dbg !1102
  br label %return, !dbg !1102

if.else24:                                        ; preds = %if.else7
  store i16 32767, i16* %retval, align 2, !dbg !1104
  br label %return, !dbg !1104

return:                                           ; preds = %if.else24, %if.else23, %if.then21, %if.else, %if.then6
  %15 = load i16, i16* %retval, align 2, !dbg !1106
  ret i16 %15, !dbg !1106
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_mul_s16_s16_div_u16(i16 signext %data1, i16 signext %data2, i16 zeroext %denominator) #0 !dbg !1107 {
entry:
  %retval = alloca i16, align 2
  %data1.addr = alloca i16, align 2
  %data2.addr = alloca i16, align 2
  %denominator.addr = alloca i16, align 2
  %s32Result = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i16 %data1, i16* %data1.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data1.addr, metadata !1110, metadata !DIExpression()), !dbg !1111
  store i16 %data2, i16* %data2.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %data2.addr, metadata !1112, metadata !DIExpression()), !dbg !1113
  store i16 %denominator, i16* %denominator.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %denominator.addr, metadata !1114, metadata !DIExpression()), !dbg !1115
  call void @llvm.dbg.declare(metadata i32* %s32Result, metadata !1116, metadata !DIExpression()), !dbg !1117
  store i32 0, i32* %s32Result, align 4, !dbg !1117
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1118, metadata !DIExpression()), !dbg !1119
  store i32 0, i32* %s32Temp1, align 4, !dbg !1119
  %0 = load i16, i16* %data1.addr, align 2, !dbg !1120
  %conv = sext i16 %0 to i32, !dbg !1120
  %1 = load i16, i16* %data2.addr, align 2, !dbg !1121
  %conv1 = sext i16 %1 to i32, !dbg !1121
  %mul = mul nsw i32 %conv, %conv1, !dbg !1122
  store i32 %mul, i32* %s32Result, align 4, !dbg !1123
  %2 = load i16, i16* %denominator.addr, align 2, !dbg !1124
  %conv2 = zext i16 %2 to i32, !dbg !1124
  %cmp = icmp eq i32 %conv2, 0, !dbg !1126
  br i1 %cmp, label %if.then, label %if.else11, !dbg !1127

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %s32Result, align 4, !dbg !1128
  %cmp4 = icmp sgt i32 %3, 0, !dbg !1131
  br i1 %cmp4, label %if.then6, label %if.else, !dbg !1132

if.then6:                                         ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1133
  br label %return, !dbg !1133

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* %s32Result, align 4, !dbg !1135
  %cmp7 = icmp eq i32 %4, 0, !dbg !1137
  br i1 %cmp7, label %if.then9, label %if.else10, !dbg !1138

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %retval, align 2, !dbg !1139
  br label %return, !dbg !1139

if.else10:                                        ; preds = %if.else
  store i16 -32768, i16* %retval, align 2, !dbg !1141
  br label %return, !dbg !1141

if.else11:                                        ; preds = %entry
  %5 = load i32, i32* %s32Result, align 4, !dbg !1143
  %6 = load i32, i32* %s32Result, align 4, !dbg !1145
  %7 = load i16, i16* %denominator.addr, align 2, !dbg !1146
  %conv12 = zext i16 %7 to i32, !dbg !1146
  %int_cast_to_i64 = zext i32 %conv12 to i64, !dbg !1147
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1147
  %div = sdiv i32 %6, %conv12, !dbg !1147, !klee.check.div !101
  %8 = load i16, i16* %denominator.addr, align 2, !dbg !1148
  %conv13 = zext i16 %8 to i32, !dbg !1148
  %mul14 = mul nsw i32 %div, %conv13, !dbg !1149
  %sub = sub nsw i32 %5, %mul14, !dbg !1150
  %shl = shl i32 %sub, 1, !dbg !1151
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1152
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1153
  %10 = load i16, i16* %denominator.addr, align 2, !dbg !1154
  %conv15 = zext i16 %10 to i32, !dbg !1154
  %int_cast_to_i641 = zext i32 %conv15 to i64, !dbg !1155
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1155
  %div16 = sdiv i32 %9, %conv15, !dbg !1155, !klee.check.div !101
  %11 = load i32, i32* %s32Result, align 4, !dbg !1156
  %12 = load i16, i16* %denominator.addr, align 2, !dbg !1157
  %conv17 = zext i16 %12 to i32, !dbg !1157
  %int_cast_to_i642 = zext i32 %conv17 to i64, !dbg !1158
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1158
  %div18 = sdiv i32 %11, %conv17, !dbg !1158, !klee.check.div !101
  %add = add nsw i32 %div16, %div18, !dbg !1159
  store i32 %add, i32* %s32Result, align 4, !dbg !1160
  %13 = load i32, i32* %s32Result, align 4, !dbg !1161
  %cmp19 = icmp slt i32 %13, 32767, !dbg !1163
  br i1 %cmp19, label %if.then21, label %if.else27, !dbg !1164

if.then21:                                        ; preds = %if.else11
  %14 = load i32, i32* %s32Result, align 4, !dbg !1165
  %cmp22 = icmp sgt i32 %14, -32768, !dbg !1168
  br i1 %cmp22, label %if.then24, label %if.else26, !dbg !1169

if.then24:                                        ; preds = %if.then21
  %15 = load i32, i32* %s32Result, align 4, !dbg !1170
  %conv25 = trunc i32 %15 to i16, !dbg !1172
  store i16 %conv25, i16* %retval, align 2, !dbg !1173
  br label %return, !dbg !1173

if.else26:                                        ; preds = %if.then21
  store i16 -32768, i16* %retval, align 2, !dbg !1174
  br label %return, !dbg !1174

if.else27:                                        ; preds = %if.else11
  store i16 32767, i16* %retval, align 2, !dbg !1176
  br label %return, !dbg !1176

return:                                           ; preds = %if.else27, %if.else26, %if.then24, %if.else10, %if.then9, %if.then6
  %16 = load i16, i16* %retval, align 2, !dbg !1178
  ret i16 %16, !dbg !1178
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1179 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1182, metadata !DIExpression()), !dbg !1183
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1184, metadata !DIExpression()), !dbg !1185
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1186, metadata !DIExpression()), !dbg !1187
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1188
  %cmp = icmp eq i32 %0, 0, !dbg !1190
  br i1 %cmp, label %if.then, label %if.else, !dbg !1191

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1192
  br label %return, !dbg !1192

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1194
  %cmp1 = icmp sle i32 %1, 0, !dbg !1197
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1198

if.then2:                                         ; preds = %if.else
  store i32 0, i32* %retval, align 4, !dbg !1199
  br label %return, !dbg !1199

if.else3:                                         ; preds = %if.else
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1201
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1203
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1204
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1205
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1205
  %div = udiv i32 %3, %4, !dbg !1205, !klee.check.div !101
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1206
  %mul = mul i32 %div, %5, !dbg !1207
  %sub = sub i32 %2, %mul, !dbg !1208
  %shl = shl i32 %sub, 1, !dbg !1209
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1210
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1211
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1212
  %int_cast_to_i641 = zext i32 %7 to i64, !dbg !1213
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1213
  %div4 = udiv i32 %6, %7, !dbg !1213, !klee.check.div !101
  %8 = load i32, i32* %numerator.addr, align 4, !dbg !1214
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1215
  %int_cast_to_i642 = zext i32 %9 to i64, !dbg !1216
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1216
  %div5 = udiv i32 %8, %9, !dbg !1216, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1217
  store i32 %add, i32* %u32Temp1, align 4, !dbg !1218
  %10 = load i32, i32* %u32Temp1, align 4, !dbg !1219
  store i32 %10, i32* %retval, align 4, !dbg !1220
  br label %return, !dbg !1220

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %11 = load i32, i32* %retval, align 4, !dbg !1221
  ret i32 %11, !dbg !1221
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1222 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %s32Temp1 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1225, metadata !DIExpression()), !dbg !1226
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1227, metadata !DIExpression()), !dbg !1228
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1229, metadata !DIExpression()), !dbg !1230
  store i32 0, i32* %s32Temp1, align 4, !dbg !1230
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1231
  %cmp = icmp eq i32 %0, 0, !dbg !1233
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1234

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1235
  %cmp1 = icmp sge i32 %1, 0, !dbg !1238
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1239

if.then2:                                         ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1240
  br label %return, !dbg !1240

if.else:                                          ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1242
  br label %return, !dbg !1242

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1244
  %cmp4 = icmp sge i32 %2, 0, !dbg !1247
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !1248

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1249
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1251
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1252
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1253
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1253
  %div = udiv i32 %4, %5, !dbg !1253, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1254
  %mul = mul i32 %div, %6, !dbg !1255
  %sub = sub i32 %3, %mul, !dbg !1256
  %shl = shl i32 %sub, 1, !dbg !1257
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1258
  %7 = load i32, i32* %numerator.addr, align 4, !dbg !1259
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1260
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1261
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1261
  %div6 = udiv i32 %7, %8, !dbg !1261, !klee.check.div !101
  %9 = load i32, i32* %s32Temp1, align 4, !dbg !1262
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1263
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1264
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1264
  %div7 = udiv i32 %9, %10, !dbg !1264, !klee.check.div !101
  %add = add i32 %div6, %div7, !dbg !1265
  store i32 %add, i32* %retval, align 4, !dbg !1266
  br label %return, !dbg !1266

if.else8:                                         ; preds = %if.else3
  store i32 0, i32* %retval, align 4, !dbg !1267
  br label %return, !dbg !1267

return:                                           ; preds = %if.else8, %if.then5, %if.else, %if.then2
  %11 = load i32, i32* %retval, align 4, !dbg !1269
  ret i32 %11, !dbg !1269
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1270 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1273, metadata !DIExpression()), !dbg !1274
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1275, metadata !DIExpression()), !dbg !1276
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1277, metadata !DIExpression()), !dbg !1278
  store i32 0, i32* %u32Temp1, align 4, !dbg !1278
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1279, metadata !DIExpression()), !dbg !1280
  store i32 0, i32* %u32Temp2, align 4, !dbg !1280
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1281
  %cmp = icmp eq i32 %0, 0, !dbg !1283
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1284

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1285
  %cmp1 = icmp slt i32 %1, 0, !dbg !1288
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1289

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %retval, align 4, !dbg !1290
  br label %return, !dbg !1290

if.else:                                          ; preds = %if.then
  store i32 -1, i32* %retval, align 4, !dbg !1292
  br label %return, !dbg !1292

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1294
  %cmp4 = icmp sge i32 %2, 0, !dbg !1297
  br i1 %cmp4, label %if.then5, label %if.else14, !dbg !1298

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1299
  %cmp6 = icmp eq i32 %3, 0, !dbg !1302
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !1303

if.then7:                                         ; preds = %if.then5
  store i32 0, i32* %retval, align 4, !dbg !1304
  br label %return, !dbg !1304

if.else8:                                         ; preds = %if.then5
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1306
  %cmp9 = icmp sle i32 %4, 0, !dbg !1309
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1310

if.then10:                                        ; preds = %if.else8
  store i32 0, i32* %retval, align 4, !dbg !1311
  br label %return, !dbg !1311

if.else11:                                        ; preds = %if.else8
  %5 = load i32, i32* %numerator.addr, align 4, !dbg !1313
  %6 = load i32, i32* %numerator.addr, align 4, !dbg !1315
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1316
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1317
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1317
  %div = sdiv i32 %6, %7, !dbg !1317, !klee.check.div !101
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1318
  %mul = mul nsw i32 %div, %8, !dbg !1319
  %sub = sub nsw i32 %5, %mul, !dbg !1320
  %shl = shl i32 %sub, 1, !dbg !1321
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1322
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1323
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1324
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1325
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1325
  %div12 = udiv i32 %9, %10, !dbg !1325, !klee.check.div !101
  %11 = load i32, i32* %numerator.addr, align 4, !dbg !1326
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1327
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1328
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1328
  %div13 = sdiv i32 %11, %12, !dbg !1328, !klee.check.div !101
  %add = add i32 %div12, %div13, !dbg !1329
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1330
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1331
  store i32 %13, i32* %retval, align 4, !dbg !1332
  br label %return, !dbg !1332

if.else14:                                        ; preds = %if.else3
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1333
  %cmp15 = icmp sgt i32 %14, 0, !dbg !1336
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !1337

if.then16:                                        ; preds = %if.else14
  store i32 0, i32* %retval, align 4, !dbg !1338
  br label %return, !dbg !1338

if.else17:                                        ; preds = %if.else14
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1340
  %sub18 = sub nsw i32 0, %15, !dbg !1342
  store i32 %sub18, i32* %numerator.addr, align 4, !dbg !1343
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1344
  %sub19 = sub nsw i32 0, %16, !dbg !1345
  store i32 %sub19, i32* %denominator.addr, align 4, !dbg !1346
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1347
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1348
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1349
  %int_cast_to_i643 = zext i32 %19 to i64, !dbg !1350
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1350
  %div20 = sdiv i32 %18, %19, !dbg !1350, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1351
  %mul21 = mul nsw i32 %div20, %20, !dbg !1352
  %sub22 = sub nsw i32 %17, %mul21, !dbg !1353
  %shl23 = shl i32 %sub22, 1, !dbg !1354
  store i32 %shl23, i32* %u32Temp1, align 4, !dbg !1355
  %21 = load i32, i32* %u32Temp1, align 4, !dbg !1356
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1357
  %int_cast_to_i644 = zext i32 %22 to i64, !dbg !1358
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1358
  %div24 = udiv i32 %21, %22, !dbg !1358, !klee.check.div !101
  %23 = load i32, i32* %numerator.addr, align 4, !dbg !1359
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1360
  %int_cast_to_i645 = zext i32 %24 to i64, !dbg !1361
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1361
  %div25 = sdiv i32 %23, %24, !dbg !1361, !klee.check.div !101
  %add26 = add i32 %div24, %div25, !dbg !1362
  store i32 %add26, i32* %u32Temp2, align 4, !dbg !1363
  %25 = load i32, i32* %u32Temp2, align 4, !dbg !1364
  store i32 %25, i32* %retval, align 4, !dbg !1365
  br label %return, !dbg !1365

return:                                           ; preds = %if.else17, %if.then16, %if.else11, %if.then10, %if.then7, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1366
  ret i32 %26, !dbg !1366
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @u32_div_u32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1367 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  %u32Temp3 = alloca i32, align 4
  %numerator_old = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1370, metadata !DIExpression()), !dbg !1371
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1372, metadata !DIExpression()), !dbg !1373
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1374, metadata !DIExpression()), !dbg !1375
  store i32 0, i32* %u32Temp1, align 4, !dbg !1375
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1376, metadata !DIExpression()), !dbg !1377
  store i32 0, i32* %u32Temp2, align 4, !dbg !1377
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1378, metadata !DIExpression()), !dbg !1379
  store i32 0, i32* %u32Temp3, align 4, !dbg !1379
  call void @llvm.dbg.declare(metadata i32* %numerator_old, metadata !1380, metadata !DIExpression()), !dbg !1381
  store i32 0, i32* %numerator_old, align 4, !dbg !1381
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1382
  %cmp = icmp eq i32 %0, 0, !dbg !1384
  br i1 %cmp, label %if.then, label %if.else, !dbg !1385

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !1386
  br label %return, !dbg !1386

if.else:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1388
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1390
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1391
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1392
  %int_cast_to_i64 = zext i32 %4 to i64, !dbg !1393
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1393
  %div = udiv i32 %3, %4, !dbg !1393, !klee.check.div !101
  %mul = mul i32 %2, %div, !dbg !1394
  %sub = sub i32 %1, %mul, !dbg !1395
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1396
  %5 = load i32, i32* %u32Temp1, align 4, !dbg !1397
  %and = and i32 %5, 1, !dbg !1399
  %cmp1 = icmp eq i32 %and, 0, !dbg !1400
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !1401

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1402
  %shr = lshr i32 %6, 1, !dbg !1404
  store i32 %shr, i32* %u32Temp2, align 4, !dbg !1405
  br label %if.end, !dbg !1406

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %denominator.addr, align 4, !dbg !1407
  %shr4 = lshr i32 %7, 1, !dbg !1409
  %add = add i32 %shr4, 1, !dbg !1410
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1411
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %8 = load i32, i32* %u32Temp2, align 4, !dbg !1412
  %9 = load i32, i32* %u32Temp1, align 4, !dbg !1414
  %cmp5 = icmp ugt i32 %8, %9, !dbg !1415
  br i1 %cmp5, label %if.then6, label %if.else8, !dbg !1416

if.then6:                                         ; preds = %if.end
  %10 = load i32, i32* %numerator.addr, align 4, !dbg !1417
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1419
  %int_cast_to_i641 = zext i32 %11 to i64, !dbg !1420
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1420
  %div7 = udiv i32 %10, %11, !dbg !1420, !klee.check.div !101
  store i32 %div7, i32* %retval, align 4, !dbg !1421
  br label %return, !dbg !1421

if.else8:                                         ; preds = %if.end
  %12 = load i32, i32* %numerator.addr, align 4, !dbg !1422
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1424
  %int_cast_to_i642 = zext i32 %13 to i64, !dbg !1425
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1425
  %div9 = udiv i32 %12, %13, !dbg !1425, !klee.check.div !101
  %add10 = add i32 %div9, 1, !dbg !1426
  store i32 %add10, i32* %retval, align 4, !dbg !1427
  br label %return, !dbg !1427

return:                                           ; preds = %if.else8, %if.then6, %if.then
  %14 = load i32, i32* %retval, align 4, !dbg !1428
  ret i32 %14, !dbg !1428
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_u32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1429 {
entry:
  %retval = alloca i32, align 4
  %numerator.addr = alloca i32, align 4
  %denominator.addr = alloca i32, align 4
  %u32Temp1 = alloca i32, align 4
  %u32Temp2 = alloca i32, align 4
  store i32 %numerator, i32* %numerator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1432, metadata !DIExpression()), !dbg !1433
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1434, metadata !DIExpression()), !dbg !1435
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1436, metadata !DIExpression()), !dbg !1437
  store i32 0, i32* %u32Temp1, align 4, !dbg !1437
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1438, metadata !DIExpression()), !dbg !1439
  store i32 0, i32* %u32Temp2, align 4, !dbg !1439
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1440
  %cmp = icmp sle i32 %0, 0, !dbg !1442
  br i1 %cmp, label %if.then, label %if.else10, !dbg !1443

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1444
  %cmp1 = icmp sge i32 %1, 0, !dbg !1447
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1448

if.then2:                                         ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1449
  br label %return, !dbg !1449

if.else:                                          ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1451
  %sub = sub nsw i32 0, %2, !dbg !1453
  store i32 %sub, i32* %denominator.addr, align 4, !dbg !1454
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1455
  %4 = load i32, i32* %numerator.addr, align 4, !dbg !1456
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1457
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1458
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1458
  %div = udiv i32 %4, %5, !dbg !1458, !klee.check.div !101
  %6 = load i32, i32* %denominator.addr, align 4, !dbg !1459
  %mul = mul i32 %div, %6, !dbg !1460
  %sub3 = sub i32 %3, %mul, !dbg !1461
  %shl = shl i32 %sub3, 1, !dbg !1462
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1463
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1464
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1465
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1466
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1466
  %div4 = udiv i32 %7, %8, !dbg !1466, !klee.check.div !101
  %9 = load i32, i32* %numerator.addr, align 4, !dbg !1467
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1468
  %int_cast_to_i642 = zext i32 %10 to i64, !dbg !1469
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1469
  %div5 = udiv i32 %9, %10, !dbg !1469, !klee.check.div !101
  %add = add i32 %div4, %div5, !dbg !1470
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1471
  %11 = load i32, i32* %u32Temp2, align 4, !dbg !1472
  %cmp6 = icmp ule i32 %11, 2147483647, !dbg !1474
  br i1 %cmp6, label %if.then7, label %if.else9, !dbg !1475

if.then7:                                         ; preds = %if.else
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1476
  %sub8 = sub i32 0, %12, !dbg !1478
  store i32 %sub8, i32* %retval, align 4, !dbg !1479
  br label %return, !dbg !1479

if.else9:                                         ; preds = %if.else
  store i32 -2147483648, i32* %retval, align 4, !dbg !1480
  br label %return, !dbg !1480

if.else10:                                        ; preds = %entry
  %13 = load i32, i32* %numerator.addr, align 4, !dbg !1482
  %14 = load i32, i32* %numerator.addr, align 4, !dbg !1484
  %15 = load i32, i32* %denominator.addr, align 4, !dbg !1485
  %int_cast_to_i643 = zext i32 %15 to i64, !dbg !1486
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1486
  %div11 = udiv i32 %14, %15, !dbg !1486, !klee.check.div !101
  %16 = load i32, i32* %denominator.addr, align 4, !dbg !1487
  %mul12 = mul i32 %div11, %16, !dbg !1488
  %sub13 = sub i32 %13, %mul12, !dbg !1489
  %shl14 = shl i32 %sub13, 1, !dbg !1490
  store i32 %shl14, i32* %u32Temp1, align 4, !dbg !1491
  %17 = load i32, i32* %u32Temp1, align 4, !dbg !1492
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1493
  %int_cast_to_i644 = zext i32 %18 to i64, !dbg !1494
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1494
  %div15 = udiv i32 %17, %18, !dbg !1494, !klee.check.div !101
  %19 = load i32, i32* %numerator.addr, align 4, !dbg !1495
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1496
  %int_cast_to_i645 = zext i32 %20 to i64, !dbg !1497
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1497
  %div16 = udiv i32 %19, %20, !dbg !1497, !klee.check.div !101
  %add17 = add i32 %div15, %div16, !dbg !1498
  store i32 %add17, i32* %u32Temp2, align 4, !dbg !1499
  %21 = load i32, i32* %u32Temp2, align 4, !dbg !1500
  %cmp18 = icmp ule i32 %21, 2147483647, !dbg !1502
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1503

if.then19:                                        ; preds = %if.else10
  %22 = load i32, i32* %u32Temp2, align 4, !dbg !1504
  store i32 %22, i32* %retval, align 4, !dbg !1506
  br label %return, !dbg !1506

if.else20:                                        ; preds = %if.else10
  store i32 2147483647, i32* %retval, align 4, !dbg !1507
  br label %return, !dbg !1507

return:                                           ; preds = %if.else20, %if.then19, %if.else9, %if.then7, %if.then2
  %23 = load i32, i32* %retval, align 4, !dbg !1509
  ret i32 %23, !dbg !1509
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1510 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1513, metadata !DIExpression()), !dbg !1514
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1515, metadata !DIExpression()), !dbg !1516
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1517, metadata !DIExpression()), !dbg !1518
  store i32 0, i32* %s32Temp1, align 4, !dbg !1518
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1519, metadata !DIExpression()), !dbg !1520
  store i32 0, i32* %s32Temp2, align 4, !dbg !1520
  call void @llvm.dbg.declare(metadata i32* %u32Temp0, metadata !1521, metadata !DIExpression()), !dbg !1522
  store i32 0, i32* %u32Temp0, align 4, !dbg !1522
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1523, metadata !DIExpression()), !dbg !1524
  store i32 0, i32* %u32Temp1, align 4, !dbg !1524
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1525, metadata !DIExpression()), !dbg !1526
  store i32 0, i32* %u32Temp2, align 4, !dbg !1526
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1527
  %cmp = icmp eq i32 %0, 0, !dbg !1529
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1530

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1531
  %cmp1 = icmp slt i32 %1, 0, !dbg !1534
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1535

if.then2:                                         ; preds = %if.then
  store i32 -2147483648, i32* %retval, align 4, !dbg !1536
  br label %return, !dbg !1536

if.else:                                          ; preds = %if.then
  store i32 2147483647, i32* %retval, align 4, !dbg !1538
  br label %return, !dbg !1538

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1540
  %cmp4 = icmp sle i32 %2, 0, !dbg !1543
  br i1 %cmp4, label %if.then5, label %if.else19, !dbg !1544

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1545
  %sub = sub nsw i32 0, %3, !dbg !1547
  store i32 %sub, i32* %u32Temp1, align 4, !dbg !1548
  %4 = load i32, i32* %u32Temp1, align 4, !dbg !1549
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1550
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1551
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1551
  %div = udiv i32 %4, %5, !dbg !1551, !klee.check.div !101
  store i32 %div, i32* %u32Temp0, align 4, !dbg !1552
  %6 = load i32, i32* %u32Temp1, align 4, !dbg !1553
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1554
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1555
  %int_cast_to_i641 = zext i32 %8 to i64, !dbg !1556
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1556
  %div6 = udiv i32 %7, %8, !dbg !1556, !klee.check.div !101
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1557
  %mul = mul i32 %div6, %9, !dbg !1558
  %sub7 = sub i32 %6, %mul, !dbg !1559
  store i32 %sub7, i32* %u32Temp2, align 4, !dbg !1560
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1561
  %and = and i32 %10, 1, !dbg !1563
  %cmp8 = icmp eq i32 %and, 0, !dbg !1564
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !1565

if.then9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1566
  %shr = lshr i32 %11, 1, !dbg !1568
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1569
  br label %if.end, !dbg !1570

if.else10:                                        ; preds = %if.then5
  %12 = load i32, i32* %denominator.addr, align 4, !dbg !1571
  %shr11 = lshr i32 %12, 1, !dbg !1573
  %add = add i32 %shr11, 1, !dbg !1574
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1575
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1576
  %14 = load i32, i32* %denominator.addr, align 4, !dbg !1578
  %cmp12 = icmp ult i32 %13, %14, !dbg !1579
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !1580

if.then13:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp0, align 4, !dbg !1581
  %neg = xor i32 %15, -1, !dbg !1583
  %add14 = add i32 %neg, 1, !dbg !1584
  store i32 %add14, i32* %retval, align 4, !dbg !1585
  br label %return, !dbg !1585

if.else15:                                        ; preds = %if.end
  %16 = load i32, i32* %u32Temp0, align 4, !dbg !1586
  %add16 = add i32 %16, 1, !dbg !1588
  %neg17 = xor i32 %add16, -1, !dbg !1589
  %add18 = add i32 %neg17, 1, !dbg !1590
  store i32 %add18, i32* %retval, align 4, !dbg !1591
  br label %return, !dbg !1591

if.else19:                                        ; preds = %if.else3
  %17 = load i32, i32* %numerator.addr, align 4, !dbg !1592
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1594
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1595
  %int_cast_to_i642 = zext i32 %19 to i64, !dbg !1596
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1596
  %div20 = udiv i32 %18, %19, !dbg !1596, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1597
  %mul21 = mul i32 %div20, %20, !dbg !1598
  %sub22 = sub i32 %17, %mul21, !dbg !1599
  %shl = shl i32 %sub22, 1, !dbg !1600
  store i32 %shl, i32* %s32Temp1, align 4, !dbg !1601
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1602
  %22 = load i32, i32* %denominator.addr, align 4, !dbg !1603
  %int_cast_to_i643 = zext i32 %22 to i64, !dbg !1604
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1604
  %div23 = udiv i32 %21, %22, !dbg !1604, !klee.check.div !101
  %23 = load i32, i32* %s32Temp1, align 4, !dbg !1605
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1606
  %int_cast_to_i644 = zext i32 %24 to i64, !dbg !1607
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1607
  %div24 = udiv i32 %23, %24, !dbg !1607, !klee.check.div !101
  %add25 = add i32 %div23, %div24, !dbg !1608
  store i32 %add25, i32* %s32Temp2, align 4, !dbg !1609
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1610
  store i32 %25, i32* %retval, align 4, !dbg !1611
  br label %return, !dbg !1611

return:                                           ; preds = %if.else19, %if.else15, %if.then13, %if.else, %if.then2
  %26 = load i32, i32* %retval, align 4, !dbg !1612
  ret i32 %26, !dbg !1612
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @s32_div_s32_s32(i32 %numerator, i32 %denominator) #0 !dbg !1613 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1616, metadata !DIExpression()), !dbg !1617
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1618, metadata !DIExpression()), !dbg !1619
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1620, metadata !DIExpression()), !dbg !1621
  store i32 0, i32* %s32Temp1, align 4, !dbg !1621
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1622, metadata !DIExpression()), !dbg !1623
  store i32 0, i32* %s32Temp2, align 4, !dbg !1623
  call void @llvm.dbg.declare(metadata i32* %denominator_prime, metadata !1624, metadata !DIExpression()), !dbg !1625
  store i32 0, i32* %denominator_prime, align 4, !dbg !1625
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1626, metadata !DIExpression()), !dbg !1627
  store i32 0, i32* %u32Temp1, align 4, !dbg !1627
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1628, metadata !DIExpression()), !dbg !1629
  store i32 0, i32* %u32Temp2, align 4, !dbg !1629
  call void @llvm.dbg.declare(metadata i32* %u32numerator, metadata !1630, metadata !DIExpression()), !dbg !1631
  store i32 0, i32* %u32numerator, align 4, !dbg !1631
  call void @llvm.dbg.declare(metadata i32* %u32denominator, metadata !1632, metadata !DIExpression()), !dbg !1633
  store i32 0, i32* %u32denominator, align 4, !dbg !1633
  %0 = load i32, i32* %numerator.addr, align 4, !dbg !1634
  %cmp = icmp slt i32 %0, 0, !dbg !1636
  br i1 %cmp, label %if.then, label %if.else23, !dbg !1637

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %denominator.addr, align 4, !dbg !1638
  %cmp1 = icmp sle i32 %1, 0, !dbg !1641
  br i1 %cmp1, label %if.then2, label %if.else12, !dbg !1642

if.then2:                                         ; preds = %if.then
  %2 = load i32, i32* %denominator.addr, align 4, !dbg !1643
  %cmp3 = icmp sge i32 %2, 0, !dbg !1646
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !1647

if.then4:                                         ; preds = %if.then2
  store i32 -2147483648, i32* %retval, align 4, !dbg !1648
  br label %return, !dbg !1648

if.else:                                          ; preds = %if.then2
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1650
  %sub = sub nsw i32 0, %3, !dbg !1652
  store i32 %sub, i32* %u32numerator, align 4, !dbg !1653
  %4 = load i32, i32* %denominator.addr, align 4, !dbg !1654
  %sub5 = sub nsw i32 0, %4, !dbg !1655
  store i32 %sub5, i32* %u32denominator, align 4, !dbg !1656
  %5 = load i32, i32* %u32numerator, align 4, !dbg !1657
  %6 = load i32, i32* %u32numerator, align 4, !dbg !1658
  %7 = load i32, i32* %u32denominator, align 4, !dbg !1659
  %int_cast_to_i64 = zext i32 %7 to i64, !dbg !1660
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1660
  %div = udiv i32 %6, %7, !dbg !1660, !klee.check.div !101
  %8 = load i32, i32* %u32denominator, align 4, !dbg !1661
  %mul = mul i32 %div, %8, !dbg !1662
  %sub6 = sub i32 %5, %mul, !dbg !1663
  %shl = shl i32 %sub6, 1, !dbg !1664
  store i32 %shl, i32* %u32Temp1, align 4, !dbg !1665
  %9 = load i32, i32* %u32numerator, align 4, !dbg !1666
  %10 = load i32, i32* %u32denominator, align 4, !dbg !1667
  %int_cast_to_i641 = zext i32 %10 to i64, !dbg !1668
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1668
  %div7 = udiv i32 %9, %10, !dbg !1668, !klee.check.div !101
  %11 = load i32, i32* %u32Temp1, align 4, !dbg !1669
  %12 = load i32, i32* %u32denominator, align 4, !dbg !1670
  %int_cast_to_i642 = zext i32 %12 to i64, !dbg !1671
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1671
  %div8 = udiv i32 %11, %12, !dbg !1671, !klee.check.div !101
  %add = add i32 %div7, %div8, !dbg !1672
  store i32 %add, i32* %u32Temp2, align 4, !dbg !1673
  %13 = load i32, i32* %u32Temp2, align 4, !dbg !1674
  %cmp9 = icmp ule i32 %13, 2147483647, !dbg !1676
  br i1 %cmp9, label %if.then10, label %if.else11, !dbg !1677

if.then10:                                        ; preds = %if.else
  %14 = load i32, i32* %u32Temp2, align 4, !dbg !1678
  store i32 %14, i32* %retval, align 4, !dbg !1680
  br label %return, !dbg !1680

if.else11:                                        ; preds = %if.else
  store i32 2147483647, i32* %retval, align 4, !dbg !1681
  br label %return, !dbg !1681

if.else12:                                        ; preds = %if.then
  %15 = load i32, i32* %numerator.addr, align 4, !dbg !1683
  %neg = xor i32 %15, -1, !dbg !1685
  %add13 = add nsw i32 %neg, 1, !dbg !1686
  store i32 %add13, i32* %u32numerator, align 4, !dbg !1687
  %16 = load i32, i32* %u32numerator, align 4, !dbg !1688
  %17 = load i32, i32* %u32numerator, align 4, !dbg !1689
  %18 = load i32, i32* %denominator.addr, align 4, !dbg !1690
  %int_cast_to_i643 = zext i32 %18 to i64, !dbg !1691
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1691
  %div14 = udiv i32 %17, %18, !dbg !1691, !klee.check.div !101
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1692
  %mul15 = mul i32 %div14, %19, !dbg !1693
  %sub16 = sub i32 %16, %mul15, !dbg !1694
  %shl17 = shl i32 %sub16, 1, !dbg !1695
  store i32 %shl17, i32* %s32Temp1, align 4, !dbg !1696
  %20 = load i32, i32* %u32numerator, align 4, !dbg !1697
  %21 = load i32, i32* %denominator.addr, align 4, !dbg !1698
  %int_cast_to_i644 = zext i32 %21 to i64, !dbg !1699
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1699
  %div18 = udiv i32 %20, %21, !dbg !1699, !klee.check.div !101
  %22 = load i32, i32* %s32Temp1, align 4, !dbg !1700
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1701
  %int_cast_to_i645 = zext i32 %23 to i64, !dbg !1702
  call void @klee_div_zero_check(i64 %int_cast_to_i645), !dbg !1702
  %div19 = sdiv i32 %22, %23, !dbg !1702, !klee.check.div !101
  %add20 = add i32 %div18, %div19, !dbg !1703
  store i32 %add20, i32* %s32Temp2, align 4, !dbg !1704
  %24 = load i32, i32* %s32Temp2, align 4, !dbg !1705
  %neg21 = xor i32 %24, -1, !dbg !1706
  %add22 = add nsw i32 %neg21, 1, !dbg !1707
  store i32 %add22, i32* %retval, align 4, !dbg !1708
  br label %return, !dbg !1708

if.else23:                                        ; preds = %entry
  %25 = load i32, i32* %denominator.addr, align 4, !dbg !1709
  %cmp24 = icmp sle i32 %25, 0, !dbg !1712
  br i1 %cmp24, label %if.then25, label %if.else40, !dbg !1713

if.then25:                                        ; preds = %if.else23
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1714
  %cmp26 = icmp sge i32 %26, 0, !dbg !1717
  br i1 %cmp26, label %if.then27, label %if.else28, !dbg !1718

if.then27:                                        ; preds = %if.then25
  store i32 2147483647, i32* %retval, align 4, !dbg !1719
  br label %return, !dbg !1719

if.else28:                                        ; preds = %if.then25
  %27 = load i32, i32* %denominator.addr, align 4, !dbg !1721
  %neg29 = xor i32 %27, -1, !dbg !1723
  %add30 = add nsw i32 %neg29, 1, !dbg !1724
  store i32 %add30, i32* %u32denominator, align 4, !dbg !1725
  %28 = load i32, i32* %numerator.addr, align 4, !dbg !1726
  %29 = load i32, i32* %numerator.addr, align 4, !dbg !1727
  %30 = load i32, i32* %u32denominator, align 4, !dbg !1728
  %int_cast_to_i646 = zext i32 %30 to i64, !dbg !1729
  call void @klee_div_zero_check(i64 %int_cast_to_i646), !dbg !1729
  %div31 = udiv i32 %29, %30, !dbg !1729, !klee.check.div !101
  %31 = load i32, i32* %u32denominator, align 4, !dbg !1730
  %mul32 = mul i32 %div31, %31, !dbg !1731
  %sub33 = sub i32 %28, %mul32, !dbg !1732
  %shl34 = shl i32 %sub33, 1, !dbg !1733
  store i32 %shl34, i32* %s32Temp1, align 4, !dbg !1734
  %32 = load i32, i32* %numerator.addr, align 4, !dbg !1735
  %33 = load i32, i32* %u32denominator, align 4, !dbg !1736
  %int_cast_to_i647 = zext i32 %33 to i64, !dbg !1737
  call void @klee_div_zero_check(i64 %int_cast_to_i647), !dbg !1737
  %div35 = udiv i32 %32, %33, !dbg !1737, !klee.check.div !101
  %34 = load i32, i32* %s32Temp1, align 4, !dbg !1738
  %35 = load i32, i32* %u32denominator, align 4, !dbg !1739
  %int_cast_to_i648 = zext i32 %35 to i64, !dbg !1740
  call void @klee_div_zero_check(i64 %int_cast_to_i648), !dbg !1740
  %div36 = udiv i32 %34, %35, !dbg !1740, !klee.check.div !101
  %add37 = add i32 %div35, %div36, !dbg !1741
  store i32 %add37, i32* %s32Temp2, align 4, !dbg !1742
  %36 = load i32, i32* %s32Temp2, align 4, !dbg !1743
  %neg38 = xor i32 %36, -1, !dbg !1744
  %add39 = add nsw i32 %neg38, 1, !dbg !1745
  store i32 %add39, i32* %retval, align 4, !dbg !1746
  br label %return, !dbg !1746

if.else40:                                        ; preds = %if.else23
  %37 = load i32, i32* %numerator.addr, align 4, !dbg !1747
  %38 = load i32, i32* %numerator.addr, align 4, !dbg !1749
  %39 = load i32, i32* %denominator.addr, align 4, !dbg !1750
  %int_cast_to_i649 = zext i32 %39 to i64, !dbg !1751
  call void @klee_div_zero_check(i64 %int_cast_to_i649), !dbg !1751
  %div41 = sdiv i32 %38, %39, !dbg !1751, !klee.check.div !101
  %40 = load i32, i32* %denominator.addr, align 4, !dbg !1752
  %mul42 = mul nsw i32 %div41, %40, !dbg !1753
  %sub43 = sub nsw i32 %37, %mul42, !dbg !1754
  %shl44 = shl i32 %sub43, 1, !dbg !1755
  store i32 %shl44, i32* %u32Temp1, align 4, !dbg !1756
  %41 = load i32, i32* %numerator.addr, align 4, !dbg !1757
  %42 = load i32, i32* %denominator.addr, align 4, !dbg !1758
  %int_cast_to_i6410 = zext i32 %42 to i64, !dbg !1759
  call void @klee_div_zero_check(i64 %int_cast_to_i6410), !dbg !1759
  %div45 = sdiv i32 %41, %42, !dbg !1759, !klee.check.div !101
  %43 = load i32, i32* %u32Temp1, align 4, !dbg !1760
  %44 = load i32, i32* %denominator.addr, align 4, !dbg !1761
  %int_cast_to_i6411 = zext i32 %44 to i64, !dbg !1762
  call void @klee_div_zero_check(i64 %int_cast_to_i6411), !dbg !1762
  %div46 = udiv i32 %43, %44, !dbg !1762, !klee.check.div !101
  %add47 = add i32 %div45, %div46, !dbg !1763
  store i32 %add47, i32* %s32Temp2, align 4, !dbg !1764
  %45 = load i32, i32* %s32Temp2, align 4, !dbg !1765
  store i32 %45, i32* %retval, align 4, !dbg !1766
  br label %return, !dbg !1766

return:                                           ; preds = %if.else40, %if.else28, %if.then27, %if.else12, %if.else11, %if.then10, %if.then4
  %46 = load i32, i32* %retval, align 4, !dbg !1767
  ret i32 %46, !dbg !1767
}

; Function Attrs: noinline nounwind uwtable
define dso_local signext i16 @s16_div_s32_u32(i32 %numerator, i32 %denominator) #0 !dbg !1768 {
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
  call void @llvm.dbg.declare(metadata i32* %numerator.addr, metadata !1771, metadata !DIExpression()), !dbg !1772
  store i32 %denominator, i32* %denominator.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %denominator.addr, metadata !1773, metadata !DIExpression()), !dbg !1774
  call void @llvm.dbg.declare(metadata i32* %numerator_prime, metadata !1775, metadata !DIExpression()), !dbg !1776
  store i32 0, i32* %numerator_prime, align 4, !dbg !1776
  call void @llvm.dbg.declare(metadata i32* %u32Temp1, metadata !1777, metadata !DIExpression()), !dbg !1778
  store i32 0, i32* %u32Temp1, align 4, !dbg !1778
  call void @llvm.dbg.declare(metadata i32* %u32Temp2, metadata !1779, metadata !DIExpression()), !dbg !1780
  store i32 0, i32* %u32Temp2, align 4, !dbg !1780
  call void @llvm.dbg.declare(metadata i32* %u32Temp3, metadata !1781, metadata !DIExpression()), !dbg !1782
  store i32 0, i32* %u32Temp3, align 4, !dbg !1782
  call void @llvm.dbg.declare(metadata i32* %s32Temp1, metadata !1783, metadata !DIExpression()), !dbg !1784
  store i32 0, i32* %s32Temp1, align 4, !dbg !1784
  call void @llvm.dbg.declare(metadata i32* %s32Temp2, metadata !1785, metadata !DIExpression()), !dbg !1786
  store i32 0, i32* %s32Temp2, align 4, !dbg !1786
  call void @llvm.dbg.declare(metadata i32* %s32Temp3, metadata !1787, metadata !DIExpression()), !dbg !1788
  store i32 0, i32* %s32Temp3, align 4, !dbg !1788
  %0 = load i32, i32* %denominator.addr, align 4, !dbg !1789
  %cmp = icmp eq i32 %0, 0, !dbg !1791
  br i1 %cmp, label %if.then, label %if.else3, !dbg !1792

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %numerator.addr, align 4, !dbg !1793
  %cmp1 = icmp slt i32 %1, 0, !dbg !1796
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !1797

if.then2:                                         ; preds = %if.then
  store i16 -32768, i16* %retval, align 2, !dbg !1798
  br label %return, !dbg !1798

if.else:                                          ; preds = %if.then
  store i16 32767, i16* %retval, align 2, !dbg !1800
  br label %return, !dbg !1800

if.else3:                                         ; preds = %entry
  %2 = load i32, i32* %numerator.addr, align 4, !dbg !1802
  %cmp4 = icmp slt i32 %2, 0, !dbg !1805
  br i1 %cmp4, label %if.then5, label %if.else22, !dbg !1806

if.then5:                                         ; preds = %if.else3
  %3 = load i32, i32* %numerator.addr, align 4, !dbg !1807
  %sub = sub nsw i32 0, %3, !dbg !1809
  store i32 %sub, i32* %numerator_prime, align 4, !dbg !1810
  %4 = load i32, i32* %numerator_prime, align 4, !dbg !1811
  %5 = load i32, i32* %denominator.addr, align 4, !dbg !1812
  %int_cast_to_i64 = zext i32 %5 to i64, !dbg !1813
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !1813
  %div = udiv i32 %4, %5, !dbg !1813, !klee.check.div !101
  store i32 %div, i32* %u32Temp1, align 4, !dbg !1814
  %6 = load i32, i32* %numerator_prime, align 4, !dbg !1815
  %7 = load i32, i32* %u32Temp1, align 4, !dbg !1816
  %8 = load i32, i32* %denominator.addr, align 4, !dbg !1817
  %mul = mul i32 %7, %8, !dbg !1818
  %sub6 = sub i32 %6, %mul, !dbg !1819
  store i32 %sub6, i32* %u32Temp2, align 4, !dbg !1820
  %9 = load i32, i32* %denominator.addr, align 4, !dbg !1821
  %and = and i32 %9, 1, !dbg !1823
  %cmp7 = icmp eq i32 %and, 0, !dbg !1824
  br i1 %cmp7, label %if.then8, label %if.else9, !dbg !1825

if.then8:                                         ; preds = %if.then5
  %10 = load i32, i32* %denominator.addr, align 4, !dbg !1826
  %shr = lshr i32 %10, 1, !dbg !1828
  store i32 %shr, i32* %denominator.addr, align 4, !dbg !1829
  br label %if.end, !dbg !1830

if.else9:                                         ; preds = %if.then5
  %11 = load i32, i32* %denominator.addr, align 4, !dbg !1831
  %shr10 = lshr i32 %11, 1, !dbg !1833
  %add = add i32 %shr10, 1, !dbg !1834
  store i32 %add, i32* %denominator.addr, align 4, !dbg !1835
  br label %if.end

if.end:                                           ; preds = %if.else9, %if.then8
  %12 = load i32, i32* %u32Temp2, align 4, !dbg !1836
  %13 = load i32, i32* %denominator.addr, align 4, !dbg !1838
  %cmp11 = icmp ult i32 %12, %13, !dbg !1839
  br i1 %cmp11, label %if.then12, label %if.else14, !dbg !1840

if.then12:                                        ; preds = %if.end
  %14 = load i32, i32* %u32Temp1, align 4, !dbg !1841
  %neg = xor i32 %14, -1, !dbg !1843
  %add13 = add i32 %neg, 1, !dbg !1844
  store i32 %add13, i32* %s32Temp3, align 4, !dbg !1845
  br label %if.end18, !dbg !1846

if.else14:                                        ; preds = %if.end
  %15 = load i32, i32* %u32Temp1, align 4, !dbg !1847
  %add15 = add i32 %15, 1, !dbg !1849
  %neg16 = xor i32 %add15, -1, !dbg !1850
  %add17 = add i32 %neg16, 1, !dbg !1851
  store i32 %add17, i32* %s32Temp3, align 4, !dbg !1852
  br label %if.end18

if.end18:                                         ; preds = %if.else14, %if.then12
  %16 = load i32, i32* %s32Temp3, align 4, !dbg !1853
  %cmp19 = icmp sge i32 %16, -32768, !dbg !1855
  br i1 %cmp19, label %if.then20, label %if.else21, !dbg !1856

if.then20:                                        ; preds = %if.end18
  %17 = load i32, i32* %s32Temp3, align 4, !dbg !1857
  %conv = trunc i32 %17 to i16, !dbg !1859
  store i16 %conv, i16* %retval, align 2, !dbg !1860
  br label %return, !dbg !1860

if.else21:                                        ; preds = %if.end18
  store i16 -32768, i16* %retval, align 2, !dbg !1861
  br label %return, !dbg !1861

if.else22:                                        ; preds = %if.else3
  %18 = load i32, i32* %numerator.addr, align 4, !dbg !1863
  %19 = load i32, i32* %denominator.addr, align 4, !dbg !1865
  %int_cast_to_i641 = zext i32 %19 to i64, !dbg !1866
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !1866
  %div23 = udiv i32 %18, %19, !dbg !1866, !klee.check.div !101
  %20 = load i32, i32* %denominator.addr, align 4, !dbg !1867
  %mul24 = mul i32 %div23, %20, !dbg !1868
  store i32 %mul24, i32* %s32Temp1, align 4, !dbg !1869
  %21 = load i32, i32* %numerator.addr, align 4, !dbg !1870
  %22 = load i32, i32* %numerator.addr, align 4, !dbg !1871
  %23 = load i32, i32* %denominator.addr, align 4, !dbg !1872
  %int_cast_to_i642 = zext i32 %23 to i64, !dbg !1873
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !1873
  %div25 = udiv i32 %22, %23, !dbg !1873, !klee.check.div !101
  %24 = load i32, i32* %denominator.addr, align 4, !dbg !1874
  %mul26 = mul i32 %div25, %24, !dbg !1875
  %sub27 = sub i32 %21, %mul26, !dbg !1876
  %shl = shl i32 %sub27, 1, !dbg !1877
  store i32 %shl, i32* %s32Temp2, align 4, !dbg !1878
  %25 = load i32, i32* %s32Temp2, align 4, !dbg !1879
  %26 = load i32, i32* %denominator.addr, align 4, !dbg !1880
  %int_cast_to_i643 = zext i32 %26 to i64, !dbg !1881
  call void @klee_div_zero_check(i64 %int_cast_to_i643), !dbg !1881
  %div28 = udiv i32 %25, %26, !dbg !1881, !klee.check.div !101
  %27 = load i32, i32* %numerator.addr, align 4, !dbg !1882
  %28 = load i32, i32* %denominator.addr, align 4, !dbg !1883
  %int_cast_to_i644 = zext i32 %28 to i64, !dbg !1884
  call void @klee_div_zero_check(i64 %int_cast_to_i644), !dbg !1884
  %div29 = udiv i32 %27, %28, !dbg !1884, !klee.check.div !101
  %add30 = add i32 %div28, %div29, !dbg !1885
  store i32 %add30, i32* %s32Temp3, align 4, !dbg !1886
  %29 = load i32, i32* %s32Temp3, align 4, !dbg !1887
  %cmp31 = icmp sle i32 %29, 32767, !dbg !1889
  br i1 %cmp31, label %if.then33, label %if.else35, !dbg !1890

if.then33:                                        ; preds = %if.else22
  %30 = load i32, i32* %s32Temp3, align 4, !dbg !1891
  %conv34 = trunc i32 %30 to i16, !dbg !1893
  store i16 %conv34, i16* %retval, align 2, !dbg !1894
  br label %return, !dbg !1894

if.else35:                                        ; preds = %if.else22
  store i16 32767, i16* %retval, align 2, !dbg !1895
  br label %return, !dbg !1895

return:                                           ; preds = %if.else35, %if.then33, %if.else21, %if.then20, %if.else, %if.then2
  %31 = load i16, i16* %retval, align 2, !dbg !1897
  ret i16 %31, !dbg !1897
}

; Function Attrs: nounwind uwtable
define dso_local void @klee_div_zero_check(i64 %0) #4 !dbg !1898 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !1904, metadata !DIExpression()), !dbg !1905
  %2 = icmp eq i64 %0, 0, !dbg !1906
  br i1 %2, label %3, label %4, !dbg !1908

3:                                                ; preds = %1
  tail call void @klee_report_error(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.4, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1.5, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2.6, i64 0, i64 0)) #6, !dbg !1909
  unreachable, !dbg !1909

4:                                                ; preds = %1
  ret void, !dbg !1910
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
!3 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123/div_Ccode_alarm_0123.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
!4 = !{}
!5 = !{!6, !13, !18, !21, !25}
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "s16", file: !7, line: 9, baseType: !8)
!7 = !DIFile(filename: "Platform_Types.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
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
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !9, line: 27, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !11, line: 44, baseType: !20)
!20 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "s32", file: !7, line: 11, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !9, line: 26, baseType: !23)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !11, line: 41, baseType: !24)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "u16", file: !7, line: 8, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !15, line: 25, baseType: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 40, baseType: !28)
!28 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!29 = !{!0}
!30 = !DIFile(filename: "klee_alarm_support.h", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
!31 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!32 = distinct !DICompileUnit(language: DW_LANG_C99, file: !33, producer: "clang version 13.0.0 (https://github.com/llvm/llvm-project/ 24c8eaec9467b2aaf70b0db33a4e4dd415139a50)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, splitDebugInlining: false, nameTableKind: None)
!33 = !DIFile(filename: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123/klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
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
!44 = !DIFile(filename: "klee_harness.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
!45 = !DISubroutineType(types: !46)
!46 = !{!24}
!47 = !DILocalVariable(name: "x_value", scope: !43, file: !44, line: 9, type: !22)
!48 = !DILocation(line: 9, column: 13, scope: !43)
!49 = !DILocalVariable(name: "y_value", scope: !43, file: !44, line: 10, type: !26)
!50 = !DILocation(line: 10, column: 14, scope: !43)
!51 = !DILocalVariable(name: "result", scope: !43, file: !44, line: 11, type: !26)
!52 = !DILocation(line: 11, column: 14, scope: !43)
!53 = !DILocation(line: 13, column: 24, scope: !43)
!54 = !DILocation(line: 13, column: 5, scope: !43)
!55 = !DILocation(line: 14, column: 24, scope: !43)
!56 = !DILocation(line: 14, column: 5, scope: !43)
!57 = !DILocation(line: 16, column: 30, scope: !43)
!58 = !DILocation(line: 16, column: 39, scope: !43)
!59 = !DILocation(line: 16, column: 14, scope: !43)
!60 = !DILocation(line: 16, column: 12, scope: !43)
!61 = !DILocation(line: 18, column: 11, scope: !43)
!62 = !DILocation(line: 19, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "s16_fac05_div_s16_s16", scope: !64, file: !64, line: 170, type: !65, scopeLine: 171, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DIFile(filename: "src_analysis/sources/div_Ccode.c", directory: "/home/matin/frama-work/frama-eva-analysis/analysis/klee_phase_c/u16_div_s32_u16/alarm_0123")
!65 = !DISubroutineType(types: !66)
!66 = !{!6, !6, !6}
!67 = !DILocalVariable(name: "numerator", arg: 1, scope: !63, file: !64, line: 170, type: !6)
!68 = !DILocation(line: 170, column: 31, scope: !63)
!69 = !DILocalVariable(name: "denominator", arg: 2, scope: !63, file: !64, line: 170, type: !6)
!70 = !DILocation(line: 170, column: 47, scope: !63)
!71 = !DILocalVariable(name: "s32Temp1", scope: !63, file: !64, line: 172, type: !21)
!72 = !DILocation(line: 172, column: 6, scope: !63)
!73 = !DILocalVariable(name: "s32Temp2", scope: !63, file: !64, line: 172, type: !21)
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
!183 = !{!6, !21, !6}
!184 = !DILocalVariable(name: "numerator", arg: 1, scope: !181, file: !64, line: 255, type: !21)
!185 = !DILocation(line: 255, column: 25, scope: !181)
!186 = !DILocalVariable(name: "denominator", arg: 2, scope: !181, file: !64, line: 255, type: !6)
!187 = !DILocation(line: 255, column: 41, scope: !181)
!188 = !DILocalVariable(name: "s32Temp1", scope: !181, file: !64, line: 257, type: !21)
!189 = !DILocation(line: 257, column: 6, scope: !181)
!190 = !DILocalVariable(name: "s32Temp2", scope: !181, file: !64, line: 257, type: !21)
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
!296 = !{!6, !6, !25}
!297 = !DILocalVariable(name: "numerator", arg: 1, scope: !294, file: !64, line: 343, type: !6)
!298 = !DILocation(line: 343, column: 31, scope: !294)
!299 = !DILocalVariable(name: "denominator", arg: 2, scope: !294, file: !64, line: 343, type: !25)
!300 = !DILocation(line: 343, column: 47, scope: !294)
!301 = !DILocalVariable(name: "u16Temp1", scope: !294, file: !64, line: 345, type: !25)
!302 = !DILocation(line: 345, column: 6, scope: !294)
!303 = !DILocalVariable(name: "s32Temp1", scope: !294, file: !64, line: 346, type: !21)
!304 = !DILocation(line: 346, column: 6, scope: !294)
!305 = !DILocalVariable(name: "s32Temp2", scope: !294, file: !64, line: 346, type: !21)
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
!372 = !DILocalVariable(name: "denominator", arg: 2, scope: !369, file: !64, line: 399, type: !25)
!373 = !DILocation(line: 399, column: 45, scope: !369)
!374 = !DILocalVariable(name: "u16Temp1", scope: !369, file: !64, line: 401, type: !25)
!375 = !DILocation(line: 401, column: 6, scope: !369)
!376 = !DILocalVariable(name: "s32Temp1", scope: !369, file: !64, line: 402, type: !21)
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
!417 = !{!13, !25, !25}
!418 = !DILocalVariable(name: "numerator", arg: 1, scope: !415, file: !64, line: 440, type: !25)
!419 = !DILocation(line: 440, column: 28, scope: !415)
!420 = !DILocalVariable(name: "denominator", arg: 2, scope: !415, file: !64, line: 440, type: !25)
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
!463 = !{!25, !21, !25}
!464 = !DILocalVariable(name: "x_value", arg: 1, scope: !461, file: !64, line: 478, type: !21)
!465 = !DILocation(line: 478, column: 25, scope: !461)
!466 = !DILocalVariable(name: "y_value", arg: 2, scope: !461, file: !64, line: 478, type: !25)
!467 = !DILocation(line: 478, column: 38, scope: !461)
!468 = !DILocalVariable(name: "s32Temp1", scope: !461, file: !64, line: 480, type: !21)
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
!487 = !DILocation(line: 496, column: 50, scope: !488)
!488 = distinct !DILexicalBlock(scope: !489, file: !64, line: 496, column: 7)
!489 = distinct !DILexicalBlock(scope: !474, file: !64, line: 494, column: 2)
!490 = !DILocation(line: 496, column: 65, scope: !488)
!491 = !DILocation(line: 496, column: 60, scope: !488)
!492 = !DILocation(line: 496, column: 58, scope: !488)
!493 = !DILocation(line: 496, column: 34, scope: !488)
!494 = !DILocation(line: 496, column: 91, scope: !488)
!495 = !DILocation(line: 496, column: 86, scope: !488)
!496 = !DILocation(line: 496, column: 76, scope: !488)
!497 = !DILocation(line: 496, column: 9, scope: !488)
!498 = !DILocation(line: 496, column: 7, scope: !489)
!499 = !DILocation(line: 497, column: 7, scope: !500)
!500 = distinct !DILexicalBlock(scope: !488, file: !64, line: 496, column: 103)
!501 = !DILocation(line: 500, column: 50, scope: !502)
!502 = distinct !DILexicalBlock(scope: !489, file: !64, line: 500, column: 7)
!503 = !DILocation(line: 500, column: 65, scope: !502)
!504 = !DILocation(line: 500, column: 60, scope: !502)
!505 = !DILocation(line: 500, column: 58, scope: !502)
!506 = !DILocation(line: 500, column: 34, scope: !502)
!507 = !DILocation(line: 500, column: 91, scope: !502)
!508 = !DILocation(line: 500, column: 86, scope: !502)
!509 = !DILocation(line: 500, column: 76, scope: !502)
!510 = !DILocation(line: 500, column: 9, scope: !502)
!511 = !DILocation(line: 500, column: 7, scope: !489)
!512 = !DILocation(line: 501, column: 7, scope: !513)
!513 = distinct !DILexicalBlock(scope: !502, file: !64, line: 500, column: 103)
!514 = !DILocation(line: 508, column: 41, scope: !489)
!515 = !DILocation(line: 508, column: 56, scope: !489)
!516 = !DILocation(line: 508, column: 51, scope: !489)
!517 = !DILocation(line: 508, column: 49, scope: !489)
!518 = !DILocation(line: 508, column: 72, scope: !489)
!519 = !DILocation(line: 508, column: 67, scope: !489)
!520 = !DILocation(line: 508, column: 65, scope: !489)
!521 = !DILocation(line: 508, column: 25, scope: !489)
!522 = !DILocation(line: 508, column: 23, scope: !489)
!523 = !DILocation(line: 509, column: 3, scope: !489)
!524 = !DILocation(line: 527, column: 1, scope: !461)
!525 = distinct !DISubprogram(name: "klee_alarm_s32_mul_upper", scope: !30, file: !30, line: 78, type: !526, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!526 = !DISubroutineType(types: !527)
!527 = !{!24, !18, !18}
!528 = !DILocalVariable(name: "left", arg: 1, scope: !525, file: !30, line: 78, type: !18)
!529 = !DILocation(line: 78, column: 38, scope: !525)
!530 = !DILocalVariable(name: "right", arg: 2, scope: !525, file: !30, line: 78, type: !18)
!531 = !DILocation(line: 78, column: 52, scope: !525)
!532 = !DILocation(line: 80, column: 12, scope: !525)
!533 = !DILocation(line: 80, column: 19, scope: !525)
!534 = !DILocation(line: 80, column: 17, scope: !525)
!535 = !DILocation(line: 80, column: 25, scope: !525)
!536 = !DILocation(line: 80, column: 5, scope: !525)
!537 = distinct !DISubprogram(name: "klee_alarm_s32_mul_lower", scope: !30, file: !30, line: 72, type: !526, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!538 = !DILocalVariable(name: "left", arg: 1, scope: !537, file: !30, line: 72, type: !18)
!539 = !DILocation(line: 72, column: 38, scope: !537)
!540 = !DILocalVariable(name: "right", arg: 2, scope: !537, file: !30, line: 72, type: !18)
!541 = !DILocation(line: 72, column: 52, scope: !537)
!542 = !DILocation(line: 74, column: 12, scope: !537)
!543 = !DILocation(line: 74, column: 19, scope: !537)
!544 = !DILocation(line: 74, column: 17, scope: !537)
!545 = !DILocation(line: 74, column: 25, scope: !537)
!546 = !DILocation(line: 74, column: 5, scope: !537)
!547 = distinct !DISubprogram(name: "u16_fac1_div_u16_u16", scope: !64, file: !64, line: 545, type: !548, scopeLine: 546, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!548 = !DISubroutineType(types: !549)
!549 = !{!25, !25, !25}
!550 = !DILocalVariable(name: "numerator", arg: 1, scope: !547, file: !64, line: 545, type: !25)
!551 = !DILocation(line: 545, column: 31, scope: !547)
!552 = !DILocalVariable(name: "denominator", arg: 2, scope: !547, file: !64, line: 545, type: !25)
!553 = !DILocation(line: 545, column: 46, scope: !547)
!554 = !DILocalVariable(name: "u32Temp", scope: !547, file: !64, line: 547, type: !423)
!555 = !DILocation(line: 547, column: 6, scope: !547)
!556 = !DILocation(line: 548, column: 5, scope: !557)
!557 = distinct !DILexicalBlock(scope: !547, file: !64, line: 548, column: 5)
!558 = !DILocation(line: 548, column: 17, scope: !557)
!559 = !DILocation(line: 548, column: 5, scope: !547)
!560 = !DILocation(line: 550, column: 3, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !64, line: 549, column: 2)
!562 = !DILocation(line: 554, column: 14, scope: !563)
!563 = distinct !DILexicalBlock(scope: !557, file: !64, line: 553, column: 2)
!564 = !DILocation(line: 554, column: 23, scope: !563)
!565 = !DILocation(line: 554, column: 32, scope: !563)
!566 = !DILocation(line: 554, column: 44, scope: !563)
!567 = !DILocation(line: 554, column: 29, scope: !563)
!568 = !DILocation(line: 554, column: 11, scope: !563)
!569 = !DILocation(line: 555, column: 13, scope: !563)
!570 = !DILocation(line: 555, column: 21, scope: !563)
!571 = !DILocation(line: 555, column: 20, scope: !563)
!572 = !DILocation(line: 555, column: 11, scope: !563)
!573 = !DILocation(line: 556, column: 6, scope: !574)
!574 = distinct !DILexicalBlock(scope: !563, file: !64, line: 556, column: 6)
!575 = !DILocation(line: 556, column: 14, scope: !574)
!576 = !DILocation(line: 556, column: 6, scope: !563)
!577 = !DILocation(line: 558, column: 11, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !64, line: 557, column: 3)
!579 = !DILocation(line: 558, column: 19, scope: !578)
!580 = !DILocation(line: 558, column: 4, scope: !578)
!581 = !DILocation(line: 562, column: 4, scope: !582)
!582 = distinct !DILexicalBlock(scope: !574, file: !64, line: 561, column: 3)
!583 = !DILocation(line: 566, column: 1, scope: !547)
!584 = distinct !DISubprogram(name: "u16_div_u32_u16", scope: !64, file: !64, line: 583, type: !585, scopeLine: 584, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!585 = !DISubroutineType(types: !586)
!586 = !{!25, !423, !25}
!587 = !DILocalVariable(name: "x_value", arg: 1, scope: !584, file: !64, line: 583, type: !423)
!588 = !DILocation(line: 583, column: 25, scope: !584)
!589 = !DILocalVariable(name: "y_value", arg: 2, scope: !584, file: !64, line: 583, type: !25)
!590 = !DILocation(line: 583, column: 38, scope: !584)
!591 = !DILocalVariable(name: "u32Temp1", scope: !584, file: !64, line: 585, type: !423)
!592 = !DILocation(line: 585, column: 6, scope: !584)
!593 = !DILocalVariable(name: "u32Temp2", scope: !584, file: !64, line: 585, type: !423)
!594 = !DILocation(line: 585, column: 17, scope: !584)
!595 = !DILocation(line: 586, column: 12, scope: !584)
!596 = !DILocation(line: 586, column: 20, scope: !584)
!597 = !DILocation(line: 586, column: 10, scope: !584)
!598 = !DILocation(line: 587, column: 5, scope: !599)
!599 = distinct !DILexicalBlock(scope: !584, file: !64, line: 587, column: 5)
!600 = !DILocation(line: 587, column: 13, scope: !599)
!601 = !DILocation(line: 587, column: 5, scope: !584)
!602 = !DILocation(line: 589, column: 3, scope: !603)
!603 = distinct !DILexicalBlock(scope: !599, file: !64, line: 588, column: 2)
!604 = !DILocation(line: 593, column: 14, scope: !605)
!605 = distinct !DILexicalBlock(scope: !599, file: !64, line: 592, column: 2)
!606 = !DILocation(line: 593, column: 22, scope: !605)
!607 = !DILocation(line: 593, column: 21, scope: !605)
!608 = !DILocation(line: 593, column: 12, scope: !605)
!609 = !DILocation(line: 594, column: 14, scope: !605)
!610 = !DILocation(line: 594, column: 25, scope: !605)
!611 = !DILocation(line: 594, column: 36, scope: !605)
!612 = !DILocation(line: 594, column: 34, scope: !605)
!613 = !DILocation(line: 594, column: 22, scope: !605)
!614 = !DILocation(line: 594, column: 45, scope: !605)
!615 = !DILocation(line: 594, column: 12, scope: !605)
!616 = !DILocation(line: 595, column: 15, scope: !605)
!617 = !DILocation(line: 595, column: 24, scope: !605)
!618 = !DILocation(line: 595, column: 23, scope: !605)
!619 = !DILocation(line: 595, column: 36, scope: !605)
!620 = !DILocation(line: 595, column: 44, scope: !605)
!621 = !DILocation(line: 595, column: 43, scope: !605)
!622 = !DILocation(line: 595, column: 33, scope: !605)
!623 = !DILocation(line: 595, column: 12, scope: !605)
!624 = !DILocation(line: 596, column: 6, scope: !625)
!625 = distinct !DILexicalBlock(scope: !605, file: !64, line: 596, column: 6)
!626 = !DILocation(line: 596, column: 15, scope: !625)
!627 = !DILocation(line: 596, column: 6, scope: !605)
!628 = !DILocation(line: 598, column: 11, scope: !629)
!629 = distinct !DILexicalBlock(scope: !625, file: !64, line: 597, column: 3)
!630 = !DILocation(line: 598, column: 20, scope: !629)
!631 = !DILocation(line: 598, column: 4, scope: !629)
!632 = !DILocation(line: 602, column: 4, scope: !633)
!633 = distinct !DILexicalBlock(scope: !625, file: !64, line: 601, column: 3)
!634 = !DILocation(line: 606, column: 1, scope: !584)
!635 = distinct !DISubprogram(name: "s16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 625, type: !636, scopeLine: 626, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!636 = !DISubroutineType(types: !637)
!637 = !{!6, !6, !25, !6}
!638 = !DILocalVariable(name: "factor1", arg: 1, scope: !635, file: !64, line: 625, type: !6)
!639 = !DILocation(line: 625, column: 33, scope: !635)
!640 = !DILocalVariable(name: "factor2", arg: 2, scope: !635, file: !64, line: 625, type: !25)
!641 = !DILocation(line: 625, column: 46, scope: !635)
!642 = !DILocalVariable(name: "denominator", arg: 3, scope: !635, file: !64, line: 625, type: !6)
!643 = !DILocation(line: 625, column: 59, scope: !635)
!644 = !DILocalVariable(name: "s32Result", scope: !635, file: !64, line: 627, type: !21)
!645 = !DILocation(line: 627, column: 6, scope: !635)
!646 = !DILocalVariable(name: "s32Temp1", scope: !635, file: !64, line: 627, type: !21)
!647 = !DILocation(line: 627, column: 21, scope: !635)
!648 = !DILocation(line: 628, column: 14, scope: !635)
!649 = !DILocation(line: 628, column: 24, scope: !635)
!650 = !DILocation(line: 628, column: 22, scope: !635)
!651 = !DILocation(line: 628, column: 12, scope: !635)
!652 = !DILocation(line: 629, column: 5, scope: !653)
!653 = distinct !DILexicalBlock(scope: !635, file: !64, line: 629, column: 5)
!654 = !DILocation(line: 629, column: 17, scope: !653)
!655 = !DILocation(line: 629, column: 5, scope: !635)
!656 = !DILocation(line: 631, column: 6, scope: !657)
!657 = distinct !DILexicalBlock(scope: !658, file: !64, line: 631, column: 6)
!658 = distinct !DILexicalBlock(scope: !653, file: !64, line: 630, column: 2)
!659 = !DILocation(line: 631, column: 16, scope: !657)
!660 = !DILocation(line: 631, column: 6, scope: !658)
!661 = !DILocation(line: 633, column: 4, scope: !662)
!662 = distinct !DILexicalBlock(scope: !657, file: !64, line: 632, column: 3)
!663 = !DILocation(line: 637, column: 4, scope: !664)
!664 = distinct !DILexicalBlock(scope: !657, file: !64, line: 636, column: 3)
!665 = !DILocation(line: 642, column: 14, scope: !666)
!666 = distinct !DILexicalBlock(scope: !653, file: !64, line: 641, column: 2)
!667 = !DILocation(line: 642, column: 27, scope: !666)
!668 = !DILocation(line: 642, column: 37, scope: !666)
!669 = !DILocation(line: 642, column: 36, scope: !666)
!670 = !DILocation(line: 642, column: 50, scope: !666)
!671 = !DILocation(line: 642, column: 49, scope: !666)
!672 = !DILocation(line: 642, column: 24, scope: !666)
!673 = !DILocation(line: 642, column: 12, scope: !666)
!674 = !DILocation(line: 643, column: 14, scope: !666)
!675 = !DILocation(line: 643, column: 23, scope: !666)
!676 = !DILocation(line: 643, column: 12, scope: !666)
!677 = !DILocation(line: 644, column: 16, scope: !666)
!678 = !DILocation(line: 644, column: 25, scope: !666)
!679 = !DILocation(line: 644, column: 24, scope: !666)
!680 = !DILocation(line: 644, column: 41, scope: !666)
!681 = !DILocation(line: 644, column: 51, scope: !666)
!682 = !DILocation(line: 644, column: 50, scope: !666)
!683 = !DILocation(line: 644, column: 38, scope: !666)
!684 = !DILocation(line: 644, column: 13, scope: !666)
!685 = !DILocation(line: 645, column: 6, scope: !686)
!686 = distinct !DILexicalBlock(scope: !666, file: !64, line: 645, column: 6)
!687 = !DILocation(line: 645, column: 16, scope: !686)
!688 = !DILocation(line: 645, column: 6, scope: !666)
!689 = !DILocation(line: 647, column: 7, scope: !690)
!690 = distinct !DILexicalBlock(scope: !691, file: !64, line: 647, column: 7)
!691 = distinct !DILexicalBlock(scope: !686, file: !64, line: 646, column: 3)
!692 = !DILocation(line: 647, column: 17, scope: !690)
!693 = !DILocation(line: 647, column: 7, scope: !691)
!694 = !DILocation(line: 649, column: 17, scope: !695)
!695 = distinct !DILexicalBlock(scope: !690, file: !64, line: 648, column: 4)
!696 = !DILocation(line: 649, column: 12, scope: !695)
!697 = !DILocation(line: 649, column: 5, scope: !695)
!698 = !DILocation(line: 654, column: 5, scope: !699)
!699 = distinct !DILexicalBlock(scope: !690, file: !64, line: 653, column: 4)
!700 = !DILocation(line: 659, column: 4, scope: !701)
!701 = distinct !DILexicalBlock(scope: !686, file: !64, line: 658, column: 3)
!702 = !DILocation(line: 663, column: 1, scope: !635)
!703 = distinct !DISubprogram(name: "s16_mul_u16_s16_div_u16", scope: !64, file: !64, line: 681, type: !704, scopeLine: 682, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!704 = !DISubroutineType(types: !705)
!705 = !{!6, !25, !6, !25}
!706 = !DILocalVariable(name: "factor1", arg: 1, scope: !703, file: !64, line: 681, type: !25)
!707 = !DILocation(line: 681, column: 33, scope: !703)
!708 = !DILocalVariable(name: "factor2", arg: 2, scope: !703, file: !64, line: 681, type: !6)
!709 = !DILocation(line: 681, column: 46, scope: !703)
!710 = !DILocalVariable(name: "denominator", arg: 3, scope: !703, file: !64, line: 681, type: !25)
!711 = !DILocation(line: 681, column: 59, scope: !703)
!712 = !DILocalVariable(name: "s32Result", scope: !703, file: !64, line: 683, type: !21)
!713 = !DILocation(line: 683, column: 6, scope: !703)
!714 = !DILocalVariable(name: "s32Temp1", scope: !703, file: !64, line: 683, type: !21)
!715 = !DILocation(line: 683, column: 21, scope: !703)
!716 = !DILocation(line: 684, column: 14, scope: !703)
!717 = !DILocation(line: 684, column: 24, scope: !703)
!718 = !DILocation(line: 684, column: 22, scope: !703)
!719 = !DILocation(line: 684, column: 12, scope: !703)
!720 = !DILocation(line: 685, column: 5, scope: !721)
!721 = distinct !DILexicalBlock(scope: !703, file: !64, line: 685, column: 5)
!722 = !DILocation(line: 685, column: 16, scope: !721)
!723 = !DILocation(line: 685, column: 5, scope: !703)
!724 = !DILocation(line: 687, column: 6, scope: !725)
!725 = distinct !DILexicalBlock(scope: !726, file: !64, line: 687, column: 6)
!726 = distinct !DILexicalBlock(scope: !721, file: !64, line: 686, column: 2)
!727 = !DILocation(line: 687, column: 16, scope: !725)
!728 = !DILocation(line: 687, column: 6, scope: !726)
!729 = !DILocation(line: 689, column: 4, scope: !730)
!730 = distinct !DILexicalBlock(scope: !725, file: !64, line: 688, column: 3)
!731 = !DILocation(line: 693, column: 4, scope: !732)
!732 = distinct !DILexicalBlock(scope: !725, file: !64, line: 692, column: 3)
!733 = !DILocation(line: 698, column: 14, scope: !734)
!734 = distinct !DILexicalBlock(scope: !721, file: !64, line: 697, column: 2)
!735 = !DILocation(line: 698, column: 28, scope: !734)
!736 = !DILocation(line: 698, column: 38, scope: !734)
!737 = !DILocation(line: 698, column: 37, scope: !734)
!738 = !DILocation(line: 698, column: 53, scope: !734)
!739 = !DILocation(line: 698, column: 51, scope: !734)
!740 = !DILocation(line: 698, column: 24, scope: !734)
!741 = !DILocation(line: 698, column: 66, scope: !734)
!742 = !DILocation(line: 698, column: 12, scope: !734)
!743 = !DILocation(line: 699, column: 16, scope: !734)
!744 = !DILocation(line: 699, column: 25, scope: !734)
!745 = !DILocation(line: 699, column: 24, scope: !734)
!746 = !DILocation(line: 699, column: 41, scope: !734)
!747 = !DILocation(line: 699, column: 51, scope: !734)
!748 = !DILocation(line: 699, column: 50, scope: !734)
!749 = !DILocation(line: 699, column: 38, scope: !734)
!750 = !DILocation(line: 699, column: 13, scope: !734)
!751 = !DILocation(line: 700, column: 6, scope: !752)
!752 = distinct !DILexicalBlock(scope: !734, file: !64, line: 700, column: 6)
!753 = !DILocation(line: 700, column: 16, scope: !752)
!754 = !DILocation(line: 700, column: 6, scope: !734)
!755 = !DILocation(line: 702, column: 7, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !64, line: 702, column: 7)
!757 = distinct !DILexicalBlock(scope: !752, file: !64, line: 701, column: 3)
!758 = !DILocation(line: 702, column: 17, scope: !756)
!759 = !DILocation(line: 702, column: 7, scope: !757)
!760 = !DILocation(line: 704, column: 17, scope: !761)
!761 = distinct !DILexicalBlock(scope: !756, file: !64, line: 703, column: 4)
!762 = !DILocation(line: 704, column: 12, scope: !761)
!763 = !DILocation(line: 704, column: 5, scope: !761)
!764 = !DILocation(line: 708, column: 5, scope: !765)
!765 = distinct !DILexicalBlock(scope: !756, file: !64, line: 707, column: 4)
!766 = !DILocation(line: 713, column: 4, scope: !767)
!767 = distinct !DILexicalBlock(scope: !752, file: !64, line: 712, column: 3)
!768 = !DILocation(line: 716, column: 1, scope: !703)
!769 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_s16", scope: !64, file: !64, line: 735, type: !770, scopeLine: 736, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!770 = !DISubroutineType(types: !771)
!771 = !{!25, !6, !25, !6}
!772 = !DILocalVariable(name: "factor1", arg: 1, scope: !769, file: !64, line: 735, type: !6)
!773 = !DILocation(line: 735, column: 33, scope: !769)
!774 = !DILocalVariable(name: "factor2", arg: 2, scope: !769, file: !64, line: 735, type: !25)
!775 = !DILocation(line: 735, column: 46, scope: !769)
!776 = !DILocalVariable(name: "denominator", arg: 3, scope: !769, file: !64, line: 735, type: !6)
!777 = !DILocation(line: 735, column: 59, scope: !769)
!778 = !DILocalVariable(name: "u32Result", scope: !769, file: !64, line: 737, type: !423)
!779 = !DILocation(line: 737, column: 6, scope: !769)
!780 = !DILocalVariable(name: "u32Temp1", scope: !769, file: !64, line: 737, type: !423)
!781 = !DILocation(line: 737, column: 21, scope: !769)
!782 = !DILocalVariable(name: "s32Result", scope: !769, file: !64, line: 738, type: !21)
!783 = !DILocation(line: 738, column: 6, scope: !769)
!784 = !DILocalVariable(name: "s32Temp1", scope: !769, file: !64, line: 738, type: !21)
!785 = !DILocation(line: 738, column: 21, scope: !769)
!786 = !DILocation(line: 739, column: 14, scope: !769)
!787 = !DILocation(line: 739, column: 24, scope: !769)
!788 = !DILocation(line: 739, column: 22, scope: !769)
!789 = !DILocation(line: 739, column: 12, scope: !769)
!790 = !DILocation(line: 741, column: 5, scope: !791)
!791 = distinct !DILexicalBlock(scope: !769, file: !64, line: 741, column: 5)
!792 = !DILocation(line: 741, column: 17, scope: !791)
!793 = !DILocation(line: 741, column: 5, scope: !769)
!794 = !DILocation(line: 743, column: 6, scope: !795)
!795 = distinct !DILexicalBlock(scope: !796, file: !64, line: 743, column: 6)
!796 = distinct !DILexicalBlock(scope: !791, file: !64, line: 742, column: 2)
!797 = !DILocation(line: 743, column: 16, scope: !795)
!798 = !DILocation(line: 743, column: 6, scope: !796)
!799 = !DILocation(line: 745, column: 4, scope: !800)
!800 = distinct !DILexicalBlock(scope: !795, file: !64, line: 744, column: 3)
!801 = !DILocation(line: 749, column: 4, scope: !802)
!802 = distinct !DILexicalBlock(scope: !795, file: !64, line: 748, column: 3)
!803 = !DILocation(line: 754, column: 15, scope: !804)
!804 = distinct !DILexicalBlock(scope: !791, file: !64, line: 753, column: 2)
!805 = !DILocation(line: 754, column: 29, scope: !804)
!806 = !DILocation(line: 754, column: 39, scope: !804)
!807 = !DILocation(line: 754, column: 38, scope: !804)
!808 = !DILocation(line: 754, column: 54, scope: !804)
!809 = !DILocation(line: 754, column: 52, scope: !804)
!810 = !DILocation(line: 754, column: 25, scope: !804)
!811 = !DILocation(line: 754, column: 68, scope: !804)
!812 = !DILocation(line: 754, column: 12, scope: !804)
!813 = !DILocation(line: 755, column: 16, scope: !804)
!814 = !DILocation(line: 755, column: 25, scope: !804)
!815 = !DILocation(line: 755, column: 24, scope: !804)
!816 = !DILocation(line: 755, column: 41, scope: !804)
!817 = !DILocation(line: 755, column: 51, scope: !804)
!818 = !DILocation(line: 755, column: 50, scope: !804)
!819 = !DILocation(line: 755, column: 38, scope: !804)
!820 = !DILocation(line: 755, column: 13, scope: !804)
!821 = !DILocation(line: 756, column: 6, scope: !822)
!822 = distinct !DILexicalBlock(scope: !804, file: !64, line: 756, column: 6)
!823 = !DILocation(line: 756, column: 16, scope: !822)
!824 = !DILocation(line: 756, column: 6, scope: !804)
!825 = !DILocation(line: 758, column: 7, scope: !826)
!826 = distinct !DILexicalBlock(scope: !827, file: !64, line: 758, column: 7)
!827 = distinct !DILexicalBlock(scope: !822, file: !64, line: 757, column: 3)
!828 = !DILocation(line: 758, column: 17, scope: !826)
!829 = !DILocation(line: 758, column: 7, scope: !827)
!830 = !DILocation(line: 760, column: 17, scope: !831)
!831 = distinct !DILexicalBlock(scope: !826, file: !64, line: 759, column: 4)
!832 = !DILocation(line: 760, column: 12, scope: !831)
!833 = !DILocation(line: 760, column: 5, scope: !831)
!834 = !DILocation(line: 764, column: 5, scope: !835)
!835 = distinct !DILexicalBlock(scope: !826, file: !64, line: 763, column: 4)
!836 = !DILocation(line: 769, column: 4, scope: !837)
!837 = distinct !DILexicalBlock(scope: !822, file: !64, line: 768, column: 3)
!838 = !DILocation(line: 772, column: 1, scope: !769)
!839 = distinct !DISubprogram(name: "u16_mul_s16_u16_div_u16", scope: !64, file: !64, line: 791, type: !840, scopeLine: 792, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!840 = !DISubroutineType(types: !841)
!841 = !{!25, !6, !25, !25}
!842 = !DILocalVariable(name: "factor1", arg: 1, scope: !839, file: !64, line: 791, type: !6)
!843 = !DILocation(line: 791, column: 33, scope: !839)
!844 = !DILocalVariable(name: "factor2", arg: 2, scope: !839, file: !64, line: 791, type: !25)
!845 = !DILocation(line: 791, column: 46, scope: !839)
!846 = !DILocalVariable(name: "denominator", arg: 3, scope: !839, file: !64, line: 791, type: !25)
!847 = !DILocation(line: 791, column: 59, scope: !839)
!848 = !DILocalVariable(name: "s32Result", scope: !839, file: !64, line: 793, type: !21)
!849 = !DILocation(line: 793, column: 6, scope: !839)
!850 = !DILocalVariable(name: "s32Temp1", scope: !839, file: !64, line: 793, type: !21)
!851 = !DILocation(line: 793, column: 21, scope: !839)
!852 = !DILocation(line: 794, column: 14, scope: !839)
!853 = !DILocation(line: 794, column: 24, scope: !839)
!854 = !DILocation(line: 794, column: 22, scope: !839)
!855 = !DILocation(line: 794, column: 12, scope: !839)
!856 = !DILocation(line: 796, column: 5, scope: !857)
!857 = distinct !DILexicalBlock(scope: !839, file: !64, line: 796, column: 5)
!858 = !DILocation(line: 796, column: 17, scope: !857)
!859 = !DILocation(line: 796, column: 5, scope: !839)
!860 = !DILocation(line: 798, column: 6, scope: !861)
!861 = distinct !DILexicalBlock(scope: !862, file: !64, line: 798, column: 6)
!862 = distinct !DILexicalBlock(scope: !857, file: !64, line: 797, column: 2)
!863 = !DILocation(line: 798, column: 16, scope: !861)
!864 = !DILocation(line: 798, column: 6, scope: !862)
!865 = !DILocation(line: 800, column: 4, scope: !866)
!866 = distinct !DILexicalBlock(scope: !861, file: !64, line: 799, column: 3)
!867 = !DILocation(line: 804, column: 4, scope: !868)
!868 = distinct !DILexicalBlock(scope: !861, file: !64, line: 803, column: 3)
!869 = !DILocation(line: 809, column: 15, scope: !870)
!870 = distinct !DILexicalBlock(scope: !857, file: !64, line: 808, column: 2)
!871 = !DILocation(line: 809, column: 29, scope: !870)
!872 = !DILocation(line: 809, column: 39, scope: !870)
!873 = !DILocation(line: 809, column: 38, scope: !870)
!874 = !DILocation(line: 809, column: 54, scope: !870)
!875 = !DILocation(line: 809, column: 52, scope: !870)
!876 = !DILocation(line: 809, column: 25, scope: !870)
!877 = !DILocation(line: 809, column: 68, scope: !870)
!878 = !DILocation(line: 809, column: 12, scope: !870)
!879 = !DILocation(line: 810, column: 16, scope: !870)
!880 = !DILocation(line: 810, column: 25, scope: !870)
!881 = !DILocation(line: 810, column: 24, scope: !870)
!882 = !DILocation(line: 810, column: 41, scope: !870)
!883 = !DILocation(line: 810, column: 51, scope: !870)
!884 = !DILocation(line: 810, column: 50, scope: !870)
!885 = !DILocation(line: 810, column: 38, scope: !870)
!886 = !DILocation(line: 810, column: 13, scope: !870)
!887 = !DILocation(line: 811, column: 6, scope: !888)
!888 = distinct !DILexicalBlock(scope: !870, file: !64, line: 811, column: 6)
!889 = !DILocation(line: 811, column: 16, scope: !888)
!890 = !DILocation(line: 811, column: 6, scope: !870)
!891 = !DILocation(line: 813, column: 7, scope: !892)
!892 = distinct !DILexicalBlock(scope: !893, file: !64, line: 813, column: 7)
!893 = distinct !DILexicalBlock(scope: !888, file: !64, line: 812, column: 3)
!894 = !DILocation(line: 813, column: 17, scope: !892)
!895 = !DILocation(line: 813, column: 7, scope: !893)
!896 = !DILocation(line: 815, column: 17, scope: !897)
!897 = distinct !DILexicalBlock(scope: !892, file: !64, line: 814, column: 4)
!898 = !DILocation(line: 815, column: 12, scope: !897)
!899 = !DILocation(line: 815, column: 5, scope: !897)
!900 = !DILocation(line: 819, column: 5, scope: !901)
!901 = distinct !DILexicalBlock(scope: !892, file: !64, line: 818, column: 4)
!902 = !DILocation(line: 824, column: 4, scope: !903)
!903 = distinct !DILexicalBlock(scope: !888, file: !64, line: 823, column: 3)
!904 = !DILocation(line: 828, column: 1, scope: !839)
!905 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u16", scope: !64, file: !64, line: 846, type: !906, scopeLine: 847, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!906 = !DISubroutineType(types: !907)
!907 = !{!25, !25, !25, !25}
!908 = !DILocalVariable(name: "factor1", arg: 1, scope: !905, file: !64, line: 846, type: !25)
!909 = !DILocation(line: 846, column: 33, scope: !905)
!910 = !DILocalVariable(name: "factor2", arg: 2, scope: !905, file: !64, line: 846, type: !25)
!911 = !DILocation(line: 846, column: 46, scope: !905)
!912 = !DILocalVariable(name: "denominator", arg: 3, scope: !905, file: !64, line: 846, type: !25)
!913 = !DILocation(line: 846, column: 59, scope: !905)
!914 = !DILocalVariable(name: "u32Temp1", scope: !905, file: !64, line: 848, type: !423)
!915 = !DILocation(line: 848, column: 6, scope: !905)
!916 = !DILocalVariable(name: "u16TempDenom", scope: !905, file: !64, line: 849, type: !25)
!917 = !DILocation(line: 849, column: 6, scope: !905)
!918 = !DILocation(line: 851, column: 5, scope: !919)
!919 = distinct !DILexicalBlock(scope: !905, file: !64, line: 851, column: 5)
!920 = !DILocation(line: 851, column: 17, scope: !919)
!921 = !DILocation(line: 851, column: 5, scope: !905)
!922 = !DILocation(line: 853, column: 3, scope: !923)
!923 = distinct !DILexicalBlock(scope: !919, file: !64, line: 852, column: 2)
!924 = !DILocation(line: 857, column: 14, scope: !925)
!925 = distinct !DILexicalBlock(scope: !919, file: !64, line: 856, column: 2)
!926 = !DILocation(line: 857, column: 24, scope: !925)
!927 = !DILocation(line: 857, column: 22, scope: !925)
!928 = !DILocation(line: 857, column: 12, scope: !925)
!929 = !DILocation(line: 858, column: 18, scope: !925)
!930 = !DILocation(line: 858, column: 30, scope: !925)
!931 = !DILocation(line: 858, column: 16, scope: !925)
!932 = !DILocation(line: 859, column: 14, scope: !925)
!933 = !DILocation(line: 859, column: 25, scope: !925)
!934 = !DILocation(line: 859, column: 23, scope: !925)
!935 = !DILocation(line: 859, column: 12, scope: !925)
!936 = !DILocation(line: 860, column: 14, scope: !925)
!937 = !DILocation(line: 860, column: 25, scope: !925)
!938 = !DILocation(line: 860, column: 23, scope: !925)
!939 = !DILocation(line: 860, column: 12, scope: !925)
!940 = !DILocation(line: 861, column: 6, scope: !941)
!941 = distinct !DILexicalBlock(scope: !925, file: !64, line: 861, column: 6)
!942 = !DILocation(line: 861, column: 15, scope: !941)
!943 = !DILocation(line: 861, column: 6, scope: !925)
!944 = !DILocation(line: 863, column: 12, scope: !945)
!945 = distinct !DILexicalBlock(scope: !941, file: !64, line: 862, column: 3)
!946 = !DILocation(line: 863, column: 21, scope: !945)
!947 = !DILocation(line: 863, column: 11, scope: !945)
!948 = !DILocation(line: 863, column: 4, scope: !945)
!949 = !DILocation(line: 868, column: 4, scope: !950)
!950 = distinct !DILexicalBlock(scope: !941, file: !64, line: 867, column: 3)
!951 = !DILocation(line: 873, column: 1, scope: !905)
!952 = distinct !DISubprogram(name: "u16_mul_u16_u16_div_u32", scope: !64, file: !64, line: 890, type: !953, scopeLine: 891, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!953 = !DISubroutineType(types: !954)
!954 = !{!25, !25, !25, !423}
!955 = !DILocalVariable(name: "factor1", arg: 1, scope: !952, file: !64, line: 890, type: !25)
!956 = !DILocation(line: 890, column: 33, scope: !952)
!957 = !DILocalVariable(name: "factor2", arg: 2, scope: !952, file: !64, line: 890, type: !25)
!958 = !DILocation(line: 890, column: 46, scope: !952)
!959 = !DILocalVariable(name: "denominator", arg: 3, scope: !952, file: !64, line: 890, type: !423)
!960 = !DILocation(line: 890, column: 59, scope: !952)
!961 = !DILocalVariable(name: "u32Temp1", scope: !952, file: !64, line: 892, type: !423)
!962 = !DILocation(line: 892, column: 6, scope: !952)
!963 = !DILocation(line: 893, column: 5, scope: !964)
!964 = distinct !DILexicalBlock(scope: !952, file: !64, line: 893, column: 5)
!965 = !DILocation(line: 893, column: 17, scope: !964)
!966 = !DILocation(line: 893, column: 5, scope: !952)
!967 = !DILocation(line: 895, column: 3, scope: !968)
!968 = distinct !DILexicalBlock(scope: !964, file: !64, line: 894, column: 2)
!969 = !DILocation(line: 899, column: 15, scope: !970)
!970 = distinct !DILexicalBlock(scope: !964, file: !64, line: 898, column: 2)
!971 = !DILocation(line: 899, column: 25, scope: !970)
!972 = !DILocation(line: 899, column: 23, scope: !970)
!973 = !DILocation(line: 899, column: 36, scope: !970)
!974 = !DILocation(line: 899, column: 34, scope: !970)
!975 = !DILocation(line: 899, column: 12, scope: !970)
!976 = !DILocation(line: 900, column: 8, scope: !977)
!977 = distinct !DILexicalBlock(scope: !970, file: !64, line: 900, column: 6)
!978 = !DILocation(line: 900, column: 18, scope: !977)
!979 = !DILocation(line: 900, column: 16, scope: !977)
!980 = !DILocation(line: 900, column: 28, scope: !977)
!981 = !DILocation(line: 900, column: 40, scope: !977)
!982 = !DILocation(line: 900, column: 39, scope: !977)
!983 = !DILocation(line: 900, column: 26, scope: !977)
!984 = !DILocation(line: 900, column: 53, scope: !977)
!985 = !DILocation(line: 900, column: 64, scope: !977)
!986 = !DILocation(line: 900, column: 50, scope: !977)
!987 = !DILocation(line: 900, column: 6, scope: !970)
!988 = !DILocation(line: 902, column: 12, scope: !989)
!989 = distinct !DILexicalBlock(scope: !977, file: !64, line: 901, column: 3)
!990 = !DILocation(line: 903, column: 3, scope: !989)
!991 = !DILocation(line: 904, column: 6, scope: !992)
!992 = distinct !DILexicalBlock(scope: !970, file: !64, line: 904, column: 6)
!993 = !DILocation(line: 904, column: 15, scope: !992)
!994 = !DILocation(line: 904, column: 6, scope: !970)
!995 = !DILocation(line: 906, column: 12, scope: !996)
!996 = distinct !DILexicalBlock(scope: !992, file: !64, line: 905, column: 3)
!997 = !DILocation(line: 906, column: 21, scope: !996)
!998 = !DILocation(line: 906, column: 11, scope: !996)
!999 = !DILocation(line: 906, column: 4, scope: !996)
!1000 = !DILocation(line: 910, column: 4, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !992, file: !64, line: 909, column: 3)
!1002 = !DILocation(line: 913, column: 1, scope: !952)
!1003 = distinct !DISubprogram(name: "u32_div_u32_u16", scope: !64, file: !64, line: 930, type: !1004, scopeLine: 931, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1004 = !DISubroutineType(types: !1005)
!1005 = !{!423, !423, !25}
!1006 = !DILocalVariable(name: "x_value", arg: 1, scope: !1003, file: !64, line: 930, type: !423)
!1007 = !DILocation(line: 930, column: 25, scope: !1003)
!1008 = !DILocalVariable(name: "y_value", arg: 2, scope: !1003, file: !64, line: 930, type: !25)
!1009 = !DILocation(line: 930, column: 38, scope: !1003)
!1010 = !DILocalVariable(name: "u32Temp1", scope: !1003, file: !64, line: 932, type: !423)
!1011 = !DILocation(line: 932, column: 6, scope: !1003)
!1012 = !DILocation(line: 933, column: 5, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1003, file: !64, line: 933, column: 5)
!1014 = !DILocation(line: 933, column: 13, scope: !1013)
!1015 = !DILocation(line: 933, column: 5, scope: !1003)
!1016 = !DILocation(line: 935, column: 3, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1013, file: !64, line: 934, column: 2)
!1018 = !DILocation(line: 939, column: 15, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1013, file: !64, line: 938, column: 2)
!1020 = !DILocation(line: 939, column: 26, scope: !1019)
!1021 = !DILocation(line: 939, column: 34, scope: !1019)
!1022 = !DILocation(line: 939, column: 33, scope: !1019)
!1023 = !DILocation(line: 939, column: 45, scope: !1019)
!1024 = !DILocation(line: 939, column: 43, scope: !1019)
!1025 = !DILocation(line: 939, column: 23, scope: !1019)
!1026 = !DILocation(line: 939, column: 54, scope: !1019)
!1027 = !DILocation(line: 939, column: 12, scope: !1019)
!1028 = !DILocation(line: 940, column: 15, scope: !1019)
!1029 = !DILocation(line: 940, column: 23, scope: !1019)
!1030 = !DILocation(line: 940, column: 22, scope: !1019)
!1031 = !DILocation(line: 940, column: 35, scope: !1019)
!1032 = !DILocation(line: 940, column: 44, scope: !1019)
!1033 = !DILocation(line: 940, column: 43, scope: !1019)
!1034 = !DILocation(line: 940, column: 32, scope: !1019)
!1035 = !DILocation(line: 940, column: 12, scope: !1019)
!1036 = !DILocation(line: 941, column: 10, scope: !1019)
!1037 = !DILocation(line: 941, column: 3, scope: !1019)
!1038 = !DILocation(line: 943, column: 1, scope: !1003)
!1039 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_s16", scope: !64, file: !64, line: 961, type: !1040, scopeLine: 962, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1040 = !DISubroutineType(types: !1041)
!1041 = !{!6, !6, !6, !6}
!1042 = !DILocalVariable(name: "fak1", arg: 1, scope: !1039, file: !64, line: 961, type: !6)
!1043 = !DILocation(line: 961, column: 33, scope: !1039)
!1044 = !DILocalVariable(name: "fak2", arg: 2, scope: !1039, file: !64, line: 961, type: !6)
!1045 = !DILocation(line: 961, column: 43, scope: !1039)
!1046 = !DILocalVariable(name: "div", arg: 3, scope: !1039, file: !64, line: 961, type: !6)
!1047 = !DILocation(line: 961, column: 53, scope: !1039)
!1048 = !DILocalVariable(name: "s32Temp1", scope: !1039, file: !64, line: 963, type: !21)
!1049 = !DILocation(line: 963, column: 6, scope: !1039)
!1050 = !DILocalVariable(name: "s32Temp2", scope: !1039, file: !64, line: 963, type: !21)
!1051 = !DILocation(line: 963, column: 20, scope: !1039)
!1052 = !DILocalVariable(name: "s32Temp3", scope: !1039, file: !64, line: 963, type: !21)
!1053 = !DILocation(line: 963, column: 34, scope: !1039)
!1054 = !DILocation(line: 964, column: 13, scope: !1039)
!1055 = !DILocation(line: 964, column: 20, scope: !1039)
!1056 = !DILocation(line: 964, column: 18, scope: !1039)
!1057 = !DILocation(line: 964, column: 11, scope: !1039)
!1058 = !DILocation(line: 965, column: 5, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1039, file: !64, line: 965, column: 5)
!1060 = !DILocation(line: 965, column: 9, scope: !1059)
!1061 = !DILocation(line: 965, column: 5, scope: !1039)
!1062 = !DILocation(line: 967, column: 6, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1064, file: !64, line: 967, column: 6)
!1064 = distinct !DILexicalBlock(scope: !1059, file: !64, line: 966, column: 2)
!1065 = !DILocation(line: 967, column: 15, scope: !1063)
!1066 = !DILocation(line: 967, column: 6, scope: !1064)
!1067 = !DILocation(line: 969, column: 4, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1063, file: !64, line: 968, column: 3)
!1069 = !DILocation(line: 973, column: 4, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1063, file: !64, line: 972, column: 3)
!1071 = !DILocation(line: 978, column: 15, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1059, file: !64, line: 977, column: 2)
!1073 = !DILocation(line: 978, column: 28, scope: !1072)
!1074 = !DILocation(line: 978, column: 39, scope: !1072)
!1075 = !DILocation(line: 978, column: 37, scope: !1072)
!1076 = !DILocation(line: 978, column: 46, scope: !1072)
!1077 = !DILocation(line: 978, column: 44, scope: !1072)
!1078 = !DILocation(line: 978, column: 24, scope: !1072)
!1079 = !DILocation(line: 978, column: 52, scope: !1072)
!1080 = !DILocation(line: 978, column: 12, scope: !1072)
!1081 = !DILocation(line: 979, column: 15, scope: !1072)
!1082 = !DILocation(line: 979, column: 24, scope: !1072)
!1083 = !DILocation(line: 979, column: 23, scope: !1072)
!1084 = !DILocation(line: 979, column: 32, scope: !1072)
!1085 = !DILocation(line: 979, column: 41, scope: !1072)
!1086 = !DILocation(line: 979, column: 40, scope: !1072)
!1087 = !DILocation(line: 979, column: 29, scope: !1072)
!1088 = !DILocation(line: 979, column: 12, scope: !1072)
!1089 = !DILocation(line: 980, column: 6, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1072, file: !64, line: 980, column: 6)
!1091 = !DILocation(line: 980, column: 15, scope: !1090)
!1092 = !DILocation(line: 980, column: 6, scope: !1072)
!1093 = !DILocation(line: 982, column: 7, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1095, file: !64, line: 982, column: 7)
!1095 = distinct !DILexicalBlock(scope: !1090, file: !64, line: 981, column: 3)
!1096 = !DILocation(line: 982, column: 16, scope: !1094)
!1097 = !DILocation(line: 982, column: 7, scope: !1095)
!1098 = !DILocation(line: 984, column: 17, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1094, file: !64, line: 983, column: 4)
!1100 = !DILocation(line: 984, column: 12, scope: !1099)
!1101 = !DILocation(line: 984, column: 5, scope: !1099)
!1102 = !DILocation(line: 988, column: 5, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1094, file: !64, line: 987, column: 4)
!1104 = !DILocation(line: 993, column: 4, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1090, file: !64, line: 992, column: 3)
!1106 = !DILocation(line: 996, column: 1, scope: !1039)
!1107 = distinct !DISubprogram(name: "s16_mul_s16_s16_div_u16", scope: !64, file: !64, line: 1014, type: !1108, scopeLine: 1015, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1108 = !DISubroutineType(types: !1109)
!1109 = !{!6, !6, !6, !25}
!1110 = !DILocalVariable(name: "data1", arg: 1, scope: !1107, file: !64, line: 1014, type: !6)
!1111 = !DILocation(line: 1014, column: 33, scope: !1107)
!1112 = !DILocalVariable(name: "data2", arg: 2, scope: !1107, file: !64, line: 1014, type: !6)
!1113 = !DILocation(line: 1014, column: 43, scope: !1107)
!1114 = !DILocalVariable(name: "denominator", arg: 3, scope: !1107, file: !64, line: 1014, type: !25)
!1115 = !DILocation(line: 1014, column: 53, scope: !1107)
!1116 = !DILocalVariable(name: "s32Result", scope: !1107, file: !64, line: 1016, type: !21)
!1117 = !DILocation(line: 1016, column: 6, scope: !1107)
!1118 = !DILocalVariable(name: "s32Temp1", scope: !1107, file: !64, line: 1016, type: !21)
!1119 = !DILocation(line: 1016, column: 21, scope: !1107)
!1120 = !DILocation(line: 1017, column: 14, scope: !1107)
!1121 = !DILocation(line: 1017, column: 22, scope: !1107)
!1122 = !DILocation(line: 1017, column: 20, scope: !1107)
!1123 = !DILocation(line: 1017, column: 12, scope: !1107)
!1124 = !DILocation(line: 1019, column: 5, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1107, file: !64, line: 1019, column: 5)
!1126 = !DILocation(line: 1019, column: 17, scope: !1125)
!1127 = !DILocation(line: 1019, column: 5, scope: !1107)
!1128 = !DILocation(line: 1021, column: 6, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !64, line: 1021, column: 6)
!1130 = distinct !DILexicalBlock(scope: !1125, file: !64, line: 1020, column: 2)
!1131 = !DILocation(line: 1021, column: 16, scope: !1129)
!1132 = !DILocation(line: 1021, column: 6, scope: !1130)
!1133 = !DILocation(line: 1023, column: 4, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1129, file: !64, line: 1022, column: 3)
!1135 = !DILocation(line: 1025, column: 11, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1129, file: !64, line: 1025, column: 11)
!1137 = !DILocation(line: 1025, column: 21, scope: !1136)
!1138 = !DILocation(line: 1025, column: 11, scope: !1129)
!1139 = !DILocation(line: 1027, column: 4, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1136, file: !64, line: 1026, column: 3)
!1141 = !DILocation(line: 1031, column: 4, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1136, file: !64, line: 1030, column: 3)
!1143 = !DILocation(line: 1036, column: 15, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1125, file: !64, line: 1035, column: 2)
!1145 = !DILocation(line: 1036, column: 28, scope: !1144)
!1146 = !DILocation(line: 1036, column: 38, scope: !1144)
!1147 = !DILocation(line: 1036, column: 37, scope: !1144)
!1148 = !DILocation(line: 1036, column: 51, scope: !1144)
!1149 = !DILocation(line: 1036, column: 50, scope: !1144)
!1150 = !DILocation(line: 1036, column: 25, scope: !1144)
!1151 = !DILocation(line: 1036, column: 64, scope: !1144)
!1152 = !DILocation(line: 1036, column: 12, scope: !1144)
!1153 = !DILocation(line: 1037, column: 16, scope: !1144)
!1154 = !DILocation(line: 1037, column: 25, scope: !1144)
!1155 = !DILocation(line: 1037, column: 24, scope: !1144)
!1156 = !DILocation(line: 1037, column: 41, scope: !1144)
!1157 = !DILocation(line: 1037, column: 51, scope: !1144)
!1158 = !DILocation(line: 1037, column: 50, scope: !1144)
!1159 = !DILocation(line: 1037, column: 38, scope: !1144)
!1160 = !DILocation(line: 1037, column: 13, scope: !1144)
!1161 = !DILocation(line: 1038, column: 6, scope: !1162)
!1162 = distinct !DILexicalBlock(scope: !1144, file: !64, line: 1038, column: 6)
!1163 = !DILocation(line: 1038, column: 16, scope: !1162)
!1164 = !DILocation(line: 1038, column: 6, scope: !1144)
!1165 = !DILocation(line: 1040, column: 7, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1167, file: !64, line: 1040, column: 7)
!1167 = distinct !DILexicalBlock(scope: !1162, file: !64, line: 1039, column: 3)
!1168 = !DILocation(line: 1040, column: 17, scope: !1166)
!1169 = !DILocation(line: 1040, column: 7, scope: !1167)
!1170 = !DILocation(line: 1042, column: 17, scope: !1171)
!1171 = distinct !DILexicalBlock(scope: !1166, file: !64, line: 1041, column: 4)
!1172 = !DILocation(line: 1042, column: 12, scope: !1171)
!1173 = !DILocation(line: 1042, column: 5, scope: !1171)
!1174 = !DILocation(line: 1046, column: 5, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1166, file: !64, line: 1045, column: 4)
!1176 = !DILocation(line: 1051, column: 4, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1162, file: !64, line: 1050, column: 3)
!1178 = !DILocation(line: 1055, column: 1, scope: !1107)
!1179 = distinct !DISubprogram(name: "u32_div_u32_s32", scope: !64, file: !64, line: 1072, type: !1180, scopeLine: 1073, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1180 = !DISubroutineType(types: !1181)
!1181 = !{!423, !423, !21}
!1182 = !DILocalVariable(name: "numerator", arg: 1, scope: !1179, file: !64, line: 1072, type: !423)
!1183 = !DILocation(line: 1072, column: 25, scope: !1179)
!1184 = !DILocalVariable(name: "denominator", arg: 2, scope: !1179, file: !64, line: 1072, type: !21)
!1185 = !DILocation(line: 1072, column: 40, scope: !1179)
!1186 = !DILocalVariable(name: "u32Temp1", scope: !1179, file: !64, line: 1074, type: !423)
!1187 = !DILocation(line: 1074, column: 6, scope: !1179)
!1188 = !DILocation(line: 1075, column: 5, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1179, file: !64, line: 1075, column: 5)
!1190 = !DILocation(line: 1075, column: 17, scope: !1189)
!1191 = !DILocation(line: 1075, column: 5, scope: !1179)
!1192 = !DILocation(line: 1077, column: 3, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1189, file: !64, line: 1076, column: 2)
!1194 = !DILocation(line: 1081, column: 6, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1196, file: !64, line: 1081, column: 6)
!1196 = distinct !DILexicalBlock(scope: !1189, file: !64, line: 1080, column: 2)
!1197 = !DILocation(line: 1081, column: 18, scope: !1195)
!1198 = !DILocation(line: 1081, column: 6, scope: !1196)
!1199 = !DILocation(line: 1083, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1195, file: !64, line: 1082, column: 3)
!1201 = !DILocation(line: 1087, column: 16, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1195, file: !64, line: 1086, column: 3)
!1203 = !DILocation(line: 1087, column: 30, scope: !1202)
!1204 = !DILocation(line: 1087, column: 40, scope: !1202)
!1205 = !DILocation(line: 1087, column: 39, scope: !1202)
!1206 = !DILocation(line: 1087, column: 55, scope: !1202)
!1207 = !DILocation(line: 1087, column: 53, scope: !1202)
!1208 = !DILocation(line: 1087, column: 26, scope: !1202)
!1209 = !DILocation(line: 1087, column: 68, scope: !1202)
!1210 = !DILocation(line: 1087, column: 13, scope: !1202)
!1211 = !DILocation(line: 1088, column: 16, scope: !1202)
!1212 = !DILocation(line: 1088, column: 25, scope: !1202)
!1213 = !DILocation(line: 1088, column: 24, scope: !1202)
!1214 = !DILocation(line: 1088, column: 41, scope: !1202)
!1215 = !DILocation(line: 1088, column: 51, scope: !1202)
!1216 = !DILocation(line: 1088, column: 50, scope: !1202)
!1217 = !DILocation(line: 1088, column: 38, scope: !1202)
!1218 = !DILocation(line: 1088, column: 13, scope: !1202)
!1219 = !DILocation(line: 1089, column: 11, scope: !1202)
!1220 = !DILocation(line: 1089, column: 4, scope: !1202)
!1221 = !DILocation(line: 1092, column: 1, scope: !1179)
!1222 = distinct !DISubprogram(name: "u32_div_s32_u32", scope: !64, file: !64, line: 1109, type: !1223, scopeLine: 1110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!423, !21, !423}
!1225 = !DILocalVariable(name: "numerator", arg: 1, scope: !1222, file: !64, line: 1109, type: !21)
!1226 = !DILocation(line: 1109, column: 25, scope: !1222)
!1227 = !DILocalVariable(name: "denominator", arg: 2, scope: !1222, file: !64, line: 1109, type: !423)
!1228 = !DILocation(line: 1109, column: 40, scope: !1222)
!1229 = !DILocalVariable(name: "s32Temp1", scope: !1222, file: !64, line: 1111, type: !21)
!1230 = !DILocation(line: 1111, column: 6, scope: !1222)
!1231 = !DILocation(line: 1112, column: 5, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1222, file: !64, line: 1112, column: 5)
!1233 = !DILocation(line: 1112, column: 17, scope: !1232)
!1234 = !DILocation(line: 1112, column: 5, scope: !1222)
!1235 = !DILocation(line: 1114, column: 6, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1237, file: !64, line: 1114, column: 6)
!1237 = distinct !DILexicalBlock(scope: !1232, file: !64, line: 1113, column: 2)
!1238 = !DILocation(line: 1114, column: 16, scope: !1236)
!1239 = !DILocation(line: 1114, column: 6, scope: !1237)
!1240 = !DILocation(line: 1116, column: 4, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1236, file: !64, line: 1115, column: 3)
!1242 = !DILocation(line: 1120, column: 4, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1236, file: !64, line: 1119, column: 3)
!1244 = !DILocation(line: 1125, column: 6, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1246, file: !64, line: 1125, column: 6)
!1246 = distinct !DILexicalBlock(scope: !1232, file: !64, line: 1124, column: 2)
!1247 = !DILocation(line: 1125, column: 16, scope: !1245)
!1248 = !DILocation(line: 1125, column: 6, scope: !1246)
!1249 = !DILocation(line: 1127, column: 17, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1245, file: !64, line: 1126, column: 3)
!1251 = !DILocation(line: 1127, column: 31, scope: !1250)
!1252 = !DILocation(line: 1127, column: 41, scope: !1250)
!1253 = !DILocation(line: 1127, column: 40, scope: !1250)
!1254 = !DILocation(line: 1127, column: 56, scope: !1250)
!1255 = !DILocation(line: 1127, column: 54, scope: !1250)
!1256 = !DILocation(line: 1127, column: 27, scope: !1250)
!1257 = !DILocation(line: 1127, column: 69, scope: !1250)
!1258 = !DILocation(line: 1127, column: 13, scope: !1250)
!1259 = !DILocation(line: 1128, column: 13, scope: !1250)
!1260 = !DILocation(line: 1128, column: 23, scope: !1250)
!1261 = !DILocation(line: 1128, column: 22, scope: !1250)
!1262 = !DILocation(line: 1128, column: 39, scope: !1250)
!1263 = !DILocation(line: 1128, column: 48, scope: !1250)
!1264 = !DILocation(line: 1128, column: 47, scope: !1250)
!1265 = !DILocation(line: 1128, column: 36, scope: !1250)
!1266 = !DILocation(line: 1128, column: 4, scope: !1250)
!1267 = !DILocation(line: 1132, column: 4, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1245, file: !64, line: 1131, column: 3)
!1269 = !DILocation(line: 1135, column: 1, scope: !1222)
!1270 = distinct !DISubprogram(name: "u32_div_s32_s32", scope: !64, file: !64, line: 1152, type: !1271, scopeLine: 1153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1271 = !DISubroutineType(types: !1272)
!1272 = !{!423, !21, !21}
!1273 = !DILocalVariable(name: "numerator", arg: 1, scope: !1270, file: !64, line: 1152, type: !21)
!1274 = !DILocation(line: 1152, column: 25, scope: !1270)
!1275 = !DILocalVariable(name: "denominator", arg: 2, scope: !1270, file: !64, line: 1152, type: !21)
!1276 = !DILocation(line: 1152, column: 40, scope: !1270)
!1277 = !DILocalVariable(name: "u32Temp1", scope: !1270, file: !64, line: 1154, type: !423)
!1278 = !DILocation(line: 1154, column: 6, scope: !1270)
!1279 = !DILocalVariable(name: "u32Temp2", scope: !1270, file: !64, line: 1154, type: !423)
!1280 = !DILocation(line: 1154, column: 20, scope: !1270)
!1281 = !DILocation(line: 1155, column: 5, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1270, file: !64, line: 1155, column: 5)
!1283 = !DILocation(line: 1155, column: 17, scope: !1282)
!1284 = !DILocation(line: 1155, column: 5, scope: !1270)
!1285 = !DILocation(line: 1157, column: 6, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1287, file: !64, line: 1157, column: 6)
!1287 = distinct !DILexicalBlock(scope: !1282, file: !64, line: 1156, column: 2)
!1288 = !DILocation(line: 1157, column: 16, scope: !1286)
!1289 = !DILocation(line: 1157, column: 6, scope: !1287)
!1290 = !DILocation(line: 1159, column: 4, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1286, file: !64, line: 1158, column: 3)
!1292 = !DILocation(line: 1163, column: 4, scope: !1293)
!1293 = distinct !DILexicalBlock(scope: !1286, file: !64, line: 1162, column: 3)
!1294 = !DILocation(line: 1168, column: 6, scope: !1295)
!1295 = distinct !DILexicalBlock(scope: !1296, file: !64, line: 1168, column: 6)
!1296 = distinct !DILexicalBlock(scope: !1282, file: !64, line: 1167, column: 2)
!1297 = !DILocation(line: 1168, column: 16, scope: !1295)
!1298 = !DILocation(line: 1168, column: 6, scope: !1296)
!1299 = !DILocation(line: 1170, column: 7, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1301, file: !64, line: 1170, column: 7)
!1301 = distinct !DILexicalBlock(scope: !1295, file: !64, line: 1169, column: 3)
!1302 = !DILocation(line: 1170, column: 17, scope: !1300)
!1303 = !DILocation(line: 1170, column: 7, scope: !1301)
!1304 = !DILocation(line: 1172, column: 5, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1300, file: !64, line: 1171, column: 4)
!1306 = !DILocation(line: 1176, column: 8, scope: !1307)
!1307 = distinct !DILexicalBlock(scope: !1308, file: !64, line: 1176, column: 8)
!1308 = distinct !DILexicalBlock(scope: !1300, file: !64, line: 1175, column: 4)
!1309 = !DILocation(line: 1176, column: 20, scope: !1307)
!1310 = !DILocation(line: 1176, column: 8, scope: !1308)
!1311 = !DILocation(line: 1178, column: 6, scope: !1312)
!1312 = distinct !DILexicalBlock(scope: !1307, file: !64, line: 1177, column: 5)
!1313 = !DILocation(line: 1182, column: 18, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1307, file: !64, line: 1181, column: 5)
!1315 = !DILocation(line: 1182, column: 32, scope: !1314)
!1316 = !DILocation(line: 1182, column: 42, scope: !1314)
!1317 = !DILocation(line: 1182, column: 41, scope: !1314)
!1318 = !DILocation(line: 1182, column: 57, scope: !1314)
!1319 = !DILocation(line: 1182, column: 55, scope: !1314)
!1320 = !DILocation(line: 1182, column: 28, scope: !1314)
!1321 = !DILocation(line: 1182, column: 71, scope: !1314)
!1322 = !DILocation(line: 1182, column: 15, scope: !1314)
!1323 = !DILocation(line: 1183, column: 18, scope: !1314)
!1324 = !DILocation(line: 1183, column: 29, scope: !1314)
!1325 = !DILocation(line: 1183, column: 27, scope: !1314)
!1326 = !DILocation(line: 1183, column: 45, scope: !1314)
!1327 = !DILocation(line: 1183, column: 57, scope: !1314)
!1328 = !DILocation(line: 1183, column: 55, scope: !1314)
!1329 = !DILocation(line: 1183, column: 42, scope: !1314)
!1330 = !DILocation(line: 1183, column: 15, scope: !1314)
!1331 = !DILocation(line: 1184, column: 13, scope: !1314)
!1332 = !DILocation(line: 1184, column: 6, scope: !1314)
!1333 = !DILocation(line: 1190, column: 7, scope: !1334)
!1334 = distinct !DILexicalBlock(scope: !1335, file: !64, line: 1190, column: 7)
!1335 = distinct !DILexicalBlock(scope: !1295, file: !64, line: 1189, column: 3)
!1336 = !DILocation(line: 1190, column: 19, scope: !1334)
!1337 = !DILocation(line: 1190, column: 7, scope: !1335)
!1338 = !DILocation(line: 1192, column: 5, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1334, file: !64, line: 1191, column: 4)
!1340 = !DILocation(line: 1196, column: 18, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1334, file: !64, line: 1195, column: 4)
!1342 = !DILocation(line: 1196, column: 17, scope: !1341)
!1343 = !DILocation(line: 1196, column: 15, scope: !1341)
!1344 = !DILocation(line: 1197, column: 20, scope: !1341)
!1345 = !DILocation(line: 1197, column: 19, scope: !1341)
!1346 = !DILocation(line: 1197, column: 17, scope: !1341)
!1347 = !DILocation(line: 1198, column: 17, scope: !1341)
!1348 = !DILocation(line: 1198, column: 31, scope: !1341)
!1349 = !DILocation(line: 1198, column: 41, scope: !1341)
!1350 = !DILocation(line: 1198, column: 40, scope: !1341)
!1351 = !DILocation(line: 1198, column: 56, scope: !1341)
!1352 = !DILocation(line: 1198, column: 54, scope: !1341)
!1353 = !DILocation(line: 1198, column: 27, scope: !1341)
!1354 = !DILocation(line: 1198, column: 70, scope: !1341)
!1355 = !DILocation(line: 1198, column: 14, scope: !1341)
!1356 = !DILocation(line: 1199, column: 17, scope: !1341)
!1357 = !DILocation(line: 1199, column: 28, scope: !1341)
!1358 = !DILocation(line: 1199, column: 26, scope: !1341)
!1359 = !DILocation(line: 1199, column: 44, scope: !1341)
!1360 = !DILocation(line: 1199, column: 56, scope: !1341)
!1361 = !DILocation(line: 1199, column: 54, scope: !1341)
!1362 = !DILocation(line: 1199, column: 41, scope: !1341)
!1363 = !DILocation(line: 1199, column: 14, scope: !1341)
!1364 = !DILocation(line: 1200, column: 12, scope: !1341)
!1365 = !DILocation(line: 1200, column: 5, scope: !1341)
!1366 = !DILocation(line: 1205, column: 1, scope: !1270)
!1367 = distinct !DISubprogram(name: "u32_div_u32_u32", scope: !64, file: !64, line: 1222, type: !1368, scopeLine: 1223, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{!423, !423, !423}
!1370 = !DILocalVariable(name: "numerator", arg: 1, scope: !1367, file: !64, line: 1222, type: !423)
!1371 = !DILocation(line: 1222, column: 25, scope: !1367)
!1372 = !DILocalVariable(name: "denominator", arg: 2, scope: !1367, file: !64, line: 1222, type: !423)
!1373 = !DILocation(line: 1222, column: 40, scope: !1367)
!1374 = !DILocalVariable(name: "u32Temp1", scope: !1367, file: !64, line: 1225, type: !423)
!1375 = !DILocation(line: 1225, column: 6, scope: !1367)
!1376 = !DILocalVariable(name: "u32Temp2", scope: !1367, file: !64, line: 1225, type: !423)
!1377 = !DILocation(line: 1225, column: 20, scope: !1367)
!1378 = !DILocalVariable(name: "u32Temp3", scope: !1367, file: !64, line: 1225, type: !423)
!1379 = !DILocation(line: 1225, column: 34, scope: !1367)
!1380 = !DILocalVariable(name: "numerator_old", scope: !1367, file: !64, line: 1225, type: !423)
!1381 = !DILocation(line: 1225, column: 48, scope: !1367)
!1382 = !DILocation(line: 1226, column: 5, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1367, file: !64, line: 1226, column: 5)
!1384 = !DILocation(line: 1226, column: 16, scope: !1383)
!1385 = !DILocation(line: 1226, column: 5, scope: !1367)
!1386 = !DILocation(line: 1228, column: 3, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1383, file: !64, line: 1227, column: 2)
!1388 = !DILocation(line: 1232, column: 14, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1383, file: !64, line: 1231, column: 2)
!1390 = !DILocation(line: 1232, column: 26, scope: !1389)
!1391 = !DILocation(line: 1232, column: 41, scope: !1389)
!1392 = !DILocation(line: 1232, column: 51, scope: !1389)
!1393 = !DILocation(line: 1232, column: 50, scope: !1389)
!1394 = !DILocation(line: 1232, column: 38, scope: !1389)
!1395 = !DILocation(line: 1232, column: 24, scope: !1389)
!1396 = !DILocation(line: 1232, column: 12, scope: !1389)
!1397 = !DILocation(line: 1233, column: 7, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1389, file: !64, line: 1233, column: 6)
!1399 = !DILocation(line: 1233, column: 16, scope: !1398)
!1400 = !DILocation(line: 1233, column: 24, scope: !1398)
!1401 = !DILocation(line: 1233, column: 6, scope: !1389)
!1402 = !DILocation(line: 1235, column: 16, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1398, file: !64, line: 1234, column: 3)
!1404 = !DILocation(line: 1235, column: 27, scope: !1403)
!1405 = !DILocation(line: 1235, column: 13, scope: !1403)
!1406 = !DILocation(line: 1236, column: 3, scope: !1403)
!1407 = !DILocation(line: 1239, column: 16, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1398, file: !64, line: 1238, column: 3)
!1409 = !DILocation(line: 1239, column: 27, scope: !1408)
!1410 = !DILocation(line: 1239, column: 32, scope: !1408)
!1411 = !DILocation(line: 1239, column: 13, scope: !1408)
!1412 = !DILocation(line: 1242, column: 6, scope: !1413)
!1413 = distinct !DILexicalBlock(scope: !1389, file: !64, line: 1242, column: 6)
!1414 = !DILocation(line: 1242, column: 17, scope: !1413)
!1415 = !DILocation(line: 1242, column: 15, scope: !1413)
!1416 = !DILocation(line: 1242, column: 6, scope: !1389)
!1417 = !DILocation(line: 1244, column: 12, scope: !1418)
!1418 = distinct !DILexicalBlock(scope: !1413, file: !64, line: 1243, column: 3)
!1419 = !DILocation(line: 1244, column: 22, scope: !1418)
!1420 = !DILocation(line: 1244, column: 21, scope: !1418)
!1421 = !DILocation(line: 1244, column: 4, scope: !1418)
!1422 = !DILocation(line: 1248, column: 13, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1413, file: !64, line: 1247, column: 3)
!1424 = !DILocation(line: 1248, column: 23, scope: !1423)
!1425 = !DILocation(line: 1248, column: 22, scope: !1423)
!1426 = !DILocation(line: 1248, column: 36, scope: !1423)
!1427 = !DILocation(line: 1248, column: 4, scope: !1423)
!1428 = !DILocation(line: 1253, column: 1, scope: !1367)
!1429 = distinct !DISubprogram(name: "s32_div_u32_s32", scope: !64, file: !64, line: 1270, type: !1430, scopeLine: 1271, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1430 = !DISubroutineType(types: !1431)
!1431 = !{!21, !423, !21}
!1432 = !DILocalVariable(name: "numerator", arg: 1, scope: !1429, file: !64, line: 1270, type: !423)
!1433 = !DILocation(line: 1270, column: 25, scope: !1429)
!1434 = !DILocalVariable(name: "denominator", arg: 2, scope: !1429, file: !64, line: 1270, type: !21)
!1435 = !DILocation(line: 1270, column: 40, scope: !1429)
!1436 = !DILocalVariable(name: "u32Temp1", scope: !1429, file: !64, line: 1272, type: !423)
!1437 = !DILocation(line: 1272, column: 6, scope: !1429)
!1438 = !DILocalVariable(name: "u32Temp2", scope: !1429, file: !64, line: 1272, type: !423)
!1439 = !DILocation(line: 1272, column: 20, scope: !1429)
!1440 = !DILocation(line: 1273, column: 5, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1429, file: !64, line: 1273, column: 5)
!1442 = !DILocation(line: 1273, column: 17, scope: !1441)
!1443 = !DILocation(line: 1273, column: 5, scope: !1429)
!1444 = !DILocation(line: 1275, column: 6, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1446, file: !64, line: 1275, column: 6)
!1446 = distinct !DILexicalBlock(scope: !1441, file: !64, line: 1274, column: 2)
!1447 = !DILocation(line: 1275, column: 18, scope: !1445)
!1448 = !DILocation(line: 1275, column: 6, scope: !1446)
!1449 = !DILocation(line: 1277, column: 4, scope: !1450)
!1450 = distinct !DILexicalBlock(scope: !1445, file: !64, line: 1276, column: 3)
!1451 = !DILocation(line: 1281, column: 19, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1445, file: !64, line: 1280, column: 3)
!1453 = !DILocation(line: 1281, column: 18, scope: !1452)
!1454 = !DILocation(line: 1281, column: 16, scope: !1452)
!1455 = !DILocation(line: 1282, column: 16, scope: !1452)
!1456 = !DILocation(line: 1282, column: 30, scope: !1452)
!1457 = !DILocation(line: 1282, column: 40, scope: !1452)
!1458 = !DILocation(line: 1282, column: 39, scope: !1452)
!1459 = !DILocation(line: 1282, column: 55, scope: !1452)
!1460 = !DILocation(line: 1282, column: 53, scope: !1452)
!1461 = !DILocation(line: 1282, column: 26, scope: !1452)
!1462 = !DILocation(line: 1282, column: 69, scope: !1452)
!1463 = !DILocation(line: 1282, column: 13, scope: !1452)
!1464 = !DILocation(line: 1283, column: 16, scope: !1452)
!1465 = !DILocation(line: 1283, column: 25, scope: !1452)
!1466 = !DILocation(line: 1283, column: 24, scope: !1452)
!1467 = !DILocation(line: 1283, column: 41, scope: !1452)
!1468 = !DILocation(line: 1283, column: 51, scope: !1452)
!1469 = !DILocation(line: 1283, column: 50, scope: !1452)
!1470 = !DILocation(line: 1283, column: 38, scope: !1452)
!1471 = !DILocation(line: 1283, column: 13, scope: !1452)
!1472 = !DILocation(line: 1284, column: 7, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1452, file: !64, line: 1284, column: 7)
!1474 = !DILocation(line: 1284, column: 16, scope: !1473)
!1475 = !DILocation(line: 1284, column: 7, scope: !1452)
!1476 = !DILocation(line: 1286, column: 13, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1473, file: !64, line: 1285, column: 4)
!1478 = !DILocation(line: 1286, column: 12, scope: !1477)
!1479 = !DILocation(line: 1286, column: 5, scope: !1477)
!1480 = !DILocation(line: 1290, column: 5, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1473, file: !64, line: 1289, column: 4)
!1482 = !DILocation(line: 1296, column: 15, scope: !1483)
!1483 = distinct !DILexicalBlock(scope: !1441, file: !64, line: 1295, column: 2)
!1484 = !DILocation(line: 1296, column: 29, scope: !1483)
!1485 = !DILocation(line: 1296, column: 39, scope: !1483)
!1486 = !DILocation(line: 1296, column: 38, scope: !1483)
!1487 = !DILocation(line: 1296, column: 54, scope: !1483)
!1488 = !DILocation(line: 1296, column: 52, scope: !1483)
!1489 = !DILocation(line: 1296, column: 25, scope: !1483)
!1490 = !DILocation(line: 1296, column: 68, scope: !1483)
!1491 = !DILocation(line: 1296, column: 12, scope: !1483)
!1492 = !DILocation(line: 1297, column: 15, scope: !1483)
!1493 = !DILocation(line: 1297, column: 24, scope: !1483)
!1494 = !DILocation(line: 1297, column: 23, scope: !1483)
!1495 = !DILocation(line: 1297, column: 40, scope: !1483)
!1496 = !DILocation(line: 1297, column: 50, scope: !1483)
!1497 = !DILocation(line: 1297, column: 49, scope: !1483)
!1498 = !DILocation(line: 1297, column: 37, scope: !1483)
!1499 = !DILocation(line: 1297, column: 12, scope: !1483)
!1500 = !DILocation(line: 1298, column: 6, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1483, file: !64, line: 1298, column: 6)
!1502 = !DILocation(line: 1298, column: 15, scope: !1501)
!1503 = !DILocation(line: 1298, column: 6, scope: !1483)
!1504 = !DILocation(line: 1300, column: 11, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1501, file: !64, line: 1299, column: 3)
!1506 = !DILocation(line: 1300, column: 4, scope: !1505)
!1507 = !DILocation(line: 1304, column: 4, scope: !1508)
!1508 = distinct !DILexicalBlock(scope: !1501, file: !64, line: 1303, column: 3)
!1509 = !DILocation(line: 1307, column: 1, scope: !1429)
!1510 = distinct !DISubprogram(name: "s32_div_s32_u32", scope: !64, file: !64, line: 1325, type: !1511, scopeLine: 1326, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1511 = !DISubroutineType(types: !1512)
!1512 = !{!21, !21, !423}
!1513 = !DILocalVariable(name: "numerator", arg: 1, scope: !1510, file: !64, line: 1325, type: !21)
!1514 = !DILocation(line: 1325, column: 25, scope: !1510)
!1515 = !DILocalVariable(name: "denominator", arg: 2, scope: !1510, file: !64, line: 1325, type: !423)
!1516 = !DILocation(line: 1325, column: 40, scope: !1510)
!1517 = !DILocalVariable(name: "s32Temp1", scope: !1510, file: !64, line: 1327, type: !21)
!1518 = !DILocation(line: 1327, column: 6, scope: !1510)
!1519 = !DILocalVariable(name: "s32Temp2", scope: !1510, file: !64, line: 1327, type: !21)
!1520 = !DILocation(line: 1327, column: 20, scope: !1510)
!1521 = !DILocalVariable(name: "u32Temp0", scope: !1510, file: !64, line: 1328, type: !423)
!1522 = !DILocation(line: 1328, column: 6, scope: !1510)
!1523 = !DILocalVariable(name: "u32Temp1", scope: !1510, file: !64, line: 1328, type: !423)
!1524 = !DILocation(line: 1328, column: 20, scope: !1510)
!1525 = !DILocalVariable(name: "u32Temp2", scope: !1510, file: !64, line: 1328, type: !423)
!1526 = !DILocation(line: 1328, column: 34, scope: !1510)
!1527 = !DILocation(line: 1329, column: 5, scope: !1528)
!1528 = distinct !DILexicalBlock(scope: !1510, file: !64, line: 1329, column: 5)
!1529 = !DILocation(line: 1329, column: 17, scope: !1528)
!1530 = !DILocation(line: 1329, column: 5, scope: !1510)
!1531 = !DILocation(line: 1331, column: 6, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1533, file: !64, line: 1331, column: 6)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !64, line: 1330, column: 2)
!1534 = !DILocation(line: 1331, column: 16, scope: !1532)
!1535 = !DILocation(line: 1331, column: 6, scope: !1533)
!1536 = !DILocation(line: 1333, column: 4, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1532, file: !64, line: 1332, column: 3)
!1538 = !DILocation(line: 1337, column: 4, scope: !1539)
!1539 = distinct !DILexicalBlock(scope: !1532, file: !64, line: 1336, column: 3)
!1540 = !DILocation(line: 1342, column: 6, scope: !1541)
!1541 = distinct !DILexicalBlock(scope: !1542, file: !64, line: 1342, column: 6)
!1542 = distinct !DILexicalBlock(scope: !1528, file: !64, line: 1341, column: 2)
!1543 = !DILocation(line: 1342, column: 16, scope: !1541)
!1544 = !DILocation(line: 1342, column: 6, scope: !1542)
!1545 = !DILocation(line: 1344, column: 16, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1541, file: !64, line: 1343, column: 3)
!1547 = !DILocation(line: 1344, column: 15, scope: !1546)
!1548 = !DILocation(line: 1344, column: 13, scope: !1546)
!1549 = !DILocation(line: 1345, column: 16, scope: !1546)
!1550 = !DILocation(line: 1345, column: 25, scope: !1546)
!1551 = !DILocation(line: 1345, column: 24, scope: !1546)
!1552 = !DILocation(line: 1345, column: 13, scope: !1546)
!1553 = !DILocation(line: 1346, column: 15, scope: !1546)
!1554 = !DILocation(line: 1346, column: 28, scope: !1546)
!1555 = !DILocation(line: 1346, column: 37, scope: !1546)
!1556 = !DILocation(line: 1346, column: 36, scope: !1546)
!1557 = !DILocation(line: 1346, column: 52, scope: !1546)
!1558 = !DILocation(line: 1346, column: 50, scope: !1546)
!1559 = !DILocation(line: 1346, column: 24, scope: !1546)
!1560 = !DILocation(line: 1346, column: 13, scope: !1546)
!1561 = !DILocation(line: 1348, column: 8, scope: !1562)
!1562 = distinct !DILexicalBlock(scope: !1546, file: !64, line: 1348, column: 7)
!1563 = !DILocation(line: 1348, column: 20, scope: !1562)
!1564 = !DILocation(line: 1348, column: 27, scope: !1562)
!1565 = !DILocation(line: 1348, column: 7, scope: !1546)
!1566 = !DILocation(line: 1350, column: 20, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1562, file: !64, line: 1349, column: 4)
!1568 = !DILocation(line: 1350, column: 32, scope: !1567)
!1569 = !DILocation(line: 1350, column: 17, scope: !1567)
!1570 = !DILocation(line: 1351, column: 4, scope: !1567)
!1571 = !DILocation(line: 1354, column: 20, scope: !1572)
!1572 = distinct !DILexicalBlock(scope: !1562, file: !64, line: 1353, column: 4)
!1573 = !DILocation(line: 1354, column: 32, scope: !1572)
!1574 = !DILocation(line: 1354, column: 38, scope: !1572)
!1575 = !DILocation(line: 1354, column: 17, scope: !1572)
!1576 = !DILocation(line: 1358, column: 7, scope: !1577)
!1577 = distinct !DILexicalBlock(scope: !1546, file: !64, line: 1358, column: 7)
!1578 = !DILocation(line: 1358, column: 18, scope: !1577)
!1579 = !DILocation(line: 1358, column: 16, scope: !1577)
!1580 = !DILocation(line: 1358, column: 7, scope: !1546)
!1581 = !DILocation(line: 1360, column: 14, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1577, file: !64, line: 1359, column: 4)
!1583 = !DILocation(line: 1360, column: 13, scope: !1582)
!1584 = !DILocation(line: 1360, column: 23, scope: !1582)
!1585 = !DILocation(line: 1360, column: 5, scope: !1582)
!1586 = !DILocation(line: 1364, column: 14, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1577, file: !64, line: 1363, column: 4)
!1588 = !DILocation(line: 1364, column: 23, scope: !1587)
!1589 = !DILocation(line: 1364, column: 12, scope: !1587)
!1590 = !DILocation(line: 1364, column: 27, scope: !1587)
!1591 = !DILocation(line: 1364, column: 5, scope: !1587)
!1592 = !DILocation(line: 1371, column: 16, scope: !1593)
!1593 = distinct !DILexicalBlock(scope: !1541, file: !64, line: 1370, column: 3)
!1594 = !DILocation(line: 1371, column: 30, scope: !1593)
!1595 = !DILocation(line: 1371, column: 40, scope: !1593)
!1596 = !DILocation(line: 1371, column: 39, scope: !1593)
!1597 = !DILocation(line: 1371, column: 55, scope: !1593)
!1598 = !DILocation(line: 1371, column: 53, scope: !1593)
!1599 = !DILocation(line: 1371, column: 26, scope: !1593)
!1600 = !DILocation(line: 1371, column: 69, scope: !1593)
!1601 = !DILocation(line: 1371, column: 13, scope: !1593)
!1602 = !DILocation(line: 1372, column: 16, scope: !1593)
!1603 = !DILocation(line: 1372, column: 26, scope: !1593)
!1604 = !DILocation(line: 1372, column: 25, scope: !1593)
!1605 = !DILocation(line: 1372, column: 42, scope: !1593)
!1606 = !DILocation(line: 1372, column: 51, scope: !1593)
!1607 = !DILocation(line: 1372, column: 50, scope: !1593)
!1608 = !DILocation(line: 1372, column: 39, scope: !1593)
!1609 = !DILocation(line: 1372, column: 13, scope: !1593)
!1610 = !DILocation(line: 1373, column: 11, scope: !1593)
!1611 = !DILocation(line: 1373, column: 4, scope: !1593)
!1612 = !DILocation(line: 1376, column: 1, scope: !1510)
!1613 = distinct !DISubprogram(name: "s32_div_s32_s32", scope: !64, file: !64, line: 1393, type: !1614, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1614 = !DISubroutineType(types: !1615)
!1615 = !{!21, !21, !21}
!1616 = !DILocalVariable(name: "numerator", arg: 1, scope: !1613, file: !64, line: 1393, type: !21)
!1617 = !DILocation(line: 1393, column: 25, scope: !1613)
!1618 = !DILocalVariable(name: "denominator", arg: 2, scope: !1613, file: !64, line: 1393, type: !21)
!1619 = !DILocation(line: 1393, column: 40, scope: !1613)
!1620 = !DILocalVariable(name: "s32Temp1", scope: !1613, file: !64, line: 1395, type: !21)
!1621 = !DILocation(line: 1395, column: 6, scope: !1613)
!1622 = !DILocalVariable(name: "s32Temp2", scope: !1613, file: !64, line: 1395, type: !21)
!1623 = !DILocation(line: 1395, column: 20, scope: !1613)
!1624 = !DILocalVariable(name: "denominator_prime", scope: !1613, file: !64, line: 1396, type: !423)
!1625 = !DILocation(line: 1396, column: 6, scope: !1613)
!1626 = !DILocalVariable(name: "u32Temp1", scope: !1613, file: !64, line: 1396, type: !423)
!1627 = !DILocation(line: 1396, column: 29, scope: !1613)
!1628 = !DILocalVariable(name: "u32Temp2", scope: !1613, file: !64, line: 1396, type: !423)
!1629 = !DILocation(line: 1396, column: 43, scope: !1613)
!1630 = !DILocalVariable(name: "u32numerator", scope: !1613, file: !64, line: 1397, type: !423)
!1631 = !DILocation(line: 1397, column: 6, scope: !1613)
!1632 = !DILocalVariable(name: "u32denominator", scope: !1613, file: !64, line: 1397, type: !423)
!1633 = !DILocation(line: 1397, column: 23, scope: !1613)
!1634 = !DILocation(line: 1398, column: 5, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1613, file: !64, line: 1398, column: 5)
!1636 = !DILocation(line: 1398, column: 15, scope: !1635)
!1637 = !DILocation(line: 1398, column: 5, scope: !1613)
!1638 = !DILocation(line: 1400, column: 6, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1640, file: !64, line: 1400, column: 6)
!1640 = distinct !DILexicalBlock(scope: !1635, file: !64, line: 1399, column: 2)
!1641 = !DILocation(line: 1400, column: 18, scope: !1639)
!1642 = !DILocation(line: 1400, column: 6, scope: !1640)
!1643 = !DILocation(line: 1402, column: 7, scope: !1644)
!1644 = distinct !DILexicalBlock(scope: !1645, file: !64, line: 1402, column: 7)
!1645 = distinct !DILexicalBlock(scope: !1639, file: !64, line: 1401, column: 3)
!1646 = !DILocation(line: 1402, column: 19, scope: !1644)
!1647 = !DILocation(line: 1402, column: 7, scope: !1645)
!1648 = !DILocation(line: 1404, column: 5, scope: !1649)
!1649 = distinct !DILexicalBlock(scope: !1644, file: !64, line: 1403, column: 4)
!1650 = !DILocation(line: 1408, column: 21, scope: !1651)
!1651 = distinct !DILexicalBlock(scope: !1644, file: !64, line: 1407, column: 4)
!1652 = !DILocation(line: 1408, column: 20, scope: !1651)
!1653 = !DILocation(line: 1408, column: 18, scope: !1651)
!1654 = !DILocation(line: 1409, column: 23, scope: !1651)
!1655 = !DILocation(line: 1409, column: 22, scope: !1651)
!1656 = !DILocation(line: 1409, column: 20, scope: !1651)
!1657 = !DILocation(line: 1410, column: 16, scope: !1651)
!1658 = !DILocation(line: 1410, column: 33, scope: !1651)
!1659 = !DILocation(line: 1410, column: 46, scope: !1651)
!1660 = !DILocation(line: 1410, column: 45, scope: !1651)
!1661 = !DILocation(line: 1410, column: 64, scope: !1651)
!1662 = !DILocation(line: 1410, column: 62, scope: !1651)
!1663 = !DILocation(line: 1410, column: 29, scope: !1651)
!1664 = !DILocation(line: 1410, column: 81, scope: !1651)
!1665 = !DILocation(line: 1410, column: 14, scope: !1651)
!1666 = !DILocation(line: 1411, column: 17, scope: !1651)
!1667 = !DILocation(line: 1411, column: 30, scope: !1651)
!1668 = !DILocation(line: 1411, column: 29, scope: !1651)
!1669 = !DILocation(line: 1411, column: 49, scope: !1651)
!1670 = !DILocation(line: 1411, column: 58, scope: !1651)
!1671 = !DILocation(line: 1411, column: 57, scope: !1651)
!1672 = !DILocation(line: 1411, column: 46, scope: !1651)
!1673 = !DILocation(line: 1411, column: 14, scope: !1651)
!1674 = !DILocation(line: 1412, column: 8, scope: !1675)
!1675 = distinct !DILexicalBlock(scope: !1651, file: !64, line: 1412, column: 8)
!1676 = !DILocation(line: 1412, column: 17, scope: !1675)
!1677 = !DILocation(line: 1412, column: 8, scope: !1651)
!1678 = !DILocation(line: 1414, column: 13, scope: !1679)
!1679 = distinct !DILexicalBlock(scope: !1675, file: !64, line: 1413, column: 5)
!1680 = !DILocation(line: 1414, column: 6, scope: !1679)
!1681 = !DILocation(line: 1418, column: 6, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1675, file: !64, line: 1417, column: 5)
!1683 = !DILocation(line: 1424, column: 20, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1639, file: !64, line: 1423, column: 3)
!1685 = !DILocation(line: 1424, column: 19, scope: !1684)
!1686 = !DILocation(line: 1424, column: 29, scope: !1684)
!1687 = !DILocation(line: 1424, column: 17, scope: !1684)
!1688 = !DILocation(line: 1425, column: 16, scope: !1684)
!1689 = !DILocation(line: 1425, column: 33, scope: !1684)
!1690 = !DILocation(line: 1425, column: 46, scope: !1684)
!1691 = !DILocation(line: 1425, column: 45, scope: !1684)
!1692 = !DILocation(line: 1425, column: 61, scope: !1684)
!1693 = !DILocation(line: 1425, column: 59, scope: !1684)
!1694 = !DILocation(line: 1425, column: 29, scope: !1684)
!1695 = !DILocation(line: 1425, column: 75, scope: !1684)
!1696 = !DILocation(line: 1425, column: 13, scope: !1684)
!1697 = !DILocation(line: 1426, column: 16, scope: !1684)
!1698 = !DILocation(line: 1426, column: 29, scope: !1684)
!1699 = !DILocation(line: 1426, column: 28, scope: !1684)
!1700 = !DILocation(line: 1426, column: 45, scope: !1684)
!1701 = !DILocation(line: 1426, column: 54, scope: !1684)
!1702 = !DILocation(line: 1426, column: 53, scope: !1684)
!1703 = !DILocation(line: 1426, column: 42, scope: !1684)
!1704 = !DILocation(line: 1426, column: 13, scope: !1684)
!1705 = !DILocation(line: 1427, column: 13, scope: !1684)
!1706 = !DILocation(line: 1427, column: 12, scope: !1684)
!1707 = !DILocation(line: 1427, column: 22, scope: !1684)
!1708 = !DILocation(line: 1427, column: 4, scope: !1684)
!1709 = !DILocation(line: 1432, column: 6, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1711, file: !64, line: 1432, column: 6)
!1711 = distinct !DILexicalBlock(scope: !1635, file: !64, line: 1431, column: 2)
!1712 = !DILocation(line: 1432, column: 18, scope: !1710)
!1713 = !DILocation(line: 1432, column: 6, scope: !1711)
!1714 = !DILocation(line: 1434, column: 7, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1716, file: !64, line: 1434, column: 7)
!1716 = distinct !DILexicalBlock(scope: !1710, file: !64, line: 1433, column: 3)
!1717 = !DILocation(line: 1434, column: 19, scope: !1715)
!1718 = !DILocation(line: 1434, column: 7, scope: !1716)
!1719 = !DILocation(line: 1436, column: 5, scope: !1720)
!1720 = distinct !DILexicalBlock(scope: !1715, file: !64, line: 1435, column: 4)
!1721 = !DILocation(line: 1440, column: 23, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1715, file: !64, line: 1439, column: 4)
!1723 = !DILocation(line: 1440, column: 22, scope: !1722)
!1724 = !DILocation(line: 1440, column: 35, scope: !1722)
!1725 = !DILocation(line: 1440, column: 20, scope: !1722)
!1726 = !DILocation(line: 1441, column: 17, scope: !1722)
!1727 = !DILocation(line: 1441, column: 31, scope: !1722)
!1728 = !DILocation(line: 1441, column: 41, scope: !1722)
!1729 = !DILocation(line: 1441, column: 40, scope: !1722)
!1730 = !DILocation(line: 1441, column: 59, scope: !1722)
!1731 = !DILocation(line: 1441, column: 57, scope: !1722)
!1732 = !DILocation(line: 1441, column: 27, scope: !1722)
!1733 = !DILocation(line: 1441, column: 76, scope: !1722)
!1734 = !DILocation(line: 1441, column: 14, scope: !1722)
!1735 = !DILocation(line: 1442, column: 17, scope: !1722)
!1736 = !DILocation(line: 1442, column: 27, scope: !1722)
!1737 = !DILocation(line: 1442, column: 26, scope: !1722)
!1738 = !DILocation(line: 1442, column: 46, scope: !1722)
!1739 = !DILocation(line: 1442, column: 55, scope: !1722)
!1740 = !DILocation(line: 1442, column: 54, scope: !1722)
!1741 = !DILocation(line: 1442, column: 43, scope: !1722)
!1742 = !DILocation(line: 1442, column: 14, scope: !1722)
!1743 = !DILocation(line: 1443, column: 14, scope: !1722)
!1744 = !DILocation(line: 1443, column: 13, scope: !1722)
!1745 = !DILocation(line: 1443, column: 23, scope: !1722)
!1746 = !DILocation(line: 1443, column: 5, scope: !1722)
!1747 = !DILocation(line: 1448, column: 16, scope: !1748)
!1748 = distinct !DILexicalBlock(scope: !1710, file: !64, line: 1447, column: 3)
!1749 = !DILocation(line: 1448, column: 30, scope: !1748)
!1750 = !DILocation(line: 1448, column: 40, scope: !1748)
!1751 = !DILocation(line: 1448, column: 39, scope: !1748)
!1752 = !DILocation(line: 1448, column: 55, scope: !1748)
!1753 = !DILocation(line: 1448, column: 53, scope: !1748)
!1754 = !DILocation(line: 1448, column: 26, scope: !1748)
!1755 = !DILocation(line: 1448, column: 69, scope: !1748)
!1756 = !DILocation(line: 1448, column: 13, scope: !1748)
!1757 = !DILocation(line: 1449, column: 16, scope: !1748)
!1758 = !DILocation(line: 1449, column: 26, scope: !1748)
!1759 = !DILocation(line: 1449, column: 25, scope: !1748)
!1760 = !DILocation(line: 1449, column: 42, scope: !1748)
!1761 = !DILocation(line: 1449, column: 51, scope: !1748)
!1762 = !DILocation(line: 1449, column: 50, scope: !1748)
!1763 = !DILocation(line: 1449, column: 39, scope: !1748)
!1764 = !DILocation(line: 1449, column: 13, scope: !1748)
!1765 = !DILocation(line: 1450, column: 11, scope: !1748)
!1766 = !DILocation(line: 1450, column: 4, scope: !1748)
!1767 = !DILocation(line: 1453, column: 1, scope: !1613)
!1768 = distinct !DISubprogram(name: "s16_div_s32_u32", scope: !64, file: !64, line: 1471, type: !1769, scopeLine: 1472, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{!6, !21, !423}
!1771 = !DILocalVariable(name: "numerator", arg: 1, scope: !1768, file: !64, line: 1471, type: !21)
!1772 = !DILocation(line: 1471, column: 25, scope: !1768)
!1773 = !DILocalVariable(name: "denominator", arg: 2, scope: !1768, file: !64, line: 1471, type: !423)
!1774 = !DILocation(line: 1471, column: 40, scope: !1768)
!1775 = !DILocalVariable(name: "numerator_prime", scope: !1768, file: !64, line: 1474, type: !423)
!1776 = !DILocation(line: 1474, column: 6, scope: !1768)
!1777 = !DILocalVariable(name: "u32Temp1", scope: !1768, file: !64, line: 1474, type: !423)
!1778 = !DILocation(line: 1474, column: 27, scope: !1768)
!1779 = !DILocalVariable(name: "u32Temp2", scope: !1768, file: !64, line: 1474, type: !423)
!1780 = !DILocation(line: 1474, column: 41, scope: !1768)
!1781 = !DILocalVariable(name: "u32Temp3", scope: !1768, file: !64, line: 1474, type: !423)
!1782 = !DILocation(line: 1474, column: 55, scope: !1768)
!1783 = !DILocalVariable(name: "s32Temp1", scope: !1768, file: !64, line: 1475, type: !21)
!1784 = !DILocation(line: 1475, column: 6, scope: !1768)
!1785 = !DILocalVariable(name: "s32Temp2", scope: !1768, file: !64, line: 1475, type: !21)
!1786 = !DILocation(line: 1475, column: 20, scope: !1768)
!1787 = !DILocalVariable(name: "s32Temp3", scope: !1768, file: !64, line: 1475, type: !21)
!1788 = !DILocation(line: 1475, column: 34, scope: !1768)
!1789 = !DILocation(line: 1476, column: 5, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1768, file: !64, line: 1476, column: 5)
!1791 = !DILocation(line: 1476, column: 17, scope: !1790)
!1792 = !DILocation(line: 1476, column: 5, scope: !1768)
!1793 = !DILocation(line: 1478, column: 6, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1795, file: !64, line: 1478, column: 6)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !64, line: 1477, column: 2)
!1796 = !DILocation(line: 1478, column: 15, scope: !1794)
!1797 = !DILocation(line: 1478, column: 6, scope: !1795)
!1798 = !DILocation(line: 1480, column: 4, scope: !1799)
!1799 = distinct !DILexicalBlock(scope: !1794, file: !64, line: 1479, column: 3)
!1800 = !DILocation(line: 1484, column: 4, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1794, file: !64, line: 1483, column: 3)
!1802 = !DILocation(line: 1489, column: 6, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1804, file: !64, line: 1489, column: 6)
!1804 = distinct !DILexicalBlock(scope: !1790, file: !64, line: 1488, column: 2)
!1805 = !DILocation(line: 1489, column: 16, scope: !1803)
!1806 = !DILocation(line: 1489, column: 6, scope: !1804)
!1807 = !DILocation(line: 1491, column: 23, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1803, file: !64, line: 1490, column: 3)
!1809 = !DILocation(line: 1491, column: 22, scope: !1808)
!1810 = !DILocation(line: 1491, column: 20, scope: !1808)
!1811 = !DILocation(line: 1492, column: 16, scope: !1808)
!1812 = !DILocation(line: 1492, column: 32, scope: !1808)
!1813 = !DILocation(line: 1492, column: 31, scope: !1808)
!1814 = !DILocation(line: 1492, column: 13, scope: !1808)
!1815 = !DILocation(line: 1493, column: 15, scope: !1808)
!1816 = !DILocation(line: 1493, column: 34, scope: !1808)
!1817 = !DILocation(line: 1493, column: 45, scope: !1808)
!1818 = !DILocation(line: 1493, column: 43, scope: !1808)
!1819 = !DILocation(line: 1493, column: 31, scope: !1808)
!1820 = !DILocation(line: 1493, column: 13, scope: !1808)
!1821 = !DILocation(line: 1495, column: 8, scope: !1822)
!1822 = distinct !DILexicalBlock(scope: !1808, file: !64, line: 1495, column: 7)
!1823 = !DILocation(line: 1495, column: 20, scope: !1822)
!1824 = !DILocation(line: 1495, column: 27, scope: !1822)
!1825 = !DILocation(line: 1495, column: 7, scope: !1808)
!1826 = !DILocation(line: 1497, column: 19, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1822, file: !64, line: 1496, column: 4)
!1828 = !DILocation(line: 1497, column: 31, scope: !1827)
!1829 = !DILocation(line: 1497, column: 17, scope: !1827)
!1830 = !DILocation(line: 1498, column: 4, scope: !1827)
!1831 = !DILocation(line: 1501, column: 20, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1822, file: !64, line: 1500, column: 4)
!1833 = !DILocation(line: 1501, column: 32, scope: !1832)
!1834 = !DILocation(line: 1501, column: 38, scope: !1832)
!1835 = !DILocation(line: 1501, column: 17, scope: !1832)
!1836 = !DILocation(line: 1504, column: 7, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1808, file: !64, line: 1504, column: 7)
!1838 = !DILocation(line: 1504, column: 18, scope: !1837)
!1839 = !DILocation(line: 1504, column: 16, scope: !1837)
!1840 = !DILocation(line: 1504, column: 7, scope: !1808)
!1841 = !DILocation(line: 1506, column: 18, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1837, file: !64, line: 1505, column: 4)
!1843 = !DILocation(line: 1506, column: 16, scope: !1842)
!1844 = !DILocation(line: 1506, column: 28, scope: !1842)
!1845 = !DILocation(line: 1506, column: 14, scope: !1842)
!1846 = !DILocation(line: 1507, column: 4, scope: !1842)
!1847 = !DILocation(line: 1510, column: 18, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1837, file: !64, line: 1509, column: 4)
!1849 = !DILocation(line: 1510, column: 26, scope: !1848)
!1850 = !DILocation(line: 1510, column: 16, scope: !1848)
!1851 = !DILocation(line: 1510, column: 30, scope: !1848)
!1852 = !DILocation(line: 1510, column: 14, scope: !1848)
!1853 = !DILocation(line: 1512, column: 8, scope: !1854)
!1854 = distinct !DILexicalBlock(scope: !1808, file: !64, line: 1512, column: 7)
!1855 = !DILocation(line: 1512, column: 18, scope: !1854)
!1856 = !DILocation(line: 1512, column: 7, scope: !1808)
!1857 = !DILocation(line: 1514, column: 18, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1854, file: !64, line: 1513, column: 4)
!1859 = !DILocation(line: 1514, column: 12, scope: !1858)
!1860 = !DILocation(line: 1514, column: 5, scope: !1858)
!1861 = !DILocation(line: 1518, column: 5, scope: !1862)
!1862 = distinct !DILexicalBlock(scope: !1854, file: !64, line: 1517, column: 4)
!1863 = !DILocation(line: 1523, column: 16, scope: !1864)
!1864 = distinct !DILexicalBlock(scope: !1803, file: !64, line: 1522, column: 3)
!1865 = !DILocation(line: 1523, column: 26, scope: !1864)
!1866 = !DILocation(line: 1523, column: 25, scope: !1864)
!1867 = !DILocation(line: 1523, column: 41, scope: !1864)
!1868 = !DILocation(line: 1523, column: 39, scope: !1864)
!1869 = !DILocation(line: 1523, column: 13, scope: !1864)
!1870 = !DILocation(line: 1524, column: 16, scope: !1864)
!1871 = !DILocation(line: 1524, column: 30, scope: !1864)
!1872 = !DILocation(line: 1524, column: 40, scope: !1864)
!1873 = !DILocation(line: 1524, column: 39, scope: !1864)
!1874 = !DILocation(line: 1524, column: 55, scope: !1864)
!1875 = !DILocation(line: 1524, column: 53, scope: !1864)
!1876 = !DILocation(line: 1524, column: 26, scope: !1864)
!1877 = !DILocation(line: 1524, column: 68, scope: !1864)
!1878 = !DILocation(line: 1524, column: 13, scope: !1864)
!1879 = !DILocation(line: 1525, column: 16, scope: !1864)
!1880 = !DILocation(line: 1525, column: 25, scope: !1864)
!1881 = !DILocation(line: 1525, column: 24, scope: !1864)
!1882 = !DILocation(line: 1525, column: 41, scope: !1864)
!1883 = !DILocation(line: 1525, column: 51, scope: !1864)
!1884 = !DILocation(line: 1525, column: 50, scope: !1864)
!1885 = !DILocation(line: 1525, column: 38, scope: !1864)
!1886 = !DILocation(line: 1525, column: 13, scope: !1864)
!1887 = !DILocation(line: 1526, column: 7, scope: !1888)
!1888 = distinct !DILexicalBlock(scope: !1864, file: !64, line: 1526, column: 7)
!1889 = !DILocation(line: 1526, column: 16, scope: !1888)
!1890 = !DILocation(line: 1526, column: 7, scope: !1864)
!1891 = !DILocation(line: 1528, column: 17, scope: !1892)
!1892 = distinct !DILexicalBlock(scope: !1888, file: !64, line: 1527, column: 4)
!1893 = !DILocation(line: 1528, column: 12, scope: !1892)
!1894 = !DILocation(line: 1528, column: 5, scope: !1892)
!1895 = !DILocation(line: 1532, column: 5, scope: !1896)
!1896 = distinct !DILexicalBlock(scope: !1888, file: !64, line: 1531, column: 4)
!1897 = !DILocation(line: 1536, column: 1, scope: !1768)
!1898 = distinct !DISubprogram(name: "klee_div_zero_check", scope: !1899, file: !1899, line: 12, type: !1900, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !34, retainedNodes: !1903)
!1899 = !DIFile(filename: "src/runtime/Intrinsic/klee_div_zero_check.c", directory: "/build/klee/parts/klee")
!1900 = !DISubroutineType(types: !1901)
!1901 = !{null, !1902}
!1902 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!1903 = !{!1904}
!1904 = !DILocalVariable(name: "z", arg: 1, scope: !1898, file: !1899, line: 12, type: !1902)
!1905 = !DILocation(line: 0, scope: !1898)
!1906 = !DILocation(line: 13, column: 9, scope: !1907)
!1907 = distinct !DILexicalBlock(scope: !1898, file: !1899, line: 13, column: 7)
!1908 = !DILocation(line: 13, column: 7, scope: !1898)
!1909 = !DILocation(line: 14, column: 5, scope: !1907)
!1910 = !DILocation(line: 15, column: 1, scope: !1898)
